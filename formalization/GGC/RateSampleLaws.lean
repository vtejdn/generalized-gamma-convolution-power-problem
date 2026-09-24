import GGC.RateRealization

/-! # Exact positive-rate laws of the common-space samples

Pushforwards commute with the concrete atom mixture. This identifies the
posterior used by the generator with the common-space sample, without using
an unproved uniqueness assertion for Dirichlet processes (API-030).
-/

noncomputable section
open MeasureTheory
namespace GGC
open RandomMeasure

theorem rateLaw_atomMixture (P : ProbabilityMeasure ℝ) (z : UnitWeight) (y : ℝ) :
    rateLaw (atomMixture P z y) = atomMixture (rateLaw P) z (rateEquiv y) := by
  apply ProbabilityMeasure.toMeasure_injective
  change Measure.map rateEquiv (atomMixture P z y : Measure ℝ) =
    ENNReal.ofReal (1 - z.val) • Measure.map rateEquiv (P : Measure ℝ) +
      ENNReal.ofReal z.val • Measure.dirac (rateEquiv y)
  rw [atomMixture_toMeasure, Measure.map_add _ _ rateEquiv.measurable,
    Measure.map_smul, Measure.map_smul, Measure.map_dirac' rateEquiv.measurable]

theorem ratePosteriorSample_eq (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ)
    (ω : DirichletSampleSpace) :
    ratePosteriorSample B F y ω =
      atomMixture (rateDirichletSample B F ω) (uniformBreak B ω.2) (rateEquiv y) :=
  rateLaw_atomMixture (dirichletSample B F ω) (uniformBreak B ω.2) y

theorem rateDirichletSample_map (B : PosReal) (F : ProbabilityMeasure ℝ) :
    Measure.map (rateDirichletSample B F) (dirichletSampleSpaceLaw : Measure DirichletSampleSpace) =
      (rateDirichletLaw B F : Measure (ProbabilityMeasure PosReal)) := by
  have hm := measurable_dirichletSample.comp (measurable_prodMk_left (x := (B, F)))
  change Measurable (dirichletSample B F) at hm
  change Measure.map (rateLaw ∘ dirichletSample B F)
    (dirichletSampleSpaceLaw : Measure DirichletSampleSpace) =
      Measure.map rateLaw (dirichletLaw B F : Measure (ProbabilityMeasure ℝ))
  rw [← Measure.map_map measurable_rateLaw hm, dirichletSample_map]

theorem ratePosteriorSample_map (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    Measure.map (ratePosteriorSample B F y) (dirichletSampleSpaceLaw : Measure DirichletSampleSpace) =
      (atomMixtureLaw (rateDirichletLaw B F) (betaWeightLaw B) (rateEquiv y) :
        Measure (ProbabilityMeasure PosReal)) := by
  have hm := measurable_posteriorSample.comp (measurable_prodMk_left (x := ((B, F), y)))
  change Measurable (posteriorSample B F y) at hm
  change Measure.map (rateLaw ∘ posteriorSample B F y)
    (dirichletSampleSpaceLaw : Measure DirichletSampleSpace) = _
  rw [← Measure.map_map measurable_rateLaw hm, posteriorSample_map,
    atomMixtureLaw_toMeasure, Measure.map_map measurable_rateLaw (measurable_atomMixture_sample y)]
  have he : ((rateDirichletLaw B F : Measure (ProbabilityMeasure PosReal))).prod
      (betaWeightLaw B : Measure UnitWeight) =
      Measure.map (Prod.map rateLaw id) ((dirichletLaw B F : Measure (ProbabilityMeasure ℝ)).prod
        (betaWeightLaw B : Measure UnitWeight)) := by
    change (Measure.map rateLaw (dirichletLaw B F : Measure (ProbabilityMeasure ℝ))).prod _ = _
    simpa only [Measure.map_id] using Measure.map_prod_map
      (dirichletLaw B F : Measure (ProbabilityMeasure ℝ)) (betaWeightLaw B : Measure UnitWeight)
      measurable_rateLaw measurable_id
  rw [atomMixtureLaw_toMeasure, he, Measure.map_map (measurable_atomMixture_sample (rateEquiv y))
    (measurable_rateLaw.prodMap measurable_id)]
  congr 1
  funext p
  exact rateLaw_atomMixture p.1 p.2 y

end GGC
