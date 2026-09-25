import GGC.UniformBeta
import GGC.Foundations.Quantile
import GGC.Foundations.ProbabilityBorel
import GGC.DirichletStickBreaking
import GGC.DirichletPosterior

/-! # Dirichlet sampling on a fixed common probability space

The fraction coordinates use the prescribed common-uniform formula. Real
locations use the ordered inverse CDF (API-027), with proved joint measurability
and exact marginal laws. This witness also supports the additional quantile
coupling theorem in `Foundations.QuantileContinuity`; continuity of the resulting
stick sums and posterior expectations remains a separate M4 obligation.
The generic measurable-kernel adapter (API-008) remains in `Foundations.Sampling`.

The imported `probabilityMeasureBorelSpace` instance certifies that the existing
Giry structure on the output and parameter laws is the narrow Borel structure.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Classical
namespace GGC
open RandomMeasure

abbrev UniformCore := (ℕ → UnitWeight) × (ℕ → UnitWeight)
abbrev DirichletSampleSpace := UniformCore × UnitWeight

def uniformCoreLaw : ProbabilityMeasure UniformCore :=
  uniformSequenceLaw.prod uniformSequenceLaw

def dirichletSampleSpaceLaw : ProbabilityMeasure DirichletSampleSpace :=
  uniformCoreLaw.prod ⟨volume, inferInstance⟩

def dirichletCoreSample (B : PosReal) (F : ProbabilityMeasure ℝ) (ω : UniformCore) :
    ProbabilityMeasure ℝ := by
  classical
  exact if h : ω.1 ∈ stickCommonEvent then
    stickProbability (fun i => uniformBreak B (ω.1 i))
      (fun i => quantileSampler F (ω.2 i)) (hasSum_uniformBreak_on_commonEvent h B)
  else ⟨Measure.dirac 0, inferInstance⟩

theorem dirichletCoreSample_toMeasure (B : PosReal) (F : ProbabilityMeasure ℝ) (ω : UniformCore) :
    (dirichletCoreSample B F ω : Measure ℝ) =
      if ω.1 ∈ stickCommonEvent then
        stickMeasure (fun i => uniformBreak B (ω.1 i)) (fun i => quantileSampler F (ω.2 i))
      else Measure.dirac 0 := by
  classical
  unfold dirichletCoreSample
  split <;> rfl

@[fun_prop] theorem measurable_dirichletCoreSample :
    Measurable (fun p : (PosReal × ProbabilityMeasure ℝ) × UniformCore =>
      dirichletCoreSample p.1.1 p.1.2 p.2) := by
  classical
  have hV : Measurable (fun p : (PosReal × ProbabilityMeasure ℝ) × UniformCore =>
      fun i => uniformBreak p.1.1 (p.2.1 i)) :=
    measurable_pi_iff.2 fun i => measurable_uniformBreak.comp
      ((measurable_fst.comp measurable_fst).prodMk
        ((measurable_pi_apply i).comp (measurable_fst.comp measurable_snd)))
  have hY : Measurable (fun p : (PosReal × ProbabilityMeasure ℝ) × UniformCore =>
      fun i => quantileSampler p.1.2 (p.2.2 i)) :=
    measurable_pi_iff.2 fun i => measurable_quantileSampler.comp
      ((measurable_snd.comp measurable_fst).prodMk
        ((measurable_pi_apply i).comp (measurable_snd.comp measurable_snd)))
  have hm := measurable_stickMeasure.comp (hV.prodMk hY)
  apply Measurable.subtype_mk
  change Measurable (fun p : (PosReal × ProbabilityMeasure ℝ) × UniformCore =>
    (dirichletCoreSample p.1.1 p.1.2 p.2 : Measure ℝ))
  simp_rw [dirichletCoreSample_toMeasure]
  exact hm.ite (measurableSet_stickCommonEvent.preimage
    (measurable_fst.comp measurable_snd)) measurable_const

theorem measurable_dirichletCoreSample_section (B : PosReal) (F : ProbabilityMeasure ℝ) :
    Measurable (dirichletCoreSample B F) := by
  have h := measurable_dirichletCoreSample.comp
    (show Measurable (fun ω : UniformCore => ((B,F),ω)) from
      measurable_const.prodMk measurable_id)
  exact h

