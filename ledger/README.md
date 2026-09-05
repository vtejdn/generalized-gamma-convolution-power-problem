# Project progress ledger

This directory contains the complete mathematical derivations formerly kept
in the monolithic `WIP.md`. The root [WIP index](../WIP.md) now supplies the
overall status and a stable, per-entry navigation table.

The governing research problem remains

\[
X\in GGC,\qquad q\ge1
\quad\stackrel{?}{\Longrightarrow}\quad
X^q\in GGC.
\]

There is currently no proof or counterexample to the full conjecture. Use
[ResearchStatus.md](../ResearchStatus.md) for the reliable mathematical
status and [CurrentGoal.md](../CurrentGoal.md) for the current execution
order. Historical checkpoints in this directory are snapshots, not status
authorities.

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

The final four Route-5 modules are thematic rather than numerically
contiguous. Stable WIP identifiers preserve provenance, while each file keeps
one proof mechanism together.

## Supporting records

- [references.md](references.md) preserves the theorem-level source map.
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
- The detailed modules retain all 852 original route-prefixed equation tags;
  together with `(C1)` in the root WIP index, the progress record has 853
  unique equation tags.
- Literature results, source audits, project derivations, open steps,
  refuted routes, and heuristics remain explicitly distinguished.
- Positional language such as “above” or “below” refers to the original
  numbered proof sequence. Cross-module claims should be cited by WIP ID.
- Numerical exploration is never promoted to proof; exact scripts certify
  only the finite identities stated in their corresponding entries.
