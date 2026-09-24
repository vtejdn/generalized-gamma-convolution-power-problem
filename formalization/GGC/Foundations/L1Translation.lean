import Mathlib.MeasureTheory.Function.LpSpace.DomAct.Continuous
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.MeasureTheory.Group.Integral
import Mathlib.Tactic

/-! # L¹ translation continuity in terms of actual integrals

API-023: this adapter reuses mathlib's continuous domain action on L¹.
-/

noncomputable section
open MeasureTheory Filter
open scoped Topology ENNReal
namespace GGC.Analysis

theorem norm_translate_sub_toL1 {f : ℝ → ℝ} (hf : Integrable f) (a : ℝ) :
    ‖(DomAddAct.mk a +ᵥ hf.toL1 f) - hf.toL1 f‖ = ∫ x : ℝ, |f (a+x)-f x| := by
  rw [L1.norm_eq_integral_norm]
  apply integral_congr_ae
  have hshift : DomAddAct.mk a +ᵥ hf.toL1 f =ᵐ[volume] (fun x => f (a+x)) := by
    have h := ((memLp_one_iff_integrable.mpr hf).comp_measurePreserving
      (measurePreserving_add_left volume a)).coeFn_toLp
    exact h
  filter_upwards [Lp.coeFn_sub (DomAddAct.mk a +ᵥ hf.toL1 f) (hf.toL1 f),
    hshift, hf.coeFn_toL1] with x hx hs hf'
  simp only [hx, Pi.sub_apply, hs, hf', Real.norm_eq_abs]

theorem continuous_integral_abs_translate_sub {f : ℝ → ℝ} (hf : Integrable f) :
    Continuous (fun a : ℝ => ∫ x : ℝ, |f (a+x)-f x|) := by
  haveI : Fact ((1 : ℝ≥0∞) ≤ 1) := ⟨le_rfl⟩
  haveI : Fact ((1 : ℝ≥0∞) ≠ ∞) := ⟨by simp⟩
  have h : Continuous (fun a : ℝ => DomAddAct.mk a +ᵥ hf.toL1 f) :=
    DomAddAct.continuous_mk.vadd continuous_const
  have hc : Continuous (fun a : ℝ => ‖(DomAddAct.mk a +ᵥ hf.toL1 f)-hf.toL1 f‖) :=
    (h.sub continuous_const).norm
  simpa only [norm_translate_sub_toL1 hf] using hc

theorem tendsto_integral_abs_translate_sub_zero {f : ℝ → ℝ} (hf : Integrable f) :
    Tendsto (fun a : ℝ => ∫ x : ℝ, |f (a+x)-f x|) (𝓝 0) (𝓝 0) := by
  simpa only [zero_add, sub_self, abs_zero, integral_zero] using
    (continuous_integral_abs_translate_sub hf).tendsto 0

theorem integral_abs_translate_sub_le {f : ℝ → ℝ} (hf : Integrable f) (a : ℝ) :
    (∫ x : ℝ, |f (a+x)-f x|) ≤ 2*∫ x, |f x| := by
  have hi : Integrable (fun x => f (a+x)) :=
    (measurePreserving_add_left volume a).integrable_comp_of_integrable hf
  calc
    _ ≤ ∫ x : ℝ, |f (a+x)|+|f x| := integral_mono (hi.sub hf).abs (hi.abs.add hf.abs)
      (fun x => abs_sub _ _)
    _ = 2*∫ x, |f x| := by
      rw [integral_add hi.abs hf.abs, integral_add_left_eq_self (fun x => |f x|) a]
      ring

end GGC.Analysis
