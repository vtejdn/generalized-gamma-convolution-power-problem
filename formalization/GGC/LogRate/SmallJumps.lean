import GGC.LogRate.JumpTruncation
import Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp

/-! # The omitted second moment near zero

The standard inequality `x ≤ sinh x` on the nonnegative half-line gives
`v² jumpDensity v ≤ 1`, including the totalized value at zero.
-/

noncomputable section
open MeasureTheory Set Filter Real
namespace GGC.LogRate

theorem sq_mul_jumpDensity_le_one (v : ℝ) : v^2 * jumpDensity v ≤ 1 := by
  by_cases hv : v = 0
  · simp [hv]
  have ha : |v/2| ≤ |sinh (v/2)| := by
    rw [abs_sinh]
    exact self_le_sinh_iff.mpr (abs_nonneg _)
  have hsq : (v/2)^2 ≤ sinh (v/2)^2 := by
    simpa only [sq_abs] using (sq_le_sq₀ (abs_nonneg _) (abs_nonneg _)).mpr ha
  have hd : 0 < 4 * sinh (v/2)^2 := by nlinarith [sq_pos_of_ne_zero hv]
  rw [jumpDensity_eq_sinh, mul_one_div]
  apply (div_le_iff₀ hd).mpr
  nlinarith

theorem integral_sq_smallJumps_le {ε : ℝ} (hε : 0 ≤ ε) :
    (∫ v in {v : ℝ | |v| ≤ ε}, v^2 ∂jumpMeasure) ≤ 2 * ε := by
  have he : {v : ℝ | |v| ≤ ε} = Icc (-ε) ε := by ext v; simp only [mem_setOf_eq, mem_Icc, abs_le]
  rw [he, jumpMeasure, restrict_withDensity measurableSet_Icc,
    integral_withDensity_eq_integral_toReal_smul measurable_jumpDensity.ennreal_ofReal
      (Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)]
  simp only [ENNReal.toReal_ofReal (jumpDensity_nonneg _), smul_eq_mul]
  calc
    _ ≤ ∫ _ in Icc (-ε) ε, (1 : ℝ) := by
      apply integral_mono_of_nonneg
        (Eventually.of_forall fun v => mul_nonneg (jumpDensity_nonneg v) (sq_nonneg v))
        (integrableOn_const (by simp))
      exact Eventually.of_forall fun v => by simpa only [mul_comm] using sq_mul_jumpDensity_le_one v
    _ = _ := by simp [Real.volume_real_Icc, hε]; ring

end GGC.LogRate
