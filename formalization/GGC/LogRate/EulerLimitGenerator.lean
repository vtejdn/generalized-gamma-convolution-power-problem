import GGC.LogRate.EulerTime
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-! # Time-integrated generator convergence along the common Euler subsequence -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.LogRate
open GGC.Analysis

theorem eulerCurveMap_at_meshLeftTime (h : EulerStep) (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) {T : ℝ} (t : Icc (0 : ℝ) T) :
    eulerCurveMap h B₀ F₀ hF T (meshLeftTime h t) =
      eulerIterate h (eulerMass h B₀) F₀ (meshIndex h.val t.val) :=
  eulerInterpolation_mesh h B₀ F₀ _

theorem eulerIterate_at_mesh_tendsto (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) {T : ℝ}
    {h : ℕ → EulerStep} (hh : Tendsto (fun n => (h n).val) atTop (𝓝 0))
    {g : C(Icc (0 : ℝ) T, ProbabilityMeasure ℝ)}
    (hg : Tendsto (fun n => eulerCurveMap (h n) B₀ F₀ hF T) atTop (𝓝 g))
    (t : Icc (0 : ℝ) T) :
    Tendsto (fun n => eulerIterate (h n) (eulerMass (h n) B₀) F₀ (meshIndex (h n).val t.val))
      atTop (𝓝 (g t)) := by
  have he : Tendsto (fun n => eulerCurveMap (h n) B₀ F₀ hF T (meshLeftTime (h n) t))
      atTop (𝓝 (g t)) :=
    (continuous_eval.tendsto (g,t)).comp (hg.prodMk_nhds (meshLeftTime_tendsto hh t))
  simpa only [eulerCurveMap_at_meshLeftTime] using he

def meshGenerator (h : EulerStep) (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (φ : ℝ → ℝ) : ℝ → ℝ :=
  meshStep h.val (fun n => averagedGenerator (eulerMass h B₀ n) (eulerIterate h (eulerMass h B₀) F₀ n) φ)

theorem measurable_meshGenerator (h : EulerStep) (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (φ : ℝ → ℝ) : Measurable (meshGenerator h B₀ F₀ φ) := measurable_meshStep _ _

theorem meshGenerator_uniform_bound (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ) (T : ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) :
    ∃ G : ℝ, 0 ≤ G ∧ ∀ (h : EulerStep) (t : ℝ), t ∈ Icc 0 T →
      |meshGenerator h B₀ F₀ φ t| ≤ G := by
  obtain ⟨G, hG, hb⟩ := averagedGenerator_compactTest_bound (b := B₀.val) hφ hs
    (mul_pos B₀.property (Real.exp_pos (-T)))
  refine ⟨G, hG, ?_⟩
  intro h t ht
  exact hb _ _ (eulerMass_mem_Icc h B₀ ((meshIndex_time_le h.property.1 ht.1).trans ht.2))

theorem meshGenerator_tendsto (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) {T : ℝ}
    {h : ℕ → EulerStep} (hh : Tendsto (fun n => (h n).val) atTop (𝓝 0))
    {g : C(Icc (0 : ℝ) T, ProbabilityMeasure ℝ)}
    (hg : Tendsto (fun n => eulerCurveMap (h n) B₀ F₀ hF T) atTop (𝓝 g))
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) (t : Icc (0 : ℝ) T) :
    Tendsto (fun n => meshGenerator (h n) B₀ F₀ φ t.val) atTop
      (𝓝 (averagedGenerator (massAt B₀ t.val) (g t) φ)) := by
  have hB : Tendsto (fun n => eulerMass (h n) B₀ (meshIndex (h n).val t.val)) atTop
      (𝓝 (massAt B₀ t.val)) := by
    have he := ((continuous_massAt B₀).tendsto t.val).comp
      ((continuous_subtype_val.tendsto t).comp (meshLeftTime_tendsto hh t))
    simpa only [eulerMass_eq_massAt, meshLeftTime] using! he
  exact ((averaged_generator_continuous hφ hs).tendsto (massAt B₀ t.val,g t)).comp
    (hB.prodMk_nhds (eulerIterate_at_mesh_tendsto B₀ F₀ hF hh hg t))

/-- The common compact-mass bound justifies the time-limit interchange. -/
theorem integral_meshGenerator_tendsto (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) {T : ℝ} (hT : 0 ≤ T)
    {h : ℕ → EulerStep} (hh : Tendsto (fun n => (h n).val) atTop (𝓝 0))
    {g : C(Icc (0 : ℝ) T, ProbabilityMeasure ℝ)}
    (hg : Tendsto (fun n => eulerCurveMap (h n) B₀ F₀ hF T) atTop (𝓝 g))
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) {t : ℝ} (ht : t ∈ Icc 0 T) :
    Tendsto (fun n => ∫ r in 0..t, meshGenerator (h n) B₀ F₀ φ r) atTop
      (𝓝 (∫ r in 0..t, averagedGenerator (massAt B₀ r) (extendEulerCurve hT g r) φ)) := by
  obtain ⟨G, _, hb⟩ := meshGenerator_uniform_bound B₀ F₀ T hφ hs
  simp only [intervalIntegral.integral_of_le ht.1]
  apply tendsto_integral_of_dominated_convergence (fun _ => G)
  · intro n
    exact (measurable_meshGenerator (h n) B₀ F₀ φ).aestronglyMeasurable
  · exact integrableOn_const (by simp [Real.volume_Ioc])
  · intro n
    filter_upwards [ae_restrict_mem measurableSet_Ioc] with r hr
    exact hb (h n) r ⟨hr.1.le, hr.2.trans ht.2⟩
  · filter_upwards [ae_restrict_mem measurableSet_Ioc] with r hr
    have hrt : r ∈ Icc 0 T := ⟨hr.1.le, hr.2.trans ht.2⟩
    have he : extendEulerCurve hT g r = g ⟨r,hrt⟩ := extendEulerCurve_on_interval hT g ⟨r,hrt⟩
    rw [he]
    exact meshGenerator_tendsto B₀ F₀ hF hh hg hφ hs ⟨r,hrt⟩

end GGC.LogRate
