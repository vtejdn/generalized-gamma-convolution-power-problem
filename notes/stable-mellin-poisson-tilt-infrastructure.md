---
title: "Stable Mellin, product, and Poisson infrastructure for negative tilts"
sources:
  - "../literature/Zolotarev.pdf"
  - "../literature/Bertoin.pdf"
source_type: "research monographs"
status: "audited"
last_verified: "2026-09-05"
source_sha256:
  Zolotarev.pdf: "05352D46E3B2547B06B4CB57A184864BB59EC912425970D18E8668ACA9B9EC3D"
  Bertoin.pdf: "299A8BC3C7F5854E63DDBE0221B485864BFD383869933DC8507E5B6EDD248216"
topics:
  - positive stable distributions
  - Mellin transforms
  - gamma products
  - power biasing
  - Poisson random measures
  - tempered stable subordinators
---

# Stable Mellin, product, and Poisson infrastructure

Primary sources:

- V. M. Zolotarev, [*One-dimensional Stable Distributions*](../literature/Zolotarev.pdf),
  Translations of Mathematical Monographs 65, American Mathematical
  Society, 1986.
- Jean Bertoin, [*Levy Processes*](../literature/Bertoin.pdf), Cambridge
  Tracts in Mathematics 121, Cambridge University Press, 1996.

## 0. Reading contract

- **[SOURCE-Z]** is stated in Zolotarev.
- **[SOURCE-B]** is stated in Bertoin.
- **[PROJECT DERIVATION]** is proved here from the cited source formulas; it
  is not attributed to either book and is not claimed to be new to the
  literature.
- **[PROJECT CONNECTION]** explains relevance to the current proof routes.
- **[CAUTION]** marks a convention or logical gap.

Throughout,

\[
\mathbb E[e^{-\lambda S_\rho}]=e^{-\lambda^\rho},
\qquad 0<\rho<1,
\tag{0.1}
\]

and the negatively tilted stable variable \(T_{\rho,B}\) is defined by

\[
\mathbb E[F(T_{\rho,B})]
=
\frac{\mathbb E[S_\rho^{-\rho B}F(S_\rho)]}
     {\mathbb E[S_\rho^{-\rho B}]},
\qquad B>0.
\tag{0.2}
\]

## 1. Executive assessment

Zolotarev is a high-value source for Routes 1 and 6.  Its Mellin and stable
multiplication formulas lead to two exact project lemmas:

