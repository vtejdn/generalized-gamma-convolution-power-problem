import GGC.LogRate.EulerMoments
import Mathlib.Probability.Kernel.Composition.IntegralCompProd
import Mathlib.Probability.Kernel.Composition.MeasureComp

/-! # Actual probability-law iteration and preservation of second moments -/

noncomputable section
open MeasureTheory Set Filter ProbabilityTheory
namespace GGC.LogRate

def eulerUpdate (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) : ProbabilityMeasure ℝ :=
  ⟨eulerKernel h B F ∘ₘ (F : Measure ℝ), inferInstance⟩

theorem eulerUpdate_toMeasure (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) :
    (eulerUpdate h B F : Measure ℝ) = eulerKernel h B F ∘ₘ (F : Measure ℝ) := rfl

theorem integral_eulerUpdate (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ)
    {f : ℝ → ℝ} (hf : Integrable f (eulerUpdate h B F : Measure ℝ)) :
    (∫ z, f z ∂(eulerUpdate h B F : Measure ℝ)) =
      ∫ y, ∫ z, f z ∂eulerMeasure h B F y ∂(F : Measure ℝ) := by
  rw [eulerUpdate_toMeasure, Measure.comp_eq_comp_const_apply] at hf ⊢
  exact Kernel.integral_comp hf

theorem integrable_sq_eulerUpdate (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) :
    Integrable (fun z : ℝ => z^2) (eulerUpdate h B F : Measure ℝ) := by
  rw [eulerUpdate_toMeasure, Measure.integrable_comp_iff (by fun_prop)]
  refine ⟨Eventually.of_forall (fun y => integrable_euler_sq h B F y), ?_⟩
  have hmeas : Measurable (fun y => ∫ z : ℝ, ‖z^2‖ ∂eulerKernel h B F y) :=
    (show StronglyMeasurable (fun z : ℝ => ‖z^2‖) from by fun_prop).integral_kernel.measurable
  apply ((hF.const_mul (1+4*h.val)).add
    (integrable_const (h.val*(2*(driftBound B.val)^2+3*jumpSecondMoment)))).mono' hmeas.aestronglyMeasurable
  exact Eventually.of_forall fun y => by
    simp only [Real.norm_eq_abs, abs_sq, eulerKernel_apply, Pi.add_apply]
    rw [abs_of_nonneg (show 0 ≤ ∫ z : ℝ, z^2 ∂eulerMeasure h B F y from
      integral_nonneg (fun z : ℝ => sq_nonneg z))]
    exact integral_euler_sq_le h B F y

theorem integral_sq_eulerUpdate_le (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) :
    (∫ z : ℝ, z^2 ∂(eulerUpdate h B F : Measure ℝ)) ≤
      (1+4*h.val) * (∫ y : ℝ, y^2 ∂(F : Measure ℝ)) +
      h.val*(2*(driftBound B.val)^2+3*jumpSecondMoment) := by
  rw [integral_eulerUpdate h B F (integrable_sq_eulerUpdate h B F hF)]
  calc
    _ ≤ ∫ y, ((1+4*h.val)*y^2 + h.val*(2*(driftBound B.val)^2+3*jumpSecondMoment))
        ∂(F : Measure ℝ) := by
      apply integral_mono_of_nonneg
        (Eventually.of_forall fun y => integral_nonneg (fun z : ℝ => sq_nonneg z))
        ((hF.const_mul _).add (integrable_const _))
      exact Eventually.of_forall (integral_euler_sq_le h B F)
    _ = _ := by
      rw [integral_add (hF.const_mul _) (integrable_const _), integral_const_mul]
      simp

/-- The nonlinear recursion freezes the current law in its own transition kernel. -/
def eulerIterate (h : EulerStep) (B : ℕ → PosReal) (F₀ : ProbabilityMeasure ℝ) : ℕ → ProbabilityMeasure ℝ
  | 0 => F₀
  | n+1 => eulerUpdate h (B n) (eulerIterate h B F₀ n)

@[simp] theorem eulerIterate_zero (h : EulerStep) (B : ℕ → PosReal) (F₀ : ProbabilityMeasure ℝ) :
    eulerIterate h B F₀ 0 = F₀ := rfl

@[simp] theorem eulerIterate_succ (h : EulerStep) (B : ℕ → PosReal) (F₀ : ProbabilityMeasure ℝ) (n : ℕ) :
    eulerIterate h B F₀ (n+1) = eulerUpdate h (B n) (eulerIterate h B F₀ n) := rfl

