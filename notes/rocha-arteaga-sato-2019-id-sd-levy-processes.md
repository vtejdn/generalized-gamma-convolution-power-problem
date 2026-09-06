---
title: "Rocha-Arteaga--Sato (2019): ID/SD/L_m, OU representations, selfsimilarity, and subordination"
source: "../literature/Rocha-Arteaga-Sato-2019-ID-SD-Levy-processes.pdf"
source_type: "primary source; revised research monograph"
status: "audited"
last_verified: "2026-09-04"
scope: "general ID/SD and Levy-process infrastructure, source audit, positive-law criterion, and limits of applicability to GGC powers"
migrated: "2026-09-06; original source-audit date unchanged"
topics:
  - infinitely divisible distributions
  - self-decomposable distributions
  - Urbanik classes
  - Levy-Khintchine representation
  - Ornstein-Uhlenbeck processes
  - background driving Levy processes
  - selfsimilar additive processes
  - multivariate subordination
  - stable distributions
  - GGC boundary and stochastic-integral context
---

# Rocha-Arteaga--Sato (2019): LLM-oriented mathematical audit

Primary source: [Rocha-Arteaga--Sato (2019)](../literature/Rocha-Arteaga-Sato-2019-ID-SD-Levy-processes.pdf).

Bibliographic identity:

> Alfonso Rocha-Arteaga and Ken-iti Sato, *Topics in Infinitely Divisible Distributions and Levy Processes*, Revised Edition, SpringerBriefs in Probability and Mathematical Statistics, Springer, Cham, 2019, viii+135 pp. DOI: 10.1007/978-3-030-22700-5. MR3971266.

This source is a revised monograph, not a journal article. The first version grew out of Sato's 2001 visit to CIMAT, appeared through CIMAT in 2001 and in the Aportaciones Matematicas series in 2003, and was substantially reorganized and enlarged for the 2019 edition.

The general source audit and positive-law criterion are retained from the
SD dossier. The source-audit date above is not a fresh verification date.
SD-specific applications and manuscripts remain in the
[fixed-commit archive](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/527a78a3616fbd7c40dab83f549a94e95dd81a54/background/alpha-cauchy-sd/notes/09-rocha-arteaga-sato-2019-id-sd-levy-processes.md).
Sections and theorem-card IDs are retained where possible for traceability.
This is supporting literature, not an additional axiom or dependency of the
[log-rate proof](log-rate-power-proof-primary-interfaces.md).

## 0. Reading contract

Every substantive statement in this note carries, or inherits from its subsection, one of the following labels.

- **[BOOK]**: stated in the 2019 monograph; the theorem number is given whenever useful.
- **[BOOK-PROVED]**: a result for which the monograph supplies a proof or a proof reducing it to earlier results in the book.
- **[EXTERNAL]**: quoted by the monograph from another source rather than proved there.
- **[AUDIT]**: a correction, missing qualification, or proof-completeness observation found while checking the PDF.
- **[DERIVED]**: a retained project deduction from cited book results, not
  a theorem stated by the book; migration does not establish novelty.
- **[NOT-IMPLIED]**: an inference that the cited result does not justify.

Notation follows the book; the stable index is often written \(\beta\)
to distinguish it from other distributional parameters.

## 1. What the book actually supplies

The five chapters form one coherent chain.

| Chapter | Mathematical object | Main output | Project relevance |
|---|---|---|---|
| 1 | \(ID\), \(L_0=SD\), \(L_m\), \(L_\infty\), stable laws | residual-factor, limit, and Levy-density characterizations | separates ID, SD and the stronger GGC criterion |
| 2 | stochastic integrals and OU-type processes | bijection between \(ID_{\log}\) and \(SD\); BDLP representation | turns SD into a negative-definiteness test |
| 3 | selfsimilar additive and stationary OU processes | process-level equivalents of SD | structural interpretation; uniqueness and reconstruction |
| 4 | cone-valued time change | multivariate subordination and triplet formulas | infrastructure needed by Chapter 5 |
| 5 | inheritance under subordination | \(L_m\) and strict stability pass from the subordinator | forward preservation and its precise hypothesis boundary |

The logical spine is

\[
\boxed{\text{residual factors}}
\Longleftrightarrow
\boxed{\text{monotone radial Levy density}}
\Longleftrightarrow
\boxed{\text{OU integral / BDLP}}
\Longleftrightarrow
\boxed{\text{selfsimilar additive marginal}}.
\]

Subordination is a separate forward-preservation mechanism:

\[
\boxed{\text{strictly stable subordinand}}
+
\boxed{\text{subordinator in }L_m}
\Longrightarrow
\boxed{\text{subordinated process in }L_m}.
\]

## 2. Notation and collision guards

### 2.1 Probability classes

- \(\mathcal P(\mathbb R^d)\): probability laws on \(\mathbb R^d\).
- \(ID(\mathbb R^d)\): infinitely divisible laws.
- \(L_0(\mathbb R^d)=SD(\mathbb R^d)\): self-decomposable laws.
- \(L_m\), \(m\ge 1\): recursively nested Urbanik classes.
- \(L_\infty=\bigcap_{m\ge0}L_m\).
- \(S_\beta\) and \(S_\beta^0\): respectively stable and strictly stable laws of index \(\beta\in(0,2]\).
- \(ID_{\log}\): infinitely divisible laws whose Levy measure \(\nu\) satisfies
  \[
  \int_{|x|>2}\log|x|\,\nu(dx)<\infty.
  \]

### 2.2 The most important notation warning

**[BOOK]** For \(\mu\in ID\), \(\mu^{t*}\) is the convolution power defined by

\[
\widehat{\mu^{t*}}(z)=\exp\{t\log\widehat\mu(z)\},\qquad t\ge0.
\]

It is not the law of \(X^t\). Therefore Proposition 1.18(iv),

\[
\mu\in L_m\Longrightarrow \mu^{t*}\in L_m,
\]

contains no deterministic power-closure theorem.

**[NOT-IMPLIED]** Neither

\[
X\in SD\Longrightarrow X^p\in SD
\]

nor its converse follows from this book. In particular, it supplies no automatic passage from a GGC law to an SD fractional root.

### 2.3 Process terminology

When the book says that a Levy process is in \(L_m\), it means that \(\mathcal L(X_t)\in L_m\) for one, equivalently every, \(t>0\). For a Levy process,

\[
\mathcal L(X_t)=\mathcal L(X_1)^{t*},
\]

and Proposition 1.18(iv) makes the equivalence immediate.

## 3. Chapter 1: \(ID\), \(SD\), \(L_m\), and Levy measures

### 3.1 Infinite divisibility and distinguished logarithms

**[BOOK] Definition 1.1, Lemma 1.2, Definition 1.3, and Propositions 1.4-1.5.** A law \(\mu\) is infinitely divisible if it has an \(n\)-fold convolution root for every \(n\ge1\). An ID characteristic function has no zeros; Lemma 1.2 and Definition 1.3 therefore give its globally defined distinguished logarithm. The class \(ID\) is closed under:

1. convolution;
2. weak convergence;
3. scalar affine maps \(X\mapsto aX+c\);
4. convolution powers \(\mu\mapsto\mu^{t*}\), \(t\ge0\).

The Levy-Khintchine representation, quoted as Theorem 1.28, is

\[
\log\widehat\mu(z)
=-\frac12\langle z,Az\rangle+i\langle\gamma,z\rangle
+\int_{\mathbb R^d}
\left(e^{i\langle z,x\rangle}-1-i\langle z,x\rangle\mathbf 1_{\{|x|\le1\}}\right)\nu(dx),
\]

where \(A\) is symmetric and nonnegative definite, \(\gamma\in\mathbb R^d\), and

\[
\nu(\{0\})=0,
\qquad
\int_{\mathbb R^d}(|x|^2\wedge1)\,\nu(dx)<\infty.
\]

The triplet \((A,\nu,\gamma)\) is unique, and every triplet satisfying these conditions determines an ID law.

**[EXTERNAL]** Theorem 1.28 is quoted from Sato [93], Theorem 8.1, not reproved here.

### 3.2 Self-decomposability as a residual-factor condition

**[BOOK] Definitions 1.11, 1.14, 1.16 and Propositions 1.13, 1.15.** A law \(\mu\) is self-decomposable iff for every \(b>1\) there exists a law \(\rho_b\) such that

\[
\widehat\mu(z)=\widehat\mu(b^{-1}z)\widehat\rho_b(z).
\tag{AS19-SD}
\]

The residual \(\rho_b\) is unique and belongs to \(ID\). Recursively,

\[
\begin{aligned}
L_0&=SD,\\
\mu\in L_m
&\iff \mu\in L_0\text{ and }\rho_b\in L_{m-1}\text{ for every }b>1,\\
L_\infty&=\bigcap_{m=0}^\infty L_m.
\end{aligned}
\]

Thus

\[
ID\supset L_0\supset L_1\supset\cdots\supset L_\infty\supset S.
\]

### 3.3 Closure properties and what they do not cover

**[BOOK-PROVED] Proposition 1.18.** Every \(L_m\), including \(L_\infty\), is closed under convolution, weak convergence, scalar affine maps \(X\mapsto aX+c\), and convolution powers.

The proof is a reusable induction. If \(\rho_{j,b}\) is the residual of \(\mu_j\), then:

- the residual of \(\mu_1*\mu_2\) is \(\rho_{1,b}*\rho_{2,b}\);
- residuals pass to weak limits through
  \[
  \widehat\rho_{n,b}(z)=
  \frac{\widehat\mu_n(z)}{\widehat\mu_n(b^{-1}z)};
  \]
- affine images add only an affine image of the residual and a point mass;
- the residual of \(\mu^{t*}\) is \(\rho_b^{t*}\).

**[NOT-IMPLIED]** This list contains no closure under absolute value, reciprocal, product of dependent variables, product of independent variables, or ordinary powers.

### 3.4 Limit characterization

**[BOOK] Definition 1.8 and Theorem 1.10.** A weak limit of deterministically centered row sums \(S_n-c_n\) of an infinitesimal triangular array is infinitely divisible. This is the broad triangular-array result; it is not yet the more restrictive \(K(Q)\) construction below.

**[BOOK-PROVED] Theorem 1.26.** The class \(K(Q)\) consists of limits

\[
\mathcal L\left(
b_n\sum_{k=1}^n Z_k-c_n
\right)\Longrightarrow\mu,
\]

where \(b_n>0\), \(c_n\in\mathbb R^d\), \(Z_1,Z_2,\ldots\) is one fixed independent sequence with \(\mathcal L(Z_k)\in Q\), and the triangular family \(\{b_nZ_k:1\le k\le n\}\) is a null array. With this notation,

\[
L_0=K(\mathcal P)=K(ID),
\qquad
L_m=K(L_{m-1}),
\qquad
L_\infty=K(L_\infty).
\]

Moreover, \(L_\infty\) is the greatest class \(Q\) satisfying \(Q=K(Q)\).

The main proof mechanism is telescoping normalized sums. One splits a long sum into an early and a late block; the early block converges to a scaled copy of the limit, while the late block converges to the residual factor. The nonvanishing of ID characteristic functions permits division.

**[EXTERNAL] Theorem 1.27.** A law is stable iff it is in \(K(Q)\) for a one-element class \(Q\); in that case the summands are iid and the resulting class consists of laws type-equivalent to the stable limit. The nontrivial direction is referred to Sato [93], Theorem 15.7.

### 3.5 Exact Levy-density criterion for SD

**[EXTERNAL] Theorem 1.34, quoted from Sato [93], Theorem 15.10.** A law \(\mu\in ID(\mathbb R^d)\) is self-decomposable iff its Levy measure has a polar decomposition

\[
\nu(B)=
\int_{S^{d-1}}\lambda(d\xi)
\int_0^\infty \mathbf 1_B(r\xi)\,k_\xi(r)\,\frac{dr}{r},
\tag{AS19-Levy-SD}
\]

where \(k_\xi(r)\ge0\) and is decreasing in \(r\) for \(\lambda\)-almost every \(\xi\). The Gaussian covariance and location parameter are unrestricted.

Here \(\lambda\) is a finite measure on \(S^{d-1}\), and \(k_\xi(r)\) is measurable in the direction \(\xi\). When \(\nu\ne0\), Remark 1.35 normalizes \(\lambda(S^{d-1})=1\), chooses \(k_\xi\) right-continuous, and imposes

\[
\int_0^\infty(r^2\wedge1)k_\xi(r)\,\frac{dr}{r}=c
\]

with the same \(c\) for almost every direction. Under this normalization, the spherical measure \(\lambda\) is unique, while \(k_\xi\) is unique for \(\lambda\)-almost every \(\xi\).

In one dimension this becomes

\[
\nu(dx)=\frac{k_+(x)}{x}\mathbf1_{(0,\infty)}(x)\,dx
+\frac{k_-(-x)}{|x|}\mathbf1_{(-\infty,0)}(x)\,dx,
\]

with \(k_+\) and \(k_-\) decreasing. For a symmetric law,

\[
\nu(dx)=\frac{k(|x|)}{|x|}\,dx,
\qquad
\mu\in SD\iff k\ge0\text{ and }k\text{ is decreasing}.
\tag{AS19-1D-sym}
\]

This criterion concerns SD membership, not complete monotonicity of the
radial density needed for positive GGC membership.

### 3.6 Higher Urbanik classes through finite differences

Put

\[
h_\xi(u)=k_\xi(e^u),\qquad u\in\mathbb R.
\]

For \(\varepsilon>0\), Definition 1.37 uses

\[
\Delta_\varepsilon^n f(u)
=\sum_{j=0}^n(-1)^{n-j}{n\choose j}f(u+j\varepsilon),
\]

and calls \(f\) monotone of order \(n\) when

\[
(-1)^j\Delta_\varepsilon^j f(u)\ge0,
\qquad j=0,\ldots,n,
\]

