import Mathlib.MeasureTheory.Measure.Prokhorov
import Mathlib.MeasureTheory.Integral.BoundedContinuousFunction
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.Topology.UniformSpace.CompactConvergence
import Mathlib.Tactic

/-! # Bounded locally uniform tests against varying real probability laws

API-031: Prokhorov supplies uniform tightness of a convergent sequence. The
error is small on a compact set by uniform convergence, and off that set by
the common global bound. The final fixed test uses narrow convergence.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Analysis

theorem tendsto_integral_of_narrow_locally_uniform
    {P : ℕ → ProbabilityMeasure ℝ} {Q : ProbabilityMeasure ℝ}
    {f : ℕ → ℝ → ℝ} {g : ℝ → ℝ} {C : ℝ}
    (hP : Tendsto P atTop (𝓝 Q)) (hf : ∀ n, Continuous (f n)) (hg : Continuous g)
    (hb : ∀ᶠ n in atTop, ∀ x, ‖f n x‖ ≤ C) (hgb : ∀ x, ‖g x‖ ≤ C)
    (hu : ∀ K : Set ℝ, IsCompact K → TendstoUniformlyOn f g atTop K) :
    Tendsto (fun n => ∫ x, f n x ∂(P n : Measure ℝ)) atTop (𝓝 (∫ x, g x ∂(Q : Measure ℝ))) := by
  have hC : 0 ≤ C := (norm_nonneg (g 0)).trans (hgb 0)
  let gb : BoundedContinuousFunction ℝ ℝ := BoundedContinuousFunction.mkOfBound ⟨g, hg⟩ (2 * C) (fun x y => by
    rw [dist_eq_norm]
    exact (norm_sub_le _ _).trans ((add_le_add (hgb x) (hgb y)).trans_eq (by ring)))
  have hfixed : Tendsto (fun n => ∫ x, g x ∂(P n : Measure ℝ)) atTop
      (𝓝 (∫ x, g x ∂(Q : Measure ℝ))) :=
    ProbabilityMeasure.tendsto_iff_forall_integral_tendsto.mp hP gb
  have htight : IsTightMeasureSet {((μ : ProbabilityMeasure ℝ) : Measure ℝ) |
      μ ∈ insert Q (range P)} := by
    apply isTightMeasureSet_of_isCompact_closure
    rw [hP.isCompact_insert_range.isClosed.closure_eq]
    exact hP.isCompact_insert_range
  have herr : Tendsto (fun n => ∫ x, (f n x - g x) ∂(P n : Measure ℝ)) atTop (𝓝 0) := by
    rw [Metric.tendsto_nhds]
    intro ε hε
    let δ : ℝ := ε / (8 * (C + 1))
    have hδ : 0 < δ := by dsimp [δ]; positivity
    obtain ⟨K, hK, htail⟩ := isTightMeasureSet_iff_exists_isCompact_measure_compl_le.mp htight
      (ENNReal.ofReal δ) (ENNReal.ofReal_pos.mpr hδ)
    have htailReal (n : ℕ) : (P n : Measure ℝ).real Kᶜ ≤ δ := by
      have h := htail (P n : Measure ℝ) ⟨P n, mem_insert_of_mem _ (mem_range_self n), rfl⟩
      simpa only [measureReal_def, ENNReal.toReal_ofReal hδ.le] using
        ENNReal.toReal_mono ENNReal.ofReal_ne_top h
    have hd : 2 * C * δ ≤ ε / 4 := by
      calc
        _ ≤ 2 * (C + 1) * δ := mul_le_mul_of_nonneg_right (by linarith) hδ.le
        _ = _ := by
          dsimp [δ]
          field_simp [ne_of_gt (show 0 < C + 1 by linarith)]
          ring
    have he := Metric.tendstoUniformlyOn_iff.mp (hu K hK) (ε / 4) (by positivity)
    filter_upwards [hb, he] with n hn hen
    have hnorm (x : ℝ) : ‖f n x - g x‖ ≤ 2 * C :=
      (norm_sub_le _ _).trans ((add_le_add (hn x) (hgb x)).trans_eq (by ring))
    have hi : Integrable (fun x => f n x - g x) (P n : Measure ℝ) :=
      (integrable_const (2 * C)).mono' ((hf n).sub hg).measurable.aestronglyMeasurable
        (Eventually.of_forall hnorm)
    have hinside : ‖∫ x in K, (f n x - g x) ∂(P n : Measure ℝ)‖ ≤ ε / 4 := by
      calc
        _ ≤ (ε / 4) * (P n : Measure ℝ).real K :=
          norm_setIntegral_le_of_norm_le_const (measure_lt_top _ _) (fun x hx => by
            simpa only [Real.norm_eq_abs, Real.dist_eq, abs_sub_comm] using (hen x hx).le)
        _ ≤ ε / 4 := (mul_le_mul_of_nonneg_left measureReal_le_one (by positivity)).trans_eq (mul_one _)
    have houtside : ‖∫ x in Kᶜ, (f n x - g x) ∂(P n : Measure ℝ)‖ ≤ ε / 4 := by
      calc
        _ ≤ (2 * C) * (P n : Measure ℝ).real Kᶜ :=
          norm_setIntegral_le_of_norm_le_const (measure_lt_top _ _) (fun x _ => hnorm x)
        _ ≤ (2 * C) * δ := mul_le_mul_of_nonneg_left (htailReal n) (by positivity)
        _ ≤ ε / 4 := hd
    rw [dist_zero_right, ← integral_add_compl hK.measurableSet hi]
    exact ((norm_add_le _ _).trans (add_le_add hinside houtside)).trans_lt (by linarith)
  have hsum : Tendsto (fun n => (∫ x, (f n x - g x) ∂(P n : Measure ℝ)) +
      ∫ x, g x ∂(P n : Measure ℝ)) atTop (𝓝 (∫ x, g x ∂(Q : Measure ℝ))) := by
    simpa only [zero_add] using herr.add hfixed
  apply hsum.congr'
  filter_upwards [hb] with n hn
  have hfn : Integrable (f n) (P n : Measure ℝ) :=
    (integrable_const C).mono' (hf n).measurable.aestronglyMeasurable (Eventually.of_forall hn)
  have hgn : Integrable g (P n : Measure ℝ) := gb.integrable _
  rw [integral_sub hfn hgn, sub_add_cancel]

end GGC.Analysis
