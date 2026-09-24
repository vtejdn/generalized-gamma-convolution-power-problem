import Mathlib.MeasureTheory.Integral.IntervalIntegral.AbsolutelyContinuousFun
import Mathlib.MeasureTheory.Integral.IntervalIntegral.LebesgueDifferentiationThm
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Tactic

/-! # An integrating factor for integral weak equations -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Analysis

/-- The product rule needs only an integrable right-hand side. The asserted
integral equation supplies absolute continuity on the closed time interval. -/
theorem exp_neg_mul_sub_eq_integral {ψ G : ℝ → ℝ} {t : ℝ} (ht : 0 ≤ t)
    (hG : IntervalIntegrable G volume 0 t)
    (hψ : ∀ r ∈ Icc 0 t, ψ r - ψ 0 = ∫ u in 0..r, G u) :
    Real.exp (-t)*ψ t - ψ 0 = ∫ r in 0..t, Real.exp (-r)*(G r-ψ r) := by
  let P : ℝ → ℝ := fun r => ψ 0 + ∫ u in 0..r, G u
  have hP (r : ℝ) (hr : r ∈ Icc 0 t) : P r = ψ r := by
    dsimp only [P]
    linarith [hψ r hr]
  have hacC : AbsolutelyContinuousOnInterval (fun _ : ℝ => ψ 0) 0 t :=
    (show ContDiffOn ℝ 1 (fun _ : ℝ => ψ 0) (uIcc 0 t) from contDiffOn_const).absolutelyContinuousOnInterval
  have hacP : AbsolutelyContinuousOnInterval P 0 t :=
    hacC.fun_add (hG.absolutelyContinuousOnInterval_intervalIntegral (by simp))
  have hacE : AbsolutelyContinuousOnInterval (fun r : ℝ => Real.exp (-r)) 0 t :=
    (show ContDiffOn ℝ 1 (fun r : ℝ => Real.exp (-r)) (uIcc 0 t) by fun_prop).absolutelyContinuousOnInterval
  have hderE (r : ℝ) : deriv (fun r : ℝ => Real.exp (-r)) r = -Real.exp (-r) := by
    convert! ((hasDerivAt_id r).neg.exp).deriv using 1
    simp
  have hderP : ∀ᵐ r, r ∈ uIcc 0 t → deriv P r = G r := by
    filter_upwards [hG.ae_hasDerivAt_integral] with r hr hrt
    exact ((hr hrt 0 (by simp)).const_add (ψ 0)).deriv
  have hprod := hacE.integral_deriv_mul_eq_sub hacP
  have heq : (∫ r in 0..t, deriv (fun r : ℝ => Real.exp (-r)) r * P r +
      Real.exp (-r)*deriv P r) = ∫ r in 0..t, Real.exp (-r)*(G r-ψ r) := by
    apply intervalIntegral.integral_congr_ae
    filter_upwards [hderP] with r hr hrt
    have hrt' : r ∈ Icc 0 t := by
      simpa only [uIcc_of_le ht] using uIoc_subset_uIcc hrt
    rw [hderE, hr (uIoc_subset_uIcc hrt), hP r hrt']
    ring
  rw [heq, hP t ⟨ht,le_rfl⟩, hP 0 ⟨le_rfl,ht⟩] at hprod
  simpa using hprod.symm

/-- Exponentiate an integral equation after its right-hand side has been proved
continuous. No time differentiability of the original function is assumed. -/
theorem exp_sub_eq_integral {ψ G : ℝ → ℝ} {t : ℝ} (ht : 0 ≤ t)
    (hG : Continuous G) (hψ : ∀ r ∈ Icc 0 t, ψ r - ψ 0 = ∫ u in 0..r, G u) :
    Real.exp (ψ t) - Real.exp (ψ 0) = ∫ r in 0..t, Real.exp (ψ r)*G r := by
  let P : ℝ → ℝ := fun r => ψ 0 + ∫ u in 0..r, G u
  have hP (r : ℝ) (hr : r ∈ Icc 0 t) : P r = ψ r := by
    dsimp only [P]
    linarith [hψ r hr]
  have hdP (r : ℝ) : HasDerivAt P (G r) r :=
    (intervalIntegral.integral_hasDerivAt_right (hG.intervalIntegrable 0 r)
      hG.aestronglyMeasurable.stronglyMeasurableAtFilter hG.continuousAt).const_add _
  have hcP : Continuous P := continuous_iff_continuousAt.mpr fun r => (hdP r).continuousAt
  have hdE (r : ℝ) : HasDerivAt (fun r => Real.exp (P r)) (Real.exp (P r)*G r) r := (hdP r).exp
  have he := intervalIntegral.integral_eq_sub_of_hasDerivAt (fun r _ => hdE r)
    (((Real.continuous_exp.comp hcP).mul hG).intervalIntegrable 0 t)
  rw [hP t ⟨ht,le_rfl⟩, hP 0 ⟨le_rfl,ht⟩] at he
  rw [← he]
  apply intervalIntegral.integral_congr_ae
  apply Eventually.of_forall
  intro r hr
  have hr' : r ∈ Icc 0 t := by simpa only [uIcc_of_le ht] using uIoc_subset_uIcc hr
  rw [hP r hr']

end GGC.Analysis