for all admissible \(u,\varepsilon\).

**[BOOK-PROVED] Theorem 1.39.** For \(m\in\{0,1,2,\ldots\}\),

\[
\mu\in L_m
\iff
\mu\in L_0
\text{ and }h_\xi\text{ is monotone of order }m+1
\quad(\lambda\text{-a.e. }\xi).
\]

Moreover,

\[
\mu\in L_\infty
\iff
\mu\in L_0
\text{ and }h_\xi\text{ is completely monotone on }\mathbb R
\quad(\lambda\text{-a.e. }\xi).
\]

The inductive engine is the residual identity

\[
h_{b,\xi}(u)
\propto h_\xi(u)-h_\xi(u+\log b),
\]

which converts membership one level down into one extra alternating finite-difference inequality.

### 3.7 \(L_\infty\) as a mixture of stable Levy measures

**[BOOK-PROVED] Lemma 1.40 and Theorem 1.41.** Complete monotonicity of \(h_\xi\) gives a bilateral-in-\(u\) Laplace representation

\[
h_\xi(u)=\int_{(0,2)}e^{-\beta u}\,\Pi_\xi(d\beta).
\]

Consequently the Levy measure of an \(L_\infty\) law is a mixture of stable radial Levy measures:

\[
\nu(B)=
\int_{(0,2)}\Pi(d\beta)
\int_{S^{d-1}}\lambda_\beta(d\xi)
\int_0^\infty\mathbf1_B(r\xi)\frac{dr}{r^{1+\beta}},
\]

with

\[
\int_{(0,2)}
\left(\frac1\beta+\frac1{2-\beta}\right)\Pi(d\beta)<\infty.
\]

Here \(\lambda_\beta\) is a probability kernel on \(S^{d-1}\), measurable in \(\beta\). **[EXTERNAL] Theorem 1.42** identifies the single-index case: for \(0<\beta<2\), a \(\beta\)-stable Levy measure has radial kernel \(r^{-1-\beta}dr\), while \(\beta=2\) is Gaussian. Thus a non-Gaussian stable component corresponds to a mixing measure concentrated at one \(\beta\).

The Gaussian matrix \(A\) and shift \(\gamma\) in Theorem 1.41 are unrestricted. The objects \(A,\gamma,\Pi\) are unique; the angular probability kernel \(\lambda_\beta\) is unique only for \(\Pi\)-almost every \(\beta\).

**[BOOK-PROVED] Proposition 1.25 and Theorem 1.43.** Stable laws lie in \(L_\infty\), and \(L_\infty\) is the smallest class containing all stable laws and closed under convolution and weak convergence.

**[NOT-IMPLIED]** Complete monotonicity of \(u\mapsto k(e^u)\), used for \(L_\infty\), is not the same object as complete monotonicity of \(x\mapsto k(x)\) in Thorin/GGC theory. The book does not identify these two notions.

**[BOOK] Example 1.45** gives gamma laws in \(L_0\setminus L_1\).

**[DERIVED using the external GGC/HCM classification of gamma laws]** Since gamma laws are standard GGC/HCM examples, Example 1.45 is a concrete warning that GGC does not imply \(L_\infty\), or even \(L_1\).

### 3.8 Chapter 1 proof toolkit

The reusable proof patterns are:

1. divide nonvanishing characteristic functions to isolate a residual law;
2. compare Levy-Khintchine triplets under scaling;
3. transfer recursive \(L_m\) membership to finite differences of \(h\);
4. invoke Bernstein's theorem to turn complete monotonicity into a mixing measure;
5. approximate a mixing measure by finite stable mixtures and pass by weak closure.

## 4. Chapter 2: OU limits and the background driving Levy process

### 4.1 Stochastic integrals against a Levy process

**[BOOK-PROVED] Propositions 2.2 and 2.4.** For a bounded measurable real-valued deterministic integrand \(f\), the integral against a Levy process \(Z^{(\rho)}\) is first defined for step functions and then by probability limits. Its characteristic exponent is

\[
\log\mathbb E\exp\left(i\left\langle z,
\int_a^b f(s)\,dZ_s^{(\rho)}\right\rangle\right)
=\int_a^b\psi_\rho(f(s)z)\,ds,
\]

where \(\psi_\rho=\log\widehat\rho\).

This identity is the computational core of the OU chapter.

### 4.2 OU solution and stationary limit

For \(c>0\), with \(X_0\) independent of the driving Levy process, the OU-type equation has the variation-of-constants form

\[
X_t=e^{-ct}X_0+\int_0^t e^{-c(t-s)}\,dZ_s.
\]

When the log-moment condition below holds, a time reversal in distribution identifies its limiting law with the well-defined improper integral

\[
\int_0^\infty e^{-cs}\,dZ_s.
\]

**[BOOK-PROVED] Theorem 2.17.** Let \(\rho=\mathcal L(Z_1)\). The log-moment condition

\[
\int_{|x|>2}\log|x|\,\nu_\rho(dx)<\infty
\tag{AS19-log}
\]

is necessary and sufficient for the OU limit to exist. Under it,

\[
\widehat\mu(z)=
\exp\left\{\int_0^\infty\psi_\rho(e^{-cs}z)\,ds\right\},
\qquad \mu\in L_0.
\tag{AS19-Phi}
\]

Conversely, for each fixed \(c>0\), every \(\mu\in L_0\) has a unique \(\rho\in ID_{\log}\) producing it. Thus

\[
\Phi_c:ID_{\log}\longrightarrow L_0,
\qquad
\Phi_c(\rho)=\mathcal L\left(\int_0^\infty e^{-cs}\,dZ_s^{(\rho)}\right),
\]

is a bijection.

The uniqueness is parameter-dependent. If

\[
\Phi_c(\rho)=\Phi_{c'}(\rho'),
\]

then

\[
\rho'=\rho^{(c'/c)*}.
\]

The triplets are related by

\[
A=(2c)^{-1}A_\rho,
\]

\[
\nu(B)=\int_{\mathbb R^d}\nu_\rho(dx)
\int_0^\infty\mathbf1_B(e^{-cs}x)\,ds,
\]

and the corresponding drift formula in Theorem 2.17(2.31).

If the log moment diverges, no weak limit exists; Theorem 2.17(iii) gives the stronger escape-of-mass estimate (2.34).

### 4.3 Recovering the BDLP from the radial \(k\)-function

**[BOOK] Theorem 2.17(ii).** If \(\mu\in SD\) has the polar Levy form from Theorem 1.34, then the Levy measure of its unique background driving Levy process (BDLP) is

\[
\nu_\rho(B)
=-c\int_{S^{d-1}}\lambda(d\xi)
\int_0^\infty\mathbf1_B(r\xi)\,dk_\xi(r).
\tag{AS19-BDLP}
\]

The derivative here is a Stieltjes measure; differentiability of \(k_\xi\) is not assumed. The proof uses integration by parts for a decreasing right-continuous \(k_\xi\).

