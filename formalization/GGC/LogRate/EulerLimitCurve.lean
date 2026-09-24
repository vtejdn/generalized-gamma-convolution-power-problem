import GGC.LogRate.EulerInterpolation
import GGC.Foundations.CurveCompactness
import GGC.Foundations.MomentLimits

/-! # A common Euler limit curve with initial state and second-moment bound

This module constructs the narrow continuous curve and a common subsequence.
The limiting weak equation is a separate consistency/limit-passage obligation.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology NNReal
namespace GGC.LogRate
open GGC.Analysis

def eulerCurveMap (h : EulerStep) (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ) :
    C(Icc (0 : ℝ) T, ProbabilityMeasure ℝ) :=
  ⟨eulerCurve h B₀ F₀ T, continuous_eulerCurve h B₀ F₀ hF T⟩

/-- Extraction takes place in the space of entire curves, independently of tests and times. -/
theorem exists_eulerCurve_subsequence (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ) (h : ℕ → EulerStep) :
    ∃ g : C(Icc (0 : ℝ) T, ProbabilityMeasure ℝ), ∃ s : ℕ → ℕ,
      StrictMono s ∧ Tendsto (fun n => eulerCurveMap (h (s n)) B₀ F₀ hF T) atTop (𝓝 g) := by
  apply exists_tendsto_subseq_of_compactC2_lipschitz
    (fun n => eulerCurveMap (h n) B₀ F₀ hF T)
    (isCompact_closure_eulerInterpolatedLawsUpTo B₀ F₀ hF T)
  · intro n t
    exact subset_closure ⟨h n, ⟨t.val,t.property.1⟩, t.property.2, rfl⟩
  · intro φ
    obtain ⟨L, hL⟩ := lipschitzWith_eulerCurve_test B₀ F₀ hF T φ.property.1 φ.property.2
    exact ⟨L, fun n => hL (h n)⟩

theorem eulerCurve_limit_initial (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) {T : ℝ} (hT : 0 ≤ T)
    {h : ℕ → EulerStep} {g : C(Icc (0 : ℝ) T, ProbabilityMeasure ℝ)}
    (hg : Tendsto (fun n => eulerCurveMap (h n) B₀ F₀ hF T) atTop (𝓝 g)) :
    g ⟨0, le_rfl, hT⟩ = F₀ := by
  have he := (continuous_eval_const (⟨0, le_rfl, hT⟩ : Icc (0 : ℝ) T)).tendsto g |>.comp hg
  change Tendsto (fun n => eulerInterpolation (h n) B₀ F₀ 0) atTop (𝓝 (g ⟨0, le_rfl, hT⟩)) at he
  have hconst : Tendsto (fun _n : ℕ => F₀) atTop (𝓝 (g ⟨0, le_rfl, hT⟩)) := by
    simpa only [eulerInterpolation_zero] using he
  exact tendsto_nhds_unique hconst tendsto_const_nhds

theorem eulerCurve_limit_secondMoment (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ)
    {h : ℕ → EulerStep} {g : C(Icc (0 : ℝ) T, ProbabilityMeasure ℝ)}
    (hg : Tendsto (fun n => eulerCurveMap (h n) B₀ F₀ hF T) atTop (𝓝 g)) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ t : Icc (0 : ℝ) T,
      Integrable (fun y : ℝ => y^2) (g t : Measure ℝ) ∧
        (∫ y : ℝ, y^2 ∂(g t : Measure ℝ)) ≤ C := by
  obtain ⟨C, hC, hb⟩ := eulerInterpolation_uniform_secondMoment B₀ F₀ hF T
  refine ⟨C, hC, fun t => ?_⟩
  have he : Tendsto (fun n => eulerCurve (h n) B₀ F₀ T t) atTop (𝓝 (g t)) :=
    (continuous_eval_const t).tendsto g |>.comp hg
  apply integrable_and_integral_le_of_narrow he (by fun_prop) (fun y : ℝ => sq_nonneg y) hC
  · intro n
    exact integrable_sq_eulerInterpolation (h n) B₀ F₀ hF ⟨t.val,t.property.1⟩
  · intro n
    exact hb (h n) ⟨t.val,t.property.1⟩ t.property.2

end GGC.LogRate
