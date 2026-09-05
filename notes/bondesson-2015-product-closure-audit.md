---
title: "Bondesson (2015): GGC product closure, HCM machinery, and the power obstruction"
source: "../literature/Bondesson2015.pdf"
source_type: "primary article; Springer version of record"
status: "audited"
last_verified: "2026-09-04"
scope: "article results for the current GGC power-problem project, plus an explicitly labelled historical alpha-Cauchy background interface"
topics:
  - generalized gamma convolutions
  - hyperbolic complete monotonicity
  - independent products
  - power closure
  - self-decomposability
  - alpha-Cauchy distributions
---

# Bondesson (2015): LLM-oriented research note

Primary source: [Bondesson2015.pdf](../literature/Bondesson2015.pdf).

## 0. Reading contract

Claim labels have fixed meanings.

- **[PAPER]**: stated or proved in Bondesson (2015).
- **[BACKGROUND]**: recalled by the paper from earlier literature.
- **[AUDIT]**: a qualification, correction, or proof-completeness observation made while checking the paper.
- **[DERIVED]**: a deduction for the current GGC power-problem project; it is not stated in the paper. Alpha-Cauchy deductions are retained only as a historical background interface.
- **[NOT-IMPLIED]**: a tempting inference that is invalid.
- **[OPEN-2015]**: explicitly open, or left unresolved, in the paper.
- **[CONTEXT-2026]**: later context recorded elsewhere in this repository, not a result of Bondesson (2015).

The word HCM is used in two different ways in this literature. This note writes “HCM density” or “HCM function/Laplace transform” where confusion is possible. The shorthand

\[
X\in HCM_{\mathrm{dens}}
\]

means that the law of \(X\) has an HCM density.

## 1. Bibliographic identity and main result

**[PAPER]** Lennart Bondesson, “A Class of Probability Distributions that is Closed with Respect to Addition as Well as Multiplication of Independent Random Variables,” *Journal of Theoretical Probability* **28** (2015), 1063–1081. DOI: 10.1007/s10959-013-0523-y.

The main theorem is

\[
X,Y\in GGC,\qquad X\perp Y
\quad\Longrightarrow\quad
XY\in GGC.
\tag{B15-T1}
\]

Since

\[
GGC\subset SD\subset ID,
\tag{1.1}
\]

the independent product \(XY\) is also self-decomposable and infinitely divisible.

Independence is an explicit hypothesis used throughout the proof. The theorem supplies no dependent-product closure statement, and it concerns an independent product rather than a deterministic power of one random variable.

## 2. Mathematical ontology

### 2.1 Class hierarchy

For positive laws, the implication chain used here is

\[
\boxed{HCM_{\mathrm{dens}}}
\Longrightarrow
\boxed{GGC}
\Longrightarrow
\boxed{SD}
\Longrightarrow
\boxed{ID}.
\tag{2.1}
\]

The first implication is one-way. In particular, a GGC law need not possess an HCM density.

### 2.2 GGC Laplace representation

**[BACKGROUND]** A positive GGC law has a Laplace transform of Thorin form

\[
\phi(s)=
\exp\left\{
-as+\int_{(0,\infty)}
\log\frac{t}{t+s}\,U(dt)
\right\},
\qquad s\ge 0,
\tag{2.2}
\]

where \(a\ge 0\) and \(U\) is a Thorin measure.

**[AUDIT]** Definition 1 on p. 1064 suppresses the complete integrability conditions on \(U\). The displayed formula must not be used with an arbitrary positive measure. A self-contained treatment must restore the admissibility assumptions from the cited GGC theory.

The constructive viewpoint used in the proof is

\[
GGC=
\overline{
\{\text{finite convolutions of gamma laws}\}
}^{\,\mathrm{weak}}.
\tag{2.3}
\]

Degenerate positive shifts can be handled within the standard weak-limit formulation.

### 2.3 HCM functions

**[BACKGROUND]** A nonnegative function \(f\) on \((0,\infty)\) is hyperbolically completely monotone if, for every fixed \(u>0\),

\[
f(uv)f(u/v)
\tag{2.4}
\]

is a completely monotone function of

\[
w=v+v^{-1}\in[2,\infty).
\tag{2.5}
\]

The central recognition theorem is

\[
X\in GGC
\quad\Longleftrightarrow\quad
\phi_X(s)=\mathbb E[e^{-sX}]
\text{ is a normalized HCM function}.
\tag{B15-P3}
\]

This is Proposition 3, p. 1066. The paper cites it from earlier theory rather than proving it.

### 2.4 Positive exponential mixtures

The proof repeatedly seeks a representation

