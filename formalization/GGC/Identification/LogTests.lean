import GGC.Foundations.MomentBounds
import GGC.LogRate.Generator
import GGC.Thorin

/-! # Logarithmic rate tests, admissibility and finite-horizon Laplace bounds -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Identification
open GGC.Analysis GGC.LogRate

def logTest (s y : ℝ) : ℝ := Real.log (1+s*Real.exp (-y))

theorem continuous_logTest {s : ℝ} (hs : 0 ≤ s) : Continuous (logTest s) := by
  unfold logTest
  apply Continuous.log (by fun_prop)
  intro y
  positivity

theorem logTest_nonneg {s : ℝ} (hs : 0 ≤ s) (y : ℝ) : 0 ≤ logTest s y :=
  Real.log_nonneg (le_add_of_nonneg_right (mul_nonneg hs (Real.exp_pos _).le))

theorem logTest_le {s : ℝ} (hs : 0 ≤ s) (y : ℝ) :
    logTest s y ≤ Real.log (1+s)+max (-y) 0 := by
  have he : 1+s*Real.exp (-y) ≤ (1+s)*Real.exp (max (-y) 0) := by
    have h₁ : 1 ≤ Real.exp (max (-y) 0) := Real.one_le_exp_iff.mpr (le_max_right _ _)
    have h₂ : Real.exp (-y) ≤ Real.exp (max (-y) 0) := Real.exp_le_exp.mpr (le_max_left _ _)
    nlinarith [mul_le_mul_of_nonneg_left h₂ hs]
  calc
    _ ≤ Real.log ((1+s)*Real.exp (max (-y) 0)) := Real.log_le_log (by positivity) he
    _ = _ := by rw [Real.log_mul (by positivity) (Real.exp_ne_zero _), Real.log_exp]

theorem integrable_logTest (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) {s : ℝ} (hs : 0 ≤ s) :
    Integrable (logTest s) (F : Measure ℝ) := by
  apply ((integrable_const (Real.log (1+s))).add (integrable_id_of_integrable_sq F hF).abs).mono'
    (continuous_logTest hs).measurable.aestronglyMeasurable
  apply Eventually.of_forall
  intro y
  rw [Real.norm_eq_abs, abs_of_nonneg (logTest_nonneg hs y)]
  exact (logTest_le hs y).trans (add_le_add le_rfl (max_le (neg_le_abs y) (abs_nonneg y)))

theorem integral_logTest_le (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) {s K : ℝ} (hs : 0 ≤ s)
    (hK : (∫ y : ℝ, y^2 ∂(F : Measure ℝ)) ≤ K) :
    (∫ y, logTest s y ∂(F : Measure ℝ)) ≤ Real.log (1+s)+Real.sqrt K := by
  calc
    _ ≤ ∫ y, Real.log (1+s)+|y| ∂(F : Measure ℝ) := by
      apply integral_mono (integrable_logTest F hF hs)
        ((integrable_const _).add (integrable_id_of_integrable_sq F hF).abs)
      intro y
      exact (logTest_le hs y).trans (add_le_add le_rfl (max_le (neg_le_abs y) (abs_nonneg y)))
    _ = Real.log (1+s)+(∫ y : ℝ, |y| ∂(F : Measure ℝ)) := by
      rw [integral_add (integrable_const _) (integrable_id_of_integrable_sq F hF).abs]
      simp
    _ ≤ _ := by linarith [integral_abs_le_sqrt_of_secondMoment_le F hF hK]

theorem integral_baseMeasure_log (B : PosReal) (F : ProbabilityMeasure ℝ) (s : ℝ) :
    (∫ b : PosReal, Real.log (1+s/b.val) ∂baseMeasure B F) =
      B.val*∫ y, logTest s y ∂(F : Measure ℝ) := by
  rw [baseMeasure, integral_smul_measure]
  change (ENNReal.ofReal B.val).toReal •
    (∫ b : PosReal, Real.log (1+s/b.val) ∂Measure.map rateEquiv (F : Measure ℝ)) = _
  rw [integral_map rateEquiv.measurable.aemeasurable
    (show Measurable (fun b : PosReal => Real.log (1+s/b.val)) by fun_prop).aestronglyMeasurable]
  simp only [ENNReal.toReal_ofReal B.property.le, smul_eq_mul, rateEquiv_apply_val,
    div_eq_mul_inv, ← Real.exp_neg, logTest]

theorem thorinAdmissible_baseMeasure (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) :
    ThorinAdmissible (baseMeasure B F) := by
  have hi := integrable_logTest F hF (s := 1) zero_le_one
  change Integrable (fun y : ℝ => Real.log (1+1*Real.exp (-y))) (F : Measure ℝ) at hi
  have hm : Integrable (fun b : PosReal => Real.log (1+1/b.val)) (rateLaw F : Measure PosReal) := by
    change Integrable _ (Measure.map rateEquiv (F : Measure ℝ))
    apply (integrable_map_measure
      (show Measurable (fun b : PosReal => Real.log (1+1/b.val)) by fun_prop).aestronglyMeasurable
      rateEquiv.measurable.aemeasurable).mpr
    simpa [Function.comp_def, rateEquiv_apply_val, div_eq_mul_inv, ← Real.exp_neg, logTest] using! hi
  exact hm.smul_measure ENNReal.ofReal_ne_top

end GGC.Identification
