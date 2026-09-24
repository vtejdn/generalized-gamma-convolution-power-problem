import GGC.ExponentialTilt
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics
import Mathlib.Analysis.SpecialFunctions.Log.NegMulLog
import Mathlib.Analysis.Calculus.ParametricIntegral

/-! # Exponentially damped moments without assumptions on the original law -/

noncomputable section
open MeasureTheory Set Filter Topology

namespace GGC

private theorem bounded_on_nonneg_of_tendsto {f : ℝ → ℝ}
    (hc : ContinuousOn f (Ici 0)) (ht : Tendsto f atTop (𝓝 0)) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ x, 0 ≤ x → |f x| ≤ C := by
  obtain ⟨R, hR⟩ := (ht.eventually (Metric.ball_mem_nhds (0 : ℝ) zero_lt_one)).exists_forall_of_atTop
  obtain ⟨C, hC⟩ := isCompact_Icc.exists_bound_of_continuousOn
    (hc.mono (Icc_subset_Ici_self : Icc (0 : ℝ) (max R 0) ⊆ Ici 0))
  refine ⟨max C 1, le_trans zero_le_one (le_max_right _ _), fun x hx => ?_⟩
  by_cases hxr : x ≤ max R 0
  · have h : |f x| ≤ C := by simpa only [Real.norm_eq_abs] using hC x ⟨hx, hxr⟩
    exact h.trans (le_max_left _ _)
  · have h := hR x ((le_max_left R 0).trans (le_of_not_ge hxr))
    have h' : |f x| < 1 := by simpa only [Metric.mem_ball, Real.dist_eq, sub_zero] using h
    exact h'.le.trans (le_max_right _ _)

theorem damped_pow_bound (n : ℕ) {a : ℝ} (ha : 0 < a) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ s x : ℝ, a ≤ s → 0 ≤ x →
      |x ^ n * Real.exp (-s*x)| ≤ C := by
  have ht : Tendsto (fun x : ℝ => x^n * Real.exp (-a*x)) atTop (𝓝 0) := by
    simpa only [Real.rpow_natCast] using
      tendsto_rpow_mul_exp_neg_mul_atTop_nhds_zero (n : ℝ) a ha
  obtain ⟨C, hC, hb⟩ := bounded_on_nonneg_of_tendsto (by fun_prop) ht
  refine ⟨C, hC, fun s x hs hx => le_trans ?_ (hb x hx)⟩
  simp only [abs_mul, abs_of_pos (Real.exp_pos _)]
  gcongr

theorem damped_log_pow_bound (n : ℕ) {a : ℝ} (ha : 0 < a) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ s x : ℝ, a ≤ s → 0 ≤ x →
      |x ^ (n+1) * Real.log x * Real.exp (-s*x)| ≤ C := by
  have hc : Continuous (fun x : ℝ => x^(n+1) * Real.log x * Real.exp (-a*x)) := by
    have h := ((continuous_id.pow n).mul Real.continuous_mul_log).mul
      (Real.continuous_exp.comp ((continuous_const (y := -a)).mul continuous_id))
    convert! h using 1
    ext x
    simp only [pow_succ, Pi.mul_apply, Pi.pow_apply, Function.comp_apply, id_eq]
    ring
  have ht : Tendsto (fun x : ℝ => x^(n+1) * Real.log x * Real.exp (-a*x)) atTop (𝓝 0) := by
    have h := (Real.isLittleO_log_id_atTop.tendsto_div_nhds_zero).mul
      (tendsto_rpow_mul_exp_neg_mul_atTop_nhds_zero ((n+2 : ℕ) : ℝ) a ha)
    simp only [mul_zero, Real.rpow_natCast] at h
    apply h.congr'
    filter_upwards [eventually_gt_atTop (0 : ℝ)] with x hx
    simp only [id_eq]
    field_simp [ne_of_gt hx]
    ring
  obtain ⟨C, hC, hb⟩ := bounded_on_nonneg_of_tendsto hc.continuousOn ht
  refine ⟨C, hC, fun s x hs hx => le_trans ?_ (hb x hx)⟩
  simp only [abs_mul, abs_of_pos (Real.exp_pos _)]
  gcongr

