# Exponential peeling, integer prefixes, and new square subfamilies

This module closes the exponential and positive-integer cases of the
fractional peeling operator, then propagates existing residual theorems
through leading integer-shape gamma factors. The identifiers
`WIP-7.1`--`WIP-7.6` belong to structural cross-route infrastructure;
they are not the historical Route 7 numbering.

All deductions are proved below. The closure input is classical and its
role in the exponential prototype is explicit in Bondesson's original
proof. The resulting project corollaries carry no claim of priority in
the literature. Noninteger GGC peeling closure remains open. The last two
entries distinguish a support-growing reduction from a valid ordered
peeling argument, and disprove the stronger HCM-density closure target.

## Verified primary source

L. Bondesson, *Generalized Gamma Convolutions and Related Classes of
Distributions and Densities*, Lecture Notes in Statistics 76, Springer,
1992, DOI 10.1007/978-1-4612-2948-3.

- Local file: [Bondesson.pdf](../literature/Bondesson.pdf).
- SHA-256:
  `835E73FD3EA8C46F31EF7513ABABE9EB0E43BFC0E339CABBAC03173DA2857F3A`.
- Section 3.5, printed p. 46 / PDF p. 55: widened GGC measures,
  exponential normalization, and the cdf/fractional-integral examples.
- Theorem 5.4.1, printed pp. 81--82 / PDF pp. 90--91: decreasing HCM
  functions are Laplace transforms of widened GGC measures.
- Theorem 6.2.4, printed pp. 94--95 / PDF pp. 103--104: multiplication
  of a GGC density by a GGC Laplace transform, with the widened versions
  explicitly included.
- Theorem 6.2.7 and its proof, printed pp. 96--97 / PDF pp. 105--106:
  the exponential-prefix prototype. Its integral is a cdf regarded as a
  widened GGC density; its outside factor is decreasing and HCM.

These page ranges were checked directly in the local PDF on 2026-09-05.
The [source note](../notes/bondesson-1992-ggc-hcm-foundational-infrastructure.md)
records the distinction between the widened theorem and its ordinary
probability-density corollary.

<a id="wip-7-1"></a>
## WIP-7.1 — exponential peeling preserves every GGC input

