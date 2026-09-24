import GGC.Identification.ValueTails
import GGC.Identification.LogTailIntegral
import GGC.Identification.TransformContinuity

/-! # Uniform absolute logarithmic moments of the actual value distributions

Laplace tail inequalities and layer cake control both signs of the logarithm.
The bound depends only on the compact positive mass interval and the common
log-rate second moment. No undamped value moment is assumed.
-/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Identification
open GGC.Analysis GGC.LogRate

theorem valueLaw_posLog_integrable_bound (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) {K : ℝ}
    (hK : (∫ y : ℝ, y^2 ∂(F : Measure ℝ)) ≤ K) :
    Integrable (fun x => max (Real.log x) 0) ((valueLaw B F hF).law : Measure ℝ) ∧
      (∫ x, max (Real.log x) 0 ∂((valueLaw B F hF).law : Measure ℝ)) ≤ 8*B.val*(1+K) := by
  have hB : 0 < B.val := B.property
  have hi := (integrable_integral_logTest_exp_neg F hF).const_mul (2*B.val)
  have hb : ∀ r : ℝ, 0 < r →
      ((valueLaw B F hF).law : Measure ℝ).real {x | r < max (Real.log x) 0} ≤
        (2*B.val)*(∫ y, logTest (Real.exp (-r)) y ∂(F : Measure ℝ)) := by
    intro r hr
    have ht := measureReal_posLog_tail_le _ (valueLaw_pos B F hF) hr
    rw [laplace_valueLaw B F hF (Real.exp_pos _)] at ht
    have he := Real.add_one_le_exp (-B.val*∫ y, logTest (Real.exp (-r)) y ∂(F : Measure ℝ))
    linarith
  obtain ⟨hint, hbound⟩ := integrable_and_integral_le_of_tail_bound
    ((valueLaw B F hF).law : Measure ℝ) (by fun_prop) (fun x => le_max_right _ _) hi hb
  refine ⟨hint, ?_⟩
  rw [integral_const_mul] at hbound
  have hh := mul_le_mul_of_nonneg_left (integral_integral_logTest_exp_neg_le F hF)
    (by positivity : 0 ≤ 2*B.val)
  have hk := mul_le_mul_of_nonneg_left hK (by positivity : 0 ≤ 8*B.val)
  nlinarith

theorem valueLaw_integrable_log_bound (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) {K : ℝ}
    (hK : (∫ y : ℝ, y^2 ∂(F : Measure ℝ)) ≤ K) :
    Integrable Real.log ((valueLaw B F hF).law : Measure ℝ) ∧
      (∫ x, |Real.log x| ∂((valueLaw B F hF).law : Measure ℝ)) ≤
        Real.exp (1+B.val*Real.sqrt K)/B.val+8*B.val*(1+K) := by
  obtain ⟨hip, hp⟩ := valueLaw_posLog_integrable_bound B F hF hK
  obtain ⟨hin, hn⟩ := valueLaw_negLog_integrable_bound B F hF hK
  have he (x : ℝ) : |Real.log x| = max (Real.log x) 0+max (-Real.log x) 0 := by
    by_cases h : 0 ≤ Real.log x
    · simp [abs_of_nonneg h, max_eq_left h, max_eq_right (neg_nonpos.mpr h)]
    · simp [abs_of_nonpos (le_of_not_ge h), max_eq_right (le_of_not_ge h),
        max_eq_left (neg_nonneg.mpr (le_of_not_ge h))]
  have hi : Integrable Real.log ((valueLaw B F hF).law : Measure ℝ) := by
    apply (hip.add hin).mono' (show Measurable Real.log from Real.measurable_log).aestronglyMeasurable
    exact Eventually.of_forall fun x => by rw [Real.norm_eq_abs, he]; rfl
  refine ⟨hi, ?_⟩
  simp_rw [he]
  rw [integral_add hip hin]
  linarith

theorem valueLaw_logMoment_compactMass_bound {a b K : ℝ} (ha : 0 < a) (hK : 0 ≤ K)
    (B : PosReal) (F : ProbabilityMeasure ℝ) (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ))
    (hB : B.val ∈ Icc a b) (hFK : (∫ y : ℝ, y^2 ∂(F : Measure ℝ)) ≤ K) :
    (∫ x, |Real.log x| ∂((valueLaw B F hF).law : Measure ℝ)) ≤
      Real.exp (1+b*Real.sqrt K)/a+8*b*(1+K) := by
  have h := (valueLaw_integrable_log_bound B F hF hFK).2
  have he : Real.exp (1+B.val*Real.sqrt K) ≤ Real.exp (1+b*Real.sqrt K) :=
    Real.exp_le_exp.mpr (by nlinarith [mul_le_mul_of_nonneg_right hB.2 (Real.sqrt_nonneg K)])
  have hd := (div_le_div_of_nonneg_right he B.property.le).trans
    (div_le_div_of_nonneg_left (Real.exp_pos _).le ha hB.1)
  have hp := mul_le_mul_of_nonneg_right hB.2 (show 0 ≤ 8*(1+K) by positivity)
  nlinarith

/-- The value distributions of every M5 solution have one finite absolute
logarithmic-moment bound on the entire prescribed horizon. -/
theorem valueLaw_logMoment_bound {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ t : Icc (0 : ℝ) T,
      Integrable Real.log ((WeakLogRateSolution.value w t).law : Measure ℝ) ∧
        (∫ x, |Real.log x| ∂((WeakLogRateSolution.value w t).law : Measure ℝ)) ≤ C := by
  obtain ⟨K, hK, hk⟩ := w.moment_bound
  let a := B₀.val*Real.exp (-T)
  have ha : 0 < a := mul_pos B₀.property (Real.exp_pos _)
  have hB₀ : 0 < B₀.val := B₀.property
  refine ⟨Real.exp (1+B₀.val*Real.sqrt K)/a+8*B₀.val*(1+K), by positivity, fun t => ?_⟩
  constructor
  · exact (valueLaw_integrable_log_bound _ _ _ (hk t.val t.property).2).1
  · exact valueLaw_logMoment_compactMass_bound ha hK _ _ _
      (massAt_mem_Icc B₀ t.property) (hk t.val t.property).2

end GGC.Identification
