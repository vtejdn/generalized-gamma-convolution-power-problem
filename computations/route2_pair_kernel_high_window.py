"""Exact rational checks for the high-frequency kernel window in WIP-2.13.

The proof reduces positivity to four rational series bounds at

    A = 57/14,  B = 16/25.

This script checks those bounds and the final positive lower certificate
using only fractions.Fraction arithmetic.
"""

from fractions import Fraction as F
from math import factorial


def exp_partial(x: F, degree: int) -> F:
    return sum((x**n) / factorial(n) for n in range(degree + 1))


def s_partial(x: F, degree: int) -> F:
    return sum(
        (x**n) / (factorial(n) * (2 * n + 1))
        for n in range(degree + 1)
    )


A = F(57, 14)
B = F(16, 25)

# Positive-series lower bounds.
exp_gap = exp_partial(A, 12) - F(293, 5)
s_b_gap = s_partial(B, 3) - F(63, 50)
assert exp_gap > 0
assert s_b_gap > 0

# For u_n=A^n/(n!(2n+1)), the ratios after u_9 are < A/10=57/140.
u9 = A**9 / (factorial(9) * 19)
s_a_upper = s_partial(A, 8) + u9 / (1 - F(57, 140))
s_a_gap = F(433, 50) - s_a_upper
assert s_a_gap > 0

# sqrt(A) > 2017/1000.
sqrt_gap = A - F(2017, 1000) ** 2
assert sqrt_gap > 0

certificate = (
    F(57, 100) * F(293, 5)
    - A * F(433, 50)
    + F(2017, 1000) * F(4, 5) * F(63, 50)
)
assert certificate == F(77247, 437500)
assert certificate > 0

print("Verified WIP-2.13 exactly over fractions.Fraction.")
print(f"exp lower-bound gap = {exp_gap}")
print(f"S(A) upper-bound gap = {s_a_gap}")
print(f"S(B) lower-bound gap = {s_b_gap}")
print(f"sqrt(A) squared gap = {sqrt_gap}")
print(f"final certificate = {certificate}")
