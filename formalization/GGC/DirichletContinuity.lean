import GGC.RateRealization
import GGC.Foundations.QuantileContinuity
import GGC.Foundations.StickContinuity
import Mathlib.MeasureTheory.Function.ConvergenceInDistribution

/-! # Common-space continuity of Dirichlet and posterior samples

The quantile coordinates converge outside one null set for a given limiting
base law. On the existing common mass-one event, l¹ convergence of weights
controls the full stick sum. The posterior atom and beta fraction then vary
continuously. No moment assumption or new distributional input is used.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology
namespace GGC
open RandomMeasure

theorem measurePreserving_locationUniform (n : ℕ) :
    MeasurePreserving (fun ω : DirichletSampleSpace => ω.1.2 n)
      (dirichletSampleSpaceLaw : Measure DirichletSampleSpace) (volume : Measure UnitWeight) := by
  have h₁ : MeasurePreserving Prod.fst (dirichletSampleSpaceLaw : Measure DirichletSampleSpace)
      (uniformCoreLaw : Measure UniformCore) := ⟨measurable_fst, by
    change Measure.map Prod.fst ((uniformCoreLaw : Measure UniformCore).prod
      (volume : Measure UnitWeight)) = _
    simp⟩
  have h₂ : MeasurePreserving Prod.snd (uniformCoreLaw : Measure UniformCore)
      (uniformSequenceLaw : Measure (ℕ → UnitWeight)) := ⟨measurable_snd, by
    change Measure.map Prod.snd ((uniformSequenceLaw : Measure (ℕ → UnitWeight)).prod
      (uniformSequenceLaw : Measure (ℕ → UnitWeight))) = _
    simp⟩
  have h₃ : MeasurePreserving (fun T : ℕ → UnitWeight => T n)
      (uniformSequenceLaw : Measure (ℕ → UnitWeight)) (volume : Measure UnitWeight) :=
    ⟨measurable_pi_apply n, Measure.infinitePi_map_eval _ n⟩
  exact h₃.comp (h₂.comp h₁)

theorem ae_tendsto_locationQuantiles {ι : Type*} {l : Filter ι}
    {F : ι → ProbabilityMeasure ℝ} {H : ProbabilityMeasure ℝ}
    (hF : Tendsto F l (𝓝 H)) :
    ∀ᵐ ω ∂(dirichletSampleSpaceLaw : Measure DirichletSampleSpace), ∀ n,
      Tendsto (fun i => quantileSampler (F i) (ω.1.2 n)) l
        (𝓝 (quantileSampler H (ω.1.2 n))) := by
  apply ae_all_iff.mpr
  intro n
  exact (measurePreserving_locationUniform n).quasiMeasurePreserving.ae
    (ae_tendsto_quantileSampler hF)

theorem tendsto_dirichletSample_on_commonEvent {ι : Type*} {l : Filter ι}
    {B : ι → PosReal} {b : PosReal} {F : ι → ProbabilityMeasure ℝ} {H : ProbabilityMeasure ℝ}
    {ω : DirichletSampleSpace} (hω : ω ∈ dirichletCommonEvent)
    (hB : Tendsto B l (𝓝 b))
    (hY : ∀ n, Tendsto (fun i => quantileSampler (F i) (ω.1.2 n)) l
      (𝓝 (quantileSampler H (ω.1.2 n)))) :
    Tendsto (fun i => dirichletSample (B i) (F i) ω) l (𝓝 (dirichletSample b H ω)) := by
  change ω.1.1 ∈ stickCommonEvent at hω
  have hV (n : ℕ) : Tendsto (fun i => uniformBreak (B i) (ω.1.1 n)) l
      (𝓝 (uniformBreak b (ω.1.1 n))) := by
    have h := (continuous_uniformBreak.tendsto (b, ω.1.1 n)).comp
      (hB.prodMk_nhds tendsto_const_nhds)
    exact h
  have h := tendsto_stickProbability
    (fun i => hasSum_uniformBreak_on_commonEvent hω (B i))
    (hasSum_uniformBreak_on_commonEvent hω b) hV hY
  simpa only [dirichletSample, dirichletCoreSample, dif_pos hω] using h

