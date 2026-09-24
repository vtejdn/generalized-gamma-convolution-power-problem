import GGC.Foundations.CompactSmoothTests
import Mathlib.MeasureTheory.Measure.LevyProkhorovMetric
import Mathlib.Topology.ContinuousMap.Bounded.ArzelaAscoli
import Mathlib.Topology.ContinuousMap.Compact
import Mathlib.Topology.MetricSpace.Equicontinuity

/-! # Compactness of whole probability-valued curves from smooth-test estimates

The subsequence is extracted in the compact-open space of probability-valued
curves. Since the time domain is compact, this is uniform narrow convergence.
The extraction is independent of every subsequent choice of test function.
-/

noncomputable section
open MeasureTheory Set Filter Topology
open scoped NNReal
namespace GGC.Analysis

private theorem equicontinuous_pi_of_coordinates {ι X J : Type*} [TopologicalSpace X]
    {F : ι → X → J → ℝ} (h : ∀ j, Equicontinuous (fun i x => F i x j)) :
    Equicontinuous F := by
  rw [Pi.uniformSpace_eq, equicontinuous_iInf_rng]
  intro j
  letI : UniformSpace (J → ℝ) := UniformSpace.comap (fun f : J → ℝ => f j) inferInstance
  have hu : IsUniformInducing (fun f : J → ℝ => f j) := ⟨rfl⟩
  exact hu.equicontinuous_iff.mpr (h j)

/-- A common subsequence of entire narrowly continuous curves, obtained from
compact containment and a uniform Lipschitz bound for each compact C² test. -/
theorem exists_tendsto_subseq_of_compactC2_lipschitz
    {X : Type*} [MetricSpace X] [CompactSpace X]
    (f : ℕ → C(X, ProbabilityMeasure ℝ))
    {K : Set (ProbabilityMeasure ℝ)} (hK : IsCompact K) (hm : ∀ n x, f n x ∈ K)
    (ht : ∀ φ : CompactC2Test, ∃ L : ℝ≥0, ∀ n,
      LipschitzWith L (fun x => compactC2Integrals (f n x) φ)) :
    ∃ g : C(X, ProbabilityMeasure ℝ), ∃ s : ℕ → ℕ,
      StrictMono s ∧ Tendsto (f ∘ s) atTop (𝓝 g) := by
  letI : MetricSpace (ProbabilityMeasure ℝ) := TopologicalSpace.metrizableSpaceMetric _
  letI : CompactSpace K := isCompact_iff_compactSpace.mp hK
  let e : K → CompactC2Test → ℝ := fun F => compactC2Integrals F.val
  have he : IsEmbedding e := (isClosedEmbedding_compactC2Integrals hK).isEmbedding
  have hu : IsUniformInducing e := by
    have hspace : he.comapUniformSpace e = (inferInstance : UniformSpace K) :=
      unique_uniformity_of_compact rfl rfl
    exact ⟨congrArg (fun u : UniformSpace K => u.uniformity) hspace⟩
  let fk : ℕ → X → K := fun n x => ⟨f n x, hm n x⟩
  have htests : Equicontinuous (fun n x => e (fk n x)) := by
    apply equicontinuous_pi_of_coordinates
    intro φ
    obtain ⟨L, hL⟩ := ht φ
    apply Metric.equicontinuous_of_continuity_modulus (fun δ => L.val*δ)
      (by simpa using (tendsto_id.const_mul L.val : Tendsto (fun δ : ℝ => L.val*δ) (𝓝 0) (𝓝 (L.val*0))))
    intro x y n
    exact (hL n).dist_le_mul x y
  have hk : Equicontinuous fk := hu.equicontinuous_iff.mpr htests
  have hf : Equicontinuous (fun n x => f n x) :=
    isUniformEmbedding_subtype_val.isUniformInducing.equicontinuous_iff.mp hk
  let b : ℕ → BoundedContinuousFunction X (ProbabilityMeasure ℝ) :=
    fun n => ContinuousMap.equivBoundedOfCompact X (ProbabilityMeasure ℝ) (f n)
  have hb : Equicontinuous ((↑) : range b → X → ProbabilityMeasure ℝ) := by
    intro x U hU
    filter_upwards [hf x U hU] with y hy v
    obtain ⟨n, hn⟩ := v.property
    have heq : v.val = b n := hn.symm
    simpa only [heq, b] using! hy n
  have hc : IsCompact (closure (range b)) :=
    BoundedContinuousFunction.arzela_ascoli K hK (range b)
      (fun v x hv => by obtain ⟨n, rfl⟩ := hv; exact hm n x) hb
  obtain ⟨g, _, s, hmono, hlim⟩ := hc.tendsto_subseq (fun n => subset_closure (mem_range_self n))
  let E := ContinuousMap.isometryEquivBoundedOfCompact (α := X) (β := ProbabilityMeasure ℝ)
  refine ⟨E.symm g, s, hmono, ?_⟩
  have h := (E.symm.continuous.tendsto g).comp hlim
  have heq (n : ℕ) : E.symm (b n) = f n := by ext; rfl
  simpa only [Function.comp_def, heq] using h

end GGC.Analysis
