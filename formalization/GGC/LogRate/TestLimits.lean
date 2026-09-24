import GGC.LogRate.Continuity
import GGC.LogRate.RetainedJumps
import GGC.Foundations.SmoothCutoffBounds
import GGC.Foundations.MomentBounds

/-! # Generator control and limits for expanding smooth tests -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.LogRate
open GGC.Analysis

theorem generator_derivative_bound (B : PosReal) (F : ProbabilityMeasure ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) {C₁ C₂ : ℝ}
    (h₁ : ∀ y, |deriv φ y| ≤ C₁) (h₂ : ∀ y, |deriv (deriv φ) y| ≤ C₂) (y : ℝ) :
    |generator B F φ y| ≤ |drift B F y| * C₁ + C₂/2*jumpSecondMoment := by
  change |drift B F y*deriv φ y + compensatedJump (acceptance B F y) φ y| ≤ _
  exact (abs_add_le _ _).trans (add_le_add
    (by simpa only [abs_mul] using mul_le_mul_of_nonneg_left (h₁ y) (abs_nonneg (drift B F y)))
    (abs_compensatedJump_le (fun v => (acceptance_bounds B F y v).1)
      (fun v => (acceptance_bounds B F y v).2) hφ h₂ y))

theorem generator_linearGrowth_bound {a b C : ℝ} (ha : 0 < a) (hC : 0 ≤ C) :
    ∃ M : ℝ, 0 ≤ M ∧ ∀ (B : PosReal) (F : ProbabilityMeasure ℝ), B.val ∈ Icc a b →
      ∀ (φ : ℝ → ℝ), ContDiff ℝ 2 φ → (∀ y, |deriv φ y| ≤ C) →
        (∀ y, |deriv (deriv φ) y| ≤ C) → ∀ y, |generator B F φ y| ≤ M*(1+|y|) := by
  obtain ⟨D, hD⟩ := drift_compactMass_bound (b := b) ha
  let M := (1+|D|)*C + C/2*jumpSecondMoment
  have hJ : 0 ≤ C/2*jumpSecondMoment := mul_nonneg (by positivity) jumpSecondMoment_nonneg
  refine ⟨M, by dsimp [M]; positivity, fun B F hB φ hφ h₁ h₂ y => ?_⟩
  have hd : |drift B F y| ≤ |y|+|D| := by
    calc
      _ = |y+(drift B F y-y)| := by congr 1; ring
      _ ≤ |y|+|drift B F y-y| := abs_add_le _ _
      _ ≤ _ := add_le_add le_rfl ((hD B F hB y).trans (le_abs_self D))
  calc
    _ ≤ |drift B F y| * C + C/2*jumpSecondMoment := generator_derivative_bound B F hφ h₁ h₂ y
    _ ≤ (|y|+|D|)*C + C/2*jumpSecondMoment :=
      add_le_add (mul_le_mul_of_nonneg_right hd hC) le_rfl
    _ ≤ M*(1+|y|) := by
      dsimp [M]
      nlinarith [mul_nonneg (abs_nonneg y) (mul_nonneg (abs_nonneg D) hC),
        mul_nonneg (abs_nonneg y) hJ]

