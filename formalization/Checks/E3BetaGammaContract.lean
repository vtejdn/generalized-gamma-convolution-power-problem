import GGC.Foundations.BetaGamma

/-!
# E3.0 primitive contract check

Created by: constructor. Maintenance: shared designer-constructor.
Target: Blueprint Section 20.1 / E3.0 / API-068. Status: active.
This is not an independent-reviewer-owned artifact. The designer independently
reran and inspected it; evidence is in ConstructionReport Section 39.

The type below is the primitive contract from Blueprint Section 20.1. This
check uses the production theorem, without importing a literature input.
It checks type compatibility and prints axioms; the axiom output must be
reviewed against the allowed set. It does not replace semantic review or a
full project audit. Run from `formalization` with the pinned toolchain:
`lake env lean Checks/E3BetaGammaContract.lean`.
Governance: Checks/README.md. This file is outside the default production globs.
-/

open MeasureTheory ProbabilityTheory

example (a b : ℝ) (ha : 0 < a) (hb : 0 < b) :
    Measure.map
      (fun p : ℝ × ℝ => (p.1 / (p.1 + p.2), p.1 + p.2))
      ((gammaMeasure a 1).prod (gammaMeasure b 1)) =
      (betaMeasure a b).prod (gammaMeasure (a + b) 1) :=
  GGC.BetaGamma.gamma_ratio_sum_map a b ha hb

#print axioms GGC.BetaGamma.gamma_ratio_sum_map
