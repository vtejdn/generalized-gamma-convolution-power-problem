import GGC.DampedMoments

/-! # Differentiation of the actual power-law Laplace transform

All integrals are against the current nonnegative law. Positive-time powers
are never assumed to be GGC, and no undamped moment is assumed.
-/

noncomputable section
open MeasureTheory Set Filter Topology

namespace GGC

def powerMoment (μ : NonnegLaw) (n : ℕ) (q s : ℝ) : ℝ :=
  ∫ x, (x^q)^n * Real.exp (-s*x^q) ∂(μ.law : Measure ℝ)

def powerLogMoment (μ : NonnegLaw) (n : ℕ) (q s : ℝ) : ℝ :=
  ∫ x, (x^q)^(n+1) * Real.log x * Real.exp (-s*x^q) ∂(μ.law : Measure ℝ)

def powerLaplace (μ : NonnegLaw) (q s : ℝ) : ℝ := powerMoment μ 0 q s

theorem powerLaplace_eq_laplace_powerLaw (μ : NonnegLaw) {q : ℝ} (hq : 0 ≤ q) (s : ℝ) :
    powerLaplace μ q s = laplace (powerLaw μ q hq) s := by
  rw [laplace, powerLaw_toMeasure, integral_map (by fun_prop) (by fun_prop)]
  simp only [powerLaplace, powerMoment, pow_zero, one_mul]

@[simp] theorem powerMoment_one (μ : NonnegLaw) (n : ℕ) (s : ℝ) :
    powerMoment μ n 1 s = dampedMoment μ n s := by simp [powerMoment, dampedMoment]

@[simp] theorem powerLogMoment_one (μ : NonnegLaw) (n : ℕ) (s : ℝ) :
    powerLogMoment μ n 1 s = dampedLogMoment μ n s := by simp [powerLogMoment, dampedLogMoment]

@[simp] theorem powerLaplace_one (μ : NonnegLaw) (s : ℝ) :
    powerLaplace μ 1 s = laplace μ s := by simp [powerLaplace]

theorem integrable_powerMoment (μ : NonnegLaw) (n : ℕ) (q : ℝ) {s : ℝ} (hs : 0 < s) :
    Integrable (fun x : ℝ => (x^q)^n * Real.exp (-s*x^q)) (μ.law : Measure ℝ) := by
  obtain ⟨C, _, hC⟩ := damped_pow_bound n hs
  apply (integrable_const C).mono' (by fun_prop)
  filter_upwards [μ.nonneg] with x hx
  exact hC s (x^q) le_rfl (Real.rpow_nonneg hx q)

