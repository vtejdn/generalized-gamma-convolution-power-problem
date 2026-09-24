import GGC.Laplace
import Mathlib.MeasureTheory.Measure.Tilted

/-! # Actual exponential tilting without moment assumptions -/

noncomputable section
open MeasureTheory
open scoped ENNReal

namespace GGC

def exponentialTilt (μ : NonnegLaw) (s : PosReal) : NonnegLaw where
  law := ⟨(μ.law : Measure ℝ).tilted (fun x => -s.val*x),
    isProbabilityMeasure_tilted (laplace_integrable μ s.property.le)⟩
  nonneg := by
    rw [ae_iff]
    exact tilted_absolutelyContinuous _ _ (ae_iff.mp μ.nonneg)

theorem exponentialTilt_eq_tilted (μ : NonnegLaw) (s : PosReal) :
    ((exponentialTilt μ s).law : Measure ℝ) =
      (μ.law : Measure ℝ).tilted (fun x => -s.val*x) := rfl

theorem exponentialTilt_toMeasure (μ : NonnegLaw) (s : PosReal) :
    ((exponentialTilt μ s).law : Measure ℝ) =
      (μ.law : Measure ℝ).withDensity (fun x => ENNReal.ofReal
        (Real.exp (-s.val*x) / laplace μ s.val)) := rfl

/-- The normalized density formula, valid even before asking that the test be integrable. -/
theorem integral_exponentialTilt (μ : NonnegLaw) (s : PosReal) (f : ℝ → ℝ) :
    (∫ x, f x ∂((exponentialTilt μ s).law : Measure ℝ)) =
      (∫ x, Real.exp (-s.val*x) * f x ∂(μ.law : Measure ℝ)) / laplace μ s.val := by
  rw [exponentialTilt_eq_tilted, integral_tilted]
  simp only [smul_eq_mul]
  simp_rw [div_mul_eq_mul_div]
  exact integral_div _ _

theorem laplace_exponentialTilt (μ : NonnegLaw) (s : PosReal) (t : ℝ) :
    laplace (exponentialTilt μ s) t = laplace μ (s.val + t) / laplace μ s.val := by
  change (∫ x, Real.exp (-t*x) ∂((exponentialTilt μ s).law : Measure ℝ)) = _
  rw [exponentialTilt_eq_tilted, integral_exp_tilted]
  have he : (fun x : ℝ => -s.val*x) + (fun x => -t*x) =
      (fun x => -(s.val+t)*x) := by funext x; simp only [Pi.add_apply]; ring
  rw [he]
  rfl

end GGC
