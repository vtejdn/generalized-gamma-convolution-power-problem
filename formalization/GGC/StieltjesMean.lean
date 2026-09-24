import Definitions
import GGC.Foundations.Posterior

/-! # Stieltjes means of actual positive-rate probability measures

All estimates are uniform over arbitrary probabilities on `(0,∞)`. In
particular, no endpoint moment or Thorin admissibility assumption is used.
-/

noncomputable section
open MeasureTheory Set

namespace GGC
open RandomMeasure

def stieltjesMean (P : ProbabilityMeasure PosReal) (s : ℝ) : ℝ :=
  ∫ b, 1 / (s + b.val) ∂(P : Measure PosReal)

@[fun_prop] theorem measurable_stieltjesMean :
    Measurable (fun x : ProbabilityMeasure PosReal × ℝ => stieltjesMean x.1 x.2) := by
  apply measurable_probability_integral measurable_fst
  unfold Function.uncurry
  fun_prop

theorem integrable_stieltjesMean (P : ProbabilityMeasure PosReal) {s : ℝ} (hs : 0 < s) :
    Integrable (fun b : PosReal => 1 / (s + b.val)) (P : Measure PosReal) := by
  apply (integrable_const (1 / s)).mono'
    ((show Measurable (fun b : PosReal => 1 / (s + b.val)) by fun_prop).aestronglyMeasurable)
  exact Filter.Eventually.of_forall fun b => by
    rw [Real.norm_eq_abs, abs_of_pos (one_div_pos.mpr (add_pos hs b.property))]
    exact one_div_le_one_div_of_le hs (by linarith [b.property])

theorem stieltjesMean_pos (P : ProbabilityMeasure PosReal) {s : ℝ} (hs : 0 < s) :
    0 < stieltjesMean P s := by
  unfold stieltjesMean
  rw [integral_pos_iff_support_of_nonneg (fun b => (one_div_pos.mpr (add_pos hs b.property)).le)
    (integrable_stieltjesMean P hs)]
  have he : Function.support (fun b : PosReal => 1 / (s + b.val)) = univ := by
    ext b
    simp [Function.mem_support, ne_of_gt (show 0 < s + b.val by linarith [b.property])]
  rw [he]
  simp

theorem stieltjesMean_le (P : ProbabilityMeasure PosReal) {s : ℝ} (hs : 0 < s) :
    stieltjesMean P s ≤ 1 / s := by
  calc stieltjesMean P s ≤ ∫ _ : PosReal, 1 / s ∂(P : Measure PosReal) :=
      integral_mono (integrable_stieltjesMean P hs) (integrable_const _)
        (fun b => one_div_le_one_div_of_le hs (by linarith [b.property]))
    _ = 1 / s := by simp

theorem stieltjesMean_atomMixture (Q : ProbabilityMeasure PosReal) (z : UnitWeight)
    (b : PosReal) {s : ℝ} (hs : 0 < s) :
    stieltjesMean (atomMixture Q z b) s =
      (1 - z.val) * stieltjesMean Q s + z.val / (s + b.val) := by
  simpa only [stieltjesMean, div_eq_mul_inv, mul_one, one_mul] using
    integral_atomMixture z b (integrable_stieltjesMean Q hs) (by fun_prop)

/-- The atom of weight z gives the posterior lower bound at its own rate. -/
theorem atomMixture_stieltjesMean_bounds (Q : ProbabilityMeasure PosReal)
    (z : UnitWeight) (b : PosReal) :
    z.val / 2 ≤ b.val * stieltjesMean (atomMixture Q z b) b.val ∧
      b.val * stieltjesMean (atomMixture Q z b) b.val ≤ 1 := by
  constructor
  · rw [stieltjesMean_atomMixture Q z b b.property]
    have hp : 0 ≤ b.val * ((1 - z.val) * stieltjesMean Q b.val) :=
      mul_nonneg b.property.le (mul_nonneg (sub_nonneg.mpr z.property.2)
        (stieltjesMean_pos Q b.property).le)
    have he : b.val * (z.val / (b.val + b.val)) = z.val / 2 := by
      field_simp [ne_of_gt b.property]
      ring
    rw [mul_add, he]
    linarith
  · have h := mul_le_mul_of_nonneg_left
      (stieltjesMean_le (atomMixture Q z b) b.property) b.property.le
    simpa [ne_of_gt b.property] using h

/-- Absolute logarithmic control from the posterior atom. -/
theorem atomMixture_neg_log_bounds (Q : ProbabilityMeasure PosReal)
    (z : UnitWeight) (hz : 0 < z.val) (b : PosReal) :
    0 ≤ -Real.log (b.val * stieltjesMean (atomMixture Q z b) b.val) ∧
      -Real.log (b.val * stieltjesMean (atomMixture Q z b) b.val) ≤
        Real.log 2 - Real.log z.val := by
  have hp : 0 < b.val * stieltjesMean (atomMixture Q z b) b.val :=
    mul_pos b.property (stieltjesMean_pos _ b.property)
  have h := atomMixture_stieltjesMean_bounds Q z b
  refine ⟨neg_nonneg.mpr (Real.log_nonpos hp.le h.2), ?_⟩
  have hl := Real.log_le_log (show 0 < z.val / 2 by positivity) h.1
  rw [Real.log_div (ne_of_gt hz) (by norm_num : (2 : ℝ) ≠ 0)] at hl
  linarith

end GGC
