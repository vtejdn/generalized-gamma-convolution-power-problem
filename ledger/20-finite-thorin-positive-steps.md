# Log-rate coordinates for finite-Thorin power tangents

This module puts the weak tangent of
[WIP-6.11--WIP-6.13](19-finite-thorin-compensated-power-tangent.md)
in log-rate coordinates. Its first two entries prove a measurable
positive jump generator with a universal dominating Levy measure,
a linear drift bound, and a quadratic Lyapunov estimate. These are
operator statements, not an existence theorem for a nonlinear evolution
and not a positive-time GGC power-closure theorem.

Entries in this initial module: WIP-6.16--WIP-6.17. The operator
construction and estimates are **[PROJECT DERIVATION]**; the
Dirichlet posterior identity is a **[KNOWN LITERATURE RESULT]**.
No literature priority is claimed. Checked on 2026-09-05.

## Primary references and conventions

1. L. F. James, *Functionals of Dirichlet processes, the
   Cifarelli--Regazzini identity and Beta-Gamma processes*, Annals of
   Statistics **33** (2005), 647--660,
   [DOI 10.1214/009053604000001237](https://doi.org/10.1214/009053604000001237).
   Checked [arXiv:math/0505606v1](https://arxiv.org/pdf/math/0505606v1),
   Section 1, PDF/reprint p. 2, equations (1)--(3), for gamma-process
   normalization and independence of the total mass; Section 2,
   PDF/reprint pp. 4--5, the posterior paragraph and equation (8),
   for the Dirichlet posterior and its disintegration. We use the
   one-observation case. The base measure can be atomic or mixed;
   the nonatomic hypothesis on later partition factorizations is
   not required for this posterior identity. A finite-partition
   proof of the identity used here is included below.
2. R. L. Schilling, R. Song and Z. Vondracek, *Bernstein Functions:
   Theory and Applications*, de Gruyter, **2010 edition**,
   [local primary text](../literature/SSV.pdf), Theorems 6.10 and
   7.3 and the argument-recovery discussion cited and checked in
   WIP-6.11. We use precisely the jointly measurable phase and
   the anchor-one representation proved there; no new endpoint
   assumption is being imported.
3. NIST Digital Library of Mathematical Functions,
   [equation 5.4.12](https://dlmf.nist.gov/5.4.E12),
   \(\psi(1)=-\gamma_{\!E}\), and
   [equation 25.6.1](https://dlmf.nist.gov/25.6.E1),
   \(\zeta(2)=\pi^2/6\). These values are used only for the explicit
   constants. The beta logarithmic moment and jump-moment calculation
   themselves are proved below.

Let \(U\) be a positive finite Borel measure on \((0,\infty)\), with
mass \(B\in(0,\infty)\). Write

\[
\mu_U=U/B,\qquad F_U=(\log)_\#\mu_U,\qquad
\Psi_B=\psi(B+1),\qquad
M_P(s)=\int\frac{P(db)}{s+b}.
\tag{6.89}
\]

Thus \(F_U\) is a probability on **log rates**, whereas \(\mu_U\)
is a probability on positive rates. These two measures must not be
interchanged. Unless explicitly stated otherwise,
\(P\sim\operatorname{DP}(U)\). Let \(\xi_P(t)\in[0,1]\) be the
jointly Borel choice from (6.69). Its integral representation is

\[
\log M_P(s)-\log M_P(1)
=\int_0^\infty\xi_P(t)
\left(\frac1{s+t}-\frac1{1+t}\right)dt.
\tag{6.90}
\]

The integrals in (6.90) are absolutely convergent for every \(s>0\).
Constructing the coefficients below requires only \(0<B<\infty\).
To identify them with the tangent of a GGC law, additionally assume
the finite-Thorin admissibility condition
\(\int\log(1+1/b)\,U(db)<\infty\), and take the GGC drift to be
zero, as in (6.65).

<a id="wip-6-16"></a>
## WIP-6.16 — posterior disintegration and a log-rate jump generator

**Status: [PROVED MEASURABLE GENERATOR AND EXACT RESOLVENT TANGENT;
NO EVOLUTION EXISTENCE OR LOCAL POWER CLOSURE CLAIM].**

The Dirichlet posterior disintegration, for nonnegative jointly Borel
\(\Phi\), or for an absolutely integrable signed \(\Phi\), is

\[
\boxed{
\mathbb E_{\operatorname{DP}(U)}\int\Phi(b,P)\,P(db)
=\int\mu_U(db)\,
\mathbb E_{\operatorname{DP}(U+\delta_b)}\Phi(b,P).
}
\tag{6.91}
\]

Here and below the notation on the right changes the law of \(P\),
not the original mass parameter \(B\) in \(\Psi_B\). A useful
jointly measurable realization of all the posterior laws is

\[
P^{(b)}=(1-Z)Q+Z\delta_b,\qquad
Q\sim\operatorname{DP}(U),\quad Z\sim\operatorname{Beta}(1,B),
\quad Q\perp Z.
\tag{6.92}
\]

Define, for \(y\in\mathbb R\) and \(v\ne0\),

\[
\begin{aligned}
\nu(dv)&=\frac{e^v}{(e^v-1)^2}\,dv,\\
\eta_U(y,v)&=
\mathbb E_{\operatorname{DP}(U+\delta_{e^y})}
\xi_P(e^{y+v}),\\
K(u)&=\frac1{1+u}-\frac1{u-1}
                +\frac{\log u}{(u-1)^2},\qquad u>0,\ u\ne1,
\quad K(1)=0.
\end{aligned}
\tag{6.93}
\]

The function \(K\) is integrable, as proved in WIP-6.17. The
measurable log-rate drift is

\[
\boxed{
a_U(y)=y-\Psi_B-1+
\mathbb E_{\operatorname{DP}(U+\delta_b)}
\left[-\log\bigl(bM_P(b)\bigr)
       +\int_0^\infty\xi_P(bu)K(u)\,du\right],
\qquad b=e^y.
}
\tag{6.94}
\]

All the expectations in (6.94) are finite. Moreover
\(0\le\eta_U\le1\). The resulting operator is

\[
\boxed{
(\mathcal G_U\varphi)(y)
=a_U(y)\varphi'(y)
+\int_{\mathbb R}
\bigl[\varphi(y+v)-\varphi(y)-v\varphi'(y)\bigr]
\eta_U(y,v)\,\nu(dv).
}
\tag{6.95}
\]

There is compensation by \(v\varphi'(y)\) for **all** jump sizes.
This is an absolutely convergent Taylor-remainder integral on the
test domains specified below, not a principal-value convention.

For every \(\varphi\in C_c^2(\mathbb R)\), and also for each
log-resolvent and each of its fixed-order derivatives in \(s>0\),

\[
\varphi_s(y)=\frac1{s+e^y},\qquad
\varphi_{s,k}(y)=\frac{(-1)^k k!}{(s+e^y)^{k+1}},
\quad k=0,1,\ldots,
\tag{6.96}
\]

the integral of \(|\mathcal G_U\varphi|\) against \(F_U\) is
finite, without a log-moment assumption on \(F_U\). If \(U\) is
admissible for a zero-drift GGC, and
\(f(b)=\varphi(\log b)\), then

\[
\int\mathcal G_U\varphi(y)\,F_U(dy)=\mathcal A_Uf,
\qquad
\boxed{
\int\mathcal G_U\varphi_s\,dF_U
=\frac{h_U(s)+g_1(s)}B.
}
\tag{6.97}
\]

The notation on the right is that of (6.68) and (6.74).
In particular this is the normalized tangent in logarithmic power
time \(q=e^\tau\), evaluated at \(\tau=0\). It is not an
identity for a constructed positive-time evolution.

**Proof of the posterior identity.** For a finite partition with
Dirichlet mass vector \((P_1,\ldots,P_n)\), multiplication of its
density by \(P_i\) replaces its parameter vector
\((\beta_1,\ldots,\beta_n)\) by
\((\beta_1,\ldots,\beta_i+1,\ldots,\beta_n)\), with total factor
\(\beta_i/B\). The assertion remains valid after omitting
zero-parameter cells. Applying this identity to a common partition
for the sampled rate and for a cylinder functional of \(P\) proves
(6.91) on generating rectangles. Refinement and the monotone-class
theorem give the identity for jointly Borel nonnegative functions;
positive and negative parts give its stated integrable version.
Equivalently it is the one-observation posterior formula in James's
Section 2. No diffuseness of \(U\) was used.

To prove (6.92), take independent \(G_B\sim\Gamma(B,1)\),
\(G_1\sim\Gamma(1,1)\), and \(Q\sim\operatorname{DP}(U)\).
The random measure \(G_BQ\) is the gamma process with parameter
\(U\), by gamma--Dirichlet normalization. Adding
\(G_1\delta_b\) changes the parameter to \(U+\delta_b\), as is
seen on every finite partition. Normalizing gives (6.92), since
\(Z=G_1/(G_B+G_1)\) has the beta law shown and is independent
of \(Q\). This construction proves that \(b\) indexes a
measurable posterior probability kernel.

**Proof of the change of coordinates.** First take
\(\varphi\in C_c^2(\mathbb R)\), so
\(f=\varphi\circ\log\in C_c^2((0,\infty))\). The same
calculation applies to (6.96), because its rate-coordinate version
belongs to the domain (6.77). Thus WIP-6.13 already justifies the
initial rate-coordinate integrals and their expectations.

For fixed \(b=e^y\), substitute \(t=be^v\) in (6.72).
Then \(b\,dt/(t-b)^2=\nu(dv)\), and
\(bf'(b)=\varphi'(y)\). The former rate compensation becomes
\((e^v-1)\chi_b(be^v)\varphi'(y)\), where
\(\chi_b(t)=\mathbf1_{\{|t-b|<1\}}\). Replacing it by the
all-size log compensation gives the intermediate drift

\[
\widetilde a_P(b)=C_P(b)+
\int_{\mathbb R}\xi_P(be^v)
\bigl[v-(e^v-1)\chi_b(be^v)\bigr]\,\nu(dv).
\tag{6.98}
\]

For each fixed \(b>0\) the added integral is absolutely
convergent. Near \(v=0\), the bracket is \(O_b(v^2)\);
away from zero the exponential tails of \(\nu\) dominate the
linear term, and the term involving \(\chi_b\) is integrable.
Combining (6.98) with the anchor-one definition of \(C_P(b)\)
in (6.71), and then writing \(u=e^v\), gives

\[
\widetilde a_P(b)=-\Psi_B-1-\log M_P(1)
+\int_0^\infty\xi_P(bu)
\left[\frac b{1+bu}-\frac1{u-1}
                    +\frac{\log u}{(u-1)^2}\right]du.
\tag{6.99}
\]

Here the bracket is an integrable combined kernel; its apparently
singular terms are not being integrated separately. Formula (6.90)
at \(s=b\), after the same substitution, reads

\[
\log M_P(b)-\log M_P(1)
=\int_0^\infty\xi_P(bu)
\left[\frac1{1+u}-\frac b{1+bu}\right]du.
\tag{6.100}
\]

The absolute integral of the kernel in (6.100) is
\(|\log b|\). Subtracting this identity in (6.99) proves

\[
\widetilde a_P(b)
=\log b-\Psi_B-1-\log\bigl(bM_P(b)\bigr)
  +\int_0^\infty\xi_P(bu)K(u)\,du.
\tag{6.101}
\]

Now apply (6.91) to the outer \(P(db)\) integration. The
posterior expectation of (6.101) is (6.94), and its jump term
becomes (6.93)--(6.95). Absolute convergence after disintegration
follows from the coefficient and jump bounds proved in WIP-6.17:
the drift is at most linear in \(|y|\), and the absolute jump
integral is bounded by a fixed multiple of
\(\|\varphi''\|_\infty\). For compactly supported tests,
\((1+|y|)|\varphi'(y)|\) is bounded. For (6.96) it is also
bounded, locally uniformly in positive \(s\), because the first
\(y\)-derivative decays exponentially at both ends. This
justifies the final signed Fubini exchanges and proves (6.97).

For measurability, use the common posterior coupling (6.92), the
joint Borel phase from WIP-6.11, and the Borel map
\((b,P)\mapsto M_P(b)\). The latter follows directly from
the bounded continuous kernel \((b,t)\mapsto1/(b+t)\),
localized in \(b\) when necessary. Integration of the Borel
bounded phase gives a Borel \(\eta_U\). The integral with
\(K\) is absolutely bounded, and the logarithmic integrand is
nonnegative and has finite posterior expectation by (6.104)
below. Consequently \(a_U\) is finite and Borel. \(\square\)

<a id="wip-6-17"></a>
## WIP-6.17 — uniform drift, jump variance and a quadratic Lyapunov bound

**Status: [PROVED OPERATOR BOUNDS FOR ALL NONZERO FINITE BASE
MEASURES; NO UNJUSTIFIED PROCESS OR ITERATION THEOREM].**

The universal correction kernel and Levy measure satisfy

\[
\begin{gathered}
K(u)<0\ (0<u<1),\qquad K(u)>0\ (u>1),\\
\int_0^1 K(u)\,du=-(1-\log2),\qquad
\int_1^\infty K(u)\,du=1-\log2,
\qquad \|K\|_1=2(1-\log2),\\
\nu(-dv)=\nu(dv),\qquad
m_2:=\int_{\mathbb R}v^2\nu(dv)=\frac{2\pi^2}3.
\end{gathered}
\tag{6.102}
\]

For every \(U\) of mass \(B>0\) and every \(y\in\mathbb R\),

\[
\boxed{
y-\Psi_B-2+\log2\ \le\ a_U(y)\ \le\ y+\gamma_{\!E}.
}
\qquad
|a_U(y)-y|\le C_B,
\quad C_B:=\max\{\gamma_{\!E},|\Psi_B+2-\log2|\}.
\tag{6.103}
\]

These constants have no dependence on the support, atomic structure,
or moments of \(U\). They are uniformly bounded when \(B\)
ranges over a compact subinterval of \((0,\infty)\).

**Proof of the correction-kernel identities.** Multiplication by
\((u-1)^2\) gives
\((u-1)^2K(u)=\log u-2(u-1)/(u+1)\). The derivative of
the right side is \((u-1)^2/[u(u+1)^2]\), so it is strictly
increasing away from 1 and vanishes at 1. This proves the two
signs and the removable value \(K(1)=0\). An antiderivative is
\(H(u)=\log(1+1/u)-\log u/(u-1)\). Its limits at zero
and infinity are zero, whereas \(H(1)=\log2-1\).
These facts give all three integrals in (6.102), including
absolute integrability at the endpoints.

The density of \(\nu\) equals
\([4\sinh^2(v/2)]^{-1}\), so it is even. On \(v>0\),
it equals \(\sum_{n\ge1}n e^{-nv}\). Tonelli and the elementary
gamma integral therefore give
\(\int v^2\nu(dv)=2\sum_{n\ge1}n(2/n^3)
=4\zeta(2)=2\pi^2/3\).

**Proof of the drift bound.** In the posterior coupling (6.92),
the atom of mass \(Z\) at \(b\) implies
\(Z/2\le bM_{P^{(b)}}(b)\le1\). Differentiation of the
beta integral for \(Z\sim\operatorname{Beta}(1,B)\) gives

\[
0\le\mathbb E_{\operatorname{DP}(U+\delta_b)}
[-\log(bM_P(b))]
\le\log2+\mathbb E[-\log Z]
=\log2+\psi(B+1)-\psi(1)
=\log2+\Psi_B+\gamma_{\!E}.
\tag{6.104}
\]

The beta differentiation is justified by the integrability of
\(|\log z|(1-z)^{B-1}\) on \((0,1)\) for every \(B>0\).
Since \(0\le\xi_P\le1\), the correction integral in (6.94)
lies between \(-(1-\log2)\) and \(1-\log2\), pointwise in
\(P,b\). Combining these bounds proves (6.103). Continuity
of \(\psi\) on positive arguments gives the assertion on
compact mass intervals.

**Pointwise generator bounds and positivity.** The jump acceptance
is nonnegative and bounded by one, so

\[
0\le\int v^2\eta_U(y,v)\nu(dv)\le m_2,
\qquad
|\mathcal G_U\varphi(y)|
\le (|y|+C_B)|\varphi'(y)|
      +\frac{m_2}{2}\|\varphi''\|_\infty.
\tag{6.105}
\]

The second inequality follows from Taylor's theorem with global
bounded second derivative, and applies whenever its right side
is finite. In particular (6.95) is an ordinary absolutely
convergent integral for \(\varphi\in C_b^2(\mathbb R)\).
Its integral against \(F_U\) is finite if
\(\int|y|\,F_U(dy)<\infty\); no first moment of the positive
rate \(e^y\) is required. The stronger conclusion for compactly
supported tests and log-resolvents without a log-moment assumption
was used in WIP-6.16.

The generator annihilates constants. If a differentiable test
\(\varphi\) attains a global minimum at \(y\), then
\(\varphi'(y)=0\), and the absolutely convergent jump integral
is nonnegative. Thus

\[
\mathcal G_U1=0,\qquad
\varphi(y)=\inf_{z\in\mathbb R}\varphi(z)
\ \Longrightarrow\ \mathcal G_U\varphi(y)\ge0.
\tag{6.106}
\]

Here the test is required to belong to one of the stated integrable
domains. In particular, if \(\varphi\ge0\) and \(\varphi=0\)
\(F_U\)-almost everywhere, then
\(\int\mathcal G_U\varphi\,dF_U\ge0\) whenever that integral
is defined. This is a positive minimum property, not an application
of an unproved semigroup-generation theorem.

**Linear and quadratic tests.** The expressions for these unbounded
tests are nevertheless absolutely well defined pointwise:

\[
\begin{aligned}
\mathcal G_U[y](y)&=a_U(y),\\
\mathcal G_U[y^2](y)
&=2y\,a_U(y)+\int v^2\eta_U(y,v)\nu(dv),\\
\bigl|\mathcal G_U[y^2](y)\bigr|
&\le3y^2+C_B^2+m_2.
\end{aligned}
\tag{6.107}
\]

Indeed the linear Taylor remainder is zero and the quadratic
remainder is exactly \(v^2\). The last inequality follows from
\(2|y|(|y|+C_B)\le3y^2+C_B^2\). For
\(V(y)=1+y^2\), this yields the Lyapunov inequality

\[
\mathcal G_UV(y)\le3y^2+C_B^2+m_2
\le(3+C_B^2+m_2)V(y).
\tag{6.108}
\]

If \(F_U\) has finite second moment, the absolute expectations
in (6.107)--(6.108) are finite. In that case the corresponding
rate measure is automatically Thorin-admissible, since

\[
\int\log(1+1/b)\,U(db)
=B\int\log(1+e^{-y})\,F_U(dy)
\le B\left(\log2+\int|y|\,F_U(dy)\right)<\infty.
\tag{6.109}
\]

This supplies a concrete moment domain suitable for testing an
evolution construction. It does not assert that every admissible
finite-Thorin measure lies in that domain: admissibility controls
the negative log-rate tail but allows an uncontrolled positive
log-rate tail. Finite gamma convolutions do lie in this domain,
because their log-rate measure has finite support. \(\square\)

## Exact scope and remaining work after WIP-6.17

The raw rate-coordinate jump kernel has long upper tails; its
first positive-rate moment need not be a viable iteration norm.
Equations (6.103)--(6.109) identify a different, quantitatively
controlled domain in log-rate coordinates. The coefficient bounds
do not deteriorate merely because rate support reaches zero or
infinity.

What is proved here is a measurable, state-dependent generator
with nonnegative jumps, an exact resolvent tangent, and uniform
moment estimates at the operator level. A positive-time theorem
still requires an actual construction, control under changing
\(U\), passage to a limit in the nonlinear coefficients, and
identification of the resulting law with the desired power flow.
In particular no Gronwall estimate for a stochastic process is
being asserted before the process and its admissible test
identities have been justified. Subsequent entries must supply
those missing arguments rather than treating this positive
minimum property as automatic invariance of the GGC class.

**Subsequent work.** These separate obligations are addressed by
[WIP-6.18--6.19](21-log-thorin-euler-evolution.md) and
[WIP-6.20](22-power-flow-identification.md). Their full-scope assembly
and current review state are in
[WIP-6.21](23-power-theorem-assembly-audit.md). The statements of this
module remain operator-level results, rather than retroactively invoking
that later construction in their proofs.
