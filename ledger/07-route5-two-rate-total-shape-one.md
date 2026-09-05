# Route 5B: the two-rate total-shape-one theorem

Beta--Faddeeva reduction, single-crossing and compressed-pairing cones, and the exact true-lobe proof.

Entries: WIP-5.8, WIP-5.9, WIP-5.10, WIP-5.11.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

Original WIP identifiers and equation numbers are preserved. Positional words such as "above" and "below" refer to the original numbered proof sequence.

## Progress entries


<a id="wip-5-8"></a>
### WIP-5.8 — a Beta--Faddeeva one-dimensional sign reduction

**Status: [PROVED REDUCTION].**

For the same two-rate Beta law, the two-variable average (5.21) can also be
reduced to the monotonicity of one quotient of three real integrals.  Let

\[
w(z)=e^{-z^2}\operatorname{erfc}(-iz).
\]

The Faddeeva integral representation, valid for \(\operatorname{Im}z>0\),
is

\[
w(z)=\frac{i}{\pi}\int_{\mathbb R}\frac{e^{-y^2}}{z-y}\,dy.
\tag{5.36}
\]

For \(R=1+(\kappa-1)V\) and
\(V\sim\operatorname{Beta}(p,1-p)\), Euler's Beta integral gives, with
principal powers,

\[
\mathbb E\!\left[\frac1{zR-y}\right]
=(z-y)^{p-1}(\kappa z-y)^{-p}.
\tag{5.37}
\]

Indeed, factoring out \(z-y\) turns the Beta integral into
\({}_2F_1(1,p;1;-(\kappa-1)z/(z-y))\), and
\({}_2F_1(a,b;a;\zeta)=(1-\zeta)^{-b}\) gives (5.37).

Take the boundary value from the upper half-plane at \(z=u>0\), scale the
integration variable by \(u\), and recall that
\(\mathbb E[w(uR)]=Q(u)+iN(u)\).  With \(t=u^2\), define

\[
\begin{aligned}
A(t)&=\int_{-\infty}^1 e^{-ty^2}
(\kappa-y)^{-p}(1-y)^{p-1}\,dy,\\
B(t)&=\int_1^\kappa e^{-ty^2}
(\kappa-y)^{-p}(y-1)^{p-1}\,dy,\\
C(t)&=\int_\kappa^\infty e^{-ty^2}
(y-\kappa)^{-p}(y-1)^{p-1}\,dy.
\end{aligned}
\tag{5.38}
\]

All three integrals, and their derivatives in \(t>0\), are absolutely
convergent.  To justify the boundary passage, split the real line at
\(1\) and \(\kappa\); on small one-sided neighborhoods the powers
\(|y-1|^{p-1}\) and \(|y-\kappa|^{-p}\) are integrable because
\(0<p<1\), while away from the endpoints ordinary dominated convergence
applies.  On \((1,\kappa)\), the factor
\((1-y+i0)^{p-1}\) contributes \(-e^{i\pi p}\); on
\((\kappa,\infty)\), the product of the two boundary powers contributes
\(-1\).  Thus

\[
\boxed{
Q(u)=\frac{\sin(\pi p)}\pi B(t),
\qquad
N(u)=\frac{A(t)-\cos(\pi p)B(t)-C(t)}\pi.
}
\tag{5.39}
\]

Since the constant and the cosine term disappear on differentiation of
\(N/Q\), the exact target (5.21) is

\[
\boxed{
\frac d{dt}\left(\frac{A(t)-C(t)}{B(t)}\right)\ge0
\qquad(t>0).
}
\tag{5.40}
\]

More precisely, (5.12) gives the normalization

