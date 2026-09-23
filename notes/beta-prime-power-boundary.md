# Beta-prime power boundary

Migrated into the GGC project on **2026-09-06** from the SD dossier's
beta-prime reduction and records K1--K3 / N1--N3.
These are retained literature inputs and project deductions, not new
results of this migration and not lemmas used by the log-rate power proof.

Throughout, \(\alpha>1\) and \(p>0\).
All gamma variables in a ratio below are independent and have unit rate;
\(B'_{a,b}=G_a/G_b\) denotes the beta-prime convention used here.

Let

\[
h_\alpha(x)=\frac{\alpha\sin(\pi/\alpha)}{\pi}\frac1{1+x^\alpha},
\qquad x>0,
\]

be the density of \(|C_\alpha|\), and put \(\gamma=1/\alpha\).

<a id="bp-1"></a>
## 1. Exact distributional identities [BP-1]

**[LITERATURE]** Yano–Yano–Yor (2009), Section 2.2,
equations (2.20)--(2.21), give

\[
|C_\alpha|^\alpha
\overset d=\frac{\Gamma_\gamma}{\widehat\Gamma_{1-\gamma}}
=B'_{\gamma,1-\gamma}.
\]

Consequently, for \(p>0\),

\[
|C_\alpha|^p
\overset d=(B'_{\gamma,1-\gamma})^{p/\alpha},
\qquad
|C_\alpha|^{-p}
\overset d=(B'_{1-\gamma,\gamma})^{p/\alpha}.
\]

The second identity uses \((B'_{a,b})^{-1}\overset d=B'_{b,a}\).  In Bosch–Simon's notation these are GB2 variables

\[
(B_{a,b}^{-1}-1)^s\overset d=(\Gamma_b/\Gamma_a)^s
\]

with \(s=p/\alpha\).  The SD problem is therefore precisely a GB2 **fractional-power** problem when \(p<\alpha\).

**[DERIVED; legacy N1]** There is also a conjugate-parameter duality.
Direct change of variables gives

\[
\boxed{
|C_\alpha|^{-p}
\overset d=
|C_{\alpha/(\alpha-1)}|^{p/(\alpha-1)}
}
\qquad(\alpha>1,p>0).
\]

For \(1<\alpha<2\), the conjugate index \(\alpha/(\alpha-1)\) is larger than two.  In particular,

\[
|C_\alpha|^{-(\alpha-1)}\overset d=
|C_{\alpha/(\alpha-1)}|.
\]

This explains why the negative-power problem below index two is linked to positive powers above index two.

## 2. Densities of the powers

Up to the displayed normalizing constant,

\[
f_{\alpha,p}^{+}(x)
=\frac{\alpha\sin(\pi/\alpha)}{\pi p}
\frac{x^{1/p-1}}{1+x^{\alpha/p}},
\]

and

\[
f_{\alpha,p}^{-}(x)
=\frac{\alpha\sin(\pi/\alpha)}{\pi p}
\frac{x^{(\alpha-1)/p-1}}{1+x^{\alpha/p}}.
\]

These two elementary formulas are the most economical starting point for a Laplace or spectral-function analysis.

<a id="bp-2"></a>
## 3. Exact HCM/GGC classification on this line [BP-2]

### Known HCM part

**[LITERATURE INPUT + DERIVED SPECIALIZATION]** Gamma densities are HCM:
for fixed \(u>0\), their hyperbolic product is proportional to
\(\exp\{-u(v+v^{-1})\}\). The independent-quotient and power closures
in Bondesson (2015), Proposition 4, p. 1066, therefore give HCM densities
for \(p\ge\alpha\). The necessity below follows from the GGC obstruction
and \(HCM_{\rm dens}\subset GGC\), so the full conclusion on this line is

\[
|C_\alpha|^{\pm p}\text{ is HCM}
\quad\Longleftrightarrow\quad p\ge\alpha.
\]

### Retained project deduction: the same threshold is necessary for GGC

**[DERIVED; legacy N2]** The external inputs are Bondesson (1992),
Theorem 4.1.4 (printed pp. 51--52) and Theorem 4.1.1 (printed pp. 49--50),
with the hypotheses recorded in the
[monograph audit](bondesson-1992-ggc-hcm-foundational-infrastructure.md#4-finite-thorin-mass-and-gamma-mixtures).

Suppose one of the displayed positive densities is GGC. Its left extremity
is zero and it is nondegenerate. If \(f(x)\sim c x^{b-1}\), \(c>0\), then
\(f(x)/x^{r-1}\to0\) exactly for \(r<b\).
Theorem 4.1.4 thus identifies its total Thorin mass as the finite number
\(b\); finiteness is a consequence, not an extra assumption.
Theorem 4.1.1 then gives

\[
f(x)=\frac{x^{b-1}}{\Gamma(b)}
E\!\left[Y^{-b}e^{-x/Y}\right]
\]

for some positive \(Y\).  Therefore \(x^{1-b}f(x)\) must be completely monotone.

For \(f_{\alpha,p}^{+}\), its behavior at zero gives Thorin mass \(b=1/p\); for \(f_{\alpha,p}^{-}\), it gives \(b=(\alpha-1)/p\).  In both cases

\[
x^{1-b}f_{\alpha,p}^{\pm}(x)
\propto\frac1{1+x^{\alpha/p}}.
\]

For \(q>1\), complete monotonicity of \((1+x^q)^{-1}\) already fails by

\[
\frac{d^2}{dx^2}\frac1{1+x^q}
=\frac{q x^{q-2}\big((q+1)x^q-(q-1)\big)}{(1+x^q)^3}<0
\quad\text{for all sufficiently small }x>0,
\]

which contradicts complete monotonicity.  Taking \(q=\alpha/p\) yields the exact result

\[
\boxed{
|C_\alpha|^{p}\in GGC
\iff
|C_\alpha|^{-p}\in GGC
\iff p\ge\alpha.
}
\]

Combining this with the known HCM result,

\[
\boxed{
|C_\alpha|^{\pm p}\in HCM
\iff
|C_\alpha|^{\pm p}\in GGC
\iff p\ge\alpha.
}
\]

The necessity argument is retained as a **project deduction from Bondesson's
published theorems**, not attributed to the monograph as its own stated
classification. No priority or new independent-audit claim is made here.
The gamma-mixture theorem is used only in the necessary direction;
arbitrary gamma mixtures are not being declared GGC.

<a id="bp-3"></a>
## 4. Consequences and the subunit-power boundary [BP-3]

1. Since \(1<\alpha<2\), \(|C_\alpha|\notin GGC\).  A proof of its SD property cannot be a proof that it remains GGC after the \(1/\alpha\)-root.
2. For negative powers, \(p\ge\alpha\) gives SD through HCM/GGC. For
   \(0<p<\alpha\), the non-GGC conclusion does not decide SD. The old
   dossier's remaining SD questions are not active goals of this note.
3. The GGC project's \(q\ge1\) theorem cannot be run backwards to infer
   root closure. Its own argument and the separate audit of the 2026
   external claim are distinguished in [ResearchStatus](../ResearchStatus.md).
   Neither is an input to the classification above.
4. The beta-prime Thorin measure is still useful as input data, but there is no valid rule transporting it through a subunit power.

## 5. Source map and limits of the example

- Yano, K.; Yano, Y.; Yor, M. (2009), “On the laws of first hitting times
  of points for one-dimensional symmetric stable Lévy processes,”
  *Séminaire de Probabilités XLII*, Lecture Notes in Mathematics **1979**,
  187--227, DOI 10.1007/978-3-642-01763-6_8; Section 2.2,
  equations (2.20)--(2.21).
  [Local primary PDF](../literature/Yano-Yano-Yor-2009-stable-hitting-times.pdf).
- Bondesson, L. (1992), *Generalized Gamma Convolutions and Related Classes
  of Distributions and Densities*, Lecture Notes in Statistics **76**,
  DOI 10.1007/978-1-4612-2948-3.
  Theorems 4.1.1 and 4.1.4 at the pages specified in BP-2;
  [local primary book](../literature/Bondesson.pdf).
- Bondesson, L. (2015), “A Class of Probability Distributions that is Closed
  with Respect to Addition as Well as Multiplication of Independent Random
  Variables,” *Journal of Theoretical Probability* **28**, 1063--1081,
  DOI 10.1007/s10959-013-0523-y.
  Proposition 2, p. 1066 (HCM density implies GGC), and Proposition 4,
  p. 1066 (HCM quotient and power closure);
  [local primary article](../literature/Bondesson2015.pdf).

Additional retained bibliographic lead, not an input to the proof above:
Ferreira, R. A. C.; Simon, T. (2023), “Convolution of beta prime distribution,”
*Transactions of the American Mathematical Society* **376**(2), 855--890,
DOI 10.1090/tran/8748, arXiv:2108.09244. The earlier dossier cited this for
beta-prime spectral/Tricomi representations; no formula from that paper is
newly imported or certified by this migration.

BP-1 retains the gamma-ratio identity and reciprocal duality; BP-2 retains
the exact threshold; BP-3 retains the root-closure counterexample
(legacy N3). The symmetric SD theorem, its Jensen--Fourier proof,
hitting-time corollary and SD-specific open questions remain historical
records rather than dependencies of this note.

Failure of GGC does not imply failure of SD. Folding a symmetric law or
adding an independent sign also supplies no automatic SD implication.
