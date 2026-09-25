import GGC.Thorin.Realization

/-!
# Bondesson interfaces: locally proved realization and approximation

The realization and finite-atomic approximation interfaces are locally proved
from the independent Thorin construction. E-B2's unused representability-closure
assumption was removed together with its two optional characterization consumers.
The lower construction imports neither this facade nor any external mathematical input.

The contracts below deliberately repeat their primitive measure, integrability,
and Laplace-transform formulas. Their meaning can therefore be audited without
trusting an opaque predicate or a project structure. The measure on positive
rates need not have finite total mass. `Integrable` at parameter one is the
Thorin admissibility condition. `GGC.Thorin` proves its endpoint equivalence and
integrability at every nonnegative Laplace parameter without new axioms.

Source: L. Bondesson, *Generalized Gamma Convolutions and Related Classes of
Distributions and Densities*, Lecture Notes in Statistics 76, Springer, 1992,
DOI 10.1007/978-1-4612-2948-3. Page numbers below are printed page numbers;
the retained `literature/pdf/Bondesson.pdf` has the corresponding pages 38, 43, 44.
See `External/README.md` and `notes/log-rate-power-proof-primary-interfaces.md`
for provenance, scope, and the remaining local obligations.

E-B1 and E-B3 below are Lean theorems with the original primitive types and
source provenance. This module declares no mathematical axiom. Neither theorem
states power closure or the project's finite-gamma power theorem.
-/

open MeasureTheory Filter Topology
open scoped BigOperators

namespace GGC

/-- **E-B1 — realization of Thorin-admissible data.**

Source: Bondesson (1992), Section 3.1, p. 29 and pp. 34–35.
Status: locally proved primitive interface for the Thorin representation.

Inputs are a nonnegative drift and a measure on strictly positive rates with
integrable `log (1 + 1 / b)`. The output is a nonnegative probability law with
the stated Laplace transform. Zero Thorin mass, nonzero drift, and infinite
Thorin mass are permitted. No support bounded away from zero is required.

Consumers: `GGC.exists_law_thorinLaplace`, `GGC.existsUnique_law_thorinLaplace`,
and the value-law construction. The independent lower proof uses one explicit
finite-gamma sequence, moment-free tightness and narrow subsequence extraction.
Its transitive dependencies contain only the standard logical axioms.
-/
theorem thorin_realization
    (a : ℝ) (ha : 0 ≤ a)
    (U : Measure {b : ℝ // 0 < b})
    (hU : Integrable (fun b => Real.log (1 + 1 / b.val)) U) :
    ∃ μ : ProbabilityMeasure ℝ,
      (∀ᵐ x ∂(μ : Measure ℝ), 0 ≤ x) ∧
      ∀ s : ℝ, 0 < s →
        (∫ x : ℝ, Real.exp (-s * x) ∂(μ : Measure ℝ)) =
          Real.exp (-a * s -
            ∫ b : {b : ℝ // 0 < b}, Real.log (1 + s / b.val) ∂U) := by
  exact GGC.thorin_realization_core ⟨a, ha, U, hU⟩

/-- **E-B3 — zero-drift finite-atomic Thorin approximation.**

Source: Bondesson (1992), final paragraph of p. 35, together with the
representation in Section 3.1. Status: locally proved Laplace-transform
interface for the finite-gamma approximation theorem.

The target can have drift or infinite Thorin mass. Each approximant has a
zero-drift transform with finitely many strictly positive shapes and rates.
The finite index size may be zero, representing the empty convolution / law
concentrated at zero. There is no uniform moment hypothesis on the sequence.

Consumer: `GGC.HasThorinRepresentation.isGGC`. The approximants are constructed
as actual independent finite gamma sums. Their common Laplace lower bound gives
tightness, and local Laplace uniqueness identifies the supplied target law.
The proof uses only standard logical axioms. Finite-input power closure is a
separate result and is not supplied by this declaration.
-/
theorem finite_atomic_approximation
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
  exact GGC.finite_atomic_approximation_core ⟨μ, hμ⟩ ⟨a, ha, U, hU⟩ hLaplace

end GGC
