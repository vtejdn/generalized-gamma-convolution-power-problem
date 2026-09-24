import GGC.PhaseScalingContinuity
import GGC.LogRate.SampleResolvent
import Mathlib.Analysis.Calculus.Deriv.Support

/-! # Continuity of the deterministic phase generator

The full compensated Taylor kernel is continuous in L¹. Combined with
weak-star phase continuity this proves continuity of the sample generator.
Posterior averaging, its common-space coupling and its domination remain
separate obligations.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.LogRate

theorem continuous_taylorRemainder {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) :
    Continuous (fun x : ℝ × ℝ => taylorRemainder φ x.1 x.2) :=
  ((hφ.continuous.comp (continuous_fst.add continuous_snd)).sub
    (hφ.continuous.comp continuous_fst)).sub
    (continuous_snd.mul ((hφ.continuous_deriv (by norm_num)).comp continuous_fst))

theorem integrable_taylorRemainder {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) (y : ℝ) :
    Integrable (taylorRemainder φ y) jumpMeasure := by
  have h := integrable_compensatedJump (k := fun _ => 1) measurable_const
    (fun _ => zero_le_one) (fun _ => le_rfl) hφ hC y
  simpa only [mul_one] using h

def sampleJumpKernel (φ : ℝ → ℝ) (y u : ℝ) : ℝ :=
  taylorRemainder φ y (Real.log u) / (u - 1)^2

theorem integrable_sampleJumpKernel {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) (y : ℝ) :
    IntegrableOn (sampleJumpKernel φ y) (Ioi 0) :=
  (integrable_jumpMeasure_iff _).mp (integrable_taylorRemainder hφ hC y)

theorem integral_abs_sampleJumpKernel_sub (φ : ℝ → ℝ) (y z : ℝ) :
    (∫ u in Ioi 0, |sampleJumpKernel φ y u - sampleJumpKernel φ z u|) =
      ∫ v, |taylorRemainder φ y v - taylorRemainder φ z v| ∂jumpMeasure := by
  rw [integral_jumpMeasure]
  apply setIntegral_congr_fun measurableSet_Ioi
  intro u _
  simp only [sampleJumpKernel, ← sub_div, abs_div, abs_of_nonneg (sq_nonneg (u - 1))]

theorem tendsto_integral_abs_sampleJumpKernel_sub {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C)
    {ι : Type*} {l : Filter ι} [l.IsCountablyGenerated] {y : ι → ℝ} {z : ℝ}
    (hy : Tendsto y l (𝓝 z)) :
    Tendsto (fun i => ∫ u in Ioi 0, |sampleJumpKernel φ (y i) u - sampleJumpKernel φ z u|)
      l (𝓝 0) := by
  simp_rw [integral_abs_sampleJumpKernel_sub]
  have ht := tendsto_integral_filter_of_dominated_convergence
    (μ := jumpMeasure) (l := l) (F := fun i v => |taylorRemainder φ (y i) v - taylorRemainder φ z v|)
    (f := fun _ => 0) (fun v => C * v^2)
    (Eventually.of_forall fun i => ((integrable_taylorRemainder hφ hC (y i)).sub
      (integrable_taylorRemainder hφ hC z)).abs.aestronglyMeasurable)
    (Eventually.of_forall fun i => Eventually.of_forall fun v => ?_)
    (integrable_sq_jumpMeasure.const_mul C) (Eventually.of_forall fun v => ?_)
  · simpa only [integral_zero] using ht
  · rw [Real.norm_eq_abs, abs_abs]
    calc
      _ ≤ |taylorRemainder φ (y i) v| + |taylorRemainder φ z v| := abs_sub _ _
      _ ≤ C * v^2 := by
        linarith [abs_taylorRemainder_le hφ hC (y i) v, abs_taylorRemainder_le hφ hC z v]
  · have hc : Continuous (fun w : ℝ => taylorRemainder φ w v) :=
      (continuous_taylorRemainder hφ).comp (continuous_id.prodMk continuous_const)
    simpa only [sub_self, abs_zero, Function.comp_def] using (((hc.tendsto z).comp hy).sub_const
      (taylorRemainder φ z v)).abs

