# Route 5G: three-rate reductions and anchor theorems

Third-atom conditioning, Lauricella--Appell reduction, and the three-rate exponential and total-shape-two anchor theorems.

Entries: WIP-5.32, WIP-5.33, WIP-5.34, WIP-5.35, WIP-5.37.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

Original WIP identifiers and equation numbers are preserved. Positional words such as "above" and "below" refer to the original numbered proof sequence.

## Progress entries


<a id="wip-5-32"></a>
### WIP-5.32 — exact third-atom conditioning and why naive barycentric recursion fails

**Status: [PROVED EXACT REDUCTION AND SEVERAL STRUCTURAL OBSTRUCTIONS;
NOT A COUNTEREXAMPLE TO GGC MEMBERSHIP].**

Let \(F\) be a compactly supported probability law on \((0,\infty)\),
let \(B_0,\beta>0\), and put

\[
T=B_0+\beta,\qquad k=\frac T2,qquad
A=\frac{B_0}{2},\qquad C=\frac\beta2,
\qquad D=k+\frac12,
\qquad m=\min(A,C),\quad h=\max(A,C).
\tag{5.329}
\]

For

\[
N=M_{B_0}(F),qquad U\sim {\rm Beta}(B_0,\beta),
\qquad M_+=UN+(1-U)d,\quad d>0,
\]

with \(U\perp N\), Dirichlet aggregation gives

\[
\boxed{
M_+\overset d=M_T\!\left(\frac{B_0}{T}F+\frac\beta T\delta_d\right).
}
\tag{5.330}
\]

This is the exact one-atom update that a Route-5 recursion must preserve
after squaring.  Conditional on \(N=n\), WIP-5.30 applies with scales
\(n,d\).  Let \(\rho=\rho_{A,C}\) be the positive measure of mass
\(m\) on \((0,1)\) given by

\[
\rho(dt)=
\frac{\Gamma(D)^2}
     {\Gamma(m)\Gamma(h)\Gamma(D-m)\Gamma(D-h)}
\frac{t^{k-1}(1-t)^{-1/2}}
     {|{}_2F_1(m,h;D;t^{-1}+i0)|^2}\,dt.
\tag{5.331}
\]

Define

\[
S_t(n,d)=n^2+d^2-t(n-d)^2,
\qquad
\lambda_\pm(t;n,d)=
\frac{S_t(n,d)\pm\sqrt{S_t(n,d)^2-4n^2d^2}}2.
\tag{5.332}
\]

Since \(S_t(n,d)\ge2nd\), both roots are positive.  The conditional
scale-form Thorin measure is

\[
\boxed{
\tau_n=(A-m)\delta_{n^2}+(C-m)\delta_{d^2}
       +(\lambda_+(\,\cdot\,;n,d))_\#\rho
       +(\lambda_-(\,\cdot\,;n,d))_\#\rho,
\qquad |\tau_n|=k.
}
\tag{5.333}
\]

Equivalently,

\[
\begin{aligned}
H_n(s)
&:=\mathbb E_U(1+s(Un+(1-U)d)^2)^{-k}\\
&=(1+sn^2)^{-A}(1+sd^2)^{-C}
{}_2F_1\!\left(
A,C;D;
\frac{s(n-d)^2}{(1+sn^2)(1+sd^2)}
\right)\\
&=e^{-\Phi_n(s)},
\qquad
\Phi_n(s)=\int_{(0,\infty)}\log(1+sx)\,\tau_n(dx).
\end{aligned}
\tag{5.334}
\]

The unconditional transform of the updated squared mean is therefore

\[
H(s)=\mathbb E_N H_N(s)=\mathbb E_Ne^{-\Phi_N(s)}.
\tag{5.335}
\]

This is an average of Thorin exponentials, not the exponential of an
averaged Thorin measure.  More precisely, put

\[
g_n(s)=\Phi_n'(s)
=\int\frac{x}{1+sx}\,\tau_n(dx),
\qquad
\frac{d\mathbb P_s}{d\mathbb P_N}(n)=\frac{H_n(s)}{H(s)}.
\]

Then the exact recognition function is the nonlinear posterior quotient

