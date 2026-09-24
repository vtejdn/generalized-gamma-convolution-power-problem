import GGC.LogRate.EulerLimitGenerator

/-! # The limiting weak equation of the actual Euler curves

The estimate includes all three errors: interpolation at the terminal time,
the accumulated one-step remainders, and the final incomplete time cell.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology NNReal BigOperators
namespace GGC.LogRate
open GGC.Analysis

def eulerWeakError (h : EulerStep) (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (φ : ℝ → ℝ) (t : ℝ≥0) : ℝ :=
  (∫ y, φ y ∂(eulerInterpolation h B₀ F₀ t : Measure ℝ)) -
    (∫ y, φ y ∂(F₀ : Measure ℝ)) - ∫ r in 0..t.val, meshGenerator h B₀ F₀ φ r

theorem eulerInterpolation_uniform_weakError (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) {T : ℝ} (hT : 0 ≤ T)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) :
    ∃ K : ℝ, 0 ≤ K ∧ ∀ (h : EulerStep) (t : ℝ≥0), t.val ≤ T →
      |eulerWeakError h B₀ F₀ φ t| ≤ K*(h.val+Real.sqrt h.val) := by
  obtain ⟨E, hE, he⟩ := eulerIterate_uniform_cumulativeError B₀ F₀ hF T hφ hs
  obtain ⟨L, hL, hl⟩ := eulerIterate_uniform_testIncrement B₀ F₀ hF T hφ hs
  obtain ⟨G, hG, hg⟩ := meshGenerator_uniform_bound B₀ F₀ T hφ hs
  refine ⟨T*E+L+G, by positivity, ?_⟩
  intro h t ht
  let n := meshIndex h.val t.val
  let J := fun j => ∫ y, φ y ∂(eulerIterate h (eulerMass h B₀) F₀ j : Measure ℝ)
  let a := fun j => averagedGenerator (eulerMass h B₀ j) (eulerIterate h (eulerMass h B₀) F₀ j) φ
  let S := h.val * ∑ j ∈ Finset.range n, a j
  let I := ∫ r in 0..t.val, meshGenerator h B₀ F₀ φ r
  let V := ∫ y, φ y ∂(eulerInterpolation h B₀ F₀ t : Measure ℝ)
  let V₀ := ∫ y, φ y ∂(F₀ : Measure ℝ)
  have hn : (n : ℝ)*h.val ≤ T := (meshIndex_time_le h.property.1 t.property).trans ht
  have hi : |V-J n| ≤ h.val*L := by
    have hj j : Integrable φ (eulerIterate h (eulerMass h B₀) F₀ j : Measure ℝ) :=
      hφ.continuous.integrable_of_hasCompactSupport hs
    have hb := abs_linearInterpolate_sub_left h.property.1 t.property J (hl h n hn)
    have hr : t.val-(n : ℝ)*h.val ≤ h.val := by
      linarith [time_lt_meshIndex_succ (t := t.val) h.property.1]
    calc
      |V-J n| = |linearInterpolate h.val J t.val-J n| := by
        rw [show V = linearInterpolate h.val J t.val from integral_eulerInterpolation h B₀ F₀ t hj]
      _ ≤ (t.val-(n : ℝ)*h.val)*L := hb
      _ ≤ h.val*L := mul_le_mul_of_nonneg_right hr hL
  have hc : |J n-V₀-S| ≤ T*E*(h.val+Real.sqrt h.val) := he h n hn
  have htcell : |I-S| ≤ h.val*G :=
    abs_integral_meshStep_sub_sum_le h.property.1 t.property hG a
      (fun r hr => hg h r ⟨hr.1, hr.2.trans ht⟩)
  have hsplit : eulerWeakError h B₀ F₀ φ t = (V-J n)+(J n-V₀-S)-(I-S) := by
    change V-V₀-I = _
    ring
  rw [hsplit]
  calc
    _ ≤ |V-J n|+|J n-V₀-S|+|I-S| :=
      (abs_sub _ _).trans (add_le_add (abs_add_le _ _) le_rfl)
    _ ≤ h.val*L+T*E*(h.val+Real.sqrt h.val)+h.val*G := by gcongr
    _ ≤ (T*E+L+G)*(h.val+Real.sqrt h.val) := by
      nlinarith [mul_nonneg hL (Real.sqrt_nonneg h.val),
        mul_nonneg hG (Real.sqrt_nonneg h.val)]

theorem eulerWeakError_tendsto (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) {T : ℝ} (hT : 0 ≤ T)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ)
    {ι : Type*} {l : Filter ι} {h : ι → EulerStep}
    (hh : Tendsto (fun i => (h i).val) l (𝓝 0)) (t : ℝ≥0) (ht : t.val ≤ T) :
    Tendsto (fun i => eulerWeakError (h i) B₀ F₀ φ t) l (𝓝 0) := by
  obtain ⟨K, _, hk⟩ := eulerInterpolation_uniform_weakError B₀ F₀ hF hT hφ hs
  apply (tendsto_zero_iff_abs_tendsto_zero _).mpr
  apply squeeze_zero (fun _ => abs_nonneg _) (fun i => hk (h i) t ht)
  simpa using (hh.add (Real.continuous_sqrt.continuousAt.tendsto.comp hh)).const_mul K

/-- The common subsequence satisfies the weak equation for every compact C² test
and every time, without selecting a new subsequence for either variable. -/
theorem eulerCurve_limit_weakEquation (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) {T : ℝ} (hT : 0 ≤ T)
    {h : ℕ → EulerStep} (hh : Tendsto (fun n => (h n).val) atTop (𝓝 0))
    {g : C(Icc (0 : ℝ) T, ProbabilityMeasure ℝ)}
    (hg : Tendsto (fun n => eulerCurveMap (h n) B₀ F₀ hF T) atTop (𝓝 g))
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) {t : ℝ} (ht : t ∈ Icc 0 T) :
    (∫ y, φ y ∂(extendEulerCurve hT g t : Measure ℝ)) - (∫ y, φ y ∂(F₀ : Measure ℝ)) =
      ∫ r in 0..t, averagedGenerator (massAt B₀ r) (extendEulerCurve hT g r) φ := by
  have he := (continuous_eval_const (⟨t,ht⟩ : Icc (0 : ℝ) T)).tendsto g |>.comp hg
  have hj : Tendsto
      (fun n => ∫ y, φ y ∂(eulerInterpolation (h n) B₀ F₀ ⟨t,ht.1⟩ : Measure ℝ)) atTop
      (𝓝 (∫ y, φ y ∂(extendEulerCurve hT g t : Measure ℝ))) := by
    have hc := (ProbabilityMeasure.continuous_integral_boundedContinuousFunction
      (ofCompactSupport φ hφ.continuous hs)).tendsto (g ⟨t,ht⟩) |>.comp he
    rw [extendEulerCurve_on_interval hT g (⟨t,ht⟩ : Icc (0 : ℝ) T)]
    exact hc
  have hi := integral_meshGenerator_tendsto B₀ F₀ hF hT hh hg hφ hs ht
  have hz := eulerWeakError_tendsto B₀ F₀ hF hT hφ hs hh ⟨t,ht.1⟩ ht.2
  have hlim := tendsto_nhds_unique ((hj.sub_const (∫ y, φ y ∂(F₀ : Measure ℝ))).sub hi) hz
  exact sub_eq_zero.mp hlim

end GGC.LogRate