\[
\boxed{
\mathbb E[\mathcal K(uR_1,uR_2)]
=\frac{2t\sin(\pi p)}{\pi^{3/2}}
\left\{B(A'-C')-(A-C)B'\right\}.
}
\tag{5.41}
\]

This reduction also shows exactly why a standard monotone-likelihood-ratio
argument does not close the problem.  After folding the integrals by
\(r=|y|\), write

\[
A(t)-C(t)=\int_0^\infty e^{-tr^2}h(r)\,dr,
\qquad
B(t)=\int_0^\infty e^{-tr^2}b(r)\,dr.
\]

Here \(b\) is positive only on \((1,\kappa)\), while \(h\) is positive on
\((0,\kappa)\) and negative on \((\kappa,\infty)\).  On the common support,

\[
\boxed{
\frac{h(r)}{b(r)}
=g(r)
:=\left(\frac{\kappa-r}{\kappa+r}\right)^p
  \left(\frac{r-1}{r+1}\right)^{1-p},
\qquad 1<r<\kappa.
}
\tag{5.42}
\]

Logarithmic differentiation shows that \(g\) increases and then decreases,
with its unique maximum at

\[
\boxed{
r_*^2=
\frac{(1-p)\kappa^2+p\kappa}{1-p+p\kappa}.
}
\tag{5.43}
\]

Writing \(H=A-C\), Tonelli applied separately to the positive and negative
parts gives the exact expansion

\[
B H'-H B'
=\int_0^\infty\!\int_1^\kappa
e^{-t(r^2+s^2)}h(r)b(s)(s^2-r^2)\,ds\,dr.
\tag{5.44}
\]

In (5.44), the blocks
\(0<r<1\) and \(r>\kappa\) contribute with the desired sign pointwise.
Only the finite interior square \((1,\kappa)^2\), where the likelihood ratio
(5.42) is unimodal rather than monotone, contains an unresolved
cancellation.  In addition, the exact endpoint windows (5.23) already settle
\(t\le1/(2\kappa^2)\) and \(t\ge5/6\).  Thus, for fixed
\((p,\kappa)\), the unresolved sign is localized to a compact
\(t\)-interval and the compact interior \((r,s)\)-square.  This is a sharper
stop condition than the original two-variable kernel inequality, but it is
not by itself a proof of (5.40); WIP-5.11 later resolves the cancellation by
retaining the exact first negative lobe.

<a id="wip-5-9"></a>
### WIP-5.9 — a Faddeeva single-crossing cone

**Status: [PROVED PARTIAL ROUTE-5 THEOREM].**

The exterior pieces in WIP-5.8 can dominate the nonmonotone interior
likelihood ratio in a second explicit parameter region.  Throughout this
entry, \(0<p<1\), \(\kappa>1\), and \(t>0\).  Write

\[
H(t)=A(t)-C(t),
\qquad
\chi(t)=\frac{H(t)}{B(t)},
\]

and extend the density of \(B\) by zero outside \((1,\kappa)\).  Folding at
the origin gives

\[
H(t)=\int_0^\infty e^{-tr^2}h(r)\,dr,
\qquad
B(t)=\int_0^\infty e^{-tr^2}b(r)\,dr,
\tag{5.45}
\]

where

\[
b(r)=
\begin{cases}
(\kappa-r)^{-p}(r-1)^{p-1},&1<r<\kappa,\\
0,&\text{otherwise},
\end{cases}
\tag{5.46}
\]

and

\[
h(r)=
\begin{cases}
(\kappa-r)^{-p}(1-r)^{p-1}
+(\kappa+r)^{-p}(1+r)^{p-1},
&0<r<1,\\[1mm]
(\kappa+r)^{-p}(r+1)^{p-1},
&1<r<\kappa,\\[1mm]
(\kappa+r)^{-p}(r+1)^{p-1}
-(r-\kappa)^{-p}(r-1)^{p-1},
&r>\kappa.
\end{cases}
\tag{5.47}
\]

Thus \(h>0\) on \((0,\kappa)\) and \(h<0\) on
\((\kappa,\infty)\).  The latter sign follows from

\[
\frac{(\kappa+r)^{-p}(r+1)^{p-1}}
     {(r-\kappa)^{-p}(r-1)^{p-1}}
=
\left(\frac{r-\kappa}{r+\kappa}\right)^p
\left(\frac{r-1}{r+1}\right)^{1-p}<1.
\]

On the common support, \(h=bg\), where \(g\) is precisely (5.42).  Put

\[
g_*=\max_{1<r<\kappa}g(r),
\qquad
k_t(r)=h(r)-\chi(t)b(r).
\]

By the definition of \(\chi\),

\[
\int_0^\infty e^{-tr^2}k_t(r)\,dr=0,
\qquad
\chi'(t)
=-\frac1{B(t)}
\int_0^\infty r^2e^{-tr^2}k_t(r)\,dr.
\tag{5.48}
\]

This proves the following single-crossing lemma:

\[
\boxed{
\chi(t)\le0\quad\text{or}\quad\chi(t)\ge g_*
\quad\Longrightarrow\quad
\chi'(t)>0.
}
\tag{5.49}
\]

Indeed, if \(\chi\le0\), then \(k_t>0\) on \((0,\kappa)\) and
\(k_t<0\) on \((\kappa,\infty)\).  Subtracting \(\kappa^2\) times the
zero-mass identity in (5.48) gives

\[
\int_0^\infty(r^2-\kappa^2)e^{-tr^2}k_t(r)\,dr<0.
\]

If \(\chi\ge g_*\), then \(k_t>0\) on \((0,1)\) and
\(k_t\le0\) on \((1,\infty)\); subtracting the same identity with the
constant \(1\) again makes the second integral in (5.48) strictly negative.
The boundary cases are strict as well: \(g>0\) in the open interior, and
when \(\chi=g_*\) the additional interior zero is only the unique maximizer
of \(g\).

There is also an exact quantitative decomposition of the possible failure.
Set

\[
\begin{aligned}
L_t&=\int_0^1e^{-tr^2}h(r)\,dr,\\
U_t&=\int_\kappa^\infty e^{-tr^2}[-h(r)]\,dr,\\
\nu_t(dr)&=B(t)^{-1}e^{-tr^2}b(r)\,dr.
\end{aligned}
\]

Let \(\mu_L,\mu_B,\mu_U\) be the \(r^2\)-means under the normalized
measures in these three displays.  Direct differentiation of
\(\chi=(L_t+B\mathbb E_{\nu_t}g-U_t)/B\) yields

\[
\boxed{
\chi'
=\frac{L_t}{B}(\mu_B-\mu_L)
+\frac{U_t}{B}(\mu_U-\mu_B)
-\operatorname{Cov}_{\nu_t}(g(R),R^2).
}
\tag{5.50}
\]

The first two terms are strictly positive because
\(\mu_L<1<\mu_B<\kappa^2<\mu_U\).  The sole potentially adverse term is the
interior covariance of the unimodal function \(g\).

The maximum \(g_*\) is explicit.  Logarithmic differentiation gives

\[
\frac{g'(r)}{g(r)}
=
\frac{2(1-p)}{r^2-1}
-\frac{2p\kappa}{\kappa^2-r^2}
=
\frac{2(1-p+p\kappa)(r_*^2-r^2)}
{(r^2-1)(\kappa^2-r^2)},
\]

where

\[
r_*^2=
\frac{(1-p)\kappa^2+p\kappa}{1-p+p\kappa},
\qquad
g_*=g(r_*).
\tag{5.51}
\]

Moreover, write \(\kappa=e^K\) and \(r=e^x\).  Then

\[
g(e^x)
=
\tanh^p\!\left(\frac{K-x}{2}\right)
\tanh^{1-p}\!\left(\frac{x}{2}\right).
\]

Since \(\tanh z<z\) for \(z>0\), maximizing the resulting weighted product
at \(x=(1-p)K\) gives

\[
\boxed{
g_*<
\frac{\log\kappa}{2}\,p^p(1-p)^{1-p}.
}
\tag{5.52}
\]

Finally, (5.39) gives

\[
\chi(t)
=\cos(\pi p)
+\sin(\pi p)\frac{N(\sqrt t)}{Q(\sqrt t)}
>\cos(\pi p),
\tag{5.53}
\]

because \(Q>0\) and
\(N(\sqrt t)=\mathbb E[e^{-tR^2}\operatorname{erfi}(\sqrt tR)]>0\).
Combining (5.49) and (5.53) proves

\[
\boxed{
0<p<\frac12,\qquad
g_*(p,\kappa)\le\cos(\pi p)
\quad\Longrightarrow\quad
\left(G_p/\kappa+G_{1-p}\right)^2\in GGC.
}
\tag{5.54}
\]

A simpler fully explicit sufficient region is

\[
\boxed{
0<p<\frac12,\qquad
\log\kappa\le
\frac{2\cos(\pi p)}{p^p(1-p)^{1-p}}
\quad\Longrightarrow\quad
\left(G_p/\kappa+G_{1-p}\right)^2\in GGC.
}
\tag{5.55}
\]

This certificate is genuinely complementary to the tilted-mean cone
(5.34f).  For example, take \(p=1/4\) and \(\kappa=e^2\).  The right side
of (5.55) is

\[
\frac{4\sqrt2}{3^{3/4}}>2=\log\kappa,
\]

where the strict inequality follows on taking fourth powers from
\(64>27\).  In contrast, (5.34f) would require \(e^2\le5\), whereas the
positive exponential series gives \(e^2>1+2+2=5\).

The remaining single-crossing gap is exact.  If
\(0<\chi(t)<g_*\), the sign pattern of \(k_t\) is
\(+,-,+,-\), because the equation \(g(r)=\chi(t)\) has two interior roots.
Neither case in (5.49) alone applies.  WIP-5.10 resolves this four-block
case on a substantially larger explicit parameter cone by compressing the
first positive block onto the first negative block, and WIP-5.11 then
replaces that compression by an exact true-lobe comparison valid for every
\((p,\kappa)\).

<a id="wip-5-10"></a>
### WIP-5.10 — compressed Faddeeva pairing and a uniform cone through
\(\kappa=10\)

**Status: [PROVED PARTIAL ROUTE-5 THEOREM; EXACT RATIONAL
BERNSTEIN-BASIS CERTIFICATE].**

Continue with the notation of WIP-5.9.  It remains only to consider

\[
0<\chi(t)<g_*.
\]

Let the two roots of \(g(r)=\chi(t)\) be

\[
1<\rho_-<r_*<\rho_+<\kappa.
\]

The signed density

\[
d\omega_t(r)=e^{-tr^2}k_t(r)\,dr
\]

has signs \(+,-,+,-\) on the four successive intervals.  Define their
positive masses by

\[
\begin{aligned}
P_0&=\int_0^1d\omega_t,
&
N_1&=-\int_1^{\rho_-}d\omega_t,\\
P_2&=\int_{\rho_-}^{\rho_+}d\omega_t,
&
N_3&=-\int_{\rho_+}^{\infty}d\omega_t.
\end{aligned}
\tag{5.56}
\]

The zero-mass identity (5.48) says

\[
P_0+P_2=N_1+N_3.
\]

First observe the following general four-block implication:

\[
\boxed{P_0>N_1\quad\Longrightarrow\quad\chi'(t)>0.}
\tag{5.57}
\]

Indeed, put \(\delta=P_0-N_1=N_3-P_2>0\).  For

\[
J_t=\int_0^\infty r^2e^{-tr^2}k_t(r)\,dr,
\]

the locations of the four supports give the strict estimates

\[
\int_{(0,1)\cup(1,\rho_-)}r^2\,d\omega_t
<P_0-N_1=\delta
\]

and

\[
\int_{(\rho_-,\rho_+)\cup(\rho_+,\infty)}r^2\,d\omega_t
<\rho_+^2(P_2-N_3)=-\rho_+^2\delta.
\]

Thus

\[
J_t<(1-\rho_+^2)\delta<0,
\]

and (5.48) proves (5.57).

We now establish \(P_0>N_1\) by a compression pairing.  Put

\[
\Delta=\rho_--1,\qquad d=\kappa-1.
\]

Map the whole first negative block

\[
s=1+x,\quad 0<x<\Delta,
\]

onto the exterior positive interval by

\[
r=1-\frac{x}{\Delta}\in(0,1).
\]

Retain only the first positive summand

\[
h_0(r)=(\kappa-r)^{-p}(1-r)^{p-1}
\]

of \(h(r)\) in (5.47).  Including the Jacobian \(dr= -dx/\Delta\),
its transformed density is exactly

\[
h_0\!\left(1-\frac{x}{\Delta}\right)\frac{dx}{\Delta}
=
x^{p-1}\bigl(\Delta d+x\bigr)^{-p}\,dx.
\tag{5.58}
\]

On the other hand,

\[
b(1+x)=x^{p-1}(d-x)^{-p}.
\]

The ratio of the density in (5.58) to \(b(1+x)\) is

\[
E_\Delta(x)=
\left(\frac{d-x}{\Delta d+x}\right)^p,
\tag{5.59}
\]

which is strictly decreasing.  At the right endpoint, the root identity
\(\chi=g(\rho_-)\) gives

\[
\frac{E_\Delta(\Delta)}{\chi}
=
\frac{(\kappa+\rho_-)^p(\rho_-+1)^{1-p}}
{\kappa^p(\rho_--1)}
=:\mathcal F_{\kappa,p}(\rho_-),
\]

where, for \(1<a<\kappa\),

\[
\mathcal F_{\kappa,p}(a)
=
\frac{(\kappa+a)^p(a+1)^{1-p}}
{\kappa^p(a-1)}.
\tag{5.60}
\]

If \(\mathcal F_{\kappa,p}(\rho_-)\ge1\), then
\(E_\Delta(x)>\chi\) for \(0<x<\Delta\).  Since
\(r<1<s\), one also has \(e^{-tr^2}>e^{-ts^2}\).  Pointwise in \(x\),

\[
\begin{aligned}
&e^{-t(1-x/\Delta)^2}
x^{p-1}(\Delta d+x)^{-p}\\
&\quad>
e^{-t(1+x)^2}\chi x^{p-1}(d-x)^{-p}\\
&\quad>
e^{-t(1+x)^2}b(1+x)
\bigl(\chi-g(1+x)\bigr).
\end{aligned}
\tag{5.61}
\]

The last line is precisely the absolute density of the first negative
block.  Integrating (5.61), and recalling that \(P_0\) contains also the
second positive summand of \(h\), proves \(P_0>N_1\).

The function in (5.60) is strictly decreasing in \(a\), because

\[
\begin{aligned}
\partial_a\log\mathcal F_{\kappa,p}(a)
&=
\frac p{\kappa+a}+\frac{1-p}{a+1}-\frac1{a-1}\\
&<
\frac1{a+1}-\frac1{a-1}<0.
\end{aligned}
\tag{5.62}
\]

Since \(\rho_-<r_*\), equations (5.57)--(5.62), together with the two
outer cases (5.49), prove the all-\(t\) cone

\[
\boxed{
\mathcal F_{\kappa,p}(r_*)\ge1
\quad\Longrightarrow\quad
\chi'(t)>0\quad(t>0)
\quad\Longrightarrow\quad
\left(G_p/\kappa+G_{1-p}\right)^2\in GGC.
}
\tag{5.63}
\]

The endpoints \(\chi=0\) and \(\chi=g_*\) are already strict in WIP-5.9,
so no limiting \(t\)-case is omitted.

A first elementary subcone follows from \(r_*\le2\).  Indeed, every factor
in \(\mathcal F_{\kappa,p}(2)\) is greater than one, and (5.62) gives
\(\mathcal F_{\kappa,p}(r_*)>1\).  By (5.51),

\[
r_*\le2
\quad\Longleftrightarrow\quad
(1-p)(\kappa^2-4)\le3p\kappa.
\tag{5.64}
\]

For \(\kappa>2\), this is equivalently

\[
p\ge\frac{\kappa^2-4}{\kappa^2+3\kappa-4},
\]

or

\[
\kappa\le
\frac{3p+\sqrt{9p^2+16(1-p)^2}}{2(1-p)}.
\]

There is a much stronger uniform analytic consequence.  Solving the
stationary-point relation (5.51) for the weights gives

\[
p=
\frac{\kappa^2-r_*^2}
{(\kappa-1)(r_*^2+\kappa)},
\qquad
1-p=
\frac{\kappa(r_*^2-1)}
{(\kappa-1)(r_*^2+\kappa)}.
\tag{5.65}
\]

Set

\[
A=\frac{\kappa+r_*}{\kappa},
\qquad
B=r_*+1.
\]

Then

\[
\frac pA+\frac{1-p}{B}
=\frac{\kappa}{r_*^2+\kappa}.
\]

The weighted geometric-mean/harmonic-mean inequality therefore yields

\[
A^pB^{1-p}
\ge
\left(\frac pA+\frac{1-p}{B}\right)^{-1}
=1+\frac{r_*^2}{\kappa},
\]

and hence

\[
\boxed{
\mathcal F_{\kappa,p}(r_*)
\ge
\frac{1+r_*^2/\kappa}{r_*-1}.
}
\tag{5.66}
\]

The right side is at least one whenever

\[
r_*^2-\kappa r_*+2\kappa\ge0.
\]

For \(\kappa\le8\), the quadratic in \(r_*\) has discriminant
\(\kappa(\kappa-8)\le0\).  At the only possible equality
\((\kappa,r_*)=(8,4)\), the weighted GM--HM inequality is itself strict,
since \(A\ne B\) and \(0<p<1\).  Thus (5.63) proves, entirely
analytically,

\[
\boxed{
0<p<1,\qquad 1<\kappa\le8
\quad\Longrightarrow\quad
\left(G_p/\kappa+G_{1-p}\right)^2\in GGC.
}
\tag{5.67}
\]

For the symmetric benchmark \(p=1/2\), the exact cone (5.63) is larger
still.  Here \(r_*=\sqrt\kappa=:s\), and

\[
\mathcal F_{\kappa,1/2}(r_*)
=\frac{s+1}{\sqrt s\,(s-1)}.
\]

Since both sides are positive,

\[
\mathcal F_{\kappa,1/2}(r_*)\ge1
\quad\Longleftrightarrow\quad
s^3-3s^2-s-1\le0.
\tag{5.68}
\]

Let

\[
s_0=
1+
\sqrt[3]{2+\sqrt{44/27}}
+
\sqrt[3]{2-\sqrt{44/27}},
\tag{5.69}
\]

the unique root greater than one of \(s^3-3s^2-s-1\).  Then

\[
\boxed{
p=\frac12,\qquad
\kappa\le s_0^2
\quad\Longrightarrow\quad
\left(G_{1/2}/\kappa+G_{1/2}\right)^2\in GGC.
}
\tag{5.70}
\]

Finally, a finite exact polynomial certificate improves the uniform
constant \(8\) to \(10\).  This is a Bernstein-basis polynomial
positivity certificate, not an appeal to the theory of Bernstein
functions.

Fix \(\kappa=10\) and parameterize the stationary point by
\(a=r_*\in(1,10)\).  With \(q=1-p\), equation (5.65) becomes

\[
p=\frac{100-a^2}{9(a^2+10)},
\qquad
q=\frac{10(a^2-1)}{9(a^2+10)}.
\tag{5.71}
\]

For

\[
x=\frac{10(a+1)}{10+a},
\qquad
y=1-\frac1x=\frac{9a}{10(a+1)},
\]

the ratio of the weighted geometric mean \(A^pB^q\) to the weighted
harmonic mean \(H=(a^2+10)/10\) has the positive expansion

\[
\begin{aligned}
\frac{A^pB^q}{H}
&=x^q\left(p+\frac qx\right)
=(1-y)^{-q}(1-qy)\\
&=
1+\sum_{n=2}^\infty
\frac{p(n-1)(q)_{n-1}}{n!}y^n,
\end{aligned}
\tag{5.72}
\]

where \((q)_m=q(q+1)\cdots(q+m-1)\).  All omitted terms are strictly
positive.  Define the fifth-order lower truncation \(S_5\) of (5.72) and

\[
C(a)=(a^2+10)S_5-10(a-1).
\tag{5.73}
\]

Thus

\[
C(a)>0
\Longrightarrow
A^pB^q>HS_5>a-1
\Longrightarrow
\mathcal F_{10,p}(a)>1.
\tag{5.74}
\]

Direct rational simplification gives

\[
C(a)=
\frac{P(a)}{(a^2+10)^4(a+1)^5},
\tag{5.75}
\]

where the degree-\(15\) power-basis coefficient vector of \(P\) is

\[
\begin{aligned}
(&200000,900000,1585000,4177000/3,2092550/3,826894/3,\\
&1167379/12,2409571/300,-277541/240,2207843/6000,\\
&-3974833/2400,24698557/60000,-1971667/12000,\\
&11717699/300000,-32059/6000,113183/150000).
\end{aligned}
\tag{5.76}
\]

The power-basis coefficients are not all positive.  Convert \(P\) instead
to the degree-\(15\) Bernstein basis separately on
\([1,4]\), \([4,7]\), and \([7,10]\).  All \(16\) coefficients on each
interval are strictly positive; their exact respective minima are

\[
5153632,\qquad
\frac{225158158912}{625},\qquad
\frac{5774529486941441}{3125}.
\tag{5.77}
\]

Since every Bernstein basis polynomial is nonnegative on its defining
interval, (5.77) proves \(P(a)>0\) on \([1,10]\), and hence (5.74).
The script
[route5_beta_faddeeva_kappa10_bernstein.py](../computations/route5_beta_faddeeva_kappa10_bernstein.py)
constructs \(S_5\) directly from the rational functions in (5.71)--(5.73),
cross-multiplies to verify every coefficient in (5.76), performs the
three exact basis conversions, and checks (5.77), using only
fractions.Fraction arithmetic.

It remains to propagate the endpoint certificate from \(\kappa=10\) to
smaller contrasts.  For fixed \(p\),

\[
\frac{\partial r_*^2}{\partial\kappa}
=
\frac{(1-p)\bigl(2(1-p)\kappa+p+p\kappa^2\bigr)}
{(1-p+p\kappa)^2}>0,
\tag{5.78}
\]

while, at fixed \(a\),

\[
\partial_\kappa\log\mathcal F_{\kappa,p}(a)
=-\frac{pa}{\kappa(\kappa+a)}<0.
\tag{5.79}
\]

Together with (5.62), these show that
\(\mathcal F_{\kappa,p}(r_*(p,\kappa))\) is strictly decreasing in
\(\kappa\).  Equations (5.63), (5.71)--(5.79) therefore prove the uniform
two-rate theorem

\[
\boxed{
0<p<1,\qquad 1<\kappa\le10
\quad\Longrightarrow\quad
\left(G_p/\kappa+G_{1-p}\right)^2\in GGC.
}
\tag{5.80}
\]

The current explicit parameter region is at least the union

\[
\boxed{
\mathcal F_{\kappa,p}(r_*)\ge1
\quad\text{or}\quad
p(\kappa-1)\le1.
}
\tag{5.81}
\]

The second condition is the independent tilted-mean cone (5.34f), and is
still stronger for sufficiently small \(p\) at large \(\kappa\).  Beyond
this union, the coarser pointwise compression used in this entry gives no
answer.  WIP-5.11 below uses the true first-negative-lobe density and
removes the parameter restriction completely.

<a id="wip-5-11"></a>
### WIP-5.11 — exact true-lobe comparison closes the two-rate,
total-shape-one case

**Status: [PROVED ROUTE-5 THEOREM FOR ALL COMPLEMENTARY SHAPES AND ALL
RATE CONTRASTS].**

Continue with (5.45)--(5.49).  The cases
\(\chi(t)\le0\) and \(\chi(t)\ge g_*\), including equality, are already
strict by (5.49).  Fix \(t>0\) in the only remaining case

\[
0<\chi(t)<g_*.
\]

Let \(a=\rho_-(t)\) be the lower root of \(g(r)=\chi(t)\), so
\(1<a<r_*\).  Although \(a\) and \(\chi\) depend on \(t\), all
comparisons below are made with this \(t\), \(a\), and \(\chi\) fixed; no
derivative of a root is taken.

Define the corresponding masses after removing only the exponential
weight:

\[
\widehat P_0=\int_0^1h(r)\,dr,
\qquad
\widehat N_1=\int_1^a b(s)\bigl(\chi-g(s)\bigr)\,ds.
\tag{5.82}
\]

On their respective supports \(0<r<1<s<a\).  Since both unweighted
densities are strictly positive on open intervals,

\[
P_0(t)>e^{-t}\widehat P_0,
\qquad
N_1(t)<e^{-t}\widehat N_1.
\tag{5.83}
\]

Thus it is enough to prove
\(\widehat P_0>\widehat N_1\).

Put

\[
h_0(r)=(\kappa-r)^{-p}(1-r)^{p-1},
\qquad
h_1(r)=(\kappa+r)^{-p}(r+1)^{p-1}.
\]

On \((0,1)\), \(h=h_0+h_1\); on \((1,\kappa)\), one has
\(h=bg=h_1\).  Therefore

\[
\widehat P_0-\widehat N_1
=
\int_0^1h_0(r)\,dr
+\int_0^a h_1(r)\,dr
-\chi\int_1^a b(s)\,ds.
\tag{5.84}
\]

Three Möbius substitutions put the terms in common coordinates.  First,
\(x=(1-r)/(\kappa-r)\) gives

\[
\int_0^1h_0(r)\,dr
=
\int_0^{1/\kappa}\frac{x^{p-1}}{1-x}\,dx.
\]

Second, \(z=(r+1)/(\kappa+r)\) gives, with

\[
z_a=\frac{a+1}{\kappa+a},
\]

the adjoining interval

\[
\int_0^a h_1(r)\,dr
=
\int_{1/\kappa}^{z_a}\frac{z^{p-1}}{1-z}\,dz.
\]

Third, \(v=(s-1)/(\kappa-s)\) gives, with

\[
v_a=\frac{a-1}{\kappa-a},
\]

\[
\int_1^a b(s)\,ds
=
\int_0^{v_a}\frac{v^{p-1}}{1+v}\,dv.
\tag{5.85}
\]

All endpoints stay away from the poles, and \(p\in(0,1)\) makes the
origin singularities integrable.  The first two integrals in (5.84)
therefore concatenate exactly:

\[
\int_0^1h_0(r)\,dr+\int_0^a h_1(r)\,dr
=
\int_0^{z_a}\frac{z^{p-1}}{1-z}\,dz.
\]

Let \(q=1-p\) and \(\lambda=\chi^{1/p}>0\).  Since
\(\chi=g(a)\),

\[
\lambda
=
\frac{\kappa-a}{\kappa+a}
\left(\frac{a-1}{a+1}\right)^{q/p}.
\tag{5.86}
\]

In the final integral of (5.85), substitute \(z=\lambda v\).  Since
\(\chi\lambda^{-p}=1\),

\[
\chi\int_0^{v_a}\frac{v^{p-1}}{1+v}\,dv
=
\int_0^{w_a}\frac{z^{p-1}}{1+z/\lambda}\,dz,
\qquad
w_a=\lambda v_a.
\tag{5.87}
\]

The endpoint ratio simplifies without an estimate:

\[
\boxed{
\frac{w_a}{z_a}
=
\left(\frac{a-1}{a+1}\right)^{1/p}<1.
}
\tag{5.88}
\]

Hence \(0<w_a<z_a<1\).  Moreover, for \(0<z<w_a\),

\[
\frac1{1+z/\lambda}<\frac1{1-z}.
\]

Substitution in (5.84) now gives the manifestly positive decomposition

\[
\begin{aligned}
\widehat P_0-\widehat N_1
={}&
\int_0^{w_a}z^{p-1}
\left(
\frac1{1-z}-\frac1{1+z/\lambda}
\right)\,dz\\
&+
\int_{w_a}^{z_a}\frac{z^{p-1}}{1-z}\,dz
>0.
\end{aligned}
\tag{5.89}
\]

Equations (5.83) and (5.89) prove \(P_0(t)>N_1(t)\).  The general
four-block implication (5.57) therefore yields \(\chi'(t)>0\) throughout
the interior case.  Combining this with (5.49) proves

\[
\boxed{
\chi'(t)>0
\qquad
(t>0,\ 0<p<1,\ \kappa>1).
}
\tag{5.90}
\]

Finally, (5.40)--(5.41), the averaged-kernel equivalence (5.13a), and the
phase criterion give the complete two-rate theorem

\[
\boxed{
\left(G_p/\kappa+G_{1-p}\right)^2\in GGC
\qquad
(0<p<1,\ \kappa>1).
}
\tag{5.91}
\]

Scaling and relabeling the rates gives the invariant form

\[
\boxed{
\left(\frac{G_p}{b_1}+\frac{G_{1-p}}{b_2}\right)^2\in GGC
\qquad
(0<p<1,\ b_1,b_2>0).
}
\tag{5.92}
\]

This settles the entire two-rate, total-shape-one square problem, including
the half-shape benchmark at arbitrary rate contrast.  At this stage it did
not yet supply an invariant under a further shape-changing or third-rate
update.  WIP-5.26 subsequently closes the finite third-rate and multirate
updates at total shape one, WIP-5.29 propagates that theorem to smaller
total shape, and WIP-5.30 closes all two-rate squares; Bondesson's full
power conjecture remains open.