def dirichletLaw (B : PosReal) (F : ProbabilityMeasure ℝ) :
    ProbabilityMeasure (ProbabilityMeasure ℝ) :=
  uniformCoreLaw.map (measurable_dirichletCoreSample_section B F).aemeasurable

@[fun_prop] theorem measurable_dirichletLaw :
    Measurable (fun p : PosReal × ProbabilityMeasure ℝ => dirichletLaw p.1 p.2) :=
  measurable_probability_map_parameterized measurable_const measurable_dirichletCoreSample

theorem dirichletCoreSample_eq_stickMeasure_ae (B : PosReal) (F : ProbabilityMeasure ℝ) :
    ∀ᵐ ω ∂(uniformCoreLaw : Measure UniformCore),
      (dirichletCoreSample B F ω : Measure ℝ) =
        stickMeasure (fun i => uniformBreak B (ω.1 i))
          (fun i => quantileSampler F (ω.2 i)) := by
  have hm : MeasurePreserving Prod.fst (uniformCoreLaw : Measure UniformCore)
      (uniformSequenceLaw : Measure (ℕ → UnitWeight)) := by
    refine ⟨measurable_fst, ?_⟩
    change Measure.map Prod.fst ((uniformSequenceLaw : Measure (ℕ → UnitWeight)).prod
      (uniformSequenceLaw : Measure (ℕ → UnitWeight))) = _
    simp
  filter_upwards [hm.quasiMeasurePreserving.ae ae_stickCommonEvent] with ω hω
  simp [dirichletCoreSample, hω, stickProbability]

theorem dirichletLaw_isDirichlet (B : PosReal) (F : ProbabilityMeasure ℝ) :
    IsDirichletProcess (ENNReal.ofReal B.val • (F : Measure ℝ)) (dirichletLaw B F) := by
  have hV : Measurable (fun T : ℕ → UnitWeight => fun i => uniformBreak B (T i)) :=
    measurable_pi_iff.2 fun i => measurable_uniformBreak.comp
      (measurable_const.prodMk (measurable_pi_apply i))
  have hY : Measurable (fun S : ℕ → UnitWeight => fun i => quantileSampler F (S i)) :=
    measurable_pi_iff.2 fun i => measurable_quantileSampler.comp
      (measurable_const.prodMk (measurable_pi_apply i))
  apply GGC.stick_breaking uniformCoreLaw B.val B.property F
    (betaWeightLaw B) (betaWeightLaw_map_val B)
    (fun ω i => uniformBreak B (ω.1 i)) (fun ω i => quantileSampler F (ω.2 i))
    (hV.comp measurable_fst) (hY.comp measurable_snd)
    _ (dirichletCoreSample B F) (measurable_dirichletCoreSample_section B F)
    (dirichletCoreSample_eq_stickMeasure_ae B F)
  change Measure.map (Prod.map (fun T i => uniformBreak B (T i))
    (fun S i => quantileSampler F (S i)))
    ((uniformSequenceLaw : Measure (ℕ → UnitWeight)).prod
      (uniformSequenceLaw : Measure (ℕ → UnitWeight))) = _
  rw [← Measure.map_prod_map _ _ hV hY]
  change (Measure.map _ (Measure.infinitePi (fun _ : ℕ => (volume : Measure UnitWeight)))).prod
    (Measure.map _ (Measure.infinitePi (fun _ : ℕ => (volume : Measure UnitWeight)))) = _
  have hBreak : Measurable (uniformBreak B) :=
    measurable_uniformBreak.comp (measurable_prodMk_left (x := B))
  rw [Measure.infinitePi_map_pi _ (fun _ => hBreak),
    Measure.infinitePi_map_pi _ (fun _ => measurable_quantileSampler_section F)]
  simp_rw [uniformBreak_map, quantileSampler_map]

def dirichletSample (B : PosReal) (F : ProbabilityMeasure ℝ) (ω : DirichletSampleSpace) :
    ProbabilityMeasure ℝ := dirichletCoreSample B F ω.1

def posteriorSample (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ)
    (ω : DirichletSampleSpace) : ProbabilityMeasure ℝ :=
  atomMixture (dirichletSample B F ω) (uniformBreak B ω.2) y