\[
T_{\alpha\alpha',B}
\overset d=
T_{\alpha,\alpha'B}\,
T_{\alpha',B}^{1/\alpha},
\tag{1.1}
\]

and, for integer \(n\ge2\),

\[
T_{1/n,B}^{-1}
\overset d=
n^n\prod_{k=1}^{n-1}G_{(B+k)/n}.
\tag{1.2}
\]

Formula (1.2) exactly reconciles the tilted-stable factorization in Route 1
with Gauss multiplication in the rational/integer-power route.

Bertoin has lower direct value but supplies rigorous Poisson-random-measure
infrastructure.  It yields a useful gamma mixture of tempered-stable Poisson
processes for the negative tilt.  Neither book identifies the resulting
normalized jumps as an ordinary Dirichlet mean, so the central Route 1 gap
remains.

## 2. Mellin transform and negative moments

### 2.1 Zolotarev's Mellin formula

**[SOURCE-Z: Theorem 2.6.3, formula (2.6.20), printed pp. 117--118 / PDF
pp. 125--126]** In Zolotarev's parameterization, the Mellin transform of a
strictly stable law is

\[
m_C(s;\alpha,p)=
\frac{\sin(\pi p s)}{p\sin(\pi s)}
\frac{\Gamma(1-s/\alpha)}{\Gamma(1-s)},
\qquad -1<\Re s<\alpha.
\tag{2.1}
\]

For the positive extreme law \(p=1\), the sine quotient cancels and

\[
\mathbb E[S_\alpha^s]
=\frac{\Gamma(1-s/\alpha)}{\Gamma(1-s)}
\tag{2.2}
\]

on the strip stated in the theorem.

**[CAUTION]** Formula (2.1) depends on Zolotarev's scale and skewness
conventions.  Match (0.1) before importing it.  Also, the theorem's initial
strip only gives negative moments with \(0<u<1\) after setting \(s=-u\);
the full range \(u>0\) requires a separate argument.

### 2.2 Full negative-moment range from the Laplace transform

**[PROJECT DERIVATION: STABLE-L1]** For every \(u>0\),

\[
\boxed{
\mathbb E[S_\rho^{-u}]
=\frac{\Gamma(1+u/\rho)}{\Gamma(1+u)}.
}
\tag{2.3}
\]

**Proof.** The gamma integral and Tonelli's theorem give

\[
\begin{aligned}
\mathbb E[S_\rho^{-u}]
&=\frac1{\Gamma(u)}
\int_0^\infty t^{u-1}\mathbb E[e^{-tS_\rho}]\,dt\\
&=\frac1{\Gamma(u)}
\int_0^\infty t^{u-1}e^{-t^\rho}\,dt\\
&=\frac{\Gamma(u/\rho)}{\rho\Gamma(u)}
=\frac{\Gamma(1+u/\rho)}{\Gamma(1+u)}.
\end{aligned}
\tag{2.4}
\]

The Laplace normalization in (0.1) is recorded in Bertoin, printed p. 73 /
PDF p. 80; Sato's formula (25.5) independently states the full range.

## 3. Stable multiplication and the tilted semigroup

### 3.1 Stable composition

**[SOURCE-Z: Theorem 3.3.1 and Corollary 1, formulas (3.3.1) and (3.3.4),
printed pp. 194--195 / PDF pp. 202--203]** For
\(0<\alpha,\alpha'\le1\), with independent factors,

\[
S_{\alpha\alpha'}
\overset d=S_\alpha S_{\alpha'}^{1/\alpha}.
\tag{3.1}
\]

Theorem 3.4.1, printed pp. 202--203 / PDF pp. 210--211, iterates this for a
finite product of indices; Theorem 3.4.2, printed p. 203 / PDF p. 211, gives
an infinite-product version under its explicit convergence assumptions.

### 3.2 Negative tilts inherit the stable composition law

**[PROJECT DERIVATION: STABLE-L2]** Let all right-hand factors below be
independent.  Then

\[
\boxed{
T_{\alpha\alpha',B}
\overset d=
T_{\alpha,\alpha'B}\,
T_{\alpha',B}^{1/\alpha}.
}
\tag{3.2}
\]

**Proof.** Under the coupling (3.1), the tilting weight factorizes:

\[
\left(S_\alpha S_{\alpha'}^{1/\alpha}\right)^{-\alpha\alpha'B}
=S_\alpha^{-\alpha\alpha'B}S_{\alpha'}^{-\alpha'B}.
\tag{3.3}
\]

The first factor is exactly the weight defining
\(T_{\alpha,\alpha'B}\), and the second defines
\(T_{\alpha',B}\).  Independence is preserved because both the original law
and the Radon--Nikodym factor are products.  The normalizing constants
factorize, either directly from (3.1) or from (2.3).  Applying the product
map gives (3.2).

**[PROJECT CONNECTION]** Formula (3.2) matches the multiplicative power
semigroup.  It can reduce composite rational indices to simpler tilted
factors, but it does not show that the residual in Route 1 is a Dirichlet
mean or even GGC.

## 4. Reciprocal-index gamma products

### 4.1 Zolotarev's un-tilted factorization

**[SOURCE-Z: Theorem 3.4.3, formulas (3.4.22)--(3.4.23), printed
pp. 206--207 / PDF pp. 214--215]** For an integer \(n\ge2\),

\[
S_{1/n}^{-1}
\overset d=
n^n\prod_{k=1}^{n-1}G_{k/n},
\tag{4.1}
\]

where all gamma variables have unit rate and are independent.

### 4.2 Power bias shifts every gamma shape

**[PROJECT DERIVATION: STABLE-L3]** For \(B>0\),

\[
\boxed{
T_{1/n,B}^{-1}
\overset d=
n^n\prod_{k=1}^{n-1}G_{(B+k)/n}.
}
\tag{4.2}
\]

**Proof.** The tilt in (0.2) is multiplication by

\[
S_{1/n}^{-B/n}
=\left(S_{1/n}^{-1}\right)^{B/n}.
\tag{4.3}
\]

Insert (4.1).  Apart from a constant canceled by normalization, the joint
gamma density is multiplied by

\[
\prod_{k=1}^{n-1}x_k^{B/n}.
\]

Gamma power bias changes \(G_{k/n}\) into
\(G_{(B+k)/n}\), independently, proving (4.2).

As a consequence, after adjoining an independent \(G_{B/n}\),

\[
\frac{G_{B/n}}{T_{1/n,B}}
\overset d=
n^n\prod_{k=0}^{n-1}G_{(B+k)/n}
\overset d=G_B^n.
\tag{4.4}
\]

The final equality is precisely Gauss's multiplication formula applied to
Mellin transforms.

**[PROJECT CONNECTION]** Equation (4.4) is an exact normalization check for
the Route 1 factorization

\[
G_B^{1/\rho}\overset d=G_{\rho B}/T_{\rho,B}
\]

at every integer \(1/\rho=n\).  It also shows that the Route 1 stable factor
and the deferred Route 6 gamma-product factorization are the same structure,
not competing explanations.

## 5. Poisson construction of the negative tilt

### 5.1 Source infrastructure

**[SOURCE-B: Section O.5, printed pp. 6--8 / PDF pp. 13--15]** Bertoin gives
the Poisson random measure construction, deletion/independence for points in
a measurable set, the predictable compensation formula, and the exponential
formula for Poisson sums.

**[SOURCE-B: Section III.1, printed pp. 72--73 / PDF pp. 79--80]** A
subordinator has Laplace exponent

\[
\Phi(\lambda)=d\lambda+
\int_0^\infty(1-e^{-\lambda x})\Pi(dx).
\tag{5.1}
\]

For the standard positive stable subordinator,

\[
\Phi(\lambda)=\lambda^\rho
=\frac{\rho}{\Gamma(1-\rho)}
\int_0^\infty(1-e^{-\lambda x})x^{-1-\rho}\,dx.
\tag{5.2}
\]

Thus \(S_\rho\) is the sum of the jumps of a Poisson random measure with
intensity

\[
\nu_\rho(dx)=
\frac{\rho}{\Gamma(1-\rho)}x^{-1-\rho}\,dx.
\tag{5.3}
\]

For comparison, the gamma process has

\[
\Phi_{a,b}(\lambda)=a\log(1+\lambda/b),
\qquad
\Pi(dx)=a x^{-1}e^{-bx}\,dx.
\tag{5.4}
\]

### 5.2 A gamma mixture of tempered-stable point processes

**[PROJECT DERIVATION: STABLE-L4]** Let \(N\) be the stable Poisson random
measure in (5.3) and \(S_\rho=\int xN(dx)\).  Under the probability measure
obtained by weighting with \(S_\rho^{-u}\), \(u>0\), the entire point process
has the mixture representation

\[
\mathbb E_u[F(N)]
=\int_0^\infty
\mathbb E_{\operatorname{PPP}(e^{-tx}\nu_\rho(dx))}[F(N)]
\frac{\rho t^{u-1}e^{-t^\rho}}{\Gamma(u/\rho)}\,dt.
\tag{5.5}
\]

**Proof.** Use

\[
S_\rho^{-u}
=\frac1{\Gamma(u)}\int_0^\infty t^{u-1}e^{-tS_\rho}\,dt.
\]

The Poisson exponential formula says that exponential tilting by
\(e^{-tS_\rho}\) changes the intensity to
\(e^{-tx}\nu_\rho(dx)\), with normalizing factor \(e^{-t^\rho}\).  Divide
by (2.3); since

\[
\Gamma(u)\mathbb E[S_\rho^{-u}]
=\frac{\Gamma(u/\rho)}\rho,
\]

the mixing density in (5.5) follows.

For the Route 1 tilt \(u=\rho B\), the change of variable \(z=t^\rho\)
turns the mixing density into

\[
z^{B-1}e^{-z}/\Gamma(B),
\]

so the construction is:

1. sample \(Z\sim\Gamma(B,1)\);
2. set \(t=Z^{1/\rho}\);
3. sample a tempered-stable Poisson random measure with intensity
   \(e^{-tx}\nu_\rho(dx)\);
4. take the sum of its jumps.

That jump sum has the law of \(T_{\rho,B}\).

**[PROJECT CONNECTION]** This gives a concrete starting point for a
Poisson/Palm analysis of the tilted residual and explains why stable
Poisson--Kingman structures appear.  It does not identify an ordinary
Dirichlet mean.  Any claim that the normalized jumps have a named
\(PD(\rho,\theta)\) law needs an additional Poisson--Kingman/Pitman--Yor
source; Bertoin alone does not state that result.

## 6. Multiplicative infinite divisibility of the tilt

**[SOURCE-Z: Section 3.5 and Theorem 3.5.1, printed pp. 208--213 / PDF
pp. 216--221]** Zolotarev studies multiplicative infinite divisibility,
which for a positive variable is additive infinite divisibility of its
logarithm.

Starting from (2.2), the cumulant generating function of \(\log S_\alpha\)
has the Levy representation

\[
\begin{aligned}
K_\alpha(s)
&:=\log\mathbb E[S_\alpha^s]\\
&=\gamma(\alpha^{-1}-1)s
+\int_0^\infty
(e^{sx}-1-sx)
h_\alpha(x)\,dx,
\qquad \Re s<\alpha,
\end{aligned}
\tag{6.1}
\]

where

\[
h_\alpha(x)=
\frac1{x(e^{\alpha x}-1)}-
\frac1{x(e^x-1)}\ge0.
\tag{6.2}
\]

**[PROJECT DERIVATION: STABLE-L5]** The logarithm of
\(T_{\alpha,B}\) is infinitely divisible.  Indeed, its law is the Esscher
tilt of \(\log S_\alpha\) with parameter \(-\alpha B\); its Levy density is

\[
e^{-\alpha Bx}h_\alpha(x)\,dx,
\tag{6.3}
\]

with the corresponding adjusted drift.

**[PROJECT CONNECTION]** The positive log-Levy spectrum in (6.3) is useful
for Mellin--Barnes or Barnes-beta factorization and for differentiating the
tilt parameter.  It does not imply additive infinite divisibility of
\(T_{\alpha,B}\), much less GGC membership.

**[CAUTION]** "M-infinitely divisible" means that \(\log X\) is additively
ID.  It is not an additive-ID or GGC certificate for \(X\).  The linear term
in (6.1) is fixed safely from
\(K_\alpha'(0)=\gamma(\alpha^{-1}-1)\), avoiding a sign ambiguity in the
book's notation.

## 7. What the sources do not solve

1. Neither source proves that
   \(M^q/T_{\rho,B}\) is an ordinary Dirichlet mean.
2. Stable multiplication and multiplicative ID do not imply additive GGC.
3. Bertoin's Section O.5 gives compensation and an exponential formula, but
   not the full Mecke--Slivnyak add-one identity needed for a Palm proof.
4. The indexes of Bertoin contain no dedicated Poisson--Kingman,
   size-biased deletion, or Dirichlet-mean theorem.
5. Zolotarev's reciprocal-index formula settles integer \(q\), not general
   rational or real \(q\).  A positive Barnes-beta certificate is still
   missing.

## 8. Recommended use

1. Use STABLE-L1 for every negative-tilt normalization.
2. Use STABLE-L2 to make stable-index composition compatible with the power
   semigroup.
3. Use STABLE-L3/Equation (4.4) as the mandatory integer-power check for
   every Route 1 or Route 6 formula.
4. Use STABLE-L4 as the concrete probabilistic object for any future Palm
   attempt, while keeping the ordinary-Dirichlet gap explicit.
5. Use STABLE-L5 only on the logarithmic/multiplicative side.
