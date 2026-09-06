# HCM, GGC, SD, ID: implications and power closure

All variables in the HCM/GGC discussion are positive.
The closure table separates classical inputs from the current project
assessment; source facts retain their original scope.
The beta-prime examples and their proofs now have a standalone home in
[beta-prime-power-boundary.md](beta-prime-power-boundary.md).

## 1. The hierarchy

\[
\boxed{\text{HCM density}}\Longrightarrow
\boxed{GGC}\Longrightarrow
\boxed{SD}\Longrightarrow
\boxed{ID}.
\]

The first box is a property of a **density**.  A different, easily confused theorem says

\[
X\in GGC\quad\Longleftrightarrow\quad
\lambda\mapsto E[e^{-\lambda X}]
\text{ is an HCM function}.
\]

These implications are strict.  In particular, the half-Cauchy law is SD but is neither GGC nor HCM.  Bosch–Simon also give inverse-beta powers that are SD but not GGC.

For a positive GGC law with Thorin measure \(U\),

\[
-\log E[e^{-\lambda X}]
=a\lambda+\int_{(0,\infty)}\log(1+\lambda/t)\,U(dt),
\]

and its Lévy density is

\[
\nu(x)=\frac{k(x)}x,
\qquad
k(x)=\int_{(0,\infty)}e^{-xt}\,U(dt).
\]

Thus \(k\) is completely monotone, hence decreasing, explaining \(GGC\subset SD\).

## 2. Closure table

| Operation | HCM density | GGC | SD | ID |
|---|---|---|---|---|
| multiply by a positive constant | yes | yes | yes | yes |
| convolution / independent sum | not a density-level closure used here | yes | yes | yes |
| independent product | yes | yes | no general closure | no general closure |
| independent quotient | yes | **do not assume in general** | no general closure | no general closure |
| \(X\mapsto X^q,\ q\ge1\) | yes for \(q\ge1\) | Conjecture 1 in Bondesson (2015); project proof/status: [ResearchStatus](../ResearchStatus.md) | no general theorem needed/known here | no general theorem needed/known here |
| \(X\mapsto X^q,\ 0<q<1\) | no | no | no | no |
| \(X\mapsto X^q,\ q\le-1\) | yes if \(X\) has HCM density | not for arbitrary GGC | no general closure | no general closure |

The HCM power statement is

\[
X\text{ HCM}\quad\Longrightarrow\quad X^q\text{ HCM for }|q|\ge1.
\]

Sjödin's 2026 article claims

\[
X\in GGC, q>1\quad\Longrightarrow\quad X^q\in GGC.
\]

The existing audit does not accept **that paper's proof** as valid; the
separate log-rate project proof and its verification limits are recorded
in [ResearchStatus](../ResearchStatus.md).
This distinction must not be shortened to a claim that the project still
records the power conjecture itself as an unproved obligation.
The desired implication also cannot be run backwards: from \(Y=X^q\in GGC\)
one cannot infer \(X=Y^{1/q}\in GGC\).  The retained [beta-prime boundary example, BP-2--BP-3](beta-prime-power-boundary.md#bp-2)
supplies a counterexample:

\[
|C_\alpha|^\alpha\in HCM\subset GGC,
\qquad
|C_\alpha|=(|C_\alpha|^\alpha)^{1/\alpha}\notin GGC
\quad(\alpha>1).
\]

Subunit powers fail even for very classical laws: if \(G\) is gamma and \(0<q<1\), then \(G^q\) has a superexponential tail and is not ID (the standard tail obstruction cited by Bosch from Sato, Theorem 26.1).  By contrast, negative gamma powers are a special positive result: \(G^{-q}\in GGC\) for every \(q>0\) (Bosch–Simon).

## 3. What the hierarchy does and does not settle

The statements below are consequences of [BP-1--BP-3](beta-prime-power-boundary.md#bp-1),
not calls to a separate SD manuscript or proof directory.

- \(|C_\alpha|^\alpha\) is beta-prime, hence HCM/GGC/SD/ID.
- Taking the \(1/\alpha\)-root crosses out of GGC; therefore Thorin/HCM closure alone cannot prove SD of \(|C_\alpha|\).
- For \(|C_\alpha|^{-p}\), the HCM/GGC route settles exactly \(p\ge\alpha\).
- Failure of HCM or GGC is **not** failure of SD: the half-Cauchy endpoint is the warning example.
- Folding \(X\mapsto|X|\) and independent sign symmetrization \(Y\mapsto\varepsilon Y\) are nonlinear distributional operations; there is no general implication between SD of \(C_\alpha\) and SD of \(|C_\alpha|\).

## 4. References for the closure statements

- Bondesson, *Generalized Gamma Convolutions and Related Classes of Distributions and Densities*, Theorems 3.1.1, 4.1.1, 4.1.4, 5.2.1, 5.4.1.
- Bosch, P. (2015), “HCM property and the half-Cauchy distribution,”
  *Probability and Mathematical Statistics* **35**(2), 191--200;
  [arXiv:1402.1059](https://arxiv.org/abs/1402.1059), introduction and
  Proposition 2.1. For the HCM quotient/power inputs used by BP-2, see
  also Bondesson (2015), Proposition 4, p. 1066.
- Bondesson (2015), DOI 10.1007/s10959-013-0523-y: independent-product closure of GGC.
- Sjödin (2026), claimed Theorem 1; not accepted as established after the
  audit in [ResearchStatus.md](../ResearchStatus.md).
- Yano–Yano–Yor (2009), Section 2.2: \(GGC\subset SD\subset ID\) and the Thorin/Lévy representation.

- Bosch, P.; Simon, T. (2015), “On the infinite divisibility of inverse
  Beta distributions,” *Bernoulli* **21**(4), 2552--2568,
  DOI 10.3150/14-BEJ654; [arXiv:1405.4176](https://arxiv.org/abs/1405.4176).
  This is the previously cited inverse-beta/negative-gamma source, not a
  general GGC quotient theorem.
- Diédhiou, A. (1998), “On the Self-Decomposability of the Half-Cauchy
  Distribution,” *Journal of Mathematical Analysis and Applications*
  **220**(1), 42--64, DOI 10.1006/jmaa.1997.5790.
  This is the separate SD endpoint input; it does not follow from folding
  an SD symmetric law.
- For the positive-law SD criterion, the OU/BDLP representation and their
  limits as GGC tools, see the migrated
  [Rocha-Arteaga--Sato source audit](rocha-arteaga-sato-2019-id-sd-levy-processes.md).
