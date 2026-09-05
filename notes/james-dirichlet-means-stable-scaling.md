---
title: "James identities: matched Dirichlet means and stable scaling"
sources:
  - "https://arxiv.org/pdf/math/0610218v3"
  - "https://arxiv.org/pdf/math/0609488v4"
  - "https://arxiv.org/pdf/1010.1639v1"
status: "selected theorem statements and project implications audited"
last_verified: "2026-09-05"
---

# James identities and the remaining stable-factor gap

## 0. Sources and notation

The checked versions are:

- **[J06]** Lancelot F. James, *Gamma Tilting Calculus for GGC and
  Dirichlet means with applications to Linnik processes and Occupation
  Time Laws for Randomly Skewed Bessel Processes and Bridges*,
  [arXiv:math/0610218v3](https://arxiv.org/abs/math/0610218v3),
  7 November 2006. Theorem 4.1 is on PDF p. 13; Proposition 5.7 on
  pp. 21--22; Proposition 5.14 on p. 24. These are manuscript pages,
  not journal pagination.
- **[JLP08]** L. F. James, A. Lijoi and I. Prünster, *Distributions of
  linear functionals of two parameter Poisson--Dirichlet random
  measures*, **Annals of Applied Probability 18** (2008), 521--551,
  [DOI 10.1214/07-AAP462](https://doi.org/10.1214/07-AAP462).
  Checked [arXiv:math/0609488v4](https://arxiv.org/pdf/math/0609488v4),
  31 March 2008, an electronic reprint with different pagination.
  Theorem 2.1 and equations (13)--(14) are on reprint/PDF p. 8.
- **[J10]** L. F. James, *Dirichlet mean identities and laws of a class
  of subordinators*, **Bernoulli 16** (2010), 361--388,
  [DOI 10.3150/09-BEJ224](https://doi.org/10.3150/09-BEJ224).
  Checked [arXiv:1010.1639v1](https://arxiv.org/pdf/1010.1639v1),
  8 October 2010. Theorem 2.1: PDF p. 8; Theorem 3.1: pp. 12--13;
  Remark 3.1: p. 15. Page references here use this electronic reprint.

**[SOURCE]** denotes an external result. **[PROJECT CONNECTION]** denotes
its application or a remaining obligation. No novelty is claimed for the
identities below.

Let \(G_b\sim\Gamma(b,1)\), and let
\(\mathbb E e^{-sS_\rho}=e^{-s^\rho}\), \(0<\rho<1\).
The project's tilt is

\[
\mathbb P(T_{\rho,B}\in dt)
=\frac{t^{-\rho B}\mathbb P(S_\rho\in dt)}
       {\mathbb E S_\rho^{-\rho B}},\qquad B>0.
\tag{J.1}
\]

James writes this law as \(T_{\rho,\rho B}^{\rm J}\): his second
parameter is the negative-power exponent, not the project's total gamma
shape. Write \(M_b(F)\) for an ordinary Dirichlet mean of order \(b\)
and base probability \(F\). Require
\(\int\log(1+x)F(dx)<\infty\); finite positive atomic bases satisfy this.
All factors in each displayed product identity are independent unless a
change of probability is explicitly specified.

## 1. Established stable identities

**[SOURCE: J06, Theorem 4.1(i),(iv)]** In project notation,

\[
G_B^{1/\rho}\overset d=G_{\rho B}/T_{\rho,B},
\qquad
S_\rho/T_{\rho,B}\overset d=M_{\rho B}(\varrho_\rho),
\tag{J.2}
\]

where \(\varrho_\rho=\mathcal L(S_\rho/S_\rho')\) and \(S_\rho'\)
is an independent copy. Thus the basic Route 1 gamma-power factorization
is a literature result, also independently derived in the project.

**[SOURCE: J06, Proposition 5.7(i)]** Put
\(F_\rho=\mathcal L(V^{1/\rho}S_\rho/S_\rho')\), \(V\sim F\).
Then

\[
M_{\rho B}(F_\rho)
\overset d=M_{\rho B}(\varrho_\rho)M_B(F)^{1/\rho}.
\tag{J.3}
\]

**[SOURCE: J06, Proposition 5.14]** For \(0<\rho,\sigma<1\),

\[
T_{\rho\sigma,B}
\overset d=T_{\rho,\sigma B}T_{\sigma,B}^{1/\rho}.
\tag{J.4}
\]

To check the parameter conversion in (J.4), substitute
\(\alpha=\rho,\beta=\sigma,\theta=\sigma B\) into James's
\(T^{\rm J}_{\alpha\beta,\alpha\theta}
=T^{\rm J}_{\alpha,\alpha\theta}(T^{\rm J}_{\beta,\theta})^{1/\alpha}\).
The project's proof by factorizing the power-bias weight is retained in
[STABLE-L2](stable-mellin-poisson-tilt-infrastructure.md#32-negative-tilts-inherit-the-stable-composition-law).

## 2. What is known for the exact residual

**[PROJECT CONNECTION]** For \(X=G_BM_B(F)\) and \(q=1/\rho\), set

\[
N_{\rho,B,F}=\frac{M_B(F)^{1/\rho}}{T_{\rho,B}}.
\]

Equations (J.2)--(J.3) give the two different conclusions

\[
X^q\overset d=G_{\rho B}N_{\rho,B,F},
\qquad
S_\rho N_{\rho,B,F}\overset d=M_{\rho B}(F_\rho).
\tag{J.5}
\]

The second conclusion identifies the residual after multiplication by an
additional stable variable. It does not identify \(N_{\rho,B,F}\) itself
as an order-\(\rho B\) Dirichlet mean. Cancellation of a common
independent factor in two distributional equalities is different from
inferring that membership in a class survives division by that factor.

**[OPEN OBLIGATION: J-DM]** Find an ordinary Dirichlet-mean representation
for \(N_{\rho,B,F}\), or a sign-preserving recognition criterion for the
stable deconvolution in (J.5). A successful representation must retain
the order \(\rho B\); arbitrary gamma-mixture membership is insufficient.

## 3. A verified Poisson--Dirichlet to Dirichlet interface

**[SOURCE: JLP08, Theorem 2.1, equations (13)--(14)]** Let
\(0<a<1,\theta>0\), let \(H\) be the nonatomic base probability in the
paper's construction, and let \(f\ge0\) be measurable with
\(\int f^a\,dH<\infty\). If
\(Q_{a,0}=\mathcal L(P_{a,0}(f))\), then

\[
P_{a,\theta}(f)\overset d=M_\theta(Q_{a,0}),
\tag{J.6}
\]

and, safely stated for real \(z>0\),

\[
\mathbb E(z+P_{a,\theta}(f))^{-\theta}
=\left(\int(z+f(x))^aH(dx)\right)^{-\theta/a}.
\tag{J.7}
\]

The nonatomic assumption on the underlying space causes no restriction
for a finite atomic law of \(f\): use a piecewise constant \(f\) on
\([0,1]\) with Lebesgue base. Only the distributional identity is imported;
no absolute-continuity assertion is needed, especially when \(f\) is constant.

**[PROJECT CONNECTION]** A genuine positive linear
\(PD(a,\rho B)\) representation of \(N_{\rho,B,F}\), satisfying these
integrability conditions, would finish J-DM by (J.6). Thus the missing
step is not a general lack of a PD-to-Dirichlet conversion. It is the
construction of the required linear mean with the correct order and law.
Identifying the tilted stable total mass, or only its normalized jumps,
does not identify this functional. A nonlinear functional of those jumps
also does not automatically qualify for (J.6).

## 4. Matched beta scaling and posterior transformations

**[SOURCE: J10, Theorem 2.1]** For \(\theta>0,0<\sigma\le1\),

\[
\operatorname{Beta}(\theta\sigma,\theta(1-\sigma))
M_{\theta\sigma}(F)
\overset d=M_\theta(\sigma F+(1-\sigma)\delta_0),
\tag{J.8}
\]

with the beta variable equal to one when \(\sigma=1\).

**[SOURCE: J10, Theorem 3.1]** For \(c>0\), tilt the law of
\(M=M_\theta(F)\) by the normalized weight \((1+cM)^{-\theta}\).
Under this tilted probability, \(cM/(1+cM)\) has law
\(M_\theta(F_c)\), where \(F_c=\mathcal L(cV/(1+cV))\), \(V\sim F\).
These statements require the corresponding Dirichlet means to exist;
the positive finite-atomic project bases satisfy this requirement.

**[PROJECT CONNECTION]** These are exact tools for the matched recursion
and for changing projective coordinates with the accompanying posterior
weight. They do not justify omitting that weight or replacing \(\theta\)
by an arbitrary gamma shape. J10, Remark 3.1, expressly warns that
\(G_\kappa M_\theta(F)\) need not be GGC for \(\kappa\ne\theta\).

## 5. Restricted attempt blueprint

1. Reproduce (J.5) for the one-atom base and the two-atom \(q=3/2\)
   residual, with all gamma orders and independence statements visible.
2. For the latter residual, seek the precise linear functional in (J.6)
   or an explicit stable-deconvolution certificate. Test the candidate
   against its generalized Stieltjes transform before constructing a
   more elaborate process coupling.
3. Use (J.8) and the posterior transform only when their shape and weight
   conditions match the update under consideration.
4. Stop a proposed closure argument if it only proves the second identity
   in (J.5), a conditional GGC law, or a nonlinear PD functional.

This note audits selected external tools and their scope. It proves no
new parameter range of the GGC power conjecture.
