import GGC.LogRate.TestLimits
import GGC.LogRate.Existence

/-! # Extend every constructed weak solution to the larger test domain -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Identification
open GGC.Analysis GGC.LogRate

theorem averagedGenerator_cutoff_uniform_bound
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) {φ : ℝ → ℝ} (hφ : LinearGrowthC2 φ) :
    ∃ G : ℝ, 0 ≤ G ∧ ∀ R : ℝ, 1 ≤ R → ∀ r ∈ Icc 0 T,
      |averagedGenerator (massAt B₀ r) (w.law r) (cutoffTest R φ)| ≤ G := by
  obtain ⟨C, hC, hc⟩ := exists_cutoffTest_uniform_bound hφ
  obtain ⟨K, _, hk⟩ := w.moment_bound
  obtain ⟨M, hM, hm⟩ := generator_linearGrowth_bound
    (a := B₀.val*Real.exp (-T)) (b := B₀.val) (mul_pos B₀.property (Real.exp_pos _)) hC
  refine ⟨M*(1+Real.sqrt K), by positivity, fun R hR r hr => ?_⟩
  have hR₀ : 0 < R := zero_lt_one.trans_le hR
  have hi := integrable_id_of_integrable_sq (w.law r) (hk r hr).1
  have hgen := integrable_generator_compactTest (massAt B₀ r) (w.law r)
    (contDiff_cutoffTest hφ.contDiff R) (hasCompactSupport_cutoffTest φ hR₀)
  calc
    _ ≤ ∫ y, |generator (massAt B₀ r) (w.law r) (cutoffTest R φ) y| ∂(w.law r : Measure ℝ) :=
      abs_integral_le_integral_abs
    _ ≤ ∫ y : ℝ, M*(1+|y|) ∂(w.law r : Measure ℝ) := by
      apply integral_mono hgen.abs (((integrable_const 1).add hi.abs).const_mul M)
      exact hm (massAt B₀ r) (w.law r) (massAt_mem_Icc B₀ hr) _ (contDiff_cutoffTest hφ.contDiff R)
        (fun x => (hc R hR x).2.1) (fun x => (hc R hR x).2.2)
    _ = M*(1+∫ y : ℝ, |y| ∂(w.law r : Measure ℝ)) := by
      rw [integral_const_mul, integral_add (integrable_const _) hi.abs]
      simp
    _ ≤ M*(1+Real.sqrt K) := mul_le_mul_of_nonneg_left
      (add_le_add le_rfl (integral_abs_le_sqrt_of_secondMoment_le (w.law r) (hk r hr).1 (hk r hr).2)) hM

theorem integral_averagedGenerator_cutoff_tendsto
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) {φ : ℝ → ℝ} (hφ : LinearGrowthC2 φ)
    {t : ℝ} (ht : t ∈ Icc 0 T) :
    Tendsto (fun R : ℝ => ∫ r in 0..t, averagedGenerator (massAt B₀ r) (w.law r) (cutoffTest R φ)) atTop
      (𝓝 (∫ r in 0..t, averagedGenerator (massAt B₀ r) (w.law r) φ)) := by
  obtain ⟨G, _, hg⟩ := averagedGenerator_cutoff_uniform_bound w hφ
  obtain ⟨_, _, hk⟩ := w.moment_bound
  simp only [intervalIntegral.integral_of_le ht.1]
  apply tendsto_integral_filter_of_dominated_convergence
    (F := fun R r : ℝ => averagedGenerator (massAt B₀ r) (w.law r) (cutoffTest R φ))
    (f := fun r => averagedGenerator (massAt B₀ r) (w.law r) φ) (fun _ => G)
  · filter_upwards [eventually_ge_atTop (1 : ℝ)] with R hR
    exact ((averaged_generator_continuous (contDiff_cutoffTest hφ.contDiff R)
      (hasCompactSupport_cutoffTest φ (zero_lt_one.trans_le hR))).comp
        ((continuous_massAt B₀).prodMk w.law.continuous)).measurable.aestronglyMeasurable
  · filter_upwards [eventually_ge_atTop (1 : ℝ)] with R hR
    filter_upwards [ae_restrict_mem measurableSet_Ioc] with r hr
    simpa only [Real.norm_eq_abs] using hg R hR r ⟨hr.1.le,hr.2.trans ht.2⟩
  · exact integrableOn_const (by rw [Real.volume_Ioc]; exact ENNReal.ofReal_ne_top)
  · filter_upwards [ae_restrict_mem measurableSet_Ioc] with r hr
    exact tendsto_averagedGenerator_cutoffTest (massAt B₀ r) (w.law r)
      (integrable_id_of_integrable_sq (w.law r) (hk r ⟨hr.1.le,hr.2.trans ht.2⟩).1) hφ

