import GGC.Identification.ResolventCalculus
import GGC.Identification.TestExtension
import GGC.Identification.ValueTime
import GGC.LogRate.GeneratorResolvent
import GGC.Foundations.IntegratingFactor

/-! # The integral time equation for the value-law resolvent -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Identification
open GGC.Analysis GGC.LogRate

theorem averagedGenerator_value_resolvent
    (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) {s : ℝ} (hs : 0 < s) :
    averagedGenerator B F (logResolvent s) =
      (powerTangent (valueLaw B F hF) s +
        B.val * ∫ y, logResolvent s y ∂(F : Measure ℝ))/B.val := by
  have he := integral_generator_eq_normalized_powerTangent B F
    (thorinAdmissible_baseMeasure B F hF) (valueLaw B F hF) (fun r hr => by
      rw [laplace_valueLaw B F hF hr, integral_baseMeasure_log]
      congr 1
      ring) hs
  rw [powerLogDerivative_valueLaw B F hF hs] at he
  exact he

theorem powerLogDerivative_valueAt
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T)
    {r s : ℝ} (hr : r ∈ Icc 0 T) (hs : 0 < s) :
    powerLogDerivative (valueAt w hT r) 1 s =
      (massAt B₀ r).val * ∫ y, logResolvent s y ∂(w.law r : Measure ℝ) := by
  rw [valueAt_eq_value w hT hr]
  exact powerLogDerivative_valueLaw _ _ _ hs

/-- Multiplication by the decaying mass cancels precisely the extra resolvent
term in M3. This is a time integral equation for the actual laws. -/
theorem resolvent_time_equation
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T)
    {t s : ℝ} (ht : t ∈ Icc 0 T) (hs : 0 < s) :
    powerLogDerivative (valueAt w hT t) 1 s - powerLogDerivative (valueAt w hT 0) 1 s =
      ∫ r in 0..t, powerTangent (valueAt w hT r) s := by
  let ψ : ℝ → ℝ := fun r => ∫ y, logResolvent s y ∂(w.law r : Measure ℝ)
  let G : ℝ → ℝ := fun r => averagedGenerator (massAt B₀ r) (w.law r) (logResolvent s)
  have hψ : ∀ r ∈ Icc 0 t, ψ r - ψ 0 = ∫ u in 0..r, G u := by
    intro r hr
    simpa only [ψ, G, w.initial] using weakEquation_linearGrowth w
      (linearGrowthC2_logResolvent hs) (show r ∈ Icc 0 T from ⟨hr.1,hr.2.trans ht.2⟩)
  have he := exp_neg_mul_sub_eq_integral ht.1
    (intervalIntegrable_averagedGenerator_linearGrowth w (linearGrowthC2_logResolvent hs) ht) hψ
  rw [powerLogDerivative_valueAt w hT ht hs,
    powerLogDerivative_valueAt w hT ⟨le_rfl,hT⟩ hs]
  change B₀.val*Real.exp (-t)*ψ t - B₀.val*Real.exp (-(0 : ℝ))*ψ 0 = _
  calc
    _ = B₀.val*(Real.exp (-t)*ψ t-ψ 0) := by simp; ring
    _ = B₀.val*∫ r in 0..t, Real.exp (-r)*(G r-ψ r) := congrArg (B₀.val * ·) he
    _ = ∫ r in 0..t, B₀.val*(Real.exp (-r)*(G r-ψ r)) :=
      (intervalIntegral.integral_const_mul _ _).symm
    _ = _ := by
      apply intervalIntegral.integral_congr_ae
      apply Eventually.of_forall
      intro r hr
      have hrT : r ∈ Icc 0 T := by
        have hr' : r ∈ Ioc 0 t := by simpa only [uIoc_of_le ht.1] using hr
        exact ⟨hr'.1.le,hr'.2.trans ht.2⟩
      rw [valueAt_eq_value w hT hrT]
      have hG := averagedGenerator_value_resolvent (massAt B₀ r) (w.law r)
        (WeakLogRateSolution.integrable_sq w hrT) hs
      change G r = (powerTangent (WeakLogRateSolution.value w ⟨r,hrT⟩) s +
        (B₀.val*Real.exp (-r))*ψ r)/(B₀.val*Real.exp (-r)) at hG
      rw [hG]
      field_simp [ne_of_gt B₀.property]
      ring

end GGC.Identification