theorem sampleJump_eq_kernel (P : ProbabilityMeasure PosReal) (φ : ℝ → ℝ) (y : ℝ) :
    compensatedJump (fun v => stieltjesPhase P (Real.exp (y + v))) φ y =
      ∫ u in Ioi 0, sampleJumpKernel φ y u * stieltjesPhase P (Real.exp y * u) := by
  rw [compensatedJump, integral_jumpMeasure]
  apply setIntegral_congr_fun measurableSet_Ioi
  intro u hu
  dsimp only
  rw [Real.exp_add, Real.exp_log hu]
  dsimp only [sampleJumpKernel]
  ring

theorem continuous_sampleJump {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) :
    Continuous (fun x : ProbabilityMeasure PosReal × ℝ =>
      compensatedJump (fun v => stieltjesPhase x.1 (Real.exp (x.2 + v))) φ x.2) := by
  rw [continuous_iff_continuousAt]
  intro x
  have hy : Tendsto (fun z : ProbabilityMeasure PosReal × ℝ => z.2) (𝓝 x) (𝓝 x.2) :=
    continuous_snd.continuousAt
  have ht := tendsto_integral_scaledStieltjesPhase_mul_of_l1
    (P := fun z : ProbabilityMeasure PosReal × ℝ => z.1) continuous_fst.continuousAt
    (Real.exp_pos x.2) ((Real.continuous_exp.tendsto x.2).comp hy)
    (Eventually.of_forall fun z => integrable_sampleJumpKernel hφ hC z.2)
    (integrable_sampleJumpKernel hφ hC x.2)
    (tendsto_integral_abs_sampleJumpKernel_sub hφ hC hy)
  simpa only [Function.comp_def, ← sampleJump_eq_kernel] using! ht

theorem continuous_sampleDrift :
    Continuous (fun x : PosReal × ProbabilityMeasure PosReal × ℝ =>
      sampleDrift x.1 x.2.1 x.2.2) := by
  have hd : Continuous (fun B : PosReal => digamma (B.val + 1)) :=
    continuousOn_digamma.comp_continuous (continuous_subtype_val.add continuous_const)
      (fun B => show 0 < B.val + 1 from add_pos B.property zero_lt_one)
  have hp : Continuous (fun x : PosReal × ProbabilityMeasure PosReal × ℝ =>
      (x.2.1, (⟨Real.exp x.2.2, Real.exp_pos _⟩ : PosReal))) := by fun_prop
  have hm := continuous_stieltjesMean.comp hp
  have hl := hm.log (fun x => (stieltjesMean_pos x.2.1 (Real.exp_pos x.2.2)).ne')
  have hc := (continuous_integral_scaledStieltjesPhase_mul integrableOn_correctionKernel).comp hp
  simpa only [sampleDrift, phaseCorrection, Function.comp_def, Pi.add_apply,
    Pi.sub_apply, Pi.neg_apply, mul_comm] using!
    ((((hd.comp continuous_fst).add continuous_const).neg).sub hl).add hc

/-- The sample generator is jointly continuous before posterior averaging.
The second derivative bound holds in particular for compactly supported C² tests. -/
theorem continuous_sampleGenerator {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) :
    Continuous (fun x : PosReal × ProbabilityMeasure PosReal × ℝ =>
      sampleGenerator x.1 x.2.1 φ x.2.2) :=
  (continuous_sampleDrift.mul ((hφ.continuous_deriv (by norm_num)).comp
    (continuous_snd.comp continuous_snd))).add
    ((continuous_sampleJump hφ hC).comp continuous_snd)

theorem continuous_sampleGenerator_compact {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ)
    (hs : HasCompactSupport φ) :
    Continuous (fun x : PosReal × ProbabilityMeasure PosReal × ℝ =>
      sampleGenerator x.1 x.2.1 φ x.2.2) := by
  have hd₂ : Continuous (deriv (deriv φ)) :=
    (hφ.deriv' : ContDiff ℝ 1 (deriv φ)).continuous_deriv (by norm_num)
  obtain ⟨C, hC⟩ := hs.deriv.deriv.exists_bound_of_continuous hd₂
  exact continuous_sampleGenerator hφ (fun x => by simpa only [Real.norm_eq_abs] using hC x)

end GGC.LogRate
