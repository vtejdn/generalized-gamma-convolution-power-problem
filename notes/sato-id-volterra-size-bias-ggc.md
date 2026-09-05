---
title: "Sato: positive ID laws, the Volterra equation, and a GGC size-bias criterion"
source: "../literature/Sato2.pdf"
source_type: "research monograph; corrected printing with supplement"
status: "audited"
last_verified: "2026-09-05"
source_sha256: "0EBE5721FA3958DCDE21BA4A23C9318B8FF29C77F713E1E6106B92C93CB50401"
topics:
  - infinite divisibility on the half-line
  - generalized gamma convolutions
  - size biasing
  - mixtures of exponentials
  - Volterra equations
  - stable moments
---

# Sato: ID/Volterra/size-bias infrastructure for the GGC power problem

Primary source: [Sato2.pdf](../literature/Sato2.pdf).

Bibliographic identity: Ken-iti Sato, *Levy Processes and Infinitely
Divisible Distributions*, Cambridge Studies in Advanced Mathematics 68,
corrected printing with supplement.  The original English preface is dated
1999.

## 0. Reading contract

- **[SOURCE]** is stated in Sato.
- **[PROJECT DERIVATION FROM EXTERNAL THEOREMS]** is proved below by
  combining precisely cited source results; it is not presented as a theorem
  of Sato and is not claimed to be new to the literature.
- **[PROJECT CONNECTION]** maps a result to a current route.
- **[CAUTION]** prevents a tempting overstatement.

All random variables below are nonnegative.  Write