theorem averagedGenerator_linearGrowth_uniform_bound
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) {φ : ℝ → ℝ} (hφ : LinearGrowthC2 φ) :
    ∃ G : ℝ, 0 ≤ G ∧ ∀ r ∈ Icc 0 T,
      |averagedGenerator (massAt B₀ r) (w.law r) φ| ≤ G := by
  obtain ⟨G, hG, hg⟩ := averagedGenerator_cutoff_uniform_bound w hφ
  obtain ⟨_, _, hk⟩ := w.moment_bound
  refine ⟨G, hG, fun r hr => ?_⟩
  apply le_of_tendsto (tendsto_averagedGenerator_cutoffTest (massAt B₀ r) (w.law r)
    (integrable_id_of_integrable_sq (w.law r) (hk r hr).1) hφ).abs
  filter_upwards [eventually_ge_atTop (1 : ℝ)] with R hR
  exact hg R hR r hr

theorem measurable_averagedGenerator_weakSolution
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) :
    Measurable (fun r : ℝ => averagedGenerator (massAt B₀ r) (w.law r) φ) := by
  have hp : Measurable (fun p : ℝ × ℝ => (massAt B₀ p.1,w.law p.1,p.2)) :=
    ((continuous_massAt B₀).measurable.comp measurable_fst).prodMk
      ((w.law.continuous.measurable.comp measurable_fst).prodMk measurable_snd)
  have hm := (generator_jointlyMeasurable hφ).comp hp
  exact RandomMeasure.measurable_probability_integral w.law.continuous.measurable hm

theorem intervalIntegrable_averagedGenerator_linearGrowth
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) {φ : ℝ → ℝ} (hφ : LinearGrowthC2 φ)
    {t : ℝ} (ht : t ∈ Icc 0 T) :
    IntervalIntegrable (fun r => averagedGenerator (massAt B₀ r) (w.law r) φ) volume 0 t := by
  obtain ⟨G, _, hg⟩ := averagedGenerator_linearGrowth_uniform_bound w hφ
  apply (intervalIntegrable_iff_integrableOn_Ioc_of_le ht.1).mpr
  apply (integrableOn_const (C := G) (s := Ioc 0 t) (by simp [Real.volume_Ioc])).mono'
    (measurable_averagedGenerator_weakSolution w hφ.contDiff).aestronglyMeasurable
  filter_upwards [ae_restrict_mem measurableSet_Ioc] with r hr
  simpa only [Real.norm_eq_abs] using hg r ⟨hr.1.le,hr.2.trans ht.2⟩

theorem weakEquation_linearGrowth
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) {φ : ℝ → ℝ} (hφ : LinearGrowthC2 φ)
    {t : ℝ} (ht : t ∈ Icc 0 T) :
    (∫ y, φ y ∂(w.law t : Measure ℝ)) - (∫ y, φ y ∂(F₀ : Measure ℝ)) =
      ∫ r in 0..t, averagedGenerator (massAt B₀ r) (w.law r) φ := by
  obtain ⟨_, _, hk⟩ := w.moment_bound
  have hF₀ : Integrable (fun y : ℝ => y) (F₀ : Measure ℝ) := by
    rw [← w.initial]
    exact integrable_id_of_integrable_sq (w.law 0) (hk 0 ⟨le_rfl,ht.1.trans ht.2⟩).1
  have hl := (tendsto_integral_cutoffTest (w.law t)
    (integrable_id_of_integrable_sq (w.law t) (hk t ht).1) hφ).sub
      (tendsto_integral_cutoffTest F₀ hF₀ hφ)
  have he : (fun R : ℝ => (∫ y, cutoffTest R φ y ∂(w.law t : Measure ℝ)) -
      (∫ y, cutoffTest R φ y ∂(F₀ : Measure ℝ))) =ᶠ[atTop]
        fun R => ∫ r in 0..t, averagedGenerator (massAt B₀ r) (w.law r) (cutoffTest R φ) := by
    filter_upwards [eventually_ge_atTop (1 : ℝ)] with R hR
    exact w.weakEquation _ (contDiff_cutoffTest hφ.contDiff R)
      (hasCompactSupport_cutoffTest φ (zero_lt_one.trans_le hR)) t ht
  exact tendsto_nhds_unique (hl.congr' he) (integral_averagedGenerator_cutoff_tendsto w hφ ht)

end GGC.Identification
