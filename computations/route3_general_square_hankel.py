"""Exact low-order Hankel identities for squares of gamma convolutions.

Let

    p_j = sum_i beta_i * r_i**j

and let X be the finite gamma convolution whose cumulants are

    kappa_j(X) = (j - 1)! * p_j.

For Y = X**2, put a_n = kappa_{n+1}(Y) / n!.  This script:

1. generates the moments of X symbolically from its cumulants;
2. generates kappa_1(Y), ..., kappa_4(Y) from the even moments of X;
3. checks the displayed formulas for those four cumulants; and
4. verifies, coefficient by coefficient, positive decompositions of
   a_0*a_2 - a_1**2 and a_1*a_3 - a_2**2.

A polynomial is a dictionary from exponent tuples to exact Fraction
coefficients.  Only the Python standard library is used.
"""

from __future__ import annotations

from fractions import Fraction
from math import comb, factorial
from typing import Iterable


NUMBER_OF_VARIABLES = 8
Monomial = tuple[int, ...]
Polynomial = dict[Monomial, Fraction]


def constant(value: int | Fraction) -> Polynomial:
    coefficient = Fraction(value)
    if coefficient == 0:
        return {}
    return {(0,) * NUMBER_OF_VARIABLES: coefficient}


def variable(index: int) -> Polynomial:
    """Return p_index, with indices starting at one."""

    if not 1 <= index <= NUMBER_OF_VARIABLES:
        raise ValueError(f"p_{index} is outside the symbolic range")
    exponents = [0] * NUMBER_OF_VARIABLES
    exponents[index - 1] = 1
    return {tuple(exponents): Fraction(1)}


P = [constant(0)] + [variable(index) for index in range(1, 9)]


def add(*polynomials: Polynomial) -> Polynomial:
    result: Polynomial = {}
    for polynomial in polynomials:
        for monomial, coefficient in polynomial.items():
            result[monomial] = result.get(monomial, Fraction(0)) + coefficient
            if result[monomial] == 0:
                del result[monomial]
    return result


def scale(polynomial: Polynomial, scalar: int | Fraction) -> Polynomial:
    scalar = Fraction(scalar)
    return {
        monomial: scalar * coefficient
        for monomial, coefficient in polynomial.items()
        if scalar * coefficient != 0
    }


def subtract(left: Polynomial, right: Polynomial) -> Polynomial:
    return add(left, scale(right, -1))


def multiply(*polynomials: Polynomial) -> Polynomial:
    result = constant(1)
    for polynomial in polynomials:
        product: Polynomial = {}
        for left_monomial, left_coefficient in result.items():
            for right_monomial, right_coefficient in polynomial.items():
                monomial = tuple(
                    left + right
                    for left, right in zip(left_monomial, right_monomial)
                )
                product[monomial] = (
                    product.get(monomial, Fraction(0))
                    + left_coefficient * right_coefficient
                )
        result = {
            monomial: coefficient
            for monomial, coefficient in product.items()
            if coefficient != 0
        }
    return result


def power(polynomial: Polynomial, exponent: int) -> Polynomial:
    if exponent < 0:
        raise ValueError("negative polynomial exponent")
    result = constant(1)
    base = polynomial
    remaining = exponent
    while remaining:
        if remaining % 2:
            result = multiply(result, base)
        base = multiply(base, base)
        remaining //= 2
    return result


def monomial(coefficient: int, *indices: int) -> Polynomial:
    """Return coefficient times the product of the listed p-indices."""

    if coefficient <= 0:
        raise ValueError("positive-certificate coefficients must be positive")
    return scale(multiply(*(P[index] for index in indices)), coefficient)


def spread_gap(
    outer_left: int,
    outer_right: int,
    inner_left: int,
    inner_right: int,
) -> Polynomial:
    """Return p_a p_b - p_c p_d for an admissible moment-spread gap.

    The checks encode

        a + b = c + d,  a <= c <= d <= b.

    Such a gap is nonnegative for every positive moment measure.  Indeed,
    it telescopes into adjacent gaps, each equal to an integral with
    integrand

        x^j y^j (x-y)^2 sum_h x^(m-h)y^h / 2.
    """

    if not (
        outer_left + outer_right == inner_left + inner_right
        and outer_left <= inner_left <= inner_right <= outer_right
    ):
        raise ValueError("invalid moment-spread gap")
    return subtract(
        multiply(P[outer_left], P[outer_right]),
        multiply(P[inner_left], P[inner_right]),
    )


def positive_gap_term(
    coefficient: int,
    multiplier_indices: Iterable[int],
    gap_indices: tuple[int, int, int, int],
) -> Polynomial:
    if coefficient <= 0:
        raise ValueError("positive-certificate coefficients must be positive")
    multiplier = multiply(*(P[index] for index in multiplier_indices))
    return scale(multiply(multiplier, spread_gap(*gap_indices)), coefficient)


