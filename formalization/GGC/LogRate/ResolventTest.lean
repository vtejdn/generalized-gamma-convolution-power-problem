import GGC.LogRate.JumpCalculus

/-! # Smooth log-rate resolvents and bounds for their Taylor remainders -/

noncomputable section
open MeasureTheory Set
namespace GGC.LogRate

def logResolvent (s y : ℝ) : ℝ := (s + Real.exp y)⁻¹

theorem hasDerivAt_logResolvent {s : ℝ} (hs : 0 < s) (y : ℝ) :
    HasDerivAt (logResolvent s) (-Real.exp y/(s+Real.exp y)^2) y := by
  simpa only [logResolvent, Pi.inv_apply, neg_div] using!
    ((Real.hasDerivAt_exp y).const_add s).inv (ne_of_gt (add_pos hs (Real.exp_pos y)))

theorem deriv_logResolvent {s : ℝ} (hs : 0 < s) (y : ℝ) :
    deriv (logResolvent s) y = -Real.exp y/(s+Real.exp y)^2 :=
  (hasDerivAt_logResolvent hs y).deriv

theorem contDiff_logResolvent {s : ℝ} (hs : 0 < s) : ContDiff ℝ 2 (logResolvent s) :=
  (contDiff_const.add Real.contDiff_exp).inv (fun y => ne_of_gt (add_pos hs (Real.exp_pos y)))

theorem hasDerivAt_deriv_logResolvent {s : ℝ} (hs : 0 < s) (y : ℝ) :
    HasDerivAt (deriv (logResolvent s))
      (Real.exp y * (Real.exp y-s)/(s+Real.exp y)^3) y := by
  rw [show deriv (logResolvent s) = (fun x => -Real.exp x/(s+Real.exp x)^2) from
    funext (deriv_logResolvent hs)]
  have h : s+Real.exp y ≠ 0 := ne_of_gt (add_pos hs (Real.exp_pos y))
  have hd := (Real.hasDerivAt_exp y).neg.div
    (((Real.hasDerivAt_exp y).const_add s).pow 2) (by
      simpa only [Pi.pow_apply] using pow_ne_zero 2 h)
  simp only [Pi.pow_apply, Pi.neg_apply] at hd
  convert! hd using 1
  field_simp
  ring

theorem deriv_deriv_logResolvent {s : ℝ} (hs : 0 < s) (y : ℝ) :
    deriv (deriv (logResolvent s)) y = Real.exp y * (Real.exp y-s)/(s+Real.exp y)^3 :=
  (hasDerivAt_deriv_logResolvent hs y).deriv

theorem rateResolventWeight_le {s b : ℝ} (hs : 0 < s) (hb : 0 < b) :
    b/(s+b)^2 ≤ 1/s := by
  rw [div_le_div_iff₀ (sq_pos_of_pos (add_pos hs hb)) hs]
  nlinarith [sq_nonneg s, sq_nonneg b, mul_pos hs hb]

theorem abs_deriv_logResolvent_le {s : ℝ} (hs : 0 < s) (y : ℝ) :
    |deriv (logResolvent s) y| ≤ 1/s := by
  rw [deriv_logResolvent hs, abs_div, abs_neg, abs_of_pos (Real.exp_pos y),
    abs_of_nonneg (sq_nonneg _)]
  exact rateResolventWeight_le hs (Real.exp_pos y)

theorem abs_deriv_deriv_logResolvent_le {s : ℝ} (hs : 0 < s) (y : ℝ) :
    |deriv (deriv (logResolvent s)) y| ≤ 1/s := by
  let b := Real.exp y
  have hb : 0 < b := Real.exp_pos y
  have hsb : 0 < s+b := add_pos hs hb
  rw [deriv_deriv_logResolvent hs]
  change |b*(b-s)/(s+b)^3| ≤ 1/s
  rw [abs_div, abs_mul, abs_of_pos hb, abs_of_pos (pow_pos hsb 3)]
  have hab : |b-s| ≤ s+b := by
    apply abs_le.mpr
    constructor <;> linarith
  calc b*|b-s|/(s+b)^3 ≤ b*(s+b)/(s+b)^3 :=
      div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left hab hb.le) (pow_nonneg hsb.le 3)
    _ = b/(s+b)^2 := by field_simp
    _ ≤ 1/s := rateResolventWeight_le hs hb

theorem abs_logResolvent_remainder_le {s : ℝ} (hs : 0 < s) (y v : ℝ) :
    |taylorRemainder (logResolvent s) y v| ≤ (1/s)/2*v^2 :=
  abs_taylorRemainder_le (contDiff_logResolvent hs) (abs_deriv_deriv_logResolvent_le hs) y v

/-- A global bound for the unbounded drift coordinate times the test derivative.
It is valid without any moment assumption on a law of `y`. -/
theorem abs_y_mul_deriv_logResolvent_le {s : ℝ} (hs : 0 < s) (y : ℝ) :
    |y * deriv (logResolvent s) y| ≤ 1 + 1/s^2 := by
  let b := Real.exp y
  have hb : 0 < b := Real.exp_pos y
  have hd : 0 < (s+b)^2 := sq_pos_of_pos (add_pos hs hb)
  rw [deriv_logResolvent hs, abs_mul, abs_div, abs_neg,
    abs_of_pos (Real.exp_pos y), abs_of_nonneg (sq_nonneg (s+Real.exp y))]
  change |y| * (b/(s+b)^2) ≤ 1+1/s^2
  rw [← mul_div_assoc]
  by_cases hy : 0 ≤ y
  · rw [abs_of_nonneg hy]
    have hyb : y ≤ b := by dsimp only [b]; linarith [Real.add_one_le_exp y]
    have hnum : y*b ≤ (s+b)^2 := by
      have := mul_le_mul_of_nonneg_right hyb hb.le
      nlinarith [sq_nonneg s, mul_pos hs hb]
    have hle : y*b/(s+b)^2 ≤ 1 := (div_le_one hd).mpr hnum
    exact hle.trans (le_add_of_nonneg_right (by positivity))
  · rw [abs_of_neg (lt_of_not_ge hy)]
    have hyb : -y ≤ b⁻¹ := by
      have h := Real.add_one_le_exp (-y)
      rw [Real.exp_neg] at h
      dsimp only [b]
      linarith
    have hnum : -y*b ≤ 1 := by
      have h := mul_le_mul_of_nonneg_right hyb hb.le
      rwa [inv_mul_cancel₀ (ne_of_gt hb)] at h
    calc
      -y*b/(s+b)^2 ≤ 1/(s+b)^2 := div_le_div_of_nonneg_right hnum hd.le
      _ ≤ 1/s^2 := one_div_le_one_div_of_le (sq_pos_of_pos hs) (by nlinarith [mul_pos hs hb])
      _ ≤ 1+1/s^2 := le_add_of_nonneg_left zero_le_one

end GGC.LogRate
