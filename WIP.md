# WIP index: Bondesson's GGC power problem

Started: **2026-09-05**.
Status: **active overview and master result index**.

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

- **[PROVED]**: a proof is written in the linked ledger entry and its
  hypotheses have been checked.
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

## Ledger organization

Complete derivations now live in [`ledger/`](ledger/README.md). The files are grouped by mathematical object and proof mechanism; stable WIP identifiers, equation numbers, and provenance labels are unchanged.

| IDs | Mathematical module | Detailed record |
|---|---|---|
| WIP-0.1--0.3 | finite-gamma and Dirichlet foundations | [00-foundations.md](ledger/00-foundations.md) |
| WIP-1.1--1.13 | stable tilting, Dirichlet means, and quadratic benchmark | [01-route1-stable-dirichlet-and-quadratic.md](ledger/01-route1-stable-dirichlet-and-quadratic.md) |
| WIP-1.14--1.19 | q = 3/2 Wright--Bessel problem | [02-route1-q-three-halves-wright-bessel.md](ledger/02-route1-q-three-halves-wright-bessel.md) |
| WIP-2.1--2.14 | Thorin boundary phase and Volterra analysis | [03-route2-thorin-volterra.md](ledger/03-route2-thorin-volterra.md) |
| WIP-3.1--3.10 | cumulants, Hankel gates, and Stieltjes moments | [04-route3-cumulant-stieltjes.md](ledger/04-route3-cumulant-stieltjes.md) |
| WIP-4.1--4.6 | averaged HCM and spectral inversion | [05-route4-averaged-hcm.md](ledger/05-route4-averaged-hcm.md) |
| WIP-5.1--5.7 | shape-matched recursion and initial cones | [06-route5-recursion-and-initial-cones.md](ledger/06-route5-recursion-and-initial-cones.md) |
| WIP-5.8--5.11 | two-rate total-shape-one theorem | [07-route5-two-rate-total-shape-one.md](ledger/07-route5-two-rate-total-shape-one.md) |
| WIP-5.12--5.17 | multirate first-cut geometry | [08-route5-multirate-first-cut.md](ledger/08-route5-multirate-first-cut.md) |
| WIP-5.18--5.23 | multicut capacity and transport | [09-route5-multirate-capacity.md](ledger/09-route5-multirate-capacity.md) |
| WIP-5.25, 5.26, 5.29 | support-wide closure and shape propagation | [10-route5-support-wide-closure-and-shape-propagation.md](ledger/10-route5-support-wide-closure-and-shape-propagation.md) |
| WIP-5.24, 5.27, 5.28, 5.30, 5.31 | arbitrary-shape two-rate squares | [11-route5-two-rate-arbitrary-shapes.md](ledger/11-route5-two-rate-arbitrary-shapes.md) |
| WIP-5.32--5.35, 5.37 | three-rate reductions and anchor theorems | [12-route5-three-rate-reductions-and-anchors.md](ledger/12-route5-three-rate-reductions-and-anchors.md) |
| WIP-5.36, 5.38, 5.39 | three-rate fractional Abel analysis | [13-route5-three-rate-fractional-abel.md](ledger/13-route5-three-rate-fractional-abel.md) |

The [source map](ledger/references.md) and [historical pass-20 checkpoint](ledger/checkpoints/2026-09-05-pass-20.md) are stored separately. `ResearchStatus.md` and `CurrentGoal.md` remain authoritative for current status and execution order.

## Current result index

