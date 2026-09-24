import GGC.LogRate.EulerConsistency
import GGC.LogRate.EulerIteration
import GGC.LogRate.Continuity

/-! # Integrated Euler consistency and compact-test time estimates

All estimates concern the actual nonlinear probability-law iteration. The
one-step remainder is integrated before summing over mesh intervals.
-/

noncomputable section
open MeasureTheory Set Filter ProbabilityTheory
open scoped BigOperators Topology
namespace GGC.LogRate

theorem integrable_eulerTestMean (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ)
    {φ : ℝ → ℝ} (hφ : Continuous φ) (hs : HasCompactSupport φ) :
    Integrable (fun y => ∫ z, φ z ∂eulerMeasure h B F y) (F : Measure ℝ) := by
  have hi : Integrable φ (eulerUpdate h B F : Measure ℝ) :=
    hφ.integrable_of_hasCompactSupport hs
  rw [eulerUpdate_toMeasure, Measure.comp_eq_comp_const_apply] at hi
  exact hi.integral_comp

/-- The signed local error of the actual law update. -/
def eulerTestError (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ) (φ : ℝ → ℝ) : ℝ :=
  (∫ z, φ z ∂(eulerUpdate h B F : Measure ℝ)) - (∫ y, φ y ∂(F : Measure ℝ)) -
    h.val * averagedGenerator B F φ

theorem eulerTestError_eq_integral (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) :
    eulerTestError h B F φ = ∫ y,
      (∫ z, φ z ∂eulerMeasure h B F y) - φ y - h.val * generator B F φ y
        ∂(F : Measure ℝ) := by
  have hi := integrable_eulerTestMean h B F hφ.continuous hs
  have hj : Integrable φ (F : Measure ℝ) := hφ.continuous.integrable_of_hasCompactSupport hs
  have hg := (integrable_generator_compactTest B F hφ hs).const_mul h.val
  have hd : Integrable (fun y => (∫ z, φ z ∂eulerMeasure h B F y) - φ y) (F : Measure ℝ) :=
    hi.sub hj
  rw [integral_sub hd hg, integral_sub hi hj, integral_const_mul,
    eulerTestError, integral_eulerUpdate h B F (hφ.continuous.integrable_of_hasCompactSupport hs)]
  rfl

theorem abs_eulerTestError_le (h : EulerStep) (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ))
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) :
    |eulerTestError h B F φ| ≤
      4*C*h.val^2*((∫ y : ℝ, y^2 ∂(F : Measure ℝ))+(driftBound B.val)^2) +
      C*h.val*Real.sqrt h.val*(1+4*jumpSecondMoment) := by
  rw [eulerTestError_eq_integral h B F hφ hs]
  calc
    _ ≤ ∫ y, |(∫ z, φ z ∂eulerMeasure h B F y) - φ y - h.val * generator B F φ y|
        ∂(F : Measure ℝ) := abs_integral_le_integral_abs
    _ ≤ ∫ y, 4*C*h.val^2*(y^2+(driftBound B.val)^2) +
        C*h.val*Real.sqrt h.val*(1+4*jumpSecondMoment) ∂(F : Measure ℝ) := by
      apply integral_mono_of_nonneg (Eventually.of_forall fun _ => abs_nonneg _)
        (((hF.add (integrable_const _)).const_mul _).add (integrable_const _))
      exact Eventually.of_forall fun y => abs_euler_error_le_sqrt h B F y hφ hs hC
    _ = _ := by
      have ha : Integrable (fun y : ℝ => y^2+(driftBound B.val)^2) (F : Measure ℝ) :=
        hF.add (integrable_const _)
      rw [integral_add (ha.const_mul _) (integrable_const _),
        integral_const_mul, integral_add hF (integrable_const _)]
      simp

