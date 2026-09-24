import GGC.LaplaceContinuity

/-! # Bounded tests on nonnegative laws and their narrow continuity -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC

theorem integrable_nonnegLaw_test (μ : NonnegLaw) {f : ℝ → ℝ} (hf : Continuous f)
    {C : ℝ} (hb : ∀ x, 0 ≤ x → |f x| ≤ C) : Integrable f (μ.law : Measure ℝ) := by
  apply (integrable_const C).mono' hf.measurable.aestronglyMeasurable
  filter_upwards [μ.nonneg] with x hx
  simpa only [Real.norm_eq_abs] using hb x hx

theorem abs_integral_nonnegLaw_test_le (μ : NonnegLaw) {f : ℝ → ℝ}
    {C : ℝ} (hb : ∀ x, 0 ≤ x → |f x| ≤ C) : |∫ x, f x ∂(μ.law : Measure ℝ)| ≤ C := by
  have h := norm_integral_le_of_norm_le_const (μ := (μ.law : Measure ℝ))
    (f := f) (C := C) (μ.nonneg.mono fun x hx => by simpa only [Real.norm_eq_abs] using hb x hx)
  simpa only [Real.norm_eq_abs, probReal_univ, mul_one] using h

theorem abs_integral_sub_nonnegLaw_test_le (μ : NonnegLaw) {f g : ℝ → ℝ}
    (hf : Integrable f (μ.law : Measure ℝ)) (hg : Integrable g (μ.law : Measure ℝ))
    {C : ℝ} (hb : ∀ x, 0 ≤ x → |f x-g x| ≤ C) :
    |(∫ x, f x ∂(μ.law : Measure ℝ)) - (∫ x, g x ∂(μ.law : Measure ℝ))| ≤ C := by
  rw [← integral_sub hf hg]
  exact abs_integral_nonnegLaw_test_le μ hb

theorem continuous_integral_nonnegLaw_test {X : Type*} [TopologicalSpace X]
    (μ : X → NonnegLaw) (hc : Continuous (fun x => (μ x).law))
    {f : ℝ → ℝ} (hf : Continuous f) {C : ℝ} (hb : ∀ x, 0 ≤ x → |f x| ≤ C) :
    Continuous (fun x => ∫ y, f y ∂((μ x).law : Measure ℝ)) := by
  let b : BoundedContinuousFunction ℝ ℝ := BoundedContinuousFunction.mkOfBound
    ⟨fun x => f (max x 0), hf.comp (continuous_id.max continuous_const)⟩ (2*C) (fun x y => by
      change |f (max x 0)-f (max y 0)| ≤ 2*C
      have hab : |f (max x 0)-f (max y 0)| ≤ |f (max x 0)|+|f (max y 0)| := by
        simpa using abs_sub_le (f (max x 0)) 0 (f (max y 0))
      exact hab.trans (by linarith [hb (max x 0) (le_max_right _ _),hb (max y 0) (le_max_right _ _)]))
  have he (x : X) : (∫ y, b y ∂((μ x).law : Measure ℝ)) = ∫ y, f y ∂((μ x).law : Measure ℝ) := by
    apply integral_congr_ae
    filter_upwards [(μ x).nonneg] with y hy
    change f (max y 0) = f y
    rw [max_eq_left hy]
  have h := (ProbabilityMeasure.continuous_integral_boundedContinuousFunction b).comp hc
  simpa only [Function.comp_def, he] using h

end GGC
