import GGC.Identification.C1Evolution
import GGC.Foundations.LogTestCoordinates

/-! # The actual value-space weak equation for compact C¹ tests -/

noncomputable section
open MeasureTheory Set
namespace GGC.Identification

/-- This includes every C¹ test compactly supported inside `(0,∞)`. The
statement also permits compact tests on the ambient real line that vanish at zero. -/
theorem compact_value_time_equation
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T)
    {t : ℝ} (ht : t ∈ Icc 0 T) {H : ℝ → ℝ} (hH : ContDiff ℝ 1 H)
    (hs : HasCompactSupport H) (h0 : H 0 = 0) :
    (∫ x, H x ∂((valueAt w hT t).law : Measure ℝ)) -
      (∫ x, H x ∂((valueAt w hT 0).law : Measure ℝ)) =
      ∫ r in 0..t, ∫ x, x*Real.log x*deriv H x ∂((valueAt w hT r).law : Measure ℝ) := by
  let f : ℝ → ℝ := fun u => H (-Real.log u)
  have hf : ContDiff ℝ 1 f := Analysis.contDiff_comp_neg_log hH hs h0
  have he : expTest f = H := by
    funext x
    simp only [expTest, f, Real.log_exp, neg_neg]
  have hg : expGenerator f = fun x => x*Real.log x*deriv H x := by
    funext x
    rw [expGenerator_eq_mul_deriv hf, he]
  simpa only [he,hg] using C1_exp_time_equation w hT ht hf

end GGC.Identification
