import GGC.LogRate.PhaseResolvent
import GGC.LogRate.JumpCoordinates
import GGC.LogRate.ResolventTest
import GGC.LogRate.CanonicalGenerator

/-! # The sample generator and the direct resolvent identity

The deterministic sample uses the original mass in `digamma (B+1)`.
Posterior averaging is justified separately, with absolute drift and jump bounds.
-/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.LogRate

def sampleDrift (B : PosReal) (P : ProbabilityMeasure PosReal) (y : ℝ) : ℝ :=
  -(digamma (B.val+1)+1) - Real.log (stieltjesMean P (Real.exp y)) +
    phaseCorrection (fun u => stieltjesPhase P (Real.exp y*u))

def sampleGenerator (B : PosReal) (P : ProbabilityMeasure PosReal) (φ : ℝ → ℝ) (y : ℝ) : ℝ :=
  sampleDrift B P y * deriv φ y +
    compensatedJump (fun v => stieltjesPhase P (Real.exp (y+v))) φ y

theorem sampleDrift_jointlyMeasurable (B : PosReal) :
    Measurable (fun x : ProbabilityMeasure PosReal × ℝ => sampleDrift B x.1 x.2) := by
  have hp : Measurable (fun x : ProbabilityMeasure PosReal × ℝ =>
      ((⟨Real.exp x.2, Real.exp_pos x.2⟩ : PosReal),x.1)) := by fun_prop
  have hc := (scaledPhaseCorrection_jointlyMeasurable phase_jointlyMeasurable).comp hp
  have hm := measurable_stieltjesMean.comp (measurable_fst.prodMk measurable_snd.exp)
  exact (measurable_const.sub hm.log).add hc

theorem taylorRemainder_logResolvent_log {s : ℝ} (hs : 0 < s) (y : ℝ)
    {u : ℝ} (hu : 0 < u) :
    taylorRemainder (logResolvent s) y (Real.log u) =
      (s+Real.exp y*u)⁻¹-(s+Real.exp y)⁻¹+Real.exp y*Real.log u/(s+Real.exp y)^2 := by
  rw [taylorRemainder, deriv_logResolvent hs]
  simp only [logResolvent, Real.exp_add, Real.exp_log hu]
  ring

theorem integrable_sample_jumps (P : ProbabilityMeasure PosReal) {s : ℝ}
    (hs : 0 < s) (y : ℝ) :
    Integrable (fun v => taylorRemainder (logResolvent s) y v *
      stieltjesPhase P (Real.exp (y+v))) jumpMeasure := by
  have hp : Measurable (fun v : ℝ => (P, Real.exp (y+v))) := by fun_prop
  exact integrable_compensatedJump (phase_jointlyMeasurable.comp hp)
    (fun v => (stieltjesPhase_bounds P _).1) (fun v => (stieltjesPhase_bounds P _).2)
    (contDiff_logResolvent hs) (abs_deriv_deriv_logResolvent_le hs) y

theorem integral_abs_sample_jumps_le (P : ProbabilityMeasure PosReal) {s : ℝ}
    (hs : 0 < s) (y : ℝ) :
    (∫ v, |taylorRemainder (logResolvent s) y v * stieltjesPhase P (Real.exp (y+v))|
      ∂jumpMeasure) ≤ (1/s)/2*jumpSecondMoment := by
  calc
    _ ≤ ∫ v, (1/s)/2*v^2 ∂jumpMeasure := by
      apply integral_mono (integrable_sample_jumps P hs y).abs (integrable_sq_jumpMeasure.const_mul _)
      intro v
      change |taylorRemainder (logResolvent s) y v * stieltjesPhase P (Real.exp (y+v))| ≤ (1/s)/2*v^2
      rw [abs_mul, abs_of_nonneg (stieltjesPhase_bounds P _).1]
      exact (mul_le_of_le_one_right (abs_nonneg _) (stieltjesPhase_bounds P _).2).trans
        (abs_logResolvent_remainder_le hs y v)
    _ = _ := by rw [integral_const_mul]; rfl

