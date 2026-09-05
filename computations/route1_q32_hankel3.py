"""Exact 3-by-3 cumulant-Hankel formulas for the q=3/2 test family.

Let Y = Q G_1^(3/2), with Q independent of the unit exponential G_1,
and write q_j = E[Q^j].  The sparse-polynomial part of this script works
over Q[q_1,...,q_6,t], where t^2 is pi.  It constructs

    a_n = kappa_{n+1}(Y) / n!,
    det(a_{i+j})_{i,j=0}^2,
    det(a_{i+j+1})_{i,j=0}^2.

All algebraic identities and the endpoint sign certificates use only
fractions.Fraction.  The optional Gauss--Chebyshev scan at the end is
explicitly reconnaissance, not proof.
"""

from fractions import Fraction as F
from math import comb, cos, exp, factorial, gamma, pi


# A monomial key is (q1, q2, q3, q4, q5, q6, t).
NVAR = 7


def clean(poly):
    return {m: c for m, c in poly.items() if c}


def add(*polys):
    out = {}
    for poly in polys:
        for monomial, coefficient in poly.items():
            out[monomial] = out.get(monomial, F(0)) + coefficient
    return clean(out)


def scale(coefficient, poly):
    coefficient = F(coefficient)
    return clean({m: coefficient * c for m, c in poly.items()})


def multiply(left, right):
    out = {}
    for lm, lc in left.items():
        for rm, rc in right.items():
            monomial = tuple(a + b for a, b in zip(lm, rm))
            out[monomial] = out.get(monomial, F(0)) + lc * rc
    return clean(out)


def product(*polys):
    out = {(0,) * NVAR: F(1)}
    for poly in polys:
        out = multiply(out, poly)
    return out


def atom(coefficient=1, variable=None):
    powers = [0] * NVAR
    if variable is not None:
        powers[variable] = 1
    return {tuple(powers): F(coefficient)}


q = [None] + [atom(variable=j - 1) for j in range(1, 7)]
t = atom(variable=6)


# Gamma(1 + 3j/2), with t standing for sqrt(pi).
gamma_coefficients = {
    1: (F(3, 4), 1),
    2: (F(6), 0),
    3: (F(945, 32), 1),
    4: (F(720), 0),
    5: (F(2027025, 256), 1),
    6: (F(362880), 0),
}


moments = [atom(1)]
for j in range(1, 7):
    coefficient, t_power = gamma_coefficients[j]
    moments.append(scale(coefficient, product(q[j], *([t] * t_power))))


def cumulants_from_moments(moment_list):
    kappas = [None]
    for n in range(1, len(moment_list)):
        correction = {}
        for j in range(1, n):
            correction = add(
                correction,
                scale(comb(n - 1, j - 1), multiply(kappas[j], moment_list[n - j])),
            )
        kappas.append(add(moment_list[n], scale(-1, correction)))
    return kappas


kappa = cumulants_from_moments(moments)
a = [scale(F(1, factorial(n)), kappa[n + 1]) for n in range(6)]


def hankel3(x0, x1, x2, x3, x4):
    return add(
        product(x0, x2, x4),
        scale(2, product(x1, x2, x3)),
        scale(-1, product(x0, x3, x3)),
        scale(-1, product(x1, x1, x4)),
        scale(-1, product(x2, x2, x2)),
    )


det_unshifted = hankel3(a[0], a[1], a[2], a[3], a[4])
det_shifted = hankel3(a[1], a[2], a[3], a[4], a[5])


def substitute_q_t(poly, q_values):
    """Substitute q_j=rational*t^power; factor t^parity and return in pi."""
    in_t = {}
    for monomial, coefficient in poly.items():
        t_power = monomial[-1]
        for j, q_power in enumerate(monomial[:-1], start=1):
            q_coefficient, q_t_power = q_values[j]
            coefficient *= q_coefficient**q_power
            t_power += q_t_power * q_power
        in_t[t_power] = in_t.get(t_power, F(0)) + coefficient
    in_t = {power: coefficient for power, coefficient in in_t.items() if coefficient}
    parities = {power % 2 for power in in_t}
    if len(parities) != 1:
        raise AssertionError(f"mixed residual t parities {parities}")
    parity = next(iter(parities), 0)
    out = {}
    for t_power, coefficient in in_t.items():
        pi_power = (t_power - parity) // 2
        out[pi_power] = out.get(pi_power, F(0)) + coefficient
    return parity, {power: coefficient for power, coefficient in out.items() if coefficient}


