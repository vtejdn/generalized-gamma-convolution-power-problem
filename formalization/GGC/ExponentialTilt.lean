import GGC.Laplace
import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap

/-! # Actual exponential tilting without moment assumptions -/

noncomputable section
open MeasureTheory
open scoped ENNReal

namespace GGC

def exponentialTilt (μ : NonnegLaw) (s : PosReal) : NonnegLaw where
  law := ⟨(μ.law : Measure ℝ).withDensity (fun x => ENNReal.ofReal
    (Real.exp (-s.val*x) / laplace μ s.val)), ⟨by
      rw [withDensity_apply _ MeasurableSet.univ, Measure.restrict_univ,
        ← ofReal_integral_eq_lintegral_ofReal
          ((laplace_integrable μ s.property.le).div_const _) (Filter.Eventually.of_forall
            (fun x => div_nonneg (Real.exp_pos _).le (laplace_pos μ s.property.le).le))]
      rw [integral_div]
      change ENNReal.ofReal (laplace μ s.val / laplace μ s.val) = 1
      simp [ne_of_gt (laplace_pos μ s.property.le)]⟩⟩
  nonneg := by
    rw [ae_iff]
    apply withDensity_absolutelyContinuous
    exact ae_iff.mp μ.nonneg

theorem exponentialTilt_toMeasure (μ : NonnegLaw) (s : PosReal) :
    ((exponentialTilt μ s).law : Measure ℝ) =
      (μ.law : Measure ℝ).withDensity (fun x => ENNReal.ofReal
        (Real.exp (-s.val*x) / laplace μ s.val)) := rfl

/-- The normalized density formula, valid even before asking that the test be integrable. -/
theorem integral_exponentialTilt (μ : NonnegLaw) (s : PosReal) (f : ℝ → ℝ) :
    (∫ x, f x ∂((exponentialTilt μ s).law : Measure ℝ)) =
      (∫ x, Real.exp (-s.val*x) * f x ∂(μ.law : Measure ℝ)) / laplace μ s.val := by
  rw [exponentialTilt_toMeasure,
    integral_withDensity_eq_integral_toReal_smul (by fun_prop)
      (Filter.Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)]
  simp only [ENNReal.toReal_ofReal (div_nonneg (Real.exp_pos _).le (laplace_pos μ s.property.le).le),
    smul_eq_mul]
  simp_rw [div_mul_eq_mul_div]
  exact integral_div _ _

theorem laplace_exponentialTilt (μ : NonnegLaw) (s : PosReal) (t : ℝ) :
    laplace (exponentialTilt μ s) t = laplace μ (s.val + t) / laplace μ s.val := by
  rw [laplace, integral_exponentialTilt]
  congr 1
  apply integral_congr_ae
  apply Filter.Eventually.of_forall
  intro x
  change Real.exp (-s.val*x) * Real.exp (-t*x) = Real.exp (-(s.val+t)*x)
  rw [← Real.exp_add]
  congr 1
  ring

end GGC
