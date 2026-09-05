# Prioritized proof program

**Update.**  Route 0 has now been completed negatively: `07-Jensen-obstruction-and-non-SD.md` proves, by a strict Jensen inequality and an exact logarithmic integral cancellation, that \(J_\alpha\) is not positive definite for \(1<\alpha<2\).  The other symmetric routes below are retained as an audit trail; the positive-law problems remain open where indicated.

No numerical sign check is a proof in this program.  Numerical work, if later used, should only locate candidate identities or counterexamples that are then proved analytically.

## Route 0 — reduce \(C_\alpha\in SD\) to one positive-definiteness test

Put

\[
\varphi_\alpha(t)=E[e^{itC_\alpha}],\qquad
q_\alpha(t)=-t\frac{\varphi_\alpha'(t)}{\varphi_\alpha(t)}.
\]

The background-driving criterion says that \(C_\alpha\) is SD iff the even extension of \(q_\alpha\) is continuous negative definite.  Fourier asymptotics give

\[
q_\alpha(t)=\alpha+1+\alpha D_\alpha t^{-\alpha}+o(t^{-\alpha}),
\qquad
D_\alpha=-2\cos\frac{\pi\alpha}{2}
\frac{\Gamma(2\alpha+1)}{\Gamma(\alpha+1)}>0.
\]

The differentiated expansion gives

\[
q_\alpha'(t)=-\alpha^2D_\alpha t^{-\alpha-1}
+o(t^{-\alpha-1})<0
\]

for sufficiently large \(t\).

Thus any background-driving law must be compound Poisson, and the exact target is

\[
\boxed{
J_\alpha(t)=1-\frac{q_\alpha(t)}{\alpha+1}
=1+\frac{t}{\alpha+1}\frac{\varphi_\alpha'(t)}{\varphi_\alpha(t)}
\text{ is positive definite.}}
\]

Equivalently, with \(f_\alpha(x)=c_\alpha/(1+|x|^\alpha)\), prove that

\[
g_\alpha(x)=\frac{c_\alpha\alpha}{\alpha+1}
\frac{1+2|x|^\alpha}{(1+|x|^\alpha)^2}
\]

has \(f_\alpha\) as an additive convolution factor.  Full details are in `06-C-alpha-SD-reduction.md`.

## Route A — positive SD through the Lévy spectral function

This is the most direct route for \(|C_\alpha|\) and \(|C_\alpha|^{-p}\).

For a positive variable \(X\), set

\[
L(\lambda)=E[e^{-\lambda X}],
\qquad
\psi(\lambda)=-\log L(\lambda).
\]

If the drift is zero, \(X\) is SD iff

\[
\psi'(\lambda)=\int_0^\infty e^{-\lambda x}k(x)\,dx
\]

for a nonnegative **decreasing** spectral function \(k\).  GGC would require the stronger property that \(k\) is completely monotone; this stronger possibility has already been ruled out for \(p<\alpha\).

If \(f\) is the density of \(X\), Laplace inversion gives the Volterra equation

\[
\boxed{
x f(x)=\int_0^x k(x-y)f(y)\,dy.
}
\]

Equivalently,

\[
\mathcal L k(\lambda)
=-\frac{L'(\lambda)}{L(\lambda)}.
\]

### Concrete tasks

1. Express \(L\) and \(-L'/L\) for
   \[
   f(x)\propto\frac{x^{b-1}}{1+x^q},
   \]
   with \((b,q)=(1,\alpha)\) for \(|C_\alpha|\) and \(((\alpha-1)/p,\alpha/p)\) for \(|C_\alpha|^{-p}\).
2. Obtain a contour/Stieltjes representation of \(-L'/L\) and invert it.
3. For \(|C_\alpha|\), ID is known, so positivity of the Lévy measure is already available; the missing target is monotonicity of \(k\).
4. For \(|C_\alpha|^{-p}\), \(0<p<\alpha\), first prove \(k\ge0\) (ID), then prove \(k'\le0\) (SD).  These are logically separate steps.

### Local check for \(|C_\alpha|\)

With the normalization suppressed, suppose that the spectral solution admits the following generalized power-series expansion near zero:

\[
f(x)=\frac1{1+x^\alpha}
=\sum_{n\ge0}(-1)^n x^{n\alpha},
\qquad
k(x)=\sum_{m\ge0}c_m x^{m\alpha}.
\]

Coefficient comparison in the Volterra equation gives

\[
\sum_{m+n=N}c_m(-1)^n
B(m\alpha+1,n\alpha+1)=(-1)^N.
\]

In particular,

\[
c_0=1,\qquad c_1=-\alpha,\qquad
c_2=\alpha\left[2-(2\alpha+1)B(\alpha+1,\alpha+1)\right].
\]

Thus any such locally expandable solution satisfies

\[
k(x)=1-\alpha x^\alpha+O(x^{2\alpha}),
\]

so it is decreasing near zero.  This is a conditional local check, not a proof of existence of the expansion and not a global SD proof.

## Route B — log-derivative / Bernstein criterion

The same route can be packaged without explicit inversion:

\[
X\in SD(\mathbb R_+)
\quad\Longleftrightarrow\quad
q(\lambda):=\lambda\psi'(\lambda)
\text{ is a Bernstein function},
\]

under the standard differentiability hypotheses.  Therefore one can try to prove directly that

\[
(-1)^{n-1}q^{(n)}(\lambda)\ge0,\qquad n\ge1.
\]

For GGC one would ask for \(\psi'\) to be a Stieltjes function.  The exact non-GGC result shows that this stronger Pick/Stieltjes route must fail when \(p<\alpha\), so it should not be used as the target criterion.

## Route C — the Cauchy-mixture bridge is obstructed

Wang and Yano–Yano–Yor give, for \(1<\alpha<2\),

\[
\varphi_{C_\alpha}(t)
=\int_0^\infty e^{-|t|y}\,m_\alpha(y)\,dy,
\]

where, after normalization,

\[
m_\alpha(y)\propto
\frac{y^\alpha}
{y^{2\alpha}+2\cos(\pi\alpha/2)y^\alpha+1}.
\]

Hence \(C_\alpha\) is a scale mixture of symmetric Cauchy laws.  Kelker's theorem gives ID for every such mixture, but not SD.

A sharper sufficient bridge would be available.  Let \(M_\alpha\) have density \(m_\alpha\).  If \(M_\alpha\) were positive SD and

\[
h(s)=-\log E[e^{-sM_\alpha}],
\]

then \(s h'(s)\) is Bernstein.  Since \(|t|\) is continuous negative definite, \(t\mapsto |t|h'(|t|)\) is a background-driving exponent.  It follows that \(C_\alpha\) is SD.  Thus:

\[
\boxed{M_\alpha\in SD(\mathbb R_+)\quad\Longrightarrow\quad C_\alpha\in SD(\mathbb R).}
\]

This sufficient condition is in fact impossible.  The same quantity

\[
q_\alpha(t)=t h'(t)
\]

would have to be a Bernstein function, hence nondecreasing.  Route 0 shows that it approaches \(\alpha+1\) from above and is eventually decreasing.  Therefore \(M_\alpha\notin SD\) for \(1<\alpha<2\).  The scale-mixture representation remains useful for integral formulas, but not through this SD closure argument.

## Route D — direct symmetric Lévy-density inversion

Let

\[
\Psi_\alpha(t)=-\log\varphi_{C_\alpha}(t),\qquad t>0.
\]

If the symmetric Lévy density is

\[
\nu(dx)=\frac{k_\alpha(|x|)}{|x|}\,dx,
\]

then formally (and rigorously after the usual regularization)

\[
\Psi_\alpha'(t)=2\int_0^\infty\sin(tx)k_\alpha(x)\,dx,
\qquad
k_\alpha(x)=\frac1\pi\int_0^\infty
\Psi_\alpha'(t)\sin(tx)\,dt.
\]

The SD target is \(k_\alpha\ge0\) and decreasing.  Wang's Linnik-density formula supplies a positive Laplace integral for \(\varphi_{C_\alpha}\), which is a promising starting point for controlling \(\Psi_\alpha'=-\varphi'/\varphi\).

## Route E — what Thorin/HCM can still contribute

The original beta-prime variable has an explicit Tricomi/Thorin representation.  It can be used to:

- derive Mellin and contour formulas before taking the fractional power;
- obtain exact asymptotics for \(L\) and the candidate \(k\);
- suggest a comparison principle between the root law's spectral function and the beta-prime spectral function.

It cannot by itself prove that the root is GGC: that statement is false.  The correct objective is the weaker monotonicity of \(k\), not complete monotonicity.

## Route priority

1. Prove or disprove positive definiteness of \(J_\alpha\), preferably through the explicit inverse cosine transform or the equivalent convolution factorization.
2. Use the Linnik stable-resolvent representation to control the logarithmic derivative in \(J_\alpha\).
3. Invert the symmetric Lévy spectral function directly; this is equivalent to identifying the compound-Poisson jump density.
4. Volterra/log-derivative analysis for \(|C_\alpha|\), then for inverse powers, separating ID from SD.
5. Use Thorin/HCM and the Cauchy mixture only for identities and asymptotics, not as closure arguments.
