import GGC.LogRate.Generator
import GGC.LogRate.PalmResolvent

/-! # Blueprint B: the averaged resolvent identity for the actual generator -/

noncomputable section
open MeasureTheory Set
namespace GGC.LogRate

private theorem measurable_generator_log_rate (B : PosReal) (F : ProbabilityMeasure ℝ)
    {s : ℝ} (hs : 0 < s) :
    Measurable (fun b : PosReal => canonicalGenerator (rateDirichletLaw B F) B
      (logResolvent s) (Real.log b.val)) := by
  have hp : Measurable (fun b : PosReal => (rateDirichletLaw B F,B,Real.log b.val)) := by fun_prop
  have h := (canonicalGenerator_jointlyMeasurable (contDiff_logResolvent hs)).comp hp
  exact h

theorem integrable_generator_logResolvent (B : PosReal) (F : ProbabilityMeasure ℝ)
    {s : ℝ} (hs : 0 < s) : Integrable (generator B F (logResolvent s)) (F : Measure ℝ) := by
  have hi := integrable_canonicalGenerator_logResolvent_rate
    (baseMeasure_isDirichlet B F) B (baseMeasure_mass B F) hs
  rw [normalized_baseMeasure] at hi
  change Integrable (fun b : PosReal => canonicalGenerator (rateDirichletLaw B F) B
    (logResolvent s) (Real.log b.val)) (Measure.map rateEquiv (F : Measure ℝ)) at hi
  have h := (integrable_map_measure (measurable_generator_log_rate B F hs).aestronglyMeasurable
    rateEquiv.measurable.aemeasurable).mp hi
  simpa only [Function.comp_def, rateEquiv_apply_val, Real.log_exp, generator] using! h

theorem integral_generator_eq_dirichlet (B : PosReal) (F : ProbabilityMeasure ℝ)
    {s : ℝ} (hs : 0 < s) :
    (∫ y, generator B F (logResolvent s) y ∂(F : Measure ℝ)) =
      ∫ P, stieltjesWeight P s * (digamma (B.val+1)+1+Real.log (stieltjesMean P s))
        ∂(rateDirichletLaw B F : Measure (ProbabilityMeasure PosReal)) := by
  have h := integral_canonicalGenerator_logResolvent_rate
    (baseMeasure_isDirichlet B F) B (baseMeasure_mass B F) hs
  rw [normalized_baseMeasure] at h
  have he : (∫ b : PosReal, canonicalGenerator (rateDirichletLaw B F) B (logResolvent s)
      (Real.log b.val) ∂(rateLaw F : Measure PosReal)) =
      ∫ y, generator B F (logResolvent s) y ∂(F : Measure ℝ) := by
    change (∫ b : PosReal, canonicalGenerator (rateDirichletLaw B F) B (logResolvent s)
      (Real.log b.val) ∂Measure.map rateEquiv (F : Measure ℝ)) = _
    rw [integral_map rateEquiv.measurable.aemeasurable
      (measurable_generator_log_rate B F hs).aestronglyMeasurable]
    simp only [rateEquiv_apply_val, Real.log_exp, generator]
  exact he.symm.trans h

/-- The precise M3 identity. The current law is specified only by its zero-drift
Thorin transform; no closure of its positive-time powers is assumed. -/
theorem integral_generator_eq_normalized_powerTangent
    (B : PosReal) (F : ProbabilityMeasure ℝ) (hU : ThorinAdmissible (baseMeasure B F))
    (μ : NonnegLaw)
    (hμ : ∀ t : ℝ, 0 < t → laplace μ t =
      Real.exp (-(∫ b : PosReal, Real.log (1+t/b.val) ∂baseMeasure B F)))
    {s : ℝ} (hs : 0 < s) :
    (∫ y, generator B F (logResolvent s) y ∂(F : Measure ℝ)) =
      (powerTangent μ s + powerLogDerivative μ 1 s)/B.val := by
  rw [integral_generator_eq_dirichlet B F hs]
  exact (normalized_powerTangent (baseMeasure_isDirichlet B F) hU B
    (baseMeasure_mass B F) μ hμ hs).symm

end GGC.LogRate
