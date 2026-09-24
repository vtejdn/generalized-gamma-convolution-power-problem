import Mathlib.MeasureTheory.Integral.Layercake
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.Tactic

/-! # Bochner integrability and moment bounds from finite-measure tails -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Analysis

theorem measureReal_le_integral {X : Type*} [MeasurableSpace X] {μ : Measure X}
    [IsFiniteMeasure μ] {f : X → ℝ} (hi : Integrable f μ)
    (h0 : ∀ᵐ x ∂μ, 0 ≤ f x) {s : Set X} (hs : ∀ x ∈ s, 1 ≤ f x) :
    μ.real s ≤ ∫ x, f x ∂μ := by
  have h := ENNReal.toReal_mono ENNReal.ofReal_ne_top (hi.measure_le_integral h0 hs)
  simpa only [measureReal_def, ENNReal.toReal_ofReal (integral_nonneg_of_ae h0)] using! h

theorem integrable_and_integral_le_of_tail_bound
    {X : Type*} [MeasurableSpace X] (μ : Measure X) [IsFiniteMeasure μ]
    {f : X → ℝ} (hf : Measurable f) (hf0 : ∀ x, 0 ≤ f x)
    {b : ℝ → ℝ} (hb : IntegrableOn b (Ioi 0))
    (ht : ∀ r : ℝ, 0 < r → μ.real {x | r < f x} ≤ b r) :
    Integrable f μ ∧ (∫ x, f x ∂μ) ≤ ∫ r in Ioi 0, b r := by
  have hb0 : ∀ᵐ r ∂volume.restrict (Ioi 0), 0 ≤ b r := by
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with r hr
    exact (measureReal_nonneg (μ := μ)).trans (ht r hr)
  have he := lintegral_eq_lintegral_meas_lt μ (Eventually.of_forall hf0) hf.aemeasurable
  have hbound : (∫⁻ x, ENNReal.ofReal (f x) ∂μ) ≤
      ENNReal.ofReal (∫ r in Ioi 0, b r) := by
    rw [he, ofReal_integral_eq_lintegral_ofReal hb hb0]
    apply lintegral_mono_ae
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with r hr
    calc
      μ {x | r < f x} = ENNReal.ofReal (μ.real {x | r < f x}) := by
        rw [measureReal_def, ENNReal.ofReal_toReal (measure_ne_top _ _)]
      _ ≤ ENNReal.ofReal (b r) := ENNReal.ofReal_le_ofReal (ht r hr)
  have hi : Integrable f μ :=
    (lintegral_ofReal_ne_top_iff_integrable hf.aestronglyMeasurable (Eventually.of_forall hf0)).mp
      (ne_top_of_le_ne_top ENNReal.ofReal_ne_top hbound)
  refine ⟨hi, ?_⟩
  rw [← ofReal_integral_eq_lintegral_ofReal hi (Eventually.of_forall hf0)] at hbound
  exact (ENNReal.ofReal_le_ofReal_iff (integral_nonneg_of_ae hb0)).mp hbound

end GGC.Analysis