/-- Uniform over both positive parameters; in particular this supplies compact (s,q) domination. -/
theorem power_log_integrand_bound (n : ℕ) {a c : ℝ} (ha : 0 < a) (hc : 0 < c) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ s q x : ℝ, a ≤ s → c ≤ q → 0 ≤ x →
      |(x^q)^(n+1) * Real.log x * Real.exp (-s*x^q)| ≤ C := by
  obtain ⟨C, hC, hb⟩ := damped_log_pow_bound n ha
  refine ⟨C/c, div_nonneg hC hc.le, fun s q x hs hq hx => ?_⟩
  have hq' : 0 < q := hc.trans_le hq
  have he : (x^q)^(n+1) * Real.log x * Real.exp (-s*x^q) =
      ((x^q)^(n+1) * Real.log (x^q) * Real.exp (-s*x^q)) / q := by
    rcases hx.eq_or_lt with rfl | hx
    · simp [Real.zero_rpow (ne_of_gt hq')]
    · rw [Real.log_rpow hx]
      field_simp
  rw [he, abs_div, abs_of_pos hq']
  exact (div_le_div_of_nonneg_right (hb s (x^q) hs (Real.rpow_nonneg hx q)) hq'.le).trans
    (div_le_div_of_nonneg_left hC hc hq)

theorem integrable_powerLogMoment (μ : NonnegLaw) (n : ℕ) {q s : ℝ}
    (hq : 0 < q) (hs : 0 < s) :
    Integrable (fun x : ℝ => (x^q)^(n+1) * Real.log x * Real.exp (-s*x^q))
      (μ.law : Measure ℝ) := by
  obtain ⟨C, _, hC⟩ := power_log_integrand_bound n hs hq
  apply (integrable_const C).mono' (by fun_prop)
  filter_upwards [μ.nonneg] with x hx
  exact hC s q x le_rfl le_rfl hx

theorem hasDerivAt_powerMoment_s (μ : NonnegLaw) (n : ℕ) (q : ℝ)
    {s : ℝ} (hs : 0 < s) :
    HasDerivAt (powerMoment μ n q) (-powerMoment μ (n+1) q s) s := by
  obtain ⟨C, _, hC⟩ := damped_pow_bound (n+1) (half_pos hs)
  have hd := hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (μ := (μ.law : Measure ℝ)) (F := fun t x : ℝ => (x^q)^n * Real.exp (-t*x^q))
    (F' := fun t x : ℝ => -((x^q)^(n+1) * Real.exp (-t*x^q))) (bound := fun _ => C)
    (Ioi_mem_nhds (show s/2 < s by linarith))
    (Eventually.of_forall fun _ => by fun_prop) (integrable_powerMoment μ n q hs)
    (by fun_prop) (by
      filter_upwards [μ.nonneg] with x hx t ht
      simpa only [norm_neg, Real.norm_eq_abs] using hC t (x^q) ht.le (Real.rpow_nonneg hx q))
    (integrable_const C) (Eventually.of_forall fun x t _ => by
      convert! (((hasDerivAt_id t).neg.mul_const (x^q)).exp.const_mul ((x^q)^n)) using 1
      simp only [pow_succ, Pi.neg_apply, id_eq]
      ring)
  simpa only [integral_neg, powerMoment] using! hd.2

private theorem hasDerivAt_rpow_exponent {x q : ℝ} (hx : 0 ≤ x) (hq : 0 < q) :
    HasDerivAt (fun r : ℝ => x^r) (x^q * Real.log x) q := by
  rcases hx.eq_or_lt with rfl | hx
  · have he : (fun r : ℝ => (0 : ℝ)^r) =ᶠ[𝓝 q] (fun _ => 0) := by
      filter_upwards [eventually_gt_nhds hq] with r hr
      exact Real.zero_rpow (ne_of_gt hr)
    simpa only [Real.log_zero, mul_zero] using (hasDerivAt_const q (0 : ℝ)).congr_of_eventuallyEq he
  · exact (Real.hasStrictDerivAt_const_rpow hx q).hasDerivAt

theorem hasDerivAt_powerLaplace_q (μ : NonnegLaw) {s q : ℝ} (hs : 0 < s) (hq : 0 < q) :
    HasDerivAt (fun r => powerLaplace μ r s) (-s * powerLogMoment μ 0 q s) q := by
  obtain ⟨C, _, hC⟩ := power_log_integrand_bound 0 hs (half_pos hq)
  have hd := hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (μ := (μ.law : Measure ℝ)) (F := fun r x : ℝ => Real.exp (-s*x^r))
    (F' := fun r x : ℝ => -s * (x^r * Real.log x * Real.exp (-s*x^r)))
    (bound := fun _ => |s| * C) (Ioi_mem_nhds (show q/2 < q by linarith))
    (Eventually.of_forall fun _ => by fun_prop)
    (by simpa only [pow_zero, one_mul] using integrable_powerMoment μ 0 q hs)
    (by fun_prop) (by
      filter_upwards [μ.nonneg] with x hx r hr
      rw [norm_mul, norm_neg, Real.norm_eq_abs, Real.norm_eq_abs]
      apply mul_le_mul_of_nonneg_left _ (abs_nonneg s)
      simpa only [Nat.zero_add, pow_one] using hC s r x le_rfl hr.le hx)
    (integrable_const _) (by
      filter_upwards [μ.nonneg] with x hx r hr
      convert! ((hasDerivAt_rpow_exponent hx (lt_trans (half_pos hq) hr)).const_mul (-s)).exp
        using 1
      ring)
  simpa only [powerLaplace, powerMoment, powerLogMoment, pow_zero, one_mul, integral_const_mul,
    Nat.zero_add, pow_one] using! hd.2

theorem hasDerivAt_powerMoment_one_q (μ : NonnegLaw) {s q : ℝ} (hs : 0 < s) (hq : 0 < q) :
    HasDerivAt (fun r => powerMoment μ 1 r s)
      (powerLogMoment μ 0 q s - s * powerLogMoment μ 1 q s) q := by
  obtain ⟨C, _, hC⟩ := power_log_integrand_bound 0 hs (half_pos hq)
  obtain ⟨D, _, hD⟩ := power_log_integrand_bound 1 hs (half_pos hq)
  have hd := hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (μ := (μ.law : Measure ℝ)) (F := fun r x : ℝ => x^r * Real.exp (-s*x^r))
    (F' := fun r x : ℝ => x^r * Real.log x * Real.exp (-s*x^r) -
      s*((x^r)^2 * Real.log x * Real.exp (-s*x^r)))
    (bound := fun _ => C + |s| * D) (Ioi_mem_nhds (show q/2 < q by linarith))
    (Eventually.of_forall fun _ => by fun_prop)
    (by simpa only [pow_one] using integrable_powerMoment μ 1 q hs)
    (by fun_prop) (by
      filter_upwards [μ.nonneg] with x hx r hr
      refine (norm_sub_le _ _).trans ?_
      apply add_le_add
      · simpa only [Real.norm_eq_abs, Nat.zero_add, pow_one] using hC s r x le_rfl hr.le hx
      · rw [norm_mul, Real.norm_eq_abs, Real.norm_eq_abs]
        exact mul_le_mul_of_nonneg_left (hD s r x le_rfl hr.le hx) (abs_nonneg s))
    (integrable_const _) (by
      filter_upwards [μ.nonneg] with x hx r hr
      have hp := hasDerivAt_rpow_exponent hx (lt_trans (half_pos hq) hr)
      convert! hp.mul ((hp.const_mul (-s)).exp) using 1
      ring)
  have hi := integrable_powerLogMoment μ 0 hq hs
  have hj := (integrable_powerLogMoment μ 1 hq hs).const_mul s
  simp only [Nat.zero_add, pow_one] at hi
  simpa only [powerMoment, powerLogMoment, pow_one, Nat.zero_add,
    integral_sub hi hj, integral_const_mul] using! hd.2

theorem powerLaplace_pos (μ : NonnegLaw) {q s : ℝ} (hs : 0 < s) :
    0 < powerLaplace μ q s := by
  simp only [powerLaplace, powerMoment, pow_zero, one_mul]
  apply integral_exp_pos
  simpa only [pow_zero, one_mul] using integrable_powerMoment μ 0 q hs

/-- The negative s derivative of the logarithm of the actual powered transform. -/
def powerLogDerivative (μ : NonnegLaw) (q s : ℝ) : ℝ :=
  -deriv (fun t => Real.log (powerLaplace μ q t)) s

theorem powerLogDerivative_eq_powerLaw (μ : NonnegLaw) {q : ℝ} (hq : 0 ≤ q) (s : ℝ) :
    powerLogDerivative μ q s = -deriv (fun t => Real.log (laplace (powerLaw μ q hq) t)) s := by
  simp only [powerLogDerivative, powerLaplace_eq_laplace_powerLaw μ hq]

theorem hasDerivAt_log_powerLaplace_s (μ : NonnegLaw) (q : ℝ) {s : ℝ} (hs : 0 < s) :
    HasDerivAt (fun t => Real.log (powerLaplace μ q t))
      (-powerMoment μ 1 q s / powerLaplace μ q s) s :=
  (hasDerivAt_powerMoment_s μ 0 q hs).log (ne_of_gt (powerLaplace_pos μ hs))

theorem powerLogDerivative_eq_ratio (μ : NonnegLaw) (q : ℝ) {s : ℝ} (hs : 0 < s) :
    powerLogDerivative μ q s = powerMoment μ 1 q s / powerLaplace μ q s := by
  rw [powerLogDerivative, (hasDerivAt_log_powerLaplace_s μ q hs).deriv]
  ring

theorem hasDerivAt_powerLogDerivative_q (μ : NonnegLaw) {s q : ℝ}
    (hs : 0 < s) (hq : 0 < q) :
    HasDerivAt (fun r => powerLogDerivative μ r s)
      ((powerLogMoment μ 0 q s - s * powerLogMoment μ 1 q s) / powerLaplace μ q s +
        s * powerMoment μ 1 q s * powerLogMoment μ 0 q s / (powerLaplace μ q s)^2) q := by
  have hd := (hasDerivAt_powerMoment_one_q μ hs hq).div
    (hasDerivAt_powerLaplace_q μ hs hq) (ne_of_gt (powerLaplace_pos μ hs))
  have he : (fun r => powerLogDerivative μ r s) =
      (fun r => powerMoment μ 1 r s / powerLaplace μ r s) :=
    funext fun r => powerLogDerivative_eq_ratio μ r hs
  rw [he]
  convert! hd using 1
  field_simp
  ring

/-- The actual q derivative at one; no integral formula is built into the definition. -/
def powerTangent (μ : NonnegLaw) (s : ℝ) : ℝ :=
  deriv (fun q => powerLogDerivative μ q s) 1

theorem powerTangent_eq_expanded (μ : NonnegLaw) {s : ℝ} (hs : 0 < s) :
    powerTangent μ s = tiltedXLog μ s - s * dampedLogMoment μ 1 s / laplace μ s +
      s * dampedMoment μ 1 s * dampedLogMoment μ 0 s / (laplace μ s)^2 := by
  rw [powerTangent, (hasDerivAt_powerLogDerivative_q μ hs zero_lt_one).deriv]
  simp only [powerLogMoment_one, powerMoment_one, powerLaplace_one, tiltedXLog]
  ring

/-- The identification bridge applies to the actual power derivative, for every nonnegative law. -/
theorem hasDerivAt_mul_tiltedXLog_powerTangent (μ : NonnegLaw) {s : ℝ} (hs : 0 < s) :
    HasDerivAt (fun t => t * tiltedXLog μ t) (powerTangent μ s) s := by
  rw [powerTangent_eq_expanded μ hs]
  exact hasDerivAt_mul_tiltedXLog μ hs

theorem powerTangent_eq_deriv_mul_tiltedXLog (μ : NonnegLaw) {s : ℝ} (hs : 0 < s) :
    powerTangent μ s = deriv (fun t => t * tiltedXLog μ t) s :=
  (hasDerivAt_mul_tiltedXLog_powerTangent μ hs).deriv.symm

theorem hasDerivAt_log_powerLaplace_q (μ : NonnegLaw) {s q : ℝ}
    (hs : 0 < s) (hq : 0 < q) :
    HasDerivAt (fun r => Real.log (powerLaplace μ r s))
      (-s * powerLogMoment μ 0 q s / powerLaplace μ q s) q :=
  (hasDerivAt_powerLaplace_q μ hs hq).log (ne_of_gt (powerLaplace_pos μ hs))

theorem deriv_log_powerLaplace_q_one (μ : NonnegLaw) {s : ℝ} (hs : 0 < s) :
    deriv (fun q => Real.log (powerLaplace μ q s)) 1 = -s * tiltedXLog μ s := by
  rw [(hasDerivAt_log_powerLaplace_q μ hs zero_lt_one).deriv]
  simp only [powerLogMoment_one, powerLaplace_one, tiltedXLog]
  ring

/-- The s derivative of the q derivative is computed independently, with local domination. -/
theorem hasDerivAt_mixed_log_powerLaplace (μ : NonnegLaw) {s : ℝ} (hs : 0 < s) :
    HasDerivAt (fun t => deriv (fun q => Real.log (powerLaplace μ q t)) 1)
      (-powerTangent μ s) s := by
  have hd := (hasDerivAt_mul_tiltedXLog_powerTangent μ hs).neg
  apply hd.congr_of_eventuallyEq
  filter_upwards [eventually_gt_nhds hs] with t ht
  rw [deriv_log_powerLaplace_q_one μ ht]
  simp only [Pi.neg_apply]
  ring

theorem mixed_log_powerLaplace_commute (μ : NonnegLaw) {s : ℝ} (hs : 0 < s) :
    deriv (fun q => deriv (fun t => Real.log (powerLaplace μ q t)) s) 1 =
      deriv (fun t => deriv (fun q => Real.log (powerLaplace μ q t)) 1) s := by
  rw [(hasDerivAt_mixed_log_powerLaplace μ hs).deriv]
  have he : (fun q => deriv (fun t => Real.log (powerLaplace μ q t)) s) =
      (fun q => -powerLogDerivative μ q s) := by
    funext q
    simp only [powerLogDerivative, neg_neg]
  rw [he]
  have hd := (hasDerivAt_powerLogDerivative_q μ hs zero_lt_one).neg.deriv
  rw [← (hasDerivAt_powerLogDerivative_q μ hs zero_lt_one).deriv] at hd
  exact hd

end GGC
