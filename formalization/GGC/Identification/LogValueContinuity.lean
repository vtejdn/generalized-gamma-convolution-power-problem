import GGC.Identification.ValueContinuity
import GGC.Foundations.FirstMomentTightness

/-! # Continuous logarithmic and positive-subtype value laws

Logarithm is only used measurably on the ambient real line. Its narrow
continuity along this family is proved by tightness and exponential inversion.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Identification
open GGC.Analysis GGC.LogRate

def logValueLaw (μ : NonnegLaw) : ProbabilityMeasure ℝ :=
  μ.law.map Real.measurable_log.aemeasurable

def expValueLaw (F : ProbabilityMeasure ℝ) : ProbabilityMeasure ℝ :=
  F.map Real.continuous_exp.measurable.aemeasurable

theorem continuous_expValueLaw : Continuous expValueLaw :=
  ProbabilityMeasure.continuous_map Real.continuous_exp

theorem expValueLaw_logValueLaw (μ : NonnegLaw)
    (hμ : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x) : expValueLaw (logValueLaw μ) = μ.law := by
  apply ProbabilityMeasure.toMeasure_injective
  change Measure.map Real.exp (Measure.map Real.log (μ.law : Measure ℝ)) = _
  rw [Measure.map_map Real.continuous_exp.measurable Real.measurable_log]
  have he : Real.exp ∘ Real.log =ᵐ[(μ.law : Measure ℝ)] id :=
    hμ.mono fun _ hx => Real.exp_log hx
  rw [Measure.map_congr he, Measure.map_id]

theorem expValueLaw_injective : Function.Injective expValueLaw := by
  intro F G h
  have he := congrArg (fun P : ProbabilityMeasure ℝ =>
    Measure.map Real.log (P : Measure ℝ)) h
  change Measure.map Real.log (Measure.map Real.exp (F : Measure ℝ)) =
    Measure.map Real.log (Measure.map Real.exp (G : Measure ℝ)) at he
  rw [Measure.map_map Real.measurable_log Real.continuous_exp.measurable,
    Measure.map_map Real.measurable_log Real.continuous_exp.measurable] at he
  have hid : Real.log ∘ Real.exp = id := funext Real.log_exp
  rw [hid, Measure.map_id, Measure.map_id] at he
  exact ProbabilityMeasure.toMeasure_injective he

theorem integrable_id_logValueLaw (μ : NonnegLaw)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) :
    Integrable (fun y : ℝ => y) (logValueLaw μ : Measure ℝ) := by
  change Integrable _ (Measure.map Real.log (μ.law : Measure ℝ))
  exact (integrable_map_measure (by fun_prop) Real.measurable_log.aemeasurable).mpr hi

theorem integral_abs_logValueLaw (μ : NonnegLaw) :
    (∫ y : ℝ, |y| ∂(logValueLaw μ : Measure ℝ)) = ∫ x, |Real.log x| ∂(μ.law : Measure ℝ) :=
  integral_map Real.measurable_log.aemeasurable (by fun_prop)

theorem isTightMeasureSet_logValueLaws {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) :
    IsTightMeasureSet {(logValueLaw (WeakLogRateSolution.value w t) : Measure ℝ) | t : Icc (0 : ℝ) T} := by
  obtain ⟨C, hC, hc⟩ := valueLaw_logMoment_bound w
  have h := isTightMeasureSet_of_firstMoment_bound
    (S := range (fun t : Icc (0 : ℝ) T => logValueLaw (WeakLogRateSolution.value w t))) hC
    (by rintro _ ⟨t,rfl⟩; exact integrable_id_logValueLaw _ (hc t).1)
    (by rintro _ ⟨t,rfl⟩; rw [integral_abs_logValueLaw]; exact (hc t).2)
  simpa using h

theorem continuous_logValueLaw {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) :
    Continuous (fun t : Icc (0 : ℝ) T => logValueLaw (WeakLogRateSolution.value w t)) := by
  have hcomp : IsCompact (closure (range (fun t : Icc (0 : ℝ) T =>
      logValueLaw (WeakLogRateSolution.value w t)))) :=
    isCompact_closure_of_isTightMeasureSet (by simpa using isTightMeasureSet_logValueLaws w)
  rw [continuous_iff_seqContinuous]
  intro ts t ht
  apply tendsto_of_subseq_tendsto
  intro ns hns
  obtain ⟨G, _, ms, hms, hlim⟩ := hcomp.tendsto_subseq
    (fun n => subset_closure (mem_range_self (ts (ns n))))
  have hexp := (continuous_expValueLaw.tendsto G).comp hlim
  have hinv (u : Icc (0 : ℝ) T) :
      expValueLaw (logValueLaw (WeakLogRateSolution.value w u)) = (WeakLogRateSolution.value w u).law :=
    expValueLaw_logValueLaw _ (valueLaw_pos _ _ _)
  have hval : Tendsto (fun n => (WeakLogRateSolution.value w (ts (ns (ms n)))).law) atTop
      (𝓝 (expValueLaw G)) := by
    simpa only [Function.comp_def, hinv] using hexp
  have hval' := ((continuous_valueLaw w).tendsto t).comp (ht.comp (hns.comp hms.tendsto_atTop))
  have hG : G = logValueLaw (WeakLogRateSolution.value w t) := expValueLaw_injective
    ((tendsto_nhds_unique hval hval').trans (hinv t).symm)
  refine ⟨ms, ?_⟩
  simpa only [hG, Function.comp_def] using hlim

def positiveValueLaw (μ : NonnegLaw) : ProbabilityMeasure PosReal := rateLaw (logValueLaw μ)

theorem positiveValueLaw_map_val (μ : NonnegLaw)
    (hμ : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x) :
    (positiveValueLaw μ).map measurable_subtype_coe.aemeasurable = μ.law := by
  calc
    _ = expValueLaw (logValueLaw μ) := by
      apply ProbabilityMeasure.toMeasure_injective
      change Measure.map (fun b : PosReal => b.val) (Measure.map rateEquiv (logValueLaw μ : Measure ℝ)) = _
      rw [Measure.map_map measurable_subtype_coe rateEquiv.measurable]
      rfl
    _ = _ := expValueLaw_logValueLaw μ hμ

theorem continuous_positiveValueLaw {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) :
    Continuous (fun t : Icc (0 : ℝ) T => positiveValueLaw (WeakLogRateSolution.value w t)) :=
  continuous_rateLaw.comp (continuous_logValueLaw w)

/-- An actual Borel Markov kernel, available for the space-time integrals. -/
def valueKernel {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) : ProbabilityTheory.Kernel (Icc (0 : ℝ) T) ℝ :=
  ⟨fun t => ((WeakLogRateSolution.value w t).law : Measure ℝ),
    measurable_subtype_coe.comp (continuous_valueLaw w).measurable⟩

@[simp] theorem valueKernel_apply {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (t : Icc (0 : ℝ) T) :
    valueKernel w t = ((WeakLogRateSolution.value w t).law : Measure ℝ) := rfl

instance valueKernel_isMarkov {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) : ProbabilityTheory.IsMarkovKernel (valueKernel w) :=
  ⟨fun t => by
    change IsProbabilityMeasure ((WeakLogRateSolution.value w t).law : Measure ℝ)
    infer_instance⟩

end GGC.Identification