**[BOOK] Remark 2.19.** Convergence of OU marginals is weak convergence only. For a nontrivial BDLP, \(X_t\) does not converge in probability as \(t\to\infty\).

### 4.4 One level of \(L_m\) is gained by \(\Phi_c\)

**[BOOK-PROVED] Theorem 2.29.** With \(L_{-1}=ID\),

\[
\Phi_c:L_{m-1}\cap ID_{\log}\longrightarrow L_m
\]

is one-to-one and onto for \(m=0,1,\ldots,\infty\). It also preserves stable and strictly stable indices.

The proof again isolates the residual:

\[
\widehat\eta_b(z)=
\exp\left\{
\int_0^{(\log b)/c}\psi_\rho(e^{-cs}z)\,ds
\right\}.
\]

Letting \(b\downarrow1\) recovers \(\rho\) from suitably normalized convolution powers of \(\eta_b\), while step-function approximation shows the forward inclusion.

### 4.5 Iteration and logarithmic moments

**[BOOK-PROVED] Theorem 2.32.** For an integer \(m\ge1\),

\[
D(\Phi_c^m)=
\left\{\rho\in ID:
\int_{|x|>2}(\log|x|)^m\nu_\rho(dx)<\infty
\right\},
\]

\[
R(\Phi_c^m)=L_{m-1},
\]

and

\[
\log\widehat{\Phi_c^m(\rho)}(z)
=\int_0^\infty
\frac{s^{m-1}}{(m-1)!}\psi_\rho(e^{-cs}z)\,ds.
\]

**[BOOK] Theorem 2.34.** The same iterate can be represented by one improper stochastic integral with kernel

\[
f_m(s)=\exp\{-(c_m s)^{1/m}\}
\]

with the exact relation

\[
c_m=m!c^m.
\]

The hard domain equality is cited from earlier work by Sato.

### 4.6 Chapter 2 proof toolkit

1. write characteristic exponents of stochastic integrals as ordinary integrals;
2. prove convergence by convergence of Levy triplets;
3. identify the log moment by integrating the large-jump mass over exponential contraction;
4. recover the BDLP by Stieltjes differentiation of \(k\);
5. use Fubini and induction for iterated OU mappings.

### 4.7 Thorin-class material in the chapter notes

**[BOOK / EXTERNAL BACKGROUND]** The notes at the end of Chapter 2 recall the multivariate Thorin class \(T(\mathbb R^d)\), whose positive one-dimensional specialization is the GGC class, and record

\[
T(\mathbb R^d)\subset L_0(\mathbb R^d).
\]

They also summarize several stochastic-integral descriptions of \(T\). These statements are a literature map, not a development of HCM or Thorin theory inside this book. For deterministic power questions, use the dedicated GGC/HCM sources in this repository.

## 5. Chapter 3: selfsimilar additive processes and stationary OU processes

### 5.1 SD as a one-time marginal of a selfsimilar additive process

**[BOOK-PROVED] Theorem 3.5.** Every marginal of a selfsimilar additive process is self-decomposable. Conversely, for every \(\mu\in SD\) and every selfsimilarity exponent \(c>0\), there exists a unique-in-law \(c\)-selfsimilar additive process \(X\) with

\[
\mathcal L(X_1)=\mu.
\]

The forward proof is the factorization

\[
\widehat\mu_t(z)
=\widehat\mu_t((s/t)^c z)\widehat\mu_{s,t}(z),
\qquad 0<s<t,
\]

coming from independent increments and selfsimilarity. Varying \(s/t\) produces every contraction factor.

**[BOOK] Theorem 3.8.** For a selfsimilar additive process, membership of one-time marginals in \(L_m\) is equivalent to several increment and finite-dimensional conditions. For finite \(m\), a characteristic feature is a one-level drop: certain increment or finite-dimensional laws lie in \(L_{m-1}\). At \(m=\infty\), the convention is \(L_{\infty-1}=L_\infty\), so there is no strict level drop.

### 5.2 Lamperti transform

**[BOOK-PROVED] Theorem 3.13.** For \(c>0\),

\[
Y_s=e^{-cs}X_{e^s},\qquad s\in\mathbb R,
\]

maps a \(c\)-selfsimilar process to a stationary process. The inverse is

\[
X_0=0,
\qquad
X_t=t^cY_{\log t},\quad t>0.
\]

The transform defines a bijection at the level of complete systems of finite-dimensional distributions; the finite-dimensional laws themselves are changed by the displayed time and space rescaling.

### 5.3 The exact OU correspondence

**[BOOK-PROVED] Theorem 3.23 and Corollary 3.25.** Under the stated nontriviality and nonconstancy assumptions, the Lamperti transform identifies

\[
\boxed{c\text{-selfsimilar additive processes}}
\quad\Longleftrightarrow\quad
\boxed{\text{stationary OU-type processes with parameter }c}.
\]

Consequently,

\[
\mu\in SD
\iff
\mu\text{ is a stationary marginal of an OU-type process}.
\]

The hypotheses matter. Mere selfsimilarity does not imply independent increments; mere stationarity does not imply the OU Markov structure. Propositions 3.26-3.27 show that changing the Lamperti/OU parameter or the amplitude rule can destroy additivity.

### 5.4 Chapter 3 proof toolkit

1. convert time scaling into spatial contraction;
2. use independent increments to produce the SD residual;
3. use the exponential change of variables \(t=e^s\) to exchange scale invariance and stationarity;
4. characterize additivity through spatially homogeneous Markov transition kernels;
5. reconstruct the BDLP from the associated additive process, as explained in Remark 3.29.

## 6. Chapter 4: multivariate subordination

Chapter 4 is mainly infrastructure for the inheritance theorem in Chapter 5.

### 6.1 Cones and cone-valued subordinators

Let \(K\subset\mathbb R^N\) be a closed, convex, pointed cone. It induces the partial order \(s\preceq t\iff t-s\in K\).

**[BOOK] Theorem 4.11.** A Levy process is a \(K\)-valued subordinator iff its Gaussian part vanishes, its Levy measure is supported on \(K\), its small jumps have finite first moment, and its finite-variation drift \(\gamma^0\) belongs to \(K\):

\[
A=0,
\qquad
\nu(\mathbb R^N\setminus K)=0,
\qquad
\int_{|x|\le1}|x|\,\nu(dx)<\infty,
\qquad
\gamma^0\in K.
\]

This criterion is useful when turning a positive ID law into a subordinator.

### 6.2 Multivariate time change

**[BOOK] Theorem 4.23.** If \(X=\{X_s:s\in K\}\) is a \(K\)-parameter Levy process, \(Z=\{Z_t:t\ge0\}\) is a \(K\)-valued subordinator, and they are independent, then

\[
Y_t=X_{Z_t}
\]

is an ordinary Levy process.

**[AUDIT]** The pathwise notation \(X_{Z_t}\) tacitly uses a jointly measurable version of \((\omega,s)\mapsto X_s(\omega)\). This is standard under the regularity framework being used, but the version choice is not stated explicitly.