theorem integrable_sq_eulerIterate (h : EulerStep) (B : ℕ → PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (n : ℕ) :
    Integrable (fun y : ℝ => y^2) (eulerIterate h B F₀ n : Measure ℝ) := by
  induction n with
  | zero => exact hF
  | succ n ih => exact integrable_sq_eulerUpdate h (B n) _ ih

theorem integral_sq_eulerIterate_succ_le (h : EulerStep) (B : ℕ → PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (n : ℕ) :
    (∫ y : ℝ, y^2 ∂(eulerIterate h B F₀ (n+1) : Measure ℝ)) ≤
      (1+4*h.val) * (∫ y : ℝ, y^2 ∂(eulerIterate h B F₀ n : Measure ℝ)) +
      h.val*(2*(driftBound (B n).val)^2+3*jumpSecondMoment) :=
  integral_sq_eulerUpdate_le h (B n) _ (integrable_sq_eulerIterate h B F₀ hF n)

/-- The mass schedule required by the limiting evolution. -/
def eulerMass (h : EulerStep) (B₀ : PosReal) (n : ℕ) : PosReal :=
  ⟨B₀.val * Real.exp (-(n : ℝ)*h.val), mul_pos B₀.property (Real.exp_pos _)⟩

@[simp] theorem eulerMass_zero (h : EulerStep) (B₀ : PosReal) : eulerMass h B₀ 0 = B₀ := by
  apply Subtype.ext
  simp [eulerMass]

theorem eulerMass_mem_Icc (h : EulerStep) (B₀ : PosReal) {T : ℝ} {n : ℕ}
    (hn : (n : ℝ) * h.val ≤ T) :
    (eulerMass h B₀ n).val ∈ Icc (B₀.val * Real.exp (-T)) B₀.val := by
  constructor
  · exact mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr (by linarith)) B₀.property.le
  · have hp : 0 ≤ (n : ℝ) * h.val := mul_nonneg (Nat.cast_nonneg n) h.property.1.le
    have he : Real.exp (-(n : ℝ)*h.val) ≤ 1 := by
      rw [Real.exp_le_one_iff]
      linarith
    exact (mul_le_mul_of_nonneg_left he B₀.property.le).trans_eq (mul_one _)

theorem eulerIterate_moment_growth_le (h : EulerStep) (B : ℕ → PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) {K : ℝ} (hK : 0 ≤ K) (n : ℕ)
    (hb : ∀ j < n, 2*(driftBound (B j).val)^2+3*jumpSecondMoment ≤ K) :
    (∫ y : ℝ, y^2 ∂(eulerIterate h B F₀ n : Measure ℝ)) + K ≤
      ((∫ y : ℝ, y^2 ∂(F₀ : Measure ℝ)) + K) * (1+4*h.val)^n := by
  revert hb
  induction n with
  | zero => intro _; simp
  | succ n ih =>
    intro hb
    have hi := ih (fun j hj => hb j (Nat.lt_succ_of_lt hj))
    have hs := integral_sq_eulerIterate_succ_le h B F₀ hF n
    have hc := mul_le_mul_of_nonneg_left (hb n (Nat.lt_succ_self n)) h.property.1.le
    calc
      _ ≤ (1+4*h.val) * ((∫ y : ℝ, y^2 ∂(eulerIterate h B F₀ n : Measure ℝ))+K) := by
        nlinarith [mul_nonneg h.property.1.le hK]
      _ ≤ (1+4*h.val) * (((∫ y : ℝ, y^2 ∂(F₀ : Measure ℝ))+K)*(1+4*h.val)^n) :=
        mul_le_mul_of_nonneg_left hi (by linarith [h.property.1])
      _ = _ := by rw [pow_succ]; ring

theorem eulerIterate_moment_le_exp (h : EulerStep) (B : ℕ → PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) {K T : ℝ} (hK : 0 ≤ K) (n : ℕ)
    (hb : ∀ j < n, 2*(driftBound (B j).val)^2+3*jumpSecondMoment ≤ K)
    (hn : (n : ℝ)*h.val ≤ T) :
    (∫ y : ℝ, y^2 ∂(eulerIterate h B F₀ n : Measure ℝ)) ≤
      ((∫ y : ℝ, y^2 ∂(F₀ : Measure ℝ)) + K) * Real.exp (4*T) := by
  have hp : (1+4*h.val)^n ≤ Real.exp (4*T) := by
    calc
      _ ≤ (Real.exp (4*h.val))^n := pow_le_pow_left₀ (by linarith [h.property.1])
        (by linarith [Real.add_one_le_exp (4*h.val)]) n
      _ = Real.exp ((n : ℝ)*(4*h.val)) := (Real.exp_nat_mul _ _).symm
      _ ≤ _ := Real.exp_le_exp.mpr (by nlinarith)
  have hM : 0 ≤ (∫ y : ℝ, y^2 ∂(F₀ : Measure ℝ)) + K :=
    add_nonneg (integral_nonneg (fun y : ℝ => sq_nonneg y)) hK
  exact (le_add_of_nonneg_right hK).trans ((eulerIterate_moment_growth_le h B F₀ hF hK n hb).trans
    (mul_le_mul_of_nonneg_left hp hM))

/-- A finite-horizon bound uniform over every admissible step and every mesh time. -/
theorem eulerIterate_uniform_secondMoment (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (h : EulerStep) (n : ℕ), (n : ℝ)*h.val ≤ T →
      (∫ y : ℝ, y^2 ∂(eulerIterate h (eulerMass h B₀) F₀ n : Measure ℝ)) ≤ C := by
  obtain ⟨D, hD⟩ := driftBound_boundedOn_Icc (a := B₀.val * Real.exp (-T)) (b := B₀.val)
    (mul_pos B₀.property (Real.exp_pos _))
  let K := 2 * (max D 0)^2 + 3 * jumpSecondMoment
  have hK : 0 ≤ K := by dsimp [K]; positivity [jumpSecondMoment_nonneg]
  refine ⟨((∫ y : ℝ, y^2 ∂(F₀ : Measure ℝ)) + K) * Real.exp (4*T),
    mul_nonneg (add_nonneg (integral_nonneg (fun y : ℝ => sq_nonneg y)) hK) (Real.exp_pos _).le, ?_⟩
  intro h n hn
  apply eulerIterate_moment_le_exp h (eulerMass h B₀) F₀ hF hK n _ hn
  intro j hj
  have hjT : (j : ℝ)*h.val ≤ T :=
    (mul_le_mul_of_nonneg_right (by exact_mod_cast hj.le) h.property.1.le).trans hn
  have hd : driftBound (eulerMass h B₀ j).val ≤ max D 0 :=
    (hD _ (eulerMass_mem_Icc h B₀ hjT)).trans (le_max_left _ _)
  have hd2 := (sq_le_sq₀ (driftBound_nonneg _) (le_max_right D 0)).mpr hd
  dsimp [K]
  linarith

end GGC.LogRate
