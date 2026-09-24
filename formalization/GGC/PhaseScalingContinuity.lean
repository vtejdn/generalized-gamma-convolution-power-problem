import GGC.PhaseWeakContinuity
import GGC.Foundations.L1Dilation

/-! # Joint continuity of phase pairings under positive scaling

Both the rate law and the argument scale may vary. The proof transfers the
scale to the L¹ test kernel, where its continuity follows from logarithmic
coordinates. Boundary phases are used only under absolutely convergent integrals.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC

theorem integral_scaledStieltjesPhase_mul (P : ProbabilityMeasure PosReal)
    (f : ℝ → ℝ) {b : ℝ} (hb : 0 < b) :
    (∫ u in Ioi 0, f u * stieltjesPhase P (b * u)) =
      ∫ t in Ioi 0, Analysis.dilateKernel f b t * stieltjesPhase P t := by
  have h := integral_comp_mul_left_Ioi
    (fun t => Analysis.dilateKernel f b t * stieltjesPhase P t) 0 hb
  have he (u : ℝ) : Analysis.dilateKernel f b (b * u) * stieltjesPhase P (b * u) =
      b⁻¹ * (f u * stieltjesPhase P (b * u)) := by
    simp only [Analysis.dilateKernel, mul_div_cancel_left₀ _ hb.ne', mul_assoc]
  simp_rw [he, integral_const_mul, mul_zero, smul_eq_mul] at h
  exact mul_left_cancel₀ (inv_ne_zero hb.ne') h

theorem tendsto_integral_scaledStieltjesPhase_mul {ι : Type*} {l : Filter ι}
    {P : ι → ProbabilityMeasure PosReal} {Q : ProbabilityMeasure PosReal}
    (hP : Tendsto P l (𝓝 Q)) {b : ι → ℝ} {c : ℝ} (hc : 0 < c)
    (hb : Tendsto b l (𝓝 c)) {f : ℝ → ℝ} (hf : IntegrableOn f (Ioi 0)) :
    Tendsto (fun i => ∫ u in Ioi 0, f u * stieltjesPhase (P i) (b i * u)) l
      (𝓝 (∫ u in Ioi 0, f u * stieltjesPhase Q (c * u))) := by
  have hpos := hb.eventually (lt_mem_nhds hc)
  have ht := tendsto_integral_stieltjesPhase_mul_of_l1 hP
    (hpos.mono fun _ hi => Analysis.integrableOn_dilateKernel hf hi)
    (Analysis.integrableOn_dilateKernel hf hc)
    (Analysis.tendsto_integral_abs_dilateKernel_sub hc hb hf)
  rw [← integral_scaledStieltjesPhase_mul Q f hc] at ht
  apply ht.congr'
  filter_upwards [hpos] with i hi
  exact (integral_scaledStieltjesPhase_mul (P i) f hi).symm

theorem continuous_integral_scaledStieltjesPhase_mul {f : ℝ → ℝ}
    (hf : IntegrableOn f (Ioi 0)) :
    Continuous (fun x : ProbabilityMeasure PosReal × PosReal =>
      ∫ u in Ioi 0, f u * stieltjesPhase x.1 (x.2.val * u)) := by
  rw [continuous_iff_continuousAt]
  intro x
  exact tendsto_integral_scaledStieltjesPhase_mul continuous_fst.continuousAt x.2.property
    (continuous_subtype_val.comp continuous_snd).continuousAt hf

theorem integrable_mul_scaledStieltjesPhase (P : ProbabilityMeasure PosReal) (b : ℝ)
    {f : ℝ → ℝ} {μ : Measure ℝ} (hf : Integrable f μ) :
    Integrable (fun t => f t * stieltjesPhase P (b * t)) μ := by
  have hp : Measurable (fun t : ℝ => (P, b * t)) :=
    measurable_const.prodMk (measurable_id.const_mul b)
  have hm := phase_jointlyMeasurable.comp hp
  apply hf.mul_bdd hm.aestronglyMeasurable (c := 1)
  exact Eventually.of_forall fun t => by
    change ‖stieltjesPhase P (b * t)‖ ≤ 1
    rw [Real.norm_eq_abs, abs_of_nonneg (stieltjesPhase_bounds P _).1]
    exact (stieltjesPhase_bounds P _).2

theorem abs_scaledStieltjesPhase_pairing_sub_le (P : ProbabilityMeasure PosReal) (b : ℝ)
    {f g : ℝ → ℝ} {μ : Measure ℝ} (hf : Integrable f μ) (hg : Integrable g μ) :
    |(∫ t, f t * stieltjesPhase P (b * t) ∂μ) - ∫ t, g t * stieltjesPhase P (b * t) ∂μ| ≤
      ∫ t, |f t - g t| ∂μ := by
  rw [← integral_sub (integrable_mul_scaledStieltjesPhase P b hf)
    (integrable_mul_scaledStieltjesPhase P b hg)]
  calc
    _ ≤ ∫ t, |f t * stieltjesPhase P (b * t) - g t * stieltjesPhase P (b * t)| ∂μ :=
      abs_integral_le_integral_abs
    _ ≤ _ := by
      apply integral_mono ((integrable_mul_scaledStieltjesPhase P b hf).sub
        (integrable_mul_scaledStieltjesPhase P b hg)).abs (hf.sub hg).abs
      intro t
      change |f t * stieltjesPhase P (b * t) - g t * stieltjesPhase P (b * t)| ≤ |f t - g t|
      rw [← sub_mul, abs_mul, abs_of_nonneg (stieltjesPhase_bounds P _).1]
      exact mul_le_of_le_one_right (abs_nonneg _) (stieltjesPhase_bounds P _).2

/-- Simultaneous variation of the probability law, positive scale and L¹ kernel. -/
theorem tendsto_integral_scaledStieltjesPhase_mul_of_l1 {ι : Type*} {l : Filter ι}
    {P : ι → ProbabilityMeasure PosReal} {Q : ProbabilityMeasure PosReal}
    (hP : Tendsto P l (𝓝 Q)) {b : ι → ℝ} {c : ℝ} (hc : 0 < c)
    (hb : Tendsto b l (𝓝 c)) {f : ι → ℝ → ℝ} {g : ℝ → ℝ}
    (hf : ∀ᶠ i in l, IntegrableOn (f i) (Ioi 0)) (hg : IntegrableOn g (Ioi 0))
    (hfg : Tendsto (fun i => ∫ t in Ioi 0, |f i t - g t|) l (𝓝 0)) :
    Tendsto (fun i => ∫ t in Ioi 0, f i t * stieltjesPhase (P i) (b i * t)) l
      (𝓝 (∫ t in Ioi 0, g t * stieltjesPhase Q (c * t))) := by
  apply (tendsto_integral_scaledStieltjesPhase_mul hP hc hb hg).congr_dist
  apply squeeze_zero' (Eventually.of_forall fun _ => dist_nonneg) ?_ hfg
  filter_upwards [hf] with i hi
  rw [Real.dist_eq, abs_sub_comm]
  exact abs_scaledStieltjesPhase_pairing_sub_le (P i) (b i) hi hg

end GGC