**Status: [PROVED FROM BONDESSON'S WIDENED MULTIPLICATION THEOREM].**

Fix \(q\ge1\), \(\rho=1/q\), and \(b>0\). Let \(\mu\) be a GGC
probability law on \([0,\infty)\), let \(U\sim\mu\), and write
\(F_\mu(y)=\mu([0,y])\). Define

\[
\boxed{
p_{b,q,\mu}(y)=
\frac{b\rho y^{\rho-1}e^{-b y^\rho}F_\mu(y)}
     {\mathbb E e^{-bU^\rho}},\qquad y>0.
}
\tag{7.1}
\]

Then \(p_{b,q,\mu}\) is a GGC probability density. In particular, the
normalized operator \(\mathcal A_{1,b,q}\) of
[WIP-6.2](15-global-criteria-and-power-flow.md#wip-6-2) preserves every
GGC input density, not just matched powered finite-gamma densities.

**Proof.** Let \(\mathcal T_w\) denote the widened GGC measures of
Bondesson, Section 3.5. An operational characterization sufficient here
is that, for every \(\varepsilon>0\), exponential weighting by
\(e^{-\varepsilon y}\) has finite positive mass and can be normalized
to a GGC law. The measure with density \(F_\mu(y)\) lies in
\(\mathcal T_w\). Indeed, its Laplace transform is

\[
\int_0^\infty e^{-sy}F_\mu(y)\,dy=\frac{L_\mu(s)}s,
\qquad s>0.
\tag{7.2}
\]

Equivalently, it is the convolution of Lebesgue measure on
\([0,\infty)\) with \(\mu\), exactly the cdf example in Section 3.5.
For an explicit check, its normalized exponential weighting has Laplace
transform

\[
\frac{\varepsilon}{\varepsilon+s}
\frac{L_\mu(\varepsilon+s)}{L_\mu(\varepsilon)},
\tag{7.3}
\]

the transform of the independent sum of an exponential variable and the
exponentially tilted GGC law. GGC convolution and exponential-tilt closure
follow directly by adding or shifting the Thorin representations.

The function

\[
H_{b,q}(y)=\rho y^{\rho-1}e^{-b y^\rho}
\tag{7.4}
\]

is HCM and decreasing. Powers \(y^c\) are HCM; composition of
\(e^{-b y}\) with \(y^\rho\), \(0<\rho\le1\), is HCM by the
standard HCM composition rule in Section 5.1. Products preserve HCM.
Finally,
\((\log H_{b,q})'=(\rho-1)/y-b\rho y^{\rho-1}\le0\).
Thus Theorem 5.4.1 places \(H_{b,q}\) in the Laplace-transform class
associated with \(\mathcal T_w\). The widened version of Theorem 6.2.4
now places \(H_{b,q}(y)F_\mu(y)dy\) in \(\mathcal T_w\).

Its total mass is finite and strictly positive. Tonelli gives exactly

\[
\begin{aligned}
\int_0^\infty H_{b,q}(y)F_\mu(y)\,dy
&=\mathbb E\int_U^\infty\rho y^{\rho-1}e^{-b y^\rho}\,dy\\
&=\frac1b\mathbb E e^{-bU^\rho}.
\end{aligned}
\tag{7.5}
\]

A finite nonzero widened GGC measure normalizes to a GGC probability:
normalize its exponential weightings and let \(\varepsilon\downarrow0\),
using dominated convergence and GGC weak closure. This proves (7.1).
No density assumption on \(\mu\) was needed. \(\square\)

There is also an exact probabilistic description. Set \(Z=U^\rho\)
and let \(\widetilde Z_b\) be its exponential tilt,

\[
\mathbb P(\widetilde Z_b\in dz)
=\frac{e^{-bz}\mathbb P(Z\in dz)}{\mathbb E e^{-bZ}}.
\tag{7.6}
\]

For \(E_b\sim\operatorname{Exp}(b)\) independent of this variable,
the law of \((\widetilde Z_b+E_b)^q\) has density (7.1).
Condition on \(Z=z\), use the exponential density above \(z\), and
cancel the factor \(e^{bz}\) against the tilting weight to verify this
identity. This is a specific transformation of a GGC input \(U\);
it does not assume that its root \(Z\) is GGC.

<a id="wip-7-2"></a>
## WIP-7.2 — all positive-integer peeling orders preserve GGC

**Status: [PROVED INTEGER-ORDER CLOSURE; NO NONINTEGER INTERPOLATION].**

Let \(m\ge1\) be an integer. Retain the notation of WIP-7.1 and let
\(G_m/b\) be independent of \(\widetilde Z_b\). Then

\[
\boxed{(\widetilde Z_b+G_m/b)^q\in GGC.}
\tag{7.7}
\]

The corresponding density is the normalization of

\[
\frac{\rho}{\Gamma(m)}y^{\rho-1}e^{-b y^\rho}
\int_{[0,y]}(y^\rho-u^\rho)^{m-1}\mu(du).
\tag{7.8}
\]

Its normalizing integral is \(b^{-m}\mathbb E e^{-bU^\rho}\),
by conditioning or Tonelli. Thus (7.7) proves arbitrary-GGC-input
closure of \(\mathcal A_{m,b,q}\) for every positive integer \(m\).

**Proof.** Choose \(0<c_1<\cdots<c_m<b\), put \(c_0=0\),
\(\delta=b-c_m>0\), and define a starting probability law

\[
\mu_\delta(du)
=\frac{e^{-\delta u^\rho}\mu(du)}{\mathbb E e^{-\delta U^\rho}}.
\tag{7.9}
\]

This law is GGC. For an input with a density this follows from Theorem
6.2.4, because \(e^{-\delta u^\rho}\) is a normalized decreasing HCM
function. The same statement for a general GGC measure follows by weak
approximation with GGC densities: convolve with \(\operatorname{Gamma}
(\varepsilon,1)\) and let \(\varepsilon\downarrow0\). The weighting
function is bounded and continuous with a positive limiting integral,
so weighted weak convergence is legitimate.

Starting with \(\mu_\delta\), apply WIP-7.1 successively with
parameters \(c_m-c_{m-1},c_{m-1}-c_{m-2},\ldots,c_1-c_0\), all
strictly positive. Formula (7.6) shows inductively that the final root
variable is the independent sum

\[
\widetilde Z_b+\sum_{j=1}^m E_{c_j}.
\tag{7.10}
\]

To check the rate bookkeeping, exponential tilting by \(v>0\) of
an independent sum tilts its factors independently; an exponential rate
\(r\) becomes \(r+v\), and the tilt parameter on \(Z\) also increases
by \(v\). The cumulative increases telescope to the rates \(c_j\)
and to the final tilt \(\delta+c_m=b\). Every powered intermediate
law is GGC by WIP-7.1.

Now take, for example, \(c_j=b-(m-j+1)\varepsilon\), with
\(0<\varepsilon<b/(m+1)\). All rates approach \(b\), and the sum of
the exponentials converges to \(G_m/b\), independently of the fixed
\(\widetilde Z_b\). Continuity of the power map and GGC weak closure
prove (7.7). Formula (7.8) is the ordinary gamma-convolution density
followed by \(x=y^\rho\); it includes the same normalization as WIP-6.2.
\(\square\)

This proof uses integer gamma decomposition and weak limits of positive
rates. It gives no approximation of an arbitrary noninteger shape by
integers. In particular it does not prove the fractional closure
conjecture of WIP-6.2.

<a id="wip-7-3"></a>
## WIP-7.3 — a fixed-power residual theorem admits integer prefixes

**Status: [PROVED CONDITIONAL BOOTSTRAP FOR ARBITRARY SUPPORT SIZE].**

Fix \(q\ge1\) and positive residual shapes
\(\gamma_1,\ldots,\gamma_r\). Assume the following uniform-in-rates
residual theorem:

\[
\left(\sum_{i=1}^r G_{\gamma_i}/d_i\right)^q\in GGC
\qquad\text{for every choice }d_1,\ldots,d_r>0.
\tag{7.11}
\]

Let \(m_1,\ldots,m_j\) be positive integers and suppose

\[
0<c_1\le\cdots\le c_j\le\min_i d_i.
\tag{7.12}
\]

Then

\[
\boxed{
\left(\sum_{h=1}^jG_{m_h}/c_h+
             \sum_{i=1}^rG_{\gamma_i}/d_i\right)^q\in GGC.
}
\tag{7.13}
\]

All factors here are independent. The conclusion preserves any already
proved power \(q\); it does not turn a square theorem into a theorem
for all powers.

**Proof for strict rates.** First suppose
\(c_1<\cdots<c_j<\min d_i\). Prove (7.13) by induction on \(j\).
For the first added prefix, the shifted residual
\(Z=\sum_iG_{\gamma_i}/(d_i-c_1)\) has positive rates, and
\(U=Z^q\) is GGC by (7.11). Its root, after exponential tilting by
\(c_1\), has independent gamma summands of rates \(d_i\).
WIP-7.2 then adds \(G_{m_1}/c_1\) and proves (7.13).

For the inductive step, remove the first prefix and subtract \(c_1\)
from all remaining rates. The remaining integer prefixes still precede
the residual rates, and all rates remain positive. The induction
hypothesis makes this shifted sum to power \(q\) GGC. Applying
WIP-7.2 with shape \(m_1\) and rate \(c_1\) recovers the desired
original sum. The base hypothesis is available at every shifted rate
vector because of its explicit quantifier in (7.11).

**Equal-rate limits.** In (7.12), replace
\(c_h\) by \(c_h-(j-h+1)\varepsilon\), for sufficiently small
\(\varepsilon>0\), leaving the residual rates unchanged. These new
prefix rates are positive, strictly increasing, and strictly below all
residual rates. The strict case applies. Coupling all gammas with fixed
unit-rate variables and letting \(\varepsilon\downarrow0\) gives
(7.13) by weak closure. Thus splitting an integer part from a gamma
shape at an already occupied smallest rate is legitimate only after
this limit; no gamma probability of rate zero is introduced. \(\square\)

An empty residual can be handled by the same exponential construction
starting from \(U=0\). The resulting all-integer assertion for arbitrary
\(q\ge1\) is the classical \(PF_\infty\) power theorem, not a new
general-power result.

<a id="wip-7-4"></a>
## WIP-7.4 — concrete square corollaries beyond the existing residuals

**Status: [PROVED ORIGINAL-SQUARE GGC SUBFAMILIES; NO AUXILIARY CONVERSE].**

The bootstrap has three established project inputs:

1. Every finite gamma convolution of total shape at most one has a GGC
   square, without a support restriction:
   [WIP-5.26 and WIP-5.29](10-route5-support-wide-closure-and-shape-propagation.md).
2. Every two-rate finite gamma convolution has a GGC square, for arbitrary
   positive shapes:
   [WIP-5.30](11-route5-two-rate-arbitrary-shapes.md#wip-5-30).
3. Every finite gamma convolution with at most three distinct rates and
   total shape at most two has a GGC square:
   [WIP-5.44](14-averaged-phase-compensation.md#wip-5-44), especially
   (5.496).

These theorems are uniform in positive rates, as required by (7.11).

### Integer prefix with a small-total-shape tail

Order the distinct rates of a finite gamma convolution as
\(b_1<\cdots<b_n\), with shapes \(\beta_i>0\) and total \(B\).
Suppose there is an index \(j\) such that all \(\beta_i\), \(i<j\),
are positive integers. Choose an integer \(m\) with
\(0\le m\le\beta_j\). If

\[
0<B-\sum_{i<j}\beta_i-m\le1,
\tag{7.14}
\]

then \(X^2\in GGC\). Indeed, remove the indicated leading integer
gammas and the integer part \(m\) at rate \(b_j\). The remaining
shapes have total at most one, so input 1 and WIP-7.3 apply. If
\(m=\beta_j\), the zero residual shape is simply omitted. If the
remaining total is zero, the law is instead entirely in the classical
integer-shape case. Equal prefix and residual rates created by partial
removal are covered by the limit in WIP-7.3.

In particular,

\[
\boxed{
B\le2,\qquad \beta_1\ge1
\quad\Longrightarrow\quad X^2\in GGC
\quad\text{for arbitrary finite support}.
}
\tag{7.15}
\]

For a nonempty residual, take \(j=1,m=1\) in (7.14). Its total is
\(B-1\le1\). When \(B=1\), these assumptions force the
one-exponential case. Here \(\beta_1\) is the shape at the **smallest
rate**, equivalently the **largest scale**. Formula (7.15) does not
interchange these orientations.

### Integer prefix with an arbitrary two-rate tail

If the first \(n-2\) shapes are positive integers, with no restriction
on the last two positive shapes, then

\[
\boxed{
\beta_1,\ldots,\beta_{n-2}\in\mathbb N
\quad\Longrightarrow\quad X^2\in GGC.
}
\tag{7.16}
\]

Use input 2 for the tail and prepend the integer shapes with WIP-7.3.
There is no total-shape bound in (7.16). The cases \(n\le2\) are the
already-proved tail theorem itself.

These results are membership theorems for the **original square**.
For three scales \(l<d<r\) and \(X=rG_a+dG_b+lG_c\), (7.15)
settles \(1<B=a+b+c\le2\) when \(a\ge1\). It does not prove the
sufficient auxiliary assertion \(G_{B/2}M^2\in GGC\). Consequently
the auxiliary reciprocal duality of
[WIP-5.41](14-averaged-phase-compensation.md#wip-5-41) cannot be used to
transfer this original-square theorem to the opposite endpoint
\(c>1\). The independent auxiliary proof in WIP-5.44 now settles that
endpoint, and is the reason input 3 is available; it is not a converse
deduced from (7.15).

### Integer prefix with a three-rate tail of total shape at most two

Suppose a residual tail occupies at most three rates, its positive
shapes have total at most two, and every shape strictly before the tail
in increasing rate order is a positive integer. Then the original
square is GGC. In the notation of (7.12), for \(1\le r\le3\),

\[
\boxed{
\gamma_i>0,\quad\sum_{i=1}^r\gamma_i\le2,
\quad m_h\in\mathbb N,
\quad0<c_1\le\cdots\le c_j\le\min_i d_i
\quad\Longrightarrow\quad
\left(\sum_{h=1}^jG_{m_h}/c_h+
             \sum_{i=1}^rG_{\gamma_i}/d_i\right)^2\in GGC.
}
\tag{7.17}
\]

**Proof.** Input 3 proves (7.11) with \(q=2\) for the tail.
WIP-7.3 prepends the integer shapes, including coincident-rate limits.
The total shape of the whole sum need not be at most two: only the
tail has that restriction. This is again an **original-square** theorem,
not an auxiliary membership assertion. \(\square\)

The new closure is reusable but currently restricted to integer peeling
orders. It does not settle general \(0<a<1\) in
\(\mathcal A_{a,b,q}\), and none of the square corollaries alone
establishes a universal noninteger-power theorem.

<a id="wip-7-5"></a>
## WIP-7.5 — small-shape reduction and the rate-order barrier to integer peeling

**Status: [PROVED REDUCTION WITH UNBOUNDED SUPPORT SIZE; PROVED LIMITATION
OF THE ORDERED PEELING ARGUMENT].**

Fix \(q\ge1\) and any \(\eta>0\). The following two assertions are
equivalent:

- Every finite gamma convolution \(X\), with arbitrary positive
  shapes and rates, satisfies \(X^q\in GGC\).
- The same assertion holds when every individual shape belongs to
  \((0,\eta)\), still for **every finite number of distinct rates**.

The equivalence also holds with the same fixed total-shape restriction
\(B\le B_*\), or \(B=B_*\), on both sides. No increase of total
shape is involved.

**Proof.** Only the second-to-first implication needs proof. Write
\(X=\sum_{i=1}^nG_{\beta_i}/b_i\), merging equal rates if needed.
Choose integers \(N_i\ge1\) with \(\beta_i/N_i<\eta\), and take
independent \(G_{i,h}\sim\operatorname{Gamma}(\beta_i/N_i,1)\).
The elementary gamma Laplace transform gives

\[
\prod_{h=1}^{N_i}
\mathbb E e^{-sG_{i,h}/b_i}
=\prod_{h=1}^{N_i}(1+s/b_i)^{-\beta_i/N_i}
=(1+s/b_i)^{-\beta_i}.
\tag{7.18}
\]

Hence \(X\overset d=\sum_{i,h}G_{i,h}/b_i\). If the assumed
small-shape theorem allows repeated rates with labeled summands, this
already finishes the proof. To require genuinely distinct rates, choose
pairwise distinct positive offsets \(t_{i,h}\) and put

\[
X_\varepsilon=\sum_{i,h}
\frac{G_{i,h}}{b_i+\varepsilon t_{i,h}}.
\tag{7.19}
\]

For all sufficiently small \(\varepsilon>0\), all these rates are
positive and pairwise distinct: within each original rate group this
follows from distinct offsets, and the finitely many different original
groups remain separated. The shapes are in \((0,\eta)\), and their
sum remains \(\sum_i\beta_i\). Thus the hypothesized theorem gives
\(X_\varepsilon^q\in GGC\). On the displayed coupling,
\(X_\varepsilon\to\sum_{i,h}G_{i,h}/b_i\) almost surely. Continuity
of the power and GGC weak closure give \(X^q\in GGC\).
\(\square\)

The use of GGC weak closure is classical; see Bondesson, Theorem 3.1.5,
printed pp. 34--35 / PDF pp. 43--44,
as recorded in the [foundational source note](../notes/bondesson-1992-ggc-hcm-foundational-infrastructure.md#23-weak-closure-with-the-canonical-measure).
The Laplace-transform splitting and rate-separation argument are elementary
project deductions. They supply an exact reduction, not a new closure
mechanism. In particular a theorem for a fixed maximum of three rates
cannot be inserted here: the sum \(\sum_iN_i\) can be arbitrarily
large even when the original support is small.

### Why integer peeling does not remove every integer part

For a matched finite-gamma input to peel a component at rate \(b\),
the construction in WIP-6.2 and WIP-7.3 replaces every unpeeled rate
\(d\) by \(d-b\). These rates must be positive. Equality can be
reached by the explicitly proved weak limit; a strictly smaller
unpeeled rate would instead produce a negative rate and is inadmissible.
Consequently only integer shapes at the currently smallest rates can
be removed by this argument, up to an integer part at its stopping rate.

For example, consider shapes \((1/2,3/2)\) at rates
\(0<b_1<b_2\). The smallest-rate shape has no positive integer
part. Removing one unit from the second shape would require an
unpeeled gamma of rate \(b_1-b_2<0\). Splitting the second gamma
as shapes \(1\) and \(1/2\) does not change this obstruction.
Nor does an infinitesimal separation of equal rates change the strictly
negative difference. Thus ordered integer peeling alone does **not**
reduce all shape vectors to coordinates in \((0,1)\).

This is a limitation of a particular constructive proof, not evidence
that either gamma sum fails to have a GGC power. The small-shape
reduction above remains valid precisely because it uses many gamma
summands and a support-growing weak limit instead of inadmissible
rate subtraction.

<a id="wip-7-6"></a>
## WIP-7.6 — matched peeling need not preserve HCM densities

**Status: [PROVED HCM-DENSITY OBSTRUCTION; NOT A COUNTEREXAMPLE TO GGC
PEELING OR THE GGC POWER CONJECTURE].**

For every \(a>0\), every \(1\le q<2\), and every pair
\(0<b_1<b_2\), there is a matched HCM-density input to
\(\mathcal A_{a,b_1,q}\) whose normalized output density is not HCM.
This includes \(0<a<1\), but is not restricted to noninteger shapes.

### Matched input and exact output

Put \(\rho=1/q\), \(d_0=b_2-b_1>0\), and let
\(U=(G_a/d_0)^q\). Its density is

\[
h(u)=\frac{\rho d_0^a}{\Gamma(a)}
u^{a\rho-1}e^{-d_0u^\rho},\qquad u>0.
\tag{7.20}
\]

It is HCM: powers of \(u\) are HCM, and
\(e^{-d_0u^\rho}\) is HCM for \(0<\rho\le1\) by the standard
HCM argument-composition rule (Bondesson, Section 5.1). In particular
the input is GGC. The matched identity of WIP-6.2 says that the output
is the law of

\[
Y=X^q,\qquad X=G_a/b_1+G'_a/b_2,
\qquad G_a\perp G'_a.
\tag{7.21}
\]

For completeness the unnormalized operator density is
\[
(\mathcal A_{a,b_1,q}h)(y)=
\frac{\rho}{\Gamma(a)}y^{\rho-1}e^{-b_1y^\rho}
\int_0^y(y^\rho-u^\rho)^{a-1}h(u)\,du.
\tag{7.22}
\]
The integrable singularity at the upper endpoint when \(a<1\)
causes no problem. Its total mass is
\[
b_1^{-a}\mathbb E e^{-b_1U^\rho}
=b_1^{-a}(d_0/b_2)^a.
\]
Indeed, substituting \(u=t^q\) in (7.22) gives the convolution
kernel of two shape-\(a\) gammas; multiplication by the inverse of
this mass produces exactly (7.21).

### A normalized Bessel density and its complex zeros

Set
\[
\nu=a-\tfrac12>-\tfrac12,\qquad
c=\frac{b_1+b_2}{2},\qquad d=\frac{b_2-b_1}{2}>0,\qquad
K=\frac{(b_1b_2)^a\sqrt\pi}
        {2^{a-1/2}\Gamma(a)d^{a-1/2}}>0.
\tag{7.23}
\]
The ordinary convolution density is
\[
\boxed{
f_X(x)=K x^\nu e^{-cx}I_\nu(dx),\qquad
f_Y(y)=\rho K y^{\rho(\nu+1)-1}
                 e^{-cy^\rho}I_\nu(dy^\rho).
}
\tag{7.24}
\]
To verify the constant, substitute \(t=x(1+v)/2\) in
\[
f_X(x)=\frac{(b_1b_2)^a}{\Gamma(a)^2}
\int_0^x t^{a-1}(x-t)^{a-1}e^{-b_1t-b_2(x-t)}\,dt.
\]
The result is
\[
\frac{(b_1b_2)^a x^{2a-1}e^{-cx}}{2^{2a-1}\Gamma(a)^2}
\int_{-1}^1(1-v^2)^{a-1}e^{dxv}\,dv.
\]
Apply the integral representation
[NIST DLMF 10.32.2](https://dlmf.nist.gov/10.32.E2), whose hypothesis
\(\Re\nu>-1/2\) holds, to obtain (7.24). The second density then
follows from \(x=y^\rho\).

Let \(\Omega=\mathbb C\setminus(-\infty,0]\) and use the principal
logarithm throughout: \(z^r=\exp(r\operatorname{Log}z)\).
The right side of (7.24) defines a holomorphic function of
\(y\in\Omega\). Indeed, \(y^\rho\) has argument in
\((-\rho\pi,\rho\pi)\), so it never crosses the branch cut of
the principal \(I_\nu\); all other displayed factors are
holomorphic there.

Choose any positive zero \(j_{\nu,m}\) of \(J_\nu\), whose
existence follows from
[NIST DLMF 10.21(i)](https://dlmf.nist.gov/10.21.i). Define
\[
y_m=\left(\frac{j_{\nu,m}}d\right)^q e^{iq\pi/2}.
\tag{7.25}
\]
Because \(1\le q<2\), its argument lies in \([\pi/2,\pi)\),
so \(y_m\in\Omega\) and its principal root satisfies
\(d y_m^\rho=i j_{\nu,m}\). The connection formula
[NIST DLMF 10.27.6](https://dlmf.nist.gov/10.27.E6), with the branch
choice \(z e^{-i\pi/2}=j_{\nu,m}>0\), gives
\[
I_\nu(i j_{\nu,m})=e^{i\pi\nu/2}J_\nu(j_{\nu,m})=0.
\tag{7.26}
\]
Every other factor of \(f_Y(y_m)\) in (7.24) is finite and nonzero.
Thus the analytic continuation of this density has a zero inside
\(\Omega\).

### Why the zero excludes HCM, but not GGC

A nonzero HCM function has a zero-free holomorphic continuation to
\(\Omega\). This follows directly from Bondesson's canonical
representation. In its finite-measure parametrization, put
\(K_t(z)=t\operatorname{Log}((t+1)/(t+z))\) for \(t<\infty\)
and \(K_\infty(z)=1-z\). The representation is
\[
f(z)=Cz^{\beta-1}\exp\left\{
\int_{(1,\infty]}K_t(z)\,\nu_1(dt)
+\int_{[1,\infty]}K_t(z^{-1})\,\nu_2(dt)
\right\},
\tag{7.27}
\]
where \(C>0\), \(\beta\in\mathbb R\), and the two measures
\(\nu_1,\nu_2\) are nonnegative and finite. On every compact
subset of \(\Omega\), the kernels are uniformly bounded for
\(1\le t\le\infty\) and holomorphic in \(z\); the convergence
to \(K_\infty\) is locally uniform. The exponent is therefore
holomorphic, and neither \(z^{\beta-1}\) nor the exponential
vanishes. Precise source: Section 5.2, canonical representation (5.2.7),
printed p. 76 /
PDF p. 85, together with Theorem 5.3.1, printed p. 79 / PDF p. 88,
which identifies the canonical class with all HCM densities. These
source pages and the DLMF formulas above were checked on 2026-09-05.

If the positive-real density \(f_Y\) were HCM, this zero-free
continuation would agree with (7.24) on \((0,\infty)\), hence on
the connected domain \(\Omega\) by the identity theorem. Equation
(7.26) contradicts zero-freeness. Therefore \(f_Y\) is not HCM.
\(\square\)

This is an obstruction only to the proposed **density-level HCM
invariant**. GGC membership asks for HCM of the **Laplace transform**,
not of the density. At \(q=1\), the output (7.21) is a GGC by
ordinary gamma convolution, and for positive integer \(a\) it is a
GGC for every \(q\ge1\) by WIP-7.2, despite the density obstruction
for \(q<2\). At \(q=2\) the displayed zeros land on the excluded
negative axis, so this proof makes no non-HCM assertion there. Equal
rates are also excluded: \(d=0\) reduces the sum to a single gamma,
whose \(q\ge1\) powers have HCM densities.

No numerical zero locations or numerical sign checks are used. The
matched construction and its interpretation are project deductions;
the Bessel integral, Bessel zeros, and HCM representation are the
explicit classical inputs above. No claim of literature priority is
made.
