import GGC.Identification.LogTransport
import GGC.Identification.TransportUniqueness

/-! # Dynamic identification of the actual value law with a power pushforward -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Identification

theorem logValueAt_eq_map {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T)
    {t : ℝ} (ht : t ∈ Icc 0 T) :
    logValueLaw (valueAt w hT t) = (logValueLaw (valueAt w hT 0)).map
      (show Measurable (fun z : ℝ => Real.exp t*z) by fun_prop).aemeasurable := by
  apply transport_law_eq_map ht.1 (fun r => logValueLaw (valueAt w hT r))
    (continuous_logValueAt w hT)
  intro φ hφ hs r hr
  exact log_value_time_equation w hT ⟨hr.1,hr.2.trans ht.2⟩ hφ hs

/-- The value law constructed from any weak log-rate solution is exactly the
law of the deterministic power of its own initial value variable. -/
theorem valueAt_eq_powerLaw {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T)
    {t : ℝ} (ht : t ∈ Icc 0 T) :
    valueAt w hT t = powerLaw (valueAt w hT 0) (Real.exp t) (Real.exp_pos t).le := by
  apply NonnegLaw.ext
  calc
    (valueAt w hT t).law = expValueLaw (logValueLaw (valueAt w hT t)) :=
      (expValueLaw_logValueLaw _ (valueAt_pos w hT t)).symm
    _ = expValueLaw ((logValueLaw (valueAt w hT 0)).map
        (show Measurable (fun z : ℝ => Real.exp t*z) by fun_prop).aemeasurable) :=
      congrArg expValueLaw (logValueAt_eq_map w hT ht)
    _ = (powerLaw (valueAt w hT 0) (Real.exp t) (Real.exp_pos t).le).law := by
      apply ProbabilityMeasure.toMeasure_injective
      change Measure.map Real.exp (Measure.map (fun z : ℝ => Real.exp t*z)
        (Measure.map Real.log ((valueAt w hT 0).law : Measure ℝ))) =
        Measure.map (fun x : ℝ => x ^ Real.exp t) ((valueAt w hT 0).law : Measure ℝ)
      rw [Measure.map_map Real.continuous_exp.measurable (by fun_prop),
        Measure.map_map (by fun_prop) Real.measurable_log]
      apply Measure.map_congr
      filter_upwards [valueAt_pos w hT 0] with x hx
      simp only [Function.comp_def, Real.rpow_def_of_pos hx, mul_comm]

theorem valueAt_zero {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T)
    (hF₀ : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) :
    valueAt w hT 0 = valueLaw B₀ F₀ hF₀ := by
  rw [valueAt_eq_value w hT (show 0 ∈ Icc (0 : ℝ) T from ⟨le_rfl,hT⟩)]
  have hm : LogRate.massAt B₀ 0=B₀ := by
    apply Subtype.ext
    simp [LogRate.massAt]
  simp only [WeakLogRateSolution.value, hm, w.initial]

theorem isGGC_power_valueLaw_of_weakSolution
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T)
    (hF₀ : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ))
    {t : ℝ} (ht : t ∈ Icc 0 T) :
    IsGGC (powerLaw (valueLaw B₀ F₀ hF₀) (Real.exp t) (Real.exp_pos t).le) := by
  rw [← valueAt_zero w hT hF₀, ← valueAt_eq_powerLaw w hT ht]
  exact isGGC_valueLaw _ _ _

end GGC.Identification
