import GGC.Identification.LogTests
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
import Mathlib.MeasureTheory.Integral.Prod

/-! # An integrable quadratic bound for the logarithmic upper-tail kernel -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Identification

private def logTailEnvelope (y r : ℝ) : ℝ :=
  (Ioc 0 (2*|y|)).indicator (fun _ => Real.log 2+|y|) r + Real.exp ((-(1:ℝ)/2)*r)

private theorem integrableOn_logTailEnvelope (y : ℝ) : IntegrableOn (logTailEnvelope y) (Ioi 0) := by
  have hi : IntegrableOn (fun _r : ℝ => Real.log 2+|y|) (Ioc 0 (2*|y|)) :=
    integrableOn_const (by rw [Real.volume_Ioc]; exact ENNReal.ofReal_ne_top)
  exact (hi.integrable_indicator measurableSet_Ioc).integrableOn.add
    (integrableOn_exp_mul_Ioi (by norm_num : -(1:ℝ)/2 < 0) 0)

private theorem integral_logTailEnvelope (y : ℝ) :
    (∫ r in Ioi 0, logTailEnvelope y r) = 2*|y| * (Real.log 2+|y|)+2 := by
  have hi : IntegrableOn (fun _r : ℝ => Real.log 2+|y|) (Ioc 0 (2*|y|)) :=
    integrableOn_const (by rw [Real.volume_Ioc]; exact ENNReal.ofReal_ne_top)
  rw [show (fun r => logTailEnvelope y r) =
      (fun r => (Ioc 0 (2*|y|)).indicator (fun _ => Real.log 2+|y|) r +
        Real.exp ((-(1:ℝ)/2)*r)) from rfl]
  rw [integral_add (hi.integrable_indicator measurableSet_Ioc).integrableOn
    (integrableOn_exp_mul_Ioi (by norm_num : -(1:ℝ)/2 < 0) 0),
    setIntegral_indicator measurableSet_Ioc, inter_eq_right.mpr Ioc_subset_Ioi_self,
    integral_const, Measure.real, Measure.restrict_apply_univ, ← Measure.real,
    Real.volume_real_Ioc_of_le (by positivity),
    integral_exp_mul_Ioi (by norm_num : -(1:ℝ)/2 < 0) 0]
  norm_num [smul_eq_mul]

private theorem logTest_exp_neg_le_envelope (y : ℝ) {r : ℝ} (hr : 0 < r) :
    logTest (Real.exp (-r)) y ≤ logTailEnvelope y r := by
  by_cases hsmall : r ≤ 2*|y|
  · have he : Real.exp (-r) ≤ 1 := Real.exp_le_one_iff.mpr (by linarith)
    have hl : Real.log (1+Real.exp (-r)) ≤ Real.log 2 :=
      Real.log_le_log (by positivity) (by linarith)
    have hb := (logTest_le (Real.exp_pos (-r)).le y).trans
      (add_le_add hl (max_le (neg_le_abs y) (abs_nonneg y)))
    simp only [logTailEnvelope, indicator_of_mem (show r ∈ Ioc 0 (2*|y|) from ⟨hr,hsmall⟩)]
    linarith [Real.exp_pos ((-(1:ℝ)/2)*r)]
  · have ha : -r-y ≤ (-(1:ℝ)/2)*r := by linarith [neg_le_abs y]
    have hb : logTest (Real.exp (-r)) y ≤ Real.exp ((-(1:ℝ)/2)*r) := by
      dsimp [logTest]
      rw [← Real.exp_add]
      have hm : -r + -y = -r-y := by ring
      rw [hm]
      have ht' : Real.log (1+Real.exp (-r-y)) ≤ Real.exp (-r-y) := by
        have hz := Real.log_le_sub_one_of_pos (show 0 < 1+Real.exp (-r-y) by positivity)
        linarith
      exact ht'.trans (Real.exp_le_exp.mpr ha)
    simpa only [logTailEnvelope, indicator_of_notMem (show r ∉ Ioc 0 (2*|y|) from fun hx => hsmall hx.2), zero_add] using hb

