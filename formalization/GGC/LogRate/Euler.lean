import GGC.LogRate.RetainedJumps

/-! # The positive Euler kernel from Blueprint C

The step is restricted to `(0, 1/16]`. Its cutoff is `sqrt h`, the retained
jumps use the actual acceptance, and the atom carries the compensated drift.
-/

noncomputable section
open MeasureTheory Set Filter ProbabilityTheory
namespace GGC.LogRate

abbrev EulerStep := {h : ℝ // 0 < h ∧ h ≤ 1 / 16}

def eulerCutoff (h : EulerStep) : PosReal := ⟨Real.sqrt h.val, Real.sqrt_pos.mpr h.property.1⟩

def eulerStay (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) : ℝ :=
  1 - h.val * truncatedIntensity (eulerCutoff h) B F y

theorem eulerStay_lower_bound (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    1 - 2 * Real.sqrt h.val ≤ eulerStay h B F y := by
  have hs : 0 < Real.sqrt h.val := Real.sqrt_pos.mpr h.property.1
  have hsq := Real.sq_sqrt h.property.1.le
  have hi := mul_le_mul_of_nonneg_left (truncatedIntensity_le (eulerCutoff h) B F y) h.property.1.le
  change h.val * truncatedIntensity (eulerCutoff h) B F y ≤ h.val * (2 / Real.sqrt h.val) at hi
  have he : h.val * (2 / Real.sqrt h.val) = 2 * Real.sqrt h.val := by
    rw [← mul_div_assoc]
    apply (div_eq_iff (ne_of_gt hs)).mpr
    nlinarith
  rw [he] at hi
  exact sub_le_sub_left hi 1

theorem eulerStay_ge_half (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    1 / 2 ≤ eulerStay h B F y := by
  have hs := Real.sq_sqrt h.property.1.le
  have hn := Real.sqrt_nonneg h.val
  have hh := h.property.2
  have hb := eulerStay_lower_bound h B F y
  nlinarith

theorem eulerStay_pos (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    0 < eulerStay h B F y := lt_of_lt_of_le (by norm_num) (eulerStay_ge_half h B F y)

theorem eulerStay_le_one (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    eulerStay h B F y ≤ 1 := by
  exact sub_le_self _ (mul_nonneg h.property.1.le (truncatedIntensity_nonneg _ B F y))

def eulerDestination (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) : ℝ :=
  y + h.val * truncatedDrift (eulerCutoff h) B F y / eulerStay h B F y

@[fun_prop] theorem measurable_eulerStay (h : EulerStep) :
    Measurable (fun p : EulerState => eulerStay h p.1 p.2.1 p.2.2) :=
  measurable_const.sub (measurable_const.mul (measurable_truncatedIntensity _))

@[fun_prop] theorem measurable_eulerDestination (h : EulerStep) :
    Measurable (fun p : EulerState => eulerDestination h p.1 p.2.1 p.2.2) :=
  (measurable_snd.comp measurable_snd).add
    ((measurable_const.mul (measurable_truncatedDrift _)).div (measurable_eulerStay h))

theorem measurable_translatedRetainedJumps (ε : PosReal) :
    Measurable (fun p : EulerState => (retainedJumpKernel ε p).map (fun v => p.2.2 + v)) := by
  apply Measure.measurable_of_measurable_coe
  intro s hs
  have hm : Measurable (fun p : EulerState × ℝ => p.1.2.2 + p.2) := by fun_prop
  have ht := Kernel.measurable_kernel_prodMk_left (κ := retainedJumpKernel ε) (hm hs)
  have he : (fun p : EulerState => ((retainedJumpKernel ε p).map (fun v => p.2.2 + v)) s) =
      (fun p => retainedJumpKernel ε p ((fun v => p.2.2 + v) ⁻¹' s)) := by
    funext p
    exact Measure.map_apply (by fun_prop) hs
  rw [he]
  exact ht

def eulerMeasure (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) : Measure ℝ :=
  ENNReal.ofReal (eulerStay h B F y) • Measure.dirac (eulerDestination h B F y) +
    ENNReal.ofReal h.val • (retainedJumpKernel (eulerCutoff h) (B,F,y)).map (fun v => y + v)

@[fun_prop] theorem measurable_eulerMeasure (h : EulerStep) :
    Measurable (fun p : EulerState => eulerMeasure h p.1 p.2.1 p.2.2) := by
  apply Measure.measurable_of_measurable_coe
  intro s hs
  simp only [eulerMeasure, Measure.add_apply, Measure.smul_apply, smul_eq_mul]
  exact ((measurable_eulerStay h).ennreal_ofReal.mul
    ((Measure.measurable_coe hs).comp (Measure.measurable_dirac.comp (measurable_eulerDestination h)))).add
    (measurable_const.mul ((Measure.measurable_coe hs).comp (measurable_translatedRetainedJumps _)))

theorem eulerMeasure_mass (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    eulerMeasure h B F y univ = 1 := by
  simp only [eulerMeasure, Measure.add_apply, Measure.smul_apply, smul_eq_mul,
    Measure.dirac_apply_of_mem (mem_univ _), mul_one]
  rw [Measure.map_apply (by fun_prop) MeasurableSet.univ, preimage_univ, retainedJumpKernel_mass]
  rw [← ENNReal.ofReal_mul h.property.1.le,
    ← ENNReal.ofReal_add (eulerStay_pos h B F y).le
      (mul_nonneg h.property.1.le (truncatedIntensity_nonneg _ B F y))]
  simp [eulerStay]

instance eulerMeasure_isProbability (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    IsProbabilityMeasure (eulerMeasure h B F y) := ⟨eulerMeasure_mass h B F y⟩

/-- The actual state transition, with mass and base law frozen for the step. -/
def eulerKernel (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) : Kernel ℝ ℝ :=
  ⟨eulerMeasure h B F, by
    have hp : Measurable (fun y : ℝ => (B,F,y)) := by fun_prop
    have hm := (measurable_eulerMeasure h).comp hp
    exact hm⟩

@[simp] theorem eulerKernel_apply (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    eulerKernel h B F y = eulerMeasure h B F y := rfl

instance eulerKernel_isMarkov (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) :
    IsMarkovKernel (eulerKernel h B F) := ⟨fun y => eulerMeasure_isProbability h B F y⟩

theorem integrable_eulerMeasure (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ)
    {f : ℝ → ℝ} (hf : Measurable f)
    (hi : Integrable (fun v => f (y+v)) (retainedJumpKernel (eulerCutoff h) (B,F,y))) :
    Integrable f (eulerMeasure h B F y) := by
  apply Integrable.add_measure
  · exact (integrable_dirac' hf.stronglyMeasurable (by simp)).smul_measure ENNReal.ofReal_ne_top
  · exact ((integrable_map_measure hf.aestronglyMeasurable (by fun_prop)).mpr hi).smul_measure
      ENNReal.ofReal_ne_top

theorem integral_eulerMeasure (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ)
    {f : ℝ → ℝ} (hf : Measurable f)
    (hi : Integrable (fun v => f (y+v)) (retainedJumpKernel (eulerCutoff h) (B,F,y))) :
    (∫ z, f z ∂eulerMeasure h B F y) = eulerStay h B F y * f (eulerDestination h B F y) +
      h.val * ∫ v, f (y+v) ∂retainedJumpKernel (eulerCutoff h) (B,F,y) := by
  rw [eulerMeasure, integral_add_measure
    ((integrable_dirac' hf.stronglyMeasurable (by simp)).smul_measure ENNReal.ofReal_ne_top)
    (((integrable_map_measure hf.aestronglyMeasurable (by fun_prop)).mpr hi).smul_measure
      ENNReal.ofReal_ne_top)]
  simp only [integral_smul_measure, ENNReal.toReal_ofReal (eulerStay_pos h B F y).le,
    ENNReal.toReal_ofReal h.property.1.le, smul_eq_mul,
    integral_dirac' _ _ hf.stronglyMeasurable]
  rw [integral_map_of_stronglyMeasurable (by fun_prop) hf.stronglyMeasurable]

theorem integrable_euler_increment (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    Integrable (fun z => z-y) (eulerMeasure h B F y) := by
  apply integrable_eulerMeasure h B F y (by fun_prop)
  simpa only [add_sub_cancel_left] using
    (integrable_retainedJumpKernel (integrable_id_truncatedJumpMeasure (eulerCutoff h)) :
      Integrable (fun v : ℝ => v) (retainedJumpKernel (eulerCutoff h) (B,F,y)))

theorem integral_euler_increment (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    (∫ z, z-y ∂eulerMeasure h B F y) = h.val * drift B F y := by
  have hi : Integrable (fun v : ℝ => (y+v)-y) (retainedJumpKernel (eulerCutoff h) (B,F,y)) := by
    simpa only [add_sub_cancel_left] using
      (integrable_retainedJumpKernel (integrable_id_truncatedJumpMeasure (eulerCutoff h)) :
        Integrable (fun v : ℝ => v) (retainedJumpKernel (eulerCutoff h) (B,F,y)))
  rw [integral_eulerMeasure h B F y (by fun_prop) hi]
  simp only [eulerDestination, add_sub_cancel_left, integral_id_retainedJumpKernel]
  have hp := ne_of_gt (eulerStay_pos h B F y)
  unfold truncatedDrift
  field_simp [hp]
  ring

theorem integrable_euler_increment_sq (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    Integrable (fun z => (z-y)^2) (eulerMeasure h B F y) := by
  apply integrable_eulerMeasure h B F y (by fun_prop)
  simpa only [add_sub_cancel_left] using
    (integrable_retainedJumpKernel integrable_sq_jumpMeasure.restrict :
      Integrable (fun v : ℝ => v^2) (retainedJumpKernel (eulerCutoff h) (B,F,y)))

theorem integral_euler_increment_sq (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    (∫ z, (z-y)^2 ∂eulerMeasure h B F y) =
      h.val * (∫ v, v^2 ∂retainedJumpKernel (eulerCutoff h) (B,F,y)) +
      h.val^2 * (truncatedDrift (eulerCutoff h) B F y)^2 / eulerStay h B F y := by
  have hi : Integrable (fun v : ℝ => ((y+v)-y)^2) (retainedJumpKernel (eulerCutoff h) (B,F,y)) := by
    simpa only [add_sub_cancel_left] using
      (integrable_retainedJumpKernel integrable_sq_jumpMeasure.restrict :
        Integrable (fun v : ℝ => v^2) (retainedJumpKernel (eulerCutoff h) (B,F,y)))
  rw [integral_eulerMeasure h B F y (by fun_prop) hi]
  simp only [eulerDestination, add_sub_cancel_left]
  have hp := ne_of_gt (eulerStay_pos h B F y)
  field_simp [hp]
  ring

end GGC.LogRate
