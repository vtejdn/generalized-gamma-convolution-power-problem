import GGC.Identification.LaplaceEndpoint
import Mathlib.MeasureTheory.Integral.Prod

/-! # Absolute logarithmic Laplace kernels and their actual integrals -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Identification

/-- The two nonnegative kernels needed for the expanded tangent. -/
def absLogKernel (second : Bool) (s x : ℝ) : ℝ :=
  (if second then s*x^2 else x) * |Real.log x| * Real.exp (-s*x)

theorem absLogKernel_nonneg (second : Bool) {s x : ℝ} (hs : 0 ≤ s) (hx : 0 ≤ x) :
    0 ≤ absLogKernel second s x := by
  cases second <;> simp only [absLogKernel, Bool.false_eq_true, ↓reduceIte] <;> positivity

theorem measurable_absLogKernel (second : Bool) :
    Measurable (fun p : ℝ × ℝ => absLogKernel second p.1 p.2) := by
  cases second <;> unfold absLogKernel <;> simp only [Bool.false_eq_true, ↓reduceIte] <;> fun_prop

theorem integral_expRate {x : ℝ} (hx : 0 < x) :
    (∫ s : ℝ in Ioi 0, Real.exp (-s*x)) = 1/x := by
  have he : (fun s : ℝ => Real.exp (-s*x)) = fun s => Real.exp ((-x)*s) := by
    funext s
    congr 1
    ring
  rw [he, integral_exp_mul_Ioi (show -x < 0 by linarith) 0]
  simp

theorem integral_mul_expRate {x : ℝ} (hx : 0 < x) :
    (∫ s : ℝ in Ioi 0, s*Real.exp (-s*x)) = (1/x)^2 := by
  have h := Real.integral_rpow_mul_exp_neg_mul_Ioi (a := (2 : ℝ)) (by norm_num) hx
  norm_num only [show (2 : ℝ)-1 = 1 by norm_num, Real.rpow_one, Real.rpow_two,
    Real.Gamma_ofNat_eq_factorial, Nat.factorial_one, Nat.cast_one, mul_one] at h
  have he : (fun s : ℝ => s*Real.exp (-s*x)) = fun s => s*Real.exp (-(x*s)) := by
    funext s
    congr 2
    ring
  rw [he]
  exact h

theorem integrableOn_absLogKernel (second : Bool) {x : ℝ} (hx : 0 < x) :
    IntegrableOn (fun s => absLogKernel second s x) (Ioi 0) := by
  change Integrable (fun s => absLogKernel second s x) (volume.restrict (Ioi 0))
  cases second
  · have h : IntegrableOn (fun s : ℝ => Real.exp (-s*x)) (Ioi 0) :=
      Integrable.of_integral_ne_zero (by rw [integral_expRate hx]; positivity)
    simpa only [absLogKernel, Bool.false_eq_true, ↓reduceIte, mul_assoc] using!
      h.const_mul (x*|Real.log x|)
  · have h : IntegrableOn (fun s : ℝ => s*Real.exp (-s*x)) (Ioi 0) :=
      Integrable.of_integral_ne_zero (by rw [integral_mul_expRate hx]; positivity)
    convert! h.const_mul (x^2*|Real.log x|) using 1
    ext s
    simp only [absLogKernel, ↓reduceIte]
    ring

theorem integral_absLogKernel (second : Bool) {x : ℝ} (hx : 0 < x) :
    (∫ s : ℝ in Ioi 0, absLogKernel second s x) = |Real.log x| := by
  cases second
  · simp only [absLogKernel, Bool.false_eq_true, ↓reduceIte, integral_const_mul,
      integral_expRate hx]
    field_simp
  · have he : (fun s => absLogKernel true s x) =
        fun s => (x^2*|Real.log x|)*(s*Real.exp (-s*x)) := by
      funext s
      simp only [absLogKernel, ↓reduceIte]
      ring
    rw [he, integral_const_mul, integral_mul_expRate hx]
    field_simp

theorem integral_norm_absLogKernel (second : Bool) {x : ℝ} (hx : 0 < x) :
    (∫ s : ℝ in Ioi 0, ‖absLogKernel second s x‖) = |Real.log x| := by
  rw [← integral_absLogKernel second hx]
  apply setIntegral_congr_fun measurableSet_Ioi
  intro s hs
  exact Real.norm_of_nonneg (absLogKernel_nonneg second hs.le hx.le)

theorem integrable_absLogKernel_prod (second : Bool) (μ : NonnegLaw)
    (hp : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) :
    Integrable (fun p : ℝ × ℝ => absLogKernel second p.1 p.2)
      ((volume.restrict (Ioi 0)).prod (μ.law : Measure ℝ)) := by
  apply (integrable_prod_iff' (measurable_absLogKernel second).aestronglyMeasurable).mpr
  refine ⟨hp.mono fun _ hx => integrableOn_absLogKernel second hx, ?_⟩
  exact hi.abs.congr (hp.mono fun _ hx => (integral_norm_absLogKernel second hx).symm)

theorem integrable_integral_absLogKernel (second : Bool) (μ : NonnegLaw)
    (hp : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) :
    IntegrableOn (fun s => ∫ x, absLogKernel second s x ∂(μ.law : Measure ℝ)) (Ioi 0) :=
  (integrable_absLogKernel_prod second μ hp hi).integral_prod_left

theorem integral_integral_absLogKernel (second : Bool) (μ : NonnegLaw)
    (hp : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) :
    (∫ s : ℝ in Ioi 0, ∫ x, absLogKernel second s x ∂(μ.law : Measure ℝ)) =
      ∫ x, |Real.log x| ∂(μ.law : Measure ℝ) := by
  rw [integral_integral_swap (integrable_absLogKernel_prod second μ hp hi)]
  exact integral_congr_ae (hp.mono fun _ hx => integral_absLogKernel second hx)

end GGC.Identification
