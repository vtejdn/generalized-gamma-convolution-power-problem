import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.Analysis.Convex.Integral
import Mathlib.Analysis.Convex.Mul
import Mathlib.Tactic

/-! # First moments and tails from a real probability's second moment -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Analysis

theorem integrable_id_of_integrable_sq (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) :
    Integrable (fun y : ℝ => y) (F : Measure ℝ) :=
  ((memLp_two_iff_integrable_sq (by fun_prop)).mpr hF).integrable (by norm_num)

theorem integral_abs_le_sqrt_secondMoment (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) :
    (∫ y : ℝ, |y| ∂(F : Measure ℝ)) ≤ Real.sqrt (∫ y : ℝ, y^2 ∂(F : Measure ℝ)) := by
  have hi := (integrable_id_of_integrable_sq F hF).abs
  have hi₂ : Integrable ((fun x : ℝ => x^2) ∘ fun y : ℝ => |y|) (F : Measure ℝ) := by
    simpa only [Function.comp_def, sq_abs] using hF
  have hj := (convexOn_pow (𝕜 := ℝ) 2).map_integral_le (by fun_prop) isClosed_Ici
    (Eventually.of_forall (fun y : ℝ => (show |y| ∈ Ici 0 from abs_nonneg y))) hi hi₂
  simp only [sq_abs] at hj
  have hm : 0 ≤ ∫ y : ℝ, y^2 ∂(F : Measure ℝ) := integral_nonneg fun y => sq_nonneg y
  nlinarith [Real.sq_sqrt hm, Real.sqrt_nonneg (∫ y : ℝ, y^2 ∂(F : Measure ℝ))]

theorem integral_abs_le_sqrt_of_secondMoment_le (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) {K : ℝ}
    (hK : (∫ y : ℝ, y^2 ∂(F : Measure ℝ)) ≤ K) :
    (∫ y : ℝ, |y| ∂(F : Measure ℝ)) ≤ Real.sqrt K :=
  (integral_abs_le_sqrt_secondMoment F hF).trans (Real.sqrt_le_sqrt hK)

theorem integral_abs_tail_le (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) {R : ℝ} (hR : 0 < R) :
    (∫ y in {y : ℝ | R < |y|}, |y| ∂(F : Measure ℝ)) ≤
      (∫ y : ℝ, y^2 ∂(F : Measure ℝ))/R := by
  rw [le_div_iff₀ hR, ← integral_mul_const]
  calc
    _ ≤ ∫ y in {y : ℝ | R < |y|}, y^2 ∂(F : Measure ℝ) := by
      apply integral_mono_ae ((integrable_id_of_integrable_sq F hF).abs.integrableOn.mul_const R)
        hF.integrableOn
      filter_upwards [ae_restrict_mem (isOpen_lt continuous_const continuous_abs).measurableSet]
        with y hy
      have hb := mul_le_mul_of_nonneg_left hy.le (abs_nonneg y)
      nlinarith [sq_abs y]
    _ ≤ ∫ y : ℝ, y^2 ∂(F : Measure ℝ) :=
      setIntegral_le_integral hF (Eventually.of_forall fun y => sq_nonneg y)

theorem integrable_of_linearGrowth (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ))
    {f : ℝ → ℝ} (hf : AEStronglyMeasurable f (F : Measure ℝ)) {C : ℝ}
    (hb : ∀ y, |f y| ≤ C*(1+|y|)) : Integrable f (F : Measure ℝ) := by
  apply (((integrable_const 1).add (integrable_id_of_integrable_sq F hF).abs).const_mul C).mono' hf
  exact Eventually.of_forall hb

end GGC.Analysis
