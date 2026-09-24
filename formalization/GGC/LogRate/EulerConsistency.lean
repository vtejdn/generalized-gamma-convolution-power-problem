import GGC.LogRate.EulerMoments
import GGC.LogRate.SmallJumps

/-! # Consistency of the positive Euler kernel with the actual generator

The exact first moment cancels the full compensator. The only errors are
the Taylor remainder of the drift atom and the omitted small jumps.
-/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.LogRate

theorem integrable_compactTest_retained (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ)
    {φ : ℝ → ℝ} (hφ : Continuous φ) (hs : HasCompactSupport φ) :
    Integrable (fun v => φ (y+v)) (retainedJumpKernel ε (B,F,y)) := by
  obtain ⟨C, hC⟩ := hs.exists_bound_of_continuous hφ
  apply (integrable_const C).mono' (hφ.measurable.comp (by fun_prop)).aestronglyMeasurable
  exact Eventually.of_forall fun v => hC (y+v)

theorem integral_taylor_retained (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ)
    {φ : ℝ → ℝ} (hφ : Continuous φ) (hs : HasCompactSupport φ) :
    (∫ v, taylorRemainder φ y v ∂retainedJumpKernel ε (B,F,y)) =
      (∫ v, φ (y+v) ∂retainedJumpKernel ε (B,F,y)) -
      truncatedIntensity ε B F y * φ y - truncatedMeanJump ε B F y * deriv φ y := by
  have hi := integrable_compactTest_retained ε B F y hφ hs
  have hv : Integrable (fun v : ℝ => v) (retainedJumpKernel ε (B,F,y)) :=
    integrable_retainedJumpKernel (integrable_id_truncatedJumpMeasure ε)
  have hm : (retainedJumpKernel ε (B,F,y)).real univ = truncatedIntensity ε B F y := by
    rw [measureReal_def, retainedJumpKernel_mass,
      ENNReal.toReal_ofReal (truncatedIntensity_nonneg ε B F y)]
  have hid : Integrable (fun v => φ (y+v)-φ y) (retainedJumpKernel ε (B,F,y)) :=
    hi.sub (integrable_const _)
  unfold taylorRemainder
  rw [integral_sub hid (hv.mul_const _), integral_sub hi (integrable_const _), integral_mul_const,
    integral_const, hm, smul_eq_mul, integral_id_retainedJumpKernel]

theorem integral_euler_compensated (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ)
    {φ : ℝ → ℝ} (hφ : Continuous φ) (hs : HasCompactSupport φ) :
    (∫ z, φ z ∂eulerMeasure h B F y) - φ y - h.val * drift B F y * deriv φ y =
      eulerStay h B F y * taylorRemainder φ y
        (h.val * truncatedDrift (eulerCutoff h) B F y / eulerStay h B F y) +
      h.val * ∫ v, taylorRemainder φ y v ∂retainedJumpKernel (eulerCutoff h) (B,F,y) := by
  rw [integral_eulerMeasure h B F y hφ.measurable
    (integrable_compactTest_retained _ B F y hφ hs), integral_taylor_retained _ B F y hφ hs]
  simp only [taylorRemainder, eulerDestination]
  have hp := ne_of_gt (eulerStay_pos h B F y)
  field_simp [hp]
  simp only [truncatedDrift, eulerStay]
  ring

theorem integral_euler_error_eq (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) :
    (∫ z, φ z ∂eulerMeasure h B F y) - φ y - h.val * generator B F φ y =
      eulerStay h B F y * taylorRemainder φ y
        (h.val * truncatedDrift (eulerCutoff h) B F y / eulerStay h B F y) -
      h.val * ∫ v in {v : ℝ | |v| ≤ Real.sqrt h.val},
        taylorRemainder φ y v * acceptance B F y v ∂jumpMeasure := by
  have he : (jumpTail (eulerCutoff h).val)ᶜ = {v : ℝ | |v| ≤ Real.sqrt h.val} := by
    ext v
    simp only [jumpTail, mem_compl_iff, mem_setOf_eq, not_lt, eulerCutoff]
  have hj : (∫ v, taylorRemainder φ y v ∂retainedJumpKernel (eulerCutoff h) (B,F,y)) +
      (∫ v in {v : ℝ | |v| ≤ Real.sqrt h.val}, taylorRemainder φ y v * acceptance B F y v ∂jumpMeasure) =
      ∫ v, taylorRemainder φ y v * acceptance B F y v ∂jumpMeasure := by
    rw [integral_retainedJumpKernel]
    simpa only [truncatedJumpMeasure, he] using
      integral_add_compl (measurableSet_jumpTail (eulerCutoff h).val)
        (integrable_generator_jumps B F hφ hC y)
  rw [generator_eq]
  change (∫ z, φ z ∂eulerMeasure h B F y) - φ y -
    h.val * (drift B F y * deriv φ y + ∫ v, taylorRemainder φ y v * acceptance B F y v ∂jumpMeasure) = _
  calc
    _ = ((∫ z, φ z ∂eulerMeasure h B F y) - φ y - h.val * drift B F y * deriv φ y) -
        h.val * ∫ v, taylorRemainder φ y v * acceptance B F y v ∂jumpMeasure := by ring
    _ = _ := by
      rw [integral_euler_compensated h B F y hφ.continuous hs, ← hj]
      ring

