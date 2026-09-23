import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Tactic

/-! # Reference jump measure and its finite second moment

The density is `exp v / (exp v - 1)^2`. Totalized real division sets its value
at zero to zero; the associated Lebesgue-density measure has no atom there.
The proof of the second moment uses bounds at zero and exponential tails,
without needing the exact value of the moment.
-/

noncomputable section
open MeasureTheory Set Real

namespace GGC.LogRate

def jumpDensity (v : ℝ) : ℝ := exp v / (exp v - 1)^2

@[simp] theorem jumpDensity_zero : jumpDensity 0 = 0 := by simp [jumpDensity]

theorem jumpDensity_nonneg (v : ℝ) : 0 ≤ jumpDensity v := by
  unfold jumpDensity
  positivity

@[fun_prop] theorem measurable_jumpDensity : Measurable jumpDensity := by
  unfold jumpDensity
  fun_prop

theorem jumpDensity_neg (v : ℝ) : jumpDensity (-v) = jumpDensity v := by
  by_cases hv : v = 0
  · simp [hv]
  have he : exp v ≠ 0 := ne_of_gt (exp_pos v)
  have he₁ : exp v - 1 ≠ 0 := sub_ne_zero.mpr (by simpa using hv)
  have he₂ : 1 - exp v ≠ 0 := by intro h; apply he₁; linarith
  unfold jumpDensity
  rw [exp_neg]
  rw [show (exp v)⁻¹ - 1 = (1 - exp v) / exp v by field_simp]
  field_simp
  ring

/-- Identification with the hyperbolic-sine density specified in the blueprint. -/
theorem jumpDensity_eq_sinh (v : ℝ) :
    jumpDensity v = 1 / (4 * Real.sinh (v / 2)^2) := by
  have he : exp (v / 2) ≠ 0 := ne_of_gt (exp_pos _)
  have hs : exp v = exp (v / 2)^2 := by
    rw [pow_two, ← exp_add]
    congr 1
    ring
  unfold jumpDensity
  rw [Real.sinh_eq, exp_neg, hs]
  have hid : 4 * ((exp (v / 2) - (exp (v / 2))⁻¹) / 2)^2 =
      (exp (v / 2)^2 - 1)^2 / exp (v / 2)^2 := by
    field_simp
    ring
  rw [hid, one_div_div]

def jumpMeasure : Measure ℝ := volume.withDensity (fun v => ENNReal.ofReal (jumpDensity v))

instance jumpMeasure_sigmaFinite : SigmaFinite jumpMeasure := by
  unfold jumpMeasure
  infer_instance

@[simp] theorem jumpMeasure_singleton (v : ℝ) : jumpMeasure {v} = 0 := by
  simp [jumpMeasure]

/-- The singular density becomes bounded after multiplication by the second moment. -/
theorem sq_mul_jumpDensity_le_near_zero {v : ℝ} (hv : 0 ≤ v) (hv₁ : v ≤ 1) :
    v^2 * jumpDensity v ≤ exp 1 := by
  by_cases h₀ : v = 0
  · simp [h₀, le_of_lt (exp_pos 1)]
  have hp : 0 < v := lt_of_le_of_ne hv (Ne.symm h₀)
  have he : 0 < exp v - 1 := sub_pos.mpr (one_lt_exp_iff.mpr hp)
  have hl : v ≤ exp v - 1 := by linarith [add_one_le_exp v]
  unfold jumpDensity
  rw [← mul_div_assoc]
  apply (div_le_iff₀ (sq_pos_of_pos he)).2
  have hs : v^2 ≤ (exp v - 1)^2 := by nlinarith
  calc v^2 * exp v ≤ (exp v - 1)^2 * exp v := mul_le_mul_of_nonneg_right hs (exp_pos v).le
    _ ≤ (exp v - 1)^2 * exp 1 := mul_le_mul_of_nonneg_left (exp_le_exp.mpr hv₁) (sq_nonneg _)
    _ = exp 1 * (exp v - 1)^2 := mul_comm _ _

theorem jumpDensity_le_at_top {v : ℝ} (hv : 1 ≤ v) :
    jumpDensity v ≤ 4 * exp (-v) := by
  have he : 2 ≤ exp v := by linarith [add_one_le_exp v]
  have hp : 0 < exp v := exp_pos v
  have hd : 0 < (exp v - 1)^2 := sq_pos_of_pos (by linarith)
  unfold jumpDensity
  rw [exp_neg, ← div_eq_mul_inv]
  apply (div_le_div_iff₀ hd hp).2
  nlinarith

private theorem integrableOn_sq_mul_jumpDensity :
    IntegrableOn (fun v : ℝ => v^2 * jumpDensity v) (Ioi 0) := by
  have hnear : IntegrableOn (fun v : ℝ => v^2 * jumpDensity v) (Ioc 0 1) := by
    apply (integrableOn_const (C := exp 1) (s := Ioc (0 : ℝ) 1) (by simp)).mono'
      (by fun_prop)
    filter_upwards [ae_restrict_mem measurableSet_Ioc] with v hv
    rw [Real.norm_eq_abs, abs_of_nonneg (mul_nonneg (sq_nonneg _) (jumpDensity_nonneg _))]
    exact sq_mul_jumpDensity_le_near_zero hv.1.le hv.2
  have hexp : IntegrableOn (fun v : ℝ => v^2 * exp (-v)) (Ioi 0) := by
    simpa using (integrableOn_rpow_mul_exp_neg_rpow (s := 2) (p := 1) (by norm_num) le_rfl)
  have htail : IntegrableOn (fun v : ℝ => v^2 * jumpDensity v) (Ioi 1) := by
    apply ((hexp.mono_set (Ioi_subset_Ioi zero_le_one)).const_mul 4).mono' (by fun_prop)
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with v hv
    rw [Real.norm_eq_abs, abs_of_nonneg (mul_nonneg (sq_nonneg _) (jumpDensity_nonneg _))]
    have := mul_le_mul_of_nonneg_left (jumpDensity_le_at_top hv.le) (sq_nonneg v)
    nlinarith
  rw [← Ioc_union_Ioi_eq_Ioi zero_le_one]
  exact hnear.union htail

theorem integrable_sq_mul_jumpDensity : Integrable (fun v : ℝ => v^2 * jumpDensity v) := by
  rw [← integrableOn_univ, ← @Iio_union_Ici _ _ (0 : ℝ), integrableOn_union,
    integrableOn_Ici_iff_integrableOn_Ioi]
  refine ⟨?_, integrableOn_sq_mul_jumpDensity⟩
  rw [← (Measure.measurePreserving_neg (volume : Measure ℝ)).integrableOn_comp_preimage
    (Homeomorph.neg ℝ).measurableEmbedding]
  simpa only [Function.comp_def, neg_sq, jumpDensity_neg, neg_preimage, neg_Iio, neg_zero]
    using integrableOn_sq_mul_jumpDensity

/-- The reference measure has a finite second moment even though its mass near zero is infinite. -/
theorem integrable_sq_jumpMeasure : Integrable (fun v : ℝ => v^2) jumpMeasure := by
  rw [jumpMeasure, integrable_withDensity_iff_integrable_smul' (by fun_prop)
    (Filter.Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)]
  simpa only [ENNReal.toReal_ofReal (jumpDensity_nonneg _), smul_eq_mul, mul_comm]
    using integrable_sq_mul_jumpDensity

def jumpSecondMoment : ℝ := ∫ v, v^2 ∂jumpMeasure

theorem jumpSecondMoment_nonneg : 0 ≤ jumpSecondMoment :=
  integral_nonneg (fun v => sq_nonneg v)

end GGC.LogRate
