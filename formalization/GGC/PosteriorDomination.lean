import GGC.RateSampleLaws

/-! # One integrable posterior-log bound for nearby masses

For B ≤ M the common beta fraction at B dominates the fraction at M.
The latter gives a single integrable logarithmic majorant for every base
law and atom location. This is stronger than a uniform bound on expectations.
-/

noncomputable section
open MeasureTheory Set Filter
namespace GGC
open RandomMeasure

theorem uniformBreak_antitone_mass (u : UnitWeight) :
    Antitone (fun B : PosReal => uniformBreak B u) := by
  intro B M hBM
  change 1 - u.val ^ (1 / M.val) ≤ 1 - u.val ^ (1 / B.val)
  exact sub_le_sub_left (Real.rpow_le_rpow_of_exponent_ge'
    u.property.1 u.property.2 (one_div_pos.mpr M.property).le
    (one_div_le_one_div_of_le B.property hBM)) 1

theorem integrable_neg_log_uniformBreak (B : PosReal) :
    Integrable (fun u : UnitWeight => -Real.log (uniformBreak B u).val) volume := by
  have hm : Measurable (uniformBreak B) :=
    measurable_uniformBreak.comp (measurable_prodMk_left (x := B))
  have hf : Measurable (fun z : UnitWeight => -Real.log z.val) := by fun_prop
  have hi := integrable_neg_log_betaWeightLaw B
  rw [← uniformBreak_map B, integrable_map_measure hf.aestronglyMeasurable hm.aemeasurable] at hi
  exact hi

theorem ae_uniformBreak_pos (B : PosReal) :
    ∀ᵐ u : UnitWeight ∂volume, 0 < (uniformBreak B u).val := by
  have hm : Measurable (uniformBreak B) :=
    measurable_uniformBreak.comp (measurable_prodMk_left (x := B))
  have hp : MeasurePreserving (uniformBreak B) volume (betaWeightLaw B : Measure UnitWeight) :=
    ⟨hm, uniformBreak_map B⟩
  exact hp.quasiMeasurePreserving.ae (betaWeightLaw_pos B)

theorem integrable_neg_log_posteriorUniform (B : PosReal) :
    Integrable (fun ω : DirichletSampleSpace => -Real.log (uniformBreak B ω.2).val)
      (dirichletSampleSpaceLaw : Measure DirichletSampleSpace) :=
  (integrable_neg_log_uniformBreak B).comp_snd (uniformCoreLaw : Measure UniformCore)

theorem ae_posteriorUniform_pos (B : PosReal) :
    ∀ᵐ ω ∂(dirichletSampleSpaceLaw : Measure DirichletSampleSpace),
      0 < (uniformBreak B ω.2).val :=
  (Measure.quasiMeasurePreserving_snd (μ := (uniformCoreLaw : Measure UniformCore))
    (ν := (volume : Measure UnitWeight))).ae (ae_uniformBreak_pos B)

theorem posteriorLog_ratePosteriorSample_le {B M : PosReal} (hBM : B ≤ M)
    (F : ProbabilityMeasure ℝ) (y : ℝ) (ω : DirichletSampleSpace)
    (hz : 0 < (uniformBreak M ω.2).val) :
    posteriorLog (rateEquiv y) (ratePosteriorSample B F y ω) ≤
      Real.log 2 - Real.log (uniformBreak M ω.2).val := by
  have hw : (uniformBreak M ω.2).val ≤ (uniformBreak B ω.2).val :=
    uniformBreak_antitone_mass ω.2 hBM
  rw [ratePosteriorSample_eq]
  exact (atomMixture_neg_log_bounds (rateDirichletSample B F ω) (uniformBreak B ω.2)
    (hz.trans_le hw) (rateEquiv y)).2.trans (sub_le_sub_left (Real.log_le_log hz hw) _)

end GGC
