import GGC.Identification.ValueLaw
import GGC.LogRate.ResolventTest
import GGC.PowerTangent
import GGC.Foundations.SmoothCutoffBounds

/-! # Resolvent derivatives of the actual value law's logarithmic transform -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Identification
open GGC.Analysis GGC.LogRate

theorem abs_logResolvent_le {s : ℝ} (hs : 0 < s) (y : ℝ) :
    |logResolvent s y| ≤ 1/s := by
  rw [logResolvent, abs_of_pos (inv_pos.mpr (add_pos hs (Real.exp_pos y))), one_div]
  exact inv_anti₀ hs (le_add_of_nonneg_right (Real.exp_pos y).le)

theorem linearGrowthC2_logResolvent {s : ℝ} (hs : 0 < s) :
    LinearGrowthC2 (logResolvent s) := by
  refine ⟨contDiff_logResolvent hs, 1/s, by positivity, fun y => ?_⟩
  exact ⟨(abs_logResolvent_le hs y).trans (by
    nlinarith [mul_nonneg (show 0 ≤ 1/s by positivity) (abs_nonneg y)]),
    abs_deriv_logResolvent_le hs y, abs_deriv_deriv_logResolvent_le hs y⟩

theorem hasDerivAt_logTest_s {s : ℝ} (hs : 0 < s) (y : ℝ) :
    HasDerivAt (fun r => logTest r y) (logResolvent s y) s := by
  have hd := (((hasDerivAt_id s).mul_const (Real.exp (-y))).const_add 1).log
    (show 1+s*Real.exp (-y) ≠ 0 by positivity)
  simp only [id_eq, one_mul] at hd
  convert! hd using 1
  rw [logResolvent, Real.exp_neg]
  field_simp
  ring

theorem hasDerivAt_integral_logTest (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) {s : ℝ} (hs : 0 < s) :
    HasDerivAt (fun r => ∫ y, logTest r y ∂(F : Measure ℝ))
      (∫ y, logResolvent s y ∂(F : Measure ℝ)) s := by
  have hd := hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (μ := (F : Measure ℝ)) (F := fun r y : ℝ => logTest r y)
    (F' := fun r y : ℝ => logResolvent r y) (bound := fun _ => 1/(s/2))
    (Ioi_mem_nhds (show s/2 < s by linarith))
    (Eventually.of_forall fun r =>
      (show Measurable (fun y => logTest r y) by unfold logTest; fun_prop).aestronglyMeasurable)
    (integrable_logTest F hF hs.le)
    (contDiff_logResolvent hs).continuous.measurable.aestronglyMeasurable
    (Eventually.of_forall fun y r hr => by
      rw [Real.norm_eq_abs]
      exact (abs_logResolvent_le ((half_pos hs).trans hr) y).trans
        (one_div_le_one_div_of_le (half_pos hs) hr.le))
    (integrable_const _) (Eventually.of_forall fun y r hr =>
      hasDerivAt_logTest_s ((half_pos hs).trans hr) y)
  exact hd.2

theorem hasDerivAt_log_laplace_valueLaw (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) {s : ℝ} (hs : 0 < s) :
    HasDerivAt (fun r => Real.log (laplace (valueLaw B F hF) r))
      (-B.val * ∫ y, logResolvent s y ∂(F : Measure ℝ)) s := by
  apply ((hasDerivAt_integral_logTest F hF hs).const_mul (-B.val)).congr_of_eventuallyEq
  filter_upwards [eventually_gt_nhds hs] with r hr
  rw [laplace_valueLaw B F hF hr, Real.log_exp]

theorem powerLogDerivative_valueLaw (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) {s : ℝ} (hs : 0 < s) :
    powerLogDerivative (valueLaw B F hF) 1 s =
      B.val * ∫ y, logResolvent s y ∂(F : Measure ℝ) := by
  simp only [powerLogDerivative, powerLaplace_one]
  rw [(hasDerivAt_log_laplace_valueLaw B F hF hs).deriv]
  ring

end GGC.Identification
