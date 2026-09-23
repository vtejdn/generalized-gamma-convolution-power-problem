import GGC.LogRate.JumpMeasure
import Mathlib.Analysis.Calculus.Taylor
import Mathlib.Analysis.Calculus.LocalExtr.Basic

/-! # Fully compensated jump calculus

These deterministic lemmas apply to a measurable acceptance function with
values in `[0,1]`. The actual Dirichlet-phase acceptance must separately be
constructed and shown to satisfy those hypotheses.
-/

noncomputable section
open MeasureTheory Set

namespace GGC.LogRate

def taylorRemainder (φ : ℝ → ℝ) (y v : ℝ) : ℝ :=
  φ (y + v) - φ y - v * deriv φ y

/-- Taylor domination valid for every jump, including the tails. -/
theorem abs_taylorRemainder_le {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) (y v : ℝ) :
    |taylorRemainder φ y v| ≤ C / 2 * v^2 := by
  by_cases hv : v = 0
  · simp [taylorRemainder, hv]
  have hne : y ≠ y + v := by intro he; apply hv; linarith
  obtain ⟨x, hx, he⟩ := taylor_mean_remainder_lagrange_iteratedDeriv
    (n := 1) hne hφ.contDiffOn
  have hdiff : DifferentiableAt ℝ φ y := hφ.differentiable (by norm_num) y
  have hu : UniqueDiffWithinAt ℝ (uIcc y (y + v)) y :=
    (uniqueDiffOn_Icc (min_lt_max.mpr hne)) _ (left_mem_uIcc)
  have hpoly : taylorWithinEval φ 1 (uIcc y (y + v)) y (y + v) =
      φ y + v * deriv φ y := by
    rw [show (1 : ℕ) = 0 + 1 from rfl, taylorWithinEval_succ]
    simp [iteratedDerivWithin_one, hdiff.derivWithin hu]
  rw [hpoly] at he
  have hre : taylorRemainder φ y v = deriv (deriv φ) x * v^2 / 2 := by
    simpa [taylorRemainder, sub_sub, iteratedDeriv_succ, iteratedDeriv_one] using he
  rw [hre, abs_div, abs_mul, abs_of_nonneg (sq_nonneg v)]
  norm_num
  nlinarith [mul_le_mul_of_nonneg_right (hC x) (sq_nonneg v)]

def compensatedJump (k φ : ℝ → ℝ) (y : ℝ) : ℝ :=
  ∫ v, taylorRemainder φ y v * k v ∂jumpMeasure

theorem integrable_compensatedJump {k φ : ℝ → ℝ} (hk : Measurable k)
    (hk₀ : ∀ v, 0 ≤ k v) (hk₁ : ∀ v, k v ≤ 1) (hφ : ContDiff ℝ 2 φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) (y : ℝ) :
    Integrable (fun v => taylorRemainder φ y v * k v) jumpMeasure := by
  apply (integrable_sq_jumpMeasure.const_mul (C / 2)).mono'
    (((hφ.continuous.measurable.comp (measurable_const.add measurable_id)).sub
      measurable_const |>.sub (measurable_id.mul_const (deriv φ y))).mul hk).aestronglyMeasurable
  apply Filter.Eventually.of_forall
  intro v
  change ‖taylorRemainder φ y v * k v‖ ≤ C / 2 * v^2
  rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (hk₀ v)]
  calc |taylorRemainder φ y v| * k v ≤ |taylorRemainder φ y v| :=
      mul_le_of_le_one_right (abs_nonneg _) (hk₁ v)
    _ ≤ _ := abs_taylorRemainder_le hφ hC y v

theorem abs_compensatedJump_le {k φ : ℝ → ℝ}
    (hk₀ : ∀ v, 0 ≤ k v) (hk₁ : ∀ v, k v ≤ 1) (hφ : ContDiff ℝ 2 φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) (y : ℝ) :
    |compensatedJump k φ y| ≤ C / 2 * jumpSecondMoment := by
  calc |compensatedJump k φ y| ≤ ∫ v, |taylorRemainder φ y v * k v| ∂jumpMeasure :=
      abs_integral_le_integral_abs
    _ ≤ ∫ v, C / 2 * v^2 ∂jumpMeasure := by
      apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun v => abs_nonneg _)
        (integrable_sq_jumpMeasure.const_mul _)
      apply Filter.Eventually.of_forall
      intro v
      change |taylorRemainder φ y v * k v| ≤ C / 2 * v^2
      rw [abs_mul, abs_of_nonneg (hk₀ v)]
      exact (mul_le_of_le_one_right (abs_nonneg _) (hk₁ v)).trans
        (abs_taylorRemainder_le hφ hC y v)
    _ = _ := integral_const_mul _ _

/-- At a global minimum the derivative vanishes and every compensated jump is nonnegative. -/
theorem compensatedJump_nonneg_at_min {k φ : ℝ → ℝ}
    (hk : ∀ v, 0 ≤ k v) {y : ℝ} (hmin : ∀ x, φ y ≤ φ x) :
    0 ≤ compensatedJump k φ y := by
  have hd : deriv φ y = 0 := (show IsLocalMin φ y from Filter.Eventually.of_forall hmin).deriv_eq_zero
  apply integral_nonneg
  intro v
  simpa [taylorRemainder, hd] using mul_nonneg (sub_nonneg.mpr (hmin (y + v))) (hk v)

/-- The exact quadratic jump remainder; no cutoff of the compensator is used. -/
theorem compensatedJump_sq (k : ℝ → ℝ) (y : ℝ) :
    compensatedJump k (fun x => x^2) y = ∫ v, v^2 * k v ∂jumpMeasure := by
  unfold compensatedJump
  congr 1
  funext v
  have hd : deriv (fun x : ℝ => x^2) y = 2 * y := by
    simp
  simp only [taylorRemainder, hd]
  ring

theorem compensatedJump_sq_le {k : ℝ → ℝ} (hk₀ : ∀ v, 0 ≤ k v)
    (hk₁ : ∀ v, k v ≤ 1) (y : ℝ) :
    compensatedJump k (fun x => x^2) y ≤ jumpSecondMoment := by
  rw [compensatedJump_sq]
  apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun v => mul_nonneg (sq_nonneg v) (hk₀ v))
    integrable_sq_jumpMeasure
  exact Filter.Eventually.of_forall fun v => mul_le_of_le_one_right (sq_nonneg v) (hk₁ v)

end GGC.LogRate
