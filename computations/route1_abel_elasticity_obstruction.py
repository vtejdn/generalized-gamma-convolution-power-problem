"""Exact rational certificate for the Route-1 Abel-elasticity obstruction.

Let V have the Beta(1/2, 1/2) (arcsine) law and put

    I_j = E[V^(2*j+1) exp(-4*V^2)],  j = 0, 1, 2.

For x >= 0 and P_n(x) = sum_{k=0}^n (-x)^k/k!, Taylor's theorem gives

    P_15(x) <= exp(-x) <= P_14(x).

Indeed, for x > 0 the Lagrange remainder is

    exp(-x) - P_n(x) = (-1)^(n+1) exp(-xi) x^(n+1)/(n+1)!

for some xi in (0, x).  Its sign is therefore positive for n = 15 and
negative for n = 14; at x = 0 both inequalities are equalities.  Hence the
bounds hold throughout x in [0, 4].  Applying them at x = 4*V^2 and using

    E[V^m] = binom(2*m, m) / 4^m

gives exact lower and upper bounds for every I_j.

This script uses only integers and fractions.Fraction: no floating-point
arithmetic, numerical quadrature, or symbolic algebra package is involved.
"""

from fractions import Fraction as F
from math import comb, factorial


def arcsine_moment(power: int) -> F:
    """Return E[V^power] for V ~ Beta(1/2, 1/2)."""

    return F(comb(2 * power, power), 4**power)


def integrated_taylor(j: int, degree: int) -> F:
    """Integrate V^(2*j+1) P_degree(4*V^2) exactly."""

    return sum(
        (
            F((-4) ** k, factorial(k))
            * arcsine_moment(2 * j + 1 + 2 * k)
            for k in range(degree + 1)
        ),
        F(0),
    )


lower = [integrated_taylor(j, 15) for j in range(3)]
upper = [integrated_taylor(j, 14) for j in range(3)]

expected_lower = [
    F(180409308803705111, 1928715193810944000),
    F(4883455574522191573, 213958805500094054400),
    F(97098699456077432111, 8558352220003762176000),
]
expected_upper = [
    F(78246627319887581, 835776583984742400),
    F(3403225479056443, 148582503819509760),
    F(9776647491927185381, 855835222000376217600),
]

assert lower == expected_lower
assert upper == expected_upper
assert all(0 < lo < hi for lo, hi in zip(lower, upper))

# Simpler outward rational bounds used in the written certificate.
L0 = F(9353, 100000)
U0 = F(9363, 100000)
U1 = F(22905, 1000000)
L2 = F(11345, 1000000)

assert L0 < lower[0]  # L0 < I_0
assert upper[0] < U0  # I_0 < U0
assert upper[1] < U1  # I_1 < U1
assert L2 < lower[2]  # L2 < I_2

# If S = I_0 I_1 + 4 I_1^2 - 4 I_0 I_2, positivity of the I_j gives
# S < U0*U1 + 4*U1^2 - 4*L0*L2.  The latter is strictly negative.
certificate = U0 * U1 + 4 * U1**2 - 4 * L0 * L2
assert certificate == F(-24803, 20000000000)
assert certificate < 0

print("Verified the Route-1 Abel-elasticity obstruction exactly.")
for j, (lo, hi) in enumerate(zip(lower, upper)):
    print(f"P_15 bound < I_{j} < P_14 bound: {lo} < I_{j} < {hi}")
print(f"strict upper bound for S = {certificate}")