def shift_laurent(poly):
    shift = max(0, -min(poly, default=0))
    return shift, {power + shift: coefficient for power, coefficient in poly.items()}


def arctan_alternating_bounds_inverse(denominator, last_index):
    """Alternating-series bounds for arctan(1/denominator)."""
    partial = sum(
        F((-1) ** n, (2 * n + 1) * denominator ** (2 * n + 1))
        for n in range(last_index + 1)
    )
    next_partial = partial + F(
        (-1) ** (last_index + 1),
        (2 * last_index + 3) * denominator ** (2 * last_index + 3),
    )
    return min(partial, next_partial), max(partial, next_partial)


# Machin's identity pi=16 arctan(1/5)-4 arctan(1/239), together with the
# alternating Taylor remainder.  The tangent addition formula verifies the
# identity algebraically; positivity locates both sides in the same branch.
atan5_lower, atan5_upper = arctan_alternating_bounds_inverse(5, 8)
atan239_lower, atan239_upper = arctan_alternating_bounds_inverse(239, 2)
PI_LOWER_MACHIN = 16 * atan5_lower - 4 * atan239_upper
PI_UPPER_MACHIN = 16 * atan5_upper - 4 * atan239_lower
PI_LOWER = F(333, 106)
PI_UPPER = F(355, 113)
assert PI_LOWER_MACHIN > PI_LOWER
assert PI_UPPER_MACHIN < PI_UPPER


def rational_lower_bound(poly, pi_lower=PI_LOWER, pi_upper=PI_UPPER):
    """Termwise lower bound for a polynomial on [pi_lower, pi_upper]."""
    total = F(0)
    for power, coefficient in poly.items():
        endpoint = pi_lower if coefficient > 0 else pi_upper
        total += coefficient * endpoint**power
    return total


def rational_upper_bound(poly, pi_lower=PI_LOWER, pi_upper=PI_UPPER):
    """Termwise upper bound for a polynomial on [pi_lower, pi_upper]."""
    total = F(0)
    for power, coefficient in poly.items():
        endpoint = pi_upper if coefficient > 0 else pi_lower
        total += coefficient * endpoint**power
    return total


constant_q = {j: (F(1), 0) for j in range(1, 7)}


def arcsine_zero_endpoint_moment(j):
    """E[U^(3j/2)] for U ~ Beta(1/2,1/2), as rational * t^power."""
    if j % 2 == 0:
        n = 3 * j // 2
        return F(comb(2 * n, n), 4**n), 0
    # p=3j/2 is half-integral.  Evaluate the two half-integer gamma factors
    # by the recurrence Gamma(n+1/2)=((2n)!/(4^n n!))*sqrt(pi).
    p_twice = 3 * j
    numerator_integer = (p_twice + 1) // 2  # p + 1/2
    denominator_half_index = (p_twice + 1) // 2  # Gamma(p+1)=Gamma(n+1/2)
    numerator = F(factorial(numerator_integer - 1))
    n = denominator_half_index
    half_gamma_coefficient = F(factorial(2 * n), 4**n * factorial(n))
    # sqrt(pi)*Gamma(p+1) = half_gamma_coefficient*pi.
    return numerator / half_gamma_coefficient, -2


arcsine_zero_q = {j: arcsine_zero_endpoint_moment(j) for j in range(1, 7)}


def certify_endpoint(label, determinant, q_values):
    t_parity, laurent = substitute_q_t(determinant, q_values)
    shift, polynomial = shift_laurent(laurent)
    lower = rational_lower_bound(polynomial)
    print(
        f"{label}: terms={len(polynomial)}, positive factor "
        f"sqrt(pi)^{t_parity}/pi^{shift} removed"
    )
    print(f"{label}: exact polynomial coefficients={dict(sorted(polynomial.items()))}")
    print(
        f"{label}: termwise lower bound on 333/106 < pi < 355/113 is {lower}"
    )
    if lower <= 0:
        raise AssertionError(f"{label}: the elementary interval certificate is inconclusive")
    print(f"PASS: {label} is strictly positive")


