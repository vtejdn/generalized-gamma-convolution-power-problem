# WIP index: Bondesson's GGC power problem

Started: **2026-09-05**. Index synchronized through WIP-5.50, WIP-6.23
and WIP-7.6 on **2026-09-06**.

This is the master per-result index, not a duplicate proof or status
narrative. The current mathematical assessment and verification limits
are maintained in [ResearchStatus](ResearchStatus.md).
Complete derivations are grouped by mechanism in the
[ledger module map](ledger/README.md); exact references are in the
[source map](ledger/references.md).
For current work use [CurrentGoal](CurrentGoal.md), and for strategic
interpretation use [BigPicture](BigPicture.md).

## Objective and recording rules

The original target is

\[
X\in GGC,\qquad q\ge1
\quad\stackrel{?}{\Longrightarrow}\quad
X^q\in GGC.
\tag{C1}
\]

Entries retain their individual statements and statuses, even when a
later theorem subsumes their scope. A refuted auxiliary condition is not
a refutation of the original target; an independent open route is not
automatically a gap in the assembled proof.

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
- **[UNDER AUDIT]**: a complete candidate argument whose final consolidated
  review/handoff is not yet finished; this is not a published theorem.

No floating-point experiment is used as proof. Exact calculations must name
the script, arithmetic domain, and mathematical identity checked.

## Current result index

