# WIP: Bondesson's GGC power problem

Started: **2026-09-05**.
Status: **active research ledger**.

## Objective and recording rules

The active objective is stated in [CurrentGoal.md](CurrentGoal.md): attempt
Routes 1--5 in ranked order, while retaining Routes 6--7 as deferred paths.
Research stops early only if a complete proof of Bondesson's conjecture or a
rigorous counterexample is obtained.

The conjecture is

\[
X\in GGC,\qquad q\ge1
\quad\stackrel{?}{\Longrightarrow}\quad
X^q\in GGC.
\tag{C1}
\]

Every entry below has one of the following statuses.

- **[PROVED]**: a proof is written in this ledger and its hypotheses have
  been checked.
- **[ESTABLISHED INPUT]**: an external theorem used with a precise source.
- **[REDUCTION]**: a proved equivalence, necessary condition, or sufficient
  condition; its direction is stated.
- **[COMPUTER-VERIFIED EXACT]**: a finite symbolic calculation using exact
  arithmetic; this is not extrapolated beyond the displayed finite claim.
- **[OPEN STEP]**: a precise remaining proof obligation.
- **[REFUTED ROUTE]**: a proposed intermediate assertion shown to be false.
- **[HEURISTIC]**: motivation only, never evidence for a theorem.

No floating-point experiment is used as proof. Exact calculations must name
the script, arithmetic domain, and mathematical identity checked.

## Current result index

| ID | Result | Status |
|---|---|---|
| WIP-0.1 | finite-gamma reduction | proved application of established closure facts |
| WIP-0.2 | two complementary Dirichlet representations | proved |
| WIP-0.3 | multiplicative and sequential closure of the universal exponent set | proved |
| WIP-1.1 | negative moments of a positive stable variable | proved |
| WIP-1.2 | tilted-stable factorization of \(G_B^q\) | proved |
| WIP-1.3 | exact Gamma--Dirichlet reformulation of \(X^q\) | proved |
| WIP-1.4 | finite-Thorin-mass/Dirichlet-mean recognition target | proved reduction |
| WIP-1.5 | generalized Stieltjes transform of the proposed mixing variable | proved; exposes an exact equivalence, not yet a solution |
| WIP-1.6 | \(B=1,q=2\) reduction to an exponential times a squared arcsine mean | proved |
| WIP-1.7 | explicit law of the stable tilt for integer powers | proved |
| WIP-1.8 | one-atom Dirichlet-mean certificate | established input plus proved deduction |
| WIP-1.9 | two-atom transform and posterior-average obstruction | proved reduction |
| WIP-1.10 | the auxiliary mean in the first benchmark is ID but not GGC | proved; refutes only a stronger shortcut |
| WIP-1.11 | exact order-\(1/2\) directing law in the benchmark | proved for every rate contrast; positivity supplied by WIP-5.11 |
| WIP-1.12 | left/right Abel half-integrals and the elasticity gap | proved reduction; a natural pointwise shortcut is rigorously refuted |
| WIP-1.13 | Cauchy duality and the algebraic-density GGC variable \(T_\theta\) | proved; \(T_\theta\) is GGC for all contrasts but its unequal-rate density is not HCM |
| WIP-1.14 | the first nonquadratic test, \(q=3/2\) | proved reduction; obtained a beta--gamma factorization and an exact Wright--beta Stieltjes target, while ruling out the residual-variable GGC shortcut |
| WIP-1.15 | exact \(q=3/2\) half-gamma gates and Wright--Bessel ray | proved the fixed-mass and first two cumulant \(2\times2\) gates strictly positive, proved global and boundary zero-freeness, and reduced the open problem to phase monotonicity on one complex ray |
| WIP-1.16 | first \(3\times3\) gates for the \(q=3/2\) half-gamma model | proved strict positivity at the equal-rate and infinite-contrast endpoints, hence on endpoint neighborhoods; proved that the universal arbitrary-multiplier analogue is false by an exact two-point witness |
| WIP-1.17 | a uniform small-contrast \(q=3/2\) theorem | proved \(X_\theta^{3/2}\in GGC\) for every sufficiently small \(\lvert\theta\rvert\), by an ODE/Wronskian argument and a uniform logarithmic diagonal tube; global pointwise positivity of the resulting two-scale kernel is false |
| WIP-1.18 | failure of the \(HM_{2/3}\) residual shortcut | proved that the exact residual \(N_\theta\) in \(X_\theta^{3/2}\overset d=G_{2/3}N_\theta\) is not \(HM_{2/3}\) for any finite contrast, by a fractional Abel necessary condition and a positive logarithmic asymptotic |
| WIP-1.19 | logarithmic arcsine convolution and radial Klein--Gordon equation | proved an exact even-kernel convolution, PDE, current conservation law, and separation-derivative formula for the remaining all-contrast phase; direct separation integration by parts has the wrong bulk sign and a singular boundary |
| WIP-2.1 | half-shape, reciprocal-rate, \(q=2\) density and exponential-mixture measure | proved |
| WIP-2.2 | explicit negative-axis boundary values | proved |
| WIP-2.3 | phase/ratio criterion for GGC in the benchmark | proved reduction; established analytic inputs cited |
| WIP-2.4 | covariance and tilted-arcsine Stein targets | proved reduction |
| WIP-2.5 | endpoint positivity and the equal-rate case | proved |
| WIP-2.6 | a non-HCM benchmark at \(\theta=3\) | proved |
| WIP-2.7 | positive Volterra kernel and its CM/phase equivalence | proved reduction; established analytic inputs cited |
| WIP-2.8 | large-contrast transition-window positivity | proved asymptotic lemma |
| WIP-2.9 | pair-kernel bounds and a small-contrast GGC theorem | proved |
| WIP-2.10 | tilted Stein kernel and one-turning-point residual | proved reduction |
| WIP-2.11 | tilted-mean criterion and the range \(e^{2\theta}\le3\) | proved partial GGC theorem |
| WIP-2.12 | rational low/high-frequency splice up to \(e^{2\theta}\le7/2\) | proved partial GGC theorem |
| WIP-2.13 | improved pointwise high-frequency window \(\min(z_1,z_2)\ge4/5\) | proved |
| WIP-2.14 | exact low/high-frequency splice through the symmetric rate ratio \(\kappa=4\) | proved partial GGC theorem |
| WIP-3.1 | moment-determinate cumulant criterion implies GGC | proved |
| WIP-3.2 | \(X^q\) is moment determinate for finite gamma \(X\) and \(1<q\le2\) | proved |
| WIP-3.3 | first \(2\times2\) and \(3\times3\) Hankel tests in the benchmark | computer-verified exact; all positive |
| WIP-3.4 | formal PDE and all-order cumulant recurrence | proved |
| WIP-3.5 | connected-permutation expansion and coefficient positivity | proved |
| WIP-3.6 | divided cumulants are an all-order Stieltjes sequence | proved; equivalent monotonicity gap identified |
| WIP-3.7 | finite-Jacobi proof and obstruction | proved |
| WIP-3.8 | explicit equal-rate cumulant measure | established input plus proved deduction |
| WIP-3.9 | squared arcsine factor is not \(HM_{1/2}\) | proved; refutes a stronger shortcut |
| WIP-3.10 | universal first Hankel gates for squares | proved that every finite gamma convolution square passes both \(2\times2\) Stieltjes Hankel tests; obtained exact positive moment-spread decompositions |
| WIP-4.1 | final averaged HCM identity | proved algebraic reduction |
| WIP-4.2 | Sonine--Bessel inverse of each fixed fibre | proved signed representation |
| WIP-4.3 | fully averaged Bernstein inverse | proved exact criterion |
| WIP-4.4 | cut-plane spectral density and Route-2 interface | proved |
| WIP-4.5 | positive product formulas in the small-contrast range | proved |
| WIP-4.6 | rigorous Kontorovich--Lebedev inversion | proved |
| WIP-5.1 | exact shape-matched Dirichlet update | proved algebraic reduction |
| WIP-5.2 | reciprocal Dirichlet duality and the rate-side update | proved |
| WIP-5.3 | fully averaged phase kernel at total shape one | proved reduction |
| WIP-5.4 | golden-ratio rate-cone theorem at total shape one | proved partial Route-5 theorem |
| WIP-5.5 | two obstructions to naive positive recursion | proved; not counterexamples |
| WIP-5.6 | arbitrary fixed rate contrast near a shape-simplex vertex | proved partial Route-5 theorem |
| WIP-5.7 | inverse-Stein and tilted-mean cones for total shape one | proved partial Route-5 theorem |
| WIP-5.8 | Beta--Faddeeva one-dimensional sign reduction | proved reduction; remaining interior cancellation isolated |
| WIP-5.9 | Faddeeva single-crossing cone | proved partial Route-5 theorem; complementary to the tilted-mean cone |
| WIP-5.10 | compressed Faddeeva pairing and a uniform two-rate cone through \(\kappa=10\) | proved partial Route-5 theorem; exact Bernstein-basis certificate |
| WIP-5.11 | true-lobe comparison for the complete two-rate, total-shape-one square problem | proved Route-5 theorem for all complementary shapes and all rate contrasts |
| WIP-5.12 | multirate first-cut pairing and exact three-rate extension obstructions | proved conditional extension and two structural obstructions; not a counterexample |
| WIP-5.13 | an enlarged algebraic first-cut lobe cone beyond support nesting | proved sufficient condition; the WIP-5.12 three-rate example lies strictly inside it |
| WIP-5.14 | weighted multicut phase centering and the residual covariance | proved general decomposition and a multirate global sufficient cone; its central covariance was later bypassed by WIP-5.26 |
| WIP-5.15 | critical polynomial and directly checkable multirate cones | proved explicit forms and a three-rate exact certificate |
| WIP-5.16 | three-rate interface, finite-prefix reduction, and phase-aware cones | proved reductions and conditional cones; the second rising prefix was later closed by WIP-5.26 |
| WIP-5.17 | upper-prefix Möbius cancellation | proved obstruction to a reflected copy of the first-cut proof; not a counterexample |
| WIP-5.18 | zero-temperature mass ratios and a complete three-rate certificate | proved a new sufficient theorem, with exact and root-free parameter tests |
| WIP-5.19 | regularized upper tail and adjacent-cut transport | proved a uniform second-prefix cone and a new exact three-rate GGC example |
| WIP-5.20 | multicut zero-temperature phase capacity | proved an arbitrary finite-rate sufficient theorem and a sharper three-rate threshold |
| WIP-5.21 | exact and averaged adjacent-cut transport | proved the quadratic transport maximum, a strict hierarchy of certificates, and two exact examples |
| WIP-5.22 | full lower-buffer and regularized upper-tail criteria | proved endpoint, mass, and explicit upper-tail cones; refuted a one-curvature Jensen shortcut |
| WIP-5.23 | peak-gap-free lower-triangular phase capacity | proved an arbitrary finite-rate theorem allowing simultaneous active cuts; gave an exact strict-separation example |
| WIP-5.24 | arbitrary-shape two-rate phase kernel and the symmetric integer ladder | proved a \(0<B\le2\) criterion, an \(HM_m\) theorem, and sharp endpoint obstructions to the direct invariant |
| WIP-5.25 | universal last-cut endpoint balance | proved the full unweighted endpoint balance is strictly positive by conditional two-rate mixing |
| WIP-5.26 | all-cut conditional balance | proved the square theorem for every finite gamma convolution of total shape one |
| WIP-5.27 | fractional \(HM_k\) inversion for the symmetric affine beta mean | proved \(M^2\in HM_k\iff k\ge1\), and the two-rate symmetric square theorem for every real \(k\ge1\) |
| WIP-5.28 | arbitrary two-rate shapes at total shape two | proved every two-rate gamma convolution of total shape two has a GGC square; identified the endpoint Thorin atoms |
| WIP-5.29 | downward propagation in total shape | proved that a fixed-\(q\), arbitrary-support theorem at total shape \(B_0\) implies every smaller positive total shape; hence every finite gamma convolution of total shape at most one has a GGC square |
| WIP-5.30 | hypergeometric Thorin measure for every two-rate square | proved the two-rate square theorem for all positive shapes and rates; identified the explicit finite Thorin measure of its gamma--beta factor and an order-\(B/2\) Dirichlet-mean law for the squared affine beta mean |
| WIP-5.31 | failure of pointwise kernel positivity below total shape two | proved that the WIP-5.24 pointwise kernel is negative on an open set for every \(0<B\le2\), despite its beta average being positive |
| WIP-5.32 | exact third-atom conditioning and the failure of naive barycentric recursion | proved the conditional Thorin update and its nonlinear tilted quotient; strict Jensen, local concavity, moment corrections, and order mismatch rule out the literal positive-kernel recursion |
| WIP-5.33 | three-rate Lauricella--Appell reduction | proved the exact Appell representation and two-rate degeneration; a negative mixed logarithmic coefficient rules out a fixed positive multivariate Markov kernel for unequal shapes |
| WIP-5.34 | the three-exponential square theorem | proved that the square of a sum of three arbitrarily scaled independent exponentials is GGC; constructed an explicit rate-form Thorin measure from two increasing boundary angles |
| WIP-5.35 | three rates at total shape two | proved the square theorem when the three positive shapes sum to two and each is at most one; constructed a mass-one Thorin measure by a Markov--Krein/Möbius phase argument |
| WIP-5.36 | physical Appell curve and Abel-ratio gate | proved an exact Appell contiguous-quotient formula and, for total shape below two, equivalence with monotonicity of one real Abel-integral ratio |
| WIP-5.37 | unrestricted three-rate total-shape-two theorem | removed the coordinatewise shape restriction using a repaired right-cut identity, Hadamard finite parts, and reciprocal Dirichlet duality; identified the endpoint or knot Thorin atom |
| WIP-5.38 | three-rate Abel-knot analysis below total shape two | proved that every endpoint and middle-knot phase jump has the correct sign and identified all possible Thorin atoms; when the middle shape is below \(k\), proved strict Abel-ratio decrease in punctured knot neighborhoods through a Gauss-Wronskian formula |
| WIP-5.39 | full-interval Abel monotonicity with endpoint shapes at most one | proved the complete three-rate square theorem for \(1<B<2\) whenever the shapes carried by the two extreme scales are at most one; the rates are arbitrary, and a possible shape above one may occur at the middle scale |

At this point there is **no proof and no counterexample** to (C1).

## Stage 0: common infrastructure

### WIP-0.1 — finite-gamma reduction

**Status: [PROVED], using established GGC weak density and weak closure.**

Fix \(q\ge1\). Assume that \(S^q\in GGC\) for every finite gamma convolution
\(S\). For any \(X\in GGC\), choose finite gamma convolutions \(S_n\) with

\[
S_n\Rightarrow X.
\]

The continuous mapping theorem gives

\[
S_n^q\Rightarrow X^q.
\]

Each \(S_n^q\) is GGC by the hypothesis, and GGC is weakly closed. Hence
\(X^q\in GGC\).

The approximation must include any deterministic drift. A positive constant
is itself a weak limit of gamma variables concentrated at their means, so
this does not enlarge the target class.

### WIP-0.2 — the two Dirichlet representations

**Status: [PROVED].**

Let

\[
X=\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i},
\qquad
B=\sum_{i=1}^n\beta_i,
\tag{0.1}
\]

where the gamma variables have unit rate.

Put

\[
T=\sum_iG_{\beta_i}^{(i)},\qquad
P_i=\frac{G_{\beta_i}^{(i)}}{T}.
\]

The change of variables from the gamma coordinates to
\((T,P_1,\ldots,P_{n-1})\) has Jacobian \(T^{n-1}\). Its joint density
factors into a \(\Gamma(B,1)\) density and a
\(\operatorname{Dir}(\beta_1,\ldots,\beta_n)\) density. Consequently,

\[
X\overset d=G_BM,\qquad
M=\sum_{i=1}^n\frac{P_i}{b_i},\qquad G_B\perp M.
\tag{0.2}
\]

A separate simplex substitution \(x_i=xq_i\) in the convolution density has
Jacobian \(x^{n-1}\) and gives

\[
f_X(x)=
\frac{\prod_i b_i^{\beta_i}}{\Gamma(B)}
x^{B-1}\mathbb E[e^{-Rx}],
\qquad
R=\sum_i b_iQ_i,
\tag{0.3}
\]

where \(Q\sim\operatorname{Dir}(\beta_1,\ldots,\beta_n)\).

Although \(P\) and \(Q\) have the same Dirichlet law, (0.2) and (0.3) are
different distributional representations and will not be identified as one
coupling.

### WIP-0.3 — the universal exponent semigroup

**Status: [PROVED].**

Define

\[
\mathcal Q=
\left\{
q\ge1:\ X\in GGC\Longrightarrow X^q\in GGC
\text{ for every }X
\right\}.
\tag{0.4}
\]

If \(p,q\in\mathcal Q\), then

\[
X\in GGC
\Longrightarrow X^p\in GGC
\Longrightarrow (X^p)^q=X^{pq}\in GGC,
\]

so \(pq\in\mathcal Q\).

If \(q_j\in\mathcal Q\) and \(q_j\to q\ge1\), then for fixed \(X\in GGC\),

\[
X^{q_j}\longrightarrow X^q
\quad\text{almost surely}.
\]

Weak closure of GGC gives \(q\in\mathcal Q\). Thus \(\mathcal Q\) is
multiplicatively and sequentially closed.

It follows that either of the following would prove (C1).

1. Prove \((1,2]\subset\mathcal Q\). For arbitrary \(Q>1\), choose \(m\)
   such that \(r=Q^{1/m}\in(1,2]\), and iterate \(m\) times.
2. Prove that some universal sequence \(r_j\downarrow1\) is contained in
   \(\mathcal Q\). For fixed \(Q>1\), take
   \[
   m_j=\left\lfloor\frac{\log Q}{\log r_j}\right\rfloor.
   \]
   Then \(r_j^{m_j}\in\mathcal Q\) and \(r_j^{m_j}\to Q\).

This justifies concentrating several routes on \(1<q\le2\) or on a sequence
approaching \(1\).

## Route 1: Gamma--Dirichlet means and a tilted stable variable

Throughout this section,

\[
q>1,\qquad \rho=\frac1q,\qquad k=\rho B.
\]

### WIP-1.1 — negative stable moments

**Status: [PROVED].**

Let \(S_\rho\) be normalized by

\[
\mathbb E[e^{-\lambda S_\rho}]=e^{-\lambda^\rho}.
\]

For \(u>0\), Tonelli and the gamma integral give

\[
\begin{aligned}
\mathbb E[S_\rho^{-u}]
&=
\frac1{\Gamma(u)}
\int_0^\infty
\lambda^{u-1}\mathbb E[e^{-\lambda S_\rho}]\,d\lambda\\
&=
\frac1{\Gamma(u)}
\int_0^\infty\lambda^{u-1}e^{-\lambda^\rho}\,d\lambda\\
&=
\frac{\Gamma(u/\rho)}{\rho\Gamma(u)}
=
\frac{\Gamma(1+u/\rho)}{\Gamma(1+u)}.
\end{aligned}
\tag{1.1}
\]

All integrands before the change of variables are nonnegative, so Tonelli
requires no prior integrability assertion.

### WIP-1.2 — the tilted-stable gamma-power factorization

**Status: [PROVED].**

Define \(T_{\rho,B}\) by

\[
\mathbb E[f(T_{\rho,B})]
=
\frac{\mathbb E[S_\rho^{-k}f(S_\rho)]}
     {\mathbb E[S_\rho^{-k}]},
\qquad k=\rho B.
\tag{1.2}
\]

Let \(G_k\sim\Gamma(k,1)\) be independent of \(T_{\rho,B}\), and put
\(Z=G_k/T_{\rho,B}\). Conditional on \(T_{\rho,B}=t\),

\[
f_{Z\mid t}(z)=
\frac{t^k}{\Gamma(k)}z^{k-1}e^{-tz}.
\]

If \(f_\rho\) denotes the density of \(S_\rho\), averaging against the tilted
density \(t^{-k}f_\rho(t)/\mathbb E[S_\rho^{-k}]\) cancels \(t^k\):

\[
\begin{aligned}
f_Z(z)
&=
\frac{z^{k-1}}{\Gamma(k)\mathbb E[S_\rho^{-k}]}
\int_0^\infty e^{-tz}f_\rho(t)\,dt\\
&=
\frac{z^{k-1}e^{-z^\rho}}
{\Gamma(k)\mathbb E[S_\rho^{-k}]}.
\end{aligned}
\]

By (1.1),

\[
\Gamma(k)\mathbb E[S_\rho^{-k}]
=
\Gamma(k)\frac{\Gamma(1+B)}{\Gamma(1+k)}
=\frac{\Gamma(B)}{\rho}.
\]

Therefore

\[
f_Z(z)=
\frac{\rho}{\Gamma(B)}z^{\rho B-1}e^{-z^\rho},
\tag{1.3}
\]

which is exactly the density obtained from \(G_B\) under
\(z=x^{1/\rho}=x^q\). Hence

\[
\boxed{
G_B^q\overset d=\frac{G_{\rho B}}{T_{\rho,B}}.
}
\tag{1.4}
\]

This is a density proof and does not depend on a moment-determinacy
argument.

### WIP-1.3 — exact reformulation for a finite gamma convolution

**Status: [PROVED REDUCTION].**

Combining (0.2) and (1.4), using independent copies on the right, gives

\[
\boxed{
X^q\overset d=
G_{\rho B}N_{\rho,B,F},
\qquad
N_{\rho,B,F}:=\frac{M^q}{T_{\rho,B}},
}
\tag{1.5}
\]

where \(G_{\rho B}\) is independent of \(N_{\rho,B,F}\).

Thus a sufficient target is to prove that \(N_{\rho,B,F}\) is an
order-\(\rho B\) Dirichlet mean.

### WIP-1.4 — why the Dirichlet-mean target is essentially exact

**Status: [PROVED REDUCTION] for finite gamma convolutions without drift.**

Let \(c>0\), let \(F\) be a probability measure on positive scales, and let
\(M_c(F)\) be its order-\(c\) Dirichlet mean. The Markov--Krein identity is

\[
\mathbb E[(1+sM_c(F))^{-c}]
=
\exp\left\{
-c\int_0^\infty\log(1+sx)\,F(dx)
\right\}.
\tag{1.6}
\]

Since

\[
\mathbb E[e^{-sG_cM}\mid M]=(1+sM)^{-c},
\]

the product \(G_cM_c(F)\) is a GGC whose scale-form Thorin measure is
\(cF\). Conversely, a zero-drift GGC with finite Thorin mass \(c\) has this
representation by normalizing its Thorin measure.

For the finite gamma convolution (0.1),

\[
f_X(x)\sim
\frac{\prod_i b_i^{\beta_i}}{\Gamma(B)}x^{B-1}
\quad(x\downarrow0).
\]

Consequently,

\[
f_{X^q}(y)\sim
\frac{\rho\prod_i b_i^{\beta_i}}{\Gamma(B)}
y^{\rho B-1}.
\tag{1.7}
\]

Laplace scaling then gives

\[
\psi_q(s)\sim C s^{-\rho B},
\qquad
-\frac{s\psi_q'(s)}{\psi_q(s)}\longrightarrow\rho B.
\tag{1.8}
\]

If \(X^q\) is GGC, the Thorin representation and monotone convergence imply
that the limit in (1.8) is its total Thorin mass; it is therefore exactly
\(\rho B\), with no drift.

It remains to justify cancellation of the gamma factor.  If the finite-mass
representation gives \(X^q\overset d=G_{\rho B}D\), while (1.5) gives
\(X^q\overset d=G_{\rho B}N\), with independence in each product, then for
every \(t\in\mathbb R\)

\[
\frac{\Gamma(\rho B+it)}{\Gamma(\rho B)}
\mathbb E[D^{it}]
=
\frac{\Gamma(\rho B+it)}{\Gamma(\rho B)}
\mathbb E[N^{it}].
\]

The gamma function has no zeros.  Cancelling it identifies the
characteristic functions of \(\log D\) and \(\log N\), hence
\(D\overset d=N\).  The converse direction follows immediately from the
Markov--Krein identity.

Hence, for finite gamma \(X\),

\[
X^q\in GGC
\quad\Longleftrightarrow\quad
N_{\rho,B,F}\text{ in (1.5) is an order-}\rho B
\text{ Dirichlet mean}.
\tag{1.9}
\]

The stable--Dirichlet route is therefore an exact structural re-encoding of
the problem, not a stronger arbitrary sufficient condition.

### WIP-1.5 — generalized Stieltjes transform of the candidate mean

**Status: [PROVED]; this calculation exposes the remaining gap.**

Let \(N=M^q/T_{\rho,B}\) and \(k=\rho B\). Conditional on \(M\), the tilt in
(1.2) gives

\[
\begin{aligned}
\mathbb E[(1+sN)^{-k}\mid M]
&=
\frac{\mathbb E[
S_\rho^{-k}(1+sM^q/S_\rho)^{-k}
]}{\mathbb E[S_\rho^{-k}]}\\
&=
\frac{\mathbb E[(S_\rho+sM^q)^{-k}]}
{\mathbb E[S_\rho^{-k}]}.
\end{aligned}
\tag{1.10}
\]

Using a gamma integral and then (1.1),

\[
\mathbb E[(1+sN)^{-k}]
=
\frac{\rho}{\Gamma(B)}
\int_0^\infty
u^{\rho B-1}e^{-u^\rho}
\mathbb E[e^{-suM^q}]\,du.
\tag{1.11}
\]

Set \(v=u^\rho\). Since \(M^q=M^{1/\rho}\),

\[
uM^q=(vM)^{1/\rho}=(vM)^q
\]

and (1.11) becomes

\[
\begin{aligned}
\mathbb E[(1+sN)^{-k}]
&=
\frac1{\Gamma(B)}
\int_0^\infty
v^{B-1}e^{-v}\mathbb E[e^{-s(vM)^q}]\,dv\\
&=
\mathbb E[e^{-s(G_BM)^q}]
=\psi_q(s).
\end{aligned}
\tag{1.12}
\]

Equation (1.12) is consistent with (1.5), but it also shows that merely
computing this generalized Stieltjes transform does not solve the problem:
one must prove that its logarithm has the Markov--Krein form (1.6). The
route's possible gain must come from a new stable/Poisson--Dirichlet identity,
not from the transform calculation alone.

### WIP-1.6 — a sharp \(B=1,q=2\) target

**Status: [PROVED REDUCTION].**

For \(\rho=1/2\),

\[
S_{1/2}\overset d=\frac1{4G_{1/2}}.
\tag{1.13}
\]

When \(B=1\), the tilt exponent is \(k=1/2\). Tilting
\((4G_{1/2})^{1/2}\) changes \(G_{1/2}\) into \(G_1\), so

\[
T_{1/2,1}\overset d=\frac1{4G_1}.
\tag{1.14}
\]

For the two-gamma model with
\(\beta_1=\beta_2=1/2\),

\[
M=c_2+(c_1-c_2)U,
\qquad U\sim\operatorname{Beta}(1/2,1/2),
\]

and (1.5) becomes

\[
X^2\overset d=
G_{1/2}\,
\left[
4G_1\bigl(c_2+(c_1-c_2)U\bigr)^2
\right].
\tag{1.15}
\]

Thus the first concrete Route 1 problem is:

> **[OPEN STEP R1-A]** Prove or disprove that
> \[
> 4G_1\bigl(c_2+(c_1-c_2)U\bigr)^2
> \]
> is an order-\(1/2\) Dirichlet mean for every \(c_1,c_2>0\).

This is strictly sharper than the original two-gamma formulation and is the
next structural target.

### WIP-1.7 — the stable tilt for integer powers

**Status: [PROVED].**

The Mellin transform following from (1.1)--(1.2) is

\[
\mathbb E[T_{\rho,B}^{-z}]
=
\frac{\Gamma(B+z/\rho)\Gamma(\rho B)}
     {\Gamma(B)\Gamma(\rho B+z)},
\qquad \Re z>-\rho B.
\tag{1.16}
\]

If \(q=m\in\{2,3,\ldots\}\), so that \(\rho=1/m\), Gauss'
multiplication formula cancels the \(k=0\) factor and gives

\[
\boxed{
T_{1/m,B}^{-1}
\overset d=
m^m\prod_{j=1}^{m-1}G_{(B+j)/m},
}
\tag{1.17}
\]

where the gamma variables on the right are independent.  Equality follows
from the Mellin transforms on a real neighborhood of zero, equivalently
from uniqueness of the moment-generating function of the logarithm.

In particular,

\[
\boxed{
T_{1/2,B}^{-1}\overset d=4G_{(B+1)/2}.
}
\tag{1.18}
\]

Consequently the \(q=2\) Dirichlet-mean target for an arbitrary finite
gamma convolution is

\[
N_{1/2,B,F}
\overset d=
4G_{(B+1)/2}M^2.
\tag{1.19}
\]

This generalizes (1.14)--(1.15); it does not by itself prove that the
right-hand side is an order-\(B/2\) Dirichlet mean.

### WIP-1.8 — the one-atom case closes

**Status: [ESTABLISHED INPUT plus PROVED DEDUCTION].**

If \(F=\delta_c\), then \(M=c\) and

\[
X^q=c^qG_B^q,\qquad
N=\frac{c^q}{T_{\rho,B}}.
\]

Gamma densities are HCM, and Bondesson's power theorem says that an
HCM-density random variable remains HCM under powers of absolute value at
least one.  Hence \(c^qG_B^q\) is GGC.  Its density

\[
f(y)=
\frac{\rho c^{-B}}{\Gamma(B)}
y^{\rho B-1}\exp\{-y^\rho/c\}
\tag{1.20}
\]

has Thorin mass \(\rho B\).  Applying the finite-mass equivalence in
WIP-1.4 yields

\[
\boxed{
\frac{c^q}{T_{\rho,B}}
\text{ is an order-}\rho B\text{ Dirichlet mean}.
}
\tag{1.21}
\]

Thus Route 1 is complete for a single Thorin atom.  For \(q=2\), its
explicit mean variable is \(4c^2G_{(B+1)/2}\).

The external inputs are Bondesson (2015), Proposition 4(a), p. 1066, and
the finite-Thorin-mass gamma--Dirichlet representation in
James--Roynette--Yor (2008), Proposition 1.3 and equations (33)--(38),
pp. 355--358.

### WIP-1.9 — exact two-atom transforms and the posterior obstruction

**Status: [PROVED REDUCTION].**

For two atoms, write

\[
M=m(U):=c_2+(c_1-c_2)U,\qquad
U\sim\operatorname{Beta}(\beta_1,\beta_2),\qquad
B=\beta_1+\beta_2.
\tag{1.22}
\]

Let

\[
\ell_{B,q}(z):=\mathbb E[e^{-zG_B^q}].
\]

Then the generalized Stieltjes transform of \(N=M^q/T_{\rho,B}\) is

\[
K_2(s)
=
\int_0^1\ell_{B,q}(s\,m(u)^q)
\frac{u^{\beta_1-1}(1-u)^{\beta_2-1}}
     {\mathrm B(\beta_1,\beta_2)}\,du.
\tag{1.23}
\]

Equivalently, it has the positive two-dimensional kernel

\[
\begin{aligned}
K_2(s)
=\frac{\rho}{\Gamma(B)\mathrm B(\beta_1,\beta_2)}
\int_0^\infty&r^{\rho B-1}e^{-r^\rho}\\
{}\times\int_0^1&
u^{\beta_1-1}(1-u)^{\beta_2-1}
e^{-sr m(u)^q}\,du\,dr .
\end{aligned}
\tag{1.24}
\]

For \(\Re z>-\rho B\), its Mellin transform is

\[
\boxed{
\mathbb E[N^z]
=
\frac{\Gamma(B+qz)\Gamma(\rho B)}
     {\Gamma(B)\Gamma(\rho B+z)}
c_2^{qz}\,
{}_2F_1\!\left(
-qz,\beta_1;B;1-\frac{c_1}{c_2}
\right).
}
\tag{1.25}
\]

These formulas are exact, but a positive mixture is not yet the fixed
Markov--Krein directing measure that is needed.  To expose the obstruction,
put \(k=\rho B\),

\[
h_m(s):=
-\frac1k\frac{d}{ds}\log\ell_{B,q}(s m^q),
\]

and introduce the \(s\)-dependent posterior beta law

\[
\pi_s(du)=
\frac{\ell_{B,q}(s m(u)^q)}{K_2(s)}
\frac{u^{\beta_1-1}(1-u)^{\beta_2-1}}
     {\mathrm B(\beta_1,\beta_2)}\,du.
\tag{1.26}
\]

The normalized logarithmic derivative is

\[
H_2(s):=-\frac1k\frac{K_2'(s)}{K_2(s)}
=\mathbb E_{\pi_s}[h_{m(U)}(s)].
\tag{1.27}
\]

Each single-atom \(h_m\) is Stieltjes by WIP-1.8.  Directly differentiating
the posterior average gives

\[
\boxed{
H_2'(s)
=
\mathbb E_{\pi_s}[h_{m(U)}'(s)]
-k\,\operatorname{Var}_{\pi_s}(h_{m(U)}(s))
\le0.
}
\tag{1.28}
\]

Thus the first nontrivial monotonicity condition holds.  At the next order,
however,

\[
H_2''(s)
=
\mathbb E_{\pi_s}[h_m''(s)]
-3k\,\operatorname{Cov}_{\pi_s}(h_m,h_m')
+k^2\kappa_{3,\pi_s}(h_m),
\tag{1.29}
\]

and the last two terms have no evident joint sign.  In particular,
“average the one-atom Thorin measures” is invalid: the averaging measure
\(\pi_s\) depends on \(s\), and on the cut plane it would in general be a
complex weight.

For later moment tests, the raw moments are

\[
\mathbb E[(X^q)^r]
=
\frac{\Gamma(B+qr)}{\Gamma(B)}
c_2^{qr}\,
{}_2F_1\!\left(
-qr,\beta_1;B;1-\frac{c_1}{c_2}
\right).
\tag{1.30}
\]

> **[OPEN STEP R1-B]** In the two-atom case, prove that \(H_2\) is
> Stieltjes (equivalently, recover a fixed positive directing measure), or
> find a violation of its Pick/Stieltjes boundary condition.  For \(q=2\),
> this is the same problem as proving that
> \(4G_{(B+1)/2}M^2\) is an order-\(B/2\) Dirichlet mean.

### WIP-1.10 — the first auxiliary mean is not itself GGC

**Status: [PROVED; REFUTED ROUTE].**

In the benchmark of WIP-1.6, normalize the two scale atoms as

\[
l=e^{-\theta},\qquad r=e^\theta,\qquad lr=1,\qquad \theta>0,
\]

and let \(M\) have the arcsine law on \([l,r]\).  The auxiliary variable in
(1.15) is

\[
N=4G_1M^2,
\tag{1.31}
\]

with \(G_1\) independent of \(M\).  We now prove that \(N\) is infinitely
divisible but is not GGC.

Conditioning on \(M\) first gives

\[
L_N(s)=\mathbb E\left[\frac1{1+4sM^2}\right].
\tag{1.32}
\]

The arcsine resolvent is

\[
\mathbb E\left[\frac1{1+kM}\right]
=\frac1{\sqrt{(1+kl)(1+kr)}}
=\frac1{\sqrt{1+2ak+k^2}},
\qquad a=\frac{l+r}{2}.
\tag{1.33}
\]

Applying (1.33) after the elementary partial-fraction decomposition of
\((1+4sM^2)^{-1}\), and then squaring, yields

\[
L_N(s)=\frac12\left[
\frac1{\sqrt{1-4s+4ia\sqrt s}}+
\frac1{\sqrt{1-4s-4ia\sqrt s}}
\right],
\]

initially for \(s>0\), with conjugate square-root branches. Their product
is \(\Delta(s)\), and elementary simplification gives

\[
\boxed{
L_N(s)^2=
\frac{\Delta(s)+1-4s}{2\Delta(s)^2},
\qquad
\Delta(s)=
\sqrt{1+4l^2s}\sqrt{1+4r^2s}.
}
\tag{1.34}
\]

Both square roots in (1.34) are their principal branches; this convention
matters on the cut.  Put

\[
x_-:=\frac{l^2}{4},\qquad x_+:=\frac{r^2}{4}.
\]

For \(x\in(x_-,x_+)\), the upper boundary value is

\[
\Delta(-x+i0)=i\delta(x),
\qquad
\delta(x)=
\sqrt{(1-4l^2x)(4r^2x-1)}.
\tag{1.35}
\]

Consequently,

\[
L_N(-x+i0)^2
=-
\frac{1+4x+i\delta(x)}{2\delta(x)^2}.
\tag{1.36}
\]

Since a Stieltjes transform has its upper boundary value in the lower half
plane, the correct square-root branch in (1.36) has

\[
\arg L_N(-x+i0)
=-\frac\pi2+
\frac12\arctan\frac{\delta(x)}{1+4x}.
\tag{1.37}
\]

Thus the canonical phase of the reciprocal complete Bernstein function
\(1/L_N\), on this interval, would have to equal

\[
\boxed{
\eta_N(x)=
\frac12-
\frac1{2\pi}\arctan\frac{\delta(x)}{1+4x}.
}
\tag{1.38}
\]

As \(x\downarrow x_-\) from inside the interval,

\[
\delta(x)=C_\theta\sqrt{x-x_-}\bigl(1+O(x-x_-)\bigr),
\qquad C_\theta>0.
\]

Hence \(\delta(x)/(1+4x)\) is strictly increasing immediately to the
right of \(x_-\), and (1.38) is strictly decreasing there.  The
Thorin--Bernstein criterion in WIP-2.3 requires the canonical phase to have
a nondecreasing representative.  A strict decrease on an interval cannot
be repaired by changing an almost-everywhere representative.  Therefore

\[
\boxed{\theta>0\quad\Longrightarrow\quad N\notin GGC.}
\tag{1.39}
\]

On the other hand, conditioning on \(M\) gives the density

\[
f_N(x)=
\mathbb E\left[
\frac1{4M^2}\exp\left\{-\frac{x}{4M^2}\right\}
\right],
\tag{1.40}
\]

which is completely monotone.  The Goldie--Steutel theorem therefore gives
\(N\in ID\).

This does **not** refute Conjecture 1.  It rigorously rules out only the
stronger shortcut “prove the mixing variable \(N\) itself is HCM/GGC.”  By
itself it does not decide whether \(N\) is an order-\(1/2\) Dirichlet mean;
WIP-1.11 below gives the exact equivalent test, and WIP-5.11 later settles
it positively for every rate contrast.

### WIP-1.11 — exact order-\(1/2\) directing law in the benchmark

**Status: [PROVED FOR EVERY RATE CONTRAST], with the reduction below and
positivity supplied by WIP-5.11.**

For \(\theta>0\), continue with \(l=e^{-\theta}\), \(r=e^\theta\), and let
\(D\) have the arcsine density

\[
p_\theta(d)=
\frac{\mathbf1_{(l,r)}(d)}{\pi\sqrt{(d-l)(r-d)}}.
\]

At \(\theta=0\) use the degenerate convention \(D\equiv1\), equivalently
the weak limit as \(\theta\downarrow0\).

Let \(E\sim\Gamma(1,1)\) be independent and set \(N=4ED^2\).  To avoid
confusing this random variable with the numerator \(N_\theta\) of Route 2,
write in this section

\[
Q_\theta(u)=\mathbb E[e^{-u^2D^2}],
\quad
P_\theta(u)=\mathbb E[e^{-u^2D^2}\operatorname{erfi}(uD)],
\quad
R_\theta(u)=\frac{P_\theta(u)}{Q_\theta(u)}.
\]

Thus \(P_\theta=N_\theta\) and \(R_\theta=\mathcal R_\theta\) in the notation
of (2.23)--(2.24).  Define, with the principal square root,

\[
K_\theta(z)=\mathbb E[(z+N)^{-1/2}],
\qquad z\in\mathbb C\setminus(-\infty,0].
\]

Conditioning on \(D=d\) gives

\[
\mathbb E[(z+4d^2E)^{-1/2}]
=\frac{\sqrt\pi}{2d}e^{z/(4d^2)}
\operatorname{erfc}\!\left(\frac{\sqrt z}{2d}\right).
\tag{1.41}
\]

Because \(lr=1\), inversion preserves the arcsine law with a size weight:

\[
\mathbb E[h(D^{-1})]=\mathbb E[D^{-1}h(D)],
\qquad
\mathbb E[D^{-1}h(D^{-1})]=\mathbb E[h(D)].
\tag{1.42}
\]

This follows directly by substituting \(d\mapsto d^{-1}\) in the displayed
density.  Applying the second identity to (1.41) yields

\[
K_\theta(z)=\frac{\sqrt\pi}{2}\mathbb E\!\left[
e^{zD^2/4}\operatorname{erfc}\!\left(\frac{D\sqrt z}{2}\right)
\right].
\tag{1.43}
\]

Consequently, for \(x>0\) and \(u=\sqrt x/2\),

\[
\boxed{
K_\theta(-x+i0)=\frac{\sqrt\pi}{2}
\bigl(Q_\theta(u)-iP_\theta(u)\bigr).
}
\tag{1.44}
\]

If \(M_{1/2}(F)\) is a Dirichlet mean of order \(1/2\), its homogeneous
Markov--Krein identity is

\[
\mathbb E[(z+M_{1/2}(F))^{-1/2}]
=\exp\left\{-\frac12\int_0^\infty\log(z+y)\,F(dy)\right\}.
\tag{1.45}
\]

At every continuity point of \(F\), the upper boundary in (1.45) has
argument \(-\pi F(x)/2\).  Equation (1.44) therefore shows that the
directing probability law, if it exists, is unique and must have CDF

\[
\boxed{
F_\theta(x)=\frac2\pi
\arctan R_\theta\!\left(\frac{\sqrt x}{2}\right),
\qquad x>0.
}
\tag{1.46}
\]

There is no phase-wrapping ambiguity because the order-\(1/2\) boundary
phase lies in \((-\pi/2,0)\).  The endpoint expansions (2.31)--(2.33) give

\[
F_\theta(0+)=0,
\qquad F_\theta(\infty)=1,
\]

and

\[
\boxed{
F_\theta'(x)=
\frac{R_\theta'(\sqrt x/2)}
{2\pi\sqrt x\,[1+R_\theta(\sqrt x/2)^2]}.
}
\tag{1.47}
\]

More precisely,

\[
F_\theta(x)\sim\frac{2\cosh\theta}{\pi^{3/2}}\sqrt x
\quad(x\downarrow0),
\]

while, for \(\theta>0\),

\[
1-F_\theta(x)
\sim\frac{1}{\pi\sqrt{e^{-\theta}\sinh\theta}}
e^{-e^{-2\theta}x/4}
\quad(x\to\infty).
\tag{1.48}
\]

At \(\theta=0\), \(R_0=\operatorname{erfi}\) gives the same required
logarithmic integrability.  Hence a nondecreasing (1.46) is automatically
an admissible Markov--Krein base law.  Combining WIP-1.4 with the exact
phase criterion in WIP-2.3 proves the chain of equivalences

\[
\boxed{
N\in\mathcal D_{1/2}
\Longleftrightarrow F_\theta\text{ in (1.46) is a probability CDF}
\Longleftrightarrow R_\theta'(u)\ge0\ (u>0)
\Longleftrightarrow X_\theta^2\in GGC,
}
\tag{1.49}
\]

where \(\mathcal D_{1/2}\) denotes the laws of order-\(1/2\) Dirichlet
means and \(X_\theta^2\overset d=G_{1/2}N\), with independent factors on
the right.  The reverse implications here use the gamma-cancellation
equivalence of WIP-1.4 and the full CBF/TBF phase theorem of WIP-2.3; they
are not inferred from a boundary argument alone.

By (2.56),

\[
0\le\theta\le\frac12\log\frac{1+\sqrt5}{2}
\quad\Longrightarrow\quad R_\theta'(u)>0\quad(u>0).
\tag{1.50}
\]

This was the first nontrivial range obtained within Route 1.  The
all-contrast theorem (5.91) and the equivalences (1.49) now upgrade it to

\[
\boxed{
\theta\ge0
\quad\Longrightarrow\quad
R_\theta'(u)>0\ (u>0)
\quad\Longrightarrow\quad
F_\theta\text{ is a directing probability law}.
}
\tag{1.50a}
\]

Therefore (1.46)--(1.47) give an explicit absolutely continuous directing
law for every unequal rate pair.  If
\(\mathsf P_\theta\sim DP(\tfrac12F_\theta)\), then

\[
\boxed{
4G_1D^2\overset d=\int_0^\infty y\,\mathsf P_\theta(dy).
}
\tag{1.51}
\]

Equivalently, if \(C_+\) is standard half-Cauchy and \(R_\theta^{-1}\) is
the inverse of the strictly increasing function in (1.50a), a base atom has
the sampling representation

\[
V_\theta\overset d=4[R_\theta^{-1}(C_+)]^2,
\qquad V_\theta\sim F_\theta.
\tag{1.52}
\]

The base atom \(V_\theta\), the Dirichlet mean in (1.51), and the GGC
\(G_{1/2}N\) are three different random objects.  In particular, WIP-1.10
and (1.50a) give, for every \(\theta>0\), an explicit example of an ID,
non-GGC random variable that nevertheless is an order-\(1/2\) Dirichlet
mean.

For every \(\theta\ge0\), the rate-form Thorin measure of
\(X_\theta^2\), of total mass \(1/2\), is the reciprocal image of the
directing law:

\[
U_\theta=\frac12\operatorname{Law}(V_\theta^{-1}),
\qquad
2U_\theta((0,t])
=\frac2\pi\arctan\frac1{R_\theta(1/(2\sqrt t))}.
\tag{1.53}
\]

Thus \(2U_\theta\), not \(U_\theta\), is a probability measure.
Differentiation of (1.53) reproduces exactly the Route-2 Thorin density in
(2.25).  It also gives a literal bridge to Route 3.  With the notation
\(\xi_\theta(x)=\eta_\theta(1/x)\) of (3.34),

\[
\boxed{
F_\theta(x)=1-2\xi_\theta(x),
\qquad
F_\theta(dx)=-2\,d\xi_\theta(x),
\qquad
\sigma(dx)=\frac{x}{2}F_\theta(dx)=-x\,d\xi_\theta(x).
}
\tag{1.54}
\]

Thus the Route-1 directing law, the Route-2 Thorin phase, and the Route-3
cumulant representing measure are exactly the same candidate measure under
the indicated reciprocal and size transforms.

Two further exact real-variable formulations may be useful.  First,
differentiating (1.45) gives

\[
\boxed{
\int_0^\infty\frac{F_\theta(dy)}{z+y}
=-2\frac{K_\theta'(z)}{K_\theta(z)}
=\frac{\mathbb E[(z+N)^{-3/2}]}
{\mathbb E[(z+N)^{-1/2}]}.
}
\tag{1.55}
\]

For arbitrary contrast, proving that the final ratio is a Stieltjes
function of mass one is equivalent to (1.49), not an independent closure
theorem.  Second, if \(f_N\) is the density in (1.40), set

\[
A_-(x)=\int_0^x\frac{f_N(y)}{\sqrt{x-y}}\,dy,
\qquad
A_+(x)=\int_x^\infty\frac{f_N(y)}{\sqrt{y-x}}\,dy.
\]

The boundary decomposition of the generalized Stieltjes transform is

\[
K_\theta(-x+i0)=A_+(x)-iA_-(x),
\qquad
F_\theta(x)=\frac2\pi\arctan\frac{A_-(x)}{A_+(x)}.
\tag{1.56}
\]

Writing \(\Delta_N(x)=A_-(x)/\pi\), the order-\(1/2\) Abel inversion is

\[
f_N(x)=\frac d{dx}\int_0^x
\frac{\Delta_N(t)}{\sqrt{x-t}}\,dt.
\tag{1.57}
\]

For a general density this identity is read at Lebesgue points.  Here
\(f_N\) is a bounded-scale mixture of exponential densities and is smooth
on \((0,\infty)\), so (1.57) holds pointwise there.

Under the Markov--Krein representation,

\[
\Delta_N(x)=\frac1\pi
\exp\left\{-\frac12\int\log|x-y|\,F_\theta(dy)\right\}
\sin\frac{\pi F_\theta(x)}2.
\tag{1.58}
\]

This is the order-\(1/2\) Cifarelli--Regazzini formula.  Here it follows
directly from (1.45)--(1.56) and supplies an exact identity, not an
additional positivity argument.

Finally, the algebraic Laplace transform \(L_N\) from (1.34) gives the
contour-ready representation

\[
\boxed{
K_\theta(z)=\frac1{\sqrt\pi}\int_0^\infty
t^{-1/2}e^{-zt}L_N(t)\,dt,
\qquad
-2\frac{K_\theta'(z)}{K_\theta(z)}
=2\frac{\int_0^\infty t^{1/2}e^{-zt}L_N(t)\,dt}
{\int_0^\infty t^{-1/2}e^{-zt}L_N(t)\,dt}.
}
\tag{1.59}
\]

This follows from the Gamma integral for \((z+N)^{-1/2}\) and Tonelli in
the right half-plane.  Although (1.34) makes the input algebraic, the ratio
in (1.59) is still a posterior ratio: its first derivative has a variance
sign, while higher derivatives contain unsigned higher cumulants.  It is a
concrete contour-deformation subroute, not a proof.

> **[RESOLVED BENCHMARK R1-C].**  WIP-5.11 proves for every contrast that
> the ratio in (1.55) is Stieltjes, equivalently that the Abel odds
> \(A_-/A_+\) in (1.56) are increasing.  The corresponding problem for
> general powers \(q\ne2\) remains open.  For \(q=2\), WIP-5.30 later
> supplies the directing law for every total shape and every two-rate
> shape pair.

### WIP-1.12 — left/right Abel half-integrals and the elasticity gap

**Status: [PROVED REDUCTION AND PROVED OBSTRUCTION].**

There is a one-dimensional Abel formulation of the monotonicity target in
WIP-1.11 which does not begin with the Route-2 pair kernel.  Put \(t=u^2\)
and define

\[
H_\theta(t)=\mathbb E\!\left[D e^{-tD^2}\right].
\tag{1.60}
\]

The identity

\[
\operatorname{Daw}(x)
=x\int_0^1e^{-x^2(1-v^2)}\,dv
\]

and the relation
\(e^{-x^2}\operatorname{erfi}(x)=2\operatorname{Daw}(x)/\sqrt\pi\)
give, after the substitution \(s=t(1-v^2)\),

\[
\boxed{
P_\theta(\sqrt t)
=\frac1{\sqrt\pi}\int_0^t
\frac{H_\theta(s)}{\sqrt{t-s}}\,ds.
}
\tag{1.61a}
\]

The right-sided half-integral follows directly from Tonelli:

\[
\begin{aligned}
\frac1{\sqrt\pi}\int_t^\infty
\frac{D e^{-sD^2}}{\sqrt{s-t}}\,ds
&=
\frac{De^{-tD^2}}{\sqrt\pi}
\int_0^\infty e^{-vD^2}v^{-1/2}\,dv\\
&=e^{-tD^2}.
\end{aligned}
\]

Consequently,

\[
\boxed{
Q_\theta(\sqrt t)
=\frac1{\sqrt\pi}\int_t^\infty
\frac{H_\theta(s)}{\sqrt{s-t}}\,ds.
}
\tag{1.61b}
\]

After scaling \(s=tx\), set

\[
A_t=\int_0^1\frac{H_\theta(tx)}{\sqrt{1-x}}\,dx,
\qquad
B_t=\int_1^\infty\frac{H_\theta(tx)}{\sqrt{x-1}}\,dx.
\tag{1.62}
\]

The common factor \(\sqrt t/\sqrt\pi\) cancels, so that
\(R_\theta(\sqrt t)=A_t/B_t\).  Define the logarithmic elasticity

\[
\epsilon_\theta(s)
=-s\frac{H_\theta'(s)}{H_\theta(s)}
\tag{1.63}
\]

and the probability measures

\[
\alpha_t(dx)=
\frac{H_\theta(tx)(1-x)^{-1/2}}{A_t}\,dx,
\quad 0<x<1,
\]

\[
\beta_t(dy)=
\frac{H_\theta(ty)(y-1)^{-1/2}}{B_t}\,dy,
\quad y>1.
\]

Differentiation under the scaled integrals gives the exact identity

\[
\boxed{
t\frac d{dt}\log R_\theta(\sqrt t)
=
\mathbb E_{\beta_t}[\epsilon_\theta(tY)]
-
\mathbb E_{\alpha_t}[\epsilon_\theta(tX)].
}
\tag{1.64}
\]

In particular,

\[
\epsilon_\theta\text{ nondecreasing on }(0,\infty)
\quad\Longrightarrow\quad
R_\theta'(u)\ge0\quad(u>0).
\tag{1.65}
\]

This sufficient condition is non-circular, but it is false at large rate
contrast.  Indeed, under the \(D\)-size-biased exponential tilt

\[
\widetilde\nu_t(dd)
=
\frac{d e^{-td^2}}{H_\theta(t)}\,p_\theta(dd),
\]

one has

\[
\epsilon_\theta(t)
=t\,\mathbb E_{\widetilde\nu_t}[D^2],
\qquad
\boxed{
\epsilon_\theta'(t)
=
\mathbb E_{\widetilde\nu_t}[D^2]
-t\operatorname{Var}_{\widetilde\nu_t}(D^2).
}
\tag{1.66}
\]

Let \(\rho=e^\theta\).  The arcsine rate has the representation

\[
\frac{D_\rho}{\rho}
=V+\rho^{-2}(1-V),
\qquad
V\sim\operatorname{Beta}\!\left(\frac12,\frac12\right).
\]

At \(t_\rho=4/\rho^2\), bounded convergence in (1.66) yields

\[
\rho^{-2}\epsilon_\theta'(t_\rho)
\longrightarrow
\frac{I_0I_1+4I_1^2-4I_0I_2}{I_0^2},
\qquad
I_j=\mathbb E[V^{2j+1}e^{-4V^2}].
\tag{1.67}
\]

The limiting numerator is strictly negative by an exact rational
certificate.  If

\[
m_k=\mathbb E[V^k]=\frac{\binom{2k}{k}}{4^k}
\]

and \(P_n(x)=\sum_{k=0}^n(-x)^k/k!\), Taylor's theorem gives

\[
P_{15}(x)\le e^{-x}\le P_{14}(x),
\qquad x\ge0.
\]

Indeed, the Lagrange remainder has sign \((-1)^{n+1}\) for \(x>0\).
Applying these bounds at \(x=4V^2\) and integrating term by term gives

\[
\frac{9353}{10^5}<I_0<\frac{9363}{10^5},
\qquad
I_1<\frac{22905}{10^6},
\qquad
I_2>\frac{11345}{10^6}.
\tag{1.68}
\]

Therefore

\[
\begin{aligned}
I_0I_1+4I_1^2-4I_0I_2
&<
\frac{9363}{10^5}\frac{22905}{10^6}
+4\left(\frac{22905}{10^6}\right)^2\\
&\quad
-4\frac{9353}{10^5}\frac{11345}{10^6}\\
&=
-\frac{24803}{20000000000}<0.
\end{aligned}
\tag{1.69}
\]

The script
[route1_abel_elasticity_obstruction.py](computations/route1_abel_elasticity_obstruction.py)
checks the integrated Taylor bounds, the simplified outward rational
bounds in (1.68), and (1.69), using only exact
fractions.Fraction arithmetic.

It follows from (1.67)--(1.69) that

\[
\boxed{
\epsilon_\theta'(4e^{-2\theta})<0
\quad\text{for all sufficiently large }\theta.
}
\tag{1.70}
\]

This is not a GGC counterexample.  It rules out only the global strategy
of proving the pointwise monotonicity in (1.65).  The averaged elasticity
comparison (1.64) remains exact and may still hold even when
\(\epsilon_\theta'\) changes sign.

### WIP-1.13 — Cauchy duality and an algebraic-density GGC problem

**Status: [PROVED]; the equivalent GGC property is closed by WIP-5.11.**

Continue with

\[
N=4ED^2,\qquad E\sim\Gamma(1,1),
\]

and the generalized Stieltjes transform

\[
K_\theta(z)=\mathbb E[(z+N)^{-1/2}].
\]

Since \(\mathbb E[D^{-1}]=1\),

\[
K_\theta(0)
=\frac12\mathbb E[E^{-1/2}]\mathbb E[D^{-1}]
=\frac{\sqrt\pi}{2}.
\]

Define \(T_\theta\) by

\[
\mathbb E[e^{-zT_\theta}]
=\frac{K_\theta(z)}{K_\theta(0)}.
\tag{1.71}
\]

The gamma integral for \((z+N)^{-1/2}\) shows that this is a probability
law with density

\[
\boxed{
f_{T_\theta}(t)
=\frac2\pi t^{-1/2}L_N(t),
\qquad t>0.
}
\tag{1.72}
\]

There is also a direct distributional representation.  In the gamma
integral, conditional on the \(N^{-1/2}\)-tilted pair \((E,D)\), the
mixing variable is \(G_{1/2}/N\).  The tilt changes \(E\) from
\(\Gamma(1)\) to \(\Gamma(1/2)\), while (1.42) says that the
\(D^{-1}\)-tilted law of \(D\) is the law of \(D^{-1}\).  Hence, with all
right-hand factors independent,

\[
\boxed{
T_\theta
\overset d=
\frac{D^2}{4}\frac{G_{1/2}}{G'_{1/2}}
=
\left(\frac{DC_+}{2}\right)^2,
}
\tag{1.73}
\]

where \(C_+\) is standard half-Cauchy.

The algebraic transform (1.34) turns (1.72) into the explicit density

\[
\boxed{
f_{T_\theta}(t)
=
\frac{\sqrt{2(\Delta(t)+1-4t)}}{\pi\sqrt t\,\Delta(t)}
=
\frac{4\sqrt2\,\cosh\theta}
{\pi\Delta(t)\sqrt{\Delta(t)-1+4t}},
}
\tag{1.74}
\]

where

\[
\Delta(t)
=\sqrt{1+4e^{-2\theta}t}\sqrt{1+4e^{2\theta}t}.
\]

The equality of the two forms follows from

\[
(\Delta+1-4t)(\Delta-1+4t)
=16t\cosh^2\theta.
\]

The Mellin transform supplies a second exact check:

\[
\boxed{
\mathbb E[T_\theta^s]
=
4^{-s}\frac{P_{2s}(\cosh\theta)}{\cos(\pi s)},
\qquad -\frac12<s<\frac12,
}
\tag{1.75}
\]

where \(P_\nu\) is the Legendre function and the arcsine integral gives
\(\mathbb E[D^{2s}]=P_{2s}(\cosh\theta)\).

Most importantly,

\[
\boxed{
N\in\mathcal D_{1/2}
\quad\Longleftrightarrow\quad
T_\theta\in GGC.
}
\tag{1.76}
\]

For the forward direction, normalize the homogeneous Markov--Krein
identity (1.45) at \(z=0\): (1.71) becomes the Laplace transform of a GGC
whose rate-form Thorin measure is \(\tfrac12F\); equivalently, its
scale-form Thorin measure is the reciprocal image of \(\tfrac12F\).
Conversely, suppose that \(T_\theta\) is GGC.  Since
\(K_\theta(z)\sim z^{-1/2}\) and

\[
-z\frac d{dz}\log\frac{K_\theta(z)}{K_\theta(0)}
\longrightarrow\frac12,
\]

its GGC representation has zero drift and total Thorin mass \(1/2\).
To spell out the homogeneous constant, let \(U\) be the rate-form Thorin
measure of \(T_\theta\) and put
\(\varphi(z)=K_\theta(z)/K_\theta(0)\).  For \(z\ge1\),

\[
z^{1/2}\varphi(z)
=
\exp\left\{
\int_0^\infty\log\frac{zt}{z+t}\,U(dt)
\right\}.
\]

The integrand increases to \(\log t\); its negative part at \(z=1\) is
integrable because \(\varphi(1)>0\).  Monotone convergence, together with
\(z^{1/2}K_\theta(z)\to1\), gives

\[
\int_0^\infty\log t\,U(dt)=-\log K_\theta(0).
\]

It follows exactly that

\[
K_\theta(z)=
\exp\left\{-\int_0^\infty\log(z+t)\,U(dt)\right\}.
\]

Thus \(F=2U\) is the unique directing probability law in (1.45) (or, in
scale-form Thorin notation, one first takes the reciprocal image), proving
the reverse implication.

This equivalent variable has two useful strict properties:

\[
\boxed{
T_\theta\in ID\quad\text{for every }\theta\ge0,
\qquad
\theta>0\Longrightarrow f_{T_\theta}\text{ is not HCM}.
}
\tag{1.77}
\]

Indeed, both \(t^{-1/2}\) and the Laplace transform \(L_N(t)\) are
completely monotone, hence (1.72) is a completely monotone density and the
Goldie--Steutel theorem gives infinite divisibility.  If \(f_{T_\theta}\)
were HCM for \(\theta>0\), multiplication by \(t^{1/2}\) would preserve
HCM, so \(L_N\) would be HCM.  The HCM-Laplace-transform
characterization would then imply \(N\in GGC\), contradicting WIP-1.10.

The equivalent benchmark problem is now resolved: by (1.76) and
WIP-5.11,

\[
\boxed{
T_\theta=\left(DC_+/2\right)^2\in GGC
\qquad(\theta\ge0).
}
\tag{1.78}
\]

For \(\theta>0\), this GGC has the algebraic completely monotone density
(1.74), but that density is not HCM by (1.77).  Thus the benchmark
Route-1 target is closed.  WIP-5.30 later constructs the corresponding
directing law for every two-rate square and every total shape.  The next
two-rate Route-1 problem is therefore power \(q\ne2\), beginning with
\(1<q<2\).

### WIP-1.14 — the first nonquadratic test: \(q=3/2\)

**Status: [PROVED REDUCTION AND PROVED OBSTRUCTION TO A STRONGER
SHORTCUT; NO GGC COUNTEREXAMPLE].**

Put

\[
q=\frac32,\qquad \rho=\frac23,\qquad k=\rho B=\frac{2B}{3},
\qquad W=T_{2/3,B}^{-1}.
\]

The tilted-stable definition (1.2) and the negative moments (1.1) first
give, for \(\Re z>-k\),

\[
\boxed{
\mathbb E W^z
=\frac{\Gamma(1+B+3z/2)\Gamma(1+k)}
       {\Gamma(1+B)\Gamma(1+k+z)}
=\frac{\Gamma(B+3z/2)\Gamma(k)}
       {\Gamma(B)\Gamma(k+z)}.
}
\tag{1.79}
\]

The second quotient in (1.79) is the simplified form on this initial
strip.  Under continuation to the larger strip obtained below, it has a
removable \(\infty/\infty\) singularity at \(z=-k\); the first quotient is
the nonsingular formula there.

Introduce

\[
\alpha_0=\frac{B+1}{3},\qquad
\beta_0=\frac{B+2}{3},\qquad
\delta_0=\frac B3+\frac12=\alpha_0+\frac16,
\qquad c_0=\frac{3\sqrt3}{2}.
\]

Gauss triplication in the numerator of (1.79), followed by duplication
in its denominator, yields

\[
\mathbb E W^z
=c_0^z
 \frac{\Gamma(\alpha_0+z/2)\Gamma(\delta_0)}
      {\Gamma(\alpha_0)\Gamma(\delta_0+z/2)}
 \frac{\Gamma(\beta_0+z/2)}{\Gamma(\beta_0)}.
\tag{1.80}
\]

Consequently, for independent

\[
V\sim {\rm Beta}(\alpha_0,1/6),
\qquad Y\sim\Gamma(\beta_0,1),
\]

one has the exact factorization

\[
\boxed{W\overset d=c_0\sqrt{VY}.}
\tag{1.81}
\]

There is no moment-determinacy gap here: (1.80), initially needed only at
\(z=it\), identifies the characteristic functions of the logarithms.
The right-hand side of (1.81) then extends (1.79)--(1.80) to the maximal
Mellin strip
\(\Re z>-2\alpha_0=-2(B+1)/3\), whose boundary is also visible from the
beta factor at zero.

Now take the two-rate finite gamma convolution

\[
X=rG_a^{(1)}+lG_c^{(2)}=G_BM,\qquad
B=a+c,\qquad
M=l+(r-l)U,\quad U\sim {\rm Beta}(a,c),
\]

where \(0<l<r\) and the gamma--Dirichlet factors are independent.  From
WIP-1.3 and (1.81), taking \(V,Y\) independent also of \(M,G_k\),

\[
\boxed{
X^{3/2}\overset d=G_kN,\qquad
N=c_0M^{3/2}\sqrt{VY},\qquad G_k\perp N.
}
\tag{1.82}
\]

Thus the exact Route-1 target is

\[
X^{3/2}\in GGC
\quad\Longleftrightarrow\quad
N\text{ is an order-}k\text{ Dirichlet mean},
\tag{1.83}
\]

where the reverse implication uses the finite-Thorin-mass equivalence in
WIP-1.4.  Equivalently, with

\[
K(s)=\mathbb E(1+sN)^{-k}=\mathbb E e^{-sX^{3/2}},
\]

the function

\[
\boxed{
H(s):=-\frac1k\frac{d}{ds}\log K(s)
=c_0\frac{\mathbb E[A(1+c_0sA)^{-k-1}]}
            {\mathbb E[(1+c_0sA)^{-k}]},
\qquad A=M^{3/2}\sqrt{VY},
}
\tag{1.84}
\]

must be a Stieltjes function of probability form

\[
H(s)=\int_{(0,\infty)}\frac{x}{1+sx}\,F(dx).
\tag{1.85}
\]

The Mellin transform of the candidate mean is also explicit:

\[
\boxed{
\mathbb E N^z
=\frac{\Gamma(1+B+3z/2)\Gamma(1+k)}
       {\Gamma(1+B)\Gamma(1+k+z)}
 l^{3z/2}
 {}_2F_1\!\left(-\frac{3z}{2},a;B;1-\frac rl\right).
}
\tag{1.86}
\]

Formula (1.86) holds on
\(\Re z>-2(B+1)/3\); unlike the shortened gamma quotient, the displayed
form is regular at \(z=-k\).

There is a useful warning.  Since \(V\le1\), Chernoff's inequality at
parameter \(1/2\) gives

\[
\mathbb P(W>x)\le
2^{\beta_0}\exp\!\left(-\frac{2x^2}{27}\right),
\qquad
\mathbb P(N>x)\le
2^{\beta_0}\exp\!\left(-\frac{2x^2}{27r^3}\right).
\tag{1.87}
\]

Both variables are positive, unbounded, and nondegenerate.  Chapter IV,
Corollary 9.9, p. 200 of Steutel--van Harn (2004) says that a
nondegenerate infinitely divisible law with

\[
\limsup_{x\to\infty}
\frac{-\log\mathbb P(|Z|>x)}{x\log x}=\infty
\]

must be normal.  The bounds (1.87) therefore imply

\[
\boxed{W\notin ID,\qquad N\notin ID,}
\tag{1.88}
\]

because a nondegenerate normal law cannot be supported on
\((0,\infty)\).  In particular, neither residual factor can itself be
GGC or HCM.  This rules out only the stronger plan of proving (1.83) by
putting \(N\) in GGC and invoking product closure: an order-
\(k\) Dirichlet mean need not be infinitely divisible, and (1.88) says
nothing negative about the gamma product \(G_kN=X^{3/2}\).

A rate-side expansion gives a sharper analytic target.  Put

\[
b_1=r^{-1},\qquad b_2=l^{-1},\qquad
R=b_1Q+b_2(1-Q),\quad Q\sim {\rm Beta}(a,c),
\qquad p_b=b_1^ab_2^c,
\]

and define the entire Wright--beta function

\[
\Phi(t)=\sum_{n\ge0}\frac{(-1)^n}{n!}
\Gamma\!\left(k+\frac{2n}{3}\right)\mathbb E[R^n]t^n,
\qquad
\mathbb E[R^n]
=b_2^n{}_2F_1\!\left(-n,a;B;1-\frac{b_1}{b_2}\right).
\tag{1.89}
\]

Indeed, convolution gives

\[
f_X(x)=\frac{p_b}{\Gamma(B)}x^{B-1}\mathbb E e^{-Rx}.
\]

Expanding the bounded-rate factor, integrating each term against
\(e^{-sx^{3/2}}\), and using absolute convergence gives

\[
\boxed{
K(s)=\frac{2p_b}{3\Gamma(B)}s^{-k}\Phi(s^{-2/3}),
\qquad
H(s)=\frac1s+\frac{2}{3k}s^{-5/3}
       \frac{\Phi'(s^{-2/3})}{\Phi(s^{-2/3})}.
}
\tag{1.90}
\]

Thus (1.90), not a Gauss contiguous ratio, is the exact Stieltjes target
for the first nonquadratic test.  The ordinary Taylor series of \(K\) at
zero has radius zero: since \(X\ge lG_B\),

\[
\left(\frac{\mathbb E X^{3n/2}}{n!}\right)^{1/n}
\ge l^{3/2}
\left(\frac{\Gamma(B+3n/2)}{\Gamma(B)n!}\right)^{1/n}
\longrightarrow\infty.
\]

Hence a regular Gauss representation at \(s=0\), of the form used in
WIP-5.30, cannot be expected.  Finally, strict Jensen gives, for unequal
rates and \(s>0\),

\[
\log\mathbb E_U\ell_{B,3/2}(sM(U)^{3/2})
>
\mathbb E_U\log\ell_{B,3/2}(sM(U)^{3/2}),
\qquad
\ell_{B,3/2}(t)=\mathbb E e^{-tG_B^{3/2}}.
\]

So simply averaging the fixed-\(M\) logarithmic directing measures is
also invalid.  The remaining viable problem is the boundary phase or
Stieltjes character of the exact quotient in (1.90).  Equations
(1.79)--(1.90), apart from the explicitly cited tail theorem and standard
gamma identities, are new project derivations.

### WIP-1.15 — exact finite gates and a Wright--Bessel ray at \(q=3/2\)

**Status: [PROVED THREE STRICT NECESSARY GATES, STIELTJES/ZERO-FREE
STRUCTURE, AND AN EXACT ANALYTIC REDUCTION; GLOBAL PHASE MONOTONICITY
REMAINS OPEN].**

This subsection specializes WIP-1.14 to the first symmetric unequal-rate
test. By interchanging the summands, assume \(\theta\ge0\), and set

\[
X_\theta=e^\theta G_{1/2}+e^{-\theta}G'_{1/2},
\qquad c=\cosh\theta,\qquad d=\sinh\theta.
\]

Beta--gamma independence gives

\[
\boxed{
X_\theta\overset d=G_1M,\qquad
M=e^\theta U+e^{-\theta}(1-U)
\overset d=c+d\cos\Phi,
}
\tag{1.91}
\]

where \(U\sim{\rm Beta}(1/2,1/2)\),
\(\Phi\sim{\rm Uniform}(0,\pi)\), and \(G_1\perp M\). Hence, for every
\(p>-1\),

\[
\boxed{
\mathbb E X_\theta^p
=\Gamma(p+1)P_p(c),
}
\tag{1.92}
\]

where \(P_p\) is the Legendre function represented by DLMF 14.12.7.

Put \(Y_\theta=X_\theta^{3/2}\),
\(q_j=\mathbb E M^{3j/2}=P_{3j/2}(c)\), and
\(m_j=\mathbb E Y_\theta^j\). Then

\[
m_j=\Gamma(1+3j/2)q_j,
\quad
(m_1,m_2,m_3,m_4)
=
\left(
\frac{3\sqrt\pi}{4}q_1,\,
6q_2,\,
\frac{945\sqrt\pi}{32}q_3,\,
720q_4
\right).
\tag{1.93}
\]

Direct convolution and change of variables give

\[
\begin{aligned}
f_{X_\theta}(x)&=e^{-cx}I_0(dx),\\
f_{Y_\theta}(y)
&=\frac23y^{-1/3}e^{-cy^{2/3}}I_0(dy^{2/3})
\sim\frac23y^{-1/3}\qquad(y\downarrow0).
\end{aligned}
\tag{1.94}
\]

In fact, this density is completely monotone. With
\(D_\varphi=c-d\cos\varphi\in[e^{-\theta},e^\theta]\),

\[
f_{Y_\theta}(y)
=\frac{2}{3\pi}y^{-1/3}
\int_0^\pi e^{-D_\varphi y^{2/3}}\,d\varphi.
\tag{1.94a}
\]

The function \(y^{2/3}\) is Bernstein,
\(e^{-D_\varphi y^{2/3}}\) is completely monotone by
Schilling--Song--Vondraček (2010), Theorem 3.6, and

\[
y^{-1/3}
=\frac1{\Gamma(1/3)}
\int_0^\infty e^{-ty}t^{-2/3}\,dt
\]

is completely monotone. Closure under products and positive mixtures
therefore gives \(f_{Y_\theta}\in CM\). By the Stieltjes characterization
in that book, Theorem 2.2(i), and its reciprocal theorem, Theorem 7.3,

\[
\boxed{
K_\theta\in\mathcal S,\qquad
K_\theta(z)\ne0
\quad(z\in\mathbb C\setminus(-\infty,0]).
}
\tag{1.94b}
\]

Thus \(Y_\theta\) is an exponential mixture and in particular is
infinitely divisible; this does not imply that it is GGC.

Thus, for \(K_\theta(s)=\mathbb E e^{-sY_\theta}\),

\[
K_\theta(s)\sim\Gamma(5/3)s^{-2/3},
\qquad
-s\frac{K_\theta'(s)}{K_\theta(s)}\longrightarrow\frac23.
\tag{1.95}
\]

If \(Y_\theta\) is GGC, monotone convergence in its Thorin
log-derivative shows that its drift is zero and its Thorin measure has
the necessary total mass \(2/3\). In scale form, therefore,

\[
b_0=\frac23,\qquad
b_n=\frac{\kappa_n(Y_\theta)}{(n-1)!}\quad(n\ge1)
\tag{1.96}
\]

must be a Stieltjes moment sequence.

The fixed-mass \(2\times2\) gate is strictly positive:

\[
\boxed{
\Delta_{\rm mass}
=\frac23\kappa_2-\kappa_1^2
=4q_2-\frac{15\pi}{16}q_1^2
\ge
\left(4-\frac{15\pi}{16}\right)q_2>0.
}
\tag{1.97}
\]

Here \(q_1^2\le q_2\). For the first unshifted cumulant gate, with
\(a_n=\kappa_{n+1}(Y_\theta)/n!\),

\[
\boxed{
\begin{aligned}
\Delta_0
&=a_0a_2-a_1^2
=\frac{\kappa_1\kappa_3}{2}-\kappa_2^2\\
&=\frac{2835\pi}{256}q_1q_3
+\frac{27\pi}{16}q_1^2q_2-36q_2^2.
\end{aligned}
}
\tag{1.98}
\]

Besides \(q_1q_3\ge q_2^2\), the arcsine mean satisfies

\[
\boxed{
\frac{q_1^2}{q_2}
=\frac{P_{3/2}(c)^2}{P_3(c)}
\ge\frac{256}{45\pi^2}.
}
\tag{1.99}
\]

To prove (1.99), the case \(\theta=0\) is immediate. For
\(\theta>0\), remove an irrelevant scale and write
\(M\overset d=U+\alpha\), \(\alpha\ge0\), with
\(U\sim{\rm Beta}(1/2,1/2)\). The function

\[
R(\alpha)=
\frac{\{\mathbb E(U+\alpha)^{3/2}\}^2}
{\mathbb E(U+\alpha)^3}
\]

is nondecreasing, because moment log-convexity gives

\[
\frac d{d\alpha}\log R(\alpha)
=3\left\{
\frac{\mathbb E(U+\alpha)^{1/2}}
     {\mathbb E(U+\alpha)^{3/2}}
-
\frac{\mathbb E(U+\alpha)^2}
     {\mathbb E(U+\alpha)^3}
\right\}\ge0.
\]

At \(\alpha=0\),
\(\mathbb E U^{3/2}=4/(3\pi)\) and
\(\mathbb E U^3=5/16\), proving (1.99). Consequently,

\[
\frac{\Delta_0}{q_2^2}
\ge\frac{2835\pi}{256}+\frac{48}{5\pi}-36
>
\frac{8505}{256}+\frac{168}{55}-36
=\frac{3903}{14080}>0,
\tag{1.100}
\]

where only \(3<\pi<22/7\) was used in the strict rational bound.

The shifted gate has a stronger universal form. Let \(Q\ge0\) be any
nonzero random variable with \(\mathbb E Q^4<\infty\), let
\(G_1\perp Q\), and put \(Y=QG_1^{3/2}\). Then

\[
\boxed{
\Delta_1
:=\frac{\kappa_2(Y)\kappa_4(Y)}6
-\frac{\kappa_3(Y)^2}{4}
>
\frac{69}{2}\{\mathbb E Q^2\}^3>0.
}
\tag{1.101}
\]

Indeed, write \(q_j=\mathbb E Q^j\). Exact cumulant expansion gives

\[
\begin{aligned}
12\Delta_1={}&
8640q_2q_4-810\pi q_1^2q_4
+\frac{42525\pi}{32}q_1q_2q_3\\
&-\frac{25515\pi^2}{512}q_1^3q_3
-1296q_2^3+\frac{243\pi}{4}q_1^2q_2^2
-\frac{2679075\pi}{1024}q_3^2.
\end{aligned}
\tag{1.102}
\]

By homogeneity take \(q_2=1\), and put
\(x=q_1\), \(u=x^2\), \(z=q_3\), \(w=q_4\), and \(y=xz\).
The Stieltjes moment matrices of \(Q\) imply

\[
y\ge1,\qquad
(1-u)w-z^2+2xz-1\ge0.
\tag{1.103}
\]

For \(0<u<1\), the coefficient \(8640-810\pi u\) of \(w\) in
(1.102) is positive. Substitution of the lower bound from (1.103), with
\(h=y-1\), gives

\[
12\Delta_1\ge
F(u)+\frac{E(u)}u h+\frac{A(u)}u h^2,
\tag{1.104}
\]

where

\[
\begin{aligned}
A(u)&=\frac{A_0+A_1u}{1-u},\\
A_0&=8640-\frac{2679075\pi}{1024},
\qquad
A_1=\frac{2679075\pi}{1024}-810\pi,\\
E(u)&=2A_0-\frac{9315\pi}{32}u
-\frac{25515\pi^2}{512}u^2,\\
F(u)&=\frac{A_0}{u}
+\left(\frac{16605\pi}{32}-1296\right)
+\left(\frac{243\pi}{4}
-\frac{25515\pi^2}{512}\right)u.
\end{aligned}
\tag{1.105}
\]

The elementary bounds \(3<\pi<22/7\) give

\[
\begin{gathered}
A_0>400,\quad A_1>5000,\quad F(1)>450,\\
E(1/2)>250,\qquad E(1)>-600.
\end{gathered}
\tag{1.106}
\]

Both \(E\) and \(F\) decrease. If \(E(u)\ge0\), (1.104) is greater
than \(450\). If \(E(u)<0\), then \(u>1/2\),
\(A(u)u>2500\), and completion of the square gives

\[
12\Delta_1>
450-\frac{600^2}{4\cdot2500}=414.
\]

When \(u=1\), equality in Cauchy--Schwarz makes \(Q\) constant and
direct substitution gives \(12\Delta_1=F(1)>450\). Rescaling proves
(1.101). The exact algebra and all rational certificates in
(1.97), (1.98), and (1.102)--(1.106) are independently reproduced by
[route1_q32_hankel_gates.py](computations/route1_q32_hankel_gates.py),
using only the Python fractions.Fraction class over the formal
coefficient ring \(\mathbb Q[\sqrt\pi]\).

The remaining analytic target is also one-dimensional. Define the entire
Wright--Bessel function

\[
\boxed{
\begin{aligned}
\Phi_\theta(z)
&=3\int_0^\infty
v e^{-v^3-czv^2}I_0(dzv^2)\,dv\\
&=\sum_{n=0}^\infty\frac{(-1)^n}{n!}
\Gamma\!\left(\frac23+\frac{2n}{3}\right)P_n(c)z^n.
\end{aligned}
}
\tag{1.107}
\]

Uniform domination by
\(e^{-v^3+(c+d)R v^2}\) on every disk \(|z|\le R\) proves entire
analyticity and justifies termwise integration. On principal branches,

\[
\boxed{
K_\theta(s)=\frac23s^{-2/3}\Phi_\theta(s^{-2/3}),
\qquad
H_\theta(s):=-\frac32\frac d{ds}\log K_\theta(s)
=\frac1s+s^{-5/3}
\frac{\Phi_\theta'(s^{-2/3})}{\Phi_\theta(s^{-2/3})}.
}
\tag{1.108}
\]

The Stieltjes property also excludes zeros on the physical boundary ray,
not merely in the open slit plane. Let \(\mu_D\) be the probability
measure determined by

\[
e^{-Dy^{2/3}}=\int_0^\infty e^{-vy}\,\mu_D(dv),
\qquad
\nu(du)=\frac{u^{-2/3}}{\Gamma(1/3)}\,du.
\]

Multiplication of the two Bernstein representations in (1.94a) shows
that the Stieltjes spectral measure of \(K_\theta\) is

\[
\boxed{
\sigma_\theta
=\frac2{3\pi}\int_0^\pi
(\nu*\mu_{D_\varphi})\,d\varphi,
\qquad
K_\theta(s)=\int_0^\infty\frac{\sigma_\theta(du)}{s+u}.
}
\tag{1.108a}
\]

For every \(D,A>0\), one has \(\mu_D([0,A])>0\). Otherwise a random
variable \(S_D\) with law \(\mu_D\) would satisfy \(S_D>A\) almost
surely, and
\[
e^{-Dy^{2/3}}=\mathbb E e^{-yS_D}\le e^{-Ay},
\]
which fails for large \(y\). Fix \(t>0\) and restrict each
\(\mu_{D_\varphi}\) in (1.108a) to \([0,t/2]\). The resulting submeasure
has, near \(t\), the continuous density

\[
h_t(u)=
\frac2{3\pi\Gamma(1/3)}
\int_0^\pi\int_{[0,t/2]}
(u-v)^{-2/3}\,\mu_{D_\varphi}(dv)\,d\varphi,
\qquad h_t(t)>0.
\tag{1.108b}
\]

The Poisson-kernel boundary limit, together with the finite entire
boundary value supplied by (1.107), now gives

\[
\boxed{
\operatorname{Im}K_\theta(-t+i0)<0,\qquad
\Phi_\theta(\omega t^{-2/3})\ne0
\quad(t>0).
}
\tag{1.108c}
\]

Indeed, the contribution of this submeasure alone satisfies
\[
\lim_{\varepsilon\downarrow0}
\{-\operatorname{Im}K_\theta(-t+i\varepsilon)\}
\ge\pi h_t(t)>0.
\]

Thus \(H_\theta\), if \(Y_\theta\) is GGC, is the Stieltjes transform of
the **normalized** rate-form Thorin measure
\(\widehat\tau=(3/2)\tau\), whose mass is one. With
\(\omega=e^{-2\pi i/3}\), the upper boundary is

\[
H_\theta(-t+i0)
=-\frac1t-\omega t^{-5/3}
\frac{\Phi_\theta'(\omega t^{-2/3})}
     {\Phi_\theta(\omega t^{-2/3})}.
\tag{1.109}
\]

Where the boundary measure is absolutely continuous, its necessary
normalized density is therefore

\[
\boxed{
\widehat u_\theta(t)
=\frac{t^{-5/3}}{\pi}
\operatorname{Im}\!\left[
\omega
\frac{\Phi_\theta'(\omega t^{-2/3})}
     {\Phi_\theta(\omega t^{-2/3})}
\right]\ge0,
\qquad
u_\theta(t)=\frac23\widehat u_\theta(t).
}
\tag{1.110}
\]

Here \(u_\theta\) is the density of the unnormalized Thorin measure.
If

\[
\chi_\theta(t)=
\arg\{\omega\Phi_\theta(\omega t^{-2/3})\}
\]

then (1.108c) makes this the canonical continuous phase in
\((-\pi,0)\), and

\[
\widehat u_\theta(t)=-\frac{3}{2\pi}\chi_\theta'(t),
\qquad
u_\theta(t)=-\frac1\pi\chi_\theta'(t).
\tag{1.111}
\]

Moreover,

\[
\widehat u_\theta(t)
\sim
\frac{\sqrt3\,c\,\Gamma(4/3)}
{2\pi\Gamma(2/3)}t^{-5/3}>0
\qquad(t\to\infty).
\tag{1.112}
\]

No global conclusion is hidden in this endpoint asymptotic. The exact
remaining open obligation is

\[
\boxed{
\chi_\theta'(t)\le0
\qquad(t>0).
}
\tag{1.113}
\]

Global slit-plane and physical-ray zero-freeness have already been proved
in (1.94b) and (1.108c). Thus the phase monotonicity in (1.113),
including any boundary atoms, would prove GGC membership by the
Thorin--Bernstein criterion in Schilling--Song--Vondraček (2010),
Theorem 8.2. Equations (1.91)--(1.113), apart from the cited DLMF and
Schilling--Song--Vondraček inputs, are new project derivations.
They show that none of the first three finite gates produces a
\(q=3/2\) counterexample; the next discrete tests are the first
\(3\times3\) unshifted and shifted Hankel determinants.

### WIP-1.16 — the first \(3\times3\) gates at the two exact endpoints

**Status: [COMPUTER-VERIFIED EXACT AT BOTH ENDPOINTS; PROVED AN EXACT
OBSTRUCTION TO A UNIVERSAL MULTIPLIER LEMMA; THE INTERIOR TARGET FAMILY
REMAINS OPEN].**

Continue with

\[
Y=QG_1^{3/2},\qquad G_1\perp Q,\qquad
q_j=\mathbb E Q^j,
\]

and define \(a_n=\kappa_{n+1}(Y)/n!\) as in WIP-3.1.  The two next
Stieltjes necessary conditions are

\[
\boxed{
\mathcal D_0=\det(a_{i+j})_{i,j=0}^2,\qquad
\mathcal D_1=\det(a_{i+j+1})_{i,j=0}^2.
}
\tag{1.114}
\]

Thus \(\mathcal D_0\) uses cumulants through \(\kappa _5\), whereas
\(\mathcal D_1\) uses cumulants through \(\kappa _6\).  The required raw
moments are

\[
\boxed{
\begin{aligned}
(m_1,\ldots,m_6)=\bigg(
&\frac{3\sqrt\pi}{4}q_1,\ 6q_2,\
\frac{945\sqrt\pi}{32}q_3,\ 720q_4,\\
&\frac{2027025\sqrt\pi}{256}q_5,\ 362880q_6
\bigg).
\end{aligned}
}
\tag{1.115}
\]

The ordinary moment--cumulant recurrence, followed by

\[
\det
\begin{pmatrix}
x_0&x_1&x_2\\
x_1&x_2&x_3\\
x_2&x_3&x_4
\end{pmatrix}
=x_0x_2x_4+2x_1x_2x_3-x_0x_3^2-x_1^2x_4-x_2^3,
\tag{1.116}
\]

gives sparse polynomials with respectively \(13\) and \(34\) monomials in
\(\mathbb Q[q_1,\ldots,q_6,\sqrt\pi]\).

For the target of WIP-1.15, remove the irrelevant positive scale
\(e^\theta\) and put

\[
M_r=r+(1-r)U,\qquad r=e^{-2\theta}\in(0,1],\qquad
U\sim{\rm Beta}(1/2,1/2),\qquad Q_r=M_r^{3/2}.
\tag{1.117}
\]

At the equal-rate endpoint \(r=1\), \(q_j=1\).  Exact reduction gives

\[
\boxed{
\begin{aligned}
\mathcal D_0(1)
&=\sqrt\pi\left(
-\frac{2240595}{512}
+\frac{801959535}{524288}\pi
-\frac{2679075}{65536}\pi^2
\right)>0,\\
\mathcal D_1(1)
&=492048
-\frac{398591230347}{2097152}\pi
+\frac{853617406905}{67108864}\pi^2
-\frac{651015225}{1048576}\pi^3>0.
\end{aligned}
}
\tag{1.118}
\]

At infinite contrast, \(r\downarrow0\), the multiplier is
\(Q_0=U^{3/2}\), not \(U\) itself, and

\[
(q_1,\ldots,q_6)=
\left(
\frac4{3\pi},\frac5{16},\frac{256}{315\pi},\frac{231}{1024},
\frac{4096}{6435\pi},\frac{12155}{65536}
\right).
\tag{1.119}
\]

Consequently

\[
\boxed{
\begin{aligned}
\mathcal D_0(0)
&=\frac{\sqrt\pi}{\pi^3}\left(
-64+\frac{8945109}{8192}\pi
-\frac{11058525}{32768}\pi^2
\right)>0,\\
\mathcal D_1(0)
&=\frac1{\pi^3}\left(
-1088+\frac{2815198425}{262144}\pi
-\frac{63804618135}{2097152}\pi^2
+\frac{568346625}{65536}\pi^3
\right)>0.
\end{aligned}
}
\tag{1.120}
\]

These four signs do not use floating-point evaluation.  Machin's identity

\[
\pi=16\arctan(1/5)-4\arctan(1/239)
\]

and consecutive partial sums of the alternating arctangent series prove

\[
\frac{333}{106}<\pi<\frac{355}{113}.
\]

Termwise substitution in the four brackets in (1.118)--(1.120) gives the
strict rational lower bounds

\[
\frac{18222150064275}{709631148032},\quad
\frac{1338521613795715588209}{1087995122064293888},\quad
\frac{787839691097}{22175973376},\quad
\frac{4967007794368130437}{3986707789643776},
\tag{1.121}
\]

in their displayed order.  Since every \(q_j(r)\), every cumulant, and
both determinants are continuous in \(r\), the target family passes both
\(3\times3\) gates on some neighborhood of \(r=0\) and on some
neighborhood of \(r=1\).  This continuity statement does not fill the
interior interval.

There is also a sharp warning against overgeneralizing the universal
\(2\times2\) multiplier lemma (1.101).  Let

\[
\mathbb P(Q_R=R)=\frac1{10},\qquad
\mathbb P(Q_R=1)=\frac9{10}.
\]

The polynomials \(\mathcal D_0\) and \(\mathcal D_1\) are weighted
homogeneous of weights \(9\) and \(12\), when \(q_j\) has weight \(j\).
Since \(R^{-j}\mathbb E Q_R^j\to1/10\),

\[
\boxed{
\begin{aligned}
\lim_{R\to\infty}R^{-9}\mathcal D_0
&=\frac{27\sqrt\pi}{2621440000}
\left(-166097920+51591609\pi-39690\pi^2\right)<0,\\
\lim_{R\to\infty}R^{-12}\mathcal D_1
&=\frac{27}{3355443200000}
\left(
56583509770240-17996054833728\pi\right.\\
&\hspace{37mm}\left.
-8905296249\pi^2-77157360\pi^3
\right)<0.
\end{aligned}
}
\tag{1.122}
\]

The same rational interval for \(\pi\) proves both upper bounds strictly
negative.  Hence \(Q_RG_1^{3/2}\notin GGC\) for every sufficiently large
\(R\); the exact finite choice \(R=200\) makes both determinants negative.
This is **not** a counterexample to Conjecture 1: \(Q_R\) is an auxiliary
two-point multiplier and is not the affine-arcsine multiplier in (1.117).
It proves only that the arbitrary-\(Q\) method used for (1.101) cannot be
continued unchanged at size \(3\).

All sparse expansions, the endpoint substitutions, the Machin-series
certificates, both limits in (1.122), and the finite \(R=200\) witness are
reproduced by
[route1_q32_hankel3.py](computations/route1_q32_hankel3.py), using only
Python's `fractions.Fraction` class for every asserted sign.  A separate
Gauss--Chebyshev scan printed by that script is explicitly labelled
reconnaissance and is not used above.  An independent calculation from
closed formulas for \(\kappa_1,\ldots,\kappa_6\) reproduced every
coefficient in the exact script.

### WIP-1.17 — a uniform small-contrast theorem at \(q=3/2\)

**Status: [PROVED GGC MEMBERSHIP ON A NONEXPLICIT OPEN NEIGHBORHOOD OF
EQUAL RATES; ARBITRARY CONTRAST REMAINS OPEN].**

Continue with \(X_\theta\), \(Y_\theta=X_\theta^{3/2}\), and
\(\omega=e^{-2\pi i/3}\) from WIP-1.15.  Introduce the one-rate entire
function

\[
F(z)=3\int_0^\infty v e^{-v^3-zv^2}\,dv
\]

and write its physical-ray value as

\[
\boxed{
\zeta(x):=\omega F(\omega x)=N(x)-i\pi\mathcal M(x),
\qquad x\ge0.
}
\tag{1.123}
\]

Three elementary integrations by parts, applied to
\(I_j(z)=\int_0^\infty v^j e^{-v^3-zv^2}\,dv\), eliminate
\(I_2,I_4\) from \(F=3I_1\), \(F'=-3I_3\), and \(F''=3I_5\).  Explicitly,

\[
3I_2+2zI_1=1,\qquad
2I_1-3I_4-2zI_3=0,\qquad
3I_2-3I_5-2zI_4=0.
\]

They give

\[
\boxed{9F''(z)+4z^2F'(z)+10zF(z)=9.}
\tag{1.124}
\]

Since \(\omega^3=1\), both real components of \(\zeta\) satisfy

\[
\boxed{
9N''+4x^2N'+10xN=9,\qquad
9\mathcal M''+4x^2\mathcal M'+10x\mathcal M=0.
}
\tag{1.125}
\]

Direct integration at zero and the gamma reflection formula give

\[
\begin{aligned}
N(0)&=-\frac{\Gamma(2/3)}2,&
N'(0)&=\frac{\Gamma(4/3)}2,\\
\mathcal M(0)&=\frac1{\Gamma(1/3)},&
\mathcal M'(0)&=-\frac1{\Gamma(-1/3)}>0.
\end{aligned}
\tag{1.126}
\]

Put \(T=4x^3/27\) and
\(C_*=\Gamma(1/6)/\Gamma(1/3)^2\).  Reduction of the homogeneous
equation in (1.125) to Kummer's equation, followed by the initial values,
gives

\[
\boxed{
\begin{aligned}
\mathcal M(x)
&=C_*e^{-T}U\!\left(-\frac16,\frac23,T\right)\\
&=C_*e^{-T}T^{1/3}
  U\!\left(\frac16,\frac43,T\right)\\
&=\frac{e^{-T}T^{1/3}}{\Gamma(1/3)^2}
  \int_0^\infty e^{-Tu}u^{-5/6}(1+u)^{1/6}\,du>0
  \qquad(x>0).
\end{aligned}
}
\tag{1.127}
\]

The second and third lines are respectively DLMF 13.2.40 and 13.4.4;
the latter applies because \(1/6>0\) and \(T>0\).  DLMF 13.2.42 checks
the two initial values.  DLMF 13.7.3--13.7.5, including the differentiable
remainder bound, gives

\[
\mathcal M(x)=
C_*e^{-T}T^{1/6}
\left(1+\frac1{36T}+O(T^{-2})\right),
\qquad
\frac{x\mathcal M'(x)}{\mathcal M(x)}
=\frac12-3T-\frac1{12T}+O(T^{-2}).
\tag{1.128}
\]

The matching algebraic asymptotic of \(N\) can be obtained without
crossing a Stokes line.  Let \(K_0(s)=\mathbb E e^{-sG_1^{3/2}}\) and
\(x=t^{-2/3}\).  Equation (1.108) gives

\[
K_0(-t+i0)=\frac{2x}{3}\zeta(x),\qquad
\varrho(t):=-\frac1\pi\operatorname{Im}K_0(-t+i0)
=\frac23t^{-2/3}\mathcal M(t^{-2/3}).
\tag{1.129}
\]

By (1.128), \(\varrho(t)=O(t^{-1}e^{-4/(27t^2)})\) at zero, with all
derivatives flat there, while \(\varrho(t)=O(t^{-2/3})\) at infinity.
Consequently all inverse moments exist and

\[
\int_0^\infty u^{-j-1}\varrho(u)\,du
=\frac{\Gamma(1+3j/2)}{j!},\qquad j\ge0.
\]

Apply a smooth cutoff equal to one near zero.  The cutoff part, extended
by zero to the negative half-line, is smooth because of flatness, so its
Hilbert transform is smooth at zero; the complementary Cauchy transform
is analytic there.  More explicitly, for every fixed \(m\),

\[
\frac1{u-t}=\sum_{j=0}^m\frac{t^j}{u^{j+1}}
+\frac{t^{m+1}}{u^{m+1}(u-t)},
\]

and \(u^{-m-1}\varrho(u)\) is still flat at zero.  Thus the principal-value
remainder and its required derivatives are locally bounded.  Termwise
differentiation is legitimate and yields

\[
\boxed{
\begin{aligned}
N(x)&=\frac{3}{2x}
\left(1+\Gamma(5/2)x^{-3/2}+O(x^{-3})\right),\\
N'(x)&=-\frac{3}{2x^2}
\left(1+\frac52\Gamma(5/2)x^{-3/2}+O(x^{-3})\right),\\
\frac{xN'(x)}{N(x)}&\longrightarrow-1.
\end{aligned}
}
\tag{1.130}
\]

In particular \(N(x)>0\) for all sufficiently large \(x\).

Now define the one-rate Wronskian

\[
W_0(x)=N'(x)\mathcal M(x)-N(x)\mathcal M'(x).
\]

The two equations in (1.125) give the exact first-order identity

\[
\boxed{
W_0'(x)+\frac49x^2W_0(x)=\mathcal M(x),\qquad
W_0(0)=\frac13.
}
\tag{1.131}
\]

Hence

\[
W_0(x)=e^{-4x^3/27}
\left\{\frac13+\int_0^xe^{4u^3/27}\mathcal M(u)\,du\right\}>0.
\tag{1.132}
\]

This strict sign can be made stable uniformly over a small rate contrast.
The Bessel average in (1.107) is

\[
\Phi_\theta(z)=\mathbb E F(Dz),\qquad
D=\cosh\theta-\sinh\theta\cos\varphi,\qquad
\varphi\sim{\rm Uniform}(0,\pi).
\]

Set

\[
\overline N_\theta(r)=\mathbb E N(rD),\qquad
\overline{\mathcal M}_\theta(r)=\mathbb E\mathcal M(rD).
\]

Then

\[
\omega\Phi_\theta(\omega r)
=\overline N_\theta(r)-i\pi\overline{\mathcal M}_\theta(r),
\qquad \overline{\mathcal M}_\theta(r)>0.
\tag{1.133}
\]

If

\[
\overline W_\theta
=\overline N_\theta'\overline{\mathcal M}_\theta
 -\overline N_\theta\overline{\mathcal M}_\theta',
\]

direct differentiation and symmetrization with independent copies \(D,E\)
give

\[
\boxed{
\begin{aligned}
\frac d{dr}\arg\{\omega\Phi_\theta(\omega r)\}
&=\frac{\pi\overline W_\theta(r)}
{\overline N_\theta(r)^2+\pi^2\overline{\mathcal M}_\theta(r)^2},\\
r\overline W_\theta(r)&=\mathbb E\mathscr S(rD,rE),
\end{aligned}
}
\tag{1.134}
\]

where

\[
\boxed{
\begin{aligned}
\mathscr S(x,y)=\frac12\{&
xN'(x)\mathcal M(y)+yN'(y)\mathcal M(x)\\
&-yN(x)\mathcal M'(y)-xN(y)\mathcal M'(x)\}.
\end{aligned}
}
\tag{1.135}
\]

On the diagonal,
\(\mathscr S(x,x)=xW_0(x)>0\).  More is true: there exists a scale-free
\(\varepsilon_0>0\) such that

\[
\boxed{
\left|\log\frac xy\right|<\varepsilon_0
\quad\Longrightarrow\quad
\mathscr S(x,y)>0.
}
\tag{1.136}
\]

Here are the compactness details.  At the origin, the analytic Taylor
series and \(W_0(0)=1/3\) give
\(\mathscr S(x,y)=(x+y)/6+O((x+y)^2)\).  For sufficiently large \(x,y\),
put \(R=N/\mathcal M\),
\(n=xN'/N\), and \(h=x\mathcal M'/\mathcal M\).  Then \(N,\mathcal M,R\)
are positive and

\[
2\mathscr S(x,y)=\mathcal M(x)\mathcal M(y)
\{R(x)[n(x)-h(y)]+R(y)[n(y)-h(x)]\}>0,
\]

because \(n(x)\to-1\) and \(h(x)\to-\infty\).  If (1.136) failed, a
sequence with \(\log(x_j/y_j)\to0\) and
\(\mathscr S(x_j,y_j)\le0\) would have, after passage to a subsequence,
\(x_j\to0\), \(x_j\to x\in(0,\infty)\), or \(x_j\to\infty\).  The
origin estimate, continuity together with
\(\mathscr S(x,x)>0\), and the large-quadrant estimate exclude these
three cases.

Finally,

\[
D\in[e^{-|\theta|},e^{|\theta|}],\qquad
\left|\log\frac DE\right|\le2|\theta|.
\]

Choose \(\theta_*=\varepsilon_0/2\).  If
\(\lvert\theta\rvert<\theta_*\), then (1.136) makes
\(\overline W_\theta(r)>0\) for every \(r>0\).  Since \(r=t^{-2/3}\),

\[
\chi_\theta'(t)=
-\frac{2\pi}{3}t^{-5/3}
\frac{\overline W_\theta(t^{-2/3})}
{\overline N_\theta(t^{-2/3})^2+
 \pi^2\overline{\mathcal M}_\theta(t^{-2/3})^2}<0.
\]

Combining this with the zero-freeness and phase criterion in
WIP-1.15 proves the new local theorem

\[
\boxed{
\exists\,\theta_*>0:\quad
\lvert\theta\rvert<\theta_*
\Longrightarrow
\left(e^\theta G_{1/2}+e^{-\theta}G'_{1/2}\right)^{3/2}\in GGC.
}
\tag{1.137}
\]

The proof is exact but \(\theta_*\) is nonconstructive.  It does not prove
the result for arbitrary contrast.  There is also an exact obstruction to
strengthening the method to global pointwise kernel positivity.  From
(1.130) and the exponential decay of \(\mathcal M'\),

\[
\mathscr S(x,0)
\sim-\frac{3}{4\Gamma(1/3)x}<0
\qquad(x\to\infty).
\tag{1.138}
\]

By continuity the same sign occurs for some strictly positive \(y\).
This is an obstruction to the pointwise-kernel proof only, not a
counterexample to the arcsine average or to Conjecture 1.  Equations
(1.123)--(1.138), apart from the cited DLMF formulas and the
Thorin--Bernstein criterion already cited in WIP-1.15, are new project
derivations.  An independent recalculation checked the Kummer constants
and derivative remainder, the Stieltjes boundary normalization, both
Wronskian signs, the double-average factor, the logarithmic-tube
compactness argument, and the final phase direction.

### WIP-1.18 — the exact residual is never \(HM_{2/3}\)

**Status: [PROVED OBSTRUCTION TO THE GAMMA--\(HM_k\) SHORTCUT; NOT A
COUNTEREXAMPLE TO GGC MEMBERSHIP].**

Specialize (1.82) to \(B=1\).  For every finite
\(\theta\in\mathbb R\),

\[
X_\theta^{3/2}\overset d=G_{2/3}N_\theta,\qquad
N_\theta=c_0M_\theta^{3/2}\sqrt{VE},\qquad
c_0=\frac{3\sqrt3}{2},
\tag{1.139}
\]

where all factors are independent,

\[
V\sim{\rm Beta}\!\left(\frac23,\frac16\right),\qquad
E\sim\Gamma(1,1),
\]

and \(M_\theta\) is the affine arcsine mean in (1.91), supported by the
compact positive interval
\([e^{-|\theta|},e^{|\theta|}]\).  Write \(C_0=c_0^2=27/4\), and let
\(f_\theta\) denote the density of \(N_\theta\).

Conditional on \(M_\theta=m,V=v\), the density is

\[
\frac{2x}{C_0m^3v}
\exp\!\left\{-\frac{x^2}{C_0m^3v}\right\}.
\]

Put \(q_m=x^2/(C_0m^3)\).  The substitution \(t=(1-v)/v\), followed by
DLMF 13.4.4, gives

\[
\frac1{B(2/3,1/6)}
\int_0^1v^{-4/3}(1-v)^{-5/6}e^{-q/v}\,dv
=\frac{\Gamma(5/6)}{\Gamma(2/3)}
e^{-q}U\!\left(\frac16,\frac43,q\right).
\]

Using the parameter transformation DLMF 13.2.40 therefore yields the
exact density

\[
\boxed{
f_\theta(x)=
\frac{2\Gamma(5/6)}{C_0^{2/3}\Gamma(2/3)}
x^{1/3}\,
\mathbb E\!\left[
M_\theta^{-2}e^{-q_m}
U\!\left(-\frac16,\frac23,q_m\right)
\right].
}
\tag{1.140}
\]

The connection formula DLMF 13.2.42 gives, as \(q\downarrow0\),

\[
U\!\left(-\frac16,\frac23,q\right)
=A_U+B_Uq^{1/3}+O(q),
\quad
A_U=\frac{\Gamma(1/3)}{\Gamma(1/6)}>0,
\quad
B_U=\frac{\Gamma(-1/3)}{\Gamma(-1/6)}>0.
\]

Because the support of \(M_\theta\) is compact and bounded away from zero,
the expansion and its derivative are uniform under the expectation in
(1.140).  Thus

\[
\boxed{
f_\theta(x)=a_\theta x^{1/3}
\{1+b_\theta x^{2/3}+R_\theta(x)\},\qquad
R_\theta(x)=O(x^2),\quad R_\theta'(x)=O(x),
}
\tag{1.141}
\]

where

\[
\begin{aligned}
a_\theta&=
\frac{2\Gamma(5/6)}{C_0^{2/3}\Gamma(2/3)}
\frac{\Gamma(1/3)}{\Gamma(1/6)}
\mathbb E M_\theta^{-2}>0,\\
b_\theta&=
C_0^{-1/3}
\frac{\Gamma(-1/3)\Gamma(1/6)}
     {\Gamma(-1/6)\Gamma(1/3)}
\frac{\mathbb E M_\theta^{-3}}
     {\mathbb E M_\theta^{-2}}>0.
\end{aligned}
\tag{1.142}
\]

In particular the logarithmic elasticity satisfies

\[
\boxed{
\ell_\theta(x):=\frac{xf_\theta'(x)}{f_\theta(x)}
=\frac13+\frac23b_\theta x^{2/3}+O(x^{4/3}).
}
\tag{1.143}
\]

The positive second term will violate a fractional Abel necessary
condition for \(HM_{2/3}\).  Fix a center \(\xi>0\), write

\[
h_\xi(w)=f_\theta(\xi v)f_\theta(\xi/v),
\qquad w=v+v^{-1}\ge2,
\]

and suppose, for contradiction, that \(f_\theta\in HM_{2/3}\).  Sjödin's
Definition 2.1 then supplies a nonnegative measure \(H_\xi\) such that

\[
h_\xi(w)=
\int_{(w,\infty)}(\lambda-w)^{-1/3}H_\xi(d\lambda).
\tag{1.144}
\]

Define

\[
J_\xi(w)=\int_w^\infty(t-w)^{-2/3}h_\xi(t)\,dt.
\]

Tonelli's theorem and

\[
\int_w^\lambda
(t-w)^{-2/3}(\lambda-t)^{-1/3}\,dt
=B\!\left(\frac13,\frac23\right)=\frac{2\pi}{\sqrt3}
\]

give

\[
\boxed{
J_\xi(w)=\frac{2\pi}{\sqrt3}H_\xi((w,\infty)).
}
\tag{1.145}
\]

Consequently \(J_\xi\) must be nonincreasing.  In the present smooth
Gaussian-tail model \(J_\xi\in C^1(2,\infty)\), so necessarily
\(J_\xi'(w)\le0\).

Let

\[
v_t=\frac{t+\sqrt{t^2-4}}2.
\]

Differentiation under the shifted integral and the identity
\(d(\log v_t)/dt=(t^2-4)^{-1/2}\) give

\[
\boxed{
\begin{aligned}
J_\xi'(w)
 &=\int_0^\infty s^{-2/3}h_\xi'(w+s)\,ds,\\
h_\xi'(t)
 &=\frac{h_\xi(t)}{\sqrt{t^2-4}}
\{\ell_\theta(\xi v_t)-\ell_\theta(\xi/v_t)\}.
\end{aligned}
}
\tag{1.146}
\]

Fix any \(w_0>2\).  The exact small-center asymptotic is

\[
\boxed{
J_\xi'(w_0)=
\frac23a_\theta^2b_\theta\,
\xi^{4/3}\log\frac1\xi
+O_{w_0,\theta}(\xi^{4/3}),
\qquad \xi\downarrow0.
}
\tag{1.147}
\]

Here are the uniform estimates behind (1.147).  Choose a fixed large
\(L>w_0\) and a fixed sufficiently small \(\delta>0\).  On
\([w_0,L]\), (1.141)--(1.143) give \(h_\xi'(t)=O(\xi^{4/3})\), and the
endpoint weight in (1.146) is integrable.  On
\(L\le t\le\delta/\xi\), both arguments of \(f_\theta\) lie in the
uniform small-\(x\) range, and

\[
\boxed{
(t-w_0)^{-2/3}h_\xi'(t)
=\frac23a_\theta^2b_\theta\,\frac{\xi^{4/3}}t
+O(\xi^{4/3}t^{-5/3})
+O(\xi^2t^{-1/3}).
}
\tag{1.148}
\]

The two error integrals are \(O(\xi^{4/3})\), whereas the leading term
integrates to the logarithm in (1.147).

For \(t\ge\delta/\xi\), set

\[
x=\xi v_t,\qquad y=\frac{\xi}{v_t}=\frac{\xi^2}{x}.
\]

Then

\[
t=\frac{x}{\xi}+\frac{\xi}{x},\qquad
\frac{dt}{\sqrt{t^2-4}}=\frac{dx}{x}.
\]

The local bound \(f_\theta(y)\le Cy^{1/3}\), together with DLMF
13.7.3--13.7.5 applied uniformly over the compact \(M_\theta\)-support,
gives constants \(c,C,m>0\) for which

\[
f_\theta(x)+x|f_\theta'(x)|
\le C(1+x)^m e^{-cx^2}.
\]

Consequently the tail of (1.146) is bounded by

\[
\boxed{
C\xi^{4/3}\int_{\delta/2}^\infty
x^{-2}f_\theta(x)\{1+|\ell_\theta(x)|\}\,dx
=O(\xi^{4/3}).
}
\tag{1.149}
\]

This proves (1.147).  Since \(a_\theta,b_\theta>0\),
\(J_\xi'(w_0)>0\) for all sufficiently small \(\xi\), contradicting
(1.145).  We have therefore proved

\[
\boxed{
N_\theta\notin HM_{2/3}
\qquad\text{for every finite }\theta\in\mathbb R.
}
\tag{1.150}
\]

Sjödin's Theorem 3.1, with \(k=l=2/3\), would have yielded
\(G_{2/3}N_\theta\in GGC\) from \(N_\theta\in HM_{2/3}\).  Equation
(1.150) proves that this sufficient route is unavailable, including at
\(\theta=0\).  It does not say that \(X_\theta^{3/2}\) is not GGC:
WIP-1.17 proves the opposite for all sufficiently small contrasts.
Equations (1.139)--(1.150) are new project derivations.  The density
constants, Kummer signs, Abel exponent and beta constant, all three
regions in (1.147), and the tail scaling were independently recalculated
before this entry was marked proved.

### WIP-1.19 — logarithmic arcsine convolution and its radial PDE

**Status: [PROVED REDUCTION AND PROVED OBSTRUCTION TO DIRECT SEPARATION
INTEGRATION BY PARTS; ALL-CONTRAST PHASE MONOTONICITY REMAINS OPEN].**

The average in (1.133) has additional exact structure.  For
\(\theta>0\), let

\[
D=\cosh\theta-\sinh\theta\cos\Phi,\qquad
\Phi\sim{\rm Uniform}(0,\pi),\qquad
a=e^{-\theta},\quad b=e^\theta.
\]

The change of variables from \(\Phi\) to \(D\), and then
\(u=\log D\), gives

\[
\boxed{
\begin{aligned}
p_D(s)
 &=\frac{\mathbf1_{(a,b)}(s)}
         {\pi\sqrt{(s-a)(b-s)}},\\
p_{\log D}(u)
 &=e^{u/2}k_\theta(u)\mathbf1_{\{|u|<\theta\}},\\
k_\theta(u)
 &=\frac1{\pi\sqrt{2(\cosh\theta-\cosh u)}}.
\end{aligned}
}
\tag{1.151}
\]

The kernel \(k_\theta\) is even, but it is not itself a probability
density; the probability normalization is

\[
\int_{-\theta}^{\theta}e^{u/2}k_\theta(u)\,du=1.
\]

The same density calculation gives the reciprocal size-bias identity

\[
\boxed{
\mathbb E h(D^{-1})=\mathbb E[D^{-1}h(D)],
\qquad \mathbb E D^{-1}=1.
}
\tag{1.152}
\]

For a suitable function \(f\), define

\[
g(x)=e^{x/2}f(e^x),\qquad
U_\theta(x)=\mathbb E f(e^xD),\qquad
\mathcal G_\theta(x)=e^{x/2}U_\theta(x).
\]

Then (1.151) becomes the even-kernel convolution

\[
\boxed{
\mathcal G_\theta(x)=
\int_{-\theta}^{\theta}k_\theta(u)g(x+u)\,du.
}
\tag{1.153}
\]

For the current ray take \(f=\zeta=N-i\pi\mathcal M\).  Multiplication by
the positive factor \(e^{x/2}\) does not change the phase, and

\[
\arg\mathcal G_\theta(x)
=\arg\{\omega\Phi_\theta(\omega e^x)\}.
\]

DLMF 14.12.7 gives
\(\mathbb E D^s=P_s(\cosh\theta)\), and DLMF 14.2.1 gives the Legendre
equation.  Applying it first to Mellin modes, and then using the
convergent integral representation, yields

\[
\boxed{
\begin{aligned}
\partial_{\theta\theta}\mathcal G_\theta
+\coth\theta\,\partial_\theta\mathcal G_\theta
 &=\partial_{xx}\mathcal G_\theta-\frac14\mathcal G_\theta,\\
\mathcal G_0(x)&=g(x),\qquad
\left.\partial_\theta\mathcal G_\theta(x)\right|_{\theta=0}=0.
\end{aligned}
}
\tag{1.154}
\]

Thus contrast evolution is a radial Klein--Gordon equation, not a scalar
maximum-principle flow.  The boundary data inherited from (1.123) and
(1.130) are

\[
\boxed{
\begin{aligned}
\mathcal G_\theta(x)
 &\sim\omega\Gamma(2/3)e^{x/2}
 &&(x\to-\infty),\\
\mathcal G_\theta(x)
 &\sim\frac32e^{-x/2}
 &&(x\to+\infty).
\end{aligned}
}
\tag{1.155}
\]

The second line uses (1.152).  Define the two currents

\[
\mathcal J_\theta
=\operatorname{Im}(\mathcal G_{\theta,x}\overline{\mathcal G_\theta}),
\qquad
\mathcal Q_\theta
=\operatorname{Im}(\mathcal G_{\theta,\theta}
                    \overline{\mathcal G_\theta}).
\]

Equation (1.154) implies the exact conservation law

\[
\boxed{
\partial_\theta\{\sinh\theta\,\mathcal Q_\theta\}
=\sinh\theta\,\partial_x\mathcal J_\theta.
}
\tag{1.156}
\]

This hyperbolic conservation law by itself does not preserve the desired
sign \(\mathcal J_\theta\ge0\).

There is also an exact separation identity.  Write

\[
g(x)=A(x)-iC(x)=\varrho(x)e^{i\phi(x)},\qquad C(x)>0,
\]

and define the symmetric two-point current

\[
\mathcal K(p,q)=\frac12\{
A'(p)C(q)+A'(q)C(p)-A(p)C'(q)-A(q)C'(p)\}.
\tag{1.157}
\]

For \(p=m+\delta,q=m-\delta\), direct differentiation gives

\[
\boxed{
\begin{aligned}
\mathcal K(m+\delta,m-\delta)
 &=\frac12\partial_\delta
 \left[
 \varrho(m+\delta)\varrho(m-\delta)
 \sin\{\phi(m+\delta)-\phi(m-\delta)\}
 \right],\\
\mathcal K(\log x,\log y)
 &=\pi e^{(\log x+\log y)/2}\mathscr S(x,y).
\end{aligned}
}
\tag{1.158}
\]

The one-scale Wronskian (1.132) gives
\(\phi'(x)>0\) and \(-2\pi/3<\phi(x)<0\).  Hence the expression inside
the separation derivative in (1.158) is positive for \(\delta>0\), but
its derivative need not be positive; this is precisely how the
separated-scale sign failure (1.138) can occur.

Expanding the convolution current and symmetrizing gives

\[
\boxed{
\mathcal J_\theta(x)=
\iint_{(-\theta,\theta)^2}
k_\theta(u)k_\theta(v)
\mathcal K(x+u,x+v)\,du\,dv.
}
\tag{1.159}
\]

With \(m=(u+v)/2\), \(\delta=(u-v)/2\), the same identity is, as an
absolutely convergent two-dimensional Lebesgue integral,

\[
\boxed{
\begin{aligned}
\mathcal J_\theta(x)
=2\int_{-\theta}^{\theta}
\int_0^{\theta-|m|}
&k_\theta(m+\delta)k_\theta(m-\delta)\\
&\times\partial_\delta\!\left[
\varrho(x+m+\delta)\varrho(x+m-\delta)
\sin\Delta\phi
\right]\,d\delta\,dm .
\end{aligned}
}
\tag{1.160}
\]

The factor \(2\) includes both the Jacobian and the symmetry
\(\delta\leftrightarrow-\delta\).  At \(m=0\) the inner endpoint has a
corner singularity, so (1.160) is not a license for pointwise
one-dimensional integration by parts on that exceptional slice; the
original two-dimensional integral is nevertheless absolutely integrable.

Finally, if \(L_\theta(u)=\log k_\theta(u)\), then

\[
\boxed{
\begin{aligned}
L_\theta'(u)
 &=\frac{\sinh u}{2(\cosh\theta-\cosh u)},\\
L_\theta''(u)
 &=\frac{\cosh\theta\cosh u-1}
 {2(\cosh\theta-\cosh u)^2}>0,\\
\partial_\delta\log\{
k_\theta(m+\delta)k_\theta(m-\delta)\}
 &=L_\theta'(m+\delta)-L_\theta'(m-\delta)>0
 \qquad(\delta>0).
\end{aligned}
}
\tag{1.161}
\]

Thus the arcsine kernel product *increases* with separation and has
square-root singularities at the boundary.  A formal integration by parts
in (1.160) would produce a nonpositive bulk term and an uncontrolled
singular boundary term.  We have proved the precise limitation

\[
\boxed{
\text{the direct separation integration-by-parts argument does not
determine the sign of }\mathcal J_\theta.
}
\tag{1.162}
\]

Equations (1.151)--(1.162) are new project derivations.  Their density
normalization, reciprocal bias, PDE sign, conservation law, Jacobian and
factor \(2\), and the kernel convexity were independently recalculated.
The viable all-contrast target is now an Abel-type boundary-compensation
inequality for (1.160), not ordinary pointwise positivity, TP\(_2\), or
naive separation integration by parts.

## Route 2: Thorin/Volterra analysis

### WIP-2.1 — exact half-shape benchmark and its exponential mixture

**Status: [PROVED].**

Take independent

\[
X_i\sim\Gamma(1/2,b_i)
\]

in the rate convention. Direct convolution gives

\[
f_X(x)=
\sqrt{b_1b_2}\,
e^{-(b_1+b_2)x/2}
I_0\left(\frac{b_1-b_2}{2}x\right).
\tag{2.1}
\]

For reciprocal rates

\[
b_1=e^\theta,\qquad b_2=e^{-\theta},\qquad \theta>0,
\]

put

\[
a=\cosh\theta,\qquad c=\sinh\theta.
\]

For later use, set

\[
D_\varphi:=a-c\cos\varphi.
\tag{2.2a}
\]

Then \(a^2-c^2=1\),
\(D_\varphi\in[e^{-\theta},e^\theta]\), and

\[
f_X(x)=\frac1\pi\int_0^\pi e^{-D_\varphi x}\,d\varphi.
\tag{2.2b}
\]

Then

\[
f_X(x)=e^{-ax}I_0(cx).
\tag{2.2}
\]

For \(Y=X^2\),

\[
f_Y(y)=
\frac1{2\sqrt y}e^{-a\sqrt y}I_0(c\sqrt y).
\tag{2.3}
\]

Using

\[
I_0(z)=\frac1\pi\int_0^\pi e^{z\cos\varphi}\,d\varphi
\]

and, for \(d>0\),

\[
y^{-1/2}e^{-d\sqrt y}
=
\frac1{\sqrt\pi}
\int_0^\infty
t^{-1/2}e^{-d^2/(4t)}e^{-ty}\,dt,
\tag{2.4}
\]

we obtain the exact Bernstein representation

\[
f_Y(y)=\int_0^\infty e^{-ty}m_\theta(t)\,dt,
\tag{2.5}
\]

where

\[
\boxed{
m_\theta(t)=
\frac{t^{-1/2}}{2\pi^{3/2}}
\int_0^\pi
\exp\left\{
-\frac{(\cosh\theta-\sinh\theta\cos\varphi)^2}{4t}
\right\}
d\varphi.
}
\tag{2.6}
\]

The integrand is nonnegative and
\(\cosh\theta-\sinh\theta\cos\varphi\ge e^{-\theta}>0\).
Moreover,

\[
\int_0^\infty\frac{m_\theta(t)}t\,dt
=
\frac1\pi\int_0^\pi\frac{d\varphi}{D_\varphi}
=
\frac1{\sqrt{a^2-c^2}}=1.
\tag{2.6a}
\]

Thus \(f_Y\) is completely monotone and

\[
\psi_Y(s)=
\int_0^\infty\frac{m_\theta(t)}{s+t}\,dt
\tag{2.7}
\]

is a Stieltjes function. This proves that \(Y\) is a mixture of
exponentials.  The Goldie--Steutel theorem therefore also proves that
\(Y\) is infinitely divisible; it does **not** prove that \(Y\) is GGC.
The precise source used here is Steutel--van Harn (2004), Chapter III,
Theorem 10.7.

### WIP-2.2 — explicit negative-axis boundary values

**Status: [PROVED].**

For \(d>0\), define

\[
J_d(s):=\int_0^\infty e^{-s z^2-dz}\,dz
=
\frac{\sqrt\pi}{2\sqrt s}
e^{d^2/(4s)}
\operatorname{erfc}\!\left(\frac d{2\sqrt s}\right),
\qquad \Re s>0.
\tag{2.8}
\]

Continue with the principal square root.  Since
\(\sqrt{-x+i0}=i\sqrt x\), for \(x>0\)

\[
J_d(-x+i0)
=
\frac{\sqrt\pi}{2\sqrt x}
e^{-d^2/(4x)}
\left[
\operatorname{erfi}\!\left(\frac d{2\sqrt x}\right)-i
\right].
\tag{2.9}
\]

Put

\[
u=\frac1{2\sqrt x},\qquad
\langle H(D)\rangle
:=\frac1\pi\int_0^\pi H(D_\varphi)\,d\varphi .
\tag{2.10}
\]

Equations (2.2b) and (2.9), with Tonelli first in the right half-plane and
then analytic continuation, give

\[
\psi_Y(-x+i0)=A_\theta(x)-iB_\theta(x),
\tag{2.11}
\]

where

\[
\boxed{
A_\theta(x)=
\frac{\sqrt\pi}{2\sqrt x}
\left\langle
e^{-u^2D^2}\operatorname{erfi}(uD)
\right\rangle
}
\tag{2.12}
\]

and

\[
\boxed{
B_\theta(x)=
\frac{\sqrt\pi}{2\sqrt x}
\left\langle e^{-u^2D^2}\right\rangle
=\pi m_\theta(x).
}
\tag{2.13}
\]

In particular \(A_\theta(x)>0\) and \(B_\theta(x)>0\) for every \(x>0\).
This removes the possible boundary-argument branch ambiguity.  It also
recovers the principal-value identity

\[
A_\theta(x)
=
\operatorname{PV}\int_0^\infty
\frac{m_\theta(t)}{t-x}\,dt.
\tag{2.14}
\]

### WIP-2.3 — the phase criterion and a principal-value-free target

**Status: [PROVED REDUCTION], using established CBF/TBF representation
theorems cited below.**

Let \(F_\theta=1/\psi_Y\).  A nonzero Stieltjes function has a complete
Bernstein reciprocal.  Define its normalized boundary phase by

\[
\vartheta_\theta(x)
:=
\frac1\pi\arg F_\theta(-x+i0)
=
-\frac1\pi\arg\psi_Y(-x+i0).
\tag{2.15}
\]

Since (2.12)--(2.13) are strictly positive,

\[
\boxed{
\vartheta_\theta(x)
=
\frac1\pi\arctan\frac{B_\theta(x)}{A_\theta(x)}
\in(0,1/2).
}
\tag{2.16}
\]

The canonical phase representation gives, up to an irrelevant real
constant,

\[
\log F_\theta(s)
=
C_\theta+
\int_0^\infty
\left(\frac{t}{1+t^2}-\frac1{s+t}\right)
\vartheta_\theta(t)\,dt.
\tag{2.17}
\]

For a general CBF, the phase in this representation is determined only
almost everywhere.  Here the explicit positive, smooth boundary values
(2.12)--(2.13) select a continuous representative, so the pointwise
differentiation below is legitimate.

Because \(F_\theta(0)=1\), subtracting the value at zero in (2.17) gives
the normalized identity

\[
\log F_\theta(s)
=
\int_0^\infty
\frac{s}{t(s+t)}\vartheta_\theta(t)\,dt.
\tag{2.17a}
\]

Consequently

\[
g_\theta(s):=
-\frac{\psi_Y'(s)}{\psi_Y(s)}
=
\int_0^\infty
\frac{\vartheta_\theta(t)}{(s+t)^2}\,dt.
\tag{2.18}
\]

Direct endpoint analysis below gives

\[
\vartheta_\theta(0+)=0,\qquad
\vartheta_\theta(\infty)=\frac12.
\tag{2.19}
\]

The phase is smooth in this model.  Integrating (2.18) by parts therefore
shows

\[
\boxed{
Y\in GGC
\quad\Longleftrightarrow\quad
\vartheta_\theta'(t)\ge0\quad(t>0).
}
\tag{2.20}
\]

If this holds, the Thorin measure is

\[
U_\theta(dt)=\vartheta_\theta'(t)\,dt,
\qquad U_\theta((0,\infty))=\frac12.
\tag{2.21}
\]

Here none of the endpoint conditions is implicit.  Remark 6.11 in the
cited source gives

\[
\int_0^1\frac{\vartheta_\theta(t)}t\,dt<\infty.
\tag{2.21a}
\]

If \(\vartheta_\theta\) is nondecreasing, integration by parts implies the
required logarithmic integrability of \(d\vartheta_\theta\) at zero, while
its bound by \(1/2\) gives the required \(t^{-1}\)-integrability at
infinity.  Also \(\log F_\theta(0)=0\) excludes a killing constant,
\(g_\theta(0)=\mathbb E[Y]<\infty\) excludes an \(a/s\) term, and
\(g_\theta(s)\sim(2s)^{-1}\) excludes linear drift.  Thus (2.20) is an
equivalence for this model, not merely a sufficient condition.

The external analytic inputs in this paragraph are
Schilling--Song--Vondraček (2010), Theorem 7.3, p. 63
(nonzero Stieltjes reciprocal \(\Longleftrightarrow\) nonzero CBF),
Theorem 6.10, pp. 58--60 (canonical phase representation), and
Theorem 8.2, pp. 73--75 (Thorin--Bernstein characterization, including
the nondecreasing cumulative Thorin function).

Differentiating (2.16) also yields the Wronskian form

\[
\boxed{
\vartheta_\theta'(x)
=
\frac{
A_\theta(x)m_\theta'(x)-m_\theta(x)A_\theta'(x)
}{
A_\theta(x)^2+\pi^2m_\theta(x)^2
}.
}
\tag{2.22}
\]

There is a more useful formulation without a principal value.  Define

\[
Q_\theta(u):=
\left\langle e^{-u^2D^2}\right\rangle,
\qquad
N_\theta(u):=
\left\langle
e^{-u^2D^2}\operatorname{erfi}(uD)
\right\rangle,
\tag{2.23}
\]

and

\[
\mathcal R_\theta(u):=\frac{N_\theta(u)}{Q_\theta(u)}
=\frac{A_\theta(x)}{B_\theta(x)}.
\tag{2.24}
\]

Since \(x=1/(4u^2)\),

\[
\boxed{
\vartheta_\theta'(x)
=
\frac{2u^3\mathcal R_\theta'(u)}
{\pi(1+\mathcal R_\theta(u)^2)}.
}
\tag{2.25}
\]

Thus the entire two-gamma benchmark is equivalent to the single real
inequality

\[
\boxed{
X^2\in GGC
\quad\Longleftrightarrow\quad
\mathcal R_\theta'(u)\ge0
\quad\text{for every }u>0.
}
\tag{2.26}
\]

> **[OPEN STEP R2-A]** Prove or disprove (2.26).  This supersedes direct
> differentiation of the principal-value integral (2.14).

### WIP-2.4 — covariance and tilted-arcsine Stein formulations

**Status: [PROVED REDUCTION].**

On angle space introduce the tilted probability law

\[
\nu_u(d\varphi)
=
\frac{e^{-u^2D_\varphi^2}}{Q_\theta(u)}
\frac{d\varphi}{\pi}.
\tag{2.27}
\]

The elementary derivative

\[
\frac d{du}
\left[
e^{-u^2D^2}\operatorname{erfi}(uD)
\right]
=
\frac{2D}{\sqrt\pi}
-2uD^2e^{-u^2D^2}\operatorname{erfi}(uD)
\]

and \(\langle D\rangle=a\) give

\[
\boxed{
\mathcal R_\theta'(u)
=
\frac{2a}{\sqrt\pi\,Q_\theta(u)}
-2u\,\operatorname{Cov}_{\nu_u}
\left(D^2,\operatorname{erfi}(uD)\right).
}
\tag{2.28}
\]

Hence the remaining assertion is exactly the quantitative covariance bound

\[
\boxed{
uQ_\theta(u)\,
\operatorname{Cov}_{\nu_u}
\left(D^2,\operatorname{erfi}(uD)\right)
\le\frac a{\sqrt\pi}.
}
\tag{2.29}
\]

Ordinary Chebyshev association only says that the covariance is
nonnegative, which is the wrong direction for (2.29).  The untilted
arcsine image \(D=a-c\cos\varphi\) satisfies

\[
\boxed{
\left\langle(D-a)H(D)\right\rangle
=
\left\langle
\bigl(c^2-(D-a)^2\bigr)H'(D)
\right\rangle.
}
\tag{2.30}
\]

> **[OPEN STEP R2-B]** Derive the Stein kernel of the tilted law
> \(\nu_u\) and use it to prove (2.29), or locate a parameter pair where
> (2.29) is strictly reversed.

### WIP-2.5 — endpoint positivity and the solved equal-rate case

**Status: [PROVED].**

As \(u\downarrow0\), Taylor expansion under the bounded \(D\)-integral gives

\[
\mathcal R_\theta(u)
=
\frac{2a}{\sqrt\pi}u+O(u^3),
\qquad
\mathcal R_\theta'(u)
=
\frac{2a}{\sqrt\pi}+O(u^2)>0
\tag{2.31}
\]

for all sufficiently small \(u>0\).

For \(\theta>0\), let \(d_0=a-c=e^{-\theta}\).  Endpoint Laplace expansion,
applied also after differentiation, gives as \(u\to\infty\)

\[
Q_\theta(u)
\sim
\frac{e^{-d_0^2u^2}}
{2\sqrt\pi\,u\sqrt{d_0c}},
\qquad
N_\theta(u)\sim\frac1{\sqrt\pi u},
\tag{2.32}
\]

where the second equivalence uses
\(\langle D^{-1}\rangle=(a^2-c^2)^{-1/2}=1\).  Therefore

\[
\frac{Q_\theta'(u)}{Q_\theta(u)}
=-2d_0^2u-\frac1u+O(u^{-3}),
\qquad
\frac{N_\theta'(u)}{N_\theta(u)}
=-\frac1u+O(u^{-3}).
\tag{2.32a}
\]

For completeness, these differentiated estimates do not follow merely by
differentiating the symbols in (2.32).  Write

\[
D_\varphi^2-d_0^2=d_0c\,\varphi^2+O(\varphi^4)
\quad(\varphi\downarrow0).
\]

After \(z=u\varphi\), Gaussian domination on a fixed endpoint
neighborhood, together with an exponentially small bound on its
complement, gives the \(u^{-1}(1+O(u^{-2}))\) expansion for \(Q_\theta\)
and the same expansion after one \(u\)-derivative.  For \(N_\theta\), the
uniform large-\(z\) expansion

\[
e^{-z^2}\operatorname{erfi}(z)
=
\frac1{\sqrt\pi z}
\left(1+\frac1{2z^2}+O(z^{-4})\right),
\qquad z=uD\ge ud_0,
\]

may likewise be differentiated uniformly.  Averaging and using
\(\langle D^{-1}\rangle=1\) proves (2.32a).  Hence

\[
\mathcal R_\theta(u)
\sim
2\sqrt{d_0c}\,e^{d_0^2u^2},
\qquad
\frac{\mathcal R_\theta'(u)}{\mathcal R_\theta(u)}
=2d_0^2u+O(u^{-3})>0
\tag{2.33}
\]

for all sufficiently large \(u\).  Thus for each fixed \(\theta>0\), a
failure of phase monotonicity can occur only in a compact intermediate
\(u\)-interval.

When \(\theta=0\), \(D\equiv1\), so

\[
\mathcal R_0(u)=\operatorname{erfi}(u),
\qquad
\mathcal R_0'(u)=\frac2{\sqrt\pi}e^{u^2}>0.
\tag{2.34}
\]

This equal-rate case is GGC, with the explicit Thorin density

\[
\boxed{
\vartheta_0'(x)=
\frac{e^{1/(4x)}}
{2\pi^{3/2}x^{3/2}
\left[
1+\operatorname{erfi}\!\left(\frac1{2\sqrt x}\right)^2
\right]}.
}
\tag{2.35}
\]

### WIP-2.6 — the HCM-density shortcut genuinely fails

**Status: [PROVED].**

The unequal-rate benchmark is not always covered by the known
HCM-density power theorem.  In fact, take \(\theta=3\) and set
\(\ell(z)=\log I_0(z)\), \(r(z)=I_1(z)/I_0(z)\).  The modified Bessel
equation gives

\[
z\ell'(z)+z^2\ell''(z)=z^2(1-r(z)^2).
\tag{2.36}
\]

For \(y_0=4/c^2\), differentiate
\(f_Y(y_0v)f_Y(y_0/v)\) with respect to
\(w=v+v^{-1}\) at \(w=2\).  The logarithmic derivative is

\[
\left.
\frac d{dw}
\log\!\left[f_Y(y_0v)f_Y(y_0/v)\right]
\right|_{w=2}
=
\frac12
\left[
-\coth\theta
+2\left(1-\frac{I_1(2)^2}{I_0(2)^2}\right)
\right].
\tag{2.37}
\]

The power series show \(I_1(2)/I_0(2)<7/10\): indeed

\[
7I_0(2)-10I_1(2)
=
\sum_{j=0}^\infty
\frac{7-10/(j+1)}{(j!)^2}>0,
\tag{2.38}
\]

because the sum through \(j=3\) is \(1/24>0\) and every later term is
positive.  Also the exponential series gives \(e^6>201\), hence

\[
\coth3=1+\frac2{e^6-1}<\frac{101}{100},
\qquad
2\left(1-\frac{I_1(2)^2}{I_0(2)^2}\right)>\frac{51}{50}.
\]

Thus (2.37) is strictly positive at \(\theta=3\).  An HCM density would
make \(f_Y(y_0v)f_Y(y_0/v)\) completely monotone, hence nonincreasing, as a
function of \(w\).  Therefore

\[
\boxed{
\theta=3\quad\Longrightarrow\quad f_{X^2}\text{ is not HCM}.
}
\tag{2.39}
\]

This does not refute \(X^2\in GGC\); it proves that the phase/Thorin route
is not redundant with the standard HCM-density closure theorem.

### WIP-2.7 — Volterra kernel ledger

**Status: [PROVED REDUCTION], with the same cited canonical-representation
input as WIP-2.3.**

Taking inverse Laplace transforms in
\(-\psi_Y'=g_\theta\psi_Y\) gives

\[
yf_Y(y)=\int_0^y k_\theta(y-z)f_Y(z)\,dz,
\tag{2.40}
\]

where (2.18) yields the positive kernel

\[
\boxed{
k_\theta(y)=
y\int_0^\infty e^{-ty}\vartheta_\theta(t)\,dt>0.
}
\tag{2.41}
\]

Moreover,

\[
k_\theta\text{ is completely monotone}
\quad\Longleftrightarrow\quad
\vartheta_\theta\text{ is nondecreasing}.
\tag{2.42}
\]

Under these equivalent conditions,

\[
k_\theta(y)=
\int_0^\infty e^{-ty}\vartheta_\theta'(t)\,dt.
\tag{2.43}
\]

Useful checks are

\[
k_\theta(0+)=\frac12,\qquad
\int_0^\infty k_\theta(y)\,dy
=g_\theta(0)=\mathbb E[X^2]=3a^2-1,
\tag{2.44}
\]

and, as \(y\downarrow0\),

\[
k_\theta(y)
=
\frac12-\frac a\pi\sqrt y
+\left(
\frac{a^2}{4}+\frac{c^2}{8}-\frac{a^2}{2\pi}
\right)y
+O(y^{3/2}).
\tag{2.45}
\]

### WIP-2.8 — a rigorous large-contrast transition asymptotic

**Status: [PROVED].**

Let

\[
\varrho=e^\theta,\qquad
\varepsilon=\varrho^{-2/3},
\qquad
u=\lambda\varrho^{1/3},
\]

and fix a compact interval
\(K=[\lambda_0,\lambda_1]\Subset(0,\infty)\).  Write Dawson's integral as

\[
\operatorname{Daw}(x)
=e^{-x^2}\int_0^x e^{t^2}\,dt
=\frac{\sqrt\pi}{2}e^{-x^2}\operatorname{erfi}(x).
\]

Then, uniformly for \(\lambda\in K\),

\[
\boxed{
\mathcal R_\theta(\lambda\varrho^{1/3})
=1+
\frac{4\Gamma(3/4)}{\Gamma(1/4)}
\lambda\varepsilon
+O_K(\varepsilon^2)
}
\tag{2.46}
\]

in \(C^1(K)\), where the derivative in this statement is with respect to
\(\lambda\).  Consequently, when the prime denotes differentiation in
\(u\) at fixed \(\theta\),

\[
\boxed{
\mathcal R_\theta'(\lambda\varrho^{1/3})
=
\frac{4\Gamma(3/4)}{\Gamma(1/4)}\varrho^{-1}
+O_K(\varrho^{-5/3}).
}
\tag{2.47}
\]

In particular, (2.26) holds throughout every full transition window

\[
u\in[
\lambda_0\varrho^{1/3},
\lambda_1\varrho^{1/3}]
\]

once \(\theta\) is sufficiently large, with the threshold depending only
on \(K\).

To prove this, put \(t=\tan(\varphi/2)\) and then \(t=\varepsilon s\).
The exact identities are

\[
D_\varphi=
\frac{\varrho^{-1}+\varrho t^2}{1+t^2},
\qquad
uD_\varphi=
\lambda\frac{s^2+\varepsilon}{1+\varepsilon^2s^2}
=:x_\varepsilon(s,\lambda),
\qquad
\frac{d\varphi}{\pi}
=\frac{2\varepsilon}{\pi}
\frac{ds}{1+\varepsilon^2s^2}.
\]

Define

\[
\widehat Q_\varepsilon(\lambda)
:=
\int_0^\infty
\frac{e^{-x_\varepsilon(s,\lambda)^2}}
{1+\varepsilon^2s^2}\,ds,
\qquad
\widehat A_\varepsilon(\lambda)
:=
\int_0^\infty
\frac{\operatorname{Daw}(x_\varepsilon(s,\lambda))}
{1+\varepsilon^2s^2}\,ds.
\]

The common Jacobian factor cancels from the ratio, giving

\[
\mathcal R_\theta(\lambda\varrho^{1/3})
=
\frac2{\sqrt\pi}
\frac{\widehat A_\varepsilon(\lambda)}
{\widehat Q_\varepsilon(\lambda)}.
\tag{2.48}
\]

At \(\varepsilon=0\),
\(x_0(s,\lambda)=\lambda s^2\) and
\(\partial_\varepsilon x_\varepsilon|_{\varepsilon=0}=\lambda\).
Differentiation under the integral sign gives, in \(C^1(K)\),

\[
\widehat Q_\varepsilon(\lambda)
=
\frac{\Gamma(1/4)}{4\sqrt\lambda}
-\varepsilon
\frac{\Gamma(3/4)}2\sqrt\lambda
+O_K(\varepsilon^2),
\tag{2.49}
\]

and

\[
\widehat A_\varepsilon(\lambda)
=
\frac{\sqrt\pi\Gamma(1/4)}{8\sqrt\lambda}
+\varepsilon
\frac{\sqrt\pi\Gamma(3/4)}4\sqrt\lambda
+O_K(\varepsilon^2).
\tag{2.50}
\]

The four constants used here are

\[
\begin{aligned}
\int_0^\infty e^{-\lambda^2s^4}\,ds
&=\frac{\Gamma(1/4)}{4\sqrt\lambda},\\
-2\lambda^2\int_0^\infty
s^2e^{-\lambda^2s^4}\,ds
&=-\frac{\Gamma(3/4)}2\sqrt\lambda,\\
\int_0^\infty\operatorname{Daw}(\lambda s^2)\,ds
&=\frac{\sqrt\pi\Gamma(1/4)}{8\sqrt\lambda},\\
\lambda\int_0^\infty
\operatorname{Daw}'(\lambda s^2)\,ds
&=\frac{\sqrt\pi\Gamma(3/4)}4\sqrt\lambda.
\end{aligned}
\tag{2.51}
\]

The last two identities follow from

\[
\operatorname{Daw}(x)
=x\int_0^1e^{-x^2(1-v^2)}\,dv,
\]

Tonelli's theorem, and the beta integral; for the derivative integral one
may first integrate by parts, with vanishing boundary terms.

For clarity, the remainder in (2.49)--(2.50) is not a formal
differentiation of a nonuniform asymptotic.  On a fixed bounded
\(s\)-interval, the integrands and the required
\((\varepsilon,\lambda)\)-derivatives are smooth.  On the tail use

\[
\operatorname{Daw}^{(j)}(x)
=
\frac{d^j}{dx^j}\frac1{2x}
+O(x^{-3-j}),
\qquad j=0,1,2,3,
\]

uniformly for \(x\ge1\), as follows repeatedly from
\(\operatorname{Daw}'(x)=1-2x\operatorname{Daw}(x)\).  The leading term has
the exact cancellation

\[
\frac1{1+\varepsilon^2s^2}
\frac1{2x_\varepsilon(s,\lambda)}
=
\frac1{2\lambda(s^2+\varepsilon)}.
\]

Splitting the tail at \(s=\varepsilon^{-1}\) provides an integrable
dominating function for the second \(\varepsilon\)-derivatives and their
first \(\lambda\)-derivatives; Taylor's theorem under the integral then
proves the \(C^1(K)\) remainder.  Dividing (2.50) by (2.49) proves (2.46),
and \(d\lambda/du=\varrho^{-1/3}\) proves (2.47).

### WIP-2.9 — a symmetric pair kernel and a small-contrast theorem

**Status: [PROVED].**

Let \(D_1,D_2\) be independent copies of the arcsine variable
\(D=D_\varphi\) from (2.2a), and put \(Z_j=uD_j\).  Differentiating the
ratio in (2.24), using
\(\operatorname{Daw}'(x)=1-2x\operatorname{Daw}(x)\), and symmetrizing in
\(D_1,D_2\) gives the exact identity

\[
\boxed{
Q_\theta(u)^2\mathcal R_\theta'(u)
=
\frac1{u\sqrt\pi}
\mathbb E[\mathcal K(Z_1,Z_2)].
}
\tag{2.52}
\]

The kernel is symmetric.  For \(z_1\ge z_2>0\), it is most conveniently
specified by

\[
\boxed{
e^{z_1^2+z_2^2}\mathcal K(z_1,z_2)
=
J(z_1,z_2)
:=
z_1e^{z_1^2}+z_2e^{z_2^2}
-2(z_1^2-z_2^2)
\int_{z_2}^{z_1}e^{t^2}\,dt.
}
\tag{2.53}
\]

This representation yields two explicit endpoint windows.  First, if
\(z_1\le1/\sqrt2\), then

\[
\int_{z_2}^{z_1}e^{t^2}\,dt
\le(z_1-z_2)e^{z_1^2},
\qquad
(z_1-z_2)^2(z_1+z_2)\le z_1^3,
\]

and hence

\[
J(z_1,z_2)
\ge
z_1e^{z_1^2}(1-2z_1^2)+z_2e^{z_2^2}\ge0.
\]

For the opposite endpoint, the global Dawson bound

\[
\boxed{x\operatorname{Daw}(x)<\frac23\qquad(x>0)}
\tag{2.54}
\]

is sufficient.  Here is an exact proof of that bound.  If
\(z(x)=x\operatorname{Daw}(x)\), then

\[
z'(x)=x+(x^{-1}-2x)z(x).
\]

At a point where \(z=2/3\), its derivative would be
\((2-x^2)/(3x)\).  Moreover, the convergent Maclaurin series gives the
strict alternating-series bound

\[
z(\sqrt2)
<
\sum_{n=0}^{6}
(-1)^n\frac{2^{2n+1}}{(2n+1)!!}
=\frac{88246}{135135}<\frac23;
\]

the absolute terms decrease from \(n=1\) onward.  A downward crossing
before \(\sqrt2\), or an upward crossing after \(\sqrt2\), would have the
opposite derivative sign.  Since \(z(0+)=0\), no crossing is possible and
(2.54) follows.

Now \(J(z_2,z_2)=2z_2e^{z_2^2}>0\), while direct differentiation of (2.53)
gives

\[
\begin{aligned}
\partial_{z_1}J(z_1,z_2)
={}&
e^{z_1^2}
\left(
1+2z_2^2-4z_1\operatorname{Daw}(z_1)
\right)\\
&\quad+
4z_1e^{z_2^2}\operatorname{Daw}(z_2).
\end{aligned}
\]

Thus \(J(z_1,z_2)>0\) whenever
\(z_2\ge\sqrt{5/6}\).  Since
\(D\in[e^{-\theta},e^\theta]\), (2.52) proves the universal explicit
windows

\[
\boxed{
\begin{aligned}
u e^\theta\le\frac1{\sqrt2}
&\quad\Longrightarrow\quad
\mathcal R_\theta'(u)>0,\\
u e^{-\theta}\ge\sqrt{\frac56}
&\quad\Longrightarrow\quad
\mathcal R_\theta'(u)>0.
\end{aligned}
}
\tag{2.55}
\]

The same kernel proves an all-\(u\) theorem for a nontrivial range of
unequal rates.  For \(z_1\ge z_2>0\),

\[
\int_{z_2}^{z_1}e^{t^2}\,dt
\le
\frac{e^{z_1^2}-e^{z_2^2}}{2z_2}.
\]

Set \(A=(z_1^2-z_2^2)/z_2\).  Then (2.53) gives

\[
J(z_1,z_2)
\ge
(z_1-A)e^{z_1^2}+(z_2+A)e^{z_2^2}.
\]

If \(z_1/z_2\le\phi_{\rm g}:=(1+\sqrt5)/2\), then

\[
A-z_1
=
z_2\left[
\left(\frac{z_1}{z_2}\right)^2
-\frac{z_1}{z_2}-1
\right]\le0,
\]

so both terms in the lower bound are nonnegative and the second is
strictly positive.  Every pair in (2.52) satisfies
\(Z_1/Z_2\le e^{2\theta}\) after ordering.  Therefore

\[
\boxed{
0\le\theta\le
\frac12\log\frac{1+\sqrt5}{2}
\quad\Longrightarrow\quad
\mathcal R_\theta'(u)>0\ \text{for every }u>0
\quad\Longrightarrow\quad
X^2\in GGC.
}
\tag{2.56}
\]

The first implication is the pair-kernel argument; the second is the exact
phase criterion (2.26).  This is a genuine positive unequal-rate subcase
of Bondesson's conjecture.  WIP-2.11 below later enlarges this benchmark
range from \(e^{2\theta}\le\phi_{\rm g}\) to \(e^{2\theta}\le3\), and
WIP-2.12 pushes it to \(e^{2\theta}\le7/2\).  The later independent
certificates WIP-2.14 and WIP-5.10 improve this to \(4\) and to the exact
cubic boundary (5.68), respectively.

The pair kernel is not pointwise nonnegative on the entire quadrant.  In
fact,

\[
J(1,0)
=e-2\int_0^1e^{t^2}\,dt<0,
\tag{2.57}
\]

because the exponential series gives
\(\int_0^1e^{t^2}dt>1+1/3+1/10=43/30\) and \(e<11/4\).
Continuity supplies examples with a strictly positive second coordinate.
Thus an extension of (2.56) to arbitrary contrast must exploit the
arcsine averaging in (2.52), rather than global pointwise positivity of
\(\mathcal K\).

### WIP-2.10 — tilted Stein kernel and a one-turning-point residual

**Status: [PROVED REDUCTION].**

Put

\[
l=e^{-\theta},\qquad r=e^\theta,\qquad
\tau(x)=(x-l)(r-x)=c^2-(x-a)^2,
\qquad
p(x)=\frac1{\pi\sqrt{\tau(x)}}.
\]

Let \(q_u(x)=e^{-u^2x^2}\), so the law \(\nu_u\) in (2.27) has density
\(p_u=q_up/Q_\theta(u)\).  Denote its first two moments by

\[
\mu_u=\mathbb E_{\nu_u}[D],
\qquad
v_u=\mathbb E_{\nu_u}[D^2].
\]

The canonical tilted Stein kernel, and the corresponding inverse-Stein
kernel for \(D^2\), are respectively

\[
\begin{aligned}
\tau_u(x)
&=
e^{u^2x^2}\sqrt{\tau(x)}
\int_x^r
\frac{(y-\mu_u)e^{-u^2y^2}}{\sqrt{\tau(y)}}\,dy,\\
T_u(x)
&=
e^{u^2x^2}\sqrt{\tau(x)}
\int_x^r
\frac{(y^2-v_u)e^{-u^2y^2}}{\sqrt{\tau(y)}}\,dy.
\end{aligned}
\tag{2.58}
\]

Integration by parts gives, for every admissible \(h\),

\[
\boxed{
\begin{aligned}
\operatorname{Cov}_{\nu_u}(D,h(D))
&=\mathbb E_{\nu_u}[\tau_u(D)h'(D)],\\
\operatorname{Cov}_{\nu_u}(D^2,h(D))
&=\mathbb E_{\nu_u}[T_u(D)h'(D)].
\end{aligned}
}
\tag{2.59}
\]

The untilted Pearson identity also gives the useful tilted formula

\[
\mathbb E_{\nu_u}[\tau(D)h'(D)]
=
\mathbb E_{\nu_u}[
(D-a+2u^2D\tau(D))h(D)],
\qquad
a-\mu_u=2u^2\mathbb E_{\nu_u}[D\tau(D)].
\tag{2.60}
\]

Define the unnormalized centered upper-tail integral

\[
H_u(x)
:=
\int_x^r
(y^2-v_u)q_u(y)p(y)\,dy.
\tag{2.61}
\]

Then \(H_u(x)>0\) for \(l<x<r\), and (2.29), after using (2.59) with
\(h(x)=\operatorname{erfi}(ux)\), is exactly

\[
\boxed{
\int_l^r e^{u^2x^2}H_u(x)\,dx
\le\frac{a}{2u^2}.
}
\tag{2.62}
\]

This target has a sharp one-turning-point residual.  Put

\[
G_u(x)=\frac{xq_u(x)p(x)}{2u^2}-H_u(x).
\tag{2.63}
\]

Since \(\int_l^r xp(x)\,dx=a\), the desired difference in (2.62) is

\[
\frac{a}{2u^2}
-\int_l^r e^{u^2x^2}H_u(x)\,dx
=
\int_l^r e^{u^2x^2}G_u(x)\,dx.
\]

Direct differentiation gives

\[
\boxed{
G_u'(x)
=q_u(x)p(x)
\left[
\frac{ax-1}{2u^2\tau(x)}-v_u
\right].
}
\tag{2.64}
\]

The rational function controlling this derivative satisfies

\[
\left(\frac{ax-1}{\tau(x)}\right)'
=
\frac{a(x^2+1)-2x}{\tau(x)^2}>0,
\qquad
\frac{ax-1}{\tau(x)}
=-\frac{l}{2(x-l)}+\frac{r}{2(r-x)}.
\tag{2.65}
\]

Also \(G_u(x)\to+\infty\) at both endpoints.  Hence \(G_u\) decreases once
and then increases once: it is either positive everywhere, or it has
exactly two zeros with sign pattern \(+,-,+\).  This reduces the missing
covariance bound to a weighted signed-area inequality for a function with
one minimum.

There is an equivalent localizing-moment formulation.  Let

\[
\eta_u(dx)=T_u(x)p(x)\,dx,\qquad
\mathsf M_j=\int_l^r x^j\,\eta_u(dx),\qquad
m_j=\int_l^r x^j p(x)\,dx.
\]

All integer moments, including negative ones, are finite because \(l>0\).
Since

\[
(T_up_u)'=(v_u-x^2)p_u,
\]

integration by parts after multiplication by \(h\,p/p_u\) gives

\[
\mathbb E_p[
(h'(D)+2u^2Dh(D))T_u(D)]
=
\mathbb E_p[h(D)(D^2-v_u)].
\tag{2.66}
\]

Taking \(h(x)=x^n\) yields, for every integer \(n\),

\[
n\mathsf M_{n-1}+2u^2\mathsf M_{n+1}
=m_{n+2}-v_um_n.
\tag{2.67}
\]

The reciprocal arcsine identity

\[
\mathbb E_p[f(D^{-1})]
=\mathbb E_p[D^{-1}f(D)]
\]

implies \(m_{-j}=m_{j-1}\), in particular \(m_{-1}=1\).  Equations
(2.67) at \(n=0\) and \(n=-1\) give

\[
2u^2\mathsf M_1=m_2-v_u,
\qquad
2u^2\mathsf M_0=a-v_u+\mathsf M_{-2}.
\]

Since the left side of (2.62) is \(\mathsf M_0\), the entire remaining
Route-2 inequality is equivalently

\[
\boxed{\mathsf M_{-2}\le v_u.}
\tag{2.68}
\]

> **[OPEN STEP R2-C]** Prove (2.68), or equivalently the weighted
> signed-area inequality following (2.64), for all \(\theta,u>0\).  Any
> extension of the pair-kernel theorem (2.56) should be compared against
> this one-turning-point formulation.

### WIP-2.11 — a tilted-mean criterion and the range \(e^{2\theta}\le3\)

**Status: [PROVED PARTIAL GGC THEOREM].**

The inverse-Stein target (2.68) can be proved throughout a substantially
larger contrast range.  Put \(t=u^2\), \(q(x)=e^{-tx^2}\), and

\[
B_t(y)=\int_l^y e^{tx^2}\,dx.
\]

Recall that \(Q=\int_l^r q(x)p(x)\,dx\),
\(\nu_u(dx)=q(x)p(x)\,dx/Q\), and
\(\mu_u=\mathbb E_{\nu_u}[D]\).  Fubini's theorem and the definition
(2.61) give

\[
\begin{aligned}
\mathsf M_0
&=\int_l^r e^{tx^2}H_u(x)\,dx\\
&=\int_l^r(y^2-v_u)q(y)p(y)B_t(y)\,dy\\
&=Q\operatorname{Cov}_{\nu_u}\!\left(D^2,B_t(D)\right).
\end{aligned}
\tag{2.69}
\]

Symmetrizing the covariance with two independent variables having the
untilted density \(p\) yields

\[
\mathsf M_0
=\frac1Q\int_{l<x<y<r}
q(x)q(y)(y^2-x^2)
\bigl(B_t(y)-B_t(x)\bigr)
p(x)p(y)\,dx\,dy.
\tag{2.70}
\]

For \(x<z<y\), convexity of the square gives the chord bound

\[
z^2\le(x+y)z-xy.
\]

It follows that

\[
\begin{aligned}
B_t(y)-B_t(x)
&\le e^{-txy}\int_x^y e^{t(x+y)z}\,dz\\
&=\frac{e^{ty^2}-e^{tx^2}}{t(x+y)}.
\end{aligned}
\tag{2.71}
\]

The inequality is strict for \(t>0\) and \(x<y\).  Substitution into
(2.70) gives

\[
2t\mathsf M_0
\le\frac2Q\int_{l<x<y<r}
(y-x)\bigl(q(x)-q(y)\bigr)p(x)p(y)\,dx\,dy.
\tag{2.72}
\]

The last integral can be evaluated without estimating it.  If \(X,Y\) are
iid with density \(p\), then

\[
\mathbb E[(Y-X)(q(X)-q(Y))]
=2aQ-2\mathbb E[Dq(D)]
=2Q(a-\mu_u).
\]

Its integrand is symmetric, so the ordered half-plane in (2.72) contributes
one half of the full expectation.  Therefore

\[
\boxed{2t\mathsf M_0\le2(a-\mu_u).}
\tag{2.73}
\]

In particular,

\[
\boxed{
\mu_u\ge\frac a2
\quad\Longrightarrow\quad
2u^2\mathsf M_0\le a
\quad\Longrightarrow\quad
\mathsf M_{-2}\le v_u.
}
\tag{2.74}
\]

The last implication uses the exact recurrence
\(2u^2\mathsf M_0=a-v_u+\mathsf M_{-2}\).  The tilted arcsine law has a
strictly positive density on \((l,r)\), and hence \(\mu_u>l\) for every
finite \(u\) when \(\theta>0\).  Since

\[
l\ge\frac a2
\quad\Longleftrightarrow\quad
4l\ge l+r
\quad\Longleftrightarrow\quad
\frac rl\le3
\quad\Longleftrightarrow\quad
e^{2\theta}\le3,
\]

(2.74), (2.68), and the phase criterion prove

\[
\boxed{
0\le\theta\le\frac12\log3
\quad\Longrightarrow\quad
\mathcal R_\theta'(u)>0\quad(u>0)
\quad\Longrightarrow\quad
X_\theta^2\in GGC.
}
\tag{2.75}
\]

For \(\theta>0\), strictness follows already from the strict inequality in
(2.71); the degenerate \(\theta=0\) case follows from
\(\mathcal R_0(u)=\operatorname{erfi}(u)\).  This improves the previously
proved rate-ratio threshold \(e^{2\theta}\le\phi_{\rm g}\) in (2.56) to
\(e^{2\theta}\le3\).

The same tilted-mean criterion gives two explicit small-\(u\) windows for
every fixed contrast.  From (2.60),

\[
a-\mu_u=2t\mathbb E_{\nu_u}[D\tau(D)].
\]

The function \(x\tau(x)=x(x-l)(r-x)\) has its unique maximum in \((l,r)\)
at

\[
x_*=\frac{2a+\sqrt{4a^2-3}}3,
\qquad
\max_{[l,r]}x\tau(x)
=\frac{x_*(x_*^2-1)}2.
\]

Indeed its derivative is \(-3x^2+4ax-1\), positive at \(l\) and negative
at \(r\); at the interior root the critical-point equation gives
\(\tau(x_*)=(x_*^2-1)/2\).  Hence

\[
\boxed{
0<\theta<\infty,\qquad
u^2\le\frac{a}{2x_*(x_*^2-1)}
\quad\Longrightarrow\quad
\mu_u\ge\frac a2
\quad\Longrightarrow\quad
\mathsf M_{-2}\le v_u.
}
\tag{2.76}
\]

At \(\theta=0\), one has \(x_*=1\) and the displayed denominator vanishes;
that degenerate benchmark was already proved for every \(u\), rather than
being covered by (2.76).

A less sharp but simpler bound follows directly from
\(q(r)\le q(D)\le q(l)\):

\[
\mu_u
=\frac{\mathbb E[Dq(D)]}{Q}
\ge\frac{a q(r)}{q(l)}
=a e^{-u^2(r^2-l^2)}.
\]

Thus

\[
\boxed{
u^2(r^2-l^2)\le\log2
\quad\Longrightarrow\quad
\mathsf M_{-2}\le v_u.
}
\tag{2.77}
\]

The support-only consequence leaves \(e^{2\theta}>3\) open.  Formula (2.73)
nevertheless identifies a sharper intermediate target than (2.68): it is
enough to prove \(\mu_u\ge a/2\) in any additional parameter region.  The
next entry combines that observation with the high-frequency window and
crosses the threshold \(3\).

### WIP-2.12 — a rational low/high-frequency splice up to
\(e^{2\theta}\le7/2\)

**Status: [PROVED PARTIAL GGC THEOREM].**

The tilted-mean argument can be pushed beyond the pointwise mean cone by a
finite rational certificate.  Normalize the arcsine rate by its lower
endpoint:

\[
\kappa=\frac rl=e^{2\theta},\qquad
d=\kappa-1,\qquad
R=\frac Dl=1+dV,\qquad
V\sim\operatorname{Beta}\!\left(\frac12,\frac12\right).
\tag{2.78}
\]

Put \(s=ul\), \(t=s^2\), and

\[
Q_t=\mathbb E[e^{-tR^2}],
\qquad
\bar R_t=\frac{\mathbb E[Re^{-tR^2}]}{Q_t}.
\]

We first prove the low-frequency lemma

\[
\boxed{
3\le\kappa\le\frac72,\quad 0\le t\le\frac56
\quad\Longrightarrow\quad
\bar R_t>\frac{\kappa+1}{4}.
}
\tag{2.79}
\]

For \(2\le d\le5/2\), define

\[
g_d(v)
=1+dv-\frac{d+2}{4}
=\frac12+d\left(v-\frac14\right),
\qquad
A_{d,t}(v)=t\bigl((1+dv)^2-1\bigr).
\]

Since \(Q_t>0\), (2.79) is equivalent to positivity of

\[
\begin{aligned}
F_{d,t}
&=\mathbb E[g_d(V)e^{-t(1+dV)^2}]\\
&=e^{-t}\mathbb E[g_d(V)e^{-A_{d,t}(V)}].
\end{aligned}
\tag{2.80}
\]

The following comparison takes the worst values of \(d\) and \(t\)
pointwise; it does not assume that the full integral is monotone in either
parameter.  Set \(d_*=5/2\), \(T=5/6\), and \(h=1/20\).  On
\(0\le v\le1/4\), one has

\[
g_d(v)\ge g_{d_*}(v)=-\frac18+\frac52v,
\]

and the function on the right changes sign at \(h\).  If \(0\le v\le h\)
and \(g_d(v)<0\), then \(e^{-A_{d,t}(v)}\le1\); if \(g_d(v)\ge0\), the
desired lower bound is automatic.  Hence

\[
g_d(v)e^{-A_{d,t}(v)}\ge g_{d_*}(v),
\qquad 0\le v\le\frac1{20}.
\tag{2.81}
\]

On \(h\le v\le1/4\), both comparison functions are nonnegative and
\(A_{d,t}(v)\le A_{d_*,T}(v)\), so

\[
g_d(v)e^{-A_{d,t}(v)}
\ge g_{d_*}(v)e^{-A_{d_*,T}(v)}.
\tag{2.82}
\]

For \(v\ge1/4\), \(g_d(v)\ge1/2\), so that entire contribution is
nonnegative and may be discarded.

The beta density is \([\pi\sqrt{v(1-v)}]^{-1}\).  The absolute value of the
negative comparison piece in (2.81) is bounded by

\[
\begin{aligned}
N_-
&=\frac1\pi\int_0^{1/20}
\frac{\frac18-\frac52v}{\sqrt{v(1-v)}}\,dv\\
&\le\frac1\pi\sqrt{\frac{20}{19}}
\int_0^{1/20}\left(\frac18-\frac52v\right)v^{-1/2}\,dv\\
&=\frac1\pi\sqrt{\frac{20}{19}}
\left[\frac14\sqrt v-\frac53v^{3/2}\right]_0^{1/20}\\
&=\frac1{6\pi\sqrt{19}}.
\end{aligned}
\tag{2.83}
\]

It remains to give a strictly larger positive lower bound.  Restrict
(2.82) to \(1/16\le v\le1/4\) and put \(v=w^2\).  At the worst parameters,

\[
A_{d_*,T}(v)
=\frac{25}{6}v+\frac{125}{24}v^2,
\qquad
A(w)=\frac{25}{6}w^2+\frac{125}{24}w^4.
\tag{2.84}
\]

Let

\[
P_3(x)=1-x+\frac{x^2}{2}-\frac{x^3}{6}.
\]

Taylor's theorem gives \(e^{-x}\ge P_3(x)\) for \(x\ge0\), and

\[
P_3'(x)=-\frac{(x-1)^2+1}{2}<0.
\]

The function \(A\) is increasing on \([1/4,1/2]\), and

\[
A(1/2)=\frac{175}{128},\qquad
P_3(175/128)=\frac{1780337}{12582912}>0.
\]

Using also \((1-v)^{-1/2}\ge1\), the positive comparison contribution
satisfies

\[
N_+
\ge\frac2\pi\int_{1/4}^{1/2}
\left(-\frac18+\frac52w^2\right)P_3(A(w))\,dw.
\tag{2.85}
\]

Use the partition

\[
\left(w_0,\ldots,w_5\right)
=\left(\frac14,\frac13,\frac38,\frac5{12},\frac{11}{24},\frac12\right).
\]

Because \(P_3\circ A\) is decreasing, valid lower bounds on the five
successive intervals are

\[
(c_1,\ldots,c_5)
=\left(\frac7{12},\frac{49}{100},\frac{39}{100},
\frac7{25},\frac7{50}\right).
\tag{2.86}
\]

This is an exact rational certificate.  At the five right endpoints, the
values of \(A\) are

\[
\frac{1025}{1944},\quad
\frac{22575}{32768},\quad
\frac{438125}{497664},\quad
\frac{8799725}{7962624},\quad
\frac{175}{128},
\]

and the corresponding differences \(P_3(A(w_j))-c_j\) are

\[
\begin{gathered}
\frac{175268935}{44079842304},\qquad
\frac{6830551097091}{1759218604441600},\\
\frac{63548401383143251}{18488425889503641600},\qquad
\frac{43566029160509197267}{75728592443406915993600},\qquad
\frac{468233}{314572800},
\end{gathered}
\]

all strictly positive.

Let

\[
G(w)=-\frac w4+\frac53w^3,
\qquad
G'(w)=2\left(-\frac18+\frac52w^2\right).
\]

For \(\Delta_j=G(w_j)-G(w_{j-1})\), the five exact products needed in
(2.85) are

\[
\begin{array}{c|c|c}
j&\Delta_j&c_j\Delta_j\\ \hline
1&77/5184&539/62208\\
2&653/41472&31997/4147200\\
3&923/41472&11999/1382400\\
4&1223/41472&8561/1036800\\
5&1553/41472&10871/2073600
\end{array}
\]

and therefore

\[
N_+>
\frac1\pi\sum_{j=1}^5c_j\Delta_j
=\frac1\pi\frac{23987}{622080}.
\tag{2.87}
\]

Finally,

\[
684\left(\frac{23987}{622080}\right)^2-1
=\frac{182604811}{10749542400}>0.
\]

Since \(684=36\cdot19\), this is exactly

\[
\frac{23987}{622080}>\frac1{6\sqrt{19}}.
\tag{2.88}
\]

The script
[route2_halfshape_splice.py](computations/route2_halfshape_splice.py)
checks (2.86)--(2.88) using only Python's exact
fractions.Fraction arithmetic.  It verifies the displayed endpoint values,
all five positive gaps, the five increments, their sum, and the final
squared comparison.  The analytic reductions (2.81)--(2.85), not the
script, are the proof of the inequalities being certified.

Equations (2.81)--(2.88) show that the expectation in the second line of
(2.80) is strictly positive.  The factor \(e^{-t}\) is positive, proving
the low-frequency lemma (2.79) without any numerical estimate.

We now splice this lemma to the already proved high-frequency window.  The
untilted mean of \(R\) is \(m_1=(\kappa+1)/2\), so (2.79) says exactly
\(\bar R_t>m_1/2\).  More explicitly, (5.34a) gives
\[
2tM_0\le2(m_1-\bar R_t)<m_1,
\]
so (5.30) makes the fully averaged kernel strictly positive whenever
\(s^2\le5/6\).  If \(s^2\ge5/6\), then for every pair
\(R_1,R_2\in[1,\kappa]\),

\[
\min(sR_1,sR_2)\ge s\ge\sqrt{\frac56},
\]

and the pointwise high-frequency kernel bound in WIP-2.9 is strictly
positive.  The two ranges meet exactly.  Together with the already settled
\(\kappa\le3\) case, this proves

\[
\boxed{
0\le\theta\le\frac12\log\frac72
\quad\Longrightarrow\quad
\mathcal R_\theta'(u)>0\quad(u>0)
\quad\Longrightarrow\quad
X_\theta^2\in GGC.
}
\tag{2.89}
\]

The certificate is deliberately nonoptimal: its role is to show that a
rigorous low/high-frequency splice can cross the natural pointwise
mean-cone boundary \(\kappa=3\).  This particular certificate stops at
\(7/2\); WIP-2.14 later moves the same Route-2 method to \(4\), and
WIP-5.10 gives a stronger Route-5 cone.

The splice is not merely cosmetic.  For every fixed \(\kappa>1\), the
tilted law proportional to \(e^{-tR^2}\operatorname{Law}(R)\) converges
weakly to \(\delta_1\) as \(t\to\infty\).  Indeed, for any
\(\varepsilon>0\), compare the exponentially weighted mass of
\([1+\varepsilon,\kappa]\) with the positive arcsine mass of
\([1,1+\varepsilon/2]\).  Their ratio tends to zero exponentially.  Hence
\(\bar R_t\to1\).  If \(\kappa>3\), then
\((\kappa+1)/4>1\), so the sufficient tilted-mean condition in (2.79) must
eventually fail even if the desired kernel remains positive.  The separate
high-frequency estimate is therefore essential; this observation is a
no-go only for using the mean criterion at every \(t\), not for the GGC
claim.

### WIP-2.13 — an improved pointwise high-frequency window

**Status: [PROVED].**

The pointwise endpoint threshold in WIP-2.9 can be reduced from
\(\sqrt{5/6}\) to \(4/5\).  For \(a\ge b>0\), recall

\[
J(a,b)
=ae^{a^2}+be^{b^2}
-2(a^2-b^2)\int_b^a e^{x^2}\,dx,
\qquad
\mathcal K(a,b)=e^{-a^2-b^2}J(a,b).
\]

Direct differentiation gives

\[
\frac{\partial J}{\partial a}
=(1+2b^2)e^{a^2}-4a\int_b^a e^{x^2}\,dx
=4a\,\Delta_b(a),
\tag{2.90}
\]

where

\[
c_b=\frac{1+2b^2}{4},
\qquad
\Delta_b(a)=\frac{c_b e^{a^2}}a-\int_b^a e^{x^2}\,dx.
\]

Put \(b_0=4/5\) and \(c_0=57/100\).  For \(a\ge b\ge b_0\),

\[
\Delta_b(a)-\Delta_{b_0}(a)
=\frac{(b^2-b_0^2)e^{a^2}}{2a}
+\int_{b_0}^b e^{x^2}\,dx
\ge0.
\tag{2.91}
\]

It is therefore enough to prove \(\Delta_{b_0}>0\).  Its derivative has the
especially simple sign pattern

\[
\Delta_{b_0}'(a)
=e^{a^2}\left(\frac7{50}-\frac{57}{100a^2}\right).
\tag{2.92}
\]

Thus \(\Delta_{b_0}\) decreases and then increases, with its unique global
minimum on \([b_0,\infty)\) at

\[
a_0=\sqrt{\frac{57}{14}}.
\]

The positivity of this minimum has a short exact series certificate.  Set

\[
A=\frac{57}{14},\qquad B=\frac{16}{25},\qquad
\mathscr S(x)=\sum_{n=0}^{\infty}\frac{x^n}{n!(2n+1)}.
\]

Termwise integration of the positive entire series gives

\[
\int_0^z e^{x^2}\,dx=z\mathscr S(z^2),
\]

and hence

\[
a_0\Delta_{b_0}(a_0)
=\frac{57}{100}e^A-A\mathscr S(A)
+a_0\frac45\mathscr S(B).
\tag{2.93}
\]

The following four rational estimates suffice:

\[
e^A>\frac{293}{5},\qquad
\mathscr S(A)<\frac{433}{50},\qquad
\mathscr S(B)>\frac{63}{50},\qquad
a_0>\frac{2017}{1000}.
\tag{2.94}
\]

Here the exponential lower bound is its Taylor sum through degree \(12\),
and the \(\mathscr S(B)\) lower bound is its sum through degree \(3\).  For
the only upper bound, if

\[
u_n=\frac{A^n}{n!(2n+1)},
\]

then \(u_{n+1}/u_n<A/(n+1)\); after \(u_9\), all successive ratios are
less than \(A/10=57/140\).  Consequently,

\[
\mathscr S(A)
<
\sum_{n=0}^8u_n+\frac{u_9}{1-57/140}
<\frac{433}{50}.
\]

Finally,

\[
A-\left(\frac{2017}{1000}\right)^2
=\frac{21977}{7000000}>0,
\]

which proves the last estimate in (2.94).  Substitution into (2.93) yields
the fully rational lower bound

\[
\begin{aligned}
a_0\Delta_{b_0}(a_0)
&>
\frac{57}{100}\frac{293}{5}
-\frac{57}{14}\frac{433}{50}
+\frac{2017}{1000}\frac45\frac{63}{50}\\
&=\frac{77247}{437500}>0.
\end{aligned}
\tag{2.95}
\]

The exact-arithmetic script
[route2_pair_kernel_high_window.py](computations/route2_pair_kernel_high_window.py)
checks all four series bounds, the geometric tail estimate, and (2.95)
using only fractions.Fraction arithmetic.

Equations (2.91)--(2.95) show
\(\partial_aJ(a,b)>0\) for every \(a\ge b\ge4/5\).  Since
\(J(b,b)=2be^{b^2}>0\), symmetry proves

\[
\boxed{
\min(z_1,z_2)\ge\frac45
\quad\Longrightarrow\quad
\mathcal K(z_1,z_2)>0.
}
\tag{2.96}
\]

In the normalized rate model \(R\in[1,\kappa]\), this replaces the old
pointwise high-frequency condition \(s^2\ge5/6\) by
\(s^2\ge16/25\).  WIP-2.14 supplies the matching low-frequency
certificate.

### WIP-2.14 — an exact low/high-frequency splice up to \(\kappa=4\)

**Status: [PROVED PARTIAL GGC THEOREM].**

The improved pointwise window in WIP-2.13 can be spliced with a new exact
low-frequency certificate.  Recall

\[
\kappa=1+d,\qquad
R=1+dV,\qquad
V\sim\operatorname{Beta}\!\left(\frac12,\frac12\right),
\]

and put

\[
T=\frac{16}{25},\qquad
g_d(v)=\frac12+d\left(v-\frac14\right),\qquad
A_{d,t}(v)=t\bigl((1+dv)^2-1\bigr).
\tag{2.97}
\]

Since

\[
\mathbb E\!\left[
\left(R-\frac{d+2}{4}\right)e^{-tR^2}
\right]
=
e^{-t}\mathbb E\!\left[
g_d(V)e^{-A_{d,t}(V)}
\right],
\]

the desired tilted-mean inequality is equivalent to positivity of

\[
\Phi_{d,t}
:=
\mathbb E\!\left[g_d(V)e^{-A_{d,t}(V)}\right].
\tag{2.98}
\]

We prove

\[
\boxed{
2\le d\le3,\qquad 0\le t\le\frac{16}{25}
\quad\Longrightarrow\quad
\Phi_{d,t}>0.
}
\tag{2.99}
\]

Set

\[
h=\frac1{12},\qquad
g_3(v)=3v-\frac14,\qquad
A(v)=A_{3,T}(v)
=\frac{96}{25}v+\frac{144}{25}v^2.
\tag{2.100}
\]

For \(0\le v<h\), one has \(g_3(v)<0\).  Since
\(g_d(v)\ge g_3(v)\), either \(g_d(v)\ge0\), in which case the desired
lower bound is immediate, or \(g_d(v)<0\), in which case

\[
g_d(v)e^{-A_{d,t}(v)}
\ge g_d(v)\ge g_3(v).
\]

For \(h\le v\le1/4\), both comparison functions are nonnegative, while

\[
g_d(v)\ge g_3(v),\qquad
A_{d,t}(v)\le A(v).
\]

Therefore

\[
g_d(v)e^{-A_{d,t}(v)}
\ge g_3(v)e^{-A(v)}.
\]

It remains to justify the reduction to \(d=3,t=T\) on \(v\ge1/4\).
For fixed \(v\ge1/4\), put

\[
f_d(v)=g_d(v)e^{-A_{d,T}(v)}.
\]

Then

\[
\begin{aligned}
\partial_d\log f_d(v)
&=
\frac{v-\frac14}{g_d(v)}
-2Tv(1+dv)\\
&\le
2\left(v-\frac14\right)
-\frac{32}{25}v(1+2v)\\
&=
-\frac{128v^2-36v+25}{50}<0.
\end{aligned}
\tag{2.101}
\]

The last quadratic is positive because its discriminant is
\(36^2-4\cdot128\cdot25=-11504<0\).  Also, for a positive
integrand, replacing \(t\le T\) by \(T\) only decreases it.  Consequently,

\[
\Phi_{d,t}\ge L,
\tag{2.102}
\]

where

\[
L=
\mathbb E\!\left[
g_3(V)\mathbf1_{\{V<1/12\}}
+g_3(V)e^{-A(V)}\mathbf1_{\{V\ge1/12\}}
\right].
\]

It remains to prove \(L>0\) without numerical quadrature.  Put \(v=w^2\)
and, to keep the changed variable explicit, write

\[
\widetilde A(w):=A(w^2)
=\frac{96}{25}w^2+\frac{144}{25}w^4.
\]

After multiplication by \(\pi\), the absolute value of the negative
contribution is

\[
\begin{aligned}
N
&=
2\int_0^{1/\sqrt{12}}
\frac{\frac14-3w^2}{\sqrt{1-w^2}}\,dw\\
&=
\frac{\sqrt{11}}4
-\frac52\arcsin\frac1{\sqrt{12}}.
\end{aligned}
\tag{2.103}
\]

The positive arcsine expansion gives

\[
\arcsin x
\ge
x\sum_{n=0}^{4}
\frac{\binom{2n}{n}x^{2n}}{4^n(2n+1)}.
\]

At \(x=1/\sqrt{12}\), write

\[
S_4=
\sum_{n=0}^{4}
\frac{\binom{2n}{n}}{4^n(2n+1)12^n}
=\frac{848145961}{836075520}.
\]

The rational square comparisons

\[
\left(\frac{3316625}{10^6}\right)^2-11
=\frac{89}{64000000}>0,
\qquad
1-3\left(\frac{577350}{10^6}\right)^2
=\frac{373}{400000000}>0
\]

show respectively that

\[
\sqrt{11}<\frac{3316625}{10^6},
\qquad
\frac1{\sqrt3}>\frac{577350}{10^6}.
\]

It follows that

\[
\begin{aligned}
N
&<
\frac14\frac{3316625}{10^6}
-\frac54S_4\frac{577350}{10^6}\\
&=
\frac{144250497157}{1486356480000}
<
\frac{9705}{100000},
\end{aligned}
\tag{2.104}
\]

where the final rational gap is

\[
\frac{9705}{100000}
-
\frac{144250497157}{1486356480000}
=
\frac{399227}{1486356480000}>0.
\]

For the positive part define

\[
B_3(w)
=
1+\frac{w^2}{2}+\frac{3w^4}{8}+\frac{5w^6}{16}.
\]

The positive binomial expansion yields

\[
B_3(w)\le(1-w^2)^{-1/2},
\qquad 0\le w<1.
\]

Let

\[
w_j=\frac7{24}+\frac{79j}{1920},
\qquad 0\le j\le16,
\]

so that \(w_{16}=19/20\), and put \(x_j=\widetilde A(w_j)\).  Define
\(c_j=k_j/10^5\), where

\[
\begin{aligned}
(k_1,\ldots,k_{16})={}&(
60888,52211,43472,35011,27159,20199,14331,9647,\\
&6125,3645,2019,1034,486,207,80,27).
\end{aligned}
\]

Exact integer arithmetic verifies

\[
c_j
\le
\left(1-\frac{x_j}{1000}\right)^{1000}
\le e^{-x_j}.
\tag{2.105}
\]

The second inequality follows from \(\log(1-y)\le-y\).
Convexity of \(x\mapsto e^{-x}\) gives, for
\(w_{j-1}\le w\le w_j\),

\[
e^{-\widetilde A(w)}
\ge
e^{-x_j}\bigl(1+x_j-\widetilde A(w)\bigr)
\ge
c_j\bigl(1+x_j-\widetilde A(w)\bigr).
\]

Moreover,

\[
\left(\frac7{24}\right)^2-\frac1{12}
=\frac1{576}>0,
\]

so every retained integrand is nonnegative.  Hence the positive
contribution \(P\), after multiplication by \(\pi\), satisfies

\[
\begin{aligned}
P\ge S:={}&
\sum_{j=1}^{16}c_j
\int_{w_{j-1}}^{w_j}
\left(6w^2-\frac12\right)B_3(w)\\
&\hspace{38mm}\times
\bigl(1+x_j-\widetilde A(w)\bigr)\,dw.
\end{aligned}
\tag{2.106}
\]

Every integrand in (2.106) is a rational polynomial.  Exact integration
gives

\[
S=
\frac{
624822254460332573895266180085210493227000861647
}{
6380111302066666283514483179520000000000000000000
}
>
\frac{979}{10000}.
\tag{2.107}
\]

Combining (2.104) and (2.107),

\[
\boxed{
\pi L
>
\frac{979}{10000}
-\frac{9705}{100000}
=
\frac{17}{20000}>0.
}
\tag{2.108}
\]

The exact-arithmetic script
[route2_halfshape_splice_kappa4.py](computations/route2_halfshape_splice_kappa4.py)
checks every finite rational comparison in (2.103)--(2.108).  The
pointwise reductions above, rather than the script, prove the analytic
inequalities being certified.

Now \(m_1=(\kappa+1)/2=(d+2)/2\), so (2.99) says

\[
\bar R_t>\frac{m_1}{2}
\qquad
\left(3\le\kappa\le4,\quad
t\le\frac{16}{25}\right).
\]

The same tilted-mean argument as in WIP-2.12 therefore makes the averaged
pair kernel strictly positive in this low-frequency range.  If instead
\(t=s^2\ge16/25\), then

\[
\min(sR_1,sR_2)\ge s\ge\frac45,
\]

and WIP-2.13 makes the pair kernel pointwise strictly positive.  Together
with the already proved range \(\kappa\le3\), the two windows prove

\[
\boxed{
0\le\theta\le\log2
\quad\Longrightarrow\quad
\mathcal R_\theta'(u)>0\quad(u>0)
\quad\Longrightarrow\quad
X_\theta^2\in GGC.
}
\tag{2.109}
\]

Equivalently, the independently proved Route-2 benchmark range is enlarged
from \(e^{2\theta}\le7/2\) to

\[
\boxed{e^{2\theta}\le4.}
\]

## Route 3: cumulants and Stieltjes moment sequences

### WIP-3.1 — a determinate cumulant criterion for GGC

**Status: [PROVED].**

Let \(Y\ge0\) have moments of every order and be Stieltjes-moment
determinate. Let \(\kappa_n(Y)\) be its cumulants and put

\[
a_n=\frac{\kappa_{n+1}(Y)}{n!},
\qquad n\ge0.
\tag{3.1}
\]

Assume \((a_n)\) is a Stieltjes moment sequence. Thus there is a finite
measure \(\sigma\) on \([0,\infty)\) such that

\[
a_n=\int_{[0,\infty)}c^n\,\sigma(dc).
\tag{3.2}
\]

Put

\[
d=\sigma(\{0\}),\qquad
\tau(dc)=c^{-1}\mathbf1_{(0,\infty)}(c)\,\sigma(dc).
\tag{3.3}
\]

For every \(s\ge0\),

\[
\int_{(0,\infty)}\log(1+sc)\,\tau(dc)
=
\int_{(0,\infty)}
\frac{\log(1+sc)}c\,\sigma(dc)
\le s\,\sigma((0,\infty))<\infty.
\tag{3.4}
\]

Hence

\[
L_Z(s)=
\exp\left\{
-ds-\int_{(0,\infty)}\log(1+sc)\,\tau(dc)
\right\}
\tag{3.5}
\]

is the Laplace transform of a GGC variable \(Z\).

Its first cumulant is

\[
d+\int c\,\tau(dc)
=\sigma([0,\infty))=a_0=\kappa_1(Y),
\]

and for \(n\ge2\),

\[
\kappa_n(Z)
=(n-1)!\int c^n\,\tau(dc)
=(n-1)!\int c^{n-1}\,\sigma(dc)
=(n-1)!a_{n-1}
=\kappa_n(Y).
\tag{3.6}
\]

All these moments are finite because \(\sigma\) has moments of every order.
The moment--cumulant formulas show that \(Y\) and \(Z\) have the same
moments. Moment determinacy of \(Y\) therefore gives \(Y\overset d=Z\).
Thus \(Y\in GGC\).

We have proved:

\[
\boxed{
Y\text{ moment determinate}
\quad\Longrightarrow\quad
\left[
Y\in GGC
\Longleftrightarrow
\left(\frac{\kappa_{n+1}(Y)}{n!}\right)_{n\ge0}
\text{ is a Stieltjes moment sequence}
\right].
}
\tag{3.7}
\]

The forward direction follows directly from the Thorin cumulant formula;
the reverse direction is the construction above.

### WIP-3.2 — moment determinacy for \(1<q\le2\)

**Status: [PROVED].**

Let \(X\) be a finite gamma convolution and \(Y=X^q\), with \(1<q\le2\).
Write \(r=q/2\le1\). The moment generating function of \(X\) is finite in a
neighborhood of zero.

If \(r<1\), then for every \(\delta>0\) there is \(C_{\delta,r}<\infty\)
such that

\[
\varepsilon x^r\le\delta x+C_{\delta,r},
\qquad x\ge0.
\]

Choose \(\delta\) inside the moment-generating interval of \(X\). If \(r=1\),
choose \(\varepsilon\) directly inside that interval. In both cases,

\[
\mathbb E[e^{\varepsilon\sqrt Y}]
=
\mathbb E[e^{\varepsilon X^{q/2}}]
<\infty
\tag{3.8}
\]

for some \(\varepsilon>0\).

Expanding the exponential gives

\[
\mathbb E[Y^n]
\le
\mathbb E[e^{\varepsilon\sqrt Y}]
\frac{(2n)!}{\varepsilon^{2n}}.
\tag{3.9}
\]

Stirling's formula implies

\[
\sum_{n\ge1}
\mathbb E[Y^n]^{-1/(2n)}
=\infty.
\]

The Stieltjes Carleman criterion proves that \(Y\) is moment determinate.

Combining WIP-3.1 and WIP-3.2, for finite gamma \(X\) and \(1<q\le2\),
(C1) is equivalent to all Hankel and shifted-Hankel matrices of the sequence
\((a_n)\) in (3.1) being positive semidefinite.

### WIP-3.3 — exact low-order Hankel results in the first benchmark

**Status: [COMPUTER-VERIFIED EXACT].**

Take

\[
X=uG_{1/2}+vG'_{1/2},
\qquad
Y=X^2,
\qquad u,v>0,
\tag{3.10}
\]

with independent unit-rate gamma variables. Put

\[
p=u+v,\qquad
z=\left(\frac{u-v}{u+v}\right)^2\in[0,1).
\tag{3.11}
\]

Beta--gamma algebra gives

\[
X\overset d=
G_1\,\frac p2(1+\sqrt z\,V),
\tag{3.12}
\]

where \(V\) has the arcsine law on \([-1,1]\) and

\[
\mathbb E[V^{2j}]=\frac{\binom{2j}{j}}{4^j},
\qquad
\mathbb E[V^{2j+1}]=0.
\tag{3.13}
\]

Therefore the raw moments used in the calculation are

\[
\mathbb E[Y^n]
=
\frac{(2n)!p^{2n}}{2^{2n}}
\sum_{j=0}^n
\binom{2n}{2j}
\frac{\binom{2j}{j}}{4^j}z^j.
\tag{3.14}
\]

The calculation uses Python's exact
\(\mathrm{fractions.Fraction}\) arithmetic and the standard
moment--cumulant recurrence. The reproducible script is
[computations/route3_halfshape_q2_hankel.py](computations/route3_halfshape_q2_hankel.py).

For

\[
a_n=\frac{\kappa_{n+1}(Y)}{n!},
\]

the first unshifted \(2\times2\) determinant is

\[
\begin{aligned}
\det(a_{i+j})_{i,j=0}^1
=p^8\bigg(
&\frac34+\frac{39}4z+\frac{327}{64}z^2\\
&+\frac{63}{16}z^3+\frac9{64}z^4
\bigg)>0.
\end{aligned}
\tag{3.15}
\]

The first shifted determinant is

\[
\begin{aligned}
\det(a_{i+j+1})_{i,j=0}^1
=p^{12}\bigg(
&\frac{99}{16}+\frac{621}{4}z+\frac{124011}{256}z^2\\
&+\frac{56889}{64}z^3+\frac{32283}{128}z^4\\
&+\frac{2763}{64}z^5+\frac{207}{256}z^6
\bigg)>0.
\end{aligned}
\tag{3.16}
\]

The exact \(3\times3\) unshifted and shifted determinants are respectively
\(p^{18}P_9(z)\) and \(p^{24}Q_{12}(z)\), where every coefficient of
\(P_9\) and \(Q_{12}\) printed by the script is strictly positive.
Consequently all four tested determinants are positive throughout the
entire unequal-scale parameter range.

This is a rigorous finite-order result because the arithmetic and formulas
are exact. It is **not** evidence sufficient to conclude that the whole
sequence is Stieltjes. Its current value is:

1. the smallest benchmark is not refuted by the first four determinant
   tests;
2. the positivity in the coordinate \(z\) suggests searching for an
   all-order coefficient-positivity or total-positivity theorem;
3. any such theorem must still cover all Hankel sizes, not just the displayed
   cases.

> **[OPEN STEP R3-A]** Prove or disprove that every Hankel and shifted-Hankel
> determinant for (3.14), after its homogeneous power of \(p\) is removed,
> has nonnegative coefficients as a polynomial in \(z\).

### WIP-3.4 — a formal PDE and an all-order cumulant recurrence

**Status: [PROVED].**

Continue with the reciprocal-rate half-shape model, now normalized as

\[
X_\theta=e^\theta G_{1/2}+e^{-\theta}G'_{1/2},
\qquad
a=\cosh\theta,\qquad x=\sinh^2\theta=a^2-1,
\qquad
Y=X_\theta^2.
\tag{3.17}
\]

If \(M_m=\mathbb E[X_\theta^m]\), the transform

\[
\mathbb E[e^{tX_\theta}]
=(1-2at+t^2)^{-1/2}
=\sum_{m\ge0}P_m(a)t^m
\]

defines the Legendre polynomials and gives

\[
M_m=m!P_m(a),\qquad
M_{m+1}=(2m+1)aM_m-m^2M_{m-1}.
\tag{3.18}
\]

Put

\[
r_n=M_{2n},\qquad q_n=M_{2n+1},
\]

and introduce the formal exponential series

\[
F(t,a)=\sum_{n\ge0}r_n\frac{t^n}{n!},
\qquad
H(t,a)=\sum_{n\ge0}q_n\frac{t^n}{n!}.
\tag{3.19}
\]

These are formal series: \(F\) has radius zero because its coefficients
grow on the \((2n)!\) scale.  Explicitly,
\(X_\theta\ge e^{-\theta}(G_{1/2}+G'_{1/2})\), so

\[
\frac{r_n}{n!}\ge
e^{-2n\theta}\frac{(2n)!}{n!},
\]

whose \(n\)-th root diverges.  For \(s>0\), the actual Laplace transform
\(\mathbb E[e^{-sY}]\) has \(F(-s,a)\) only as its moment asymptotic
expansion.  Every manipulation in this subsection takes place in the
formal power-series ring; no analyticity at \(t=0\) is being assumed.

Splitting (3.18) into even and odd indices gives

\[
\begin{aligned}
q_n&=(4n+1)ar_n-4n^2q_{n-1},\\
r_{n+1}&=(4n+3)aq_n-(2n+1)^2r_n.
\end{aligned}
\tag{3.20}
\]

After summation,

\[
\begin{aligned}
H&=a(4tF_t+F)-4t^2H_t-4tH,\\
F_t&=a(4tH_t+3H)-4t^2F_{tt}-8tF_t-F.
\end{aligned}
\tag{3.21}
\]

Differentiating the generating function in \(a\), or equivalently using
the corresponding Legendre identity, also gives

\[
H=a(2tF_t+F)+(a^2-1)F_a.
\tag{3.22}
\]

Eliminating \(H\), changing from \(a\) to \(x=a^2-1\), and using
\(\partial_a=2a\partial_x\) yields the exact PDE

\[
\boxed{
\begin{aligned}
&4t^2(1+2x)F_{tt}
+8tx(1+x)F_{xt}
+6x(1+x)F_x\\
&\qquad+
\bigl((10+18x)t-1\bigr)F_t
+(2+3x)F=0.
\end{aligned}
}
\tag{3.23}
\]

Set

\[
A=\frac{F_t}{F}=\sum_{n\ge0}a_n(x)t^n,
\qquad
a_n(x)=\frac{\kappa_{n+1}(Y)}{n!},
\qquad
B=(\log F)_x.
\]

The indexing is exact because \(A=\partial_t\log F\) as a formal cumulant
series.  Since \(F(0,x)=1\),

\[
B=\sum_{n\ge1}\frac{a'_{n-1}(x)}n\,t^n.
\]

Dividing (3.23) by \(F\), extracting coefficients, and taking empty sums
to be zero proves

\[
\boxed{
\begin{aligned}
a_0(x)={}&2+3x,\\
a_n(x)={}&
\bigl((4n+6)+(8n+10)x\bigr)a_{n-1}(x)\\
&+4(1+2x)
\sum_{i+j=n-2}a_i(x)a_j(x)\\
&+x(1+x)\left(8+\frac6n\right)a'_{n-1}(x)\\
&+8x(1+x)
\sum_{i+k=n-2}
\frac{a_i(x)a'_k(x)}{k+1},
\qquad n\ge1.
\end{aligned}
}
\tag{3.24}
\]

All multipliers and all operations on the right preserve
coefficientwise nonnegativity.  Induction therefore proves

\[
\boxed{a_n(x)\in\mathbb Q_{\ge0}[x]\quad(n\ge0).}
\tag{3.25}
\]

The first terms are

\[
\begin{aligned}
a_0={}&2+3x,\\
a_1={}&20+108x+96x^2,\\
a_2={}&296+3348x+7704x^2+4752x^3,\\
a_3={}&5648+108000x+455376x^2
       +664704x^3+313344x^4.
\end{aligned}
\tag{3.26}
\]

As an independent finite check,
[computations/route3_halfshape_q2_recurrence.py](computations/route3_halfshape_q2_recurrence.py)
uses exact rational polynomial arithmetic to compare (3.24), through
\(a_8\), with raw moments from (3.20) followed by the ordinary
moment--cumulant recurrence.  The all-order proof remains the formal
derivation and induction above, not this finite check.

For comparison with the \(p,z\) coordinates in WIP-3.3, write
\(u=g e^\theta\), \(v=g e^{-\theta}\).  Then

\[
z=\tanh^2\theta=\frac{x}{1+x},
\qquad
p=2g\sqrt{1+x}.
\]

If \(\bar X=X/p\) and
\(\bar a_n(z)=\kappa_{n+1}(\bar X^2)/n!\), homogeneity gives

\[
\boxed{
a_n(x)
=4^{n+1}(1+x)^{n+1}
\bar a_n\left(\frac{x}{1+x}\right),
\qquad
\frac{\kappa_{n+1}(X^2)}{n!}=g^{2n+2}a_n(x).
}
\tag{3.27}
\]

This reproduces the low-order polynomials used in the exact script for
WIP-3.3.  Result (3.25) is genuinely all-order, but it is only entrywise
coefficient positivity.  It does not imply positivity of all Hankel
minors.

### WIP-3.5 — a connected-permutation expansion

**Status: [PROVED].**

There is an independent combinatorial explanation of (3.25).  Let
\(Z=(Z_1,Z_2)^T\) be standard Gaussian and
\(C=\operatorname{diag}(e^\theta,e^{-\theta})\).  Then

\[
Q=Z^TCZ,\qquad X_\theta\overset d=\frac Q2,
\qquad Y\overset d=\frac{Q^2}{4}.
\tag{3.28}
\]

The log-determinant of the Gaussian quadratic-form transform gives

\[
\kappa_k(Q,\ldots,Q)
=2^{k-1}(k-1)!\operatorname{tr}(C^k).
\tag{3.29}
\]

For \(m\ge1\), let

\[
\rho_m=
\{\{1,2\},\{3,4\},\ldots,\{2m-1,2m\}\}.
\]

Möbius inversion on set partitions, in the product-cumulant form, sums
only over partitions \(\pi\) whose join with \(\rho_m\) is the one-block
partition.  Giving every block of \(\pi\) a cyclic order converts the
factor \((|B|-1)!\) in (3.29) into a permutation cycle.  Accounting for the
factor \(4^{-m}\) in (3.28) yields

\[
\boxed{
a_{m-1}(x)
=
\frac1{(m-1)!}
\sum_{\substack{\sigma\in S_{2m}\\
{\rm cyc}(\sigma)\vee\rho_m=\widehat1}}
\ \prod_{\gamma\in{\rm cyc}(\sigma)}
\cosh(|\gamma|\theta).
}
\tag{3.30}
\]

For \(m=1\), the identity permutation and the transposition contribute
\(\cosh^2\theta+\cosh(2\theta)=2+3x\), checking the normalization.

Every even-length factor \(\cosh(k\theta)\) is a polynomial in
\(x=\sinh^2\theta\) with nonnegative coefficients.  For odd \(k\), it is
\(\sqrt{1+x}\) times such a polynomial.  A permutation of \(2m\) has an
even number of odd cycles, so the square-root factors pair.  Formula
(3.30) therefore proves coefficientwise nonnegativity at every order
directly.

The partition identity used here is the Leonov--Shiryaev product-cumulant
formula: V. P. Leonov and A. N. Shiryaev, “On a Method of Calculation of
Semi-Invariants,” *Theory of Probability and its Applications* **4**(3)
(1959), 319--329, DOI 10.1137/1104031, equation (IV.d).

Formula (3.30) identifies a plausible state space for a future transfer
operator: grow the fixed matching \(\rho_m\) one pair at a time while
tracking open cycles and their two Gaussian colors.  The connectedness
condition is global, however, and no positive self-adjoint transfer
operator follows merely from the positive enumeration.

### WIP-3.6 — the divided cumulants are Stieltjes at every contrast

**Status: [PROVED], with the canonical CBF representation cited in the
source map.**

Beta--gamma algebra and the duplication formula give independent variables
\(E\sim\Gamma(1,1)\), \(G^\star_{1/2}\sim\Gamma(1/2,1)\), and an arcsine
variable \(D\) on \([e^{-\theta},e^\theta]\) such that

\[
X_\theta\overset d=G_1D,
\qquad
Y=X_\theta^2\overset d=E Z,
\qquad
Z:=4G^\star_{1/2}D^2.
\tag{3.31}
\]

Consequently the actual Laplace transform of \(Y\) is the Stieltjes
transform

\[
\phi(s)=\mathbb E[e^{-sY}]
=\mathbb E[(1+sZ)^{-1}],
\qquad s>0.
\tag{3.32}
\]

The associated series
\(\sum_{n\ge0}\mathbb E[Z^n]t^n\) is still only formal at \(t=0\);
equation (3.32), not that divergent series, is the analytic object used
below.

Since \(1/\phi\) is a complete Bernstein function, its canonical phase,
defined almost everywhere, is

\[
\eta(t)=-\frac1\pi\arg\phi(-t+i0)\in[0,1],
\]

and the normalized canonical representation is

\[
-\log\phi(s)
=
\int_0^\infty\frac{s}{t(s+t)}\eta(t)\,dt.
\tag{3.33}
\]

Put

\[
\xi(c)=\eta(1/c).
\tag{3.34}
\]

Differentiating (3.33) and changing variables \(c=1/t\) gives

\[
-\frac{\phi'(s)}{\phi(s)}
=
\int_0^\infty\frac{\xi(c)}{(1+sc)^2}\,dc.
\tag{3.35}
\]

The left side has
\((-1)^nh^{(n+1)}(0+)=\kappa_{n+1}(Y)=n!a_n\), where
\(h=-\log\phi\).  For \(s>0\), differentiating (3.35) gives

\[
(-1)^nh^{(n+1)}(s)
=(n+1)!\int_0^\infty
\frac{c^n\xi(c)}{(1+sc)^{n+2}}\,dc.
\]

Letting \(s\downarrow0\) by monotone convergence, using the finite
right derivatives at zero rather than a convergent Taylor series, gives
the exact identity

\[
\boxed{
a_n=(n+1)\int_0^\infty c^n\xi(c)\,dc.
}
\tag{3.36}
\]

Thus

\[
\boxed{
b_n:=\frac{a_n}{n+1}
=\frac{\kappa_{n+1}(Y)}{(n+1)!}
\quad\text{is a Stieltjes moment sequence for every }\theta\ge0.
}
\tag{3.37}
\]

This is an all-order theorem, not a finite computation.  For
\(N=m+1\), the Gram--Andreief formulas make its two Stieltjes Hankel
families explicit:

\[
\begin{aligned}
\det[b_{i+j}]_{i,j=0}^{m}
&=
\frac1{N!}\int_{(0,\infty)^N}
\prod_{p<q}(c_p-c_q)^2
\prod_{p=1}^N\xi(c_p)\,dc_p,\\
\det[b_{i+j+1}]_{i,j=0}^{m}
&=
\frac1{N!}\int_{(0,\infty)^N}
\prod_{p=1}^Nc_p
\prod_{p<q}(c_p-c_q)^2
\prod_{p=1}^N\xi(c_p)\,dc_p.
\end{aligned}
\tag{3.38}
\]

The density of \(Z\) is strictly positive, so \(0<\xi(c)<1\) for
\(c>0\); both displayed determinants are therefore strictly positive.

The factor \(n+1\) in (3.36) is exactly the unresolved issue.  In fact,
the desired undivided sequence \((a_n)\) is Stieltjes if and only if
\(\xi\) has a nonincreasing representative.  If \(\xi\) is nonincreasing,
then moment finiteness removes the boundary terms in Stieltjes integration
by parts and

\[
\sigma(dc)=-c\,d\xi(c)
\tag{3.39}
\]

is a positive measure satisfying
\(\int c^n\sigma(dc)=a_n\).

Conversely, suppose \(a_n=\int r^n\sigma(dr)\) for a positive measure.
Then \(b_n\) is represented by

\[
\sigma(\{0\})\delta_0(dc)
+
\xi_\sigma(c)\,dc,
\qquad
\xi_\sigma(c)=
\int_{[c,\infty)}\frac{\sigma(dr)}r,
\tag{3.40}
\]

and \(\xi_\sigma\) is nonincreasing.  This representing measure is unique.
Indeed, (3.25) and the moment--cumulant formula imply
\(0\le\kappa_m(Y)\le\mathbb E[Y^m]\).  If
\(\mathbb E[e^{\lambda X_\theta}]<\infty\), then

\[
a_n\le
\frac{\mathbb E[e^{\lambda X_\theta}](2n+2)!}
{n!\lambda^{2n+2}},
\]

so the Carleman sum for \((b_n)\) dominates a constant multiple of
\(\sum n^{-1/2}\).  Hence (3.40) must coincide with the canonical measure
\(\xi(c)dc\) in (3.36).  In particular \(\sigma(\{0\})=0\) and \(\xi\)
has the claimed nonincreasing representative.

Since \(c\mapsto1/c\) reverses order,

\[
\xi\text{ nonincreasing}
\quad\Longleftrightarrow\quad
\eta\text{ nondecreasing}.
\tag{3.41}
\]

Thus Route 3 has reached exactly the same remaining condition as the
Route-2 phase criterion; division by \(n+1\) does not bypass it.

For a completely real boundary formula, the density of \(Z\) in (3.31)
is

\[
q_\theta(c)
=
\frac1{2\sqrt{\pi c}}\,
\mathbb E\!\left[
D^{-1}e^{-c/(4D^2)}
\right]
=
\frac1{2\sqrt{\pi c}}\,
\mathbb E\!\left[e^{-cD^2/4}\right].
\tag{3.42}
\]

Here the second form follows from the reciprocal arcsine identity in
WIP-2.10.  If

\[
\mathscr H_\theta(c)
=
\operatorname{PV}\int_0^\infty
\frac{q_\theta(z)}{c-z}\,dz,
\]

then the Hilbert-transform boundary value exists for almost every \(c>0\)
and the reciprocal-variable calculation gives

\[
\boxed{
\xi(c)
=
\frac1\pi
\operatorname{Arg}
\left(
\mathscr H_\theta(c)+i\pi q_\theta(c)
\right),
\qquad \operatorname{Arg}\in(0,\pi).
}
\tag{3.43}
\]

The missing assertion is precisely \(\xi'(c)\le0\).

### WIP-3.7 — finite Jacobi matrices prove exactly the divided theorem

**Status: [PROVED; OPERATOR ROUTE OBSTRUCTION].**

Let \(\mu\) be the law of \(Z\) in (3.31), and let \(J_N\) be the
\(N\times N\) leading truncation of its Jacobi multiplication matrix.
Let \(J_N^{(1)}\) be the trailing principal submatrix.  Since \(\mu\) has
infinite support in \((0,\infty)\), these are positive definite,
irreducible tridiagonal matrices.  Their eigenvalues strictly interlace:

\[
0<\lambda_1<\mu_1<\lambda_2<
\cdots<\mu_{N-1}<\lambda_N.
\tag{3.44}
\]

The finite resolvent and its logarithmic derivative are

\[
\begin{aligned}
M_N(t)
&=
\langle e_0,(I-tJ_N)^{-1}e_0\rangle
=
\frac{\det(I-tJ_N^{(1)})}{\det(I-tJ_N)},\\
\frac{M_N'(t)}{M_N(t)}
&=
\sum_{i=1}^N\frac{\lambda_i}{1-t\lambda_i}
-
\sum_{j=1}^{N-1}\frac{\mu_j}{1-t\mu_j}
=:\sum_{n\ge0}a_n^{(N)}t^n.
\end{aligned}
\tag{3.45}
\]

Therefore

\[
a_n^{(N)}
=
\sum_i\lambda_i^{n+1}
-
\sum_j\mu_j^{n+1}.
\tag{3.46}
\]

Define the alternating-interval density

\[
\xi_N(c)
=
\mathbf1_{(0,\lambda_1)}(c)
+
\sum_{j=1}^{N-1}
\mathbf1_{(\mu_j,\lambda_{j+1})}(c).
\tag{3.47}
\]

Integrating monomials interval by interval gives

\[
\boxed{
\frac{a_n^{(N)}}{n+1}
=
\int_0^\infty c^n\xi_N(c)\,dc.
}
\tag{3.48}
\]

The path expansion of powers of the tridiagonal Jacobi matrix shows that
\(\langle e_0,J_N^ke_0\rangle\) agrees with the \(k\)-th moment of
\(\mu\) for \(k<2N\): a path from level zero that reaches the omitted
level \(N\) needs at least \(2N\) steps to return.  Hence

\[
a_n^{(N)}=a_n,\qquad 0\le n\le2N-2.
\tag{3.49}
\]

Taking \(N\) large enough for any prescribed finite quadratic form gives
an independent finite-matrix proof of (3.37).

The same construction also shows why ordinary interlacing cannot prove
that \((a_n)\) is Stieltjes.  Already at \(N=2\),

\[
a_n^{(2)}
=
\lambda_1^{n+1}-\mu_1^{n+1}+\lambda_2^{n+1},
\]

and the \(3\times3\) Hankel determinant is

\[
\boxed{
\det[a_{i+j}^{(2)}]_{i,j=0}^{2}
=
-\lambda_1\mu_1\lambda_2
(\mu_1-\lambda_1)^2
(\lambda_2-\lambda_1)^2
(\lambda_2-\mu_1)^2<0.
}
\tag{3.50}
\]

This does not contradict (3.49), because that determinant uses
coefficients beyond the matching range.  It proves that finite
Jacobi/interlacing approximants inevitably encode a signed measure for the
undivided sequence.

There is also an immediate no-go for a scalar production matrix with
polynomial Stieltjes--Rogers weights.  In the convention

\[
\frac{A(t)}{a_0}
=
\cfrac1{1-\cfrac{\alpha_1t}
{1-\cfrac{\alpha_2t}{1-\cdots}}},
\]

the first coefficient is

\[
\alpha_1=\frac{a_1}{a_0}
=
\frac{20+108x+96x^2}{2+3x},
\tag{3.51}
\]

which is genuinely nonpolynomial because its numerator does not vanish at
\(x=-2/3\).  A successful production construction must therefore use
rational or block-valued weights, or directly encode monotonicity of the
limiting phase/spectral-shift function.

### WIP-3.8 — an explicit representing measure at equal rates

**Status: [ESTABLISHED INPUT plus PROVED DEDUCTION].**

At \(x=0\), recurrence (3.24) reduces to

\[
a_0=2,\qquad
a_n=(4n+6)a_{n-1}
+4\sum_{i+j=n-2}a_i a_j.
\tag{3.52}
\]

Let \(d_m=S(2,-3,1)_m\) be the self-convolutive sequence

\[
d_1=1,\qquad
d_m=(2m-3)d_{m-1}
+\sum_{j=1}^{m-1}d_jd_{m-j}.
\tag{3.53}
\]

A direct induction comparing (3.52) and (3.53) gives

\[
a_n(0)=2^nd_{n+2}.
\tag{3.54}
\]

Martin and Kearney give the exact positive Mellin representation

\[
d_m=
\sqrt{\frac2\pi}
\int_0^\infty
\frac{
r^{m-3/2}e^{r/2}
}{
\mathcal G_1(r/2)^2+\pi
}\,dr,
\qquad
\mathcal G_1(y)=
\sum_{k=0}^\infty
\frac{y^{k+1/2}}{(k+1/2)k!}.
\tag{3.55}
\]

Notice that the denominator contains \(+\pi\), not \(+\pi^2\), and
\(\mathcal G_1(y)=\sqrt\pi\,\operatorname{erfi}(\sqrt y)\).
Multiplying the representing measure in (3.55) by \(r\) and pushing it
forward under \(c=2r\) yields

\[
\boxed{
a_n(0)=\int_0^\infty c^n\sigma_0(c)\,dc,
\qquad
\sigma_0(c)=
\frac{
\sqrt c\,e^{c/4}
}{
2\sqrt\pi\,[\mathcal G_1(c/4)^2+\pi]
}.
}
\tag{3.56}
\]

Thus the raw cumulant sequence is explicitly Stieltjes at the equal-rate
point, consistently with the GGC conclusion in WIP-2.5.

The external input is R. J. Martin and M. J. Kearney, “An Exactly Solvable
Self-Convolutive Recurrence,” *Aequationes Mathematicae* **80** (2010),
291--318, DOI 10.1007/s00010-010-0051-0, equation (1) and the displayed
\(S(2,-3,1)\) formula in the Introduction, p. 293.

### WIP-3.9 — the direct \(HM_{1/2}\) factor shortcut fails

**Status: [PROVED; REFUTED ROUTE].**

Let \(D\) be arcsine on
\([l,r]=[e^{-\theta},e^\theta]\), let \(V=D^2\), and suppose
\(\theta>0\).  Its density is

\[
f_V(y)=
\frac1{
2\pi\sqrt y
\sqrt{(\sqrt y-l)(r-\sqrt y)}
},
\qquad l^2<y<r^2.
\tag{3.57}
\]

To test \(HM_{1/2}\), it is enough to find one failed central value.
Choose the hyperbolic center equal to one, write \(v=t^2\) with
\(1<t<r\), and put

\[
w=v+v^{-1},\qquad
W=r^2+r^{-2}=4a^2-2.
\]

The identities

\[
(t-l)(r-t)=t(2a-t-t^{-1}),
\]

and its reciprocal counterpart give

\[
\boxed{
f_V(v)f_V(v^{-1})
=
\frac1{4\pi^2(2a-\sqrt{w+2})},
\qquad
2<w<W.
}
\tag{3.58}
\]

In particular,

\[
f_V(v)f_V(v^{-1})
\sim
\frac{a}{\pi^2(W-w)}
\qquad(w\uparrow W).
\tag{3.59}
\]

If \(V\) were \(HM_{1/2}\), the defining representation would supply a
positive measure \(H\) such that

\[
h(w):=f_V(v)f_V(v^{-1})
=
\int_{(w,\infty)}
(\lambda-w)^{-1/2}\,H(d\lambda).
\tag{3.60}
\]

Since \(h(w)=0\) for \(w>W\), positivity forces
\(H((W,\infty))=0\).  For every \(x<W\), Tonelli and the beta integral
would then give

\[
\int_x^W\frac{h(w)}{\sqrt{w-x}}\,dw
=
\pi H((x,W])<\infty.
\tag{3.61}
\]

The mass on the right is finite already from (3.60) at \(w=x\).
But (3.59) makes the left side of (3.61) diverge logarithmically.  This
contradiction proves

\[
\boxed{\theta>0\quad\Longrightarrow\quad D^2\notin HM_{1/2}.}
\tag{3.62}
\]

Sjödin's theorem would have made
\(G_{1/2}D^2\) a GGC if \(D^2\) were \(HM_{1/2}\), after which independent
product closure could handle the remaining gamma factor in (3.31).
Equation (3.62) therefore kills that direct sufficient-condition route,
but it does not say that \(Y\) itself fails to be GGC.

The exact external definitions and theorem are in T. Sjödin,
“On Mixtures of Gamma Distributions, Distributions with Hyperbolically
Monotone Densities and Generalized Gamma Convolutions (GGC),”
*Probability and Mathematical Statistics* **41**(1) (2021), 1--7,
DOI 10.37190/0208-4147.41.1.1: equation (2.1) and Definition 2.1 on p. 2,
and Theorem 3.1 on p. 4.  These are numbered equation (1), Definition 1,
and Theorem 1 in the arXiv manuscript.

### WIP-3.10 — every finite gamma convolution square passes the first two Hankel gates

**Status: [PROVED BY EXACT POLYNOMIAL IDENTITIES; NECESSARY CONDITIONS
ONLY, NOT A PROOF OF GGC MEMBERSHIP].**

Let

\[
X=\sum_{\ell=1}^N r_\ell G_{\beta_\ell}^{(\ell)},
\qquad r_\ell,\beta_\ell>0,
\]

with independent unit-rate gamma variables, and define the finite positive
measure and its moments

\[
\nu=\sum_{\ell=1}^N\beta_\ell\delta_{r_\ell},
\qquad
p_j=\int x^j\,\nu(dx)=\sum_{\ell=1}^N\beta_\ell r_\ell^j.
\tag{3.63}
\]

Then

\[
\kappa_j(X)=(j-1)!p_j.
\tag{3.64}
\]

Put \(Y=X^2\) and, as in WIP-3.1,

\[
a_n=\frac{\kappa_{n+1}(Y)}{n!}.
\]

The conclusion of this subsection is

\[
\boxed{
a_0a_2-a_1^2>0,\qquad
a_1a_3-a_2^2>0.
}
\tag{3.65}
\]

Thus no finite gamma convolution square can fail either of the first two
nontrivial \(2\times2\) Stieltjes Hankel tests.

The low-order cumulants follow from

\[
M_n:=\mathbb E[X^n]
=\sum_{j=1}^n\binom{n-1}{j-1}\kappa_j(X)M_{n-j}
\]

and the ordinary moment--cumulant recurrence for \(Y\).  Exact expansion
gives

\[
\kappa_1(Y)=p_1^2+p_2,
\tag{3.66}
\]

\[
\kappa_2(Y)
=4p_1^2p_2+8p_1p_3+2p_2^2+6p_4,
\tag{3.67}
\]

\[
\begin{aligned}
\kappa_3(Y)={}&
16p_1^3p_3+24p_1^2p_2^2+72p_1^2p_4
+96p_1p_2p_3+8p_2^3\\
&+144p_1p_5+72p_2p_4+40p_3^2+120p_6,
\end{aligned}
\tag{3.68}
\]

and

\[
\begin{aligned}
\kappa_4(Y)={}&
96p_1^4p_4+384p_1^3p_2p_3+192p_1^2p_2^3\\
&+768p_1^3p_5+1728p_1^2p_2p_4
 +768p_1^2p_3^2+1152p_1p_2^2p_3+48p_2^4\\
&+2880p_1^2p_6+3456p_1p_2p_5
 +3072p_1p_3p_4+864p_2^2p_4+960p_2p_3^2\\
&+5760p_1p_7+2880p_2p_6+2688p_3p_5
 +1152p_4^2+5040p_8.
\end{aligned}
\tag{3.69}
\]

Here

\[
a_0=\kappa_1(Y),\qquad
a_1=\kappa_2(Y),\qquad
a_2=\frac{\kappa_3(Y)}2,\qquad
a_3=\frac{\kappa_4(Y)}6.
\tag{3.70}
\]

The positivity certificates use only one general spread inequality.  If

\[
u+v=s+t,\qquad u\le s\le t\le v,
\]

write

\[
\Delta(u,v;s,t)=p_up_v-p_sp_t.
\]

Then

\[
\boxed{\Delta(u,v;s,t)\ge0.}
\tag{3.71}
\]

Indeed, every such spread is a sum of adjacent spreads, and for
\(0\le j<S-j-1\),

\[
\boxed{
\begin{aligned}
&p_jp_{S-j}-p_{j+1}p_{S-j-1}\\
&\quad=
\frac12\iint
x^jy^j(x-y)^2
\left(
\sum_{h=0}^{S-2j-2}x^{S-2j-2-h}y^h
\right)\nu(dx)\nu(dy)\ge0.
\end{aligned}
}
\tag{3.72}
\]

Consequently every \(\Delta\)-term below has an explicit
expectation-of-squares certificate.

For the first determinant, direct collection gives

\[
\boxed{
\begin{aligned}
a_0a_2-a_1^2={}&
4p_1^4\Delta(1,3;2,2)+4p_1^5p_3\\
&+8p_1^3\Delta(1,4;2,3)+28p_1^4p_4\\
&+44p_1^2\Delta(1,5;3,3)
 +28p_1^3p_5+24p_1^2p_2p_4+16p_1p_2^2p_3\\
&+72p_1\Delta(2,5;3,4)
 +24p_1\Delta(1,6;3,4)\\
&+36p_1^2p_6+12p_2^2p_4+20p_2p_3^2\\
&+36\Delta(2,6;4,4)+24p_2p_6.
\end{aligned}
}
\tag{3.73}
\]

Every summand is nonnegative and \(24p_2p_6>0\), proving the first
inequality in (3.65).

The shifted determinant admits the following homogeneous positive
decomposition:

\[
\boxed{
a_1a_3-a_2^2=\sum_{j=2}^8Q_j,
}
\tag{3.74}
\]

where

\[
\begin{aligned}
Q_8={}&
64p_1^6\Delta(2,4;3,3)
+64p_1^4p_2^2\Delta(1,3;2,2)
+48p_1^4p_2^4,
\end{aligned}
\tag{3.75}
\]

\[
\begin{aligned}
Q_7={}&
448p_1^5\Delta(2,5;3,4)
+64p_1^5p_2p_5+320p_1^4p_2^2p_4\\
&+64p_1^3p_2p_3\Delta(1,3;2,2)
+192p_1^4p_2p_3^2,
\end{aligned}
\tag{3.76}
\]

\[
\begin{aligned}
Q_6={}&
128p_1^4\Delta(2,6;3,5)
+1200p_1^4\Delta(2,6;4,4)
+592p_1^4p_2p_6\\
&+832p_1^3p_2^2p_5+704p_1^3p_2p_3p_4\\
&+352p_1^2p_3^2\Delta(1,3;2,2)
+352p_1^3p_3^3\\
&+192p_1^2p_2^3p_4+64p_1p_2^4p_3,
\end{aligned}
\tag{3.77}
\]

\[
\begin{aligned}
Q_5={}&
2880p_1^3\Delta(3,6;4,5)
+1536p_1^3\Delta(2,7;4,5)
+2304p_1^3p_2p_7\\
&+512p_1^2p_2\Delta(2,6;3,5)
+96p_1^2p_2\Delta(2,6;4,4)
+832p_1^2p_2^2p_6\\
&+128p_1p_3p_4\Delta(1,3;2,2)
+640p_1p_3^2\Delta(1,4;2,3)\\
&+2656p_1^2p_3^2p_4
+576p_1p_2^3p_5+48p_2^4p_4+160p_2^3p_3^2,
\end{aligned}
\tag{3.78}
\]

\[
\begin{aligned}
Q_4={}&
1440p_1^2\Delta(3,7;4,6)
+5184p_1^2\Delta(3,7;5,5)
+1056p_1^2p_3p_7\\
&+1920p_1p_2\Delta(2,7;3,6)
+1728p_1p_2\Delta(1,8;4,5)
+1632p_1^2p_2p_8\\
&+48p_2^2\Delta(2,6;4,4)+432p_2^3p_6\\
&+480p_2p_3\Delta(2,5;3,4)+416p_2^2p_3p_5\\
&+400p_3^2\Delta(1,5;3,3)+304p_1p_3^2p_5
+4608p_1p_3p_4^2,
\end{aligned}
\tag{3.79}
\]

\[
\begin{aligned}
Q_3={}&
2400p_3\Delta(1,8;3,6)
+4320p_1\Delta(3,8;5,6)
+4320p_1\Delta(4,7;5,6)\\
&+1440p_1p_4p_7
+1440p_2\Delta(2,8;4,6)+240p_2^2p_8\\
&+2688p_3p_4p_5+1152p_4^3,
\end{aligned}
\tag{3.80}
\]

and

\[
Q_2=3600\Delta(4,8;6,6)+1440p_4p_8.
\tag{3.81}
\]

Every \(Q_j\) is nonnegative by (3.71), and \(Q_2>0\).  This proves the
second inequality in (3.65).  The exact expansion and collection into
(3.73)--(3.81) are checked independently by
[route3_general_square_hankel.py](computations/route3_general_square_hankel.py).

This lemma is uniform in the number of atoms, shapes, and scales and
strictly extends the former two-half-gamma low-order check.  It removes
both \(2\times2\) determinants from the counterexample search.  It does
not prove that all higher Hankel matrices are positive semidefinite, so it
does not prove that \(X^2\) is GGC.

## Route 4: final averaged HCM

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

## Route 5: shape-matched Dirichlet recursion

### WIP-5.1 — exact update and the required invariant

**Status: [PROVED REDUCTION].**

Suppose

\[
X=G_BM
\]

is generated by a finite Dirichlet mean, and independently add
\(G_\beta/b\). If

\[
T_+=G_B+G_\beta,\qquad
U=\frac{G_B}{T_+},
\]

then

\[
T_+\sim\Gamma(B+\beta,1),\qquad
U\sim\operatorname{Beta}(B,\beta),\qquad
T_+\perp U,
\]

and

\[
X+\frac{G_\beta}{b}
=
T_+\left(UM+(1-U)b^{-1}\right).
\tag{5.1}
\]

Thus the exact induction target is to prove that the operation

\[
(B,M)\longmapsto
\left(
B+\beta,\,
UM+(1-U)b^{-1}
\right)
\tag{5.2}
\]

preserves a final-level GGC certificate after the \(q\)-th power is taken.
The invariant must be formulated on the matched class of order-\(B\)
Dirichlet means; it is not asserted for arbitrary bounded \(M\).

The complementary rate-side update and a first positive invariant are
derived next.  They prove the first update for \(q=2\), total shape one,
and a bounded rate contrast, but they do not yet provide the general
shape-changing GGC operator requested by (5.2).

### WIP-5.2 — reciprocal Dirichlet duality and the rate-side update

**Status: [PROVED].**

For the two Dirichlet representations in WIP-0.2, take independent
\(P,Q\sim\operatorname{Dir}(\beta_1,\ldots,\beta_n)\) and write

\[
M=\sum_i\frac{P_i}{b_i},
\qquad
R=\sum_i b_iQ_i,
\qquad
p_b=\prod_i b_i^{\beta_i}.
\]

Comparison of the two density formulas for \(X\) gives the following
weighted reciprocal duality: for every bounded Borel function \(h\),

\[
\boxed{
\mathbb E\!\left[M^{-B}h(M^{-1})\right]
=p_b\,\mathbb E[h(R)].
}
\tag{5.3}
\]

Indeed,

\[
f_X(x)=\frac{x^{B-1}}{\Gamma(B)}
\mathbb E[M^{-B}e^{-x/M}]
=\frac{p_bx^{B-1}}{\Gamma(B)}\mathbb E[e^{-Rx}],
\]

and both mixing measures have compact support in \((0,\infty)\), so
Laplace-transform uniqueness proves (5.3), first for exponential test
functions and then for bounded Borel \(h\).

With

\[
K_{\nu,q}(s,r)=\int_0^\infty x^{\nu-1}e^{-sx^q-rx}\,dx,
\]

the transform of the powered convolution is consequently

\[
\boxed{
\mathbb E[e^{-sX^q}]
=\frac{p_b}{\Gamma(B)}\mathbb E[K_{B,q}(s,R)].
}
\tag{5.4}
\]

Now add an independent \(\Gamma(\beta,b)\) variable, in the rate
convention, and let

\[
V\sim\operatorname{Beta}(B,\beta),
\qquad
R_+=VR+(1-V)b,
\qquad V\perp R.
\]

Dirichlet aggregation gives the exact update

\[
\boxed{
\psi_+(s)
=\frac{p_bb^\beta}{\Gamma(B+\beta)}
\mathbb E[K_{B+\beta,q}(s,R_+)].
}
\tag{5.5}
\]

Thus the rate mixing law evolves by the positive Markov operator

\[
\boxed{
\mathcal B_{B,\beta;b}\mu
:=\operatorname{Law}(VR+(1-V)b),
\qquad R\sim\mu.
}
\tag{5.6}
\]

This \((R,V)\) is a separate rate-side coupling.  It must not be identified
with the scale-side variables \((M,U)\) in (5.1).

### WIP-5.3 — the fully averaged quadratic phase kernel at total shape one

**Status: [PROVED REDUCTION].**

Assume now that \(B=1\), and let \(\mu\) denote the law of \(R\).  Formula
(5.4) at the density level reads

\[
f_X(x)=p_b\mathbb E[e^{-Rx}],
\qquad
f_{X^2}(y)=\frac{p_b}{2\sqrt y}\mathbb E[e^{-R\sqrt y}].
\tag{5.7}
\]

In particular \(f_{X^2}\) is completely monotone and the Laplace transform
\(\psi(s)=\mathbb E[e^{-sX^2}]\) is Stieltjes.  Define

\[
Q_\mu(u)=\mathbb E[e^{-u^2R^2}],
\qquad
N_\mu(u)=\mathbb E[e^{-u^2R^2}\operatorname{erfi}(uR)].
\tag{5.8}
\]

For \(x>0\), \(u=(2\sqrt x)^{-1}\), the negative-axis boundary value is

\[
\psi(-x+i0)
=\frac{p_b\sqrt\pi}{2\sqrt x}
\bigl(N_\mu(u)-iQ_\mu(u)\bigr),
\tag{5.9}
\]

and the normalized phase of the reciprocal CBF is

\[
\eta_\mu(x)=\frac1\pi\arctan\frac{Q_\mu(u)}{N_\mu(u)}.
\tag{5.10}
\]

The rate variable is supported on a compact subinterval of
\((0,\infty)\).  The same dominated endpoint expansions as in WIP-2.3
therefore give \(\eta_\mu(0+)=0\), \(\eta_\mu(\infty)=1/2\), and the CBF/TBF
phase criterion applies without an additional boundary term.

For \(z_1\ge z_2>0\), define the symmetric kernel by

\[
\mathcal K(z_1,z_2)
=e^{-z_1^2-z_2^2}
\left[
z_1e^{z_1^2}+z_2e^{z_2^2}
-2(z_1^2-z_2^2)\int_{z_2}^{z_1}e^{t^2}\,dt
\right],
\tag{5.11}
\]

and extend it symmetrically when \(z_2>z_1\).  The symmetrization in
WIP-2.9 is distribution-free: for independent \(R_1,R_2\sim\mu\),

\[
Q_\mu(u)^2\left(\frac{N_\mu}{Q_\mu}\right)'(u)
=\frac1{u\sqrt\pi}\mathbb E[\mathcal K(uR_1,uR_2)].
\tag{5.12}
\]

Since \(dx/du=-1/(2u^3)\), differentiation of (5.10) yields the exact
certificate

\[
\boxed{
\eta_\mu'(x)
=\frac{2u^2}{\pi^{3/2}(Q_\mu(u)^2+N_\mu(u)^2)}
\mathbb E[\mathcal K(uR_1,uR_2)].
}
\tag{5.13}
\]

Together with the endpoint conditions stated above, this proves the exact
equivalence

\[
X^2\in GGC
\quad\Longleftrightarrow\quad
\mathbb E[\mathcal K(uR_1,uR_2)]\ge0
\quad\text{for every }u>0.
\tag{5.13a}
\]

For the first nontrivial update

\[
X=\frac{G_p}{b_1}+\frac{G_{1-p}}{b_2},
\qquad 0<p<1,
\]

one has \(R(v)=vb_1+(1-v)b_2\) with
\(v\sim\operatorname{Beta}(p,1-p)\).  Hence the sign-determining
expectation in (5.13) is exactly

\[
\frac1{\mathrm B(p,1-p)^2}
\int_0^1\!\int_0^1
\mathcal K(uR(v),uR(w))
v^{p-1}(1-v)^{-p}
w^{p-1}(1-w)^{-p}\,dv\,dw.
\tag{5.14}
\]

Both Beta variables remain inside the final average.

### WIP-5.4 — a recursively preserved narrow rate cone

**Status: [PROVED PARTIAL ROUTE-5 THEOREM].**

Let \(\phi_{\rm g}=(1+\sqrt5)/2\).  If \(z_1\ge z_2>0\) and
\(z_1/z_2\le\phi_{\rm g}\), then

\[
\mathcal K(z_1,z_2)>0.
\tag{5.15}
\]

To prove this, bound

\[
\int_{z_2}^{z_1}e^{t^2}\,dt
\le\frac{e^{z_1^2}-e^{z_2^2}}{2z_2}
\]

and put \(A=(z_1^2-z_2^2)/z_2\).  The bracket in (5.11) is then at least

\[
(z_1-A)e^{z_1^2}+(z_2+A)e^{z_2^2}.
\]

The first coefficient is nonnegative because

\[
z_1-A
=z_2\left(1+\frac{z_1}{z_2}
-\left(\frac{z_1}{z_2}\right)^2\right)\ge0,
\]

and the second term is strictly positive.  Since a Dirichlet rate mean is
supported on the convex hull of its atoms, (5.13) and the phase criterion
prove

\[
\boxed{
\begin{gathered}
X=\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i},
\qquad \sum_i\beta_i=1,\\
\frac{\max_i b_i}{\min_i b_i}\le\phi_{\rm g}
\quad\Longrightarrow\quad X^2\in GGC.
\end{gathered}}
\tag{5.16}
\]

In particular, for every \(0<p<1\),

\[
\boxed{
\left(\frac{G_p}{b_1}+\frac{G_{1-p}}{b_2}\right)^2\in GGC
\quad\text{if}\quad
\frac{\max(b_1,b_2)}{\min(b_1,b_2)}\le\phi_{\rm g}.
}
\tag{5.17}
\]

For \(p=1/2\), \(b_1=e^\theta\), and \(b_2=e^{-\theta}\), the substitution
\(v=(1-\cos\varphi)/2\) recovers the arcsine rate
\(R=\cosh\theta-\sinh\theta\cos\varphi\).  Since the rate ratio is
\(e^{2\theta}\), formula (5.17) recovers exactly the range (2.56).  Its new
content is the extension to all complementary shapes and to any finite
number of summands of total shape one.  The averaged tilted-mean cone in
WIP-5.7 later gives a different, strictly larger parameter-dependent region.

The support cone \(\operatorname{supp}\mu\subset[\ell,h]\) is preserved by
the update (5.6) whenever the new rate \(b\in[\ell,h]\).  Thus
\(h/\ell\le\phi_{\rm g}\) is a genuine recursively tracked positive
invariant.  At present, (5.13) converts it into a GGC certificate only when
the final total shape is one.

### WIP-5.5 — two exact obstructions to naive positive recursion

**Status: [PROVED OBSTRUCTIONS; NOT COUNTEREXAMPLES].**

First, \(\mathcal K\) is not nonnegative on the whole positive quadrant.
Its continuous boundary extension satisfies

\[
e\,\mathcal K(1,0)
=e-2\int_0^1e^{t^2}\,dt<0,
\tag{5.18}
\]

because the exponential series gives

\[
\int_0^1e^{t^2}\,dt>1+\frac13+\frac1{10}=\frac{43}{30},
\qquad e<\frac{11}{4}.
\]

Consequently, sufficiently large rate contrast makes the integrand in
(5.14) strictly negative on a set of positive product-Beta measure near
opposite endpoints.  This is not a counterexample and does not assert that
a one-variable fibre integral is negative: the sign can only be decided
after the complete double Beta average.

Second, the natural fractional identity for changing the kernel shape runs
in the direction opposite to the desired positive recursion:

\[
\boxed{
K_{B,2}(s,r)
=\frac1{\Gamma(\beta)}\int_r^\infty
(t-r)^{\beta-1}K_{B+\beta,2}(s,t)\,dt.
}
\tag{5.19}
\]

Tonelli's theorem proves (5.19) by evaluating the inner Gamma integral.
Recovering the new shape from the old one would require a Weyl fractional
derivative rather than a positive fractional integral.

More sharply, there is no nonzero finite positive measure \(\Pi_r\) on
\([0,\infty)\) such that

\[
K_{B+\beta,2}(s,r)
=\int_0^\infty K_{B,2}(s,t)\,\Pi_r(dt)
\quad(s>0).
\tag{5.20}
\]

Indeed,

\[
s^{\nu/2}K_{\nu,2}(s,r)
\longrightarrow\frac12\Gamma(\nu/2).
\]

After multiplying (5.20) by \(s^{B/2}\), the left-hand side tends to
zero, whereas the right-hand side tends, by dominated convergence, to

\[
\frac12\Gamma(B/2)\Pi_r([0,\infty))>0;
\]

the domination is the same bound with \(r=0\).  Thus no \(s\)-independent
finite positive Markov mixture of the old \(K_{B,2}\) can implement shape
growth.

The exact first-update target beyond the proved cone is now, after scaling
to \(b_2=1\), \(b_1=\kappa>1\),

\[
\boxed{
\begin{aligned}
&\int_0^1\!\int_0^1
\mathcal K\!\left(
u[1+(\kappa-1)v],
u[1+(\kappa-1)w]
\right)\\
&\hspace{18mm}\times
\operatorname{Beta}_{p,1-p}(dv)
\operatorname{Beta}_{p,1-p}(dw)\ge0
\end{aligned}}
\tag{5.21}
\]

for every \(u>0\), \(p\in(0,1)\), and \(\kappa>1\).  At \(p=1/2\) this was
the first uncovered half-shape benchmark.  Negative fibres alone neither
refute (5.21) nor decide their final average; WIP-5.10 first proves (5.21)
on the explicit union (5.81), and WIP-5.11 then proves it for every
\(\kappa>1\).

> **[RESOLVED R5-B; UPDATED STEP R5-C].**  Equation (5.21) is settled by
> WIP-5.11.  WIP-5.26 later completes the arbitrary finite-rate update at
> total shape one, WIP-5.29 propagates it downward in total shape, and
> WIP-5.30 settles every two-rate square.  The remaining square task is a
> multirate update at total shape greater than one; for two rates, only
> powers \(q\ne2\) remain.  Any such operator must be more structured than
> the impossible Markov mixture (5.20).

### WIP-5.6 — arbitrary fixed rate contrast near a shape-simplex vertex

**Status: [PROVED PARTIAL ROUTE-5 THEOREM].**

The golden-ratio restriction can be removed when the shapes are sufficiently
unbalanced.  Fix \(\kappa>1\), let

\[
R_p=1+(\kappa-1)V_p,
\qquad V_p\sim\operatorname{Beta}(p,1-p),
\]

and define

\[
I_{p,\kappa}(u)
=\mathbb E[\mathcal K(uR_p,uR_p')],
\tag{5.22}
\]

where the prime denotes an independent copy.  The two pointwise windows
proved in WIP-2.9 apply to every pair in \([1,\kappa]^2\):

\[
\begin{aligned}
0<u\le\frac1{\kappa\sqrt2}
&\quad\Longrightarrow\quad I_{p,\kappa}(u)>0,\\
u\ge\sqrt{\frac56}
&\quad\Longrightarrow\quad I_{p,\kappa}(u)>0.
\end{aligned}
\tag{5.23}
\]

It remains only to consider the compact interval

\[
J_\kappa=\left[\frac1{\kappa\sqrt2},\sqrt{\frac56}\right].
\]

As \(p\downarrow0\), \(V_p\Rightarrow0\); as \(p\uparrow1\),
\(V_p\Rightarrow1\).  The map

\[
(u,v,w)\longmapsto
\mathcal K\!\left(
u[1+(\kappa-1)v],u[1+(\kappa-1)w]
\right)
\]

is continuous on the compact set \(J_\kappa\times[0,1]^2\), and hence is
bounded and uniformly continuous.  Weak convergence of the two product
Beta laws, followed by a finite uniform-continuity net in \(u\), gives

\[
\begin{aligned}
I_{p,\kappa}(u)&\longrightarrow
\mathcal K(u,u)=2u e^{-u^2} &&(p\downarrow0),\\
I_{p,\kappa}(u)&\longrightarrow
\mathcal K(\kappa u,\kappa u)
=2\kappa u e^{-\kappa^2u^2} &&(p\uparrow1),
\end{aligned}
\tag{5.24}
\]

uniformly for \(u\in J_\kappa\).  Both limiting functions have a strictly
positive minimum on that compact interval.  Combining (5.23)--(5.24) with
(5.13) proves:

\[
\boxed{
\begin{gathered}
\text{For every fixed }\kappa>1\text{ there exists }
\varepsilon(\kappa)>0\text{ such that}\\
0<p<\varepsilon(\kappa)
\quad\text{or}\quad
1-\varepsilon(\kappa)<p<1\\
\Longrightarrow\quad
\left(G_p/\kappa+G_{1-p}\right)^2\in GGC.
\end{gathered}}
\tag{5.25}
\]

The same compactness proof works for any fixed finite set of rates:
within the total-shape-one simplex, there is a relative neighborhood of
each vertex in which the square of the corresponding finite gamma
convolution is GGC.  Indeed, the Dirichlet rate mean converges weakly to
the rate at that vertex, while (5.23) continues to control the two
noncompact \(u\)-ends using the fixed minimum and maximum rates.

This is an existence theorem; it does not provide an explicit value of
\(\varepsilon(\kappa)\), nor does it settle shapes bounded away from the
simplex boundary.

### WIP-5.7 — inverse-Stein and tilted-mean cones at total shape one

**Status: [PROVED PARTIAL ROUTE-5 THEOREM].**

The averaged kernel admits a positive-measure representation that yields an
explicit all-\(u\) condition beyond the pointwise golden-ratio cone.  Let
\(\mu\) be any probability measure supported on \([1,\kappa]\), let
\(R\sim\mu\), and set

\[
t=u^2,\qquad q_t(x)=e^{-tx^2},\qquad
Q_t=\int q_t\,d\mu,\qquad
v_t=\frac{\int x^2q_t(x)\,\mu(dx)}{Q_t},
\qquad m_j=\int x^j\,\mu(dx).
\tag{5.26}
\]

Define the unnormalized centered upper tail and a measure on
\((0,\infty)\) by

\[
H_t(x)=\int_{(x,\infty)}(y^2-v_t)q_t(y)\,\mu(dy),
\qquad
\zeta_t(dx)=e^{tx^2}H_t(x)\,dx,
\qquad
M_j(t)=\int x^j\,\zeta_t(dx).
\tag{5.27}
\]

These definitions include discrete and mixed \(\mu\).  The centered
integral of \((y^2-v_t)q_t(y)\) is zero, and that integrand changes sign
only once.  For \(x<\sqrt{v_t}\), write \(H_t(x)\) as minus the lower-tail
integral; for \(x\ge\sqrt{v_t}\), use its displayed upper-tail form.  Both
show

\[
H_t(x)\ge0,
\qquad
\zeta_t\ge0.
\]

In the sense of signed measures,

\[
dH_t(x)=-(x^2-v_t)q_t(x)\,\mu(dx).
\]

Since \(H_t\) vanishes below the support and at its upper endpoint,
Stieltjes integration by parts gives, for every \(C^1\) test function on a
neighborhood of \([1,\kappa]\),

\[
\boxed{
\int\bigl(h'(x)+2txh(x)\bigr)\,\zeta_t(dx)
=\int h(x)(x^2-v_t)\,\mu(dx).
}
\tag{5.28}
\]

Taking \(h(x)=x^n\), which is legitimate for every integer \(n\) because
the support stays away from zero, yields

\[
\boxed{
nM_{n-1}(t)+2tM_{n+1}(t)=m_{n+2}-v_tm_n.
}
\tag{5.29}
\]

This inverse-Stein measure also gives the exact sign functional.  Put

\[
N(u)=\int e^{-u^2x^2}\operatorname{erfi}(ux)\,\mu(dx),
\qquad \mathcal R(u)=\frac{N(u)}{Q_{u^2}}.
\]

Apply (5.28) with
\(h(x)=e^{-u^2x^2}\operatorname{erfi}(ux)\).  The cancellation

\[
e^{-u^2x^2}\frac{d}{dx}\operatorname{erfi}(ux)
=\frac{2u}{\sqrt\pi}
\]

and direct differentiation of \(N/Q\) give

\[
Q_{u^2}^{\,2}\mathcal R'(u)
=\frac{2Q_{u^2}}{\sqrt\pi}
\left(m_1-2u^2M_0(u^2)\right).
\]

Combining this with the distribution-free identity (5.12) proves

\[
\boxed{
\mathbb E[\mathcal K(uR_1,uR_2)]
=2uQ_{u^2}\left(m_1-2u^2M_0(u^2)\right).
}
\tag{5.30}
\]

Thus the averaged-kernel condition is equivalent to
\(2u^2M_0(u^2)\le m_1\).  Equation (5.29) at \(n=0\) says

\[
2u^2M_1(u^2)=m_2-v_{u^2}.
\]

Because \(\zeta_{u^2}\ge0\) is supported on \([1,\kappa]\),
\(M_0\le M_1\).  If \(\mu\ne\delta_1\), then \(v_{u^2}>1\) for every
finite \(u\).  Consequently,

\[
2u^2M_0\le m_2-v_{u^2}<m_2-1.
\]

The degenerate case follows directly from
\(\mathcal K(u,u)=2ue^{-u^2}>0\).  We have therefore proved the
scale-normalized mean-cone theorem

\[
\boxed{
\operatorname{supp}\mu\subset[1,\kappa],\qquad
m_2-1\le m_1
\quad\Longrightarrow\quad
\mathbb E[\mathcal K(uR_1,uR_2)]>0
\quad(u>0).
}
\tag{5.31}
\]

For a general support \([\ell,h]\), the scale-invariant statement is
obtained by applying (5.31) to \(R/\ell\).  By (5.13a), every total-shape-one
finite gamma convolution whose Dirichlet rate mean satisfies this condition
has a GGC square.

For the first two-rate update, write

\[
R=1+dV,\qquad d=\kappa-1,qquad
V\sim\operatorname{Beta}(p,1-p).
\]

The exact moments

\[
m_1=1+pd,
\qquad
m_2=1+2pd+\frac{p(p+1)}2d^2
\]

turn (5.31) into

\[
\boxed{
pd+\frac{p(p+1)}2d^2\le1.
}
\tag{5.32}
\]

Equivalently,

\[
\boxed{
p\le p_*(\kappa)
:=
\frac{\sqrt{(\kappa+1)^2+8}-(\kappa+1)}
     {2(\kappa-1)}.
}
\tag{5.33}
\]

For every \(p<1\), this contains a strict extension beyond
\(\kappa\le\phi_{\rm g}\): at
\(d=\phi_{\rm g}-1\), use \(d+d^2=1\) to bound the left side of
(5.32) by \(p<1\).  At \(p=1/2\), (5.32) becomes
\(3d^2+4d-8\le0\), and hence

\[
\boxed{
\left(G_{1/2}/\kappa+G_{1/2}\right)^2\in GGC
\quad\text{whenever}\quad
\kappa\le\frac{1+2\sqrt7}{3}.
}
\tag{5.34}
\]

There is a stronger first-moment consequence of the same positive measure.
The covariance/chord calculation in (2.69)--(2.73) did not use the arcsine
form of the benchmark law.  For completeness, define

\[
\bar r_t=\frac{\int x e^{-tx^2}\,\mu(dx)}{Q_t},
\qquad
B_t(y)=\int_1^y e^{tx^2}\,dx.
\]

Fubini's theorem, followed by covariance symmetrization, gives for arbitrary
compactly supported \(\mu\), including measures with atoms,

\[
M_0(t)
=\frac1{Q_t}\iint_{x<y}
q_t(x)q_t(y)(y^2-x^2)
\bigl(B_t(y)-B_t(x)\bigr)\,\mu(dx)\mu(dy).
\]

The chord inequality (2.71) is pointwise and therefore yields

\[
\boxed{2tM_0(t)\le2(m_1-\bar r_t).}
\tag{5.34a}
\]

Combining (5.34a) with the exact sign identity (5.30) proves

\[
\boxed{
\bar r_t\ge\frac{m_1}{2}
\quad\Longrightarrow\quad
\mathbb E[\mathcal K(uR_1,uR_2)]>0.
}
\tag{5.34b}
\]

Since \(R\ge1\) implies \(\bar r_t\ge1\), this gives the particularly
simple all-\(u\) cone

\[
\boxed{
m_1\le2
\quad\Longrightarrow\quad
\mathbb E[\mathcal K(uR_1,uR_2)]>0
\quad(u>0).
}
\tag{5.34c}
\]

Here and below the assertion concerns the **fully averaged** kernel.  It
does not assert the false pointwise statement
\(\mathcal K(ur,us)\ge0\) for every pair of rates.  Strictness in
(5.34b)--(5.34c) follows from the strict chord inequality on a set of
positive \(\mu\otimes\mu\) measure when \(\mu\) is nondegenerate; for
\(\mu=\delta_c\), it follows directly from
\(\mathcal K(uc,uc)=2uc\,e^{-u^2c^2}>0\).

After undoing the normalization, the condition is

\[
\boxed{
\mathbb E[R]\le2\ell,
\qquad \ell=\operatorname*{ess\,inf}R.
}
\tag{5.34d}
\]

For the Dirichlet rate mean of a finite gamma convolution with
\(\sum_i\beta_i=1\), one has
\(\ell=\min_i b_i\) and
\(\mathbb E[R]=\sum_i\beta_i b_i\).  Thus the preceding result is the
explicit \(n\)-summand theorem

\[
\boxed{
X=\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i},
\qquad
\sum_i\beta_i=1,
\qquad
\sum_i\beta_i b_i\le2\min_i b_i
\quad\Longrightarrow\quad
X^2\in GGC.
}
\tag{5.34e}
\]

For \(R=1+(\kappa-1)V\) with
\(V\sim\operatorname{Beta}(p,1-p)\), (5.34c) becomes

\[
\boxed{
p(\kappa-1)\le1,
\qquad\text{equivalently}\qquad
\kappa\le1+\frac1p.
}
\tag{5.34f}
\]

This strictly contains the quadratic-moment region (5.32).  In particular,
at \(p=1/2\) it gives \(\kappa\le3\), agreeing with the independently
derived benchmark theorem (2.75) and superseding the intermediate threshold
in (5.34).  The additional frequency splice in WIP-2.12 later reaches
\(\kappa\le7/2\), WIP-2.14 reaches \(4\), and the independent compressed
Faddeeva argument in WIP-5.10 reaches the exact cubic boundary (5.68) for
this symmetric-shape specialization.  The value of retaining (5.31) is
structural: it comes directly from the inverse-Stein moment recurrence and
can be compared with higher moment localizers, whereas (5.34a) uses a
separate chord estimate.

Finally, (5.29) at \(n=1\) supplies a useful all-parameter endpoint
improvement:

\[
M_0+2u^2M_2=m_3-v_{u^2}m_1\le m_3-m_1.
\]

Therefore, when \(\mu\ne\delta_1\) so that \(m_3-m_1>0\),

\[
\boxed{
u^2\le\frac{m_1}{2(m_3-m_1)}
\quad\Longrightarrow\quad
\mathbb E[\mathcal K(uR_1,uR_2)]\ge0.
}
\tag{5.35}
\]

For \(\mu=\delta_1\), the denominator vanishes and the conclusion instead
holds for every \(u>0\) by the diagonal kernel formula.

Since \(m_3\le\kappa^2m_1\), this window always contains
\(u^2\le[2(\kappa^2-1)]^{-1}\), which strictly improves the purely
pointwise small-\(u\) window \(u^2\le(2\kappa^2)^{-1}\).  In the Beta case,

\[
m_3=1+3pd+\frac32p(p+1)d^2
+\frac{p(p+1)(p+2)}6d^3.
\]

The theorem remains a total-shape-one result.  WIP-5.30 later closes every
two-rate square after the total shape changes.  The missing general Route-5
step is now a multirate invariant at total shape greater than one, or a
two-rate invariant for powers \(q\ne2\).

### WIP-5.8 — a Beta--Faddeeva one-dimensional sign reduction

**Status: [PROVED REDUCTION].**

For the same two-rate Beta law, the two-variable average (5.21) can also be
reduced to the monotonicity of one quotient of three real integrals.  Let

\[
w(z)=e^{-z^2}\operatorname{erfc}(-iz).
\]

The Faddeeva integral representation, valid for \(\operatorname{Im}z>0\),
is

\[
w(z)=\frac{i}{\pi}\int_{\mathbb R}\frac{e^{-y^2}}{z-y}\,dy.
\tag{5.36}
\]

For \(R=1+(\kappa-1)V\) and
\(V\sim\operatorname{Beta}(p,1-p)\), Euler's Beta integral gives, with
principal powers,

\[
\mathbb E\!\left[\frac1{zR-y}\right]
=(z-y)^{p-1}(\kappa z-y)^{-p}.
\tag{5.37}
\]

Indeed, factoring out \(z-y\) turns the Beta integral into
\({}_2F_1(1,p;1;-(\kappa-1)z/(z-y))\), and
\({}_2F_1(a,b;a;\zeta)=(1-\zeta)^{-b}\) gives (5.37).

Take the boundary value from the upper half-plane at \(z=u>0\), scale the
integration variable by \(u\), and recall that
\(\mathbb E[w(uR)]=Q(u)+iN(u)\).  With \(t=u^2\), define

\[
\begin{aligned}
A(t)&=\int_{-\infty}^1 e^{-ty^2}
(\kappa-y)^{-p}(1-y)^{p-1}\,dy,\\
B(t)&=\int_1^\kappa e^{-ty^2}
(\kappa-y)^{-p}(y-1)^{p-1}\,dy,\\
C(t)&=\int_\kappa^\infty e^{-ty^2}
(y-\kappa)^{-p}(y-1)^{p-1}\,dy.
\end{aligned}
\tag{5.38}
\]

All three integrals, and their derivatives in \(t>0\), are absolutely
convergent.  To justify the boundary passage, split the real line at
\(1\) and \(\kappa\); on small one-sided neighborhoods the powers
\(|y-1|^{p-1}\) and \(|y-\kappa|^{-p}\) are integrable because
\(0<p<1\), while away from the endpoints ordinary dominated convergence
applies.  On \((1,\kappa)\), the factor
\((1-y+i0)^{p-1}\) contributes \(-e^{i\pi p}\); on
\((\kappa,\infty)\), the product of the two boundary powers contributes
\(-1\).  Thus

\[
\boxed{
Q(u)=\frac{\sin(\pi p)}\pi B(t),
\qquad
N(u)=\frac{A(t)-\cos(\pi p)B(t)-C(t)}\pi.
}
\tag{5.39}
\]

Since the constant and the cosine term disappear on differentiation of
\(N/Q\), the exact target (5.21) is

\[
\boxed{
\frac d{dt}\left(\frac{A(t)-C(t)}{B(t)}\right)\ge0
\qquad(t>0).
}
\tag{5.40}
\]

More precisely, (5.12) gives the normalization

\[
\boxed{
\mathbb E[\mathcal K(uR_1,uR_2)]
=\frac{2t\sin(\pi p)}{\pi^{3/2}}
\left\{B(A'-C')-(A-C)B'\right\}.
}
\tag{5.41}
\]

This reduction also shows exactly why a standard monotone-likelihood-ratio
argument does not close the problem.  After folding the integrals by
\(r=|y|\), write

\[
A(t)-C(t)=\int_0^\infty e^{-tr^2}h(r)\,dr,
\qquad
B(t)=\int_0^\infty e^{-tr^2}b(r)\,dr.
\]

Here \(b\) is positive only on \((1,\kappa)\), while \(h\) is positive on
\((0,\kappa)\) and negative on \((\kappa,\infty)\).  On the common support,

\[
\boxed{
\frac{h(r)}{b(r)}
=g(r)
:=\left(\frac{\kappa-r}{\kappa+r}\right)^p
  \left(\frac{r-1}{r+1}\right)^{1-p},
\qquad 1<r<\kappa.
}
\tag{5.42}
\]

Logarithmic differentiation shows that \(g\) increases and then decreases,
with its unique maximum at

\[
\boxed{
r_*^2=
\frac{(1-p)\kappa^2+p\kappa}{1-p+p\kappa}.
}
\tag{5.43}
\]

Writing \(H=A-C\), Tonelli applied separately to the positive and negative
parts gives the exact expansion

\[
B H'-H B'
=\int_0^\infty\!\int_1^\kappa
e^{-t(r^2+s^2)}h(r)b(s)(s^2-r^2)\,ds\,dr.
\tag{5.44}
\]

In (5.44), the blocks
\(0<r<1\) and \(r>\kappa\) contribute with the desired sign pointwise.
Only the finite interior square \((1,\kappa)^2\), where the likelihood ratio
(5.42) is unimodal rather than monotone, contains an unresolved
cancellation.  In addition, the exact endpoint windows (5.23) already settle
\(t\le1/(2\kappa^2)\) and \(t\ge5/6\).  Thus, for fixed
\((p,\kappa)\), the unresolved sign is localized to a compact
\(t\)-interval and the compact interior \((r,s)\)-square.  This is a sharper
stop condition than the original two-variable kernel inequality, but it is
not by itself a proof of (5.40); WIP-5.11 later resolves the cancellation by
retaining the exact first negative lobe.

### WIP-5.9 — a Faddeeva single-crossing cone

**Status: [PROVED PARTIAL ROUTE-5 THEOREM].**

The exterior pieces in WIP-5.8 can dominate the nonmonotone interior
likelihood ratio in a second explicit parameter region.  Throughout this
entry, \(0<p<1\), \(\kappa>1\), and \(t>0\).  Write

\[
H(t)=A(t)-C(t),
\qquad
\chi(t)=\frac{H(t)}{B(t)},
\]

and extend the density of \(B\) by zero outside \((1,\kappa)\).  Folding at
the origin gives

\[
H(t)=\int_0^\infty e^{-tr^2}h(r)\,dr,
\qquad
B(t)=\int_0^\infty e^{-tr^2}b(r)\,dr,
\tag{5.45}
\]

where

\[
b(r)=
\begin{cases}
(\kappa-r)^{-p}(r-1)^{p-1},&1<r<\kappa,\\
0,&\text{otherwise},
\end{cases}
\tag{5.46}
\]

and

\[
h(r)=
\begin{cases}
(\kappa-r)^{-p}(1-r)^{p-1}
+(\kappa+r)^{-p}(1+r)^{p-1},
&0<r<1,\\[1mm]
(\kappa+r)^{-p}(r+1)^{p-1},
&1<r<\kappa,\\[1mm]
(\kappa+r)^{-p}(r+1)^{p-1}
-(r-\kappa)^{-p}(r-1)^{p-1},
&r>\kappa.
\end{cases}
\tag{5.47}
\]

Thus \(h>0\) on \((0,\kappa)\) and \(h<0\) on
\((\kappa,\infty)\).  The latter sign follows from

\[
\frac{(\kappa+r)^{-p}(r+1)^{p-1}}
     {(r-\kappa)^{-p}(r-1)^{p-1}}
=
\left(\frac{r-\kappa}{r+\kappa}\right)^p
\left(\frac{r-1}{r+1}\right)^{1-p}<1.
\]

On the common support, \(h=bg\), where \(g\) is precisely (5.42).  Put

\[
g_*=\max_{1<r<\kappa}g(r),
\qquad
k_t(r)=h(r)-\chi(t)b(r).
\]

By the definition of \(\chi\),

\[
\int_0^\infty e^{-tr^2}k_t(r)\,dr=0,
\qquad
\chi'(t)
=-\frac1{B(t)}
\int_0^\infty r^2e^{-tr^2}k_t(r)\,dr.
\tag{5.48}
\]

This proves the following single-crossing lemma:

\[
\boxed{
\chi(t)\le0\quad\text{or}\quad\chi(t)\ge g_*
\quad\Longrightarrow\quad
\chi'(t)>0.
}
\tag{5.49}
\]

Indeed, if \(\chi\le0\), then \(k_t>0\) on \((0,\kappa)\) and
\(k_t<0\) on \((\kappa,\infty)\).  Subtracting \(\kappa^2\) times the
zero-mass identity in (5.48) gives

\[
\int_0^\infty(r^2-\kappa^2)e^{-tr^2}k_t(r)\,dr<0.
\]

If \(\chi\ge g_*\), then \(k_t>0\) on \((0,1)\) and
\(k_t\le0\) on \((1,\infty)\); subtracting the same identity with the
constant \(1\) again makes the second integral in (5.48) strictly negative.
The boundary cases are strict as well: \(g>0\) in the open interior, and
when \(\chi=g_*\) the additional interior zero is only the unique maximizer
of \(g\).

There is also an exact quantitative decomposition of the possible failure.
Set

\[
\begin{aligned}
L_t&=\int_0^1e^{-tr^2}h(r)\,dr,\\
U_t&=\int_\kappa^\infty e^{-tr^2}[-h(r)]\,dr,\\
\nu_t(dr)&=B(t)^{-1}e^{-tr^2}b(r)\,dr.
\end{aligned}
\]

Let \(\mu_L,\mu_B,\mu_U\) be the \(r^2\)-means under the normalized
measures in these three displays.  Direct differentiation of
\(\chi=(L_t+B\mathbb E_{\nu_t}g-U_t)/B\) yields

\[
\boxed{
\chi'
=\frac{L_t}{B}(\mu_B-\mu_L)
+\frac{U_t}{B}(\mu_U-\mu_B)
-\operatorname{Cov}_{\nu_t}(g(R),R^2).
}
\tag{5.50}
\]

The first two terms are strictly positive because
\(\mu_L<1<\mu_B<\kappa^2<\mu_U\).  The sole potentially adverse term is the
interior covariance of the unimodal function \(g\).

The maximum \(g_*\) is explicit.  Logarithmic differentiation gives

\[
\frac{g'(r)}{g(r)}
=
\frac{2(1-p)}{r^2-1}
-\frac{2p\kappa}{\kappa^2-r^2}
=
\frac{2(1-p+p\kappa)(r_*^2-r^2)}
{(r^2-1)(\kappa^2-r^2)},
\]

where

\[
r_*^2=
\frac{(1-p)\kappa^2+p\kappa}{1-p+p\kappa},
\qquad
g_*=g(r_*).
\tag{5.51}
\]

Moreover, write \(\kappa=e^K\) and \(r=e^x\).  Then

\[
g(e^x)
=
\tanh^p\!\left(\frac{K-x}{2}\right)
\tanh^{1-p}\!\left(\frac{x}{2}\right).
\]

Since \(\tanh z<z\) for \(z>0\), maximizing the resulting weighted product
at \(x=(1-p)K\) gives

\[
\boxed{
g_*<
\frac{\log\kappa}{2}\,p^p(1-p)^{1-p}.
}
\tag{5.52}
\]

Finally, (5.39) gives

\[
\chi(t)
=\cos(\pi p)
+\sin(\pi p)\frac{N(\sqrt t)}{Q(\sqrt t)}
>\cos(\pi p),
\tag{5.53}
\]

because \(Q>0\) and
\(N(\sqrt t)=\mathbb E[e^{-tR^2}\operatorname{erfi}(\sqrt tR)]>0\).
Combining (5.49) and (5.53) proves

\[
\boxed{
0<p<\frac12,\qquad
g_*(p,\kappa)\le\cos(\pi p)
\quad\Longrightarrow\quad
\left(G_p/\kappa+G_{1-p}\right)^2\in GGC.
}
\tag{5.54}
\]

A simpler fully explicit sufficient region is

\[
\boxed{
0<p<\frac12,\qquad
\log\kappa\le
\frac{2\cos(\pi p)}{p^p(1-p)^{1-p}}
\quad\Longrightarrow\quad
\left(G_p/\kappa+G_{1-p}\right)^2\in GGC.
}
\tag{5.55}
\]

This certificate is genuinely complementary to the tilted-mean cone
(5.34f).  For example, take \(p=1/4\) and \(\kappa=e^2\).  The right side
of (5.55) is

\[
\frac{4\sqrt2}{3^{3/4}}>2=\log\kappa,
\]

where the strict inequality follows on taking fourth powers from
\(64>27\).  In contrast, (5.34f) would require \(e^2\le5\), whereas the
positive exponential series gives \(e^2>1+2+2=5\).

The remaining single-crossing gap is exact.  If
\(0<\chi(t)<g_*\), the sign pattern of \(k_t\) is
\(+,-,+,-\), because the equation \(g(r)=\chi(t)\) has two interior roots.
Neither case in (5.49) alone applies.  WIP-5.10 resolves this four-block
case on a substantially larger explicit parameter cone by compressing the
first positive block onto the first negative block, and WIP-5.11 then
replaces that compression by an exact true-lobe comparison valid for every
\((p,\kappa)\).

### WIP-5.10 — compressed Faddeeva pairing and a uniform cone through
\(\kappa=10\)

**Status: [PROVED PARTIAL ROUTE-5 THEOREM; EXACT RATIONAL
BERNSTEIN-BASIS CERTIFICATE].**

Continue with the notation of WIP-5.9.  It remains only to consider

\[
0<\chi(t)<g_*.
\]

Let the two roots of \(g(r)=\chi(t)\) be

\[
1<\rho_-<r_*<\rho_+<\kappa.
\]

The signed density

\[
d\omega_t(r)=e^{-tr^2}k_t(r)\,dr
\]

has signs \(+,-,+,-\) on the four successive intervals.  Define their
positive masses by

\[
\begin{aligned}
P_0&=\int_0^1d\omega_t,
&
N_1&=-\int_1^{\rho_-}d\omega_t,\\
P_2&=\int_{\rho_-}^{\rho_+}d\omega_t,
&
N_3&=-\int_{\rho_+}^{\infty}d\omega_t.
\end{aligned}
\tag{5.56}
\]

The zero-mass identity (5.48) says

\[
P_0+P_2=N_1+N_3.
\]

First observe the following general four-block implication:

\[
\boxed{P_0>N_1\quad\Longrightarrow\quad\chi'(t)>0.}
\tag{5.57}
\]

Indeed, put \(\delta=P_0-N_1=N_3-P_2>0\).  For

\[
J_t=\int_0^\infty r^2e^{-tr^2}k_t(r)\,dr,
\]

the locations of the four supports give the strict estimates

\[
\int_{(0,1)\cup(1,\rho_-)}r^2\,d\omega_t
<P_0-N_1=\delta
\]

and

\[
\int_{(\rho_-,\rho_+)\cup(\rho_+,\infty)}r^2\,d\omega_t
<\rho_+^2(P_2-N_3)=-\rho_+^2\delta.
\]

Thus

\[
J_t<(1-\rho_+^2)\delta<0,
\]

and (5.48) proves (5.57).

We now establish \(P_0>N_1\) by a compression pairing.  Put

\[
\Delta=\rho_--1,\qquad d=\kappa-1.
\]

Map the whole first negative block

\[
s=1+x,\quad 0<x<\Delta,
\]

onto the exterior positive interval by

\[
r=1-\frac{x}{\Delta}\in(0,1).
\]

Retain only the first positive summand

\[
h_0(r)=(\kappa-r)^{-p}(1-r)^{p-1}
\]

of \(h(r)\) in (5.47).  Including the Jacobian \(dr= -dx/\Delta\),
its transformed density is exactly

\[
h_0\!\left(1-\frac{x}{\Delta}\right)\frac{dx}{\Delta}
=
x^{p-1}\bigl(\Delta d+x\bigr)^{-p}\,dx.
\tag{5.58}
\]

On the other hand,

\[
b(1+x)=x^{p-1}(d-x)^{-p}.
\]

The ratio of the density in (5.58) to \(b(1+x)\) is

\[
E_\Delta(x)=
\left(\frac{d-x}{\Delta d+x}\right)^p,
\tag{5.59}
\]

which is strictly decreasing.  At the right endpoint, the root identity
\(\chi=g(\rho_-)\) gives

\[
\frac{E_\Delta(\Delta)}{\chi}
=
\frac{(\kappa+\rho_-)^p(\rho_-+1)^{1-p}}
{\kappa^p(\rho_--1)}
=:\mathcal F_{\kappa,p}(\rho_-),
\]

where, for \(1<a<\kappa\),

\[
\mathcal F_{\kappa,p}(a)
=
\frac{(\kappa+a)^p(a+1)^{1-p}}
{\kappa^p(a-1)}.
\tag{5.60}
\]

If \(\mathcal F_{\kappa,p}(\rho_-)\ge1\), then
\(E_\Delta(x)>\chi\) for \(0<x<\Delta\).  Since
\(r<1<s\), one also has \(e^{-tr^2}>e^{-ts^2}\).  Pointwise in \(x\),

\[
\begin{aligned}
&e^{-t(1-x/\Delta)^2}
x^{p-1}(\Delta d+x)^{-p}\\
&\quad>
e^{-t(1+x)^2}\chi x^{p-1}(d-x)^{-p}\\
&\quad>
e^{-t(1+x)^2}b(1+x)
\bigl(\chi-g(1+x)\bigr).
\end{aligned}
\tag{5.61}
\]

The last line is precisely the absolute density of the first negative
block.  Integrating (5.61), and recalling that \(P_0\) contains also the
second positive summand of \(h\), proves \(P_0>N_1\).

The function in (5.60) is strictly decreasing in \(a\), because

\[
\begin{aligned}
\partial_a\log\mathcal F_{\kappa,p}(a)
&=
\frac p{\kappa+a}+\frac{1-p}{a+1}-\frac1{a-1}\\
&<
\frac1{a+1}-\frac1{a-1}<0.
\end{aligned}
\tag{5.62}
\]

Since \(\rho_-<r_*\), equations (5.57)--(5.62), together with the two
outer cases (5.49), prove the all-\(t\) cone

\[
\boxed{
\mathcal F_{\kappa,p}(r_*)\ge1
\quad\Longrightarrow\quad
\chi'(t)>0\quad(t>0)
\quad\Longrightarrow\quad
\left(G_p/\kappa+G_{1-p}\right)^2\in GGC.
}
\tag{5.63}
\]

The endpoints \(\chi=0\) and \(\chi=g_*\) are already strict in WIP-5.9,
so no limiting \(t\)-case is omitted.

A first elementary subcone follows from \(r_*\le2\).  Indeed, every factor
in \(\mathcal F_{\kappa,p}(2)\) is greater than one, and (5.62) gives
\(\mathcal F_{\kappa,p}(r_*)>1\).  By (5.51),

\[
r_*\le2
\quad\Longleftrightarrow\quad
(1-p)(\kappa^2-4)\le3p\kappa.
\tag{5.64}
\]

For \(\kappa>2\), this is equivalently

\[
p\ge\frac{\kappa^2-4}{\kappa^2+3\kappa-4},
\]

or

\[
\kappa\le
\frac{3p+\sqrt{9p^2+16(1-p)^2}}{2(1-p)}.
\]

There is a much stronger uniform analytic consequence.  Solving the
stationary-point relation (5.51) for the weights gives

\[
p=
\frac{\kappa^2-r_*^2}
{(\kappa-1)(r_*^2+\kappa)},
\qquad
1-p=
\frac{\kappa(r_*^2-1)}
{(\kappa-1)(r_*^2+\kappa)}.
\tag{5.65}
\]

Set

\[
A=\frac{\kappa+r_*}{\kappa},
\qquad
B=r_*+1.
\]

Then

\[
\frac pA+\frac{1-p}{B}
=\frac{\kappa}{r_*^2+\kappa}.
\]

The weighted geometric-mean/harmonic-mean inequality therefore yields

\[
A^pB^{1-p}
\ge
\left(\frac pA+\frac{1-p}{B}\right)^{-1}
=1+\frac{r_*^2}{\kappa},
\]

and hence

\[
\boxed{
\mathcal F_{\kappa,p}(r_*)
\ge
\frac{1+r_*^2/\kappa}{r_*-1}.
}
\tag{5.66}
\]

The right side is at least one whenever

\[
r_*^2-\kappa r_*+2\kappa\ge0.
\]

For \(\kappa\le8\), the quadratic in \(r_*\) has discriminant
\(\kappa(\kappa-8)\le0\).  At the only possible equality
\((\kappa,r_*)=(8,4)\), the weighted GM--HM inequality is itself strict,
since \(A\ne B\) and \(0<p<1\).  Thus (5.63) proves, entirely
analytically,

\[
\boxed{
0<p<1,\qquad 1<\kappa\le8
\quad\Longrightarrow\quad
\left(G_p/\kappa+G_{1-p}\right)^2\in GGC.
}
\tag{5.67}
\]

For the symmetric benchmark \(p=1/2\), the exact cone (5.63) is larger
still.  Here \(r_*=\sqrt\kappa=:s\), and

\[
\mathcal F_{\kappa,1/2}(r_*)
=\frac{s+1}{\sqrt s\,(s-1)}.
\]

Since both sides are positive,

\[
\mathcal F_{\kappa,1/2}(r_*)\ge1
\quad\Longleftrightarrow\quad
s^3-3s^2-s-1\le0.
\tag{5.68}
\]

Let

\[
s_0=
1+
\sqrt[3]{2+\sqrt{44/27}}
+
\sqrt[3]{2-\sqrt{44/27}},
\tag{5.69}
\]

the unique root greater than one of \(s^3-3s^2-s-1\).  Then

\[
\boxed{
p=\frac12,\qquad
\kappa\le s_0^2
\quad\Longrightarrow\quad
\left(G_{1/2}/\kappa+G_{1/2}\right)^2\in GGC.
}
\tag{5.70}
\]

Finally, a finite exact polynomial certificate improves the uniform
constant \(8\) to \(10\).  This is a Bernstein-basis polynomial
positivity certificate, not an appeal to the theory of Bernstein
functions.

Fix \(\kappa=10\) and parameterize the stationary point by
\(a=r_*\in(1,10)\).  With \(q=1-p\), equation (5.65) becomes

\[
p=\frac{100-a^2}{9(a^2+10)},
\qquad
q=\frac{10(a^2-1)}{9(a^2+10)}.
\tag{5.71}
\]

For

\[
x=\frac{10(a+1)}{10+a},
\qquad
y=1-\frac1x=\frac{9a}{10(a+1)},
\]

the ratio of the weighted geometric mean \(A^pB^q\) to the weighted
harmonic mean \(H=(a^2+10)/10\) has the positive expansion

\[
\begin{aligned}
\frac{A^pB^q}{H}
&=x^q\left(p+\frac qx\right)
=(1-y)^{-q}(1-qy)\\
&=
1+\sum_{n=2}^\infty
\frac{p(n-1)(q)_{n-1}}{n!}y^n,
\end{aligned}
\tag{5.72}
\]

where \((q)_m=q(q+1)\cdots(q+m-1)\).  All omitted terms are strictly
positive.  Define the fifth-order lower truncation \(S_5\) of (5.72) and

\[
C(a)=(a^2+10)S_5-10(a-1).
\tag{5.73}
\]

Thus

\[
C(a)>0
\Longrightarrow
A^pB^q>HS_5>a-1
\Longrightarrow
\mathcal F_{10,p}(a)>1.
\tag{5.74}
\]

Direct rational simplification gives

\[
C(a)=
\frac{P(a)}{(a^2+10)^4(a+1)^5},
\tag{5.75}
\]

where the degree-\(15\) power-basis coefficient vector of \(P\) is

\[
\begin{aligned}
(&200000,900000,1585000,4177000/3,2092550/3,826894/3,\\
&1167379/12,2409571/300,-277541/240,2207843/6000,\\
&-3974833/2400,24698557/60000,-1971667/12000,\\
&11717699/300000,-32059/6000,113183/150000).
\end{aligned}
\tag{5.76}
\]

The power-basis coefficients are not all positive.  Convert \(P\) instead
to the degree-\(15\) Bernstein basis separately on
\([1,4]\), \([4,7]\), and \([7,10]\).  All \(16\) coefficients on each
interval are strictly positive; their exact respective minima are

\[
5153632,\qquad
\frac{225158158912}{625},\qquad
\frac{5774529486941441}{3125}.
\tag{5.77}
\]

Since every Bernstein basis polynomial is nonnegative on its defining
interval, (5.77) proves \(P(a)>0\) on \([1,10]\), and hence (5.74).
The script
[route5_beta_faddeeva_kappa10_bernstein.py](computations/route5_beta_faddeeva_kappa10_bernstein.py)
constructs \(S_5\) directly from the rational functions in (5.71)--(5.73),
cross-multiplies to verify every coefficient in (5.76), performs the
three exact basis conversions, and checks (5.77), using only
fractions.Fraction arithmetic.

It remains to propagate the endpoint certificate from \(\kappa=10\) to
smaller contrasts.  For fixed \(p\),

\[
\frac{\partial r_*^2}{\partial\kappa}
=
\frac{(1-p)\bigl(2(1-p)\kappa+p+p\kappa^2\bigr)}
{(1-p+p\kappa)^2}>0,
\tag{5.78}
\]

while, at fixed \(a\),

\[
\partial_\kappa\log\mathcal F_{\kappa,p}(a)
=-\frac{pa}{\kappa(\kappa+a)}<0.
\tag{5.79}
\]

Together with (5.62), these show that
\(\mathcal F_{\kappa,p}(r_*(p,\kappa))\) is strictly decreasing in
\(\kappa\).  Equations (5.63), (5.71)--(5.79) therefore prove the uniform
two-rate theorem

\[
\boxed{
0<p<1,\qquad 1<\kappa\le10
\quad\Longrightarrow\quad
\left(G_p/\kappa+G_{1-p}\right)^2\in GGC.
}
\tag{5.80}
\]

The current explicit parameter region is at least the union

\[
\boxed{
\mathcal F_{\kappa,p}(r_*)\ge1
\quad\text{or}\quad
p(\kappa-1)\le1.
}
\tag{5.81}
\]

The second condition is the independent tilted-mean cone (5.34f), and is
still stronger for sufficiently small \(p\) at large \(\kappa\).  Beyond
this union, the coarser pointwise compression used in this entry gives no
answer.  WIP-5.11 below uses the true first-negative-lobe density and
removes the parameter restriction completely.

### WIP-5.11 — exact true-lobe comparison closes the two-rate,
total-shape-one case

**Status: [PROVED ROUTE-5 THEOREM FOR ALL COMPLEMENTARY SHAPES AND ALL
RATE CONTRASTS].**

Continue with (5.45)--(5.49).  The cases
\(\chi(t)\le0\) and \(\chi(t)\ge g_*\), including equality, are already
strict by (5.49).  Fix \(t>0\) in the only remaining case

\[
0<\chi(t)<g_*.
\]

Let \(a=\rho_-(t)\) be the lower root of \(g(r)=\chi(t)\), so
\(1<a<r_*\).  Although \(a\) and \(\chi\) depend on \(t\), all
comparisons below are made with this \(t\), \(a\), and \(\chi\) fixed; no
derivative of a root is taken.

Define the corresponding masses after removing only the exponential
weight:

\[
\widehat P_0=\int_0^1h(r)\,dr,
\qquad
\widehat N_1=\int_1^a b(s)\bigl(\chi-g(s)\bigr)\,ds.
\tag{5.82}
\]

On their respective supports \(0<r<1<s<a\).  Since both unweighted
densities are strictly positive on open intervals,

\[
P_0(t)>e^{-t}\widehat P_0,
\qquad
N_1(t)<e^{-t}\widehat N_1.
\tag{5.83}
\]

Thus it is enough to prove
\(\widehat P_0>\widehat N_1\).

Put

\[
h_0(r)=(\kappa-r)^{-p}(1-r)^{p-1},
\qquad
h_1(r)=(\kappa+r)^{-p}(r+1)^{p-1}.
\]

On \((0,1)\), \(h=h_0+h_1\); on \((1,\kappa)\), one has
\(h=bg=h_1\).  Therefore

\[
\widehat P_0-\widehat N_1
=
\int_0^1h_0(r)\,dr
+\int_0^a h_1(r)\,dr
-\chi\int_1^a b(s)\,ds.
\tag{5.84}
\]

Three Möbius substitutions put the terms in common coordinates.  First,
\(x=(1-r)/(\kappa-r)\) gives

\[
\int_0^1h_0(r)\,dr
=
\int_0^{1/\kappa}\frac{x^{p-1}}{1-x}\,dx.
\]

Second, \(z=(r+1)/(\kappa+r)\) gives, with

\[
z_a=\frac{a+1}{\kappa+a},
\]

the adjoining interval

\[
\int_0^a h_1(r)\,dr
=
\int_{1/\kappa}^{z_a}\frac{z^{p-1}}{1-z}\,dz.
\]

Third, \(v=(s-1)/(\kappa-s)\) gives, with

\[
v_a=\frac{a-1}{\kappa-a},
\]

\[
\int_1^a b(s)\,ds
=
\int_0^{v_a}\frac{v^{p-1}}{1+v}\,dv.
\tag{5.85}
\]

All endpoints stay away from the poles, and \(p\in(0,1)\) makes the
origin singularities integrable.  The first two integrals in (5.84)
therefore concatenate exactly:

\[
\int_0^1h_0(r)\,dr+\int_0^a h_1(r)\,dr
=
\int_0^{z_a}\frac{z^{p-1}}{1-z}\,dz.
\]

Let \(q=1-p\) and \(\lambda=\chi^{1/p}>0\).  Since
\(\chi=g(a)\),

\[
\lambda
=
\frac{\kappa-a}{\kappa+a}
\left(\frac{a-1}{a+1}\right)^{q/p}.
\tag{5.86}
\]

In the final integral of (5.85), substitute \(z=\lambda v\).  Since
\(\chi\lambda^{-p}=1\),

\[
\chi\int_0^{v_a}\frac{v^{p-1}}{1+v}\,dv
=
\int_0^{w_a}\frac{z^{p-1}}{1+z/\lambda}\,dz,
\qquad
w_a=\lambda v_a.
\tag{5.87}
\]

The endpoint ratio simplifies without an estimate:

\[
\boxed{
\frac{w_a}{z_a}
=
\left(\frac{a-1}{a+1}\right)^{1/p}<1.
}
\tag{5.88}
\]

Hence \(0<w_a<z_a<1\).  Moreover, for \(0<z<w_a\),

\[
\frac1{1+z/\lambda}<\frac1{1-z}.
\]

Substitution in (5.84) now gives the manifestly positive decomposition

\[
\begin{aligned}
\widehat P_0-\widehat N_1
={}&
\int_0^{w_a}z^{p-1}
\left(
\frac1{1-z}-\frac1{1+z/\lambda}
\right)\,dz\\
&+
\int_{w_a}^{z_a}\frac{z^{p-1}}{1-z}\,dz
>0.
\end{aligned}
\tag{5.89}
\]

Equations (5.83) and (5.89) prove \(P_0(t)>N_1(t)\).  The general
four-block implication (5.57) therefore yields \(\chi'(t)>0\) throughout
the interior case.  Combining this with (5.49) proves

\[
\boxed{
\chi'(t)>0
\qquad
(t>0,\ 0<p<1,\ \kappa>1).
}
\tag{5.90}
\]

Finally, (5.40)--(5.41), the averaged-kernel equivalence (5.13a), and the
phase criterion give the complete two-rate theorem

\[
\boxed{
\left(G_p/\kappa+G_{1-p}\right)^2\in GGC
\qquad
(0<p<1,\ \kappa>1).
}
\tag{5.91}
\]

Scaling and relabeling the rates gives the invariant form

\[
\boxed{
\left(\frac{G_p}{b_1}+\frac{G_{1-p}}{b_2}\right)^2\in GGC
\qquad
(0<p<1,\ b_1,b_2>0).
}
\tag{5.92}
\]

This settles the entire two-rate, total-shape-one square problem, including
the half-shape benchmark at arbitrary rate contrast.  At this stage it did
not yet supply an invariant under a further shape-changing or third-rate
update.  WIP-5.26 subsequently closes the finite third-rate and multirate
updates at total shape one, WIP-5.29 propagates that theorem to smaller
total shape, and WIP-5.30 closes all two-rate squares; Bondesson's full
power conjecture remains open.

### WIP-5.12 — multirate first-cut pairing and exact extension
obstructions

**Status: [PROVED CONDITIONAL EXTENSION AND PROVED STRUCTURAL
OBSTRUCTIONS; NOT A COUNTEREXAMPLE].**

The true-lobe comparison in WIP-5.11 has a precise multirate analogue on
the first spectral cut, but the support nesting which closed the two-rate
proof is no longer automatic.  Normalize the smallest rate to one and let

\[
1=b_1<b_2<\cdots<b_n,
\qquad
\beta_i>0,
\qquad
\sum_{i=1}^n\beta_i=1.
\tag{5.93}
\]

Put \(\alpha=\beta_1\) and \(p=1-\alpha\).  The two reflected densities
and the direct density on the first cut are

\[
\begin{aligned}
h_0(r)&=\prod_{i=1}^n(b_i-r)^{-\beta_i},&&0<r<1,\\
h_1(r)&=\prod_{i=1}^n(b_i+r)^{-\beta_i},&&r>0,\\
b(r)&=(r-1)^{-\beta_1}
       \prod_{i=2}^n(b_i-r)^{-\beta_i},&&1<r<b_2.
\end{aligned}
\tag{5.94}
\]

Their first-cut likelihood ratio is

\[
G_1(r):=\frac{h_1(r)}{b(r)}
=
\left(\frac{r-1}{r+1}\right)^{\beta_1}
\prod_{i=2}^n
\left(\frac{b_i-r}{b_i+r}\right)^{\beta_i}.
\tag{5.95}
\]

Direct differentiation gives

\[
(\log G_1)''(r)
=-4r\left{
\frac{\beta_1}{(r^2-1)^2}
+\sum_{i=2}^n\frac{\beta_i b_i}{(b_i^2-r^2)^2}
\right}<0.
\tag{5.96}
\]

Since \(G_1\) tends to zero at both ends of \((1,b_2)\), it has a unique
maximizer.  Choose \(a\) on its rising branch and put
\(\chi=G_1(a)\).  Define the unweighted first positive and negative lobes

\[
\widehat P_0=\int_0^1(h_0+h_1)(r)\,dr,
\qquad
\widehat N_1=\int_1^a\bigl(\chi b-h_1\bigr)(s)\,ds.
\tag{5.97}
\]

The second integrand is strictly positive on \((1,a)\), because
\(h_1=bG_1\) and strict increase of \(G_1\) there gives
\(G_1(s)<G_1(a)=\chi\).

For \(i\ge3\), set

\[
\lambda_i=\frac{b_i-b_2}{b_i-1}\in(0,1),
\qquad
C=(b_2-1)^{p-\beta_2}
  \prod_{i=3}^n(b_i-1)^{-\beta_i}>0.
\tag{5.98}
\]

The three substitutions

\[
x=\frac{1-r}{b_2-r},
\qquad
z=\frac{r+1}{b_2+r},
\qquad
v=\frac{s-1}{b_2-s}
\]

respectively transform the \(h_0\), \(h_1\), and \(b\) integrals.  The
first two transformed intervals meet at \(1/b_2\), and hence concatenate.
Writing

\[
z_a=\frac{a+1}{b_2+a},
\qquad
v_a=\frac{a-1}{b_2-a},
\]

gives the exact identity

\[
\begin{aligned}
\widehat P_0-\widehat N_1
=C\Bigg[&
\int_0^{z_a}\frac{z^{p-1}}{1-z}
 \prod_{i=3}^n(1-\lambda_i z)^{-\beta_i}\,dz\\
&-\chi\int_0^{v_a}\frac{v^{p-1}}{1+v}
 \prod_{i=3}^n(1+\lambda_i v)^{-\beta_i}\,dv
\Bigg].
\end{aligned}
\tag{5.99}
\]

All factors are positive; the lower-endpoint singularities
\(z^{p-1}\) and \(v^{p-1}\) are integrable because \(p>0\).  Let

\[
\Lambda=\chi^{1/p},
\qquad
w_a=\Lambda v_a.
\]

After \(z=\Lambda v\), the kernel in the second integral of (5.99) is

\[
\frac{z^{p-1}}{1+z/\Lambda}
\prod_{i=3}^n
\left(1+\frac{\lambda_i z}{\Lambda}\right)^{-\beta_i}.
\tag{5.100}
\]

On every positive point of the common support this is strictly smaller
than the first kernel in (5.99): each denominator factor of the first
kernel is smaller than its counterpart in (5.100), since
\(z<z_a<1\), \(\Lambda>0\), and \(0<\lambda_i<1\).  We have therefore
proved the conditional multirate lobe lemma

\[
\boxed{
w_a\le z_a
\quad\Longrightarrow\quad
\widehat P_0>\widehat N_1.
}
\tag{5.101}
\]

If the exponential weight is restored, define

\[
P_0(t)=\int_0^1e^{-tr^2}(h_0+h_1)(r)\,dr,
\qquad
N_1(t)=\int_1^ae^{-ts^2}(\chi b-h_1)(s)\,ds.
\]

Separation of the supports at one gives

\[
P_0(t)>e^{-t}\widehat P_0,
\qquad
N_1(t)<e^{-t}\widehat N_1.
\]

Thus the condition in (5.101) also implies \(P_0(t)>N_1(t)\) for every
\(t>0\).  The exact support ratio is

\[
\boxed{
\frac{w_a}{z_a}
=
\left(\frac{a-1}{a+1}\right)^{1/p}
\prod_{i=3}^n
\left[
\frac{(b_2+a)(b_i-a)}
     {(b_2-a)(b_i+a)}
\right]^{\beta_i/p}.
}
\tag{5.102}
\]

For \(n=2\), the product is empty, so (5.102) is strictly smaller than
one.  This recovers exactly the automatic support nesting behind
WIP-5.11.  For three rates it can fail even on the rising branch.  Take

\[
(b_1,b_2,b_3)=(1,4,100),
\qquad
(\beta_1,\beta_2,\beta_3)
=\left(\frac12,\frac1{100},\frac{49}{100}\right),
\qquad a=3.
\tag{5.103}
\]

Here

\[
(\log G_1)'(3)
=\frac18-\frac2{175}-\frac{98}{9991}
=\frac{1451369}{13987400}>0,
\]

so \(a\) is strictly on the rising branch, whereas

\[
\frac{w_a}{z_a}
=\frac14\left(\frac{679}{103}\right)^{49/50}>1.
\tag{5.104}
\]

Indeed, \(679/103>6\) and
\(6^{49}/4^{50}=(3/2)^{49}/4>(3/2)^4/4=81/64\).
This is an exact obstruction to automatic support inclusion, not an
inequality in the opposite direction for the two lobe masses.

There is a second obstruction to the common-scalar proof.  Let
\(R=\sum_i b_iQ_i\), with
\(Q\sim\operatorname{Dir}(\beta_1,\ldots,\beta_n)\).  Since the total
shape is one, the Markov--Krein identity, with principal powers and
\(\operatorname{Im}\zeta>0\), reads

\[
\mathbb E\frac1{\zeta R-y}
=\prod_{i=1}^n(\zeta b_i-y)^{-\beta_i}.
\tag{5.105}
\]

Put \(A_j=\sum_{i=1}^j\beta_i\), fix \(u>0\), and let
\(\zeta\to u+i0\).  For \(y\) on the cut
\(I_j(u)=(ub_j,ub_{j+1})\), the first \(j\) factors approach the negative
axis with argument \(+\pi\).  The product in (5.105) therefore has phase
\(-\pi A_j\).  After the leading factor \(i\) in the Faddeeva
representation, a boundary modulus \(m_j\) contributes

\[
Q:\ \sin(\pi A_j)m_j,
\qquad
N:\ \cos(\pi A_j)m_j.
\tag{5.106}
\]

Thus its local likelihood-ratio baseline is \(\cot(\pi A_j)\).  For
\(n\ge3\), the numbers \(A_1<\cdots<A_{n-1}\) lie strictly between zero
and one, and \(\cot\) is strictly decreasing on \((0,\pi)\).  Consequently
there is no single scalar \(c\) for which

\[
\cos(\pi A_j)-c\sin(\pi A_j)=0
\]

on every cut.  A common scalar affine centering of \(N/Q\) can eliminate
at most one direct-cut term.  This does not rule out a cut-dependent,
vector, or matrix centering.

Each individual reflected ratio still has the one-peak property.  Namely,

\[
G_j(r)=
\prod_{i\le j}
\left(\frac{r-b_i}{r+b_i}\right)^{\beta_i}
\prod_{i>j}
\left(\frac{b_i-r}{b_i+r}\right)^{\beta_i},
\]

and throughout \(b_j<r<b_{j+1}\),

\[
(\log G_j)''(r)
=-4r\sum_{i=1}^n
\frac{\beta_i b_i}{(r^2-b_i^2)^2}<0.
\tag{5.107}
\]

The differing baselines in (5.106), however, prevent these local
single-crossing statements from automatically assembling, under the
preceding common-scalar argument, into the uniform four-block sign pattern
of WIP-5.9.  Other weighted or vector-valued constructions remain open.

Finally, Dirichlet aggregation does not by itself bypass the multicut
problem.  It gives

\[
R=Ub_n+(1-U)S,
\tag{5.108}
\]

where \(U\sim\operatorname{Beta}(\beta_n,1-\beta_n)\), \(U\perp S\),
and, conditionally on \(S=s\), the right side is a two-rate Beta mean.
For finite measures \(\lambda,\sigma\) define

\[
\mathcal I_u(\lambda,\sigma)
=\iint\mathcal K(ur,us)\,\lambda(dr)\sigma(ds),
\qquad
\mathcal I_u(\lambda)=\mathcal I_u(\lambda,\lambda).
\]

Let \(\nu=\operatorname{Law}(S)\) and
\(\mu_s=\operatorname{Law}(Ub_n+(1-U)s)\), so that
\(\mu=\int\mu_s\,\nu(ds)\).  The Route-2 quadratic functional expands as

\[
\mathcal I_u(\mu)
=\iint\mathcal I_u(\mu_s,\mu_{s'})\,\nu(ds)\nu(ds').
\tag{5.109}
\]

The two-rate theorem controls only the diagonal terms.  The off-diagonal
terms cannot be supplied by a generic positive-definite-kernel argument:
the continuous extension of (5.11) satisfies

\[
\mathcal K(0,0)=0,
\qquad
\mathcal K(1,0)<0,
\]

so its two-point Gram determinant is

\[
\det
\begin{pmatrix}
\mathcal K(0,0)&\mathcal K(0,1)\\
\mathcal K(1,0)&\mathcal K(1,1)
\end{pmatrix}
=-\mathcal K(1,0)^2<0.
\tag{5.110}
\]

Continuity gives the same conclusion with the zero point replaced by a
sufficiently small positive point.  Hence a PSD/Cauchy--Schwarz mixture
shortcut is impossible, although a Dirichlet-specific off-diagonal
estimate remains viable.  The next multirate proof must therefore replace
at least one of the two-rate mechanisms: automatic lobe-support nesting or
a single globally centered scalar likelihood ratio.  None of these
obstructions is a counterexample to GGC membership.  WIP-5.14 below shows
that a dynamically weighted phase center does remove the second obstruction
at derivative level and turns it into a favorable term.

### WIP-5.13 — an algebraic first-cut lobe cone strictly beyond support
nesting

**Status: [PROVED SUFFICIENT CONDITION AND EXACT THREE-RATE
CERTIFICATE].**

Assume \(n\ge3\) throughout this entry; the case \(n=2\) is already
settled by WIP-5.11.

The failure of \(w_a\le z_a\) in (5.104) does not make the first negative
lobe larger than the first positive lobe.  In fact, the comparison in
WIP-5.12 admits a strictly wider sufficient condition.  Remove the common
constant \(C\) from (5.99) and write

\[
\begin{aligned}
L&=\int_0^{z_a}\frac{z^{p-1}}{1-z}
 \prod_{i=3}^n(1-\lambda_i z)^{-\beta_i}\,dz,\\
R&=\chi\int_0^{v_a}\frac{v^{p-1}}{1+v}
 \prod_{i=3}^n(1+\lambda_i v)^{-\beta_i}\,dv.
\end{aligned}
\tag{5.111}
\]

All omitted positive-kernel factors exceed one, whereas all omitted
negative-kernel factors are at most one.  Hence

\[
L>\frac{z_a^p}{p},
\qquad
R\le\chi J_p(v_a),
\qquad
J_p(v):=\int_0^v\frac{x^{p-1}}{1+x}\,dx.
\tag{5.112}
\]

The first inequality is strict because \((1-z)^{-1}>1\) on a set of
positive measure.  Thus the integral condition

\[
\boxed{
\frac{z_a^p}{p}\ge\chi J_p(v_a)
\quad\Longrightarrow\quad
\widehat P_0>\widehat N_1
}
\tag{5.113}
\]

already extends (5.101).  It also has a purely algebraic sufficient form.
The function \(x\mapsto(1+x)^{-1}\) is strictly convex, so on \([0,v]\)
it lies below its endpoint chord:

\[
\frac1{1+x}\le1-\frac{x}{1+v}.
\]

Multiplication by \(x^{p-1}\) and integration give

\[
J_p(v)
\le
\frac{v^p}{p}-\frac{v^{p+1}}{(p+1)(1+v)}
=\frac{v^p}{p}
  \frac{p+1+v}{(p+1)(1+v)}.
\tag{5.114}
\]

Since \(\chi v_a^p=w_a^p\), equations (5.112)--(5.114) prove

\[
\boxed{
\left(\frac{w_a}{z_a}\right)^p
\le
\frac{(p+1)(1+v_a)}{p+1+v_a}
\quad\Longrightarrow\quad
\widehat P_0>\widehat N_1.
}
\tag{5.115}
\]

The right side of (5.115) is strictly larger than one, because its
numerator minus its denominator is \(pv_a>0\).  Thus (5.115) genuinely
contains cases in which the support nesting \(w_a\le z_a\) fails.

For the exact three-rate parameters in (5.103), one has

\[
p=\frac12,
\qquad
v_a=2,
\qquad
\left(\frac{w_a}{z_a}\right)^p
=\frac12\left(\frac{679}{103}\right)^{49/100}.
\]

Since \(679/103>1\), \(49/100<1/2\), and

\[
\frac{679}{103}<\frac{324}{49}
\quad\Longleftrightarrow\quad
33271<33372,
\]

we obtain the exact chain

\[
\left(\frac{w_a}{z_a}\right)^p
<\frac12\sqrt{\frac{679}{103}}
<\frac97
=\frac{(p+1)(1+v_a)}{p+1+v_a}.
\tag{5.116}
\]

Therefore (5.115) proves
\(\widehat P_0>\widehat N_1\) for the same example in which (5.104)
proves \(w_a/z_a>1\).  The exact lesson is narrower than a multirate GGC
theorem: support inclusion is not necessary for the first-cut mass
comparison.

The true negative kernel gives a still stronger secant criterion.  Set

\[
f(v)=\frac1{1+v}
\prod_{i=3}^n(1+\lambda_i v)^{-\beta_i},
\qquad
\Theta_a:=\chi\left(\frac{v_a}{z_a}\right)^p
=\left(\frac{w_a}{z_a}\right)^p.
\tag{5.117}
\]

Represent the first factor of \(f\) by
\((c_0,\gamma_0)=(1,1)\) and the remaining factors by
\((c_i,\gamma_i)=(\lambda_i,\beta_i)\).  Logarithmic differentiation
gives

\[
\frac{f''(v)}{f(v)}
=
\left(\sum_j\frac{\gamma_jc_j}{1+c_jv}\right)^2
+\sum_j\frac{\gamma_jc_j^2}{(1+c_jv)^2}>0.
\tag{5.118}
\]

Thus \(f\) is strictly convex and lies strictly below its endpoint chord
on \((0,v_a)\).  Since \(f(0)=1\),

\[
R
<\chi\frac{v_a^p}{p}
  \frac{1+pf(v_a)}{p+1}.
\]

Together with \(L>z_a^p/p\), this proves the strengthened condition

\[
\boxed{
\Theta_a\le\frac{p+1}{1+pf(v_a)}
\quad\Longrightarrow\quad
\widehat P_0>\widehat N_1.
}
\tag{5.119}
\]

When at least one additional rate is present,
\(f(v_a)<(1+v_a)^{-1}\), so (5.119) strictly enlarges (5.115).

The rising-branch hypothesis alone does not imply even this strengthened
secant condition.  An exact example is

\[
(b_1,b_2,b_3)=(1,2,100),
\qquad
(\beta_1,\beta_2,\beta_3)
=\left(\frac1{20},\frac1{10000},\frac{9499}{10000}\right),
\qquad
a=\frac{19}{10}.
\tag{5.120}
\]

Here \(p=19/20\) and direct rational arithmetic gives

\[
(\log G_1)'(a)
=\frac{2\beta_1}{a^2-1}
-\frac{2\beta_2b_2}{b_2^2-a^2}
-\frac{2\beta_3b_3}{b_3^2-a^2}
=\frac{172261423}{9421597575}>0.
\tag{5.121}
\]

Thus \(a\) is on the rising branch.  On the other hand,

\[
v_a=9,
\qquad
z_a=\frac{29}{39},
\qquad
\Theta_a
=\frac9{29}
 \left(\frac{38259}{1019}\right)^{9499/10000}.
\]

Since \(38259/1019>16\) and \(9499/10000>3/4\),

\[
\Theta_a>\frac9{29}16^{3/4}
=\frac{72}{29}>\frac{39}{20}=p+1
>\frac{p+1}{1+pf(v_a)}.
\tag{5.122}
\]

This is a no-go result only for deriving a secant certificate from the
rising-branch condition.  It does not reverse the true lobe-mass
inequality.

There is a complementary certificate adapted to this large-\(v_a\)
regime.  Put

\[
\delta=\sum_{i=3}^n\beta_i=p-\beta_2,
\qquad
K_\lambda=\prod_{i=3}^n\lambda_i^{-\beta_i}.
\]

Because \(1+\lambda_i v>\lambda_i(1+v)\),

\[
f(v)<K_\lambda(1+v)^{-(1+\delta)},
\qquad
R<\chi K_\lambda\mathrm B(p,1-\beta_2).
\tag{5.123}
\]

For the left kernel, the absolutely convergent positive series on
\(0\le z\le z_a<1\) is

\[
\frac1{1-z}\prod_{i=3}^n(1-\lambda_i z)^{-\beta_i}
=\sum_{m=0}^\infty A_mz^m,
\]

where

\[
A_m=
\sum_{k_0+\sum_{i=3}^nk_i=m}
\prod_{i=3}^n
\frac{(\beta_i)_{k_i}}{k_i!}\lambda_i^{k_i}>0.
\tag{5.124}
\]

Consequently, for every integer \(M\ge0\),

\[
L>
\sum_{m=0}^M A_m\frac{z_a^{p+m}}{p+m}.
\]

Combining this with (5.123) gives the finite-truncation sufficient
condition

\[
\boxed{
\sum_{m=0}^M A_m\frac{z_a^{p+m}}{p+m}
\ge
\chi K_\lambda\mathrm B(p,1-\beta_2)
\quad\Longrightarrow\quad
\widehat P_0>\widehat N_1.
}
\tag{5.125}
\]

Unlike the secant estimates, (5.125) does not carry a factor
\(v_a^p\); it can therefore exploit simultaneous growth of the left
kernel and decay of the full right tail as \(a\uparrow b_2\).  It remains
an analytic condition rather than an automatically rational certificate:
for concrete nonintegral parameters the beta term must itself be evaluated
exactly or bounded rigorously.  It remains open whether (5.113), (5.119),
(5.125) with some finite \(M\), or the route-specific mass inequality
itself holds on every rising branch.  The separate global question of
combining first-cut control with all other cuts is later closed, without
these inequalities, by WIP-5.26.

### WIP-5.14 — weighted multicut phase centering and the residual
covariance

**Status: [PROVED MULTICUT DECOMPOSITION AND GLOBAL SUFFICIENT CONE;
OPEN CENTRAL REGION].**

Retain the ordering and total-shape assumptions of (5.93), but drop its
normalization:

\[
0<b_1<\cdots<b_n,\qquad
\beta_i>0,\qquad
\sum_{i=1}^n\beta_i=1,\qquad n\ge2.
\]

For \(1\le j<n\), put

\[
A_j=\sum_{i=1}^j\beta_i,\qquad
s_j=\sin(\pi A_j),\qquad
c_j=\cos(\pi A_j),\qquad
d_j=\cot(\pi A_j),
\]

and, on \(I_j=(b_j,b_{j+1})\), define

\[
m_j(r)=
\prod_{i\le j}(r-b_i)^{-\beta_i}
\prod_{i>j}(b_i-r)^{-\beta_i}.
\tag{5.126}
\]

Also set

\[
\begin{aligned}
a(r)&=\prod_{i=1}^n(b_i+r)^{-\beta_i},\\
m_0(r)&=\prod_{i=1}^n(b_i-r)^{-\beta_i},
&&0<r<b_1,\\
m_n(r)&=\prod_{i=1}^n(r-b_i)^{-\beta_i},
&&r>b_n,
\end{aligned}
\]

and introduce the folded exterior/reflected density

\[
h_{\mathrm{ext}}(r)=
\begin{cases}
a(r)+m_0(r),&0<r<b_1,\\
a(r),&b_1<r<b_n,\\
a(r)-m_n(r),&r>b_n.
\end{cases}
\tag{5.127}
\]

It is strictly positive below \(b_n\) and strictly negative above \(b_n\):
for \(r>b_n\), every factor \(r-b_i\) is smaller than \(r+b_i\), and
hence \(m_n(r)>a(r)\).

Let \(t=u^2>0\), and define

\[
\begin{aligned}
D_j(t)&=\int_{I_j}e^{-tr^2}m_j(r)\,dr,
&B_j(t)&=s_jD_j(t),\\
B(t)&=\sum_{j=1}^{n-1}B_j(t),
&E(t)&=\int_0^\infty e^{-tr^2}h_{\mathrm{ext}}(r)\,dr.
\end{aligned}
\tag{5.128}
\]

The boundary calculation in (5.105)--(5.106), now performed on every
cut, gives

\[
\boxed{
\pi Q(u)=B(t),\qquad
\pi N(u)=E(t)+\sum_{j=1}^{n-1}d_jB_j(t).
}
\tag{5.129}
\]

Indeed, the Jacobian in \(y=ur\) cancels the factor
\(u^{-\sum_i\beta_i}=u^{-1}\).  Thus no scale factor has been suppressed.
Write

\[
\Xi(t)=\frac{N(\sqrt t)}{Q(\sqrt t)},\qquad
\omega_j(t)=\frac{B_j(t)}{B(t)},\qquad
\overline d(t)=\sum_j\omega_j(t)d_j,\qquad
\rho(t)=\frac{E(t)}{B(t)}.
\]

Then

\[
\boxed{\Xi=\rho+\overline d.}
\tag{5.130}
\]

The phase-mixture term has a fixed favorable sign.  Define

\[
\mu_j(t)=
\frac{\int_{I_j}r^2e^{-tr^2}m_j(r)\,dr}
     {\int_{I_j}e^{-tr^2}m_j(r)\,dr}
=-\frac{B_j'(t)}{B_j(t)},
\qquad
\mu_B=\sum_j\omega_j\mu_j.
\tag{5.131}
\]

The disjoint ordered cuts imply
\(\mu_1<\cdots<\mu_{n-1}\), while strict decrease of the cotangent gives
\(d_1>\cdots>d_{n-1}\).  More explicitly, for \(i<j\),

\[
d_i-d_j
=\frac{\sin\!\left(\pi(A_j-A_i)\right)}
       {\sin(\pi A_i)\sin(\pi A_j)}>0.
\]

Since \(\omega_j'=\omega_j(\mu_B-\mu_j)\), pairwise symmetrization yields

\[
\boxed{
\overline d'
=-\operatorname{Cov}_{\omega}(d_j,\mu_j)
=\sum_{i<j}\omega_i\omega_j
 (d_i-d_j)(\mu_j-\mu_i)>0
}
\tag{5.132}
\]

whenever \(n\ge3\).  In matrix notation this is
\(-d^{\mathsf T}(\operatorname{diag}\omega-\omega\omega^{\mathsf T})\mu\).
Thus the differing cut phases, after their correct \(t\)-dependent
weighting, help rather than hinder phase monotonicity.

The same fact has an exact signed-density form.  Put

\[
q(r)=\sum_{j=1}^{n-1}
s_jm_j(r)\mathbf 1_{I_j}(r),
\]

and

\[
\begin{aligned}
k_{\mathrm{res}}(r)&=h_{\mathrm{ext}}(r)-\rho q(r),\\
k_{\mathrm{phase}}(r)&=
\sum_{j=1}^{n-1}s_j(d_j-\overline d)
m_j(r)\mathbf 1_{I_j}(r).
\end{aligned}
\tag{5.133}
\]

Both have zero \(e^{-tr^2}\)-weighted mass.  Moreover,
\(d_j-\overline d\) changes sign at most once as \(j\) increases, so
\(k_{\mathrm{phase}}\) is positive on the lower cuts and negative on the
higher cuts, with

\[
\int_0^\infty r^2e^{-tr^2}k_{\mathrm{phase}}(r)\,dr
=B\,\operatorname{Cov}_{\omega}(d_j,\mu_j)<0.
\tag{5.134}
\]

The full zero-mass signed density is
\(k_{\Xi,t}=k_{\mathrm{res}}+k_{\mathrm{phase}}\), and

\[
\boxed{
\Xi'(t)
=-\frac1B\int_0^\infty r^2e^{-tr^2}k_{\Xi,t}(r)\,dr
=\rho'(t)+\overline d'(t).
}
\tag{5.135}
\]

For three rates, (5.132) reduces to

\[
\overline d'
=\frac{B_1B_2}{B^2}
 (d_1-d_2)(\mu_2-\mu_1)>0;
\]

the phase density is strictly positive on \(I_1\) and strictly negative
on \(I_2\).

The residual term now compares every cut with one common threshold.  On
\(I_j\), define

\[
G_j(r)=
\prod_{i\le j}
\left(\frac{r-b_i}{r+b_i}\right)^{\beta_i}
\prod_{i>j}
\left(\frac{b_i-r}{b_i+r}\right)^{\beta_i},
\qquad
g_j(r)=\frac{G_j(r)}{s_j}.
\tag{5.136}
\]

Then

\[
k_{\mathrm{res}}(r)
=s_jm_j(r)\bigl(g_j(r)-\rho\bigr),
\qquad r\in I_j.
\]

Each \(g_j\) is strictly one-peaked by (5.107).  Put

\[
g_*=\max_{1\le j<n}\sup_{r\in I_j}g_j(r).
\]

The exterior signs in (5.127), the cut formula above, and the zero-mass
property give two strict one-crossing regimes:

\[
\boxed{
\rho(t)\le0\quad\Longrightarrow\quad\rho'(t)>0,
\qquad
\rho(t)\ge g_*\quad\Longrightarrow\quad\rho'(t)>0.
}
\tag{5.137}
\]

This gives a genuine multirate parameter cone.  Since \(N/Q>0\), if
\(\beta_1>1/2\) then
\(d_j\le d_1=\cot(\pi\beta_1)<0\), and hence

\[
\rho=\Xi-\overline d>-\overline d\ge-d_1.
\]

Consequently,

\[
\boxed{
\begin{gathered}
\sum_{i=1}^n\beta_i=1,\qquad
\beta_1>\frac12,\qquad
g_*\le-\cot(\pi\beta_1)
\\[1mm]
\Longrightarrow\quad
\left(\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i}\right)^2\in GGC.
\end{gathered}
}
\tag{5.138}
\]

For \(n\ge3\), both inequalities leading to
\(\rho>g_*\) and both derivative contributions are strict.  Formula
(5.13a) and the endpoint phase conditions then prove (5.138).  This cone
is an analytic theorem for arbitrary finite \(n\), not merely a first-cut
statement.  It is nonempty: after scaling \(b_1=1\), if
\(b_n\le1+\varepsilon\), every ratio in (5.136) is at most
\(\varepsilon/2\), whence
\[
g_*\le\frac{\varepsilon}
 {2\min_{1\le j<n}\sin(\pi A_j)}.
\]
For fixed weights with \(\beta_1>1/2\), sufficiently small
\(\varepsilon>0\) therefore satisfies (5.138).

For the remaining region, the exact undetermined quantity is one
covariance.  Let \(\nu_t\) be the probability measure on the union of the
cuts with density \(B^{-1}e^{-tr^2}q(r)\), and put
\(g(r)=g_j(r)\) on \(I_j\).  Define

\[
\begin{aligned}
P&=\int_0^{b_1}e^{-tr^2}h_{\mathrm{ext}}(r)\,dr,&
\mu_P&=\frac1P\int_0^{b_1}r^2e^{-tr^2}h_{\mathrm{ext}}(r)\,dr,\\
U&=\int_{b_n}^\infty e^{-tr^2}(-h_{\mathrm{ext}}(r))\,dr,&
\mu_U&=\frac1U\int_{b_n}^\infty
r^2e^{-tr^2}(-h_{\mathrm{ext}}(r))\,dr.
\end{aligned}
\tag{5.139}
\]

Then
\(\mu_P<b_1^2<\mu_B<b_n^2<\mu_U\), and direct expansion of
\(\rho'= (E'B-EB')/B^2\) gives

\[
\boxed{
\rho'
=\frac PB(\mu_B-\mu_P)
 +\frac UB(\mu_U-\mu_B)
 -\operatorname{Cov}_{\nu_t}\!\bigl(g(R),R^2\bigr).
}
\tag{5.140}
\]

Combining (5.132) and (5.140) isolates the exact remaining inequality:

\[
\boxed{
\begin{aligned}
\Xi'={}&
\frac PB(\mu_B-\mu_P)
+\frac UB(\mu_U-\mu_B)\\
&-\operatorname{Cov}_{\nu_t}\!\bigl(g(R),R^2\bigr)
+\sum_{i<j}\omega_i\omega_j
(d_i-d_j)(\mu_j-\mu_i).
\end{aligned}
}
\tag{5.141}
\]

The two exterior buffers are strictly positive, and the phase-mixing
buffer is nonnegative and is strict when \(n\ge3\).  The sole term without
a fixed sign is the covariance of the piecewise one-peaked cut likelihood
\(g\) with \(R^2\).

Equivalently, define the cumulative signed mass

\[
C_t(x)=\int_0^x e^{-tr^2}k_{\Xi,t}(r)\,dr.
\]

For a fixed \(t>0\), if \(C_t(x)\ge0\) for every \(x>0\), integration by
parts gives

\[
\int_0^\infty r^2e^{-tr^2}k_{\Xi,t}(r)\,dr
=-\int_0^\infty2rC_t(r)\,dr\le0.
\tag{5.142}
\]

The boundary term vanishes: the Gaussian factor and
\(h_{\mathrm{ext}}(r)=O(r^{-2})\) give \(r^2C_t(r)\to0\).
Thus (5.142) is a concrete sufficient certificate for \(\Xi'(t)\ge0\);
if it holds for every \(t>0\), (5.13a) gives the GGC conclusion.
In the central range \(0<\rho<g_*\), each cut can contribute a
\(-,+,-\) pattern, so three rates can have up to six successive cut lobes.
Within this WIP-5.14 certificate, WIP-5.13 controls one prefix in explicit
cones and the remaining obligation is to control the later prefixes or to
dominate them by the three positive
buffers in (5.141).

Finally, local cut centers do not supply independent free parameters.  If
\(\chi_j=s_j(\Xi-d_j)\), then

\[
\frac{\chi_j}{s_j}+d_j=\Xi,\qquad
\frac{\chi_j}{s_j}-\frac{\chi_i}{s_i}=d_i-d_j,\qquad
\chi_j'=s_j\Xi'.
\tag{5.143}
\]

Thus the legal center vector lies on a one-dimensional affine line.  The
weighted projection (5.130)--(5.133) removes the baseline obstruction
without inventing \(n-1\) independent centers.

As an independent normalization check, (5.12) becomes

\[
\boxed{
\mathbb E[\mathcal K(uR_1,uR_2)]
=\frac{2t}{\pi^{3/2}}
\left[
BE'-EB'
+\sum_{i<j}B_iB_j(d_i-d_j)(\mu_j-\mu_i)
\right].
}
\tag{5.144}
\]

### WIP-5.15 — the cut critical polynomial and directly checkable
multirate cones

**Status: [PROVED EXPLICITIZATION OF (5.138) AND EXACT THREE-RATE
CERTIFICATE].**

The implicit maximum \(g_*\) in (5.138) can be computed from one
interlacing polynomial.  On every cut \(I_j\), differentiation of (5.136)
gives the same rational function:

\[
\boxed{
\frac12(\log G_j)'(r)
=F(r):=\sum_{i=1}^n\frac{\beta_i b_i}{r^2-b_i^2}.
}
\tag{5.145}
\]

On \(I_j\),

\[
F'(r)=-2r\sum_{i=1}^n
\frac{\beta_i b_i}{(r^2-b_i^2)^2}<0,
\qquad
F(b_j+)=+\infty,\quad F(b_{j+1}-)=-\infty.
\]

Thus \(G_j\) has a unique maximizer \(r_j\).  With \(x_j=r_j^2\), it is
the unique root in \((b_j^2,b_{j+1}^2)\) of

\[
\boxed{
\mathcal P(x)=
\sum_{i=1}^n\beta_i b_i
\prod_{k\ne i}(x-b_k^2).
}
\tag{5.146}
\]

All \(n-1\) roots of \(\mathcal P\) are therefore simple and strictly
interlace \(b_1^2,\ldots,b_n^2\), and

\[
\boxed{
g_*=
\max_{1\le j<n}
\frac{G_j(\sqrt{x_j})}{\sin(\pi A_j)}.
}
\tag{5.147}
\]

For \(n=3\), define

\[
\begin{aligned}
\Lambda_0&=\sum_{i=1}^3\beta_i b_i,\\
\Lambda_1&=\sum_{i=1}^3\beta_i b_i
 \sum_{k\ne i}b_k^2,\\
\Lambda_2&=\sum_{i=1}^3\beta_i b_i
 \prod_{k\ne i}b_k^2.
\end{aligned}
\]

Then

\[
\mathcal P(x)=\Lambda_0x^2-\Lambda_1x+\Lambda_2,
\qquad
x_\pm=
\frac{\Lambda_1\pm
\sqrt{\Lambda_1^2-4\Lambda_0\Lambda_2}}
{2\Lambda_0},
\tag{5.148}
\]

with \(x_-\in(b_1^2,b_2^2)\) and
\(x_+\in(b_2^2,b_3^2)\).  If
\(\alpha=\beta_1>1/2\), condition (5.138) is exactly

\[
\boxed{
G_1(\sqrt{x_-})\le-\cos(\pi\alpha),
\qquad
G_2(\sqrt{x_+})
\le-\cot(\pi\alpha)\sin(\pi\beta_3).
}
\tag{5.149}
\]

There is also a root-free endpoint envelope.  Put

\[
U_j=
\prod_{i\le j}
\left(\frac{b_{j+1}-b_i}{b_{j+1}+b_i}\right)^{\beta_i}
\prod_{i>j}
\left(\frac{b_i-b_j}{b_i+b_j}\right)^{\beta_i}.
\tag{5.150}
\]

For \(i\le j\), the corresponding factor of \(G_j\) increases with \(r\);
for \(i>j\), it decreases.  Taking the appropriate endpoint supremum
factor by factor proves

\[
\sup_{I_j}G_j\le U_j.
\]

Consequently the directly checkable conditions

\[
\boxed{
\beta_1>\frac12,\qquad
U_j\le-\cot(\pi\beta_1)\sin(\pi A_j)
\quad(1\le j<n)
}
\tag{5.151}
\]

imply (5.138), and hence the GGC property.  In the three-rate case, with

\[
\delta_{ij}=\frac{b_j-b_i}{b_j+b_i},
\]

the two envelopes are

\[
U_1=\delta_{12}^{\,1-\beta_3}\delta_{13}^{\,\beta_3},
\qquad
U_2=\delta_{13}^{\,\beta_1}\delta_{23}^{\,1-\beta_1}.
\]

Thus (5.151) becomes

\[
\boxed{
\begin{aligned}
\beta_1&>\frac12,\\
\delta_{12}^{\,1-\beta_3}\delta_{13}^{\,\beta_3}
&\le-\cos(\pi\beta_1),\\
\delta_{13}^{\,\beta_1}\delta_{23}^{\,1-\beta_1}
&\le-\cot(\pi\beta_1)\sin(\pi\beta_3).
\end{aligned}
}
\tag{5.152}
\]

A coarser condition uses only the total rate contrast.  Let

\[
\delta=\frac{b_n-b_1}{b_n+b_1},
\qquad
s_{\min}=\min_{1\le j<n}\sin(\pi A_j),
\qquad
K=-\cot(\pi\beta_1)s_{\min}.
\]

Every factor in \(G_j\) is at most \(\delta\); since the shape weights sum
to one,

\[
g_*\le\frac{\delta}{s_{\min}}.
\]

Moreover \(0<K<1\): one has
\(s_{\min}\le\sin(\pi\beta_n)\le\sin(\pi(1-\beta_1))\), and hence
\(K\le\cos(\pi(1-\beta_1))<1\).  (The middle inequality is an
equality when \(n=2\).)  Therefore

\[
\boxed{
\beta_1>\frac12,\qquad
\frac{b_n}{b_1}\le\frac{1+K}{1-K}
\quad\Longrightarrow\quad
\left(\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i}\right)^2\in GGC.
}
\tag{5.153}
\]

For three rates, (5.152) also has a trigonometry-free rational
relaxation.  Concavity of sine, \(\tan x>x\), \(\pi>3\), and weighted
AM--GM give

\[
\begin{aligned}
-\cos(\pi\beta_1)&\ge2\beta_1-1,\\
-\cot(\pi\beta_1)\sin(\pi\beta_3)
&>3\beta_3(2\beta_1-1),\\
U_1&\le(1-\beta_3)\delta_{12}+\beta_3\delta_{13},\\
U_2&\le\beta_1\delta_{13}+(1-\beta_1)\delta_{23}.
\end{aligned}
\]

It follows that the following trigonometry-free inequalities (involving
only rational operations and the ordered rate contrasts)

\[
\boxed{
\begin{aligned}
(1-\beta_3)\delta_{12}+\beta_3\delta_{13}
&\le2\beta_1-1,\\
\beta_1\delta_{13}+(1-\beta_1)\delta_{23}
&\le3\beta_3(2\beta_1-1)
\end{aligned}
}
\tag{5.154}
\]

are sufficient.

As an exact illustration beyond the golden-ratio support cone, take

\[
(\beta_1,\beta_2,\beta_3)
=\left(\frac23,\frac1{12},\frac14\right),
\qquad
(b_1,b_2,b_3)=(1,2,3).
\]

Then
\(\delta_{12}=1/3\), \(\delta_{13}=1/2\), and
\(\delta_{23}=1/5\).  The first envelope satisfies

\[
U_1^4=\frac1{54}<\frac1{16}
=\left(-\cos\frac{2\pi}{3}\right)^4,
\]

while

\[
U_2^3=\frac1{20}
<\frac1{6\sqrt6}
=\left(
-\cot\frac{2\pi}{3}\sin\frac\pi4
\right)^3;
\]

the middle inequality follows from \(6\sqrt6<20\), equivalently
\(216<400\).  Hence

\[
\boxed{
\left(
G_{2/3}+\frac{G_{1/12}}2+\frac{G_{1/4}}3
\right)^2\in GGC.
}
\tag{5.155}
\]

Its rate ratio is \(3>(1+\sqrt5)/2\), so the example lies beyond the
uniform support cone (5.16).  It also satisfies the separate mean cone
(5.34e), so it illustrates the new multicut certificate rather than
claiming a previously uncovered distribution.

### WIP-5.16 — the three-rate interface and a finite-prefix reduction

**Status: [PROVED REDUCTIONS AND CONDITIONAL CONES; SECOND RISING PREFIX
LATER CLOSED FOR ALL PARAMETERS BY WIP-5.26].**

Specialize WIP-5.14 to three rates.  Let \(\nu_{j,t}\) be the probability
measure on \(I_j\) with density
\(B_j^{-1}e^{-tr^2}s_jm_j(r)\), and define

\[
\overline g_j=\mathbb E_{\nu_{j,t}}[g_j(R)],\qquad
\mu_j=\mathbb E_{\nu_{j,t}}[R^2],\qquad
\sigma_j=\operatorname{Cov}_{\nu_{j,t}}(g_j(R),R^2),
\]

\[
\ell_j=\overline g_j+d_j,\qquad
\Delta=d_1-d_2>0,\qquad
\omega_j=\frac{B_j}{B_1+B_2}.
\tag{5.156}
\]

The cumulative signed mass at the cut interface has the exact form

\[
\boxed{
C_t(b_2)
=\omega_2P+\omega_1U
+\frac{B_1B_2}{B_1+B_2}(\ell_1-\ell_2).
}
\tag{5.157}
\]

Indeed,
\(C_t(b_2)=P+B_1(\ell_1-\Xi)\), while zero total mass gives

\[
\Xi=\frac{P-U+B_1\ell_1+B_2\ell_2}{B_1+B_2};
\]

substitution proves (5.157).  The covariance in (5.141) also separates
into its two within-cut terms and one between-cut term.  Combining the
latter with the phase buffer gives

\[
\boxed{
\begin{aligned}
\Xi'={}&
\frac PB(\mu_B-\mu_P)
+\frac UB(\mu_U-\mu_B)
-\omega_1\sigma_1-\omega_2\sigma_2\\
&+\omega_1\omega_2(\ell_1-\ell_2)(\mu_2-\mu_1).
\end{aligned}
}
\tag{5.158}
\]

Thus the same scalar \(\ell_1-\ell_2\) controls both the interface prefix
and the cross-cut covariance.  If

\[
\boxed{g_{2,*}\le\Delta,}
\tag{5.159}
\]

then

\[
\ell_1-\ell_2
=\Delta+\overline g_1-\overline g_2
>\Delta-g_{2,*}\ge0.
\]

Consequently \(C_t(b_2)>0\), and the final term in (5.158) is strictly
positive.  A shape-only condition implies (5.159) for arbitrary rates:

\[
\boxed{\beta_1\le\beta_2\quad\Longrightarrow\quad\ell_1>\ell_2.}
\tag{5.160}
\]

To prove it, use \(0<G_j<1\) and
\(A_2=\beta_1+\beta_2\):

\[
\ell_1>d_1=\cot(\pi\beta_1),
\qquad
\ell_2<d_2+\csc(\pi A_2)
=\cot\!\left(\frac{\pi A_2}{2}\right).
\]

When \(\beta_1\le\beta_2\), one has
\(\beta_1\le A_2/2\), so monotonicity of cotangent proves (5.160).
The strict bound also shows directly that
\(g_{2,*}<\Delta\).  This removes the cut-to-cut covariance, but not the
two within-cut covariances in (5.158).

There is an exact finite-prefix formulation of what remains.  On \(I_j\),
write

\[
\eta_j(t)=\Xi(t)-d_j,
\qquad
k_{\Xi,t}(r)=s_jm_j(r)\bigl(g_j(r)-\eta_j\bigr).
\tag{5.161}
\]

Whenever \(0<\eta_j<g_{j,*}\), let \(r_j^-\) denote the rising-branch
root of \(g_j(r)=\eta_j\).  The one-peak property shows that
\(C_t(x)\ge0\) for every \(x>0\) is equivalent to checking the possible
local minima

\[
\boxed{
C_t(b_2),\qquad C_t(r_1^-),\qquad C_t(r_2^-),
}
\tag{5.162}
\]

with nonexistent roots omitted.  The fixed endpoints are already positive:

\[
C_t(b_1)=P>0,\qquad C_t(b_3)=U>0.
\]

After scaling \(b_1=1\), the first-root value is exactly

\[
C_t(r_1^-)
=P-\int_{b_1}^{r_1^-}e^{-tr^2}m_1(r)
\bigl(\chi_1-G_1(r)\bigr)\,dr,
\qquad
\chi_1=s_1\eta_1=G_1(r_1^-).
\tag{5.163}
\]

Therefore each certificate in WIP-5.13 applies without modification.
The only genuinely new prefix is

\[
C_t(r_2^-)=C_t(b_2)-N_{2,-}(t),
\]

where

\[
N_{2,-}(t)=
\int_{b_2}^{r_2^-}e^{-tr^2}s_2m_2(r)
\bigl(\eta_2-g_2(r)\bigr)\,dr.
\]

Together with (5.157), the precise sufficient condition is

\[
\boxed{
N_{2,-}(t)\le
\omega_2P+\omega_1U
+\frac{B_1B_2}{B}(\ell_1-\ell_2).
}
\tag{5.164}
\]

In particular, under \(\beta_1\le\beta_2\), every term on the right is
strictly positive.  At this stage it was open whether (5.164) always
holds; WIP-5.26 later proves it for every three-rate total-shape-one
parameter vector as part of the all-cut weighted-prefix theorem.

There are two useful phase-aware cones.  First, pointwise at a fixed
\(t>0\),

\[
\boxed{
d_2+g_{2,*}\le\Xi(t)\le d_1
\quad\Longrightarrow\quad
C_t(x)\ge0\ \text{for all }x,\quad \Xi'(t)>0.
}
\tag{5.165}
\]

Indeed, \(\eta_1\le0\) makes the first cut positive, while
\(\eta_2\ge g_{2,*}\) makes the second cut negative; the exterior pieces
have the same order, so there is one crossing.  The interval in (5.165)
is nonempty whenever (5.159) holds, in particular whenever
\(\beta_1\le\beta_2\).  This is a pointwise-\(t\) certificate, not by
itself an all-\(t\) GGC theorem.

Second, suppose

\[
\boxed{
g_{2,*}\le-d_2
\quad\Longleftrightarrow\quad
\beta_3<\frac12,\qquad
\sup_{I_2}G_2\le\cos(\pi\beta_3).
}
\tag{5.166}
\]

Since \(\Xi(t)>0\), this gives
\(\eta_2=\Xi-d_2>-d_2\ge g_{2,*}\) for every \(t\).  The second cut and
the upper exterior are then strictly negative, and

\[
C_t(b_2)
=-\int_{b_2}^{\infty}e^{-tr^2}k_{\Xi,t}(r)\,dr>0.
\]

The three-rate problem has consequently reduced to the first cut.  If
\(\eta_1\le0\), that cut is positive; if
\(\eta_1\ge g_{1,*}\), it is negative between two positive endpoint
cumulatives; and in the sole remaining case
\(0<\eta_1<g_{1,*}\), WIP-5.13 controls its rising-root minimum.
Hence (5.166), together with any WIP-5.13 certificate valid for every
first rising root that occurs, implies \(\Xi'(t)>0\) for all \(t>0\) and
therefore the GGC property.  This is a conditional dimension-reduction
theorem, not a proof for all three-rate parameters.

### WIP-5.17 — why the first-cut Möbius reflection does not copy to the
upper prefix

**Status: [PROVED OBSTRUCTION TO A SPECIFIC PROOF MECHANISM; NOT A
COUNTEREXAMPLE].**

Write

\[
a=b_1<b=b_2<c=b_3,\qquad
(\alpha,\beta,\gamma)=(\beta_1,\beta_2,\beta_3),
\]

and put

\[
q=1-\gamma=\alpha+\beta,\qquad
\lambda=\frac{B-A}{C-A},\qquad
K=\left(\frac{C-B}{C-A}\right)^\alpha.
\tag{5.167}
\]

The natural upper-tail substitutions

\[
x=\frac{r-C}{r-B},\qquad
v=\frac{C-r}{r-B},\qquad
z=\frac{r+C}{r+B}
\]

give the following positive-density Jacobians (the integration limits below
restore the orientation of the decreasing \(v\)- and \(z\)-coordinates):

\[
\begin{aligned}
m_3(r)\,dr
&=K\frac{x^{q-1}(1-\lambda x)^{-\alpha}}{1-x}\,dx,
&&0<x<1,\\
m_2(r)\,|dr|
&=K\frac{v^{q-1}(1+\lambda v)^{-\alpha}}{1+v}\,|dv|,\\
a(r)\,|dr|
&=K\frac{z^{q-1}(1-\lambda z)^{-\alpha}}{z-1}\,|dz|,
&&z>1.
\end{aligned}
\tag{5.168}
\]

If \(a_2\in(B,C)\) is a second-cut rising root and
\(\theta=G_2(a_2)\), the corresponding unweighted upper-prefix
comparison is

\[
C_0(a_2)=
\lim_{R\to\infty}
\left[
\int_C^R m_3(r)\,dr-\int_{a_2}^R a(r)\,dr
\right]
+\theta\int_{a_2}^C m_2(r)\,dr.
\]

In the coordinates (5.168), this becomes

\[
\begin{aligned}
K^{-1}C_0(a_2)
=\lim_{R\to\infty}\Bigg[
&\int_0^{x_R}
\frac{x^{q-1}(1-\lambda x)^{-\alpha}}{1-x}\,dx\\
&-\int_{z_R}^{z_{a_2}}
\frac{z^{q-1}(1-\lambda z)^{-\alpha}}{z-1}\,dz\\
&+\theta\int_0^{v_{a_2}}
\frac{v^{q-1}(1+\lambda v)^{-\alpha}}{1+v}\,dv
\Bigg],
\end{aligned}
\tag{5.169}
\]

where

\[
x_R=\frac{R-C}{R-B}\uparrow1,\quad
z_R=\frac{R+C}{R+B}\downarrow1,\quad
z_{a_2}=\frac{a_2+C}{a_2+B},\quad
v_{a_2}=\frac{C-a_2}{a_2-B}.
\]

The two finite-\(R\) cutoffs are not exact reflections of one another:

\[
1-x_R=\frac{C-B}{R-B},\qquad
z_R-1=\frac{C-B}{R+B},\qquad
\log\frac{1-x_R}{z_R-1}
=\log\frac{R+B}{R-B}\longrightarrow0.
\]

Thus their logarithmic cutoff mismatch contributes zero to the coupled
limit.  The equal-distance reflection used next is only the local
asymptotic test of its kernel, not an identity between the finite cutoffs.

The first two integrals do not concatenate at an ordinary interior point:
they diverge logarithmically at \(1^-\) and \(1^+\), and only their
coupled cutoff has a finite limit.  Equivalently, direct expansion gives

\[
m_3(r)-a(r)=
\frac{2\sum_i\beta_i b_i}{r^2}+O(r^{-3}),
\qquad r\to\infty,
\]

so the difference of the two logarithmically divergent tails is integrable.
Let

\[
\phi(y)=y^{q-1}(1-\lambda y)^{-\alpha}.
\]

Under the canonical reflection \(x=1-s\), \(z=1+s\),

\[
\frac{\phi(1-s)-\phi(1+s)}s\longrightarrow-2\phi'(1),
\qquad
\frac{\phi'(1)}{\phi(1)}
=-\gamma+\alpha\frac{B-A}{C-B}.
\tag{5.170}
\]

This sign is not fixed.  For
\(\alpha=\beta=\gamma=1/3\), rates \((1,3,4)\) make it positive, while
rates \((1,2,4)\) make it negative.  Thus the linear reflection and
pointwise kernel domination from WIP-5.13 cannot be copied verbatim to the
second prefix.  A successful argument must retain the coupled
\(m_3-a\) cancellation, use a nonlinear transport, or invoke the positive
interface/phase buffers in (5.157)--(5.158).  This is not evidence that
\(C_t(r_2^-)<0\), \(\Xi'(t)<0\), or the GGC conjecture fails.
Nor would the unweighted inequality \(C_0(a_2)\ge0\), by itself, imply its
Gaussian-weighted analogue for \(t>0\): the factor \(e^{-tr^2}\) changes the
relative weights of the cut and exterior lobes.  Formula (5.169) is therefore
a proof-mechanism audit, not a hidden all-\(t\) reduction.

### WIP-5.18 — zero-temperature mass ratios and a complete three-rate
certificate

**Status: [PROVED THREE-RATE SUFFICIENT THEOREM, WITH EXACT AND ROOT-FREE
TESTS].**

Retain the three-rate, total-shape-one setting and write

\[
A=b_1<B=b_2<C=b_3,\qquad
(\alpha,\beta,\gamma)=(\beta_1,\beta_2,\beta_3),\qquad
\alpha+\beta+\gamma=1.
\]

Retain \(q,\lambda,K\) from (5.167).

Let \(P(t),B_1(t),B_2(t)\) be as in (5.128) and (5.139), and put

\[
P^{(0)}=P(0),\qquad B_j^{(0)}=B_j(0),\qquad
\omega_{1,0}=\frac{B_1^{(0)}}{B_1^{(0)}+B_2^{(0)}}.
\]

All these zero-temperature integrals are finite.  Since the rate-side
Dirichlet mean is a probability law, \(Q(0)=1\), and (5.129) gives the useful
normalization

\[
\boxed{
B_1^{(0)}+B_2^{(0)}=\pi,qquad
\omega_{1,0}=\frac{B_1^{(0)}}\pi.
}
\tag{5.171}
\]

Two ordered-support ratios improve with \(t\).  Indeed,
\(\mu_P<a^2<\mu_1<\mu_2\), so

\[
\boxed{
\left(\frac{P}{B_1}\right)'
=\frac{P}{B_1}(\mu_1-\mu_P)>0,qquad
\omega_1'=\omega_1\omega_2(\mu_2-\mu_1)>0.
}
\tag{5.172}
\]

Suppose first that a rising root exists on cut \(I_j\), so
\(0<\eta_j<g_{j,*}\), and let \(N_{j,-}\) denote the negative mass before
that root.  Directly from (5.161),

\[
0<N_{1,-}<g_{1,*}B_1,qquad
0<N_{2,-}<g_{2,*}B_2.
\tag{5.173}
\]

Consider the two zero-temperature conditions

\[
\boxed{
g_{1,*}\le\frac{P^{(0)}}{B_1^{(0)}},qquad
g_{2,*}\le
\frac{\omega_{1,0}}{1+\omega_{1,0}}\Delta,qquad
\Delta=d_1-d_2.
}
\tag{5.174}
\]

The first inequality and (5.172)--(5.173) give
\(N_{1,-}<P(t)\), so the first rising minimum is positive for every
\(t>0\).  For the second inequality, strict increase of \(\omega_1\) gives

\[
g_{2,*}<\frac{\omega_1}{1+\omega_1}\Delta
\quad\Longleftrightarrow\quad
g_{2,*}<\omega_1(\Delta-g_{2,*}).
\]

Since
\(\ell_1-\ell_2=\Delta+\overline g_1-\overline g_2
>\Delta-g_{2,*}\), one obtains the strict chain

\[
\boxed{
N_{2,-}<g_{2,*}B_2
<\omega_1B_2(\Delta-g_{2,*})
<\frac{B_1B_2}{B}(\ell_1-\ell_2)
<C_t(b_2).
}
\tag{5.175}
\]

Thus even the phase/interface term alone dominates the second initial
negative lobe; the positive \(P,U\) buffers in (5.157) are not needed for
this estimate.  Conditions (5.174) also make \(C_t(b_2)>0\).  Together with
the fixed positive endpoints and the finite-prefix equivalence (5.162),
this proves

\[
\boxed{
\text{(5.174)}\quad\Longrightarrow\quad
C_t(x)\ge0\ (x>0,t>0),\quad \Xi'(t)>0,\quad
\left(\frac{G_\alpha^{(1)}}a+
      \frac{G_\beta^{(2)}}b+
      \frac{G_\gamma^{(3)}}c\right)^2\in GGC.
}
\tag{5.176}
\]

Cases without a rising root require no extra condition: a cut is then
one-signed, and its two endpoint cumulatives are already among those
controlled above.  Hence (5.176) is a complete sufficient theorem for its
parameter cone, not merely a second-prefix reduction.

The endpoint envelopes from (5.150) remove both maximizations.  The
root-free conditions

\[
\boxed{
\frac{U_1}{s_1}\le\frac{P^{(0)}}{B_1^{(0)}},qquad
\frac{U_2}{s_2}\le
\frac{\omega_{1,0}}{1+\omega_{1,0}}\Delta
}
\tag{5.177}
\]

imply (5.174).  Using

\[
\Delta=
\frac{\sin(\pi\beta)}
{\sin(\pi\alpha)\sin(\pi(\alpha+\beta))},qquad
s_2=\sin(\pi(\alpha+\beta)),
\]

the second inequality in (5.177) is equivalently implied by

\[
\boxed{
U_2\le
\frac{\omega_{1,0}}{1+\omega_{1,0}}
\frac{\sin(\pi\beta)}{\sin(\pi\alpha)}.
}
\tag{5.178}
\]

The remaining zero-temperature cut masses have exact Gauss-hypergeometric
forms.  With

\[
u=\frac{b-a}{c-a},\qquad v=\frac{c-b}{c-a}=1-u,
\]

Euler's beta integral gives

\[
\boxed{
\begin{aligned}
D_1(0)&=u^\gamma\mathrm B(1-\alpha,1-\beta)
{}_2F_1(\gamma,1-\alpha;1+\gamma;u),\\
D_2(0)&=v^\alpha\mathrm B(1-\gamma,1-\beta)
{}_2F_1(\alpha,1-\gamma;1+\alpha;v),\\
B_1^{(0)}&=\sin(\pi\alpha)D_1(0),qquad
B_2^{(0)}=\sin(\pi\gamma)D_2(0).
\end{aligned}
}
\tag{5.179}
\]

There is also a completely explicit version requiring neither root finding
nor hypergeometric evaluation.  Define

\[
\begin{aligned}
p_-={}&a\left[
a^{-\alpha}b^{-\beta}c^{-\gamma}
+(2a)^{-\alpha}(a+b)^{-\beta}(a+c)^{-\gamma}
\right],\\
b_{1,+}={}&s_1
\left(\frac{b-a}{c-b}\right)^\gamma
\mathrm B(1-\alpha,1-\beta),\\
b_{1,-}={}&s_1
\left(\frac{b-a}{c-a}\right)^\gamma
\mathrm B(1-\alpha,1-\beta),\\
b_{2,+}={}&s_2
\left(\frac{c-b}{b-a}\right)^\alpha
\mathrm B(1-\beta,1-\gamma).
\end{aligned}
\tag{5.180}
\]

Monotonicity of the omitted factor on each integration interval yields

\[
P^{(0)}>p_-,\qquad
B_1^{(0)}<b_{1,+},\qquad
B_1^{(0)}>b_{1,-},\qquad
B_2^{(0)}<b_{2,+}.
\tag{5.181}
\]

In view of (5.171), set

\[
\underline\omega=
\frac{\max\{b_{1,-},\,\pi-b_{2,+}\}}\pi
<\omega_{1,0}.
\]

It follows that the entirely explicit inequalities

\[
\boxed{
\frac{U_1}{s_1}\le\frac{p_-}{b_{1,+}},qquad
\frac{U_2}{s_2}\le
\frac{\underline\omega}{1+\underline\omega}\Delta
}
\tag{5.182}
\]

imply the GGC conclusion (5.176).  This last cone uses only beta functions,
trigonometric functions, rational operations, and real powers of the rates.
It is deliberately conservative: (5.174) and (5.177) are the sharper exact
mass-ratio criteria.

### WIP-5.19 — regularized upper-tail cancellation and an adjacent-cut
transport

**Status: [PROVED SECOND-PREFIX TRANSPORT CONE AND EXACT THREE-RATE GGC
CERTIFICATE; PROVED OBSTRUCTION TO A FIXED-ROOT SHORTCUT].**

Continue with

\[
A=b_1<B=b_2<C=b_3,\qquad
(\alpha,\beta,\gamma)=(\beta_1,\beta_2,\beta_3),\qquad
\alpha+\beta+\gamma=1.
\]

Let \(a_2\in(B,C)\) be a rising root on the second cut and set

\[
\theta=G_2(a_2)=s_2(\Xi-d_2).
\]

The zero-total-mass identity gives an upper-tail version of the dangerous
prefix:

\[
\boxed{
C_t(a_2)
=U(t)+\int_{a_2}^{C}e^{-tr^2}
\bigl(\theta m_2(r)-a(r)\bigr)\,dr .
}
\tag{5.183}
\]

Thus \(C_t(a_2)\ge0\) in (5.183) is equivalent to inequality (5.164).  The
same prefix also admits a representation that keeps
the cancellation in WIP-5.17 inside one absolutely convergent integral.
Put

\[
D_0=C-B,\qquad
r_+(x)=B+\frac{D_0}{1-x},\qquad
\mathcal R_+(x)=\frac{a(r_+(x))}{m_3(r_+(x))}.
\]

Then

\[
\boxed{
U(t)=K\int_0^1 e^{-t r_+(x)^2}
\frac{x^{q-1}(1-\lambda x)^{-\alpha}}{1-x}
\bigl(1-\mathcal R_+(x)\bigr)\,dx .
}
\tag{5.184}
\]

Writing \(M=\alpha A+\beta B+\gamma C\), expansion at infinity gives

\[
\lim_{x\uparrow1}
\frac{1-\mathcal R_+(x)}{1-x}
=\frac{2M}{C-B}.
\tag{5.185}
\]

Thus the apparent singularity in (5.184) is removable.  This is the
pointwise regularization of the coupled cutoff in (5.169).  The exact map
between its two original cutoff coordinates is

\[
z=T(x)=\frac{2C-(B+C)x}{B+C-2Bx},
\qquad
T'(x)=-\frac{(C-B)^2}{(B+C-2Bx)^2}.
\]

For completeness, put

\[
r_-(v)=B+\frac{C-B}{1+v}.
\]

Combining the two finite terms in (5.183) yields

\[
\begin{aligned}
K^{-1}C_t(a_2)
={}&\int_0^1 e^{-t r_+(x)^2}
\frac{x^{q-1}(1-\lambda x)^{-\alpha}}{1-x}
\bigl(1-\mathcal R_+(x)\bigr)\,dx\\
&+\int_0^{v_{a_2}}e^{-t r_-(v)^2}
\frac{v^{q-1}(1+\lambda v)^{-\alpha}}{1+v}
\bigl(\theta-G_2(r_-(v))\bigr)\,dv .
\end{aligned}
\tag{5.186}
\]

This formula is finite term by term.  It does not, however, support a
fixed-root all-\(t\) proof.  If \(a\in(B,r_2^*)\) is held fixed,
\(\theta=G_2(a)\), and the right side of (5.183) is evaluated with that
fixed pair, then

\[
f(r)=\theta m_2(r)-a(r)
\]

satisfies \(f(a)=0\) and
\(f'(a)=-m_2(a)G_2'(a)<0\).  Endpoint Laplace asymptotics therefore gives

\[
\boxed{
C_t^{\mathrm{upper}}(a)
=-\frac{m_2(a)G_2'(a)}{4a^2t^2}
e^{-ta^2}\bigl(1+o(1)\bigr),
\qquad t\to\infty.
}
\tag{5.187}
\]

The leading coefficient is negative, so this quantity is negative for all
sufficiently large \(t\).  After the endpoint expansion, the remaining
terms begin on supports strictly above \(a\), hence are exponentially
smaller.  This proves only that a proof which freezes the rising root and
ignores the phase equation cannot work.  In the actual problem
\(a_2=a_2(t)\), and the root can move or disappear; (5.187) is not a
counterexample to (5.164).

There is nevertheless a successful transport when the adjacent lower cut
and the phase relation are retained.  The identity

\[
s_1(d_1-d_2)=\frac{\sin(\pi\beta)}{s_2}
\]

rewrites the full signed densities as

\[
k_{\Xi,t}(r)=a(r)+c_\theta m_1(r)
\quad(A<r<B),\qquad
k_{\Xi,t}(r)=a(r)-\theta m_2(r)
\quad(B<r<a_2),
\]

where

\[
\boxed{
c_\theta=\frac{\sin(\pi\beta)-s_1\theta}{s_2}.
}
\tag{5.188}
\]

Consequently,

\[
\begin{aligned}
C_t(a_2)
={}&\int_0^A e^{-tr^2}(a+m_0)(r)\,dr\\
&+\int_A^B e^{-tr^2}(a+c_\theta m_1)(r)\,dr\\
&+\int_B^{a_2}e^{-tr^2}(a-\theta m_2)(r)\,dr .
\end{aligned}
\tag{5.189}
\]

Let

\[
L=B-A,\qquad R=C-B,\qquad d=a_2-B,
\]

and pair \(r=B-Lx\) with \(s=B+dx\), \(0<x<1\).  Including the two
Jacobians, their exact density ratio is

\[
\boxed{
H_d(x)=
\frac{d\,m_2(B+dx)}{L\,m_1(B-Lx)}
=
\left(\frac{d(1-x)}{L+dx}\right)^\alpha
\left(\frac{d(R+Lx)}{L(R-dx)}\right)^\gamma .
}
\tag{5.190}
\]

If

\[
\boxed{
c_\theta\ge\theta\sup_{0\le x\le1}H_d(x),
}
\tag{5.191}
\]

then \(B-Lx<B+dx\), so the Gaussian weight only strengthens the lower-cut
side of the comparison.  Equations (5.189)--(5.191) give

\[
\begin{aligned}
c_\theta\int_A^B e^{-tr^2}m_1(r)\,dr
&\ge\theta\int_B^{a_2}e^{-tr^2}m_2(r)\,dr,\\
C_t(a_2)
&\ge
\int_0^{a_2}e^{-tr^2}a(r)\,dr
+\int_0^Ae^{-tr^2}m_0(r)\,dr>0.
\end{aligned}
\tag{5.192}
\]

Thus (5.191) is a direct analytic certificate for (5.164), without
discarding the \(t\)-dependent phase relation.  An optimization-free
pointwise envelope for its Jacobian is

\[
\boxed{
\sup_xH_d(x)\le\overline H(d):=
\left(\frac dL\right)^\alpha
\left(\frac{d(R+L)}{L(R-d)}\right)^\gamma .
}
\tag{5.193}
\]

Both factors on the right increase with \(d\).  If \(r_2^*\) is the unique
maximizer of \(G_2\), define

\[
D=r_2^*-B,\qquad M_2=G_2(r_2^*).
\]

Every rising root satisfies \(d<D\) and \(\theta<M_2\).  Hence the
rate-and-shape condition

\[
\boxed{
M_2\bigl(s_1+s_2\overline H(D)\bigr)
\le\sin(\pi\beta)
}
\tag{5.194}
\]

makes every possible second rising prefix strictly positive.  This is a
uniform second-prefix theorem; a complete GGC conclusion additionally
requires the first rising prefix and the interface to be controlled.

The following exact example shows that this transport cone has content
beyond the four earlier elementary cones checked below.  Take

\[
(\alpha,\beta,\gamma)
=\left(\frac14,\frac14,\frac12\right),
\qquad
(A,B,C)=(1,2,4).
\]

The critical polynomial (5.146), multiplied by \(4\), is

\[
\mathcal P_4(x)=11x^2-94x+128.
\tag{5.195}
\]

On the first cut,

\[
\mathcal P_4(1)=45>0,\qquad
\mathcal P_4(9/4)=-\frac{445}{16}<0,
\]

so \(r_1^*<3/2\).  For every first rising root \(a<r_1^*\), the support
ratio (5.102) satisfies

\[
\left(\frac{w_a}{z_a}\right)^{3/2}
=
\left(\frac{a-1}{a+1}\right)^2
\frac{(a+2)(4-a)}{(2-a)(a+4)}
<
\frac7{55}<1.
\tag{5.196}
\]

Indeed, both displayed factors are increasing on \(1<a<3/2\); for the
second one,

\[
\frac d{da}\log\frac{(a+2)(4-a)}{(2-a)(a+4)}
=\frac4{4-a^2}-\frac8{16-a^2}>0.
\]

Thus WIP-5.12 controls every first rising prefix.

On the second cut,

\[
\mathcal P_4(25/4)=-\frac{477}{16}<0,\qquad
\mathcal P_4(64/9)=\frac{1280}{81}>0,
\]

and hence

\[
\frac52<r_2^*<\frac83,\qquad D<\frac23.
\]

At this maximizer, monotonicity of the three elementary factors in \(G_2\)
gives

\[
\boxed{
M_2^4<
\frac5{11}\frac17\left(\frac3{13}\right)^2
=\frac{45}{13013}<\frac1{256},
\qquad M_2<\frac14.
}
\tag{5.197}
\]

Here \(L=1\), \(R=2\), and therefore

\[
\overline H(D)
=D^{1/4}\left(\frac{3D}{2-D}\right)^{1/2}
<\sqrt{\frac32}.
\]

Since \(s_1=1/\sqrt2\), \(s_2=1\), and
\(\sin(\pi\beta)=1/\sqrt2\), equations (5.193) and (5.197) yield

\[
M_2\bigl(s_1+s_2\overline H(D)\bigr)
<
\frac{1+\sqrt3}{4\sqrt2}
<\frac1{\sqrt2}.
\tag{5.198}
\]

Thus (5.194) controls every second rising prefix.  Moreover
\(\alpha=\beta\), so (5.160) and (5.157) give \(C_t(b_2)>0\).
The two exterior endpoints are positive, and cases without a rising root
introduce no other local minimum.  The finite-prefix criterion (5.162)
therefore proves \(C_t(x)\ge0\) for every \(x,t>0\), with strict positivity
on a set of positive measure.  It follows that \(\Xi'(t)>0\) and

\[
\boxed{
\left(
G_{1/4}^{(1)}
+\frac{G_{1/4}^{(2)}}2
+\frac{G_{1/2}^{(3)}}4
\right)^2\in GGC.
}
\tag{5.199}
\]

The finite rational checks in (5.195)--(5.199) are reproduced by
[computations/route5_three_rate_transport_certificate.py](computations/route5_three_rate_transport_certificate.py)
using Python's exact `fractions.Fraction`.  The script verifies the
displayed polynomial values, \(7/55\), \(45/13013<1/256\), the radical
comparisons after squaring, and the weighted mean.  The transport theorem
itself is the analytic proof above and is not inferred from the script.

This example is not covered by the earlier simple cones:

\[
\frac{b_3}{b_1}=4>\frac{1+\sqrt5}{2},\qquad
\sum_i\beta_i b_i=\frac{11}{4}>2b_1,\qquad
\beta_1=\frac14<\frac12.
\]

It also has \(\beta_3=1/2\), so the strict last-cut-suppression condition
(5.166) fails.  This is a new parameter certificate, not a resolution of
the general three-rate problem.

### WIP-5.20 — multicut zero-temperature phase capacity

**Status: [PROVED ARBITRARY FINITE-RATE SUFFICIENT THEOREM; PROVED A
STRICTLY IMPROVED THREE-RATE THRESHOLD].**

Return to the arbitrary finite, total-shape-one setting of WIP-5.14 and
write \(m=n-1\) for the number of cuts.  For \(2\le j\le m\), define

\[
\eta_j(t)=\Xi(t)-d_j,\qquad
g_{j,*}=\sup_{r\in I_j}g_j(r),\qquad
\delta_j=d_{j-1}-d_j
=\frac{\sin(\pi\beta_j)}{s_{j-1}s_j}>0.
\tag{5.200}
\]

The correct capacity for an internal cut is normalized by the cuts up to
and including that cut, not by all cuts.  Put

\[
T_j(t)=\sum_{i\le j}B_i(t),\qquad
H_j(t)=\sum_{i<j}B_i(t)(d_i-d_j),\qquad
\widehat{\mathcal R}_j(t)=\frac{H_j(t)}{T_j(t)}.
\tag{5.201}
\]

For fixed \(j\), let

\[
h_i^{(j)}=(d_i-d_j)\mathbf 1_{\{i<j\}},
\qquad
\widehat\omega_i^{(j)}(t)=\frac{B_i(t)}{T_j(t)},
\qquad 1\le i\le j.
\]

The sequence \(h_i^{(j)}\) strictly decreases, whereas the ordered cut
supports give \(\mu_1<\cdots<\mu_j\).  Reverse-order covariance therefore
gives

\[
\boxed{
\widehat{\mathcal R}_j'(t)
=-\operatorname{Cov}_{\widehat\omega^{(j)}(t)}
  (h_i^{(j)},\mu_i)
=\sum_{i<k\le j}\widehat\omega_i^{(j)}\widehat\omega_k^{(j)}
 (h_i^{(j)}-h_k^{(j)})(\mu_k-\mu_i)>0.
}
\tag{5.202}
\]

This leads to the following multicut theorem.

\[
\boxed{
\begin{gathered}
g_{1,*}\le\frac{P(0)}{B_1(0)},\\
g_{j,*}\le
\min\{\delta_j,\widehat{\mathcal R}_j(0)\},
\qquad 2\le j\le m
\end{gathered}
\quad\Longrightarrow\quad
C_t(x)\ge0\quad(t>0,x>0).
}
\tag{5.203}
\]

Consequently \(\Xi'(t)>0\) and

\[
\boxed{
\left(\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i}\right)^2\in GGC,
\qquad
\beta_i>0,\qquad\sum_i\beta_i=1.
}
\tag{5.204}
\]

Here and below the gamma variables are independent.  The proof is a global
sign classification.  On cut \(j\), the density is positive if
\(\eta_j\le0\), has the pattern \(-,+,-\) if
\(0<\eta_j<g_{j,*}\), and is nonpositive if
\(\eta_j\ge g_{j,*}\).  Moreover,

\[
\eta_j-\eta_{j-1}=\delta_j.
\tag{5.205}
\]

If cut \(j\) is active, then
\(0<\eta_j<g_{j,*}\le\delta_j\), so
\(\eta_{j-1}<0\) and every lower cut is positive.  If a higher cut \(k\)
were also active, then its own gap inequality would give
\(\eta_{k-1}<0\), contradicting
\(\eta_{k-1}>\eta_j>0\).  Thus at most one cut is active, and every cut
above it is nonpositive.

Suppose the unique active cut is \(j\ge2\), and let \(r_j^-\) be its
rising root.  With \(\overline g_i\) as in (5.156), direct integration up
to \(b_j\) gives

\[
C_t(b_j)=P(t)+\sum_{i<j}B_i(t)
 [\overline g_i(t)+d_i-d_j-\eta_j(t)].
\]

The initial negative lobe obeys
\(0<N_{j,-}(t)<\eta_j(t)B_j(t)\).  Hence

\[
\boxed{
C_t(r_j^-)
>H_j(t)-\eta_j(t)T_j(t)
=T_j(t)[\widehat{\mathcal R}_j(t)-\eta_j(t)]>0,
}
\tag{5.206}
\]

where (5.202)--(5.203) and \(\eta_j<g_{j,*}\) give the last inequality.
If the first cut is active, (5.172) and
\(N_{1,-}<\eta_1B_1<g_{1,*}B_1\) instead give
\(C_t(r_1^-)>0\).  After the unique rising minimum the cumulative mass
first increases and then decreases to \(C_t(\infty)=0\), so it never
becomes negative.  If no cut is active, the strict increase of \(\eta_j\)
forces one positive block followed by one nonpositive block; zero total
mass gives the same conclusion.  This also covers the tangent cases
\(\eta_j=0\) and \(\eta_j=g_{j,*}\).

There is a simpler, more conservative form.  Define

\[
\widehat\lambda_{j,0}
=\frac{\sum_{i<j}B_i(0)}{\sum_{i\le j}B_i(0)}.
\tag{5.207}
\]

Since \(d_i-d_j\ge\delta_j\) for every \(i<j\),
\(\widehat{\mathcal R}_j(0)\ge
\widehat\lambda_{j,0}\delta_j\).  Therefore

\[
\boxed{
g_{1,*}\le\frac{P(0)}{B_1(0)},qquad
g_{j,*}\le\widehat\lambda_{j,0}\delta_j
\quad(2\le j\le m)
}
\tag{5.208}
\]

already implies (5.203); the second inequality automatically implies the
strict peak-gap bound because \(0<\widehat\lambda_{j,0}<1\).

For the last cut, \(T_m(0)=\sum_{i=1}^mB_i(0)=\pi\).  In particular, in
the three-rate case (5.208) becomes

\[
\boxed{
g_{2,*}\le\omega_{1,0}\Delta
\quad\Longleftrightarrow\quad
M_2\le
\omega_{1,0}\frac{\sin(\pi\beta)}{s_1}.
}
\tag{5.209}
\]

This strictly improves the second condition in (5.174), which contains
the smaller factor \(\omega_{1,0}/(1+\omega_{1,0})\).  The improvement
comes from retaining the actual moving height \(\eta_j\) both in the
phase loss and in the lobe estimate, rather than bounding it twice by
\(g_{j,*}\).

The exact checks are triangular.  At \(t=0\),

\[
\boxed{
H_2=B_1\delta_2,qquad
H_{j+1}=H_j+\delta_{j+1}T_j,qquad
T_{j+1}=T_j+B_{j+1},
}
\tag{5.210}
\]

where all quantities in (5.210) are evaluated at zero.  Equivalently,
\(H_j=\sum_{q=2}^j\delta_qT_{q-1}\), and the exact capacity test is
\(g_{j,*}\le H_j/T_j\).

The endpoint envelope (5.150) removes the critical-point optimizations.
Writing \(u_j=U_j/s_j\), a root-free version is

\[
\boxed{
u_1\le\frac{P(0)}{B_1(0)},qquad
u_j\le\min\{\delta_j,H_j(0)/T_j(0)\},
\quad 2\le j\le m.
}
\tag{5.211}
\]

One can also remove the remaining cut integrals.  If
\(L_i=b_{i+1}-b_i\), then endpoint comparison followed by the beta integral
gives

\[
\begin{aligned}
\underline B_i:={}&s_iL_i^{1-\beta_i-\beta_{i+1}}
 \mathrm B(1-\beta_i,1-\beta_{i+1})\\
&\times
 \prod_{k<i}(b_{i+1}-b_k)^{-\beta_k}
 \prod_{k>i+1}(b_k-b_i)^{-\beta_k}
\le B_i(0),
\end{aligned}
\tag{5.212}
\]

with equality only when \(n=2\).  Also

\[
\begin{aligned}
\underline P&=b_1\left[
 \prod_kb_k^{-\beta_k}+\prod_k(b_k+b_1)^{-\beta_k}
 \right]<P(0),\\
\overline B_1&=s_1L_1^{1-\beta_1-\beta_2}
 \mathrm B(1-\beta_1,1-\beta_2)
 \prod_{k=3}^n(b_k-b_2)^{-\beta_k}\ge B_1(0).
\end{aligned}
\tag{5.213}
\]

The last inequality is strict for \(n\ge3\) and an equality for \(n=2\).
It follows that the entirely parameter-level conditions

\[
\boxed{
u_1\le\frac{\underline P}{\overline B_1},qquad
u_j\le\min\left\{
\delta_j,\frac1\pi\sum_{i<j}\underline B_i(d_i-d_j)
\right\},\quad 2\le j\le m,
}
\tag{5.214}
\]

imply (5.203).  The denominator \(\pi\) in (5.214) deliberately gives up
the stronger prefix normalization in order to avoid upper-bounding every
partial mass \(T_j(0)\).

This cone reaches arbitrarily close to equal rates, but it does not contain
a full neighborhood of the equal-rate diagonal.  More precisely, for a
fixed nondegenerate gap profile \(c_1<\cdots<c_n\) and
\(b_i=b+\varepsilon c_i\), substitution
\(r=b+\varepsilon x\) shows that every \(B_i(0)\) is a fixed positive
constant, whereas

\[
U_j(\varepsilon)=\frac{\varepsilon}{2b}
\left[
\prod_{i\le j}(c_{j+1}-c_i)^{\beta_i}
\prod_{i>j}(c_i-c_j)^{\beta_i}
\right](1+O(\varepsilon)).
\tag{5.215}
\]

Thus every fixed gap-profile ray eventually satisfies (5.211), and the
certificate has open parameter regions arbitrarily close to the diagonal.
Uniformity fails when gap ratios degenerate.  Indeed, for
\(\beta_1=\beta_2=\beta_3=1/3\) and

\[
(b_1,b_2,b_3)=(1,1+\varepsilon^p,1+\varepsilon),\qquad p>4,
\]

the exact hypergeometric asymptotic in (5.179) gives

\[
\widehat{\mathcal R}_2(0)
=\frac{\mathrm B(2/3,2/3)}\pi
 \varepsilon^{(p-1)/3}(1+o(1)),
\qquad
g_{2,*}\ge\frac{\varepsilon}{2\sqrt3}(1+o(1)).
\]

Hence the capacity condition fails for small \(\varepsilon\), although
these laws remain inside the earlier golden-ratio support cone.  This is a
limitation of the new certificate, not a GGC counterexample.  All results
in this subsection are project derivations, not claims imported from the
literature.

### WIP-5.21 — exact and averaged adjacent-cut transport

**Status: [PROVED EXACT QUADRATIC MAXIMUM AND A STRICT CERTIFICATE
HIERARCHY; PROVED TWO NEW THREE-RATE GGC EXAMPLES].**

Return to the three-rate notation of WIP-5.19.  The coarse envelope
\(\overline H(d)\) in (5.193) can first be replaced by the exact maximum of
the transport ratio.  Put \(s=\alpha+\gamma=1-\beta\).  Direct
differentiation of (5.190) gives

\[
(\log H_d)'(x)
=(L+d)\left[
-\frac{\alpha}{(1-x)(L+dx)}
+\frac{\gamma R}{(R+Lx)(R-dx)}
\right].
\tag{5.216}
\]

Its sign is the sign of \(Q_d(x)=A_0+A_1x+A_2x^2\), where

\[
\begin{aligned}
A_0&=R(\gamma L-\alpha R),&
A_1&=R(\alpha+\gamma)(d-L),\\
A_2&=d(\alpha L-\gamma R),&
Q_d(1)&=-\alpha(R+L)(R-d)<0,\\
\operatorname{disc}(Q_d)
&=R^2(\alpha+\gamma)^2(d+L)^2
-4\alpha\gamma dR(L+R)^2.
\end{aligned}
\tag{5.217}
\]

A quadratic has at most one crossing from positive to negative.  If
\(A_2\ne0\), the unique possible interior peak is

\[
x_*=\frac{-A_1-\sqrt{\operatorname{disc}(Q_d)}}{2A_2},
\qquad Q_d'(x_*)=-\sqrt{\operatorname{disc}(Q_d)}<0,
\]

provided the discriminant is positive and \(x_*\in(0,1)\).  If \(A_2=0\),
retain instead \(x_*=-A_0/A_1\) only when \(A_1<0\) and this point lies in
\((0,1)\).  With a nonexistent candidate omitted,

\[
\boxed{
\mathcal H(d):=\sup_{0\le x\le1}H_d(x)
=\max\left\{\left(\frac dL\right)^{\alpha+\gamma},H_d(x_*)\right\}.
}
\tag{5.218}
\]

No optimization of degree higher than two is hidden here.  Also

\[
\partial_d\log H_d(x)
=\frac{\alpha L}{d(L+dx)}
+\frac{\gamma R}{d(R-dx)}>0,
\]

so \(\mathcal H(d)\) strictly increases with \(d\).  The exact criterion
for \(H_d\) to decrease is \(Q_d\le0\) on \([0,1]\); for example it follows
from \(\gamma L\le\alpha R\) together with either \(d\le L\) or
\(\alpha L\ge\gamma R\).

There is also a radical-free envelope strictly below (5.193).  Let

\[
\lambda=\frac dL,qquad \mu=\frac dR,qquad
V=\frac{\lambda+\mu}{1-\mu},qquad
\vartheta=\frac\alpha{\alpha+\gamma},qquad
\varpi=\frac\gamma{\alpha+\gamma},
\]

and define

\[
\widehat H(d)=
\begin{cases}
\lambda^{\alpha+\gamma},&\varpi V\le\lambda,\\[1mm]
\displaystyle
\left\{\varpi V
\left[\frac{\vartheta\lambda}{\varpi(V-\lambda)}\right]^{\vartheta}
\right\}^{\alpha+\gamma},&\varpi V>\lambda.
\end{cases}
\tag{5.219}
\]

Indeed, write
\(H_d^{1/(\alpha+\gamma)}=u^{\vartheta}v^{\varpi}\), where

\[
u=\frac{\lambda(1-x)}{1+\lambda x},qquad
v=\frac{\lambda+\mu x}{1-\mu x}.
\]

For every \(\tau>0\), scaled weighted AM--GM bounds this by
\(\vartheta\tau u+\varpi\tau^{-\vartheta/\varpi}v\).  Both \(u\) and
\(v\) are convex, so the maximum of the right side is at an endpoint;
optimizing \(\tau\) gives (5.219).  The result is the strict hierarchy

\[
\boxed{
\mathcal H(d)\le\widehat H(d)<\overline H(d).
}
\tag{5.220}
\]

In the first branch of (5.219), equality
\(\mathcal H(d)=\lambda^{\alpha+\gamma}\) holds; the branch condition is
equivalent to \(d\le(\alpha R-\gamma L)/(\alpha+\gamma)\).  Thus the exact
pointwise-transport replacement for (5.194) is

\[
\boxed{
M_2[s_1+s_2\mathcal H(D)]\le\sin(\pi\beta),
}
\tag{5.221}
\]

and \(\widehat H(D)\) gives a fully explicit condition strictly stronger
than the old \(\overline H(D)\) test.

An integrated comparison is stronger still.  Define

\[
J_1(t)=\int_A^B e^{-tr^2}m_1(r)\,dr,qquad
J_{2,d}(t)=\int_B^{B+d}e^{-tr^2}m_2(r)\,dr,qquad
\mathcal A(d)=\frac{J_{2,d}(0)}{J_1(0)}.
\tag{5.222}
\]

The transport identity (5.190) shows that

\[
\mathcal A(d)=\int_0^1H_d(x)\,\pi_0(dx),qquad
\pi_0(dx)=\frac{L m_1(B-Lx)}{J_1(0)}\,dx.
\]

Since \(H_d\) is nonconstant and \(\pi_0\) has positive density on
\((0,1)\), \(\mathcal A(d)<\mathcal H(d)\).  More importantly, the two
integrals in (5.222) have strictly ordered supports.  If their respective
\(r^2\)-means are \(\mu_1\) and \(\mu_{2,d}\), then

\[
\left(\frac{J_{2,d}}{J_1}\right)'
=\frac{J_{2,d}}{J_1}(\mu_1-\mu_{2,d})<0.
\]

Since \(\mathcal A(d)\) increases with \(d\), this proves the exact
two-parameter extremum

\[
\boxed{
\sup_{t\ge0,\ 0<d\le D}\frac{J_{2,d}(t)}{J_1(t)}
=\mathcal A(D)<\mathcal H(D).
}
\tag{5.223}
\]

Consequently the exact uniform condition for this adjacent mass comparison
is

\[
\boxed{
M_2[s_1+s_2\mathcal A(D)]\le\sin(\pi\beta).
}
\tag{5.224}
\]

It strictly weakens the exact-sup condition (5.221), without any monotonicity
assumption on \(H_D\).  If desired, its two zero-temperature integrals are

\[
\begin{aligned}
J_1(0)&=u^\gamma\mathrm B(1-\alpha,1-\beta)
 {}_2F_1(\gamma,1-\alpha;1+\gamma;u),\\
J_{2,d}(0)&=\frac{d^{\alpha+\gamma}}
 {(\alpha+\gamma)L^\alpha R^\gamma}
 F_1\left(\alpha+\gamma;\alpha,\gamma;
 1+\alpha+\gamma;-\frac dL,\frac dR\right),
\qquad u=\frac{L}{L+R},
\end{aligned}
\tag{5.225}
\]

by the change of variables \(r=B+dy\).  Here the Appell notation is fixed
directly by

\[
F_1(s;\alpha,\gamma;s+1;x,y)
:=s\int_0^1z^{s-1}(1-xz)^{-\alpha}(1-yz)^{-\gamma}\,dz,
\]

so no separate special-function identity is being imported.

The strict improvement over the coarse pointwise cone has an exact GGC
witness.  Take

\[
(\alpha,\beta,\gamma)=\left(\frac15,\frac15,\frac35\right),
\qquad (A,B,C)=(1,2,7).
\]

Then

\[
\mathcal P(x)=\frac65(4x-7)(x-9),qquad
r_2^*=3,qquad D=1,qquad M_2^5=\frac4{625}.
\tag{5.226}
\]

Here \(L=1,R=5\), and

\[
(\log H_D)'(x)
=-\frac{4(5+7x^2)}{5(1-x^2)(25-x^2)}<0,
\qquad \mathcal H(D)=1.
\]

Put \(\phi=(1+\sqrt5)/2=s_2/s_1\).  Since
\(\phi^{10}=34+55\phi<144\),

\[
(M_2\phi^2)^5
=\frac4{625}\phi^{10}<\frac{576}{625}<1,
\]

so (5.221) holds.  On the other hand,
\(\overline H(D)=(3/2)^{3/5}\), and the exact bounds

\[
M_2>\frac9{25},\qquad
\phi>\frac85,qquad
\overline H(D)>\frac54
\]

give

\[
M_2[1+\phi\overline H(D)]>\frac{27}{25}>1.
\tag{5.227}
\]

Thus the old condition (5.194) fails strictly.  For the first cut,
\(r_1^*=\sqrt7/2<4/3\), and the support ratio (5.102) satisfies

\[
R(a)^4<7^{-5}\left(\frac{17}{5}\right)^3<1
\qquad(1<a<r_1^*).
\]

Hence WIP-5.12 controls the first prefix; \(\alpha=\beta\) controls the
interface by (5.160), and (5.221) controls every second rising prefix.
Therefore

\[
\boxed{
\left(
G_{1/5}^{(1)}+\frac{G_{1/5}^{(2)}}2+
\frac{G_{3/5}^{(3)}}7
\right)^2\in GGC.
}
\tag{5.228}
\]

The average cone is genuinely larger than even the exact-sup cone.  An
exact witness is

\[
(\alpha,\beta,\gamma)=\left(\frac18,\frac18,\frac34\right),
\qquad (A,B,C)=(5,7,23).
\]

Here

\[
\mathcal P(x)=\frac{15}{4}(5x-161)(x-81),qquad
r_2^*=9,\qquad D=L=2,\qquad M_2^8=\frac{7^5}{2^{26}},
\tag{5.229}
\]

and \(H_D\) decreases with \(\mathcal H(D)=1\).  Write
\(c=s_2/s_1=\sqrt{2+\sqrt2}\).  Exact integer comparisons give

\[
M_2>\frac{23}{65},qquad c>\frac{11}{6},qquad
M_2(1+c)>\frac{391}{390}>1,
\]

so (5.221) fails.  Nevertheless, with

\[
w(x)=x^{-1/8}(1-x)^{-1/8}(8+x)^{-3/4},
\]

one has

\[
(\log H_D)'(x)+\frac1{16}
=\frac{x^2(x^2-253)}{16(1-x^2)(64-x^2)}\le0.
\]

Thus \(H_D(x)\le e^{-x/16}\le1-x/17\).  Comparing the weight \(w\)
with the symmetric \(\operatorname{Beta}(7/8,7/8)\) density gives

\[
\mathbb E_{\pi_0}X
\ge\frac12\left(\frac89\right)^{3/4}>\frac49,
\qquad
\mathcal A(D)<\frac{149}{153}.
\]

The complementary exact bounds \(M_2<11/31\) and \(c<37/20\) now yield

\[
M_2[1+c\mathcal A(D)]
<\frac{11}{31}\left(1+\frac{37}{20}\frac{149}{153}\right)
=\frac{94303}{94860}<1.
\tag{5.230}
\]

For auditability, the two large-integer comparisons used for the bounds on
\(M_2\) are

\[
7^5 65^8-2^{26}23^8=100102109324103591>0,
\]

\[
2^{26}11^8-7^5 31^8=50841325950297>0.
\]

Finally, \(r_1^*=\sqrt{161/5}<23/4\), and monotonicity of the two factors
in (5.102) gives

\[
R(a)^7<\left(\frac1{14}\right)^8 7^6<1
\qquad(5<a<r_1^*).
\]

The first prefix, interface, and second prefix are therefore all controlled,
and

\[
\boxed{
\left(
\frac{G_{1/8}^{(1)}}5+
\frac{G_{1/8}^{(2)}}7+
\frac{G_{3/4}^{(3)}}{23}
\right)^2\in GGC.
}
\tag{5.231}
\]

There is a sharp limitation on this transport method.  Fix the shapes and
rates \(B=1<C=c\), and let \(A=1-\varepsilon\).  As
\(\varepsilon\downarrow0\), the second-cut maximizer and maximum converge
to nondegenerate limits \(D_0,M_0>0\), while

\[
\mathcal H(D_\varepsilon)
\ge\left(\frac{D_\varepsilon}{\varepsilon}\right)^{\alpha+\gamma}
\longrightarrow\infty,
\qquad
\mathcal A(D_\varepsilon)\longrightarrow\infty.
\tag{5.232}
\]

For the second assertion, \(J_1(0)=O(\varepsilon^\gamma)\), whereas the
truncated second-cut mass has a positive lower bound.  Thus neither the
pointwise nor the averaged adjacent-cut certificate can yield a
shape-only theorem uniform over all rates.  This is a method-specific
no-go, not a failure of (5.164) or a GGC counterexample.  All statements in
this subsection are new project derivations.

### WIP-5.22 — full lower-buffer and regularized upper-tail criteria

**Status: [PROVED ENDPOINT, MASS, AND EXPLICIT UPPER-TAIL CONES;
REFUTED A ONE-CURVATURE JENSEN SHORTCUT].**

The averaged comparison in WIP-5.21 uses the adjacent lower cut but still
discards the positive exterior and direct terms.  Retaining every positive
term below \(B\) yields a still more flexible endpoint criterion.  Put

\[
\begin{aligned}
D_1&=\int_A^B m_1(r)\,dr,&
D_2(x)&=\int_B^x m_2(r)\,dr,&
A_2(x)&=\int_B^x a(r)\,dr,\\
B_-&=\int_0^A(a+m_0)(r)\,dr+
     \int_A^B a(r)\,dr.
\end{aligned}
\tag{5.233}
\]

Let \(r_*=r_2^*\), \(M=G_2(r_*)\), and for a rising point
\(x\in(B,r_*)\) set

\[
\theta=G_2(x),qquad
c_\theta=\frac{\sin(\pi\beta)-s_1\theta}{s_2},qquad
c_M=\frac{\sin(\pi\beta)-s_1M}{s_2}.
\]

Assume first that \(c_M\ge0\).  Then every density contribution below
\(B\) is positive, while the initial second-cut lobe has density
\((\theta-G_2)m_2\).  Its unweighted balance against the full lower buffer
is

\[
F_{\mathrm{full}}(x)
=B_-+c_\theta D_1-[\theta D_2(x)-A_2(x)].
\]

The phase equation produces an exact cancellation of the moving endpoint:
because \(a(x)=G_2(x)m_2(x)=\theta m_2(x)\),

\[
\boxed{
F_{\mathrm{full}}'(x)
=-G_2'(x)\left(\frac{s_1}{s_2}D_1+D_2(x)\right)<0,
\qquad B<x<r_*.
}
\tag{5.234}
\]

It follows that the entire rising branch is controlled by one endpoint:

\[
\boxed{
c_M\ge0,qquad
B_-+c_MD_1\ge MD_2(r_*)-A_2(r_*)
\quad\Longrightarrow\quad
C_t(x)>0
}
\tag{5.235}
\]

for every \(t>0\) and every second-cut rising root \(x\) that occurs.
Indeed, all positive mass in this comparison lies strictly to the left of
all negative mass, so multiplication by \(e^{-tr^2}\) only strengthens a
nonnegative unweighted balance.  Even equality in (5.235) gives strict
positivity at each genuine rising point \(x<r_*\) by (5.234).  This is a
second-prefix theorem; a complete GGC conclusion still requires the first
prefix and interface.

The incomplete integrals can be removed.  From

\[
s_1D_1+s_2D_2(C)=\pi,qquad
MD_2(r_*)-A_2(r_*)<MD_2(C),
\]

one obtains

\[
\boxed{
c_M\ge0,qquad
M\pi\le s_2B_-+\sin(\pi\beta)D_1
\quad\Longrightarrow\quad\text{(5.235)}.
}
\tag{5.236}
\]

Replacing \(M\) by any explicit upper bound \(\widehat M\ge M\), such as
\(U_2\) from (5.150), makes (5.236) genuinely root-free.  In terms of
\(M\), the old second condition in (5.174) is

\[
M(\pi+s_1D_1)\le\sin(\pi\beta)D_1.
\tag{5.237}
\]

It implies both inequalities in (5.236).  The converse is false, as the
exact example below proves; hence the retained lower buffer gives a strict
enlargement of that older mass cone.

There is a complementary upper-tail form.  Define the endpoint center

\[
\Xi_M=d_2+\frac M{s_2},qquad c_M=s_1(d_1-\Xi_M).
\]

At \(t=0\), the original definition of \(N\) gives \(N(0)=0\), while
\(Q(0)=1\).  Thus the signed density centered at \(\Xi_M\) has total mass
\(-\pi\Xi_M\).  Its density is nonpositive after \(r_*\), and therefore

\[
\boxed{
F_{\mathrm{full}}(r_*)
=U(0)+\int_{r_*}^{C}(M-G_2(r))m_2(r)\,dr-\pi\Xi_M.
}
\tag{5.238}
\]

In particular, \(c_M\ge0\) together with either \(\Xi_M\le0\) or
\(U(0)\ge\pi\Xi_M\) implies (5.235).  Equality suffices because the
second-cut tail in (5.238) is strictly positive.

The regularized upper tail has a useful completely explicit lower bound.
For \(r>C\), put

\[
q_i(r)=\frac{r-b_i}{r+b_i},qquad
R(r)=\frac{a(r)}{m_3(r)}=\prod_iq_i(r)^{\beta_i},qquad
S(r)=\sum_i\frac{\beta_i b_i}{r+b_i}.
\]

Weighted AM--GM and \(\sum_i\beta_i=1\) give
\(R<\sum_i\beta_iq_i=1-2S\).  Since
\((ra(r))'=a(r)S(r)\) and \(ra(r)\to1\),

\[
\boxed{
U(0)=\int_C^\infty(m_3-a)(r)\,dr
>2\int_C^\infty a(r)S(r)\,dr
=2[1-Ca(C)].
}
\tag{5.239}
\]

Consequently

\[
\boxed{
c_M\ge0,qquad
\pi\Xi_M\le2[1-Ca(C)]
}
\tag{5.240}
\]

is a fully explicit regularized-upper-tail certificate.  Again,
\(\widehat M\ge M\) can eliminate the critical root.

These new cones separate strictly from (5.237) on the exact example of
WIP-5.19,

\[
(\alpha,\beta,\gamma)=\left(\frac14,\frac14,\frac12\right),
\qquad (A,B,C)=(1,2,4).
\]

There \(M<1/4\), \(s_2=1\), \(\Xi_M=M\), and \(c_M>0\).  Monotonicity of
\(a\) and \(m_0\) gives

\[
B_->\frac2{432^{1/4}}+\frac1{2\,2^{1/4}}
>\frac25+\frac5{12}=\frac{49}{60}
>\frac{11}{14}>\frac\pi4>M\pi.
\tag{5.241}
\]

Here \(\pi<22/7\) follows, for example, by integrating the positive
function \(x^4(1-x)^4/(1+x^2)\) over \((0,1)\); the integral equals
\(22/7-\pi\).  Thus (5.236) holds.  Independently,

\[
Ca(C)=\left(\frac2{15}\right)^{1/4}<\frac{17}{28},
\]

because \(15\cdot17^4=1252815>1229312=2\cdot28^4\); hence (5.240) also
holds.

The older condition (5.237) fails.  At \(r=5/2\),

\[
G_2(5/2)^4=\frac3{1183}>\left(\frac29\right)^4,
\]

so \(M>2/9\).  On the other hand,

\[
B_1(0)<\frac12\mathrm B\left(\frac34,\frac34\right)<\frac67.
\]

For the last inequality, symmetry reduces the beta integral to
\([0,1/2]\), and the secant bound for the convex function
\((1-x)^{-1/4}\) gives

\[
\mathrm B\left(\frac34,\frac34\right)
<\frac{16\,2^{1/4}+12\sqrt2}{21}<\frac{12}{7};
\]

the final comparison reduces by two squarings to \(9801>9800\).  Since
\(\pi>3\), it follows that
\(\pi M/(1-M)>6/7>B_1(0)\), precisely the strict negation of (5.237).
This is an independent certificate for the already established law
(5.199), not a new distributional example.

Finally, integration by parts identifies both a possible route and a
rigorous obstruction to its simplest implementation.  Let

\[
J_*:=\int_B^{r_*}(M-G_2(r))m_2(r)\,dr.
\]

If \(r_\uparrow\) is the rising inverse of \(G_2\), then

\[
\boxed{
J_*=\int_B^{r_*}D_2(r)G_2'(r)\,dr
=\int_0^M D_2(r_\uparrow(y))\,dy.
}
\tag{5.242}
\]

For \(H(y)=D_2(r_\uparrow(y))\) and
\(L(r)=(\log G_2)'(r)>0\), direct differentiation gives

\[
\operatorname{sgn}H''(y)=\operatorname{sgn}V(r),qquad
V(r)=2(\log m_2)'(r)-(\log a)'(r)-\frac{L'(r)}{L(r)}.
\tag{5.243}
\]

This profile has no fixed curvature.  For

\[
(\alpha,\beta,\gamma)=\left(\frac5{11},\frac5{11},\frac1{11}\right),
\qquad(A,B,C)=(1,2,5),qquad r=\frac73,
\]

exact rational substitution yields

\[
L(7/3)=\frac{17829}{12584}>0,qquad
V(7/3)=-\frac{1023657}{17806360}<0.
\]

Thus \(H''<0\) at a rising point.  Yet, if
\(\kappa=-G_2''(r_*)>0\), then as \(y\uparrow M\),

\[
H(y)=D_2(r_*)-m_2(r_*)
\sqrt{\frac{2(M-y)}\kappa}+O(M-y),
\]

so \(H''(y)>0\) near the peak.  This rules out a global convex-Jensen or
concave-chord proof of (5.242), but it is not a counterexample to (5.235),
(5.164), or the GGC conjecture.  At this stage it left open whether
\(c_M\ge0\) alone forces \(F_{\mathrm{full}}(r_*)\ge0\); WIP-5.25 below
resolves that question affirmatively.  Every assertion in this subsection
is a new project derivation.

The finite polynomial factorizations, large-integer comparisons, rational
bounds, and curvature values used in WIP-5.20--WIP-5.23 are reproduced by
[computations/route5_phase_capacity_transport_hierarchy.py](computations/route5_phase_capacity_transport_hierarchy.py)
using only Python integers and `fractions.Fraction`.  The analytic
covariance, transport, endpoint, and support-order arguments are the proofs;
they are not inferred from the script.

### WIP-5.23 — peak-gap-free lower-triangular phase capacity

**Status: [PROVED ARBITRARY FINITE-RATE SUFFICIENT THEOREM WITHOUT A
PEAK-GAP HYPOTHESIS; PROVED STRICTNESS AND ACTUAL SIMULTANEOUS
ACTIVITY].**

WIP-5.20 discarded the positive exterior mass \(P(t)\) when protecting an
internal rising prefix and imposed \(g_{j,*}\le\delta_j\) in order to leave
at most one active cut.  Neither loss is necessary.  Retain
\(T_j,H_j\) from (5.201), set \(H_1=0\), and define the full
lower-triangular capacity

\[
\boxed{
\mathfrak C_j(t)=\frac{P(t)+H_j(t)}{T_j(t)},\qquad
T_j=\sum_{i\le j}B_i,\qquad
H_j=\sum_{i<j}B_i(d_i-d_j).
}
\tag{5.244}
\]

These capacities possess a particularly simple recursion.  If

\[
\lambda_j(t)=\frac{T_j(t)}{T_{j+1}(t)},\qquad
\mu_{\le j}(t)=\frac{\sum_{i\le j}B_i(t)\mu_i(t)}{T_j(t)},
\]

then \(H_{j+1}=H_j+\delta_{j+1}T_j\), and hence

\[
\boxed{
\begin{aligned}
\mathfrak C_1&=\frac{P}{B_1},&
\mathfrak C_{j+1}
 &=\lambda_j\bigl(\mathfrak C_j+\delta_{j+1}\bigr),\\
\mathfrak C_1'
 &=\mathfrak C_1(\mu_1-\mu_P)>0,&
\lambda_j'
 &=\lambda_j(1-\lambda_j)(\mu_{j+1}-\mu_{\le j})>0.
\end{aligned}
}
\tag{5.245}
\]

Here \(\mu_P<b_1^2<\mu_1\), and the disjoint ordered supports give
\(\mu_{\le j}<\mu_{j+1}\).  Starting from \(\mathfrak C_1'>0\), the
recursion proves inductively that every \(\mathfrak C_j\) is strictly
increasing on \(t\ge0\).

The resulting finite-cut theorem is

\[
\boxed{
g_{j,*}\le\mathfrak C_j(0)\quad(1\le j\le m=n-1)
\quad\Longrightarrow\quad
C_t(x)\ge0\quad(t>0,\ x>0).
}
\tag{5.246}
\]

Consequently \(\Xi'(t)>0\), and

\[
\left(\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i}\right)^2\in GGC,
\qquad
\beta_i>0,\qquad \sum_i\beta_i=1.
\]

The point is that (5.246) permits any number of cuts to be active
simultaneously.  To prove it, suppose cut \(j\) is active, so
\(0<\eta_j<g_{j,*}\), and let \(r_j^-\) be its rising root.  If
\(\overline g_i\) is the \(B_i\)-normalized average from (5.156) and
\(N_{j,-}\) is the negative mass between \(b_j\) and \(r_j^-\), direct
integration gives

\[
C_t(r_j^-)
=P+\sum_{i<j}B_i
  \bigl(\overline g_i+d_i-d_j-\eta_j\bigr)-N_{j,-},
\qquad
0<N_{j,-}<\eta_jB_j.
\tag{5.247}
\]

Therefore, including also \(j=1\) with an empty sum,

\[
\boxed{
C_t(r_j^-)
>P+\sum_{i<j}B_i\overline g_i+H_j-\eta_jT_j
\ge T_j\bigl(\mathfrak C_j(t)-\eta_j\bigr)>0.
}
\tag{5.248}
\]

The last inequality follows from
\(\mathfrak C_j(t)>\mathfrak C_j(0)\ge g_{j,*}>\eta_j\); no information
about any other cut is used.  The middle comparison is strict for
\(j\ge2\), because the lower-cut averages are positive, and is an equality
for \(j=1\).

For completeness, these are all possible interior local minima of
\(C_t\).  On each cut the signed density is either positive everywhere,
has the pattern \(-,+,-\), or is negative everywhere, so its only
interior negative-to-positive crossing is the rising root of an active
cut.  An interface \(b_j\) cannot be a local minimum: negativity on its
left forces \(\eta_{j-1}>0\), whence
\(\eta_j=\eta_{j-1}+\delta_j>0\) and the right side is also negative;
positivity on its right forces \(\eta_j\le0\), whence
\(\eta_{j-1}<0\) and the left side is also positive.  The lower exterior
is positive, the upper exterior is negative, and
\(C_t(0)=C_t(\infty)=0\); moreover the upper-exterior tail gives
\(C_t(b_n)>0\).  Thus (5.248) controls every finite local minimum.
The tangent cases \(\eta_j=0\) and \(\eta_j=g_{j,*}\) follow from the
same sign classification, or by a limit.

The endpoint envelopes and static integral bounds in
(5.150), (5.212), and (5.213) give a completely parameter-level
corollary.  With \(u_j=U_j/s_j\),

\[
\boxed{
u_1\le\frac{\underline P}{\overline B_1},\qquad
u_j\le
\frac{\underline P+
      \sum_{i<j}\underline B_i(d_i-d_j)}{\pi},
\quad 2\le j\le m,
}
\tag{5.249}
\]

implies (5.246).  Indeed \(P(0)\ge\underline P\),
\(B_1(0)\le\overline B_1\),
\(B_i(0)\ge\underline B_i\), and \(T_j(0)\le\pi\).
Unlike (5.214), the numerator retains \(P\), and there is no
\(\min\{\delta_j,\cdot\}\).  Thus the exact test (5.246) strictly enlarges
the exact WIP-5.20 cone (5.203), while the root-free test (5.249) strictly
enlarges its root-free parameter version (5.214).

Here is an exact four-rate witness to that strict enlargement:

\[
\boxed{
\boldsymbol\beta=
\left(\frac14,\frac14,\frac1{100},\frac{49}{100}\right),\qquad
\boldsymbol b=
\left(1,\frac{11}{10},\frac65,\frac{13}{10}\right).
}
\tag{5.250}
\]

Put \(\theta=\pi/100\).  Then

\[
(s_1,s_2,s_3)=\left(\frac1{\sqrt2},1,\cos\theta\right),\qquad
(d_1,d_2,d_3)=(1,0,-\tan\theta),\qquad
\delta_3=\tan\theta,
\]

and the endpoint envelopes are exactly

\[
\begin{aligned}
U_1&=21^{-1/2}11^{-1/100}(3/23)^{49/100},\\
U_2&=11^{-1/4}23^{-13/50}12^{-49/100},\\
U_3&=\frac1{5\,92^{1/4}}.
\end{aligned}
\]

All three inequalities in (5.249) can be verified without decimals.
First, \((3/23)^{49/100}<1/2\), since
\((23/12)^{49}>(23/12)^3>4\).  Thus

\[
u_1<\frac1{\sqrt{42}},\qquad
\underline P>\frac{10}{13},\qquad
\overline B_1
=\frac1{\sqrt{20}}\mathrm B(3/4,3/4)
  10^{1/100}5^{49/100}<3,
\]

The substitution \(x=(1+t)/2\), followed by symmetry, gives the two
elementary bounds used here and below:

\[
\mathrm B(3/4,3/4)
=\sqrt2\int_0^1(1-t^2)^{-1/4}\,dt,
\qquad
\sqrt2\le\mathrm B(3/4,3/4)<\frac{4\sqrt2}{3}<2.
\]

The lower bound uses \((1-t^2)^{-1/4}\ge1\); the upper bound uses
\((1-t^2)^{-1/4}<(1-t)^{-1/4}\).  Also
\(10^{1/100}<2\) and \(5^{49/100}<3\).  Hence
\(\underline P/\overline B_1>10/39>1/\sqrt{42}\).
For the remaining cuts,

\[
\underline B_1
=\frac1{\sqrt{20}}\mathrm B(3/4,3/4)
  5^{1/100}(10/3)^{49/100}
>\frac3{2\sqrt{10}},
\qquad
\frac{\underline B_1}{\pi}>\frac18.
\tag{5.251}
\]

Indeed \(\mathrm B(3/4,3/4)\ge\sqrt2\),
\((10/3)^{49/100}>(10/3)^{2/5}>3/2\), the last comparison reducing to
\(3200>2187\), and
\(\pi\sqrt{10}<11<12\).  Also

\[
u_2=U_2<
\frac35\cdot\frac12\cdot\frac13=\frac1{10},
\qquad
u_3=\frac1{5\,92^{1/4}\cos\theta}<\frac1{10}.
\]

Here \(11^{-1/4}<3/5\), \(23^{-13/50}<1/2\), and
\(12^{-49/100}<1/3\); these reduce respectively to
\(625<891\), \(23^{13}>2^{50}\), and
\(12^{49}>3^{100}\).  Finally \(92^{1/4}>3\) and
\(\cos\theta\ge1-\theta^2/2>2/3\).  Since

\[
\frac{\underline P+\underline B_1(d_1-d_2)}{\pi}
>\frac{\underline B_1}{\pi}>\frac18>u_2,
\]

and

\[
\frac{\underline P+\underline B_1(d_1-d_3)
      +\underline B_2(d_2-d_3)}{\pi}
>\frac{\underline B_1}{\pi}>\frac18>u_3,
\]

(5.249) proves that the square in (5.250) is GGC.

The old peak-gap hypothesis fails strictly.  At \(r=5/4\in I_3\),

\[
G_3(5/4)
=9^{-1/4}(3/47)^{1/4}49^{-1/100}51^{-49/100}
>\frac{19}{490}>\frac{11}{350}>\sin\theta.
\tag{5.252}
\]

The four factor bounds are

\[
9^{-1/4}>\frac47,\qquad
(3/47)^{1/4}>\frac12,\qquad
49^{-1/100}>\frac{19}{20},\qquad
51^{-49/100}>\frac17.
\]

The first two reduce to \(2401>2304\) and \(48>47\).
For the third,

\[
\left(\frac{20}{19}\right)^{100}>
\sum_{k=0}^4\binom{100}{k}19^{-k}
=\frac{9596696}{130321}>49.
\]

For the fourth, \(51/49<25/24\) and

\[
\left(\frac{25}{24}\right)^{49}
<3^2\frac{25}{24}=\frac{75}{8}<49.
\]

The elementary binomial estimate
\(\binom{24}{k}/24^k\le1/k!\), together with
\(\sum_{k\ge2}1/k!<1\), proves \((25/24)^{24}<3\).
Also \(\sin\theta<\theta=\pi/100<11/350\).
Since \(g_3=G_3/\cos\theta\), (5.252) gives

\[
g_{3,*}>\tan\theta=\delta_3,
\]

which is the strict negation of the corresponding condition in
(5.203).

This example genuinely uses the new multiactive proof rather than merely
lying outside an old parameter display.  In the expectation notation
underlying (5.129),

\[
Q(u)=\int e^{-u^2x^2}\,\mu(dx),\qquad
N(u)=\int e^{-u^2x^2}\operatorname{erfi}(ux)\,\mu(dx).
\]

For \(u>0\), \(N(u)>0\), while \(Q(u)\to1\) and \(N(u)\to0\) as
\(u\downarrow0\).  Dominated convergence is legitimate because, for
\(z\ge0\),

\[
e^{-z^2}\operatorname{erfi}(z)
=\frac2{\sqrt\pi}\int_0^z e^{-(z-s)(z+s)}\,ds
\le\frac2{\sqrt\pi}\min\{z,1/z\}
\]

with the second entry used for \(z\ge1\).  Hence
\(\Xi(t)=N(\sqrt t)/Q(\sqrt t)\to0\) as \(t\downarrow0\).
Because \(d_2=0\), \(d_3=-\delta_3\),
\(g_{2,*}>0\), and (5.252) gives
\(g_{3,*}-\delta_3>0\), all sufficiently small \(t>0\) satisfy

\[
\boxed{
0<\Xi(t)<\min\{g_{2,*},g_{3,*}-\delta_3\},\qquad
\eta_2=\Xi\in(0,g_{2,*}),\quad
\eta_3=\Xi+\delta_3\in(0,g_{3,*}).
}
\tag{5.253}
\]

Thus cuts \(2\) and \(3\) are simultaneously active on the actual phase
trajectory.  WIP-5.20's one-active-cut classification cannot treat this
case, whereas (5.246) does.  Every assertion in this subsection is a new
project derivation.

### WIP-5.24 — arbitrary-shape two-rate phase kernel and the symmetric integer ladder

**Status: [PROVED ARBITRARY-SHAPE BOUNDARY FORMULA; PROVED AN EXACT
\(0<B\le2\) PHASE CRITERION; PROVED A SYMMETRIC INTEGER-SHAPE GGC
FAMILY; PROVED ENDPOINT NO-GO THEOREMS FOR THE DIRECT \(HM_{B/2}\)
INVARIANT].**

The total-shape-one analysis can be separated from the choice \(B=1\).
Let

\[
X=\frac{G_a}{b_1}+\frac{G_c}{b_2},\qquad
B=a+c,\qquad p_b=b_1^ab_2^c,
\]

and let

\[
R=b_1Q+b_2(1-Q),\qquad Q\sim{\rm Beta}(a,c).
\]

All gamma variables in this subsection have unit rate and are independent
unless coupled explicitly.  The Dirichlet factorization in WIP-5.2 gives

\[
\psi(s):=\mathbb E e^{-sX^2}
=\frac{p_b}{\Gamma(B)}
 \mathbb E K_{B,2}(s,R),\qquad
K_{B,2}(s,r)=\int_0^\infty y^{B-1}e^{-sy^2-ry}\,dy.
\tag{5.254}
\]

Define the entire functions

\[
F_B(z)=\int_0^\infty t^{B-1}e^{-t^2}e^{2izt}\,dt,\qquad
F_{\mu,B}(u)=\mathbb E F_B(uR).
\]

For \(x>0\), put \(u=(2\sqrt x)^{-1}\).  Analytic continuation with the
principal square root yields the exact upper boundary value

\[
\boxed{
\psi(-x+i0)
=\frac{p_b}{\Gamma(B)}
 x^{-B/2}e^{-i\pi B/2}F_{\mu,B}(u).
}
\tag{5.255}
\]

Thus, on every interval on which \(F_{\mu,B}\ne0\), a continuous argument
lift gives

\[
\boxed{
\eta_B(x):=-\frac1\pi\Arg\psi(-x+i0)
=\frac B2-\frac1\pi\arg F_{\mu,B}(u).
}
\tag{5.256}
\]

The endpoint asymptotics are

\[
F_{\mu,B}(u)\longrightarrow\frac12\Gamma(B/2)
\quad(u\downarrow0),
\]

and

\[
F_{\mu,B}(u)\sim
\Gamma(B)e^{i\pi B/2}(2u)^{-B}\mathbb E R^{-B}
\quad(u\to\infty).
\]

The Dirichlet identity \(p_b\mathbb E R^{-B}=1\) fixes the local phase
normalizations
\(\eta_B(0+)=0\) and \(\eta_B(\infty)=B/2\).  For \(B>2\), these two
local branches need not belong to one global lift: zeros and the winding
number of \(F_{\mu,B}\) have not been controlled.  For \(0<B\le2\), the
Stieltjes representation below supplies the missing global zero-free
continuation.

There is also an exact averaged kernel.  Set

\[
\mathcal K_B(z_1,z_2)
=\frac12\Im\!\left[
z_1F_B'(z_1)\overline{F_B(z_2)}
+z_2F_B'(z_2)\overline{F_B(z_1)}
\right].
\]

For independent copies \(R_1,R_2\) of \(R\),

\[
\Im\!\left(F_{\mu,B}'(u)\overline{F_{\mu,B}(u)}\right)
=\frac1u\mathbb E\mathcal K_B(uR_1,uR_2),
\]

and hence

\[
\boxed{
\eta_B'(x)
=\frac{2u^2}{\pi|F_{\mu,B}(u)|^2}
 \mathbb E\mathcal K_B(uR_1,uR_2).
}
\tag{5.257}
\]

If \(F_B=C_B+iS_B\), the kernel is equivalently

\[
\begin{aligned}
\mathcal K_B(z_1,z_2)=\frac12\{&
z_1[S_B'(z_1)C_B(z_2)-C_B'(z_1)S_B(z_2)]\\
&+z_2[S_B'(z_2)C_B(z_1)-C_B'(z_2)S_B(z_1)]\}.
\end{aligned}
\]

For \(0<B\le2\), this phase test is an exact GGC criterion rather than
only a boundary identity.  Indeed \(Y=X^2\) has density

\[
f_Y(y)=\frac{p_b}{2\Gamma(B)}
y^{B/2-1}\mathbb E e^{-R\sqrt y}.
\]

Put \(\delta=1-B/2\), and define

\[
\nu_\delta(dq)=\frac{q^{\delta-1}}{\Gamma(\delta)}\,dq
\quad(\delta>0),\qquad
\nu_0=\delta_0,\qquad
\ell_r(dt)=\frac{r}{2\sqrt\pi}t^{-3/2}e^{-r^2/(4t)}\,dt.
\]

The elementary Laplace identities for \(y^{-\delta}\) and
\(e^{-r\sqrt y}\) give the explicit Stieltjes representation

\[
\boxed{
\psi(s)=\int_{[0,\infty)}\frac{\kappa_B(d\lambda)}{s+\lambda},
\qquad
\kappa_B=
\frac{p_b}{2\Gamma(B)}\mathbb E[\nu_\delta*\ell_R].
}
\tag{5.258}
\]

This \(\kappa_B\) is the Stieltjes spectral measure, not a Thorin measure.
The reciprocal-CBF/Thorin--Bernstein phase theorem used in WIP-2.3,
together with (5.257) and the endpoint values above, now gives

\[
\boxed{
X^2\in GGC
\quad\Longleftrightarrow\quad
\eta_B\ \hbox{is nondecreasing}
\quad\Longleftrightarrow\quad
\mathbb E\mathcal K_B(uR_1,uR_2)\ge0
\quad\hbox{for every }u>0,
}
\tag{5.259}
\]

for \(0<B\le2\).  The spectral density in (5.258) is strictly positive,
so the boundary value is nonzero; the displayed phase is the unique
continuous lift joining the two stated endpoint values.

The same reciprocal-Stieltjes mechanism cannot extend unchanged past
\(B=2\).  Scaling (5.254) gives

\[
\psi(s)\sim
\frac{p_b\Gamma(B/2)}{2\Gamma(B)}s^{-B/2}
\quad(s\to\infty).
\]

If \(B>2\), then \(s\psi(s)\to0\).  Every nonzero Stieltjes function

\[
f(s)=\frac{\alpha_0}{s}+\beta_0+
\int_0^\infty\frac{\rho(dt)}{s+t}
\]

instead has a strictly positive or infinite limit for \(sf(s)\), by
monotone convergence.  Therefore

\[
\boxed{B>2\quad\Longrightarrow\quad\psi\ \hbox{is not Stieltjes}.}
\tag{5.260}
\]

This is a no-go only for the WIP-5.3 reciprocal-CBF route.  It is not a
GGC counterexample: at equal rates, for example, \(X\) is gamma and
\(X^2\) has an HCM density.  Equation (5.255) remains valid when \(B>2\),
and (5.256)--(5.257) remain valid on each zero-free interval of
\(F_{\mu,B}\); without zero and winding control, kernel positivity alone
lacks the analytic reconstruction supplied by (5.258).

There is nevertheless a new positive ladder at arbitrary positive integer
summand shape, hence at every positive even-integer total shape.  Fix
\(0<l<r\), let

\[
M=l+(r-l)U,\qquad U\sim{\rm Beta}(m,m),\qquad
m\in\{1,2,\ldots\},
\qquad V=M^2.
\]

The density of \(V\) is

\[
f_V(y)=
\frac{(\sqrt y-l)^{m-1}(r-\sqrt y)^{m-1}}
{2\sqrt y\,{\rm B}(m,m)(r-l)^{2m-1}},
\qquad l^2<y<r^2.
\tag{5.261}
\]

Fix a hyperbolic center \(q\in(l^2,r^2)\), put
\(w=v+v^{-1}\) and \(T=\sqrt v+v^{-1/2}=\sqrt{w+2}\), and restrict to
the nonzero support \(2<w<W_q\) of
\(f_V(qv)f_V(q/v)\).  A direct multiplication gives

\[
f_V(qv)f_V(q/v)=C_qQ_q(w)^{m-1},
\tag{5.262}
\]

where \(C_q>0\) and

\[
\begin{aligned}
Q_q(w)&=P_l(T)P_r(T),\\
P_l(T)&=q+l^2-l\sqrt q\,T,\qquad
P_r(T)=r^2+q-r\sqrt q\,T\\
&>0\qquad(2<w<W_q).
\end{aligned}
\]

Equivalently,

\[
Q_q(w)=A_q+lrq\,w
-\sqrt q\,[l(r^2+q)+r(q+l^2)]\sqrt{w+2},
\]

with \(A_q\) independent of \(w\).  On the support,

\[
\frac{dQ_q}{dT}
=-l\sqrt q\,P_r-r\sqrt q\,P_l<0,
\qquad
(-1)^nQ_q^{(n)}(w)>0\quad(n\ge2).
\]

Thus \(Q_q\) is completely monotone there, and so is its integer power
\(Q_q^{m-1}\).  Extend (5.262) by zero on \(w\ge W_q\).
The factor \(Q_q\) has at least a simple zero at \(W_q\), so the first
\(m-2\) derivatives of \(Q_q^{m-1}\) vanish there.  In the sense of
distributions,

\[
H_q=
\frac{(-1)^m}{(m-1)!}
D^m\!\left(C_qQ_q^{m-1}\mathbf1_{\{w<W_q\}}\right)
\]

is a positive measure.  Interior positivity is complete monotonicity;
the only possible boundary atom has coefficient proportional to
\((-1)^{m+1}h_q^{(m-1)}(W_q-)\ge0\).  Repeated integration, and the
direct endpoint atom when \(m=1\), give

\[
\boxed{
f_V(qv)f_V(q/v)
=\int_{(w,\infty)}(\lambda-w)^{m-1}H_q(d\lambda),
\qquad M^2\in HM_m.
}
\tag{5.263}
\]

Centers outside \([l^2,r^2]\) give the zero function and are trivial;
endpoint centers follow by a limit.

Now let

\[
X=\frac{G_m^{(1)}}{b_1}+\frac{G_m^{(2)}}{b_2}.
\]

For \(b_1\ne b_2\), Gamma--Beta factorization gives \(X=G_{2m}M\), with
\(M\) of the preceding form after ordering \(b_1^{-1},b_2^{-1}\).  The
gamma duplication identity is

\[
G_{2m}^2\overset d=4G_mG_{m+1/2}.
\]

Sjödin's 2021 Theorem 3.1 applied with \(k=l=m\) and (5.263) shows that
\(G_mM^2\) is GGC.  The independent-product closure in Bondesson's 2015
Theorem 1 then yields

\[
\boxed{
\left(\frac{G_m^{(1)}}{b_1}
+\frac{G_m^{(2)}}{b_2}\right)^2\in GGC
\qquad
(m\in\{1,2,\ldots\},\ b_1,b_2>0).
}
\tag{5.264}
\]

If \(b_1=b_2\), then \(X\) is a scaled \(G_{2m}\) variable and its square
has an HCM density, so the same conclusion is immediate.
In particular, \(m=1\) gives the first all-rate two-summand theorem at
total shape \(B=2\).  The only external inputs in this paragraph are the
two cited theorems; the \(HM_m\) verification is a project derivation.

The same calculation also supplies a sharp obstruction to using
\(M^2\in HM_{B/2}\) as a general shape-changing invariant.  We first
record the endpoint-order lemma.  If \(k>0\),

\[
h(w)=\int_{(w,W]}(\lambda-w)^{k-1}H(d\lambda),\qquad H\ge0,
\]

and \(h(w)\sim C(W-w)^\gamma\) with \(C>0\) and \(\gamma>-1\), then

\[
\boxed{\gamma\ge k-1.}
\tag{5.265}
\]

For \(k\ge1\), finiteness of \(H\) near \(W\) and
\[
h(w)\le(W-w)^{k-1}H((w,W])
\]
prove the claim.  For \(0<k<1\), Tonelli and the beta integral give

\[
\boxed{
\int_x^W(w-x)^{-k}h(w)\,dw
={\rm B}(1-k,k)H((x,W]).
}
\tag{5.266}
\]

The right side stays bounded as \(x\uparrow W\), whereas
\(\gamma<k-1\) makes the left side asymptotic to a positive constant
times \((W-x)^{\gamma+1-k}\to\infty\).  If \(\gamma\le-1\), the left
side is already infinite for fixed \(x<W\), which is also impossible.

Apply this to

\[
M=l+(r-l)U,\qquad U\sim{\rm Beta}(a,c),\qquad
B=a+c,\qquad k=B/2.
\]

For a hyperbolic center \(q\in(l^2,lr)\), the terminal support point
meets only the lower endpoint and
\[
f_{M^2}(qv)f_{M^2}(q/v)
\asymp(W_q-w)^{a-1}.
\]
Thus (5.265) requires \(a\ge k\).  A center
\(q\in(lr,r^2)\) similarly requires \(c\ge k\).  Since \(a+c=2k\),

\[
\boxed{
a\ne c\quad\Longrightarrow\quad M^2\notin HM_{B/2}.
}
\tag{5.267}
\]

Even if \(a=c=k\), the center \(q=lr\) hits both endpoints and gives
exponent \(2k-2\).  For \(1/2<k<1\) this is smaller than \(k-1\);
for \(0<k\le1/2\) it is at most \(-1\).  Hence

\[
\boxed{
0<B<2,\quad l<r
\quad\Longrightarrow\quad M^2\notin HM_{B/2}.
}
\tag{5.268}
\]

Equations (5.267)--(5.268) disprove only the direct shape-matched
\(HM_{B/2}\) shortcut, not GGC membership of \(X^2\).  The complete
total-shape-one theorem WIP-5.11 is already a positive illustration of
that distinction.  At this stage the next continuous-shape case not
excluded by the endpoint lemma was the symmetric family
\(a=c=k>1\) with noninteger \(k\).  WIP-5.27 below supplies the required
fractional \(HM_k\) inversion and closes that family.  Every uncited
assertion in this subsection is a new project derivation.

### WIP-5.25 — universal last-cut endpoint balance

**Status: [PROVED THE WIP-5.22 ENDPOINT TARGET; PROVED A STRICT
LAST-CUT BALANCE FOR EVERY TOTAL-SHAPE-ONE FINITE DIRICHLET MEAN].**

The open endpoint question after (5.243) has a positive answer, and the
condition \(c_M\ge0\) is not needed for the unweighted balance itself.
We first prove the three-rate statement in the notation

\[
(\alpha,\beta,\gamma),\qquad A<B<C,\qquad
p=\alpha+\beta=1-\gamma,\qquad s_2=\sin(\pi\gamma).
\]

Let

\[
(Q_1,Q_2,Q_3)\sim{\rm Dir}(\alpha,\beta,\gamma),\qquad
R=AQ_1+BQ_2+CQ_3.
\]

The order-one Markov--Krein identity and the density formula on the last
cut give

\[
a(x)=\mathbb E\frac1{R+x},\qquad
f_R(x)=\frac{s_2}{\pi}m_2(x),\qquad
h(x):=\frac{G_2(x)}{s_2}
=\frac{a(x)}{\pi f_R(x)}
\quad(B<x<C).
\tag{5.269}
\]

For arbitrary \(x\in(B,C)\), put \(q(x)=\mathbb P(R\le x)\) and define
the regularized endpoint balance

\[
\begin{aligned}
\mathcal F(x):={}&
U(0)+\int_x^C\bigl(G_2(x)-G_2(r)\bigr)m_2(r)\,dr\\
&-\pi\left[d_2+\frac{G_2(x)}{s_2}\right].
\end{aligned}
\]

The same total-mass cancellation as in (5.238), now without requiring
\(x=r_*\), gives

\[
\boxed{
\mathcal F(x)=L(x)-\pi h(x)q(x),\qquad
L(x)=\mathbb E\log\frac{R+x}{C-R}
+\pi\cot(\pi\gamma).
}
\tag{5.270}
\]

On the rising branch, \(\mathcal F\) is algebraically the same balance
\(F_{\rm full}\) defined in (5.233); the new notation extends that balance
to the whole last cut.  In particular,
\(\mathcal F(r_*)=F_{\rm full}(r_*)\).

The proof of positivity uses Dirichlet neutrality.  Set

\[
S=\frac{AQ_1+BQ_2}{Q_1+Q_2},\qquad W=Q_3.
\]

Then \(S\) and \(W\) are independent,
\(W\sim{\rm Beta}(\gamma,p)\), and

\[
R=S+(C-S)W.
\tag{5.271}
\]

Condition on \(S=\sigma\).  The conditional law is precisely the
two-rate, total-shape-one model with rates \((\sigma,C)\) and shapes
\((p,\gamma)\).  Its density, local likelihood ratio, and lower-tail
probability at \(x\) are

\[
\begin{aligned}
f_\sigma(x)
 &=\frac{s_2}{\pi}(x-\sigma)^{-p}(C-x)^{-\gamma},\\
h_\sigma(x)
 &=\frac1{s_2}
 \left(\frac{x-\sigma}{x+\sigma}\right)^p
 \left(\frac{C-x}{C+x}\right)^\gamma,\\
q_\sigma(x)
 &=I_{(x-\sigma)/(C-\sigma)}(\gamma,p).
\end{aligned}
\tag{5.272}
\]

Define

\[
L_\sigma(x)=
\mathbb E\left[
\left.\log\frac{R+x}{C-R}\right|S=\sigma
\right]+\pi\cot(\pi\gamma),
\qquad
K_\sigma(x)=L_\sigma(x)-\pi h_\sigma(x)q_\sigma(x).
\]

Differentiating
\({\rm B}(\gamma,1-\gamma)=\pi/\sin(\pi\gamma)\) shows that

\[
\mathbb E\log\frac W{1-W}=-\pi\cot(\pi\gamma),
\]

and consequently

\[
L_\sigma(x)=
\mathbb E_W\log\left(
1+\frac{x+\sigma}{(C-\sigma)W}
\right)>0.
\tag{5.273}
\]

More importantly, the two-rate Möbius true-lobe theorem
(5.84)--(5.89) gives

\[
\boxed{K_\sigma(x)>0\qquad(\sigma<x<C).}
\tag{5.274}
\]

Indeed, after scaling \((\sigma,C)\) to the normalization of WIP-5.11
and identifying that subsection's beta parameter with \(\gamma\),
\(K_\sigma(x)\) is exactly its unweighted true-lobe balance
\(\widehat P_0-\widehat N_1\).  Thus those earlier formulas directly
cover the rising branch.
If \(x\) is instead on the descending branch of the conditional
\(G_\sigma\), let \(x_-\) be the rising point at the same height.  Then

\[
K_\sigma(x)=K_\sigma(x_-)
+\int_{x_-}^x
\bigl(G_\sigma(u)-G_\sigma(x)\bigr)m_\sigma(u)\,du
>0.
\]

At the peak, the same conclusion follows from the strict true-lobe
decomposition, or by a one-sided limit.

It remains to check that mixing over \(S\) preserves this strict balance.
For fixed \(x\), \(f_\sigma(x)\) increases with \(\sigma\), whereas
\(h_\sigma(x)\) and \(q_\sigma(x)\) decrease:

\[
\partial_\sigma\log f_\sigma(x)=\frac p{x-\sigma}>0,\qquad
\partial_\sigma\log h_\sigma(x)
=-p\left(\frac1{x-\sigma}+\frac1{x+\sigma}\right)<0,
\tag{5.275}
\]

and

\[
\partial_\sigma\frac{x-\sigma}{C-\sigma}
=-\frac{C-x}{(C-\sigma)^2}<0.
\]

Since

\[
f_R(x)=\mathbb E f_S(x),\qquad
a(x)=\pi\mathbb E[f_S(x)h_S(x)],\qquad
q(x)=\mathbb E q_S(x),
\]

the reverse-order covariance of \(f_S,h_S\) and the same-order covariance
of \(h_S,q_S\) imply

\[
h(x)=\frac{\mathbb E[f_Sh_S]}{\mathbb E f_S}
\le\mathbb E h_S,\qquad
\mathbb E[h_Sq_S]\ge
\mathbb E h_S\,\mathbb E q_S
\ge h(x)\mathbb E q_S.
\tag{5.276}
\]

Combining (5.270), (5.274), and (5.276) gives the exact positive
decomposition

\[
\boxed{
\begin{aligned}
\mathcal F(x)
={}&\mathbb E K_S(x)
+\pi\{\mathbb E[h_Sq_S]-h(x)\mathbb E q_S\}\\
={}&\mathbb E K_S(x)
+\pi\left\{
\operatorname{Cov}(h_S,q_S)
+(\mathbb E h_S-h(x))\mathbb E q_S
\right\}>0.
\end{aligned}
}
\tag{5.277}
\]

Therefore

\[
\boxed{F_{\rm full}(r_*)>0.}
\tag{5.278}
\]

In particular, \(c_M\ge0\) alone now implies the endpoint inequality in
(5.235); by WIP-5.22's support-order argument it controls every actual
second-cut rising prefix for all \(t>0\).  The hypothesis \(c_M\ge0\)
is still needed at that final step to ensure that all density
contributions below the second cut used by the comparison are
nonnegative.  Equation (5.278) does not by itself control the first cut.

The proof extends verbatim to the last cut of any finite
total-shape-one Dirichlet mean.  Aggregate the first \(n-1\) coordinates
into

\[
S=\frac{\sum_{i<n}b_iQ_i}{1-Q_n},\qquad W=Q_n.
\]

Then \(S\perp W\), \(W\sim{\rm Beta}(\beta_n,1-\beta_n)\), and,
conditionally on \(S\), the last-cut law is again the complete two-rate
model already proved in WIP-5.11.  Thus the last-cut analogue of
\(\mathcal F(x)\) is strictly positive at every
\(x\in(b_{n-1},b_n)\).  Turning this unweighted endpoint theorem into a
weighted prefix certificate still requires nonnegative coefficients on
all lower pieces.  Every assertion in this subsection is a new project
derivation; the only non-elementary input is the already proved
WIP-5.11 two-rate theorem.

### WIP-5.26 — all-cut conditional balance and the finite total-shape-one square theorem

**Status: [PROVED THE SQUARE IS GGC FOR EVERY FINITE GAMMA CONVOLUTION
OF TOTAL SHAPE ONE].**

The conditional argument in WIP-5.25 is not confined to the last cut.
Applied simultaneously to the lower and upper Dirichlet blocks, it closes
every cut and removes all parameter conditions from the finite
total-shape-one square problem.

Let \(\mu\) be the law of the rate Dirichlet mean \(R\), and write

\[
a_\mu(r)=\int\frac{\mu(dy)}{y+r},\qquad
\mathscr H_\mu(r)=\operatorname {pv}\!\int\frac{\mu(dy)}{y-r},
\]

with \(f_\mu\) denoting the density of \(\mu\).  For a fixed real center
\(\xi\), define

\[
\boxed{
\kappa_{\mu,\xi}(r)
=a_\mu(r)+\mathscr H_\mu(r)-\pi\xi f_\mu(r),\qquad
A_{\mu,\xi}(x)=\int_0^x\kappa_{\mu,\xi}(r)\,dr.
}
\tag{5.279}
\]

For a finite total-shape-one Dirichlet mean, the Cauchy boundary values
show that on \(I_j\)

\[
\kappa_{\mu,\xi}(r)
=a(r)+s_j(d_j-\xi)m_j(r)
=\pi f_\mu(r)\bigl(g_j(r)+d_j-\xi\bigr);
\]

on the two exteriors it is exactly the signed density used in
WIP-5.14.  Direct integration of the two Stieltjes kernels gives the
manifestly linear prefix formula

\[
\boxed{
A_{\mu,\xi}(x)=
\int\log\frac{y+x}{|y-x|}\,\mu(dy)
-\pi\xi F_\mu(x),\qquad
F_\mu(x)=\mu((0,x)).
}
\tag{5.280}
\]

Indeed, in the principal-value sense,

\[
\int_0^x\left(\frac1{y+r}+\frac1{y-r}\right)dr
=\log\frac{y+x}{|y-x|}.
\]

The logarithmic singularity is locally integrable.  Formula (5.280),
rather than a pointwise exchange of Hilbert transforms, makes linearity
under probability mixtures rigorous.

Fix \(1\le j<n\), \(x\in I_j=(b_j,b_{j+1})\), and put

\[
p=A_j=\sum_{i\le j}\beta_i,\qquad
\gamma=1-p,\qquad
s=\sin(\pi p)=\sin(\pi\gamma),\qquad
d_j=\cot(\pi p).
\]

Dirichlet neutrality supplies three mutually independent variables

\[
S=\frac{\sum_{i\le j}b_iQ_i}{\sum_{i\le j}Q_i},\qquad
T=\frac{\sum_{i>j}b_iQ_i}{\sum_{i>j}Q_i},\qquad
W=\sum_{i>j}Q_i\sim{\rm Beta}(\gamma,p),
\]

such that

\[
\boxed{
R=S+(T-S)W,\qquad
S\le b_j<x<b_{j+1}\le T.
}
\tag{5.281}
\]

Conditionally on \((S,T)=(u,v)\), this is the complete two-rate
total-shape-one model with endpoints \(u<v\) and shapes \((p,\gamma)\).
At \(x\), its density, local likelihood, and lower-tail probability are

\[
\boxed{
\begin{aligned}
f_{u,v}(x)
 &=\frac{s}{\pi}(x-u)^{-p}(v-x)^{-\gamma},\\
h_{u,v}(x)
 &=\frac1s
 \left(\frac{x-u}{x+u}\right)^p
 \left(\frac{v-x}{v+x}\right)^\gamma,\\
q_{u,v}(x)
 &=I_{(x-u)/(v-u)}(\gamma,p).
\end{aligned}
}
\tag{5.282}
\]

Consequently

\[
f_\mu(x)=\mathbb E f_{S,T}(x),\qquad
a_\mu(x)=\pi\mathbb E[f_{S,T}(x)h_{S,T}(x)],
\]

and

\[
\boxed{
h_j(x):=\frac{a_\mu(x)}{\pi f_\mu(x)}
=\frac{\mathbb E(f_{S,T}h_{S,T})}{\mathbb E f_{S,T}},
\qquad
F_\mu(x)=\mathbb E q_{S,T}(x).
}
\tag{5.283}
\]

Let \(\mu_{u,v}\) denote the conditional two-rate law and set

\[
K_{u,v}(x)
=A_{\mu_{u,v},\,d_j+h_{u,v}(x)}(x).
\]

The WIP-5.11 true-lobe theorem gives \(K_{u,v}(x)>0\) when \(x\) lies
on the rising branch of \(h_{u,v}\).  On the descending branch, let
\(x_-\) be the rising point at the same height.  Since the two centers
then agree,

\[
K_{u,v}(x)
=K_{u,v}(x_-)
+\int_{x_-}^x
\pi f_{u,v}(r)\bigl(h_{u,v}(r)-h_{u,v}(x)\bigr)\,dr>0.
\]

The peak follows from the same strict true-lobe decomposition, or by a
one-sided limit.  Thus

\[
\boxed{K_{u,v}(x)>0\qquad(u<x<v).}
\tag{5.284}
\]

Choose the full-model root center
\(\xi_x=d_j+h_j(x)\).  Linearity of (5.280), and the fact that changing
the center by \(\Delta\) subtracts
\(\pi\Delta q_{u,v}(x)\), yield

\[
\boxed{
A_{\mu,\xi_x}(x)
=\mathbb E K_{S,T}(x)
+\pi\left\{
\mathbb E(h_{S,T}q_{S,T})
-h_j(x)\mathbb E q_{S,T}
\right\}.
}
\tag{5.285}
\]

The term in braces is nonnegative for a structural reason.  Put
\(\overline f=\mathbb E f_{S,T}(x)\), tilt the independent law of
\((S,T)\) by \(f_{S,T}(x)/\overline f\), and denote covariance under the
tilted law by \(\operatorname {Cov}_f\).  Since (5.282) factorizes into a
function of \(u\) times a function of \(v\), the tilted law is still a
product law.  With \(r_{u,v}=q_{u,v}/f_{u,v}\), direct algebra gives

\[
\boxed{
\mathbb E(h_{S,T}q_{S,T})-h_j(x)\mathbb E q_{S,T}
=\overline f\,\operatorname {Cov}_f(h_{S,T},r_{S,T}).
}
\tag{5.286}
\]

Both \(h\) and \(r\) are coordinatewise increasing in \((-u,v)\).
For \(h\), this follows from

\[
\partial_u\log h
=-p\left(\frac1{x-u}+\frac1{x+u}\right)<0,\qquad
\partial_v\log h
=\gamma\left(\frac1{v-x}-\frac1{v+x}\right)>0.
\]

For \(r\), put

\[
a=x-u>0,\qquad y=v-x>0,\qquad w=y/a,\qquad
J_\gamma(w)=\int_w^\infty\frac{z^{-\gamma}}{1+z}\,dz.
\]

The substitution \(z=(1-t)/t\) in the incomplete beta integral gives

\[
\boxed{
r_{u,v}(x)=\frac{q_{u,v}(x)}{f_{u,v}(x)}
=a^py^\gamma J_\gamma(w).
}
\tag{5.287}
\]

At fixed \(y\), this is \(y w^{-p}J_\gamma(w)\), and

\[
\frac d{dw}\{w^{-p}J_\gamma(w)\}
=-p w^{-p-1}J_\gamma(w)-\frac{w^{-1}}{1+w}<0.
\]

Since \(w\) increases with \(u\), \(r\) decreases with \(u\).  At fixed
\(a\), it is \(a w^\gamma J_\gamma(w)\).  Integration by parts gives

\[
\boxed{
J_\gamma(w)-\frac{w^{1-\gamma}}{\gamma(1+w)}
=\frac1\gamma\int_w^\infty
\frac{z^{-\gamma}}{(1+z)^2}\,dz>0,
}
\tag{5.288}
\]

and hence

\[
\frac d{dw}\{w^\gamma J_\gamma(w)\}
=\gamma w^{\gamma-1}J_\gamma(w)-\frac1{1+w}>0.
\]

Thus \(r\) increases with \(v\).  A product probability measure is
associated: applying the one-dimensional independent-copy covariance
identity first conditionally in one coordinate and then to the two
conditional means in the other gives

\[
\operatorname {Cov}_f(h_{S,T},r_{S,T})\ge0.
\]

Equations (5.284)--(5.288) prove the all-cut unweighted theorem

\[
\boxed{
A_{\mu,\,d_j+h_j(x)}(x)>0
\qquad(1\le j<n,\ b_j<x<b_{j+1}).
}
\tag{5.289}
\]

Strictness comes from \(\mathbb E K_{S,T}(x)>0\); the covariance need
only be nonnegative.  WIP-5.25 is the special case in which the upper
block mean \(T\) is constant.

It remains to restore the Gaussian weight.  Fix \(\tau>0\), put
\(\xi=\Xi(\tau)\), and abbreviate
\(A_\xi(y)=A_{\mu,\xi}(y)\).  On \(I_j\),

\[
\kappa_{\mu,\xi}(r)
=\pi f_\mu(r)\{h_j(r)-\eta_j\},\qquad
\eta_j=\xi-d_j.
\]

The functions \(h_j=g_j\) are strictly one-peaked and vanish at their cut
endpoints.  Hence the only possible finite interior local minima of
\(A_\xi\) are rising roots of active cuts.  Interfaces cannot be minima:
a negative left side forces \(\eta_{j-1}>0\), hence
\(\eta_j=\eta_{j-1}+d_{j-1}-d_j>0\); a positive right side forces
\(\eta_j\le0\), hence \(\eta_{j-1}<0\).  At a rising root \(x\) on cut
\(j\), one has \(\xi=d_j+h_j(x)\), so (5.289) gives
\(A_\xi(x)>0\).

Consequently \(A_\xi(y)\ge0\) for \(0\le y\le x\) up to every active
rising root \(x\), with strict inequality at \(x\).  Indeed, if the
continuous function \(A_\xi\) were negative somewhere on this compact
interval, it would attain a nonpositive minimum away from \(0\); the sign
classification forces such a minimum to be an earlier rising root or an
interface, both of which have just been excluded.  Integration by parts
now yields

\[
\boxed{
\begin{aligned}
C_\tau(x)
&=\int_0^x e^{-\tau r^2}\kappa_{\mu,\xi}(r)\,dr\\
&=e^{-\tau x^2}A_\xi(x)
+2\tau\int_0^x r e^{-\tau r^2}A_\xi(r)\,dr>0.
\end{aligned}
}
\tag{5.290}
\]

Thus every possible rising local minimum of \(C_\tau\) is positive.
Multiplication by the positive Gaussian does not change the cut or
interface sign classification.  The lower exterior is positive; the
upper exterior is negative; and
\(C_\tau(0)=C_\tau(\infty)=0\), with \(C_\tau(b_n)>0\) from the strict
negative upper tail.  Therefore

\[
\boxed{
C_\tau(y)\ge0\quad(y>0),\qquad
\Xi'(\tau)>0\quad(\tau>0),
}
\tag{5.291}
\]

where the second assertion follows from the integration-by-parts identity
(5.142).  The total-shape-one phase criterion (5.13a) finally proves

\[
\boxed{
\left(\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i}\right)^2\in GGC,
\qquad
\beta_i>0,\qquad\sum_{i=1}^n\beta_i=1.
}
\tag{5.292}
\]

Tangent cases create no missing minima:
\(\eta_j=0\) makes the cut density nonnegative,
\(\eta_j=g_{j,*}\) gives an isolated tangency without a sign change, and
values outside \([0,g_{j,*}]\) make the cut one-signed.  Coincident rates
are merged using
\(G_\alpha/b+G_\beta/b\overset d=G_{\alpha+\beta}/b\); zero shapes are
deleted.  With one distinct rate, the conclusion is the standard HCM
power closure for \(G_1^2/b^2\).  Thus the distinct-positive-rate notation
causes no loss.

This theorem completely settles \(q=2\) for finite gamma convolutions of
total shape one.  It does **not** settle arbitrary total shape, arbitrary
\(q>1\), or Bondesson's full power conjecture.  Every assertion in this
subsection is a new project derivation, built on the WIP-5.11 two-rate
theorem and the standard Dirichlet neutrality already recorded in this
ledger.

### WIP-5.27 — fractional \(HM_k\) inversion for the symmetric affine beta mean

**Status: [PROVED \(M^2\in HM_k\) FOR EVERY REAL \(k\ge1\);
PROVED THE CONVERSE FOR UNEQUAL ENDPOINTS; PROVED THE SYMMETRIC
TWO-RATE SQUARE THEOREM FOR EVERY REAL \(k\ge1\)].**

WIP-5.24 proved the assertion for integer \(k\) by ordinary
distributional differentiation.  The missing noninteger case can be
handled by a positive fractional Abel inversion.

Fix \(0<l<r\), let

\[
U\sim{\rm Beta}(k,k),\qquad M=l+(r-l)U,\qquad V=M^2,
\]

and first suppose that \(k>1\) is not an integer.  Put

\[
\alpha=k-1=m+\delta,\qquad
m=\lfloor\alpha\rfloor,\qquad 0<\delta<1,\qquad n=m+2.
\]

For a hyperbolic center \(q\in(l^2,lr]\), define

\[
W_q=\frac q{l^2}+\frac{l^2}q,\qquad
T_0=\frac{\sqrt q}{l}+\frac l{\sqrt q},\qquad
s=\frac{W_q-w}{T_0^2},\qquad y=\sqrt{1-s}.
\]

On the nonzero support of
\(f_V(qv)f_V(q/v)\), where \(w=v+v^{-1}\), the multiplication in
(5.261)--(5.262) reduces, up to a positive constant and a positive
rescaling of \(W_q-w\), to

\[
\boxed{
g(s)=F(s)^\alpha,\qquad
F(s)=(1-\sqrt{1-s})(1-\lambda\sqrt{1-s}),
}
\tag{5.293}
\]

where

\[
\lambda=\frac{r(q+l^2)}{l(r^2+q)}\in(0,1]
\quad\hbox{and}\quad
1-\lambda=
\frac{(r-l)(lr-q)}{l(r^2+q)}.
\]

Thus \(\lambda<1\) for \(q<lr\), while \(\lambda=1\) at the central
center \(q=lr\).  It is enough to produce a positive measure
\(\mu_q\) such that

\[
g(s)=\int_{[0,s)}(s-t)^\alpha\,\mu_q(dt).
\tag{5.294}
\]

Indeed, the affine change
\(\Lambda=W_q-T_0^2t\) then gives exactly the \(HM_k\) representation
in the \(w\)-variable.

We first establish the derivative inequalities needed for the Abel
inverse.  For \(0\le a\le1\), set

\[
A_a(s)=1-a\sqrt{1-s}.
\]

For \(j\ge1\),

\[
A_a^{(j)}(s)=
\frac{a(2j-3)!!}{2^j}(1-s)^{1/2-j}\ge0.
\]

Consequently \(F=A_1A_\lambda\) is absolutely monotone on \(0<s<1\).
Moreover

\[
\mathcal D(s):=sF'(s)-F(s)\ge0,
\]

because \(\mathcal D(0)=0\) and
\(\mathcal D'(s)=sF''(s)\ge0\).  If
\(E_a=sA_a'/A_a\) and \(E=sF'/F=E_1+E_\lambda\), direct
differentiation gives

\[
E_a'(s)=
\frac{a(1+y^2-2ay)}
     {4y^3(1-ay)^2}\ge0,
\qquad y=\sqrt{1-s},
\]

since \(1+y^2-2ay=(1-y)^2+2(1-a)y\).  Hence

\[
\boxed{
sF F''-F'(sF'-F)=F^2E'\ge0.
}
\tag{5.295}
\]

Let

\[
G=g^{(m+1)}=g^{(n-1)},\qquad
H=(1-\delta)G+sG'.
\]

Faà di Bruno's formula in partial Bell polynomials is

\[
D^j(F^\alpha)=
\sum_{h=1}^j
\alpha^{\underline h}F^{\alpha-h}
B_{j,h}(F',\ldots,F^{(j-h+1)}).
\tag{5.296}
\]

Here
\(\alpha^{\underline h}=\prod_{i=0}^{h-1}(\alpha-i)\), and the
exponential partial Bell polynomial convention is

\[
B_{j,h}(x_1,\ldots,x_{j-h+1})
=
\sum_{\substack{r_1+\cdots+r_{j-h+1}=h\\
                 r_1+2r_2+\cdots+(j-h+1)r_{j-h+1}=j}}
\frac{j!}{\prod_i r_i!}
\prod_i\left(\frac{x_i}{i!}\right)^{r_i}.
\]

Every term in \(G\) is strictly positive.  In \(g^{(n)}\), all falling
factorials are positive except the last one,

\[
\alpha^{\underline n}
=-(1-\delta)\alpha^{\underline{n-1}}.
\]

All Bell terms in \(H\) are therefore nonnegative except possibly the
combination involving indices \(n-1\) and \(n\).  Using

\[
B_{n-1,n-1}=(F')^{n-1},\qquad
B_{n,n-1}=\binom n2(F')^{n-2}F'',\qquad
B_{n,n}=(F')^n,
\]

the three terms which must be combined are

\[
\begin{aligned}
&(1-\delta)\alpha^{\underline{n-1}}
 F^{\alpha-n+1}(F')^{n-1}\\
&\quad+s\alpha^{\underline{n-1}}
 F^{\alpha-n+1}\binom n2(F')^{n-2}F''\\
&\quad-s(1-\delta)\alpha^{\underline{n-1}}
 F^{\alpha-n}(F')^n.
\end{aligned}
\]

Factoring the positive quantity
\(\alpha^{\underline{n-1}}F^{\alpha-n}(F')^{n-2}\) leaves

\[
\begin{aligned}
&\binom n2sFF''-(1-\delta)F'(sF'-F)\\
&\quad=
\left\{\binom n2-(1-\delta)\right\}F'\mathcal D
+\binom n2F^2E'\ge0,
\end{aligned}
\]

where (5.295) was used in the second line.  We have proved

\[
\boxed{G(s)>0,\qquad H(s)\ge0\qquad(0<s<1).}
\tag{5.297}
\]

Now define the unnormalized Abel inverse

\[
J(s)=\int_0^s(s-t)^{-\delta}G(t)\,dt.
\]

The endpoint singularities require a small justification before
differentiating.  If \(\lambda<1\), then

\[
F(s)=\frac{1-\lambda}{2}s+O(s^2),\qquad
g(s)=c_0s^\alpha+O(s^{\alpha+1}),\qquad
c_0=\left(\frac{1-\lambda}{2}\right)^\alpha,
\]

and hence

\[
G(t)=Ct^{\delta-1}+R(t),\qquad
C=c_0\frac{\Gamma(\alpha+1)}{\Gamma(\delta)},\qquad
R(t)=O(t^\delta),\quad R'(t)=O(t^{\delta-1}).
\]

The Abel integral of \(Ct^{\delta-1}\) is the constant
\(C{\rm B}(\delta,1-\delta)\), so this homogeneous term contributes
zero to \(J'\).  After it is removed, the differentiated integrand is
dominated by a constant times
\(u^\delta(1-u)^{-\delta}\).  If \(\lambda=1\), then

\[
F(s)=\frac14s^2+O(s^3),\qquad
G(s)=s^\rho A_0(s),\qquad
\rho=m+2\delta-1>-1,
\]

where \(A_0\) is \(C^1\) near zero and \(A_0(0)>0\).  In this case the
change of variables \(t=su\) is dominated by
\(u^\rho(1-u)^{-\delta}\).  These two estimates prove local absolute
continuity and rigorously give

\[
\boxed{
J'(s)=s^{-\delta}\int_0^1(1-u)^{-\delta}
\bigl\{(1-\delta)G(su)+suG'(su)\bigr\}\,du\ge0.
}
\tag{5.298}
\]

Thus \(J\) is nondecreasing.  Let \(\nu\) be its causal
Lebesgue--Stieltjes derivative, including the atom \(J(0+)\delta_0\).
The preceding expansions give

\[
J(0+)=c_0\Gamma(\alpha+1)\Gamma(1-\delta)
\quad(\lambda<1),\qquad
J(0+)=0\quad(\lambda=1).
\]

For completeness, use the causal Riemann--Liouville operator

\[
I^\rho h(s)=\frac1{\Gamma(\rho)}
\int_0^s(s-t)^{\rho-1}h(t)\,dt.
\]

After extending \(J\) by zero to \(s<0\), one has
\(J=\Gamma(1-\delta)I^{1-\delta}G\) and
\(\nu=DJ\) in the sense of causal distributions.  The semigroup rule
and commutation with the causal derivative give

\[
I^\delta\nu
=\Gamma(1-\delta)D I^1G
=\Gamma(1-\delta)G.
\]

This identity includes the jump \(J(0+)\delta_0\), rather than discarding
it at the endpoint.  In unnormalized kernel notation it is exactly

\[
\boxed{
\int_{[0,s)}(s-t)^{\delta-1}\nu(dt)
=\Gamma(\delta)\Gamma(1-\delta)G(s).
}
\tag{5.299}
\]

Set

\[
\mu_q=\frac{\nu}
{\Gamma(\alpha+1)\Gamma(1-\delta)}.
\]

This is a positive measure.  The function
\(\widetilde g(s)=\int_{[0,s)}(s-t)^\alpha\mu_q(dt)\) satisfies

\[
\widetilde g^{(m+1)}(s)
=\frac{\Gamma(\alpha+1)}{\Gamma(\delta)}
\int_{[0,s)}(s-t)^{\delta-1}\mu_q(dt)
=G(s)=g^{(m+1)}(s).
\]

Both \(g\) and \(\widetilde g\), together with their first \(m\)
derivatives, vanish at zero.  Explicitly, for \(0\le j\le m\),
\[
\widetilde g^{(j)}(s)
=\alpha^{\underline j}
\int_{[0,s)}(s-t)^{\alpha-j}\mu_q(dt).
\]
When \(\lambda<1\), \(\mu_q([0,s])=O(1)\), so this is
\(O(s^{\alpha-j})\); when \(\lambda=1\),
\(\mu_q([0,s])=O(s^\alpha)\), so it is
\(O(s^{2\alpha-j})\).  The expansions above give the same vanishing
orders for \(g^{(j)}\).  Hence the difference is a polynomial of degree
at most \(m\) with zero initial jet, and (5.294) follows.
Notice that for \(\lambda<1\),
\(\mu_q(\{0\})=c_0\); when \(\lambda=1\), there is no atom at zero.

Pushing \(\mu_q\) through
\(\Lambda=W_q-T_0^2t\), and restoring the omitted positive constants,
gives

\[
f_V(qv)f_V(q/v)
=\int_{(w,W_q]}(\Lambda-w)^{k-1}H_q(d\Lambda),
\qquad H_q\ge0.
\]

For \(q>lr\) the same normalization is explicit: take
\[
W_q=\frac q{r^2}+\frac{r^2}q,\qquad
T_0=\frac{\sqrt q}{r}+\frac r{\sqrt q}.
\]
Then
\[
P_r(T)=r\sqrt q\,T_0(1-y),\qquad
P_l(T)=(q+l^2)(1-\lambda y),\qquad
\lambda=\frac{l(q+r^2)}{r(q+l^2)}<1,
\]
because
\[
r(q+l^2)-l(q+r^2)=(r-l)(q-lr)>0.
\]
Thus it is literally the same function (5.293), with the endpoint roles
exchanged.  Centers outside \([l^2,r^2]\) give the zero function, and
endpoint centers follow directly or by a limit.  Combining the
fractional argument with the integer proof (5.261)--(5.263) yields

\[
\boxed{
M^2\in HM_k\quad\Longleftrightarrow\quad k\ge1
\qquad(0<l<r,\ U\sim{\rm Beta}(k,k)).
}
\tag{5.300}
\]

The reverse implication for \(0<k<1\) is exactly the endpoint-order
obstruction (5.268), with \(B=2k\).  Thus (5.300) is sharp.

Finally, let \(G_k^{(1)},G_k^{(2)}\) be independent unit-rate gamma
variables.  Gamma--Beta independence and duplication give

\[
\frac{G_k^{(1)}}{b_1}+\frac{G_k^{(2)}}{b_2}
\overset d=G_{2k}M,\qquad
G_{2k}^2\overset d=4G_kG_{k+1/2},
\]

with all factors on the right chosen independently.  By Sjödin's 2021
Theorem 3.1, (5.300) implies \(G_kM^2\in GGC\).  Bondesson's 2015
Theorem 1, followed by scale closure, therefore gives

\[
\boxed{
\left(\frac{G_k^{(1)}}{b_1}
+\frac{G_k^{(2)}}{b_2}\right)^2\in GGC
\qquad(k\ge1,\ b_1,b_2>0).
}
\tag{5.301}
\]

For equal rates the conclusion also follows immediately from the HCM
power closure for a scaled \(G_{2k}\).  The \(HM_k\) construction above
is a new project derivation; its use of Sjödin's gamma--\(HM_k\)
criterion and Bondesson's product theorem is the only external step.
The Bell-polynomial pairing and both endpoint regimes of the Abel
inversion were independently checked inside the project.

### WIP-5.28 — arbitrary two-rate shapes at total shape two

**Status: [PROVED EVERY TWO-RATE GAMMA CONVOLUTION OF TOTAL SHAPE TWO
HAS A GGC SQUARE; COMPUTED ITS THORIN PHASE INCLUDING ENDPOINT ATOMS].**

The exact \(B=2\) phase can be evaluated without symmetry.  Let

\[
0<a<2,\qquad
X=\frac{G_a^{(1)}}{b_1}+\frac{G_{2-a}^{(2)}}{b_2}.
\]

The equal-rate case is a scaled \(G_2\) square and follows from HCM
power closure.  Otherwise exchange the two summands if necessary and
write \(r>l>0\) for their scales, with \(a\) denoting the shape attached
to \(r\).  Gamma--Beta independence gives

\[
\boxed{
X\overset d=G_2M,\qquad
M=l+(r-l)U,\qquad U\sim{\rm Beta}(a,2-a),\qquad U\perp G_2.
}
\tag{5.302}
\]

Put \(\nu=a-1\in(-1,1)\) and
\(H(z)=\mathbb E(z+M)^{-1}\).  The order-two beta integral gives

\[
-H'(z)=\mathbb E(z+M)^{-2}
=(z+r)^{-a}(z+l)^{a-2}.
\]

With \(y(z)=(z+l)/(z+r)\), integration from infinity, on the branch
continued from the positive axis in
\(\mathbb C\setminus[-r,-l]\), yields

\[
\boxed{
H(z)=
\frac{1-y(z)^\nu}{(r-l)\nu}\quad(\nu\ne0),
\qquad
H(z)=-\frac1{r-l}\log y(z)\quad(\nu=0).
}
\tag{5.303}
\]

Let \(G_1\) be independent of \(M\) and set \(Z=G_1M^2\).  Its Laplace
transform

\[
\phi(s)=\mathbb E e^{-sZ}
=\mathbb E(1+sM^2)^{-1}
=\mathbb E\frac{M^{-2}}{s+M^{-2}}
\]

is a normalized nonzero Stieltjes function with spectral support
\([r^{-2},l^{-2}]\).  If \(q=s^{-1/2}\) is the principal branch,
partial fractions give

\[
\boxed{
\phi(s)=\frac q{2i}\{H(-iq)-H(iq)\}.
}
\tag{5.304}
\]

For \(x\in(r^{-2},l^{-2})\), put \(t=x^{-1/2}\in(l,r)\).  As
\(s\to-x+i0\), (5.304) becomes

\[
\phi(-x+i0)=\frac t2\{H(t)-H(-t-i0)\}.
\]

Define

\[
d(t)=\frac{t-l}{r-t},\qquad
D(t)=\frac{(t+l)(r-t)}{(t+r)(t-l)},\qquad Q=D^\nu.
\]

Since \(y(-t-i0)=-d(t)-i0\), (5.303) gives the exact boundary values

\[
\boxed{
\phi(-x+i0)=
\frac{t}{2(r-l)\nu}
\left(\frac{t-l}{r-t}\right)^\nu
\{e^{-i\pi\nu}-Q\}\quad(\nu\ne0),
}
\tag{5.305}
\]

and

\[
\boxed{
\phi(-x+i0)=
\frac{t}{2(r-l)}\{-\log D(t)-i\pi\}\quad(\nu=0).
}
\tag{5.306}
\]

These expressions never vanish in the interior of the cut.

Because \(\phi\) is Stieltjes, \(1/\phi\) is a complete Bernstein
function.  Let

\[
\eta(x)=\frac1\pi\arg\frac1{\phi(-x+i0)}
=-\frac1\pi\Arg\phi(-x+i0)
\]

be its canonical phase lift.  It is zero to the left of
\(r^{-2}\) and one to the right of \(l^{-2}\); throughout we take its
right-continuous representative.  As \(x\) traverses the
cut, \(D\) increases from \(0\) to \(\infty\).  If \(0<\nu<1\),
\(\eta\) jumps from \(0\) to \(\nu\) at \(r^{-2}\), then increases
continuously from \(\nu\) to \(1\).  If \(-1<\nu<0\), it increases
continuously from \(0\) to \(1+\nu\), then jumps by \(-\nu\) at
\(l^{-2}\).  For \(\nu=0\), it increases continuously from \(0\) to
\(1\).  In the derivative formulas below, \(D\) and \(Q\) are regarded
as functions of \(x\) through \(t=t(x)=x^{-1/2}\).

In fact, on the cut,

\[
\boxed{
\eta'(x)=
\frac{\sin(\pi\nu)Q'(x)}
{\pi\{Q^2-2Q\cos(\pi\nu)+1\}}
=\frac{\nu\sin(\pi\nu)}{\pi}
\frac{Q\,(\log D)'(x)}
{Q^2-2Q\cos(\pi\nu)+1}>0
}
\tag{5.307}
\]

when \(\nu\ne0\), while

\[
\boxed{
\eta'(x)=
\frac{\dfrac d{dx}\log D(t(x))}
{\{\log D(t(x))\}^2+\pi^2}>0
}
\tag{5.308}
\]

when \(\nu=0\).  Here

\[
\frac d{dt}\log D(t)
=-\frac{2l}{t^2-l^2}-\frac{2r}{r^2-t^2}<0,
\qquad
\frac{dt}{dx}=-\frac12x^{-3/2}<0,
\]

so \((\log D)'(x)>0\); also
\(\nu\sin(\pi\nu)>0\) for \(-1<\nu<1,\ \nu\ne0\).

The canonical CBF representation and \(\phi(0)=1\) now give

\[
\log\frac1{\phi(s)}
=\int_0^\infty\frac{s}{x(s+x)}\eta(x)\,dx.
\]

Equivalently, if \(g=1/\phi\), differentiation and Stieltjes
integration by parts give

\[
\frac{g'(s)}{g(s)}
=\int_0^\infty\frac{\eta(x)}{(s+x)^2}\,dx
=\int_{(0,\infty)}\frac{d\eta(x)}{s+x}.
\]

The endpoint terms vanish because the right-continuous representative
has \(\eta(0+)=0\) and
\(\eta(x)/(s+x)\to0\) at infinity.  Integrating back at \(s=0\) yields

\[
\boxed{
\log\frac1{\phi(s)}
=\int_{(0,\infty)}\log(1+s/x)\,d\eta(x).
}
\tag{5.309}
\]

Equivalently, the boundary term in the logarithmic integration by parts
is zero because \(\eta=0\) on \((0,r^{-2})\),
\(\eta=1\) on \((l^{-2},\infty)\), and
\(\log(1+s/x)\to0\) as \(x\to\infty\).  The
Lebesgue--Stieltjes measure \(d\eta\) automatically retains both possible
endpoint jumps.

Thus \(Z\in GGC\), with Thorin measure \(d\eta\).  Its interior density
is (5.307) or (5.308); if \(\nu>0\) there is in addition the atom
\(\nu\delta_{r^{-2}}\), while if \(\nu<0\) there is the atom
\((-\nu)\delta_{l^{-2}}\).  The total Thorin mass is one.

The duplication identity

\[
G_2^2\overset d=4G_1G_{3/2}
\]

may be realized with the two gamma factors independent of \(M\).
Equations (5.302) and (5.309), Bondesson's product closure for
independent GGC variables, and scale closure prove

\[
\boxed{
\left(\frac{G_a^{(1)}}{b_1}
+\frac{G_{2-a}^{(2)}}{b_2}\right)^2\in GGC
\qquad(0<a<2,\ b_1,b_2>0).
}
\tag{5.310}
\]

This proof genuinely uses beta averaging.  Pointwise positivity of the
kernel in (5.257) already fails at \(B=2\).  Indeed, writing

\[
F_1(z)=A(z)+iD_0(z),\qquad
A(z)=\frac{\sqrt\pi}{2}e^{-z^2},
\]

the recurrence \(F_2(z)=\tfrac12+izF_1(z)\) gives
\(C_2(0)=1/2\) and \(S_2'(y)=A(y)(1-2y^2)\).  Hence

\[
\boxed{
\mathcal K_2(0,y)
=\frac y4A(y)(1-2y^2)
=\frac{y\sqrt\pi}{8}e^{-y^2}(1-2y^2)<0
\quad\left(y>\frac1{\sqrt2}\right).
}
\tag{5.311}
\]

By continuity the kernel remains negative for sufficiently small
positive first argument.  Therefore the theorem is an averaged phase
result, not a universal pointwise-kernel theorem.  All beta-integral,
branch, endpoint-jump, and duplication calculations in this subsection
are new project derivations and were independently checked; the external
inputs are the standard Stieltjes/CBF phase representation and
Bondesson's product theorem already listed in the source map.

### WIP-5.29 — downward propagation in total shape

**Status: [PROVED A GENERAL SHAPE-PADDING LEMMA; CONSEQUENTLY PROVED THE
SQUARE THEOREM FOR EVERY FINITE GAMMA CONVOLUTION OF TOTAL SHAPE AT MOST
ONE].**

For \(B_0,q>0\), let \(\mathsf P(B_0,q)\) denote the statement that
\(Y^q\in GGC\) for every finite gamma convolution

\[
Y=\sum_{j=1}^n c_jG_{\gamma_j}^{(j)},\qquad
c_j,\gamma_j>0,\qquad \sum_j\gamma_j=B_0.
\]

Assume \(\mathsf P(B_0,q)\), fix \(0<B<B_0\), and let
\(X=\sum_jc_jG_{\beta_j}^{(j)}\) have total shape \(B\).  On an enlarged
probability space take \(H\sim G_{B_0-B}\) independent of \(X\), and put

\[
X_\varepsilon=X+\varepsilon H,\qquad \varepsilon>0.
\]

This is a finite gamma convolution of total shape \(B_0\), so
\(X_\varepsilon^q\in GGC\).  Moreover
\(X_\varepsilon^q\to X^q\) almost surely as
\(\varepsilon\downarrow0\).  The weak closure of GGC therefore proves

\[
\boxed{
\mathsf P(B_0,q)\quad\Longrightarrow\quad
\mathsf P(B,q)\ \text{for every }0<B\le B_0.
}
\tag{5.312}
\]

The added gamma has a vanishing scale, not a vanishing shape.  This is why
the hypothesis at \(B_0\) must allow arbitrary finite rate support.
Applying (5.312) to WIP-5.26, with \(B_0=1\) and \(q=2\), gives

\[
\boxed{
\left(\sum_{j=1}^n\frac{G_{\beta_j}^{(j)}}{b_j}\right)^2\in GGC
\quad\text{whenever}\quad
\beta_j,b_j>0,\qquad \sum_j\beta_j\le1.
}
\tag{5.313}
\]

This is a new project deduction from WIP-5.26 and the established weak
closure of GGC.  It does not propagate a theorem upward in total shape.

### WIP-5.30 — an explicit hypergeometric Thorin measure and the complete two-rate square theorem

**Status: [PROVED EVERY TWO-RATE GAMMA CONVOLUTION HAS A GGC SQUARE, FOR
ARBITRARY POSITIVE SHAPES AND RATES; CONSTRUCTED THE THORIN MEASURE OF THE
GAMMA--BETA FACTOR].**

Let \(a,c>0\), \(B=a+c\), and

\[
k=\frac B2,\qquad A=\frac a2,\qquad C=\frac c2,\qquad
D=k+\frac12.
\]

After ordering the two scales, take \(0<l<r\), let
\(U\sim{\rm Beta}(a,c)\), and put \(M=l+(r-l)U\).  The shape \(a\)
is attached to the scale \(r\), and \(c\) to \(l\).  Beta--gamma
independence gives

\[
\boxed{
rG_a^{(1)}+lG_c^{(2)}
\overset d=G_BM,\qquad G_B\perp M.
}
\tag{5.314}
\]

Take \(G_k\perp M\), set \(Z=G_kM^2\), and write

\[
L(s)=\mathbb E e^{-sZ}=\mathbb E(1+sM^2)^{-k}.
\]

The first step is an exact transform identity.  The beta odds
\(x=U/(1-U)\), followed by
\(x=\sqrt{(1+l^2s)/(1+r^2s)}\,v\), gives

\[
L(s)=
\frac{(1+r^2s)^{-A}(1+l^2s)^{-C}}{\mathrm B(a,c)}
J(\eta),
\quad
J(\eta)=\int_0^\infty
\frac{v^{a-1}\,dv}{(1+2\eta v+v^2)^k},
\tag{5.315}
\]

where

\[
\eta=\frac{1+lrs}{\sqrt{(1+l^2s)(1+r^2s)}},
\qquad
1-\eta^2=
\frac{(r-l)^2s}{(1+r^2s)(1+l^2s)}.
\]

For \(s\ge0\), \(0<\eta\le1\).  Since

\[
0\le
\frac{2(1-\eta)v}{(1+v)^2}
\le\frac{1-\eta}{2}<1,
\]

the binomial series has nonnegative terms and Tonelli's theorem applies:

\[
\begin{aligned}
\frac{J(\eta)}{\mathrm B(a,c)}
&=\sum_{n\ge0}\frac{(k)_n}{n!}
   \{2(1-\eta)\}^n
   \frac{\mathrm B(a+n,c+n)}{\mathrm B(a,c)}\\
&=\sum_{n\ge0}
  \frac{(a)_n(c)_n}{(D)_n\,n!}
  \left(\frac{1-\eta}{2}\right)^n\\
&={}_2F_1\left(a,c;D;\frac{1-\eta}{2}\right).
\end{aligned}
\tag{5.316}
\]

Here the duplication identity
\((2k)_{2n}=2^{2n}(k)_n(k+\tfrac12)_n\) was used in the second line.
NIST DLMF 15.8.18, with \(x=(1-\eta)/2<1/2\), transforms the last
function in (5.316).  Thus, with

\[
z(s)=\frac{(r-l)^2s}{(1+r^2s)(1+l^2s)}\in[0,1),
\]

one obtains

\[
\boxed{
L(s)=(1+r^2s)^{-A}(1+l^2s)^{-C}
F(z(s)),\qquad
F(z)={}_2F_1(A,C;D;z).
}
\tag{5.317}
\]

It remains to identify the logarithm of \(F\).  Put
\(m=\min(A,C)\), \(h=\max(A,C)\), and use the symmetry
\(F(A,C;D;z)=F(h,m;D;z)\).  Dyachenko--Karp, Theorem 2.1,
Theorem 2.12, and Section 4, Example 2, apply because

\[
0<m\le h<D,\qquad D-h-m=\frac12>0.
\]

Their \(R_{0,1,0}\) formula gives a probability measure \(\mu\) on
\((0,1)\) such that

\[
R(z):=
\frac{{}_2F_1(h,m+1;D;z)}
     {{}_2F_1(h,m;D;z)}
=\int_0^1\frac{\mu(dt)}{1-tz}.
\tag{5.318}
\]

There is no constant term at infinity because their smaller numerator
parameter is \(m\le h\); normalization follows also from \(R(0)=1\).
The contiguous identity

\[
zF'(z)
=m\bigl\{{}_2F_1(h,m+1;D;z)-F(z)\bigr\}
\]

therefore yields, with \(\rho=m\mu\),

\[
\boxed{
\frac{F'(z)}{F(z)}
=\int_0^1\frac{t}{1-tz}\,\rho(dt),
\qquad
\rho((0,1))=m.
}
\tag{5.319}
\]

The measure is not merely existential.  In the notation above,

\[
\boxed{
\rho(dt)=
\frac{\Gamma(D)^2}
     {\Gamma(m)\Gamma(h)\Gamma(D-m)\Gamma(D-h)}
\frac{t^{k-1}(1-t)^{-1/2}}
     {|{}_2F_1(m,h;D;t^{-1}+i0)|^2}\,dt .
}
\tag{5.320}
\]

For \(t^{-1}>1\), the modulus in (5.320) means the product of the two
conjugate boundary values on the Gauss cut.  Formula (5.318), rather than
an unproved choice of branch, supplies its positivity and normalization.
Integrating (5.319) from \(0\), using \(F(0)=1\), gives

\[
\boxed{
\log F(z)=-\int_0^1\log(1-tz)\,\rho(dt),
\qquad 0\le z<1.
}
\tag{5.321}
\]

For \(t\in[0,1]\), define

\[
\begin{gathered}
S_t=r^2+l^2-t(r-l)^2,\qquad
\lambda_\pm(t)=
\frac{S_t\pm\sqrt{S_t^2-4r^2l^2}}2.
\end{gathered}
\]

Since
\(S_t=(1-t)(r^2+l^2)+2tlr\ge2lr\), both roots are positive.  They
satisfy

\[
\lambda_+\lambda_-=r^2l^2,\qquad
1-tz(s)=
\frac{(1+\lambda_+(t)s)(1+\lambda_-(t)s)}
     {(1+r^2s)(1+l^2s)}.
\tag{5.322}
\]

Substitution of (5.321)--(5.322) into (5.317), together with
\(\rho((0,1))=m\), gives the finite Thorin representation

\[
\boxed{
\begin{aligned}
-\log L(s)
={}&(A-m)\log(1+r^2s)+(C-m)\log(1+l^2s)\\
&+\int_0^1
\{\log(1+\lambda_+(t)s)+\log(1+\lambda_-(t)s)\}\,\rho(dt).
\end{aligned}
}
\tag{5.323}
\]

In the scale convention of this ledger, its Thorin measure is

\[
\boxed{
\tau=(A-m)\delta_{r^2}+(C-m)\delta_{l^2}
     +(\lambda_+)_\#\rho+(\lambda_-)_\#\rho,
\qquad \tau((0,\infty))=A+C=k.
}
\tag{5.324}
\]

Indeed
\(l^2\le\lambda_-\le lr\le\lambda_+\le r^2\), so
\(\operatorname{supp}\tau\subset[l^2,r^2]\).  The two pushforwards in
(5.324) can also be combined into one ordinary density.  For
\(l^2<x<r^2\), set

\[
t(x)=\frac{(r^2-x)(x-l^2)}{(r-l)^2x}.
\]

Then the continuous part of \(\tau\) has density

\[
\boxed{
q_\tau(x)=
\frac{\Gamma(D)^2}
     {\Gamma(m)\Gamma(h)\Gamma(D-m)\Gamma(D-h)}
\frac{t(x)^{k-1}(x+lr)}
     {(r-l)x^{3/2}
      |{}_2F_1(m,h;D;t(x)^{-1}+i0)|^2}.
}
\tag{5.324a}
\]

Indeed
\[
1-t(x)=\frac{(x-lr)^2}{(r-l)^2x},\qquad
\left|\frac{dt}{dx}\right|
=\frac{|x-lr|(x+lr)}{(r-l)^2x^2},
\]
so the square-root factor and Jacobian cancel.  The two inverse branches
occupy \((l^2,lr)\) and \((lr,r^2)\), respectively; there is no missing
factor two.  At their common endpoint the density has the finite limit
\[
q_\tau(lr)=
\frac{2\Gamma(A+\tfrac12)\Gamma(C+\tfrac12)}
     {\pi(r-l)\sqrt{lr}\,\Gamma(A)\Gamma(C)}.
\]
The standard rate-form Thorin measure is the reciprocal pushforward of
\(\tau\).  Consequently \(Z=G_kM^2\in GGC\).

There is a stronger Route-1 interpretation.  If
\(F_*=\tau/k\) and \(M_k(F_*)\) denotes the order-\(k\) Dirichlet mean
directed by \(F_*\), then the generalized Stieltjes identity and (5.323)
give

\[
\mathbb E(1+sM^2)^{-k}
=\mathbb E(1+sM_k(F_*))^{-k}.
\]

Both variables are supported on \([l^2,r^2]\).  Expanding at the origin
identifies every moment, and the compact Hausdorff moment problem is
determinate.  Hence

\[
\boxed{M^2\overset d=M_k(F_*).}
\tag{5.325}
\]

The directing probability \(F_*\) is unique at this order.  Indeed, equality
of two order-\(k\) Markov--Krein transforms gives equality of
\(\int\log(1+sx)\,F(dx)\); differentiation gives equality of their
Stieltjes transforms, hence of the directing measures.

Finally, Legendre duplication gives, with all right-hand factors mutually
independent and independent of \(M\),

\[
G_B^2\overset d=4G_kG_{k+1/2},
\qquad
(G_BM)^2\overset d=4Z\,G_{k+1/2}.
\]

Bondesson's independent-product theorem and scale closure now prove

\[
\boxed{
\left(\frac{G_a^{(1)}}{b_1}
     +\frac{G_c^{(2)}}{b_2}\right)^2\in GGC
\qquad(a,c,b_1,b_2>0).
}
\tag{5.326}
\]

The equal-rate case is also immediate from HCM power closure.  For
\(B=2\), (5.324) has the endpoint scale atom
\((a-1)\delta_{r^2}\) if \(a>1\), and
\((1-a)\delta_{l^2}\) if \(a<1\); after reciprocal pushforward these
are exactly the rate-form atoms in WIP-5.28.  This is an independent
normalization check.  Formula (5.324) is an explicit Thorin measure for
the factor \(Z\), not for the final independent product in (5.326);
Bondesson's theorem supplies membership of that product without an
explicit product Thorin measure.

All beta-integral, contiguous, factorization, and Dirichlet-mean
deductions above are new project derivations.  The external inputs are
DLMF 15.8.18, the precisely cited Dyachenko--Karp Markov representation,
the standard gamma--Dirichlet identity, and Bondesson's product theorem.
Three independent project audits checked the transform, parameter range,
measure mass, endpoint atoms, and independence in the final product.

### WIP-5.31 — the averaged theorem cannot be replaced by pointwise kernel positivity

**Status: [PROVED A POINTWISE OBSTRUCTION FOR EVERY \(0<B\le2\); THIS IS
NOT A COUNTEREXAMPLE TO GGC MEMBERSHIP].**

Let \(\mathcal K_B\) be the pointwise phase kernel from (5.257).  At its
first endpoint, the definitions \(S_B(0)=0\),
\(C_B(0)=\Gamma(B/2)/2\), and \(F_B'=2iF_{B+1}\) give

\[
\boxed{
\mathcal K_B(0,y)
=\frac{y\Gamma(B/2)}4S_B'(y)
=\frac{y\Gamma(B/2)}2C_{B+1}(y).
}
\tag{5.327}
\]

For \(0<B<2\),

\[
C_{B+1}(y)
=\frac12\Gamma\left(\frac{B+1}{2}\right)
{}_1F_1\left(\frac{B+1}{2};\frac12;-y^2\right).
\]

The algebraic term in NIST DLMF 13.7.2, followed by reflection and
duplication of the gamma function, gives

\[
C_{B+1}(y)\sim
-\frac{\Gamma(B+1)\sin(\pi B/2)}{2^{B+1}}\,y^{-B-1}.
\]

Thus

\[
\boxed{
\mathcal K_B(0,y)\sim
-\frac{\Gamma(B/2)\Gamma(B+1)\sin(\pi B/2)}
       {2^{B+2}}\,y^{-B}<0
\qquad(y\to\infty).
}
\tag{5.328}
\]

Continuity makes the kernel negative for all sufficiently small positive
first arguments and sufficiently large fixed second argument.  At \(B=2\),
the exact negative interval is already (5.311).  Therefore pointwise
kernel positivity fails throughout \(0<B\le2\), even though WIP-5.30
proves that the required beta average is nonnegative for every two-rate
shape pair.  The hypergeometric logarithmic averaging is essential.

### WIP-5.32 — exact third-atom conditioning and why naive barycentric recursion fails

**Status: [PROVED EXACT REDUCTION AND SEVERAL STRUCTURAL OBSTRUCTIONS;
NOT A COUNTEREXAMPLE TO GGC MEMBERSHIP].**

Let \(F\) be a compactly supported probability law on \((0,\infty)\),
let \(B_0,\beta>0\), and put

\[
T=B_0+\beta,\qquad k=\frac T2,qquad
A=\frac{B_0}{2},\qquad C=\frac\beta2,
\qquad D=k+\frac12,
\qquad m=\min(A,C),\quad h=\max(A,C).
\tag{5.329}
\]

For

\[
N=M_{B_0}(F),qquad U\sim {\rm Beta}(B_0,\beta),
\qquad M_+=UN+(1-U)d,\quad d>0,
\]

with \(U\perp N\), Dirichlet aggregation gives

\[
\boxed{
M_+\overset d=M_T\!\left(\frac{B_0}{T}F+\frac\beta T\delta_d\right).
}
\tag{5.330}
\]

This is the exact one-atom update that a Route-5 recursion must preserve
after squaring.  Conditional on \(N=n\), WIP-5.30 applies with scales
\(n,d\).  Let \(\rho=\rho_{A,C}\) be the positive measure of mass
\(m\) on \((0,1)\) given by

\[
\rho(dt)=
\frac{\Gamma(D)^2}
     {\Gamma(m)\Gamma(h)\Gamma(D-m)\Gamma(D-h)}
\frac{t^{k-1}(1-t)^{-1/2}}
     {|{}_2F_1(m,h;D;t^{-1}+i0)|^2}\,dt.
\tag{5.331}
\]

Define

\[
S_t(n,d)=n^2+d^2-t(n-d)^2,
\qquad
\lambda_\pm(t;n,d)=
\frac{S_t(n,d)\pm\sqrt{S_t(n,d)^2-4n^2d^2}}2.
\tag{5.332}
\]

Since \(S_t(n,d)\ge2nd\), both roots are positive.  The conditional
scale-form Thorin measure is

\[
\boxed{
\tau_n=(A-m)\delta_{n^2}+(C-m)\delta_{d^2}
       +(\lambda_+(\,\cdot\,;n,d))_\#\rho
       +(\lambda_-(\,\cdot\,;n,d))_\#\rho,
\qquad |\tau_n|=k.
}
\tag{5.333}
\]

Equivalently,

\[
\begin{aligned}
H_n(s)
&:=\mathbb E_U(1+s(Un+(1-U)d)^2)^{-k}\\
&=(1+sn^2)^{-A}(1+sd^2)^{-C}
{}_2F_1\!\left(
A,C;D;
\frac{s(n-d)^2}{(1+sn^2)(1+sd^2)}
\right)\\
&=e^{-\Phi_n(s)},
\qquad
\Phi_n(s)=\int_{(0,\infty)}\log(1+sx)\,\tau_n(dx).
\end{aligned}
\tag{5.334}
\]

The unconditional transform of the updated squared mean is therefore

\[
H(s)=\mathbb E_N H_N(s)=\mathbb E_Ne^{-\Phi_N(s)}.
\tag{5.335}
\]

This is an average of Thorin exponentials, not the exponential of an
averaged Thorin measure.  More precisely, put

\[
g_n(s)=\Phi_n'(s)
=\int\frac{x}{1+sx}\,\tau_n(dx),
\qquad
\frac{d\mathbb P_s}{d\mathbb P_N}(n)=\frac{H_n(s)}{H(s)}.
\]

Then the exact recognition function is the nonlinear posterior quotient

\[
\boxed{
g(s):=-\frac{H'(s)}{H(s)}
=\mathbb E_s[g_N(s)].
}
\tag{5.336}
\]

Compact support bounded away from zero gives
\(\lim_{s\to\infty}sg(s)=k\).  Hence
\(G_kM_+^2\in GGC\) is equivalent to \(g\) being a Stieltjes function;
if this holds, its rate-form Thorin measure \(\mathcal U_+\), the
reciprocal image of the scale-form measure, is recovered for
\(0<a<b<\infty\) when the endpoints are not atoms by

\[
\mathcal U_+((a,b))
=-\frac1\pi\lim_{\varepsilon\downarrow0}
\int_a^b
\Im\frac{
 \mathbb E[H_N(-t+i\varepsilon)g_N(-t+i\varepsilon)]}
 {\mathbb E H_N(-t+i\varepsilon)}\,dt.
\tag{5.337}
\]

Already the first two real-axis derivatives show why conditional GGC
membership does not close the argument:

\[
\boxed{
g'(s)=\mathbb E_sg_N'(s)-\operatorname{Var}_s(g_N(s))<0,
}
\tag{5.338}
\]

whereas

\[
g''(s)=\mathbb E_sg_N''(s)
-3\operatorname{Cov}_s(g_N(s),g_N'(s))
+\kappa_{3,s}(g_N(s))
\tag{5.339}
\]

has no termwise sign.  Thus complete monotonicity requires control of all
posterior cumulant corrections.

Three exact obstructions dispose of the literal recursion.  First, for
every \(s>0\), \(n\mapsto H_n(s)\) is strictly decreasing and
\(n\mapsto\Phi_n(s)\) is strictly increasing.  If \(N\) is
nondegenerate, strict Jensen gives

\[
\boxed{
H(s)=\mathbb E e^{-\Phi_N(s)}
>e^{-\mathbb E\Phi_N(s)}.
}
\tag{5.340}
\]

Here and below the strict inequality in (5.340) is asserted for \(s>0\);
at \(s=0\) both sides equal one.

Consequently the averaged conditional measure
\(\mathbb E\tau_N\) cannot be the desired Thorin measure.

Second, suppose \(\operatorname{supp}N\subset[l,r]\), put
\(R=\max(r,d)\), and write \(W=Un+(1-U)d\).  Direct differentiation
gives

\[
\frac{\partial^2H_n(s)}{\partial n^2}
=2ks\,\mathbb E\!\left[
U^2(1+sW^2)^{-k-2}\{(2k+1)sW^2-1\}
\right].
\tag{5.341}
\]

Since \(2k+1=T+1\),

\[
0<s<\frac1{(T+1)R^2}
\quad\Longrightarrow\quad
\frac{\partial^2H_n(s)}{\partial n^2}<0.
\tag{5.342}
\]

By contrast, every fixed positive generalized-Stieltjes operator

\[
K_s(n)=\int_{[0,\infty)}(1+tn)^{-B_0}\,\nu_s(dt),
\qquad \nu_s\ge0,
\]

has \(K_s''(n)\ge0\).  Hence no operator of this form can agree pointwise
with the outer update on a nontrivial interval of \(n\), even locally for
small \(s\).  This does not exclude a support-dependent or nonlinear
kernel, nor an identity that holds only after averaging over a particular
law of \(N\).

Third, write

\[
a_j(n)=\int x^j\,\tau_n(dx),
\qquad
-\log H(s)=\sum_{j\ge1}\frac{(-1)^{j+1}}j a_j^*s^j.
\]

Expanding the logarithm of (5.335) gives the unavoidable corrections

\[
\boxed{
\begin{aligned}
a_1^*&=\mathbb E a_1(N),\\
a_2^*&=\mathbb E a_2(N)+\operatorname{Var}(a_1(N)),\\
a_3^*&=\mathbb E a_3(N)
 +\frac32\operatorname{Cov}(a_1(N),a_2(N))
 +\frac12\kappa_3(a_1(N)).
\end{aligned}
}
\tag{5.343}
\]

Here

\[
\boxed{
a_1(n)=
\frac{B_0(B_0+1)n^2+2B_0\beta dn+\beta(\beta+1)d^2}
     {2(T+1)},
\qquad a_1'(n)>0.
}
\tag{5.344}
\]

Thus a nondegenerate \(N\) already forces

\[
a_2^*-\int x^2\,\mathbb E[\tau_N](dx)
=\operatorname{Var}(a_1(N))>0.
\tag{5.345}
\]

Nor does ordinary Dirichlet associativity repair the mismatch.  The
literal atom at \(n^2\) in (5.333) has mass \(A-m<A\) (or is absent),
and both continuous pushforwards depend on that same \(n\).  Replacing an
order-\(A\) mean by an order-\(A-m\) mean with the same nondegenerate
base changes its variance from
\(\operatorname{Var}_F(X)/(A+1)\) to
\(\operatorname{Var}_F(X)/(A-m+1)\).  Therefore the standard
barycentric associativity identity cannot be applied to (5.333) as
written.

The useful output is the exact nonlinear target (5.336)--(5.337) and the
cumulant ledger (5.343), not a negative answer to the three-rate square
problem.  All formulas after the conditional WIP-5.30 input are new
project derivations.

### WIP-5.33 — exact three-rate Lauricella--Appell reduction and a multivariate-kernel obstruction

**Status: [PROVED REDUCTION AND PROVED GENERIC OBSTRUCTION TO A RAW
MULTIVARIATE MARKOV REPRESENTATION; NOT A GGC COUNTEREXAMPLE].**

Let \(a,b,c>0\), \(B=a+b+c\), \(k=B/2\), and order three scales as
\(0<l<d<r\).  For

\[
(P_r,P_d,P_l)\sim {\rm Dirichlet}(a,b,c),
\qquad M=rP_r+dP_d+lP_l,
\qquad Z=G_kM^2,
\]

put \(\zeta=\sqrt s\).  Combining the two factors of
\((1+sM^2)^{-k}\) by the Feynman beta identity and then applying the
Markov--Krein identity of total order \(B=2k\) gives

\[
\boxed{
L_Z(s)=\frac1{{\rm B}(k,k)}\int_0^1[v(1-v)]^{k-1}
\prod_{(x,\gamma)=(r,a),(d,b),(l,c)}
[1+i\zeta(2v-1)x]^{-\gamma}\,dv.
}
\tag{5.346}
\]

Set

\[
\xi_x=-\frac{2i\zeta x}{1-i\zeta x}.
\]

Euler's integral for the Lauricella function gives

\[
L_Z(s)=
\prod_x(1-i\zeta x)^{-\gamma_x}
F_D^{(3)}(k;a,b,c;2k;\xi_r,\xi_d,\xi_l).
\tag{5.347}
\]

Because \(a+b+c=2k\), the complementary-variable transformation removes
one Lauricella variable:

\[
F_D^{(3)}(k;a,b,c;2k;\xi_r,\xi_d,\xi_l)
=(1-\xi_l)^{-k}
F_1(k;a,b;2k;\eta_r,\eta_d),
\tag{5.348}
\]

where

\[
\eta_x=\frac{\xi_x-\xi_l}{1-\xi_l}
=-\frac{2i\zeta(x-l)}{(1-i\zeta x)(1+i\zeta l)}.
\]

If \(\theta_x=\arctan(\zeta x)\) and
\(\Delta_x=\theta_x-\theta_l\), then
\(\eta_x=1-e^{2i\Delta_x}\).  Hence the exact two-variable form is

\[
\boxed{
\begin{aligned}
L_Z(s)
={}&\prod_x(1+sx^2)^{-\gamma_x/2}
e^{i(a\Delta_r+b\Delta_d)}\\
&\times F_1\!\left(k;a,b;2k;
1-e^{2i\Delta_r},1-e^{2i\Delta_d}\right).
\end{aligned}
}
\tag{5.349}
\]

Formula (5.346) proves directly that the apparently complex expression
(5.349) is real and strictly positive for \(s\ge0\).

The two-rate boundary is an exact normalization check.  When \(b=0\),
NIST DLMF 15.8.14 gives

\[
e^{ia\Delta}
{}_2F_1(k,a;2k;1-e^{2i\Delta})
={}_2F_1\!\left(\frac a2,\frac c2;
k+\frac12;\sin^2\Delta\right),
\tag{5.350}
\]

and

\[
\sin^2\Delta
=\frac{(r-l)^2s}{(1+r^2s)(1+l^2s)}.
\]

Thus (5.349) reduces exactly to WIP-5.30.  For the genuine Appell factor

\[
\Psi(x,y)=F_1(k;a,b;2k;x,y),
\]

the two logarithmic derivatives are contiguous Appell quotients:

\[
\boxed{
\begin{aligned}
\partial_x\log\Psi
&=\frac a2
\frac{F_1(k+1;a+1,b;2k+1;x,y)}{\Psi(x,y)},\\
\partial_y\log\Psi
&=\frac b2
\frac{F_1(k+1;a,b+1;2k+1;x,y)}{\Psi(x,y)}.
\end{aligned}
}
\tag{5.351}
\]

The one-variable Dyachenko--Karp/Küstner theorem used in WIP-5.30 does
not cover these quotients, and the physical curve in (5.349) is complex.
Moreover, the most direct multivariate analogue is generically
impossible.  Write

\[
\Phi(z)=F_D^{(3)}(k;a,b,c;2k;z_1,z_2,z_3)
=\mathbb E_{Q\sim{\rm Beta}(k,k)}
\prod_{j=1}^3(1-z_jQ)^{-\alpha_j},
\qquad (\alpha_1,\alpha_2,\alpha_3)=(a,b,c).
\tag{5.352}
\]

For distinct \(i,j,h\), a fourth-order cumulant calculation gives

\[
\boxed{
[z_i z_j z_h^2]\log\Phi(z)
=\frac{\alpha_i\alpha_j\alpha_h(B-3\alpha_h)}
       {16(B+1)^2(B+3)}.
}
\tag{5.353}
\]

For completeness, symmetry of \(Q\sim{\rm Beta}(B/2,B/2)\) yields

\[
\operatorname{Var}Q=\frac1{4(B+1)},
\qquad
\mathbb E(Q-1/2)^4=\frac3{16(B+1)(B+3)},
\]

and the coefficient in (5.353) is

\[
\frac{\alpha_i\alpha_j\alpha_h}{2}
\kappa(Q,Q,Q^2)
+\frac{\alpha_i\alpha_j\alpha_h^2}{2}\kappa_4(Q),
\]

with

\[
\kappa(Q,Q,Q^2)=\frac{B}{8(B+1)^2(B+3)},
\qquad
\kappa_4(Q)=-\frac3{8(B+1)^2(B+3)}.
\]

Suppose there were a fixed positive multivariate Markov representation

\[
\nabla\log\Phi(z)
=\int_{\mathbb R_+^3}
\frac{t}{1-\langle z,t\rangle}\,\varrho(dt),
\qquad \varrho\ge0.
\tag{5.354}
\]

After radial integration, (5.354) would force

\[
[z_i z_j z_h^2]\log\Phi(z)
=3\int t_it_jt_h^2\,\varrho(dt)\ge0.
\tag{5.355}
\]

If the three shapes are unequal, their largest member exceeds \(B/3\);
choosing it as \(\alpha_h\) makes (5.353) negative, contradicting
(5.355).  Thus a direct fixed positive multivariate Markov kernel for the
raw Lauricella factor cannot exist for unequal shapes.  The coefficient
vanishes at equal shapes, so this test is silent there.

This obstruction does not address the one-dimensional composite
\(s\mapsto\Phi(\xi_r(s),\xi_d(s),\xi_l(s))\), where phase and prefactor
terms can cancel.  It is therefore not a counterexample to the GGC square
claim.  The viable three-rate target is the boundary phase of the
one-dimensional Appell expression (5.349), or equivalently the nonlinear
conditional quotient (5.336), rather than (5.354).  Equations
(5.346)--(5.355), except for the cited one-variable quadratic
transformation, are new project derivations.

### WIP-5.34 — an explicit Thorin measure for three exponentials

**Status: [PROVED THE SQUARE OF EVERY THREE-RATE SUM WITH SHAPES
\((1,1,1)\) IS GGC].**

Let \(0<l<d<r\), let \(E_l,E_d,E_r\) be independent unit-rate
exponentials, and set

\[
X=lE_l+dE_d+rE_r.
\]

Gamma--Dirichlet independence gives

\[
X\overset d=G_3M,\qquad
M=lP_l+dP_d+rP_r,\qquad
(P_l,P_d,P_r)\sim{\rm Dirichlet}(1,1,1),
\tag{5.356}
\]

with \(G_3\perp M\).  A direct slice of the uniform Dirichlet triangle
gives the linear spline density

\[
\boxed{
f_M(x)=
\frac{2(x-l)}{(r-l)(d-l)}\mathbf 1_{(l,d)}(x)
+\frac{2(r-x)}{(r-l)(r-d)}\mathbf 1_{(d,r)}(x).
}
\tag{5.357}
\]

Take \(G_{3/2}\perp M\), put \(Z=G_{3/2}M^2\), and write

\[
L(s)=\mathbb E e^{-sZ}
=\mathbb E(1+sM^2)^{-3/2}.
\]

For \(F_x(s)=\sqrt{1+sx^2}\), one has
\(\partial_x^2F_x(s)=s(1+sx^2)^{-3/2}\).  The Peano kernel for the
second divided difference, or direct integration against (5.357), gives

\[
\boxed{
\begin{aligned}
L(s)
&=\frac2s[l,d,r]\,F_{\bullet}(s)\\
&=\frac2{r-l}
\left\{
\frac{d+r}{F_d(s)+F_r(s)}
-\frac{l+d}{F_l(s)+F_d(s)}
\right\}.
\end{aligned}
}
\tag{5.358}
\]

The expression at \(s=0\) is understood by continuity and equals one.
For \(s>0\), define

\[
\theta_x(s)=\operatorname{arsinh}(x\sqrt s).
\]

Since \(x\sqrt s=\sinh\theta_x\) and
\(F_x(s)=\cosh\theta_x\), the elementary sum and difference formulas
turn (5.358) into

\[
\boxed{
L(s)=
\frac{2\sinh((\theta_r-\theta_l)/2)}
{(r-l)\sqrt s\,
 \cosh((\theta_d+\theta_r)/2)
 \cosh((\theta_l+\theta_d)/2)}.
}
\tag{5.359}
\]

Equivalently,

\[
L(s)^2=
\frac{8\{F_rF_l-srl-1\}}
{s(r-l)^2
 \{F_rF_d+srd+1\}
 \{F_lF_d+sld+1\}},
\tag{5.360}
\]

where all \(F_x\) are evaluated at \(s\).

Formula (5.359) also proves the zero-free property needed for logarithmic
inversion.  On
\(\mathbb C\setminus(-\infty,0]\), take the principal square root and
principal \(\operatorname{arsinh}\).  Then
\(\Re\theta_x>0\).  Neither denominator hyperbolic-cosine factor can
vanish.  If the numerator hyperbolic sine vanished, then
\(\theta_r-\theta_l\in2\pi i\mathbb Z\), which would imply
\(\sinh\theta_r=\sinh\theta_l\), hence \(r\sqrt s=l\sqrt s\), an
impossibility away from the removable point \(s=0\).  Thus \(L\) has a
single-valued analytic logarithm on the slit plane.

The boundary phase is explicit.  For \(x>y>0\) and
\(x^{-2}<u<y^{-2}\), define

\[
\phi_{x,y}(u)=
\arg\!\left(
1-uxy+i\sqrt{ux^2-1}\sqrt{1-uy^2}
\right)\in(0,\pi).
\tag{5.361}
\]

Writing the real and imaginary parts as \(a\) and \(b\), respectively,
one obtains

\[
a^2+b^2=u(x-y)^2,
\qquad
\boxed{
\phi_{x,y}'(u)=
\frac{1+uxy}
{2u\sqrt{ux^2-1}\sqrt{1-uy^2}}>0.
}
\tag{5.362}
\]

Indeed, differentiating \(\arg(a+ib)\) gives
\((ab'-ba')/(a^2+b^2)\); after multiplication by
\(2(ux^2-1)(1-uy^2)\), its numerator factors as
\((x-y)^2(1+uxy)\).  Moreover,

\[
\phi_{x,y}(x^{-2}+)=0,\qquad
\phi_{x,y}(y^{-2}-)=\pi.
\tag{5.363}
\]

Let \(\psi(s)=-\log L(s)\), with \(\psi(0)=0\), and let

\[
\eta(u)=\frac1\pi\Im\psi(-u+i0)
\]

denote the continuous, unwrapped upper boundary phase.  Substituting

\[
F_x(-u+i0)=
\begin{cases}
\sqrt{1-ux^2},&u<x^{-2},\\
i\sqrt{ux^2-1},&u>x^{-2}
\end{cases}
\]

into (5.360) gives

On the second open interval in (5.364), the denominator factor involving
\((r,d)\) reaches the negative real axis from the upper half-plane.  This
fixes the additional \(-\pi\) in the continuously unwrapped argument of
\(L^2\); after the last threshold the same continuation fixes the terminal
argument at \(-3\pi\).  Thus the constants in (5.364) are branch data, not
principal-argument conventions.

\[
\boxed{
\eta(u)=
\begin{cases}
0,
&0<u\le r^{-2},\\[2mm]
\dfrac{\phi_{r,d}(u)+\phi_{r,l}(u)}{2\pi},
&r^{-2}<u<d^{-2},\\[3mm]
\dfrac12+
\dfrac{\phi_{r,l}(u)+\phi_{d,l}(u)}{2\pi},
&d^{-2}<u<l^{-2},\\[3mm]
\dfrac32,
&u\ge l^{-2}.
\end{cases}
}
\tag{5.364}
\]

The endpoint values (5.363) show that the four pieces join continuously.
Equations (5.362)--(5.364) prove that \(\eta\) is nondecreasing, is
strictly increasing on \((r^{-2},l^{-2})\) away from \(d^{-2}\), and has
total increase \(3/2\).  Its two nonzero density pieces are

\[
\eta'(u)=
\begin{cases}
\dfrac1{4\pi u}\left\{
\dfrac{1+urd}{\sqrt{ur^2-1}\sqrt{1-ud^2}}
+\dfrac{1+url}{\sqrt{ur^2-1}\sqrt{1-ul^2}}
\right\},
&r^{-2}<u<d^{-2},\\[4mm]
\dfrac1{4\pi u}\left\{
\dfrac{1+url}{\sqrt{ur^2-1}\sqrt{1-ul^2}}
+\dfrac{1+udl}{\sqrt{ud^2-1}\sqrt{1-ul^2}}
\right\},
&d^{-2}<u<l^{-2}.
\end{cases}
\tag{5.365}
\]

There are no endpoint atoms.  To finish the analytic step, put
\(g=\psi'=-L'/L\).  It is holomorphic on the slit plane, is bounded at
zero, and satisfies

\[
g(s)\sim\frac{3}{2s}\qquad(s\to\infty),
\]

because \(M\) is bounded away from zero.  Along the upper bank of the
cut,

\[
-\frac1\pi\Im g(-u+i0)=\eta'(u)
\]

in the distributional sense.  Formula (5.365) has only integrable
inverse-square-root singularities,
\(O(|u-u_0|^{-1/2})\), at the three thresholds; hence the small arcs in
the corresponding indented keyhole contours vanish.  The keyhole Cauchy
formula, with the zero-free property above and the decay of \(g\),
therefore yields

\[
\boxed{
g(s)=\int_{[r^{-2},l^{-2}]}\frac{d\eta(u)}{s+u},
\qquad
-\log L(s)=
\int_{[r^{-2},l^{-2}]}
\log\!\left(1+\frac{s}{u}\right)d\eta(u).
}
\tag{5.366}
\]

Thus \(d\eta\) is the **rate-form Thorin measure** of \(Z\), with total
mass \(3/2\).  In particular,

\[
\boxed{G_{3/2}M^2\in GGC.}
\tag{5.367}
\]

Finally, gamma duplication gives, with independent factors,

\[
G_3^2\overset d=4G_{3/2}G_2,\qquad
X^2\overset d=4(G_{3/2}M^2)G_2.
\]

Bondesson's independent-product theorem and scale closure prove

\[
\boxed{
\left(
\frac{G_1^{(1)}}{b_1}
+\frac{G_1^{(2)}}{b_2}
+\frac{G_1^{(3)}}{b_3}
\right)^2\in GGC
\qquad(b_1,b_2,b_3>0).
}
\tag{5.368}
\]

The proof above treats distinct scales; repetitions follow either by
merging gamma variables or by weak closure.  This is the first project
theorem with three genuinely distinct rates and total shape greater than
one.  It is not covered by the arbitrary-support theorem at total shape
at most one or by the complete two-rate theorem.  The spline calculation,
hyperbolic factorization, angle derivative, and explicit Thorin density
are new project derivations; the external inputs are the standard
gamma--Dirichlet identity, the cut-plane Stieltjes/Thorin inversion cited
in the source map, gamma duplication, and Bondesson's product theorem.

### WIP-5.35 — a three-rate theorem at total shape two

**Status: [PROVED FOR THREE POSITIVE SHAPES NOT EXCEEDING ONE].**

Let \(0<l<d<r\), let \(a,b,c\in(0,1)\) satisfy
\(a+b+c=2\), and let all gamma variables below be independent and
unit-rate. Then

\[
\boxed{
X=rG_a+dG_b+lG_c
\quad\Longrightarrow\quad
X^2\in GGC.
}
\tag{5.369}
\]

The endpoint cases \(0<a,b,c\le1\), \(a+b+c=2\), will follow only as
weak-limit corollaries; the pointwise formulas below are asserted for
the open parameter range.

Gamma--Dirichlet independence gives

\[
X\overset d=G_2M,\qquad
M=rP_r+dP_d+lP_l,\qquad
(P_r,P_d,P_l)\sim{\rm Dirichlet}(a,b,c),
\tag{5.370}
\]

with \(G_2\perp M\). On \(\mathbb C\setminus[l,r]\), define

\[
F(z)=\mathbb E\frac1{z-M},\qquad
Q(z)=(z-r)^{-a}(z-d)^{-b}(z-l)^{-c},
\tag{5.371}
\]

where \(Q\) is positive on \((r,\infty)\). The Markov--Krein identity
at total order two says

\[
\mathbb E(z-M)^{-2}=Q(z),\qquad F'(z)=-Q(z).
\tag{5.372}
\]

Put \(Z=G_1M^2\), \(G_1\perp M\), and
\(L(s)=\mathbb E e^{-sZ}=\mathbb E(1+sM^2)^{-1}\). Partial fractions
give

\[
\boxed{
L(s)=\frac{i}{2\sqrt s}
\left\{
F\!\left(\frac{i}{\sqrt s}\right)
-F\!\left(-\frac{i}{\sqrt s}\right)
\right\}.
}
\tag{5.373}
\]

For \(s=-u+i0\) and \(x=u^{-1/2}\), the principal square root has
\(i/\sqrt s\to x+i0\). Hence

\[
\boxed{
L(-u+i0)=\frac x2C(x),\qquad
C(x)=F_+(x)-F(-x)
=-\int_{-x}^{x}Q_+(t)\,dt.
}
\tag{5.374}
\]

The upper-bank phases of \(Q\) are

\[
Q_+(t)=
\begin{cases}
Q(t)>0,&t<l,\\
e^{i\pi c}q_-(t),&l<t<d,\\
e^{-i\pi a}q_+(t),&d<t<r,
\end{cases}
\tag{5.375}
\]

where

\[
\begin{aligned}
p(x)&=(r+x)^{-a}(d+x)^{-b}(l+x)^{-c},\\
q_-(x)&=(r-x)^{-a}(d-x)^{-b}(x-l)^{-c},\\
q_+(x)&=(r-x)^{-a}(x-d)^{-b}(x-l)^{-c}.
\end{aligned}
\tag{5.376}
\]

We prove that the continuously unwrapped function
\(x\mapsto\arg C(x)\) increases from \(-\pi\) to \(0\).
First let \(l<x<d\), and set

\[
\begin{aligned}
P(x)&=\int_{-l}^{x}
(r+t)^{-a}(d+t)^{-b}(l+t)^{-c}\,dt,\\
J(x)&=\int_l^x q_-(t)\,dt,\qquad
D(x)=-C(x)=P(x)+e^{i\pi c}J(x).
\end{aligned}
\]

Direct differentiation gives

\[
\boxed{
\frac d{dx}\arg C(x)
=\frac{\sin(\pi c)\{q_-(x)P(x)-p(x)J(x)\}}
{|D(x)|^2}.
}
\tag{5.377}
\]

Scaling the two integrals to \([0,1]\) yields

\[
\begin{aligned}
P(x)&=(x+l)^{1-c}\int_0^1
\frac{y^{-c}\,dy}
{[r-l+(x+l)y]^a[d-l+(x+l)y]^b},\\
J(x)&=(x-l)^{1-c}\int_0^1
\frac{y^{-c}\,dy}
{[r-l-(x-l)y]^a[d-l-(x-l)y]^b}.
\end{aligned}
\tag{5.378}
\]

For \(R=r,d\), the quotient

\[
y\longmapsto
\frac{R-l+(x+l)y}{R-l-(x-l)y}
\]

increases on \([0,1]\). Therefore

\[
\frac{J(x)}{P(x)}
\le
\left(\frac{x-l}{x+l}\right)^{1-c}
\left(\frac{r+x}{r-x}\right)^a
\left(\frac{d+x}{d-x}\right)^b
<
\frac{q_-(x)}{p(x)}.
\tag{5.379}
\]

The quotient of the final right-hand side by the preceding bound is
exactly \((x+l)/(x-l)>1\), because \(a+b+c=2\). Thus (5.377) is
positive.

Now let \(d<x<r\), retain \(P\), and put

\[
J=\int_l^d q_-(t)\,dt,\quad
H=\int_d^r q_+(t)\,dt,\quad
K(x)=\int_d^xq_+(t)\,dt,\quad R(x)=H-K(x).
\]

Since \(a,b,c<1\), all endpoint integrals are finite. With
\(S=F(r)-F(l)>0\), integration of \(F'=-Q\) across the upper bank gives

\[
\boxed{
S=-e^{i\pi c}J-e^{-i\pi a}H,\qquad
J\sin(\pi c)=H\sin(\pi a),\qquad
S=\frac{J\sin(\pi b)}{\sin(\pi a)}.
}
\tag{5.380}
\]

Here
\(-C=D=P+e^{i\pi c}J+e^{-i\pi a}K\). Expanding
\(\operatorname{Im}(D'\overline D)\) and using (5.380) gives

\[
\boxed{
\frac d{dx}\arg C(x)
=
\frac{\sin(\pi a)
\{q_+(x)[S-P(x)]-p(x)R(x)\}}
{|D(x)|^2}.
}
\tag{5.381}
\]

The remaining sign has a pointwise transport proof. First,

\[
S-P(x)=F(r)-F(-x)
=\int_{-\infty}^{-x}Q(t)\,dt+\int_r^\infty Q(t)\,dt.
\tag{5.382}
\]

The Möbius map

\[
T_x(y)=\frac{(r-x)y}{2y-r-x}
\tag{5.383}
\]

maps the two subintervals of \((x,r)\), with reversed orientation, onto
\((-\infty,-x)\) and \((r,\infty)\). Its absolute Jacobian is
\((r^2-x^2)/(2y-r-x)^2\). Because the total exponent is exactly two,
that denominator cancels, and

\[
\begin{aligned}
S-P(x)&=\int_x^r h_x(y)\,dy,\\
h_x(y)&=(r^2-x^2)(r+x)^{-a}(r-y)^{-a}
A_d(y)^{-b}A_l(y)^{-c},\\
A_z(y)&=y(r-x-2z)+z(r+x)>0.
\end{aligned}
\tag{5.384}
\]

The last positivity follows already at the endpoints:
\(A_z(x)=(r-x)(x+z)>0\) and
\(A_z(r)=(r-x)(r-z)>0\).

For \(z=d,l\), define

\[
H_z(y)=
\frac{(r-x)(x+z)(y-z)}{(x-z)A_z(y)}.
\]

Then \(H_z(x)=1\) and

\[
\frac d{dy}\log H_z(y)
=\frac{2z(r-z)}{(y-z)A_z(y)}>0.
\]

Consequently, for \(x<y<r\),

\[
\boxed{
\frac{q_+(x)h_x(y)}{p(x)q_+(y)}
=\frac{r+x}{r-x}H_d(y)^bH_l(y)^c>1.
}
\tag{5.385}
\]

Integration of (5.385) proves
\(q_+(x)[S-P(x)]>p(x)R(x)\), so (5.381) is also positive.

The singularities of \(Q\) at \(l,d,r\) have orders \(c,b,a<1\).
Thus \(F\) and \(C\) are continuous there,
\(C(l)<0\), \(C(r)>0\), and
\(\operatorname{Im}C(x)<0\) on \((l,r)\); in particular \(C\) never
vanishes. The phase derivative has only the integrable bounds
\[
O((x-l)^{-c}),\qquad O(|x-d|^{-b}),\qquad O((r-x)^{-a})
\]
at the three thresholds. Define

\[
\eta(u)=-\frac1\pi\arg C(u^{-1/2})
\quad(r^{-2}<u<l^{-2}),\qquad
\eta(u):=
\begin{cases}
0,&0<u\le r^{-2},\\
1,&u\ge l^{-2}
\end{cases}
\quad\text{outside that interval},
\tag{5.386}
\]

using the continuous phase from \(-\pi\) at \(x=l\) to \(0\) at
\(x=r\). Then \(\eta\) is nondecreasing, has total increase one, and,
away from the thresholds,

\[
\eta'(u)=\frac{x^3}{2\pi}\frac d{dx}\arg C(x),
\qquad x=u^{-1/2}.
\tag{5.387}
\]

The function \(L\) is Stieltjes and hence zero-free on the slit plane.
The integrable threshold bounds make the small keyhole arcs vanish.
Applying the cut-plane inversion recorded in the source map gives

\[
\boxed{
-\frac{L'(s)}{L(s)}
=\int_{[r^{-2},l^{-2}]}\frac{d\eta(u)}{s+u},
\qquad
-\log L(s)
=\int_{[r^{-2},l^{-2}]}
\log\!\left(1+\frac{s}{u}\right)d\eta(u).
}
\tag{5.388}
\]

Thus \(G_1M^2\in GGC\), with explicit rate-form Thorin measure
\(d\eta\) of mass one. Finally,

\[
G_2^2\overset d=4G_1G_{3/2},\qquad
X^2\overset d=4(G_1M^2)G_{3/2}.
\tag{5.389}
\]

Gamma duplication, scale closure, and Bondesson's independent-product
theorem prove (5.369). If one of \(a,b,c\) equals one, approximate it
from below while preserving \(a+b+c=2\); the other two coordinates can
be adjusted inside \((0,1)\). Weak convergence of gamma laws and weak
closure of GGC then give the boundary corollary.

This is a second genuinely three-rate theorem, independent of WIP-5.34.
It contains, in particular, the symmetric shape vector
\((2/3,2/3,2/3)\) at arbitrary positive scales. It does not cover a
three-rate total-shape-two vector with one coordinate greater than one,
nor a general total shape.

### WIP-5.36 — the physical Appell curve and its Abel-ratio gate

**Status: [PROVED REDUCTION; THE REMAINING RATIO MONOTONICITY IS OPEN].**

Retain the notation of WIP-5.33:
\(a+b+c=2k\), \(0<l<d<r\),
\(\gamma_r=a,\gamma_d=b,\gamma_l=c\),
\[
\Delta_x(s)=\arctan(x\sqrt s)-\arctan(l\sqrt s),
\qquad z_x(s)=1-e^{2i\Delta_x(s)},
\]
and let \(\Psi=F_1(k;a,b;2k;z_r,z_d)\). Define the two contiguous
quotients

\[
\begin{aligned}
R_r&=
\frac{F_1(k+1;a+1,b;2k+1;z_r,z_d)}{\Psi},\\
R_d&=
\frac{F_1(k+1;a,b+1;2k+1;z_r,z_d)}{\Psi}.
\end{aligned}
\tag{5.390}
\]

The phase factor in (5.349) is essential:

\[
L(s)=\mathbb E(1+sM^2)^{-k}
=\prod_{x=r,d,l}(1+sx^2)^{-\gamma_x/2}
e^{i(a\Delta_r+b\Delta_d)}\Psi.
\tag{5.391}
\]

Since

\[
\Delta_x'(s)=
\frac{(x-l)(1-sxl)}
{2\sqrt s(1+sx^2)(1+sl^2)},
\qquad
z_x'(s)=-2i(1-z_x)\Delta_x'(s),
\]

the exact physical-curve logarithmic derivative is

\[
\boxed{
\begin{aligned}
g(s):=-\frac{L'(s)}{L(s)}
={}&\frac12\sum_{x=r,d,l}
\frac{\gamma_xx^2}{1+sx^2}\\
&+ia\Delta_r'\{(1-z_r)R_r-1\}
+ib\Delta_d'\{(1-z_d)R_d-1\}.
\end{aligned}
}
\tag{5.392}
\]

Although the last line is written in complex Appell coordinates, the
whole expression is real for \(s>0\). Formula (5.392) is the
one-dimensional quotient that retains the cancellations lost in the
refuted multivariate kernel (5.354).

There is a sharper real boundary criterion when \(0<k<1\). Let \(f_M\)
denote the density of the three-atom Dirichlet mean and, for \(l<x<r\),
put

\[
\begin{aligned}
A_k(x)&=x^{2k}\int_l^x(x^2-m^2)^{-k}f_M(m)\,dm,\\
B_k(x)&=x^{2k}\int_x^r(m^2-x^2)^{-k}f_M(m)\,dm,\\
\rho_k(x)&=\frac{B_k(x)}{A_k(x)},
\qquad x\in(l,d)\cup(d,r).
\end{aligned}
\tag{5.393}
\]

For \(x\ne d\), both integrals are finite because the only moving-kernel
singularity has order \(k<1\). At \(x=d\), however, they can diverge
simultaneously: the Dirichlet-mean knot singularity can combine with the
kernel singularity. Thus all values at \(d\) below are one-sided boundary
values, not substitutions into the two separate integrals. On the upper
bank of the cut, with \(s=-u+i0\) and \(x=u^{-1/2}\ne d\),

\[
\boxed{
L(-u+i0)=A_k(x)+e^{-i\pi k}B_k(x).
}
\tag{5.394}
\]

Consequently its continuously unwrapped normalized phase is

\[
\eta(u)=
\frac1\pi\operatorname{atan2}
\left(
\rho_k(x)\sin(\pi k),\,
1+\rho_k(x)\cos(\pi k)
\right),
\qquad x=u^{-1/2}.
\tag{5.395}
\]

The derivative of the right-hand side with respect to \(\rho\) is

\[
\frac{\sin(\pi k)}
{\pi\{1+2\rho\cos(\pi k)+\rho^2\}}>0.
\]

Because \(u=x^{-2}\), this proves the following exact equivalence:

\[
\boxed{
G_kM^2\in GGC
\quad\Longleftrightarrow\quad
\begin{gathered}
\rho_k\text{ is nonincreasing separately on }(l,d)\text{ and }(d,r),\\
\rho_k(d-)\ge\rho_k(d+)
\quad\text{in the extended one-sided phase sense},
\end{gathered}
\qquad 0<k<1.
}
\tag{5.396}
\]

Indeed, for \(k<1\) all integrand values
\((1+sM^2)^{-k}\) lie in an open sector of angle less than \(\pi\), so
\(L\) is zero-free on the slit plane. The compact-cut keyhole inversion
then turns phase monotonicity into a positive rate-form Thorin measure,
and the converse follows from the same boundary inversion. Since the
map from \(\rho\) to (5.395) is increasing, the displayed middle
condition says precisely that the phase has no reverse jump as \(u\)
increases through \(d^{-2}\). When the separate ratios have finite
one-sided limits it has the literal meaning written in (5.396);
otherwise it is read after applying (5.395). Any positive jump is a
Thorin atom at \(d^{-2}\). Endpoint jumps are treated in the same phase
measure. Finally,
\[
L(0)=1,\qquad
L(s)\sim s^{-k}\mathbb E[M^{-2k}]
\quad(s\to\infty),
\]
so the complete phase, including its atoms, has total increase \(k\).

The formula cannot be specialized by simply setting \(k=1\):
\(A_k\) and \(B_k\) have a common divergence and \(\rho_k\to1\). At
\(k=1\), the correct combined Plemelj boundary is

\[
\begin{aligned}
L(-u+i0)
&=x^2\,{\rm PV}\!\int_l^r
\frac{f_M(m)}{x^2-m^2}\,dm-\frac{i\pi x}{2}f_M(x)
=\frac x2C(x),\\
C(x)&=
2x\,{\rm PV}\!\int_l^r\frac{f_M(m)}{x^2-m^2}\,dm
-i\pi f_M(x).
\end{aligned}
\tag{5.397}
\]

The \(k=1\) criterion is therefore that the continuous phase
\(x\mapsto\arg C(x)\) increase from \(-\pi\) to \(0\), exactly the
criterion proved in WIP-5.35 for total-shape-two vectors with all three
coordinates below one and completed for every positive shape vector in
WIP-5.37. Whenever (5.396) holds, gamma duplication gives
\[
X^2=(G_{2k}M)^2
\overset d=4(G_kM^2)G_{k+1/2}\in GGC.
\]
Thus (5.396), rather than positivity in independent Appell variables, is
the next exact sufficient target for the original square in the
unresolved range \(1<a+b+c<2\). No converse cancellation of the final
gamma factor is claimed.

### WIP-5.37 — completion of the three-rate total-shape-two theorem

**Status: [PROVED FOR ALL POSITIVE SHAPE VECTORS OF TOTAL SHAPE TWO].**

The coordinatewise restriction in WIP-5.35 can be removed:
all gamma variables in the following statement are independent and
unit-rate.

\[
\boxed{
a,b,c>0,\quad a+b+c=2,\quad 0<l<d<r
\quad\Longrightarrow\quad
(rG_a+dG_b+lG_c)^2\in GGC.
}
\tag{5.398}
\]

Since at most one of \(a,b,c\) can exceed one, it is enough to handle
three extensions of WIP-5.35. We retain its functions \(F,Q,C,p,q_-\),
and \(q_+\).

First, there is a version of the right-cut proof that only requires
\(a<1\). For \(d<x<r\), set

\[
R(x)=\int_x^r q_+(y)\,dy,\qquad
U(x)=F(r)-F(-x)>0.
\]

Then

\[
\boxed{
C(x)=U(x)+e^{-i\pi a}R(x),\qquad
\frac d{dx}\arg C(x)
=\frac{\sin(\pi a)\{q_+(x)U(x)-p(x)R(x)\}}
{|C(x)|^2}.
}
\tag{5.399}
\]

The same Möbius map (5.383) gives
\(U(x)=\int_x^rh_x(y)\,dy\), and the pointwise identity (5.385)
holds for arbitrary positive \(b,c\). Hence

\[
q_+(x)U(x)>p(x)R(x)
\tag{5.400}
\]

and the phase derivative in (5.399) is positive. Similarly, the
left-cut proof (5.377)--(5.379) only requires \(c<1\); it imposes no
extra restriction on \(a,b\).

Suppose now that \(b>1\). Then \(a,c<1\), so the preceding left and
right arguments prove strict phase increase away from \(d\). With
\[
K_d=(r-d)^{-a}(d-l)^{-c},
\]
the two local boundary expansions are

\[
\begin{aligned}
C(d-\delta)
&\sim-\frac{e^{i\pi c}K_d}{b-1}\delta^{1-b},
&&\delta\downarrow0,\\
C(d+\varepsilon)
&\sim\frac{e^{-i\pi a}K_d}{b-1}\varepsilon^{1-b},
&&\varepsilon\downarrow0.
\end{aligned}
\tag{5.401}
\]

Thus the canonical phase increases, as \(x\) crosses \(d\), from
\(-\pi(1-c)\) to \(-\pi a\). Its jump is
\(\pi(b-1)\). Equivalently, as \(u=x^{-2}\) increases, the cumulative
Thorin phase has the positive jump

\[
\boxed{\Delta\eta(d^{-2})=b-1.}
\tag{5.402}
\]

The remaining continuous mass is \(a+c=2-b\).

Next suppose that \(c>1\), so \(a,b<1\). The repaired right-cut argument
still applies. On the left cut, put
\[
\mathcal A=x+l,\qquad \mathcal B=x-l,
\]
and, for \(0\le y\le1\), define

\[
\begin{aligned}
f_+(y)&=[r-l+\mathcal Ay]^{-a}[d-l+\mathcal Ay]^{-b},\\
f_-(y)&=[r-l-\mathcal By]^{-a}[d-l-\mathcal By]^{-b}.
\end{aligned}
\]

For \(h\in C^1[0,1]\), introduce the canonical Hadamard finite part

\[
\mathcal I_c[h]
=\frac{h(0)}{1-c}
+\int_0^1y^{-c}\{h(y)-h(0)\}\,dy.
\tag{5.403}
\]

This is finite because \(1<c<2\). Indent the upper-bank contour around
\(l\) by a clockwise semicircle of radius \(\epsilon\). Locally,
\[
Q(z)=K_l e^{i\pi c}(z-l)^{-c}\{1+O(z-l)\},
\qquad
K_l=(r-l)^{-a}(d-l)^{-b}.
\]
The semicircle contributes
\[
\frac{K_l(1+e^{i\pi c})}{1-c}\epsilon^{1-c}
+o(1),
\]
which cancels the two straight-segment divergences; the next term is
\(O(\epsilon^{2-c})\). Therefore the actual Cauchy boundary, not merely
a formal analytic continuation, is

\[
\boxed{
-C(x)=P(x)+e^{i\pi c}J(x),\qquad
P=\mathcal A^{1-c}\mathcal I_c[f_+],\quad
J=\mathcal B^{1-c}\mathcal I_c[f_-].
}
\tag{5.404}
\]

Differentiation of the boundary identity gives the same algebraic phase
formula as before,

\[
\frac d{dx}\arg C(x)
=\frac{\sin(\pi c)\{q_-(x)P(x)-p(x)J(x)\}}
{|C(x)|^2}.
\tag{5.405}
\]

Set

\[
\mathcal R_*=
\left(\frac{r+x}{r-x}\right)^a
\left(\frac{d+x}{d-x}\right)^b,\qquad
H(y)=\mathcal Bf_-(y)-\mathcal A\mathcal R_*f_+(y).
\]

Since \(q_-/p=(\mathcal A/\mathcal B)^c\mathcal R_*\),
linearity of \(\mathcal I_c\) gives

\[
J-\frac{q_-}{p}P
=\mathcal B^{-c}\mathcal I_c[H].
\tag{5.406}
\]

Now

\[
H(0)=f_+(0)\{\mathcal B-\mathcal A\mathcal R_*\}<0,
\qquad H'(y)>0.
\]

Indeed, \(f_-'(y)>0\) and \(f_+'(y)<0\). Consequently

\[
\boxed{
\mathcal I_c[H]
=\frac{H(0)}{1-c}
+\int_0^1y^{-c}\{H(y)-H(0)\}\,dy>0.
}
\tag{5.407}
\]

It follows from (5.406) that
\(q_-P-pJ<0\). Since \(\sin(\pi c)<0\), (5.405) is strictly positive.
At the lower endpoint,

\[
C(l+\varepsilon)
\sim
\frac{e^{i\pi c}K_l}{c-1}\varepsilon^{1-c}.
\tag{5.408}
\]

The phase therefore jumps upward from \(-\pi\), on the exterior side,
to \(-\pi(2-c)\), on the interior side. In rate coordinates,

\[
\boxed{\Delta\eta(l^{-2})=c-1,}
\tag{5.409}
\]

and the continuous mass is \(2-c=a+b\).

Finally suppose that \(a>1\). This case follows from the reciprocal
Dirichlet duality already proved in WIP-5.2. Let
\[
M^*=r^{-1}\widehat P_r+d^{-1}\widehat P_d+l^{-1}\widehat P_l,
\qquad
(\widehat P_r,\widehat P_d,\widehat P_l)
\sim{\rm Dirichlet}(a,b,c),
\]
and put \(K_0=(r^ad^bl^c)^{-1}\). For every bounded Borel \(h\),

\[
\boxed{
\mathbb E[M^{-2}h(M^{-1})]=K_0\,\mathbb E[h(M^*)].
}
\tag{5.410}
\]

This is (5.3) with rates \(r^{-1},d^{-1},l^{-1}\); equivalently, it
follows from the projective simplex map, whose absolute Jacobian is
\(rdl/M^3\). If
\[
L_M(s)=\mathbb E(1+sM^2)^{-1},
\qquad
L_{M^*}(s)=\mathbb E(1+s(M^*)^2)^{-1},
\]
then (5.410) gives

\[
\boxed{
L_M(s)=K_0s^{-1}L_{M^*}(s^{-1}).
}
\tag{5.411}
\]

The reciprocal scales satisfy
\(r^{-1}<d^{-1}<l^{-1}\); hence the shape \(a>1\) is attached to the
smallest scale of \(M^*\), which is exactly the \(c>1\) case just proved.
Write its mass-one rate-form Thorin representation as

\[
L_{M^*}(t)
=\exp\left\{
-\int\log\!\left(1+\frac{t}{u}\right)\tau(du)
\right\},
\qquad |\tau|=1.
\]

Using \(|\tau|=1\) in (5.411), and fixing the remaining constant by
\(L_M(0)=1\), yields

\[
\boxed{
L_M(s)=
\exp\left\{
-\int\log(1+su)\,\tau(du)
\right\}.
}
\tag{5.412}
\]

Thus the reciprocal image of \(\tau\) is a rate-form Thorin measure for
\(G_1M^2\). In particular, the atom \(a-1\) at rate \(r^2\) for the
reciprocal mean becomes an atom \(a-1\) at rate \(r^{-2}\).

At the singular thresholds, the small keyhole circles carry precisely
the residues recorded in (5.402) and (5.409); they are not discarded.
Equivalently, since \(L_M\) is a nonzero Stieltjes function, the canonical
CBF phase representation in the source map turns the proved increasing
phase, including these jumps, directly into the Thorin measure. The
total mass is one because
\[
L_M(s)\sim s^{-1}\mathbb E[M^{-2}]\qquad(s\to\infty).
\]

If no coordinate exceeds one, WIP-5.35 applies. If one coordinate equals
one, approximate from either adjacent open shape region and use weak
closure. This proves \(G_1M^2\in GGC\) for every positive
\((a,b,c)\) of total two. Gamma duplication then gives

\[
(G_2M)^2\overset d=4(G_1M^2)G_{3/2}\in GGC,
\tag{5.413}
\]

which completes (5.398). More explicitly, if
\(m=\max(a,b,c)>1\), the rate-form Thorin measure of \(G_1M^2\) has
one atom of mass \(m-1\) at the inverse squared scale carrying that
shape and continuous mass \(2-m\). When all coordinates are at most one,
the measure is continuous.

### WIP-5.38 — the Abel-knot and endpoint structure below total shape two

**Status: [PROVED ALL NODE PHASE JUMPS AND THE CANDIDATE ATOMS; PROVED
PUNCTURED-KNOT MONOTONICITY WHEN \(b<k\); OPEN-INTERVAL MONOTONICITY
REMAINS OPEN].**

This subsection returns to the unresolved range in WIP-5.36.  Let

\[
a+b+c=2k,\qquad \frac12<k<1,\qquad 0<l<d<r,
\tag{5.414}
\]

and attach \(a,b,c\) respectively to \(r,d,l\).  Write

\[
\sigma=a+c,\qquad \nu=\sigma-k=k-b,\qquad
R=r-d,\qquad L=d-l,
\]

and

\[
\mathcal K=
\frac{\Gamma(2k)}{\pi\Gamma(b)}R^{-a}L^{-c}>0.
\]

The nonanalytic part of the three-atom Dirichlet-mean density at its
middle knot is, for \(\sigma\ne1\),

\[
\boxed{
\begin{aligned}
f_M(d+y)&=f_{{\rm reg},+}(y)
 +C_+y^{\sigma-1}+o(y^{\sigma-1}),\\
f_M(d-y)&=f_{{\rm reg},-}(y)
 +C_-y^{\sigma-1}+o(y^{\sigma-1}),\\
C_+&=\mathcal K\Gamma(1-\sigma)\sin(\pi a),\qquad
C_-=\mathcal K\Gamma(1-\sigma)\sin(\pi c).
\end{aligned}
}
\tag{5.415}
\]

For \(\sigma<1\), this is the leading simplex-vertex term.  For
\(\sigma>1\), the regular germs contain the common finite value at the
knot and (5.415) records the first nonanalytic correction.  The formula
comes directly from the simplex coordinates
\[
M-d=(r-d)P_r-(d-l)P_l
\]
and Euler's beta integral; no numerical inversion is used.  At
\(\sigma=1\), (5.415) is read as its logarithmic connection-formula
limit.  That resonant case is treated explicitly below.

First suppose \(b>k\), so that
\(\delta=b-k=k-\sigma>0\).  Put

\[
\alpha=1-k,\qquad
P={\rm B}(\sigma,\alpha),\quad
Q={\rm B}(\sigma,\delta),\quad
R_0={\rm B}(\alpha,\delta),\quad
\lambda=\frac{C_+}{C_-}
=\frac{\sin(\pi a)}{\sin(\pi c)}>0.
\tag{5.416}
\]

Scaling the two Abel integrals in (5.393) at \(d\) gives

\[
\boxed{
\rho_k(d-)=\frac{P+\lambda Q}{R_0},\qquad
\rho_k(d+)=\frac{\lambda R_0}{Q+\lambda P}.
}
\tag{5.417}
\]

Here \(\sigma+\alpha+\delta=1\), and reflection gives

\[
P+Q-R_0=
\frac{\Gamma(\sigma)\Gamma(\alpha)\Gamma(\delta)}{\pi}
\{\sin(\pi\alpha)+\sin(\pi\delta)-\sin(\pi\sigma)\}>0.
\]

Moreover,

\[
\frac{(P+\lambda Q)(Q+\lambda P)}{\lambda}
=P^2+Q^2+(\lambda+\lambda^{-1})PQ
\ge(P+Q)^2>R_0^2.
\tag{5.418}
\]

Thus the middle-knot condition in (5.396) is strict.  More precisely, the
two leading boundary vectors have canonical phases

\[
\arg L(d-)=-\pi(k-c),\qquad
\arg L(d+)=-\pi a,
\]

so the phase jump is exactly

\[
\boxed{\Delta\eta(d^{-2})=b-k.}
\tag{5.419}
\]

When \(b=k\), both Abel ratios have the same logarithmic limit
\(\lambda\), the two phases coincide, and there is no atom at
\(d^{-2}\).  The leading divergences in this case do not determine the
sign of the next global finite-part correction, so no punctured-neighborhood
monotonicity is claimed here for \(b\ge k\).

The two support endpoints give the matching formulas.  If \(c>k\), let
\(e=2k-c\in(0,k)\).  Direct endpoint scaling yields

\[
\rho_k(l+)=\frac{\sin(\pi e)}{\sin(\pi(k-e))},
\qquad
\arg L(l+)=-\pi e,
\]

whereas the exterior phase is \(-\pi k\).  Hence the jump at \(l^{-2}\)
is \(c-k\).  The reciprocal calculation at \(r\) gives a jump \(a-k\)
when \(a>k\).  Consequently all possible node atoms are

\[
\boxed{
(c-k)_+\delta_{l^{-2}}+
(b-k)_+\delta_{d^{-2}}+
(a-k)_+\delta_{r^{-2}}.
}
\tag{5.420}
\]

At most one term is nonzero.  These are candidate Thorin atoms: the node
calculation alone does not prove the remaining continuous phase is
monotone.  If the open-interval condition succeeds, the total Thorin mass
is \(k\); when \(m=\max(a,b,c)>k\), the unique atom has mass \(m-k\) and
the continuous part has mass \(2k-m\).

There is a stronger local result when \(b<k\).  Now
\(0<\nu=k-b<1\), both Abel integrals are finite and continuous at \(d\),
and we set

\[
A_0=A_k(d),\qquad B_0=B_k(d),\qquad
\rho_0=\frac{B_0}{A_0},\qquad
\Lambda_d=
\left(\frac d2\right)^k
\mathcal K\Gamma(1-k)\Gamma(-\nu)<0.
\]

Euler connection formulas reduce all four fractional coefficients to

\[
\boxed{
\begin{aligned}
A_k(d-\varepsilon)
 &=A_0+\Lambda_d\sin(\pi c)\varepsilon^\nu+o(\varepsilon^\nu),\\
B_k(d-\varepsilon)
 &=B_0+\Lambda_d\sin(\pi(k-c))\varepsilon^\nu+o(\varepsilon^\nu),\\
A_k(d+\varepsilon)
 &=A_0+\Lambda_d\sin(\pi(k-a))\varepsilon^\nu+o(\varepsilon^\nu),\\
B_k(d+\varepsilon)
 &=B_0+\Lambda_d\sin(\pi a)\varepsilon^\nu+o(\varepsilon^\nu).
\end{aligned}
}
\tag{5.421}
\]

For \(1<\sigma<2\), the apparent
\(\varepsilon^{1-k}\) terms from the common regular density value cancel
between the translated old interval and the new short interval; the
remaining regular contribution is \(O(\varepsilon)=o(\varepsilon^\nu)\).
For \(\sigma<1\), the bounded remainder contributes
\(O(\varepsilon^{1-k})=o(\varepsilon^\nu)\).  When \(\sigma=1\), write
\(\alpha=1-k=\nu\).  The order-one Markov--Krein transform gives
\[
f_M(d\pm y)=D\log(1/y)+H_\pm+o(1),
\qquad H_+-H_-=-D\pi\cot(\pi a).
\]
The logarithmic Abel terms cancel, while differentiating the exact beta
connection at \(\sigma=1\) reproduces all four coefficients in (5.421).
Thus (5.421) has no resonant exception.

It remains to determine the sign of the two ratio coefficients.  There
is an exact one-dimensional formula for \(\rho_0\).  Dirichlet neutrality
gives independent variables

\[
S=P_r+P_l\sim{\rm Beta}(\sigma,b),\qquad
V=\frac{P_r}{P_r+P_l}\sim{\rm Beta}(a,c),
\qquad N=l+(r-l)V,
\]

and \(M=d+S(N-d)\).  Integrating \(S\), using
\[
{}_2F_1(k,\sigma-k;k;z)=(1-z)^{-(\sigma-k)},
\]
and then making the Möbius substitution \(z=(N-d)/(N+d)\), all Jacobian
powers cancel.  With

\[
p=\frac{d-l}{d+l},\qquad
q=\frac{r-d}{r+d},\qquad
t_0=\frac{p}{p+q},
\tag{5.422}
\]

one obtains

\[
\boxed{
\rho_0=\frac{\mathcal N(t_0)}{\mathcal D(t_0)},
}
\tag{5.423}
\]

where

\[
\begin{aligned}
\mathcal D(t)
&=\int_0^t(t-u)^{-k}u^{a-1}(1-u)^{c-1}\,du,\\
\mathcal N(t)
&=\int_t^1(u-t)^{-k}u^{a-1}(1-u)^{c-1}\,du.
\end{aligned}
\tag{5.424}
\]

The two functions have the Gauss forms

\[
\boxed{
\begin{aligned}
\mathcal D(t)
&={\rm B}(a,1-k)t^{a-k}
{}_2F_1(1-c,a;a+1-k;t),\\
\mathcal N(t)
&={\rm B}(c,1-k)(1-t)^{c-k}
{}_2F_1(1-a,c;c+1-k;1-t).
\end{aligned}
}
\tag{5.425}
\]

They are the two endpoint solutions of the same hypergeometric equation,
with parameters

\[
A_{\rm hg}=k,\qquad B_{\rm hg}=1-\nu,\qquad
C_{\rm hg}=1-a+k.
\tag{5.426}
\]

Their Wronskian therefore has one fixed nonzero sign.  The endpoint
limits of \(\mathcal R=\mathcal N/\mathcal D\) are

\[
\mathcal R(0+)=
\begin{cases}
\dfrac{\sin(\pi a)}{\sin(\pi(k-a))},&a<k,\\[2mm]
+\infty,&a\ge k,
\end{cases}
\qquad
\mathcal R(1-)=
\begin{cases}
\dfrac{\sin(\pi(k-c))}{\sin(\pi c)},&c<k,\\[2mm]
0,&c\ge k.
\end{cases}
\tag{5.427}
\]

When \(a,c<k\), their strict order follows from

\[
\sin(\pi a)\sin(\pi c)
-\sin(\pi(k-a))\sin(\pi(k-c))
=\sin(\pi k)\sin(\pi(k-b))>0.
\tag{5.428}
\]

The other cases follow directly from the infinite or zero endpoint.
Thus
\[
\boxed{\mathcal R'(t)<0\qquad(0<t<1).}
\tag{5.429}
\]

Expanding the quotient in (5.421) now shows

\[
\begin{aligned}
\rho_k'(d-\varepsilon)\le0
&\Longleftrightarrow
\sin(\pi(k-c))-\rho_0\sin(\pi c)\le0,\\
\rho_k'(d+\varepsilon)\le0
&\Longleftrightarrow
\sin(\pi a)-\rho_0\sin(\pi(k-a))\ge0,
\end{aligned}
\tag{5.430}
\]

for all sufficiently small \(\varepsilon>0\), and both inequalities are
strict.  For \(c<k\) and \(a<k\), respectively, this is exactly the
endpoint trapping in (5.427)--(5.429).  If
\(k\le c\le1\), or \(k\le a\le1\), the relevant sign is immediate.  If
\(c>1\), then necessarily \(a<k\), and (5.428), with the negative
denominator \(\sin(\pi c)\), gives
\[
\rho_0<\mathcal R(0+)
<\frac{\sin(\pi(k-c))}{\sin(\pi c)}.
\]
The case \(a>1\) is reciprocal.  This case split is necessary; merely
saying that every shape above \(k\) has the automatic coefficient sign
would be false.

One symmetric reduction may be useful for the remaining global problem.
If \(d=1\), \(lr=1\), and \(a=c\), reciprocal Dirichlet duality gives

\[
f_M(1/x)=x^{2-2k}f_M(x),
\]

and direct substitution in (5.393) yields

\[
\boxed{
A_k(1/x)=x^{-2k}B_k(x),\qquad
B_k(1/x)=x^{-2k}A_k(x),\qquad
\rho_k(x)\rho_k(1/x)=1.
}
\tag{5.431}
\]

In logarithmic coordinates \(x=e^z\), if
\[
h(y)=e^{-ky}e^yf_M(e^y),
\]
then \(h\) is even, and the common factors in the two Abel integrals
cancel to leave the one-sided kernels
\[
\int_{-\log r}^{z}\sinh(z-y)^{-k}h(y)\,dy,\qquad
\int_z^{\log r}\sinh(y-z)^{-k}h(y)\,dy.
\tag{5.432}
\]

There is also a global projective form which removes the squared-distance
kernel.  For \(x\in(l,r)\), put

\[
z_j(x)=\frac{x_j-x}{x_j+x},\qquad
(x_r,x_d,x_l)=(r,d,l),\qquad
(\gamma_r,\gamma_d,\gamma_l)=(a,b,c),
\]

and, for an independent
\(\widehat P\sim{\rm Dirichlet}(a,b,c)\), define

\[
N_x=z_r(x)\widehat P_r+z_d(x)\widehat P_d+
z_l(x)\widehat P_l.
\]

The projective substitution
\[
\widehat P_j=\frac{(x_j+x)P_j}{M+x}
\]
in the Dirichlet simplex integral has Jacobian weight
\((M+x)^{2k}\prod_j(x_j+x)^{-\gamma_j}\).  Since
\[
x^2-M^2=-N_x(M+x)^2
\]
after inversion of this substitution, the Jacobian weight cancels the
entire radial factor.  Consequently

\[
\boxed{
\begin{aligned}
A_k(x)&=x^{2k}\prod_j(x_j+x)^{-\gamma_j}
 \mathbb E[(-N_x)^{-k};\,N_x<0],\\
B_k(x)&=x^{2k}\prod_j(x_j+x)^{-\gamma_j}
 \mathbb E[N_x^{-k};\,N_x>0],
\end{aligned}
}
\tag{5.433}
\]

and hence

\[
\boxed{
\rho_k(x)=
\frac{\mathbb E[N_x^{-k};\,N_x>0]}
     {\mathbb E[(-N_x)^{-k};\,N_x<0]}.
}
\tag{5.434}
\]

Thus the remaining physical phase problem is exactly the monotonicity of
signed negative-moment odds for three hyperbolically moving knots.  A
promising next step is to condition separately on the positive and
negative Dirichlet blocks, reduce the conditional ratio to a two-knot
Gauss quotient, and identify the outer posterior derivative as a
one-variable covariance.

Equations (5.415)--(5.434) are new project derivations.  They prove that
no endpoint or knot jump can obstruct the three-rate auxiliary GGC
criterion.  When \(b<k\), they also remove a full punctured neighborhood
of the middle knot from the unknown set.  What remains is the sign of
\(\rho_k'\) in the open interval interiors; for \(b\ge k\), the next
relative term near the knot is a global finite part and remains included
in that open problem.  The cusp coefficients, beta reductions,
Gauss--Wronskian sign, all six shape-sign cases, endpoint atoms, and
projective cancellation were independently recalculated before this entry
was marked proved.

### WIP-5.39 — full-interval Abel monotonicity when the endpoint shapes are at most one

**Status: [PROVED A NEW THREE-RATE GGC SUBFAMILY FOR ARBITRARY RATES].**

Retain (5.414), so that

\[
\frac12<k<1,\qquad a+b+c=2k,qquad 0<l<d<r,
\]

and the shapes \(a,b,c\) are carried respectively by the scales
\(r,d,l\).  The result of this subsection is

\[
\boxed{
a\le1,\quad c\le1
\quad\Longrightarrow\quad
\rho_k'(x)<0\quad\text{on }(l,d)\cup(d,r).
}
\tag{5.435}
\]

Together with the node analysis in WIP-5.38, this proves

\[
\boxed{
\bigl(rG_a^{(r)}+dG_b^{(d)}+lG_c^{(l)}\bigr)^2\in GGC
\quad
\left(
\begin{array}{c}
\frac12<k<1, a+b+c=2k,\\
a,c\le1, 0<l<d<r
\end{array}
\right),
}
\tag{5.436}
\]

where the gamma variables are independent and have unit rate.  In rate
notation this means that the shapes attached to the smallest and largest
of the three reciprocal rates are at most one.  A unique shape above one
is allowed at the middle scale.

The proof rests on the following two-node lemma.  Let \(0<k<1\), let
\(p,q>0\) satisfy \(p+q=2k\), and let \(W\sim{\rm Beta}(p,q)\).  For
\(\lambda>0\), define

\[
\begin{aligned}
d_q(\lambda)
 &=\mathbb E\!\left[(1-(1+\lambda)W)^{-k};
             W<(1+\lambda)^{-1}\right],\\
n_q(\lambda)
 &=\mathbb E\!\left[((1+\lambda)W-1)^{-k};
             W>(1+\lambda)^{-1}\right],\\
r_q(\lambda)&=\frac{n_q(\lambda)}{d_q(\lambda)}.
\end{aligned}
\tag{5.437}
\]

Then

\[
\boxed{r_q'(\lambda)>0\qquad(\lambda>0).}
\tag{5.438}
\]

Here is an exact proof, including the normalization.  Put
\(t=(1+\lambda)^{-1}\) and introduce the *unnormalized* Abel integrals

\[
\begin{aligned}
D_{p,q}(t)&=\int_0^t(t-u)^{-k}u^{p-1}(1-u)^{q-1}\,du,\\
N_{p,q}(t)&=\int_t^1(u-t)^{-k}u^{p-1}(1-u)^{q-1}\,du.
\end{aligned}
\tag{5.439}
\]

The expectation versions in (5.437) are

\[
d_q(\lambda)=\frac{t^k}{B(p,q)}D_{p,q}(t),\qquad
n_q(\lambda)=\frac{t^k}{B(p,q)}N_{p,q}(t).
\tag{5.440}
\]

Thus their ratio is \(N_{p,q}/D_{p,q}\), but their Wronskian is not the
unnormalized Wronskian below.  Euler's integral gives two endpoint
hypergeometric solutions of

\[
t(1-t)y''+(1-p+k-2t)y'-k(1-k)y=0.
\tag{5.441}
\]

Abel's identity and the endpoint constants give

\[
\boxed{
D_{p,q}N_{p,q}'-D_{p,q}'N_{p,q}
=-\frac{\Gamma(p)\Gamma(q)\Gamma(1-k)}{\Gamma(k)}
t^{p-k-1}(1-t)^{q-k-1}<0.
}
\tag{5.442}
\]

For completeness, if \(p>k\), then as \(t\downarrow0\),

\[
D_{p,q}(t)\sim B(p,1-k)t^{p-k},\qquad
N_{p,q}(t)\longrightarrow B(p-k,q),
\]

which gives the constant in (5.442) directly.  If \(q>k\), the reflected
calculation at \(t=1\) gives the same constant, and \(p=q=k\) follows by
continuity.  Hence \((N_{p,q}/D_{p,q})'(t)<0\).  Since \(t\) is strictly
decreasing in \(\lambda\), (5.438) follows.

We now apply this lemma to the left cut.  Fix \(x\in(l,d)\), set

\[
z_j=z_j(x)=\frac{x_j-x}{x_j+x},\qquad
(x_r,x_d,x_l)=(r,d,l),qquad u=-z_l>0,
\tag{5.443}
\]

and use the projective Dirichlet variable of (5.433).  Dirichlet
neutrality gives independent variables

\[
W=\widehat P_r+\widehat P_d\sim{\rm Beta}(a+b,c),qquad
Q=\frac{\widehat P_r}{\widehat P_r+\widehat P_d}
   \sim{\rm Beta}(a,b).
\tag{5.444}
\]

With

\[
V=z_d+(z_r-z_d)Q,qquad
\lambda=\frac Vu,qquad
\lambda_j=\frac{z_j}{u}\quad(j=d,r),
\]

one has

\[
N_x=u\{(1+\lambda)W-1\},qquad
\rho_k(x)=
\frac{\mathbb E_Q n_c(\lambda(Q))}
     {\mathbb E_Q d_c(\lambda(Q))}.
\tag{5.445}
\]

Let \(y=\log x\).  Since

\[
\frac{d}{dy}z_j=-\frac{1-z_j^2}{2},qquad
\frac{du}{dy}=\frac{1-u^2}{2},
\]

the affine coordinate \(\lambda\in[\lambda_d,\lambda_r]\) evolves as

\[
\frac{d\lambda}{dy}=-L(\lambda),qquad
L(\lambda)=\alpha_0+\alpha_1\lambda>0,
\tag{5.446}
\]

where

\[
\alpha_0=\frac{1+u^2\lambda_d\lambda_r}{2u}>0,qquad
\alpha_1-\alpha_0
=-\frac u2(1+\lambda_d)(1+\lambda_r)<0.
\tag{5.447}
\]

Consequently, for every \(s\in[0,1]\),

\[
\boxed{
\frac{\partial}{\partial\lambda}
\frac{L(\lambda)}{\lambda+s}
=\frac{\alpha_1s-\alpha_0}{(\lambda+s)^2}<0.
}
\tag{5.448}
\]

This elementary inequality is the sign mechanism that controls the
outer mixture.  Put

\[
m=2k-1>0,qquad \beta=1-c\ge0,qquad
T\sim{\rm Beta}(1-k,a+b).
\]

Scaling the first integral in (5.437) gives the exact formula

\[
d_c(\lambda)=
\frac{B(a+b,1-k)}{B(a+b,c)}
(1+\lambda)^{-m}\,
\mathbb E(\lambda+T)^{-\beta}.
\tag{5.449}
\]

If \(\pi_\lambda\) denotes the \(T\)-law tilted by
\((\lambda+T)^{-\beta}\), its logarithmic derivative is

\[
j_c(\lambda):=-\frac{d}{d\lambda}\log d_c(\lambda)
=\frac{m}{1+\lambda}
 +\beta\,\mathbb E_{\pi_\lambda}\frac1{\lambda+T}.
\tag{5.450}
\]

Define \(G_c(\lambda)=L(\lambda)j_c(\lambda)\).  The first term of
\(G_c\) is strictly decreasing by (5.448) with \(s=1\).  For
\(\lambda_2>\lambda_1\),

\[
\frac{d\pi_{\lambda_2}}{d\pi_{\lambda_1}}(t)
\ \propto\
\left(\frac{\lambda_2+t}{\lambda_1+t}\right)^{-\beta}
\tag{5.451}
\]

is nondecreasing in \(t\); hence \(\pi_\lambda\) moves upward in monotone
likelihood-ratio order.  At the same time
\(L(\lambda)/(\lambda+t)\) decreases in both \(\lambda\) and \(t\), by
(5.448).  It follows that

\[
\boxed{G_c(\lambda)\ \text{is strictly decreasing in }\lambda.}
\tag{5.452}
\]

Introduce the outer posterior

\[
\Pi_x(dQ)=
\frac{d_c(\lambda(Q))\,{\rm Beta}(a,b)(dQ)}
     {\mathbb E_Qd_c(\lambda(Q))}.
\tag{5.453}
\]

Then \(\rho_k(x)=\mathbb E_{\Pi_x}r_c(\lambda)\), and differentiation of
this posterior mean, using (5.438), (5.446), and (5.452), gives

\[
\boxed{
\frac{d\rho_k}{dy}
=-\mathbb E_{\Pi_x}[r_c'(\lambda)L(\lambda)]
 +{\rm Cov}_{\Pi_x}(r_c(\lambda),G_c(\lambda))<0.
}
\tag{5.454}
\]

Indeed, the first term is strictly negative, while the covariance of the
increasing function \(r_c\) and the decreasing function \(G_c\) is
nonpositive.  This proves (5.435) on \((l,d)\).

The right cut is the reflected calculation, but its signs are recorded
explicitly.  For \(x\in(d,r)\), put

\[
v=z_r>0,qquad u_d=-z_d,qquad u_l=-z_l,
\]

and take independent

\[
S=\widehat P_d+\widehat P_l\sim{\rm Beta}(b+c,a),qquad
Q=\frac{\widehat P_l}{\widehat P_d+\widehat P_l}
  \sim{\rm Beta}(c,b).
\]

With \(U=u_d+(u_l-u_d)Q\) and \(\lambda=U/v\),

\[
N_x=v\{1-(1+\lambda)S\},qquad
\sigma_k(x):=\rho_k(x)^{-1}
=\frac{\mathbb E_Qn_a(\lambda(Q))}
       {\mathbb E_Qd_a(\lambda(Q))}.
\tag{5.455}
\]

Now \(d\lambda/dy=+L(\lambda)\).  The affine function \(L\) satisfies
the analogues of (5.447)--(5.448), with \(u,\lambda_d,\lambda_r\)
replaced by \(v,u_d/v,u_l/v\).  Because \(a\le1\), the preceding argument
shows that \(G_a=Lj_a\) is strictly decreasing.  With the
\(d_a\)-posterior on \(Q\), denoted again by \(\Pi_x\),

\[
\boxed{
\frac{d\sigma_k}{dy}
=\mathbb E_{\Pi_x}[r_a'(\lambda)L(\lambda)]
 +{\rm Cov}_{\Pi_x}(r_a(\lambda),-G_a(\lambda))>0.
}
\tag{5.456}
\]

Both terms are nonnegative and the first is strictly positive.  Therefore
\(d\rho_k/dy<0\) also on \((d,r)\), completing (5.435).

WIP-5.38 proves that the one-sided phase jump at every endpoint and at the
middle knot has the required sign, with the possible atoms listed in
(5.420).  Hence the phase criterion (5.396) now proves

\[
G_kM^2\in GGC.
\tag{5.457}
\]

Finally, beta--gamma algebra gives
\(rG_a+dG_b+lG_c\overset d=G_{2k}M\), and gamma duplication gives,
with independent factors,

\[
(G_{2k}M)^2\overset d=
4(G_kM^2)G_{k+1/2}\in GGC.
\tag{5.458}
\]

The last implication uses Bondesson's independent-product theorem quoted
in Source 1 below.  Equations (5.435)--(5.458) are new project
derivations.  The Abel Wronskian constant, both logarithmic flows, the
monotone-likelihood-ratio direction, both posterior quotient derivatives,
and the gamma normalization were independently recalculated before this
entry was marked proved.

This theorem covers, for arbitrary three distinct rates and
\(1<a+b+c<2\), every shape vector with all coordinates at most one, as
well as the case in which the unique coordinate above one is attached to
the middle scale.  It includes all equal-shape and all endpoint-symmetric
three-rate families.  The remaining three-rate configurations in this
range have their unique shape above one attached to one of the two extreme
scales; those cases are not decided here.

## Deferred Routes 6--7

Routes 6--7 are documented in [CurrentGoal.md](CurrentGoal.md) but are not
part of the present active goal. They may be activated only under their
recorded activation conditions.

## Source map for this ledger

The formulas labelled **[PROVED]** or **[PROVED REDUCTION]** above are new
derivations in this project unless an external input is named explicitly.
The following map fixes the exact editions, conventions, and locations used.

1. **Bondesson (2015).**
   [Local PDF](literature/Bondesson2015.pdf).  Proposition 2, p. 1066:
   HCM density implies GGC; Proposition 3, pp. 1066--1067: normalized HCM
   Laplace transforms are precisely GGC Laplace transforms; Proposition
   4(a), p. 1066: HCM densities are preserved by powers
   \(\lvert q\rvert\ge1\); Theorem 1, pp. 1068--1071: independent-product
   closure of GGC.  Conjecture 1 is the target of this ledger.

2. **James--Roynette--Yor (2008).**
   [Local PDF](literature/James-Roynette-Yor-2008-GGC-Dirichlet-means.pdf),
   *Probability Surveys* **5** (2008), 346--415,
   DOI 10.1214/07-PS118.  Equations (20)--(25), p. 354 use the standard
   **rate** Thorin variable \(G\); equations (33)--(38), pp. 356--357 give
   \(\Gamma_m(G)=\gamma_mD_m(G)\), where the Dirichlet-mean amplitudes have
   base law \(1/G\), together with gamma cancellation.  Equation (30),
   p. 355 identifies finite Thorin mass from the density at zero.
   Proposition 1.5, p. 360 is the Bondesson-class sufficient criterion for
   membership in \(D^{(m)}\).

   Accordingly, whenever this ledger says “scale-form Thorin measure
   \(mF\)”, the corresponding JRY rate-form Thorin measure is
   \(m(x\mapsto1/x)_\#F\).  This convention prevents an otherwise easy
   reciprocal error.

3. **Schilling--Song--Vondraček (2010).**
   [Local PDF](literature/SSV.pdf), *Bernstein Functions: Theory and
   Applications*, de Gruyter Studies in Mathematics 37. Corollary 1.6,
   pp. 5--6 gives the product and limit closure of completely monotone
   functions; Theorem 2.2(i), p. 12 characterizes Stieltjes functions as
   Laplace transforms of measures with completely monotone densities;
   Theorem 3.6, p. 19 gives the CM--Bernstein composition theorem; and
   Definition 9.4 and Theorem 9.5, pp. 81--82 give the
   exponential-mixture formulation used in WIP-1.15. Theorem 6.10,
   equation (6.10), pp. 58--60 is the canonical CBF phase representation;
   its proof and Remark 6.8(ii), equation (6.9), recover the boundary
   phase, while Remark 6.11 gives the \(f(0+)>0\) normalized rewrite.
   Theorem 7.3,
   p. 63 is the nonzero Stieltjes/CBF reciprocal theorem; Theorem 8.2,
   pp. 73--75 characterizes Thorin--Bernstein functions by a Stieltjes
   derivative and by a nondecreasing cumulative Thorin function.
   Proposition 1.2, p. 3 gives uniqueness of a finite measure from its
   Laplace transform, and Theorem 1.4, pp. 4--5 is Bernstein's theorem.
   These are the external analytic inputs to WIP-2.3, WIP-2.7, WIP-3.6,
   WIP-4.3, WIP-5.24, and WIP-5.28.

4. **Steutel--van Harn (2004).**
   [Local PDF](literature/Steutel.pdf), *Infinite Divisibility of
   Probability Distributions on the Real Line*, Marcel Dekker.  Chapter
   III, Theorem 10.7 is the Goldie--Steutel implication “completely
   monotone density \(\Longrightarrow\) infinitely divisible”, used in
   WIP-2.1.  Chapter IV, Corollary 9.9, p. 200 is the light-tail
   characterization used in WIP-1.14: among nondegenerate infinitely
   divisible laws, divergence of
   \(-\log\mathbb P(|X|>x)/(x\log x)\) along a subsequence forces the law
   to be normal.  The original papers are C. M. Goldie, “A class of infinitely
   divisible random variables,” *Proc. Cambridge Philos. Soc.* **63**
   (1967), 1141--1143, DOI 10.1017/S0305004100042225; F. W. Steutel,
   “Note on the infinite divisibility of exponential mixtures,”
   *Ann. Math. Statist.* **38** (1967), 1303--1305,
   DOI 10.1214/aoms/1177698806; and Steutel, “Note on Completely Monotone
   Densities,” *Ann. Math. Statist.* **40** (1969), 1130--1131,
   DOI 10.1214/aoms/1177697626.

5. **Lin (2017).** G. D. Lin, “Recent developments on the moment problem,”
   *Journal of Statistical Distributions and Applications* **4**, Article
   5, DOI 10.1186/s40488-017-0059-2, Theorem 2.  This records the Stieltjes
   Carleman/Hardy determinacy implications used in WIP-3.2.  The actual
   growth estimate needed here is proved in (3.8)--(3.9).

6. **NIST Digital Library of Mathematical Functions.**  Equation
   [7.7.2](https://dlmf.nist.gov/7.7.E2) is the upper-half-plane Faddeeva
   integral used in WIP-5.8.  Equation
   [14.12.7](https://dlmf.nist.gov/14.12.E7), specialized to order zero
   and with the cosine variable reflected, is the Legendre integral used
   in (1.75), (1.92), and (1.154).  Equation
   [14.2.1](https://dlmf.nist.gov/14.2.E1) is Legendre's differential
   equation used in (1.154).  Sections 10.25.1
   (modified Bessel equation), 10.25.2 (the \(I_\nu\) series), 10.29.1
   (derivative/recurrence identities), and 10.32.1 (the \(I_0\) integral
   representation) are the special-function inputs used in WIP-2.1 and
   WIP-2.6.  Equation
   [10.9.4](https://dlmf.nist.gov/10.9.E4) is the Poisson integral used in
   (4.5); equation
   [10.32.9](https://dlmf.nist.gov/10.32.E9) is the \(K_\nu\) integral
   representation used in (4.16); and equations
   [10.43.30--10.43.32](https://dlmf.nist.gov/10.43#v) fix the
   Kontorovich--Lebedev normalization and sufficient inversion conditions
   used in WIP-4.6.  Equation
   [15.8.18](https://dlmf.nist.gov/15.8.E18) is the quadratic Gauss
   transformation used in (5.316)--(5.317); equation
   [15.8.14](https://dlmf.nist.gov/15.8.E14) is the quadratic
   transformation used to check the Appell two-rate degeneration in
   (5.350).  Equations
   [13.2.40](https://dlmf.nist.gov/13.2.E40) and
   [13.2.42](https://dlmf.nist.gov/13.2.E42) are the Kummer parameter
   transformation and connection formula used in (1.127) and
   (1.140)--(1.143); equation
   [13.4.4](https://dlmf.nist.gov/13.4.E4) is the positive real integral
   for \(U\) used in (1.127) and (1.140); and equations
   [13.7.3](https://dlmf.nist.gov/13.7.E3),
   [13.7.4](https://dlmf.nist.gov/13.7.E4), and
   [13.7.5](https://dlmf.nist.gov/13.7.E5) give the large-argument
   \(U\) expansion and differentiable remainder used in (1.128) and
   (1.149).
   Equation
   [13.7.2](https://dlmf.nist.gov/13.7.E2) is the large-argument Kummer
   expansion used in (5.328).

7. **Martin--Kearney (2010).**
   [Local PDF](literature/Martin-Kearney-2010-self-convolutive-recurrence.pdf),
   R. J. Martin and M. J. Kearney, “An Exactly Solvable
   Self-Convolutive Recurrence,” *Aequationes Mathematicae* **80**
   (2010), 291--318, DOI 10.1007/s00010-010-0051-0.  Equation (1) and
   the displayed \(S(2,-3,1)\) formula in the Introduction are the
   external input to WIP-3.8; the latter formula is on p. 293.

8. **Sjödin (2021).**
   [Local PDF](literature/Sjodin-2021-HMk-gamma-mixtures-GGC.pdf),
   T. Sjödin, “On Mixtures of Gamma Distributions, Distributions with
   Hyperbolically Monotone Densities and Generalized Gamma Convolutions
   (GGC),” *Probability and Mathematical Statistics* **41**(1) (2021),
   1--7, DOI 10.37190/0208-4147.41.1.1.  Equation (2.1) and
   Definition 2.1, p. 2 define \(HM_k\) for arbitrary real \(k>0\);
   Theorem 3.1, p. 4 is the
   \(\Gamma(k)\times HM_l\) and \(\Gamma(k)/HM_l\) GGC theorem for
   \(0<k\le l\).  In the arXiv manuscript these are numbered (1),
   Definition 1, and Theorem 1.  WIP-3.9 and WIP-5.27 use only this exact
   sufficient condition; WIP-1.18 uses the definition and proves that the
   \(l=k=2/3\) hypothesis fails for its exact residual.

9. **Leonov--Shiryaev (1959).**
   V. P. Leonov and A. N. Shiryaev, “On a Method of Calculation of
   Semi-Invariants,” *Theory of Probability and its Applications*
   **4**(3) (1959), 319--329, DOI 10.1137/1104031.  Their product-cumulant
   identity, equation (IV.d), is the partition formula used in WIP-3.5.

10. **Cifarelli--Regazzini inversion.** D. M. Cifarelli and E. Regazzini,
    “Distribution Functions of Means of a Dirichlet Process,” *Annals of
    Statistics* **18**(1) (1990), 429--442,
    [DOI 10.1214/aos/1176347509](https://doi.org/10.1214/aos/1176347509),
    with the correction in *Annals of Statistics* **22**(3) (1994),
    1633--1634,
    [DOI 10.1214/aos/1176325647](https://doi.org/10.1214/aos/1176325647).
    A. Lijoi and I. Prünster, “Distributional Properties of Means of Random
    Probability Measures,” *Statistics Surveys* **3** (2009), 47--95,
    [DOI 10.1214/09-SS041](https://doi.org/10.1214/09-SS041), Theorem 2.1
    and Appendix B.1, records the generalized Stieltjes identity and its
    inversion framework.  Equations (1.56)--(1.58) specialize that framework
    to order \(1/2\), but their boundary and Abel derivations are included in
    WIP-1.11 rather than imported as an unproved formula.

11. **Dyachenko--Karp hypergeometric-ratio representation.**
    A. Dyachenko and D. Karp,
    “Ratios of the Gauss Hypergeometric Functions with Parameters Shifted
    by Integers: Part I,” arXiv:2103.13312v1 (24 March 2021),
    [local preprint](literature/Dyachenko-Karp-2021-arXiv2103.13312v1.pdf).
    Theorem 2.1 gives the zero-free parameter regimes, Theorem 2.12 gives
    the Cauchy/Markov integral, and Section 4, Example 2, gives the explicit
    \(R_{0,1,0}\) density used in (5.318)--(5.320).  The final article is
    “Integral Representations of Ratios of the Gauss Hypergeometric
    Functions with Parameters Shifted by Integers,” *Mathematics*
    **10**(20) (2022), Article 3903,
    [DOI 10.3390/math10203903](https://doi.org/10.3390/math10203903).
    Its Example 2 also records that the Hausdorff-moment result follows
    from R. Küstner, “Mapping Properties of Hypergeometric Functions and
    Convolutions of Starlike or Convex Functions of Order Alpha,”
    *Computational Methods and Function Theory* **2**(2) (2002), 597--610,
    [DOI 10.1007/BF03321867](https://doi.org/10.1007/BF03321867),
    Theorem 1.5.  WIP-5.30 uses the explicit Dyachenko--Karp density,
    including its cut-boundary modulus, rather than importing an unnamed
    continued-fraction measure.

The downloaded James--Roynette--Yor PDF was checked against the displayed
journal pagination, and has SHA-256
CF3D18C4E8F37837A7872B8BF5A27236E5A606F1A1A4DEC5054DDBD991C05DF1.
The Martin--Kearney and Sjödin PDFs have SHA-256 values, respectively,
636BC6CAB2CA3E65A11AD25CE84DB635ADF2F9D4863FB4A31F4D009CAFA5D116
and
33C57E0BEF800BA632105A5241F221ADF48F3FB4119F88C8BF6C52E62B744880.
The Dyachenko--Karp arXiv v1 PDF has SHA-256
849F8FA0A74CAA94C535C7128175B587C7F26A609B156E42C93AD7CFD4F26F18.

## Checkpoint: 2026-09-05, twentieth execution pass

No proof or counterexample to Conjecture 1 has been obtained.  The current
execution pass has produced:

- an exact Route 1 factorization, its finite-mass equivalence, integer-power
  tilt laws, and the first precise two-atom obstruction; in the quadratic
  benchmark the unique candidate order-\(1/2\) directing law is now explicit
  and Routes 1--3 have been identified as three descriptions of the same
  positive-measure problem;
- a left/right Abel-half-integral representation of that directing-law
  target, its exact posterior-elasticity gap, and a rational proof that the
  stronger pointwise-elasticity shortcut fails at large contrast;
- a second exact Route-1 equivalent target:
  \(T_\theta=(DC_+/2)^2\) has an explicit algebraic completely monotone
  density, is always ID and never has an HCM density at unequal rates, while
  \(T_\theta\in GGC\) is equivalent to the required order-\(1/2\)
  directing-law property;
- a proof that the auxiliary variable \(4G_1M^2\) is ID but not GGC at
  unequal rates, ruling out only an overstrong Route-1 shortcut;
- an exact Route 2 reduction of the \(q=2\), two-half-gamma model to
  \(\mathcal R_\theta'(u)\ge0\), explicit universal endpoint windows,
  large-contrast transition asymptotics, and the all-\(u\) small-contrast
  theorem (2.56);
- a tilted-Stein reduction of the remaining Route-2 inequality to the
  single negative-moment bound (2.68), followed by the new tilted-mean bound
  (2.73), an improved pointwise window \(\min(z_1,z_2)\ge4/5\), and two
  rational low/high-frequency splices, which independently prove the
  symmetric two-rate benchmark whenever the rate ratio is at most \(4\);
- rigorous demonstrations that neither the HCM-density shortcut nor the
  direct \(HM_{1/2}\) factor shortcut covers the unequal-rate family;
- a determinate cumulant/Stieltjes-moment criterion, exact positive Hankel
  tests through size \(3\), an all-order cumulant recurrence, and a
  connected-permutation formula in Route 3;
- the all-order theorem that the divided sequence
  \(\kappa_{n+1}(Y)/(n+1)!\) is Stieltjes, together with a proof that
  removing the divisor is exactly the Route-2 phase-monotonicity problem;
- a finite-Jacobi explanation of that divided theorem and a precise
  obstruction to the naive scalar production-matrix proof;
- three exact Route-4 inversions: a signed Sonine--Bessel fibre inverse, the
  fully averaged Bernstein inverse, and a Kontorovich--Lebedev inverse,
  together with their exact interface with the Route-2 phase;
- the Route-5 rate-side Markov update, an all-rate-ratio extreme-shape
  theorem, and positive inverse-Stein/tilted-mean cones for arbitrary compact
  total-shape-one rate mixtures; in the two-rate Beta family the stronger
  explicit region is \(p(\kappa-1)\le1\);
- a Beta--Faddeeva reduction of the remaining two-rate sign question to the
  one-dimensional quotient (5.40), followed by a compressed four-block
  pairing theorem; this proves the exact cone
  \(\mathcal F_{\kappa,p}(r_*)\ge1\), uniformly covers every
  \(0<p<1,\ \kappa\le10\) by an exact Bernstein-basis certificate, and
  reaches the cubic boundary (5.68)--(5.70) in the symmetric case;
- an exact true-lobe comparison which improves that finite cone to all
  \(0<p<1\) and all \(\kappa>1\), thereby settling the complete two-rate,
  total-shape-one square problem in (5.91)--(5.92);
- a conditional multirate first-cut version of the same Möbius comparison,
  together with an exact three-rate example showing that its decisive
  support nesting is no longer automatic, a proof that one scalar centering
  cannot remove all direct-cut terms, and a proof that the pair kernel is
  not positive definite.  These delimit two direct extension mechanisms but
  are not counterexamples to GGC membership;
- a larger algebraic first-cut lobe cone which does not require support
  nesting.  The exact three-rate example violating the old nesting condition
  lies strictly inside this new cone, so at that stage the unresolved issue
  was global multicut assembly rather than that example's first-lobe mass;
  WIP-5.26 later closes that assembly by a different conditional argument.
  A stronger true-kernel secant criterion, an exact example showing that
  rising-branch information alone does not imply it, and a complementary
  positive-series tail certificate have also been proved;
- a general weighted multicut phase decomposition: the differing cut
  baselines contribute a strictly positive reverse-order covariance, and
  the entire unknown sign is reduced to one piecewise-unimodal residual
  covariance.  This also proves the global multirate cone (5.138) and leaves
  the central range \(0<\rho<g_*\) open within that certificate; WIP-5.26
  later bypasses the residual covariance and closes the global problem at
  total shape one;
- an interlacing critical polynomial for every cut maximum, exact quadratic
  formulas for three rates, root-free endpoint envelopes, and explicit
  rate-contrast cones which turn (5.138) into directly checkable sufficient
  conditions;
- an exact three-rate interface identity and covariance decomposition, a
  finite list of all dangerous cumulative prefixes, the shape cone
  \(\beta_1\le\beta_2\), a pointwise phase cone, and a last-cut-suppression
  reduction.  These isolate (5.164), the second rising prefix, as the only
  genuinely new cumulative inequality once first-cut certificates apply;
  the all-cut theorem WIP-5.26 later proves this prefix for all parameters;
- a Möbius analysis of that upper prefix showing that its two divergent
  exterior terms must retain a coupled cutoff.  The canonical linear
  reflection has no fixed pointwise sign, and an unweighted comparison does
  not automatically survive Gaussian weighting.  This rules out only a
  verbatim copy of WIP-5.13, not the GGC conjecture;
- a zero-temperature mass-ratio theorem: ordered supports make both
  \(P(t)/B_1(t)\) and \(\omega_1(t)\) increase, so two checks at \(t=0\)
  dominate every first and second rising prefix.  This yields the complete
  three-rate GGC sufficient theorem (5.174)--(5.176), exact
  hypergeometric formulas for its static masses, and the optimization-free
  parameter cone (5.182);
- a regularized upper-tail formula which absorbs the coupled logarithmic
  cancellation into one integrable kernel, plus an adjacent-cut transport
  that preserves the true phase equation.  It yields the uniform
  second-prefix cone (5.194) and the exact new GGC example (5.199), which is
  outside the earlier golden-ratio, mean, first-shape, and last-cut-
  suppression cones.  Freezing a rising root is also proved to have the
  wrong large-\(t\) sign, so future transports must remain phase-coupled;
- an arbitrary finite-cut phase-capacity theorem.  A global peak-gap
  condition leaves at most one active cut, and a prefix-normalized
  reverse-order covariance makes its protection capacity increase with
  \(t\).  In three rates this sharpens the former threshold from
  \(g_{2,*}\le\omega_{1,0}\Delta/(1+\omega_{1,0})\) to
  \(g_{2,*}\le\omega_{1,0}\Delta\).  The cone reaches arbitrarily close
  to equal rates along every fixed nondegenerate gap profile, but a proved
  hierarchical-gap asymptotic shows that it does not contain a full
  neighborhood of the equal-rate diagonal;
- the exact degree-two maximization of the adjacent transport ratio, a
  strictly smaller radical-free AM--GM envelope, and the stronger exact
  zero-temperature average \(\mathcal A(D)\).  These form a strict
  hierarchy of uniform second-prefix certificates and yield the new exact
  GGC laws (5.228) and (5.231); the latter lies in the average cone while
  lying outside the exact pointwise-supremum cone;
- a full lower-buffer endpoint theorem and a regularized upper-tail
  identity.  They give the mass criterion (5.236), the explicit tail
  criterion (5.240), and a second independent proof of the second prefix
  for (5.199), while proving that the older WIP-5.18 mass condition fails
  there.  The integration-by-parts profile (5.242) changes curvature in an
  exact rational example, ruling out a one-step global Jensen/chord proof
  but not the desired inequality;
- a peak-gap-free finite-cut theorem.  The full lower-triangular capacities
  \(\mathfrak C_j=(P+H_j)/T_j\) increase with \(t\) and protect every
  active rising root separately, so the proof permits several simultaneous
  active cuts.  The exact four-rate law (5.250) satisfies the new
  parameter cone, strictly violates the old peak-gap condition, and has
  two genuinely active cuts for all sufficiently small positive \(t\);
- an arbitrary-total-shape two-rate boundary formula and, for
  \(0<B\le2\), an exact averaged phase-kernel criterion.  The same analysis
  proves a symmetric integer ladder
  \((G_m^{(1)}/b_1+G_m^{(2)}/b_2)^2\in GGC\) for every integer
  \(m\ge1\), while an endpoint-order theorem rules out the direct
  \(HM_{B/2}\) invariant for every nondegenerate asymmetric affine beta
  mean and for every unequal-rate case with
  \(0<B<2\).  For \(B>2\), the reciprocal-Stieltjes mechanism itself is
  proved unavailable;
- a strict solution of the WIP-5.22 endpoint problem:
  \(\mathcal F(x)>0\) at every point of the last cut, with
  \(\mathcal F(r_*)=F_{\rm full}(r_*)\).  Dirichlet
  neutrality reduces the conditional law to the complete two-rate
  true-lobe theorem, and covariance ordering preserves the balance under
  mixing.  Thus \(c_M\ge0\) alone controls the three-rate second rising
  prefix, and the unweighted endpoint theorem extends to every finite
  total-shape-one last cut;
- an all-cut conditional-balance theorem.  Conditioning on the independent
  lower and upper Dirichlet block means reduces every cut to the complete
  two-rate problem.  After a factorized density tilt, the sole mixing
  remainder is a nonnegative association covariance.  The resulting
  strict unweighted prefix inequality survives Gaussian weighting by
  integration by parts, proving that the square of every finite gamma
  convolution of total shape one is GGC, with no restriction on the
  finite rate support or positive shape vector;
- a fractional \(HM_k\) inversion for the symmetric affine beta mean.
  Bell-polynomial pairing makes the causal Abel inverse positive, including
  both the simple- and double-endpoint-zero regimes.  It proves the sharp
  equivalence \(M^2\in HM_k\iff k\ge1\) and extends the symmetric
  two-rate square theorem from integer \(m\) to every real \(k\ge1\);
- a complete phase evaluation for arbitrary two-rate shapes at total
  shape two.  The reciprocal Laplace transform has an explicit
  nondecreasing canonical CBF phase, with its endpoint Thorin atom
  identified on the appropriate side.  Consequently every
  \((G_a^{(1)}/b_1+G_{2-a}^{(2)}/b_2)^2\), \(0<a<2\), is GGC, although
  the underlying \(B=2\) pointwise phase kernel can be negative;
- a general downward-shape propagation lemma.  Padding by an independent
  gamma variable at a vanishing scale shows that an arbitrary-support
  theorem at total shape \(B_0\) implies every smaller total shape.  In
  particular, the square of every finite gamma convolution of total shape
  at most one is GGC;
- an exact hypergeometric logarithmic representation for the full
  two-rate square problem.  A Dyachenko--Karp Markov measure yields the
  explicit scale-form Thorin measure (5.324) of
  \(G_{(a+c)/2}(l+(r-l){\rm Beta}(a,c))^2\), and identifies the squared
  affine beta mean itself as an order-\((a+c)/2\) Dirichlet mean.
  Gamma duplication and independent-product closure consequently prove
  the square theorem for every pair of positive shapes and rates, with no
  restriction on total shape;
- a matching obstruction showing that the WIP-5.24 pointwise phase kernel
  is negative on an open set for every \(0<B\le2\).  Thus the complete
  two-rate theorem comes from the exact beta average, not from the stronger
  false pointwise statement;
- an exact third-atom conditional Thorin map.  Its unconditional
  log-derivative is the tilted quotient (5.336), not the average of the
  conditional measures.  Strict Jensen, small-\(s\) concavity, the
  corrections (5.343), and a Dirichlet-order mismatch rigorously rule out
  the literal positive-kernel/barycentric recursion, without deciding the
  three-rate GGC square;
- an exact three-rate reduction from a Lauricella \(F_D^{(3)}\) factor to
  the Appell \(F_1\) expression (5.349), with WIP-5.30 recovered on the
  two-rate boundary.  For unequal shapes, the negative mixed coefficient
  (5.353) rules out a fixed positive multivariate Markov kernel for the raw
  Lauricella logarithm; the one-dimensional physical curve remains open;
- the first nonquadratic Route-1 test, \(q=3/2\).  The tilted-stable
  residual factors as \((3\sqrt3/2)\sqrt{VY}\), and (1.90) is its exact
  Wright--beta log-derivative target.  Gaussian tail bounds prove that the
  residual and the candidate mean are not ID, which closes only the
  stronger residual-GGC shortcut and does not decide the gamma product;
- a universal Route-3 low-order theorem: the square of every finite gamma
  convolution strictly passes both nontrivial \(2\times2\)
  Stieltjes--Hankel gates.  Equations (3.73)--(3.81) give positive
  moment-spread decompositions, verified by exact standard-library
  arithmetic;
- the first full three-scale theorem above total shape one:
  every arbitrary-scale sum of three independent exponentials has a GGC
  square.  The hyperbolic factorization (5.359) and increasing angles
  (5.364)--(5.365) give an explicit rate-form Thorin measure of mass
  \(3/2\);
- a complete second three-scale slice: every positive three-coordinate
  shape vector of total shape two has a GGC square at all scales.
  WIP-5.35 proves the coordinatewise-at-most-one core by the order-two
  Markov--Krein identity and Möbius cancellation; WIP-5.37 removes the
  restriction using a repaired right-cut identity, a canonical Hadamard
  finite part, and reciprocal Dirichlet duality.  The auxiliary Thorin
  measure has mass one and, when one shape exceeds one, an atom of mass
  \(\max(a,b,c)-1\) at its inverse squared scale;
- an exact physical-Appell reduction below total shape two.  The
  correlated contiguous quotient is (5.392), and membership of the
  sufficient auxiliary factor \(G_kM^2\) is equivalent to monotonic
  decrease of the real Abel ratio \(B_k/A_k\) on each side of the middle
   knot, plus a nonnegative phase jump there, in (5.396); the \(k=1\)
   limit instead uses the Plemelj phase proved in WIP-5.35;
- a complete node analysis for that fractional Abel problem.  Every
  endpoint and middle-knot phase jump has the favorable sign, all possible
  atomic masses are identified, and a beta--Gauss--Wronskian formula proves
  strict punctured-knot monotonicity whenever the middle shape is below
  \(k\);
- a full-interval continuation of that Abel analysis.  Conditioning the
  projective negative-moment odds produces a two-node beta quotient with a
  strictly signed Gauss Wronskian.  Its logarithmic scale flow and an outer
  opposite-monotonicity covariance prove both complete interval interiors
  whenever the two extreme-scale shapes are at most one.  Thus every such
  three-rate square with \(1<B<2\) is GGC, including a possible shape above
  one at the middle scale.  Only configurations with the unique shape above
  one at an extreme scale remain in this three-rate range;
- a sharpened \(q=3/2\) half-gamma analysis.  The necessary Thorin mass is
  \(2/3\), the fixed-mass gate and first two cumulant \(2\times2\) gates
  are all strictly positive, and the shifted-gate proof is universal for
  every independent multiplier of \(G_1^{3/2}\).  The exact
   Wright--Bessel boundary target is (1.107)--(1.113). Complete
   monotonicity of the powered density and the full-support spectral
   representation prove both slit-plane and physical-ray zero-freeness;
   only the arbitrary-contrast phase monotonicity remains open;
- exact \(3\times3\) unshifted and shifted cumulant--Hankel gates for that
  \(q=3/2\) model.  Both are positive at equal rates and infinite contrast,
  and hence on endpoint neighborhoods.  A two-point multiplier makes both
  negative, rigorously blocking a universal-multiplier extension without
  producing a target-family counterexample;
- a first nonquadratic GGC theorem beyond a single gamma law.  A Kummer ODE
  makes the one-rate Wright-ray Wronskian strictly positive, and a uniform
  logarithmic diagonal tube carries that sign through every sufficiently
  small reciprocal-rate contrast.  Thus WIP-1.17 proves
  \(X_\theta^{3/2}\in GGC\) for \(\lvert\theta\rvert<\theta_*\), for some
  \(\theta_*>0\).  The same calculation proves the underlying two-scale
  kernel is negative at widely separated scales, so future all-contrast
  work must exploit the arcsine average rather than global pointwise
  positivity;
- an exact obstruction to the residual-\(HM_k\) continuation.  The Kummer
  density of \(N_\theta\) has a positive \(x^{2/3}\) correction at zero,
  which makes the derivative of an \(HM_{2/3}\)-necessary fractional Abel
  transform asymptotic to a positive multiple of
  \(\xi^{4/3}\log(1/\xi)\).  Hence \(N_\theta\notin HM_{2/3}\) for every
  finite contrast; this blocks Sjödin's sufficient shortcut but is not a
  GGC counterexample;
- an exact all-contrast log-convolution formulation of the same Wright
  phase.  The arcsine average satisfies the radial Klein--Gordon equation
  (1.154), the current conservation law (1.156), and the separation formula
  (1.160).  The kernel product increases with separation and has a singular
  boundary, proving that naive separation integration by parts cannot close
  the sign.  The remaining target is an Abel boundary-compensation
  inequality for the complete two-dimensional average.

## Next actions

The next research actions, in order, are:

1. attack the only remaining three-rate Abel-ratio configurations in
   \(1<B<2\): the unique shape above one is attached to an extreme scale.
   Start from the successful posterior identities (5.454) and (5.456), and
   replace the failed \(\beta=1-a\ge0\) or \(1-c\ge0\) MLR step by a
   reflected, size-biased, or finite-part normalization that retains the
   full physical-curve cancellation.  WIP-5.39 has closed every other
   three-rate shape placement in this range;
2. use the exact tilted quotient (5.336), its boundary inversion (5.337),
   and the nonlinear moment corrections (5.343) to seek a shape-changing
   recursion beyond total shape one.  WIP-5.32 rules out simple averaging,
   while WIP-5.29 still propagates any valid new anchor downward;
3. extend the \(q=3/2\) Wright--Bessel phase theorem beyond the
   small-contrast tube by proving an Abel boundary-compensation inequality
   for the exact log-convolution current (1.160).  WIP-1.18 rules out the
   residual \(HM_{2/3}\) shortcut and WIP-1.19 rules out naive separation
   integration by parts.  In parallel, certify or refute the two
   \(3\times3\) Hankel determinants on the full
   affine-arcsine parameter interval; WIP-1.16 has closed both endpoints
   and has ruled out only the arbitrary-multiplier shortcut;
4. seek a block/map-peeling operator that encodes monotonicity of the
   limiting spectral-shift density \(\xi\), rather than mere Jacobi
   interlacing, and test it against the explicit Thorin measures in
   WIP-5.34--WIP-5.35 and WIP-5.37;
5. use the Route-2 kernel and Route-3 spectral data to construct the final
   averaged HCM measure in R4-A for the first unresolved three-rate model.
   WIP-5.31 forbids replacing that average by pointwise kernel positivity.

The parallel exact falsification gate remains active throughout.
