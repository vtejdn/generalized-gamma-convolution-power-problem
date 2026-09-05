# Route 1B: the q = 3/2 Wright--Bessel problem

Exact q = 3/2 reductions, finite Hankel gates, the small-contrast theorem, and the logarithmic arcsine PDE.

Entries: WIP-1.14, WIP-1.15, WIP-1.16, WIP-1.17, WIP-1.18, WIP-1.19.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

Original WIP identifiers and equation numbers are preserved. Positional words such as "above" and "below" refer to the original numbered proof sequence.

## Progress entries


<a id="wip-1-14"></a>
### WIP-1.14 — the first nonquadratic test: \(q=3/2\)

**Status: [PROVED REDUCTION AND PROVED OBSTRUCTION TO A STRONGER
SHORTCUT; NO GGC COUNTEREXAMPLE].**

Put

\[
q=\frac32,\qquad \rho=\frac23,\qquad k=\rho B=\frac{2B}{3},
\qquad W=T_{2/3,B}^{-1}.
\]

The tilted-stable definition (1.2) and the negative moments (1.1) first
give, for \(\Re z>-k\),

\[
\boxed{
\mathbb E W^z
=\frac{\Gamma(1+B+3z/2)\Gamma(1+k)}
       {\Gamma(1+B)\Gamma(1+k+z)}
=\frac{\Gamma(B+3z/2)\Gamma(k)}
       {\Gamma(B)\Gamma(k+z)}.
}
\tag{1.79}
\]

The second quotient in (1.79) is the simplified form on this initial
strip.  Under continuation to the larger strip obtained below, it has a
removable \(\infty/\infty\) singularity at \(z=-k\); the first quotient is
the nonsingular formula there.

Introduce

\[
\alpha_0=\frac{B+1}{3},\qquad
\beta_0=\frac{B+2}{3},\qquad
\delta_0=\frac B3+\frac12=\alpha_0+\frac16,
\qquad c_0=\frac{3\sqrt3}{2}.
\]

Gauss triplication in the numerator of (1.79), followed by duplication
in its denominator, yields

\[
\mathbb E W^z
=c_0^z
 \frac{\Gamma(\alpha_0+z/2)\Gamma(\delta_0)}
      {\Gamma(\alpha_0)\Gamma(\delta_0+z/2)}
 \frac{\Gamma(\beta_0+z/2)}{\Gamma(\beta_0)}.
\tag{1.80}
\]

Consequently, for independent

\[
V\sim {\rm Beta}(\alpha_0,1/6),
\qquad Y\sim\Gamma(\beta_0,1),
\]

one has the exact factorization

\[
\boxed{W\overset d=c_0\sqrt{VY}.}
\tag{1.81}
\]

There is no moment-determinacy gap here: (1.80), initially needed only at
\(z=it\), identifies the characteristic functions of the logarithms.
The right-hand side of (1.81) then extends (1.79)--(1.80) to the maximal
Mellin strip
\(\Re z>-2\alpha_0=-2(B+1)/3\), whose boundary is also visible from the
beta factor at zero.

Now take the two-rate finite gamma convolution

\[
X=rG_a^{(1)}+lG_c^{(2)}=G_BM,\qquad
B=a+c,\qquad
M=l+(r-l)U,\quad U\sim {\rm Beta}(a,c),
\]

where \(0<l<r\) and the gamma--Dirichlet factors are independent.  From
WIP-1.3 and (1.81), taking \(V,Y\) independent also of \(M,G_k\),

\[
\boxed{
X^{3/2}\overset d=G_kN,\qquad
N=c_0M^{3/2}\sqrt{VY},\qquad G_k\perp N.
}
\tag{1.82}
\]

Thus the exact Route-1 target is

\[
X^{3/2}\in GGC
\quad\Longleftrightarrow\quad
N\text{ is an order-}k\text{ Dirichlet mean},
\tag{1.83}
\]

where the reverse implication uses the finite-Thorin-mass equivalence in
WIP-1.4.  Equivalently, with

\[
K(s)=\mathbb E(1+sN)^{-k}=\mathbb E e^{-sX^{3/2}},
\]

the function

\[
\boxed{
H(s):=-\frac1k\frac{d}{ds}\log K(s)
=c_0\frac{\mathbb E[A(1+c_0sA)^{-k-1}]}
            {\mathbb E[(1+c_0sA)^{-k}]},
\qquad A=M^{3/2}\sqrt{VY},
}
\tag{1.84}
\]

must be a Stieltjes function of probability form

\[
H(s)=\int_{(0,\infty)}\frac{x}{1+sx}\,F(dx).
\tag{1.85}
\]

The Mellin transform of the candidate mean is also explicit:

\[
\boxed{
\mathbb E N^z
=\frac{\Gamma(1+B+3z/2)\Gamma(1+k)}
       {\Gamma(1+B)\Gamma(1+k+z)}
 l^{3z/2}
 {}_2F_1\!\left(-\frac{3z}{2},a;B;1-\frac rl\right).
}
\tag{1.86}
\]

Formula (1.86) holds on
\(\Re z>-2(B+1)/3\); unlike the shortened gamma quotient, the displayed
form is regular at \(z=-k\).

There is a useful warning.  Since \(V\le1\), Chernoff's inequality at
parameter \(1/2\) gives

\[
\mathbb P(W>x)\le
2^{\beta_0}\exp\!\left(-\frac{2x^2}{27}\right),
\qquad
\mathbb P(N>x)\le
2^{\beta_0}\exp\!\left(-\frac{2x^2}{27r^3}\right).
\tag{1.87}
\]

Both variables are positive, unbounded, and nondegenerate.  Chapter IV,
Corollary 9.9, p. 200 of Steutel--van Harn (2004) says that a
nondegenerate infinitely divisible law with

\[
\limsup_{x\to\infty}
\frac{-\log\mathbb P(|Z|>x)}{x\log x}=\infty
\]

must be normal.  The bounds (1.87) therefore imply

\[
\boxed{W\notin ID,\qquad N\notin ID,}
\tag{1.88}
\]

because a nondegenerate normal law cannot be supported on
\((0,\infty)\).  In particular, neither residual factor can itself be
GGC or HCM.  This rules out only the stronger plan of proving (1.83) by
putting \(N\) in GGC and invoking product closure: an order-
\(k\) Dirichlet mean need not be infinitely divisible, and (1.88) says
nothing negative about the gamma product \(G_kN=X^{3/2}\).

A rate-side expansion gives a sharper analytic target.  Put

\[
b_1=r^{-1},\qquad b_2=l^{-1},\qquad
R=b_1Q+b_2(1-Q),\quad Q\sim {\rm Beta}(a,c),
\qquad p_b=b_1^ab_2^c,
\]

and define the entire Wright--beta function

\[
\Phi(t)=\sum_{n\ge0}\frac{(-1)^n}{n!}
\Gamma\!\left(k+\frac{2n}{3}\right)\mathbb E[R^n]t^n,
\qquad
\mathbb E[R^n]
=b_2^n{}_2F_1\!\left(-n,a;B;1-\frac{b_1}{b_2}\right).
\tag{1.89}
\]

Indeed, convolution gives

\[
f_X(x)=\frac{p_b}{\Gamma(B)}x^{B-1}\mathbb E e^{-Rx}.
\]

Expanding the bounded-rate factor, integrating each term against
\(e^{-sx^{3/2}}\), and using absolute convergence gives

