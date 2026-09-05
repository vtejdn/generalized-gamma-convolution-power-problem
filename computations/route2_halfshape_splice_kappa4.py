"""Exact rational certificate for the kappa <= 4 splice.

This script verifies only the finite arithmetic in the proposed WIP-2.14
lemma.  The analytic part of that lemma reduces the low-frequency problem
to

    L = E[g_3(V) 1_{V<1/12}
          + g_3(V) exp(-A(V)) 1_{V>=1/12}] > 0,

where V is arcsine on (0, 1),

    g_3(v) = 3v - 1/4,
    A(v)   = (96/25)v + (144/25)v^2.

After v=w^2 and multiplication by pi, the negative contribution has
absolute value

    N = sqrt(11)/4 - (5/2) asin(1/sqrt(12)),

and the positive contribution is bounded below on
[7/24, 19/20].  Everything checked below uses fractions.Fraction only;
there are no floating-point or numerical-quadrature assertions.
"""

from fractions import Fraction as F
from math import comb


# ---------------------------------------------------------------------------
# Negative contribution
# ---------------------------------------------------------------------------

# Strict rational bounds
#
#     sqrt(11) < U11,
#     LINV3 < 1/sqrt(3).

U11 = F(3_316_625, 1_000_000)
LINV3 = F(577_350, 1_000_000)

assert U11**2 - 11 == F(89, 64_000_000) > 0
assert 1 - 3 * LINV3**2 == F(373, 400_000_000) > 0

# For x=1/sqrt(12)=1/(2sqrt(3)), positivity of the arcsine series gives
#
#   asin(x) >= x S4,
#   S4 = sum_{n=0}^4 binom(2n,n)/(4^n(2n+1)12^n).

S4 = sum(
    F(comb(2 * n, n), 4**n * (2 * n + 1) * 12**n)
    for n in range(5)
)
assert S4 == F(848_145_961, 836_075_520)

# Therefore
#
#   N <= U11/4 - (5/4) S4 LINV3 < 9705/100000.

NEGATIVE_UPPER = U11 / 4 - F(5, 4) * S4 * LINV3
assert NEGATIVE_UPPER == F(144_250_497_157, 1_486_356_480_000)
assert F(9705, 100_000) - NEGATIVE_UPPER == (
    F(399_227, 1_486_356_480_000)
) > 0


# ---------------------------------------------------------------------------
# Positive contribution
# ---------------------------------------------------------------------------


def multiply(p: list[F], q: list[F]) -> list[F]:
    """Multiply polynomials whose coefficients are in ascending order."""

    out = [F(0)] * (len(p) + len(q) - 1)
    for i, a in enumerate(p):
        for j, b in enumerate(q):
            out[i + j] += a * b
    return out


def integrate_polynomial(p: list[F], left: F, right: F) -> F:
    """Integrate a rational polynomial exactly on a rational interval."""

    return sum(
        coefficient * (right ** (degree + 1) - left ** (degree + 1))
        / F(degree + 1)
        for degree, coefficient in enumerate(p)
    )


def a_value(w: F) -> F:
    """A(w^2) at T=16/25 and d=3."""

    return F(96, 25) * w**2 + F(144, 25) * w**4


# Positive binomial truncation
#
#   B3(w) = 1 + w^2/2 + 3w^4/8 + 5w^6/16
#          <= (1-w^2)^(-1/2),       0 <= w < 1.
#
# The first factor is 2 g_3(w^2)=6w^2-1/2.  It is positive on all
# intervals used below because (7/24)^2 > 1/12.

TWO_G = [-F(1, 2), F(0), F(6)]
B3 = [F(1), F(0), F(1, 2), F(0), F(3, 8), F(0), F(5, 16)]
WEIGHT = multiply(TWO_G, B3)

LEFT_ENDPOINT = F(7, 24)
STEP = F(79, 1920)
RIGHT_ENDPOINT = F(19, 20)

assert LEFT_ENDPOINT**2 - F(1, 12) == F(1, 576) > 0
assert LEFT_ENDPOINT + 16 * STEP == RIGHT_ENDPOINT

# For w_j=7/24+79j/1920, put x_j=A(w_j).  Convexity gives, on the
# j-th interval,
#
#   exp(-A(w)) >= exp(-x_j)(1+x_j-A(w)).
#
# The rational constants c_j=K_j/10^5 are certified through
#
#   c_j <= (1-x_j/1000)^1000 <= exp(-x_j).
#
# The second inequality follows from log(1-y)<=-y for 0<=y<1.

K = [
    60_888,
    52_211,
    43_472,
    35_011,
    27_159,
    20_199,
    14_331,
    9_647,
    6_125,
    3_645,
    2_019,
    1_034,
    486,
    207,
    80,
    27,
]

POSITIVE_LOWER = F(0)

for j, numerator in enumerate(K, start=1):
    left = LEFT_ENDPOINT + (j - 1) * STEP
    right = LEFT_ENDPOINT + j * STEP
    x_j = a_value(right)
    c_j = F(numerator, 100_000)

    assert 0 < x_j < 1000
    assert a_value(left) <= x_j
    assert c_j <= (1 - x_j / 1000) ** 1000

    # Polynomial 1+x_j-A(w), in ascending powers of w.  Since A is
    # increasing and w<=w_j, this tangent factor is at least one.
    tangent = [
        1 + x_j,
        F(0),
        -F(96, 25),
        F(0),
        -F(144, 25),
    ]
    assert 1 + x_j - a_value(right) == 1

    POSITIVE_LOWER += c_j * integrate_polynomial(
        multiply(WEIGHT, tangent), left, right
    )

EXPECTED_POSITIVE_LOWER = F(
    624_822_254_460_332_573_895_266_180_085_210_493_227_000_861_647,
    6_380_111_302_066_666_283_514_483_179_520_000_000_000_000_000_000,
)

assert POSITIVE_LOWER == EXPECTED_POSITIVE_LOWER
assert POSITIVE_LOWER - F(979, 10_000) == F(
    209_357_988_005_944_739_198_276_810_202_493_227_000_861_647,
    6_380_111_302_066_666_283_514_483_179_520_000_000_000_000_000_000,
) > 0


# Combining the two strict rational comparisons proves pi*L>17/20000.

assert F(979, 10_000) - F(9705, 100_000) == F(17, 20_000) > 0

print("Verified the kappa <= 4 low-frequency certificate exactly.")
print(f"arcsine truncation S4 = {S4}")
print(f"negative coefficient upper bound = {NEGATIVE_UPPER}")
print(f"positive coefficient lower bound = {POSITIVE_LOWER}")
print("net coefficient > 17/20000")
