import GGC.LogRate.Generator
import GGC.LogRate.JumpTruncation
import Mathlib.Probability.Kernel.WithDensity

/-! # Retained jumps for the actual log-rate generator

The cutoff is positive. The acceptance is the specified posterior phase
average, with no auxiliary choice of drift or jump coefficient.
-/

noncomputable section
open MeasureTheory Set Filter ProbabilityTheory
namespace GGC.LogRate

abbrev EulerState := PosReal × ProbabilityMeasure ℝ × ℝ

@[fun_prop] theorem measurable_acceptance_uncurry :
    Measurable (fun p : EulerState × ℝ => acceptance p.1.1 p.1.2.1 p.1.2.2 p.2) := by
  have hp : Measurable (fun p : EulerState × ℝ => (p.1.1, p.1.2.1, p.1.2.2, p.2)) := by fun_prop
  have h := acceptance_jointlyMeasurable.comp hp
  exact h

@[fun_prop] theorem measurable_acceptance (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    Measurable (acceptance B F y) := by
  have hp : Measurable (fun v : ℝ => ((B,F,y),v)) := by fun_prop
  have h := measurable_acceptance_uncurry.comp hp
  exact h

theorem integrable_mul_acceptance {ε : PosReal} {f : ℝ → ℝ}
    (hf : Integrable f (truncatedJumpMeasure ε)) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    Integrable (fun v => f v * acceptance B F y v) (truncatedJumpMeasure ε) := by
  apply hf.mul_bdd (measurable_acceptance B F y).aestronglyMeasurable
  exact Eventually.of_forall fun v => by
    rw [Real.norm_eq_abs, abs_of_nonneg (acceptance_bounds B F y v).1]
    exact (acceptance_bounds B F y v).2

theorem integrable_acceptance_truncated (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    Integrable (acceptance B F y) (truncatedJumpMeasure ε) := by
  simpa only [one_mul] using integrable_mul_acceptance (integrable_const (1 : ℝ)) B F y

def truncatedIntensity (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) : ℝ :=
  ∫ v, acceptance B F y v ∂truncatedJumpMeasure ε

def truncatedMeanJump (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) : ℝ :=
  ∫ v, v * acceptance B F y v ∂truncatedJumpMeasure ε

def truncatedDrift (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) : ℝ :=
  drift B F y - truncatedMeanJump ε B F y

@[fun_prop] theorem measurable_truncatedIntensity (ε : PosReal) :
    Measurable (fun p : EulerState => truncatedIntensity ε p.1 p.2.1 p.2.2) :=
  measurable_acceptance_uncurry.stronglyMeasurable.integral_prod_right'.measurable

@[fun_prop] theorem measurable_truncatedMeanJump (ε : PosReal) :
    Measurable (fun p : EulerState => truncatedMeanJump ε p.1 p.2.1 p.2.2) :=
  (measurable_snd.mul measurable_acceptance_uncurry).stronglyMeasurable.integral_prod_right'.measurable

@[fun_prop] theorem measurable_truncatedDrift (ε : PosReal) :
    Measurable (fun p : EulerState => truncatedDrift ε p.1 p.2.1 p.2.2) :=
  drift_jointlyMeasurable.sub (measurable_truncatedMeanJump ε)

theorem truncatedIntensity_nonneg (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    0 ≤ truncatedIntensity ε B F y := integral_nonneg fun v => (acceptance_bounds B F y v).1

theorem truncatedIntensity_le_mass (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    truncatedIntensity ε B F y ≤ 2 / (Real.exp ε.val - 1) := by
  calc
    _ ≤ ∫ _, (1 : ℝ) ∂truncatedJumpMeasure ε :=
      integral_mono (integrable_acceptance_truncated ε B F y) (integrable_const 1)
        (fun v => (acceptance_bounds B F y v).2)
    _ = _ := by simp [truncatedJumpMeasure_mass_real]

theorem truncatedIntensity_le (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    truncatedIntensity ε B F y ≤ 2 / ε.val :=
  (truncatedIntensity_le_mass ε B F y).trans (by
    simpa only [truncatedJumpMeasure_mass_real] using truncatedJumpMeasure_mass_le ε)

/-- Jointly measurable retained jumps before translation by the current state. -/
def retainedJumpKernel (ε : PosReal) : Kernel EulerState ℝ :=
  (Kernel.const EulerState (truncatedJumpMeasure ε)).withDensity
    (fun p v => ENNReal.ofReal (acceptance p.1 p.2.1 p.2.2 v))

theorem retainedJumpKernel_apply (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    retainedJumpKernel ε (B,F,y) = (truncatedJumpMeasure ε).withDensity
      (fun v => ENNReal.ofReal (acceptance B F y v)) :=
  Kernel.withDensity_apply _ measurable_acceptance_uncurry.ennreal_ofReal _

instance retainedJumpKernel_isFinite (ε : PosReal) : IsFiniteKernel (retainedJumpKernel ε) :=
  Kernel.isFiniteKernel_withDensity_of_bounded _ (B := 1) (by simp) (fun p v => by
    exact (ENNReal.ofReal_le_ofReal (acceptance_bounds p.1 p.2.1 p.2.2 v).2).trans_eq (by simp))

theorem retainedJumpKernel_mass (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    retainedJumpKernel ε (B,F,y) univ = ENNReal.ofReal (truncatedIntensity ε B F y) := by
  rw [retainedJumpKernel_apply, withDensity_apply _ MeasurableSet.univ, Measure.restrict_univ]
  exact (ofReal_integral_eq_lintegral_ofReal (integrable_acceptance_truncated ε B F y)
    (Eventually.of_forall fun v => (acceptance_bounds B F y v).1)).symm

theorem integral_retainedJumpKernel (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) (f : ℝ → ℝ) :
    (∫ v, f v ∂retainedJumpKernel ε (B,F,y)) =
      ∫ v, f v * acceptance B F y v ∂truncatedJumpMeasure ε := by
  rw [retainedJumpKernel_apply,
    integral_withDensity_eq_integral_toReal_smul (measurable_acceptance B F y).ennreal_ofReal
      (Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)]
  simp only [ENNReal.toReal_ofReal (acceptance_bounds B F y _).1, smul_eq_mul, mul_comm]

theorem integrable_retainedJumpKernel {ε B : PosReal} {F : ProbabilityMeasure ℝ} {y : ℝ}
    {f : ℝ → ℝ} (hf : Integrable f (truncatedJumpMeasure ε)) :
    Integrable f (retainedJumpKernel ε (B,F,y)) := by
  rw [retainedJumpKernel_apply,
    integrable_withDensity_iff_integrable_smul' (measurable_acceptance B F y).ennreal_ofReal
      (Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)]
  simpa only [ENNReal.toReal_ofReal (acceptance_bounds B F y _).1, smul_eq_mul, mul_comm] using
    integrable_mul_acceptance hf B F y

theorem integral_id_retainedJumpKernel (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    (∫ v, v ∂retainedJumpKernel ε (B,F,y)) = truncatedMeanJump ε B F y :=
  integral_retainedJumpKernel ε B F y _

theorem integral_sq_retainedJumpKernel_le (ε B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    (∫ v, v^2 ∂retainedJumpKernel ε (B,F,y)) ≤ jumpSecondMoment := by
  rw [integral_retainedJumpKernel]
  refine le_trans (integral_mono_of_nonneg
    (Eventually.of_forall fun v => mul_nonneg (sq_nonneg v) (acceptance_bounds B F y v).1)
    integrable_sq_jumpMeasure.restrict ?_) (integral_sq_truncatedJumpMeasure_le ε)
  exact Eventually.of_forall fun v => mul_le_of_le_one_right (sq_nonneg v) (acceptance_bounds B F y v).2

end GGC.LogRate
