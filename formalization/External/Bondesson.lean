import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure

/-!
# Registered Bondesson inputs

This file contains the only external mathematical axioms currently introduced by
this project. It imports mathlib only. In particular it does not import `main`,
the project's GGC predicate, or any project deduction.

The contracts below deliberately repeat their primitive measure, integrability,
and Laplace-transform formulas. Their meaning can therefore be audited without
trusting an opaque predicate or a project structure. The measure on positive
rates need not have finite total mass. `Integrable` at parameter one is the
Thorin admissibility condition; the local implication to integrability at every
positive Laplace parameter must be proved before manipulating those integrals.

Source: L. Bondesson, *Generalized Gamma Convolutions and Related Classes of
Distributions and Densities*, Lecture Notes in Statistics 76, Springer, 1992,
DOI 10.1007/978-1-4612-2948-3. Page numbers below are printed page numbers;
the retained `literature/Bondesson.pdf` has the corresponding pages 38, 43, 44.
See `External/README.md` and `notes/log-rate-power-proof-primary-interfaces.md`
for provenance, scope, and the remaining local obligations.

These are literature assumptions, not Lean proofs of their mathematical
statements. None states power closure or the project's finite-gamma theorem.
-/

open MeasureTheory Filter Topology
open scoped BigOperators

namespace GGC.External.Bondesson

/-- **E-B1 — realization of Thorin-admissible data.**

Source: Bondesson (1992), Section 3.1, p. 29 and pp. 34–35.
Status: source-derived primitive interface for the Thorin representation.

Inputs are a nonnegative drift and a measure on strictly positive rates with
integrable `log (1 + 1 / b)`. The output is a nonnegative probability law with
the stated Laplace transform. Zero Thorin mass, nonzero drift, and infinite
Thorin mass are permitted. No support bounded away from zero is required.

Consumers: future Thorin realization and value-law construction (Blueprint
M0/M1 and M6). Local obligations include the equivalence with the classical
Thorin integrability conditions, integrability at all positive parameters,
uniqueness via Laplace transforms, and any regularity in varying data.
-/
axiom thorin_realization
    (a : ℝ) (ha : 0 ≤ a)
    (U : Measure {b : ℝ // 0 < b})
    (hU : Integrable (fun b => Real.log (1 + 1 / b.1)) U) :
    ∃ μ : ProbabilityMeasure ℝ,
      (∀ᵐ x ∂(μ : Measure ℝ), 0 ≤ x) ∧
      ∀ s : ℝ, 0 < s →
        (∫ x : ℝ, Real.exp (-s * x) ∂(μ : Measure ℝ)) =
          Real.exp (-a * s -
            ∫ b : {b : ℝ // 0 < b}, Real.log (1 + s / b.1) ∂U)

/-- **E-B2 — weak closure at a nondefective probability limit.**

Source: Bondesson (1992), Theorem 3.1.5, p. 34.
Status: source-derived interface using the Thorin representation of GGC laws.

Every approximating law is a nonnegative probability law with an admissible
Thorin representation. The limit is already a `ProbabilityMeasure ℝ`, and
`Tendsto` uses mathlib's weak topology on that type. The conclusion is
nonnegative concentration together with another admissible representation.
The converse canonical-measure conclusion from the source is not assumed.

Consumers: final weak-approximation reduction (Blueprint M1 and M7).
Local obligations include constructing the limit, proving it is the actual
power pushforward, and translating this primitive contract to `IsGGC`.
A defective pointwise limit of Laplace transforms does not meet the inputs.
-/
axiom weak_closure
    (μs : ℕ → ProbabilityMeasure ℝ) (μ : ProbabilityMeasure ℝ)
    (hμs : ∀ n : ℕ,
      (∀ᵐ x ∂(μs n : Measure ℝ), 0 ≤ x) ∧
      ∃ a : ℝ, 0 ≤ a ∧
        ∃ U : Measure {b : ℝ // 0 < b},
          Integrable (fun b => Real.log (1 + 1 / b.1)) U ∧
          ∀ s : ℝ, 0 < s →
            (∫ x : ℝ, Real.exp (-s * x) ∂(μs n : Measure ℝ)) =
              Real.exp (-a * s -
                ∫ b : {b : ℝ // 0 < b}, Real.log (1 + s / b.1) ∂U))
    (hlim : Tendsto μs atTop (𝓝 μ)) :
    (∀ᵐ x ∂(μ : Measure ℝ), 0 ≤ x) ∧
    ∃ a : ℝ, 0 ≤ a ∧
      ∃ U : Measure {b : ℝ // 0 < b},
        Integrable (fun b => Real.log (1 + 1 / b.1)) U ∧
        ∀ s : ℝ, 0 < s →
          (∫ x : ℝ, Real.exp (-s * x) ∂(μ : Measure ℝ)) =
            Real.exp (-a * s -
              ∫ b : {b : ℝ // 0 < b}, Real.log (1 + s / b.1) ∂U)

/-- **E-B3 — zero-drift finite-atomic Thorin approximation.**

Source: Bondesson (1992), final paragraph of p. 35, together with the
representation in Section 3.1. Status: source-derived Laplace-transform
interface for the finite-gamma approximation theorem.

The target can have drift or infinite Thorin mass. Each approximant has a
zero-drift transform with finitely many strictly positive shapes and rates.
The finite index size may be zero, representing the empty convolution / law
concentrated at zero. There is no uniform moment hypothesis on the sequence.

Consumers: finite-input reduction (Blueprint M1 and M7). Local obligations
include constructing the finite atomic Thorin measure from the displayed
sum, identifying this transform with the distribution of a sum of independent
gamma variables, proving power closure for those finite inputs, and proving
continuity of the fixed power pushforward. In particular this declaration
does not assume the finite-input power theorem. The actual gamma-sum API has
not yet been implemented; this declaration specifies only its transform.
-/
axiom finite_atomic_approximation
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
                  (α i).1 * Real.log (1 + s / (β i).1)))

end GGC.External.Bondesson