\[
h(w)=\int_{[0,\infty)}e^{-rw}\,\mu(dr),
\qquad \mu\ge 0.
\tag{2.6}
\]

Such a representation certifies complete monotonicity by Bernstein’s theorem. The measure need not be normalized: the cone of completely monotone functions is closed under every well-defined nonnegative mixture.

## 3. Theorem and proposition ledger

| ID | Location | Content | Role | Proof status in this article |
|---|---|---|---|---|
| B15-D1 | p. 1064 | Thorin/GGC definition and weak-limit description | defines the target class | abbreviated; Thorin integrability conditions omitted |
| B15-P1 | p. 1065 | analytic/Pick criterion for a GGC Laplace transform | used for Theorem 4(ii), not T1 | recalled; see audit A1 |
| B15-D2 | p. 1065 | definition of HCM | main analytic language | stated |
| B15-P2 | p. 1066 | HCM density \(\Rightarrow GGC\) | density-to-law conversion | deep result cited from Bondesson’s monograph |
| B15-P3 | p. 1066 | normalized HCM Laplace transform \(\Leftrightarrow GGC\) | final recognition step in T1 | deep result cited from earlier theory |
| B15-P4 | p. 1066 | HCM-density closure under independent products, quotients, and powers \(\lvert q\rvert\ge1\) | gamma ratios and admissible powers | recalled |
| B15-P5 | pp. 1066–1067 | \(X\in GGC\), \(Y\) has an HCM density, independent \(\Rightarrow XY\in GGC\) | one-dimensional prototype | proved |
| B15-P6 | p. 1068 | \(X\sim\Gamma(\beta,t)\Rightarrow e^X-1\in GGC\) | input to T3 | \(\beta\ge1\) handled; \(\beta<1\) cited |
| B15-T1 | pp. 1068–1071 | independent GGC product closure | main theorem | proved; Remark 4 continues on pp. 1071–1072 |
| B15-T2 | p. 1073 | symmetric EGGC product closure and multiplication by \(\sqrt Y\) | immediate application | proved from T1 |
| B15-T3 | p. 1074 | \(X\in GGC\) with left extremity \(a\Rightarrow e^X-e^a\in GGC\) | nonlinear transform | proved from P6, T1, and weak closure |
| B15-T4 | pp. 1074–1075 | monotonicity for quotient classes \(R_\beta\), but not product classes \(M_\beta\) | structural application | part (ii) uses an unexpanded calculation |
| B15-T5 | p. 1075 | sufficient conditions for \(X/Y\) to have an HCM density | extension of the method | proof sketch only |
| B15-C1 | p. 1075 | \(X\in GGC,\ q\ge1\Rightarrow X^q\in GGC\)? | power problem | conjecture in 2015 |
| B15-C2 | pp. 1076–1077 | multivariate hyperbolic-CM integral conjecture | proposed route to C1 | conjecture; \(n=1\) only |
| B15-P7 | p. 1077 | recurrence characterization of GNBC | discrete background | recalled from Bondesson 1992, p. 129, and Steutel–van Harn 2004, p. 388; not proved here |
| B15-T6 | pp. 1078–1079 | explicit family of probability sequences is GNBC | discrete application of T3 | equality boundary needs a closure detail |

## 4. Main theorem: dependency graph

The logical backbone is