theorem integrable_damped_pow (μ : NonnegLaw) (n : ℕ) {s : ℝ} (hs : 0 < s) :
    Integrable (fun x : ℝ => x^n * Real.exp (-s*x)) (μ.law : Measure ℝ) := by
  obtain ⟨C, _, hC⟩ := damped_pow_bound n hs
  apply (integrable_const C).mono' (by fun_prop)
  filter_upwards [μ.nonneg] with x hx
  exact hC s x le_rfl hx

theorem integrable_damped_log_pow (μ : NonnegLaw) (n : ℕ) {s : ℝ} (hs : 0 < s) :
    Integrable (fun x : ℝ => x^(n+1) * Real.log x * Real.exp (-s*x))
      (μ.law : Measure ℝ) := by
  obtain ⟨C, _, hC⟩ := damped_log_pow_bound n hs
  apply (integrable_const C).mono' (by fun_prop)
  filter_upwards [μ.nonneg] with x hx
  exact hC s x le_rfl hx

/-- The n-th moment under the unnormalized exponential tilt. -/
def dampedMoment (μ : NonnegLaw) (n : ℕ) (s : ℝ) : ℝ :=
  ∫ x, x^n * Real.exp (-s*x) ∂(μ.law : Measure ℝ)

/-- Index n denotes the power n+1, so the logarithm has a continuous value at zero. -/
def dampedLogMoment (μ : NonnegLaw) (n : ℕ) (s : ℝ) : ℝ :=
  ∫ x, x^(n+1) * Real.log x * Real.exp (-s*x) ∂(μ.law : Measure ℝ)

@[simp] theorem dampedMoment_zero (μ : NonnegLaw) (s : ℝ) :
    dampedMoment μ 0 s = laplace μ s := by simp [dampedMoment, laplace]

