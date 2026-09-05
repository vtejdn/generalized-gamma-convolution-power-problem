# Historical assessment: before WIP-5.49--5.50 and WIP-6.16--6.21

This is a preserved snapshot, not current mathematical status. Relative
links have been adjusted for this archive location. Use the current
[BigPicture](../../BigPicture.md) and [WIP](../../WIP.md) for current status.

# Big picture: distance to the GGC power conjecture

Assessment date: **2026-09-05**.
Updated through WIP-5.48, WIP-6.15 and WIP-7.6.

[WIP: progress and result index](../../WIP.md) |
[CurrentGoal: execution blueprint](../../CurrentGoal.md) |
[ResearchStatus: mathematical status](../../ResearchStatus.md)

## Purpose and current judgment

This document records the strategic assessment of the project: what has
actually been achieved, what still separates those achievements from the
full conjecture, and what future evidence would change the assessment.
It does not replace the proof ledger, the status authority or the execution
plan. Revisit it when a major theorem, obstruction or representation is
established; ordinary incremental progress belongs in [WIP.md](../../WIP.md).

The target remains

\[
X\in GGC,\qquad q\ge1
\quad\stackrel{?}{\Longrightarrow}\quad X^q\in GGC.
\]

**[ASSESSMENT]** There are substantial partial theorems and concrete local
targets, but the full conjecture is not in its final technical stage.
The main missing ingredient is a positivity mechanism that can propagate
across support size, gamma shapes and the power exponent.

The latest results make that assessment more concrete: the completed
three-rate square theorem now has a four-rate balanced extension and
shape-open neighborhoods; integer peeling can be reused; and the
compensated power tangent is defined for every admissible finite Thorin
measure on a specified test domain. A sufficient local-closure theorem
need only cover the zero-drift, finite-Thorin-mass class. Confidence in
these particular mechanisms has increased. A complete solution from them
remains an unvalidated prospect: noninteger peeling, arbitrary-support
averaging and finite-time positive evolution are still substantive gaps.
These are qualitative judgments, not calibrated probabilities or claims
of mathematical novelty.

