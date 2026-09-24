# Research status: the GGC power problem

Mathematical assessment recorded: **2026-09-06**, through WIP-6.23.
This file is the current status record, not a second proof ledger.
The documentation cleanup preserves that assessment without a new
mathematical or literature audit.

## Target and current status

\[
X\in GGC,\qquad q\ge1
\quad\Longrightarrow\quad X^q\in GGC.
\tag{C1}
\]

Here \(X\) is a nonnegative GGC random variable, \(q\) is finite and real,
and \(X^q\) is its deterministic power. The final statement has no extra
restriction on drift, Thorin mass, support size, shapes or moments;
degenerate inputs are included.

**[PROVED IN PROJECT; INTERNAL MATHEMATICAL AUDIT COMPLETE].**
The evidence is the written
[assembly WIP-6.21](ledger/23-power-theorem-assembly-audit.md#wip-6-21)
and [completion audit WIP-6.23](ledger/25-mathematical-completion-audit.md#wip-6-23).
This does not assert external peer review, publication, Lean verification
or literature priority. A concrete mathematical objection must be assessed
and may require reopening a lemma and correcting this status.

**Primary formulation:** Lennart Bondesson, “A Class of Probability
Distributions that is Closed with Respect to Addition as Well as
Multiplication of Independent Random Variables,” *Journal of Theoretical
Probability* **28** (2015), 1063--1081, Conjecture 1, p. 1075,
DOI 10.1007/s10959-013-0523-y.
The [article](literature/Bondesson2015.pdf) states the target as a
conjecture; the [source audit](notes/bondesson-2015-product-closure-audit.md)
separates it from the proved independent-product theorem.

## Evidence and verification boundary

| Component | Record | Role |
|---|---|---|
| Finite-Thorin tangent and posterior construction | [WIP-6.11--6.15](ledger/19-finite-thorin-compensated-power-tangent.md) | current-law derivative, phase measurability and test domain |
| Log-rate generator and uniform bounds | [WIP-6.16--6.17](ledger/20-finite-thorin-positive-steps.md) | positive jump envelope and support-independent Lyapunov control |
| Continuity and positive finite-time evolution | [WIP-6.18--6.19](ledger/21-log-thorin-euler-evolution.md) | nonlinear limit passage and Euler existence |
| Identification with actual powers | [WIP-6.20](ledger/22-power-flow-identification.md#wip-6-20) | identifies the constructed law with \(X^{e^t}\) |
| Full-quantifier assembly | [WIP-6.21](ledger/23-power-theorem-assembly-audit.md#wip-6-21) | arbitrary finite time and weak approximation to every GGC law |
| Direct interface verification | [WIP-6.22](ledger/24-direct-log-generator-resolvent.md#wip-6-22) | absolute resolvent cancellation; not a second independent full proof |
| Consolidated internal audit | [WIP-6.23](ledger/25-mathematical-completion-audit.md#wip-6-23) | requirement-by-requirement verification of the preceding chain |

The classical inputs are the cited Bondesson, James, SSV and Sethuraman
results. Their checked versions, hypotheses and locators are recorded in
the [primary-interface audit](notes/log-rate-power-proof-primary-interfaces.md)
and [reference map](ledger/references.md).
The generator, quantitative Euler construction, dynamic identification
and assembly are project deductions, not conclusions attributed to those
sources or to the 2026 induction discussed below.

The [manuscript sources](manuscript/ggc-power-closure.tex) and
[bibliography](manuscript/references.bib) are written. The recorded handoff
included static checks, not TeX compilation.
As of 2026-09-24, the pinned Lean project contains the
[complete target definitions](formalization/Definitions.lean) and the genuine theorem
`GGC.ggc_rpow` in [the proof entry point](formalization/main.lean).
The original finite-gamma weak-limit definition is preserved; no moment,
drift or Thorin-mass restriction remains in the final type. The construction
uses proved Euler existence, dynamic identification and the weak-limit reduction.
Its actual dependencies include five [registered literature axioms](formalization/External/README.md):
E-J1–3, E-T1 and E-S1, in addition to Lean's standard logical axioms.
This is verification of the project derivation relative to those inputs,
with E-B1/E-B3 now proved locally; the remaining five inputs are still assumptions. Build and axiom-audit
evidence is recorded in the [construction report](formalization/ConstructionReport.md#e2-construction-2026-09-24);
independent design acceptance remains separate. This does not revise the
written mathematical assessment above or establish external peer review or priority.

## Independent results and separate questions

Earlier analytic results remain independently useful, even where (C1)
now subsumes their membership statements:

- The support-wide square theorem for finite gamma convolutions with total
  shape \(0<B\le2\):
  [WIP-5.49--5.50](ledger/18-four-rate-balanced-phase.md#wip-5-49).
- Arbitrary positive shapes at two rates:
  [WIP-5.30](ledger/11-route5-two-rate-arbitrary-shapes.md#wip-5-30).
- Integer-prefix peeling and residual-family bootstraps:
  [WIP-7.1--7.4](ledger/17-exponential-peeling-closure.md#wip-7-1).
- The small-contrast \(q=3/2\) benchmark:
  [WIP-1.17](ledger/02-route1-q-three-halves-wright-bessel.md#wip-1-17),
  nonconstructive in its contrast threshold.

These independent proofs are not missing inputs to the log-rate argument.
General noninteger gamma peeling, Bondesson's stronger integral
Conjecture 2, explicit Thorin formulas and matched PD/Dirichlet residual
representations remain separate questions; none is claimed merely from
(C1). The [historical blueprint](ledger/checkpoints/2026-09-06-route-blueprint.md)
preserves all seven routes without automatically restarting them.

The exact class implications and previously known power-closure results
are maintained in the [class-and-power note](notes/classes-and-power-closure.md)
and [Bondesson audit](notes/bondesson-2015-product-closure-audit.md).
In particular, independent-product closure does not identify \(X_1X_2\)
with \(X^2\), and HCM density is stronger than GGC membership.

## The 2026 external claim and preserved audit

**[CLAIM-2026]** Tord Sjödin, “The Power Problem for Generalized Gamma
Convolutions (GGC) and Related Questions,” *Journal of Theoretical Physics
& Mathematics Research* **4**(2) (2026), 1--7, Theorem 1,
DOI 10.64030/3065-8802.04.02.02, claims (C1) for \(q>1\).
The [locally retained published article](literature/the-power-problem-for-generalized-gamma-convolutions-ggc-and-related-questions.pdf)
is the version assessed.

**[AUDIT-2026-09-04]** The existing project audit concludes that its proof
is not valid as written because the induction uses a false Lemma 2.
The certificate below is retained unchanged from the pre-cleanup status
record; this maintenance pass makes no new assessment of that paper.
The project log-rate argument neither invokes nor repairs that induction.

## Audit certificate for the 2026 claimed proof

Sjödin's Lemma 2 (statement on the article's p. 3, proof on pp. 4--5) asserts
a complete-monotonicity property for a two-variable integral. Set its
parameters \(A=B=a>0\) and choose \(b_1\ne b_2\). The asserted conclusion
then implies that

\[
F(av)F(a/v)
\]

is completely monotone in \(v+v^{-1}\), where, up to normalization,

\[
F(z)=\int_0^1
e^{-z[b_1(1-r)+b_2r]}
(1-r)^{\beta_1-1}r^{\beta_2-1}\,dr.
\]

Thus \(F\) would be an HCM Laplace transform. The represented variable
\(b_1(1-U)+b_2U\), with
\(U\sim\operatorname{Beta}(\beta_2,\beta_1)\), is nondegenerate and bounded.
An HCM Laplace transform would make its law GGC, hence infinitely divisible;
but a nondegenerate infinitely divisible distribution cannot have bounded
support. This contradiction disproves Lemma 2 as stated.

The local error occurs in the \(\Delta<0\) case on p. 4: the substitution
\(y\mapsto y^{-1}\) is said to reduce the argument to the \(\Delta>0\) case,
but the required Bernstein-function dependence does not follow. A further
induction gap appears on p. 5: the representing measure for \(J_n\) depends
on the outer parameters \(A\) and \(B\), so inserting it into the remaining
integrals does not identify the integrand pointwise with the \(n-1\) case.

This is an analytic obstruction, not a numerical objection.

## History and revision policy

The complete earlier status narrative, parameter-slice history, recognition
targets and preliminary lemma/conjecture list are preserved in the
[pre-cleanup status checkpoint](ledger/checkpoints/2026-09-06-status-before-cleanup.md).
Use [WIP](WIP.md) for individual results, [ledger](ledger/README.md) for
proofs, [BigPicture](BigPicture.md) for strategic interpretation and
[CurrentGoal](CurrentGoal.md) for authorized next actions.

Older source notes or background files can contain superseded assessments.
Check the precise source and proof before reuse; this status file records
an assessment, not an authority that can override a counterargument.
A correction must identify the failed implication, its exact quantifiers,
the affected WIP entry and any downstream consequences.
