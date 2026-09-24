import GGC.PowerTangent
import GGC.Identification.LogValueContinuity
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-! # The zero Laplace endpoint with only an absolute logarithmic moment -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Identification

theorem abs_mul_dampedLog_integrand_le {s x : ℝ} (hs : 0 ≤ s) (hx : 0 ≤ x) :
    |s * (x * Real.log x * Real.exp (-s*x))| ≤ Real.exp (-1) * |Real.log x| := by
  calc
    _ = (s*x*Real.exp (-(s*x))) * |Real.log x| := by
      rw [abs_mul, abs_mul, abs_mul, abs_of_nonneg hs, abs_of_nonneg hx,
        abs_of_pos (Real.exp_pos _)]
      rw [neg_mul]
      ring
    _ ≤ _ := mul_le_mul_of_nonneg_right (Real.mul_exp_neg_le_exp_neg_one (s*x))
      (abs_nonneg _)

theorem tendsto_laplace_zero (μ : NonnegLaw) :
    Tendsto (laplace μ) (𝓝[>] (0 : ℝ)) (𝓝 1) := by
  have ht := tendsto_integral_filter_of_dominated_convergence
    (μ := (μ.law : Measure ℝ)) (F := fun s x : ℝ => Real.exp (-s*x))
    (f := fun _ => (1 : ℝ)) (l := 𝓝[>] (0 : ℝ)) (fun _ => (1 : ℝ))
    (Eventually.of_forall fun _ => by fun_prop)
    (by
      filter_upwards [self_mem_nhdsWithin] with s hs
      filter_upwards [laplace_integrand_le_one μ (le_of_lt hs)] with x hx
      simpa only [Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)] using hx)
    (integrable_const _) (Eventually.of_forall fun x => by
      have hc : Continuous (fun s : ℝ => Real.exp (-s*x)) := by fun_prop
      simpa using (hc.tendsto (0 : ℝ)).mono_left (nhdsWithin_le_nhds (s := Ioi (0 : ℝ))))
  simpa only [laplace, integral_const, probReal_univ, smul_eq_mul, one_mul] using! ht

theorem abs_mul_dampedLogMoment_le (μ : NonnegLaw)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) {s : ℝ} (hs : 0 ≤ s) :
    |s * dampedLogMoment μ 0 s| ≤
      Real.exp (-1) * ∫ x, |Real.log x| ∂(μ.law : Measure ℝ) := by
  have hm : AEStronglyMeasurable (fun x : ℝ => s*(x*Real.log x*Real.exp (-s*x)))
      (μ.law : Measure ℝ) := (by fun_prop : Measurable _).aestronglyMeasurable
  have hb : ∀ᵐ x ∂(μ.law : Measure ℝ),
      |s*(x*Real.log x*Real.exp (-s*x))| ≤ Real.exp (-1)*|Real.log x| :=
    μ.nonneg.mono fun _ hx => abs_mul_dampedLog_integrand_le hs hx
  have hj : Integrable (fun x : ℝ => s*(x*Real.log x*Real.exp (-s*x)))
      (μ.law : Measure ℝ) :=
    (hi.abs.const_mul (Real.exp (-1))).mono' hm (by simpa only [Real.norm_eq_abs] using hb)
  calc
    _ = |∫ x, s*(x*Real.log x*Real.exp (-s*x)) ∂(μ.law : Measure ℝ)| := by
      simp only [dampedLogMoment, zero_add, pow_one, integral_const_mul]
    _ ≤ ∫ x, |s*(x*Real.log x*Real.exp (-s*x))| ∂(μ.law : Measure ℝ) :=
      abs_integral_le_integral_abs
    _ ≤ ∫ x, Real.exp (-1)*|Real.log x| ∂(μ.law : Measure ℝ) :=
      integral_mono_ae hj.abs (hi.abs.const_mul _) hb
    _ = _ := integral_const_mul _ _

theorem tendsto_mul_dampedLogMoment_zero (μ : NonnegLaw)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) :
    Tendsto (fun s => s*dampedLogMoment μ 0 s) (𝓝[>] (0 : ℝ)) (𝓝 0) := by
  have ht := tendsto_integral_filter_of_dominated_convergence
    (μ := (μ.law : Measure ℝ)) (F := fun s x : ℝ => s*(x*Real.log x*Real.exp (-s*x)))
    (f := fun _ => (0 : ℝ)) (l := 𝓝[>] (0 : ℝ)) (fun x => Real.exp (-1)*|Real.log x|)
    (Eventually.of_forall fun _ => (by fun_prop : Measurable _).aestronglyMeasurable)
    (by
      filter_upwards [self_mem_nhdsWithin] with s hs
      filter_upwards [μ.nonneg] with x hx
      simpa only [Real.norm_eq_abs] using abs_mul_dampedLog_integrand_le (le_of_lt hs) hx)
    (hi.abs.const_mul _) (Eventually.of_forall fun x => by
      have hc : Continuous (fun s : ℝ => s*(x*Real.log x*Real.exp (-s*x))) := by fun_prop
      simpa using (hc.tendsto (0 : ℝ)).mono_left (nhdsWithin_le_nhds (s := Ioi (0 : ℝ))))
  simpa only [integral_zero, integral_const_mul, dampedLogMoment, zero_add, pow_one] using ht

theorem tendsto_mul_tiltedXLog_zero (μ : NonnegLaw)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) :
    Tendsto (fun s => s*tiltedXLog μ s) (𝓝[>] (0 : ℝ)) (𝓝 0) := by
  have ht := (tendsto_mul_dampedLogMoment_zero μ hi).div (tendsto_laplace_zero μ) one_ne_zero
  change Tendsto (fun s => (s*dampedLogMoment μ 0 s)/laplace μ s)
    (𝓝[>] (0 : ℝ)) (𝓝 ((0 : ℝ)/1)) at ht
  simpa only [tiltedXLog, mul_div_assoc, zero_div] using ht

theorem abs_mul_tiltedXLog_le (μ : NonnegLaw)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) {s D C : ℝ}
    (hs : 0 ≤ s) (hD : 0 < D) (hL : D ≤ laplace μ s)
    (hC : (∫ x, |Real.log x| ∂(μ.law : Measure ℝ)) ≤ C) :
    |s*tiltedXLog μ s| ≤ Real.exp (-1)*C/D := by
  rw [tiltedXLog, ← mul_div_assoc, abs_div, abs_of_pos (laplace_pos μ hs)]
  have hC₀ : 0 ≤ C := (integral_nonneg fun _ => abs_nonneg _).trans hC
  calc
    _ ≤ (Real.exp (-1) * ∫ x, |Real.log x| ∂(μ.law : Measure ℝ))/laplace μ s :=
      div_le_div_of_nonneg_right (abs_mul_dampedLogMoment_le μ hi hs) (laplace_pos μ hs).le
    _ ≤ Real.exp (-1)*C/laplace μ s := by gcongr; exact (laplace_pos μ hs).le
    _ ≤ _ := div_le_div_of_nonneg_left (by positivity) hD hL

end GGC.Identification
