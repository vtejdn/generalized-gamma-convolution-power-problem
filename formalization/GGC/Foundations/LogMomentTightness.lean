import Mathlib.MeasureTheory.Measure.Prokhorov
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic

/-! # Tightness of nonnegative value laws from a common logarithmic moment -/

noncomputable section
open MeasureTheory Set Filter
open scoped ENNReal
namespace GGC.Analysis

theorem isTightMeasureSet_of_nonnegative_logMoment_bound
    {S : Set (ProbabilityMeasure ℝ)} {C : ℝ} (hC : 0 ≤ C)
    (hn : ∀ μ ∈ S, ∀ᵐ x ∂(μ : Measure ℝ), 0 ≤ x)
    (hi : ∀ μ ∈ S, Integrable Real.log (μ : Measure ℝ))
    (hb : ∀ μ ∈ S, (∫ x, |Real.log x| ∂(μ : Measure ℝ)) ≤ C) :
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
  refine ⟨Icc 0 (Real.exp R), isCompact_Icc, ?_⟩
  rintro _ ⟨μ, hμ, rfl⟩
  have hm : (μ : Measure ℝ) (Icc 0 (Real.exp R))ᶜ ≤
      (μ : Measure ℝ) {x | R ≤ |Real.log x|} := by
    apply measure_mono_ae
    filter_upwards [hn μ hμ] with x hx
    intro hc
    have hxR : Real.exp R < x := by
      by_contra h
      exact hc ⟨hx, le_of_not_gt h⟩
    have hl : R < Real.log x := by
      have hh := Real.log_lt_log (Real.exp_pos R) hxR
      simpa only [Real.log_exp] using hh
    exact hl.le.trans (le_abs_self _)
  have ht := ENNReal.toReal_mono (measure_ne_top _ _) hm
  have hmark := mul_meas_ge_le_integral_of_nonneg
    (μ := (μ : Measure ℝ)) (Eventually.of_forall fun x => abs_nonneg (Real.log x)) (hi μ hμ).abs R
  have hreal : (μ : Measure ℝ).real (Icc 0 (Real.exp R))ᶜ ≤ ε.toReal := by
    apply le_of_mul_le_mul_left (a := R) _ hR
    exact (mul_le_mul_of_nonneg_left ht hR.le).trans (hmark.trans ((hb μ hμ).trans hCR))
  exact (ENNReal.toReal_le_toReal (measure_ne_top _ _) htop).mp hreal

end GGC.Analysis
