import GGC.Identification.BackwardTests
import GGC.Foundations.PartitionCancellation
import GGC.Foundations.CompactSmoothTests
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus

/-! # Uniqueness of the weak dilation transport equation

Fixed compact tests imply the exact increment identity for backward tests.
Partition cancellation then identifies every endpoint pairing. No derivative
of the probability-valued curve, or time-dependent weak equation, is assumed.
-/

noncomputable section
open MeasureTheory Set
namespace GGC.Identification
open GGC.Analysis

theorem transport_pairing_eq {T : ℝ} (hT : 0 ≤ T)
    (laws : ℝ → ProbabilityMeasure ℝ) (hlaws : Continuous laws)
    (hweak : ∀ φ : ℝ → ℝ, ContDiff ℝ 1 φ → HasCompactSupport φ →
      ∀ t ∈ Icc 0 T,
        (∫ z, φ z ∂(laws t : Measure ℝ)) - (∫ z, φ z ∂(laws 0 : Measure ℝ)) =
          ∫ r in 0..t, ∫ z, z*deriv φ z ∂(laws r : Measure ℝ))
    {ζ : ℝ → ℝ} (hζ : ContDiff ℝ 1 ζ) (hs : HasCompactSupport ζ) :
    (∫ z, ζ z ∂(laws T : Measure ℝ)) =
      ∫ z, ζ (Real.exp T*z) ∂(laws 0 : Measure ℝ) := by
  let Q (r u : ℝ) := ∫ z, backwardTest T ζ u z ∂(laws r : Measure ℝ)
  let P (p : ℝ × ℝ) := ∫ z, backwardDerivative T ζ p.2 z ∂(laws p.1 : Measure ℝ)
  have hP : Continuous P := continuous_backward_pairing T laws hlaws hζ hs
  have hleft (b : ℝ) : Continuous (fun r => P (b,r)) :=
    hP.comp (continuous_const.prodMk continuous_id)
  have hright (a : ℝ) : Continuous (fun r => P (r,a)) :=
    hP.comp (continuous_id.prodMk continuous_const)
  have htime (a b : ℝ) : Q b b-Q b a = ∫ r in a..b, P (b,r) := by
    exact (intervalIntegral.integral_eq_sub_of_hasDerivAt
      (fun r _ => hasDerivAt_integral_backwardTest T (laws b) hζ hs r)
      ((hleft b).intervalIntegrable a b)).symm
  have hfrozen (a r : ℝ) (hr : r ∈ Icc 0 T) :
      Q r a-Q 0 a = -(∫ u in 0..r, P (u,a)) := by
    have he := hweak (backwardTest T ζ a) (contDiff_backwardTest T hζ a)
      (hasCompactSupport_backwardTest T hs a) r hr
    have hg (u : ℝ) :
        (∫ z, z*deriv (backwardTest T ζ a) z ∂(laws u : Measure ℝ)) = -P (u,a) := by
      simp only [backwardTest_transport_identity T hζ, integral_neg, P]
    simpa only [hg, intervalIntegral.integral_neg] using he
  have hend : Q T T=Q 0 0 := by
    apply eq_endpoints_of_partition_cancellation (f := fun r => Q r r) hT hP.continuousOn
    intro a ha b hb _hab
    have hsub : Q b a-Q a a = -(∫ r in a..b, P (r,a)) := by
      have he := intervalIntegral.integral_interval_sub_left (μ := volume)
        ((hright a).intervalIntegrable 0 b) ((hright a).intervalIntegrable 0 a)
      linarith [hfrozen a a ha, hfrozen a b hb]
    rw [intervalIntegral.integral_sub ((hleft b).intervalIntegrable a b)
      ((hright a).intervalIntegrable a b)]
    linarith [htime a b]
  simpa only [Q, backwardTest, sub_self, Real.exp_zero, one_mul, sub_zero] using hend

/-- A narrowly continuous probability-valued weak solution is the actual
dilation pushforward of its initial law. -/
theorem transport_law_eq_map {T : ℝ} (hT : 0 ≤ T)
    (laws : ℝ → ProbabilityMeasure ℝ) (hlaws : Continuous laws)
    (hweak : ∀ φ : ℝ → ℝ, ContDiff ℝ 1 φ → HasCompactSupport φ →
      ∀ t ∈ Icc 0 T,
        (∫ z, φ z ∂(laws t : Measure ℝ)) - (∫ z, φ z ∂(laws 0 : Measure ℝ)) =
          ∫ r in 0..t, ∫ z, z*deriv φ z ∂(laws r : Measure ℝ)) :
    laws T = (laws 0).map (show Measurable (fun z : ℝ => Real.exp T*z) by fun_prop).aemeasurable := by
  apply ProbabilityMeasure.toMeasure_injective
  apply measure_eq_of_integral_compactC2_eq
  intro φ hφ hs
  change (∫ z, φ z ∂(laws T : Measure ℝ)) =
    ∫ z, φ z ∂Measure.map (fun z : ℝ => Real.exp T*z) (laws 0 : Measure ℝ)
  rw [integral_map (by fun_prop) hφ.continuous.measurable.aestronglyMeasurable]
  exact transport_pairing_eq hT laws hlaws hweak (hφ.of_le (by norm_num)) hs

end GGC.Identification
