# Route 4: averaged HCM and spectral inversion

The averaged HCM identity and its Sonine--Bessel, Bernstein, cut-plane, and Kontorovich--Lebedev inversions.

Entries: WIP-4.1, WIP-4.2, WIP-4.3, WIP-4.4, WIP-4.5, WIP-4.6.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

Original WIP identifiers and equation numbers are preserved. Positional words such as "above" and "below" refer to the original numbered proof sequence.


## Route 4: final averaged HCM

<a id="wip-4-1"></a>
### WIP-4.1 — the valid averaged identity

**Status: [PROVED REDUCTION].**

Let \(Y_1,Y_2\) be independent copies of \(Y=X^q\). For \(t>0\), put
\(w=t+t^{-1}\). Exchangeability gives

\[
\begin{aligned}
\psi_q(st)\psi_q(s/t)
&=
\frac12\mathbb E\left[
e^{-s(tY_1+t^{-1}Y_2)}
+e^{-s(tY_2+t^{-1}Y_1)}
\right]\\
&=
\mathbb E\left[
e^{-\frac s2(Y_1+Y_2)w}
\cosh\left(
\frac s2(Y_1-Y_2)\sqrt{w^2-4}
\right)
\right].
\end{aligned}
\tag{4.1}
\]

The GGC target is that (4.1) be completely monotone in \(w\) for every
\(s>0\). The fixed-\((Y_1,Y_2)\) integrand need not be completely monotone;
only the final expectation is relevant. This is the precise point at which
the route differs from the refuted pointwise-inner-kernel argument in the
audited 2026 paper.

<a id="wip-4-2"></a>
### WIP-4.2 — Sonine--Bessel inverse of a fixed fibre

**Status: [PROVED].**

Let \(\alpha\ge\beta\ge0\).  The fixed-fibre function

\[
F_{\alpha,\beta}(w)
:=e^{-\alpha w}\cosh\!\left(\beta\sqrt{w^2-4}\right)
\]

is the Laplace transform, for \(w>2\), of the finite signed measure

\[
\boxed{
\begin{aligned}
\mu_{\alpha,\beta}(d\lambda)
={}&\frac12\delta_{\alpha-\beta}(d\lambda)
   +\frac12\delta_{\alpha+\beta}(d\lambda)\\
&-\beta\mathbf 1_{\{|\lambda-\alpha|<\beta\}}
 \frac{J_1\!\left(2\sqrt{\beta^2-(\lambda-\alpha)^2}\right)}
 {\sqrt{\beta^2-(\lambda-\alpha)^2}}\,d\lambda .
\end{aligned}}
\tag{4.2}
\]

Indeed, the Sonine identity

\[
\int_{-\beta}^{\beta}e^{-wx}
J_0\!\left(2\sqrt{\beta^2-x^2}\right)\,dx
=\frac{2\sinh\!\left(\beta\sqrt{w^2-4}\right)}
{\sqrt{w^2-4}}
\tag{4.3}
\]