theorem abs_smallJump_remainder_le (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C)
    {ε : ℝ} (hε : 0 ≤ ε) :
    |∫ v in {v : ℝ | |v| ≤ ε}, taylorRemainder φ y v * acceptance B F y v ∂jumpMeasure| ≤ C * ε := by
  have hC0 : 0 ≤ C := (abs_nonneg _).trans (hC 0)
  calc
    _ ≤ ∫ v in {v : ℝ | |v| ≤ ε}, |taylorRemainder φ y v * acceptance B F y v| ∂jumpMeasure :=
      abs_integral_le_integral_abs
    _ ≤ ∫ v in {v : ℝ | |v| ≤ ε}, C/2 * v^2 ∂jumpMeasure := by
      apply integral_mono_of_nonneg (Eventually.of_forall fun v => abs_nonneg _)
        (integrable_sq_jumpMeasure.restrict.const_mul (C/2))
      apply Eventually.of_forall
      intro v
      change |taylorRemainder φ y v * acceptance B F y v| ≤ C/2 * v^2
      rw [abs_mul, abs_of_nonneg (acceptance_bounds B F y v).1]
      exact (mul_le_of_le_one_right (abs_nonneg _) (acceptance_bounds B F y v).2).trans
        (abs_taylorRemainder_le hφ hC y v)
    _ = C/2 * ∫ v in {v : ℝ | |v| ≤ ε}, v^2 ∂jumpMeasure := integral_const_mul _ _
    _ ≤ C/2 * (2*ε) := mul_le_mul_of_nonneg_left (integral_sq_smallJumps_le hε) (by positivity)
    _ = _ := by ring

theorem abs_euler_error_le (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) :
    |(∫ z, φ z ∂eulerMeasure h B F y) - φ y - h.val * generator B F φ y| ≤
      C/2 * (h.val^2 * (truncatedDrift (eulerCutoff h) B F y)^2 / eulerStay h B F y) +
      h.val * C * Real.sqrt h.val := by
  rw [integral_euler_error_eq h B F y hφ hs hC]
  have hp := eulerStay_pos h B F y
  have ha := mul_le_mul_of_nonneg_left
    (abs_taylorRemainder_le hφ hC y (h.val * truncatedDrift (eulerCutoff h) B F y / eulerStay h B F y)) hp.le
  have hj := mul_le_mul_of_nonneg_left (abs_smallJump_remainder_le B F y hφ hC (Real.sqrt_nonneg h.val))
    h.property.1.le
  calc
    _ ≤ |eulerStay h B F y * taylorRemainder φ y
        (h.val * truncatedDrift (eulerCutoff h) B F y / eulerStay h B F y)| +
        |h.val * ∫ v in {v : ℝ | |v| ≤ Real.sqrt h.val},
          taylorRemainder φ y v * acceptance B F y v ∂jumpMeasure| := abs_sub _ _
    _ ≤ eulerStay h B F y * (C/2 * (h.val * truncatedDrift (eulerCutoff h) B F y / eulerStay h B F y)^2) +
        h.val * (C * Real.sqrt h.val) := by
      rw [abs_mul, abs_mul, abs_of_pos hp, abs_of_pos h.property.1]
      exact add_le_add ha hj
    _ = _ := by field_simp [ne_of_gt hp]

/-- Dividing by the step leaves an error of order `sqrt h + h*(1+y²)` on compact mass intervals. -/
theorem abs_euler_error_le_sqrt (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) :
    |(∫ z, φ z ∂eulerMeasure h B F y) - φ y - h.val * generator B F φ y| ≤
      4*C*h.val^2*(y^2+(driftBound B.val)^2) +
      C*h.val*Real.sqrt h.val*(1+4*jumpSecondMoment) := by
  have hC0 : 0 ≤ C := (abs_nonneg _).trans (hC 0)
  have ha := mul_le_mul_of_nonneg_left (euler_atom_secondMoment_le h B F y)
    (show 0 ≤ C/2 by positivity)
  have he := abs_euler_error_le h B F y hφ hs hC
  nlinarith

end GGC.LogRate
