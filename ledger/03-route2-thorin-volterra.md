# Route 2: Thorin boundary phases and Volterra kernels

Boundary-value recognition, covariance and Stein reductions, Volterra criteria, asymptotics, and exact contrast splices.

Entries: WIP-2.1, WIP-2.2, WIP-2.3, WIP-2.4, WIP-2.5, WIP-2.6, WIP-2.7, WIP-2.8, WIP-2.9, WIP-2.10, WIP-2.11, WIP-2.12, WIP-2.13, WIP-2.14.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

Original WIP identifiers and equation numbers are preserved. Positional words such as "above" and "below" refer to the original numbered proof sequence.


## Route 2: Thorin/Volterra analysis

<a id="wip-2-1"></a>
### WIP-2.1 — exact half-shape benchmark and its exponential mixture

**Status: [PROVED].**

Take independent

\[
X_i\sim\Gamma(1/2,b_i)
\]

in the rate convention. Direct convolution gives

\[
f_X(x)=
\sqrt{b_1b_2}\,
e^{-(b_1+b_2)x/2}
I_0\left(\frac{b_1-b_2}{2}x\right).
\tag{2.1}
\]

For reciprocal rates

\[
b_1=e^\theta,\qquad b_2=e^{-\theta},\qquad \theta>0,
\]

put

\[
a=\cosh\theta,\qquad c=\sinh\theta.
\]

For later use, set

\[
D_\varphi:=a-c\cos\varphi.
\tag{2.2a}
\]

Then \(a^2-c^2=1\),
\(D_\varphi\in[e^{-\theta},e^\theta]\), and

\[
f_X(x)=\frac1\pi\int_0^\pi e^{-D_\varphi x}\,d\varphi.
\tag{2.2b}
\]

Then

\[
f_X(x)=e^{-ax}I_0(cx).
\tag{2.2}
\]

For \(Y=X^2\),

\[
f_Y(y)=
\frac1{2\sqrt y}e^{-a\sqrt y}I_0(c\sqrt y).
\tag{2.3}
\]

Using

\[
I_0(z)=\frac1\pi\int_0^\pi e^{z\cos\varphi}\,d\varphi
\]

and, for \(d>0\),

\[
y^{-1/2}e^{-d\sqrt y}
=
\frac1{\sqrt\pi}
\int_0^\infty
t^{-1/2}e^{-d^2/(4t)}e^{-ty}\,dt,
\tag{2.4}
\]

we obtain the exact Bernstein representation

\[
f_Y(y)=\int_0^\infty e^{-ty}m_\theta(t)\,dt,
\tag{2.5}
\]

where

\[
\boxed{
m_\theta(t)=
\frac{t^{-1/2}}{2\pi^{3/2}}
\int_0^\pi
\exp\left\{
-\frac{(\cosh\theta-\sinh\theta\cos\varphi)^2}{4t}
\right\}
d\varphi.
}
\tag{2.6}
\]

The integrand is nonnegative and
\(\cosh\theta-\sinh\theta\cos\varphi\ge e^{-\theta}>0\).
Moreover,

\[
\int_0^\infty\frac{m_\theta(t)}t\,dt
=
\frac1\pi\int_0^\pi\frac{d\varphi}{D_\varphi}
=
\frac1{\sqrt{a^2-c^2}}=1.
\tag{2.6a}
\]

Thus \(f_Y\) is completely monotone and

\[
\psi_Y(s)=
\int_0^\infty\frac{m_\theta(t)}{s+t}\,dt
\tag{2.7}
\]

is a Stieltjes function. This proves that \(Y\) is a mixture of
exponentials.  The Goldie--Steutel theorem therefore also proves that
\(Y\) is infinitely divisible; it does **not** prove that \(Y\) is GGC.
The precise source used here is Steutel--van Harn (2004), Chapter III,
Theorem 10.7.

<a id="wip-2-2"></a>
### WIP-2.2 — explicit negative-axis boundary values

**Status: [PROVED].**

For \(d>0\), define

\[
J_d(s):=\int_0^\infty e^{-s z^2-dz}\,dz
=
\frac{\sqrt\pi}{2\sqrt s}
e^{d^2/(4s)}
\operatorname{erfc}\!\left(\frac d{2\sqrt s}\right),
\qquad \Re s>0.
\tag{2.8}
\]

Continue with the principal square root.  Since
\(\sqrt{-x+i0}=i\sqrt x\), for \(x>0\)

\[
J_d(-x+i0)
=
\frac{\sqrt\pi}{2\sqrt x}
e^{-d^2/(4x)}
\left[
\operatorname{erfi}\!\left(\frac d{2\sqrt x}\right)-i
\right].
\tag{2.9}
\]

Put

\[
u=\frac1{2\sqrt x},\qquad
\langle H(D)\rangle
:=\frac1\pi\int_0^\pi H(D_\varphi)\,d\varphi .
\tag{2.10}
\]

Equations (2.2b) and (2.9), with Tonelli first in the right half-plane and
then analytic continuation, give

\[
\psi_Y(-x+i0)=A_\theta(x)-iB_\theta(x),
\tag{2.11}
\]

where

\[
\boxed{
A_\theta(x)=
\frac{\sqrt\pi}{2\sqrt x}
\left\langle
e^{-u^2D^2}\operatorname{erfi}(uD)
\right\rangle
}
\tag{2.12}
\]

and

\[
\boxed{
B_\theta(x)=
\frac{\sqrt\pi}{2\sqrt x}
\left\langle e^{-u^2D^2}\right\rangle
=\pi m_\theta(x).
}
\tag{2.13}
\]

In particular \(A_\theta(x)>0\) and \(B_\theta(x)>0\) for every \(x>0\).
This removes the possible boundary-argument branch ambiguity.  It also
recovers the principal-value identity

\[
A_\theta(x)
=
\operatorname{PV}\int_0^\infty
\frac{m_\theta(t)}{t-x}\,dt.
\tag{2.14}
\]

<a id="wip-2-3"></a>
### WIP-2.3 — the phase criterion and a principal-value-free target

**Status: [PROVED REDUCTION], using established CBF/TBF representation
theorems cited below.**

Let \(F_\theta=1/\psi_Y\).  A nonzero Stieltjes function has a complete
Bernstein reciprocal.  Define its normalized boundary phase by

\[
\vartheta_\theta(x)
:=
\frac1\pi\arg F_\theta(-x+i0)
=
-\frac1\pi\arg\psi_Y(-x+i0).
\tag{2.15}
\]

Since (2.12)--(2.13) are strictly positive,

\[
\boxed{
\vartheta_\theta(x)
=
\frac1\pi\arctan\frac{B_\theta(x)}{A_\theta(x)}
\in(0,1/2).
}
\tag{2.16}
\]

The canonical phase representation gives, up to an irrelevant real
constant,

\[
\log F_\theta(s)
=
C_\theta+
\int_0^\infty
\left(\frac{t}{1+t^2}-\frac1{s+t}\right)
\vartheta_\theta(t)\,dt.
\tag{2.17}
\]

For a general CBF, the phase in this representation is determined only
almost everywhere.  Here the explicit positive, smooth boundary values
(2.12)--(2.13) select a continuous representative, so the pointwise
differentiation below is legitimate.

Because \(F_\theta(0)=1\), subtracting the value at zero in (2.17) gives
the normalized identity

\[
\log F_\theta(s)
=
\int_0^\infty
\frac{s}{t(s+t)}\vartheta_\theta(t)\,dt.
\tag{2.17a}
\]

Consequently