\[
\boxed{
K(s)=\frac{2p_b}{3\Gamma(B)}s^{-k}\Phi(s^{-2/3}),
\qquad
H(s)=\frac1s+\frac{2}{3k}s^{-5/3}
       \frac{\Phi'(s^{-2/3})}{\Phi(s^{-2/3})}.
}
\tag{1.90}
\]

Thus (1.90), not a Gauss contiguous ratio, is the exact Stieltjes target
for the first nonquadratic test.  The ordinary Taylor series of \(K\) at
zero has radius zero: since \(X\ge lG_B\),

\[
\left(\frac{\mathbb E X^{3n/2}}{n!}\right)^{1/n}
\ge l^{3/2}
\left(\frac{\Gamma(B+3n/2)}{\Gamma(B)n!}\right)^{1/n}
\longrightarrow\infty.
\]

Hence a regular Gauss representation at \(s=0\), of the form used in
WIP-5.30, cannot be expected.  Finally, strict Jensen gives, for unequal
rates and \(s>0\),

\[
\log\mathbb E_U\ell_{B,3/2}(sM(U)^{3/2})
>
\mathbb E_U\log\ell_{B,3/2}(sM(U)^{3/2}),
\qquad
\ell_{B,3/2}(t)=\mathbb E e^{-tG_B^{3/2}}.
\]

So simply averaging the fixed-\(M\) logarithmic directing measures is
also invalid.  The remaining viable problem is the boundary phase or
Stieltjes character of the exact quotient in (1.90).  Equations
(1.79)--(1.90), apart from the explicitly cited tail theorem and standard
gamma identities, are new project derivations.

<a id="wip-1-15"></a>
### WIP-1.15 — exact finite gates and a Wright--Bessel ray at \(q=3/2\)

**Status: [PROVED THREE STRICT NECESSARY GATES, STIELTJES/ZERO-FREE
STRUCTURE, AND AN EXACT ANALYTIC REDUCTION; GLOBAL PHASE MONOTONICITY
REMAINS OPEN].**

This subsection specializes WIP-1.14 to the first symmetric unequal-rate
test. By interchanging the summands, assume \(\theta\ge0\), and set

\[
X_\theta=e^\theta G_{1/2}+e^{-\theta}G'_{1/2},
\qquad c=\cosh\theta,\qquad d=\sinh\theta.
\]

Beta--gamma independence gives

\[
\boxed{
X_\theta\overset d=G_1M,\qquad
M=e^\theta U+e^{-\theta}(1-U)
\overset d=c+d\cos\Phi,
}
\tag{1.91}
\]

where \(U\sim{\rm Beta}(1/2,1/2)\),
\(\Phi\sim{\rm Uniform}(0,\pi)\), and \(G_1\perp M\). Hence, for every
\(p>-1\),

\[
\boxed{
\mathbb E X_\theta^p
=\Gamma(p+1)P_p(c),
}
\tag{1.92}
\]

where \(P_p\) is the Legendre function represented by DLMF 14.12.7.

Put \(Y_\theta=X_\theta^{3/2}\),
\(q_j=\mathbb E M^{3j/2}=P_{3j/2}(c)\), and
\(m_j=\mathbb E Y_\theta^j\). Then

\[
m_j=\Gamma(1+3j/2)q_j,
\quad
(m_1,m_2,m_3,m_4)
=
\left(
\frac{3\sqrt\pi}{4}q_1,\,
6q_2,\,
\frac{945\sqrt\pi}{32}q_3,\,
720q_4
\right).
\tag{1.93}
\]

Direct convolution and change of variables give

\[
\begin{aligned}
f_{X_\theta}(x)&=e^{-cx}I_0(dx),\\
f_{Y_\theta}(y)
&=\frac23y^{-1/3}e^{-cy^{2/3}}I_0(dy^{2/3})
\sim\frac23y^{-1/3}\qquad(y\downarrow0).
\end{aligned}
\tag{1.94}
\]

In fact, this density is completely monotone. With
\(D_\varphi=c-d\cos\varphi\in[e^{-\theta},e^\theta]\),

\[
f_{Y_\theta}(y)
=\frac{2}{3\pi}y^{-1/3}
\int_0^\pi e^{-D_\varphi y^{2/3}}\,d\varphi.
\tag{1.94a}
\]

The function \(y^{2/3}\) is Bernstein,
\(e^{-D_\varphi y^{2/3}}\) is completely monotone by
Schilling--Song--Vondraček (2010), Theorem 3.6, and

\[
y^{-1/3}
=\frac1{\Gamma(1/3)}
\int_0^\infty e^{-ty}t^{-2/3}\,dt
\]

is completely monotone. Closure under products and positive mixtures
therefore gives \(f_{Y_\theta}\in CM\). By the Stieltjes characterization
in that book, Theorem 2.2(i), and its reciprocal theorem, Theorem 7.3,

\[
\boxed{
K_\theta\in\mathcal S,\qquad
K_\theta(z)\ne0
\quad(z\in\mathbb C\setminus(-\infty,0]).
}
\tag{1.94b}
\]

Thus \(Y_\theta\) is an exponential mixture and in particular is
infinitely divisible; this does not imply that it is GGC.

Thus, for \(K_\theta(s)=\mathbb E e^{-sY_\theta}\),

\[
K_\theta(s)\sim\Gamma(5/3)s^{-2/3},
\qquad
-s\frac{K_\theta'(s)}{K_\theta(s)}\longrightarrow\frac23.
\tag{1.95}
\]

If \(Y_\theta\) is GGC, monotone convergence in its Thorin
log-derivative shows that its drift is zero and its Thorin measure has
the necessary total mass \(2/3\). In scale form, therefore,

\[
b_0=\frac23,\qquad
b_n=\frac{\kappa_n(Y_\theta)}{(n-1)!}\quad(n\ge1)
\tag{1.96}
\]

must be a Stieltjes moment sequence.

The fixed-mass \(2\times2\) gate is strictly positive:

\[
\boxed{
\Delta_{\rm mass}
=\frac23\kappa_2-\kappa_1^2
=4q_2-\frac{15\pi}{16}q_1^2
\ge
\left(4-\frac{15\pi}{16}\right)q_2>0.
}
\tag{1.97}
\]

Here \(q_1^2\le q_2\). For the first unshifted cumulant gate, with
\(a_n=\kappa_{n+1}(Y_\theta)/n!\),

\[
\boxed{
\begin{aligned}
\Delta_0
&=a_0a_2-a_1^2
=\frac{\kappa_1\kappa_3}{2}-\kappa_2^2\\
&=\frac{2835\pi}{256}q_1q_3
+\frac{27\pi}{16}q_1^2q_2-36q_2^2.
\end{aligned}
}
\tag{1.98}
\]

Besides \(q_1q_3\ge q_2^2\), the arcsine mean satisfies

\[
\boxed{
\frac{q_1^2}{q_2}
=\frac{P_{3/2}(c)^2}{P_3(c)}
\ge\frac{256}{45\pi^2}.
}
\tag{1.99}
\]

To prove (1.99), the case \(\theta=0\) is immediate. For
\(\theta>0\), remove an irrelevant scale and write
\(M\overset d=U+\alpha\), \(\alpha\ge0\), with
\(U\sim{\rm Beta}(1/2,1/2)\). The function

\[
R(\alpha)=
\frac{\{\mathbb E(U+\alpha)^{3/2}\}^2}
{\mathbb E(U+\alpha)^3}
\]

is nondecreasing, because moment log-convexity gives

\[
\frac d{d\alpha}\log R(\alpha)
=3\left\{
\frac{\mathbb E(U+\alpha)^{1/2}}
     {\mathbb E(U+\alpha)^{3/2}}
-
\frac{\mathbb E(U+\alpha)^2}
     {\mathbb E(U+\alpha)^3}
\right\}\ge0.
\]

At \(\alpha=0\),
\(\mathbb E U^{3/2}=4/(3\pi)\) and
\(\mathbb E U^3=5/16\), proving (1.99). Consequently,

\[
\frac{\Delta_0}{q_2^2}
\ge\frac{2835\pi}{256}+\frac{48}{5\pi}-36
>
\frac{8505}{256}+\frac{168}{55}-36
=\frac{3903}{14080}>0,
\tag{1.100}
\]

where only \(3<\pi<22/7\) was used in the strict rational bound.

The shifted gate has a stronger universal form. Let \(Q\ge0\) be any
nonzero random variable with \(\mathbb E Q^4<\infty\), let
\(G_1\perp Q\), and put \(Y=QG_1^{3/2}\). Then

\[
\boxed{
\Delta_1
:=\frac{\kappa_2(Y)\kappa_4(Y)}6
-\frac{\kappa_3(Y)^2}{4}
>
\frac{69}{2}\{\mathbb E Q^2\}^3>0.
}
\tag{1.101}
\]

Indeed, write \(q_j=\mathbb E Q^j\). Exact cumulant expansion gives

\[
\begin{aligned}
12\Delta_1={}&
8640q_2q_4-810\pi q_1^2q_4
+\frac{42525\pi}{32}q_1q_2q_3\\
&-\frac{25515\pi^2}{512}q_1^3q_3
-1296q_2^3+\frac{243\pi}{4}q_1^2q_2^2
-\frac{2679075\pi}{1024}q_3^2.
\end{aligned}
\tag{1.102}
\]

By homogeneity take \(q_2=1\), and put
\(x=q_1\), \(u=x^2\), \(z=q_3\), \(w=q_4\), and \(y=xz\).
The Stieltjes moment matrices of \(Q\) imply

\[
y\ge1,\qquad
(1-u)w-z^2+2xz-1\ge0.
\tag{1.103}
\]

For \(0<u<1\), the coefficient \(8640-810\pi u\) of \(w\) in
(1.102) is positive. Substitution of the lower bound from (1.103), with
\(h=y-1\), gives

\[
12\Delta_1\ge
F(u)+\frac{E(u)}u h+\frac{A(u)}u h^2,
\tag{1.104}
\]

where

\[
\begin{aligned}
A(u)&=\frac{A_0+A_1u}{1-u},\\
A_0&=8640-\frac{2679075\pi}{1024},
\qquad
A_1=\frac{2679075\pi}{1024}-810\pi,\\
E(u)&=2A_0-\frac{9315\pi}{32}u
-\frac{25515\pi^2}{512}u^2,\\
F(u)&=\frac{A_0}{u}
+\left(\frac{16605\pi}{32}-1296\right)
+\left(\frac{243\pi}{4}
-\frac{25515\pi^2}{512}\right)u.
\end{aligned}
\tag{1.105}
\]

The elementary bounds \(3<\pi<22/7\) give

\[
\begin{gathered}
A_0>400,\quad A_1>5000,\quad F(1)>450,\\
E(1/2)>250,\qquad E(1)>-600.
\end{gathered}
\tag{1.106}
\]

Both \(E\) and \(F\) decrease. If \(E(u)\ge0\), (1.104) is greater
than \(450\). If \(E(u)<0\), then \(u>1/2\),
\(A(u)u>2500\), and completion of the square gives

\[
12\Delta_1>
450-\frac{600^2}{4\cdot2500}=414.
\]

When \(u=1\), equality in Cauchy--Schwarz makes \(Q\) constant and
direct substitution gives \(12\Delta_1=F(1)>450\). Rescaling proves
(1.101). The exact algebra and all rational certificates in
(1.97), (1.98), and (1.102)--(1.106) are independently reproduced by
[route1_q32_hankel_gates.py](../computations/route1_q32_hankel_gates.py),
using only the Python fractions.Fraction class over the formal
coefficient ring \(\mathbb Q[\sqrt\pi]\).

The remaining analytic target is also one-dimensional. Define the entire
Wright--Bessel function

\[
\boxed{
\begin{aligned}
\Phi_\theta(z)
&=3\int_0^\infty
v e^{-v^3-czv^2}I_0(dzv^2)\,dv\\
&=\sum_{n=0}^\infty\frac{(-1)^n}{n!}
\Gamma\!\left(\frac23+\frac{2n}{3}\right)P_n(c)z^n.
\end{aligned}
}
\tag{1.107}
\]

Uniform domination by
\(e^{-v^3+(c+d)R v^2}\) on every disk \(|z|\le R\) proves entire
analyticity and justifies termwise integration. On principal branches,

\[
\boxed{
K_\theta(s)=\frac23s^{-2/3}\Phi_\theta(s^{-2/3}),
\qquad
H_\theta(s):=-\frac32\frac d{ds}\log K_\theta(s)
=\frac1s+s^{-5/3}
\frac{\Phi_\theta'(s^{-2/3})}{\Phi_\theta(s^{-2/3})}.
}
\tag{1.108}
\]

The Stieltjes property also excludes zeros on the physical boundary ray,
not merely in the open slit plane. Let \(\mu_D\) be the probability
measure determined by

\[
e^{-Dy^{2/3}}=\int_0^\infty e^{-vy}\,\mu_D(dv),
\qquad
\nu(du)=\frac{u^{-2/3}}{\Gamma(1/3)}\,du.
\]

Multiplication of the two Bernstein representations in (1.94a) shows
that the Stieltjes spectral measure of \(K_\theta\) is

\[
\boxed{
\sigma_\theta
=\frac2{3\pi}\int_0^\pi
(\nu*\mu_{D_\varphi})\,d\varphi,
\qquad
K_\theta(s)=\int_0^\infty\frac{\sigma_\theta(du)}{s+u}.
}
\tag{1.108a}
\]

For every \(D,A>0\), one has \(\mu_D([0,A])>0\). Otherwise a random
variable \(S_D\) with law \(\mu_D\) would satisfy \(S_D>A\) almost
surely, and
\[
e^{-Dy^{2/3}}=\mathbb E e^{-yS_D}\le e^{-Ay},
\]
which fails for large \(y\). Fix \(t>0\) and restrict each
\(\mu_{D_\varphi}\) in (1.108a) to \([0,t/2]\). The resulting submeasure
has, near \(t\), the continuous density

\[
h_t(u)=
\frac2{3\pi\Gamma(1/3)}
\int_0^\pi\int_{[0,t/2]}
(u-v)^{-2/3}\,\mu_{D_\varphi}(dv)\,d\varphi,
\qquad h_t(t)>0.
\tag{1.108b}
\]

The Poisson-kernel boundary limit, together with the finite entire
boundary value supplied by (1.107), now gives

\[
\boxed{
\operatorname{Im}K_\theta(-t+i0)<0,\qquad
\Phi_\theta(\omega t^{-2/3})\ne0
\quad(t>0).
}
\tag{1.108c}
\]

Indeed, the contribution of this submeasure alone satisfies
\[
\lim_{\varepsilon\downarrow0}
\{-\operatorname{Im}K_\theta(-t+i\varepsilon)\}
\ge\pi h_t(t)>0.
\]

Thus \(H_\theta\), if \(Y_\theta\) is GGC, is the Stieltjes transform of
the **normalized** rate-form Thorin measure
\(\widehat\tau=(3/2)\tau\), whose mass is one. With
\(\omega=e^{-2\pi i/3}\), the upper boundary is

\[
H_\theta(-t+i0)
=-\frac1t-\omega t^{-5/3}
\frac{\Phi_\theta'(\omega t^{-2/3})}
     {\Phi_\theta(\omega t^{-2/3})}.
\tag{1.109}
\]

Where the boundary measure is absolutely continuous, its necessary
normalized density is therefore

\[
\boxed{
\widehat u_\theta(t)
=\frac{t^{-5/3}}{\pi}
\operatorname{Im}\!\left[
\omega
\frac{\Phi_\theta'(\omega t^{-2/3})}
     {\Phi_\theta(\omega t^{-2/3})}
\right]\ge0,
\qquad
u_\theta(t)=\frac23\widehat u_\theta(t).
}
\tag{1.110}
\]

Here \(u_\theta\) is the density of the unnormalized Thorin measure.
If

\[
\chi_\theta(t)=
\arg\{\omega\Phi_\theta(\omega t^{-2/3})\}
\]

then (1.108c) makes this the canonical continuous phase in
\((-\pi,0)\), and

\[
\widehat u_\theta(t)=-\frac{3}{2\pi}\chi_\theta'(t),
\qquad
u_\theta(t)=-\frac1\pi\chi_\theta'(t).
\tag{1.111}
\]

Moreover,

\[
\widehat u_\theta(t)
\sim
\frac{\sqrt3\,c\,\Gamma(4/3)}
{2\pi\Gamma(2/3)}t^{-5/3}>0
\qquad(t\to\infty).
\tag{1.112}
\]

No global conclusion is hidden in this endpoint asymptotic. The exact
remaining open obligation is

\[
\boxed{
\chi_\theta'(t)\le0
\qquad(t>0).
}
\tag{1.113}
\]

Global slit-plane and physical-ray zero-freeness have already been proved
in (1.94b) and (1.108c). Thus the phase monotonicity in (1.113),
including any boundary atoms, would prove GGC membership by the
Thorin--Bernstein criterion in Schilling--Song--Vondraček (2010),
Theorem 8.2. Equations (1.91)--(1.113), apart from the cited DLMF and
Schilling--Song--Vondraček inputs, are new project derivations.
They show that none of the first three finite gates produces a
\(q=3/2\) counterexample; the next discrete tests are the first
\(3\times3\) unshifted and shifted Hankel determinants.

<a id="wip-1-16"></a>
### WIP-1.16 — the first \(3\times3\) gates at the two exact endpoints

**Status: [COMPUTER-VERIFIED EXACT AT BOTH ENDPOINTS; PROVED AN EXACT
OBSTRUCTION TO A UNIVERSAL MULTIPLIER LEMMA; THE INTERIOR TARGET FAMILY
REMAINS OPEN].**

Continue with

\[
Y=QG_1^{3/2},\qquad G_1\perp Q,\qquad
q_j=\mathbb E Q^j,
\]

and define \(a_n=\kappa_{n+1}(Y)/n!\) as in WIP-3.1.  The two next
Stieltjes necessary conditions are

\[
\boxed{
\mathcal D_0=\det(a_{i+j})_{i,j=0}^2,\qquad
\mathcal D_1=\det(a_{i+j+1})_{i,j=0}^2.
}
\tag{1.114}
\]

Thus \(\mathcal D_0\) uses cumulants through \(\kappa _5\), whereas
\(\mathcal D_1\) uses cumulants through \(\kappa _6\).  The required raw
moments are

\[
\boxed{
\begin{aligned}
(m_1,\ldots,m_6)=\bigg(
&\frac{3\sqrt\pi}{4}q_1,\ 6q_2,\
\frac{945\sqrt\pi}{32}q_3,\ 720q_4,\\
&\frac{2027025\sqrt\pi}{256}q_5,\ 362880q_6
\bigg).
\end{aligned}
}
\tag{1.115}
\]

The ordinary moment--cumulant recurrence, followed by

\[
\det
\begin{pmatrix}
x_0&x_1&x_2\\
x_1&x_2&x_3\\
x_2&x_3&x_4
\end{pmatrix}
=x_0x_2x_4+2x_1x_2x_3-x_0x_3^2-x_1^2x_4-x_2^3,
\tag{1.116}
\]

gives sparse polynomials with respectively \(13\) and \(34\) monomials in
\(\mathbb Q[q_1,\ldots,q_6,\sqrt\pi]\).

For the target of WIP-1.15, remove the irrelevant positive scale
\(e^\theta\) and put

\[
M_r=r+(1-r)U,\qquad r=e^{-2\theta}\in(0,1],\qquad
U\sim{\rm Beta}(1/2,1/2),\qquad Q_r=M_r^{3/2}.
\tag{1.117}
\]

At the equal-rate endpoint \(r=1\), \(q_j=1\).  Exact reduction gives

\[
\boxed{
\begin{aligned}
\mathcal D_0(1)
&=\sqrt\pi\left(
-\frac{2240595}{512}
+\frac{801959535}{524288}\pi
-\frac{2679075}{65536}\pi^2
\right)>0,\\
\mathcal D_1(1)
&=492048
-\frac{398591230347}{2097152}\pi
+\frac{853617406905}{67108864}\pi^2
-\frac{651015225}{1048576}\pi^3>0.
\end{aligned}
}
\tag{1.118}
\]

At infinite contrast, \(r\downarrow0\), the multiplier is
\(Q_0=U^{3/2}\), not \(U\) itself, and

\[
(q_1,\ldots,q_6)=
\left(
\frac4{3\pi},\frac5{16},\frac{256}{315\pi},\frac{231}{1024},
\frac{4096}{6435\pi},\frac{12155}{65536}
\right).
\tag{1.119}
\]

Consequently

\[
\boxed{
\begin{aligned}
\mathcal D_0(0)
&=\frac{\sqrt\pi}{\pi^3}\left(
-64+\frac{8945109}{8192}\pi
-\frac{11058525}{32768}\pi^2
\right)>0,\\
\mathcal D_1(0)
&=\frac1{\pi^3}\left(
-1088+\frac{2815198425}{262144}\pi
-\frac{63804618135}{2097152}\pi^2
+\frac{568346625}{65536}\pi^3
\right)>0.
\end{aligned}
}
\tag{1.120}
\]

These four signs do not use floating-point evaluation.  Machin's identity

\[
\pi=16\arctan(1/5)-4\arctan(1/239)
\]

and consecutive partial sums of the alternating arctangent series prove

\[
\frac{333}{106}<\pi<\frac{355}{113}.
\]

Termwise substitution in the four brackets in (1.118)--(1.120) gives the
strict rational lower bounds

\[
\frac{18222150064275}{709631148032},\quad
\frac{1338521613795715588209}{1087995122064293888},\quad
\frac{787839691097}{22175973376},\quad
\frac{4967007794368130437}{3986707789643776},
\tag{1.121}
\]

in their displayed order.  Since every \(q_j(r)\), every cumulant, and
both determinants are continuous in \(r\), the target family passes both
\(3\times3\) gates on some neighborhood of \(r=0\) and on some
neighborhood of \(r=1\).  This continuity statement does not fill the
interior interval.

There is also a sharp warning against overgeneralizing the universal
\(2\times2\) multiplier lemma (1.101).  Let

\[
\mathbb P(Q_R=R)=\frac1{10},\qquad
\mathbb P(Q_R=1)=\frac9{10}.
\]

The polynomials \(\mathcal D_0\) and \(\mathcal D_1\) are weighted
homogeneous of weights \(9\) and \(12\), when \(q_j\) has weight \(j\).
Since \(R^{-j}\mathbb E Q_R^j\to1/10\),

\[
\boxed{
\begin{aligned}
\lim_{R\to\infty}R^{-9}\mathcal D_0
&=\frac{27\sqrt\pi}{2621440000}
\left(-166097920+51591609\pi-39690\pi^2\right)<0,\\
\lim_{R\to\infty}R^{-12}\mathcal D_1
&=\frac{27}{3355443200000}
\left(
56583509770240-17996054833728\pi\right.\\
&\hspace{37mm}\left.
-8905296249\pi^2-77157360\pi^3
\right)<0.
\end{aligned}
}
\tag{1.122}
\]

The same rational interval for \(\pi\) proves both upper bounds strictly
negative.  Hence \(Q_RG_1^{3/2}\notin GGC\) for every sufficiently large
\(R\); the exact finite choice \(R=200\) makes both determinants negative.
This is **not** a counterexample to Conjecture 1: \(Q_R\) is an auxiliary
two-point multiplier and is not the affine-arcsine multiplier in (1.117).
It proves only that the arbitrary-\(Q\) method used for (1.101) cannot be
continued unchanged at size \(3\).

All sparse expansions, the endpoint substitutions, the Machin-series
certificates, both limits in (1.122), and the finite \(R=200\) witness are
reproduced by
[route1_q32_hankel3.py](../computations/route1_q32_hankel3.py), using only
Python's `fractions.Fraction` class for every asserted sign.  A separate
Gauss--Chebyshev scan printed by that script is explicitly labelled
reconnaissance and is not used above.  An independent calculation from
closed formulas for \(\kappa_1,\ldots,\kappa_6\) reproduced every
coefficient in the exact script.

<a id="wip-1-17"></a>
### WIP-1.17 — a uniform small-contrast theorem at \(q=3/2\)

**Status: [PROVED GGC MEMBERSHIP ON A NONEXPLICIT OPEN NEIGHBORHOOD OF
EQUAL RATES; ARBITRARY CONTRAST REMAINS OPEN].**

Continue with \(X_\theta\), \(Y_\theta=X_\theta^{3/2}\), and
\(\omega=e^{-2\pi i/3}\) from WIP-1.15.  Introduce the one-rate entire
function

\[
F(z)=3\int_0^\infty v e^{-v^3-zv^2}\,dv
\]

and write its physical-ray value as

\[
\boxed{
\zeta(x):=\omega F(\omega x)=N(x)-i\pi\mathcal M(x),
\qquad x\ge0.
}
\tag{1.123}
\]

Three elementary integrations by parts, applied to
\(I_j(z)=\int_0^\infty v^j e^{-v^3-zv^2}\,dv\), eliminate
\(I_2,I_4\) from \(F=3I_1\), \(F'=-3I_3\), and \(F''=3I_5\).  Explicitly,

\[
3I_2+2zI_1=1,\qquad
2I_1-3I_4-2zI_3=0,\qquad
3I_2-3I_5-2zI_4=0.
\]

They give

\[
\boxed{9F''(z)+4z^2F'(z)+10zF(z)=9.}
\tag{1.124}
\]

Since \(\omega^3=1\), both real components of \(\zeta\) satisfy

\[
\boxed{
9N''+4x^2N'+10xN=9,\qquad
9\mathcal M''+4x^2\mathcal M'+10x\mathcal M=0.
}
\tag{1.125}
\]

Direct integration at zero and the gamma reflection formula give

\[
\begin{aligned}
N(0)&=-\frac{\Gamma(2/3)}2,&
N'(0)&=\frac{\Gamma(4/3)}2,\\
\mathcal M(0)&=\frac1{\Gamma(1/3)},&
\mathcal M'(0)&=-\frac1{\Gamma(-1/3)}>0.
\end{aligned}
\tag{1.126}
\]

Put \(T=4x^3/27\) and
\(C_*=\Gamma(1/6)/\Gamma(1/3)^2\).  Reduction of the homogeneous
equation in (1.125) to Kummer's equation, followed by the initial values,
gives

\[
\boxed{
\begin{aligned}
\mathcal M(x)
&=C_*e^{-T}U\!\left(-\frac16,\frac23,T\right)\\
&=C_*e^{-T}T^{1/3}
  U\!\left(\frac16,\frac43,T\right)\\
&=\frac{e^{-T}T^{1/3}}{\Gamma(1/3)^2}
  \int_0^\infty e^{-Tu}u^{-5/6}(1+u)^{1/6}\,du>0
  \qquad(x>0).
\end{aligned}
}
\tag{1.127}
\]

The second and third lines are respectively DLMF 13.2.40 and 13.4.4;
the latter applies because \(1/6>0\) and \(T>0\).  DLMF 13.2.42 checks
the two initial values.  DLMF 13.7.3--13.7.5, including the differentiable
remainder bound, gives

\[
\mathcal M(x)=
C_*e^{-T}T^{1/6}
\left(1+\frac1{36T}+O(T^{-2})\right),
\qquad
\frac{x\mathcal M'(x)}{\mathcal M(x)}
=\frac12-3T-\frac1{12T}+O(T^{-2}).
\tag{1.128}
\]

The matching algebraic asymptotic of \(N\) can be obtained without
crossing a Stokes line.  Let \(K_0(s)=\mathbb E e^{-sG_1^{3/2}}\) and
\(x=t^{-2/3}\).  Equation (1.108) gives

\[
K_0(-t+i0)=\frac{2x}{3}\zeta(x),\qquad
\varrho(t):=-\frac1\pi\operatorname{Im}K_0(-t+i0)
=\frac23t^{-2/3}\mathcal M(t^{-2/3}).
\tag{1.129}
\]

By (1.128), \(\varrho(t)=O(t^{-1}e^{-4/(27t^2)})\) at zero, with all
derivatives flat there, while \(\varrho(t)=O(t^{-2/3})\) at infinity.
Consequently all inverse moments exist and

\[
\int_0^\infty u^{-j-1}\varrho(u)\,du
=\frac{\Gamma(1+3j/2)}{j!},\qquad j\ge0.
\]

Apply a smooth cutoff equal to one near zero.  The cutoff part, extended
by zero to the negative half-line, is smooth because of flatness, so its
Hilbert transform is smooth at zero; the complementary Cauchy transform
is analytic there.  More explicitly, for every fixed \(m\),

\[
\frac1{u-t}=\sum_{j=0}^m\frac{t^j}{u^{j+1}}
+\frac{t^{m+1}}{u^{m+1}(u-t)},
\]

and \(u^{-m-1}\varrho(u)\) is still flat at zero.  Thus the principal-value
remainder and its required derivatives are locally bounded.  Termwise
differentiation is legitimate and yields

\[
\boxed{
\begin{aligned}
N(x)&=\frac{3}{2x}
\left(1+\Gamma(5/2)x^{-3/2}+O(x^{-3})\right),\\
N'(x)&=-\frac{3}{2x^2}
\left(1+\frac52\Gamma(5/2)x^{-3/2}+O(x^{-3})\right),\\
\frac{xN'(x)}{N(x)}&\longrightarrow-1.
\end{aligned}
}
\tag{1.130}
\]

In particular \(N(x)>0\) for all sufficiently large \(x\).

Now define the one-rate Wronskian

\[
W_0(x)=N'(x)\mathcal M(x)-N(x)\mathcal M'(x).
\]

The two equations in (1.125) give the exact first-order identity

\[
\boxed{
W_0'(x)+\frac49x^2W_0(x)=\mathcal M(x),\qquad
W_0(0)=\frac13.
}
\tag{1.131}
\]

Hence

\[
W_0(x)=e^{-4x^3/27}
\left\{\frac13+\int_0^xe^{4u^3/27}\mathcal M(u)\,du\right\}>0.
\tag{1.132}
\]

This strict sign can be made stable uniformly over a small rate contrast.
The Bessel average in (1.107) is

\[
\Phi_\theta(z)=\mathbb E F(Dz),\qquad
D=\cosh\theta-\sinh\theta\cos\varphi,\qquad
\varphi\sim{\rm Uniform}(0,\pi).
\]

Set

\[
\overline N_\theta(r)=\mathbb E N(rD),\qquad
\overline{\mathcal M}_\theta(r)=\mathbb E\mathcal M(rD).
\]

Then

\[
\omega\Phi_\theta(\omega r)
=\overline N_\theta(r)-i\pi\overline{\mathcal M}_\theta(r),
\qquad \overline{\mathcal M}_\theta(r)>0.
\tag{1.133}
\]

If

\[
\overline W_\theta
=\overline N_\theta'\overline{\mathcal M}_\theta
 -\overline N_\theta\overline{\mathcal M}_\theta',
\]

direct differentiation and symmetrization with independent copies \(D,E\)
give

\[
\boxed{
\begin{aligned}
\frac d{dr}\arg\{\omega\Phi_\theta(\omega r)\}
&=\frac{\pi\overline W_\theta(r)}
{\overline N_\theta(r)^2+\pi^2\overline{\mathcal M}_\theta(r)^2},\\
r\overline W_\theta(r)&=\mathbb E\mathscr S(rD,rE),
\end{aligned}
}
\tag{1.134}
\]

where

\[
\boxed{
\begin{aligned}
\mathscr S(x,y)=\frac12\{&
xN'(x)\mathcal M(y)+yN'(y)\mathcal M(x)\\
&-yN(x)\mathcal M'(y)-xN(y)\mathcal M'(x)\}.
\end{aligned}
}
\tag{1.135}
\]

On the diagonal,
\(\mathscr S(x,x)=xW_0(x)>0\).  More is true: there exists a scale-free
\(\varepsilon_0>0\) such that

\[
\boxed{
\left|\log\frac xy\right|<\varepsilon_0
\quad\Longrightarrow\quad
\mathscr S(x,y)>0.
}
\tag{1.136}
\]

Here are the compactness details.  At the origin, the analytic Taylor
series and \(W_0(0)=1/3\) give
\(\mathscr S(x,y)=(x+y)/6+O((x+y)^2)\).  For sufficiently large \(x,y\),
put \(R=N/\mathcal M\),
\(n=xN'/N\), and \(h=x\mathcal M'/\mathcal M\).  Then \(N,\mathcal M,R\)
are positive and

\[
2\mathscr S(x,y)=\mathcal M(x)\mathcal M(y)
\{R(x)[n(x)-h(y)]+R(y)[n(y)-h(x)]\}>0,
\]

because \(n(x)\to-1\) and \(h(x)\to-\infty\).  If (1.136) failed, a
sequence with \(\log(x_j/y_j)\to0\) and
\(\mathscr S(x_j,y_j)\le0\) would have, after passage to a subsequence,
\(x_j\to0\), \(x_j\to x\in(0,\infty)\), or \(x_j\to\infty\).  The
origin estimate, continuity together with
\(\mathscr S(x,x)>0\), and the large-quadrant estimate exclude these
three cases.

Finally,

\[
D\in[e^{-|\theta|},e^{|\theta|}],\qquad
\left|\log\frac DE\right|\le2|\theta|.
\]

Choose \(\theta_*=\varepsilon_0/2\).  If
\(\lvert\theta\rvert<\theta_*\), then (1.136) makes
\(\overline W_\theta(r)>0\) for every \(r>0\).  Since \(r=t^{-2/3}\),

\[
\chi_\theta'(t)=
-\frac{2\pi}{3}t^{-5/3}
\frac{\overline W_\theta(t^{-2/3})}
{\overline N_\theta(t^{-2/3})^2+
 \pi^2\overline{\mathcal M}_\theta(t^{-2/3})^2}<0.
\]

Combining this with the zero-freeness and phase criterion in
WIP-1.15 proves the new local theorem

\[
\boxed{
\exists\,\theta_*>0:\quad
\lvert\theta\rvert<\theta_*
\Longrightarrow
\left(e^\theta G_{1/2}+e^{-\theta}G'_{1/2}\right)^{3/2}\in GGC.
}
\tag{1.137}
\]

The proof is exact but \(\theta_*\) is nonconstructive.  It does not prove
the result for arbitrary contrast.  There is also an exact obstruction to
strengthening the method to global pointwise kernel positivity.  From
(1.130) and the exponential decay of \(\mathcal M'\),

\[
\mathscr S(x,0)
\sim-\frac{3}{4\Gamma(1/3)x}<0
\qquad(x\to\infty).
\tag{1.138}
\]

By continuity the same sign occurs for some strictly positive \(y\).
This is an obstruction to the pointwise-kernel proof only, not a
counterexample to the arcsine average or to Conjecture 1.  Equations
(1.123)--(1.138), apart from the cited DLMF formulas and the
Thorin--Bernstein criterion already cited in WIP-1.15, are new project
derivations.  An independent recalculation checked the Kummer constants
and derivative remainder, the Stieltjes boundary normalization, both
Wronskian signs, the double-average factor, the logarithmic-tube
compactness argument, and the final phase direction.

<a id="wip-1-18"></a>
### WIP-1.18 — the exact residual is never \(HM_{2/3}\)

**Status: [PROVED OBSTRUCTION TO THE GAMMA--\(HM_k\) SHORTCUT; NOT A
COUNTEREXAMPLE TO GGC MEMBERSHIP].**

Specialize (1.82) to \(B=1\).  For every finite
\(\theta\in\mathbb R\),

\[
X_\theta^{3/2}\overset d=G_{2/3}N_\theta,\qquad
N_\theta=c_0M_\theta^{3/2}\sqrt{VE},\qquad
c_0=\frac{3\sqrt3}{2},
\tag{1.139}
\]

where all factors are independent,

\[
V\sim{\rm Beta}\!\left(\frac23,\frac16\right),\qquad
E\sim\Gamma(1,1),
\]

and \(M_\theta\) is the affine arcsine mean in (1.91), supported by the
compact positive interval
\([e^{-|\theta|},e^{|\theta|}]\).  Write \(C_0=c_0^2=27/4\), and let
\(f_\theta\) denote the density of \(N_\theta\).

Conditional on \(M_\theta=m,V=v\), the density is

\[
\frac{2x}{C_0m^3v}
\exp\!\left\{-\frac{x^2}{C_0m^3v}\right\}.
\]

Put \(q_m=x^2/(C_0m^3)\).  The substitution \(t=(1-v)/v\), followed by
DLMF 13.4.4, gives

\[
\frac1{B(2/3,1/6)}
\int_0^1v^{-4/3}(1-v)^{-5/6}e^{-q/v}\,dv
=\frac{\Gamma(5/6)}{\Gamma(2/3)}
e^{-q}U\!\left(\frac16,\frac43,q\right).
\]

Using the parameter transformation DLMF 13.2.40 therefore yields the
exact density

\[
\boxed{
f_\theta(x)=
\frac{2\Gamma(5/6)}{C_0^{2/3}\Gamma(2/3)}
x^{1/3}\,
\mathbb E\!\left[
M_\theta^{-2}e^{-q_m}
U\!\left(-\frac16,\frac23,q_m\right)
\right].
}
\tag{1.140}
\]

The connection formula DLMF 13.2.42 gives, as \(q\downarrow0\),

\[
U\!\left(-\frac16,\frac23,q\right)
=A_U+B_Uq^{1/3}+O(q),
\quad
A_U=\frac{\Gamma(1/3)}{\Gamma(1/6)}>0,
\quad
B_U=\frac{\Gamma(-1/3)}{\Gamma(-1/6)}>0.
\]

Because the support of \(M_\theta\) is compact and bounded away from zero,
the expansion and its derivative are uniform under the expectation in
(1.140).  Thus

\[
\boxed{
f_\theta(x)=a_\theta x^{1/3}
\{1+b_\theta x^{2/3}+R_\theta(x)\},\qquad
R_\theta(x)=O(x^2),\quad R_\theta'(x)=O(x),
}
\tag{1.141}
\]

where

\[
\begin{aligned}
a_\theta&=
\frac{2\Gamma(5/6)}{C_0^{2/3}\Gamma(2/3)}
\frac{\Gamma(1/3)}{\Gamma(1/6)}
\mathbb E M_\theta^{-2}>0,\\
b_\theta&=
C_0^{-1/3}
\frac{\Gamma(-1/3)\Gamma(1/6)}
     {\Gamma(-1/6)\Gamma(1/3)}
\frac{\mathbb E M_\theta^{-3}}
     {\mathbb E M_\theta^{-2}}>0.
\end{aligned}
\tag{1.142}
\]

In particular the logarithmic elasticity satisfies

\[
\boxed{
\ell_\theta(x):=\frac{xf_\theta'(x)}{f_\theta(x)}
=\frac13+\frac23b_\theta x^{2/3}+O(x^{4/3}).
}
\tag{1.143}
\]

The positive second term will violate a fractional Abel necessary
condition for \(HM_{2/3}\).  Fix a center \(\xi>0\), write

\[
h_\xi(w)=f_\theta(\xi v)f_\theta(\xi/v),
\qquad w=v+v^{-1}\ge2,
\]

and suppose, for contradiction, that \(f_\theta\in HM_{2/3}\).  Sjödin's
Definition 2.1 then supplies a nonnegative measure \(H_\xi\) such that

\[
h_\xi(w)=
\int_{(w,\infty)}(\lambda-w)^{-1/3}H_\xi(d\lambda).
\tag{1.144}
\]

Define

\[
J_\xi(w)=\int_w^\infty(t-w)^{-2/3}h_\xi(t)\,dt.
\]

Tonelli's theorem and

\[
\int_w^\lambda
(t-w)^{-2/3}(\lambda-t)^{-1/3}\,dt
=B\!\left(\frac13,\frac23\right)=\frac{2\pi}{\sqrt3}
\]

give

\[
\boxed{
J_\xi(w)=\frac{2\pi}{\sqrt3}H_\xi((w,\infty)).
}
\tag{1.145}
\]

Consequently \(J_\xi\) must be nonincreasing.  In the present smooth
Gaussian-tail model \(J_\xi\in C^1(2,\infty)\), so necessarily
\(J_\xi'(w)\le0\).

Let

\[
v_t=\frac{t+\sqrt{t^2-4}}2.
\]

Differentiation under the shifted integral and the identity
\(d(\log v_t)/dt=(t^2-4)^{-1/2}\) give

\[
\boxed{
\begin{aligned}
J_\xi'(w)
 &=\int_0^\infty s^{-2/3}h_\xi'(w+s)\,ds,\\
h_\xi'(t)
 &=\frac{h_\xi(t)}{\sqrt{t^2-4}}
\{\ell_\theta(\xi v_t)-\ell_\theta(\xi/v_t)\}.
\end{aligned}
}
\tag{1.146}
\]

Fix any \(w_0>2\).  The exact small-center asymptotic is

\[
\boxed{
J_\xi'(w_0)=
\frac23a_\theta^2b_\theta\,
\xi^{4/3}\log\frac1\xi
+O_{w_0,\theta}(\xi^{4/3}),
\qquad \xi\downarrow0.
}
\tag{1.147}
\]

Here are the uniform estimates behind (1.147).  Choose a fixed large
\(L>w_0\) and a fixed sufficiently small \(\delta>0\).  On
\([w_0,L]\), (1.141)--(1.143) give \(h_\xi'(t)=O(\xi^{4/3})\), and the
endpoint weight in (1.146) is integrable.  On
\(L\le t\le\delta/\xi\), both arguments of \(f_\theta\) lie in the
uniform small-\(x\) range, and

\[
\boxed{
(t-w_0)^{-2/3}h_\xi'(t)
=\frac23a_\theta^2b_\theta\,\frac{\xi^{4/3}}t
+O(\xi^{4/3}t^{-5/3})
+O(\xi^2t^{-1/3}).
}
\tag{1.148}
\]

The two error integrals are \(O(\xi^{4/3})\), whereas the leading term
integrates to the logarithm in (1.147).

For \(t\ge\delta/\xi\), set

\[
x=\xi v_t,\qquad y=\frac{\xi}{v_t}=\frac{\xi^2}{x}.
\]

Then

\[
t=\frac{x}{\xi}+\frac{\xi}{x},\qquad
\frac{dt}{\sqrt{t^2-4}}=\frac{dx}{x}.
\]

The local bound \(f_\theta(y)\le Cy^{1/3}\), together with DLMF
13.7.3--13.7.5 applied uniformly over the compact \(M_\theta\)-support,
gives constants \(c,C,m>0\) for which

\[
f_\theta(x)+x|f_\theta'(x)|
\le C(1+x)^m e^{-cx^2}.
\]

Consequently the tail of (1.146) is bounded by

\[
\boxed{
C\xi^{4/3}\int_{\delta/2}^\infty
x^{-2}f_\theta(x)\{1+|\ell_\theta(x)|\}\,dx
=O(\xi^{4/3}).
}
\tag{1.149}
\]

This proves (1.147).  Since \(a_\theta,b_\theta>0\),
\(J_\xi'(w_0)>0\) for all sufficiently small \(\xi\), contradicting
(1.145).  We have therefore proved

\[
\boxed{
N_\theta\notin HM_{2/3}
\qquad\text{for every finite }\theta\in\mathbb R.
}
\tag{1.150}
\]

Sjödin's Theorem 3.1, with \(k=l=2/3\), would have yielded
\(G_{2/3}N_\theta\in GGC\) from \(N_\theta\in HM_{2/3}\).  Equation
(1.150) proves that this sufficient route is unavailable, including at
\(\theta=0\).  It does not say that \(X_\theta^{3/2}\) is not GGC:
WIP-1.17 proves the opposite for all sufficiently small contrasts.
Equations (1.139)--(1.150) are new project derivations.  The density
constants, Kummer signs, Abel exponent and beta constant, all three
regions in (1.147), and the tail scaling were independently recalculated
before this entry was marked proved.

<a id="wip-1-19"></a>
### WIP-1.19 — logarithmic arcsine convolution and its radial PDE

**Status: [PROVED REDUCTION AND PROVED OBSTRUCTION TO DIRECT SEPARATION
INTEGRATION BY PARTS; ALL-CONTRAST PHASE MONOTONICITY REMAINS OPEN].**

The average in (1.133) has additional exact structure.  For
\(\theta>0\), let

\[
D=\cosh\theta-\sinh\theta\cos\Phi,\qquad
\Phi\sim{\rm Uniform}(0,\pi),\qquad
a=e^{-\theta},\quad b=e^\theta.
\]

The change of variables from \(\Phi\) to \(D\), and then
\(u=\log D\), gives

\[
\boxed{
\begin{aligned}
p_D(s)
 &=\frac{\mathbf1_{(a,b)}(s)}
         {\pi\sqrt{(s-a)(b-s)}},\\
p_{\log D}(u)
 &=e^{u/2}k_\theta(u)\mathbf1_{\{|u|<\theta\}},\\
k_\theta(u)
 &=\frac1{\pi\sqrt{2(\cosh\theta-\cosh u)}}.
\end{aligned}
}
\tag{1.151}
\]

The kernel \(k_\theta\) is even, but it is not itself a probability
density; the probability normalization is

\[
\int_{-\theta}^{\theta}e^{u/2}k_\theta(u)\,du=1.
\]

The same density calculation gives the reciprocal size-bias identity

\[
\boxed{
\mathbb E h(D^{-1})=\mathbb E[D^{-1}h(D)],
\qquad \mathbb E D^{-1}=1.
}
\tag{1.152}
\]

For a suitable function \(f\), define

\[
g(x)=e^{x/2}f(e^x),\qquad
U_\theta(x)=\mathbb E f(e^xD),\qquad
\mathcal G_\theta(x)=e^{x/2}U_\theta(x).
\]

Then (1.151) becomes the even-kernel convolution

\[
\boxed{
\mathcal G_\theta(x)=
\int_{-\theta}^{\theta}k_\theta(u)g(x+u)\,du.
}
\tag{1.153}
\]

For the current ray take \(f=\zeta=N-i\pi\mathcal M\).  Multiplication by
the positive factor \(e^{x/2}\) does not change the phase, and

\[
\arg\mathcal G_\theta(x)
=\arg\{\omega\Phi_\theta(\omega e^x)\}.
\]

DLMF 14.12.7 gives
\(\mathbb E D^s=P_s(\cosh\theta)\), and DLMF 14.2.1 gives the Legendre
equation.  Applying it first to Mellin modes, and then using the
convergent integral representation, yields

\[
\boxed{
\begin{aligned}
\partial_{\theta\theta}\mathcal G_\theta
+\coth\theta\,\partial_\theta\mathcal G_\theta
 &=\partial_{xx}\mathcal G_\theta-\frac14\mathcal G_\theta,\\
\mathcal G_0(x)&=g(x),\qquad
\left.\partial_\theta\mathcal G_\theta(x)\right|_{\theta=0}=0.
\end{aligned}
}
\tag{1.154}
\]

Thus contrast evolution is a radial Klein--Gordon equation, not a scalar
maximum-principle flow.  The boundary data inherited from (1.123) and
(1.130) are

\[
\boxed{
\begin{aligned}
\mathcal G_\theta(x)
 &\sim\omega\Gamma(2/3)e^{x/2}
 &&(x\to-\infty),\\
\mathcal G_\theta(x)
 &\sim\frac32e^{-x/2}
 &&(x\to+\infty).
\end{aligned}
}
\tag{1.155}
\]

The second line uses (1.152).  Define the two currents

\[
\mathcal J_\theta
=\operatorname{Im}(\mathcal G_{\theta,x}\overline{\mathcal G_\theta}),
\qquad
\mathcal Q_\theta
=\operatorname{Im}(\mathcal G_{\theta,\theta}
                    \overline{\mathcal G_\theta}).
\]

Equation (1.154) implies the exact conservation law

\[
\boxed{
\partial_\theta\{\sinh\theta\,\mathcal Q_\theta\}
=\sinh\theta\,\partial_x\mathcal J_\theta.
}
\tag{1.156}
\]

This hyperbolic conservation law by itself does not preserve the desired
sign \(\mathcal J_\theta\ge0\).

There is also an exact separation identity.  Write

\[
g(x)=A(x)-iC(x)=\varrho(x)e^{i\phi(x)},\qquad C(x)>0,
\]

and define the symmetric two-point current

\[
\mathcal K(p,q)=\frac12\{
A'(p)C(q)+A'(q)C(p)-A(p)C'(q)-A(q)C'(p)\}.
\tag{1.157}
\]

For \(p=m+\delta,q=m-\delta\), direct differentiation gives

\[
\boxed{
\begin{aligned}
\mathcal K(m+\delta,m-\delta)
 &=\frac12\partial_\delta
 \left[
 \varrho(m+\delta)\varrho(m-\delta)
 \sin\{\phi(m+\delta)-\phi(m-\delta)\}
 \right],\\
\mathcal K(\log x,\log y)
 &=\pi e^{(\log x+\log y)/2}\mathscr S(x,y).
\end{aligned}
}
\tag{1.158}
\]

The one-scale Wronskian (1.132) gives
\(\phi'(x)>0\) and \(-2\pi/3<\phi(x)<0\).  Hence the expression inside
the separation derivative in (1.158) is positive for \(\delta>0\), but
its derivative need not be positive; this is precisely how the
separated-scale sign failure (1.138) can occur.

Expanding the convolution current and symmetrizing gives

\[
\boxed{
\mathcal J_\theta(x)=
\iint_{(-\theta,\theta)^2}
k_\theta(u)k_\theta(v)
\mathcal K(x+u,x+v)\,du\,dv.
}
\tag{1.159}
\]

With \(m=(u+v)/2\), \(\delta=(u-v)/2\), the same identity is, as an
absolutely convergent two-dimensional Lebesgue integral,

\[
\boxed{
\begin{aligned}
\mathcal J_\theta(x)
=2\int_{-\theta}^{\theta}
\int_0^{\theta-|m|}
&k_\theta(m+\delta)k_\theta(m-\delta)\\
&\times\partial_\delta\!\left[
\varrho(x+m+\delta)\varrho(x+m-\delta)
\sin\Delta\phi
\right]\,d\delta\,dm .
\end{aligned}
}
\tag{1.160}
\]

The factor \(2\) includes both the Jacobian and the symmetry
\(\delta\leftrightarrow-\delta\).  At \(m=0\) the inner endpoint has a
corner singularity, so (1.160) is not a license for pointwise
one-dimensional integration by parts on that exceptional slice; the
original two-dimensional integral is nevertheless absolutely integrable.

Finally, if \(L_\theta(u)=\log k_\theta(u)\), then

\[
\boxed{
\begin{aligned}
L_\theta'(u)
 &=\frac{\sinh u}{2(\cosh\theta-\cosh u)},\\
L_\theta''(u)
 &=\frac{\cosh\theta\cosh u-1}
 {2(\cosh\theta-\cosh u)^2}>0,\\
\partial_\delta\log\{
k_\theta(m+\delta)k_\theta(m-\delta)\}
 &=L_\theta'(m+\delta)-L_\theta'(m-\delta)>0
 \qquad(\delta>0).
\end{aligned}
}
\tag{1.161}
\]

Thus the arcsine kernel product *increases* with separation and has
square-root singularities at the boundary.  A formal integration by parts
in (1.160) would produce a nonpositive bulk term and an uncontrolled
singular boundary term.  We have proved the precise limitation

\[
\boxed{
\text{the direct separation integration-by-parts argument does not
determine the sign of }\mathcal J_\theta.
}
\tag{1.162}
\]

Equations (1.151)--(1.162) are new project derivations.  Their density
normalization, reciprocal bias, PDE sign, conservation law, Jacobian and
factor \(2\), and the kernel convexity were independently recalculated.
The viable all-contrast target is now an Abel-type boundary-compensation
inequality for (1.160), not ordinary pointwise positivity, TP\(_2\), or
naive separation integration by parts.
