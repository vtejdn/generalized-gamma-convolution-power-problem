# Finite-support phase geometry and the square theorem through total shape two

Exterior-cut positivity, a complete balanced four-rate theorem, an exact
one-point gate for the unbalanced middle cut, a failed HM1 shortcut,
shape-open stability, and the positive conditional-beta representation
that closes every cut at total shape two.

Entries: WIP-5.45, WIP-5.46, WIP-5.47, WIP-5.48, WIP-5.49, WIP-5.50.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

The phase results and HM1 exclusion are project deductions from the
identified inputs; the four-half-gamma density is a known literature
formula, independently rederived below. WIP-5.49--5.50 supersede the
earlier open status of the unbalanced gate: every finite-support square
of total shape \(0<B\le2\) is now proved GGC. The auxiliary theorem
itself is established at \(B=2\); its converse is not used. These
results do not settle total shapes above two or the full power conjecture.

<a id="wip-5-45"></a>
## WIP-5.45 — exterior cuts and the balanced four-rate theorem

**Status: [PROVED EXTERIOR-CUT POSITIVITY AT TOTAL SHAPE TWO; PROVED
BALANCED FOUR-RATE AUXILIARY GGC AND ORIGINAL SQUARE].**

### Common total-shape-two representation

Let \(0<r_1<\cdots<r_n\), \(\beta_i>0\),
\(\sum_i\beta_i=2\), and
\(P\sim\operatorname{Dir}(\beta_1,\ldots,\beta_n)\). Put
\[
M=\sum_i r_iP_i,\qquad
F(z)=\mathbb E(z-M)^{-1},\qquad
Q(z)=\prod_i(z-r_i)^{-\beta_i}.
\]
The branch of \(Q\) is positive on \((r_n,\infty)\). The
order-two Markov--Krein identity gives
\[
\boxed{F'(z)=-Q(z),\qquad F(z)\longrightarrow0\quad(z\to+\infty).}
\tag{5.499}
\]
This is the identity already used in
[WIP-5.35](12-route5-three-rate-reductions-and-anchors.md#wip-5-35),
with arbitrary finite support; its gamma--Dirichlet input is in
[WIP-0.2](00-foundations.md#wip-0-2).

Let \(E\sim G_1\) be independent of \(P\), and write
\(L(s)=\mathbb E(1+sM^2)^{-1}\), the Laplace transform of
\(EM^2\). For \(s=-u+i0\), set \(x=u^{-1/2}\) and
\[
\boxed{
L(-u+i0)=\frac{x}{2}C(x),\qquad
C(x)=F_+(x)-F(-x),\qquad
C'(x)=-Q_+(x)-p(x),\qquad
p(x)=\prod_i(x+r_i)^{-\beta_i}>0.
}
\tag{5.500}
\]
The identity follows by partial fractions as in (5.373)--(5.374).
Whenever the density is finite at an interior point,
\(\operatorname{Im}C(x)=-\pi f_M(x)<0\).

### Exterior-cut lemma

At total shape two, the first-cut phase derivative is strictly positive
if \(\beta_1<1\), and the last-cut phase derivative is strictly
positive if \(\beta_n<1\). The other shapes need only be positive;
the assertion is restricted to these two open cuts.

**First-cut proof.** Put \(l=r_1\), \(c=\beta_1<1\), and, for
\(l<x<r_2\), define
\[
q(x)=(x-l)^{-c}\prod_{i>1}(r_i-x)^{-\beta_i},\quad
P_0(x)=\int_{-l}^xp(t)\,dt,\quad
J(x)=\int_l^xq(t)\,dt.
\]
Both integrals are finite because \(c<1\). The first-cut upper
phase is \(Q_+=e^{i\pi c}q\). Integration of (5.499) along the
upper bank, including the lower exterior, gives
\[
-C=P_0+e^{i\pi c}J,\qquad
\frac d{dx}\arg C(x)
=\frac{\sin(\pi c)\{q(x)P_0(x)-p(x)J(x)\}}{|C(x)|^2}.
\tag{5.501}
\]
To compare the integrals, scale their lower-end distances to
\(v\in[0,1]\):
\[
\begin{aligned}
P_0(x)&=(x+l)^{1-c}\int_0^1v^{-c}
 \prod_{i>1}[r_i-l+(x+l)v]^{-\beta_i}\,dv,\\
J(x)&=(x-l)^{1-c}\int_0^1v^{-c}
 \prod_{i>1}[r_i-l-(x-l)v]^{-\beta_i}\,dv.
\end{aligned}
\]
Each ratio
\([r_i-l+(x+l)v]/[r_i-l-(x-l)v]\) increases in \(v\).
Thus
\[
\boxed{
\frac{J(x)}{P_0(x)}
\le\left(\frac{x-l}{x+l}\right)^{1-c}
  \prod_{i>1}\left(\frac{r_i+x}{r_i-x}\right)^{\beta_i}
<\frac{q(x)}{p(x)}.
}
\tag{5.502}
\]
The quotient of the final bound by its predecessor is
\((x+l)/(x-l)>1\). Equation (5.501) is strictly positive.

**Last-cut proof.** Put \(r=r_n\), \(a=\beta_n<1\), and, for
\(r_{n-1}<x<r\), define
\[
q(x)=(r-x)^{-a}\prod_{i<n}(x-r_i)^{-\beta_i},\quad
R(x)=\int_x^rq(y)\,dy,\qquad U(x)=F(r)-F(-x)>0.
\]
Here \(F(r)\) is finite because \(a<1\). The upper phase on the
last cut is \(e^{-i\pi a}\), and
\(C=U+e^{-i\pi a}R\). Also
\[
U(x)=\int_{-\infty}^{-x}Q(t)\,dt+\int_r^\infty Q(t)\,dt.
\]
The same Mobius substitution as (5.383),
\(T_x(y)=(r-x)y/(2y-r-x)\), maps the two parts of \((x,r)\)
onto these exteriors. Its Jacobian denominator cancels because
\(\sum_i\beta_i=2\). Hence
\[
\begin{aligned}
U(x)&=\int_x^rh_x(y)\,dy,\\
h_x(y)&=(r^2-x^2)(r+x)^{-a}(r-y)^{-a}
            \prod_{i<n}A_i(y)^{-\beta_i},\\
A_i(y)&=y(r-x-2r_i)+r_i(r+x)>0.
\end{aligned}
\]
For \(x<y<r\), put
\[
H_i(y)=\frac{(r-x)(x+r_i)(y-r_i)}{(x-r_i)A_i(y)}.
\]
The affine denominators are positive at both endpoints and hence on
the interval; moreover
\(H_i(x)=1\) and
\((\log H_i)'=2r_i(r-r_i)/[(y-r_i)A_i(y)]>0\). Therefore
\[
\boxed{
\frac{q(x)h_x(y)}{p(x)q(y)}
=\frac{r+x}{r-x}\prod_{i<n}H_i(y)^{\beta_i}>1.
}
\tag{5.503}
\]
After integration this gives
\[
\boxed{
\frac d{dx}\arg C(x)
=\frac{\sin(\pi a)\{q(x)U(x)-p(x)R(x)\}}{|C(x)|^2}>0.
}
\tag{5.504}
\]
This establishes the exterior-cut lemma. It generalizes only the
exterior parts of WIP-5.35; it imposes no assertion on additional
interior cuts.

### The balanced four-rate theorem

Now assume
\[
\boxed{
n=4,\qquad \beta_i>0,\qquad
\beta_1+\beta_2=\beta_3+\beta_4=1.
}
\tag{5.505}
\]
All four shapes are then strictly below one. On the middle cut
\((r_2,r_3)\), the cumulative left shape is one, so
\(Q_+(x)=-q(x)\), where \(q(x)=\prod_i|x-r_i|^{-\beta_i}\).
Consequently
\[
\boxed{
C'(x)=q(x)-p(x)>0,\qquad
\frac d{dx}\arg C(x)
=\frac{(q(x)-p(x))\pi f_M(x)}{|C(x)|^2}>0.
}
\tag{5.506}
\]
The first inequality follows factor by factor from
\(|x-r_i|<x+r_i\). For completeness, the density is strictly
positive on the whole interior support: on the first cut it starts at
zero and has derivative \(\sin(\pi\beta_1)q/\pi>0\); on the
middle cut it is a positive constant; on the last cut it equals
\(\sin(\pi\beta_4)\int_x^{r_4}q(t)dt/\pi>0\).
These assertions follow from (5.499) and Cauchy boundary inversion.

All knots have locally integrable exponents \(\beta_i<1\).
Thus \(F_+\), \(C\), and the density extend continuously across
the knots; in particular \(C\) never vanishes in the interior.
The endpoint values are finite, with \(C(r_1)<0<C(r_4)\), as
follows directly from their Cauchy expectations. Choose the continuous
phase in \([-\pi,0]\). The exterior-cut lemma and (5.506) prove
that it increases from \(-\pi\) to zero. Define
\[
\eta(u)=-\pi^{-1}\arg C(u^{-1/2})
\quad(r_4^{-2}<u<r_1^{-2}),
\]
and extend it by zero below \(r_4^{-2}\) and one above
\(r_1^{-2}\). This is a continuous nondecreasing function, with
total increase one. Its derivative has only integrable singularities
of order \(|u-r_i^{-2}|^{-\beta_i}\).

The transform \(L\) is nonzero Stieltjes: its integrand is
\(M^{-2}/(s+M^{-2})\), and all mixing weights are positive.
Hence it has no zeros on the slit plane. Its log derivative is
bounded at zero and has asymptotic \(1/s\) at infinity. The
continuous phase, the integrable threshold bounds, and the same
keyhole inversion as (5.388) now give
\[
\boxed{
-\frac{L'(s)}{L(s)}
=\int_{[r_4^{-2},r_1^{-2}]}\frac{d\eta(u)}{s+u},\qquad
-\log L(s)=\int\log(1+s/u)\,d\eta(u).
}
\tag{5.507}
\]
There are no endpoint or interior atoms: the phase has no jumps.
The auxiliary rate-form Thorin measure has mass one. In particular
\(EM^2\in GGC\).

Finally, with independent gammas,
\(X=\sum_i r_iG_{\beta_i}\overset d=G_2M\) and
\(X^2\overset d=4(EM^2)G_{3/2}\). Thus
\[
\boxed{
\left(\sum_{i=1}^4r_iG_{\beta_i}\right)^2\in GGC
\quad\text{under (5.505), for every }0<r_1<r_2<r_3<r_4.
}
\tag{5.508}
\]
The independent-product closure is Bondesson (2015), Theorem 1,
printed pp. 1068--1071, [Source 1](references.md). The analytic
Stieltjes/Thorin recognition and inversion are the inputs already
specified for WIP-5.35 in [Source 3](references.md).

<a id="wip-5-46"></a>
## WIP-5.46 — a one-point gate for the unbalanced middle cut

**Status: [PROVED EXACT AUXILIARY-GGC REDUCTION; SIGN OF THE MINIMUM
WAS OPEN AT THIS ENTRY; NOW STRICTLY POSITIVE BY WIP-5.49].**

The original open-target wording below records the chronology.
[WIP-5.49](#wip-5-49) subsequently proves the required sign on the
whole middle cut, and hence at \(x_*\), for every admissible parameter
vector here.

Let \(n=4\), \(0<\beta_i<1\), \(\sum_i\beta_i=2\), and
\(r_1<r_2<r_3<r_4\) as above. Set
\(S=\beta_1+\beta_2\). The balanced value \(S=1\) is solved by
WIP-5.45. It suffices to analyze \(S<1\): if \(S>1\), reciprocal
Dirichlet duality [WIP-5.41](14-averaged-phase-compensation.md#wip-5-41)
reverses the scales and replaces \(S\) by \(2-S<1\), preserving
auxiliary GGC membership.

Assume \(S<1\), put \(\theta=\pi S\), and on the middle cut
define
\[
\begin{aligned}
P_0(x)&=\int_{-r_1}^xp(t)\,dt,&
J_1&=\int_{r_1}^{r_2}\prod_i|t-r_i|^{-\beta_i}dt,\\
J_2(x)&=\int_{r_2}^xq(t)\,dt,&
q(x)&=\prod_i|x-r_i|^{-\beta_i},\\
U(x)&=\sin\theta\,P_0(x)+\sin(\pi\beta_2)J_1,&
V(x)&=\sin(\pi\beta_1)J_1+\sin\theta\,J_2(x).
\end{aligned}
\tag{5.509}
\]
These are finite, and \(U,V>0\). Here \(V=\pi f_M(x)\).
The boundary decomposition is
\(-C=P_0+e^{i\pi\beta_1}J_1+e^{i\theta}J_2\).
Taking the determinant of its value and derivative gives
\[
\boxed{
\frac d{dx}\arg C(x)=\frac{q(x)U(x)-p(x)V(x)}{|C(x)|^2},
\qquad U'=\sin\theta\,p,\qquad V'=\sin\theta\,q.
}
\tag{5.510}
\]
No independent-variable positivity or conditional-mixture closure is
used in this exact identity.

Put \(h=q/p\). Direct differentiation gives
\[
\boxed{
(\log h)'(x)=-2\sum_{i=1}^4\frac{\beta_i r_i}{x^2-r_i^2},\qquad
(\log h)''(x)=4x\sum_{i=1}^4
           \frac{\beta_i r_i}{(x^2-r_i^2)^2}>0.
}
\tag{5.511}
\]
The first derivative tends to \(-\infty\) at \(r_2+\) and to
\(+\infty\) at \(r_3-\). Therefore there is one and only one
\(x_*\in(r_2,r_3)\) satisfying
\(\sum_i\beta_i r_i/(x_*^2-r_i^2)=0\). The function \(h\)
strictly decreases before \(x_*\) and strictly increases after it.

The phase-sign numerator has the same unique minimum after division
by \(p\). Indeed, for \(\mathcal H(x)=h(x)U(x)-V(x)\),
\[
\boxed{\mathcal H'(x)=h'(x)U(x).}
\tag{5.512}
\]
The other terms cancel by (5.510). Thus \(\mathcal H\) strictly
decreases then strictly increases, with minimum at \(x_*\).
It tends to \(+\infty\) at both cut endpoints because \(h\)
diverges while \(U\) has finite positive limits and \(V\) remains
finite.

The exterior cuts already have the required sign, and all phase jumps
vanish since every \(\beta_i<1\). The same zero-free and inversion
argument as WIP-5.45 proves the exact equivalence
\[
\boxed{
EM^2\in GGC
\quad\Longleftrightarrow\quad
\mathcal H(x_*)=h(x_*)U(x_*)-V(x_*)\ge0.
}
\tag{5.513}
\]
Equality is permitted: it gives one isolated zero of the phase
derivative. If the minimum is negative, the auxiliary phase decreases
on a nonempty interval. This would refute auxiliary GGC membership;
it would not by itself refute GGC membership of the original square,
because gamma-factor cancellation has not been proved.

Equation (5.513) is the remaining sign problem, not its solution.
Its integrals and the unique algebraic root are exact objects; a
numerical sign at that root would require an analytic or certified
error bound before it could be used as a theorem or counterexample.

<a id="wip-5-47"></a>
## WIP-5.47 — the four-half-gamma mean is not HM1

**Status: [PROVED FAILURE OF A SUFFICIENT HM1 ROUTE IN A NEW AUXILIARY
GGC FAMILY; NOT A GGC COUNTEREXAMPLE].**

**Known density input.** The density plateau and its quartic integral
are already in C. F. Dunkl, P. Gawron, L. Pawela, Z. Puchala, and
K. Zyczkowski, *Real numerical shadow and generalized B-splines*,
*Linear Algebra and its Applications* 479 (2015), 12--51,
DOI 10.1016/j.laa.2015.03.029. The exact primary locator is
[arXiv:1409.4941v1, preprint p. 22, Section 5.3,
equations (79)--(82)](https://arxiv.org/pdf/1409.4941#page=22),
checked on 2026-09-05. Equation (82) explicitly states the constant
middle interval. The Cauchy calculation below is an independent
derivation, not a claim of novelty for that density; the subsequent
HM1 exclusion is the project deduction.

Take the balanced vector \(\beta_i=1/2\), and let
\(R(t)=\prod_i|t-r_i|^{-1/2}\). The three interior upper-bank
phases of \(Q\), from left to right, are \(+i,-1,-i\).
Integrating (5.499) and taking Cauchy boundary values gives
\[
\boxed{
f_M(x)=
\begin{cases}
\pi^{-1}\displaystyle\int_{r_1}^xR(t)dt,&r_1<x<r_2,\\
h_0,&r_2\le x\le r_3,\\
\pi^{-1}\displaystyle\int_x^{r_4}R(t)dt,&r_3<x<r_4,
\end{cases}
\qquad
h_0=\pi^{-1}\int_{r_1}^{r_2}R(t)dt
   =\pi^{-1}\int_{r_3}^{r_4}R(t)dt>0.
}
\tag{5.514}
\]
The equality of the complete side integrals follows either by
continuity of the density or by the zero imaginary part of \(F\)
on \(( -\infty,r_1)\). All endpoint singularities of the integrals
are inverse square roots and are integrable.

Put
\(A_2=[(r_2-r_1)(r_3-r_2)(r_4-r_2)]^{-1/2}\) and
\(\varepsilon=r_2-x\downarrow0\). Then
\[
f_M'(x)\sim\frac{A_2}{\pi\sqrt\varepsilon},\qquad
f_M''(x)\sim\frac{A_2}{2\pi\varepsilon^{3/2}},\qquad
f_M(x)\longrightarrow h_0.
\]
For \(\psi(t)=\log f_M(e^t)\), the chain rule yields
\[
\boxed{
\psi''(\log x)
=\frac{x f_M'}{f_M}+\frac{x^2 f_M''}{f_M}
 -\frac{x^2(f_M')^2}{f_M^2}
\sim\frac{r_2^2A_2}{2\pi h_0}\varepsilon^{-3/2}>0.
}
\tag{5.515}
\]
This violates a necessary condition for HM1. Indeed, the definition
requires \(f(uv)f(u/v)\) to be nonincreasing in
\(v+v^{-1}\), for fixed \(u>0\). With \(u=e^t,v=e^s\),
it would make \(\psi(t+s)+\psi(t-s)\) nonincreasing for \(s>0\).
At a smooth point its Taylor expansion consequently requires
\(\psi''(t)\le0\). Equation (5.515) gives a strict violation at
interior smooth points, and therefore \(M\notin HM_1\).

For \(Y=M^2\),
\[
\log f_Y(e^t)=\psi(t/2)-t/2-\log2,
\]
whose second derivative is \(\psi''(t/2)/4\). Hence
\[
\boxed{M^2\notin HM_1,\qquad EM^2\in GGC.}
\tag{5.516}
\]
The second assertion is WIP-5.45, with \(E\perp M\).
Thus the failure of the gamma--HM1 sufficient theorem does not prevent
the auxiliary GGC property. The local strict inequality also persists
under the change \(M\mapsto M^q\) for any nonzero real \(q\):
the logarithmic-density second derivative becomes
\(q^{-2}\psi''(t/q)\).

The HM1 definition is sourced to T. Sjodin, *On Mixtures of Gamma
Distributions, Distributions with Hyperbolically Monotone Densities and
Generalized Gamma Convolutions (GGC)*, published in *Probability and
Mathematical Statistics* 41(1) (2021), 1--7,
DOI 10.37190/0208-4147.41.1.1. The precise version checked here is
[arXiv:1806.03926v3, Section 2, equation (1) and Definition 1](https://arxiv.org/html/1806.03926v3#S2),
dated 19 February 2019, inspected on 2026-09-05. The failure proof
above is an elementary project derivation from that definition.

<a id="wip-5-48"></a>
## WIP-5.48 — shape-open stability of the balanced four-rate theorem

**Status: [PROVED AUXILIARY GGC AND ORIGINAL-SQUARE GGC ON A RELATIVELY
OPEN SHAPE NEIGHBORHOOD OF EVERY BALANCED INTERIOR VECTOR; FIXED SCALES;
NEIGHBORHOOD SIZE NOT MADE EXPLICIT].**

Fix \(0<r_1<r_2<r_3<r_4\) and a shape vector
\(\beta^0\in(0,1)^4\) satisfying
\(\beta_1^0+\beta_2^0=\beta_3^0+\beta_4^0=1\).
There exists \(\delta>0\), depending on these scales and
\(\beta^0\), such that
\[
\boxed{
\sum_{i=1}^4\beta_i=2,\quad
\|\beta-\beta^0\|_\infty<\delta
\quad\Longrightarrow\quad
E M_\beta^2\in GGC,\qquad
\left(\sum_{i=1}^4 r_iG_{\beta_i}\right)^2\in GGC,
}
\tag{5.517}
\]
where \(P_\beta\sim\operatorname{Dir}(\beta_1,\ldots,\beta_4)\),
\(M_\beta=\sum_i r_iP_{\beta,i}\), and \(E\sim G_1\) is
independent of \(P_\beta\). The neighborhood is chosen small enough
that every \(\beta_i\) stays in \((0,1)\); the gammas in the
original sum are independent. Openness is relative to the affine
hyperplane \(\sum_i\beta_i=2\), so this conclusion includes
genuinely unbalanced vectors on both sides of
\(\beta_1+\beta_2=1\).

**1. Joint continuity up to both middle knots.** Choose
\(0<\varepsilon<\min_i\{\beta_i^0,1-\beta_i^0\}\) and let
\[
K=\{\beta:\ \textstyle\sum_i\beta_i=2,\quad
                     \varepsilon\le\beta_i\le1-\varepsilon\}.
\]
This is compact and contains a relative neighborhood of \(\beta^0\).
For \(\beta\in K\), retain \(C_\beta,p_\beta,q_\beta\) from
(5.500), with \(q_\beta(t)=\prod_i|t-r_i|^{-\beta_i}\), and put
\(\theta_\beta=\pi(\beta_1+\beta_2)\). For the full closed middle
interval \(r_2\le x\le r_3\), the primitive formula is
\[
\boxed{
-C_\beta(x)
=\int_{-r_1}^x p_\beta(t)\,dt
 +e^{i\pi\beta_1}\int_{r_1}^{r_2}q_\beta(t)\,dt
 +e^{i\theta_\beta}\int_{r_2}^xq_\beta(t)\,dt.
}
\tag{5.518}
\]
This follows from (5.499) with the same upper-bank phases as in
WIP-5.46; it does not require \(\beta_1+\beta_2<1\).

Here is a uniform integrable domination that explicitly includes the
varying endpoint exponents. Away from their finitely many zeros,
\[
\begin{aligned}
p_\beta(t)&\le D_-(t):=
 \prod_{i=1}^4\max\{1,(t+r_i)^{-(1-\varepsilon)}\},
 &&-r_1<t\le r_3,\\
q_\beta(t)&\le D_+(t):=
 \prod_{i=1}^4\max\{1,|t-r_i|^{-(1-\varepsilon)}\},
 &&r_1<t<r_3.
\end{aligned}
\tag{5.519}
\]
The first dominating function has only the possible singularity at
\(-r_1\); the second has singularities at the distinct knots
\(r_1,r_2,r_3\). Near any one knot all other factors are bounded,
and the remaining exponent \(1-\varepsilon\) is strictly below one.
Thus \(D_-\in L^1([-r_1,r_3])\) and
\(D_+\in L^1([r_1,r_3])\). Changing the values at the finitely
many singular points does not affect these assertions.

The integrands are continuous in \(\beta\) at every other point.
Dominated convergence, applied also to the integration indicators
\(\mathbf1_{\{t\le x\}}\), proves that every primitive in (5.518)
is jointly continuous in \((\beta,x)\in K\times[r_2,r_3]\).
For a convergent sequence of endpoints, those indicators converge
outside a single point, which suffices. In particular \(C_\beta(x)\)
is jointly continuous on this compact set. The scales have been fixed
throughout; no moving-knot domination is being asserted.

**2. A normalized phase numerator has a uniform positive margin.**
Define, with \(0^b=0\) for \(b>0\),
\[
\boxed{
\rho_\beta(x)=\prod_{i=1}^4
       \left(\frac{|x-r_i|}{x+r_i}\right)^{\beta_i},\qquad
T_\beta(x)=\operatorname{Im}\!\left[
 -(\rho_\beta(x)+e^{i\theta_\beta})\overline{C_\beta(x)}\right].
}
\tag{5.520}
\]
The ratio \(\rho_\beta\) equals \(p_\beta/q_\beta\) on the
open middle cut and is zero at its two endpoints. Because the shapes
are bounded below by \(\varepsilon>0\), it is jointly continuous
on \(K\times[r_2,r_3]\), including these zeros. Consequently so
is \(T_\beta\).

At the balanced vector, let
\(d_0=-\operatorname{Im}C_{\beta^0}(x)>0\); this is independent
of \(x\in[r_2,r_3]\) by the plateau proof in WIP-5.45, and equals
\(\sin(\pi\beta_1^0)\int_{r_1}^{r_2}q_{\beta^0}(t)dt\).
Since \(e^{i\theta_{\beta^0}}=-1\),
\[
\boxed{
T_{\beta^0}(x)=(1-\rho_{\beta^0}(x))d_0,
\qquad
m_0:=\min_{x\in[r_2,r_3]}T_{\beta^0}(x)
=d_0\left(1-\max_{x\in[r_2,r_3]}\rho_{\beta^0}(x)\right)>0.
}
\tag{5.521}
\]
Indeed, every ratio \(|x-r_i|/(x+r_i)\) is strictly below one
because both \(x\) and \(r_i\) are positive. Thus
\(\rho_{\beta^0}<1\) at every point, and compactness makes its
maximum strictly below one. At the two knots \(T_{\beta^0}=d_0\),
so no positive margin is lost at the singular ends of the open cut.

Joint continuity on the compact set now gives \(\delta>0\) such
that, for all admissible \(\|\beta-\beta^0\|_\infty<\delta\),
\[
\sup_{x\in[r_2,r_3]}|T_\beta(x)-T_{\beta^0}(x)|<m_0/2,
\qquad
\sup_{x\in[r_2,r_3]}|C_\beta(x)-C_{\beta^0}(x)|<d_0/2.
\]
Shrink \(\delta\) if necessary so that these shapes lie in \(K\).
In particular \(T_\beta\ge m_0/2>0\) and
\(-\operatorname{Im}C_\beta\ge d_0/2>0\) on the closed middle
interval. This is a qualitative existence assertion for \(\delta\),
not an explicit radius or a numerical estimate.

**3. Recover the full GGC certificate.** On \((r_2,r_3)\),
(5.500) gives \(C_\beta'=-q_\beta e^{i\theta_\beta}-p_\beta\),
and therefore
\[
\boxed{
\frac d{dx}\arg C_\beta(x)
=\frac{q_\beta(x)T_\beta(x)}{|C_\beta(x)|^2}>0.
}
\tag{5.522}
\]
On each exterior cut the phase derivative is strictly positive by
WIP-5.45, because \(\beta_1,\beta_4<1\). The imaginary part is
strictly negative there as well: the first-cut density equals
\(\sin(\pi\beta_1)\int_{r_1}^xq_\beta(t)dt/\pi\), and the
last-cut density equals
\(\sin(\pi\beta_4)\int_x^{r_4}q_\beta(t)dt/\pi\).
All knot singularities remain integrable since every \(\beta_i<1\).
Thus the boundary transform is continuous and nonzero everywhere on
the closed support cut, with finite endpoint signs
\(C_\beta(r_1)<0<C_\beta(r_4)\). Its phase has no jumps and
increases from \(-\pi\) to zero.

The zero-free Stieltjes transform and the keyhole argument of
(5.507) apply without further changes. They give a positive,
atom-free rate-form Thorin measure of mass one, supported in
\([r_4^{-2},r_1^{-2}]\), for \(EM_\beta^2\). Finally,
\(X_\beta^2\overset d=4(EM_\beta^2)G_{3/2}\), with the final
gamma factor independent, and the same product closure as (5.508)
proves the original-square claim in (5.517).

This is a project deduction from WIP-5.45 and the exact primitive
representation in WIP-5.46, using only dominated convergence and
compactness beyond their already identified external inputs. It does
not settle all unbalanced shapes: outside these neighborhoods, the
minimum in (5.513) is still uncontrolled. Neither a uniform radius
over all scale configurations nor stability under moving scales is
claimed here.

This was the scope of this stability argument. The later
[WIP-5.49--5.50](#wip-5-49) supply a different positive representation
and close the unrestricted finite-support square theorem through
total shape two.

<a id="wip-5-49"></a>
## WIP-5.49 — conditional-beta positive decomposition on every cut

**Status: [PROVED STRICT PHASE POSITIVITY ON EVERY OPEN CUT AT TOTAL
SHAPE TWO, FOR ARBITRARY FINITE SUPPORT AND ALL POSITIVE SHAPES;
PROVED THE PREVIOUSLY OPEN FOUR-RATE MINIMUM IS STRICTLY POSITIVE].**

Let \(n\ge2\), \(0<r_1<\cdots<r_n\), \(\beta_i>0\), and
\(\sum_i\beta_i=2\). Retain \(M,F,C\) from (5.499)--(5.500).
Fix a cut \((r_j,r_{j+1})\), and put
\[
S=\sum_{i\le j}\beta_i,\qquad \delta=1-S\in(-1,1).
\]
Neither the cut calculation nor the comparison below requires
\(\beta_i<1\).

### 1. Aggregate the Dirichlet vector before taking the boundary value

Dirichlet neutrality yields
\[
\boxed{
M\overset d=A T+D(1-T),\qquad
T\sim\operatorname{Beta}(S,2-S),\qquad T\perp(A,D),
}
\tag{5.523}
\]
where \(A\) and \(D\) are the independent Dirichlet means on the
left and right groups. A singleton group gives a deterministic mean.
In particular
\[
r_1\le A\le r_j<x<r_{j+1}\le D\le r_n.
\]
Their joint distribution depends on the fixed cut and the parameters,
not on the varying \(x\) in that cut. To verify (5.523) directly, group
the independent unit-rate gammas used in WIP-0.2 into left and right
sums. These sums have shapes \(S\) and \(2-S\), and each normalized
within-group vector is independent of both sums. The left sum divided
by the total of the two sums is \(T\);
this proves the stated independence as well as the identity.

Conditioning on \(A,D\), the order-two Markov--Krein identity gives
\[
F_{A,D}'(z)=-(z-A)^{-S}(z-D)^{-(2-S)}.
\]
Integrating this derivative with \(F_{A,D}(z)\to0\) at infinity gives
the elementary primitive
\[
\boxed{
F_{A,D}(z)=
\begin{cases}
\displaystyle\frac{\left((z-A)/(z-D)\right)^\delta-1}
                    {\delta(D-A)},&\delta\ne0,\\[6pt]
\displaystyle\frac{\log((z-A)/(z-D))}{D-A},&\delta=0.
\end{cases}
}
\tag{5.524}
\]
Here the logarithm is
\(\log(z-A)-\log(z-D)\), using the upper-half-plane branches; its
imaginary part lies in \((-\pi,0)\). This defines the power in
(5.524) and fixes its boundary values without ambiguity. For example,
when \(\delta\ne0\), differentiating its numerator gives
\[
-\delta(D-A)(z-A)^{-S}(z-D)^{-(2-S)},
\]
and the expression in (5.524) is asymptotic to \(1/z\), verifying both
the derivative and the integration constant.

### 2. Two positive averages replace a signed phase decomposition

First assume \(\delta\ne0\), set \(\theta=\pi S\), and define
\[
\begin{aligned}
n_{A,D}(x)&=\frac{1}{D-A}
                 \left(\frac{x-A}{D-x}\right)^\delta,
&N(x)&=\mathbb E[n_{A,D}(x)],\\
b_{A,D}(x)&=\frac{1}{D-A}
                 \left(\frac{x+A}{x+D}\right)^\delta,
&B_+(x)&=\mathbb E[b_{A,D}(x)].
\end{aligned}
\]
These functions are finite and strictly positive for \(x\) in the
open cut. The notation \(B_+\) denotes a positive average, not the
total shape, which is fixed at two.

At \(z=x+i0\), the power in (5.524) has phase
\(e^{-i\pi\delta}=-e^{i\pi S}\). At \(z=-x\), it is the positive
real power \(((x+A)/(x+D))^\delta\). Consequently
\[
\boxed{
C(x)=-\frac{B_+(x)+e^{i\theta}N(x)}{\delta},
\qquad
\frac d{dx}\arg C(x)
=\frac{\sin\theta\,N(x)B_+(x)}
 {|B_+(x)+e^{i\theta}N(x)|^2}
 \left(\frac{N'(x)}{N(x)}-\frac{B_+'(x)}{B_+(x)}\right).
}
\tag{5.525}
\]
In particular \(\operatorname{Im}C=-N\sin\theta/\delta<0\),
because \(\sin(\pi S)=\sin(\pi\delta)\) has the same sign as
\(\delta\in(-1,1)\setminus\{0\}\).

All exchanges of conditional expectation, boundary limit, and
differentiation here are justified locally on the cut. On any compact
subinterval, \(x-A\) and \(D-x\) have fixed positive lower bounds;
\(D-A\ge r_{j+1}-r_j>0\), and all other quantities range over compact
positive intervals. The displayed kernels and their first derivatives
therefore have uniform finite bounds. The same argument verifies the
conditional Cauchy boundary limit itself.

### 3. Uniform logarithmic-derivative separation survives averaging

The exact pointwise derivatives are
\[
\boxed{
\frac{n_{A,D}'}{n_{A,D}}
=\delta\,u_{A,D}(x),\qquad
\frac{b_{A,D}'}{b_{A,D}}
=\delta\,v_{A,D}(x),
}
\tag{5.526}
\]
where
\[
u_{A,D}(x)=\frac1{x-A}+\frac1{D-x},\qquad
v_{A,D}(x)=\frac1{x+A}-\frac1{x+D}.
\]
The first bracket increases with \(A\) and decreases with \(D\).
The second decreases with \(A\) and increases with \(D\). Thus, for
every admissible pair \(A,D\),
\[
\boxed{
u_{A,D}(x)\ge
 u_*(x):=\frac1{x-r_1}+\frac1{r_n-x}
 >
 v^*(x):=\frac1{x+r_1}-\frac1{x+r_n}
 \ge v_{A,D}(x).
}
\tag{5.527}
\]
The strict middle inequality can be seen term by term; explicitly
\[
g_*(x):=u_*(x)-v^*(x)
=\frac{2r_1}{x^2-r_1^2}
 +\frac1{r_n-x}+\frac1{x+r_n}>0.
\]
This is a separation of the entire ranges of two test functions,
not merely a pointwise comparison under one posterior. Define
probability measures on the pair \((A,D)\) by weighting its fixed law
with \(n_{A,D}/N\) and \(b_{A,D}/B_+\), respectively. Equations
(5.526)--(5.527) then imply
\[
\boxed{
\frac{N'}N-\frac{B_+'}{B_+}
=\delta\left(
 \mathbb E_n u_{A,D}-\mathbb E_b v_{A,D}\right),\qquad
\mathbb E_n u_{A,D}-\mathbb E_b v_{A,D}\ge g_*(x)>0.
}
\tag{5.528}
\]
No ordering between the two posterior measures is required. Combining
(5.525) and (5.528), and using
\(\delta\sin(\pi S)>0\), proves
\[
\boxed{
\frac d{dx}\arg C(x)
\ge
\frac{\delta\sin(\pi S)\,N(x)B_+(x)\,g_*(x)}
 {|B_+(x)+e^{i\pi S}N(x)|^2}>0
\qquad(\delta\ne0).
}
\tag{5.529}
\]

### 4. The balanced aggregate \(S=1\)

For \(\delta=0\), the logarithmic branch in (5.524) gives directly
\[
\boxed{
C(x)=\mathbb E\left[
 \frac{\,\log\!\left(
 \dfrac{(x-A)(x+D)}{(D-x)(x+A)}\right)-i\pi\,}{D-A}\right],
\quad
\operatorname{Im}C=-\pi\mathbb E(D-A)^{-1}<0,\quad
C'(x)=\mathbb E\frac{u_{A,D}(x)-v_{A,D}(x)}{D-A}>0.
}
\tag{5.530}
\]
Therefore \(\frac d{dx}\arg C=-C'\operatorname{Im}C/|C|^2>0\)
in this case as well. The same local domination applies.

This proves strict phase positivity on every open cut for arbitrary
finite support at total shape two. In particular, for the four-rate
parameters of WIP-5.46,
\[
\boxed{\mathcal H(x)>0\quad(r_2<x<r_3),\qquad
       \mathcal H(x_*)>0.}
\tag{5.531}
\]
Indeed, (5.510) writes the same phase derivative as
\(p(x)\mathcal H(x)/|C(x)|^2\), with \(p>0\). Thus the unique-minimum
problem is solved strictly, not merely reduced to another unproved
comparison. Completion of the global GGC certificate, including
possible heavy knots, is supplied next.

This is a project deduction from the gamma--Dirichlet change of
variables in WIP-0.2 and the order-two identity (5.499). The primitive,
branch calculation, positive decomposition, and separated derivative
bounds above are proved here. No geometric univalence theorem,
mixture-closure assertion for GGC, or numerical sign test is used.

<a id="wip-5-50"></a>
## WIP-5.50 — every finite gamma-convolution square of total shape at most two

**Status: [PROVED FOR ARBITRARY FINITE SUPPORT AND ALL POSITIVE SHAPES
WITH TOTAL \(0<B\le2\); AUXILIARY GGC PROVED AT TOTAL SHAPE TWO].**

For independent unit-rate gammas and arbitrary positive scales,
\[
\boxed{
X=\sum_{i=1}^n r_iG_{\beta_i},\qquad
r_i,\beta_i>0,\qquad 0<B:=\sum_i\beta_i\le2
\quad\Longrightarrow\quad X^2\in GGC.
}
\tag{5.532}
\]
There is no restriction on the number of distinct scales. At
\(B=2\), one has the stronger auxiliary statement
\[
\boxed{
M=\sum_i r_iP_i,\quad P\sim\operatorname{Dir}(\beta),\quad
E\sim G_1,\quad E\perp P
\quad\Longrightarrow\quad EM^2\in GGC.
}
\tag{5.533}
\]
For \(B<2\), (5.532) will be obtained by padding the original gamma
sum; no auxiliary converse or gamma-factor cancellation is asserted.

### 1. Distinct scales and light knots at total shape two

First suppose that the scales are strictly ordered and every
\(0<\beta_i<1\). Equation (5.499) shows that the boundary primitive
\(F_+\) is continuous at every knot: its derivative has only the
locally integrable singularity \((z-r_i)^{-\beta_i}\) times a
nonvanishing analytic factor. The Cauchy boundary density is
continuous, vanishes at the two support endpoints, and is strictly
positive in the support interior. For precision, on the \(j\)-th cut,
\[
f_M'(x)=\pi^{-1}\sin(\pi S_j)
               \prod_i|x-r_i|^{-\beta_i},\qquad
S_j=\sum_{i\le j}\beta_i.
\]
Since \(S_j\) strictly increases from zero to two, these derivatives
are positive before the cumulative mass reaches one, zero if it
equals one, and negative afterwards. The first and last cut formulas
in WIP-5.45 are strictly positive. Continuity and this monotonicity
then give strict positivity also at every interior knot. Thus
\(C(x)\ne0\) on the whole closed support interval; at its endpoints,
the finite Cauchy expectations give \(C(r_1)<0<C(r_n)\).

WIP-5.49 makes the phase strictly increasing on every open cut.
Its continuity at the knots therefore gives a continuous phase from
\(-\pi\) to zero with no jumps. Set
\[
\eta(u)=-\pi^{-1}\arg C(u^{-1/2})
\quad(r_n^{-2}<u<r_1^{-2}),
\]
extended by zero below and by one above this interval. The threshold
bounds are \(O(|u-r_i^{-2}|^{-\beta_i})\) for its derivative and are
integrable. The zero-free Stieltjes transform
\(L(s)=\mathbb E(1+sM^2)^{-1}\), exactly as in (5.507), consequently
has the representation
\[
\boxed{
-\frac{L'(s)}{L(s)}
=\int_{[r_n^{-2},r_1^{-2}]}\frac{d\eta(u)}{s+u},\qquad
-\log L(s)=\int\log(1+s/u)\,d\eta(u).
}
\tag{5.534}
\]
The measure is positive and atom-free, with total mass one. Here
zero-freeness follows from strict negativity of \(\operatorname{Im}L\)
in the upper half-plane; the endpoint signs and negative imaginary
part on the interior exclude boundary zeros on the finite cut.
The logarithmic derivative is bounded at zero and asymptotic to
\(1/s\) at infinity, so the same keyhole inversion has no omitted
drift or polynomial term. This proves (5.533) in the light-knot case.

### 2. Split and separate to remove every knot restriction

For a general finite vector with total shape two, including coincident
scales or shapes at least one, choose positive integers \(m_i\) such
that \(\alpha_{i,\ell}:=\beta_i/m_i<1\) for
\(1\le\ell\le m_i\). On a common probability space let
\(G_{i,\ell}\) be independent gammas of these shapes, set
\(T_0=\sum_{i,\ell}G_{i,\ell}\), and
\(P_{i,\ell}=G_{i,\ell}/T_0\). Their total shape is still two.
Choose strictly positive, pairwise distinct scales
\(r_{i,\ell}^{(m)}\to r_i\). Such choices exist by arbitrarily small
perturbations of finitely many positive numbers. Put
\[
M_m=\sum_{i,\ell}r_{i,\ell}^{(m)}P_{i,\ell},
\qquad
M_\infty=\sum_i r_i\sum_{\ell=1}^{m_i}P_{i,\ell}.
\]
The previously proved light-knot theorem applies after ordering the
perturbed scales. Also \(M_m\to M_\infty\) almost surely, and the
aggregated vector \((\sum_\ell P_{i,\ell})_i\) has the original
\(\operatorname{Dir}(\beta)\) distribution by gamma additivity.
With one \(E\sim G_1\) independent of this entire construction,
\[
\boxed{
EM_m^2\in GGC,\qquad EM_m^2\longrightarrow EM_\infty^2
\text{ almost surely}
\quad\Longrightarrow\quad EM_\infty^2\in GGC.
}
\tag{5.535}
\]
The last implication is weak closure. This proves (5.533) without
having to infer the signs of singular-knot jumps individually.
Atom-freeness is not asserted after taking this limit: Thorin atoms
can appear when knots coalesce.

The gamma--Dirichlet identity and duplication give
\[
X\overset d=G_2M,\qquad
X^2\overset d=4(EM^2)G_{3/2},
\]
where the last gamma is independent of \((E,M)\). The independent
product theorem for GGC therefore proves (5.532) at \(B=2\).
Only the forward, sufficient implication from the auxiliary property
to the original square is used.

### 3. Downward propagation to every \(0<B<2\)

Take \(H\sim G_{2-B}\) independent of \(X\), and set
\(X_\varepsilon=X+\varepsilon H\) for \(\varepsilon>0\).
Each \(X_\varepsilon\) is a finite gamma convolution of total shape
two, regardless of whether its new scale coincides with an existing
one. The theorem just proved allows arbitrary finite support, so
\[
\boxed{
X_\varepsilon^2\in GGC,\qquad
X_\varepsilon^2\longrightarrow X^2\text{ almost surely as }
\varepsilon\downarrow0
\quad\Longrightarrow\quad X^2\in GGC.
}
\tag{5.536}
\]
This is exactly the support-wide padding argument
[WIP-5.29](10-route5-support-wide-closure-and-shape-propagation.md#wip-5-29),
now with its total-shape-two hypothesis supplied in full.

The external closure inputs are Bondesson (2015), Theorem 1, for
independent products, and Bondesson (1992), Theorem 3.1.5,
printed pp. 34--35 / PDF pp. 43--44, for weak closure; see
[Source 1](references.md) and the
[foundational infrastructure note](../notes/bondesson-1992-ggc-hcm-foundational-infrastructure.md).
The Stieltjes/Thorin inversion input is the same one identified in
WIP-5.45 and [Source 3](references.md). The split-and-separate
argument and its use after WIP-5.49 are project deductions.

The theorem covers every finite support size but only the square and
total shapes at most two. Neither gamma-factor cancellation, closure
above total shape two, nor the full conjecture for all powers
\(q\ge1\) follows from it.
