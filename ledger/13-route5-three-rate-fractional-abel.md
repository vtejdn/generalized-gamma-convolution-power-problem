# Route 5H: three-rate fractional Abel analysis

The physical Appell curve, Abel-ratio gate, knot structure, and full-interval monotonicity below total shape two.

Entries: WIP-5.36, WIP-5.38, WIP-5.39.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

Original WIP identifiers and equation numbers are preserved. Positional words such as "above" and "below" refer to the original numbered proof sequence.

## Progress entries


<a id="wip-5-36"></a>
### WIP-5.36 — the physical Appell curve and its Abel-ratio gate

**Status: [PROVED REDUCTION; THE REMAINING RATIO MONOTONICITY IS OPEN].**

Retain the notation of WIP-5.33:
\(a+b+c=2k\), \(0<l<d<r\),
\(\gamma_r=a,\gamma_d=b,\gamma_l=c\),
\[
\Delta_x(s)=\arctan(x\sqrt s)-\arctan(l\sqrt s),
\qquad z_x(s)=1-e^{2i\Delta_x(s)},
\]
and let \(\Psi=F_1(k;a,b;2k;z_r,z_d)\). Define the two contiguous
quotients

\[
\begin{aligned}
R_r&=
\frac{F_1(k+1;a+1,b;2k+1;z_r,z_d)}{\Psi},\\
R_d&=
\frac{F_1(k+1;a,b+1;2k+1;z_r,z_d)}{\Psi}.
\end{aligned}
\tag{5.390}
\]

The phase factor in (5.349) is essential:

\[
L(s)=\mathbb E(1+sM^2)^{-k}
=\prod_{x=r,d,l}(1+sx^2)^{-\gamma_x/2}
e^{i(a\Delta_r+b\Delta_d)}\Psi.
\tag{5.391}
\]

Since

\[
\Delta_x'(s)=
\frac{(x-l)(1-sxl)}
{2\sqrt s(1+sx^2)(1+sl^2)},
\qquad
z_x'(s)=-2i(1-z_x)\Delta_x'(s),
\]

the exact physical-curve logarithmic derivative is