| ID | Result | Status |
|---|---|---|
| [WIP-0.1](ledger/00-foundations.md#wip-0-1) | finite-gamma reduction | proved application of established closure facts |
| [WIP-0.2](ledger/00-foundations.md#wip-0-2) | two complementary Dirichlet representations | proved |
| [WIP-0.3](ledger/00-foundations.md#wip-0-3) | multiplicative and sequential closure of the universal exponent set | proved |
| [WIP-1.1](ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-1) | negative moments of a positive stable variable | proved |
| [WIP-1.2](ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-2) | tilted-stable factorization of \(G_B^q\) | proved |
| [WIP-1.3](ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-3) | exact Gamma--Dirichlet reformulation of \(X^q\) | proved |
| [WIP-1.4](ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-4) | finite-Thorin-mass/Dirichlet-mean recognition target | proved reduction |
| [WIP-1.5](ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-5) | generalized Stieltjes transform of the proposed mixing variable | proved; exposes an exact equivalence, not yet a solution |
| [WIP-1.6](ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-6) | \(B=1,q=2\) reduction to an exponential times a squared arcsine mean | proved |
| [WIP-1.7](ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-7) | explicit law of the stable tilt for integer powers | proved |
| [WIP-1.8](ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-8) | one-atom Dirichlet-mean certificate | established input plus proved deduction |
| [WIP-1.9](ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-9) | two-atom transform and posterior-average obstruction | proved reduction |
| [WIP-1.10](ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-10) | the auxiliary mean in the first benchmark is ID but not GGC | proved; refutes only a stronger shortcut |
| [WIP-1.11](ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-11) | exact order-\(1/2\) directing law in the benchmark | proved for every rate contrast; positivity supplied by WIP-5.11 |
| [WIP-1.12](ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-12) | left/right Abel half-integrals and the elasticity gap | proved reduction; a natural pointwise shortcut is rigorously refuted |
| [WIP-1.13](ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-13) | Cauchy duality and the algebraic-density GGC variable \(T_\theta\) | proved; \(T_\theta\) is GGC for all contrasts but its unequal-rate density is not HCM |
| [WIP-1.14](ledger/02-route1-q-three-halves-wright-bessel.md#wip-1-14) | the first nonquadratic test, \(q=3/2\) | proved reduction; obtained a beta--gamma factorization and an exact Wright--beta Stieltjes target, while ruling out the residual-variable GGC shortcut |
| [WIP-1.15](ledger/02-route1-q-three-halves-wright-bessel.md#wip-1-15) | exact \(q=3/2\) half-gamma gates and Wright--Bessel ray | proved the fixed-mass and first two cumulant \(2\times2\) gates strictly positive, proved global and boundary zero-freeness, and reduced the open problem to phase monotonicity on one complex ray |
| [WIP-1.16](ledger/02-route1-q-three-halves-wright-bessel.md#wip-1-16) | first \(3\times3\) gates for the \(q=3/2\) half-gamma model | proved strict positivity at the equal-rate and infinite-contrast endpoints, hence on endpoint neighborhoods; proved that the universal arbitrary-multiplier analogue is false by an exact two-point witness |
| [WIP-1.17](ledger/02-route1-q-three-halves-wright-bessel.md#wip-1-17) | a uniform small-contrast \(q=3/2\) theorem | proved \(X_\theta^{3/2}\in GGC\) for every sufficiently small \(\lvert\theta\rvert\), by an ODE/Wronskian argument and a uniform logarithmic diagonal tube; global pointwise positivity of the resulting two-scale kernel is false |
| [WIP-1.18](ledger/02-route1-q-three-halves-wright-bessel.md#wip-1-18) | failure of the \(HM_{2/3}\) residual shortcut | proved that the exact residual \(N_\theta\) in \(X_\theta^{3/2}\overset d=G_{2/3}N_\theta\) is not \(HM_{2/3}\) for any finite contrast, by a fractional Abel necessary condition and a positive logarithmic asymptotic |
| [WIP-1.19](ledger/02-route1-q-three-halves-wright-bessel.md#wip-1-19) | logarithmic arcsine convolution and radial Klein--Gordon equation | proved an exact even-kernel convolution, PDE, current conservation law, and separation-derivative formula for the remaining all-contrast phase; direct separation integration by parts has the wrong bulk sign and a singular boundary |
| [WIP-2.1](ledger/03-route2-thorin-volterra.md#wip-2-1) | half-shape, reciprocal-rate, \(q=2\) density and exponential-mixture measure | proved |
| [WIP-2.2](ledger/03-route2-thorin-volterra.md#wip-2-2) | explicit negative-axis boundary values | proved |
| [WIP-2.3](ledger/03-route2-thorin-volterra.md#wip-2-3) | phase/ratio criterion for GGC in the benchmark | proved reduction; established analytic inputs cited |
| [WIP-2.4](ledger/03-route2-thorin-volterra.md#wip-2-4) | covariance and tilted-arcsine Stein targets | proved reduction |
| [WIP-2.5](ledger/03-route2-thorin-volterra.md#wip-2-5) | endpoint positivity and the equal-rate case | proved |
| [WIP-2.6](ledger/03-route2-thorin-volterra.md#wip-2-6) | a non-HCM benchmark at \(\theta=3\) | proved |
| [WIP-2.7](ledger/03-route2-thorin-volterra.md#wip-2-7) | positive Volterra kernel and its CM/phase equivalence | proved reduction; established analytic inputs cited |
| [WIP-2.8](ledger/03-route2-thorin-volterra.md#wip-2-8) | large-contrast transition-window positivity | proved asymptotic lemma |
| [WIP-2.9](ledger/03-route2-thorin-volterra.md#wip-2-9) | pair-kernel bounds and a small-contrast GGC theorem | proved |
| [WIP-2.10](ledger/03-route2-thorin-volterra.md#wip-2-10) | tilted Stein kernel and one-turning-point residual | proved reduction |
| [WIP-2.11](ledger/03-route2-thorin-volterra.md#wip-2-11) | tilted-mean criterion and the range \(e^{2\theta}\le3\) | proved partial GGC theorem |
| [WIP-2.12](ledger/03-route2-thorin-volterra.md#wip-2-12) | rational low/high-frequency splice up to \(e^{2\theta}\le7/2\) | proved partial GGC theorem |
| [WIP-2.13](ledger/03-route2-thorin-volterra.md#wip-2-13) | improved pointwise high-frequency window \(\min(z_1,z_2)\ge4/5\) | proved |
| [WIP-2.14](ledger/03-route2-thorin-volterra.md#wip-2-14) | exact low/high-frequency splice through the symmetric rate ratio \(\kappa=4\) | proved partial GGC theorem |
| [WIP-3.1](ledger/04-route3-cumulant-stieltjes.md#wip-3-1) | moment-determinate cumulant criterion implies GGC | proved |
| [WIP-3.2](ledger/04-route3-cumulant-stieltjes.md#wip-3-2) | \(X^q\) is moment determinate for finite gamma \(X\) and \(1<q\le2\) | proved |
| [WIP-3.3](ledger/04-route3-cumulant-stieltjes.md#wip-3-3) | first \(2\times2\) and \(3\times3\) Hankel tests in the benchmark | computer-verified exact; all positive |
| [WIP-3.4](ledger/04-route3-cumulant-stieltjes.md#wip-3-4) | formal PDE and all-order cumulant recurrence | proved |
| [WIP-3.5](ledger/04-route3-cumulant-stieltjes.md#wip-3-5) | connected-permutation expansion and coefficient positivity | proved |
| [WIP-3.6](ledger/04-route3-cumulant-stieltjes.md#wip-3-6) | divided cumulants are an all-order Stieltjes sequence | proved; equivalent monotonicity gap identified |
| [WIP-3.7](ledger/04-route3-cumulant-stieltjes.md#wip-3-7) | finite-Jacobi proof and obstruction | proved |
| [WIP-3.8](ledger/04-route3-cumulant-stieltjes.md#wip-3-8) | explicit equal-rate cumulant measure | established input plus proved deduction |
| [WIP-3.9](ledger/04-route3-cumulant-stieltjes.md#wip-3-9) | squared arcsine factor is not \(HM_{1/2}\) | proved; refutes a stronger shortcut |
| [WIP-3.10](ledger/04-route3-cumulant-stieltjes.md#wip-3-10) | universal first Hankel gates for squares | proved that every finite gamma convolution square passes both \(2\times2\) Stieltjes Hankel tests; obtained exact positive moment-spread decompositions |
| [WIP-4.1](ledger/05-route4-averaged-hcm.md#wip-4-1) | final averaged HCM identity | proved algebraic reduction |
| [WIP-4.2](ledger/05-route4-averaged-hcm.md#wip-4-2) | Sonine--Bessel inverse of each fixed fibre | proved signed representation |
| [WIP-4.3](ledger/05-route4-averaged-hcm.md#wip-4-3) | fully averaged Bernstein inverse | proved exact criterion |
| [WIP-4.4](ledger/05-route4-averaged-hcm.md#wip-4-4) | cut-plane spectral density and Route-2 interface | proved |
| [WIP-4.5](ledger/05-route4-averaged-hcm.md#wip-4-5) | positive product formulas in the small-contrast range | proved |
| [WIP-4.6](ledger/05-route4-averaged-hcm.md#wip-4-6) | rigorous Kontorovich--Lebedev inversion | proved |
| [WIP-5.1](ledger/06-route5-recursion-and-initial-cones.md#wip-5-1) | exact shape-matched Dirichlet update | proved algebraic reduction |
| [WIP-5.2](ledger/06-route5-recursion-and-initial-cones.md#wip-5-2) | reciprocal Dirichlet duality and the rate-side update | proved |
| [WIP-5.3](ledger/06-route5-recursion-and-initial-cones.md#wip-5-3) | fully averaged phase kernel at total shape one | proved reduction |
| [WIP-5.4](ledger/06-route5-recursion-and-initial-cones.md#wip-5-4) | golden-ratio rate-cone theorem at total shape one | proved partial Route-5 theorem |
| [WIP-5.5](ledger/06-route5-recursion-and-initial-cones.md#wip-5-5) | two obstructions to naive positive recursion | proved; not counterexamples |
| [WIP-5.6](ledger/06-route5-recursion-and-initial-cones.md#wip-5-6) | arbitrary fixed rate contrast near a shape-simplex vertex | proved partial Route-5 theorem |
| [WIP-5.7](ledger/06-route5-recursion-and-initial-cones.md#wip-5-7) | inverse-Stein and tilted-mean cones for total shape one | proved partial Route-5 theorem |
| [WIP-5.8](ledger/07-route5-two-rate-total-shape-one.md#wip-5-8) | Beta--Faddeeva one-dimensional sign reduction | proved reduction; remaining interior cancellation isolated |
| [WIP-5.9](ledger/07-route5-two-rate-total-shape-one.md#wip-5-9) | Faddeeva single-crossing cone | proved partial Route-5 theorem; complementary to the tilted-mean cone |
| [WIP-5.10](ledger/07-route5-two-rate-total-shape-one.md#wip-5-10) | compressed Faddeeva pairing and a uniform two-rate cone through \(\kappa=10\) | proved partial Route-5 theorem; exact Bernstein-basis certificate |
| [WIP-5.11](ledger/07-route5-two-rate-total-shape-one.md#wip-5-11) | true-lobe comparison for the complete two-rate, total-shape-one square problem | proved Route-5 theorem for all complementary shapes and all rate contrasts |
| [WIP-5.12](ledger/08-route5-multirate-first-cut.md#wip-5-12) | multirate first-cut pairing and exact three-rate extension obstructions | proved conditional extension and two structural obstructions; not a counterexample |
| [WIP-5.13](ledger/08-route5-multirate-first-cut.md#wip-5-13) | an enlarged algebraic first-cut lobe cone beyond support nesting | proved sufficient condition; the WIP-5.12 three-rate example lies strictly inside it |
| [WIP-5.14](ledger/08-route5-multirate-first-cut.md#wip-5-14) | weighted multicut phase centering and the residual covariance | proved general decomposition and a multirate global sufficient cone; its central covariance was later bypassed by WIP-5.26 |
| [WIP-5.15](ledger/08-route5-multirate-first-cut.md#wip-5-15) | critical polynomial and directly checkable multirate cones | proved explicit forms and a three-rate exact certificate |
| [WIP-5.16](ledger/08-route5-multirate-first-cut.md#wip-5-16) | three-rate interface, finite-prefix reduction, and phase-aware cones | proved reductions and conditional cones; the second rising prefix was later closed by WIP-5.26 |
| [WIP-5.17](ledger/08-route5-multirate-first-cut.md#wip-5-17) | upper-prefix Möbius cancellation | proved obstruction to a reflected copy of the first-cut proof; not a counterexample |
| [WIP-5.18](ledger/09-route5-multirate-capacity.md#wip-5-18) | zero-temperature mass ratios and a complete three-rate certificate | proved a new sufficient theorem, with exact and root-free parameter tests |
| [WIP-5.19](ledger/09-route5-multirate-capacity.md#wip-5-19) | regularized upper tail and adjacent-cut transport | proved a uniform second-prefix cone and a new exact three-rate GGC example |
| [WIP-5.20](ledger/09-route5-multirate-capacity.md#wip-5-20) | multicut zero-temperature phase capacity | proved an arbitrary finite-rate sufficient theorem and a sharper three-rate threshold |
| [WIP-5.21](ledger/09-route5-multirate-capacity.md#wip-5-21) | exact and averaged adjacent-cut transport | proved the quadratic transport maximum, a strict hierarchy of certificates, and two exact examples |
| [WIP-5.22](ledger/09-route5-multirate-capacity.md#wip-5-22) | full lower-buffer and regularized upper-tail criteria | proved endpoint, mass, and explicit upper-tail cones; refuted a one-curvature Jensen shortcut |
| [WIP-5.23](ledger/09-route5-multirate-capacity.md#wip-5-23) | peak-gap-free lower-triangular phase capacity | proved an arbitrary finite-rate theorem allowing simultaneous active cuts; gave an exact strict-separation example |
| [WIP-5.24](ledger/11-route5-two-rate-arbitrary-shapes.md#wip-5-24) | arbitrary-shape two-rate phase kernel and the symmetric integer ladder | proved a \(0<B\le2\) criterion, an \(HM_m\) theorem, and sharp endpoint obstructions to the direct invariant |
| [WIP-5.25](ledger/10-route5-support-wide-closure-and-shape-propagation.md#wip-5-25) | universal last-cut endpoint balance | proved the full unweighted endpoint balance is strictly positive by conditional two-rate mixing |
| [WIP-5.26](ledger/10-route5-support-wide-closure-and-shape-propagation.md#wip-5-26) | all-cut conditional balance | proved the square theorem for every finite gamma convolution of total shape one |
| [WIP-5.27](ledger/11-route5-two-rate-arbitrary-shapes.md#wip-5-27) | fractional \(HM_k\) inversion for the symmetric affine beta mean | proved \(M^2\in HM_k\iff k\ge1\), and the two-rate symmetric square theorem for every real \(k\ge1\) |
| [WIP-5.28](ledger/11-route5-two-rate-arbitrary-shapes.md#wip-5-28) | arbitrary two-rate shapes at total shape two | proved every two-rate gamma convolution of total shape two has a GGC square; identified the endpoint Thorin atoms |
| [WIP-5.29](ledger/10-route5-support-wide-closure-and-shape-propagation.md#wip-5-29) | downward propagation in total shape | proved that a fixed-\(q\), arbitrary-support theorem at total shape \(B_0\) implies every smaller positive total shape; hence every finite gamma convolution of total shape at most one has a GGC square |
| [WIP-5.30](ledger/11-route5-two-rate-arbitrary-shapes.md#wip-5-30) | hypergeometric Thorin measure for every two-rate square | proved the two-rate square theorem for all positive shapes and rates; identified the explicit finite Thorin measure of its gamma--beta factor and an order-\(B/2\) Dirichlet-mean law for the squared affine beta mean |
| [WIP-5.31](ledger/11-route5-two-rate-arbitrary-shapes.md#wip-5-31) | failure of pointwise kernel positivity below total shape two | proved that the WIP-5.24 pointwise kernel is negative on an open set for every \(0<B\le2\), despite its beta average being positive |
| [WIP-5.32](ledger/12-route5-three-rate-reductions-and-anchors.md#wip-5-32) | exact third-atom conditioning and the failure of naive barycentric recursion | proved the conditional Thorin update and its nonlinear tilted quotient; strict Jensen, local concavity, moment corrections, and order mismatch rule out the literal positive-kernel recursion |
| [WIP-5.33](ledger/12-route5-three-rate-reductions-and-anchors.md#wip-5-33) | three-rate Lauricella--Appell reduction | proved the exact Appell representation and two-rate degeneration; a negative mixed logarithmic coefficient rules out a fixed positive multivariate Markov kernel for unequal shapes |
| [WIP-5.34](ledger/12-route5-three-rate-reductions-and-anchors.md#wip-5-34) | the three-exponential square theorem | proved that the square of a sum of three arbitrarily scaled independent exponentials is GGC; constructed an explicit rate-form Thorin measure from two increasing boundary angles |
| [WIP-5.35](ledger/12-route5-three-rate-reductions-and-anchors.md#wip-5-35) | three rates at total shape two | proved the square theorem when the three positive shapes sum to two and each is at most one; constructed a mass-one Thorin measure by a Markov--Krein/Möbius phase argument |
| [WIP-5.36](ledger/13-route5-three-rate-fractional-abel.md#wip-5-36) | physical Appell curve and Abel-ratio gate | proved an exact Appell contiguous-quotient formula and, for total shape below two, equivalence with monotonicity of one real Abel-integral ratio |
| [WIP-5.37](ledger/12-route5-three-rate-reductions-and-anchors.md#wip-5-37) | unrestricted three-rate total-shape-two theorem | removed the coordinatewise shape restriction using a repaired right-cut identity, Hadamard finite parts, and reciprocal Dirichlet duality; identified the endpoint or knot Thorin atom |
| [WIP-5.38](ledger/13-route5-three-rate-fractional-abel.md#wip-5-38) | three-rate Abel-knot analysis below total shape two | proved that every endpoint and middle-knot phase jump has the correct sign and identified all possible Thorin atoms; when the middle shape is below \(k\), proved strict Abel-ratio decrease in punctured knot neighborhoods through a Gauss-Wronskian formula |
| [WIP-5.39](ledger/13-route5-three-rate-fractional-abel.md#wip-5-39) | full-interval Abel monotonicity with endpoint shapes at most one | proved the complete three-rate square theorem for \(1<B<2\) whenever the shapes carried by the two extreme scales are at most one; the rates are arbitrary, and a possible shape above one may occur at the middle scale |

At this point there is **no proof and no counterexample** to (C1).

## Deferred Routes 6--7

Routes 6--7 are documented in [CurrentGoal.md](CurrentGoal.md) but are not
part of the present active goal. They may be activated only under their
recorded activation conditions.
