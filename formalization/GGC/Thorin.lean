import GGC.Laplace

/-!
# Thorin representability, separate from GGC membership

The public `IsGGC` predicate is defined by finite-gamma weak limits in `main`.
This file preserves the former analytic predicate as `HasThorinRepresentation`.
The characterization linking the two predicates is M1 work, not an assumption
of the public main statement. No new external axiom is introduced here.
-/

noncomputable section
open MeasureTheory
namespace GGC

/-- The combined Thorin integrability condition at zero and infinity.
There is deliberately no assumption that `U` has finite total mass.
`Integrable` prevents the default value of a nonintegrable real integral
from being mistaken for a finiteness certificate. -/
def ThorinAdmissible (U : Measure PosReal) : Prop :=
  Integrable (fun b : PosReal => Real.log (1 + 1 / b.val)) U

/-- General Thorin data, including drift and possibly infinite Thorin mass.
The condition at s = 1 implies integrability of log (1 + s / b) for all s > 0;
that implication is an analysis lemma to establish when using the representation. -/
structure ThorinData where
  drift : ℝ
  drift_nonneg : 0 ≤ drift
  measure : Measure PosReal
  admissible : ThorinAdmissible measure

/-- The transform specified by Thorin data. All rates are strictly positive. -/
def thorinLaplace (d : ThorinData) (s : ℝ) : ℝ :=
  Real.exp (-d.drift * s -
    ∫ b : PosReal, Real.log (1 + s / b.val) ∂d.measure)

/-- Thorin representability, separate from the weak-limit definition of GGC.
Reference: Bondesson (1992), Section 3.1, printed p.29 and pp.34--35.
Realization of admissible data is a separate external theorem, not this definition.
Probability normalization already fixes the transform at s = 0 to one. -/
def HasThorinRepresentation (μ : NonnegLaw) : Prop :=
  ∃ d : ThorinData, ∀ s : ℝ, 0 < s → laplace μ s = thorinLaplace d s

/-- Constant laws have zero Thorin measure and drift a. -/
theorem hasThorinRepresentation_diracLaw (a : ℝ) (ha : 0 ≤ a) : HasThorinRepresentation (diracLaw a ha) := by
  refine ⟨⟨a, ha, 0, ?_⟩, ?_⟩
  · exact integrable_zero_measure
  · intro s _hs
    simp [laplace, diracLaw, thorinLaplace, mul_comm]

end GGC
