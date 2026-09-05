"""Exact rational checks for the certificate in WIP-2.12.

Only fractions.Fraction arithmetic is used.  The script verifies:

* the five lower bounds in (2.86);
* the five increments and weighted increments used in (2.87);
* their sum 23987/622080;
* the squared comparison in (2.88).
"""

from fractions import Fraction as F


def a_value(w: F) -> F:
    return F(25, 6) * w**2 + F(125, 24) * w**4


def p3(x: F) -> F:
    return 1 - x + x**2 / 2 - x**3 / 6


def antiderivative(w: F) -> F:
    return -w / 4 + F(5, 3) * w**3


points = [F(1, 4), F(1, 3), F(3, 8), F(5, 12), F(11, 24), F(1, 2)]
lower_bounds = [F(7, 12), F(49, 100), F(39, 100), F(7, 25), F(7, 50)]

expected_a = [
    F(1025, 1944),
    F(22575, 32768),
    F(438125, 497664),
    F(8799725, 7962624),
    F(175, 128),
]
expected_gaps = [
    F(175268935, 44079842304),
    F(6830551097091, 1759218604441600),
    F(63548401383143251, 18488425889503641600),
    F(43566029160509197267, 75728592443406915993600),
    F(468233, 314572800),
]
expected_increments = [
    F(77, 5184),
    F(653, 41472),
    F(923, 41472),
    F(1223, 41472),
    F(1553, 41472),
]
expected_weighted = [
    F(539, 62208),
    F(31997, 4147200),
    F(11999, 1382400),
    F(8561, 1036800),
    F(10871, 2073600),
]

for j, (right, bound) in enumerate(zip(points[1:], lower_bounds)):
    assert a_value(right) == expected_a[j]
    gap = p3(a_value(right)) - bound
    assert gap == expected_gaps[j]
    assert gap > 0

increments = [
    antiderivative(right) - antiderivative(left)
    for left, right in zip(points, points[1:])
]
assert increments == expected_increments

weighted = [bound * increment for bound, increment in zip(lower_bounds, increments)]
assert weighted == expected_weighted

certificate = sum(weighted, F(0))
assert certificate == F(23987, 622080)

gap_after_squaring = 684 * certificate**2 - 1
assert gap_after_squaring == F(182604811, 10749542400)
assert gap_after_squaring > 0

print("Verified WIP-2.12 exactly over fractions.Fraction.")
print(f"positive certificate = {certificate}")
print(f"684 * certificate^2 - 1 = {gap_after_squaring}")