For \(K=\mathbb R_+^N\), write \(X_t^j=X_{te_j}\),

\[
\psi_X(z)=(\psi_X^1(z),\ldots,\psi_X^N(z)).
\]

**[BOOK] Theorem 4.41.** On the poly-half-plane \(\Re w_j\le0\), the book uses the sign convention

\[
\Psi_Z(w)
=\langle\gamma_Z^0,w\rangle
+\int_{\mathbb R_+^N}
\left(e^{\langle w,s\rangle}-1\right)\nu_Z(ds).
\]

This is an analytic extension of the characteristic exponent, not the alternative nonnegative Laplace-exponent convention. With this notation,

\[
\mathbb E e^{i\langle z,Y_t\rangle}
=\exp\{t\Psi_Z(\psi_X(z))\}.
\]

If \((A_X^j,\nu_X^j,\gamma_X^j)\) are the coordinate triplets, \(\nu_Z\) and \(\gamma_Z^0\) are the subordinator's Levy measure and drift, and \(\mu_s=\mathcal L(X_s)\), then

\[
A_Y=\sum_{j=1}^N\gamma_{Z,j}^0A_X^j,
\]

\[
\nu_Y(B)=
\int_{\mathbb R_+^N}\mu_s(B)\,\nu_Z(ds)
+\sum_{j=1}^N\gamma_{Z,j}^0\nu_X^j(B).
\tag{AS19-sub-Levy}
\]

Here \(B\in\mathcal B(\mathbb R^d\setminus\{0\})\). The drift, for the truncation \(x\mathbf1_{\{|x|\le1\}}\), is

\[
\gamma_Y=
\int_{\mathbb R_+^N}\nu_Z(ds)
\int_{|x|\le1}x\,\mu_s(dx)
+\sum_{j=1}^N\gamma_{Z,j}^0\gamma_X^j.
\]

The key structural point is that jumps of the clock mix the whole family of laws \(\mu_s\), while deterministic drift of the clock carries through the coordinate Levy measures.

### 6.3 What coordinate data determine

**[BOOK] Theorem 4.37 and Remark 4.39.** On \(\mathbb R_+^N\), one-dimensional coordinate processes determine \(\mathcal L(X_s)\) and joint laws along chains

\[
s_1\preceq s_2\preceq\cdots\preceq s_n.
\]

They do not determine arbitrary joint laws at incomparable parameter points. An LLM must not replace a multiparameter process by independent coordinate copies unless the theorem's comparable-chain argument applies.

### 6.4 General cones and convolution semigroups

For a general cone, strong bases may fail to exist, and the cleaner object is a cone-parameter convolution semigroup rather than a pathwise multiparameter process.

The book distinguishes a **strong basis**, whose cone coordinates are nonnegative, from a **weak basis**, which is only a vector-space basis of the span of \(K\). Coordinates in a weak basis may be negative. Consequently, formulas expressed in weak-basis coordinates must be interpreted as identities for the whole triplet; a term with a negative coordinate is not, by itself, a Levy measure. The book also distinguishes generative from nongenerative cone-parameter semigroups and gives a positive-semidefinite-cone Gaussian example showing that finite one-parameter generation can fail.

**[EXTERNAL] Theorem 4.53.** If \(\{\mu_u:u\in K_2\}\) is a \(K_2\)-parameter convolution semigroup and \(\{\rho_s:s\in K_1\}\) is a \(K_1\)-parameter semigroup supported on \(K_2\), then

\[
\sigma_s(f)=\int_{K_2}\mu_u(f)\,\rho_s(du)
\]

defines a \(K_1\)-parameter convolution semigroup. The book attributes the general theorem to Pedersen--Sato (2003).

**[EXTERNAL] Theorem 4.55** gives, in a weak basis of \(K_2\), the corresponding characteristic-exponent, Gaussian, Levy-measure, drift, and finite-variation formulas. Its coordinate terms must be interpreted only after summation, because weak-basis coordinates may be negative.

### 6.5 Chapter 4 proof toolkit

1. condition on the random clock;
2. use independent and stationary increments in the cone order;
3. decompose the clock into drift and jumps;
4. express the new Levy measure as a mixture of time-indexed transition laws;
5. verify cone support and finite-variation drift through Theorem 4.11.

## 7. Chapter 5: inheritance under subordination

### 7.1 Inheritance under strictly stable subordination

**[BOOK; proved through Theorem 5.9] Theorem 5.1.** Let \(X\) be a strictly \(\beta\)-stable Levy process, let \(Z\) be an independent subordinator, and let \(Y_t=X_{Z_t}\). Then:

\[
Z\in L_0\Longrightarrow Y\in L_0,
\]

more generally,

\[
Z\in L_m\Longrightarrow Y\in L_m,
\qquad m=0,1,\ldots,\infty,
\]

and if \(Z\) is strictly \(\delta\)-stable with \(0<\delta\le1\), then \(Y\) is strictly \(\beta\delta\)-stable.

Here process membership means membership of all positive-time marginals.

### 7.2 Why the proof works

The multivariate form, Theorem 5.9, makes the mechanism explicit. If \(Z_t\in L_0\), then for every \(b>1\),

\[
Z_t\overset d=b^{-1}Z_t+Z_t^{(b)},
\]

with independent summands and with \(Z^{(b)}\) again a cone-valued subordinator. Strict \(\beta\)-stability gives

\[
X_{b^{-1}s}\overset d=b^{-1/\beta}X_s.
\]

Conditioning on the two clock parts yields

\[
\widehat{\mathcal L(Y_t)}(z)
=\widehat{\mathcal L(Y_t)}(b^{-1/\beta}z)
\,\mathbb E\big[\widehat\mu_{Z_t^{(b)}}(z)\big].
\]

Since \(b^{1/\beta}\) ranges over all numbers greater than one, this is exactly the SD factorization. For \(L_m\), Lemma 5.8 says the clock residual lies in \(L_{m-1}\), and induction completes the proof.

For \(m=\infty\), this is not an induction step:

\[
Z\in L_\infty
\Longrightarrow
Y\in L_n\text{ for every finite }n
\Longrightarrow
Y\in\bigcap_{n<\infty}L_n=L_\infty.
\]

### 7.3 Hypotheses that cannot be dropped silently

- Independence of \(X\) and \(Z\) is used when the conditional characteristic function factors.
- Strict stability is used to remove every location correction from time scaling.
- The clock must be a subordinator, not an arbitrary real-valued Levy process.
- The conclusion is forward only.

**[BOOK] Theorem 5.10.** In dimension one, Brownian motion with nonzero drift is a special non-strict exception: subordination by an SD subordinator still yields an SD law.

**[BOOK] Remarks 5.11-5.12.** The corresponding statement fails in general for non-strictly stable processes and in dimensions \(d\ge2\), even for important subclasses of SD clocks. Ramachandran's example covers a non-strict \(\beta\)-stable process with \(1<\beta<2\) and a gamma clock. For \(0<\beta\le1\), the non-strict one-dimensional question was still open to the authors' knowledge in 2019.

