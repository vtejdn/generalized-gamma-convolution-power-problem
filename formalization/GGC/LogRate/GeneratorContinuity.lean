import GGC.DirichletContinuity
import GGC.PosteriorDomination
import GGC.LogRate.Generator
import GGC.LogRate.PosteriorResolvent
import GGC.LogRate.SampleContinuity

/-! # Joint continuity of the actual averaged generator

Common-space posterior samples converge weakly almost everywhere. The sample
generator is continuous by L¹ phase pairing, and a fixed larger-mass beta
fraction supplies an integrable logarithmic majorant for nearby parameters.
This justifies the unbounded posterior expectation (API-030).
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.LogRate
open RandomMeasure

theorem abs_sampleDrift_le (B : PosReal) (P : ProbabilityMeasure PosReal) (y : ℝ) :
    |sampleDrift B P y| ≤ |y| + |digamma (B.val + 1) + 1| +
      posteriorLog (rateEquiv y) P + 1 := by
  have hp : Measurable (fun u : ℝ => (P, Real.exp y * u)) := by fun_prop
  have hm := phase_jointlyMeasurable.comp hp
  have hc : |scaledPhaseCorrection (fun x => stieltjesPhase x.1 x.2) (rateEquiv y) P| ≤ 1 := by
    change |phaseCorrection (fun u => stieltjesPhase P (Real.exp y * u))| ≤ 1
    exact (abs_phaseCorrection_le hm (fun u => (stieltjesPhase_bounds P _).1)
      (fun u => (stieltjesPhase_bounds P _).2)).trans
      (sub_le_self 1 (Real.log_nonneg (by norm_num)))
  have hp := posteriorLog_nonneg (rateEquiv y) P
  rw [sampleDrift_eq_offset]
  change |y + (-(digamma (B.val + 1) + 1) + posteriorLog (rateEquiv y) P +
    scaledPhaseCorrection (fun x => stieltjesPhase x.1 x.2) (rateEquiv y) P)| ≤ _
  have h₁ := abs_add_le (-(digamma (B.val + 1) + 1)) (posteriorLog (rateEquiv y) P)
  have h₂ := abs_add_le (-(digamma (B.val + 1) + 1) + posteriorLog (rateEquiv y) P)
    (scaledPhaseCorrection (fun x => stieltjesPhase x.1 x.2) (rateEquiv y) P)
  have h₃ := abs_add_le y (-(digamma (B.val + 1) + 1) + posteriorLog (rateEquiv y) P +
    scaledPhaseCorrection (fun x => stieltjesPhase x.1 x.2) (rateEquiv y) P)
  rw [abs_neg, abs_of_nonneg hp] at h₁
  linarith

theorem abs_sampleDrift_ratePosteriorSample_le {B M : PosReal} (hBM : B ≤ M)
    (F : ProbabilityMeasure ℝ) (y : ℝ) (ω : DirichletSampleSpace)
    (hz : 0 < (uniformBreak M ω.2).val) :
    |sampleDrift B (ratePosteriorSample B F y ω) y| ≤
      |y| + |digamma (B.val + 1) + 1| + 1 + Real.log 2 - Real.log (uniformBreak M ω.2).val := by
  have h₁ := abs_sampleDrift_le B (ratePosteriorSample B F y ω) y
  have h₂ := posteriorLog_ratePosteriorSample_le hBM F y ω hz
  linarith

