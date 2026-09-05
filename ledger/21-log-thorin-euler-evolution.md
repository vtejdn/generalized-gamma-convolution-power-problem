# Log-Thorin evolution: continuity and a positive Euler construction

Entries: WIP-6.18--6.19. These are project derivations, not invocations
of a general nonlinear-generator existence theorem. The construction is
in logarithmic rate coordinates; it must not be confused with the
finite-atom one-step construction in WIP-6.10.

[Master index](../WIP.md) | [Logarithmic generator](20-finite-thorin-positive-steps.md) |
[Conditional identification](22-power-flow-identification.md)

**Audit state:** the generator continuity and Euler construction below
passed independent equation-by-equation review on 2026-09-05. The
separate identification and full-conjecture assembly remain subject to
their own checks; this module alone is not the full power theorem.

## Conventions and existing inputs

Write \(F\) for a probability measure on log rates \(\mathbb R\),
\(B>0\), and \(U=B\exp_*F\). The definitions of WIP-6.16--6.17
make sense for every \(F\), even before Thorin integrability is checked.
Let \(P\sim DP(U+\delta_b)\), where \(b=e^y\), and set
\[
\begin{aligned}
\nu(dv)&=\frac{e^v}{(e^v-1)^2}\,dv,\\
k_{B,F}(y,v)&=\mathbb E_{DP(U+\delta_b)}\xi_P(be^v),\\
a_{B,F}(y)&=y-\psi(B+1)-1+
 \mathbb E_{DP(U+\delta_b)}
 \left[-\log\{bM_P(b)\}+\int_0^\infty\xi_P(bu)K(u)\,du\right],\\
K(u)&=\frac1{1+u}-\frac1{u-1}+\frac{\log u}{(u-1)^2}.
\end{aligned}
\tag{6.110}
\]
The three terms defining \(K\) are combined before integration.
The phase and its jointly measurable version are those of WIP-6.11.
The log-coordinate operator is
\[
\mathcal G_{B,F}\varphi(y)=a_{B,F}(y)\varphi'(y)
+\int_{\mathbb R}
 [\varphi(y+v)-\varphi(y)-v\varphi'(y)]
 k_{B,F}(y,v)\nu(dv).
\tag{6.111}
\]
In particular the compensation is over the whole line, not only small
jumps. The already derived bounds are
\[
0\le k\le1,\qquad
|a_{B,F}(y)-y|\le C_I,\qquad
\int v^2\nu(dv)=\frac{2\pi^2}{3}
\quad (B\in I\Subset(0,\infty)),
\tag{6.112}
\]
uniformly in \(F,y\). Their proofs are in WIP-6.17.

The Dirichlet posterior identity is sourced and also proved from finite
Dirichlet vectors in WIP-6.16. The logarithmic Stieltjes phase identity
and its uniqueness are Schilling--Song--Vondracek (2010), Theorems 6.10
and 7.3, with exact source locations in WIP-6.11. The arguments below
give the required coupling and compactness details; they do not assume
pointwise continuity of a boundary phase.

The stick-breaking construction used in (6.115) is a known result:
J. Sethuraman, *A Constructive Definition of Dirichlet Priors*,
*Statistica Sinica* **4** (1994), 639--650, Section 2, printed
pp. 642--643, equation (2.1); the finite-partition characterization is
Theorem 3.4, printed p. 645. See the
[publisher's original](https://www3.stat.sinica.edu.tw/statistica/oldpdf/A4n216.pdf)
and the [primary-text university mirror](https://www.cs.princeton.edu/courses/archive/fall07/cos597C/readings/Sethuraman1994.pdf).
The construction and fixed-point passages were checked in indexed
primary-text excerpts on 2026-09-05; the publisher's image-only PDF was
not successfully rendered here. The finite-partition proof below is
also supplied explicitly. The coupling and its use for the present
generator are project deductions, not a claim of priority for (6.115).

<a id="wip-6-18"></a>
## WIP-6.18 — weak continuity of the averaged logarithmic generator

**Status: [PROVED WEAK CONTINUITY OF THE AVERAGED GENERATOR].**

If \(B_n\to B>0\), \(F_n\Rightarrow F\) on \(\mathbb R\),
and \(y_n\to y\), then for every \(\varphi\in C_c^2(\mathbb R)\),
\[
\mathcal G_{B_n,F_n}\varphi(y_n)
\longrightarrow\mathcal G_{B,F}\varphi(y).
\tag{6.113}
\]
Moreover \(\mathcal G_{B,F}\varphi\) is bounded uniformly in
\(F,y\) when \(B\) lies in a compact positive interval. Consequently
\[
F_n(\mathcal G_{B_n,F_n}\varphi)
\longrightarrow F(\mathcal G_{B,F}\varphi).
\tag{6.114}
\]
No log-moment hypothesis is needed in this lemma.

### 1. An almost-sure coupling of Dirichlet probabilities

Here is a direct proof of the Dirichlet coupling used below. For a
probability \(F\) on \(\mathbb R\), let \(Z_j\) be independent
with law \(F\), and let \(V_j\) be independent Beta\((1,B)\)
variables independent of the \(Z_j\). Put
\[
W_j=V_j\prod_{i<j}(1-V_i),\qquad Q=\sum_{j\ge1}W_j\delta_{Z_j}.
\tag{6.115}
\]
The remaining mass after \(m\) terms decreases to zero almost surely:
its expectation is \((B/(B+1))^m\). Thus \(Q\) is a probability.

For completeness, it has the Dirichlet finite-partition laws. For a
partition with cell probabilities \(p_i\), if \(D\) has parameters
\(Bp_i\), then
the fixed-point identity is
\[
D\ \overset d=\ V e_J+(1-V)D',\quad
\mathbb P(J=i)=p_i,
\quad V\sim\operatorname{Beta}(1,B),\quad D'\sim D,
\tag{6.116}
\]
with the variables on the right independent. Conditional on \(J=i\),
gamma addition gives Dirichlet parameters \((Bp_j+\mathbf1_{j=i})\).
The density of that law relative to the original Dirichlet law is
\(x_i/p_i\). Mixing with weights \(p_i\) restores the original
density since \(\sum_i x_i=1\). Zero-probability cells are omitted.
Iteration of the affine map in (6.116) has a unique distributional fixed
point: two starts coupled with the same \(V,J\) differ in \(\ell^1\)
distance by at most \(2\prod_{j\le m}(1-V_j)\), which tends to zero.
The partition vector of (6.115) is that fixed point. This proves the
claimed Dirichlet law rather than assuming a convergence theorem for
Dirichlet processes.

For the sequence \((B_n,F_n)\), use common uniforms and quantile
functions to couple \(Z_{n,j}\to Z_j\) almost surely for every
\(j\); convergence of real quantiles holds outside the null set of
discontinuities of the limit quantile. Set
\(V_{n,j}=1-T_j^{1/B_n}\) for common uniforms \(T_j\).
Then every fixed finite set of weights and locations converges. The
remaining mass converges for each fixed \(m\), and its limit tends
to zero as \(m\to\infty\). It follows that
\(Q_n\Rightarrow Q\) almost surely as random probabilities on
\(\mathbb R\).

Use one further common uniform to couple
\(Z_n^*\sim\operatorname{Beta}(1,B_n)\), independently of \(Q_n\),
and form the posterior log-rate probability
\[
P_n^*=(1-Z_n^*)Q_n+Z_n^*\delta_{y_n}.
\tag{6.117}
\]
This is \(DP(B_nF_n+\delta_{y_n})\) by gamma addition; its
exponential pushforward is the posterior in (6.110). The probabilities
\(P_n^*\) converge weakly almost surely to \(P^*\).

### 2. Phase convergence means weak-star convergence, not pointwise convergence

For each coupled sample put
\[
R_n(s)=\int\frac{P_n^*(dz)}{s+e^{z-y_n}},\qquad
\eta_n(u)=\xi_{\exp_*P_n^*}(e^{y_n}u).
\]
For every \(s>0\), the first integrand is bounded and continuous.
Its derivative with respect to \(y\) has absolute value at most
\(1/(4s)\), uniformly in \(z\); this also controls the moving
\(y_n\). Thus \(R_n(s)\to R(s)>0\).
The phase representation, anchored at one, is
\[
\log R_n(s)-\log R_n(1)
=\int_0^\infty\eta_n(u)
 \left[\frac1{s+u}-\frac1{1+u}\right]du,
\qquad 0\le\eta_n\le1.
\tag{6.118}
\]
It follows that \(\eta_n\to\eta\) weak-star in
\(L^\infty(0,\infty)\). Here are the compactness and uniqueness
details. Every subsequence has a further weak-star convergent subsequence:
one may select convergent integrals on a countable dense subset of
\(L^1\), and use the common bound one to extend the resulting
functional. The limiting density lies between zero and one. Passing to
the limit in (6.118) identifies its exponential representation with
that of \(R\); the uniqueness of the SSV phase density identifies it
with \(\eta\) almost everywhere. Every subsequential limit is the
same, proving convergence against every \(L^1\) kernel. Values on
exceptional boundary sets have no effect.

### 3. Pass to the averaged coefficients

The drift kernel \(K\) is in \(L^1\), so its phase integral
converges samplewise. Also
\[
\tfrac12 Z_n^*\le R_n(1)\le1.
\]
For \(B_n\le B_*<\infty\), the common-uniform coupling bounds
\(-\log R_n(1)\) by
\(\log2-\log(1-T^{1/B_*})\), an integrable variable.
This proves convergence of the posterior expectations in the drift.
The other drift terms are continuous. Therefore
\(a_{B_n,F_n}(y_n)\to a_{B,F}(y)\).

After setting \(u=e^v\), the jump integral against a posterior phase
has kernel
\[
J_\varphi(y,u)
=\frac{\varphi(y+\log u)-\varphi(y)-\log u\,\varphi'(y)}{(u-1)^2}.
\tag{6.119}
\]
Its absolute value is bounded by
\(\tfrac12\|\varphi''\|_\infty(\log u)^2/(u-1)^2\),
an \(L^1\) function of \(u\). As \(y_n\to y\), these kernels
converge in \(L^1\) by dominated convergence. Weak-star convergence
of the phases therefore gives convergence of the random integrals.
They are bounded uniformly, so expectations also converge. This proves
(6.113).

For a compactly supported \(\varphi\), the drift term is uniformly
bounded: \(\varphi'\) vanishes outside a fixed compact interval,
and \(|a(y)|\le |y|+C_I\). The jump term is bounded by
\(\pi^2\|\varphi''\|_\infty/3\). This proves the asserted
global bound. Joint continuity implies uniform convergence on compact
\(y\)-sets along a convergent \((B_n,F_n)\): otherwise a bad
sequence of points has a convergent subsequence contradicting (6.113).
Tightness of \(F_n\), the global bound, and ordinary weak convergence
then prove (6.114). \(\square\)

<a id="wip-6-19"></a>
## WIP-6.19 — positive weak evolution with uniform second log-rate moments

**Status: [PROVED POSITIVE WEAK EVOLUTION ON EVERY FINITE TIME INTERVAL;
UNIFORM SECOND LOG-RATE MOMENTS].**

Let \(B_0>0\), \(T<\infty\), and let \(F_0\) be a probability
on \(\mathbb R\) with finite second moment. Set \(B_t=B_0e^{-t}\).
There exists a narrowly continuous curve of probabilities
\((F_t)_{0\le t\le T}\) such that
\[
\begin{gathered}
\sup_{0\le t\le T}\int y^2F_t(dy)<\infty,\\
F_t(\varphi)=F_0(\varphi)+
\int_0^t F_r(\mathcal G_{B_r,F_r}\varphi)\,dr,
\qquad\varphi\in C_c^2(\mathbb R).
\end{gathered}
\tag{6.120}
\]
No uniqueness of this nonlinear measure equation is assumed. Its
identification with powers is a separate proof in WIP-6.20.

### 1. A genuinely positive discrete step

Use a mesh \(h=T/N\), small enough for the estimates below, and
\(\epsilon=\sqrt h\). Freeze \(B,F\) at a mesh point. Define
\[
\begin{aligned}
\lambda_\epsilon(y)&=\int_{|v|>\epsilon} k_{B,F}(y,v)\nu(dv),\\
m_\epsilon(y)&=\int_{|v|>\epsilon} v k_{B,F}(y,v)\nu(dv),\\
a_\epsilon(y)&=a_{B,F}(y)-m_\epsilon(y),\qquad
p_\epsilon(y)=1-h\lambda_\epsilon(y).
\end{aligned}
\tag{6.121}
\]
The exponential tails and inverse-square singularity of \(\nu\) give
\[
\lambda_\epsilon\le C/\epsilon,\qquad
|m_\epsilon|\le C(1+|\log\epsilon|),\qquad
|a_\epsilon(y)|\le |y|+C_I+C(1+|\log\epsilon|).
\tag{6.122}
\]
These constants do not depend on the current measure \(F\).
Since \(B\in[B_0e^{-T},B_0]\), choose \(h\) so that
\(p_\epsilon(y)\ge1/2\) for every state. From \(y\), the
transition probability is exactly
\[
\Pi_h^{B,F}(y,dz)=
p_\epsilon(y)\delta_{\,y+h a_\epsilon(y)/p_\epsilon(y)}(dz)
+h\int_{|v|>\epsilon}\delta_{y+v}(dz)k_{B,F}(y,v)\nu(dv).
\tag{6.123}
\]
It is nonnegative, has total mass one and is a Borel kernel. Starting
with \(F_0^h=F_0\), define deterministically
\(F_{j+1}^h=F_j^h\Pi_h^{B_{jh},F_j^h}\).
All kernels are defined for every probability, so this is an actual
iteration, not a circular use of a future Thorin measure.

If \(\Delta=z-y\) denotes one step, its conditional first two
moments are
\[
\mathbb E(\Delta\mid y)=h a_{B,F}(y),\qquad
\mathbb E(\Delta^2\mid y)=
h\int_{|v|>\epsilon}v^2 k_{B,F}(y,v)\nu(dv)
+\frac{h^2a_\epsilon(y)^2}{p_\epsilon(y)}.
\tag{6.124}
\]
Thus the compensation is exact at the level of the mean; it is not
estimated separately by a divergent first absolute jump moment.

### 2. Uniform moments and temporal compactness

Write \(M_j^h=F_j^h(y^2)\). The drift bound gives
\(2y a(y)\le3y^2+C_I^2\). Equations (6.122)--(6.124),
\(p_\epsilon\ge1/2\), and \(\int v^2\nu<\infty\) yield
\[
M_{j+1}^h\le(1+C_T h)M_j^h+C_T h,
\qquad
\sup_{h,j:jh\le T}M_j^h\le C_{T,B_0,F_0}<\infty.
\tag{6.125}
\]
In obtaining a constant independent of small \(h\), use
\(h(1+|\log h|)^2\le C\). Iterating the elementary scalar
recursion proves the second bound. Every discrete law therefore has
finite second log-rate moment and defines an admissible Thorin measure
\(B_{jh}\exp_*F_j^h\).

For the time estimate, realize the finite chain by these kernels and
write
\(Y_{j+1}-Y_j=h a_{B_{jh},F_j^h}(Y_j)+D_{j+1}\), where the
\(D_{j+1}\) are martingale differences. From (6.124)--(6.125),
\(\mathbb E D_{j+1}^2\le C_T h\), while
\(\mathbb E a_{B_{jh},F_j^h}(Y_j)^2\le C_T\).
Orthogonality of martingale differences and Cauchy--Schwarz for the
drift sum give, for mesh times \(s<t\),
\[
\mathbb E|Y_{t/h}-Y_{s/h}|^2
\le C_T\{(t-s)+(t-s)^2\}.
\tag{6.126}
\]
Only a finite discrete chain is used here; no continuous stochastic
process existence theorem is imported.

Interpolate the laws linearly between consecutive mesh points. A
bounded Lipschitz test changes by at most a constant times
\(\sqrt{|t-s|+h}\), by (6.126) and the adjacent-step estimate.
The uniform moment bound makes all these laws tight on \(\mathbb R\).
Select a weakly convergent subsequence at every rational time by a
diagonal selection; tightness on the real line follows directly from
\(F_j^h(|y|>R)\le C_T/R^2\) and the usual monotone-distribution-
function selection. The common time modulus extends the rational-time
limits to a narrowly continuous curve and gives convergence, uniformly
in time, on bounded Lipschitz tests. Tightness extends this to uniform
convergence on each fixed bounded continuous test. Lower semicontinuity,
or bounded truncations of \(y^2\), preserves (6.125) in the limit.
Thus the limit consists of probabilities, not subprobabilities with
mass lost at an endpoint.

### 3. Consistency and passage through the nonlinear coefficients

For \(\varphi\in C_c^2\), Taylor expansion only at the no-jump
location in (6.123) gives
\[
\left|\frac{\Pi_h^{B,F}\varphi(y)-\varphi(y)}h
-\mathcal G_{B,F}\varphi(y)\right|
\le C\|\varphi''\|_\infty
\left[\epsilon+h\{y^2+1+|\log\epsilon|^2\}\right].
\tag{6.127}
\]
Indeed, the retained jumps combine with \(a_\epsilon\varphi'\)
to give the exactly compensated truncated operator. Its omitted
\(|v|\le\epsilon\) integral is bounded by
\(\tfrac12\|\varphi''\|_\infty\int_{|v|\le\epsilon}v^2\nu(dv)
\le C\epsilon\|\varphi''\|_\infty\).
The no-jump Taylor remainder, divided by \(h\), is at most
\(h\|\varphi''\|_\infty a_\epsilon^2/(2p_\epsilon)\).
This proves the displayed bound uniformly over the current measures.

Integrating (6.127) against \(F_j^h\) and summing the steps gives
a total error on \([0,T]\) bounded by
\[
C_{T,\varphi}\left[\sqrt h+h(1+|\log h|^2)\right]
\longrightarrow0.
\tag{6.128}
\]
Replace interpolated measures in the Riemann sum by their preceding
mesh-point laws. These also converge uniformly in the weak topology,
by the adjacent-step bound. WIP-6.18 shows that
\((B,F)\mapsto F(\mathcal G_{B,F}\varphi)\) is continuous and
uniformly bounded for \(B\in[B_0e^{-T},B_0]\). It therefore
converges along these approximations. One can see uniform convergence
without a compactness assumption on all probabilities: if it failed,
choose bad times, pass to a convergent time subsequence, and use uniform
weak convergence and continuity of the limit curve in (6.114).
The Riemann sums now tend to the integral in (6.120). The interpolated
last partial mesh interval contributes a vanishing error by the same
bound. This proves (6.120) for each fixed test \(\varphi\).
The limit subsequence was selected using only weak compactness, not
depending on this test, so the equation holds for every \(C_c^2\)
test. \(\square\)

## Scope of the construction

The measures in (6.120) are positive for an entire finite time interval,
not merely tangent realizations. Their Thorin admissibility follows from
\[
\int\log(1+1/b)\,B_t\exp_*F_t(db)
\le B_t\{\log2+F_t(|y|)\}<\infty.
\tag{6.129}
\]
Equality of the associated GGC laws with the actual powers requires an
independent argument. That identification, including normalization at
zero Laplace argument, is proved separately in
[WIP-6.20](22-power-flow-identification.md). The combined chain has
passed internal mathematical review; its full-conjecture assembly is in
[WIP-6.21](23-power-theorem-assembly-audit.md), and its completed
requirement-level audit is in
[WIP-6.23](25-mathematical-completion-audit.md). This construction alone
does not assume that identification or nonlinear uniqueness.
