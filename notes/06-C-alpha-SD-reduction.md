# A direct reduction of the symmetric SD problem

**Update.**  The positive-definiteness problem formulated here is resolved negatively by the new Jensen argument in `07-Jensen-obstruction-and-non-SD.md`: its inverse Fourier transform is negative at zero for every \(1<\alpha<2\).  The present note is retained to show the reduction that leads to that proof.

Fix \(1<\alpha<2\), and write

\[
f_\alpha(x)=\frac{c_\alpha}{1+|x|^\alpha},\qquad
\varphi_\alpha(t)=\widehat f_\alpha(t)>0,\qquad
\Psi_\alpha(t)=-\log\varphi_\alpha(t).
\]

The positivity of \(\varphi_\alpha\) follows from the Linnik-density/Laplace-mixture representation in Yano--Yano--Yor and Wang.

## 1. Background-driving exponent

Under the standard differentiability assumptions, a symmetric law with exponent \(\Psi\) is self-decomposable iff

\[
q(t)=t\Psi'(t),\qquad t>0,
\]

extended evenly to \(\mathbb R\), is continuous negative definite.  Here

\[
q_\alpha(t)=-t\frac{\varphi_\alpha'(t)}{\varphi_\alpha(t)}.
\]

Thus the original question is already a single explicit negative-definiteness problem.

## 2. Large-frequency asymptotics and a compound-Poisson reduction

Watson's Fourier asymptotics applied to

\[
(1+x^\alpha)^{-1}=1-x^\alpha+x^{2\alpha}-\cdots
\]

give

\[
\varphi_\alpha(t)
=A_\alpha t^{-\alpha-1}
\left(1+D_\alpha t^{-\alpha}+o(t^{-\alpha})\right),
\]

where

\[
A_\alpha=2c_\alpha\Gamma(\alpha+1)
\sin\frac{\pi\alpha}{2}>0
\]

and

\[
D_\alpha
=-2\cos\frac{\pi\alpha}{2}
\frac{\Gamma(2\alpha+1)}{\Gamma(\alpha+1)}>0.
\]

For verification, insert a smooth cutoff equal to one near zero.  The part away from zero has integrable derivatives of every order and is negligible after repeated integration by parts.  On the local part use the Abel-regularized identity

\[
\int_0^\infty x^\beta\cos(tx)\,dx
=-\Gamma(\beta+1)\sin\frac{\pi\beta}{2}\,
t^{-\beta-1}
\]

together with the first two nonconstant terms \(-x^\alpha+x^{2\alpha}\).  The same cutoff argument may be differentiated in \(t\), which justifies the differentiated expansion below.

Consequently,

\[
q_\alpha(t)=\alpha+1+\alpha D_\alpha t^{-\alpha}
+o(t^{-\alpha}).
\]

The differentiated Watson expansion also gives

\[
q_\alpha'(t)=-\alpha^2D_\alpha t^{-\alpha-1}
+o(t^{-\alpha-1})<0
\]

for all sufficiently large \(t\).

In particular, the candidate background-driving exponent is bounded and approaches \(\alpha+1\) from above.  A bounded continuous negative-definite function is a compound-Poisson exponent.  It follows that

\[
\boxed{
C_\alpha\in SD
\iff
J_\alpha(t):=1-\frac{q_\alpha(t)}{\alpha+1}
=1+\frac{t}{\alpha+1}
\frac{\varphi_\alpha'(t)}{\varphi_\alpha(t)}
\text{ is a characteristic function.}
}
\]

If this holds, the background-driving process is compound Poisson with intensity \(\alpha+1\), and \(J_\alpha\) is the characteristic function of one jump.  Notice that

\[
J_\alpha(t)
\sim-\frac{\alpha D_\alpha}{\alpha+1}t^{-\alpha}<0.
\]

Thus complete monotonicity of \(J_\alpha\) is impossible and is not the right target; a characteristic function may of course take negative values.

## 3. Equivalent convolution-factor problem

Multiplication by \(J_\alpha\) gives

\[
J_\alpha(t)\varphi_\alpha(t)
=\varphi_\alpha(t)+\frac{t}{\alpha+1}\varphi_\alpha'(t).
\]

The inverse Fourier transform of the right-hand side is the explicit probability density

\[
g_\alpha(x)
=f_\alpha(x)-\frac1{\alpha+1}(x f_\alpha(x))'
=\frac{c_\alpha\alpha}{\alpha+1}
\frac{1+2|x|^\alpha}{(1+|x|^\alpha)^2}.
\]

Hence

\[
\boxed{
C_\alpha\in SD
\iff
\text{there exists a probability law }\rho_\alpha
\text{ such that }g_\alpha=f_\alpha*\rho_\alpha.
}
\]

Equivalently, since \(J_\alpha\in L^1(\mathbb R)\), define

\[
r_\alpha(x)=\frac1\pi\int_0^\infty
J_\alpha(t)\cos(tx)\,dt.
\]

Then the entire SD question is whether \(r_\alpha(x)\ge0\) for every \(x\).  If so, \(r_\alpha\) is the density of \(\rho_\alpha\).

## 4. Linnik reformulation

Proposition 2.11 of Yano--Yano--Yor identifies \(\varphi_\alpha\), up to its normalizing constant, with the symmetric \(\alpha\)-Linnik density \(L_\alpha\).  Therefore

\[
J_\alpha(t)
=1+\frac{t}{\alpha+1}
\frac{L_\alpha'(t)}{L_\alpha(t)}.
\]

This suggests using the stable-resolvent representation of \(L_\alpha\), rather than trying to transfer self-decomposability through Fourier duality (which has no such closure theorem).

## 5. Obstruction to the simple scale-mixture bridge

The Cauchy-mixture representation has

\[
\varphi_\alpha(t)=E[e^{-|t|M_\alpha}],
\qquad
m_\alpha(y)\propto
\frac{y^\alpha}
{y^{2\alpha}+2\cos(\pi\alpha/2)y^\alpha+1}.
\]

If \(M_\alpha\) were positive SD, then

\[
q_\alpha(t)=t\Psi_\alpha'(t)
\]

would be a Bernstein function and hence nondecreasing.  The differentiated asymptotic formula above shows instead that \(q_\alpha\) is eventually decreasing to \(\alpha+1\).  Therefore

\[
\boxed{M_\alpha\notin SD,\qquad1<\alpha<2.}
\]

So this attractive sufficient route cannot establish the desired result.

## 6. Concrete proof and disproof targets

1. Prove \(J_\alpha\) positive definite by finding a positive integral representation for \(r_\alpha\).
2. Use the stable-resolvent or Wiener--Hopf representation of the Linnik density to control its logarithmic derivative.
3. For rational \(\alpha\), express \(L_\alpha\) by Meijer--G/Fox--H functions and invert \(J_\alpha\) exactly.  A proof on a dense set could extend by weak closure if uniform convergence is established.
4. In the opposite direction, disprove positive definiteness analytically.  Necessary conditions include \(|J_\alpha(t)|\le1\) and, for every \(t\),
   \[
   J_\alpha(2t)\ge2J_\alpha(t)^2-1.
   \]
5. Equivalently invert the symmetric Lévy spectral function
   \[
   k_\alpha(x)=\frac1\pi\int_0^\infty
   \Psi_\alpha'(t)\sin(tx)\,dt
   \]
   and prove or refute its monotonicity.  Under SD, \(-k_\alpha'\) is precisely the finite jump measure encoded by \(J_\alpha\).

No numerical sign check is used as proof in this reduction.

## References used in this note

- Z. J. Jurek and W. Vervaat (1983), *An integral representation for self-decomposable Banach space valued random variables*, Z. Wahrscheinlichkeitstheorie verw. Gebiete **62**, 247--262, DOI: 10.1007/BF00538800.  Source for the background-driving Lévy-process representation.
- K. Sato (1999), *Lévy Processes and Infinitely Divisible Distributions*, Cambridge University Press.  Source for the Lévy--Khintchine and self-decomposability criteria.
- K. Yano, Y. Yano and M. Yor (2009), Proposition 2.11, arXiv:0811.2046.  Source for the \(\alpha\)-Cauchy/\(\alpha\)-Linnik Fourier duality.
- M. Wang (2026), *Infinite divisibility of \(\alpha\)-Cauchy distributions*, arXiv:2512.23164v3.  Source for the current ID theorem and the positive mixture/factorization formulas.

The asymptotic calculation, the function \(J_\alpha\), the explicit density \(g_\alpha\), and the conclusion \(M_\alpha\notin SD\) are deductions made in this dossier from those inputs.
