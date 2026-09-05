# Direct resolvent verification of the log-rate generator

Entry: WIP-6.22. **[PROVED; PROJECT DERIVATION / ALTERNATIVE PROOF]**.
Recorded and mathematically cross-checked on **2026-09-06**.

[WIP](../WIP.md) | [BigPicture](../BigPicture.md) |
[Generator](20-finite-thorin-positive-steps.md)

This entry simplifies the proof of WIP-6.16's resolvent identity. It
does not enlarge its parameter range or independently establish the full
power conjecture. The proof can define the log-rate generator
directly and verify its action without first constructing the truncated
rate-coordinate operator of WIP-6.12--6.13.

<a id="wip-6-22"></a>
## WIP-6.22 — an absolutely convergent direct cancellation identity

Let \(U\) be a nonzero admissible finite Thorin measure of mass \(B\),
with zero GGC drift, and set \(F=\log_*(U/B)\). Use the generator,
posterior, phase and correction kernel of WIP-6.16--6.17. For
\(b=e^y\), \(s>0\), and a deterministic positive-rate probability
\(P\), put \(\varphi_s(y)=(s+e^y)^{-1}\). The sample drift is

\[
\widehat a_P(y)=-\psi(B+1)-1-\log M_P(b)
 +\int_0^\infty\xi_P(bu)K(u)\,du.
\tag{6.155}
\]

It is the integrand whose posterior mean gives the previously defined
\(a_{B,F}(y)\). With \(u=e^v\), the universal jump measure becomes
\(du/(u-1)^2\). Direct algebra gives

\[
\begin{aligned}
&\frac{(s+bu)^{-1}-(s+b)^{-1}+b\log u/(s+b)^2}{(u-1)^2}
 -\frac b{(s+b)^2}K(u)\\
&\hspace{2em}=\frac b{(s+b)^2}
 \left(\frac b{s+bu}-\frac1{1+u}\right).
\end{aligned}
\tag{6.156}
\]

Indeed the two logarithmic terms cancel; the remaining first difference
is \(-b/((u-1)(s+bu)(s+b))\). Combining it with
\(b/((s+b)^2(u-1))\) gives \(b^2/((s+b)^2(s+bu))\), leaving
the displayed right-hand side. Values at \(u=1\) are removable.

The first term on the left is the logarithmic Taylor remainder and is
bounded in absolute value by
\(\|\varphi_s''\|_\infty(\log u)^2/[2(u-1)^2]\), an integrable
kernel by WIP-6.17. The other term uses \(K\in L^1\). The bracketed
kernel on the right has absolute integral \(|\log(s/b)|\); the full
right side has absolute integral
\(b(s+b)^{-2}|\log(s/b)|\). Consequently all
integrals are ordinary absolute integrals; no principal value or
separation of divergent compensators is involved.

Subtracting the Stieltjes phase formulas at \(s\) and \(b\) gives

\[
\log M_P(s)-\log M_P(b)
=\int_0^\infty\xi_P(bu)
 \left(\frac b{s+bu}-\frac1{1+u}\right)du.
\tag{6.157}
\]

Since \(\varphi_s'(y)=-b/(s+b)^2\), the sample drift and jump terms
therefore sum exactly to

\[
\widehat{\mathcal G}_P\varphi_s(y)
=\frac b{(s+b)^2}\{\psi(B+1)+1+\log M_P(s)\}.
\tag{6.158}
\]

Take \(P\sim DP(U+\delta_b)\), integrate in \(F(dy)\), and apply
the Palm identity (6.91). Its absolute-value version is justified first
by Tonelli; the resulting bound is
\(\mathbb E[W_P(s)(|\psi(B+1)+1|+|\log M_P(s)|)]<\infty\),
because \(W_P\le M_P\le1/s\) and \(x(1+|\log x|)\) is bounded
on \((0,1/s]\). For the left side, an absolute posterior bound is
needed, not merely a bound on the averaged drift. The posterior atom
estimate \(Z/2\le bM_P(b)\le1\), with \(Z\sim Beta(1,B)\), gives

\[
\mathbb E^{(b)}|\widehat a_P(y)-y|
\le |\psi(B+1)+1|+\log2+\psi(B+1)-\psi(1)+\|K\|_1
=:C'_B<\infty.
\]

Hence the expected absolute sample drift term is bounded by
\((|y|+C'_B)|\varphi_s'(y)|\), a bounded function. The absolute sample
jump term is at most \(m_2\|\varphi_s''\|_\infty/2\). These bounds
also justify the initial posterior expectations for every fixed \(b\).
Thus signed Fubini and
Palm disintegration are legitimate without a log-moment assumption on
\(F\). We obtain

\[
F(\mathcal G_{B,F}\varphi_s)
=\mathbb E_{DP(U)}[W_P(s)(\psi(B+1)+1+\log M_P(s))]
=\frac{h_U(s)+g_1(s)}B.
\]

The last equality is WIP-6.11. The digamma parameter is the original
mass \(B\), not the posterior mass \(B+1\). This proves the direct
interface independently of any manuscript presentation.

## Provenance and effect on the blueprint

The gamma--Dirichlet tangent, bounded Stieltjes phase, Palm identity and
log-rate coefficient estimates are unchanged; their exact external
interfaces are recorded in the
[primary-source audit](../notes/log-rate-power-proof-primary-interfaces.md).
The cancellation above is an elementary project deduction and an
alternative proof of an already recorded identity, not a new literature
claim. It removes a dependency from the mathematical proof, not a
substitute for weak continuity, Euler convergence or dynamic
identification. The full theorem is assessed by its mathematical
assembly and [completion audit](25-mathematical-completion-audit.md),
not by whether a TeX manuscript has been produced.