\[
\boxed{
\begin{aligned}
g(s):=-\frac{L'(s)}{L(s)}
={}&\frac12\sum_{x=r,d,l}
\frac{\gamma_xx^2}{1+sx^2}\\
&+ia\Delta_r'\{(1-z_r)R_r-1\}
+ib\Delta_d'\{(1-z_d)R_d-1\}.
\end{aligned}
}
\tag{5.392}
\]

Although the last line is written in complex Appell coordinates, the
whole expression is real for \(s>0\). Formula (5.392) is the
one-dimensional quotient that retains the cancellations lost in the
refuted multivariate kernel (5.354).

There is a sharper real boundary criterion when \(0<k<1\). Let \(f_M\)
denote the density of the three-atom Dirichlet mean and, for \(l<x<r\),
put

\[
\begin{aligned}
A_k(x)&=x^{2k}\int_l^x(x^2-m^2)^{-k}f_M(m)\,dm,\\
B_k(x)&=x^{2k}\int_x^r(m^2-x^2)^{-k}f_M(m)\,dm,\\
\rho_k(x)&=\frac{B_k(x)}{A_k(x)},
\qquad x\in(l,d)\cup(d,r).
\end{aligned}
\tag{5.393}
\]

For \(x\ne d\), both integrals are finite because the only moving-kernel
singularity has order \(k<1\). At \(x=d\), however, they can diverge
simultaneously: the Dirichlet-mean knot singularity can combine with the
kernel singularity. Thus all values at \(d\) below are one-sided boundary
values, not substitutions into the two separate integrals. On the upper
bank of the cut, with \(s=-u+i0\) and \(x=u^{-1/2}\ne d\),

\[
\boxed{
L(-u+i0)=A_k(x)+e^{-i\pi k}B_k(x).
}
\tag{5.394}
\]

Consequently its continuously unwrapped normalized phase is

\[
\eta(u)=
\frac1\pi\operatorname{atan2}
\left(
\rho_k(x)\sin(\pi k),\,
1+\rho_k(x)\cos(\pi k)
\right),
\qquad x=u^{-1/2}.
\tag{5.395}
\]

The derivative of the right-hand side with respect to \(\rho\) is

\[
\frac{\sin(\pi k)}
{\pi\{1+2\rho\cos(\pi k)+\rho^2\}}>0.
\]

Because \(u=x^{-2}\), this proves the following exact equivalence:

\[
\boxed{
G_kM^2\in GGC
\quad\Longleftrightarrow\quad
\begin{gathered}
\rho_k\text{ is nonincreasing separately on }(l,d)\text{ and }(d,r),\\
\rho_k(d-)\ge\rho_k(d+)
\quad\text{in the extended one-sided phase sense},
\end{gathered}
\qquad 0<k<1.
}
\tag{5.396}
\]

Indeed, for \(k<1\) all integrand values
\((1+sM^2)^{-k}\) lie in an open sector of angle less than \(\pi\), so
\(L\) is zero-free on the slit plane. The compact-cut keyhole inversion
then turns phase monotonicity into a positive rate-form Thorin measure,
and the converse follows from the same boundary inversion. Since the
map from \(\rho\) to (5.395) is increasing, the displayed middle
condition says precisely that the phase has no reverse jump as \(u\)
increases through \(d^{-2}\). When the separate ratios have finite
one-sided limits it has the literal meaning written in (5.396);
otherwise it is read after applying (5.395). Any positive jump is a
Thorin atom at \(d^{-2}\). Endpoint jumps are treated in the same phase
measure. Finally,
\[
L(0)=1,\qquad
L(s)\sim s^{-k}\mathbb E[M^{-2k}]
\quad(s\to\infty),
\]
so the complete phase, including its atoms, has total increase \(k\).

The formula cannot be specialized by simply setting \(k=1\):
\(A_k\) and \(B_k\) have a common divergence and \(\rho_k\to1\). At
\(k=1\), the correct combined Plemelj boundary is

\[
\begin{aligned}
L(-u+i0)
&=x^2\,{\rm PV}\!\int_l^r
\frac{f_M(m)}{x^2-m^2}\,dm-\frac{i\pi x}{2}f_M(x)
=\frac x2C(x),\\
C(x)&=
2x\,{\rm PV}\!\int_l^r\frac{f_M(m)}{x^2-m^2}\,dm
-i\pi f_M(x).
\end{aligned}
\tag{5.397}
\]

The \(k=1\) criterion is therefore that the continuous phase
\(x\mapsto\arg C(x)\) increase from \(-\pi\) to \(0\), exactly the
criterion proved in WIP-5.35 for total-shape-two vectors with all three
coordinates below one and completed for every positive shape vector in
WIP-5.37. Whenever (5.396) holds, gamma duplication gives
\[
X^2=(G_{2k}M)^2
\overset d=4(G_kM^2)G_{k+1/2}\in GGC.
\]
Thus (5.396), rather than positivity in independent Appell variables, is
the next exact sufficient target for the original square in the
unresolved range \(1<a+b+c<2\). No converse cancellation of the final
gamma factor is claimed.

<a id="wip-5-38"></a>
### WIP-5.38 — the Abel-knot and endpoint structure below total shape two

**Status: [PROVED ALL NODE PHASE JUMPS AND THE CANDIDATE ATOMS; PROVED
PUNCTURED-KNOT MONOTONICITY WHEN \(b<k\); OPEN-INTERVAL MONOTONICITY
REMAINS OPEN].**

This subsection returns to the unresolved range in WIP-5.36.  Let

\[
a+b+c=2k,\qquad \frac12<k<1,\qquad 0<l<d<r,
\tag{5.414}
\]

and attach \(a,b,c\) respectively to \(r,d,l\).  Write

\[
\sigma=a+c,\qquad \nu=\sigma-k=k-b,\qquad
R=r-d,\qquad L=d-l,
\]

and

\[
\mathcal K=
\frac{\Gamma(2k)}{\pi\Gamma(b)}R^{-a}L^{-c}>0.
\]

The nonanalytic part of the three-atom Dirichlet-mean density at its
middle knot is, for \(\sigma\ne1\),

\[
\boxed{
\begin{aligned}
f_M(d+y)&=f_{{\rm reg},+}(y)
 +C_+y^{\sigma-1}+o(y^{\sigma-1}),\\
f_M(d-y)&=f_{{\rm reg},-}(y)
 +C_-y^{\sigma-1}+o(y^{\sigma-1}),\\
C_+&=\mathcal K\Gamma(1-\sigma)\sin(\pi a),\qquad
C_-=\mathcal K\Gamma(1-\sigma)\sin(\pi c).
\end{aligned}
}
\tag{5.415}
\]

For \(\sigma<1\), this is the leading simplex-vertex term.  For
\(\sigma>1\), the regular germs contain the common finite value at the
knot and (5.415) records the first nonanalytic correction.  The formula
comes directly from the simplex coordinates
\[
M-d=(r-d)P_r-(d-l)P_l
\]
and Euler's beta integral; no numerical inversion is used.  At
\(\sigma=1\), (5.415) is read as its logarithmic connection-formula
limit.  That resonant case is treated explicitly below.

First suppose \(b>k\), so that
\(\delta=b-k=k-\sigma>0\).  Put

\[
\alpha=1-k,\qquad
P={\rm B}(\sigma,\alpha),\quad
Q={\rm B}(\sigma,\delta),\quad
R_0={\rm B}(\alpha,\delta),\quad
\lambda=\frac{C_+}{C_-}
=\frac{\sin(\pi a)}{\sin(\pi c)}>0.
\tag{5.416}
\]

Scaling the two Abel integrals in (5.393) at \(d\) gives

\[
\boxed{
\rho_k(d-)=\frac{P+\lambda Q}{R_0},\qquad
\rho_k(d+)=\frac{\lambda R_0}{Q+\lambda P}.
}
\tag{5.417}
\]

Here \(\sigma+\alpha+\delta=1\), and reflection gives

\[
P+Q-R_0=
\frac{\Gamma(\sigma)\Gamma(\alpha)\Gamma(\delta)}{\pi}
\{\sin(\pi\alpha)+\sin(\pi\delta)-\sin(\pi\sigma)\}>0.
\]

Moreover,

\[
\frac{(P+\lambda Q)(Q+\lambda P)}{\lambda}
=P^2+Q^2+(\lambda+\lambda^{-1})PQ
\ge(P+Q)^2>R_0^2.
\tag{5.418}
\]

Thus the middle-knot condition in (5.396) is strict.  More precisely, the
two leading boundary vectors have canonical phases

\[
\arg L(d-)=-\pi(k-c),\qquad
\arg L(d+)=-\pi a,
\]

so the phase jump is exactly

\[
\boxed{\Delta\eta(d^{-2})=b-k.}
\tag{5.419}
\]

When \(b=k\), both Abel ratios have the same logarithmic limit
\(\lambda\), the two phases coincide, and there is no atom at
\(d^{-2}\).  The leading divergences in this case do not determine the
sign of the next global finite-part correction, so no punctured-neighborhood
monotonicity is claimed here for \(b\ge k\).

The two support endpoints give the matching formulas.  If \(c>k\), let
\(e=2k-c\in(0,k)\).  Direct endpoint scaling yields

\[
\rho_k(l+)=\frac{\sin(\pi e)}{\sin(\pi(k-e))},
\qquad
\arg L(l+)=-\pi e,
\]

whereas the exterior phase is \(-\pi k\).  Hence the jump at \(l^{-2}\)
is \(c-k\).  The reciprocal calculation at \(r\) gives a jump \(a-k\)
when \(a>k\).  Consequently all possible node atoms are

\[
\boxed{
(c-k)_+\delta_{l^{-2}}+
(b-k)_+\delta_{d^{-2}}+
(a-k)_+\delta_{r^{-2}}.
}
\tag{5.420}
\]

At most one term is nonzero.  These are candidate Thorin atoms: the node
calculation alone does not prove the remaining continuous phase is
monotone.  If the open-interval condition succeeds, the total Thorin mass
is \(k\); when \(m=\max(a,b,c)>k\), the unique atom has mass \(m-k\) and
the continuous part has mass \(2k-m\).

There is a stronger local result when \(b<k\).  Now
\(0<\nu=k-b<1\), both Abel integrals are finite and continuous at \(d\),
and we set

\[
A_0=A_k(d),\qquad B_0=B_k(d),\qquad
\rho_0=\frac{B_0}{A_0},\qquad
\Lambda_d=
\left(\frac d2\right)^k
\mathcal K\Gamma(1-k)\Gamma(-\nu)<0.
\]

Euler connection formulas reduce all four fractional coefficients to

\[
\boxed{
\begin{aligned}
A_k(d-\varepsilon)
 &=A_0+\Lambda_d\sin(\pi c)\varepsilon^\nu+o(\varepsilon^\nu),\\
B_k(d-\varepsilon)
 &=B_0+\Lambda_d\sin(\pi(k-c))\varepsilon^\nu+o(\varepsilon^\nu),\\
A_k(d+\varepsilon)
 &=A_0+\Lambda_d\sin(\pi(k-a))\varepsilon^\nu+o(\varepsilon^\nu),\\
B_k(d+\varepsilon)
 &=B_0+\Lambda_d\sin(\pi a)\varepsilon^\nu+o(\varepsilon^\nu).
\end{aligned}
}
\tag{5.421}
\]

For \(1<\sigma<2\), the apparent
\(\varepsilon^{1-k}\) terms from the common regular density value cancel
between the translated old interval and the new short interval; the
remaining regular contribution is \(O(\varepsilon)=o(\varepsilon^\nu)\).
For \(\sigma<1\), the bounded remainder contributes
\(O(\varepsilon^{1-k})=o(\varepsilon^\nu)\).  When \(\sigma=1\), write
\(\alpha=1-k=\nu\).  The order-one Markov--Krein transform gives
\[
f_M(d\pm y)=D\log(1/y)+H_\pm+o(1),
\qquad H_+-H_-=-D\pi\cot(\pi a).
\]
The logarithmic Abel terms cancel, while differentiating the exact beta
connection at \(\sigma=1\) reproduces all four coefficients in (5.421).
Thus (5.421) has no resonant exception.

It remains to determine the sign of the two ratio coefficients.  There
is an exact one-dimensional formula for \(\rho_0\).  Dirichlet neutrality
gives independent variables

\[
S=P_r+P_l\sim{\rm Beta}(\sigma,b),\qquad
V=\frac{P_r}{P_r+P_l}\sim{\rm Beta}(a,c),
\qquad N=l+(r-l)V,
\]

and \(M=d+S(N-d)\).  Integrating \(S\), using
\[
{}_2F_1(k,\sigma-k;k;z)=(1-z)^{-(\sigma-k)},
\]
and then making the Möbius substitution \(z=(N-d)/(N+d)\), all Jacobian
powers cancel.  With

\[
p=\frac{d-l}{d+l},\qquad
q=\frac{r-d}{r+d},\qquad
t_0=\frac{p}{p+q},
\tag{5.422}
\]

one obtains

\[
\boxed{
\rho_0=\frac{\mathcal N(t_0)}{\mathcal D(t_0)},
}
\tag{5.423}
\]

where

\[
\begin{aligned}
\mathcal D(t)
&=\int_0^t(t-u)^{-k}u^{a-1}(1-u)^{c-1}\,du,\\
\mathcal N(t)
&=\int_t^1(u-t)^{-k}u^{a-1}(1-u)^{c-1}\,du.
\end{aligned}
\tag{5.424}
\]

The two functions have the Gauss forms

\[
\boxed{
\begin{aligned}
\mathcal D(t)
&={\rm B}(a,1-k)t^{a-k}
{}_2F_1(1-c,a;a+1-k;t),\\
\mathcal N(t)
&={\rm B}(c,1-k)(1-t)^{c-k}
{}_2F_1(1-a,c;c+1-k;1-t).
\end{aligned}
}
\tag{5.425}
\]

They are the two endpoint solutions of the same hypergeometric equation,
with parameters

\[
A_{\rm hg}=k,\qquad B_{\rm hg}=1-\nu,\qquad
C_{\rm hg}=1-a+k.
\tag{5.426}
\]

Their Wronskian therefore has one fixed nonzero sign.  The endpoint
limits of \(\mathcal R=\mathcal N/\mathcal D\) are

\[
\mathcal R(0+)=
\begin{cases}
\dfrac{\sin(\pi a)}{\sin(\pi(k-a))},&a<k,\\[2mm]
+\infty,&a\ge k,
\end{cases}
\qquad
\mathcal R(1-)=
\begin{cases}
\dfrac{\sin(\pi(k-c))}{\sin(\pi c)},&c<k,\\[2mm]
0,&c\ge k.
\end{cases}
\tag{5.427}
\]

When \(a,c<k\), their strict order follows from

\[
\sin(\pi a)\sin(\pi c)
-\sin(\pi(k-a))\sin(\pi(k-c))
=\sin(\pi k)\sin(\pi(k-b))>0.
\tag{5.428}
\]

The other cases follow directly from the infinite or zero endpoint.
Thus
\[
\boxed{\mathcal R'(t)<0\qquad(0<t<1).}
\tag{5.429}
\]

Expanding the quotient in (5.421) now shows

\[
\begin{aligned}
\rho_k'(d-\varepsilon)\le0
&\Longleftrightarrow
\sin(\pi(k-c))-\rho_0\sin(\pi c)\le0,\\
\rho_k'(d+\varepsilon)\le0
&\Longleftrightarrow
\sin(\pi a)-\rho_0\sin(\pi(k-a))\ge0,
\end{aligned}
\tag{5.430}
\]

for all sufficiently small \(\varepsilon>0\), and both inequalities are
strict.  For \(c<k\) and \(a<k\), respectively, this is exactly the
endpoint trapping in (5.427)--(5.429).  If
\(k\le c\le1\), or \(k\le a\le1\), the relevant sign is immediate.  If
\(c>1\), then necessarily \(a<k\), and (5.428), with the negative
denominator \(\sin(\pi c)\), gives
\[
\rho_0<\mathcal R(0+)
<\frac{\sin(\pi(k-c))}{\sin(\pi c)}.
\]
The case \(a>1\) is reciprocal.  This case split is necessary; merely
saying that every shape above \(k\) has the automatic coefficient sign
would be false.

One symmetric reduction may be useful for the remaining global problem.
If \(d=1\), \(lr=1\), and \(a=c\), reciprocal Dirichlet duality gives

\[
f_M(1/x)=x^{2-2k}f_M(x),
\]

and direct substitution in (5.393) yields

\[
\boxed{
A_k(1/x)=x^{-2k}B_k(x),\qquad
B_k(1/x)=x^{-2k}A_k(x),\qquad
\rho_k(x)\rho_k(1/x)=1.
}
\tag{5.431}
\]

In logarithmic coordinates \(x=e^z\), if
\[
h(y)=e^{-ky}e^yf_M(e^y),
\]
then \(h\) is even, and the common factors in the two Abel integrals
cancel to leave the one-sided kernels
\[
\int_{-\log r}^{z}\sinh(z-y)^{-k}h(y)\,dy,\qquad
\int_z^{\log r}\sinh(y-z)^{-k}h(y)\,dy.
\tag{5.432}
\]

There is also a global projective form which removes the squared-distance
kernel.  For \(x\in(l,r)\), put

\[
z_j(x)=\frac{x_j-x}{x_j+x},\qquad
(x_r,x_d,x_l)=(r,d,l),\qquad
(\gamma_r,\gamma_d,\gamma_l)=(a,b,c),
\]

and, for an independent
\(\widehat P\sim{\rm Dirichlet}(a,b,c)\), define

\[
N_x=z_r(x)\widehat P_r+z_d(x)\widehat P_d+
z_l(x)\widehat P_l.
\]

The projective substitution
\[
\widehat P_j=\frac{(x_j+x)P_j}{M+x}
\]
in the Dirichlet simplex integral has Jacobian weight
\((M+x)^{2k}\prod_j(x_j+x)^{-\gamma_j}\).  Since
\[
x^2-M^2=-N_x(M+x)^2
\]
after inversion of this substitution, the Jacobian weight cancels the
entire radial factor.  Consequently

\[
\boxed{
\begin{aligned}
A_k(x)&=x^{2k}\prod_j(x_j+x)^{-\gamma_j}
 \mathbb E[(-N_x)^{-k};\,N_x<0],\\
B_k(x)&=x^{2k}\prod_j(x_j+x)^{-\gamma_j}
 \mathbb E[N_x^{-k};\,N_x>0],
\end{aligned}
}
\tag{5.433}
\]

and hence

\[
\boxed{
\rho_k(x)=
\frac{\mathbb E[N_x^{-k};\,N_x>0]}
     {\mathbb E[(-N_x)^{-k};\,N_x<0]}.
}
\tag{5.434}
\]

Thus the remaining physical phase problem is exactly the monotonicity of
signed negative-moment odds for three hyperbolically moving knots.  A
promising next step is to condition separately on the positive and
negative Dirichlet blocks, reduce the conditional ratio to a two-knot
Gauss quotient, and identify the outer posterior derivative as a
one-variable covariance.

Equations (5.415)--(5.434) are new project derivations.  They prove that
no endpoint or knot jump can obstruct the three-rate auxiliary GGC
criterion.  When \(b<k\), they also remove a full punctured neighborhood
of the middle knot from the unknown set.  What remains is the sign of
\(\rho_k'\) in the open interval interiors; for \(b\ge k\), the next
relative term near the knot is a global finite part and remains included
in that open problem.  The cusp coefficients, beta reductions,
Gauss--Wronskian sign, all six shape-sign cases, endpoint atoms, and
projective cancellation were independently recalculated before this entry
was marked proved.

<a id="wip-5-39"></a>
### WIP-5.39 — full-interval Abel monotonicity when the endpoint shapes are at most one

**Status: [PROVED A NEW THREE-RATE GGC SUBFAMILY FOR ARBITRARY RATES].**

Retain (5.414), so that

\[
\frac12<k<1,\qquad a+b+c=2k,qquad 0<l<d<r,
\]

and the shapes \(a,b,c\) are carried respectively by the scales
\(r,d,l\).  The result of this subsection is

\[
\boxed{
a\le1,\quad c\le1
\quad\Longrightarrow\quad
\rho_k'(x)<0\quad\text{on }(l,d)\cup(d,r).
}
\tag{5.435}
\]

Together with the node analysis in WIP-5.38, this proves

\[
\boxed{
\bigl(rG_a^{(r)}+dG_b^{(d)}+lG_c^{(l)}\bigr)^2\in GGC
\quad
\left(
\begin{array}{c}
\frac12<k<1, a+b+c=2k,\\
a,c\le1, 0<l<d<r
\end{array}
\right),
}
\tag{5.436}
\]

where the gamma variables are independent and have unit rate.  In rate
notation this means that the shapes attached to the smallest and largest
of the three reciprocal rates are at most one.  A unique shape above one
is allowed at the middle scale.

The proof rests on the following two-node lemma.  Let \(0<k<1\), let
\(p,q>0\) satisfy \(p+q=2k\), and let \(W\sim{\rm Beta}(p,q)\).  For
\(\lambda>0\), define

\[
\begin{aligned}
d_q(\lambda)
 &=\mathbb E\!\left[(1-(1+\lambda)W)^{-k};
             W<(1+\lambda)^{-1}\right],\\
n_q(\lambda)
 &=\mathbb E\!\left[((1+\lambda)W-1)^{-k};
             W>(1+\lambda)^{-1}\right],\\
r_q(\lambda)&=\frac{n_q(\lambda)}{d_q(\lambda)}.
\end{aligned}
\tag{5.437}
\]

Then

\[
\boxed{r_q'(\lambda)>0\qquad(\lambda>0).}
\tag{5.438}
\]

Here is an exact proof, including the normalization.  Put
\(t=(1+\lambda)^{-1}\) and introduce the *unnormalized* Abel integrals

\[
\begin{aligned}
D_{p,q}(t)&=\int_0^t(t-u)^{-k}u^{p-1}(1-u)^{q-1}\,du,\\
N_{p,q}(t)&=\int_t^1(u-t)^{-k}u^{p-1}(1-u)^{q-1}\,du.
\end{aligned}
\tag{5.439}
\]

The expectation versions in (5.437) are

\[
d_q(\lambda)=\frac{t^k}{B(p,q)}D_{p,q}(t),\qquad
n_q(\lambda)=\frac{t^k}{B(p,q)}N_{p,q}(t).
\tag{5.440}
\]

Thus their ratio is \(N_{p,q}/D_{p,q}\), but their Wronskian is not the
unnormalized Wronskian below.  Euler's integral gives two endpoint
hypergeometric solutions of

\[
t(1-t)y''+(1-p+k-2t)y'-k(1-k)y=0.
\tag{5.441}
\]

Abel's identity and the endpoint constants give

\[
\boxed{
D_{p,q}N_{p,q}'-D_{p,q}'N_{p,q}
=-\frac{\Gamma(p)\Gamma(q)\Gamma(1-k)}{\Gamma(k)}
t^{p-k-1}(1-t)^{q-k-1}<0.
}
\tag{5.442}
\]

For completeness, if \(p>k\), then as \(t\downarrow0\),

\[
D_{p,q}(t)\sim B(p,1-k)t^{p-k},\qquad
N_{p,q}(t)\longrightarrow B(p-k,q),
\]

which gives the constant in (5.442) directly.  If \(q>k\), the reflected
calculation at \(t=1\) gives the same constant, and \(p=q=k\) follows by
continuity.  Hence \((N_{p,q}/D_{p,q})'(t)<0\).  Since \(t\) is strictly
decreasing in \(\lambda\), (5.438) follows.

We now apply this lemma to the left cut.  Fix \(x\in(l,d)\), set

\[
z_j=z_j(x)=\frac{x_j-x}{x_j+x},\qquad
(x_r,x_d,x_l)=(r,d,l),qquad u=-z_l>0,
\tag{5.443}
\]

and use the projective Dirichlet variable of (5.433).  Dirichlet
neutrality gives independent variables

\[
W=\widehat P_r+\widehat P_d\sim{\rm Beta}(a+b,c),qquad
Q=\frac{\widehat P_r}{\widehat P_r+\widehat P_d}
   \sim{\rm Beta}(a,b).
\tag{5.444}
\]

With

\[
V=z_d+(z_r-z_d)Q,qquad
\lambda=\frac Vu,qquad
\lambda_j=\frac{z_j}{u}\quad(j=d,r),
\]

one has

\[
N_x=u\{(1+\lambda)W-1\},qquad
\rho_k(x)=
\frac{\mathbb E_Q n_c(\lambda(Q))}
     {\mathbb E_Q d_c(\lambda(Q))}.
\tag{5.445}
\]

Let \(y=\log x\).  Since

\[
\frac{d}{dy}z_j=-\frac{1-z_j^2}{2},qquad
\frac{du}{dy}=\frac{1-u^2}{2},
\]

the affine coordinate \(\lambda\in[\lambda_d,\lambda_r]\) evolves as

\[
\frac{d\lambda}{dy}=-L(\lambda),qquad
L(\lambda)=\alpha_0+\alpha_1\lambda>0,
\tag{5.446}
\]

where

\[
\alpha_0=\frac{1+u^2\lambda_d\lambda_r}{2u}>0,qquad
\alpha_1-\alpha_0
=-\frac u2(1+\lambda_d)(1+\lambda_r)<0.
\tag{5.447}
\]

Consequently, for every \(s\in[0,1]\),

\[
\boxed{
\frac{\partial}{\partial\lambda}
\frac{L(\lambda)}{\lambda+s}
=\frac{\alpha_1s-\alpha_0}{(\lambda+s)^2}<0.
}
\tag{5.448}
\]

This elementary inequality is the sign mechanism that controls the
outer mixture.  Put

\[
m=2k-1>0,qquad \beta=1-c\ge0,qquad
T\sim{\rm Beta}(1-k,a+b).
\]

Scaling the first integral in (5.437) gives the exact formula

\[
d_c(\lambda)=
\frac{B(a+b,1-k)}{B(a+b,c)}
(1+\lambda)^{-m}\,
\mathbb E(\lambda+T)^{-\beta}.
\tag{5.449}
\]

If \(\pi_\lambda\) denotes the \(T\)-law tilted by
\((\lambda+T)^{-\beta}\), its logarithmic derivative is

\[
j_c(\lambda):=-\frac{d}{d\lambda}\log d_c(\lambda)
=\frac{m}{1+\lambda}
 +\beta\,\mathbb E_{\pi_\lambda}\frac1{\lambda+T}.
\tag{5.450}
\]

Define \(G_c(\lambda)=L(\lambda)j_c(\lambda)\).  The first term of
\(G_c\) is strictly decreasing by (5.448) with \(s=1\).  For
\(\lambda_2>\lambda_1\),

\[
\frac{d\pi_{\lambda_2}}{d\pi_{\lambda_1}}(t)
\ \propto\
\left(\frac{\lambda_2+t}{\lambda_1+t}\right)^{-\beta}
\tag{5.451}
\]

is nondecreasing in \(t\); hence \(\pi_\lambda\) moves upward in monotone
likelihood-ratio order.  At the same time
\(L(\lambda)/(\lambda+t)\) decreases in both \(\lambda\) and \(t\), by
(5.448).  It follows that

\[
\boxed{G_c(\lambda)\ \text{is strictly decreasing in }\lambda.}
\tag{5.452}
\]

Introduce the outer posterior

\[
\Pi_x(dQ)=
\frac{d_c(\lambda(Q))\,{\rm Beta}(a,b)(dQ)}
     {\mathbb E_Qd_c(\lambda(Q))}.
\tag{5.453}
\]

Then \(\rho_k(x)=\mathbb E_{\Pi_x}r_c(\lambda)\), and differentiation of
this posterior mean, using (5.438), (5.446), and (5.452), gives

\[
\boxed{
\frac{d\rho_k}{dy}
=-\mathbb E_{\Pi_x}[r_c'(\lambda)L(\lambda)]
 +{\rm Cov}_{\Pi_x}(r_c(\lambda),G_c(\lambda))<0.
}
\tag{5.454}
\]

Indeed, the first term is strictly negative, while the covariance of the
increasing function \(r_c\) and the decreasing function \(G_c\) is
nonpositive.  This proves (5.435) on \((l,d)\).

The right cut is the reflected calculation, but its signs are recorded
explicitly.  For \(x\in(d,r)\), put

\[
v=z_r>0,qquad u_d=-z_d,qquad u_l=-z_l,
\]

and take independent

\[
S=\widehat P_d+\widehat P_l\sim{\rm Beta}(b+c,a),qquad
Q=\frac{\widehat P_l}{\widehat P_d+\widehat P_l}
  \sim{\rm Beta}(c,b).
\]

With \(U=u_d+(u_l-u_d)Q\) and \(\lambda=U/v\),

\[
N_x=v\{1-(1+\lambda)S\},qquad
\sigma_k(x):=\rho_k(x)^{-1}
=\frac{\mathbb E_Qn_a(\lambda(Q))}
       {\mathbb E_Qd_a(\lambda(Q))}.
\tag{5.455}
\]

Now \(d\lambda/dy=+L(\lambda)\).  The affine function \(L\) satisfies
the analogues of (5.447)--(5.448), with \(u,\lambda_d,\lambda_r\)
replaced by \(v,u_d/v,u_l/v\).  Because \(a\le1\), the preceding argument
shows that \(G_a=Lj_a\) is strictly decreasing.  With the
\(d_a\)-posterior on \(Q\), denoted again by \(\Pi_x\),

\[
\boxed{
\frac{d\sigma_k}{dy}
=\mathbb E_{\Pi_x}[r_a'(\lambda)L(\lambda)]
 +{\rm Cov}_{\Pi_x}(r_a(\lambda),-G_a(\lambda))>0.
}
\tag{5.456}
\]

Both terms are nonnegative and the first is strictly positive.  Therefore
\(d\rho_k/dy<0\) also on \((d,r)\), completing (5.435).

WIP-5.38 proves that the one-sided phase jump at every endpoint and at the
middle knot has the required sign, with the possible atoms listed in
(5.420).  Hence the phase criterion (5.396) now proves

\[
G_kM^2\in GGC.
\tag{5.457}
\]

Finally, beta--gamma algebra gives
\(rG_a+dG_b+lG_c\overset d=G_{2k}M\), and gamma duplication gives,
with independent factors,

\[
(G_{2k}M)^2\overset d=
4(G_kM^2)G_{k+1/2}\in GGC.
\tag{5.458}
\]

The last implication uses Bondesson's independent-product theorem quoted
in Source 1 below.  Equations (5.435)--(5.458) are new project
derivations.  The Abel Wronskian constant, both logarithmic flows, the
monotone-likelihood-ratio direction, both posterior quotient derivatives,
and the gamma normalization were independently recalculated before this
entry was marked proved.

This theorem covers, for arbitrary three distinct rates and
\(1<a+b+c<2\), every shape vector with all coordinates at most one, as
well as the case in which the unique coordinate above one is attached to
the middle scale.  It includes all equal-shape and all endpoint-symmetric
three-rate families.  The remaining three-rate configurations in this
range have their unique shape above one attached to one of the two extreme
scales; those cases are not decided here.
