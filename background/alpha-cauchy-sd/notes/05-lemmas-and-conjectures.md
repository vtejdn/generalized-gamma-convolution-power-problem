# Lemma and conjecture ledger

Labels `K` record statements appearing in the literature, with their audit status stated explicitly; K1--K4 are accepted literature results, whereas K5 is a published claim that this project does not accept as proved.  Labels `N` are deductions made in this dossier from cited results.  Labels `C` are unresolved conjectures/questions.  This separation is intentional.

## Known literature

### K1 — gamma-ratio representation (Yano–Yano–Yor, 2009)

For \(\alpha>1\), \(\gamma=1/\alpha\),

\[
C_\alpha\overset d=\varepsilon
\left(\frac{\Gamma_\gamma}{\widehat\Gamma_{1-\gamma}}\right)^\gamma,
\qquad
|C_\alpha|^\alpha\overset d=B'_{\gamma,1-\gamma}.
\]

### K2 — beta-prime structure (Bondesson; Ismail–Kelker; Ferreira–Simon)

For all \(a,b>0\), \(B'_{a,b}\) has an HCM density and is GGC, hence SD and ID.  Its Laplace transform is proportional to \(\Psi(a,1-b,z)\), and its Lévy spectral function has an explicit Stieltjes/Tricomi representation.

### K3 — GB2 HCM threshold (Bosch–Simon, 2015)

For \(a,b,s>0\), \((\Gamma_b/\Gamma_a)^s\) has an HCM density iff \(s\ge1\).

### K4 — known ID/SD boundary facts

- \(|C_\alpha|\in ID\) for \(1<\alpha\le2\) (Bondesson, 1987; Yano–Yano–Yor, Theorem 2.7).
- \(|C_2|\in SD\) (Diédhiou, 1998).
- \(C_\alpha\in ID\iff1<\alpha\le2\) (Wang, current v3/ECP proof, 2026).

### K5 — claimed GGC power closure (Sjödin, 2026; under audit)

Sjödin (2026) claims that if \(X\in GGC\) and \(q>1\), then \(X^q\in GGC\).  The present project does **not** accept this claim as established: its audit finds that Lemma 2 is false as stated and that the subsequent \(\Delta<0\) substitution and parameter-dependent induction leave a proof gap.  Thus K5 records a claimed theorem under audit, not a theorem available for downstream deductions.  See the [current GGC status record](../../../ResearchStatus.md).

## New deductions

### N1 — conjugate-index power duality

For every \(\alpha>1\) and \(p>0\),

\[
|C_\alpha|^{-p}
\overset d=
|C_{\alpha/(\alpha-1)}|^{p/(\alpha-1)}.
\]

**Verification.** Both sides have the density

\[
\frac{\alpha\sin(\pi/\alpha)}{\pi p}
\frac{x^{(\alpha-1)/p-1}}{1+x^{\alpha/p}},\qquad x>0.
\]

### N2 — exact HCM/GGC threshold for the relevant powers

For \(\alpha>1,p>0\),

\[
|C_\alpha|^{\pm p}\in HCM
\iff
|C_\alpha|^{\pm p}\in GGC
\iff p\ge\alpha.
\]

**Verification.** HCM is K3 with \(s=p/\alpha\).  For GGC necessity, finite Thorin mass forces \(x^{1-b}f(x)\) to be CM.  For both signs this function is proportional to \((1+x^{\alpha/p})^{-1}\), which is CM iff \(p\ge\alpha\).  HCM gives sufficiency.

### N3 — beta-prime root is a concrete failure of GGC root closure

For \(\alpha>1\),

\[
|C_\alpha|^\alpha\in GGC,
\qquad
(|C_\alpha|^\alpha)^{1/\alpha}=|C_\alpha|\notin GGC.
\]

This explains exactly why neither the classical beta-prime theorem nor Sjödin's claimed \(q>1\) theorem resolves the SD problem.  The operation here has exponent \(1/\alpha<1\); moreover, the project audit found a proof gap in the claimed theorem, so it is neither accepted nor used here.  See the [current GGC status record](../../../ResearchStatus.md).

### N4 — Volterra characterization for the positive targets

Let \(X\) have density \(f\), zero drift, and Laplace transform \(L\).  If

\[
\mathcal L k=-L'/L,
\]

then \(X\) is SD iff \(k\) is nonnegative and decreasing, equivalently

\[
xf(x)=(f*k)(x).
\]

This is a direct restatement of the positive SD Lévy representation, included as the main verification mechanism rather than a new theorem of probability theory.

### N5 — local spectral coefficients for \(|C_\alpha|\)

If the spectral solution is expanded near zero as \(k(x)=\sum c_mx^{m\alpha}\), then

\[
c_0=1,\qquad c_1=-\alpha,\qquad
c_2=\alpha\left[2-(2\alpha+1)B(\alpha+1,\alpha+1)\right].
\]

Hence it has no local monotonicity obstruction at zero.  This is a local expansion, not an SD proof.

### N6 — a sufficient Cauchy-mixture bridge

Let \(M_\alpha\) have normalized density

\[
m_\alpha(y)\propto
\frac{y^\alpha}{y^{2\alpha}+2\cos(\pi\alpha/2)y^\alpha+1}.
\]

Then \(\varphi_{C_\alpha}(t)=E[e^{-|t|M_\alpha}]\).  If \(M_\alpha\) is positive SD, then \(C_\alpha\) is SD.  This follows from the background-driving criterion and composition of Bernstein functions with \(|t|\).

### N7 — exact compound-Poisson reduction for \(C_\alpha\)

Let

\[
q_\alpha(t)=-t\frac{\varphi_\alpha'(t)}{\varphi_\alpha(t)}.
\]

Fourier asymptotics yield

\[
q_\alpha(t)=\alpha+1+\alpha D_\alpha t^{-\alpha}+o(t^{-\alpha}),
\qquad
D_\alpha=-2\cos\frac{\pi\alpha}{2}
\frac{\Gamma(2\alpha+1)}{\Gamma(\alpha+1)}>0.
\]

Hence \(q_\alpha\) is bounded.  The background-driving criterion and the representation of bounded negative-definite functions as compound-Poisson exponents give

\[
C_\alpha\in SD
\iff
J_\alpha(t)=1-\frac{q_\alpha(t)}{\alpha+1}
\text{ is a characteristic function}.
\]

If true, the background-driving process has jump intensity \(\alpha+1\).  This is a new reduction, not a claim that \(J_\alpha\) has already been proved positive definite.

### N8 — equivalent explicit convolution factorization

Let

\[
f_\alpha(x)=\frac{c_\alpha}{1+|x|^\alpha},\qquad
g_\alpha(x)=\frac{c_\alpha\alpha}{\alpha+1}
\frac{1+2|x|^\alpha}{(1+|x|^\alpha)^2}.
\]

Then \(g_\alpha\) is a probability density and

\[
C_\alpha\in SD
\iff
g_\alpha=f_\alpha*\rho_\alpha
\]

for some probability law \(\rho_\alpha\).  Indeed, \(\widehat g_\alpha=J_\alpha\widehat f_\alpha\).  This is the physical-space form of N7.

### N9 — the auxiliary mixing law is not SD

If \(M_\alpha\) in N6 were positive SD, then \(q_\alpha(t)=t[-\log E(e^{-tM_\alpha})]'\) would be a Bernstein function and hence nondecreasing.  N7 shows that

\[
q_\alpha(t)=\alpha+1+\alpha D_\alpha t^{-\alpha}+o(t^{-\alpha}),
\]

and the differentiated expansion gives

\[
q_\alpha'(t)=-\alpha^2D_\alpha t^{-\alpha-1}
+o(t^{-\alpha-1})<0.
\]

Thus it is eventually decreasing.  Therefore

\[
M_\alpha\notin SD,\qquad1<\alpha<2.
\]

### N10 — Jensen obstruction for the symmetric law

Let

\[
H_\alpha(y)=
\frac1{1+2\cos(\pi\alpha/2)y^\alpha+y^{2\alpha}},
\qquad
Z\sim\Gamma_{\alpha+1},
\]

and normalize

\[
F_\alpha(t)
=\frac{t^{\alpha+1}\varphi_\alpha(t)}{A_\alpha}
=E[H_\alpha(Z/t)].
\]

Then

\[
J_\alpha(t)=\frac{t}{\alpha+1}
(\log F_\alpha(t))'
\]

and

\[
\int_0^\infty J_\alpha(t)\,dt
=-\frac1{\alpha+1}
\int_0^\infty\log F_\alpha(t)\,dt<0.
\]

The strict sign follows from Jensen's inequality and the exact identity

\[
\int_0^\infty
\frac{\log H_\alpha(y)}{y^2}\,dy=0.
\]

Consequently \(J_\alpha\) is not positive definite, because its inverse Fourier transform is negative at zero.  Hence the new proposed theorem is

\[
C_\alpha\notin SD,\qquad1<\alpha<2.
\]

The complete proof and all integrability checks are in `07-Jensen-obstruction-and-non-SD.md`.  This is a new dossier result, not a literature theorem.

## Former open questions and remaining questions

### C1 — symmetric \(\alpha\)-Cauchy SD (resolved in this dossier)

\[
C_\alpha\notin SD,\qquad1<\alpha<2.
\]

Literature status: ID is true and SD was open in the sources located.  New dossier status: N10 gives an analytic disproof of SD for every \(1<\alpha<2\), subject to independent checking before publication.

### C2 — half \(\alpha\)-Cauchy SD

\[
|C_\alpha|\stackrel?\in SD,\qquad1<\alpha<2.
\]

Known now: it is ID and is not GGC.  A positive resolution would put the entire family in \(SD\setminus GGC\).

### C3 — inverse powers

\[
|C_\alpha|^{-p}\stackrel?\in SD,\qquad1<\alpha<2,\quad0<p<\alpha.
\]

The range \(p\ge\alpha\) is already SD through HCM/GGC.  In the displayed range the law is not GGC, and even ID is not settled by the reliable current sources located here.

### C4 — jump-law positivity (resolved negatively)

\[
J_\alpha(t)=1+\frac{t}{\alpha+1}
\frac{\varphi_\alpha'(t)}{\varphi_\alpha(t)}
\notin PD,\qquad1<\alpha<2.
\]

By N7 this is equivalent to C1.  N10 proves that the inverse cosine transform is negative at zero.