Historical route numbers in filenames and WIP IDs are not current priority
numbers. WIP-6.x and WIP-7.x are cross-route infrastructure, not renamings
of the historical routes. The independent phase proof now covers the
square of every finite gamma convolution of total shape at most two,
without a support-size restriction. The continuous-power route has a
positive finite-time construction and an identification proof; their
full-conjecture assembly has passed its final internal mathematical audit.
See [WIP-6.21](ledger/23-power-theorem-assembly-audit.md#wip-6-21),
[WIP-6.23](ledger/25-mathematical-completion-audit.md#wip-6-23) and
[BigPicture](BigPicture.md) for the proof and exact limits of that status.

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
| [WIP-5.40](ledger/14-averaged-phase-compensation.md#wip-5-40) | support-count-aware downward shape propagation | proved reduction; adding a vanishing-scale gamma can add a support point |
| [WIP-5.41](ledger/14-averaged-phase-compensation.md#wip-5-41) | reciprocal duality for the auxiliary gamma--Dirichlet square | proved equivalence for the auxiliary factors; no cancellation theorem for the original square |
| [WIP-5.42](ledger/14-averaged-phase-compensation.md#wip-5-42) | heavy-endpoint derivative asymptotic and posterior compensation target | the old pointwise invariant is rigorously false; the actual target is now proved in WIP-5.44 |
| [WIP-5.43](ledger/14-averaged-phase-compensation.md#wip-5-43) | positive score spectrum, Bernstein structure and failure of generic posterior order | proved; smooth Bernstein-test expectations move in the wrong direction, without refuting target-specific compensation |
| [WIP-5.44](ledger/14-averaged-phase-compensation.md#wip-5-44) | positive complementary beta solution and full heavy-endpoint compensation | proved the auxiliary three-rate theorem for 1 < B < 2 and completed the original square theorem for at most three rates and 0 < B <= 2 |
| [WIP-5.45](ledger/18-four-rate-balanced-phase.md#wip-5-45) | exterior-cut positivity and the balanced four-rate square | proved auxiliary and original GGC membership at total shape two when the first two and last two ordered scales each carry total shape one |
| [WIP-5.46](ledger/18-four-rate-balanced-phase.md#wip-5-46) | unique-minimum gate for the unbalanced four-rate middle cut | proved exact auxiliary-GGC equivalence; its sign is now strictly positive by WIP-5.49 |
| [WIP-5.47](ledger/18-four-rate-balanced-phase.md#wip-5-47) | four-half-gamma residual fails HM1 despite auxiliary GGC membership | proved obstruction to a stronger sufficient route; the known density input is separately sourced |
| [WIP-5.48](ledger/18-four-rate-balanced-phase.md#wip-5-48) | shape-open stability around every balanced four-rate vector | proved auxiliary and original-square GGC in a relative shape neighborhood for each fixed ordered scale configuration; no uniform radius or all-shape theorem |
| [WIP-5.49](ledger/18-four-rate-balanced-phase.md#wip-5-49) | conditional-beta Cauchy primitive and separated posterior log derivatives | proved strict positivity on every open cut for arbitrary finite support at total shape two; closes the old four-rate minimum |
| [WIP-5.50](ledger/18-four-rate-balanced-phase.md#wip-5-50) | every finite gamma-convolution square of total shape at most two | proved with arbitrary support and shapes; auxiliary GGC at B = 2, split/separate weak limits and downward padding |
| [WIP-6.1](ledger/15-global-criteria-and-power-flow.md#wip-6-1) | global mixing log-concavity fails for q > 1 and B/q <= 1 | proved obstruction to B92-C2, including equal rates; not a GGC counterexample |
| [WIP-6.2](ledger/15-global-criteria-and-power-flow.md#wip-6-2) | exact fractional gamma-peeling operator | proved identity with normalization; matched GGC-preservation remains conjectural |
| [WIP-6.3](ledger/15-global-criteria-and-power-flow.md#wip-6-3) | positive-argument tilted-cumulant Hausdorff and Loewner criteria | proved applications of sourced recognition theorems; no independent explicit all-order certificate here; target signs follow from the full theorem audited in WIP-6.23 |
| [WIP-6.4](ledger/15-global-criteria-and-power-flow.md#wip-6-4) | continuous power-flow identity and conditional Thorin mass | proved identities; no positive evolution theorem is claimed |
| [WIP-6.5](ledger/15-global-criteria-and-power-flow.md#wip-6-5) | law-dependent local-to-global power continuation | proved conditional lemma requiring local closure for every GGC law |
| [WIP-6.6](ledger/16-power-flow-loewner-tangent.md#wip-6-6) | explicit Dirichlet power tangent and positive off-atom boundary jump | proved, including interlacing and singular-pole compensation requirements |
| [WIP-6.7](ledger/16-power-flow-loewner-tangent.md#wip-6-7) | strict tangent positivity on every finite Loewner nullspace | proved a right neighborhood for each fixed matrix; no common neighborhood over all matrices |
| [WIP-6.8](ledger/16-power-flow-loewner-tangent.md#wip-6-8) | conditional Thorin support of every strictly powered finite-gamma law reaches zero | proved from the absence of positive exponential moments; no derivative/inversion interchange claimed |
| [WIP-6.9](ledger/16-power-flow-loewner-tangent.md#wip-6-9) | compensated positive-jump form of the normalized tangent | proved finite-atom weak functional and positive minimum property; not an evolution-existence theorem |
| [WIP-6.10](ledger/16-power-flow-loewner-tangent.md#wip-6-10) | explicit positive Thorin curve realizing the compensated weak functional and matching the power-transform tangent | proved first-order realization; this curve is not the actual power flow |
| [WIP-6.11](ledger/19-finite-thorin-compensated-power-tangent.md#wip-6-11) | measurable Dirichlet-process phase and the finite-Thorin power tangent | proved for admissible finite Thorin measures, including non-atomic bases, using a logarithmic representation anchored at one |
| [WIP-6.12](ledger/19-finite-thorin-compensated-power-tangent.md#wip-6-12) | compensated weak operator on compact rate support | proved absolute convergence on bounded twice-differentiable tests, resolvent action and the positive minimum property; no evolution theorem |
| [WIP-6.13](ledger/19-finite-thorin-compensated-power-tangent.md#wip-6-13) | safe test domain for finite Thorin measures with unrestricted rate support | proved endpoint bounds and absolute convergence on constants, compactly supported smooth tests and fixed-order resolvents; iteration is supplied separately by WIP-6.19, with the full assembly audited in WIP-6.23 |
| [WIP-6.14](ledger/19-finite-thorin-compensated-power-tangent.md#wip-6-14) | conditional mass scaling for every zero-drift finite-Thorin input | proved that a GGC power must have zero drift and Thorin mass B/q; does not establish power membership |
| [WIP-6.15](ledger/19-finite-thorin-compensated-power-tangent.md#wip-6-15) | finite-mass law-dependent local closure is equivalent to the full conjecture | proved continuation reduction; its local hypothesis now follows from the separate full theorem audited in WIP-6.23 |
| [WIP-6.16](ledger/20-finite-thorin-positive-steps.md#wip-6-16) | Palm-disintegrated logarithmic rate generator | proved measurable nonnegative jumps and exact current-law resolvent tangent, with the original mass parameter retained |
| [WIP-6.17](ledger/20-finite-thorin-positive-steps.md#wip-6-17) | universal jump second moment and linear log-rate drift | proved support-independent bounds and a quadratic Lyapunov estimate |
| [WIP-6.18](ledger/21-log-thorin-euler-evolution.md#wip-6-18) | weak continuity of the nonlinear averaged generator | proved by coupled Dirichlet probabilities and weak-star phase convergence; no rate-moment hypothesis |
| [WIP-6.19](ledger/21-log-thorin-euler-evolution.md#wip-6-19) | positive Euler evolution on every finite time interval | proved probability-valued weak solutions with uniform second log-rate moments and vanishing cumulative discretization error |
| [WIP-6.20](ledger/22-power-flow-identification.md#wip-6-20) | the specific weak evolution is the actual power flow | proved conditional identification, including zero-Laplace normalization and dynamic transport uniqueness; existence is separately supplied by WIP-6.19 |
| [WIP-6.21](ledger/23-power-theorem-assembly-audit.md#wip-6-21) | full GGC power-theorem assembly | proved in project; completed internal mathematical audit and all-quantifier evidence in WIP-6.23 |
| [WIP-6.22](ledger/24-direct-log-generator-resolvent.md#wip-6-22) | direct action of the log-rate generator on resolvents | proved alternative cancellation identity, including absolute posterior drift and signed Palm bounds; does not enlarge the existing identity's scope |
| [WIP-6.23](ledger/25-mathematical-completion-audit.md#wip-6-23) | mathematical completion audit of the original full target | internal mathematical audit complete; full conclusion proved in project, not a claim of external review or a second independent theorem |
| [WIP-7.1](ledger/17-exponential-peeling-closure.md#wip-7-1) | exponential peeling of arbitrary GGC inputs | proved from Bondesson's widened multiplication theorem, with exact normalization |
| [WIP-7.2](ledger/17-exponential-peeling-closure.md#wip-7-2) | arbitrary positive-integer peeling orders | proved by rate-shift iteration and weak limits; no fractional interpolation |
| [WIP-7.3](ledger/17-exponential-peeling-closure.md#wip-7-3) | integer prefixes preserve any uniform-in-rates residual power theorem | proved conditional bootstrap, including coincident-rate limits |
| [WIP-7.4](ledger/17-exponential-peeling-closure.md#wip-7-4) | new original-square families obtained by integer prefixes | proved for a small-total-shape tail, an arbitrary two-rate tail, or an at-most-three-rate tail of total shape at most two |
| [WIP-7.5](ledger/17-exponential-peeling-closure.md#wip-7-5) | small-atom-shape reduction and the ordered-peeling limitation | proved; small individual shapes suffice only with arbitrary support size |
| [WIP-7.6](ledger/17-exponential-peeling-closure.md#wip-7-6) | HCM-density output fails for matched equal-shape two-gamma powers, 1 <= q < 2 | proved complex-zero obstruction to a stronger closure invariant, not a GGC counterexample |

## Current execution entry points

[CurrentGoal](CurrentGoal.md) records authorized next work.
The [archived blueprint](ledger/checkpoints/2026-09-06-route-blueprint.md)
preserves the complete P1--P7 history and historical route correspondence.
Use [ResearchStatus](ResearchStatus.md) for the overall theorem assessment
and [WIP-6.23](ledger/25-mathematical-completion-audit.md#wip-6-23)
for its internal completion evidence; proofs remain in the ledger.