**[NOT-IMPLIED]** Theorem 5.1 does not say

\[
X_Z\in SD\Longrightarrow Z\in SD.
\]

Only its forward implication and logically valid contrapositive may be used.

### 7.4 Operator extension

Chapter 5.2 replaces scalar contractions by \(b^{-Q}\). It defines \(Q\)-self-decomposability, \(L_m(Q)\), and operator stability. Theorem 5.25 assumes \(K=\mathbb R_+^N\), a block decomposition \(\mathbb R^d=\prod_j\mathbb R^{d_j}\), the support condition

\[
(X_{te_j})_k=0\quad(k\ne j),
\]

matrices \(Q_j\in M_{[1/2,\infty)}(d_j)\), constants \(c_j>0\), and strict \(Q_j\)-stability of the \(j\)-th block. With

\[
C=\operatorname{diag}(c_1,\ldots,c_N),
\qquad
D=\operatorname{diag}(c_1Q_1,\ldots,c_NQ_N),
\]

the key scaling identity is

\[
a^C\psi_X(z)=\psi_X(a^{D^\top}z).
\]

Under these hypotheses, \(L_m(C)\) of the clock passes to \(L_m(D)\) of the output, with the corresponding self-decomposable and strictly stable clauses. This controlled block result is not a theorem for arbitrary cross-block dependence.

<a id="as19-positive-sd"></a>
## 8. Positive-law Laplace criterion

Let \(X\ge0\) be ID with

\[
\mathbb E e^{-\lambda X}=e^{-\psi(\lambda)}.
\]

