import GGC.Identification.Moments
import GGC.Foundations.LogMomentTightness
import GGC.LaplaceContinuity

/-! # Narrow continuity of the realized value-law curve -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Identification
open GGC.Analysis GGC.LogRate

theorem isTightMeasureSet_valueLaws {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) :
    IsTightMeasureSet {((WeakLogRateSolution.value w t).law : Measure ℝ) | t : Icc (0 : ℝ) T} := by
  obtain ⟨C, hC, hc⟩ := valueLaw_logMoment_bound w
  have h := isTightMeasureSet_of_nonnegative_logMoment_bound
    (S := range (fun t : Icc (0 : ℝ) T => (WeakLogRateSolution.value w t).law)) hC
    (by rintro _ ⟨t,rfl⟩; exact (WeakLogRateSolution.value w t).nonneg)
    (by rintro _ ⟨t,rfl⟩; exact (hc t).1)
    (by rintro _ ⟨t,rfl⟩; exact (hc t).2)
  simpa using h

theorem continuous_valueLaw {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) :
    Continuous (fun t : Icc (0 : ℝ) T => (WeakLogRateSolution.value w t).law) := by
  rw [continuous_iff_seqContinuous]
  intro ts t ht
  apply nonnegLaw_tendsto_of_laplace_tendsto
  · apply (isTightMeasureSet_valueLaws w).subset
    rintro _ ⟨n,rfl⟩
    exact ⟨ts n,rfl⟩
  · intro s hs
    exact ((WeakLogRateSolution.continuous_laplace w hs).tendsto t).comp ht

end GGC.Identification
