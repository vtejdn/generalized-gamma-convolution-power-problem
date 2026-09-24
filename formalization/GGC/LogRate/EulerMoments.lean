import GGC.LogRate.Euler
import Mathlib.MeasureTheory.Function.L2Space

/-! # Euler second moments from the retained-jump Cauchy--Schwarz bound

Hölder with exponents two bounds the squared compensator by intensity times
the reference second moment. With cutoff `sqrt h`, the atom contributes an
error of order `h^(3/2)` plus the drift's quadratic term.
-/

noncomputable section
open MeasureTheory Set Filter ProbabilityTheory
namespace GGC.LogRate

theorem truncatedMeanJump_sq_le (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    (truncatedMeanJump ε B F y)^2 ≤ truncatedIntensity ε B F y * jumpSecondMoment := by
  let μ := retainedJumpKernel ε (B,F,y)
  have hf : MemLp (fun v : ℝ => v) 2 μ :=
    (memLp_two_iff_integrable_sq measurable_id.aestronglyMeasurable).mpr
      (integrable_retainedJumpKernel integrable_sq_jumpMeasure.restrict)
  have hc : MemLp (fun _ : ℝ => (1 : ℝ)) 2 μ := memLp_const 1
  have hh := integral_mul_norm_le_Lp_mul_Lq
    (show (2 : ℝ).HolderConjugate 2 by norm_num [Real.holderConjugate_iff])
    (by simpa using hf) (by simpa using hc)
  have hbound : |∫ v : ℝ, v ∂μ| ≤
      Real.sqrt (∫ v : ℝ, v^2 ∂μ) * Real.sqrt (μ.real univ) := by
    refine abs_integral_le_integral_abs.trans ?_
    simpa only [Real.norm_eq_abs, norm_one, mul_one, Real.rpow_two, sq_abs,
      one_pow, integral_const, smul_eq_mul, mul_one, ← Real.sqrt_eq_rpow] using hh
  have hsq := (sq_le_sq₀ (abs_nonneg _) (mul_nonneg (Real.sqrt_nonneg _) (Real.sqrt_nonneg _))).mpr hbound
  rw [sq_abs, mul_pow, Real.sq_sqrt (integral_nonneg (fun v : ℝ => sq_nonneg v)),
    Real.sq_sqrt (show 0 ≤ μ.real univ from ENNReal.toReal_nonneg)] at hsq
  have hm : μ.real univ = truncatedIntensity ε B F y := by
    rw [measureReal_def, retainedJumpKernel_mass,
      ENNReal.toReal_ofReal (truncatedIntensity_nonneg ε B F y)]
  rw [hm] at hsq
  rw [← integral_id_retainedJumpKernel ε B F y]
  exact hsq.trans ((mul_le_mul_of_nonneg_right (integral_sq_retainedJumpKernel_le ε B F y)
    (truncatedIntensity_nonneg ε B F y)).trans_eq (mul_comm _ _))

theorem truncatedDrift_sq_le (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    (truncatedDrift ε B F y)^2 ≤
      4 * (y^2 + (driftBound B.val)^2) + 4 / ε.val * jumpSecondMoment := by
  have hd := abs_drift_sub_le B F y
  have hd2 : (drift B F y - y)^2 ≤ (driftBound B.val)^2 := by
    simpa only [sq_abs] using (sq_le_sq₀ (abs_nonneg _) (driftBound_nonneg _)).mpr hd
  have hm := (truncatedMeanJump_sq_le ε B F y).trans
    (mul_le_mul_of_nonneg_right (truncatedIntensity_le ε B F y) jumpSecondMoment_nonneg)
  unfold truncatedDrift
  simp only [div_eq_mul_inv] at hm ⊢
  nlinarith [sq_nonneg (drift B F y - 2*y), sq_nonneg (drift B F y + truncatedMeanJump ε B F y)]

theorem euler_sqrt_le_quarter (h : EulerStep) : Real.sqrt h.val ≤ 1 / 4 := by
  nlinarith [Real.sq_sqrt h.property.1.le, Real.sqrt_nonneg h.val, h.property.2]

theorem euler_atom_secondMoment_le (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    h.val^2 * (truncatedDrift (eulerCutoff h) B F y)^2 / eulerStay h B F y ≤
      8 * h.val^2 * (y^2 + (driftBound B.val)^2) +
      8 * h.val * Real.sqrt h.val * jumpSecondMoment := by
  have hs : 0 < Real.sqrt h.val := Real.sqrt_pos.mpr h.property.1
  have hs2 := Real.sq_sqrt h.property.1.le
  have hp := eulerStay_ge_half h B F y
  calc
    _ ≤ 2 * h.val^2 * (truncatedDrift (eulerCutoff h) B F y)^2 := by
      apply (div_le_iff₀ (eulerStay_pos h B F y)).mpr
      nlinarith [mul_le_mul_of_nonneg_left hp
        (show 0 ≤ 2 * h.val^2 * (truncatedDrift (eulerCutoff h) B F y)^2 by positivity)]
    _ ≤ 2 * h.val^2 * (4 * (y^2 + (driftBound B.val)^2) +
        4 / Real.sqrt h.val * jumpSecondMoment) :=
      mul_le_mul_of_nonneg_left (truncatedDrift_sq_le (eulerCutoff h) B F y) (by positivity)
    _ = _ := by
      have hdiv : h.val^2 / Real.sqrt h.val = h.val * Real.sqrt h.val := by
        apply (div_eq_iff (ne_of_gt hs)).mpr
        nlinarith
      calc
        _ = 8 * h.val^2 * (y^2 + (driftBound B.val)^2) +
            8 * (h.val^2 / Real.sqrt h.val) * jumpSecondMoment := by ring
        _ = _ := by rw [hdiv]; ring

theorem integral_euler_increment_sq_le (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    (∫ z, (z-y)^2 ∂eulerMeasure h B F y) ≤
      8 * h.val^2 * (y^2 + (driftBound B.val)^2) + 3 * h.val * jumpSecondMoment := by
  rw [integral_euler_increment_sq]
  have hj := mul_le_mul_of_nonneg_left
    (integral_sq_retainedJumpKernel_le (eulerCutoff h) B F y) h.property.1.le
  have ha := euler_atom_secondMoment_le h B F y
  have hJ := jumpSecondMoment_nonneg
  have hfactor : 0 ≤ 8 * h.val * jumpSecondMoment :=
    mul_nonneg (mul_nonneg (by norm_num) h.property.1.le) hJ
  have ht := mul_le_mul_of_nonneg_right (euler_sqrt_le_quarter h)
    hfactor
  nlinarith

theorem integrable_euler_sq (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    Integrable (fun z : ℝ => z^2) (eulerMeasure h B F y) := by
  have he : (fun z : ℝ => z^2) = (fun z => (z-y)^2 + (2*y)*(z-y) + y^2) := by
    funext z; ring
  rw [he]
  exact ((integrable_euler_increment_sq h B F y).add
    ((integrable_euler_increment h B F y).const_mul (2*y))).add (integrable_const _)

theorem integral_euler_sq (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    (∫ z : ℝ, z^2 ∂eulerMeasure h B F y) =
      y^2 + 2*y*h.val*drift B F y + ∫ z, (z-y)^2 ∂eulerMeasure h B F y := by
  have he : (fun z : ℝ => z^2) = (fun z => (z-y)^2 + (2*y)*(z-y) + y^2) := by
    funext z; ring
  have hi : Integrable (fun z : ℝ => (z-y)^2 + (2*y)*(z-y)) (eulerMeasure h B F y) :=
    (integrable_euler_increment_sq h B F y).add
      ((integrable_euler_increment h B F y).const_mul (2*y))
  rw [he, integral_add hi (integrable_const _),
    integral_add (integrable_euler_increment_sq h B F y)
      ((integrable_euler_increment h B F y).const_mul (2*y)),
    integral_const_mul, integral_euler_increment]
  simp only [integral_const, probReal_univ, one_smul]
  ring

/-- Uniform in the base law, with a coefficient depending only on mass. -/
theorem integral_euler_sq_le (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    (∫ z : ℝ, z^2 ∂eulerMeasure h B F y) ≤
      (1 + 4 * h.val) * y^2 + h.val * (2 * (driftBound B.val)^2 + 3 * jumpSecondMoment) := by
  have hd2 : (drift B F y - y)^2 ≤ (driftBound B.val)^2 := by
    simpa only [sq_abs] using
      (sq_le_sq₀ (abs_nonneg _) (driftBound_nonneg _)).mpr (abs_drift_sub_le B F y)
  have hd : 2*y*drift B F y ≤ 3*y^2+(driftBound B.val)^2 := by
    nlinarith [sq_nonneg (drift B F y - 2*y)]
  have ht : 8 * h.val^2 ≤ h.val := by nlinarith [h.property.1, h.property.2]
  have he := mul_le_mul_of_nonneg_right ht (add_nonneg (sq_nonneg y) (sq_nonneg (driftBound B.val)))
  have hd' := mul_le_mul_of_nonneg_left hd h.property.1.le
  rw [integral_euler_sq]
  nlinarith [integral_euler_increment_sq_le h B F y]

end GGC.LogRate