theorem tendsto_generator_cutoffTest (B : PosReal) (F : ProbabilityMeasure ℝ)
    {φ : ℝ → ℝ} (hφ : LinearGrowthC2 φ) (y : ℝ) :
    Tendsto (fun R : ℝ => generator B F (cutoffTest R φ) y) atTop (𝓝 (generator B F φ y)) := by
  obtain ⟨C, _, hc⟩ := exists_cutoffTest_uniform_bound hφ
  have hacc := measurable_acceptance B F y
  have hj := tendsto_integral_filter_of_dominated_convergence
    (μ := jumpMeasure) (F := fun R v : ℝ => taylorRemainder (cutoffTest R φ) y v * acceptance B F y v)
    (f := fun v => taylorRemainder φ y v*acceptance B F y v) (l := atTop)
    (fun v : ℝ => C/2*v^2)
    (Eventually.of_forall fun R => by
      have hm : Measurable (fun v => taylorRemainder (cutoffTest R φ) y v*acceptance B F y v) :=
        ((((contDiff_cutoffTest hφ.contDiff R).continuous.measurable.comp (measurable_const.add measurable_id)).sub
          measurable_const).sub (measurable_id.mul_const _)).mul hacc
      exact hm.aestronglyMeasurable)
    (by
      filter_upwards [eventually_ge_atTop (1 : ℝ)] with R hR
      apply Eventually.of_forall
      intro v
      rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (acceptance_bounds B F y v).1]
      exact (mul_le_of_le_one_right (abs_nonneg _) (acceptance_bounds B F y v).2).trans
        (abs_taylorRemainder_le (contDiff_cutoffTest hφ.contDiff R) (fun x => (hc R hR x).2.2) y v))
    (integrable_sq_jumpMeasure.const_mul _) (Eventually.of_forall fun v => by
      apply tendsto_const_nhds.congr'
      filter_upwards [eventually_gt_atTop |y|, eventually_gt_atTop |y+v|] with R hy hyv
      simp only [taylorRemainder, cutoffTest_eq hy, cutoffTest_eq hyv, deriv_cutoffTest_eq hy])
  have hd : Tendsto (fun R : ℝ => drift B F y*deriv (cutoffTest R φ) y) atTop
      (𝓝 (drift B F y*deriv φ y)) := by
    apply tendsto_const_nhds.congr'
    filter_upwards [eventually_gt_atTop |y|] with R hR
    rw [deriv_cutoffTest_eq hR]
  have ht : Tendsto (fun R : ℝ => drift B F y*deriv (cutoffTest R φ) y +
      ∫ v, taylorRemainder (cutoffTest R φ) y v*acceptance B F y v ∂jumpMeasure) atTop
      (𝓝 (drift B F y*deriv φ y + ∫ v, taylorRemainder φ y v*acceptance B F y v ∂jumpMeasure)) := hd.add hj
  simpa only [generator_eq, taylorRemainder] using ht

theorem tendsto_integral_cutoffTest (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y) (F : Measure ℝ)) {φ : ℝ → ℝ} (hφ : LinearGrowthC2 φ) :
    Tendsto (fun R : ℝ => ∫ y, cutoffTest R φ y ∂(F : Measure ℝ)) atTop
      (𝓝 (∫ y, φ y ∂(F : Measure ℝ))) := by
  obtain ⟨C, _, hc⟩ := hφ.bound
  apply tendsto_integral_filter_of_dominated_convergence (fun y => C*(1+|y|))
    (Eventually.of_forall fun R => (contDiff_cutoffTest hφ.contDiff R).continuous.measurable.aestronglyMeasurable)
    (Eventually.of_forall fun R => Eventually.of_forall fun y => by
      simpa only [Real.norm_eq_abs] using (abs_cutoffTest_le φ R y).trans (hc y).1)
    (((integrable_const 1).add hF.abs).const_mul C)
  apply Eventually.of_forall
  intro y
  apply tendsto_const_nhds.congr'
  filter_upwards [eventually_gt_atTop |y|] with R hR
  exact (cutoffTest_eq hR).symm

theorem tendsto_averagedGenerator_cutoffTest (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y) (F : Measure ℝ)) {φ : ℝ → ℝ} (hφ : LinearGrowthC2 φ) :
    Tendsto (fun R : ℝ => averagedGenerator B F (cutoffTest R φ)) atTop
      (𝓝 (averagedGenerator B F φ)) := by
  obtain ⟨C, hC, hc⟩ := exists_cutoffTest_uniform_bound hφ
  obtain ⟨M, _, hm⟩ := generator_linearGrowth_bound (a := B.val) (b := B.val) B.property hC
  apply tendsto_integral_filter_of_dominated_convergence
    (F := fun R y : ℝ => generator B F (cutoffTest R φ) y) (f := generator B F φ)
    (fun y => M*(1+|y|))
    (Eventually.of_forall fun R =>
      ((generator_jointlyMeasurable (contDiff_cutoffTest hφ.contDiff R)).comp
        (show Measurable (fun y : ℝ => (B,F,y)) by fun_prop)).aestronglyMeasurable)
    (by
      filter_upwards [eventually_ge_atTop (1 : ℝ)] with R hR
      apply Eventually.of_forall
      intro y
      simpa only [Real.norm_eq_abs] using hm B F ⟨le_rfl,le_rfl⟩ _ (contDiff_cutoffTest hφ.contDiff R)
        (fun x => (hc R hR x).2.1) (fun x => (hc R hR x).2.2) y)
    (((integrable_const 1).add hF.abs).const_mul M)
    (Eventually.of_forall fun y => tendsto_generator_cutoffTest B F hφ y)

end GGC.LogRate
