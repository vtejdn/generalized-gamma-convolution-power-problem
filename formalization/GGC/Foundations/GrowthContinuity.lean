import GGC.Foundations.MomentBounds
import Mathlib.Topology.Order.ProjIcc

/-! # Varying-law integral convergence from a common second moment

The clipped test is bounded and continuous. Its integral approximates the
original integral with the explicit uniform error `E[f²]/R`.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Analysis

theorem abs_sub_projIcc_le_sq_div {R : ℝ} (hR : 0 < R) (x : ℝ) :
    |x-(projIcc (-R) R (by linarith) x).val| ≤ x^2/R := by
  by_cases hl : x ≤ -R
  · rw [projIcc_of_le_left (by linarith : -R ≤ R) hl]
    rw [abs_of_nonpos (by linarith), le_div_iff₀ hR]
    nlinarith [sq_nonneg (x+R)]
  by_cases hr : R ≤ x
  · rw [projIcc_of_right_le (by linarith : -R ≤ R) hr]
    rw [abs_of_nonneg (by linarith), le_div_iff₀ hR]
    nlinarith [sq_nonneg (x-R)]
  · rw [projIcc_of_mem (by linarith : -R ≤ R) (show x ∈ Icc (-R) R from ⟨by linarith, by linarith⟩)]
    simp only [sub_self, abs_zero]
    positivity

def clippedTest {f : ℝ → ℝ} (hf : Continuous f) {R : ℝ} (hR : 0 < R) :
    BoundedContinuousFunction ℝ ℝ :=
  BoundedContinuousFunction.mkOfBound
    ⟨fun y => (projIcc (-R) R (by linarith) (f y)).val, by fun_prop⟩ (2*R) (by
      intro x y
      change |(projIcc (-R) R (by linarith) (f x)).val-
        (projIcc (-R) R (by linarith) (f y)).val| ≤ 2*R
      have hx := (projIcc (-R) R (by linarith) (f x)).property
      have hy := (projIcc (-R) R (by linarith) (f y)).property
      rw [abs_le]
      constructor <;> linarith [hx.1, hx.2, hy.1, hy.2])

theorem integral_clippedTest_error_le (F : ProbabilityMeasure ℝ) {f : ℝ → ℝ}
    (hf : Continuous f) (hi : Integrable (fun y => (f y)^2) (F : Measure ℝ))
    {R : ℝ} (hR : 0 < R) :
    |(∫ y, f y ∂(F : Measure ℝ))-(∫ y, clippedTest hf hR y ∂(F : Measure ℝ))| ≤
      (∫ y, (f y)^2 ∂(F : Measure ℝ))/R := by
  have hif := ((memLp_two_iff_integrable_sq hf.aestronglyMeasurable).mpr hi).integrable (by norm_num)
  rw [← integral_sub hif ((clippedTest hf hR).integrable _), ← integral_div]
  apply abs_integral_le_integral_abs.trans
  apply integral_mono ((hif.sub ((clippedTest hf hR).integrable _)).abs) (hi.div_const R)
  intro y
  exact abs_sub_projIcc_le_sq_div hR (f y)

theorem tendsto_integral_of_narrow_testSecondMoment
    {F : ℕ → ProbabilityMeasure ℝ} {G : ProbabilityMeasure ℝ}
    (hFG : Tendsto F atTop (𝓝 G)) {f : ℝ → ℝ} (hf : Continuous f)
    (hF : ∀ n, Integrable (fun y => (f y)^2) (F n : Measure ℝ))
    (hG : Integrable (fun y => (f y)^2) (G : Measure ℝ)) {K : ℝ} (hK : 0 ≤ K)
    (hbF : ∀ n, (∫ y, (f y)^2 ∂(F n : Measure ℝ)) ≤ K)
    (hbG : (∫ y, (f y)^2 ∂(G : Measure ℝ)) ≤ K) :
    Tendsto (fun n => ∫ y, f y ∂(F n : Measure ℝ)) atTop (𝓝 (∫ y, f y ∂(G : Measure ℝ))) := by
  apply Metric.tendsto_atTop.mpr
  intro ε hε
  let R := 1+4*K/ε
  have hR : 0 < R := by dsimp [R]; positivity
  have hsmall : K/R < ε/4 := by
    rw [div_lt_iff₀ hR]
    dsimp [R]
    field_simp
    nlinarith
  have hc := (ProbabilityMeasure.continuous_integral_boundedContinuousFunction
    (clippedTest hf hR)).tendsto G |>.comp hFG
  obtain ⟨N, hN⟩ := Metric.tendsto_atTop.mp hc (ε/2) (half_pos hε)
  refine ⟨N, fun n hn => ?_⟩
  have hn' := hN n hn
  have heF := (integral_clippedTest_error_le (F n) hf (hF n) hR).trans
    (div_le_div_of_nonneg_right (hbF n) hR.le)
  have heG := (integral_clippedTest_error_le G hf hG hR).trans
    (div_le_div_of_nonneg_right hbG hR.le)
  have htri := abs_sub_le (∫ y, f y ∂(F n : Measure ℝ))
    (∫ y, clippedTest hf hR y ∂(F n : Measure ℝ)) (∫ y, f y ∂(G : Measure ℝ))
  have htri' := abs_sub_le (∫ y, clippedTest hf hR y ∂(F n : Measure ℝ))
    (∫ y, clippedTest hf hR y ∂(G : Measure ℝ)) (∫ y, f y ∂(G : Measure ℝ))
  rw [abs_sub_comm (∫ y, clippedTest hf hR y ∂(G : Measure ℝ))] at htri'
  simp only [Real.dist_eq, Function.comp_def] at hn' ⊢
  linarith

