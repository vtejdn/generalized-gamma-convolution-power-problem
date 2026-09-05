"""Exact arithmetic checks for the WIP-5.19 three-rate certificate.

This script only verifies the finite rational comparisons displayed in
(5.195)--(5.199).  The transport lemma and its analytic implications are
proved in WIP.md and are not inferred from computation.
"""

from fractions import Fraction as F


def critical_polynomial(x: F) -> F:
    """Four times the critical polynomial for shapes (1/4,1/4,1/2)."""

    return 11 * x * x - 94 * x + 128


assert critical_polynomial(F(1)) == 45
assert critical_polynomial(F(9, 4)) == F(-445, 16)
assert critical_polynomial(F(25, 4)) == F(-477, 16)
assert critical_polynomial(F(64, 9)) == F(1280, 81)

# The first-cut support ratio, raised to 3/2, at a = 3/2.
a = F(3, 2)
support_bound = ((a - 1) / (a + 1)) ** 2
support_bound *= ((a + 2) * (4 - a)) / ((2 - a) * (a + 4))
assert support_bound == F(7, 55)
assert support_bound < 1

# The fourth power of the endpoint envelope used for M_2.
m2_fourth_bound = F(5, 11) * F(1, 7) * F(3, 13) ** 2
assert m2_fourth_bound == F(45, 13013)
assert m2_fourth_bound < F(1, 256)

# The last radical comparison reduces to sqrt(3) < 3.
assert 3 < 3**2

# The example lies outside the displayed mean and rate-ratio cones.
weighted_mean = F(1, 4) * 1 + F(1, 4) * 2 + F(1, 2) * 4
assert weighted_mean == F(11, 4)
assert weighted_mean > 2

# 4 > (1 + sqrt(5))/2 follows from 7 > sqrt(5).
assert 7**2 > 5

print("Verified the WIP-5.19 three-rate transport certificate exactly.")
print("critical values:", 45, F(-445, 16), F(-477, 16), F(1280, 81))
print("first-cut support bound:", support_bound)
print("M_2 fourth-power bound:", m2_fourth_bound)
print("weighted mean:", weighted_mean)