Put \(q(\lambda)=\lambda\psi'(\lambda)\). Since \(\psi\) is a finite Laplace exponent with \(\psi(0)=0\), the relevant extension has \(q(0)=0\).

**[DERIVED from Theorems 1.34 and 2.17]**

\[
X\in SD(\mathbb R_+)
\iff
\lambda\psi'(\lambda)\text{ is a Bernstein function}.
\tag{positive-SD}
\]

Indeed, if

\[
\psi(\lambda)=d\lambda+
\int_0^\infty(1-e^{-\lambda x})\frac{k(x)}x\,dx
\]

with decreasing \(k\), then

\[
\lambda\psi'(\lambda)
=d\lambda+
\int_0^\infty(1-e^{-\lambda y})(-dk(y)),
\]

which is a Bernstein representation with no killing constant. Conversely, if

\[
q(\lambda)
=d\lambda+\int_0^\infty(1-e^{-\lambda y})\,M(dy)
\]

is the Bernstein representation of \(q\), then

\[
k(x)=M((x,\infty))
\]

(up to the immaterial endpoint convention) is decreasing and reconstructs

\[
\psi(\lambda)
=\int_0^\infty q(e^{-s}\lambda)\,ds.
\]

The last integral is already finite because it equals the given \(\psi(\lambda)\). By Tonelli, this also supplies the BDLP log-moment condition; in measure form it yields the required finiteness of \(\int_{(1,\infty)}\log y\,M(dy)\).

This is a positive-law SD criterion, not a GGC recognition theorem.
For GGC one needs the stronger Stieltjes/Thorin structure; see
[the class hierarchy](classes-and-power-closure.md) and
[the Volterra/size-bias note](sato-id-volterra-size-bias-ggc.md).
The former SD-specific residual, Fourier-inversion and hitting-time
applications are not carried into the active GGC research program.

## 9. Theorem cards for LLM retrieval

### AS19-T1.34: SD Levy criterion

- **Input:** \(\mu\in ID(\mathbb R^d)\) and its Levy measure.
- **Output:** \(\mu\in SD\) iff the polar radial function \(k_\xi(r)\) is nonnegative and decreasing.
- **Best use here:** prove or disprove monotonicity of a candidate radial \(k\).
- **Does not provide:** a formula for that \(k\), ID of the candidate law, or nonlinear power closure.
- **Source status:** external theorem quoted from Sato [93], Theorem 15.10.

### AS19-T2.17: OU/BDLP bijection

- **Input:** \(\rho\in ID_{\log}\) and \(c>0\).
- **Output:** \(\Phi_c(\rho)\in SD\), and every SD law is obtained uniquely.
- **Best use here:** test whether \(q(t)=ct\Psi'(t)\) is continuous negative definite, equivalently whether \(-q(t)\) is the log characteristic function of the BDLP law.
- **Does not provide:** negative definiteness merely from pointwise nonnegativity of \(q\).
- **Source status:** proved in the book.

### AS19-T3.5: selfsimilar additive representation

- **Input:** a stochastically continuous selfsimilar additive process starting at zero, or an SD target law and an exponent \(c>0\).
- **Output:** SD marginals; conversely a unique-in-law process with the prescribed time-one marginal.
- **Best use here:** conceptual and process reconstruction.
- **Does not provide:** additivity from selfsimilarity alone.
- **Source status:** proved in the book; historical source Sato (1991).

### AS19-T3.23: Lamperti/OU correspondence

- **Input:** a fixed \(c>0\), a stochastically continuous selfsimilar process starting at zero and its Lamperti transform, with nontrivial marginal, nonconstant transform, and the stated additivity/OU conditions.
- **Output:** equivalence between selfsimilar additive and stationary OU structures.
- **Best use here:** move between scale and stationarity descriptions.
- **Does not provide:** OU structure for an arbitrary stationary process.
- **Source status:** proved in the book.

### AS19-T4.41: subordinated triplet

- **Input:** an \(\mathbb R_+^N\)-parameter Levy process, an independent \(\mathbb R_+^N\)-valued subordinator, and their triplets.
- **Output:** exponent composition and explicit Gaussian/Levy/drift formulas.
- **Best use here:** identify the Levy measure after random time change.
- **Does not provide:** arbitrary joint laws at incomparable multiparameter times.
- **Source status:** stated and proved, with the proof qualification in Section 11.2 below.

### AS19-T5.1 / T5.9: inheritance

- **Input:** independent strictly stable subordinand and an \(L_m\) subordinator.
- **Output:** subordinated process is in the same \(L_m\); stable indices multiply in the strictly stable case.
- **Best use here:** forward SD inheritance under an independent strictly stable time change.
- **Does not provide:** the converse, or a theorem for a general non-strictly stable subordinand.
- **Source status:** Theorem 5.1 is deduced from the proved multivariate Theorem 5.9.

## 10. Proof templates reusable in this repository

### Template A: disprove SD by one residual

1. Verify \(\varphi\) has no zeros and fix \(b>1\).
2. Form \(R_b(t)=\varphi(t)/\varphi(t/b)\).
3. Find a finite set \(t_1,\ldots,t_n\) and coefficients \(c_j\) for which
   \[
   \sum_{j,k}c_j\overline{c_k}R_b(t_j-t_k)<0.
   \]
4. Conclude \(R_b\) is not positive definite and hence the law is not SD.

Numerical eigenvalues may suggest the witness, but the final sign must be certified analytically or with a rigorous enclosure.

### Template B: prove SD from a Levy \(k\)-function

1. Prove ID and obtain \(\Psi=-\log\varphi\).
2. Derive the Levy measure or a justified inversion formula for \(k\).
3. Prove \(k\ge0\).
4. Prove \(k\) is decreasing, preferably through an integral representation with an evidently signed derivative.
5. Invoke Theorem 1.34.

### Template C: prove SD through the BDLP exponent

1. Compute \(q(t)=t\Psi'(t)\).
2. Produce an explicit Levy-Khintchine representation for \(q\), or prove continuous negative definiteness directly.
3. Check the logarithmic moment/integrability needed for the OU integral.
4. Integrate \(q(u)/u\) back to \(\Psi(t)\), including the constant at \(0\).
5. Invoke Theorem 2.17.

### Template D: transfer SD through a stable time change

1. Realize the proposed positive SD clock law as the time-one law of a subordinator.
2. Use convolution-power closure to verify every clock marginal is SD.
3. verify independence and strict stability of the subordinand.
4. Apply Theorem 5.1.
5. Use only the forward implication or its contrapositive.

## 11. Audit findings and errata

These are checks against the 2019 PDF. They should be treated as local reading corrections, not as an official publisher errata sheet.

### 11.1 Definite typographical corrections

| Location | Printed text/problem | Correct reading | Mathematical impact |
|---|---|---|---|
| p. 9, (1.10) | both unions are printed with \(S_\beta^0\) | the first is \(S=\bigcup_{\beta\in(0,2]}S_\beta\); the second is \(S^0=\bigcup S_\beta^0\) | otherwise the definition of stable laws is wrong |
| Lemma 1.40(i), proof | derivative integral is printed over \([0,2)\) | it should be over \([0,\infty)\) at that point; support in \((0,2)\) is established only in part (ii) | prevents circular support restriction |
| Theorem 1.41(ii), proof | \(\int_S(|x|^2\wedge1)\nu(dx)=c\) | domain should be \(\mathbb R^d\) | \(\nu\) is a Levy measure on \(\mathbb R^d\), not on the sphere |
| Theorem 1.41(ii), proof | generating triplet written \((A,\gamma,\nu)\) | book convention is \((A,\nu,\gamma)\) | notation only |
| Proposition 2.28, (2.52) | \(z\in\mathbb C\) | \(z\in\mathbb R^d\) | the characteristic exponent is evaluated on the real dual space |
| Theorem 2.29(iii), proof, p. 52 | a derivative in the auxiliary variable is printed as \(d/dt\) | it should be \(d/du\); \(t\) is fixed there | notation only |
| Proposition 3.24(ii), final iterated integral | last indicator repeats \(B_2\) | it should be \(B_n\) | required for the \(n\)-time joint law |
| Proposition 3.26, proof | final process is written \(\{X_t\}\) | it should be \(\{X'_t\}\) | notation only |
| Lemma 4.40, proof of (4.25) | coordinate sum is \(k=1,\ldots,N\) | it should be \(k=1,\ldots,d\) | \(V_s\) is \(\mathbb R^d\)-valued |
| Example 5.14 | the normal-mixture calculation contains \(\psi+\gamma\) | every such occurrence must use \(\psi+\gamma^2\) | follows by expanding \((x-s\gamma)^2/(2s)\); see the full corrected formula below |
| Theorem 5.25(iii), end of proof | conclusion says \(D\)-stability | the displayed scaling proves strict \(D\)-stability | the theorem statement itself correctly says “strictly \(D\)-stable” |

There are additional minor symbol slips, including a sign convention mismatch around the centering constants in Definition 1.12 versus the proof of Theorem 1.26, and an index slip in Example 1.45. They do not change the main theorems once the surrounding definitions are followed consistently.

### 11.2 Proof-completeness qualifications

**[AUDIT: Theorem 1.39]** Several statements are for \(\lambda\)-almost every direction \(\xi\), while the proof varies \(b\) or \(\varepsilon\) over an uncountable set. A fully formal proof should first intersect the full-measure sets for rational \(\log b>0\), then extend to all parameters by right-continuity/continuity. This is a standard repair, but the null-set bookkeeping is suppressed.

**[AUDIT: Theorem 1.41]** The case \(\Pi=0\), equivalent to a purely Gaussian/shift component, should be separated before normalizing a measure derived from \(\Pi\). The theorem remains valid.

**[AUDIT: Theorem 4.41]** One integrability step in the proof is too compressed if read as using

\[
\int_{\mathbb R_+^N}|s|\,\nu_Z(ds)<\infty.
\]

A subordinator only guarantees the first-moment condition for small jumps; the large-jump part has finite mass, not necessarily finite first moment. For example,

\[
\nu_Z(ds)=\mathbf1_{\{s>1\}}s^{-3/2}\,ds
\]

is a valid one-dimensional large-jump Levy measure but has infinite first moment. Put

\[
\widetilde\nu(B)=\int_{\mathbb R_+^N}\mu_s(B)\,\nu_Z(ds),
\qquad
B\in\mathcal B(\mathbb R^d\setminus\{0\}).
\]

Splitting \(|s|\le1\) and \(|s|>1\), Lemma 4.40 gives the verifiable repairs

\[
\int_{\mathbb R^d}(1\wedge|x|^2)\widetilde\nu(dx)
\le
[C_1+C(1)]\int_{|s|\le1}|s|\,\nu_Z(ds)
+\nu_Z(|s|>1),
\]

\[
\int_{\mathbb R_+^N}
\left|\int_{|x|\le1}x\,\mu_s(dx)\right|\nu_Z(ds)
\le
C_2\int_{|s|\le1}|s|\,\nu_Z(ds)
+\nu_Z(|s|>1).
\]

For Theorem 4.41(iii), its stronger hypothesis similarly gives

\[
\int_{|x|\le1}|x|\,\widetilde\nu(dx)
\le
C_3\int_{|s|\le1}|s|^{1/2}\nu_Z(ds)
+\nu_Z(|s|>1).
\]

Thus the Levy and drift integrals are controlled without assuming a global first moment. The theorem and its triplet formula survive this repair.

**[AUDIT: Proposition 4.52]** The proof of (ii) refers to equation (4.33), the equation being established, and the continuity proof in (iv) omits a short coordinate-continuity argument. Both gaps are locally repairable from the convolution-semigroup identity, uniqueness of distinguished logarithms, and continuity of coordinates in a fixed weak basis.

**[AUDIT: Theorems 5.9 and 5.25]** The induction is written for finite \(m\). The \(m=\infty\) clause follows by applying the finite-\(m\) conclusion for every \(m\) and then using \(L_\infty=\bigcap_{m<\infty}L_m\); this final intersection step is implicit.

**[AUDIT: Example 5.14]** With the book's normalizing constant \(c\), the corrected density calculation is

\[
\mathbb P(Y_1\in dx)
=
\frac{c}{\sqrt{\psi+\gamma^2}}
\exp\left\{
-\sqrt{(\psi+\gamma^2)(\chi+x^2)}+\gamma x
\right\}dx.
\]

After the stated scale change, the corrected hyperbolic parameters are

\[
a=\sqrt{\chi(\psi+\gamma^2)},
\qquad
b=\sqrt\chi\,\gamma.
\]

### 11.3 Results imported rather than proved

For citation discipline, the following prominent items are not self-contained proofs in this monograph:

- triangular-array limit theorem, Theorem 1.10: Sato [93], Theorem 9.3.
- Theorem 1.26 uses the normalization facts \(b_n\to0\) and \(b_n/b_{n+1}\to1\) from Sato [93], Lemma 15.4.
- stable limit characterization, Theorem 1.27, nontrivial direction: Sato [93], Theorem 15.7.
- Levy-Khintchine representation, Theorem 1.28: Sato [93], Theorem 8.1.
- compound-Poisson density in \(ID\), Theorem 1.33: Sato [93], Corollary 8.8.
- SD polar Levy criterion, Theorem 1.34: Sato [93], Theorem 15.10.
- finite-difference criteria in Lemma 1.38: Widder [138], pp. 144-151.
- stable-law triplet characterization, Theorem 1.42: Sato [93], Theorems 14.1, 14.3, and 14.7.
- the hard inclusion in the domain identity used by Theorem 2.34: Sato [99,101].
- general cone-semigroup subordination, Theorems 4.53 and 4.55: Pedersen--Sato (2003).
- the non-strict Brownian-with-drift extension, Theorem 5.10: Sato (2001).
- Theorem 4.45(iii): Pedersen--Sato [72], Theorem 4.2.
- Theorems 4.49 and 4.48 as its consequence: Pedersen--Sato [72], Theorem 4.1.
- Theorem 4.51: Pedersen--Sato [72], Theorems 5.2-5.3.
- Proposition 5.21: Sharpe [113].
- Proposition 5.23: Sato--Yamazato [111].
- the operator-polar material summarized in Remark 5.26: references [86], [111], and [44] of the monograph.

When a proof in this project depends critically on one of these results, cite the original theorem as well as the 2019 monograph when feasible.

## 12. HCM/GGC boundary of this source

The book mentions generalized gamma convolutions in examples and historical notes, but it is not a systematic source for Thorin measures, HCM densities, or deterministic power closure.

The safe combined hierarchy for positive laws, established in the dedicated sources elsewhere in this repository, is

\[
HCM_{\mathrm{density}}\Longrightarrow GGC\Longrightarrow SD\Longrightarrow ID.
\]

Rocha-Arteaga--Sato supplies the \(SD\Longrightarrow ID\) infrastructure, Levy criteria, OU representation, and subordination results. Its Chapter 2 notes recall \(T\subset L_0\), hence the GGC-to-SD implication in the positive one-dimensional setting, but do not prove or develop the HCM/GGC machinery. In particular, the book supplies no theorem of the form

\[
X\in GGC\Longrightarrow X^r\in SD\quad(0<r<1).
\]

For the [beta-prime example](beta-prime-power-boundary.md), this means
that subunit powers require a genuine SD criterion such as (positive-SD).
Neither convolution-power closure nor an OU representation proves
deterministic power closure.

## 13. Source map and exact references

### 13.1 Internal page map

| Topic | Book location |
|---|---|
| \(L_m\), limit and Levy characterizations | Chapter 1, pp. 1-26 |
| stochastic integrals, OU limits, \(\Phi_c\) | Chapter 2, pp. 27-59 |
| selfsimilar additive and stationary OU processes | Chapter 3, pp. 61-75 |
| multivariate subordination | Chapter 4, pp. 77-106 |
| inheritance under subordination | Chapter 5, pp. 107-119 |
| bibliography and notation | pp. 121-135 |

The local PDF has 140 pages including front matter; printed page 1 begins at PDF page 10.

### 13.2 Principal upstream references named by the book

- Ken-iti Sato, *Levy Processes and Infinitely Divisible Distributions*, Cambridge University Press, 1999; revised edition 2013.
- Ole E. Barndorff-Nielsen, Jan Pedersen, and Ken-iti Sato, "Multivariate subordination, selfdecomposability and stability," *Advances in Applied Probability* 33 (2001), 160-187.
- Jan Pedersen and Ken-iti Sato, "Cone-parameter convolution semigroups and their subordination," *Tokyo Journal of Mathematics* 26 (2003), 503-525.
- Jan Pedersen and Ken-iti Sato, "Relations between cone-parameter Levy processes and convolution semigroups," *Journal of the Mathematical Society of Japan* 56 (2004), 541-559.
- Ken-iti Sato, "Subordination and selfdecomposability," *Statistics & Probability Letters* 54 (2001), 317-324.
- Michael Sharpe, "Operator-stable probability distributions on vector groups," *Transactions of the American Mathematical Society* 136 (1969), 51-65.
- Ken-iti Sato and Makoto Yamazato, "Completely operator-selfdecomposable distributions and operator-stable distributions," *Nagoya Mathematical Journal* 97 (1985), 71-94.
- Christian Halgreen, "Self-decomposability of the generalized inverse Gaussian and hyperbolic distributions," *Zeitschrift fuer Wahrscheinlichkeitstheorie und verwandte Gebiete* 47 (1979), 13-17.
- M. E. H. Ismail and D. H. Kelker, "Special functions, Stieltjes transforms and infinite divisibility," *SIAM Journal on Mathematical Analysis* 10 (1979), 884-901.
- B. Ramachandran, "On geometric-stable laws, a related property of stable processes, and stable densities of exponent one," *Annals of the Institute of Statistical Mathematics* 49 (1997), 299-313.

## 14. Compact guardrail list

An LLM using this note should enforce all of the following.

1. Check ID before applying an SD Levy criterion.
2. Do not confuse \(\mu^{t*}\) with \(X^t\).
3. Do not confuse complete monotonicity of \(k(e^u)\) with HCM/GGC criteria.
4. Do not infer negative definiteness from \(q(t)\ge0\).
5. Do not infer additivity from selfsimilarity alone.
6. Do not infer OU structure from stationarity alone.
7. In subordination, check independence, cone support, and strict stability.
8. Use Theorem 5.1 only forward or by contrapositive.
9. Separate small and large clock jumps in integrability estimates.
10. Treat numerical computation as a source of conjectures or finite witnesses, never as the proof of SD/ID.

## 15. Role in the GGC project

Retain this source for the distinction between ID and SD, the radial
Levy criterion, OU/BDLP representations, positive-law Bernstein tests,
subordination hypotheses, and the audited small-/large-jump integrability
repairs. Section 4.7 preserves the book's historical map of stochastic-
integral representations of the Thorin class.

These are structural comparisons and source interfaces. They do not
supply the project's nonlinear log-rate generator, its positive Euler
evolution or actual-power identification, and migration does not add them
to the [formalization axiom boundary](../formalization/axiom-boundary.md).
The gamma-mixture and HCM/GGC results used in the power project remain in
the dedicated Bondesson and James source notes.