@[fun_prop] theorem measurable_dirichletSample :
    Measurable (fun p : (PosReal × ProbabilityMeasure ℝ) × DirichletSampleSpace =>
      dirichletSample p.1.1 p.1.2 p.2) := by
  have h := measurable_dirichletCoreSample.comp
    (show Measurable (fun p : (PosReal × ProbabilityMeasure ℝ) × DirichletSampleSpace =>
      (p.1,p.2.1)) from measurable_fst.prodMk (measurable_fst.comp measurable_snd))
  exact h

theorem measurable_posteriorSample :
    Measurable (fun p : ((PosReal × ProbabilityMeasure ℝ) × ℝ) × DirichletSampleSpace =>
      posteriorSample p.1.1.1 p.1.1.2 p.1.2 p.2) := by
  have hQ : Measurable
      (fun p : ((PosReal × ProbabilityMeasure ℝ) × ℝ) × DirichletSampleSpace =>
        dirichletSample p.1.1.1 p.1.1.2 p.2) := by
    have h := measurable_dirichletSample.comp
      (show Measurable (fun p : ((PosReal × ProbabilityMeasure ℝ) × ℝ) × DirichletSampleSpace =>
        (p.1.1,p.2)) from (measurable_fst.comp measurable_fst).prodMk measurable_snd)
    exact h
  have hZ : Measurable
      (fun p : ((PosReal × ProbabilityMeasure ℝ) × ℝ) × DirichletSampleSpace =>
        uniformBreak p.1.1.1 p.2.2) := measurable_uniformBreak.comp
    ((measurable_fst.comp (measurable_fst.comp measurable_fst)).prodMk
      (measurable_snd.comp measurable_snd))
  have h := measurable_atomMixture.comp (hQ.prodMk (hZ.prodMk (measurable_snd.comp measurable_fst)))
  simpa only [Function.comp_def, posteriorSample] using h

theorem dirichletSample_map (B : PosReal) (F : ProbabilityMeasure ℝ) :
    Measure.map (dirichletSample B F) (dirichletSampleSpaceLaw : Measure DirichletSampleSpace) =
      (dirichletLaw B F : Measure (ProbabilityMeasure ℝ)) := by
  change Measure.map (dirichletCoreSample B F ∘ Prod.fst)
    ((uniformCoreLaw : Measure UniformCore).prod (volume : Measure UnitWeight)) = _
  rw [← Measure.map_map (measurable_dirichletCoreSample_section B F) measurable_fst]
  simp [dirichletLaw]