def moments_from_cumulants(
    cumulants: list[Polynomial],
    maximum_order: int,
) -> list[Polynomial]:
    """Use m_n = sum_j binom(n-1,j-1) kappa_j m_(n-j)."""

    moments = [constant(1)]
    for order in range(1, maximum_order + 1):
        moments.append(
            add(
                *(
                    scale(
                        multiply(cumulants[index], moments[order - index]),
                        comb(order - 1, index - 1),
                    )
                    for index in range(1, order + 1)
                )
            )
        )
    return moments


def cumulants_from_moments(
    moments: list[Polynomial],
    maximum_order: int,
) -> list[Polynomial]:
    """Invert the ordinary moment--cumulant recurrence."""

    cumulants = [constant(0)]
    for order in range(1, maximum_order + 1):
        correction = add(
            *(
                scale(
                    multiply(cumulants[index], moments[order - index]),
                    comb(order - 1, index - 1),
                )
                for index in range(1, order)
            )
        )
        cumulants.append(subtract(moments[order], correction))
    return cumulants


def expected_square_cumulants() -> list[Polynomial]:
    """The four displayed formulas, entered independently for verification."""

    kappa_1 = add(monomial(1, 1, 1), monomial(1, 2))

    kappa_2 = add(
        monomial(4, 1, 1, 2),
        monomial(8, 1, 3),
        monomial(2, 2, 2),
        monomial(6, 4),
    )

    kappa_3 = add(
        monomial(16, 1, 1, 1, 3),
        monomial(24, 1, 1, 2, 2),
        monomial(72, 1, 1, 4),
        monomial(96, 1, 2, 3),
        monomial(8, 2, 2, 2),
        monomial(144, 1, 5),
        monomial(72, 2, 4),
        monomial(40, 3, 3),
        monomial(120, 6),
    )

    kappa_4 = add(
        monomial(96, 1, 1, 1, 1, 4),
        monomial(384, 1, 1, 1, 2, 3),
        monomial(192, 1, 1, 2, 2, 2),
        monomial(768, 1, 1, 1, 5),
        monomial(1728, 1, 1, 2, 4),
        monomial(768, 1, 1, 3, 3),
        monomial(1152, 1, 2, 2, 3),
        monomial(48, 2, 2, 2, 2),
        monomial(2880, 1, 1, 6),
        monomial(3456, 1, 2, 5),
        monomial(3072, 1, 3, 4),
        monomial(864, 2, 2, 4),
        monomial(960, 2, 3, 3),
        monomial(5760, 1, 7),
        monomial(2880, 2, 6),
        monomial(2688, 3, 5),
        monomial(1152, 4, 4),
        monomial(5040, 8),
    )

    return [constant(0), kappa_1, kappa_2, kappa_3, kappa_4]


def unshifted_positive_certificate() -> Polynomial:
    """Positive decomposition of a_0 a_2 - a_1^2."""

    return add(
        positive_gap_term(4, [1, 1, 1, 1], (1, 3, 2, 2)),
        monomial(4, 1, 1, 1, 1, 1, 3),
        positive_gap_term(8, [1, 1, 1], (1, 4, 2, 3)),
        monomial(28, 1, 1, 1, 1, 4),
        positive_gap_term(44, [1, 1], (1, 5, 3, 3)),
        monomial(28, 1, 1, 1, 5),
        monomial(24, 1, 1, 2, 4),
        monomial(16, 1, 2, 2, 3),
        positive_gap_term(72, [1], (2, 5, 3, 4)),
        positive_gap_term(24, [1], (1, 6, 3, 4)),
        monomial(36, 1, 1, 6),
        monomial(12, 2, 2, 4),
        monomial(20, 2, 3, 3),
        positive_gap_term(36, [], (2, 6, 4, 4)),
        monomial(24, 2, 6),
    )


