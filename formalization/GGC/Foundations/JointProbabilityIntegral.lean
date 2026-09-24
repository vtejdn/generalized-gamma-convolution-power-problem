import GGC.Foundations.VaryingIntegral

/-! # Jointly continuous bounded tests against continuously varying laws -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Analysis

theorem continuous_integral_bounded_joint {X : Type*} [TopologicalSpace X] [SequentialSpace X]
    (μ : X → ProbabilityMeasure ℝ) (hμ : Continuous μ) {f : X → ℝ → ℝ}
    (hf : Continuous (Function.uncurry f)) {C : ℝ} (hb : ∀ p z, ‖f p z‖ ≤ C) :
    Continuous (fun p => ∫ z, f p z ∂(μ p : Measure ℝ)) := by
  have hsec (p : X) : Continuous (f p) := hf.comp (continuous_const.prodMk continuous_id)
  let g : X → C(ℝ,ℝ) := fun p => ⟨f p,hsec p⟩
  have hg : Continuous g := ContinuousMap.continuous_of_continuous_uncurry g hf
  rw [continuous_iff_seqContinuous]
  intro ps p hp
  apply tendsto_integral_of_narrow_locally_uniform (hμ.tendsto p |>.comp hp)
    (fun n => hsec (ps n)) (hsec p) (Eventually.of_forall fun n z => hb (ps n) z) (hb p)
  exact ContinuousMap.tendsto_iff_forall_isCompact_tendstoUniformlyOn.mp (hg.tendsto p |>.comp hp)

end GGC.Analysis