theorem hasDerivAt_dampedMoment (μ : NonnegLaw) (n : ℕ) {s : ℝ} (hs : 0 < s) :
    HasDerivAt (dampedMoment μ n) (-dampedMoment μ (n+1) s) s := by
  obtain ⟨C, _, hC⟩ := damped_pow_bound (n+1) (half_pos hs)
  have hd := hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (μ := (μ.law : Measure ℝ)) (F := fun t x : ℝ => x^n * Real.exp (-t*x))
    (F' := fun t x : ℝ => -(x^(n+1) * Real.exp (-t*x))) (bound := fun _ => C)
    (Ioi_mem_nhds (show s/2 < s by linarith))
    (Eventually.of_forall fun _ => by fun_prop) (integrable_damped_pow μ n hs)
    (by fun_prop) (by
      filter_upwards [μ.nonneg] with x hx t ht
      simpa only [norm_neg, Real.norm_eq_abs] using hC t x ht.le hx)
    (integrable_const C) (Eventually.of_forall fun x t _ => by
      convert! (((hasDerivAt_id t).neg.mul_const x).exp.const_mul (x^n)) using 1
      simp only [pow_succ, Pi.neg_apply, id_eq]
      ring)
  simpa only [integral_neg, dampedMoment] using! hd.2

theorem hasDerivAt_dampedLogMoment (μ : NonnegLaw) (n : ℕ) {s : ℝ} (hs : 0 < s) :
    HasDerivAt (dampedLogMoment μ n) (-dampedLogMoment μ (n+1) s) s := by
  obtain ⟨C, _, hC⟩ := damped_log_pow_bound (n+1) (half_pos hs)
  have hd := hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (μ := (μ.law : Measure ℝ))
    (F := fun t x : ℝ => x^(n+1) * Real.log x * Real.exp (-t*x))
    (F' := fun t x : ℝ => -(x^(n+1+1) * Real.log x * Real.exp (-t*x)))
    (bound := fun _ => C) (Ioi_mem_nhds (show s/2 < s by linarith))
    (Eventually.of_forall fun _ => by fun_prop) (integrable_damped_log_pow μ n hs)
    (by fun_prop) (by
      filter_upwards [μ.nonneg] with x hx t ht
      simpa only [norm_neg, Real.norm_eq_abs] using hC t x ht.le hx)
    (integrable_const C) (Eventually.of_forall fun x t _ => by
      convert! (((hasDerivAt_id t).neg.mul_const x).exp.const_mul (x^(n+1) * Real.log x))
        using 1
      simp only [pow_succ, Pi.neg_apply, id_eq]
      ring)
  simpa only [integral_neg, dampedLogMoment] using! hd.2

theorem hasDerivAt_laplace (μ : NonnegLaw) {s : ℝ} (hs : 0 < s) :
    HasDerivAt (laplace μ) (-dampedMoment μ 1 s) s := by
  have he : dampedMoment μ 0 = laplace μ := funext (dampedMoment_zero μ)
  rw [← he]
  exact hasDerivAt_dampedMoment μ 0 hs

/-- The tilted X log X expectation, written as a quotient of actual integrals. -/
def tiltedXLog (μ : NonnegLaw) (s : ℝ) : ℝ := dampedLogMoment μ 0 s / laplace μ s

theorem tiltedXLog_eq_integral (μ : NonnegLaw) (s : PosReal) :
    tiltedXLog μ s.val =
      ∫ x, x * Real.log x ∂((exponentialTilt μ s).law : Measure ℝ) := by
  rw [integral_exponentialTilt]
  simp only [tiltedXLog, dampedLogMoment, zero_add, pow_one, mul_comm (Real.exp _)]

theorem integrable_self_exponentialTilt (μ : NonnegLaw) (s : PosReal) :
    Integrable (fun x : ℝ => x) ((exponentialTilt μ s).law : Measure ℝ) := by
  rw [exponentialTilt_eq_tilted, integrable_tilted_iff (laplace_integrable μ s.property.le)]
  simpa only [smul_eq_mul, pow_one, mul_comm (Real.exp _)] using
    integrable_damped_pow μ 1 s.property

theorem integrable_self_mul_log_exponentialTilt (μ : NonnegLaw) (s : PosReal) :
    Integrable (fun x : ℝ => x * Real.log x) ((exponentialTilt μ s).law : Measure ℝ) := by
  rw [exponentialTilt_eq_tilted, integrable_tilted_iff (laplace_integrable μ s.property.le)]
  simpa only [smul_eq_mul, Nat.zero_add, pow_one, mul_comm (Real.exp _)] using
    integrable_damped_log_pow μ 0 s.property

theorem hasDerivAt_tiltedXLog (μ : NonnegLaw) {s : ℝ} (hs : 0 < s) :
    HasDerivAt (tiltedXLog μ)
      (-dampedLogMoment μ 1 s / laplace μ s +
        dampedMoment μ 1 s * dampedLogMoment μ 0 s / (laplace μ s)^2) s := by
  convert! (hasDerivAt_dampedLogMoment μ 0 hs).div (hasDerivAt_laplace μ hs)
    (ne_of_gt (laplace_pos μ hs.le)) using 1
  field_simp
  ring

theorem hasDerivAt_mul_tiltedXLog (μ : NonnegLaw) {s : ℝ} (hs : 0 < s) :
    HasDerivAt (fun t => t * tiltedXLog μ t)
      (tiltedXLog μ s - s * dampedLogMoment μ 1 s / laplace μ s +
        s * dampedMoment μ 1 s * dampedLogMoment μ 0 s / (laplace μ s)^2) s := by
  convert! (hasDerivAt_id s).mul (hasDerivAt_tiltedXLog μ hs) using 1
  simp only [id_eq]
  ring

end GGC