theorem generator_eq_integral_ratePosteriorSample (B : PosReal) (F : ProbabilityMeasure ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) (y : ℝ) :
    generator B F φ y = ∫ ω, sampleGenerator B (ratePosteriorSample B F y ω) φ y
      ∂(dirichletSampleSpaceLaw : Measure DirichletSampleSpace) := by
  rw [generator, canonicalGenerator_eq_integral_sampleGenerator _ B hφ hC y]
  change (∫ P, sampleGenerator B P φ y
    ∂(atomMixtureLaw (rateDirichletLaw B F) (betaWeightLaw B) (rateEquiv y) :
      Measure (ProbabilityMeasure PosReal))) = _
  have hm := measurable_ratePosteriorSample.comp (measurable_prodMk_left (x := ((B, F), y)))
  change Measurable (ratePosteriorSample B F y) at hm
  have hp : Continuous (fun P : ProbabilityMeasure PosReal => (B, P, y)) := by fun_prop
  have hc := (continuous_sampleGenerator hφ hC).comp hp
  change Continuous (fun P : ProbabilityMeasure PosReal => sampleGenerator B P φ y) at hc
  rw [← ratePosteriorSample_map B F y, integral_map hm.aemeasurable hc.measurable.aestronglyMeasurable]

theorem tendsto_generator_compact {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ)
    {ι : Type*} {l : Filter ι} [l.IsCountablyGenerated]
    {B : ι → PosReal} {b : PosReal} {F : ι → ProbabilityMeasure ℝ} {H : ProbabilityMeasure ℝ}
    {y : ι → ℝ} {x : ℝ}
    (hB : Tendsto B l (𝓝 b)) (hF : Tendsto F l (𝓝 H)) (hy : Tendsto y l (𝓝 x)) :
    Tendsto (fun i => generator (B i) (F i) φ (y i)) l (𝓝 (generator b H φ x)) := by
  have hd₂ : Continuous (deriv (deriv φ)) :=
    (hφ.deriv' : ContDiff ℝ 1 (deriv φ)).continuous_deriv (by norm_num)
  obtain ⟨C₁, hC₁⟩ := hs.deriv.exists_bound_of_continuous (hφ.continuous_deriv (by norm_num))
  obtain ⟨C₂, hC₂⟩ := hs.deriv.deriv.exists_bound_of_continuous hd₂
  have hC₂' (t : ℝ) : |deriv (deriv φ) t| ≤ C₂ := hC₂ t
  let M : PosReal := ⟨2 * b.val, mul_pos (by norm_num) b.property⟩
  have hm : ∀ᶠ i in l, B i ≤ M := by
    have hv := continuous_subtype_val.tendsto b |>.comp hB
    exact (hv.eventually (gt_mem_nhds (show b.val < M.val by dsimp [M]; linarith [b.property]))).mono
      (fun _ hi => hi.le)
  have hd : Continuous (fun a : PosReal => digamma (a.val + 1)) :=
    continuousOn_digamma.comp_continuous (continuous_subtype_val.add continuous_const)
      (fun a => add_pos a.property zero_lt_one)
  let K : ℝ := |x| + |digamma (b.val + 1) + 1| + 2
  have hk : ∀ᶠ i in l, |y i| + |digamma ((B i).val + 1) + 1| + 1 ≤ K := by
    have ht := ((hy.abs.add ((((hd.tendsto b).comp hB).add_const 1).abs)).add_const 1)
    exact (ht.eventually (gt_mem_nhds (show |x| + |digamma (b.val + 1) + 1| + 1 < K by
      dsimp [K]; linarith))).mono (fun _ hi => hi.le)
  have hmeas (a : PosReal) (P : ProbabilityMeasure ℝ) (z : ℝ) :
      Measurable (fun ω => sampleGenerator a (ratePosteriorSample a P z ω) φ z) := by
    have hp := measurable_ratePosteriorSample.comp (measurable_prodMk_left (x := ((a, P), z)))
    change Measurable (ratePosteriorSample a P z) at hp
    have hpair : Measurable (fun ω : DirichletSampleSpace => (a, ratePosteriorSample a P z ω, z)) :=
      (measurable_const (a := a)).prodMk (hp.prodMk (measurable_const (a := z)))
    have hg := (continuous_sampleGenerator hφ hC₂').measurable.comp
      hpair
    exact hg
  have hdom : Integrable (fun ω : DirichletSampleSpace =>
      (K + Real.log 2 - Real.log (uniformBreak M ω.2).val) * C₁ + C₂ / 2 * jumpSecondMoment)
      (dirichletSampleSpaceLaw : Measure DirichletSampleSpace) := by
    simpa only [Pi.add_apply, sub_eq_add_neg] using!
      (((integrable_const (K + Real.log 2)).add (integrable_neg_log_posteriorUniform M)).mul_const C₁).add
        (integrable_const (C₂ / 2 * jumpSecondMoment))
  have hbound : ∀ᶠ i in l, ∀ᵐ ω ∂(dirichletSampleSpaceLaw : Measure DirichletSampleSpace),
      ‖sampleGenerator (B i) (ratePosteriorSample (B i) (F i) (y i) ω) φ (y i)‖ ≤
        (K + Real.log 2 - Real.log (uniformBreak M ω.2).val) * C₁ + C₂ / 2 * jumpSecondMoment := by
    filter_upwards [hm, hk] with i hiM hiK
    filter_upwards [ae_posteriorUniform_pos M] with ω hω
    have hb : |sampleDrift (B i) (ratePosteriorSample (B i) (F i) (y i) ω) (y i)| ≤
        K + Real.log 2 - Real.log (uniformBreak M ω.2).val := by
      linarith [abs_sampleDrift_ratePosteriorSample_le hiM (F i) (y i) ω hω]
    have hj := abs_compensatedJump_le
      (fun v => (stieltjesPhase_bounds (ratePosteriorSample (B i) (F i) (y i) ω) (Real.exp (y i + v))).1)
      (fun v => (stieltjesPhase_bounds (ratePosteriorSample (B i) (F i) (y i) ω) (Real.exp (y i + v))).2)
      hφ hC₂' (y i)
    rw [Real.norm_eq_abs, sampleGenerator]
    calc
      _ ≤ |sampleDrift (B i) (ratePosteriorSample (B i) (F i) (y i) ω) (y i)| * |deriv φ (y i)| +
          |compensatedJump (fun v => stieltjesPhase (ratePosteriorSample (B i) (F i) (y i) ω)
            (Real.exp (y i + v))) φ (y i)| := by
        simpa only [abs_mul] using abs_add_le
          (sampleDrift (B i) (ratePosteriorSample (B i) (F i) (y i) ω) (y i) * deriv φ (y i)) _
      _ ≤ _ := add_le_add (mul_le_mul hb (hC₁ (y i)) (abs_nonneg _) ((abs_nonneg _).trans hb)) hj
  have hlim : ∀ᵐ ω ∂(dirichletSampleSpaceLaw : Measure DirichletSampleSpace),
      Tendsto (fun i => sampleGenerator (B i) (ratePosteriorSample (B i) (F i) (y i) ω) φ (y i)) l
        (𝓝 (sampleGenerator b (ratePosteriorSample b H x ω) φ x)) := by
    filter_upwards [ae_tendsto_ratePosteriorSample hB hF hy] with ω hω
    have ht := ((continuous_sampleGenerator hφ hC₂').tendsto (b, ratePosteriorSample b H x ω, x)).comp
      (hB.prodMk_nhds (hω.prodMk_nhds hy))
    exact ht
  have ht := tendsto_integral_filter_of_dominated_convergence _
    (Eventually.of_forall fun i => (hmeas (B i) (F i) (y i)).aestronglyMeasurable) hbound hdom hlim
  simpa only [← generator_eq_integral_ratePosteriorSample _ _ hφ hC₂'] using ht

theorem continuous_generator_compact {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) :
    Continuous (fun p : PosReal × ProbabilityMeasure ℝ × ℝ => generator p.1 p.2.1 φ p.2.2) := by
  rw [continuous_iff_continuousAt]
  intro p
  exact tendsto_generator_compact hφ hs continuous_fst.continuousAt
    (continuous_fst.comp continuous_snd).continuousAt (continuous_snd.comp continuous_snd).continuousAt

end GGC.LogRate