theorem sq_le_of_linearGrowth {f : ℝ → ℝ} {C : ℝ} (hC : 0 ≤ C)
    (hb : ∀ y, |f y| ≤ C*(1+|y|)) (y : ℝ) : (f y)^2 ≤ 2*C^2*(1+y^2) := by
  have hh := (sq_le_sq₀ (abs_nonneg (f y)) (by positivity : 0 ≤ C*(1+|y|))).mpr (hb y)
  rw [sq_abs] at hh
  have ha : (1+|y|)^2 ≤ 2*(1+y^2) := by nlinarith [sq_abs y, sq_nonneg (|y|-1)]
  nlinarith [mul_le_mul_of_nonneg_left ha (sq_nonneg C)]

theorem integrable_sq_of_linearGrowth (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ))
    {f : ℝ → ℝ} (hf : AEStronglyMeasurable f (F : Measure ℝ)) {C : ℝ} (hC : 0 ≤ C)
    (hb : ∀ y, |f y| ≤ C*(1+|y|)) : Integrable (fun y => (f y)^2) (F : Measure ℝ) := by
  apply (((integrable_const 1).add hF).const_mul (2*C^2)).mono' (hf.pow 2)
  apply Eventually.of_forall
  intro y
  change |(f y)^2| ≤ 2*C^2*(1+y^2)
  rw [abs_of_nonneg (sq_nonneg _)]
  exact sq_le_of_linearGrowth hC hb y

theorem integral_sq_le_of_linearGrowth (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ))
    {f : ℝ → ℝ} (hf : AEStronglyMeasurable f (F : Measure ℝ)) {C : ℝ} (hC : 0 ≤ C)
    (hb : ∀ y, |f y| ≤ C*(1+|y|)) {K : ℝ} (hK : (∫ y : ℝ, y^2 ∂(F : Measure ℝ)) ≤ K) :
    (∫ y, (f y)^2 ∂(F : Measure ℝ)) ≤ 2*C^2*(1+K) := by
  calc
    _ ≤ ∫ y, 2*C^2*(1+y^2) ∂(F : Measure ℝ) :=
      integral_mono (integrable_sq_of_linearGrowth F hF hf hC hb)
        (((integrable_const 1).add hF).const_mul _) (sq_le_of_linearGrowth hC hb)
    _ = 2*C^2*(1+∫ y : ℝ, y^2 ∂(F : Measure ℝ)) := by
      rw [integral_const_mul, integral_add (integrable_const _) hF]
      simp
    _ ≤ _ := by gcongr

theorem tendsto_integral_of_narrow_linearGrowth
    {F : ℕ → ProbabilityMeasure ℝ} {G : ProbabilityMeasure ℝ}
    (hFG : Tendsto F atTop (𝓝 G)) {f : ℝ → ℝ} (hf : Continuous f)
    (hF : ∀ n, Integrable (fun y : ℝ => y^2) (F n : Measure ℝ))
    (hG : Integrable (fun y : ℝ => y^2) (G : Measure ℝ)) {K C : ℝ} (hK : 0 ≤ K) (hC : 0 ≤ C)
    (hbF : ∀ n, (∫ y : ℝ, y^2 ∂(F n : Measure ℝ)) ≤ K)
    (hbG : (∫ y : ℝ, y^2 ∂(G : Measure ℝ)) ≤ K)
    (hb : ∀ y, |f y| ≤ C*(1+|y|)) :
    Tendsto (fun n => ∫ y, f y ∂(F n : Measure ℝ)) atTop (𝓝 (∫ y, f y ∂(G : Measure ℝ))) := by
  apply tendsto_integral_of_narrow_testSecondMoment hFG hf
    (fun n => integrable_sq_of_linearGrowth (F n) (hF n) hf.aestronglyMeasurable hC hb)
    (integrable_sq_of_linearGrowth G hG hf.aestronglyMeasurable hC hb)
    (K := 2*C^2*(1+K)) (by positivity)
  · intro n
    exact integral_sq_le_of_linearGrowth (F n) (hF n) hf.aestronglyMeasurable hC hb (hbF n)
  · exact integral_sq_le_of_linearGrowth G hG hf.aestronglyMeasurable hC hb hbG

theorem continuous_integral_of_uniform_secondMoment
    {X : Type*} [TopologicalSpace X] [SequentialSpace X]
    (F : X → ProbabilityMeasure ℝ) (hc : Continuous F)
    (hi : ∀ x, Integrable (fun y : ℝ => y^2) (F x : Measure ℝ))
    {K : ℝ} (hK : 0 ≤ K) (hbF : ∀ x, (∫ y : ℝ, y^2 ∂(F x : Measure ℝ)) ≤ K)
    {f : ℝ → ℝ} (hf : Continuous f) {C : ℝ} (hC : 0 ≤ C)
    (hb : ∀ y, |f y| ≤ C*(1+|y|)) :
    Continuous (fun x => ∫ y, f y ∂(F x : Measure ℝ)) := by
  rw [continuous_iff_seqContinuous]
  intro x z hz
  exact tendsto_integral_of_narrow_linearGrowth ((hc.tendsto z).comp hz) hf
    (fun n => hi (x n)) (hi z) hK hC (fun n => hbF (x n)) (hbF z) hb

end GGC.Analysis
