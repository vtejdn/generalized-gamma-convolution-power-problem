import GGC.Identification.LogLaplaceEvolution
import GGC.DampedContinuity

/-! # The time weak equation for every positive Laplace test -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Identification

/-- The actual laws satisfy the value-space weak equation on all exponential
tests. The damped logarithmic moment is continuous in time and always finite. -/
theorem laplace_time_equation
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T)
    {t s : ℝ} (ht : t ∈ Icc 0 T) (hs : 0 < s) :
    laplace (valueAt w hT t) s - laplace (valueAt w hT 0) s =
      -(∫ r in 0..t, s*dampedLogMoment (valueAt w hT r) 0 s) := by
  let ψ : ℝ → ℝ := fun r => Real.log (laplace (valueAt w hT r) s)
  let G : ℝ → ℝ := fun r => -(s*tiltedXLog (valueAt w hT r) s)
  have hG : Continuous G :=
    ((continuous_tiltedXLog_of_narrow (valueAt w hT) (continuous_valueAt w hT) hs).const_mul s).neg
  have hψ : ∀ r ∈ Icc 0 t, ψ r - ψ 0 = ∫ u in 0..r, G u := by
    intro r hr
    have he := log_laplace_time_equation w hT (show r ∈ Icc 0 T from ⟨hr.1,hr.2.trans ht.2⟩) hs
    simpa only [ψ, G, intervalIntegral.integral_neg] using he
  have he := Analysis.exp_sub_eq_integral ht.1 hG hψ
  have hExp (r : ℝ) : Real.exp (ψ r) = laplace (valueAt w hT r) s :=
    Real.exp_log (laplace_pos _ hs.le)
  simp only [hExp] at he
  rw [he, ← intervalIntegral.integral_neg]
  apply intervalIntegral.integral_congr
  intro r _
  dsimp only [G, tiltedXLog]
  field_simp [ne_of_gt (laplace_pos (valueAt w hT r) hs.le)]

theorem continuous_laplace_time_integrand
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T) {s : ℝ} (hs : 0 < s) :
    Continuous (fun r => s*dampedLogMoment (valueAt w hT r) 0 s) :=
  (continuous_dampedLogMoment_of_narrow (valueAt w hT) (continuous_valueAt w hT) 0 hs).const_mul s

end GGC.Identification
