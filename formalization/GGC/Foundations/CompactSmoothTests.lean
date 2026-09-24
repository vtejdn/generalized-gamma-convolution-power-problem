import Mathlib.Analysis.Distribution.AEEqOfIntegralContDiff
import Mathlib.MeasureTheory.Measure.Decomposition.RadonNikodym
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.Topology.ContinuousMap.BoundedCompactlySupported

/-! # Compact C² tests determine finite real measures

The standard smooth-test separation theorem applies to functions against one
measure. Radon--Nikodym derivatives against the sum of two finite measures give
the needed adapter for probability laws, including singular and atomic laws.
-/

noncomputable section
open MeasureTheory Set Topology
namespace GGC.Analysis

theorem measure_eq_of_integral_compactC2_eq {μ ν : Measure ℝ}
    [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (h : ∀ φ : ℝ → ℝ, ContDiff ℝ 2 φ → HasCompactSupport φ →
      (∫ x, φ x ∂μ) = ∫ x, φ x ∂ν) : μ = ν := by
  let σ := μ+ν
  have hμ : μ ≪ σ := Measure.AbsolutelyContinuous.rfl.add_right ν
  have hν : ν ≪ σ := Measure.AbsolutelyContinuous.rfl.add_right' μ
  have hiμ : Integrable (fun x => (μ.rnDeriv σ x).toReal) σ := by
    simpa only [IntegrableOn, Measure.restrict_univ] using
      (Measure.integrableOn_toReal_rnDeriv (μ := μ) (ν := σ) (measure_ne_top μ univ))
  have hiν : Integrable (fun x => (ν.rnDeriv σ x).toReal) σ := by
    simpa only [IntegrableOn, Measure.restrict_univ] using
      (Measure.integrableOn_toReal_rnDeriv (μ := ν) (ν := σ) (measure_ne_top ν univ))
  have he : ∀ᵐ x ∂σ, (μ.rnDeriv σ x).toReal = (ν.rnDeriv σ x).toReal := by
    apply ae_eq_of_integral_contDiff_smul_eq hiμ.locallyIntegrable hiν.locallyIntegrable
    intro φ hφ hs
    simp only [smul_eq_mul, mul_comm (φ _)]
    rw [integral_toReal_rnDeriv_mul hμ, integral_toReal_rnDeriv_mul hν]
    exact h φ (contDiff_infty.mp hφ 2) hs
  apply ext_of_forall_integral_eq_of_IsFiniteMeasure
  intro f
  rw [← integral_toReal_rnDeriv_mul hμ, ← integral_toReal_rnDeriv_mul hν]
  exact integral_congr_ae (he.mono fun _ hx => congrArg (fun r => r * f _) hx)

abbrev CompactC2Test := {φ : ℝ → ℝ // ContDiff ℝ 2 φ ∧ HasCompactSupport φ}

def compactC2Integrals (F : ProbabilityMeasure ℝ) (φ : CompactC2Test) : ℝ :=
  ∫ y, φ.val y ∂(F : Measure ℝ)

theorem continuous_compactC2Integrals : Continuous compactC2Integrals := by
  apply continuous_pi
  intro φ
  exact ProbabilityMeasure.continuous_integral_boundedContinuousFunction
    (ofCompactSupport φ.val φ.property.1.continuous φ.property.2)

theorem compactC2Integrals_injective : Function.Injective compactC2Integrals := by
  intro F G h
  apply ProbabilityMeasure.toMeasure_injective
  apply measure_eq_of_integral_compactC2_eq
  intro φ hφ hs
  exact congrFun h ⟨φ, hφ, hs⟩

/-- On a compact family, all compact C² test integrals give exactly the narrow topology. -/
theorem isClosedEmbedding_compactC2Integrals {K : Set (ProbabilityMeasure ℝ)} (hK : IsCompact K) :
    IsClosedEmbedding (fun F : K => compactC2Integrals F.val) := by
  letI : CompactSpace K := isCompact_iff_compactSpace.mp hK
  apply (continuous_compactC2Integrals.comp continuous_subtype_val).isClosedEmbedding
  exact compactC2Integrals_injective.comp Subtype.val_injective

end GGC.Analysis