theorem ae_tendsto_dirichletSample {ι : Type*} {l : Filter ι}
    {B : ι → PosReal} {b : PosReal} {F : ι → ProbabilityMeasure ℝ} {H : ProbabilityMeasure ℝ}
    (hB : Tendsto B l (𝓝 b)) (hF : Tendsto F l (𝓝 H)) :
    ∀ᵐ ω ∂(dirichletSampleSpaceLaw : Measure DirichletSampleSpace),
      Tendsto (fun i => dirichletSample (B i) (F i) ω) l (𝓝 (dirichletSample b H ω)) := by
  filter_upwards [ae_dirichletCommonEvent, ae_tendsto_locationQuantiles hF] with ω hω hY
  exact tendsto_dirichletSample_on_commonEvent hω hB hY

theorem ae_tendsto_posteriorSample {ι : Type*} {l : Filter ι}
    {B : ι → PosReal} {b : PosReal} {F : ι → ProbabilityMeasure ℝ} {H : ProbabilityMeasure ℝ}
    {y : ι → ℝ} {x : ℝ}
    (hB : Tendsto B l (𝓝 b)) (hF : Tendsto F l (𝓝 H)) (hy : Tendsto y l (𝓝 x)) :
    ∀ᵐ ω ∂(dirichletSampleSpaceLaw : Measure DirichletSampleSpace),
      Tendsto (fun i => posteriorSample (B i) (F i) (y i) ω) l
        (𝓝 (posteriorSample b H x ω)) := by
  filter_upwards [ae_tendsto_dirichletSample hB hF] with ω hω
  have hz := (continuous_uniformBreak.tendsto (b, ω.2)).comp
    (hB.prodMk_nhds tendsto_const_nhds)
  have ht := tendsto_atomMixture hω hz hy
  exact ht

@[fun_prop] theorem continuous_rateLaw : Continuous rateLaw :=
  ProbabilityMeasure.continuous_map Real.expOrderIso.toHomeomorph.continuous

@[fun_prop] theorem continuous_logRateLaw : Continuous logRateLaw :=
  ProbabilityMeasure.continuous_map Real.expOrderIso.toHomeomorph.symm.continuous

theorem ae_tendsto_rateDirichletSample {ι : Type*} {l : Filter ι}
    {B : ι → PosReal} {b : PosReal} {F : ι → ProbabilityMeasure ℝ} {H : ProbabilityMeasure ℝ}
    (hB : Tendsto B l (𝓝 b)) (hF : Tendsto F l (𝓝 H)) :
    ∀ᵐ ω ∂(dirichletSampleSpaceLaw : Measure DirichletSampleSpace),
      Tendsto (fun i => rateDirichletSample (B i) (F i) ω) l
        (𝓝 (rateDirichletSample b H ω)) := by
  filter_upwards [ae_tendsto_dirichletSample hB hF] with ω hω
  exact (continuous_rateLaw.tendsto (dirichletSample b H ω)).comp hω

theorem ae_tendsto_ratePosteriorSample {ι : Type*} {l : Filter ι}
    {B : ι → PosReal} {b : PosReal} {F : ι → ProbabilityMeasure ℝ} {H : ProbabilityMeasure ℝ}
    {y : ι → ℝ} {x : ℝ}
    (hB : Tendsto B l (𝓝 b)) (hF : Tendsto F l (𝓝 H)) (hy : Tendsto y l (𝓝 x)) :
    ∀ᵐ ω ∂(dirichletSampleSpaceLaw : Measure DirichletSampleSpace),
      Tendsto (fun i => ratePosteriorSample (B i) (F i) (y i) ω) l
        (𝓝 (ratePosteriorSample b H x ω)) := by
  filter_upwards [ae_tendsto_posteriorSample hB hF hy] with ω hω
  exact (continuous_rateLaw.tendsto (posteriorSample b H x ω)).comp hω

