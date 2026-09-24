import GGC.Thorin.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.LogBounds

/-!
# Finite-gamma approximation of a nonnegative drift

The shape `n + 1` gamma factor with rate `(n + 1) / a` has a Laplace
exponent bounded by `a * s` and converging to it. The exponent is also
defined at zero drift, where it vanishes and no gamma factor is needed.
-/

noncomputable section
open Filter Topology
namespace GGC

/-- The logarithmic exponent of the gamma factor approximating drift `a`. -/
def driftGammaExponent (a : ℝ) (n : ℕ) (s : ℝ) : ℝ :=
  ((n : ℝ) + 1) * Real.log (1 + a * s / ((n : ℝ) + 1))

theorem driftGammaExponent_nonneg {a s : ℝ} (ha : 0 ≤ a) (hs : 0 ≤ s) (n : ℕ) :
    0 ≤ driftGammaExponent a n s := by
  unfold driftGammaExponent
  apply mul_nonneg (by positivity)
  apply Real.log_nonneg
  have hdiv : 0 ≤ a * s / ((n : ℝ) + 1) := by positivity
  linarith

theorem driftGammaExponent_le {a s : ℝ} (ha : 0 ≤ a) (hs : 0 ≤ s) (n : ℕ) :
    driftGammaExponent a n s ≤ a * s := by
  have hn : (0 : ℝ) < (n : ℝ) + 1 := by positivity
  have hlog := Real.log_le_sub_one_of_pos
    (show 0 < 1 + a * s / ((n : ℝ) + 1) by positivity)
  calc
    driftGammaExponent a n s ≤ ((n : ℝ) + 1) * (a * s / ((n : ℝ) + 1)) := by
      apply mul_le_mul_of_nonneg_left _ hn.le
      linarith
    _ = a * s := by field_simp

@[simp]
theorem driftGammaExponent_zero (n : ℕ) (s : ℝ) : driftGammaExponent 0 n s = 0 := by
  simp [driftGammaExponent]

@[simp]
theorem driftGammaExponent_zero_parameter (a : ℝ) (n : ℕ) :
    driftGammaExponent a n 0 = 0 := by
  simp [driftGammaExponent]

/-- The classical logarithm limit directly supplies the gamma drift limit. -/
theorem tendsto_driftGammaExponent (a s : ℝ) :
    Tendsto (fun n : ℕ => driftGammaExponent a n s) atTop (𝓝 (a * s)) := by
  apply (Real.tendsto_mul_log_one_add_div_atTop (a * s)).comp
  exact tendsto_atTop_add_const_right _ 1 tendsto_natCast_atTop_atTop

/-- The strictly positive shape of the drift approximation factor. -/
def driftGammaShape (n : ℕ) : PosReal := ⟨(n : ℝ) + 1, by positivity⟩

/-- A positive drift determines a strictly positive rate. -/
def driftGammaRate (a : ℝ) (ha : 0 < a) (n : ℕ) : PosReal :=
  ⟨((n : ℝ) + 1) / a, by positivity⟩

theorem driftGammaExponent_eq_log_rate {a : ℝ} (ha : 0 < a) (n : ℕ) (s : ℝ) :
    driftGammaExponent a n s =
      (driftGammaShape n).val * Real.log (1 + s / (driftGammaRate a ha n).val) := by
  simp only [driftGammaExponent, driftGammaShape, driftGammaRate, div_div_eq_mul_div,
    mul_comm s a]

end GGC