theorem posteriorSample_map (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    Measure.map (posteriorSample B F y)
      (dirichletSampleSpaceLaw : Measure DirichletSampleSpace) =
        (atomMixtureLaw (dirichletLaw B F) (betaWeightLaw B) y :
          Measure (ProbabilityMeasure ℝ)) := by
  rw [atomMixtureLaw_toMeasure]
  have hQ := measurable_dirichletCoreSample_section B F
  have hZ : Measurable (uniformBreak B) :=
    measurable_uniformBreak.comp (measurable_prodMk_left (x := B))
  have he : ((dirichletLaw B F : Measure (ProbabilityMeasure ℝ))).prod
      (betaWeightLaw B : Measure UnitWeight) =
      Measure.map (Prod.map (dirichletCoreSample B F) (uniformBreak B))
        (dirichletSampleSpaceLaw : Measure DirichletSampleSpace) := by
    rw [← uniformBreak_map B]
    exact Measure.map_prod_map _ _ hQ hZ
  rw [he, Measure.map_map (measurable_atomMixture_sample y) (hQ.prodMap hZ)]
  rfl

theorem posteriorLaw_isDirichlet (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    IsDirichletProcess (ENNReal.ofReal B.val • (F : Measure ℝ) + Measure.dirac y)
      (atomMixtureLaw (dirichletLaw B F) (betaWeightLaw B) y) :=
  GGC.beta_atom_posterior _ _ (dirichletLaw_isDirichlet B F) B.val B.property
    (by simp) (betaWeightLaw B) (betaWeightLaw_map_val B) y

/-- Both laws live on the same fixed probability space. -/
theorem dirichletSample_isDirichlet (B : PosReal) (F : ProbabilityMeasure ℝ) :
    IsDirichletProcess (ENNReal.ofReal B.val • (F : Measure ℝ))
      (dirichletSampleSpaceLaw.map
        (measurable_dirichletSample.comp (measurable_prodMk_left (x := (B,F)))).aemeasurable) := by
  have he : dirichletSampleSpaceLaw.map
      (measurable_dirichletSample.comp (measurable_prodMk_left (x := (B,F)))).aemeasurable =
        dirichletLaw B F := ProbabilityMeasure.toMeasure_injective (dirichletSample_map B F)
  rw [he]
  exact dirichletLaw_isDirichlet B F

theorem posteriorSample_isDirichlet (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    IsDirichletProcess (ENNReal.ofReal B.val • (F : Measure ℝ) + Measure.dirac y)
      (dirichletSampleSpaceLaw.map
        (measurable_posteriorSample.comp (measurable_prodMk_left (x := ((B,F),y)))).aemeasurable) := by
  have he : dirichletSampleSpaceLaw.map
      (measurable_posteriorSample.comp (measurable_prodMk_left (x := ((B,F),y)))).aemeasurable =
        atomMixtureLaw (dirichletLaw B F) (betaWeightLaw B) y :=
    ProbabilityMeasure.toMeasure_injective (posteriorSample_map B F y)
  rw [he]
  exact posteriorLaw_isDirichlet B F y

/-- One measurable event in the full sampling space, independent of every
mass and base-law parameter. No uncountable intersection is taken. -/
def dirichletCommonEvent : Set DirichletSampleSpace :=
  {ω | ω.1.1 ∈ stickCommonEvent}

theorem measurableSet_dirichletCommonEvent : MeasurableSet dirichletCommonEvent :=
  measurableSet_stickCommonEvent.preimage (measurable_fst.comp measurable_fst)

theorem ae_dirichletCommonEvent :
    ∀ᵐ ω ∂(dirichletSampleSpaceLaw : Measure DirichletSampleSpace), ω ∈ dirichletCommonEvent := by
  have h₁ : MeasurePreserving Prod.fst (uniformCoreLaw : Measure UniformCore)
      (uniformSequenceLaw : Measure (ℕ → UnitWeight)) := ⟨measurable_fst, by
    change Measure.map Prod.fst ((uniformSequenceLaw : Measure (ℕ → UnitWeight)).prod
      (uniformSequenceLaw : Measure (ℕ → UnitWeight))) = _
    simp⟩
  have h₂ : MeasurePreserving Prod.fst (dirichletSampleSpaceLaw : Measure DirichletSampleSpace)
      (uniformCoreLaw : Measure UniformCore) := ⟨measurable_fst, by
    change Measure.map Prod.fst ((uniformCoreLaw : Measure UniformCore).prod (volume : Measure UnitWeight)) = _
    simp⟩
  exact h₂.quasiMeasurePreserving.ae (h₁.quasiMeasurePreserving.ae ae_stickCommonEvent)

theorem dirichletSample_stick_on_commonEvent {ω : DirichletSampleSpace}
    (hω : ω ∈ dirichletCommonEvent) (B : PosReal) (F : ProbabilityMeasure ℝ) :
    HasSum (stickWeight (fun i => uniformBreak B (ω.1.1 i))) 1 ∧
      (dirichletSample B F ω : Measure ℝ) =
        stickMeasure (fun i => uniformBreak B (ω.1.1 i))
          (fun i => quantileSampler F (ω.1.2 i)) := by
  refine ⟨hasSum_uniformBreak_on_commonEvent hω B, ?_⟩
  change ω.1.1 ∈ stickCommonEvent at hω
  change (dirichletCoreSample B F ω.1 : Measure ℝ) = _
  rw [dirichletCoreSample_toMeasure, if_pos hω]

theorem ae_all_parameters_stick_realization :
    ∀ᵐ ω ∂(dirichletSampleSpaceLaw : Measure DirichletSampleSpace),
      ∀ (B : PosReal) (F : ProbabilityMeasure ℝ),
        HasSum (stickWeight (fun i => uniformBreak B (ω.1.1 i))) 1 ∧
        (dirichletSample B F ω : Measure ℝ) =
          stickMeasure (fun i => uniformBreak B (ω.1.1 i))
            (fun i => quantileSampler F (ω.1.2 i)) :=
  ae_dirichletCommonEvent.mono fun _ hω B F => dirichletSample_stick_on_commonEvent hω B F

end GGC
