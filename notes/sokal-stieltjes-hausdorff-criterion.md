---
title: "Sokal--Widder inequalities and exponentially tilted cumulants"
source: "https://arxiv.org/pdf/0902.0065v2"
status: "source theorem checked; project specialization derived"
last_verified: "2026-09-05"
---

# A Hausdorff criterion for the GGC power problem

## 0. Exact source and scope

Alan D. Sokal, *Real-variables characterization of generalized Stieltjes
functions*, **Expositiones Mathematicae 28** (2010), 179--185,
[DOI 10.1016/j.exmath.2009.06.004](https://doi.org/10.1016/j.exmath.2009.06.004).
Checked [arXiv:0902.0065v2](https://arxiv.org/pdf/0902.0065v2),
6 May 2009; its title page gives the manuscript revision as 29 April 2009.
The page numbers below refer to this nine-page version.

Theorem 1, pp. 2--3, is the Stieltjes characterization attributed there to
Widder (1938). Theorem 2, p. 4, extends it to general order. Equations
(13)--(16), pp. 5--6, express the proof through Hausdorff moment sequences.
The use of cumulants below is a project specialization, not a theorem
stated by Sokal.

## 1. External recognition theorem

**[SOURCE: Sokal, Theorem 1(b), equation (3a)]** A real
\(C^\infty\) function \(g\) on \((0,\infty)\) is Stieltjes if and only if

\[
F_{n,k}(s)=(-1)^n\sum_{j=0}^k
\binom{k}{j}\frac{(n+k)!}{(n+j)!}s^jg^{(n+j)}(s)\ge0
\tag{S.1}
\]

for every \(s>0\) and integers \(n,k\ge0\). His convention is

\[
g(s)=a+\int_{[0,\infty)}\frac{U(dt)}{s+t},\qquad
a\ge0,\quad U\ge0,\quad
\int\frac{U(dt)}{1+t}<\infty.
\tag{S.2}
\]

**[SOURCE: equations (13)--(16), order \(\lambda=1\)]** Equivalently,
for every \(s>0\), the sequence

\[
c_n(s)=\frac{(-1)^ns^n}{n!}g^{(n)}(s),\qquad n\ge0,
\tag{S.3}
\]

is the moment sequence of a finite positive measure on \([0,1]\). Its
representing measure is

\[
\nu_s=a\delta_0+
\left(t\mapsto\frac{s}{s+t}\right)_\#
\left(\frac{U(dt)}{s+t}\right).
\tag{S.4}
\]

Hausdorff positivity means
\(\sum_{j=0}^k(-1)^j\binom{k}{j}c_{n+j}(s)\ge0\) for all \(n,k\).
The measure is finite, not necessarily a probability measure.

## 2. Exponential tilting supplies all required cumulants

**[PROJECT DERIVATION: SOKAL-L1]** Let \(Y\ge0\) be finite almost surely,
and define

\[
L(s)=\mathbb E e^{-sY},\qquad g(s)=-L'(s)/L(s),\qquad s>0.
\]

Define the exponentially tilted law \(Y_s\) by

\[
\mathbb E h(Y_s)=\frac{\mathbb E[h(Y)e^{-sY}]}{L(s)}.
\tag{S.5}
\]

Then all its moments and cumulants are finite, without any moment
assumption on the un-tilted law: \(y^me^{-sy}\) is bounded for every
fixed \(s>0,m\ge0\). In fact, its moment generating function exists in
a neighborhood of zero and

\[
\log\mathbb E e^{tY_s}=\log L(s-t)-\log L(s),\qquad |t|<s.
\]

Differentiation at zero yields

\[
g^{(n)}(s)=(-1)^n\kappa_{n+1}(Y_s),
\qquad
\boxed{c_n(s)=\frac{s^n}{n!}\kappa_{n+1}(Y_s).}
\tag{S.6}
\]

Thus (S.1) becomes the exact family

\[
\boxed{
A_{n,k}(s):=\sum_{j=0}^k(-1)^j\binom{k}{j}
\frac{s^{n+j}\kappa_{n+j+1}(Y_s)}{(n+j)!}\ge0.
}
\tag{S.7}
\]

Indeed \(F_{n,k}(s)=(n+k)!s^{-n}A_{n,k}(s)\).

## 3. From the Stieltjes criterion to a GGC law

**[PROJECT DERIVATION: SOKAL-L2]** For the nonnegative variable above,
the following conditions are equivalent:

1. \(Y\) is GGC, allowing a nonnegative deterministic drift;
2. \(g=-L'/L\) is Stieltjes;
3. for every \(s>0\), (S.6) is a Hausdorff moment sequence;
4. (S.7) holds for every \(s>0,n,k\ge0\).

The equivalence of 2--4 is Sokal's criterion plus SOKAL-L1. For the
GGC step, use the Thorin/Stieltjes characterization recorded in
[ledger/references.md](../ledger/references.md), source 3
(Schilling--Song--Vondraček, Theorem 8.2). The following direct check
also handles the origin in Sokal's convention.

If (S.2) holds, integrate \(g\) from \(\varepsilon\) to \(s\) and let
\(\varepsilon\downarrow0\). Since \(L(0+)=1\), Tonelli and monotone
convergence give

\[
-\log L(s)=as+\int_{(0,\infty)}\log(1+s/t)U(dt)<\infty.
\tag{S.8}
\]

An atom of \(U\) at zero would give an infinite integral
\(\int_0^s U(\{0\})\,du/u\), so it must vanish. Finiteness of (S.8)
implies the Thorin integrability conditions at both endpoints. Conversely,
differentiating (S.8) gives (S.2). In (S.4), drift is mass at \(u=0\),
whereas the excluded rate-zero atom would be mass at \(u=1\).
Whenever a positive power of a finite gamma convolution is GGC, its
drift is zero: the law has essential infimum zero. No drift parameter is
assigned here to a law whose GGC membership has not been established.

## 4. Why this changes the discrete route

**[PROJECT CONNECTION]** Set \(Y=X^q\), with a finite gamma convolution
\(X\) and \(q\ge1\). Compute tilted raw moments from

\[
J_m(s)=\mathbb E[X^{qm}e^{-sX^q}],\qquad
m_m(s)=J_m(s)/J_0(s).
\tag{S.9}
\]

The usual moment--cumulant recursion, here just differentiation of
\(\exp(\log\mathbb E e^{tY_s})\), gives

\[
\kappa_r(Y_s)=m_r(s)-\sum_{j=1}^{r-1}
\binom{r-1}{j-1}\kappa_j(Y_s)m_{r-j}(s).
\tag{S.10}
\]

This produces a real-variable positivity target for all powers, including
\(q>2\), without appealing to determinacy of the un-tilted law from its
moments. The price is that the inequalities must hold for every positive
tilt as well as every order. Ordinary un-tilted cumulant Hankel tests
remain useful necessary checks; they are not interchangeable with (S.7).

For orientation, the first two nontrivial finite differences are

\[
A_{0,1}(s)=\mathbb E Y_s-s\operatorname{Var}(Y_s),
\tag{S.11}
\]

\[
A_{0,2}(s)=\mathbb E Y_s-2s\operatorname{Var}(Y_s)
+\tfrac12s^2\kappa_3(Y_s).
\tag{S.12}
\]

Neither expression has been proved nonnegative here for the target family.
They are proof obligations and potential exact falsification tests.

**[PROJECT CHECK]** For \(Y\sim\Gamma(b,r)\) in rate notation,
\(Y_s\sim\Gamma(b,r+s)\), so direct differentiation gives

\[
c_n(s)=\frac{b}{r+s}\left(\frac{s}{r+s}\right)^n,
\qquad
A_{n,k}(s)=\frac{b s^n r^k}{(r+s)^{n+k+1}}\ge0.
\tag{S.13}
\]

This verifies the powers of \(s\), the factorials, and the finite-difference
signs independently. It is a base-case check, not a power-closure proof.

## 5. A bounded attempt blueprint

1. Derive (S.9)--(S.12) in the unresolved two-rate \(q=3/2\) model.
   Keep the full beta/Dirichlet average before taking the quotient.
2. Seek an all-order formula
   \(A_{n,k}(s)=\int u^n(1-u)^k\nu_s(du)\) with a positive measure,
   or a positivity-preserving recursion that proves every \(n,k\).
3. Use a gamma input and its already known powers as normalization checks.
   Reconstruct \(U\) from a successful \(\nu_s\) using (S.4), retaining
   the drift term and excluding a rate-zero atom as in SOKAL-L2.
4. Convert a strictly negative value into an exact analytic or certified
   interval certificate. A floating-point sign is only a search signal.

**[CAUTION]** No finite collection of moments, derivative signs, positive
Hankel minors or finite differences proves this criterion. Checking a
finite grid of \(s\)-values is likewise insufficient. The theorem certifies
GGC only after its complete positivity requirements are established.
SOKAL-L1--L2 add an exact formulation; they do not establish new power
closure cases.
