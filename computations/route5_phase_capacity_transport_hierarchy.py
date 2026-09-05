"""Exact checks for WIP-5.20--WIP-5.23.

Only Python integers and fractions.Fraction are used.  This script verifies
the finite algebraic identities and rational inequalities quoted in the
transport examples, the four-rate peak-gap separation, and the curvature
obstruction.  It does not replace any of the analytic arguments in the
ledger.
"""

from fractions import Fraction as F


def poly_add(p, q):
    n = max(len(p), len(q))
    return [
        (p[i] if i < len(p) else F(0))
        + (q[i] if i < len(q) else F(0))
        for i in range(n)
    ]


def poly_mul(p, q):
    out = [F(0)] * (len(p) + len(q) - 1)
    for i, a in enumerate(p):
        for j, b in enumerate(q):
            out[i + j] += a * b
    return out


def critical_polynomial(shapes, rates):
    """Ascending coefficients of sum_i beta_i b_i prod_{k != i}(x-b_k^2)."""
    out = [F(0)]
    for i, (beta, rate) in enumerate(zip(shapes, rates)):
        term = [F(beta * rate)]
        for k, other_rate in enumerate(rates):
            if k != i:
                term = poly_mul(term, [F(-(other_rate**2)), F(1)])
        out = poly_add(out, term)
    return out


# WIP-5.21: exact-supremum example (1/5,1/5,3/5; 1,2,7).
shapes_1 = [F(1, 5), F(1, 5), F(3, 5)]
rates_1 = [1, 2, 7]
expected_1 = [F(378, 5), F(-258, 5), F(24, 5)]
assert critical_polynomial(shapes_1, rates_1) == expected_1

m1_fifth = F(1, 2) * F(1, 5) * F(2, 5) ** 3
assert m1_fifth == F(4, 625)
assert m1_fifth > F(9, 25) ** 5
assert 4 * 144 < 625  # phi^10 < 144 makes (M phi^2)^5 < 1.
assert 125 > 121  # sqrt(5) > 11/5, hence phi > 8/5.
assert 3456 > 3125  # (3/2)^(3/5) > 5/4 after fifth powers.
assert F(17, 5) ** 3 / 7**5 < 1


# WIP-5.21: average-but-not-exact-supremum example
# (1/8,1/8,3/4; 5,7,23).
shapes_2 = [F(1, 8), F(1, 8), F(3, 4)]
rates_2 = [5, 7, 23]
expected_2 = [F(195615, 4), F(-4245, 2), F(75, 4)]
assert critical_polynomial(shapes_2, rates_2) == expected_2

m2_eighth = F(7**5, 2**26)
lower_difference = 7**5 * 65**8 - 2**26 * 23**8
upper_difference = 2**26 * 11**8 - 7**5 * 31**8
assert lower_difference == 100102109324103591 > 0
assert upper_difference == 50841325950297 > 0
assert m2_eighth > F(23, 65) ** 8
assert m2_eighth < F(11, 31) ** 8
assert 2592 > 2401  # sqrt(2) > 49/36, hence c > 11/6.
assert 320000 < 323761  # sqrt(2) < 569/400, hence c < 37/20.
average_bound = F(11, 31) * (1 + F(37, 20) * F(149, 153))
assert average_bound == F(94303, 94860) < 1
assert F(1, 14) ** 8 * 7**6 < 1


# WIP-5.22: the (1/4,1/4,1/2; 1,2,4) separation from the old mass cone.
assert 15 * 17**4 > 2 * 28**4
assert 15 * 17**4 == 1252815
assert 2 * 28**4 == 1229312
assert F(3, 1183) > F(2, 9) ** 4
assert 19683 > 18928
assert 1250 < 1296  # 2^(1/4) < 6/5.
assert 432 < 625  # 432^(1/4) < 5.
assert F(49, 60) > F(11, 14)
assert 9801 > 9800


# WIP-5.23: four-rate strict separation from the peak-gap cone.
assert 23**49 > 4 * 12**49
assert 10 < 2**100
assert 5**49 < 3**100
assert 4200 > 1521
assert 3200 > 2187
assert 625 < 891
assert 23**13 > 2**50
assert 12**49 > 3**100
assert 92 > 81

assert 2401 > 2304
assert 48 > 47
binomial_lower = (
    F(1)
    + F(100, 19)
    + F(4950, 19**2)
    + F(161700, 19**3)
    + F(3921225, 19**4)
)
assert binomial_lower == F(9596696, 130321) > 49
assert 25**24 < 3 * 24**24
assert 8 * 25**49 < 75 * 24**49
assert F(75, 8) < 49
assert 51 * 24 < 49 * 25
assert 51**49 < 49**50
assert 19 * 350 > 11 * 490


# WIP-5.22: exact rational curvature obstruction.
alpha = F(5, 11)
beta = F(5, 11)
gamma = F(1, 11)
A = F(1)
B = F(2)
C = F(5)
r = F(7, 3)
shapes = [alpha, beta, gamma]
rates = [A, B, C]

log_m2_prime = -alpha / (r - A) - beta / (r - B) + gamma / (C - r)
log_a_prime = -sum(shape / (r + rate) for shape, rate in zip(shapes, rates))
L = 2 * sum(
    shape * rate / (r * r - rate * rate)
    for shape, rate in zip(shapes, rates)
)
L_prime = -4 * r * sum(
    shape * rate / (r * r - rate * rate) ** 2
    for shape, rate in zip(shapes, rates)
)
V = 2 * log_m2_prime - log_a_prime - L_prime / L

assert L == F(17829, 12584) > 0
assert V == F(-1023657, 17806360) < 0


print("Verified WIP-5.20--WIP-5.23 finite calculations exactly over Fraction.")
print("critical polynomials:", expected_1, expected_2)
print("M-bound integer differences:", lower_difference, upper_difference)
print("average certificate:", average_bound)
print("four-rate binomial lower bound:", binomial_lower)
print("curvature values:", L, V)
