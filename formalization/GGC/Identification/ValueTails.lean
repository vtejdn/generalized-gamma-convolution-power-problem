import GGC.Identification.ValuePositivity
import GGC.LaplaceTightness
import GGC.Foundations.TailMoments
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals

/-! # Lower and upper logarithmic value tails from the Laplace transform -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Identification
open GGC.Analysis

theorem measureReal_negLog_tail_le (μ : NonnegLaw) (hμ : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x)
    {r : ℝ} (hr : 0 < r) :
    (μ.law : Measure ℝ).real {x | r < max (-Real.log x) 0} ≤ Real.exp 1*laplace μ (Real.exp r) := by
  have hm : (μ.law : Measure ℝ) {x | r < max (-Real.log x) 0} ≤
      (μ.law : Measure ℝ) (Iic (Real.exp (-r))) := by
    apply measure_mono_ae
    filter_upwards [hμ] with x hx
    intro ht
    have hl : Real.log x < -r := by
      rcases lt_max_iff.mp ht with ht | ht <;> linarith
    exact ((Real.log_lt_iff_lt_exp hx).mp hl).le
  have ht := ENNReal.toReal_mono (measure_ne_top _ _) hm
  exact ht.trans (measureReal_Iic_exp_neg_le_laplace μ r)

theorem measureReal_posLog_tail_le (μ : NonnegLaw) (hμ : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x)
    {r : ℝ} (hr : 0 < r) :
    (μ.law : Measure ℝ).real {x | r < max (Real.log x) 0} ≤ 2*(1-laplace μ (Real.exp (-r))) := by
  have hm : (μ.law : Measure ℝ) {x | r < max (Real.log x) 0} ≤
      (μ.law : Measure ℝ) (Ioi (Real.exp r)) := by
    apply measure_mono_ae
    filter_upwards [hμ] with x hx
    intro ht
    have hl : r < Real.log x := by
      rcases lt_max_iff.mp ht with ht | ht <;> linarith
    change Real.exp r < x
    simpa only [Real.exp_log hx] using! Real.exp_lt_exp.mpr hl
  have ht := ENNReal.toReal_mono (measure_ne_top _ _) hm
  exact ht.trans (measureReal_Ioi_exp_le_one_sub_laplace μ r)

theorem valueLaw_negLog_integrable_bound (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) {K : ℝ}
    (hK : (∫ y : ℝ, y^2 ∂(F : Measure ℝ)) ≤ K) :
    Integrable (fun x => max (-Real.log x) 0) ((valueLaw B F hF).law : Measure ℝ) ∧
      (∫ x, max (-Real.log x) 0 ∂((valueLaw B F hF).law : Measure ℝ)) ≤
        Real.exp (1+B.val*Real.sqrt K)/B.val := by
  let C := Real.exp (1+B.val*Real.sqrt K)
  have hi : IntegrableOn (fun r : ℝ => C*Real.exp (-B.val*r)) (Ioi 0) :=
    (integrableOn_exp_mul_Ioi (neg_neg_of_pos B.property) 0).const_mul C
  have hb : ∀ r : ℝ, 0 < r →
      ((valueLaw B F hF).law : Measure ℝ).real {x | r < max (-Real.log x) 0} ≤ C*Real.exp (-B.val*r) := by
    intro r hr
    have ht := measureReal_negLog_tail_le _ (valueLaw_pos B F hF) hr
    have hl := mul_le_mul_of_nonneg_left (laplace_valueLaw_exp_bound B F hF r) (Real.exp_pos 1).le
    have hm : (∫ y : ℝ, y ∂(F : Measure ℝ)) ≤ Real.sqrt K :=
      (integral_mono (integrable_id_of_integrable_sq F hF)
        (integrable_id_of_integrable_sq F hF).abs (fun y => le_abs_self y)).trans
          (integral_abs_le_sqrt_of_secondMoment_le F hF hK)
    apply (ht.trans hl).trans
    rw [← Real.exp_add]
    change Real.exp _ ≤ Real.exp (1+B.val*Real.sqrt K)*Real.exp (-B.val*r)
    rw [← Real.exp_add, Real.exp_le_exp]
    nlinarith [mul_le_mul_of_nonneg_left hm B.property.le]
  obtain ⟨hint, hbound⟩ := integrable_and_integral_le_of_tail_bound
    ((valueLaw B F hF).law : Measure ℝ) (by fun_prop) (fun x => le_max_right _ _) hi hb
  refine ⟨hint, ?_⟩
  rw [integral_const_mul, integral_exp_mul_Ioi (neg_neg_of_pos B.property) 0] at hbound
  simpa [C, div_eq_mul_inv] using hbound

end GGC.Identification