\[
\boxed{
g(s):=-\frac{H'(s)}{H(s)}
=\mathbb E_s[g_N(s)].
}
\tag{5.336}
\]

Compact support bounded away from zero gives
\(\lim_{s\to\infty}sg(s)=k\).  Hence
\(G_kM_+^2\in GGC\) is equivalent to \(g\) being a Stieltjes function;
if this holds, its rate-form Thorin measure \(\mathcal U_+\), the
reciprocal image of the scale-form measure, is recovered for
\(0<a<b<\infty\) when the endpoints are not atoms by

\[
\mathcal U_+((a,b))
=-\frac1\pi\lim_{\varepsilon\downarrow0}
\int_a^b
\Im\frac{
 \mathbb E[H_N(-t+i\varepsilon)g_N(-t+i\varepsilon)]}
 {\mathbb E H_N(-t+i\varepsilon)}\,dt.
\tag{5.337}
\]

Already the first two real-axis derivatives show why conditional GGC
membership does not close the argument:

\[
\boxed{
g'(s)=\mathbb E_sg_N'(s)-\operatorname{Var}_s(g_N(s))<0,
}
\tag{5.338}
\]

whereas

\[
g''(s)=\mathbb E_sg_N''(s)
-3\operatorname{Cov}_s(g_N(s),g_N'(s))
+\kappa_{3,s}(g_N(s))
\tag{5.339}
\]

has no termwise sign.  Thus complete monotonicity requires control of all
posterior cumulant corrections.

Three exact obstructions dispose of the literal recursion.  First, for
every \(s>0\), \(n\mapsto H_n(s)\) is strictly decreasing and
\(n\mapsto\Phi_n(s)\) is strictly increasing.  If \(N\) is
nondegenerate, strict Jensen gives

\[
\boxed{
H(s)=\mathbb E e^{-\Phi_N(s)}
>e^{-\mathbb E\Phi_N(s)}.
}
\tag{5.340}
\]

Here and below the strict inequality in (5.340) is asserted for \(s>0\);
at \(s=0\) both sides equal one.

Consequently the averaged conditional measure
\(\mathbb E\tau_N\) cannot be the desired Thorin measure.

Second, suppose \(\operatorname{supp}N\subset[l,r]\), put
\(R=\max(r,d)\), and write \(W=Un+(1-U)d\).  Direct differentiation
gives

\[
\frac{\partial^2H_n(s)}{\partial n^2}
=2ks\,\mathbb E\!\left[
U^2(1+sW^2)^{-k-2}\{(2k+1)sW^2-1\}
\right].
\tag{5.341}
\]

Since \(2k+1=T+1\),

\[
0<s<\frac1{(T+1)R^2}
\quad\Longrightarrow\quad
\frac{\partial^2H_n(s)}{\partial n^2}<0.
\tag{5.342}
\]

By contrast, every fixed positive generalized-Stieltjes operator

\[
K_s(n)=\int_{[0,\infty)}(1+tn)^{-B_0}\,\nu_s(dt),
\qquad \nu_s\ge0,
\]

has \(K_s''(n)\ge0\).  Hence no operator of this form can agree pointwise
with the outer update on a nontrivial interval of \(n\), even locally for
small \(s\).  This does not exclude a support-dependent or nonlinear
kernel, nor an identity that holds only after averaging over a particular
law of \(N\).

Third, write

\[
a_j(n)=\int x^j\,\tau_n(dx),
\qquad
-\log H(s)=\sum_{j\ge1}\frac{(-1)^{j+1}}j a_j^*s^j.
\]

Expanding the logarithm of (5.335) gives the unavoidable corrections

\[
\boxed{
\begin{aligned}
a_1^*&=\mathbb E a_1(N),\\
a_2^*&=\mathbb E a_2(N)+\operatorname{Var}(a_1(N)),\\
a_3^*&=\mathbb E a_3(N)
 +\frac32\operatorname{Cov}(a_1(N),a_2(N))
 +\frac12\kappa_3(a_1(N)).
\end{aligned}
}
\tag{5.343}
\]

Here

\[
\boxed{
a_1(n)=
\frac{B_0(B_0+1)n^2+2B_0\beta dn+\beta(\beta+1)d^2}
     {2(T+1)},
\qquad a_1'(n)>0.
}
\tag{5.344}
\]

Thus a nondegenerate \(N\) already forces

\[
a_2^*-\int x^2\,\mathbb E[\tau_N](dx)
=\operatorname{Var}(a_1(N))>0.
\tag{5.345}
\]

Nor does ordinary Dirichlet associativity repair the mismatch.  The
literal atom at \(n^2\) in (5.333) has mass \(A-m<A\) (or is absent),
and both continuous pushforwards depend on that same \(n\).  Replacing an
order-\(A\) mean by an order-\(A-m\) mean with the same nondegenerate
base changes its variance from
\(\operatorname{Var}_F(X)/(A+1)\) to
\(\operatorname{Var}_F(X)/(A-m+1)\).  Therefore the standard
barycentric associativity identity cannot be applied to (5.333) as
written.

The useful output is the exact nonlinear target (5.336)--(5.337) and the
cumulant ledger (5.343), not a negative answer to the three-rate square
problem.  All formulas after the conditional WIP-5.30 input are new
project derivations.

<a id="wip-5-33"></a>
### WIP-5.33 — exact three-rate Lauricella--Appell reduction and a multivariate-kernel obstruction

**Status: [PROVED REDUCTION AND PROVED GENERIC OBSTRUCTION TO A RAW
MULTIVARIATE MARKOV REPRESENTATION; NOT A GGC COUNTEREXAMPLE].**

Let \(a,b,c>0\), \(B=a+b+c\), \(k=B/2\), and order three scales as
\(0<l<d<r\).  For

\[
(P_r,P_d,P_l)\sim {\rm Dirichlet}(a,b,c),
\qquad M=rP_r+dP_d+lP_l,
\qquad Z=G_kM^2,
\]

put \(\zeta=\sqrt s\).  Combining the two factors of
\((1+sM^2)^{-k}\) by the Feynman beta identity and then applying the
Markov--Krein identity of total order \(B=2k\) gives

\[
\boxed{
L_Z(s)=\frac1{{\rm B}(k,k)}\int_0^1[v(1-v)]^{k-1}
\prod_{(x,\gamma)=(r,a),(d,b),(l,c)}
[1+i\zeta(2v-1)x]^{-\gamma}\,dv.
}
\tag{5.346}
\]

Set

\[
\xi_x=-\frac{2i\zeta x}{1-i\zeta x}.
\]

Euler's integral for the Lauricella function gives

\[
L_Z(s)=
\prod_x(1-i\zeta x)^{-\gamma_x}
F_D^{(3)}(k;a,b,c;2k;\xi_r,\xi_d,\xi_l).
\tag{5.347}
\]

Because \(a+b+c=2k\), the complementary-variable transformation removes
one Lauricella variable:

\[
F_D^{(3)}(k;a,b,c;2k;\xi_r,\xi_d,\xi_l)
=(1-\xi_l)^{-k}
F_1(k;a,b;2k;\eta_r,\eta_d),
\tag{5.348}
\]

where

\[
\eta_x=\frac{\xi_x-\xi_l}{1-\xi_l}
=-\frac{2i\zeta(x-l)}{(1-i\zeta x)(1+i\zeta l)}.
\]

If \(\theta_x=\arctan(\zeta x)\) and
\(\Delta_x=\theta_x-\theta_l\), then
\(\eta_x=1-e^{2i\Delta_x}\).  Hence the exact two-variable form is

\[
\boxed{
\begin{aligned}
L_Z(s)
={}&\prod_x(1+sx^2)^{-\gamma_x/2}
e^{i(a\Delta_r+b\Delta_d)}\\
&\times F_1\!\left(k;a,b;2k;
1-e^{2i\Delta_r},1-e^{2i\Delta_d}\right).
\end{aligned}
}
\tag{5.349}
\]

Formula (5.346) proves directly that the apparently complex expression
(5.349) is real and strictly positive for \(s\ge0\).

The two-rate boundary is an exact normalization check.  When \(b=0\),
NIST DLMF 15.8.14 gives

\[
e^{ia\Delta}
{}_2F_1(k,a;2k;1-e^{2i\Delta})
={}_2F_1\!\left(\frac a2,\frac c2;
k+\frac12;\sin^2\Delta\right),
\tag{5.350}
\]

and

\[
\sin^2\Delta
=\frac{(r-l)^2s}{(1+r^2s)(1+l^2s)}.
\]

Thus (5.349) reduces exactly to WIP-5.30.  For the genuine Appell factor

\[
\Psi(x,y)=F_1(k;a,b;2k;x,y),
\]

the two logarithmic derivatives are contiguous Appell quotients:

\[
\boxed{
\begin{aligned}
\partial_x\log\Psi
&=\frac a2
\frac{F_1(k+1;a+1,b;2k+1;x,y)}{\Psi(x,y)},\\
\partial_y\log\Psi
&=\frac b2
\frac{F_1(k+1;a,b+1;2k+1;x,y)}{\Psi(x,y)}.
\end{aligned}
}
\tag{5.351}
\]

The one-variable Dyachenko--Karp/Küstner theorem used in WIP-5.30 does
not cover these quotients, and the physical curve in (5.349) is complex.
Moreover, the most direct multivariate analogue is generically
impossible.  Write

\[
\Phi(z)=F_D^{(3)}(k;a,b,c;2k;z_1,z_2,z_3)
=\mathbb E_{Q\sim{\rm Beta}(k,k)}
\prod_{j=1}^3(1-z_jQ)^{-\alpha_j},
\qquad (\alpha_1,\alpha_2,\alpha_3)=(a,b,c).
\tag{5.352}
\]

For distinct \(i,j,h\), a fourth-order cumulant calculation gives

\[
\boxed{
[z_i z_j z_h^2]\log\Phi(z)
=\frac{\alpha_i\alpha_j\alpha_h(B-3\alpha_h)}
       {16(B+1)^2(B+3)}.
}
\tag{5.353}
\]

For completeness, symmetry of \(Q\sim{\rm Beta}(B/2,B/2)\) yields

\[
\operatorname{Var}Q=\frac1{4(B+1)},
\qquad
\mathbb E(Q-1/2)^4=\frac3{16(B+1)(B+3)},
\]

and the coefficient in (5.353) is

\[
\frac{\alpha_i\alpha_j\alpha_h}{2}
\kappa(Q,Q,Q^2)
+\frac{\alpha_i\alpha_j\alpha_h^2}{2}\kappa_4(Q),
\]

with

\[
\kappa(Q,Q,Q^2)=\frac{B}{8(B+1)^2(B+3)},
\qquad
\kappa_4(Q)=-\frac3{8(B+1)^2(B+3)}.
\]

Suppose there were a fixed positive multivariate Markov representation

\[
\nabla\log\Phi(z)
=\int_{\mathbb R_+^3}
\frac{t}{1-\langle z,t\rangle}\,\varrho(dt),
\qquad \varrho\ge0.
\tag{5.354}
\]

After radial integration, (5.354) would force

\[
[z_i z_j z_h^2]\log\Phi(z)
=3\int t_it_jt_h^2\,\varrho(dt)\ge0.
\tag{5.355}
\]

If the three shapes are unequal, their largest member exceeds \(B/3\);
choosing it as \(\alpha_h\) makes (5.353) negative, contradicting
(5.355).  Thus a direct fixed positive multivariate Markov kernel for the
raw Lauricella factor cannot exist for unequal shapes.  The coefficient
vanishes at equal shapes, so this test is silent there.

This obstruction does not address the one-dimensional composite
\(s\mapsto\Phi(\xi_r(s),\xi_d(s),\xi_l(s))\), where phase and prefactor
terms can cancel.  It is therefore not a counterexample to the GGC square
claim.  The viable three-rate target is the boundary phase of the
one-dimensional Appell expression (5.349), or equivalently the nonlinear
conditional quotient (5.336), rather than (5.354).  Equations
(5.346)--(5.355), except for the cited one-variable quadratic
transformation, are new project derivations.

<a id="wip-5-34"></a>
### WIP-5.34 — an explicit Thorin measure for three exponentials

**Status: [PROVED THE SQUARE OF EVERY THREE-RATE SUM WITH SHAPES
\((1,1,1)\) IS GGC].**

Let \(0<l<d<r\), let \(E_l,E_d,E_r\) be independent unit-rate
exponentials, and set

\[
X=lE_l+dE_d+rE_r.
\]

Gamma--Dirichlet independence gives

\[
X\overset d=G_3M,\qquad
M=lP_l+dP_d+rP_r,\qquad
(P_l,P_d,P_r)\sim{\rm Dirichlet}(1,1,1),
\tag{5.356}
\]

with \(G_3\perp M\).  A direct slice of the uniform Dirichlet triangle
gives the linear spline density

\[
\boxed{
f_M(x)=
\frac{2(x-l)}{(r-l)(d-l)}\mathbf 1_{(l,d)}(x)
+\frac{2(r-x)}{(r-l)(r-d)}\mathbf 1_{(d,r)}(x).
}
\tag{5.357}
\]

Take \(G_{3/2}\perp M\), put \(Z=G_{3/2}M^2\), and write

\[
L(s)=\mathbb E e^{-sZ}
=\mathbb E(1+sM^2)^{-3/2}.
\]

For \(F_x(s)=\sqrt{1+sx^2}\), one has
\(\partial_x^2F_x(s)=s(1+sx^2)^{-3/2}\).  The Peano kernel for the
second divided difference, or direct integration against (5.357), gives

\[
\boxed{
\begin{aligned}
L(s)
&=\frac2s[l,d,r]\,F_{\bullet}(s)\\
&=\frac2{r-l}
\left\{
\frac{d+r}{F_d(s)+F_r(s)}
-\frac{l+d}{F_l(s)+F_d(s)}
\right\}.
\end{aligned}
}
\tag{5.358}
\]

The expression at \(s=0\) is understood by continuity and equals one.
For \(s>0\), define

\[
\theta_x(s)=\operatorname{arsinh}(x\sqrt s).
\]

Since \(x\sqrt s=\sinh\theta_x\) and
\(F_x(s)=\cosh\theta_x\), the elementary sum and difference formulas
turn (5.358) into

\[
\boxed{
L(s)=
\frac{2\sinh((\theta_r-\theta_l)/2)}
{(r-l)\sqrt s\,
 \cosh((\theta_d+\theta_r)/2)
 \cosh((\theta_l+\theta_d)/2)}.
}
\tag{5.359}
\]

Equivalently,

\[
L(s)^2=
\frac{8\{F_rF_l-srl-1\}}
{s(r-l)^2
 \{F_rF_d+srd+1\}
 \{F_lF_d+sld+1\}},
\tag{5.360}
\]

where all \(F_x\) are evaluated at \(s\).

Formula (5.359) also proves the zero-free property needed for logarithmic
inversion.  On
\(\mathbb C\setminus(-\infty,0]\), take the principal square root and
principal \(\operatorname{arsinh}\).  Then
\(\Re\theta_x>0\).  Neither denominator hyperbolic-cosine factor can
vanish.  If the numerator hyperbolic sine vanished, then
\(\theta_r-\theta_l\in2\pi i\mathbb Z\), which would imply
\(\sinh\theta_r=\sinh\theta_l\), hence \(r\sqrt s=l\sqrt s\), an
impossibility away from the removable point \(s=0\).  Thus \(L\) has a
single-valued analytic logarithm on the slit plane.

The boundary phase is explicit.  For \(x>y>0\) and
\(x^{-2}<u<y^{-2}\), define

\[
\phi_{x,y}(u)=
\arg\!\left(
1-uxy+i\sqrt{ux^2-1}\sqrt{1-uy^2}
\right)\in(0,\pi).
\tag{5.361}
\]

Writing the real and imaginary parts as \(a\) and \(b\), respectively,
one obtains

\[
a^2+b^2=u(x-y)^2,
\qquad
\boxed{
\phi_{x,y}'(u)=
\frac{1+uxy}
{2u\sqrt{ux^2-1}\sqrt{1-uy^2}}>0.
}
\tag{5.362}
\]

Indeed, differentiating \(\arg(a+ib)\) gives
\((ab'-ba')/(a^2+b^2)\); after multiplication by
\(2(ux^2-1)(1-uy^2)\), its numerator factors as
\((x-y)^2(1+uxy)\).  Moreover,

\[
\phi_{x,y}(x^{-2}+)=0,\qquad
\phi_{x,y}(y^{-2}-)=\pi.
\tag{5.363}
\]

Let \(\psi(s)=-\log L(s)\), with \(\psi(0)=0\), and let

\[
\eta(u)=\frac1\pi\Im\psi(-u+i0)
\]

denote the continuous, unwrapped upper boundary phase.  Substituting

\[
F_x(-u+i0)=
\begin{cases}
\sqrt{1-ux^2},&u<x^{-2},\\
i\sqrt{ux^2-1},&u>x^{-2}
\end{cases}
\]

into (5.360) gives

On the second open interval in (5.364), the denominator factor involving
\((r,d)\) reaches the negative real axis from the upper half-plane.  This
fixes the additional \(-\pi\) in the continuously unwrapped argument of
\(L^2\); after the last threshold the same continuation fixes the terminal
argument at \(-3\pi\).  Thus the constants in (5.364) are branch data, not
principal-argument conventions.

\[
\boxed{
\eta(u)=
\begin{cases}
0,
&0<u\le r^{-2},\\[2mm]
\dfrac{\phi_{r,d}(u)+\phi_{r,l}(u)}{2\pi},
&r^{-2}<u<d^{-2},\\[3mm]
\dfrac12+
\dfrac{\phi_{r,l}(u)+\phi_{d,l}(u)}{2\pi},
&d^{-2}<u<l^{-2},\\[3mm]
\dfrac32,
&u\ge l^{-2}.
\end{cases}
}
\tag{5.364}
\]

The endpoint values (5.363) show that the four pieces join continuously.
Equations (5.362)--(5.364) prove that \(\eta\) is nondecreasing, is
strictly increasing on \((r^{-2},l^{-2})\) away from \(d^{-2}\), and has
total increase \(3/2\).  Its two nonzero density pieces are

\[
\eta'(u)=
\begin{cases}
\dfrac1{4\pi u}\left\{
\dfrac{1+urd}{\sqrt{ur^2-1}\sqrt{1-ud^2}}
+\dfrac{1+url}{\sqrt{ur^2-1}\sqrt{1-ul^2}}
\right\},
&r^{-2}<u<d^{-2},\\[4mm]
\dfrac1{4\pi u}\left\{
\dfrac{1+url}{\sqrt{ur^2-1}\sqrt{1-ul^2}}
+\dfrac{1+udl}{\sqrt{ud^2-1}\sqrt{1-ul^2}}
\right\},
&d^{-2}<u<l^{-2}.
\end{cases}
\tag{5.365}
\]

There are no endpoint atoms.  To finish the analytic step, put
\(g=\psi'=-L'/L\).  It is holomorphic on the slit plane, is bounded at
zero, and satisfies

\[
g(s)\sim\frac{3}{2s}\qquad(s\to\infty),
\]

because \(M\) is bounded away from zero.  Along the upper bank of the
cut,

\[
-\frac1\pi\Im g(-u+i0)=\eta'(u)
\]

in the distributional sense.  Formula (5.365) has only integrable
inverse-square-root singularities,
\(O(|u-u_0|^{-1/2})\), at the three thresholds; hence the small arcs in
the corresponding indented keyhole contours vanish.  The keyhole Cauchy
formula, with the zero-free property above and the decay of \(g\),
therefore yields

\[
\boxed{
g(s)=\int_{[r^{-2},l^{-2}]}\frac{d\eta(u)}{s+u},
\qquad
-\log L(s)=
\int_{[r^{-2},l^{-2}]}
\log\!\left(1+\frac{s}{u}\right)d\eta(u).
}
\tag{5.366}
\]

Thus \(d\eta\) is the **rate-form Thorin measure** of \(Z\), with total
mass \(3/2\).  In particular,

\[
\boxed{G_{3/2}M^2\in GGC.}
\tag{5.367}
\]

Finally, gamma duplication gives, with independent factors,

\[
G_3^2\overset d=4G_{3/2}G_2,\qquad
X^2\overset d=4(G_{3/2}M^2)G_2.
\]

Bondesson's independent-product theorem and scale closure prove

\[
\boxed{
\left(
\frac{G_1^{(1)}}{b_1}
+\frac{G_1^{(2)}}{b_2}
+\frac{G_1^{(3)}}{b_3}
\right)^2\in GGC
\qquad(b_1,b_2,b_3>0).
}
\tag{5.368}
\]

The proof above treats distinct scales; repetitions follow either by
merging gamma variables or by weak closure.  This is the first project
theorem with three genuinely distinct rates and total shape greater than
one.  It is not covered by the arbitrary-support theorem at total shape
at most one or by the complete two-rate theorem.  The spline calculation,
hyperbolic factorization, angle derivative, and explicit Thorin density
are new project derivations; the external inputs are the standard
gamma--Dirichlet identity, the cut-plane Stieltjes/Thorin inversion cited
in the [source map](references.md), gamma duplication, and Bondesson's
product theorem.

<a id="wip-5-35"></a>
### WIP-5.35 — a three-rate theorem at total shape two

**Status: [PROVED FOR THREE POSITIVE SHAPES NOT EXCEEDING ONE].**

Let \(0<l<d<r\), let \(a,b,c\in(0,1)\) satisfy
\(a+b+c=2\), and let all gamma variables below be independent and
unit-rate. Then

\[
\boxed{
X=rG_a+dG_b+lG_c
\quad\Longrightarrow\quad
X^2\in GGC.
}
\tag{5.369}
\]

The endpoint cases \(0<a,b,c\le1\), \(a+b+c=2\), will follow only as
weak-limit corollaries; the pointwise formulas below are asserted for
the open parameter range.

Gamma--Dirichlet independence gives

\[
X\overset d=G_2M,\qquad
M=rP_r+dP_d+lP_l,\qquad
(P_r,P_d,P_l)\sim{\rm Dirichlet}(a,b,c),
\tag{5.370}
\]

with \(G_2\perp M\). On \(\mathbb C\setminus[l,r]\), define

\[
F(z)=\mathbb E\frac1{z-M},\qquad
Q(z)=(z-r)^{-a}(z-d)^{-b}(z-l)^{-c},
\tag{5.371}
\]

where \(Q\) is positive on \((r,\infty)\). The Markov--Krein identity
at total order two says

\[
\mathbb E(z-M)^{-2}=Q(z),\qquad F'(z)=-Q(z).
\tag{5.372}
\]

Put \(Z=G_1M^2\), \(G_1\perp M\), and
\(L(s)=\mathbb E e^{-sZ}=\mathbb E(1+sM^2)^{-1}\). Partial fractions
give

\[
\boxed{
L(s)=\frac{i}{2\sqrt s}
\left\{
F\!\left(\frac{i}{\sqrt s}\right)
-F\!\left(-\frac{i}{\sqrt s}\right)
\right\}.
}
\tag{5.373}
\]

For \(s=-u+i0\) and \(x=u^{-1/2}\), the principal square root has
\(i/\sqrt s\to x+i0\). Hence

\[
\boxed{
L(-u+i0)=\frac x2C(x),\qquad
C(x)=F_+(x)-F(-x)
=-\int_{-x}^{x}Q_+(t)\,dt.
}
\tag{5.374}
\]

The upper-bank phases of \(Q\) are

\[
Q_+(t)=
\begin{cases}
Q(t)>0,&t<l,\\
e^{i\pi c}q_-(t),&l<t<d,\\
e^{-i\pi a}q_+(t),&d<t<r,
\end{cases}
\tag{5.375}
\]

where

\[
\begin{aligned}
p(x)&=(r+x)^{-a}(d+x)^{-b}(l+x)^{-c},\\
q_-(x)&=(r-x)^{-a}(d-x)^{-b}(x-l)^{-c},\\
q_+(x)&=(r-x)^{-a}(x-d)^{-b}(x-l)^{-c}.
\end{aligned}
\tag{5.376}
\]

We prove that the continuously unwrapped function
\(x\mapsto\arg C(x)\) increases from \(-\pi\) to \(0\).
First let \(l<x<d\), and set

\[
\begin{aligned}
P(x)&=\int_{-l}^{x}
(r+t)^{-a}(d+t)^{-b}(l+t)^{-c}\,dt,\\
J(x)&=\int_l^x q_-(t)\,dt,\qquad
D(x)=-C(x)=P(x)+e^{i\pi c}J(x).
\end{aligned}
\]

Direct differentiation gives

\[
\boxed{
\frac d{dx}\arg C(x)
=\frac{\sin(\pi c)\{q_-(x)P(x)-p(x)J(x)\}}
{|D(x)|^2}.
}
\tag{5.377}
\]

Scaling the two integrals to \([0,1]\) yields

\[
\begin{aligned}
P(x)&=(x+l)^{1-c}\int_0^1
\frac{y^{-c}\,dy}
{[r-l+(x+l)y]^a[d-l+(x+l)y]^b},\\
J(x)&=(x-l)^{1-c}\int_0^1
\frac{y^{-c}\,dy}
{[r-l-(x-l)y]^a[d-l-(x-l)y]^b}.
\end{aligned}
\tag{5.378}
\]

For \(R=r,d\), the quotient

\[
y\longmapsto
\frac{R-l+(x+l)y}{R-l-(x-l)y}
\]

increases on \([0,1]\). Therefore

\[
\frac{J(x)}{P(x)}
\le
\left(\frac{x-l}{x+l}\right)^{1-c}
\left(\frac{r+x}{r-x}\right)^a
\left(\frac{d+x}{d-x}\right)^b
<
\frac{q_-(x)}{p(x)}.
\tag{5.379}
\]

The quotient of the final right-hand side by the preceding bound is
exactly \((x+l)/(x-l)>1\), because \(a+b+c=2\). Thus (5.377) is
positive.

Now let \(d<x<r\), retain \(P\), and put

\[
J=\int_l^d q_-(t)\,dt,\quad
H=\int_d^r q_+(t)\,dt,\quad
K(x)=\int_d^xq_+(t)\,dt,\quad R(x)=H-K(x).
\]

Since \(a,b,c<1\), all endpoint integrals are finite. With
\(S=F(r)-F(l)>0\), integration of \(F'=-Q\) across the upper bank gives

\[
\boxed{
S=-e^{i\pi c}J-e^{-i\pi a}H,\qquad
J\sin(\pi c)=H\sin(\pi a),\qquad
S=\frac{J\sin(\pi b)}{\sin(\pi a)}.
}
\tag{5.380}
\]

Here
\(-C=D=P+e^{i\pi c}J+e^{-i\pi a}K\). Expanding
\(\operatorname{Im}(D'\overline D)\) and using (5.380) gives

\[
\boxed{
\frac d{dx}\arg C(x)
=
\frac{\sin(\pi a)
\{q_+(x)[S-P(x)]-p(x)R(x)\}}
{|D(x)|^2}.
}
\tag{5.381}
\]

The remaining sign has a pointwise transport proof. First,

\[
S-P(x)=F(r)-F(-x)
=\int_{-\infty}^{-x}Q(t)\,dt+\int_r^\infty Q(t)\,dt.
\tag{5.382}
\]

The Möbius map

\[
T_x(y)=\frac{(r-x)y}{2y-r-x}
\tag{5.383}
\]

maps the two subintervals of \((x,r)\), with reversed orientation, onto
\((-\infty,-x)\) and \((r,\infty)\). Its absolute Jacobian is
\((r^2-x^2)/(2y-r-x)^2\). Because the total exponent is exactly two,
that denominator cancels, and

\[
\begin{aligned}
S-P(x)&=\int_x^r h_x(y)\,dy,\\
h_x(y)&=(r^2-x^2)(r+x)^{-a}(r-y)^{-a}
A_d(y)^{-b}A_l(y)^{-c},\\
A_z(y)&=y(r-x-2z)+z(r+x)>0.
\end{aligned}
\tag{5.384}
\]

The last positivity follows already at the endpoints:
\(A_z(x)=(r-x)(x+z)>0\) and
\(A_z(r)=(r-x)(r-z)>0\).

For \(z=d,l\), define

\[
H_z(y)=
\frac{(r-x)(x+z)(y-z)}{(x-z)A_z(y)}.
\]

Then \(H_z(x)=1\) and

\[
\frac d{dy}\log H_z(y)
=\frac{2z(r-z)}{(y-z)A_z(y)}>0.
\]

Consequently, for \(x<y<r\),

\[
\boxed{
\frac{q_+(x)h_x(y)}{p(x)q_+(y)}
=\frac{r+x}{r-x}H_d(y)^bH_l(y)^c>1.
}
\tag{5.385}
\]

Integration of (5.385) proves
\(q_+(x)[S-P(x)]>p(x)R(x)\), so (5.381) is also positive.

The singularities of \(Q\) at \(l,d,r\) have orders \(c,b,a<1\).
Thus \(F\) and \(C\) are continuous there,
\(C(l)<0\), \(C(r)>0\), and
\(\operatorname{Im}C(x)<0\) on \((l,r)\); in particular \(C\) never
vanishes. The phase derivative has only the integrable bounds
\[
O((x-l)^{-c}),\qquad O(|x-d|^{-b}),\qquad O((r-x)^{-a})
\]
at the three thresholds. Define

\[
\eta(u)=-\frac1\pi\arg C(u^{-1/2})
\quad(r^{-2}<u<l^{-2}),\qquad
\eta(u):=
\begin{cases}
0,&0<u\le r^{-2},\\
1,&u\ge l^{-2}
\end{cases}
\quad\text{outside that interval},
\tag{5.386}
\]

using the continuous phase from \(-\pi\) at \(x=l\) to \(0\) at
\(x=r\). Then \(\eta\) is nondecreasing, has total increase one, and,
away from the thresholds,

\[
\eta'(u)=\frac{x^3}{2\pi}\frac d{dx}\arg C(x),
\qquad x=u^{-1/2}.
\tag{5.387}
\]

The function \(L\) is Stieltjes and hence zero-free on the slit plane.
The integrable threshold bounds make the small keyhole arcs vanish.
Applying the cut-plane inversion recorded in the [source map](references.md)
gives

\[
\boxed{
-\frac{L'(s)}{L(s)}
=\int_{[r^{-2},l^{-2}]}\frac{d\eta(u)}{s+u},
\qquad
-\log L(s)
=\int_{[r^{-2},l^{-2}]}
\log\!\left(1+\frac{s}{u}\right)d\eta(u).
}
\tag{5.388}
\]

Thus \(G_1M^2\in GGC\), with explicit rate-form Thorin measure
\(d\eta\) of mass one. Finally,

\[
G_2^2\overset d=4G_1G_{3/2},\qquad
X^2\overset d=4(G_1M^2)G_{3/2}.
\tag{5.389}
\]

Gamma duplication, scale closure, and Bondesson's independent-product
theorem prove (5.369). If one of \(a,b,c\) equals one, approximate it
from below while preserving \(a+b+c=2\); the other two coordinates can
be adjusted inside \((0,1)\). Weak convergence of gamma laws and weak
closure of GGC then give the boundary corollary.

This is a second genuinely three-rate theorem, independent of WIP-5.34.
It contains, in particular, the symmetric shape vector
\((2/3,2/3,2/3)\) at arbitrary positive scales. It does not cover a
three-rate total-shape-two vector with one coordinate greater than one,
nor a general total shape.

<a id="wip-5-37"></a>
### WIP-5.37 — completion of the three-rate total-shape-two theorem

**Status: [PROVED FOR ALL POSITIVE SHAPE VECTORS OF TOTAL SHAPE TWO].**

The coordinatewise restriction in WIP-5.35 can be removed:
all gamma variables in the following statement are independent and
unit-rate.

\[
\boxed{
a,b,c>0,\quad a+b+c=2,\quad 0<l<d<r
\quad\Longrightarrow\quad
(rG_a+dG_b+lG_c)^2\in GGC.
}
\tag{5.398}
\]

Since at most one of \(a,b,c\) can exceed one, it is enough to handle
three extensions of WIP-5.35. We retain its functions \(F,Q,C,p,q_-\),
and \(q_+\).

First, there is a version of the right-cut proof that only requires
\(a<1\). For \(d<x<r\), set

\[
R(x)=\int_x^r q_+(y)\,dy,\qquad
U(x)=F(r)-F(-x)>0.
\]

Then

\[
\boxed{
C(x)=U(x)+e^{-i\pi a}R(x),\qquad
\frac d{dx}\arg C(x)
=\frac{\sin(\pi a)\{q_+(x)U(x)-p(x)R(x)\}}
{|C(x)|^2}.
}
\tag{5.399}
\]

The same Möbius map (5.383) gives
\(U(x)=\int_x^rh_x(y)\,dy\), and the pointwise identity (5.385)
holds for arbitrary positive \(b,c\). Hence

\[
q_+(x)U(x)>p(x)R(x)
\tag{5.400}
\]

and the phase derivative in (5.399) is positive. Similarly, the
left-cut proof (5.377)--(5.379) only requires \(c<1\); it imposes no
extra restriction on \(a,b\).

Suppose now that \(b>1\). Then \(a,c<1\), so the preceding left and
right arguments prove strict phase increase away from \(d\). With
\[
K_d=(r-d)^{-a}(d-l)^{-c},
\]
the two local boundary expansions are

\[
\begin{aligned}
C(d-\delta)
&\sim-\frac{e^{i\pi c}K_d}{b-1}\delta^{1-b},
&&\delta\downarrow0,\\
C(d+\varepsilon)
&\sim\frac{e^{-i\pi a}K_d}{b-1}\varepsilon^{1-b},
&&\varepsilon\downarrow0.
\end{aligned}
\tag{5.401}
\]

Thus the canonical phase increases, as \(x\) crosses \(d\), from
\(-\pi(1-c)\) to \(-\pi a\). Its jump is
\(\pi(b-1)\). Equivalently, as \(u=x^{-2}\) increases, the cumulative
Thorin phase has the positive jump

\[
\boxed{\Delta\eta(d^{-2})=b-1.}
\tag{5.402}
\]

The remaining continuous mass is \(a+c=2-b\).

Next suppose that \(c>1\), so \(a,b<1\). The repaired right-cut argument
still applies. On the left cut, put
\[
\mathcal A=x+l,\qquad \mathcal B=x-l,
\]
and, for \(0\le y\le1\), define

\[
\begin{aligned}
f_+(y)&=[r-l+\mathcal Ay]^{-a}[d-l+\mathcal Ay]^{-b},\\
f_-(y)&=[r-l-\mathcal By]^{-a}[d-l-\mathcal By]^{-b}.
\end{aligned}
\]

For \(h\in C^1[0,1]\), introduce the canonical Hadamard finite part

\[
\mathcal I_c[h]
=\frac{h(0)}{1-c}
+\int_0^1y^{-c}\{h(y)-h(0)\}\,dy.
\tag{5.403}
\]

This is finite because \(1<c<2\). Indent the upper-bank contour around
\(l\) by a clockwise semicircle of radius \(\epsilon\). Locally,
\[
Q(z)=K_l e^{i\pi c}(z-l)^{-c}\{1+O(z-l)\},
\qquad
K_l=(r-l)^{-a}(d-l)^{-b}.
\]
The semicircle contributes
\[
\frac{K_l(1+e^{i\pi c})}{1-c}\epsilon^{1-c}
+o(1),
\]
which cancels the two straight-segment divergences; the next term is
\(O(\epsilon^{2-c})\). Therefore the actual Cauchy boundary, not merely
a formal analytic continuation, is

\[
\boxed{
-C(x)=P(x)+e^{i\pi c}J(x),\qquad
P=\mathcal A^{1-c}\mathcal I_c[f_+],\quad
J=\mathcal B^{1-c}\mathcal I_c[f_-].
}
\tag{5.404}
\]

Differentiation of the boundary identity gives the same algebraic phase
formula as before,

\[
\frac d{dx}\arg C(x)
=\frac{\sin(\pi c)\{q_-(x)P(x)-p(x)J(x)\}}
{|C(x)|^2}.
\tag{5.405}
\]

Set

\[
\mathcal R_*=
\left(\frac{r+x}{r-x}\right)^a
\left(\frac{d+x}{d-x}\right)^b,\qquad
H(y)=\mathcal Bf_-(y)-\mathcal A\mathcal R_*f_+(y).
\]

Since \(q_-/p=(\mathcal A/\mathcal B)^c\mathcal R_*\),
linearity of \(\mathcal I_c\) gives

\[
J-\frac{q_-}{p}P
=\mathcal B^{-c}\mathcal I_c[H].
\tag{5.406}
\]

Now

\[
H(0)=f_+(0)\{\mathcal B-\mathcal A\mathcal R_*\}<0,
\qquad H'(y)>0.
\]

Indeed, \(f_-'(y)>0\) and \(f_+'(y)<0\). Consequently

\[
\boxed{
\mathcal I_c[H]
=\frac{H(0)}{1-c}
+\int_0^1y^{-c}\{H(y)-H(0)\}\,dy>0.
}
\tag{5.407}
\]

It follows from (5.406) that
\(q_-P-pJ<0\). Since \(\sin(\pi c)<0\), (5.405) is strictly positive.
At the lower endpoint,

\[
C(l+\varepsilon)
\sim
\frac{e^{i\pi c}K_l}{c-1}\varepsilon^{1-c}.
\tag{5.408}
\]

The phase therefore jumps upward from \(-\pi\), on the exterior side,
to \(-\pi(2-c)\), on the interior side. In rate coordinates,

\[
\boxed{\Delta\eta(l^{-2})=c-1,}
\tag{5.409}
\]

and the continuous mass is \(2-c=a+b\).

Finally suppose that \(a>1\). This case follows from the reciprocal
Dirichlet duality already proved in WIP-5.2. Let
\[
M^*=r^{-1}\widehat P_r+d^{-1}\widehat P_d+l^{-1}\widehat P_l,
\qquad
(\widehat P_r,\widehat P_d,\widehat P_l)
\sim{\rm Dirichlet}(a,b,c),
\]
and put \(K_0=(r^ad^bl^c)^{-1}\). For every bounded Borel \(h\),

\[
\boxed{
\mathbb E[M^{-2}h(M^{-1})]=K_0\,\mathbb E[h(M^*)].
}
\tag{5.410}
\]

This is (5.3) with rates \(r^{-1},d^{-1},l^{-1}\); equivalently, it
follows from the projective simplex map, whose absolute Jacobian is
\(rdl/M^3\). If
\[
L_M(s)=\mathbb E(1+sM^2)^{-1},
\qquad
L_{M^*}(s)=\mathbb E(1+s(M^*)^2)^{-1},
\]
then (5.410) gives

\[
\boxed{
L_M(s)=K_0s^{-1}L_{M^*}(s^{-1}).
}
\tag{5.411}
\]

The reciprocal scales satisfy
\(r^{-1}<d^{-1}<l^{-1}\); hence the shape \(a>1\) is attached to the
smallest scale of \(M^*\), which is exactly the \(c>1\) case just proved.
Write its mass-one rate-form Thorin representation as

\[
L_{M^*}(t)
=\exp\left\{
-\int\log\!\left(1+\frac{t}{u}\right)\tau(du)
\right\},
\qquad |\tau|=1.
\]

Using \(|\tau|=1\) in (5.411), and fixing the remaining constant by
\(L_M(0)=1\), yields

\[
\boxed{
L_M(s)=
\exp\left\{
-\int\log(1+su)\,\tau(du)
\right\}.
}
\tag{5.412}
\]

Thus the reciprocal image of \(\tau\) is a rate-form Thorin measure for
\(G_1M^2\). In particular, the atom \(a-1\) at rate \(r^2\) for the
reciprocal mean becomes an atom \(a-1\) at rate \(r^{-2}\).

At the singular thresholds, the small keyhole circles carry precisely
the residues recorded in (5.402) and (5.409); they are not discarded.
Equivalently, since \(L_M\) is a nonzero Stieltjes function, the canonical
CBF phase representation in the [source map](references.md) turns the proved
increasing
phase, including these jumps, directly into the Thorin measure. The
total mass is one because
\[
L_M(s)\sim s^{-1}\mathbb E[M^{-2}]\qquad(s\to\infty).
\]

If no coordinate exceeds one, WIP-5.35 applies. If one coordinate equals
one, approximate from either adjacent open shape region and use weak
closure. This proves \(G_1M^2\in GGC\) for every positive
\((a,b,c)\) of total two. Gamma duplication then gives

\[
(G_2M)^2\overset d=4(G_1M^2)G_{3/2}\in GGC,
\tag{5.413}
\]

which completes (5.398). More explicitly, if
\(m=\max(a,b,c)>1\), the rate-form Thorin measure of \(G_1M^2\) has
one atom of mass \(m-1\) at the inverse squared scale carrying that
shape and continuous mass \(2-m\). When all coordinates are at most one,
the measure is continuous.
