import GGC.Identification.LaplaceEndpoint
import Mathlib.Probability.Kernel.MeasurableIntegral
import Mathlib.Probability.Kernel.Composition.MapComap

/-! # Joint Borel measurability of the actual value-law tangent -/

noncomputable section
open MeasureTheory Set
namespace GGC.Identification

theorem measurable_dampedMoment (μ : NonnegLaw) (n : ℕ) : Measurable (dampedMoment μ n) := by
  have hm : Measurable (fun p : ℝ × ℝ => p.2^n * Real.exp (-p.1*p.2)) := by fun_prop
  exact hm.stronglyMeasurable.integral_prod_right.measurable

theorem measurable_dampedLogMoment (μ : NonnegLaw) (n : ℕ) : Measurable (dampedLogMoment μ n) := by
  have hm : Measurable (fun p : ℝ × ℝ => p.2^(n+1)*Real.log p.2*Real.exp (-p.1*p.2)) := by fun_prop
  exact hm.stronglyMeasurable.integral_prod_right.measurable

theorem measurable_laplace (μ : NonnegLaw) : Measurable (laplace μ) := by
  have he : dampedMoment μ 0 = laplace μ := funext (dampedMoment_zero μ)
  rw [← he]
  exact measurable_dampedMoment μ 0

theorem measurable_tiltedXLog (μ : NonnegLaw) : Measurable (tiltedXLog μ) :=
  (measurable_dampedLogMoment μ 0).div (measurable_laplace μ)

theorem measurable_dampedMoment_value {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (n : ℕ) :
    Measurable (fun p : Icc (0 : ℝ) T × ℝ => dampedMoment (WeakLogRateSolution.value w p.1) n p.2) := by
  let κ : ProbabilityTheory.Kernel (Icc (0 : ℝ) T × ℝ) ℝ :=
    (valueKernel w).comap Prod.fst measurable_fst
  have hm : Measurable (fun p : (Icc (0 : ℝ) T × ℝ) × ℝ =>
      p.2^n*Real.exp (-p.1.2*p.2)) := by fun_prop
  exact (hm.stronglyMeasurable.integral_kernel_prod_right' (κ := κ)).measurable

theorem measurable_dampedLogMoment_value {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (n : ℕ) :
    Measurable (fun p : Icc (0 : ℝ) T × ℝ => dampedLogMoment (WeakLogRateSolution.value w p.1) n p.2) := by
  let κ : ProbabilityTheory.Kernel (Icc (0 : ℝ) T × ℝ) ℝ :=
    (valueKernel w).comap Prod.fst measurable_fst
  have hm : Measurable (fun p : (Icc (0 : ℝ) T × ℝ) × ℝ =>
      p.2^(n+1)*Real.log p.2*Real.exp (-p.1.2*p.2)) := by fun_prop
  exact (hm.stronglyMeasurable.integral_kernel_prod_right' (κ := κ)).measurable

theorem measurable_laplace_value {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) :
    Measurable (fun p : Icc (0 : ℝ) T × ℝ => laplace (WeakLogRateSolution.value w p.1) p.2) := by
  simpa only [dampedMoment_zero] using measurable_dampedMoment_value w 0

theorem measurable_tiltedXLog_value {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) :
    Measurable (fun p : Icc (0 : ℝ) T × ℝ => tiltedXLog (WeakLogRateSolution.value w p.1) p.2) :=
  (measurable_dampedLogMoment_value w 0).div (measurable_laplace_value w)

theorem measurable_expandedPowerTangent_value {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) :
    Measurable (fun p : Icc (0 : ℝ) T × ℝ =>
      tiltedXLog (WeakLogRateSolution.value w p.1) p.2 -
        p.2*dampedLogMoment (WeakLogRateSolution.value w p.1) 1 p.2 /
          laplace (WeakLogRateSolution.value w p.1) p.2 +
        p.2*dampedMoment (WeakLogRateSolution.value w p.1) 1 p.2 *
          dampedLogMoment (WeakLogRateSolution.value w p.1) 0 p.2 /
            (laplace (WeakLogRateSolution.value w p.1) p.2)^2) :=
    ((measurable_tiltedXLog_value w).sub
      ((measurable_snd.mul (measurable_dampedLogMoment_value w 1)).div (measurable_laplace_value w))).add
      (((measurable_snd.mul (measurable_dampedMoment_value w 1)).mul
        (measurable_dampedLogMoment_value w 0)).div ((measurable_laplace_value w).pow_const 2))

theorem measurable_powerTangent_value {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) :
    Measurable (fun p : Icc (0 : ℝ) T × PosReal => powerTangent (WeakLogRateSolution.value w p.1) p.2.val) := by
  convert! (measurable_expandedPowerTangent_value w).comp
    (measurable_fst.prodMk (measurable_subtype_coe.comp measurable_snd)) using 1
  ext p
  exact powerTangent_eq_expanded _ p.2.property

end GGC.Identification
