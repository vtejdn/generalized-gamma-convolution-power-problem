"""Exact checks for the q=3/2 half-gamma Hankel calculations.

The coefficient ring is Q[t], where t^2 denotes pi.  No floating-point
arithmetic and no third-party package is used.
"""

from fractions import Fraction as F


# A monomial key is (q1, q2, q3, q4, t).
ZERO = {}


def clean(poly):
    return {m: c for m, c in poly.items() if c}


def add(*polys):
    out = {}
    for poly in polys:
        for monomial, coefficient in poly.items():
            out[monomial] = out.get(monomial, F(0)) + coefficient
    return clean(out)


def scale(coefficient, poly):
    return clean({m: F(coefficient) * c for m, c in poly.items()})


def multiply(left, right):
    out = {}
    for lm, lc in left.items():
        for rm, rc in right.items():
            monomial = tuple(a + b for a, b in zip(lm, rm))
            out[monomial] = out.get(monomial, F(0)) + lc * rc
    return clean(out)


def atom(coefficient=1, *, q1=0, q2=0, q3=0, q4=0, t=0):
    return {(q1, q2, q3, q4, t): F(coefficient)}


def assert_equal(label, actual, expected):
    if clean(actual) != clean(expected):
        missing = add(actual, scale(-1, expected))
        raise AssertionError(f"{label} failed: residual={missing}")
    print(f"PASS: {label}")


q1 = atom(q1=1)
q2 = atom(q2=1)
q3 = atom(q3=1)
q4 = atom(q4=1)
t = atom(t=1)

m1 = scale(F(3, 4), multiply(t, q1))
m2 = scale(6, q2)
m3 = scale(F(945, 32), multiply(t, q3))
m4 = scale(720, q4)

kappa1 = m1
kappa2 = add(m2, scale(-1, multiply(m1, m1)))
kappa3 = add(
    m3,
    scale(-3, multiply(m2, m1)),
    scale(2, multiply(multiply(m1, m1), m1)),
)
kappa4 = add(
    m4,
    scale(-4, multiply(m3, m1)),
    scale(-3, multiply(m2, m2)),
    scale(12, multiply(m2, multiply(m1, m1))),
    scale(-6, multiply(multiply(m1, m1), multiply(m1, m1))),
)

mass_gate = add(scale(F(2, 3), kappa2), scale(-1, multiply(kappa1, kappa1)))
mass_expected = add(
    scale(4, q2),
    scale(F(-15, 16), multiply(multiply(t, t), multiply(q1, q1))),
)
assert_equal("fixed-mass 2x2 gate", mass_gate, mass_expected)

unshifted_gate = add(
    scale(F(1, 2), multiply(kappa1, kappa3)),
    scale(-1, multiply(kappa2, kappa2)),
)
unshifted_expected = add(
    scale(
        F(2835, 256),
        multiply(multiply(t, t), multiply(q1, q3)),
    ),
    scale(
        F(27, 16),
        multiply(multiply(t, t), multiply(multiply(q1, q1), q2)),
    ),
    scale(-36, multiply(q2, q2)),
)
assert_equal("first unshifted cumulant-Hankel gate", unshifted_gate, unshifted_expected)

twelve_shifted_gate = add(
    scale(2, multiply(kappa2, kappa4)),
    scale(-3, multiply(kappa3, kappa3)),
)
shifted_expected = add(
    scale(8640, multiply(q2, q4)),
    scale(
        -810,
        multiply(multiply(t, t), multiply(multiply(q1, q1), q4)),
    ),
    scale(
        F(42525, 32),
        multiply(multiply(t, t), multiply(multiply(q1, q2), q3)),
    ),
    scale(
        F(-25515, 512),
        multiply(
            multiply(multiply(t, t), multiply(t, t)),
            multiply(multiply(multiply(q1, q1), q1), q3),
        ),
    ),
    scale(-1296, multiply(multiply(q2, q2), q2)),
    scale(
        F(243, 4),
        multiply(
            multiply(t, t),
            multiply(multiply(q1, q1), multiply(q2, q2)),
        ),
    ),
    scale(
        F(-2679075, 1024),
        multiply(multiply(t, t), multiply(q3, q3)),
    ),
)
assert_equal("12 times the first shifted cumulant-Hankel gate", twelve_shifted_gate, shifted_expected)


# Exact rational certificates for the elementary pi estimates in the proof.
pi_lower = F(3)
pi_upper = F(22, 7)
c_big = F(2679075, 1024)

A0_lower = F(8640) - c_big * pi_upper
A1_lower = (c_big - F(810)) * pi_lower
assert A0_lower > 400
assert A1_lower > 5000

# D(p) = p(243/4 - 25515 p/512) is strictly negative for p >= 3.
assert F(243, 4) - F(25515, 512) * pi_lower < 0

# F_1(1) decreases in p, so its value at 22/7 is a rigorous lower bound.
F1_lower = (
    F(7344)
    - F(2085507, 1024) * pi_upper
    - F(25515, 512) * pi_upper**2
)
assert F1_lower > 450

# E(1/2) and E(1) also decrease in p.
E_half_lower = (
    2 * (F(8640) - c_big * pi_upper)
    - F(9315, 64) * pi_upper
    - F(25515, 2048) * pi_upper**2
)
E_one_lower = (
    2 * (F(8640) - c_big * pi_upper)
    - F(9315, 32) * pi_upper
    - F(25515, 512) * pi_upper**2
)
assert E_half_lower > 250
assert E_one_lower > -600

# At q1=q2=q3=q4=1, the exact 12*Delta_1 is F_1(1).
constant_q_value = {}
for monomial, coefficient in twelve_shifted_gate.items():
    t_power = monomial[-1]
    constant_q_value[t_power] = constant_q_value.get(t_power, F(0)) + coefficient
expected_constant_q = {
    0: F(7344),
    2: F(-2085507, 1024),
    4: F(-25515, 512),
}
if clean(constant_q_value) != clean(expected_constant_q):
    raise AssertionError(
        f"constant-Q boundary failed: residual={constant_q_value}"
    )

print("PASS: rational certificates using 3 < pi < 22/7")
print("PASS: all arithmetic is exact and uses only the Python standard library")
