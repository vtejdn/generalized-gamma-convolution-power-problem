# HCM, GGC, SD, ID: implications and power closure

All variables in the HCM/GGC discussion are positive.

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
| \(X\mapsto X^q,\ q\ge1\) | yes for \(q\ge1\) | yes: Sjödin (2026) for \(q>1\) | no general theorem needed/known here | no general theorem needed/known here |
| \(X\mapsto X^q,\ 0<q<1\) | no | no | no | no |
| \(X\mapsto X^q,\ q\le-1\) | yes if \(X\) has HCM density | not for arbitrary GGC | no general closure | no general closure |

The HCM power statement is

\[
X\text{ HCM}\quad\Longrightarrow\quad X^q\text{ HCM for }|q|\ge1.
\]

Sjödin's 2026 theorem is

\[
X\in GGC, q>1\quad\Longrightarrow\quad X^q\in GGC.
\]

It cannot be run backwards: from \(Y=X^q\in GGC\) one cannot infer \(X=Y^{1/q}\in GGC\).  The present problem supplies an explicit counterexample:

\[
|C_\alpha|^\alpha\in HCM\subset GGC,
\qquad
|C_\alpha|=(|C_\alpha|^\alpha)^{1/\alpha}\notin GGC
\quad(\alpha>1).
\]

Subunit powers fail even for very classical laws: if \(G\) is gamma and \(0<q<1\), then \(G^q\) has a superexponential tail and is not ID (the standard tail obstruction cited by Bosch from Sato, Theorem 26.1).  By contrast, negative gamma powers are a special positive result: \(G^{-q}\in GGC\) for every \(q>0\) (Bosch–Simon).

## 3. What the hierarchy does and does not settle here

- \(|C_\alpha|^\alpha\) is beta-prime, hence HCM/GGC/SD/ID.
- Taking the \(1/\alpha\)-root crosses out of GGC; therefore Thorin/HCM closure alone cannot prove SD of \(|C_\alpha|\).
- For \(|C_\alpha|^{-p}\), the HCM/GGC route settles exactly \(p\ge\alpha\).
- Failure of HCM or GGC is **not** failure of SD: the half-Cauchy endpoint is the warning example.
- Folding \(X\mapsto|X|\) and independent sign symmetrization \(Y\mapsto\varepsilon Y\) are nonlinear distributional operations; there is no general implication between SD of \(C_\alpha\) and SD of \(|C_\alpha|\).

## 4. References for the closure statements

- Bondesson, *Generalized Gamma Convolutions and Related Classes of Distributions and Densities*, Theorems 3.1.1, 4.1.1, 4.1.4, 5.2.1, 5.4.1.
- Bosch (2015), introduction and Proposition 2.1: HCM product/quotient and \(|q|\ge1\) power closure.
- Bondesson (2015), DOI 10.1007/s10959-013-0523-y: independent-product closure of GGC.
- Sjödin (2026), Theorem 1: \(q>1\) power closure of GGC.
- Yano–Yano–Yor (2009), Section 2.2: \(GGC\subset SD\subset ID\) and the Thorin/Lévy representation.
