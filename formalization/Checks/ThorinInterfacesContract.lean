import GGC.Thorin.Interfaces

/-!
# Tidy-Thorin primitive contract checks

Created by: constructor. Maintenance: shared designer-constructor.
Target: Blueprint Section 21 / Tidy-Thorin / API-075. Status: active.
This is not an independent-reviewer-owned artifact. The designer independently
reran and inspected it; acceptance is recorded in ConstructionReport Section 42.
Construction evidence: Section 41 and API-075.

The complete primitive types were copied before migration. Each example uses
the relocated production theorem, then its axioms are printed for comparison
with the standard logical whitelist. This checks type compatibility, not a new
mathematical proof, semantic review, or independent design acceptance. Production
proofs live in GGC/Thorin/Interfaces.lean and GGC/Thorin/Realization.lean.

Run from `formalization` with pinned Lean 4.32.2 and the project mathlib revision:
`lake env lean Checks/ThorinInterfacesContract.lean`.
Governance: Checks/README.md. This file is outside the default production globs.
-/

open MeasureTheory Filter Topology
open scoped BigOperators

example
    (a : ℝ) (ha : 0 ≤ a)
    (U : Measure {b : ℝ // 0 < b})
    (hU : Integrable (fun b => Real.log (1 + 1 / b.val)) U) :
    ∃ μ : ProbabilityMeasure ℝ,
      (∀ᵐ x ∂(μ : Measure ℝ), 0 ≤ x) ∧
      ∀ s : ℝ, 0 < s →
        (∫ x : ℝ, Real.exp (-s * x) ∂(μ : Measure ℝ)) =
          Real.exp (-a * s -
            ∫ b : {b : ℝ // 0 < b}, Real.log (1 + s / b.val) ∂U) := by
  exact GGC.thorin_realization a ha U hU

#print axioms GGC.thorin_realization

example
    (μ : ProbabilityMeasure ℝ)
    (hμ : ∀ᵐ x ∂(μ : Measure ℝ), 0 ≤ x)
    (a : ℝ) (ha : 0 ≤ a)
    (U : Measure {b : ℝ // 0 < b})
    (hU : Integrable (fun b => Real.log (1 + 1 / b.1)) U)
    (hLaplace : ∀ s : ℝ, 0 < s →
      (∫ x : ℝ, Real.exp (-s * x) ∂(μ : Measure ℝ)) =
        Real.exp (-a * s -
          ∫ b : {b : ℝ // 0 < b}, Real.log (1 + s / b.1) ∂U)) :
    ∃ μs : ℕ → ProbabilityMeasure ℝ,
      Tendsto μs atTop (𝓝 μ) ∧
      ∀ n : ℕ,
        (∀ᵐ x ∂(μs n : Measure ℝ), 0 ≤ x) ∧
        ∃ k : ℕ,
          ∃ α β : Fin k → {b : ℝ // 0 < b},
            ∀ s : ℝ, 0 < s →
              (∫ x : ℝ, Real.exp (-s * x) ∂(μs n : Measure ℝ)) =
                Real.exp (-(∑ i : Fin k,
                  (α i).1 * Real.log (1 + s / (β i).1))) := by
  exact GGC.finite_atomic_approximation μ hμ a ha U hU hLaplace

#print axioms GGC.finite_atomic_approximation

