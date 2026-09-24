import GGC.Identification.ValueWeakEquation

/-! # The actual log-value laws solve the linear dilation transport equation -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Identification
open GGC.Analysis

theorem valueAt_pos {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T) (r : ℝ) :
    ∀ᵐ x ∂((valueAt w hT r).law : Measure ℝ), 0 < x := valueLaw_pos _ _ _

theorem continuous_logValueAt {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T) :
    Continuous (fun r => logValueLaw (valueAt w hT r)) :=
  (continuous_logValueLaw w).comp continuous_projIcc

theorem integral_logValueLaw_test (μ : NonnegLaw) {ζ : ℝ → ℝ} (hζ : Continuous ζ) :
    (∫ z, ζ z ∂(logValueLaw μ : Measure ℝ)) = ∫ x, ζ (Real.log x) ∂(μ.law : Measure ℝ) :=
  integral_map Real.measurable_log.aemeasurable hζ.measurable.aestronglyMeasurable

theorem integral_logValueTest (μ : NonnegLaw) (hp : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x)
    {ζ : ℝ → ℝ} (hζ : Continuous ζ) :
    (∫ x, logValueTest ζ x ∂(μ.law : Measure ℝ)) = ∫ z, ζ z ∂(logValueLaw μ : Measure ℝ) := by
  rw [integral_logValueLaw_test μ hζ]
  apply integral_congr_ae
  filter_upwards [hp] with x hx
  exact if_neg (ne_of_gt hx)

theorem integral_logValueTest_generator (μ : NonnegLaw)
    (hp : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x) {ζ : ℝ → ℝ} (hζ : ContDiff ℝ 1 ζ) :
    (∫ x, x*Real.log x*deriv (logValueTest ζ) x ∂(μ.law : Measure ℝ)) =
      ∫ z, z*deriv ζ z ∂(logValueLaw μ : Measure ℝ) := by
  rw [integral_logValueLaw_test μ
    (show Continuous (fun z => z*deriv ζ z) from continuous_id.mul hζ.continuous_deriv_one)]
  apply integral_congr_ae
  filter_upwards [hp] with x hx
  exact mul_log_deriv_logValueTest hζ (ne_of_gt hx)

theorem log_value_time_equation
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T)
    {t : ℝ} (ht : t ∈ Icc 0 T) {ζ : ℝ → ℝ} (hζ : ContDiff ℝ 1 ζ)
    (hs : HasCompactSupport ζ) :
    (∫ z, ζ z ∂(logValueLaw (valueAt w hT t) : Measure ℝ)) -
      (∫ z, ζ z ∂(logValueLaw (valueAt w hT 0) : Measure ℝ)) =
      ∫ r in 0..t, ∫ z, z*deriv ζ z ∂(logValueLaw (valueAt w hT r) : Measure ℝ) := by
  have he := compact_value_time_equation w hT ht
    (contDiff_logValueTest hζ hs) (hasCompactSupport_logValueTest hs) (logValueTest_zero ζ)
  have hv (r : ℝ) := integral_logValueTest (valueAt w hT r) (valueAt_pos w hT r) hζ.continuous
  have hg (r : ℝ) := integral_logValueTest_generator (valueAt w hT r) (valueAt_pos w hT r) hζ
  simpa only [hv,hg] using he

end GGC.Identification