theorem tendsto_dirichletLaw {ι : Type*} {l : Filter ι} [l.IsCountablyGenerated]
    {B : ι → PosReal} {b : PosReal} {F : ι → ProbabilityMeasure ℝ} {H : ProbabilityMeasure ℝ}
    (hB : Tendsto B l (𝓝 b)) (hF : Tendsto F l (𝓝 H)) :
    Tendsto (fun i => dirichletLaw (B i) (F i)) l (𝓝 (dirichletLaw b H)) := by
  have hm (a : PosReal) (P : ProbabilityMeasure ℝ) : Measurable (dirichletSample a P) := by
    have h := measurable_dirichletSample.comp (measurable_prodMk_left (x := (a, P)))
    exact h
  have h := tendstoInDistribution_of_ae_tendsto (fun i => (hm (B i) (F i)).aemeasurable)
    (hm b H).aemeasurable (ae_tendsto_dirichletSample hB hF)
  have he (a : PosReal) (P : ProbabilityMeasure ℝ)
      (ha : AEMeasurable (dirichletSample a P) (dirichletSampleSpaceLaw : Measure DirichletSampleSpace)) :
      (⟨Measure.map (dirichletSample a P) (dirichletSampleSpaceLaw : Measure DirichletSampleSpace),
        Measure.isProbabilityMeasure_map ha⟩ : ProbabilityMeasure (ProbabilityMeasure ℝ)) =
        dirichletLaw a P := ProbabilityMeasure.toMeasure_injective (dirichletSample_map a P)
  convert! h.tendsto using 1
  · funext i
    exact (he (B i) (F i) (hm (B i) (F i)).aemeasurable).symm
  · exact congrArg nhds (he b H (hm b H).aemeasurable).symm

@[fun_prop] theorem continuous_dirichletLaw :
    Continuous (fun p : PosReal × ProbabilityMeasure ℝ => dirichletLaw p.1 p.2) := by
  rw [continuous_iff_continuousAt]
  intro p
  exact tendsto_dirichletLaw continuous_fst.continuousAt continuous_snd.continuousAt

theorem tendsto_posteriorLaw {ι : Type*} {l : Filter ι} [l.IsCountablyGenerated]
    {B : ι → PosReal} {b : PosReal} {F : ι → ProbabilityMeasure ℝ} {H : ProbabilityMeasure ℝ}
    {y : ι → ℝ} {x : ℝ}
    (hB : Tendsto B l (𝓝 b)) (hF : Tendsto F l (𝓝 H)) (hy : Tendsto y l (𝓝 x)) :
    Tendsto (fun i => atomMixtureLaw (dirichletLaw (B i) (F i)) (betaWeightLaw (B i)) (y i)) l
      (𝓝 (atomMixtureLaw (dirichletLaw b H) (betaWeightLaw b) x)) := by
  have hm (a : PosReal) (P : ProbabilityMeasure ℝ) (z : ℝ) : Measurable (posteriorSample a P z) := by
    have h := measurable_posteriorSample.comp (measurable_prodMk_left (x := ((a, P), z)))
    exact h
  have h := tendstoInDistribution_of_ae_tendsto (fun i => (hm (B i) (F i) (y i)).aemeasurable)
    (hm b H x).aemeasurable (ae_tendsto_posteriorSample hB hF hy)
  have he (a : PosReal) (P : ProbabilityMeasure ℝ) (z : ℝ)
      (ha : AEMeasurable (posteriorSample a P z)
        (dirichletSampleSpaceLaw : Measure DirichletSampleSpace)) :
      (⟨Measure.map (posteriorSample a P z) (dirichletSampleSpaceLaw : Measure DirichletSampleSpace),
        Measure.isProbabilityMeasure_map ha⟩ : ProbabilityMeasure (ProbabilityMeasure ℝ)) =
        atomMixtureLaw (dirichletLaw a P) (betaWeightLaw a) z :=
    ProbabilityMeasure.toMeasure_injective (posteriorSample_map a P z)
  convert! h.tendsto using 1
  · funext i
    exact (he (B i) (F i) (y i) (hm (B i) (F i) (y i)).aemeasurable).symm
  · exact congrArg nhds (he b H x (hm b H x).aemeasurable).symm

@[fun_prop] theorem continuous_posteriorLaw :
    Continuous (fun p : (PosReal × ProbabilityMeasure ℝ) × ℝ =>
      atomMixtureLaw (dirichletLaw p.1.1 p.1.2) (betaWeightLaw p.1.1) p.2) := by
  rw [continuous_iff_continuousAt]
  intro p
  exact tendsto_posteriorLaw (continuous_fst.comp continuous_fst).continuousAt
    (continuous_snd.comp continuous_fst).continuousAt continuous_snd.continuousAt

@[fun_prop] theorem continuous_rateDirichletLaw :
    Continuous (fun p : PosReal × ProbabilityMeasure ℝ => rateDirichletLaw p.1 p.2) :=
  (ProbabilityMeasure.continuous_map continuous_rateLaw).comp continuous_dirichletLaw

end GGC
