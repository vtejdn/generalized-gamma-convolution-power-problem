"""Exact Fraction certificate for the kappa=10 Faddeeva pairing cone.

For kappa=10, parameterize the stationary point by 1 < r < 10:

    p = (100-r^2)/(9(r^2+10)),
    q = 1-p = 10(r^2-1)/(9(r^2+10)),
    y = 9r/(10(r+1)).

The positive-series truncation

    S_5 = 1 + sum_{n=2}^5 p(n-1)(q)_{n-1} y^n / n!

is used in

    C(r) = (r^2+10) S_5 - 10(r-1).

This script constructs C directly as a rational function of r, verifies

    C(r) = P(r) / ((r^2+10)^4 (r+1)^5)

for the recorded degree-15 polynomial P, and certifies P > 0 on (1,10)
by converting P to the degree-15 Bernstein basis on [1,4], [4,7], and
[7,10].  All computations use only fractions.Fraction arithmetic.
"""

from fractions import Fraction as F
from math import comb, factorial


Polynomial = tuple[F, ...]
RationalFunction = tuple[Polynomial, Polynomial]


def trim(poly: Polynomial) -> Polynomial:
    coefficients = list(poly)
    while len(coefficients) > 1 and coefficients[-1] == 0:
        coefficients.pop()
    return tuple(coefficients)


def poly_add(left: Polynomial, right: Polynomial) -> Polynomial:
    result = [F(0)] * max(len(left), len(right))
    for index, coefficient in enumerate(left):
        result[index] += coefficient
    for index, coefficient in enumerate(right):
        result[index] += coefficient
    return trim(tuple(result))


def poly_scale(poly: Polynomial, scalar: F) -> Polynomial:
    return trim(tuple(scalar * coefficient for coefficient in poly))


def poly_sub(left: Polynomial, right: Polynomial) -> Polynomial:
    return poly_add(left, poly_scale(right, F(-1)))


def poly_mul(left: Polynomial, right: Polynomial) -> Polynomial:
    result = [F(0)] * (len(left) + len(right) - 1)
    for left_index, left_coefficient in enumerate(left):
        for right_index, right_coefficient in enumerate(right):
            result[left_index + right_index] += (
                left_coefficient * right_coefficient
            )
    return trim(tuple(result))


def poly_pow(poly: Polynomial, exponent: int) -> Polynomial:
    assert exponent >= 0
    result: Polynomial = (F(1),)
    for _ in range(exponent):
        result = poly_mul(result, poly)
    return result


def poly_compose_affine(poly: Polynomial, left: F, length: F) -> Polynomial:
    """Return the power coefficients of poly(left + length*t)."""

    result: Polynomial = (F(0),)
    affine_power: Polynomial = (F(1),)
    affine = (left, length)
    for coefficient in poly:
        result = poly_add(result, poly_scale(affine_power, coefficient))
        affine_power = poly_mul(affine_power, affine)
    return trim(result)


def rational(poly: Polynomial) -> RationalFunction:
    return trim(poly), (F(1),)


def rat_add(
    left: RationalFunction, right: RationalFunction
) -> RationalFunction:
    left_num, left_den = left
    right_num, right_den = right
    return (
        poly_add(poly_mul(left_num, right_den), poly_mul(right_num, left_den)),
        poly_mul(left_den, right_den),
    )


def rat_sub(
    left: RationalFunction, right: RationalFunction
) -> RationalFunction:
    return rat_add(left, (poly_scale(right[0], F(-1)), right[1]))


def rat_mul(
    left: RationalFunction, right: RationalFunction
) -> RationalFunction:
    return poly_mul(left[0], right[0]), poly_mul(left[1], right[1])


def rat_scale(function: RationalFunction, scalar: F) -> RationalFunction:
    return poly_scale(function[0], scalar), function[1]


def rat_pow(function: RationalFunction, exponent: int) -> RationalFunction:
    return poly_pow(function[0], exponent), poly_pow(function[1], exponent)


def bernstein_coefficients(
    poly: Polynomial, left: F, right: F, degree: int
) -> tuple[F, ...]:
    """Degree-``degree`` Bernstein coefficients on [left,right]."""

    assert len(poly) - 1 <= degree
    power = poly_compose_affine(poly, left, right - left)
    padded = power + (F(0),) * (degree + 1 - len(power))
    return tuple(
        sum(
            padded[index] * F(comb(k, index), comb(degree, index))
            for index in range(k + 1)
        )
        for k in range(degree + 1)
    )


def build_truncated_certificate() -> RationalFunction:
    one = rational((F(1),))
    r = (F(0), F(1))
    r_squared = poly_pow(r, 2)
    denominator_core = poly_add(r_squared, (F(10),))

    p = (
        poly_sub((F(100),), r_squared),
        poly_scale(denominator_core, F(9)),
    )
    q = (
        poly_scale(poly_sub(r_squared, (F(1),)), F(10)),
        poly_scale(denominator_core, F(9)),
    )
    y = (
        poly_scale(r, F(9)),
        poly_scale((F(1), F(1)), F(10)),
    )

    truncation = one
    for n in range(2, 6):
        rising_q = one
        for shift in range(n - 1):
            rising_q = rat_mul(
                rising_q,
                rat_add(q, rational((F(shift),))),
            )
        term = rat_mul(rat_mul(p, rising_q), rat_pow(y, n))
        term = rat_scale(term, F(n - 1, factorial(n)))
        truncation = rat_add(truncation, term)

    first = rat_mul(rational(denominator_core), truncation)
    second = rational((F(-10), F(10)))  # 10(r-1)
    return rat_sub(first, second)


EXPECTED_POWER_COEFFICIENTS: Polynomial = tuple(
    map(
        F,
        (
            200000,
            900000,
            1585000,
        ),
    )
) + (
    F(4177000, 3),
    F(2092550, 3),
    F(826894, 3),
    F(1167379, 12),
    F(2409571, 300),
    F(-277541, 240),
    F(2207843, 6000),
    F(-3974833, 2400),
    F(24698557, 60000),
    F(-1971667, 12000),
    F(11717699, 300000),
    F(-32059, 6000),
    F(113183, 150000),
)

EXPECTED_MINIMA = {
    (F(1), F(4)): F(5153632),
    (F(4), F(7)): F(225158158912, 625),
    (F(7), F(10)): F(5774529486941441, 3125),
}


def main() -> None:
    numerator, denominator = build_truncated_certificate()

    r_squared_plus_ten = (F(10), F(0), F(1))
    expected_denominator = poly_mul(
        poly_pow(r_squared_plus_ten, 4),
        poly_pow((F(1), F(1)), 5),
    )

    # Equality of rational functions is checked without cancellation.
    assert poly_mul(numerator, expected_denominator) == poly_mul(
        EXPECTED_POWER_COEFFICIENTS, denominator
    )
    assert len(EXPECTED_POWER_COEFFICIENTS) - 1 == 15

    print("Verified the degree-15 power coefficients of P exactly.")
    for interval, expected_minimum in EXPECTED_MINIMA.items():
        coefficients = bernstein_coefficients(
            EXPECTED_POWER_COEFFICIENTS,
            interval[0],
            interval[1],
            degree=15,
        )
        assert len(coefficients) == 16
        assert all(coefficient > 0 for coefficient in coefficients)
        assert min(coefficients) == expected_minimum
        print(
            f"[{interval[0]}, {interval[1]}]: "
            f"16/16 Bernstein coefficients positive; "
            f"minimum = {expected_minimum}"
        )

    print("Certified P(r) > 0 on [1,10] using Fraction arithmetic.")


if __name__ == "__main__":
    main()