/-- The error divided by the step is uniformly at most a constant times `h + sqrt h`. -/
theorem eulerIterate_uniform_testError (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) :
    ∃ E : ℝ, 0 ≤ E ∧ ∀ (h : EulerStep) (n : ℕ), (n : ℝ)*h.val ≤ T →
      |eulerTestError h (eulerMass h B₀ n) (eulerIterate h (eulerMass h B₀) F₀ n) φ| ≤
        h.val * E * (h.val + Real.sqrt h.val) := by
  obtain ⟨M, hM, hb⟩ := eulerIterate_uniform_secondMoment B₀ F₀ hF T
  obtain ⟨D, hD⟩ := driftBound_boundedOn_Icc (a := B₀.val * Real.exp (-T)) (b := B₀.val)
    (mul_pos B₀.property (Real.exp_pos _))
  have hd₂ : Continuous (deriv (deriv φ)) :=
    (hφ.deriv' : ContDiff ℝ 1 (deriv φ)).continuous_deriv (by norm_num)
  obtain ⟨C, hC⟩ := hs.deriv.deriv.exists_bound_of_continuous hd₂
  have hC0 : 0 ≤ C := (norm_nonneg _).trans (hC 0)
  let A := 4*C*(M+(max D 0)^2)
  let Q := C*(1+4*jumpSecondMoment)
  have hA : 0 ≤ A := by dsimp [A]; positivity
  have hQ : 0 ≤ Q := by dsimp [Q]; positivity [jumpSecondMoment_nonneg]
  refine ⟨A+Q, add_nonneg hA hQ, ?_⟩
  intro h n hn
  have hbound := abs_eulerTestError_le h (eulerMass h B₀ n) _
    (integrable_sq_eulerIterate h (eulerMass h B₀) F₀ hF n) hφ hs hC
  have hd : driftBound (eulerMass h B₀ n).val ≤ max D 0 :=
    (hD _ (eulerMass_mem_Icc h B₀ hn)).trans (le_max_left _ _)
  have hd2 := (sq_le_sq₀ (driftBound_nonneg _) (le_max_right D 0)).mpr hd
  have hterm := mul_le_mul_of_nonneg_left (add_le_add (hb h n hn) hd2)
    (show 0 ≤ 4*C*h.val^2 by positivity)
  calc
    _ ≤ h.val^2*A + h.val*Real.sqrt h.val*Q := by dsimp [A, Q]; nlinarith
    _ ≤ h.val*(A+Q)*(h.val+Real.sqrt h.val) := by
      nlinarith [mul_nonneg (sq_nonneg h.val) hQ,
        mul_nonneg (mul_nonneg h.property.1.le (Real.sqrt_nonneg h.val)) hA]

theorem averagedGenerator_compactTest_bound {φ : ℝ → ℝ}
    (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) {a b : ℝ} (ha : 0 < a) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (B : PosReal) (F : ProbabilityMeasure ℝ), B.val ∈ Icc a b →
      |averagedGenerator B F φ| ≤ C := by
  obtain ⟨C, hC⟩ := generator_compactTest_bound (b := b) hφ hs ha
  refine ⟨max C 0, le_max_right _ _, fun B F hB => ?_⟩
  have hh : ∀ᵐ y ∂(F : Measure ℝ), ‖generator B F φ y‖ ≤ max C 0 :=
    Eventually.of_forall fun y => by
      simpa only [Real.norm_eq_abs] using (hC B F hB y).trans (le_max_left C 0)
  have hi := norm_integral_le_of_norm_le_const hh
  simpa [averagedGenerator, Real.norm_eq_abs] using hi

/-- Each compact C² test has a uniform Lipschitz bound at consecutive mesh times. -/
theorem eulerIterate_uniform_testIncrement (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) :
    ∃ L : ℝ, 0 ≤ L ∧ ∀ (h : EulerStep) (n : ℕ), (n : ℝ)*h.val ≤ T →
      |(∫ y, φ y ∂(eulerIterate h (eulerMass h B₀) F₀ (n+1) : Measure ℝ)) -
        (∫ y, φ y ∂(eulerIterate h (eulerMass h B₀) F₀ n : Measure ℝ))| ≤ h.val*L := by
  obtain ⟨E, hE, he⟩ := eulerIterate_uniform_testError B₀ F₀ hF T hφ hs
  obtain ⟨G, hG, hg⟩ := averagedGenerator_compactTest_bound (b := B₀.val) hφ hs
    (mul_pos B₀.property (Real.exp_pos (-T)))
  refine ⟨G+E, add_nonneg hG hE, ?_⟩
  intro h n hn
  have he' := he h n hn
  have hg' := hg (eulerMass h B₀ n) (eulerIterate h (eulerMass h B₀) F₀ n)
    (eulerMass_mem_Icc h B₀ hn)
  have hh : h.val + Real.sqrt h.val ≤ 1 := by
    linarith [h.property.2, euler_sqrt_le_quarter h]
  have he'' := he'.trans (mul_le_of_le_one_right (mul_nonneg h.property.1.le hE) hh)
  rw [eulerTestError] at he''
  have htri := abs_add_le
    ((∫ y, φ y ∂(eulerUpdate h (eulerMass h B₀ n) (eulerIterate h (eulerMass h B₀) F₀ n) : Measure ℝ)) -
      (∫ y, φ y ∂(eulerIterate h (eulerMass h B₀) F₀ n : Measure ℝ)) -
      h.val*averagedGenerator (eulerMass h B₀ n) (eulerIterate h (eulerMass h B₀) F₀ n) φ)
    (h.val*averagedGenerator (eulerMass h B₀ n) (eulerIterate h (eulerMass h B₀) F₀ n) φ)
  simp only [sub_add_cancel, abs_mul, abs_of_pos h.property.1] at htri
  change |(∫ y, φ y ∂(eulerUpdate h (eulerMass h B₀ n) (eulerIterate h (eulerMass h B₀) F₀ n) : Measure ℝ)) -
    (∫ y, φ y ∂(eulerIterate h (eulerMass h B₀) F₀ n : Measure ℝ))| ≤ _
  nlinarith [mul_le_mul_of_nonneg_left hg' h.property.1.le]

/-- Telescoping the actual Euler law increments gives the mesh weak equation with its error. -/
theorem eulerIterate_test_telescope (h : EulerStep) (B : ℕ → PosReal)
    (F₀ : ProbabilityMeasure ℝ) (φ : ℝ → ℝ) (n : ℕ) :
    (∫ y, φ y ∂(eulerIterate h B F₀ n : Measure ℝ)) - (∫ y, φ y ∂(F₀ : Measure ℝ)) -
      h.val * ∑ j ∈ Finset.range n, averagedGenerator (B j) (eulerIterate h B F₀ j) φ =
        ∑ j ∈ Finset.range n, eulerTestError h (B j) (eulerIterate h B F₀ j) φ := by
  simp only [eulerTestError, ← eulerIterate_succ, Finset.sum_sub_distrib, ← Finset.mul_sum]
  rw [← Finset.sum_sub_distrib,
    Finset.sum_range_sub (fun j => ∫ y, φ y ∂(eulerIterate h B F₀ j : Measure ℝ)), eulerIterate_zero]

/-- The accumulated weak-equation error is uniform in the terminal mesh time. -/
theorem eulerIterate_uniform_cumulativeError (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) :
    ∃ E : ℝ, 0 ≤ E ∧ ∀ (h : EulerStep) (n : ℕ), (n : ℝ)*h.val ≤ T →
      |(∫ y, φ y ∂(eulerIterate h (eulerMass h B₀) F₀ n : Measure ℝ)) -
          (∫ y, φ y ∂(F₀ : Measure ℝ)) -
        h.val * ∑ j ∈ Finset.range n,
          averagedGenerator (eulerMass h B₀ j) (eulerIterate h (eulerMass h B₀) F₀ j) φ| ≤
        T*E*(h.val + Real.sqrt h.val) := by
  obtain ⟨E, hE, he⟩ := eulerIterate_uniform_testError B₀ F₀ hF T hφ hs
  refine ⟨E, hE, ?_⟩
  intro h n hn
  rw [eulerIterate_test_telescope]
  calc
    _ ≤ ∑ j ∈ Finset.range n,
        |eulerTestError h (eulerMass h B₀ j) (eulerIterate h (eulerMass h B₀) F₀ j) φ| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _j ∈ Finset.range n, h.val*E*(h.val+Real.sqrt h.val) := by
      apply Finset.sum_le_sum
      intro j hj
      exact he h j ((mul_le_mul_of_nonneg_right
        (by exact_mod_cast (Finset.mem_range.mp hj).le) h.property.1.le).trans hn)
    _ = ((n : ℝ)*h.val)*E*(h.val+Real.sqrt h.val) := by simp; ring
    _ ≤ _ := mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right hn hE)
      (add_nonneg h.property.1.le (Real.sqrt_nonneg _))

/-- Compact-test control between any two mesh times, uniform over the step size. -/
theorem eulerIterate_uniform_testTime (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) :
    ∃ L : ℝ, 0 ≤ L ∧ ∀ (h : EulerStep) (i j : ℕ), i ≤ j → (j : ℝ)*h.val ≤ T →
      |(∫ y, φ y ∂(eulerIterate h (eulerMass h B₀) F₀ j : Measure ℝ)) -
        (∫ y, φ y ∂(eulerIterate h (eulerMass h B₀) F₀ i : Measure ℝ))| ≤
        ((j : ℝ)*h.val-(i : ℝ)*h.val)*L := by
  obtain ⟨L, hL, hstep⟩ := eulerIterate_uniform_testIncrement B₀ F₀ hF T hφ hs
  refine ⟨L, hL, ?_⟩
  intro h i j hij hj
  let J := fun n => ∫ y, φ y ∂(eulerIterate h (eulerMass h B₀) F₀ n : Measure ℝ)
  have ht : ∑ k ∈ Finset.Ico i j, (J (k+1)-J k) = J j-J i := by
    rw [Finset.sum_Ico_eq_sub _ hij, Finset.sum_range_sub J, Finset.sum_range_sub J]
    ring
  change |J j-J i| ≤ _
  rw [← ht]
  calc
    _ ≤ ∑ k ∈ Finset.Ico i j, |J (k+1)-J k| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _k ∈ Finset.Ico i j, h.val*L := by
      apply Finset.sum_le_sum
      intro k hk
      exact hstep h k ((mul_le_mul_of_nonneg_right
        (by exact_mod_cast (Finset.mem_Ico.mp hk).2.le) h.property.1.le).trans hj)
    _ = _ := by simp [Nat.cast_sub hij]; ring

/-- Any vanishing sequence of admissible steps has vanishing cumulative error,
even when its terminal mesh index varies. -/
theorem eulerIterate_cumulativeError_tendsto (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ)
    {ι : Type*} {l : Filter ι} {h : ι → EulerStep} {n : ι → ℕ}
    (hh : Tendsto (fun i => (h i).val) l (𝓝 0))
    (hn : ∀ᶠ i in l, (n i : ℝ)*(h i).val ≤ T) :
    Tendsto (fun i =>
      (∫ y, φ y ∂(eulerIterate (h i) (eulerMass (h i) B₀) F₀ (n i) : Measure ℝ)) -
        (∫ y, φ y ∂(F₀ : Measure ℝ)) -
      (h i).val * ∑ j ∈ Finset.range (n i),
        averagedGenerator (eulerMass (h i) B₀ j)
          (eulerIterate (h i) (eulerMass (h i) B₀) F₀ j) φ) l (𝓝 0) := by
  obtain ⟨E, _, he⟩ := eulerIterate_uniform_cumulativeError B₀ F₀ hF T hφ hs
  apply (tendsto_zero_iff_abs_tendsto_zero _).mpr
  apply squeeze_zero' (Eventually.of_forall fun _ => abs_nonneg _) (hn.mono fun i hi => he (h i) (n i) hi)
  simpa using (hh.add (Real.continuous_sqrt.continuousAt.tendsto.comp hh)).const_mul (T*E)

end GGC.LogRate
