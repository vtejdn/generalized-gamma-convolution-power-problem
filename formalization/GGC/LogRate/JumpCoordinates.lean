import GGC.LogRate.JumpMeasure
import Mathlib.MeasureTheory.Function.JacobianOneDim

/-! # Exponential coordinates for the actual reference jump measure

The standard one-dimensional change-of-variables theorem supplies both
absolute integrability and the Bochner integral identity (API-020).
-/

noncomputable section
open MeasureTheory Set Filter

namespace GGC.LogRate

theorem integrable_jumpMeasure_iff (f : ℝ → ℝ) :
    Integrable f jumpMeasure ↔
      IntegrableOn (fun u => f (Real.log u)/(u-1)^2) (Ioi 0) := by
  have h := integrableOn_image_iff_integrableOn_abs_deriv_smul
    (s := (univ : Set ℝ)) (f := Real.exp) (f' := Real.exp) MeasurableSet.univ
    (fun x _ => (Real.hasDerivAt_exp x).hasDerivWithinAt) Real.exp_injective.injOn
    (fun u => f (Real.log u)/(u-1)^2)
  simp only [image_univ, Real.range_exp, Real.abs_exp, Real.log_exp,
    smul_eq_mul, integrableOn_univ] at h
  rw [jumpMeasure, integrable_withDensity_iff_integrable_smul'
    (measurable_jumpDensity.ennreal_ofReal) (Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)]
  simp_rw [ENNReal.toReal_ofReal (jumpDensity_nonneg _), smul_eq_mul]
  unfold jumpDensity
  simpa only [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using h.symm

theorem integral_jumpMeasure (f : ℝ → ℝ) :
    (∫ v, f v ∂jumpMeasure) = ∫ u in Ioi 0, f (Real.log u)/(u-1)^2 := by
  have h := integral_image_eq_integral_abs_deriv_smul
    (s := (univ : Set ℝ)) (f := Real.exp) (f' := Real.exp) MeasurableSet.univ
    (fun x _ => (Real.hasDerivAt_exp x).hasDerivWithinAt) Real.exp_injective.injOn
    (fun u => f (Real.log u)/(u-1)^2)
  simp only [image_univ, Real.range_exp, Real.abs_exp, Real.log_exp,
    smul_eq_mul, Measure.restrict_univ] at h
  rw [jumpMeasure, integral_withDensity_eq_integral_toReal_smul
    (measurable_jumpDensity.ennreal_ofReal) (Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)]
  simp_rw [ENNReal.toReal_ofReal (jumpDensity_nonneg _), smul_eq_mul]
  unfold jumpDensity
  rw [h]
  apply integral_congr_ae
  exact Eventually.of_forall fun v => by dsimp only; ring

end GGC.LogRate
