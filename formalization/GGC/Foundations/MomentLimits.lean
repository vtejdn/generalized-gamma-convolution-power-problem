import Mathlib.MeasureTheory.Measure.Portmanteau
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Tactic

/-! # Nonnegative continuous moment bounds pass to narrow limits -/

noncomputable section
open MeasureTheory Filter
open scoped ENNReal Topology
namespace GGC.Analysis

theorem integrable_and_integral_le_of_narrow
    {F : ℕ → ProbabilityMeasure ℝ} {G : ProbabilityMeasure ℝ}
    (hFG : Tendsto F atTop (𝓝 G)) {f : ℝ → ℝ} (hf : Continuous f) (hf0 : ∀ x, 0 ≤ f x)
    {C : ℝ} (hC : 0 ≤ C) (hi : ∀ n, Integrable f (F n : Measure ℝ))
    (hb : ∀ n, (∫ x, f x ∂(F n : Measure ℝ)) ≤ C) :
    Integrable f (G : Measure ℝ) ∧ (∫ x, f x ∂(G : Measure ℝ)) ≤ C := by
  have hport := lintegral_le_liminf_lintegral_of_forall_isOpen_measure_le_liminf_measure
    (μ := (G : Measure ℝ)) (μs := fun n => (F n : Measure ℝ)) hf hf0
    (fun _ hU => ProbabilityMeasure.le_liminf_measure_open_of_tendsto hFG hU)
  have hbound : (∫⁻ x, ENNReal.ofReal (f x) ∂(G : Measure ℝ)) ≤ ENNReal.ofReal C := by
    apply hport.trans
    apply liminf_le_of_frequently_le'
    exact Frequently.of_forall fun n => by
      rw [← ofReal_integral_eq_lintegral_ofReal (hi n) (Eventually.of_forall hf0)]
      exact ENNReal.ofReal_le_ofReal (hb n)
  have hint : Integrable f (G : Measure ℝ) :=
    (lintegral_ofReal_ne_top_iff_integrable hf.aestronglyMeasurable (Eventually.of_forall hf0)).mp
      (ne_top_of_le_ne_top ENNReal.ofReal_ne_top hbound)
  refine ⟨hint, ?_⟩
  rw [← ofReal_integral_eq_lintegral_ofReal hint (Eventually.of_forall hf0)] at hbound
  exact (ENNReal.ofReal_le_ofReal_iff hC).mp hbound

end GGC.Analysis
