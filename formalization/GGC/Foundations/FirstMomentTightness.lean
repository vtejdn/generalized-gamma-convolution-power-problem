import Mathlib.MeasureTheory.Measure.Prokhorov
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Tactic

/-! # Tightness of real laws with uniformly bounded first absolute moments -/

noncomputable section
open MeasureTheory Set Filter
open scoped ENNReal
namespace GGC.Analysis

theorem isTightMeasureSet_of_firstMoment_bound {S : Set (ProbabilityMeasure ℝ)} {C : ℝ}
    (hC : 0 ≤ C) (hi : ∀ μ ∈ S, Integrable (fun x : ℝ => x) (μ : Measure ℝ))
    (hb : ∀ μ ∈ S, (∫ x : ℝ, |x| ∂(μ : Measure ℝ)) ≤ C) :
    IsTightMeasureSet {((μ : ProbabilityMeasure ℝ) : Measure ℝ) | μ ∈ S} := by
  rw [isTightMeasureSet_iff_exists_isCompact_measure_compl_le]
  intro ε hε
  by_cases htop : ε = ∞
  · subst ε
    exact ⟨∅, isCompact_empty, fun _ _ => le_top⟩
  have hδ : 0 < ε.toReal := ENNReal.toReal_pos (ne_of_gt hε) htop
  let R := C/ε.toReal+1
  have hR : 0 < R := by dsimp [R]; positivity
  have hCR : C ≤ R*ε.toReal := by
    dsimp [R]
    have hh : (C/ε.toReal)*ε.toReal = C := div_mul_cancel₀ C hδ.ne'
    nlinarith
  refine ⟨Icc (-R) R, isCompact_Icc, ?_⟩
  rintro _ ⟨μ, hμ, rfl⟩
  have ht : (μ : Measure ℝ).real (Icc (-R) R)ᶜ ≤ (μ : Measure ℝ).real {x : ℝ | R ≤ |x|} := by
    refine measureReal_mono ?_ (measure_ne_top _ _)
    intro x hx
    by_contra h
    have ha : |x| < R := lt_of_not_ge h
    exact hx ⟨(abs_lt.mp ha).1.le, (abs_lt.mp ha).2.le⟩
  have hm := mul_meas_ge_le_integral_of_nonneg
    (μ := (μ : Measure ℝ)) (Eventually.of_forall fun x : ℝ => abs_nonneg x) (hi μ hμ).abs R
  have hreal : (μ : Measure ℝ).real (Icc (-R) R)ᶜ ≤ ε.toReal := by
    apply le_of_mul_le_mul_left (a := R) _ hR
    exact (mul_le_mul_of_nonneg_left ht hR.le).trans (hm.trans ((hb μ hμ).trans hCR))
  exact (ENNReal.toReal_le_toReal (measure_ne_top _ _) htop).mp hreal

end GGC.Analysis
