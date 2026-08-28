# Beta-prime and GB2 reduction

Let

\[
h_\alpha(x)=\frac{\alpha\sin(\pi/\alpha)}{\pi}\frac1{1+x^\alpha},
\qquad x>0,
\]

be the density of \(|C_\alpha|\), and put \(\gamma=1/\alpha\).

## 1. Exact distributional identities

Yano–Yano–Yor give

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

There is also a useful conjugate-parameter duality.  Direct change of variables gives

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

## 3. Exact HCM/GGC classification on this line

### Known HCM part

Bosch–Simon prove that a GB2 density of \((\Gamma_b/\Gamma_a)^s\) is HCM iff \(s\ge1\).  Hence

\[
|C_\alpha|^{\pm p}\text{ is HCM}
\quad\Longleftrightarrow\quad p\ge\alpha.
\]

### New deduction: the same threshold is necessary for GGC

Suppose a positive GGC density \(f\) has finite Thorin mass \(b\).  Bondesson's finite-Thorin-mass representation implies

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

The function \((1+x^q)^{-1}\) is completely monotone iff \(0<q\le1\).  Sufficiency follows because \(x^q\) is a Bernstein function for \(q\le1\); necessity for \(q>1\) follows already from

\[
\frac{d^2}{dx^2}\frac1{1+x^q}<0
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

This argument appears not to be stated in the cited sources for this parameter line; it is therefore labeled a **new deduction from Bondesson's published finite-Thorin-mass theorem**, not a literature theorem.

## 4. Consequences for the research problem

1. Since \(1<\alpha<2\), \(|C_\alpha|\notin GGC\).  A proof of its SD property cannot be a proof that it remains GGC after the \(1/\alpha\)-root.
2. For negative powers, \(p\ge\alpha\) is completely settled by HCM/GGC.  The genuine unknown zone is \(0<p<\alpha\), where neither HCM nor GGC can hold.
3. Sjödin's \(q>1\) power theorem is consistent with, but cannot reverse, this classification.
4. The beta-prime Thorin measure is still useful as input data, but there is no valid rule transporting it through a subunit power.
