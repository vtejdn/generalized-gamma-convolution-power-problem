import GGC.Identification.ResolventEvolution

/-! # Normalize the resolvent time equation at the zero Laplace endpoint -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Identification

theorem hasDerivAt_log_laplace (μ : NonnegLaw) {s : ℝ} (hs : 0 < s) :
    HasDerivAt (fun r => Real.log (laplace μ r)) (-powerLogDerivative μ 1 s) s := by
  have h := hasDerivAt_log_powerLaplace_s μ 1 hs
  have hd : deriv (fun r => Real.log (powerLaplace μ 1 r)) s =
      -powerLogDerivative μ 1 s := by simp only [powerLogDerivative, neg_neg]
  rw [← hd, h.deriv]
  simpa only [powerLaplace_one] using h

theorem tendsto_log_laplace_zero (μ : NonnegLaw) :
    Tendsto (fun s => Real.log (laplace μ s)) (𝓝[>] (0 : ℝ)) (𝓝 0) := by
  have h := (Real.continuousAt_log (show (1 : ℝ) ≠ 0 by norm_num)).tendsto.comp
    (tendsto_laplace_zero μ)
  simpa only [Real.log_one, Function.comp_def] using h

theorem log_laplace_time_equation
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T)
    {t s : ℝ} (ht : t ∈ Icc 0 T) (hs : 0 < s) :
    Real.log (laplace (valueAt w hT t) s) - Real.log (laplace (valueAt w hT 0) s) =
      -(∫ r in 0..t, s*tiltedXLog (valueAt w hT r) s) := by
  let f : ℝ → ℝ := fun z => Real.log (laplace (valueAt w hT t) z) -
    Real.log (laplace (valueAt w hT 0) z)
  let H : ℝ → ℝ := fun z => -(∫ r, powerTangent (WeakLogRateSolution.value w r) z ∂timeUpTo T t)
  have hd (z : ℝ) (hz : 0 < z) : HasDerivAt f (H z) z := by
    have h := (hasDerivAt_log_laplace (valueAt w hT t) hz).sub
      (hasDerivAt_log_laplace (valueAt w hT 0) hz)
    convert! h using 1
    dsimp only [H]
    rw [integral_timeUpTo hT ht]
    change -(∫ r in 0..t, powerTangent (valueAt w hT r) z) = _
    rw [← resolvent_time_equation w hT ht hz]
    ring
  have hi : IntervalIntegrable H volume 0 s :=
    (intervalIntegrable_iff_integrableOn_Ioc_of_le hs.le).mpr
      (integrable_valueTangent_prod w (timeUpTo T t) hs).integral_prod_right.neg
  have hz : Tendsto f (𝓝[>] (0 : ℝ)) (𝓝 0) := by
    simpa only [sub_self] using (tendsto_log_laplace_zero (valueAt w hT t)).sub
      (tendsto_log_laplace_zero (valueAt w hT 0))
  have he := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_tendsto hs
    (fun z (hz : z ∈ Ioo 0 s) => hd z hz.1) hi hz
    ((hd s hs).continuousAt.tendsto.mono_left nhdsWithin_le_nhds)
  rw [sub_zero] at he
  change f s = _
  rw [← he, intervalIntegral.integral_of_le hs.le]
  change (∫ z in Ioc 0 s, -(∫ r, powerTangent (WeakLogRateSolution.value w r) z ∂timeUpTo T t)) = _
  rw [integral_neg, integral_valueTangent_swap_zero_endpoint w (timeUpTo T t) hs,
    integral_timeUpTo hT ht]
  rfl

end GGC.Identification
