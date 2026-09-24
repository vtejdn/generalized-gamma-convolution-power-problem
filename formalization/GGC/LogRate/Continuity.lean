import GGC.LogRate.GeneratorContinuity
import GGC.Foundations.VaryingIntegral

/-! # Blueprint M4: continuity after integration against the varying base law

The actual generator is jointly continuous and has a common bound on every
compact positive mass interval. Currying gives uniform convergence on compact
state sets. Tightness then controls integration against the varying law F.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.LogRate

/-- The nonlinear weak-equation functional H_phi(B,F), using the actual generator. -/
def averagedGenerator (B : PosReal) (F : ProbabilityMeasure ℝ) (φ : ℝ → ℝ) : ℝ :=
  ∫ y, generator B F φ y ∂(F : Measure ℝ)

theorem generator_tendstoUniformlyOn_compact {φ : ℝ → ℝ}
    (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ)
    {ι : Type*} {l : Filter ι} {B : ι → PosReal} {b : PosReal}
    {F : ι → ProbabilityMeasure ℝ} {H : ProbabilityMeasure ℝ}
    (hB : Tendsto B l (𝓝 b)) (hF : Tendsto F l (𝓝 H)) (K : Set ℝ) (hK : IsCompact K) :
    TendstoUniformlyOn (fun i y => generator (B i) (F i) φ y) (generator b H φ) l K := by
  have hsection (a : PosReal) (P : ProbabilityMeasure ℝ) : Continuous (generator a P φ) := by
    have hp : Continuous (fun y : ℝ => (a, P, y)) := by fun_prop
    have h := (continuous_generator_compact hφ hs).comp hp
    exact h
  let g : PosReal × ProbabilityMeasure ℝ → C(ℝ, ℝ) :=
    fun p => ⟨generator p.1 p.2 φ, hsection p.1 p.2⟩
  have hg : Continuous g := by
    apply ContinuousMap.continuous_of_continuous_uncurry
    have hp : Continuous (fun p : (PosReal × ProbabilityMeasure ℝ) × ℝ => (p.1.1, p.1.2, p.2)) :=
      by fun_prop
    have h := (continuous_generator_compact hφ hs).comp hp
    exact h
  have ht := (hg.tendsto (b, H)).comp (hB.prodMk_nhds hF)
  exact (ContinuousMap.tendsto_iff_forall_isCompact_tendstoUniformlyOn.mp ht) K hK

theorem tendsto_averagedGenerator {φ : ℝ → ℝ}
    (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ)
    {B : ℕ → PosReal} {b : PosReal} {F : ℕ → ProbabilityMeasure ℝ} {H : ProbabilityMeasure ℝ}
    (hB : Tendsto B atTop (𝓝 b)) (hF : Tendsto F atTop (𝓝 H)) :
    Tendsto (fun n => averagedGenerator (B n) (F n) φ) atTop (𝓝 (averagedGenerator b H φ)) := by
  obtain ⟨C, hC⟩ := generator_compactTest_bound hφ hs (a := b.val / 2) (b := 2 * b.val)
    (half_pos b.property)
  have hv := continuous_subtype_val.tendsto b |>.comp hB
  have hm : ∀ᶠ n in atTop, (B n).val ∈ Icc (b.val / 2) (2 * b.val) :=
    hv.eventually (Icc_mem_nhds (by linarith [b.property]) (by linarith [b.property]))
  have hsection (a : PosReal) (P : ProbabilityMeasure ℝ) : Continuous (generator a P φ) := by
    have hp : Continuous (fun y : ℝ => (a, P, y)) := by fun_prop
    have h := (continuous_generator_compact hφ hs).comp hp
    exact h
  apply Analysis.tendsto_integral_of_narrow_locally_uniform hF
    (fun n => hsection (B n) (F n)) (hsection b H) (C := C)
  · filter_upwards [hm] with n hn y
    exact hC (B n) (F n) hn y
  · intro y
    exact hC b H ⟨by linarith [b.property], by linarith [b.property]⟩ y
  · exact generator_tendstoUniformlyOn_compact hφ hs hB hF

/-- The averaged generator in Blueprint C is continuous in both mass and base law. -/
theorem averaged_generator_continuous {φ : ℝ → ℝ}
    (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) :
    Continuous (fun p : PosReal × ProbabilityMeasure ℝ => averagedGenerator p.1 p.2 φ) := by
  rw [continuous_iff_seqContinuous]
  intro p q h
  exact tendsto_averagedGenerator hφ hs ((continuous_fst.tendsto q).comp h)
    ((continuous_snd.tendsto q).comp h)

end GGC.LogRate