theorem sample_jump_eq_ratio_integral (P : ProbabilityMeasure PosReal)
    {s : ℝ} (hs : 0 < s) (y : ℝ) :
    compensatedJump (fun v => stieltjesPhase P (Real.exp (y+v))) (logResolvent s) y =
      ∫ u in Ioi 0, stieltjesPhase P (Real.exp y*u) *
        (((s+Real.exp y*u)⁻¹-(s+Real.exp y)⁻¹+
          Real.exp y*Real.log u/(s+Real.exp y)^2)/(u-1)^2) := by
  rw [compensatedJump, integral_jumpMeasure]
  apply integral_congr_ae
  filter_upwards [ae_restrict_mem measurableSet_Ioi] with u hu
  rw [taylorRemainder_logResolvent_log hs y hu, Real.exp_add, Real.exp_log hu]
  ring

/-- WIP-6.158: the actual fully compensated sample generator on a resolvent. -/
theorem sampleGenerator_logResolvent (B : PosReal) (P : ProbabilityMeasure PosReal)
    {s : ℝ} (hs : 0 < s) (y : ℝ) :
    sampleGenerator B P (logResolvent s) y =
      Real.exp y/(s+Real.exp y)^2 * (digamma (B.val+1)+1+Real.log (stieltjesMean P s)) := by
  rw [sampleGenerator, deriv_logResolvent hs, sample_jump_eq_ratio_integral P hs y, sampleDrift]
  have hc := phase_integral_cancellation P hs (Real.exp_pos y)
  linear_combination hc

theorem sampleDrift_eq_offset (B : PosReal) (P : ProbabilityMeasure PosReal) (y : ℝ) :
    sampleDrift B P y = y + (-(digamma (B.val+1)+1) +
      posteriorLog ⟨Real.exp y, Real.exp_pos y⟩ P +
      scaledPhaseCorrection (fun x => stieltjesPhase x.1 x.2) ⟨Real.exp y, Real.exp_pos y⟩ P) := by
  simp only [sampleDrift, posteriorLog, scaledPhaseCorrection,
    Real.log_mul (ne_of_gt (Real.exp_pos y)) (ne_of_gt (stieltjesMean_pos P (Real.exp_pos y))),
    Real.log_exp]
  ring

theorem integrable_sampleDrift (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B : PosReal) (y : ℝ) :
    Integrable (fun P => sampleDrift B P y)
      (posteriorMixtureLaw D B ⟨Real.exp y, Real.exp_pos y⟩ : Measure (ProbabilityMeasure PosReal)) := by
  simp_rw [sampleDrift_eq_offset]
  exact (integrable_const y).add (integrable_sampleDriftOffset phase_jointlyMeasurable
    (fun P t => (stieltjesPhase_bounds P t).1) (fun P t => (stieltjesPhase_bounds P t).2) D B _)

theorem integral_abs_sampleDrift_le (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B : PosReal) (y : ℝ) :
    (∫ P, |sampleDrift B P y|
      ∂(posteriorMixtureLaw D B ⟨Real.exp y, Real.exp_pos y⟩ : Measure (ProbabilityMeasure PosReal))) ≤
      |y| + (|digamma (B.val+1)+1|+1+digamma (B.val+1)-digamma 1) := by
  let b : PosReal := ⟨Real.exp y, Real.exp_pos y⟩
  let offset := fun P => -(digamma (B.val+1)+1) + posteriorLog b P +
    scaledPhaseCorrection (fun x => stieltjesPhase x.1 x.2) b P
  have hi : Integrable offset (posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal)) :=
    integrable_sampleDriftOffset phase_jointlyMeasurable
      (fun P t => (stieltjesPhase_bounds P t).1) (fun P t => (stieltjesPhase_bounds P t).2) D B b
  have hb := integral_abs_sampleDriftOffset_le phase_jointlyMeasurable
    (fun P t => (stieltjesPhase_bounds P t).1) (fun P t => (stieltjesPhase_bounds P t).2) D B b
  calc
    _ ≤ ∫ P, |y|+|offset P| ∂(posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal)) := by
      apply integral_mono (integrable_sampleDrift D B y).abs ((integrable_const _).add hi.abs)
      intro P
      change |sampleDrift B P y| ≤ |y|+|offset P|
      rw [sampleDrift_eq_offset]
      exact abs_add_le _ _
    _ = |y| + ∫ P, |offset P| ∂(posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal)) := by
      rw [integral_add (integrable_const _) hi.abs]
      simp
    _ ≤ _ := add_le_add le_rfl hb

end GGC.LogRate
