"""Exact Hankel-minor calculation for the first Route 3 benchmark.

Model
-----
    X = u * G_{1/2} + v * G'_{1/2},   Y = X**2,

where the gamma variables are independent and have unit rate.

Put
    p = u + v,
    z = ((u - v) / (u + v))**2.

The script uses only fractions.Fraction.  It computes the normalized
cumulants
    a_n = kappa_{n+1}(Y) / n!
after setting p = 1.  Homogeneity restores the powers of p stated in
WIP.md.  No floating-point arithmetic or external CAS is used.
"""

from fractions import Fraction
from itertools import permutations
from math import comb, factorial


Polynomial = list[Fraction]


def trim(poly: Polynomial) -> Polynomial:
    while len(poly) > 1 and poly[-1] == 0:
        poly.pop()
    return poly


def add(left: Polynomial, right: Polynomial) -> Polynomial:
    result = [Fraction(0)] * max(len(left), len(right))
    for index, coefficient in enumerate(left):
        result[index] += coefficient
    for index, coefficient in enumerate(right):
        result[index] += coefficient
    return trim(result)


def scale(poly: Polynomial, scalar: Fraction) -> Polynomial:
    return trim([scalar * coefficient for coefficient in poly])


def subtract(left: Polynomial, right: Polynomial) -> Polynomial:
    return add(left, scale(right, Fraction(-1)))


def multiply(left: Polynomial, right: Polynomial) -> Polynomial:
    result = [Fraction(0)] * (len(left) + len(right) - 1)
    for i, left_coefficient in enumerate(left):
        for j, right_coefficient in enumerate(right):
            result[i + j] += left_coefficient * right_coefficient
    return trim(result)


def determinant(matrix: list[list[Polynomial]]) -> Polynomial:
    size = len(matrix)
    result = [Fraction(0)]
    for permutation in permutations(range(size)):
        inversions = sum(
            permutation[i] > permutation[j]
            for i in range(size)
            for j in range(i + 1, size)
        )
        term = [Fraction(1)]
        for row in range(size):
            term = multiply(term, matrix[row][permutation[row]])
        result = add(
            result,
            scale(term, Fraction(-1 if inversions % 2 else 1)),
        )
    return trim(result)


def arcsine_even_moment(index: int) -> Fraction:
    """E[V^(2*index)] for V with the arcsine law on [-1, 1]."""

    return Fraction(comb(2 * index, index), 4**index)


def normalized_raw_moment_y(order: int) -> Polynomial:
    """Return E[Y^order] at p=1 as a polynomial in z."""

    exponent = 2 * order
    expectation_factor = [
        Fraction(comb(exponent, 2 * j)) * arcsine_even_moment(j)
        for j in range(order + 1)
    ]
    return scale(
        expectation_factor,
        Fraction(factorial(exponent), 2**exponent),
    )


def normalized_cumulants(max_order: int) -> list[Polynomial]:
    moments = [[Fraction(1)]] + [
        normalized_raw_moment_y(order)
        for order in range(1, max_order + 1)
    ]
    cumulants = [[Fraction(0)] for _ in range(max_order + 1)]
    for order in range(1, max_order + 1):
        value = moments[order]
        for index in range(1, order):
            value = subtract(
                value,
                scale(
                    multiply(cumulants[index], moments[order - index]),
                    Fraction(comb(order - 1, index - 1)),
                ),
            )
        cumulants[order] = value
    return cumulants


def format_polynomial(poly: Polynomial) -> str:
    terms: list[str] = []
    for degree, coefficient in enumerate(poly):
        if coefficient == 0:
            continue
        monomial = "1" if degree == 0 else ("z" if degree == 1 else f"z^{degree}")
        terms.append(f"({coefficient}) {monomial}")
    return " + ".join(terms) if terms else "0"


def main() -> None:
    # Shifted 3-by-3 uses a_5, hence cumulants through order 6.
    cumulants = normalized_cumulants(6)
    a = [
        scale(cumulants[index + 1], Fraction(1, factorial(index)))
        for index in range(6)
    ]

    h_2 = determinant([[a[i + j] for j in range(2)] for i in range(2)])
    h_2_shifted = determinant(
        [[a[i + j + 1] for j in range(2)] for i in range(2)]
    )
    h_3 = determinant([[a[i + j] for j in range(3)] for i in range(3)])
    h_3_shifted = determinant(
        [[a[i + j + 1] for j in range(3)] for i in range(3)]
    )

    results = {
        "H_2": h_2,
        "H_2_shifted": h_2_shifted,
        "H_3": h_3,
        "H_3_shifted": h_3_shifted,
    }

    for index, poly in enumerate(a):
        print(f"a_{index} = {format_polynomial(poly)}")
    for name, poly in results.items():
        print(f"{name} = {format_polynomial(poly)}")
        assert all(coefficient > 0 for coefficient in poly)

    print("All displayed determinant coefficients are strictly positive.")


if __name__ == "__main__":
    main()