\[
\begin{array}{c}
\text{finite gamma sums}
\xrightarrow{\text{bivariate LT lifting}}
\text{positive mixture of core integrals}
\\[2mm]
\xrightarrow{\,y_i=u_iv_i,\ y_i'=u_i/v_i\,}
J_n(t)
\xrightarrow{\text{recursive elimination}}
\displaystyle
\int e^{-P_0-P_1(t+t^{-1})}\,d\mu
\\[2mm]
\xrightarrow{\text{Bernstein}}
\psi\text{ is HCM}
\xrightarrow{\text{B15-P3}}
XY\in GGC
\xrightarrow{\text{weak limits}}
\text{general case}.
\end{array}
\tag{4.1}
\]

Propositions 1, 2, 4, and 5 are not formal prerequisites of Theorem 1. Proposition 5 is a methodological prototype. Proposition 3 is the indispensable recognition theorem.

## 5. Main theorem: exact proof pipeline

### Step 1 — finite-gamma reduction

Approximate the independent GGC variables by independent finite gamma convolutions. In the finite case write

\[
X=\sum_{j=1}^m G_j,
\qquad
Y=\sum_{i=1}^n Y_i,
\tag{5.1}
\]

with all summands independent and

\[
\phi_X(s)=\prod_{j=1}^m(1+a_js)^{-\gamma_j}.
\tag{5.2}
\]

Let

\[
\psi(s)=\mathbb E[e^{-sXY}].
\tag{5.3}
\]

By B15-P3, it is enough to show that for every fixed \(s>0\),

\[
t\longmapsto\psi(st)\psi(s/t)
\tag{5.4}
\]

is completely monotone as a function of \(w=t+t^{-1}\).

### Step 2 — bivariate Laplace-transform lifting

For

\[
A=\sum_i y_i,
\qquad
B=\sum_i y_i',
\tag{5.5}
\]

each gamma factor satisfies

\[
\begin{aligned}
&(1+a_jstA)^{-\gamma_j}
(1+a_jsB/t)^{-\gamma_j}
\\
&\qquad=
\left(
1+a_js(tA+B/t)+a_j^2s^2AB
\right)^{-\gamma_j}.
\end{aligned}
\tag{5.6}
\]

The right-hand side is the bivariate Laplace transform generated by

\[
(a_jsZ_j,a_j^2s^2Z_j),
\qquad Z_j\sim\Gamma(\gamma_j,1),
\tag{5.7}
\]

where the \(Z_j\) are mutually independent. After multiplication over \(j\), define

\[
M_s=
\operatorname{Law}\left(
s\sum_j a_jZ_j,\,
s^2\sum_j a_j^2Z_j
\right).
\tag{5.7a}
\]

Then

\[
\phi_X(stA)\phi_X(sB/t)
=
\int
e^{-\lambda_1(tA+B/t)-\lambda_2AB}
\,M_s(d\lambda_1,d\lambda_2).
\tag{5.8}
\]

All integrands are nonnegative, so Tonelli reduces the HCM problem to fixed \(\lambda_1,\lambda_2\).

### Step 3 — hyperbolic coordinates

For every pair \((y_i,y_i')\), use

\[
y_i=u_iv_i,
\qquad
y_i'=u_i/v_i,
\qquad
u_i,v_i>0.
\tag{5.9}
\]

The absolute Jacobian is

\[
\left|
\frac{\partial(y_i,y_i')}{\partial(u_i,v_i)}
\right|
=\frac{2u_i}{v_i}.
\tag{5.10}
\]

The product term becomes

\[
AB
=
\sum_i u_i^2
+
\sum_{i<j}u_iu_j
\left(
\frac{v_i}{v_j}+\frac{v_j}{v_i}
\right).
\tag{5.11}
\]

Write

\[
Y_i\sim\Gamma(\beta_i,b_i)
\]

in shape-rate convention. For fixed \((\lambda_1,\lambda_2,u)\), the coefficients below are

\[
c_i=\lambda_1u_i,
\qquad
d_{ij}=\lambda_2u_iu_j,
\qquad
e_i=b_iu_i.
\tag{5.11a}
\]

If \(I_n(t;\lambda_1,\lambda_2)\) denotes the contribution with the two auxiliary parameters fixed, then

\[
\begin{aligned}
I_n(t;\lambda_1,\lambda_2)
={}&
2^n
\prod_i\frac{b_i^{2\beta_i}}{\Gamma(\beta_i)^2}
\\
&\times
\int_{(0,\infty)^n}
\left(\prod_i u_i^{2\beta_i-1}\right)
e^{-\lambda_2\sum_i u_i^2}
J_n(t;u)
\,du.
\end{aligned}
\tag{5.11b}
\]

This is an outer nonnegative \(u\)-mixture. After freezing \(u\), the essential integral \(J_n(t;u)\), abbreviated below to \(J_n(t)\), is

\[
J_n(t)=
\int_{(0,\infty)^n}
e^{-E_n(v,t)}
\prod_{i=1}^n\frac{dv_i}{v_i},
\tag{5.12}
\]

where

\[
\begin{aligned}
E_n(v,t)
={}&
\sum_i c_i
\left(tv_i+\frac1{tv_i}\right)
\\
&+
\sum_{i<j}d_{ij}
\left(
\frac{v_i}{v_j}+\frac{v_j}{v_i}
\right)
\\
&+
\sum_i e_i
\left(v_i+\frac1{v_i}\right),
\end{aligned}
\tag{5.13}
\]

and all coefficients are positive. Consequently, complete monotonicity of \(J_n(t;u)\) for every fixed \(u\) implies complete monotonicity of (5.11b), and then of \(\psi(st)\psi(s/t)\).

### Step 4 — recursive elimination lemma

The core claim is that there exist positive functions \(P_0,P_1\), independent of \(t\), such that

\[
J_n(t)=
\int_{(0,\infty)^n}
e^{-P_0(\rho)-P_1(\rho)(t+t^{-1})}
\prod_i\frac{d\rho_i}{\rho_i}.
\tag{5.14}
\]

#### Base case \(n=1\)

Set

\[
\rho_1=(c_1t+e_1)v_1.
\tag{5.15}
\]

Then \(dv_1/v_1=d\rho_1/\rho_1\), and

\[
P_0=
\rho_1+\frac{c_1^2+e_1^2}{\rho_1},
\qquad
P_1=\frac{c_1e_1}{\rho_1}>0.
\tag{5.16}
\]

#### Induction step

Eliminate \(v_n\) by

\[
\rho_n=
\left(
c_nt+\sum_{i<n}\frac{d_{in}}{v_i}+e_n
\right)v_n.
\tag{5.17}
\]

For fixed \(v_1,\ldots,v_{n-1}\),

\[
\frac{dv_n}{v_n}=\frac{d\rho_n}{\rho_n}.
\tag{5.18}
\]

Expansion gives

\[
E_n=
E_{n-1}^{\mathrm{new}}
+A_0+A_1(t+t^{-1}),
\tag{5.19}
\]

where

\[
A_0=
\rho_n+
\frac{
c_n^2+\sum_{i<n}d_{in}^2+e_n^2
}{\rho_n},
\qquad
A_1=\frac{c_ne_n}{\rho_n}>0,
\tag{5.20}
\]

and the new coefficients are

\[
\widetilde c_i
=c_i+\frac{c_nd_{in}}{\rho_n},
\tag{5.21}
\]

\[
\widetilde d_{ij}
=d_{ij}+\frac{d_{in}d_{jn}}{\rho_n},
\tag{5.22}
\]

\[
\widetilde e_i
=e_i+\frac{e_nd_{in}}{\rho_n}.
\tag{5.23}
\]

Every updated coefficient remains positive and is independent of \(t\), so the induction hypothesis applies pointwise in \(\rho_n\).

### Step 5 — complete monotonicity and weak limits

Equation (5.14) is a nonnegative mixture of exponentials in \(w=t+t^{-1}\). Hence \(J_n\), and then (5.4), is completely monotone in \(w\). Therefore \(\psi\) is HCM, and B15-P3 gives \(XY\in GGC\) in the finite-gamma case.

For the general case, choose independent approximants \((X_k,Y_k)\), establish

\[
(X_k,Y_k)\Rightarrow(X,Y),
\qquad
X_kY_k\Rightarrow XY,
\tag{5.24}
\]

by joint convergence and the continuous mapping theorem, and invoke weak closure of GGC.

## 6. Reusable proof methods

### Method A — turn HCM into a one-variable CM problem

To prove that a positive function \(\psi\) is HCM, fix \(s>0\), pair the arguments \(st\) and \(s/t\), and isolate all dependence on

\[
w=t+t^{-1}.
\tag{6.1}
\]

This converts multiplicative symmetry into ordinary complete monotonicity.

### Method B — bivariate Laplace-transform lifting

An expression involving both \(tA+B/t\) and \(AB\) can sometimes be encoded as a bivariate Laplace transform. Complicated algebra is then moved into a positive mixing measure, after which Tonelli permits reduction to deterministic auxiliary parameters.

### Method C — hyperbolic pairing

The substitution

\[
(y,y')=(uv,u/v)
\tag{6.2}
\]

is adapted to products of a quantity evaluated at \(t\) and at \(1/t\). Its multiplicative coordinate has measure \(dv/v\), and pairwise products generate the symmetric kernels

\[
\frac{v_i}{v_j}+\frac{v_j}{v_i}.
\tag{6.3}
\]

### Method D — eliminate one multiplicative coordinate at a time

Choose \(\rho_n\) to absorb every term linear in \(v_n\). The inverse terms then produce:

1. a positive \(t\)-independent contribution;
2. a positive coefficient multiplying \(t+t^{-1}\);
3. the same interaction pattern on one fewer variable.

Preservation of this algebraic form is the decisive induction invariant.

### Method E — certify CM without repeated differentiation

Once an integral has the form

\[
\int
e^{-P_0(\rho)}
e^{-P_1(\rho)w}
\,\mu(d\rho),
\qquad P_1\ge0,
\tag{6.4}
\]

push the positive measure \(e^{-P_0}\mu\) forward under \(P_1\). The result is a Bernstein measure for the function of \(w\).

### Method F — postpone weak closure

First establish the finite-dimensional integral identity with explicit densities and substitutions. Invoke weak approximation and continuous mapping only after the positive-mixture certificate is complete.

## 7. Proposition 5 as the one-dimensional prototype

**[PAPER]** If \(X\in GGC\), \(Y\) has an HCM density, and \(X\perp Y\), then \(XY\in GGC\).

After HCM/Bernstein expansions and the substitution \(x=uv,\ y=u/v\), the central integral has the pattern

\[
\int_0^\infty
\frac{dv}{v}
\exp\left\{
-\lambda(v+v^{-1})
-\mu(tv+(tv)^{-1})
\right\}.
\tag{7.1}
\]

With

\[
\rho=(\lambda+\mu t)v,
\tag{7.2}
\]

the exponent becomes

\[
-\rho-
\frac{
\lambda^2+\mu^2+\lambda\mu(t+t^{-1})
}{\rho}.
\tag{7.3}
\]

This is a positive exponential mixture in \(t+t^{-1}\). Theorem 1 generalizes exactly this variable-elimination idea.

## 8. Other structural results in the paper

### 8.1 Smallest generated class

**[PAPER]** Section 4 observes that GGC is the smallest class containing all gamma laws and closed under:

- multiplication by positive constants;
- independent addition;
- independent multiplication;
- weak convergence.

The word “smallest” is essential. The assertion is not that every class with those properties equals GGC.

### 8.2 Symmetric EGGC

**[BACKGROUND]** The relevant characterization recalled by the paper is

\[
X\in\mathrm{symEGGC}
\quad\Longleftrightarrow\quad
X\overset d=\sqrt Y\,Z,
\quad
Y\in GGC,
\quad
Z\sim N(0,1),
\quad
Y\perp Z.
\tag{8.1}
\]

**[PAPER]** Theorem 2 gives independent product closure of symEGGC and closure under multiplication by \(\sqrt Y\) for an independent \(Y\in GGC\).

### 8.3 Exponential transformation

**[PAPER]** If \(X\in GGC\) has left extremity \(a\), then

\[
e^X-e^a\in GGC.
\tag{8.2}
\]

The proof uses Proposition 6 for gamma summands, Theorem 1 for independent products of the transformed summands, and weak closure.

### 8.4 Gamma product and quotient subclasses

With \(Y_\beta\sim\Gamma(\beta,1)\), define

\[
M_\beta=\{XY_\beta:X\in GGC,\ X\perp Y_\beta\},
\qquad
R_\beta=\{X/Y_\beta:X\in GGC,\ X\perp Y_\beta\}.
\tag{8.3}
\]

**[PAPER]** If \(0<\alpha<\beta\), then

\[
R_\alpha\subset R_\beta,
\tag{8.4}
\]

whereas the analogous monotonicity for \(M_\beta\) fails.

### 8.5 Discrete analogue

**[BACKGROUND]** The paper recalls that generalized negative-binomial convolutions satisfy

\[
GNBC=Po(GGC),
\tag{8.5}
\]

**[PAPER]** Example 2 shows that independent products of GNBC variables need not remain GNBC. Therefore the main theorem has no direct discrete multiplicative analogue.

## 9. Power closure: exact safe statements

### 9.1 HCM-density powers

**[BACKGROUND]** The paper states as Proposition 4 that

\[
X\text{ has an HCM density}
\quad\Longrightarrow\quad
X^q\text{ has an HCM density for }\lvert q\rvert\ge1.
\tag{9.1}
\]

For independent HCM-density variables \(X,Y\),

\[
XY\text{ and }X/Y
\text{ have HCM densities}.
\tag{9.2}
\]

Neither statement covers a positive fractional power \(0<q<1\).

### 9.2 GGC powers

**[OPEN-2015]** Conjecture 1 asks whether

\[
X\in GGC,\qquad q\ge1
\quad\Longrightarrow\quad
X^q\in GGC.
\tag{9.3}
\]

The paper does not prove (9.3). Conjecture 2 is a stronger multivariate hyperbolic-CM integral statement. Only its one-dimensional case is known there, and Remark 9 says that the recursive substitution from Theorem 1 appears not to apply.

**[CONTEXT-2026]** Sjödin, “The Power Problem for Generalized Gamma Convolutions (GGC) and Related Questions,” Theorem 1 (2026), claims the later \(q>1\) GGC power theorem recorded in [classes-and-power-closure.md](classes-and-power-closure.md). The present project does not accept that claim as established because its audit finds Lemma 2 false; see [ResearchStatus.md](../ResearchStatus.md). Even if the claimed theorem were repaired, it could not be reversed and would give no closure under \(0<q<1\).

### 9.3 Independent product is not deterministic power

**[NOT-IMPLIED]** Theorem 1 cannot be applied to \(X^2\) by writing \(X^2=X\cdot X\), because the two factors on the right are the same random variable and are not independent.

The theorem controls the law of \(XY\) when \(Y\overset d=X\) is an independent copy. That law is generally different from the law of \(X^2\).

## 10. Audit findings and corrections

### A1 — Proposition 1 has an implicit missing hypothesis

As printed, Proposition 1 lists analyticity on

\[
\mathbb C\setminus(-\infty,0],
\tag{10.1}
\]

nonvanishing, \(\phi(0)=1\), and

\[
\operatorname{Im}
\frac{\phi'(s)}{\phi(s)}
\ge0,
\qquad
\operatorname{Im}s>0.
\tag{10.2}
\]

Read as a criterion for an arbitrary analytic function, these displayed conditions are incomplete: \(e^s\) satisfies them but is not a probability Laplace transform. Safe use requires either that \(\phi\) already be known to be a Laplace transform or that suitable real-axis and complete-monotonicity conditions be restored. This issue does not affect Theorem 1, which does not use Proposition 1.

The equivalent numerator condition is

\[
\operatorname{Im}
\left[
\phi'(s)\overline{\phi(s)}
\right]
\ge0.
\tag{10.3}
\]

The complex-conjugation bar is easy to lose during PDF text extraction.

### A2 — deep imported results

Propositions 2 and 3 are cited from prior GGC/HCM theory rather than reproved. Proposition 6 for \(\beta<1\) is likewise imported from Bondesson’s 1992 monograph. A self-contained proof or formalization must expose these dependencies.

### A3 — suppressed weak-limit details

The finite-gamma reduction is standard but terse. A formal proof must construct independent approximating pairs, prove joint weak convergence, apply the continuous mapping theorem to multiplication, and use weak closure of GGC.

### A4 — Tonelli and positive mixtures

All core integrands are nonnegative, so Tonelli justifies changes in integration order. The article occasionally says “convex combinations”; the actual closure used is under nonnegative mixtures, which need not have total mass one.

### A5 — typographical error

On p. 1071, “\(\widetilde P_1\) and \(\widetilde P_1\)” should read “\(\widetilde P_0\) and \(\widetilde P_1\).”

### A6 — claims needing reconstruction before formal use

- Theorem 4(ii) reports a negative sign on a decimal interval without displaying an exact symbolic expression or certified error bound.
- Theorem 5 is a proof sketch, not a fully expanded derivation.
- Theorem 6 permits \(t_i=\beta\), while the written argument directly handles the strict case; equality should be supplied by approximation and weak closure.
- The numerical calculation in Remark 3 and the numerical remarks in the power section are evidence only, never proof.

### A7 — no explicit product Thorin measure

The proof is existential. Section 9 explicitly lists computation of the product Thorin measure as an open problem; consequently the paper also supplies no derived explicit Lévy density of \(XY\).

## 11. Guardrails: what the paper does not license

1. **[NOT-IMPLIED]**
   \[
   X,Y\in SD(\mathbb R_+)
   \quad\Longrightarrow\quad
   XY\in SD.
   \]
   Positive SD product closure is listed as Open Problem 9(v).

2. **[NOT-IMPLIED]**
   \[
   X,Y\in ID(\mathbb R_+)
   \quad\Longrightarrow\quad
   XY\in ID.
   \]
   This is false in general, even under independence and nonnegativity. On p. 1068 Bondesson cites the counterexample of Shanbhag, Pestana, and Sreehari (1977).

3. **[NOT-IMPLIED]** Every GGC law has an HCM density. The valid implication is HCM density \(\Rightarrow GGC\).

4. **[NOT-IMPLIED]** A GGC law remains GGC under \(0<q<1\).

5. **[NOT-IMPLIED]** From \(X^q\in GGC\) for \(q>1\), one may conclude \(X\in GGC\).

6. **[NOT-IMPLIED]** SD of \(\lvert X\rvert\) implies SD of the symmetric signed variable \(X\), or conversely.

7. **[NOT-IMPLIED]** Theorem 2 applies to every symmetric law. It requires a Gaussian variance-mixture representation with a GGC mixing variable.

8. **[NOT-IMPLIED]** Theorem 1 supplies an explicit Lévy density or Thorin measure for the product.

## 12. Historical background case study: the alpha-Cauchy interface

Let

\[
1<\alpha<2,
\qquad
\gamma=\frac1\alpha,
\qquad
B=\lvert C_\alpha\rvert^\alpha.
\tag{12.1}
\]

**[BACKGROUND]** Yano–Yano–Yor (2009), equations (2.20)–(2.21), give the gamma-ratio identity

\[
B\overset d=
\frac{\Gamma_{\gamma}}
{\widehat\Gamma_{1-\gamma}},
\tag{12.2}
\]

where the numerator and denominator are independent unit-rate gamma variables. See [Yano–Yano–Yor (2009)](<../background/alpha-cauchy-sd/literature/On the laws of first hitting times of points for one-dimensional symmetric stable Levy processes.pdf>).

### 12.1 Immediate consequence

**[DERIVED]**

For a unit-rate gamma density \(f_r(x)\propto x^{r-1}e^{-x}\),

\[
f_r(uv)f_r(u/v)
\propto
u^{2r-2}e^{-u(v+v^{-1})},
\]

which is completely monotone in \(v+v^{-1}\). Thus gamma densities are HCM. By the independent quotient closure in B15-P4,

\[
B\text{ has an HCM density}.
\tag{12.3}
\]

B15-P2 and the standard hierarchy therefore give

\[
\lvert C_\alpha\rvert^\alpha
=B
\in HCM_{\mathrm{dens}}
\subset GGC
\subset SD
\subset ID.
\tag{12.4}
\]

This conclusion uses Propositions 4 and 2; it does not require the main product theorem.

### 12.2 Fractional-root obstruction

**[DERIVED]**

We have

\[
\lvert C_\alpha\rvert=B^{1/\alpha},
\qquad
0<\frac1\alpha<1.
\tag{12.5}
\]

The exponent lies exactly outside the HCM power range \(\lvert q\rvert\ge1\). Thus Bondesson (2015) supplies no implication

\[
B\in HCM_{\mathrm{dens}}\subset GGC
\quad\Longrightarrow\quad
B^{1/\alpha}\in SD.
\tag{12.6}
\]

This is the exact point at which the standard HCM/GGC closure route stops.

### 12.3 Negative powers: a valid parameter region

**[DERIVED]**

For \(p>0\),

\[
\lvert C_\alpha\rvert^{-p}
=B^{-p/\alpha}.
\tag{12.7}
\]

If \(p\ge\alpha\), then \(\lvert-p/\alpha\rvert\ge1\), so B15-P4 yields

\[
\lvert C_\alpha\rvert^{-p}
\in HCM_{\mathrm{dens}}
\subset GGC
\subset SD
\subset ID.
\tag{12.8}
\]

Equation (12.8) is a direct project-level corollary; it is not stated by Bondesson.

If \(0<p<\alpha\), then the exponent is in \((-1,0)\), and this article gives no conclusion about self-decomposability.

### 12.4 Why the symmetric EGGC theorem does not settle \(C_\alpha\)

**[AUDIT]**

Writing

\[
C_\alpha\overset d=
\varepsilon B^{1/\alpha}
\tag{12.9}
\]

with an independent Rademacher sign does not place \(C_\alpha\) in symEGGC. To use Theorem 2, one would first need a representation

\[
C_\alpha\overset d=\sqrt Y\,Z,
\qquad
Y\in GGC,
\qquad
Z\sim N(0,1),
\qquad
Y\perp Z,
\tag{12.10}
\]

which the article does not provide.

## 13. Formalization-oriented decomposition

For Lean or another proof assistant, separate the work into five layers.

### Layer F1 — elementary algebra

- identity (5.6);
- hyperbolic product expansion (5.11);
- coefficient bridge and outer mixture (5.11a)–(5.11b);
- base substitution (5.15)–(5.16);
- induction expansion (5.17)–(5.23);
- positivity of every updated coefficient.

This layer is finite-dimensional and contains no probability theory.

### Layer F2 — substitutions and measures

- measurable bijectivity of \((u,v)\mapsto(uv,u/v)\);
- Jacobian \(2u/v\);
- multiplicative-measure invariance \(dv/v=d\rho/\rho\);
- Tonelli for nonnegative integrands.

### Layer F3 — complete monotonicity

- positive exponential mixtures are completely monotone;
- the CM cone is closed under nonnegative integration;
- the HCM definition reduces to CM in \(t+t^{-1}\).

A measure-representation API may be easier to formalize than repeated higher derivatives.

### Layer F4 — probability transforms

- gamma Laplace transforms;
- the bivariate LT construction (5.7)–(5.8), including the law \(M_s\) in (5.7a);
- product-law Laplace transforms under independence;
- normalization constants hidden by proportionality notation in the paper.

### Layer F5 — structural theorems

- normalized HCM LT \(\Leftrightarrow GGC\) (B15-P3);
- weak closure of GGC;
- weak density of finite gamma convolutions in GGC;
- \(GGC\subset SD\subset ID\).

These are the deepest external dependencies. They should never be hidden inside an “obvious” lemma.

### Recommended proof order

1. Formalize the \(n=1\) kernel from Proposition 5.
2. Verify the \(n=2\) recursion by explicit algebra.
3. Encode \(d_{ij}\) as a symmetric positive off-diagonal coefficient family.
4. Prove the general elimination invariant.
5. Deduce the finite-gamma product theorem.
6. Add the HCM–GGC recognition theorem as a clearly isolated dependency.
7. Add weak approximation last.

## 14. Query-oriented fact records

### Record B15-T1

- Status: PAPER.
- Input: \(X\in GGC\), \(Y\in GGC\), and \(X\perp Y\).
- Output: \(XY\in GGC\), hence \(XY\in SD\cap ID\).
- Does not output: an HCM density, an explicit Thorin measure, or general SD product closure.
- Theorem and proof: pp. 1068–1071; explicit recursion in Remark 4: pp. 1071–1072.

### Record B15-P4-POWER

- Status: BACKGROUND; stated in Bondesson as Proposition 4.
- Input: \(X\) has an HCM density and \(\lvert q\rvert\ge1\).
- Output: \(X^q\) has an HCM density.
- Does not cover: \(0<q<1\).
- Page: 1066.

### Record ALPHA-CAUCHY-INTERFACE

- Identity status: BACKGROUND; Yano–Yano–Yor (2009), equations (2.20)–(2.21).
- Closure deductions status: DERIVED.
- Identity:
  \[
  B=\lvert C_\alpha\rvert^\alpha
  \overset d=
  \Gamma_{1/\alpha}/\Gamma_{1-1/\alpha}.
  \]
- Known:
  \[
  B\in HCM_{\mathrm{dens}}\subset GGC\subset SD\subset ID.
  \]
- Blocked target:
  \[
  \lvert C_\alpha\rvert=B^{1/\alpha},
  \qquad 0<1/\alpha<1.
  \]
- Valid negative-power region:
  \[
  p\ge\alpha
  \Longrightarrow
  \lvert C_\alpha\rvert^{-p}\in HCM_{\mathrm{dens}}\subset GGC\subset SD\subset ID.
  \]

### Record POWER-GUARDRAIL

- Status: NOT-IMPLIED.
- Invalid inference:
  \[
  \operatorname{Law}(XY)\in GGC
  \text{ for independent }Y\overset d=X
  \quad\Longrightarrow\quad
  \operatorname{Law}(X^2)\in GGC.
  \]
- Reason: independent product and deterministic power have different dependence structures.

## 15. Source map and cross-references

- Definitions and Propositions 1–4: pp. 1064–1066.
- Proposition 5 and its hyperbolic substitution: pp. 1066–1067.
- Proposition 6: p. 1068.
- Theorem 1 and proof: pp. 1068–1071.
- Remark 4 and explicit recursive formulas: pp. 1071–1072.
- Symmetric EGGC application: p. 1073.
- Exponential and gamma ratio/product applications: pp. 1073–1075.
- Power problem and Conjectures 1–2: pp. 1075–1077.
- GNBC section: pp. 1077–1079.
- Open problems: pp. 1079–1080.

Additional references used in this note:

- Bondesson, L. (1992), *Generalized Gamma Convolutions and Related Classes of Distributions and Densities*, Lecture Notes in Statistics 76, Springer, New York.
- Schilling, R. L.; Song, R.; Vondraček, Z. (2010), *Bernstein Functions*, de Gruyter Studies in Mathematics 37, Walter de Gruyter, Berlin.
- Steutel, F. W.; van Harn, K. (2004), *Infinite Divisibility of Probability Distributions on the Real Line*, Marcel Dekker, New York.
- Yano, K.; Yano, Y.; Yor, M. (2009), “On the laws of first hitting times of points for one-dimensional symmetric stable Lévy processes,” in *Séminaire de Probabilités XLII*, Lecture Notes in Mathematics 1979, 187–227, DOI: 10.1007/978-3-642-01763-6_8. The gamma-ratio identity is in equations (2.20)–(2.21).
- Shanbhag, D. N.; Pestana, D.; Sreehari, M. (1977), “Some further results in infinite divisibility,” *Mathematical Proceedings of the Cambridge Philosophical Society* **82**, 289–295. Cited by Bondesson on p. 1068 for failure of multiplicative closure of nonnegative ID laws.
- Sjödin, T. (2026), “The Power Problem for Generalized Gamma Convolutions (GGC) and Related Questions,” *Journal of Theoretical Physics & Mathematics Research* **4**(2), 1–7, DOI: 10.64030/3065-8802.04.02.02; arXiv:2601.04038.

For the project-wide class hierarchy and post-2015 power results, see [classes-and-power-closure.md](classes-and-power-closure.md).

For the historical alpha-Cauchy beta-prime reduction, see [03-beta-prime-reduction.md](../background/alpha-cauchy-sd/notes/03-beta-prime-reduction.md).

For the historical alpha-Cauchy lemma ledger, see [05-lemmas-and-conjectures.md](../background/alpha-cauchy-sd/notes/05-lemmas-and-conjectures.md).