def shifted_positive_certificate() -> Polynomial:
    """Positive decomposition of a_1 a_3 - a_2^2."""

    q_8 = add(
        positive_gap_term(64, [1, 1, 1, 1, 1, 1], (2, 4, 3, 3)),
        positive_gap_term(64, [1, 1, 1, 1, 2, 2], (1, 3, 2, 2)),
        monomial(48, 1, 1, 1, 1, 2, 2, 2, 2),
    )

    q_7 = add(
        positive_gap_term(448, [1, 1, 1, 1, 1], (2, 5, 3, 4)),
        monomial(64, 1, 1, 1, 1, 1, 2, 5),
        monomial(320, 1, 1, 1, 1, 2, 2, 4),
        positive_gap_term(64, [1, 1, 1, 2, 3], (1, 3, 2, 2)),
        monomial(192, 1, 1, 1, 1, 2, 3, 3),
    )

    q_6 = add(
        positive_gap_term(128, [1, 1, 1, 1], (2, 6, 3, 5)),
        positive_gap_term(1200, [1, 1, 1, 1], (2, 6, 4, 4)),
        monomial(592, 1, 1, 1, 1, 2, 6),
        monomial(832, 1, 1, 1, 2, 2, 5),
        monomial(704, 1, 1, 1, 2, 3, 4),
        positive_gap_term(352, [1, 1, 3, 3], (1, 3, 2, 2)),
        monomial(352, 1, 1, 1, 3, 3, 3),
        monomial(192, 1, 1, 2, 2, 2, 4),
        monomial(64, 1, 2, 2, 2, 2, 3),
    )

    q_5 = add(
        positive_gap_term(2880, [1, 1, 1], (3, 6, 4, 5)),
        positive_gap_term(1536, [1, 1, 1], (2, 7, 4, 5)),
        monomial(2304, 1, 1, 1, 2, 7),
        positive_gap_term(512, [1, 1, 2], (2, 6, 3, 5)),
        positive_gap_term(96, [1, 1, 2], (2, 6, 4, 4)),
        monomial(832, 1, 1, 2, 2, 6),
        positive_gap_term(128, [1, 3, 4], (1, 3, 2, 2)),
        positive_gap_term(640, [1, 3, 3], (1, 4, 2, 3)),
        monomial(2656, 1, 1, 3, 3, 4),
        monomial(576, 1, 2, 2, 2, 5),
        monomial(48, 2, 2, 2, 2, 4),
        monomial(160, 2, 2, 2, 3, 3),
    )

    q_4 = add(
        positive_gap_term(1440, [1, 1], (3, 7, 4, 6)),
        positive_gap_term(5184, [1, 1], (3, 7, 5, 5)),
        monomial(1056, 1, 1, 3, 7),
        positive_gap_term(1920, [1, 2], (2, 7, 3, 6)),
        positive_gap_term(1728, [1, 2], (1, 8, 4, 5)),
        monomial(1632, 1, 1, 2, 8),
        positive_gap_term(48, [2, 2], (2, 6, 4, 4)),
        monomial(432, 2, 2, 2, 6),
        positive_gap_term(480, [2, 3], (2, 5, 3, 4)),
        monomial(416, 2, 2, 3, 5),
        positive_gap_term(400, [3, 3], (1, 5, 3, 3)),
        monomial(304, 1, 3, 3, 5),
        monomial(4608, 1, 3, 4, 4),
    )

    q_3 = add(
        positive_gap_term(2400, [3], (1, 8, 3, 6)),
        positive_gap_term(4320, [1], (3, 8, 5, 6)),
        positive_gap_term(4320, [1], (4, 7, 5, 6)),
        monomial(1440, 1, 4, 7),
        positive_gap_term(1440, [2], (2, 8, 4, 6)),
        monomial(240, 2, 2, 8),
        monomial(2688, 3, 4, 5),
        monomial(1152, 4, 4, 4),
    )

    q_2 = add(
        positive_gap_term(3600, [], (4, 8, 6, 6)),
        monomial(1440, 4, 8),
    )

    return add(q_8, q_7, q_6, q_5, q_4, q_3, q_2)


def main() -> None:
    # Generate X moments through order eight from kappa_j(X)=(j-1)!p_j.
    cumulants_x = [constant(0)] + [
        scale(P[index], factorial(index - 1))
        for index in range(1, 9)
    ]
    moments_x = moments_from_cumulants(cumulants_x, 8)

    # The nth moment of Y=X^2 is the (2n)th moment of X.
    moments_y = [moments_x[2 * index] for index in range(5)]
    cumulants_y = cumulants_from_moments(moments_y, 4)

    displayed = expected_square_cumulants()
    for order in range(1, 5):
        assert cumulants_y[order] == displayed[order]
    print("PASS: generated and verified kappa_1(Y), ..., kappa_4(Y)")

    a = [
        scale(cumulants_y[index + 1], Fraction(1, factorial(index)))
        for index in range(4)
    ]

    unshifted = subtract(multiply(a[0], a[2]), multiply(a[1], a[1]))
    assert unshifted == unshifted_positive_certificate()
    print(
        "PASS: det[[a_0,a_1],[a_1,a_2]] positive decomposition "
        f"({len(unshifted)} expanded monomials)"
    )

    shifted = subtract(multiply(a[1], a[3]), multiply(a[2], a[2]))
    assert shifted == shifted_positive_certificate()
    print(
        "PASS: det[[a_1,a_2],[a_2,a_3]] positive decomposition "
        f"({len(shifted)} expanded monomials)"
    )

    print("PASS: all arithmetic is exact and uses only the Python standard library")


if __name__ == "__main__":
    main()