def certify_negative(label, determinant, q_values):
    t_parity, laurent = substitute_q_t(determinant, q_values)
    shift, polynomial = shift_laurent(laurent)
    upper = rational_upper_bound(polynomial)
    print(
        f"{label}: terms={len(polynomial)}, positive factor "
        f"sqrt(pi)^{t_parity}/pi^{shift} removed"
    )
    print(f"{label}: exact polynomial coefficients={dict(sorted(polynomial.items()))}")
    print(
        f"{label}: termwise upper bound on 333/106 < pi < 355/113 is {upper}"
    )
    if upper >= 0:
        raise AssertionError(f"{label}: the elementary interval certificate is inconclusive")
    print(f"PASS: {label} is strictly negative")


def two_point_q(high, high_probability):
    return {
        j: (F(1) - high_probability + high_probability * high**j, 0)
        for j in range(1, 7)
    }


print(f"unshifted sparse terms: {len(det_unshifted)}")
print(f"shifted sparse terms: {len(det_shifted)}")
certify_endpoint("equal-rate 3x3 unshifted", det_unshifted, constant_q)
certify_endpoint("equal-rate 3x3 shifted", det_shifted, constant_q)
certify_endpoint("infinite-contrast 3x3 unshifted", det_unshifted, arcsine_zero_q)
certify_endpoint("infinite-contrast 3x3 shifted", det_shifted, arcsine_zero_q)

# Exact obstructions to extending the universal 2-by-2 multiplier lemma to
# size 3.  These Q laws are auxiliary and are not members of the target
# affine-arcsine family.  For Q_R in {1,R}, P(Q_R=R)=1/10, weighted
# homogeneity gives q_j/R^j -> 1/10.  The first two certificates prove that
# both limiting normalized determinants are negative.  The last two give
# the completely explicit finite witness R=200.
leading_two_point_q = {j: (F(1, 10), 0) for j in range(1, 7)}
certify_negative(
    "two-point-Q asymptotic 3x3 unshifted obstruction",
    det_unshifted,
    leading_two_point_q,
)
certify_negative(
    "two-point-Q asymptotic 3x3 shifted obstruction",
    det_shifted,
    leading_two_point_q,
)
finite_two_point_q = two_point_q(F(200), F(1, 10))
certify_negative(
    "two-point-Q finite 3x3 unshifted obstruction",
    det_unshifted,
    finite_two_point_q,
)
certify_negative(
    "two-point-Q finite 3x3 shifted obstruction",
    det_shifted,
    finite_two_point_q,
)


# Reconnaissance only: for M_r = r + (1-r)U, U arcsine, Gauss--Chebyshev
# quadrature is the equal-weight average over the displayed cosine nodes.
def numerical_q_values(r, node_count=4096):
    values = [0.0] * 7
    for k in range(1, node_count + 1):
        u = (1.0 + cos((2 * k - 1) * pi / (2 * node_count))) / 2.0
        m = r + (1.0 - r) * u
        qbase = m**1.5
        power = qbase
        for j in range(1, 7):
            values[j] += power
            power *= qbase
    return [value / node_count for value in values]


def numerical_determinants(r):
    qv = numerical_q_values(r)
    raw = [1.0]
    for j in range(1, 7):
        raw.append(gamma(1.0 + 1.5 * j) * qv[j])
    kap = [0.0]
    for n in range(1, 7):
        correction = sum(comb(n - 1, j - 1) * kap[j] * raw[n - j] for j in range(1, n))
        kap.append(raw[n] - correction)
    av = [kap[n + 1] / factorial(n) for n in range(6)]

    def det(v0, v1, v2, v3, v4):
        return v0 * v2 * v4 + 2 * v1 * v2 * v3 - v0 * v3**2 - v1**2 * v4 - v2**3

    return det(*av[:5]), det(*av[1:6])


scan_points = [0.0] + [exp(-j / 8) for j in range(80, -1, -1)]
scan = [(r, *numerical_determinants(r)) for r in scan_points]
minimum_u = min(scan, key=lambda row: row[1])
minimum_s = min(scan, key=lambda row: row[2])
if minimum_u[1] > 0 and minimum_s[2] > 0:
    print("RECONNAISSANCE ONLY: sampled determinants stayed positive")
else:
    print("RECONNAISSANCE ONLY: a sampled determinant was nonpositive")
print(f"RECONNAISSANCE ONLY: minimum unshifted sample={minimum_u}")
print(f"RECONNAISSANCE ONLY: minimum shifted sample={minimum_s}")
print("PASS: all symbolic arithmetic and endpoint certificates are exact")