The assessment is conditional on the proofs and parameter ranges recorded
in the project. Sjödin's 2026 claim is not counted as an established
solution; see the [audit certificate](../../ResearchStatus.md#audit-certificate-for-the-2026-claimed-proof).

## 1. What the project has genuinely achieved

The existing results contain two different kinds of generality.

| Direction | Established project range | Limitation |
|---|---|---|
| Support size | q = 2 for every finite gamma convolution with total shape \(0<B\le1\) | the shape range is restricted |
| Shape parameters | q = 2 for two rates with arbitrary positive shapes | the support size is restricted |
| Three-rate geometry | q = 2 for at most three rates and every \(0<B\le2\), without coordinatewise shape restrictions | arbitrary support at B = 2 and unrestricted three-rate total shape remain open |
| Four-rate geometry | q = 2, B = 2 when the first two and last two ordered scales each carry total shape one; a relative shape-open neighborhood of every such interior vector | the neighborhood depends on the fixed scales; neither all unbalanced shapes nor arbitrary support is covered |
| Reusable extension | positive-integer peeling for every GGC input; integer prefixes before a proved uniform-in-rates residual family | fractional peeling is not covered; the rate ordering is essential |
| Nonquadratic powers | q = 3/2 for the two-half-gamma model in an open neighborhood of equal rates | neither arbitrary contrast nor arbitrary shapes are covered |

Proof entry points:
[WIP-5.26](../../ledger/10-route5-support-wide-closure-and-shape-propagation.md#wip-5-26),
[WIP-5.29](../../ledger/10-route5-support-wide-closure-and-shape-propagation.md#wip-5-29),
[WIP-5.30](../../ledger/11-route5-two-rate-arbitrary-shapes.md#wip-5-30),
[WIP-5.37](../../ledger/12-route5-three-rate-reductions-and-anchors.md#wip-5-37),
[WIP-5.44](../../ledger/14-averaged-phase-compensation.md#wip-5-44),
[WIP-5.45](../../ledger/18-four-rate-balanced-phase.md#wip-5-45),
[WIP-5.48](../../ledger/18-four-rate-balanced-phase.md#wip-5-48),
[WIP-7.1--7.4](../../ledger/17-exponential-peeling-closure.md), and
[WIP-1.17](../../ledger/02-route1-q-three-halves-wright-bessel.md#wip-1-17).

**[ASSESSMENT]** The support-wide total-shape-one theorem is especially
important: it demonstrates a real averaging/association mechanism, not
only a special-function formula for a low-dimensional example. The
arbitrary-shape two-rate Thorin representation is a complementary strength.
The positive-complement argument now extends the three-rate square across
all shapes of total at most two. The four-rate theorem handles arbitrary
scale contrast at balanced shapes, not only a coalescing-rate limit.
Integer-prefix closure adds arbitrary support families with restricted
shape order. The missing step is still
a framework combining unrestricted support and shapes and surviving beyond
the square.

The three-exponential square in WIP-5.34 has value as an explicit
representation; its GGC membership is also covered by the classical
PF-infinity power theorem. Such overlap should not be counted as
independent evidence for a new general mechanism.

## 2. Three distinct remaining distances

| Level | Remaining task | Assessment |
|---|---|---|
| A specific parameter family | four-rate B = 2 beyond the balanced neighborhoods; q = 3/2 all-contrast benchmark | the three-rate gap and a genuine four-rate subfamily are closed, not the full four-rate problem |
| A reusable mechanism | keep an appropriate positivity invariant when adding a gamma atom or changing shapes | the main creative obstruction |
| The full conjecture | control arbitrary finite support, arbitrary shapes and every real q > 1 | no general bridge established yet |

The final passage from arbitrary finite gamma convolutions to general
GGC laws is already understood through weak approximation and continuous
mapping, with drift and degeneracies accounted for. It is not the main
research bottleneck; see [WIP-0.1](../../ledger/00-foundations.md#wip-0-1).

The hard generalizations preceding that limit are not automatic:

- Shape-padding can increase support size and propagates only downward in
  total shape. A three-rate B = 2 theorem does not by itself yield a
  three-rate B < 2 theorem by padding:
  [WIP-5.40](../../ledger/14-averaged-phase-compensation.md#wip-5-40).
- Gamma duplication is special to the square. Even universal square
  closure gives only the exponents generated by repeated squaring, not
  powers approaching one.
- Adding a universal q = 3/2 theorem to universal square closure still
  does not produce exponents arbitrarily close to one by multiplication.
  A universal sequence of admissible exponents decreasing to one would
  suffice, but has not been constructed:
  [WIP-0.3](../../ledger/00-foundations.md#wip-0-3).

### What closed the former local gap

The old score-monotonicity invariant and even generic smooth
Bernstein-posterior order are false; these obstructions remain valid in
[WIP-5.42--5.43](../../ledger/14-averaged-phase-compensation.md).
Nevertheless, WIP-5.44 proves the actual compensation. In its notation,
\[
r_\infty d_c-n_c=C_H(1+\lambda)^{-m}H(\lambda),
\qquad H'<0<F',\quad C_H>0,
\]
while \(d_c=C_d(1+\lambda)^{-m}F\). Thus
\[
\rho_k=r_\infty-\frac{C_H}{C_d}\frac{Z_H}{Z_F}.
\]
The derivative of \(\log(Z_H/Z_F)\) is a sum of a nonnegative
two-posterior covariance and two strictly positive terms. This gives
the full-interval sign, not merely an endpoint or numerical check.
The identity has both a beta-ODE proof and an independent
[Gauss-connection check](https://dlmf.nist.gov/15.8.E2), with normalization
and parameter restrictions in
[WIP-5.44](../../ledger/14-averaged-phase-compensation.md#wip-5-44).

**[ASSESSMENT]** This is evidence for looking for a positive complement
before estimating an adverse covariance. It is not yet a support-wide
invariant. With more nodes the conditioned physical velocity and the
extra internal Dirichlet averages must be rederived; the three-rate
scalar comparison cannot simply be copied.

The auxiliary theorem proved in this step has \(1<B<2\). The completed
original-square range \(0<B\le2\) also uses the existing low-shape
and B = 2 theorems. Neither that combination nor integer peeling gives
an arbitrary-support B = 2 theorem.

### What the four-rate extension changes

For independent unit-rate gammas and ordered positive scales, the proved
new family is
\[
X=\sum_{i=1}^4 r_iG_{\beta_i},\qquad
0<r_1<r_2<r_3<r_4,\qquad
\beta_1+\beta_2=\beta_3+\beta_4=1.
\]
The proof controls both exterior cuts and makes the middle-cut Cauchy
derivative a positive real number. After normalizing away the knot
singularities, that sign has a strict compact-interval margin. This gives
a shape-open neighborhood at every fixed scale configuration, including
unbalanced vectors on both sides of the balanced hyperplane:
[WIP-5.45 and WIP-5.48](../../ledger/18-four-rate-balanced-phase.md).
No uniform neighborhood over scale contrasts is claimed.

When all four shapes are below one, the remaining auxiliary-GGC question
reduces exactly to the sign of one explicitly defined quantity at its
unique minimum, \(\mathcal H(x_*)\ge0\):
[WIP-5.46](../../ledger/18-four-rate-balanced-phase.md#wip-5-46).
This is a useful scalar proof target, not a proved sign outside the
established neighborhoods. Shapes at or above one require additional
analysis. Even a negative auxiliary minimum would not by itself refute
the original-square conjecture.

The four-half-gamma example also satisfies
\(M^2\notin HM_1\) but \(G_1M^2\in GGC\):
[WIP-5.47](../../ledger/18-four-rate-balanced-phase.md#wip-5-47).
Thus this benchmark favors direct averaged-phase analysis over requiring
HM1 of the residual factor. The density formula is known literature;
the ledger separates its exact source from the project's deductions.

## 3. What the new frameworks do and do not contribute

Several programs make the unknown positivity more accessible without
yet proving it. They must not be counted as independent pieces of evidence
that the conjecture is almost solved.

| Program | Current logical position | Missing mathematical content |
|---|---|---|
| P2: fractional gamma peeling | arbitrary-GGC-input integer closure and an ordered prefix bootstrap are proved | a noninteger closure invariant, not HCM density preservation |
| P3: tilted Hausdorff / Loewner criteria | exact global recognition, avoiding zero-point moment-determinacy issues | all-order positive integrals or a Gram representation derived from the input parameters |
| P4: exact residual as a matched Dirichlet mean | the finite-mass recognition framework reformulates the powered-law problem | an exact directing-law construction for N, not only for \(S_\rho N\) |
| P5: continuous powers | finite-matrix strict tangents, a realizing finite-atom Thorin curve, a weak operator for general finite Thorin measures, and the sufficient finite-mass local verification domain are proved | finite-time positive evolution with admissibility and identification, or all-matrix remainder control sufficient for genuine local closure |

Precise interfaces:
[WIP-6.2--6.5](../../ledger/15-global-criteria-and-power-flow.md),
[WIP-6.6--6.10](../../ledger/16-power-flow-loewner-tangent.md),
[WIP-6.11--6.15](../../ledger/19-finite-thorin-compensated-power-tangent.md),
[WIP-7.1--7.6](../../ledger/17-exponential-peeling-closure.md),
[WIP-1.4](../../ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-4),
[James identities and the residual gap](../../notes/james-dirichlet-means-stable-scaling.md),
and [Sokal's criterion](../../notes/sokal-stieltjes-hausdorff-criterion.md).

In particular, calling the required theorem a "closure lemma" or a "local
lemma" does not make it a small residual task. Its universal form can
already contain essentially the whole original problem.

### A concrete reason continuity near q = 1 is insufficient

**[DERIVED OBSERVATION BP-O1; elementary finite-rank calculation].**
Let X have n distinct positive rates and positive gamma shapes. At q = 1,

\[
g_1(s)=\sum_{\ell=1}^n\frac{\beta_\ell}{s+b_\ell}.
\]

For distinct \(s_1,\ldots,s_m>0\), its Loewner matrix, with diagonal
\(-g_1'(s_i)\), is

\[
K_1=\sum_{\ell=1}^n\beta_\ell v_\ell v_\ell^{\mathsf T},
\qquad
(v_\ell)_i=\frac1{s_i+b_\ell}.
\]

Indeed, subtracting two summands of g_1 and dividing by \(s_j-s_i\)
gives \(1/((s_i+b_\ell)(s_j+b_\ell))\); the derivative gives the same
formula on the diagonal. Hence \(\operatorname{rank}K_1\le n\), and for
m > n there are nonzero null directions.

The Loewner recognition theorem is Bondesson (1992), Theorem 3.4.2,
printed pp. 45--46, audited in the
[foundational note](../../notes/bondesson-1992-ggc-hcm-foundational-infrastructure.md)
and specialized in
[WIP-6.3](../../ledger/15-global-criteria-and-power-flow.md#wip-6-3).

**[ASSESSMENT, UPDATED]** The finite-rank observation is still correct,
but the tangent question is no longer merely open. WIP-6.7 proves that
every nonzero initial null direction has a strictly positive right
derivative. A Schur-complement argument then gives a positive-definite
right neighborhood for each fixed finite matrix. What is missing is a
common neighborhood over every matrix size and node set, not a first-order
sign calculation for a fixed matrix.

### A positive tangent can still miss the actual flow

WIP-6.9 expresses the normalized tangent as a nonnegative jump kernel plus
its compensating drift. WIP-6.10 constructs genuine finite positive Thorin
measures realizing that compensated weak functional, with an explicit
error tending to zero on bounded smooth tests. Its resolvent action
matches the power-transform tangent on compact positive Laplace arguments;
no weak derivative of a putative actual Thorin measure is assumed.
This is stronger than isolated positive minors.

It also gives a precise warning. The constructed curve retains a positive
lower bound on Thorin rates, so its GGC laws have positive exponential
moments. In contrast, for a finite gamma convolution and any q > 1,
\[
\mathbb E e^{\varepsilon X^q}=\infty\qquad(\varepsilon>0).
\]
If that power is GGC, its Thorin measure must consequently put mass below
every positive cutoff; see
[WIP-6.8](../../ledger/16-power-flow-loewner-tangent.md#wip-6-8).
Therefore the realizing curve is demonstrably not the actual power flow,
despite having the same first-order transform data.

**[ASSESSMENT]** P5 now has a concrete candidate mechanism and deserves
more effort. Its key obstacle has shifted to controlling and identifying
an evolution on a domain admitting rates approaching zero and infinity.
A positive minimum property alone is not a proof of existence,
convergence, uniqueness or power-flow closure.

### The correct local verification domain is now identified

Let \(\mathcal T_{\mathrm{fin}}^0\) denote zero-drift GGC laws with
positive finite Thorin mass and the usual Thorin integrability condition.
[WIP-6.14](../../ledger/19-finite-thorin-compensated-power-tangent.md#wip-6-14)
proves the conditional statement
\[
X\in\mathcal T_{\mathrm{fin}}^0,\quad |U_X|=B,\quad
q>1,\quad X^q\in GGC
\quad\Longrightarrow\quad
X^q\in\mathcal T_{\mathrm{fin}}^0,\quad |U_{X^q}|=B/q.
\]
Consequently the following local hypothesis is equivalent to the full
conjecture, by closedness, continuation and finite-gamma approximation:
\[
\forall Z\in\mathcal T_{\mathrm{fin}}^0\quad
\exists\varepsilon_Z>0\quad
Z^r\in GGC\quad(1\le r<1+\varepsilon_Z).
\]
The proof is in
[WIP-6.15](../../ledger/19-finite-thorin-compensated-power-tangent.md#wip-6-15).
No uniform lower bound on \(\varepsilon_Z\) is required. The quantifier
must nevertheless include non-atomic Thorin measures and rates approaching
zero or infinity; a theorem only for finite atoms or compact support is
insufficient.

[WIP-6.11--6.13](../../ledger/19-finite-thorin-compensated-power-tangent.md)
now define the compensated positive-jump functional throughout this
finite-mass domain. This removes a genuine restriction of the earlier
finite-atom calculation. Its action is rigorously controlled on compactly
supported smooth tests and resolvents of each fixed order, not on all
bounded smooth tests with unrestricted rate support.

**[ASSESSMENT]** The remaining P5 obstruction is now more sharply located:
construct and control a positive-time evolution, retain Thorin
integrability and tightness under iteration, and identify its transforms
with the actual powered law. The conditional mass formula does not
construct the output measure; the local-to-global equivalence does not
prove its local hypothesis. This is a structural research problem, not
merely a missing interchange of limits.

## 4. Present outlook

| Question | Qualitative assessment | Reason |
|---|---|---|
| Can current work produce more substantial partial results? | cautious optimism | exact transforms, boundary analysis, Wronskians and effective averaging arguments are already available |
| Is there a plausible path to a reusable general mechanism? | more concrete, but still unvalidated in the required generality | integer peeling iterates, direct phase positivity extends to a four-rate family, and the compensated tangent now covers the sufficient finite-mass local domain |
| Is the full conjecture close to completion with currently verified mechanisms? | not supported by present evidence | support, shape and exponent generality are not yet unified |

No completion percentage or calibrated success probability is assigned.
Confidence that a conjecture is true, confidence in a particular method,
and confidence in obtaining a proof with present tools are different
judgments.

The excluded global mixing log-concavity condition, residual HM shortcuts
and pointwise kernels concern stronger sufficient methods. Some fail even
in known GGC examples. They lower confidence in those methods, not supply
counterexamples to the original conjecture.

A genuine negative result would need a strict failure of a necessary
condition for the original \(Y=X^q\), such as a negative Hausdorff
difference or Loewner principal minor proved exactly. Failure of the
auxiliary \(G_{B/2}M^2\) alone does not suffice: its GGC property is a
sufficient route to the original square, without a proved converse.

## 5. Milestones that would materially change the assessment

1. **Reusable noninteger-shape closure.** A fractional peeling theorem
   whose output returns to the required input class, allowing repeated
   updates rather than only one two-dimensional calculation.
2. **Arbitrary finite support at total shape B = 2 for q = 2.** This would
   move the support-wide mechanism beyond B = 1 and, by padding, cover
   every B <= 2. Arbitrary total shape and real powers would still remain.
3. **A directly constructed positive measure or kernel.** Examples include
   a parameter-uniform Loewner Gram representation or a positive Thorin
   evolution with existence, admissibility and continuation justified.
   Positivity must be obtained from the input, not assumed by naming the
   candidate output a Thorin measure. The tangent construction is an
   advance toward this milestone, but its current noniterable version
   does not attain finite-time closure.

Another fixed-support, fixed-exponent theorem is valuable, but need not
establish one of these structural milestones. Each new result should be
assessed both for its parameter range and for what can be reused next.

## 6. Working policy and revision triggers

Maintain two complementary fronts:

- use the completed three-rate complement and four-rate balanced theorem
  to attack the unbalanced minimum and support-wide positivity, while
  continuing the q = 3/2 benchmark;
- prioritize the compensated power evolution alongside fractional
  peeling, global positive kernels and matched representations, seeking
  a structure that remains valid after each update.

The precise ordering and open propositions remain in
[CurrentGoal.md](../../CurrentGoal.md); all justified approaches remain eligible.
After a major result, update [WIP.md](../../WIP.md) and its linked proof first,
then reconsider the relevant assessment here. In particular ask:

1. Did a proved parameter range expand, or was only an equivalent
   recognition criterion added?
2. Can the new invariant be applied again after one update?
3. Does it cover support, shape or exponent variation previously excluded?
4. Is a negative result about the original law or only a stronger auxiliary
   construction?

**Bottom line:** the verified parameter range has grown, and the
continuous-power route now has both a general finite-mass tangent and a
precise sufficient local domain. A unifying positivity principle at
positive time and at the full conjecture's scope is still missing.
Progress toward that principle, rather than the number of formulas or
passed finite tests, should govern future confidence.
