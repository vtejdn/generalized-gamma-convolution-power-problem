import GGC.Foundations.L1Translation
import Mathlib.MeasureTheory.Function.JacobianOneDim
import Mathlib.MeasureTheory.Integral.IntegralEqImproper

/-! # L¹ continuity of density scaling on the positive half-line

The logarithmic Jacobian turns density scaling into translation of an L¹
function on the real line. Both change of variables and translation continuity
are reused from the standard library and the existing local adapter.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Analysis

def logKernel (f : ℝ → ℝ) (v : ℝ) : ℝ := Real.exp v * f (Real.exp v)

def dilateKernel (f : ℝ → ℝ) (b u : ℝ) : ℝ := b⁻¹ * f (u / b)

theorem integrableOn_iff_logKernel (f : ℝ → ℝ) :
    IntegrableOn f (Ioi 0) ↔ Integrable (logKernel f) := by
  change IntegrableOn f (Ioi 0) ↔ Integrable (fun v => Real.exp v * f (Real.exp v))
  have h := integrableOn_image_iff_integrableOn_abs_deriv_smul
    (s := (univ : Set ℝ)) (f := Real.exp) (f' := Real.exp) MeasurableSet.univ
    (fun x _ => (Real.hasDerivAt_exp x).hasDerivWithinAt) Real.exp_injective.injOn f
  simpa only [image_univ, Real.range_exp, Real.abs_exp, smul_eq_mul,
    integrableOn_univ, logKernel] using h

theorem integral_logKernel (f : ℝ → ℝ) :
    (∫ v : ℝ, logKernel f v) = ∫ u in Ioi 0, f u := by
  have h := integral_image_eq_integral_abs_deriv_smul
    (s := (univ : Set ℝ)) (f := Real.exp) (f' := Real.exp) MeasurableSet.univ
    (fun x _ => (Real.hasDerivAt_exp x).hasDerivWithinAt) Real.exp_injective.injOn f
  simpa only [image_univ, Real.range_exp, Real.abs_exp, smul_eq_mul,
    Measure.restrict_univ, logKernel] using h.symm

theorem logKernel_dilateKernel (f : ℝ → ℝ) {b : ℝ} (hb : 0 < b) (v : ℝ) :
    logKernel (dilateKernel f b) v = logKernel f (v - Real.log b) := by
  simp only [logKernel, dilateKernel, Real.exp_sub, Real.exp_log hb,
    div_eq_mul_inv, mul_assoc]

theorem integrableOn_dilateKernel {f : ℝ → ℝ} (hf : IntegrableOn f (Ioi 0))
    {b : ℝ} (hb : 0 < b) : IntegrableOn (dilateKernel f b) (Ioi 0) := by
  change Integrable (fun u => b⁻¹ * f (u / b)) (volume.restrict (Ioi 0))
  have hi : IntegrableOn (fun u => f (b⁻¹ * u)) (Ioi 0) :=
    (integrableOn_Ioi_comp_mul_left_iff f 0 (inv_pos.mpr hb)).mpr (by simpa using hf)
  simpa only [dilateKernel, div_eq_mul_inv, mul_comm] using hi.const_mul b⁻¹

theorem integral_abs_dilateKernel_sub_eq (f : ℝ → ℝ) {b c : ℝ}
    (hb : 0 < b) (hc : 0 < c) :
    (∫ u in Ioi 0, |dilateKernel f b u - dilateKernel f c u|) =
      ∫ v : ℝ, |logKernel f ((Real.log c - Real.log b) + v) - logKernel f v| := by
  calc
    _ = ∫ v : ℝ, |logKernel f (v - Real.log b) - logKernel f (v - Real.log c)| := by
      rw [← integral_logKernel (fun u => |dilateKernel f b u - dilateKernel f c u|)]
      apply integral_congr_ae
      exact Eventually.of_forall fun v => by
        dsimp only
        rw [← logKernel_dilateKernel f hb v, ← logKernel_dilateKernel f hc v]
        simp only [logKernel, ← mul_sub, abs_mul, Real.abs_exp]
    _ = _ := by
      have h := integral_add_right_eq_self (μ := (volume : Measure ℝ))
        (fun v : ℝ => |logKernel f (v - Real.log b) - logKernel f (v - Real.log c)|)
        (Real.log c)
      have he (v : ℝ) : v + Real.log c - Real.log b = (Real.log c - Real.log b) + v := by ring
      simpa only [he, add_sub_cancel_right] using h.symm

/-- Positive density dilations vary continuously in L¹. No regularity of the
kernel beyond integrability on the positive half-line is required. -/
theorem tendsto_integral_abs_dilateKernel_sub {ι : Type*} {l : Filter ι}
    {b : ι → ℝ} {c : ℝ} (hc : 0 < c) (hbc : Tendsto b l (𝓝 c))
    {f : ℝ → ℝ} (hf : IntegrableOn f (Ioi 0)) :
    Tendsto (fun i => ∫ u in Ioi 0, |dilateKernel f (b i) u - dilateKernel f c u|)
      l (𝓝 0) := by
  have hlog := (Real.continuousAt_log hc.ne').tendsto.comp hbc
  have hconst : Tendsto (fun _ : ι => Real.log c) l (𝓝 (Real.log c)) := tendsto_const_nhds
  have harg : Tendsto (fun i => Real.log c - Real.log (b i)) l (𝓝 0) := by
    simpa only [sub_self, Function.comp_def] using hconst.sub hlog
  have ht := (tendsto_integral_abs_translate_sub_zero ((integrableOn_iff_logKernel f).mp hf)).comp harg
  apply ht.congr'
  filter_upwards [hbc.eventually (lt_mem_nhds hc)] with i hi
  exact (integral_abs_dilateKernel_sub_eq f hi hc).symm

end GGC.Analysis
