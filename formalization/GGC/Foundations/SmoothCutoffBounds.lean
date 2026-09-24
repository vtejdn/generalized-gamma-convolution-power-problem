import GGC.Foundations.SmoothCutoff

/-! # Uniform first and second derivative bounds for expanding cutoffs -/

noncomputable section
open Set Filter
open scoped Topology
namespace GGC.Analysis

/-- The larger weak test domain in the identification contract. -/
structure LinearGrowthC2 (φ : ℝ → ℝ) : Prop where
  contDiff : ContDiff ℝ 2 φ
  bound : ∃ C : ℝ, 0 ≤ C ∧ ∀ x, |φ x| ≤ C*(1+|x|) ∧
    |deriv φ x| ≤ C ∧ |deriv (deriv φ) x| ≤ C

theorem exists_smoothCutoff_deriv_bounds :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ R : ℝ, 0 < R → ∀ x : ℝ,
      |deriv (smoothCutoff R) x| ≤ C/R ∧ |deriv (deriv (smoothCutoff R)) x| ≤ C/R^2 := by
  obtain ⟨C₁, h₁⟩ := unitBump.hasCompactSupport.deriv.exists_bound_of_continuous
    ((unitBump.contDiff : ContDiff ℝ 2 _).continuous_deriv (by norm_num))
  obtain ⟨C₂, h₂⟩ := unitBump.hasCompactSupport.deriv.deriv.exists_bound_of_continuous
    (((unitBump.contDiff : ContDiff ℝ 3 _).deriv' : ContDiff ℝ 2 _).continuous_deriv (by norm_num))
  let C := max |C₁| |C₂|
  have hC : 0 ≤ C := (abs_nonneg C₁).trans (le_max_left _ _)
  refine ⟨C, hC, fun R hR x => ?_⟩
  constructor
  · rw [deriv_smoothCutoff, abs_div, abs_of_pos hR]
    apply div_le_div_of_nonneg_right _ hR.le
    have hh : |deriv (unitBump : ℝ → ℝ) (x/R)| ≤ C₁ := by
      simpa only [Real.norm_eq_abs] using h₁ (x/R)
    exact hh.trans
      ((le_abs_self C₁).trans (le_max_left _ _))
  · rw [deriv_deriv_smoothCutoff, abs_div, abs_of_nonneg (sq_nonneg R)]
    apply div_le_div_of_nonneg_right _ (sq_nonneg R)
    have hh : |deriv (deriv (unitBump : ℝ → ℝ)) (x/R)| ≤ C₂ := by
      simpa only [Real.norm_eq_abs] using h₂ (x/R)
    exact hh.trans
      ((le_abs_self C₂).trans (le_max_right _ _))

theorem exists_smoothCutoff_weighted_deriv_bounds :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ R : ℝ, 1 ≤ R → ∀ x : ℝ,
      |deriv (smoothCutoff R) x| ≤ C ∧
      |deriv (smoothCutoff R) x| * (1+|x|) ≤ 3*C ∧
      |deriv (deriv (smoothCutoff R)) x| * (1+|x|) ≤ 3*C := by
  obtain ⟨C, hC, hb⟩ := exists_smoothCutoff_deriv_bounds
  refine ⟨C, hC, fun R hR x => ?_⟩
  have hR₀ : 0 < R := zero_lt_one.trans_le hR
  have hR₂ : R ≤ R^2 := by nlinarith [mul_nonneg (sub_nonneg.mpr hR) hR₀.le]
  have hfirst : |deriv (smoothCutoff R) x| ≤ C :=
    (hb R hR₀ x).1.trans ((div_le_self hC hR))
  refine ⟨hfirst, ?_⟩
  by_cases hx : |x| ≤ 2*R
  · have hr₁ : (1+|x|)/R ≤ 3 := (div_le_iff₀ hR₀).mpr (by linarith)
    have hr₂ : (1+|x|)/R^2 ≤ 3 := (div_le_iff₀ (sq_pos_of_pos hR₀)).mpr (by linarith)
    constructor
    · calc
        _ ≤ (C/R)*(1+|x|) := mul_le_mul_of_nonneg_right (hb R hR₀ x).1 (by positivity)
        _ = C*((1+|x|)/R) := by ring
        _ ≤ C*3 := mul_le_mul_of_nonneg_left hr₁ hC
        _ = _ := by ring
    · calc
        _ ≤ (C/R^2)*(1+|x|) := mul_le_mul_of_nonneg_right (hb R hR₀ x).2 (by positivity)
        _ = C*((1+|x|)/R^2) := by ring
        _ ≤ C*3 := mul_le_mul_of_nonneg_left hr₂ hC
        _ = _ := by ring
  · have hz := smoothCutoff_eventuallyEq_zero hR₀ (lt_of_not_ge hx)
    have hd : deriv (smoothCutoff R) x = 0 := by simpa using hz.deriv_eq
    have hd₂ : deriv (deriv (smoothCutoff R)) x = 0 := by simpa using hz.deriv.deriv_eq
    simp only [hd, hd₂, abs_zero, zero_mul]
    constructor <;> positivity

theorem deriv_cutoffTest {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (R x : ℝ) :
    deriv (cutoffTest R φ) x =
      deriv (smoothCutoff R) x * φ x + smoothCutoff R x * deriv φ x :=
  deriv_fun_mul ((contDiff_smoothCutoff R : ContDiff ℝ 2 _).differentiable (by norm_num) x)
    (hφ.differentiable (by norm_num) x)

theorem deriv_deriv_cutoffTest {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (R x : ℝ) :
    deriv (deriv (cutoffTest R φ)) x =
      deriv (deriv (smoothCutoff R)) x * φ x +
        2*deriv (smoothCutoff R) x*deriv φ x + smoothCutoff R x*deriv (deriv φ) x := by
  have hcd := (contDiff_smoothCutoff R : ContDiff ℝ 2 _).differentiable (by norm_num) x
  have hcd₂ := ((contDiff_smoothCutoff R : ContDiff ℝ 2 _).deriv' : ContDiff ℝ 1 _).differentiable (by norm_num) x
  have hpd := hφ.differentiable (by norm_num) x
  have hpd₂ := (hφ.deriv' : ContDiff ℝ 1 _).differentiable (by norm_num) x
  have he : deriv (cutoffTest R φ) = fun y =>
      deriv (smoothCutoff R) y*φ y + smoothCutoff R y*deriv φ y := funext (deriv_cutoffTest hφ R)
  have hd : HasDerivAt (deriv (cutoffTest R φ))
      (deriv (deriv (smoothCutoff R)) x*φ x +
        2*deriv (smoothCutoff R) x*deriv φ x + smoothCutoff R x*deriv (deriv φ) x) x := by
    rw [he]
    convert! (hcd₂.hasDerivAt.mul hpd.hasDerivAt).add (hcd.hasDerivAt.mul hpd₂.hasDerivAt) using 1
    ring
  exact hd.deriv

theorem exists_cutoffTest_uniform_bound {φ : ℝ → ℝ} (hφ : LinearGrowthC2 φ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ R : ℝ, 1 ≤ R → ∀ x : ℝ,
      |cutoffTest R φ x| ≤ C*(1+|x|) ∧
      |deriv (cutoffTest R φ) x| ≤ C ∧ |deriv (deriv (cutoffTest R φ)) x| ≤ C := by
  obtain ⟨A, hA, ha⟩ := exists_smoothCutoff_weighted_deriv_bounds
  obtain ⟨B, hB, hb⟩ := hφ.bound
  let C := (5*A+1)*B
  have hBC : B ≤ C := by dsimp [C]; nlinarith [mul_nonneg hA hB]
  refine ⟨C, by dsimp [C]; positivity, fun R hR x => ?_⟩
  have hcut : |smoothCutoff R x| ≤ 1 := by
    rw [abs_of_nonneg (smoothCutoff_nonneg R x)]
    exact smoothCutoff_le_one R x
  have hterm {d : ℝ} (hd : |d| * (1+|x|) ≤ 3*A) : |d*φ x| ≤ 3*A*B := by
    rw [abs_mul]
    calc
      _ ≤ |d| * (B*(1+|x|)) := mul_le_mul_of_nonneg_left (hb x).1 (abs_nonneg _)
      _ = B*(|d| * (1+|x|)) := by ring
      _ ≤ B*(3*A) := mul_le_mul_of_nonneg_left hd hB
      _ = _ := by ring
  have hlast₁ : |smoothCutoff R x*deriv φ x| ≤ B := by
    simpa only [abs_mul, one_mul] using
      mul_le_mul hcut (hb x).2.1 (abs_nonneg _) zero_le_one
  have hlast₂ : |smoothCutoff R x*deriv (deriv φ) x| ≤ B := by
    simpa only [abs_mul, one_mul] using
      mul_le_mul hcut (hb x).2.2 (abs_nonneg _) zero_le_one
  refine ⟨(abs_cutoffTest_le φ R x).trans ((hb x).1.trans (mul_le_mul_of_nonneg_right hBC (by positivity))), ?_, ?_⟩
  · rw [deriv_cutoffTest hφ.contDiff]
    exact ((abs_add_le _ _).trans (add_le_add (hterm (ha R hR x).2.1) hlast₁)).trans
      (by dsimp [C]; nlinarith [mul_nonneg hA hB])
  · rw [deriv_deriv_cutoffTest hφ.contDiff]
    have hmid : |2*deriv (smoothCutoff R) x*deriv φ x| ≤ 2*A*B := by
      rw [abs_mul, abs_mul, abs_of_pos (by norm_num : (0 : ℝ) < 2)]
      gcongr
      · exact (ha R hR x).1
      · exact (hb x).2.1
    calc
      _ ≤ |deriv (deriv (smoothCutoff R)) x*φ x| +
          |2*deriv (smoothCutoff R) x*deriv φ x| + |smoothCutoff R x*deriv (deriv φ) x| :=
        (abs_add_le _ _).trans (add_le_add (abs_add_le _ _) le_rfl)
      _ ≤ 3*A*B + 2*A*B + B := add_le_add (add_le_add (hterm (ha R hR x).2.2) hmid) hlast₂
      _ = C := by dsimp [C]; ring

end GGC.Analysis