holds first for real \(w>2\), either by the angular integral for \(J_0\)
and a spherical integration, or by equality of the two entire power
series in \(\beta\).  Differentiate (4.3) with respect to \(\beta\).  The
two moving endpoints give \(2\cosh(\beta w)\), while \(J_0'=-J_1\) gives

\[
\cosh\!\left(\beta\sqrt{w^2-4}\right)
=\cosh(\beta w)
-\beta\int_{-\beta}^{\beta}e^{-wx}
 \frac{J_1(2\sqrt{\beta^2-x^2})}{\sqrt{\beta^2-x^2}}\,dx.
\tag{4.4}
\]

Multiplication by \(e^{-\alpha w}\) and the translation
\(\lambda=\alpha+x\) prove (4.2).  Finiteness is not implicit: the
Poisson representation of \(J_1\) gives

\[
\frac{2J_1(r)}r
=\frac2\pi\int_{-1}^{1}e^{irt}\sqrt{1-t^2}\,dt,
\qquad
\left|\frac{2J_1(r)}r\right|\le1,
\tag{4.5}
\]

so the total variation of the continuous part of (4.2) is at most
\(2\beta^2\).

This formula also gives a rigorous no-go result.  If \(\beta>0\), the
continuous density in (4.2) tends to \(-\beta\) from inside each endpoint,
because \(J_1(2r)/r\to1\) as \(r\downarrow0\).  Uniqueness of the Laplace
transform of finite signed measures therefore implies that a non-diagonal
fixed fibre is not completely monotone.  Any positivity in (4.1) must be
created by the complete \((Y_1,Y_2)\)-average; it cannot be proved
fibrewise.

<a id="wip-4-3"></a>
### WIP-4.3 — the fully averaged Bernstein inverse

**Status: [PROVED REDUCTION].**

Suppose that \(Y\) has a density \(f\) and \(\mathbb E[Y^2]<\infty\).
For fixed \(s>0\), set

\[
H_s(w):=\psi_Y(st)\psi_Y(s/t),
\qquad w=t+t^{-1},
\]

and, conditionally on \((Y_1,Y_2)\), put

\[
\alpha=\frac{s}{2}(Y_1+Y_2),
\qquad
\beta=\frac{s}{2}|Y_1-Y_2|.
\]

Averaging (4.2) is justified in total variation by (4.5) and
\(\mathbb E[\beta^2]<\infty\).  The two endpoint atoms average to the law
of \(sY\).  On the ordered region \(x<z<y\), one has

\[
\beta^2-(sz-\alpha)^2=s^2(z-x)(y-z).
\]

It follows that

\[
H_s(w)=\int_0^\infty e^{-w\lambda}\rho_s(\lambda)\,d\lambda,
\tag{4.6}
\]

where, for almost every \(z>0\),

\[
\boxed{
\begin{aligned}
\rho_s(sz)
={}&\frac{f(z)}s\\
&-\int_0^z\int_z^\infty
f(x)f(y)\frac{y-x}{\sqrt{(z-x)(y-z)}}\\
&\hspace{27mm}\times
J_1\!\left(2s\sqrt{(z-x)(y-z)}\right)\,dy\,dx .
\end{aligned}}
\tag{4.7}
\]

There is no hidden pointwise-positivity claim in (4.7).  Applying
Bernstein's theorem to \(q\mapsto H_s(2+q)\), and then uniqueness of the
Laplace transform of finite measures, yields the exact criterion

\[
\boxed{
H_s\text{ is completely monotone on }(2,\infty)
\quad\Longleftrightarrow\quad
\rho_s(\lambda)\ge0\quad\text{for a.e. }\lambda>0.
}
\tag{4.8}
\]

For the benchmark of WIP-2.1 the density is smooth, so the formula has its
pointwise continuous interpretation, and

\[
f_\theta(z)
=\frac{e^{-\cosh\theta\sqrt z}
I_0(\sinh\theta\sqrt z)}{2\sqrt z}.
\]

Thus the Route-4 target has become a completely explicit
\(I_0\)-\(J_1\) double-integral inequality: prove that the right-hand
side of (4.7) is nonnegative for every \(s,z>0\).  The oscillation of
\(J_1\), together with the negative fixed-fibre density in WIP-4.2,
explains why neither Tonelli nor pointwise Bessel positivity can close it.

<a id="wip-4-4"></a>
### WIP-4.4 — cut-plane spectral inverse and the Route-2 interface

**Status: [PROVED].**

From this point through WIP-4.6, \(Y\) is the benchmark variable with
density (2.3); the notation \(A_\theta,B_\theta\) refers to its boundary
values (2.12)--(2.13).

On the branch characterized by \(\Delta(w)\sim w\) at infinity, define

\[
\Delta(w)=\sqrt{w^2-4},
\qquad
\tau(w)=\frac{w+\Delta(w)}2.
\]

The symmetry under \(\tau\leftrightarrow\tau^{-1}\) makes

\[
H_s(w)=\psi_Y(s\tau(w))\psi_Y(s/\tau(w))
\]

single-valued and analytic on \(\mathbb C\setminus(-\infty,-2]\).  Write
the already computed boundary values as

\[
\psi_Y(-x+i0)=A_\theta(x)-iB_\theta(x).
\]

A keyhole contour gives the signed Stieltjes representation

\[
\boxed{
H_s(w)=\int_2^\infty\frac{\Sigma_{s,\theta}(v)}{w+v}\,dv .
}
\tag{4.9}
\]

If \(v=2\cosh r\) and \(z_\pm=se^{\pm r}\), then the upper bank satisfies
\(\tau(-v+i0)=-e^r+i0\) and \(\tau^{-1}=-e^{-r}-i0\).  Hence

\[
\boxed{
\Sigma_{s,\theta}(2\cosh r)
=\frac{A_\theta(z_-)B_\theta(z_+)
-B_\theta(z_-)A_\theta(z_+)}{\pi}.
}
\tag{4.10}
\]

Here are the details excluding hidden contour terms.  The
\(\tau\leftrightarrow\tau^{-1}\) symmetry makes the apparent branch point
at \(w=2\) removable.  Since the mixing density \(m_\theta\) in (2.6) is
continuous, \(\psi_Y\) has no isolated pole on its negative-axis cut; also
\(H_s(-2)=|\psi_Y(-s+i0)|^2<\infty\), so there is no atom at the endpoint
\(v=2\).  The boundary formulas give

\[
\begin{aligned}
A_\theta(x)&=1+O(x),
&B_\theta(x)&=O(e^{-c/x}) &&(x\downarrow0),\\
A_\theta(x)&=\frac{\cosh\theta}{2x}+O(x^{-2}),
&B_\theta(x)&=\frac{\sqrt\pi}{2\sqrt x}(1+O(x^{-1}))
&&(x\to\infty),
\end{aligned}
\]

for some \(c>0\).  Consequently,

\[
\Sigma_{s,\theta}(v)=O(\sqrt{v-2})\quad(v\downarrow2),
\qquad
\Sigma_{s,\theta}(v)
\sim\frac1{2\sqrt{\pi s}}v^{-1/2}\quad(v\to\infty),
\]

and \(H_s(w)=O(|w|^{-1/2})\); therefore both the endpoint circle and the
large circle vanish.  Taking the Laplace representation of
\((w+v)^{-1}\) in (4.9), with truncation followed by dominated convergence,
gives a second exact formula for the Bernstein density:

\[
\boxed{
\rho_s(\lambda)
=\int_2^\infty e^{-\lambda v}\Sigma_{s,\theta}(v)\,dv.
}
\tag{4.11}
\]

This is also an exact transform identity between (4.7) and (4.10), by
Laplace-transform uniqueness.

The relation to Route 2 is especially rigid.  Set

\[
u_+=\frac{e^{r/2}}{2\sqrt s},
\qquad
u_-=\frac{e^{-r/2}}{2\sqrt s};
\qquad u_+>u_-.
\]

Substitution of (2.12)--(2.13) and (2.23)--(2.24) into (4.10) yields

\[
\boxed{
\Sigma_{s,\theta}(2\cosh r)
=\frac{Q_\theta(u_+)Q_\theta(u_-)}{4s}
\left[\mathcal R_\theta(u_+)-\mathcal R_\theta(u_-)\right].
}
\tag{4.12}
\]

Consequently, nonnegativity of the spectral density for all \(s,r>0\)
is equivalent to monotonicity of \(\mathcal R_\theta\).  This is the
strong Stieltjes-in-\(w\) subroute and is exactly the Route-2 phase
criterion.  For a fixed \(s\), however, positivity of the Laplace-smoothed
\(\rho_s\) need not force pointwise positivity of \(\Sigma_{s,\theta}\).
Thus (4.11) still leaves open a potentially weaker, genuinely different
averaging argument.

<a id="wip-4-5"></a>
### WIP-4.5 — positive product formulas in the proved parameter range

**Status: [PROVED], conditional only on the already proved theorem
(2.56).**

The small-contrast theorem (2.56) and (4.12) imply

\[
0\le\theta\le
\frac12\log\frac{1+\sqrt5}{2}
\quad\Longrightarrow\quad
\Sigma_{s,\theta}(v)\ge0
\quad(s>0,\ v>2).
\]

It follows from (4.11) that \(\rho_s\ge0\); hence (4.6) is a positive
Bernstein product formula throughout this range.  In particular, the
explicit \(I_0\)-\(J_1\) inequality in (4.7) is proved there.

At equal rates, the formula is completely explicit.  Since
\(Q_0(u)=e^{-u^2}\) and \(\mathcal R_0(u)=\operatorname{erfi}(u)\),

\[
\boxed{
\begin{aligned}
\Sigma_{s,0}(2\cosh r)
={}&\frac1{4s}e^{-\cosh r/(2s)}\\
&\times\left[
\operatorname{erfi}\!\left(\frac{e^{r/2}}{2\sqrt s}\right)
-\operatorname{erfi}\!\left(\frac{e^{-r/2}}{2\sqrt s}\right)
\right]>0.
\end{aligned}}
\tag{4.13}
\]

There is also a Thorin-level description.  Whenever
\(U_\theta(dx)=\vartheta_\theta'(x)\,dx\) is the Thorin measure from
(2.21), direct multiplication of the two Thorin representations gives,
with \(q=w-2\ge0\),

\[
\boxed{
\frac{H_s(2+q)}{H_s(2)}
=\exp\left\{-\int_0^\infty
\log\left(1+\frac{q}{\Lambda_s(x)}\right)U_\theta(dx)\right\},
\qquad
\Lambda_s(x)=2+\frac{x}{s}+\frac{s}{x}.
}
\tag{4.14}
\]

Let \(Z_s\) be the GGC whose Thorin measure is
\((\Lambda_s)_\#U_\theta\).  Then

\[
\boxed{
H_s(2+q)=\psi_Y(s)^2\,\mathbb E[e^{-qZ_s}],
\qquad
\eta_s(d\lambda)
=\psi_Y(s)^2e^{2\lambda}\mathbb P(Z_s\in d\lambda),
}
\tag{4.15}
\]

where \(H_s(w)=\int e^{-w\lambda}\eta_s(d\lambda)\).  Formula (4.15)
is the desired positive product formula in every parameter regime where
Route 2 has established the Thorin measure; in particular it is
unconditional in the range (2.56).

The representing measure is finite: \(\Lambda_s(x)\ge4\) and
\(U_\theta((0,\infty))=1/2\) imply \(\mathbb E[e^{2Z_s}]<\infty\).  In the
positive range, uniqueness also identifies
\(\eta_s(d\lambda)=\rho_s(\lambda)d\lambda\).

<a id="wip-4-6"></a>
### WIP-4.6 — rigorous Kontorovich--Lebedev inversion

**Status: [PROVED].**

Let

\[
h_s(u)=H_s(2\cosh u),
\qquad
\widehat h_s(\xi)=\int_{\mathbb R}e^{i\xi u}h_s(u)\,du.
\]

The elementary bound
\(f_Y(y)\le(2\sqrt y)^{-1}\) gives
\(\psi_Y(z)\le\sqrt\pi/(2\sqrt z)\), and hence
\(h_s(u)=O(e^{-|u|/2})\).  This makes the Fourier transform absolutely
convergent and also gives

\[
\mathbb E\int_{\mathbb R}
e^{-s(Y_1e^u+Y_2e^{-u})}\,du<\infty.
\]

Thus Fubini is legitimate when the integral representation of
\(K_{i\xi}\) is applied before averaging, and it gives

\[
\boxed{
\widehat h_s(\xi)
=2\mathbb E\!\left[
K_{i\xi}(2s\sqrt{Y_1Y_2})
\cos\!\left(\frac\xi2\log\frac{Y_2}{Y_1}\right)
\right].
}
\tag{4.16}
\]

On the other hand, (4.6) and the representation
\(K_{i\xi}(x)=\int_0^\infty e^{-x\cosh u}\cos(\xi u)\,du\) imply

\[
\widehat h_s(\xi)
=2\int_0^\infty K_{i\xi}(2\lambda)\rho_s(\lambda)\,d\lambda.
\]

With the DLMF normalization of the Kontorovich--Lebedev transform, take
\(g(x)=x\rho_s(x/2)\).  Its inverse is therefore

\[
\boxed{
\rho_s(\lambda)
=\frac1{\pi^2\lambda}\int_0^\infty
\xi\sinh(\pi\xi)K_{i\xi}(2\lambda)
\widehat h_s(\xi)\,d\xi .
}
\tag{4.17}
\]

This is a classical inversion, not a formal one; the integral is understood
in the improper-limit sense of the DLMF inversion theorem.  Equations
(4.10)--(4.11) give

\[
\rho_s(\lambda)=O(\lambda^{-1/2})\quad(\lambda\downarrow0),
\qquad
\rho_s(\lambda)=O(e^{-2\lambda}\lambda^{-3/2})
\quad(\lambda\to\infty).
\]

Thus \(g\) is smooth on \((0,\infty)\), of bounded variation on compact
subintervals, and satisfies both integrability conditions in DLMF
10.43.32.  This verifies the hypotheses of the inversion theorem.

> **[OPEN STEP R4-B]** Prove \(\rho_{s,\theta}(\lambda)\ge0\) for all
> \(s,\lambda>0\) beyond the small-contrast range, either from the fully
> averaged Bessel formula (4.7) or from the Laplace smoothing (4.11).
> Pointwise fixed-fibre positivity is impossible by WIP-4.2; demanding
> \(\Sigma_{s,\theta}\ge0\) is exactly the still-open Route-2 monotonicity
> problem and may be stronger than necessary at each fixed \(s\).