theorem integrableOn_logTest_exp_neg (y : ℝ) :
    IntegrableOn (fun r : ℝ => logTest (Real.exp (-r)) y) (Ioi 0) := by
  apply (integrableOn_logTailEnvelope y).mono'
    (show Measurable (fun r : ℝ => logTest (Real.exp (-r)) y) by unfold logTest; fun_prop).aestronglyMeasurable
  filter_upwards [ae_restrict_mem measurableSet_Ioi] with r hr
  rw [Real.norm_eq_abs, abs_of_nonneg (logTest_nonneg (Real.exp_pos (-r)).le y)]
  exact logTest_exp_neg_le_envelope y hr

theorem integral_logTest_exp_neg_le (y : ℝ) :
    (∫ r in Ioi 0, logTest (Real.exp (-r)) y) ≤ 4*(1+y^2) := by
  have hi := integral_mono_ae (integrableOn_logTest_exp_neg y) (integrableOn_logTailEnvelope y)
    ((ae_restrict_mem measurableSet_Ioi).mono fun r hr => logTest_exp_neg_le_envelope y hr)
  rw [integral_logTailEnvelope] at hi
  have hl : Real.log 2 ≤ 1 := by linarith [Real.log_le_sub_one_of_pos (by norm_num : (0:ℝ) < 2)]
  nlinarith [mul_le_mul_of_nonneg_left hl (abs_nonneg y), sq_abs y, sq_nonneg (|y|-1)]

theorem integrable_logTest_exp_neg_prod (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) :
    Integrable (fun p : ℝ × ℝ => logTest (Real.exp (-p.1)) p.2)
      ((volume.restrict (Ioi 0)).prod (F : Measure ℝ)) := by
  have hm : Measurable (fun p : ℝ × ℝ => logTest (Real.exp (-p.1)) p.2) := by
    unfold logTest
    fun_prop
  apply (integrable_prod_iff' hm.aestronglyMeasurable).mpr
  refine ⟨Eventually.of_forall integrableOn_logTest_exp_neg, ?_⟩
  have hn : (fun y => ∫ r in Ioi 0, ‖logTest (Real.exp (-r)) y‖) =
      fun y => ∫ r in Ioi 0, logTest (Real.exp (-r)) y := by
    funext y
    apply integral_congr_ae
    exact Eventually.of_forall fun r => Real.norm_of_nonneg (logTest_nonneg (Real.exp_pos (-r)).le y)
  rw [hn]
  apply (((integrable_const 1).add hF).const_mul (4 : ℝ)).mono'
    ((hm.stronglyMeasurable.prod_swap.integral_prod_right).aestronglyMeasurable)
  apply Eventually.of_forall
  intro y
  rw [Real.norm_eq_abs, abs_of_nonneg (integral_nonneg fun r => logTest_nonneg (Real.exp_pos (-r)).le y)]
  exact integral_logTest_exp_neg_le y

theorem integrable_integral_logTest_exp_neg (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) :
    IntegrableOn (fun r : ℝ => ∫ y, logTest (Real.exp (-r)) y ∂(F : Measure ℝ)) (Ioi 0) :=
  (integrable_logTest_exp_neg_prod F hF).integral_prod_left

theorem integral_integral_logTest_exp_neg_le (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) :
    (∫ r in Ioi 0, ∫ y, logTest (Real.exp (-r)) y ∂(F : Measure ℝ)) ≤
      4*(1+∫ y : ℝ, y^2 ∂(F : Measure ℝ)) := by
  rw [integral_integral_swap (integrable_logTest_exp_neg_prod F hF)]
  calc
    _ ≤ ∫ y, 4*(1+y^2) ∂(F : Measure ℝ) :=
      integral_mono (integrable_logTest_exp_neg_prod F hF).integral_prod_right
        (((integrable_const 1).add hF).const_mul _) integral_logTest_exp_neg_le
    _ = _ := by rw [integral_const_mul, integral_add (integrable_const _) hF]; simp

end GGC.Identification