\[
\psi_X(s)=\mathbb E[e^{-sX}],
\qquad
g_X(s)=-\frac{\psi_X'(s)}{\psi_X(s)}.
\tag{0.1}
\]

## 1. Executive assessment

The high-value result is Theorem 51.1.  It is the rigorous measure-level
source for the Route 2 Volterra equation.  Combined with Sato's description
of mixtures of exponentials and Bondesson's Levy-density characterization of
GGC, it yields the exact finite-mean criterion

\[
\boxed{
X\in GGC
\iff
X^*\overset d=X+R
\text{ for an independent }R\in ME,
}
\tag{1.1}
\]

where \(X^*\) is the size-biased version of \(X\).  This unifies the
Stieltjes log derivative, the completely monotone Volterra kernel, and the
size-bias construction branch, now available across current programs
P1, P3 and P5.

The book also supplies exact stable negative moments and a rigorous
light-tail obstruction to infinite divisibility.  It does not supply a
nonlinear transformation law for the Levy measure under \(X\mapsto X^q\),
nor a Palm/add-one construction for the residual in (1.1).

## 2. Sato's positive-half-line ID identity

### 2.1 Measure-level statement

**[SOURCE: Theorem 51.1, printed pp. 385--386 / PDF pp. 397--398]** A
probability measure \(\mu\) on \([0,\infty)\) is infinitely divisible if and
only if there are \(\gamma_0\ge0\) and a measure \(\nu\) on
\((0,\infty)\), satisfying

\[
\int_{(0,\infty)}(1\wedge x)\,\nu(dx)<\infty,
\tag{2.1}
\]

such that its Laplace transform has the subordinator Levy--Khintchine form

\[
\psi(s)=
\exp\left{-\gamma_0s-
\int_{(0,\infty)}(1-e^{-sx})\,\nu(dx)
\right\},
\tag{2.2}
\]

or, equivalently, the following measure identity holds:

\[
x\mu(dx)
=
\mu*\bigl(\gamma_0\delta_0(dx)+x\nu(dx)\bigr).
\tag{2.3}
\]

Sato prints (2.3) first in cumulative form.  The proof takes Laplace
transforms in both directions, so the converse is part of the theorem.

### 2.2 Density-level Volterra form

If \(\mu(dx)=f(x)dx\) and \(x\nu(dx)=k(x)dx\), then (2.3) becomes

\[
xf(x)=\gamma_0 f(x)+\int_0^x f(x-y)k(y)\,dy.
\tag{2.4}
\]

In the drift-free case this is exactly the Route 2 equation

\[
xf(x)=(f*k)(x).
\tag{2.5}
\]

**[SOURCE + Bondesson]** For a GGC, Bondesson's Theorem 3.1.1 gives

\[
\nu(dx)=\frac{k(x)}x\,dx,
\qquad k\ \text{completely monotone}.
\tag{2.6}
\]

Thus Route 2 is not merely solving a formal deconvolution: it must prove that
the unique kernel in (2.4) is completely monotone.  Positivity alone gives at
most infinite divisibility.

## 3. Size biasing: exact derivation

Assume

\[
0<m:=\mathbb E[X]<\infty.
\tag{3.1}
\]

The size-biased law is

\[
\mathbb P(X^*\in dx)=\frac{x\mu(dx)}m.
\tag{3.2}
\]

### 3.1 ID is equivalent to an independent additive residual

**[PROJECT DERIVATION FROM EXTERNAL THEOREMS: SATO-SB1]** Under (3.1),
\(X\) is ID if and only if there is a nonnegative \(R\), independent of
\(X\), such that

\[
X^*\overset d=X+R.
\tag{3.3}
\]

When it exists, the law of \(R\) is unique and is

\[
\eta(dx)=
\frac{\gamma_0\delta_0(dx)+x\nu(dx)}m.
\tag{3.4}
\]

**Proof.** If \(X\) is ID, take total masses in (2.3).  Monotone convergence
gives

\[
m=\gamma_0+\int_0^\infty x\nu(dx),
\tag{3.5}
\]

so (3.4) is a probability measure.  Divide (2.3) by \(m\) to obtain
\(\mathcal L(X^*)=\mathcal L(X)*\eta\), which is realized by an independent
sum.  Conversely, (3.3) implies (2.3) with

\[
\gamma_0=m\mathbb P(R=0),
\qquad
\nu(dx)=\frac m x\mathbb P(R\in dx),\quad x>0,
\tag{3.6}
\]

and Theorem 51.1 gives infinite divisibility.  Finally, Laplace transforms
applies because

\[
\int_{(0,\infty)}(1\wedge x)\nu(dx)
=m\int_{(0,\infty)}\frac{1\wedge x}{x}\,
\mathbb P(R\in dx)<\infty.
\]

Finally, Laplace transforms show uniqueness:

\[
\mathbb E[e^{-sR}]
=\frac{\mathbb E[e^{-sX^*}]}{\psi_X(s)}
=\frac{-\psi_X'(s)}{m\psi_X(s)}
=\frac{g_X(s)}m.
\tag{3.7}
\]

### 3.2 GGC is equivalent to an exponential-mixture residual

Let \(ME\) denote the class consisting of a possible atom at zero plus a
mixture of exponential distributions.

**[SOURCE: Proposition 51.8, printed p. 389 / PDF p. 401]** A probability
measure \(\eta\) belongs to \(ME\) if and only if

\[
\eta=c\delta_0+h(x)dx,
\qquad h\ \text{completely monotone}.
\tag{3.8}
\]

**[SOURCE for GGC Levy form]** Sato records the GGC Levy form as Exercise
55.8, printed p. 425 / PDF p. 437, with solution at printed p. 470 / PDF
p. 482.  For formal citation the preferred primary theorem is Bondesson,
Theorem 3.1.1:

\[
X\in GGC
\iff
\nu(dx)=\frac{k(x)}x\,dx,
\quad k\ \text{completely monotone}.
\tag{3.9}
\]

**[PROJECT DERIVATION FROM EXTERNAL THEOREMS: SATO-SB2]** If (3.1) holds,
then

\[
X\in GGC
\iff
X^*\overset d=X+R
\quad\text{with }R\perp X\text{ and }R\in ME.
\tag{3.10}
\]

**Proof.** If \(X\in GGC\), insert (3.9) into (3.4):

\[
\eta(dx)=\frac{\gamma_0}{m}\delta_0(dx)+\frac{k(x)}m\,dx.
\tag{3.11}
\]

The continuous part has a completely monotone density, so Proposition 51.8
gives \(R\in ME\).  Conversely, if (3.3) holds with

\[
\mathcal L(R)=c\delta_0+h(x)dx,
\qquad h\ \text{completely monotone},
\]

then (3.6) gives

\[
\gamma_0=mc,
\qquad
\nu(dx)=\frac{mh(x)}x\,dx.
\tag{3.12}
\]

Hence (3.9) applies with \(k=mh\).  This proves (3.10).

### 3.3 Exact unification with the Stieltjes criterion

By (3.7), the residual is in \(ME\) precisely when

\[
\frac{g_X(s)}m
\tag{3.13}
\]

is the Laplace transform of a mixture of exponentials with a possible atom
at zero.  Equivalently,

\[
g_X(s)=\gamma_0+
\int_{(0,\infty)}\frac{U(dt)}{s+t},
\tag{3.14}
\]

with the usual admissibility conditions.  Thus the following are the same
certificate for a finite-mean law:

\[
\begin{array}{c}
g_X\text{ is Stieltjes}
\\[2mm]\Updownarrow\\[-1mm]
k\text{ in the Volterra equation is CM}
\\[2mm]\Updownarrow\\[-1mm]
X^*=X+R\text{ independently with }R\in ME.
\end{array}
\tag{3.15}
\]

**[PROJECT CONNECTION]** SATO-SB2 completes the recognition-theorem part of
historical Route 7, now available as a supporting construction branch of
P5 and the analytic programs. It does not solve the power problem.
For \(Y=X^q\), the remaining task is to prove that the unique transform

\[
\widehat\eta_Y(s)=
\frac{-\psi_Y'(s)}{\mathbb E[Y]\,\psi_Y(s)}
\tag{3.16}
\]

belongs to \(ME\), or to construct the corresponding independent residual.
That task is exactly Route 2 in different language.

## 4. The spectral function for mixtures of exponentials

**[SOURCE: Theorem 51.12, printed pp. 390--394 / PDF pp. 402--406]** If a
law is in \(ME\), its ID Levy density can be written

\[
\ell(x)=\int_0^\infty e^{-xt}q(t)\,dt,
\qquad 0\le q(t)\le1,
\tag{4.1}
\]

with the stated integrability condition, and conversely.

Consequently,

\[
\int_0^\infty xe^{-sx}\ell(x)\,dx
=\int_0^\infty\frac{q(t)}{(s+t)^2}\,dt.
\tag{4.2}
\]

If \(q\) is nondecreasing and the boundary terms vanish, integration by
parts gives

\[
\int_0^\infty\frac{q(t)}{(s+t)^2}\,dt
=\int_0^\infty\frac{dq(t)}{s+t},
\tag{4.3}
\]

and

\[
x\ell(x)=\int_0^\infty e^{-xt}\,dq(t).
\tag{4.4}
\]

**[PROJECT CONNECTION]** This is the Sato--Steutel version of the same
spectral monotonicity seen in Bondesson's \(BO\to GGC\) criterion.  The
canonical phase is not a separate mystery: it is a boundary representation
of the spectral function whose monotonicity makes (4.3) Stieltjes.

## 5. Stable moments and exact normalization

**[SOURCE: Example 25.10, formula (25.5), printed p. 162 / PDF p. 174]** Let
\(0<\rho<1\) and let a positive stable subordinator satisfy

\[
\mathbb E[e^{-uX_t}]=e^{-tc'u^\rho}.
\]

Then

\[
\mathbb E[X_t^\eta]
=(tc')^{\eta/\rho}
\frac{\Gamma(1-\eta/\rho)}{\Gamma(1-\eta)},
\qquad -\infty<\eta<\rho.
\tag{5.1}
\]

For the standard \(S_\rho\), put \(t=c'=1\) and \(\eta=-u\) to obtain

\[
\boxed{
\mathbb E[S_\rho^{-u}]
=\frac{\Gamma(1+u/\rho)}{\Gamma(1+u)},
\qquad u>0.
}
\tag{5.2}
\]

This is an exact source for the full negative-moment range used in Route 1.

Sato's Exercise 29.16, printed p. 195 / PDF p. 207, with solution at printed
p. 456 / PDF p. 468, also gives the normalization check

\[
\left(\frac{E}{S_\rho}\right)^\rho\overset d=E,
\qquad E\sim\operatorname{Exp}(1),\quad E\perp S_\rho.
\tag{5.3}
\]

## 6. Tail obstruction to ID

**[SOURCE: Theorem 26.1, printed pp. 168--172 / PDF pp. 180--184]** Let
\(c\) be the radius of the support of the Levy measure of a Levy process.
The theorem gives the exact threshold for exponential moments of
\(|X_t|\log|X_t|\) and the corresponding \(e^{-\alpha r\log r}\) tail scale.

**[PROJECT CONNECTION]** For a non-Gaussian, nondegenerate ID law, tails
cannot decay on a genuinely Gaussian or faster \(e^{-r^p}\), \(p>1\),
scale.  This makes rigorous the project's use of a superexponential-tail
obstruction, including the exclusion of subunit powers of gamma laws from
ID.  The theorem's support parameter and possible Gaussian component must be
checked in every application.

Sato's Exercises 29.18--29.19, printed p. 195 / PDF p. 207, with solutions
at printed pp. 456--457 / PDF pp. 468--469, provide a concrete warning:
\(S_\alpha^{-\alpha}\) has a Mittag--Leffler law and is not infinitely
divisible.

## 7. Secondary infrastructure

| Result | Location | Use |
|---|---|---|
| positive ID law/subordinator criterion | Theorem 24.11, printed pp. 153--154 / PDF pp. 165--166 | standard Levy--Khintchine data |
| ID is weakly closed | Lemma 7.8, printed p. 34 / PDF p. 46 | limiting step |
| convergence of ID triplets | Theorem 8.7, printed pp. 41--45 / PDF pp. 53--57 | precise weak-limit control |
| positive-half-line SD Levy criterion | Theorem 15.10 and Corollary 15.11, printed pp. 95--97 / PDF pp. 107--109 | distinguishes decreasing \(k\) from CM \(k\) |
| class inclusions | Exercise 55.9, printed p. 425 / PDF p. 437 | \(B\supset ME\cup T\), \(L\supset T\supset L_\infty\) |

## 8. What this source does not provide

1. Proposition 11.10 concerns linear images of Levy measures.  It gives no
   pushforward rule for the nonlinear deterministic map \(X\mapsto X^q\).
2. Subordination in Theorem 30.1 is a random time change, not a deterministic
   power of a random variable.
3. The book contains no directly usable Poisson--Kingman/Dirichlet-mean
   identification for the negatively tilted stable residual.
4. The book does not state a Palm or add-one construction yielding the
   independent residual required by (3.10).
5. SATO-SB1 and SATO-SB2 above are project derivations, not quotations from
   Sato.

## 9. Recommended use in the active program

1. Cite Theorem 51.1 whenever the Volterra equation is used, including drift
   and measure-level hypotheses.
2. Treat (3.15) as the common dictionary joining the analytic programs
   to the size-bias/Palm branch; historical route numbers impose no
   eligibility restriction under the revised CurrentGoal.
3. For a finite gamma convolution \(X\) and \(Y=X^q\), calculate the unique
   residual transform (3.16); the proof target is exactly \(ME\) membership.
4. Use (5.2) for all stable-tilt normalizations.
5. Use Theorem 26.1 only as an exact obstruction, never as a substitute for a
   GGC criterion.
