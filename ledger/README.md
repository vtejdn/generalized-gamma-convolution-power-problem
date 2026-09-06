# Project progress ledger

This directory contains the complete mathematical derivations formerly kept
in the monolithic `WIP.md`. The root [WIP index](../WIP.md) now supplies the
stable, per-entry navigation table; current status lives in
[ResearchStatus.md](../ResearchStatus.md).

The governing research problem remains

\[
X\in GGC,\qquad q\ge1
\quad\stackrel{?}{\Longrightarrow}\quad
X^q\in GGC.
\]

The assembled proof and internal audit are
[WIP-6.21](23-power-theorem-assembly-audit.md#wip-6-21) and
[WIP-6.23](25-mathematical-completion-audit.md#wip-6-23).
Use [ResearchStatus](../ResearchStatus.md) for the current assessment and
verification limits, and [CurrentGoal](../CurrentGoal.md) for authorized
work. The [manuscript](../manuscript/ggc-power-closure.tex) and
[Lean blueprint](../formalization/README.md) are separate artifacts;
historical checkpoints are not current status authorities.

## Mathematical organization

| Module | Stable entries | Mathematical content |
|---|---|---|
| [00 — Foundations](00-foundations.md) | WIP-0.1--0.3 | finite-gamma reduction, Dirichlet representations, universal exponent semigroup |
| [01 — Stable/Dirichlet and quadratic](01-route1-stable-dirichlet-and-quadratic.md) | WIP-1.1--1.13 | tilted stable factorization, Dirichlet-mean recognition, quadratic benchmark, Abel/Cauchy reductions |
| [02 — The \(q=3/2\) problem](02-route1-q-three-halves-wright-bessel.md) | WIP-1.14--1.19 | Wright--Bessel ray, exact Hankel gates, small contrast, residual obstruction, radial PDE |
| [03 — Thorin/Volterra](03-route2-thorin-volterra.md) | WIP-2.1--2.14 | boundary phase, Stieltjes recognition, Volterra and Stein kernels, contrast splices |
| [04 — Cumulant/Stieltjes](04-route3-cumulant-stieltjes.md) | WIP-3.1--3.10 | determinacy, cumulant recurrences, connected permutations, Jacobi and Hankel criteria |
| [05 — Averaged HCM](05-route4-averaged-hcm.md) | WIP-4.1--4.6 | averaged HCM identity, Bernstein and spectral inversions, Kontorovich--Lebedev analysis |
| [06 — Recursion and initial cones](06-route5-recursion-and-initial-cones.md) | WIP-5.1--5.7 | shape-matched Dirichlet update, reciprocal duality, total-shape-one kernel and initial cones |
| [07 — Two-rate, total shape one](07-route5-two-rate-total-shape-one.md) | WIP-5.8--5.11 | Beta--Faddeeva reduction, pairing cones, exact true-lobe theorem |
| [08 — Multirate first-cut geometry](08-route5-multirate-first-cut.md) | WIP-5.12--5.17 | first-cut pairing, weighted phase centering, critical polynomial, prefix interface |
| [09 — Multicut capacity](09-route5-multirate-capacity.md) | WIP-5.18--5.23 | zero-temperature capacity, adjacent-cut transport, lower/upper buffers |
| [10 — Support-wide closure](10-route5-support-wide-closure-and-shape-propagation.md) | WIP-5.25, 5.26, 5.29 | last/all-cut balance, finite total-shape-one theorem, downward shape propagation |
| [11 — Arbitrary-shape two-rate squares](11-route5-two-rate-arbitrary-shapes.md) | WIP-5.24, 5.27, 5.28, 5.30, 5.31 | fractional \(HM_k\) inversion, total shape two, complete two-rate theorem, pointwise obstruction |
| [12 — Three-rate reductions and anchors](12-route5-three-rate-reductions-and-anchors.md) | WIP-5.32--5.35, 5.37 | third-atom conditioning, Lauricella--Appell reduction, three-rate anchor theorems |
| [13 — Three-rate fractional Abel](13-route5-three-rate-fractional-abel.md) | WIP-5.36, 5.38, 5.39 | physical Appell curve, Abel-ratio gate, knot analysis, full-interval monotonicity |
| [14 — Averaged-phase compensation](14-averaged-phase-compensation.md) | WIP-5.40--5.44 | padding, reciprocal duality, posterior-order obstruction and positive-complement closure of the three-rate square |
| [15 — Global criteria and power flow](15-global-criteria-and-power-flow.md) | WIP-6.1--6.5 | log-concavity obstruction, fractional gamma peeling, tilted Hausdorff/Loewner criteria, continuous flow and conditional local-to-global continuation |
| [16 — Positive power-flow tangents](16-power-flow-loewner-tangent.md) | WIP-6.6--6.10 | all finite Loewner nullspaces, a singular support edge, compensated positive jumps and a realizing GGC curve |
| [17 — Integer peeling and bootstraps](17-exponential-peeling-closure.md) | WIP-7.1--7.6 | widened multiplication, integer operators/prefixes, new square families, small-shape reduction and HCM-output failure |
| [18 — Finite-cut conditional beta phases](18-four-rate-balanced-phase.md) | WIP-5.45--5.50 | four-rate geometry and the arbitrary-support square theorem for total shape at most two |
| [19 — General finite-Thorin tangents](19-finite-thorin-compensated-power-tangent.md) | WIP-6.11--6.15 | measurable phases, safe test domains, conditional mass and local verification domain |
| [20 — Log-rate generator](20-finite-thorin-positive-steps.md) | WIP-6.16--6.17 | Palm disintegration, universal Levy envelope and drift/Lyapunov bounds |
| [21 — Positive Euler evolution](21-log-thorin-euler-evolution.md) | WIP-6.18--6.19 | weak continuity, positive iteration, moment control, compactness and consistency |
| [22 — Actual-power identification](22-power-flow-identification.md) | WIP-6.20 | current-law equation, zero-endpoint control and explicit transport uniqueness |
| [23 — Full-theorem assembly and audit](23-power-theorem-assembly-audit.md) | WIP-6.21 | all finite-gamma inputs and all real powers, final GGC weak approximation and audit checklist |
| [24 — Direct log-generator verification](24-direct-log-generator-resolvent.md) | WIP-6.22 | absolute resolvent cancellation and posterior Palm control without the intermediate rate operator |
| [25 — Mathematical completion audit](25-mathematical-completion-audit.md) | WIP-6.23 | proof at the original quantifiers, requirement-level evidence and internal-review status; not a second independent theorem |

Modules 10--13 are thematic rather than numerically contiguous. Stable WIP
identifiers preserve provenance, while each file keeps one proof mechanism
together. Module 14 continues the phase/recursion family; the new WIP-6.x
family in modules 15--16 and WIP-7.x in module 17 are cross-route
infrastructure, not historical Routes 6 or 7. The P1--P7 priority labels and their correspondence are preserved in the
[historical route blueprint](checkpoints/2026-09-06-route-blueprint.md);
[CurrentGoal](../CurrentGoal.md) now records current work rather than
repeating that history.

## Supporting records

- [2026-09-06 migration record](checkpoints/2026-09-06-background-migration.md)
  maps retained SD-era material into the GGC project and records the
  completed user-authorized removal of the old directory and three links.
- [Pre-cleanup route blueprint](checkpoints/2026-09-06-route-blueprint.md)
  preserves all seven programs, rankings, attempts and exclusions.
- [Pre-cleanup status/history](checkpoints/2026-09-06-status-before-cleanup.md)
  preserves the earlier long status record and preliminary lemma list.
  Both are dated 2026-09-06 and tied to `snapshot-2026-09-06-pre-cleanup`.
- [references.md](references.md) preserves the theorem-level source map.
- [pre-log-rate assessment](checkpoints/2026-09-05-before-log-rate-evolution.md)
  preserves the strategic judgment before the finite-time mechanism was
  constructed; it is not current status.
- [checkpoints/2026-09-05-pass-20.md](checkpoints/2026-09-05-pass-20.md)
  preserves the twentieth execution-pass snapshot and its then-current next
  actions.
- [computations/](../computations/) contains exact-arithmetic certificates
  cited by individual entries.

## Ledger conventions

- Every progress entry retains its original `WIP-x.y` identifier and status
  label.
- Every entry has an explicit stable anchor, for example
  `<a id="wip-5-30"></a>`; links do not depend on generated heading slugs.
- Modules 00--13 retain the original 852 route-prefixed equation tags.
  New modules use fresh tags without renumbering historical equations;
  the root WIP index retains its `(C1)` target.
- Literature results, source audits, project derivations, open steps,
  refuted routes, and heuristics remain explicitly distinguished.
- Positional language such as “above” or “below” refers to the original
  numbered proof sequence. Cross-module claims should be cited by WIP ID.
- Numerical exploration is never promoted to proof; exact scripts certify
  only the finite identities stated in their corresponding entries.