\[
g_\theta(s):=
-\frac{\psi_Y'(s)}{\psi_Y(s)}
=
\int_0^\infty
\frac{\vartheta_\theta(t)}{(s+t)^2}\,dt.
\tag{2.18}
\]

Direct endpoint analysis below gives

\[
\vartheta_\theta(0+)=0,\qquad
\vartheta_\theta(\infty)=\frac12.
\tag{2.19}
\]

The phase is smooth in this model.  Integrating (2.18) by parts therefore
shows

\[
\boxed{
Y\in GGC
\quad\Longleftrightarrow\quad
\vartheta_\theta'(t)\ge0\quad(t>0).
}
\tag{2.20}
\]

If this holds, the Thorin measure is

\[
U_\theta(dt)=\vartheta_\theta'(t)\,dt,
\qquad U_\theta((0,\infty))=\frac12.
\tag{2.21}
\]

Here none of the endpoint conditions is implicit.  Remark 6.11 in the
cited source gives

\[
\int_0^1\frac{\vartheta_\theta(t)}t\,dt<\infty.
\tag{2.21a}
\]

If \(\vartheta_\theta\) is nondecreasing, integration by parts implies the
required logarithmic integrability of \(d\vartheta_\theta\) at zero, while
its bound by \(1/2\) gives the required \(t^{-1}\)-integrability at
infinity.  Also \(\log F_\theta(0)=0\) excludes a killing constant,
\(g_\theta(0)=\mathbb E[Y]<\infty\) excludes an \(a/s\) term, and
\(g_\theta(s)\sim(2s)^{-1}\) excludes linear drift.  Thus (2.20) is an
equivalence for this model, not merely a sufficient condition.

The external analytic inputs in this paragraph are
Schilling--Song--Vondraček (2010), Theorem 7.3, p. 63
(nonzero Stieltjes reciprocal \(\Longleftrightarrow\) nonzero CBF),
Theorem 6.10, pp. 58--60 (canonical phase representation), and
Theorem 8.2, pp. 73--75 (Thorin--Bernstein characterization, including
the nondecreasing cumulative Thorin function).

Differentiating (2.16) also yields the Wronskian form

\[
\boxed{
\vartheta_\theta'(x)
=
\frac{
A_\theta(x)m_\theta'(x)-m_\theta(x)A_\theta'(x)
}{
A_\theta(x)^2+\pi^2m_\theta(x)^2
}.
}
\tag{2.22}
\]

There is a more useful formulation without a principal value.  Define

\[
Q_\theta(u):=
\left\langle e^{-u^2D^2}\right\rangle,
\qquad
N_\theta(u):=
\left\langle
e^{-u^2D^2}\operatorname{erfi}(uD)
\right\rangle,
\tag{2.23}
\]

and

\[
\mathcal R_\theta(u):=\frac{N_\theta(u)}{Q_\theta(u)}
=\frac{A_\theta(x)}{B_\theta(x)}.
\tag{2.24}
\]

Since \(x=1/(4u^2)\),

\[
\boxed{
\vartheta_\theta'(x)
=
\frac{2u^3\mathcal R_\theta'(u)}
{\pi(1+\mathcal R_\theta(u)^2)}.
}
\tag{2.25}
\]

Thus the entire two-gamma benchmark is equivalent to the single real
inequality

\[
\boxed{
X^2\in GGC
\quad\Longleftrightarrow\quad
\mathcal R_\theta'(u)\ge0
\quad\text{for every }u>0.
}
\tag{2.26}
\]

> **[OPEN STEP R2-A]** Prove or disprove (2.26).  This supersedes direct
> differentiation of the principal-value integral (2.14).

<a id="wip-2-4"></a>
### WIP-2.4 — covariance and tilted-arcsine Stein formulations

**Status: [PROVED REDUCTION].**

On angle space introduce the tilted probability law

\[
\nu_u(d\varphi)
=
\frac{e^{-u^2D_\varphi^2}}{Q_\theta(u)}
\frac{d\varphi}{\pi}.
\tag{2.27}
\]

The elementary derivative

\[
\frac d{du}
\left[
e^{-u^2D^2}\operatorname{erfi}(uD)
\right]
=
\frac{2D}{\sqrt\pi}
-2uD^2e^{-u^2D^2}\operatorname{erfi}(uD)
\]

and \(\langle D\rangle=a\) give

\[
\boxed{
\mathcal R_\theta'(u)
=
\frac{2a}{\sqrt\pi\,Q_\theta(u)}
-2u\,\operatorname{Cov}_{\nu_u}
\left(D^2,\operatorname{erfi}(uD)\right).
}
\tag{2.28}
\]

Hence the remaining assertion is exactly the quantitative covariance bound

\[
\boxed{
uQ_\theta(u)\,
\operatorname{Cov}_{\nu_u}
\left(D^2,\operatorname{erfi}(uD)\right)
\le\frac a{\sqrt\pi}.
}
\tag{2.29}
\]

Ordinary Chebyshev association only says that the covariance is
nonnegative, which is the wrong direction for (2.29).  The untilted
arcsine image \(D=a-c\cos\varphi\) satisfies

\[
\boxed{
\left\langle(D-a)H(D)\right\rangle
=
\left\langle
\bigl(c^2-(D-a)^2\bigr)H'(D)
\right\rangle.
}
\tag{2.30}
\]

> **[OPEN STEP R2-B]** Derive the Stein kernel of the tilted law
> \(\nu_u\) and use it to prove (2.29), or locate a parameter pair where
> (2.29) is strictly reversed.

<a id="wip-2-5"></a>
### WIP-2.5 — endpoint positivity and the solved equal-rate case

**Status: [PROVED].**

As \(u\downarrow0\), Taylor expansion under the bounded \(D\)-integral gives

\[
\mathcal R_\theta(u)
=
\frac{2a}{\sqrt\pi}u+O(u^3),
\qquad
\mathcal R_\theta'(u)
=
\frac{2a}{\sqrt\pi}+O(u^2)>0
\tag{2.31}
\]

for all sufficiently small \(u>0\).

For \(\theta>0\), let \(d_0=a-c=e^{-\theta}\).  Endpoint Laplace expansion,
applied also after differentiation, gives as \(u\to\infty\)

\[
Q_\theta(u)
\sim
\frac{e^{-d_0^2u^2}}
{2\sqrt\pi\,u\sqrt{d_0c}},
\qquad
N_\theta(u)\sim\frac1{\sqrt\pi u},
\tag{2.32}
\]

where the second equivalence uses
\(\langle D^{-1}\rangle=(a^2-c^2)^{-1/2}=1\).  Therefore

\[
\frac{Q_\theta'(u)}{Q_\theta(u)}
=-2d_0^2u-\frac1u+O(u^{-3}),
\qquad
\frac{N_\theta'(u)}{N_\theta(u)}
=-\frac1u+O(u^{-3}).
\tag{2.32a}
\]

For completeness, these differentiated estimates do not follow merely by
differentiating the symbols in (2.32).  Write

\[
D_\varphi^2-d_0^2=d_0c\,\varphi^2+O(\varphi^4)
\quad(\varphi\downarrow0).
\]

After \(z=u\varphi\), Gaussian domination on a fixed endpoint
neighborhood, together with an exponentially small bound on its
complement, gives the \(u^{-1}(1+O(u^{-2}))\) expansion for \(Q_\theta\)
and the same expansion after one \(u\)-derivative.  For \(N_\theta\), the
uniform large-\(z\) expansion

\[
e^{-z^2}\operatorname{erfi}(z)
=
\frac1{\sqrt\pi z}
\left(1+\frac1{2z^2}+O(z^{-4})\right),
\qquad z=uD\ge ud_0,
\]

may likewise be differentiated uniformly.  Averaging and using
\(\langle D^{-1}\rangle=1\) proves (2.32a).  Hence

\[
\mathcal R_\theta(u)
\sim
2\sqrt{d_0c}\,e^{d_0^2u^2},
\qquad
\frac{\mathcal R_\theta'(u)}{\mathcal R_\theta(u)}
=2d_0^2u+O(u^{-3})>0
\tag{2.33}
\]

for all sufficiently large \(u\).  Thus for each fixed \(\theta>0\), a
failure of phase monotonicity can occur only in a compact intermediate
\(u\)-interval.

When \(\theta=0\), \(D\equiv1\), so

\[
\mathcal R_0(u)=\operatorname{erfi}(u),
\qquad
\mathcal R_0'(u)=\frac2{\sqrt\pi}e^{u^2}>0.
\tag{2.34}
\]

This equal-rate case is GGC, with the explicit Thorin density

\[
\boxed{
\vartheta_0'(x)=
\frac{e^{1/(4x)}}
{2\pi^{3/2}x^{3/2}
\left[
1+\operatorname{erfi}\!\left(\frac1{2\sqrt x}\right)^2
\right]}.
}
\tag{2.35}
\]

<a id="wip-2-6"></a>
### WIP-2.6 — the HCM-density shortcut genuinely fails

**Status: [PROVED].**

The unequal-rate benchmark is not always covered by the known
HCM-density power theorem.  In fact, take \(\theta=3\) and set
\(\ell(z)=\log I_0(z)\), \(r(z)=I_1(z)/I_0(z)\).  The modified Bessel
equation gives

\[
z\ell'(z)+z^2\ell''(z)=z^2(1-r(z)^2).
\tag{2.36}
\]

For \(y_0=4/c^2\), differentiate
\(f_Y(y_0v)f_Y(y_0/v)\) with respect to
\(w=v+v^{-1}\) at \(w=2\).  The logarithmic derivative is

\[
\left.
\frac d{dw}
\log\!\left[f_Y(y_0v)f_Y(y_0/v)\right]
\right|_{w=2}
=
\frac12
\left[
-\coth\theta
+2\left(1-\frac{I_1(2)^2}{I_0(2)^2}\right)
\right].
\tag{2.37}
\]

The power series show \(I_1(2)/I_0(2)<7/10\): indeed

\[
7I_0(2)-10I_1(2)
=
\sum_{j=0}^\infty
\frac{7-10/(j+1)}{(j!)^2}>0,
\tag{2.38}
\]

because the sum through \(j=3\) is \(1/24>0\) and every later term is
positive.  Also the exponential series gives \(e^6>201\), hence

\[
\coth3=1+\frac2{e^6-1}<\frac{101}{100},
\qquad
2\left(1-\frac{I_1(2)^2}{I_0(2)^2}\right)>\frac{51}{50}.
\]

Thus (2.37) is strictly positive at \(\theta=3\).  An HCM density would
make \(f_Y(y_0v)f_Y(y_0/v)\) completely monotone, hence nonincreasing, as a
function of \(w\).  Therefore

\[
\boxed{
\theta=3\quad\Longrightarrow\quad f_{X^2}\text{ is not HCM}.
}
\tag{2.39}
\]

This does not refute \(X^2\in GGC\); it proves that the phase/Thorin route
is not redundant with the standard HCM-density closure theorem.

<a id="wip-2-7"></a>
### WIP-2.7 — Volterra kernel ledger

**Status: [PROVED REDUCTION], with the same cited canonical-representation
input as WIP-2.3.**

Taking inverse Laplace transforms in
\(-\psi_Y'=g_\theta\psi_Y\) gives

\[
yf_Y(y)=\int_0^y k_\theta(y-z)f_Y(z)\,dz,
\tag{2.40}
\]

where (2.18) yields the positive kernel

\[
\boxed{
k_\theta(y)=
y\int_0^\infty e^{-ty}\vartheta_\theta(t)\,dt>0.
}
\tag{2.41}
\]

Moreover,

\[
k_\theta\text{ is completely monotone}
\quad\Longleftrightarrow\quad
\vartheta_\theta\text{ is nondecreasing}.
\tag{2.42}
\]

Under these equivalent conditions,

\[
k_\theta(y)=
\int_0^\infty e^{-ty}\vartheta_\theta'(t)\,dt.
\tag{2.43}
\]

Useful checks are

\[
k_\theta(0+)=\frac12,\qquad
\int_0^\infty k_\theta(y)\,dy
=g_\theta(0)=\mathbb E[X^2]=3a^2-1,
\tag{2.44}
\]

and, as \(y\downarrow0\),

\[
k_\theta(y)
=
\frac12-\frac a\pi\sqrt y
+\left(
\frac{a^2}{4}+\frac{c^2}{8}-\frac{a^2}{2\pi}
\right)y
+O(y^{3/2}).
\tag{2.45}
\]

<a id="wip-2-8"></a>
### WIP-2.8 — a rigorous large-contrast transition asymptotic

**Status: [PROVED].**

Let

\[
\varrho=e^\theta,\qquad
\varepsilon=\varrho^{-2/3},
\qquad
u=\lambda\varrho^{1/3},
\]

and fix a compact interval
\(K=[\lambda_0,\lambda_1]\Subset(0,\infty)\).  Write Dawson's integral as

\[
\operatorname{Daw}(x)
=e^{-x^2}\int_0^x e^{t^2}\,dt
=\frac{\sqrt\pi}{2}e^{-x^2}\operatorname{erfi}(x).
\]

Then, uniformly for \(\lambda\in K\),

\[
\boxed{
\mathcal R_\theta(\lambda\varrho^{1/3})
=1+
\frac{4\Gamma(3/4)}{\Gamma(1/4)}
\lambda\varepsilon
+O_K(\varepsilon^2)
}
\tag{2.46}
\]

in \(C^1(K)\), where the derivative in this statement is with respect to
\(\lambda\).  Consequently, when the prime denotes differentiation in
\(u\) at fixed \(\theta\),

\[
\boxed{
\mathcal R_\theta'(\lambda\varrho^{1/3})
=
\frac{4\Gamma(3/4)}{\Gamma(1/4)}\varrho^{-1}
+O_K(\varrho^{-5/3}).
}
\tag{2.47}
\]

In particular, (2.26) holds throughout every full transition window

\[
u\in[
\lambda_0\varrho^{1/3},
\lambda_1\varrho^{1/3}]
\]

once \(\theta\) is sufficiently large, with the threshold depending only
on \(K\).

To prove this, put \(t=\tan(\varphi/2)\) and then \(t=\varepsilon s\).
The exact identities are

\[
D_\varphi=
\frac{\varrho^{-1}+\varrho t^2}{1+t^2},
\qquad
uD_\varphi=
\lambda\frac{s^2+\varepsilon}{1+\varepsilon^2s^2}
=:x_\varepsilon(s,\lambda),
\qquad
\frac{d\varphi}{\pi}
=\frac{2\varepsilon}{\pi}
\frac{ds}{1+\varepsilon^2s^2}.
\]

Define

\[
\widehat Q_\varepsilon(\lambda)
:=
\int_0^\infty
\frac{e^{-x_\varepsilon(s,\lambda)^2}}
{1+\varepsilon^2s^2}\,ds,
\qquad
\widehat A_\varepsilon(\lambda)
:=
\int_0^\infty
\frac{\operatorname{Daw}(x_\varepsilon(s,\lambda))}
{1+\varepsilon^2s^2}\,ds.
\]

The common Jacobian factor cancels from the ratio, giving

\[
\mathcal R_\theta(\lambda\varrho^{1/3})
=
\frac2{\sqrt\pi}
\frac{\widehat A_\varepsilon(\lambda)}
{\widehat Q_\varepsilon(\lambda)}.
\tag{2.48}
\]

At \(\varepsilon=0\),
\(x_0(s,\lambda)=\lambda s^2\) and
\(\partial_\varepsilon x_\varepsilon|_{\varepsilon=0}=\lambda\).
Differentiation under the integral sign gives, in \(C^1(K)\),

\[
\widehat Q_\varepsilon(\lambda)
=
\frac{\Gamma(1/4)}{4\sqrt\lambda}
-\varepsilon
\frac{\Gamma(3/4)}2\sqrt\lambda
+O_K(\varepsilon^2),
\tag{2.49}
\]

and

\[
\widehat A_\varepsilon(\lambda)
=
\frac{\sqrt\pi\Gamma(1/4)}{8\sqrt\lambda}
+\varepsilon
\frac{\sqrt\pi\Gamma(3/4)}4\sqrt\lambda
+O_K(\varepsilon^2).
\tag{2.50}
\]

The four constants used here are

\[
\begin{aligned}
\int_0^\infty e^{-\lambda^2s^4}\,ds
&=\frac{\Gamma(1/4)}{4\sqrt\lambda},\\
-2\lambda^2\int_0^\infty
s^2e^{-\lambda^2s^4}\,ds
&=-\frac{\Gamma(3/4)}2\sqrt\lambda,\\
\int_0^\infty\operatorname{Daw}(\lambda s^2)\,ds
&=\frac{\sqrt\pi\Gamma(1/4)}{8\sqrt\lambda},\\
\lambda\int_0^\infty
\operatorname{Daw}'(\lambda s^2)\,ds
&=\frac{\sqrt\pi\Gamma(3/4)}4\sqrt\lambda.
\end{aligned}
\tag{2.51}
\]

The last two identities follow from

\[
\operatorname{Daw}(x)
=x\int_0^1e^{-x^2(1-v^2)}\,dv,
\]

Tonelli's theorem, and the beta integral; for the derivative integral one
may first integrate by parts, with vanishing boundary terms.

For clarity, the remainder in (2.49)--(2.50) is not a formal
differentiation of a nonuniform asymptotic.  On a fixed bounded
\(s\)-interval, the integrands and the required
\((\varepsilon,\lambda)\)-derivatives are smooth.  On the tail use

\[
\operatorname{Daw}^{(j)}(x)
=
\frac{d^j}{dx^j}\frac1{2x}
+O(x^{-3-j}),
\qquad j=0,1,2,3,
\]

uniformly for \(x\ge1\), as follows repeatedly from
\(\operatorname{Daw}'(x)=1-2x\operatorname{Daw}(x)\).  The leading term has
the exact cancellation

\[
\frac1{1+\varepsilon^2s^2}
\frac1{2x_\varepsilon(s,\lambda)}
=
\frac1{2\lambda(s^2+\varepsilon)}.
\]

Splitting the tail at \(s=\varepsilon^{-1}\) provides an integrable
dominating function for the second \(\varepsilon\)-derivatives and their
first \(\lambda\)-derivatives; Taylor's theorem under the integral then
proves the \(C^1(K)\) remainder.  Dividing (2.50) by (2.49) proves (2.46),
and \(d\lambda/du=\varrho^{-1/3}\) proves (2.47).

<a id="wip-2-9"></a>
### WIP-2.9 — a symmetric pair kernel and a small-contrast theorem

**Status: [PROVED].**

Let \(D_1,D_2\) be independent copies of the arcsine variable
\(D=D_\varphi\) from (2.2a), and put \(Z_j=uD_j\).  Differentiating the
ratio in (2.24), using
\(\operatorname{Daw}'(x)=1-2x\operatorname{Daw}(x)\), and symmetrizing in
\(D_1,D_2\) gives the exact identity

\[
\boxed{
Q_\theta(u)^2\mathcal R_\theta'(u)
=
\frac1{u\sqrt\pi}
\mathbb E[\mathcal K(Z_1,Z_2)].
}
\tag{2.52}
\]

The kernel is symmetric.  For \(z_1\ge z_2>0\), it is most conveniently
specified by

\[
\boxed{
e^{z_1^2+z_2^2}\mathcal K(z_1,z_2)
=
J(z_1,z_2)
:=
z_1e^{z_1^2}+z_2e^{z_2^2}
-2(z_1^2-z_2^2)
\int_{z_2}^{z_1}e^{t^2}\,dt.
}
\tag{2.53}
\]

This representation yields two explicit endpoint windows.  First, if
\(z_1\le1/\sqrt2\), then

\[
\int_{z_2}^{z_1}e^{t^2}\,dt
\le(z_1-z_2)e^{z_1^2},
\qquad
(z_1-z_2)^2(z_1+z_2)\le z_1^3,
\]

and hence

\[
J(z_1,z_2)
\ge
z_1e^{z_1^2}(1-2z_1^2)+z_2e^{z_2^2}\ge0.
\]

For the opposite endpoint, the global Dawson bound

\[
\boxed{x\operatorname{Daw}(x)<\frac23\qquad(x>0)}
\tag{2.54}
\]

is sufficient.  Here is an exact proof of that bound.  If
\(z(x)=x\operatorname{Daw}(x)\), then

\[
z'(x)=x+(x^{-1}-2x)z(x).
\]

At a point where \(z=2/3\), its derivative would be
\((2-x^2)/(3x)\).  Moreover, the convergent Maclaurin series gives the
strict alternating-series bound

\[
z(\sqrt2)
<
\sum_{n=0}^{6}
(-1)^n\frac{2^{2n+1}}{(2n+1)!!}
=\frac{88246}{135135}<\frac23;
\]

the absolute terms decrease from \(n=1\) onward.  A downward crossing
before \(\sqrt2\), or an upward crossing after \(\sqrt2\), would have the
opposite derivative sign.  Since \(z(0+)=0\), no crossing is possible and
(2.54) follows.

Now \(J(z_2,z_2)=2z_2e^{z_2^2}>0\), while direct differentiation of (2.53)
gives

\[
\begin{aligned}
\partial_{z_1}J(z_1,z_2)
={}&
e^{z_1^2}
\left(
1+2z_2^2-4z_1\operatorname{Daw}(z_1)
\right)\\
&\quad+
4z_1e^{z_2^2}\operatorname{Daw}(z_2).
\end{aligned}
\]

Thus \(J(z_1,z_2)>0\) whenever
\(z_2\ge\sqrt{5/6}\).  Since
\(D\in[e^{-\theta},e^\theta]\), (2.52) proves the universal explicit
windows

\[
\boxed{
\begin{aligned}
u e^\theta\le\frac1{\sqrt2}
&\quad\Longrightarrow\quad
\mathcal R_\theta'(u)>0,\\
u e^{-\theta}\ge\sqrt{\frac56}
&\quad\Longrightarrow\quad
\mathcal R_\theta'(u)>0.
\end{aligned}
}
\tag{2.55}
\]

The same kernel proves an all-\(u\) theorem for a nontrivial range of
unequal rates.  For \(z_1\ge z_2>0\),

\[
\int_{z_2}^{z_1}e^{t^2}\,dt
\le
\frac{e^{z_1^2}-e^{z_2^2}}{2z_2}.
\]

Set \(A=(z_1^2-z_2^2)/z_2\).  Then (2.53) gives

\[
J(z_1,z_2)
\ge
(z_1-A)e^{z_1^2}+(z_2+A)e^{z_2^2}.
\]

If \(z_1/z_2\le\phi_{\rm g}:=(1+\sqrt5)/2\), then

\[
A-z_1
=
z_2\left[
\left(\frac{z_1}{z_2}\right)^2
-\frac{z_1}{z_2}-1
\right]\le0,
\]

so both terms in the lower bound are nonnegative and the second is
strictly positive.  Every pair in (2.52) satisfies
\(Z_1/Z_2\le e^{2\theta}\) after ordering.  Therefore

\[
\boxed{
0\le\theta\le
\frac12\log\frac{1+\sqrt5}{2}
\quad\Longrightarrow\quad
\mathcal R_\theta'(u)>0\ \text{for every }u>0
\quad\Longrightarrow\quad
X^2\in GGC.
}
\tag{2.56}
\]

The first implication is the pair-kernel argument; the second is the exact
phase criterion (2.26).  This is a genuine positive unequal-rate subcase
of Bondesson's conjecture.  WIP-2.11 below later enlarges this benchmark
range from \(e^{2\theta}\le\phi_{\rm g}\) to \(e^{2\theta}\le3\), and
WIP-2.12 pushes it to \(e^{2\theta}\le7/2\).  The later independent
certificates WIP-2.14 and WIP-5.10 improve this to \(4\) and to the exact
cubic boundary (5.68), respectively.

The pair kernel is not pointwise nonnegative on the entire quadrant.  In
fact,

\[
J(1,0)
=e-2\int_0^1e^{t^2}\,dt<0,
\tag{2.57}
\]

because the exponential series gives
\(\int_0^1e^{t^2}dt>1+1/3+1/10=43/30\) and \(e<11/4\).
Continuity supplies examples with a strictly positive second coordinate.
Thus an extension of (2.56) to arbitrary contrast must exploit the
arcsine averaging in (2.52), rather than global pointwise positivity of
\(\mathcal K\).

<a id="wip-2-10"></a>
### WIP-2.10 — tilted Stein kernel and a one-turning-point residual

**Status: [PROVED REDUCTION].**

Put

\[
l=e^{-\theta},\qquad r=e^\theta,\qquad
\tau(x)=(x-l)(r-x)=c^2-(x-a)^2,
\qquad
p(x)=\frac1{\pi\sqrt{\tau(x)}}.
\]

Let \(q_u(x)=e^{-u^2x^2}\), so the law \(\nu_u\) in (2.27) has density
\(p_u=q_up/Q_\theta(u)\).  Denote its first two moments by

\[
\mu_u=\mathbb E_{\nu_u}[D],
\qquad
v_u=\mathbb E_{\nu_u}[D^2].
\]

The canonical tilted Stein kernel, and the corresponding inverse-Stein
kernel for \(D^2\), are respectively

\[
\begin{aligned}
\tau_u(x)
&=
e^{u^2x^2}\sqrt{\tau(x)}
\int_x^r
\frac{(y-\mu_u)e^{-u^2y^2}}{\sqrt{\tau(y)}}\,dy,\\
T_u(x)
&=
e^{u^2x^2}\sqrt{\tau(x)}
\int_x^r
\frac{(y^2-v_u)e^{-u^2y^2}}{\sqrt{\tau(y)}}\,dy.
\end{aligned}
\tag{2.58}
\]

Integration by parts gives, for every admissible \(h\),

\[
\boxed{
\begin{aligned}
\operatorname{Cov}_{\nu_u}(D,h(D))
&=\mathbb E_{\nu_u}[\tau_u(D)h'(D)],\\
\operatorname{Cov}_{\nu_u}(D^2,h(D))
&=\mathbb E_{\nu_u}[T_u(D)h'(D)].
\end{aligned}
}
\tag{2.59}
\]

The untilted Pearson identity also gives the useful tilted formula

\[
\mathbb E_{\nu_u}[\tau(D)h'(D)]
=
\mathbb E_{\nu_u}[
(D-a+2u^2D\tau(D))h(D)],
\qquad
a-\mu_u=2u^2\mathbb E_{\nu_u}[D\tau(D)].
\tag{2.60}
\]

Define the unnormalized centered upper-tail integral

\[
H_u(x)
:=
\int_x^r
(y^2-v_u)q_u(y)p(y)\,dy.
\tag{2.61}
\]

Then \(H_u(x)>0\) for \(l<x<r\), and (2.29), after using (2.59) with
\(h(x)=\operatorname{erfi}(ux)\), is exactly

\[
\boxed{
\int_l^r e^{u^2x^2}H_u(x)\,dx
\le\frac{a}{2u^2}.
}
\tag{2.62}
\]

This target has a sharp one-turning-point residual.  Put

\[
G_u(x)=\frac{xq_u(x)p(x)}{2u^2}-H_u(x).
\tag{2.63}
\]

Since \(\int_l^r xp(x)\,dx=a\), the desired difference in (2.62) is

\[
\frac{a}{2u^2}
-\int_l^r e^{u^2x^2}H_u(x)\,dx
=
\int_l^r e^{u^2x^2}G_u(x)\,dx.
\]

Direct differentiation gives

\[
\boxed{
G_u'(x)
=q_u(x)p(x)
\left[
\frac{ax-1}{2u^2\tau(x)}-v_u
\right].
}
\tag{2.64}
\]

The rational function controlling this derivative satisfies

\[
\left(\frac{ax-1}{\tau(x)}\right)'
=
\frac{a(x^2+1)-2x}{\tau(x)^2}>0,
\qquad
\frac{ax-1}{\tau(x)}
=-\frac{l}{2(x-l)}+\frac{r}{2(r-x)}.
\tag{2.65}
\]

Also \(G_u(x)\to+\infty\) at both endpoints.  Hence \(G_u\) decreases once
and then increases once: it is either positive everywhere, or it has
exactly two zeros with sign pattern \(+,-,+\).  This reduces the missing
covariance bound to a weighted signed-area inequality for a function with
one minimum.

There is an equivalent localizing-moment formulation.  Let

\[
\eta_u(dx)=T_u(x)p(x)\,dx,\qquad
\mathsf M_j=\int_l^r x^j\,\eta_u(dx),\qquad
m_j=\int_l^r x^j p(x)\,dx.
\]

All integer moments, including negative ones, are finite because \(l>0\).
Since

\[
(T_up_u)'=(v_u-x^2)p_u,
\]

integration by parts after multiplication by \(h\,p/p_u\) gives

\[
\mathbb E_p[
(h'(D)+2u^2Dh(D))T_u(D)]
=
\mathbb E_p[h(D)(D^2-v_u)].
\tag{2.66}
\]

Taking \(h(x)=x^n\) yields, for every integer \(n\),

\[
n\mathsf M_{n-1}+2u^2\mathsf M_{n+1}
=m_{n+2}-v_um_n.
\tag{2.67}
\]

The reciprocal arcsine identity

\[
\mathbb E_p[f(D^{-1})]
=\mathbb E_p[D^{-1}f(D)]
\]

implies \(m_{-j}=m_{j-1}\), in particular \(m_{-1}=1\).  Equations
(2.67) at \(n=0\) and \(n=-1\) give

\[
2u^2\mathsf M_1=m_2-v_u,
\qquad
2u^2\mathsf M_0=a-v_u+\mathsf M_{-2}.
\]

Since the left side of (2.62) is \(\mathsf M_0\), the entire remaining
Route-2 inequality is equivalently

\[
\boxed{\mathsf M_{-2}\le v_u.}
\tag{2.68}
\]

> **[OPEN STEP R2-C]** Prove (2.68), or equivalently the weighted
> signed-area inequality following (2.64), for all \(\theta,u>0\).  Any
> extension of the pair-kernel theorem (2.56) should be compared against
> this one-turning-point formulation.

<a id="wip-2-11"></a>
### WIP-2.11 — a tilted-mean criterion and the range \(e^{2\theta}\le3\)

**Status: [PROVED PARTIAL GGC THEOREM].**

The inverse-Stein target (2.68) can be proved throughout a substantially
larger contrast range.  Put \(t=u^2\), \(q(x)=e^{-tx^2}\), and

\[
B_t(y)=\int_l^y e^{tx^2}\,dx.
\]

Recall that \(Q=\int_l^r q(x)p(x)\,dx\),
\(\nu_u(dx)=q(x)p(x)\,dx/Q\), and
\(\mu_u=\mathbb E_{\nu_u}[D]\).  Fubini's theorem and the definition
(2.61) give

\[
\begin{aligned}
\mathsf M_0
&=\int_l^r e^{tx^2}H_u(x)\,dx\\
&=\int_l^r(y^2-v_u)q(y)p(y)B_t(y)\,dy\\
&=Q\operatorname{Cov}_{\nu_u}\!\left(D^2,B_t(D)\right).
\end{aligned}
\tag{2.69}
\]

Symmetrizing the covariance with two independent variables having the
untilted density \(p\) yields

\[
\mathsf M_0
=\frac1Q\int_{l<x<y<r}
q(x)q(y)(y^2-x^2)
\bigl(B_t(y)-B_t(x)\bigr)
p(x)p(y)\,dx\,dy.
\tag{2.70}
\]

For \(x<z<y\), convexity of the square gives the chord bound

\[
z^2\le(x+y)z-xy.
\]

It follows that

\[
\begin{aligned}
B_t(y)-B_t(x)
&\le e^{-txy}\int_x^y e^{t(x+y)z}\,dz\\
&=\frac{e^{ty^2}-e^{tx^2}}{t(x+y)}.
\end{aligned}
\tag{2.71}
\]

The inequality is strict for \(t>0\) and \(x<y\).  Substitution into
(2.70) gives

\[
2t\mathsf M_0
\le\frac2Q\int_{l<x<y<r}
(y-x)\bigl(q(x)-q(y)\bigr)p(x)p(y)\,dx\,dy.
\tag{2.72}
\]

The last integral can be evaluated without estimating it.  If \(X,Y\) are
iid with density \(p\), then

\[
\mathbb E[(Y-X)(q(X)-q(Y))]
=2aQ-2\mathbb E[Dq(D)]
=2Q(a-\mu_u).
\]

Its integrand is symmetric, so the ordered half-plane in (2.72) contributes
one half of the full expectation.  Therefore

\[
\boxed{2t\mathsf M_0\le2(a-\mu_u).}
\tag{2.73}
\]

In particular,

\[
\boxed{
\mu_u\ge\frac a2
\quad\Longrightarrow\quad
2u^2\mathsf M_0\le a
\quad\Longrightarrow\quad
\mathsf M_{-2}\le v_u.
}
\tag{2.74}
\]

The last implication uses the exact recurrence
\(2u^2\mathsf M_0=a-v_u+\mathsf M_{-2}\).  The tilted arcsine law has a
strictly positive density on \((l,r)\), and hence \(\mu_u>l\) for every
finite \(u\) when \(\theta>0\).  Since

\[
l\ge\frac a2
\quad\Longleftrightarrow\quad
4l\ge l+r
\quad\Longleftrightarrow\quad
\frac rl\le3
\quad\Longleftrightarrow\quad
e^{2\theta}\le3,
\]

(2.74), (2.68), and the phase criterion prove

\[
\boxed{
0\le\theta\le\frac12\log3
\quad\Longrightarrow\quad
\mathcal R_\theta'(u)>0\quad(u>0)
\quad\Longrightarrow\quad
X_\theta^2\in GGC.
}
\tag{2.75}
\]

For \(\theta>0\), strictness follows already from the strict inequality in
(2.71); the degenerate \(\theta=0\) case follows from
\(\mathcal R_0(u)=\operatorname{erfi}(u)\).  This improves the previously
proved rate-ratio threshold \(e^{2\theta}\le\phi_{\rm g}\) in (2.56) to
\(e^{2\theta}\le3\).

The same tilted-mean criterion gives two explicit small-\(u\) windows for
every fixed contrast.  From (2.60),

\[
a-\mu_u=2t\mathbb E_{\nu_u}[D\tau(D)].
\]

The function \(x\tau(x)=x(x-l)(r-x)\) has its unique maximum in \((l,r)\)
at

\[
x_*=\frac{2a+\sqrt{4a^2-3}}3,
\qquad
\max_{[l,r]}x\tau(x)
=\frac{x_*(x_*^2-1)}2.
\]

Indeed its derivative is \(-3x^2+4ax-1\), positive at \(l\) and negative
at \(r\); at the interior root the critical-point equation gives
\(\tau(x_*)=(x_*^2-1)/2\).  Hence

\[
\boxed{
0<\theta<\infty,\qquad
u^2\le\frac{a}{2x_*(x_*^2-1)}
\quad\Longrightarrow\quad
\mu_u\ge\frac a2
\quad\Longrightarrow\quad
\mathsf M_{-2}\le v_u.
}
\tag{2.76}
\]

At \(\theta=0\), one has \(x_*=1\) and the displayed denominator vanishes;
that degenerate benchmark was already proved for every \(u\), rather than
being covered by (2.76).

A less sharp but simpler bound follows directly from
\(q(r)\le q(D)\le q(l)\):

\[
\mu_u
=\frac{\mathbb E[Dq(D)]}{Q}
\ge\frac{a q(r)}{q(l)}
=a e^{-u^2(r^2-l^2)}.
\]

Thus

\[
\boxed{
u^2(r^2-l^2)\le\log2
\quad\Longrightarrow\quad
\mathsf M_{-2}\le v_u.
}
\tag{2.77}
\]

The support-only consequence leaves \(e^{2\theta}>3\) open.  Formula (2.73)
nevertheless identifies a sharper intermediate target than (2.68): it is
enough to prove \(\mu_u\ge a/2\) in any additional parameter region.  The
next entry combines that observation with the high-frequency window and
crosses the threshold \(3\).

<a id="wip-2-12"></a>
### WIP-2.12 — a rational low/high-frequency splice up to
\(e^{2\theta}\le7/2\)

**Status: [PROVED PARTIAL GGC THEOREM].**

The tilted-mean argument can be pushed beyond the pointwise mean cone by a
finite rational certificate.  Normalize the arcsine rate by its lower
endpoint:

\[
\kappa=\frac rl=e^{2\theta},\qquad
d=\kappa-1,\qquad
R=\frac Dl=1+dV,\qquad
V\sim\operatorname{Beta}\!\left(\frac12,\frac12\right).
\tag{2.78}
\]

Put \(s=ul\), \(t=s^2\), and

\[
Q_t=\mathbb E[e^{-tR^2}],
\qquad
\bar R_t=\frac{\mathbb E[Re^{-tR^2}]}{Q_t}.
\]

We first prove the low-frequency lemma

\[
\boxed{
3\le\kappa\le\frac72,\quad 0\le t\le\frac56
\quad\Longrightarrow\quad
\bar R_t>\frac{\kappa+1}{4}.
}
\tag{2.79}
\]

For \(2\le d\le5/2\), define

\[
g_d(v)
=1+dv-\frac{d+2}{4}
=\frac12+d\left(v-\frac14\right),
\qquad
A_{d,t}(v)=t\bigl((1+dv)^2-1\bigr).
\]

Since \(Q_t>0\), (2.79) is equivalent to positivity of

\[
\begin{aligned}
F_{d,t}
&=\mathbb E[g_d(V)e^{-t(1+dV)^2}]\\
&=e^{-t}\mathbb E[g_d(V)e^{-A_{d,t}(V)}].
\end{aligned}
\tag{2.80}
\]

The following comparison takes the worst values of \(d\) and \(t\)
pointwise; it does not assume that the full integral is monotone in either
parameter.  Set \(d_*=5/2\), \(T=5/6\), and \(h=1/20\).  On
\(0\le v\le1/4\), one has

\[
g_d(v)\ge g_{d_*}(v)=-\frac18+\frac52v,
\]

and the function on the right changes sign at \(h\).  If \(0\le v\le h\)
and \(g_d(v)<0\), then \(e^{-A_{d,t}(v)}\le1\); if \(g_d(v)\ge0\), the
desired lower bound is automatic.  Hence

\[
g_d(v)e^{-A_{d,t}(v)}\ge g_{d_*}(v),
\qquad 0\le v\le\frac1{20}.
\tag{2.81}
\]

On \(h\le v\le1/4\), both comparison functions are nonnegative and
\(A_{d,t}(v)\le A_{d_*,T}(v)\), so

\[
g_d(v)e^{-A_{d,t}(v)}
\ge g_{d_*}(v)e^{-A_{d_*,T}(v)}.
\tag{2.82}
\]

For \(v\ge1/4\), \(g_d(v)\ge1/2\), so that entire contribution is
nonnegative and may be discarded.

The beta density is \([\pi\sqrt{v(1-v)}]^{-1}\).  The absolute value of the
negative comparison piece in (2.81) is bounded by

\[
\begin{aligned}
N_-
&=\frac1\pi\int_0^{1/20}
\frac{\frac18-\frac52v}{\sqrt{v(1-v)}}\,dv\\
&\le\frac1\pi\sqrt{\frac{20}{19}}
\int_0^{1/20}\left(\frac18-\frac52v\right)v^{-1/2}\,dv\\
&=\frac1\pi\sqrt{\frac{20}{19}}
\left[\frac14\sqrt v-\frac53v^{3/2}\right]_0^{1/20}\\
&=\frac1{6\pi\sqrt{19}}.
\end{aligned}
\tag{2.83}
\]

It remains to give a strictly larger positive lower bound.  Restrict
(2.82) to \(1/16\le v\le1/4\) and put \(v=w^2\).  At the worst parameters,

\[
A_{d_*,T}(v)
=\frac{25}{6}v+\frac{125}{24}v^2,
\qquad
A(w)=\frac{25}{6}w^2+\frac{125}{24}w^4.
\tag{2.84}
\]

Let

\[
P_3(x)=1-x+\frac{x^2}{2}-\frac{x^3}{6}.
\]

Taylor's theorem gives \(e^{-x}\ge P_3(x)\) for \(x\ge0\), and

\[
P_3'(x)=-\frac{(x-1)^2+1}{2}<0.
\]

The function \(A\) is increasing on \([1/4,1/2]\), and

\[
A(1/2)=\frac{175}{128},\qquad
P_3(175/128)=\frac{1780337}{12582912}>0.
\]

Using also \((1-v)^{-1/2}\ge1\), the positive comparison contribution
satisfies

\[
N_+
\ge\frac2\pi\int_{1/4}^{1/2}
\left(-\frac18+\frac52w^2\right)P_3(A(w))\,dw.
\tag{2.85}
\]

Use the partition

\[
\left(w_0,\ldots,w_5\right)
=\left(\frac14,\frac13,\frac38,\frac5{12},\frac{11}{24},\frac12\right).
\]

Because \(P_3\circ A\) is decreasing, valid lower bounds on the five
successive intervals are

\[
(c_1,\ldots,c_5)
=\left(\frac7{12},\frac{49}{100},\frac{39}{100},
\frac7{25},\frac7{50}\right).
\tag{2.86}
\]

This is an exact rational certificate.  At the five right endpoints, the
values of \(A\) are

\[
\frac{1025}{1944},\quad
\frac{22575}{32768},\quad
\frac{438125}{497664},\quad
\frac{8799725}{7962624},\quad
\frac{175}{128},
\]

and the corresponding differences \(P_3(A(w_j))-c_j\) are

\[
\begin{gathered}
\frac{175268935}{44079842304},\qquad
\frac{6830551097091}{1759218604441600},\\
\frac{63548401383143251}{18488425889503641600},\qquad
\frac{43566029160509197267}{75728592443406915993600},\qquad
\frac{468233}{314572800},
\end{gathered}
\]

all strictly positive.

Let

\[
G(w)=-\frac w4+\frac53w^3,
\qquad
G'(w)=2\left(-\frac18+\frac52w^2\right).
\]

For \(\Delta_j=G(w_j)-G(w_{j-1})\), the five exact products needed in
(2.85) are

\[
\begin{array}{c|c|c}
j&\Delta_j&c_j\Delta_j\\ \hline
1&77/5184&539/62208\\
2&653/41472&31997/4147200\\
3&923/41472&11999/1382400\\
4&1223/41472&8561/1036800\\
5&1553/41472&10871/2073600
\end{array}
\]

and therefore

\[
N_+>
\frac1\pi\sum_{j=1}^5c_j\Delta_j
=\frac1\pi\frac{23987}{622080}.
\tag{2.87}
\]

Finally,

\[
684\left(\frac{23987}{622080}\right)^2-1
=\frac{182604811}{10749542400}>0.
\]

Since \(684=36\cdot19\), this is exactly

\[
\frac{23987}{622080}>\frac1{6\sqrt{19}}.
\tag{2.88}
\]

The script
[route2_halfshape_splice.py](../computations/route2_halfshape_splice.py)
checks (2.86)--(2.88) using only Python's exact
fractions.Fraction arithmetic.  It verifies the displayed endpoint values,
all five positive gaps, the five increments, their sum, and the final
squared comparison.  The analytic reductions (2.81)--(2.85), not the
script, are the proof of the inequalities being certified.

Equations (2.81)--(2.88) show that the expectation in the second line of
(2.80) is strictly positive.  The factor \(e^{-t}\) is positive, proving
the low-frequency lemma (2.79) without any numerical estimate.

We now splice this lemma to the already proved high-frequency window.  The
untilted mean of \(R\) is \(m_1=(\kappa+1)/2\), so (2.79) says exactly
\(\bar R_t>m_1/2\).  More explicitly, (5.34a) gives
\[
2tM_0\le2(m_1-\bar R_t)<m_1,
\]
so (5.30) makes the fully averaged kernel strictly positive whenever
\(s^2\le5/6\).  If \(s^2\ge5/6\), then for every pair
\(R_1,R_2\in[1,\kappa]\),

\[
\min(sR_1,sR_2)\ge s\ge\sqrt{\frac56},
\]

and the pointwise high-frequency kernel bound in WIP-2.9 is strictly
positive.  The two ranges meet exactly.  Together with the already settled
\(\kappa\le3\) case, this proves

\[
\boxed{
0\le\theta\le\frac12\log\frac72
\quad\Longrightarrow\quad
\mathcal R_\theta'(u)>0\quad(u>0)
\quad\Longrightarrow\quad
X_\theta^2\in GGC.
}
\tag{2.89}
\]

The certificate is deliberately nonoptimal: its role is to show that a
rigorous low/high-frequency splice can cross the natural pointwise
mean-cone boundary \(\kappa=3\).  This particular certificate stops at
\(7/2\); WIP-2.14 later moves the same Route-2 method to \(4\), and
WIP-5.10 gives a stronger Route-5 cone.

The splice is not merely cosmetic.  For every fixed \(\kappa>1\), the
tilted law proportional to \(e^{-tR^2}\operatorname{Law}(R)\) converges
weakly to \(\delta_1\) as \(t\to\infty\).  Indeed, for any
\(\varepsilon>0\), compare the exponentially weighted mass of
\([1+\varepsilon,\kappa]\) with the positive arcsine mass of
\([1,1+\varepsilon/2]\).  Their ratio tends to zero exponentially.  Hence
\(\bar R_t\to1\).  If \(\kappa>3\), then
\((\kappa+1)/4>1\), so the sufficient tilted-mean condition in (2.79) must
eventually fail even if the desired kernel remains positive.  The separate
high-frequency estimate is therefore essential; this observation is a
no-go only for using the mean criterion at every \(t\), not for the GGC
claim.

<a id="wip-2-13"></a>
### WIP-2.13 — an improved pointwise high-frequency window

**Status: [PROVED].**

The pointwise endpoint threshold in WIP-2.9 can be reduced from
\(\sqrt{5/6}\) to \(4/5\).  For \(a\ge b>0\), recall

\[
J(a,b)
=ae^{a^2}+be^{b^2}
-2(a^2-b^2)\int_b^a e^{x^2}\,dx,
\qquad
\mathcal K(a,b)=e^{-a^2-b^2}J(a,b).
\]

Direct differentiation gives

\[
\frac{\partial J}{\partial a}
=(1+2b^2)e^{a^2}-4a\int_b^a e^{x^2}\,dx
=4a\,\Delta_b(a),
\tag{2.90}
\]

where

\[
c_b=\frac{1+2b^2}{4},
\qquad
\Delta_b(a)=\frac{c_b e^{a^2}}a-\int_b^a e^{x^2}\,dx.
\]

Put \(b_0=4/5\) and \(c_0=57/100\).  For \(a\ge b\ge b_0\),

\[
\Delta_b(a)-\Delta_{b_0}(a)
=\frac{(b^2-b_0^2)e^{a^2}}{2a}
+\int_{b_0}^b e^{x^2}\,dx
\ge0.
\tag{2.91}
\]

It is therefore enough to prove \(\Delta_{b_0}>0\).  Its derivative has the
especially simple sign pattern

\[
\Delta_{b_0}'(a)
=e^{a^2}\left(\frac7{50}-\frac{57}{100a^2}\right).
\tag{2.92}
\]

Thus \(\Delta_{b_0}\) decreases and then increases, with its unique global
minimum on \([b_0,\infty)\) at

\[
a_0=\sqrt{\frac{57}{14}}.
\]

The positivity of this minimum has a short exact series certificate.  Set

\[
A=\frac{57}{14},\qquad B=\frac{16}{25},\qquad
\mathscr S(x)=\sum_{n=0}^{\infty}\frac{x^n}{n!(2n+1)}.
\]

Termwise integration of the positive entire series gives

\[
\int_0^z e^{x^2}\,dx=z\mathscr S(z^2),
\]

and hence

\[
a_0\Delta_{b_0}(a_0)
=\frac{57}{100}e^A-A\mathscr S(A)
+a_0\frac45\mathscr S(B).
\tag{2.93}
\]

The following four rational estimates suffice:

\[
e^A>\frac{293}{5},\qquad
\mathscr S(A)<\frac{433}{50},\qquad
\mathscr S(B)>\frac{63}{50},\qquad
a_0>\frac{2017}{1000}.
\tag{2.94}
\]

Here the exponential lower bound is its Taylor sum through degree \(12\),
and the \(\mathscr S(B)\) lower bound is its sum through degree \(3\).  For
the only upper bound, if

\[
u_n=\frac{A^n}{n!(2n+1)},
\]

then \(u_{n+1}/u_n<A/(n+1)\); after \(u_9\), all successive ratios are
less than \(A/10=57/140\).  Consequently,

\[
\mathscr S(A)
<
\sum_{n=0}^8u_n+\frac{u_9}{1-57/140}
<\frac{433}{50}.
\]

Finally,

\[
A-\left(\frac{2017}{1000}\right)^2
=\frac{21977}{7000000}>0,
\]

which proves the last estimate in (2.94).  Substitution into (2.93) yields
the fully rational lower bound

\[
\begin{aligned}
a_0\Delta_{b_0}(a_0)
&>
\frac{57}{100}\frac{293}{5}
-\frac{57}{14}\frac{433}{50}
+\frac{2017}{1000}\frac45\frac{63}{50}\\
&=\frac{77247}{437500}>0.
\end{aligned}
\tag{2.95}
\]

The exact-arithmetic script
[route2_pair_kernel_high_window.py](../computations/route2_pair_kernel_high_window.py)
checks all four series bounds, the geometric tail estimate, and (2.95)
using only fractions.Fraction arithmetic.

Equations (2.91)--(2.95) show
\(\partial_aJ(a,b)>0\) for every \(a\ge b\ge4/5\).  Since
\(J(b,b)=2be^{b^2}>0\), symmetry proves

\[
\boxed{
\min(z_1,z_2)\ge\frac45
\quad\Longrightarrow\quad
\mathcal K(z_1,z_2)>0.
}
\tag{2.96}
\]

In the normalized rate model \(R\in[1,\kappa]\), this replaces the old
pointwise high-frequency condition \(s^2\ge5/6\) by
\(s^2\ge16/25\).  WIP-2.14 supplies the matching low-frequency
certificate.

<a id="wip-2-14"></a>
### WIP-2.14 — an exact low/high-frequency splice up to \(\kappa=4\)

**Status: [PROVED PARTIAL GGC THEOREM].**

The improved pointwise window in WIP-2.13 can be spliced with a new exact
low-frequency certificate.  Recall

\[
\kappa=1+d,\qquad
R=1+dV,\qquad
V\sim\operatorname{Beta}\!\left(\frac12,\frac12\right),
\]

and put

\[
T=\frac{16}{25},\qquad
g_d(v)=\frac12+d\left(v-\frac14\right),\qquad
A_{d,t}(v)=t\bigl((1+dv)^2-1\bigr).
\tag{2.97}
\]

Since

\[
\mathbb E\!\left[
\left(R-\frac{d+2}{4}\right)e^{-tR^2}
\right]
=
e^{-t}\mathbb E\!\left[
g_d(V)e^{-A_{d,t}(V)}
\right],
\]

the desired tilted-mean inequality is equivalent to positivity of

\[
\Phi_{d,t}
:=
\mathbb E\!\left[g_d(V)e^{-A_{d,t}(V)}\right].
\tag{2.98}
\]

We prove

\[
\boxed{
2\le d\le3,\qquad 0\le t\le\frac{16}{25}
\quad\Longrightarrow\quad
\Phi_{d,t}>0.
}
\tag{2.99}
\]

Set

\[
h=\frac1{12},\qquad
g_3(v)=3v-\frac14,\qquad
A(v)=A_{3,T}(v)
=\frac{96}{25}v+\frac{144}{25}v^2.
\tag{2.100}
\]

For \(0\le v<h\), one has \(g_3(v)<0\).  Since
\(g_d(v)\ge g_3(v)\), either \(g_d(v)\ge0\), in which case the desired
lower bound is immediate, or \(g_d(v)<0\), in which case

\[
g_d(v)e^{-A_{d,t}(v)}
\ge g_d(v)\ge g_3(v).
\]

For \(h\le v\le1/4\), both comparison functions are nonnegative, while

\[
g_d(v)\ge g_3(v),\qquad
A_{d,t}(v)\le A(v).
\]

Therefore

\[
g_d(v)e^{-A_{d,t}(v)}
\ge g_3(v)e^{-A(v)}.
\]

It remains to justify the reduction to \(d=3,t=T\) on \(v\ge1/4\).
For fixed \(v\ge1/4\), put

\[
f_d(v)=g_d(v)e^{-A_{d,T}(v)}.
\]

Then

\[
\begin{aligned}
\partial_d\log f_d(v)
&=
\frac{v-\frac14}{g_d(v)}
-2Tv(1+dv)\\
&\le
2\left(v-\frac14\right)
-\frac{32}{25}v(1+2v)\\
&=
-\frac{128v^2-36v+25}{50}<0.
\end{aligned}
\tag{2.101}
\]

The last quadratic is positive because its discriminant is
\(36^2-4\cdot128\cdot25=-11504<0\).  Also, for a positive
integrand, replacing \(t\le T\) by \(T\) only decreases it.  Consequently,

\[
\Phi_{d,t}\ge L,
\tag{2.102}
\]

where

\[
L=
\mathbb E\!\left[
g_3(V)\mathbf1_{\{V<1/12\}}
+g_3(V)e^{-A(V)}\mathbf1_{\{V\ge1/12\}}
\right].
\]

It remains to prove \(L>0\) without numerical quadrature.  Put \(v=w^2\)
and, to keep the changed variable explicit, write

\[
\widetilde A(w):=A(w^2)
=\frac{96}{25}w^2+\frac{144}{25}w^4.
\]

After multiplication by \(\pi\), the absolute value of the negative
contribution is

\[
\begin{aligned}
N
&=
2\int_0^{1/\sqrt{12}}
\frac{\frac14-3w^2}{\sqrt{1-w^2}}\,dw\\
&=
\frac{\sqrt{11}}4
-\frac52\arcsin\frac1{\sqrt{12}}.
\end{aligned}
\tag{2.103}
\]

The positive arcsine expansion gives

\[
\arcsin x
\ge
x\sum_{n=0}^{4}
\frac{\binom{2n}{n}x^{2n}}{4^n(2n+1)}.
\]

At \(x=1/\sqrt{12}\), write

\[
S_4=
\sum_{n=0}^{4}
\frac{\binom{2n}{n}}{4^n(2n+1)12^n}
=\frac{848145961}{836075520}.
\]

The rational square comparisons

\[
\left(\frac{3316625}{10^6}\right)^2-11
=\frac{89}{64000000}>0,
\qquad
1-3\left(\frac{577350}{10^6}\right)^2
=\frac{373}{400000000}>0
\]

show respectively that

\[
\sqrt{11}<\frac{3316625}{10^6},
\qquad
\frac1{\sqrt3}>\frac{577350}{10^6}.
\]

It follows that

\[
\begin{aligned}
N
&<
\frac14\frac{3316625}{10^6}
-\frac54S_4\frac{577350}{10^6}\\
&=
\frac{144250497157}{1486356480000}
<
\frac{9705}{100000},
\end{aligned}
\tag{2.104}
\]

where the final rational gap is

\[
\frac{9705}{100000}
-
\frac{144250497157}{1486356480000}
=
\frac{399227}{1486356480000}>0.
\]

For the positive part define

\[
B_3(w)
=
1+\frac{w^2}{2}+\frac{3w^4}{8}+\frac{5w^6}{16}.
\]

The positive binomial expansion yields

\[
B_3(w)\le(1-w^2)^{-1/2},
\qquad 0\le w<1.
\]

Let

\[
w_j=\frac7{24}+\frac{79j}{1920},
\qquad 0\le j\le16,
\]

so that \(w_{16}=19/20\), and put \(x_j=\widetilde A(w_j)\).  Define
\(c_j=k_j/10^5\), where

\[
\begin{aligned}
(k_1,\ldots,k_{16})={}&(
60888,52211,43472,35011,27159,20199,14331,9647,\\
&6125,3645,2019,1034,486,207,80,27).
\end{aligned}
\]

Exact integer arithmetic verifies

\[
c_j
\le
\left(1-\frac{x_j}{1000}\right)^{1000}
\le e^{-x_j}.
\tag{2.105}
\]

The second inequality follows from \(\log(1-y)\le-y\).
Convexity of \(x\mapsto e^{-x}\) gives, for
\(w_{j-1}\le w\le w_j\),

\[
e^{-\widetilde A(w)}
\ge
e^{-x_j}\bigl(1+x_j-\widetilde A(w)\bigr)
\ge
c_j\bigl(1+x_j-\widetilde A(w)\bigr).
\]

Moreover,

\[
\left(\frac7{24}\right)^2-\frac1{12}
=\frac1{576}>0,
\]

so every retained integrand is nonnegative.  Hence the positive
contribution \(P\), after multiplication by \(\pi\), satisfies

\[
\begin{aligned}
P\ge S:={}&
\sum_{j=1}^{16}c_j
\int_{w_{j-1}}^{w_j}
\left(6w^2-\frac12\right)B_3(w)\\
&\hspace{38mm}\times
\bigl(1+x_j-\widetilde A(w)\bigr)\,dw.
\end{aligned}
\tag{2.106}
\]

Every integrand in (2.106) is a rational polynomial.  Exact integration
gives

\[
S=
\frac{
624822254460332573895266180085210493227000861647
}{
6380111302066666283514483179520000000000000000000
}
>
\frac{979}{10000}.
\tag{2.107}
\]

Combining (2.104) and (2.107),

\[
\boxed{
\pi L
>
\frac{979}{10000}
-\frac{9705}{100000}
=
\frac{17}{20000}>0.
}
\tag{2.108}
\]

The exact-arithmetic script
[route2_halfshape_splice_kappa4.py](../computations/route2_halfshape_splice_kappa4.py)
checks every finite rational comparison in (2.103)--(2.108).  The
pointwise reductions above, rather than the script, prove the analytic
inequalities being certified.

Now \(m_1=(\kappa+1)/2=(d+2)/2\), so (2.99) says

\[
\bar R_t>\frac{m_1}{2}
\qquad
\left(3\le\kappa\le4,\quad
t\le\frac{16}{25}\right).
\]

The same tilted-mean argument as in WIP-2.12 therefore makes the averaged
pair kernel strictly positive in this low-frequency range.  If instead
\(t=s^2\ge16/25\), then

\[
\min(sR_1,sR_2)\ge s\ge\frac45,
\]

and WIP-2.13 makes the pair kernel pointwise strictly positive.  Together
with the already proved range \(\kappa\le3\), the two windows prove

\[
\boxed{
0\le\theta\le\log2
\quad\Longrightarrow\quad
\mathcal R_\theta'(u)>0\quad(u>0)
\quad\Longrightarrow\quad
X_\theta^2\in GGC.
}
\tag{2.109}
\]

Equivalently, the independently proved Route-2 benchmark range is enlarged
from \(e^{2\theta}\le7/2\) to

\[
\boxed{e^{2\theta}\le4.}
\]
