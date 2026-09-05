"""Exact checks for WIP-3.4.

All polynomial coefficients are fractions. The script constructs the
normalized cumulant polynomials a_n(x) in two independent ways:

1. the PDE recurrence (3.24);
2. raw moments from the even/odd Legendre recurrence, followed by the
   ordinary moment-to-cumulant recurrence.

It proves only the finitely many identities requested by ORDER. The
all-order statement in WIP-3.4 is the symbolic induction written there.
"""

from fractions import Fraction
from math import comb, factorial


ORDER = 8


def trim(p):
    p = list(p)
    while len(p) > 1 and p[-1] == 0:
        p.pop()
    return p


def add(*polys):
    out = [Fraction(0)]
    for p in polys:
        if len(out) < len(p):
            out.extend(Fraction(0) for _ in range(len(p) - len(out)))
        for i, coefficient in enumerate(p):
            out[i] += coefficient
    return trim(out)


def scale(p, scalar):
    scalar = Fraction(scalar)
    return trim([scalar * coefficient for coefficient in p])


def mul(p, q):
    out = [Fraction(0)] * (len(p) + len(q) - 1)
    for i, coefficient_p in enumerate(p):
        for j, coefficient_q in enumerate(q):
            out[i + j] += coefficient_p * coefficient_q
    return trim(out)


def derivative(p):
    if len(p) == 1:
        return [Fraction(0)]
    return trim([Fraction(i) * p[i] for i in range(1, len(p))])


def divide_scalar(p, scalar):
    return scale(p, Fraction(1, scalar))


def pde_cumulants(order):
    values = [[Fraction(2), Fraction(3)]]
    one_plus_2x = [Fraction(1), Fraction(2)]
    x_one_plus_x = [Fraction(0), Fraction(1), Fraction(1)]

    for n in range(1, order + 1):
        value = mul(
            [Fraction(4 * n + 6), Fraction(8 * n + 10)],
            values[n - 1],
        )

        convolution = [Fraction(0)]
        for i in range(n - 1):
            j = n - 2 - i
            convolution = add(convolution, mul(values[i], values[j]))
        value = add(
            value,
            scale(mul(one_plus_2x, convolution), 4),
        )

        value = add(
            value,
            scale(
                mul(x_one_plus_x, derivative(values[n - 1])),
                Fraction(8 * n + 6, n),
            ),
        )

        mixed = [Fraction(0)]
        for i in range(n - 1):
            k = n - 2 - i
            mixed = add(
                mixed,
                scale(
                    mul(values[i], derivative(values[k])),
                    Fraction(1, k + 1),
                ),
            )
        value = add(value, scale(mul(x_one_plus_x, mixed), 8))
        values.append(trim(value))

    return values


def raw_even_moments(order):
    # M_{2n}=r_n and M_{2n+1}=sqrt(1+x) s_n.
    r = [[Fraction(1)]]
    s = [[Fraction(1)]]
    one_plus_x = [Fraction(1), Fraction(1)]

    for n in range(order):
        if n > 0:
            s_n = add(
                scale(r[n], 4 * n + 1),
                scale(s[n - 1], -4 * n * n),
            )
            s.append(s_n)
        r_next = add(
            scale(mul(one_plus_x, s[n]), 4 * n + 3),
            scale(r[n], -(2 * n + 1) ** 2),
        )
        r.append(r_next)

    return r


def cumulants_from_moments(moments):
    # moments[0] = 1; returns kappa_1, ..., kappa_N.
    cumulants = []
    for n in range(1, len(moments)):
        value = list(moments[n])
        for k in range(1, n):
            value = add(
                value,
                scale(
                    mul(cumulants[k - 1], moments[n - k]),
                    -comb(n - 1, k - 1),
                ),
            )
        cumulants.append(trim(value))
    return cumulants


def format_polynomial(p):
    terms = []
    for power, coefficient in enumerate(p):
        if coefficient == 0:
            continue
        atom = str(coefficient)
        if power == 1:
            atom += "*x"
        elif power > 1:
            atom += f"*x^{power}"
        terms.append(atom)
    return " + ".join(terms) if terms else "0"


def main():
    recurrence_values = pde_cumulants(ORDER)
    moments = raw_even_moments(ORDER + 1)
    cumulants = cumulants_from_moments(moments)
    moment_values = [
        divide_scalar(cumulants[n], factorial(n))
        for n in range(ORDER + 1)
    ]

    assert recurrence_values == moment_values
    assert all(
        coefficient >= 0
        for polynomial in recurrence_values
        for coefficient in polynomial
    )

    print(f"Verified a_0,...,a_{ORDER} exactly over Fraction.")
    for n, polynomial in enumerate(recurrence_values[:4]):
        print(f"a_{n}(x) = {format_polynomial(polynomial)}")


if __name__ == "__main__":
    main()
