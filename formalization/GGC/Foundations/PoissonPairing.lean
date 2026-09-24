import GGC.Foundations.L1Translation
import GGC.Foundations.PoissonBoundary
import Mathlib.MeasureTheory.Integral.Prod

/-! # Uniform error bounds for pairing with Poisson-smoothed bounded functions

The error depends only on the L¹ test function and the smoothing height.
This uniformity is the bridge to weak convergence of bounded boundary phases.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Filter Set
open scoped Topology
namespace GGC.Analysis

def cauchyTranslationError (f : ℝ → ℝ) (e : ℝ) : ℝ :=
  ∫ v : ℝ, cauchyPDFReal 0 1 v * ∫ x : ℝ, |f (-e*v+x)-f x|

theorem cauchyTranslationError_nonneg (f : ℝ → ℝ) (e : ℝ) :
    0 ≤ cauchyTranslationError f e :=
  integral_nonneg fun v => mul_nonneg (cauchyPDF_pos 0 one_ne_zero v).le
    (integral_nonneg fun _ => abs_nonneg _)

theorem integrable_cauchyTranslationError {f : ℝ → ℝ} (hf : Integrable f) (e : ℝ) :
    Integrable (fun v : ℝ => cauchyPDFReal 0 1 v * ∫ x : ℝ, |f (-e*v+x)-f x|) := by
  apply (integrable_cauchyPDFReal 0 (γ := 1)).mul_bdd
    ((continuous_integral_abs_translate_sub hf).comp (continuous_const.mul continuous_id)).measurable.aestronglyMeasurable
    (c := 2*∫ x, |f x|)
  exact Eventually.of_forall fun v => by
    change ‖∫ x : ℝ, |f (-e*v+x)-f x|‖ ≤ 2*∫ x, |f x|
    rw [Real.norm_eq_abs, abs_of_nonneg (integral_nonneg fun _ => abs_nonneg _)]
    exact integral_abs_translate_sub_le hf _

theorem cauchyTranslationError_tendsto_zero {f : ℝ → ℝ} (hf : Integrable f)
    {e : ℕ → ℝ} (he : Tendsto e atTop (𝓝 0)) :
    Tendsto (fun n => cauchyTranslationError f (e n)) atTop (𝓝 0) := by
  have hlim (v : ℝ) : Tendsto (fun n => ∫ x : ℝ, |f (-e n*v+x)-f x|) atTop (𝓝 0) :=
    (tendsto_integral_abs_translate_sub_zero hf).comp (by simpa using he.neg.mul_const v)
  have ht := tendsto_integral_of_dominated_convergence
    (F := fun n v => cauchyPDFReal 0 1 v * ∫ x : ℝ, |f (-e n*v+x)-f x|)
    (f := fun _ : ℝ => 0) (fun v => cauchyPDFReal 0 1 v * (2*∫ x, |f x|))
    (fun n => (integrable_cauchyTranslationError hf (e n)).aestronglyMeasurable)
    ((integrable_cauchyPDFReal 0 (γ := 1)).mul_const _) (fun n => ?_) (Eventually.of_forall fun v => ?_)
  · simpa only [cauchyTranslationError, integral_zero] using ht
  · exact Eventually.of_forall fun v => by
      rw [Real.norm_eq_abs, abs_mul, abs_of_pos (cauchyPDF_pos 0 one_ne_zero v),
        abs_of_nonneg (integral_nonneg fun _ => abs_nonneg _)]
      exact mul_le_mul_of_nonneg_left (integral_abs_translate_sub_le hf _) (cauchyPDF_pos 0 one_ne_zero v).le
  · simpa only [mul_zero] using (hlim v).const_mul (cauchyPDFReal 0 1 v)

theorem integral_pairing_shift (f η : ℝ → ℝ) (a : ℝ) :
    (∫ x : ℝ, f x * η (x+a)) = ∫ x : ℝ, f (-a+x) * η x := by
  have h := integral_add_right_eq_self (μ := (volume : Measure ℝ))
    (fun x : ℝ => f (-a+x)*η x) a
  have he (x : ℝ) : -a+(x+a) = x := by ring
  simpa only [he] using h

theorem abs_integral_pairing_shift_sub_le {f η : ℝ → ℝ} (hf : Integrable f)
    (hη : Measurable η) (hη₀ : ∀ x, 0 ≤ η x) (hη₁ : ∀ x, η x ≤ 1) (a : ℝ) :
    |(∫ x : ℝ, f x * η (x+a)) - ∫ x : ℝ, f x * η x| ≤
      ∫ x : ℝ, |f (-a+x)-f x| := by
  have hnorm : ∀ᵐ x : ℝ, ‖η x‖ ≤ 1 := Eventually.of_forall fun x => by
    rw [Real.norm_eq_abs, abs_of_nonneg (hη₀ x)]
    exact hη₁ x
  have hi : Integrable (fun x => f (-a+x)) :=
    (measurePreserving_add_left volume (-a)).integrable_comp_of_integrable hf
  rw [integral_pairing_shift, ← integral_sub (hi.mul_bdd hη.aestronglyMeasurable hnorm)
    (hf.mul_bdd hη.aestronglyMeasurable hnorm)]
  calc
    _ ≤ ∫ x : ℝ, |f (-a+x)*η x-f x*η x| := abs_integral_le_integral_abs
    _ ≤ _ := by
      apply integral_mono ((hi.mul_bdd hη.aestronglyMeasurable hnorm).sub
        (hf.mul_bdd hη.aestronglyMeasurable hnorm)).abs (hi.sub hf).abs
      intro x
      change |f (-a+x)*η x-f x*η x| ≤ |f (-a+x)-f x|
      rw [← sub_mul, abs_mul, abs_of_nonneg (hη₀ x)]
      exact mul_le_of_le_one_right (abs_nonneg _) (hη₁ x)

theorem integrable_poisson_pairing_product {f η : ℝ → ℝ} (hf : Integrable f)
    (hη : Measurable η) (hη₀ : ∀ x, 0 ≤ η x) (hη₁ : ∀ x, η x ≤ 1) (e : ℝ) :
    Integrable (fun x : ℝ × ℝ => f x.1 * cauchyPDFReal 0 1 x.2 * η (x.1+e*x.2))
      (volume.prod volume) := by
  have hm : Measurable (fun x : ℝ × ℝ => η (x.1+e*x.2)) :=
    hη.comp (measurable_fst.add (measurable_snd.const_mul e))
  apply (hf.mul_prod (integrable_cauchyPDFReal 0 (γ := 1))).mul_bdd hm.aestronglyMeasurable (c := 1)
  exact Eventually.of_forall fun x => by
    rw [Real.norm_eq_abs, abs_of_nonneg (hη₀ _)]
    exact hη₁ _

theorem poisson_pairing_fubini {f η : ℝ → ℝ} (hf : Integrable f)
    (hη : Measurable η) (hη₀ : ∀ x, 0 ≤ η x) (hη₁ : ∀ x, η x ≤ 1) (e : ℝ) :
    (∫ x : ℝ, f x * ∫ v : ℝ, cauchyPDFReal 0 1 v * η (x+e*v)) =
      ∫ v : ℝ, cauchyPDFReal 0 1 v * ∫ x : ℝ, f x * η (x+e*v) := by
  calc
    _ = ∫ x : ℝ, ∫ v : ℝ, f x * cauchyPDFReal 0 1 v * η (x+e*v) := by
      simp_rw [mul_assoc, integral_const_mul]
    _ = ∫ v : ℝ, ∫ x : ℝ, f x * cauchyPDFReal 0 1 v * η (x+e*v) :=
      integral_integral_swap (integrable_poisson_pairing_product hf hη hη₀ hη₁ e)
    _ = _ := by
      have he (x v : ℝ) : f x * cauchyPDFReal 0 1 v * η (x+e*v) =
          cauchyPDFReal 0 1 v * (f x * η (x+e*v)) := by ring
      simp_rw [he, integral_const_mul]

theorem integrable_poisson_pairing_outer {f η : ℝ → ℝ} (hf : Integrable f)
    (hη : Measurable η) (hη₀ : ∀ x, 0 ≤ η x) (hη₁ : ∀ x, η x ≤ 1) (e : ℝ) :
    Integrable (fun v : ℝ => cauchyPDFReal 0 1 v * ∫ x : ℝ, f x * η (x+e*v)) := by
  have h := (integrable_poisson_pairing_product hf hη hη₀ hη₁ e).integral_prod_right
  have he (x v : ℝ) : f x * cauchyPDFReal 0 1 v * η (x+e*v) =
      cauchyPDFReal 0 1 v * (f x * η (x+e*v)) := by ring
  simpa only [he, integral_const_mul] using h

theorem abs_poisson_pairing_sub_le {f η : ℝ → ℝ} (hf : Integrable f)
    (hη : Measurable η) (hη₀ : ∀ x, 0 ≤ η x) (hη₁ : ∀ x, η x ≤ 1) (e : ℝ) :
    |(∫ x : ℝ, f x * ∫ v : ℝ, cauchyPDFReal 0 1 v * η (x+e*v)) -
      ∫ x : ℝ, f x * η x| ≤ cauchyTranslationError f e := by
  have hi := integrable_poisson_pairing_outer hf hη hη₀ hη₁ e
  have hc := (integrable_cauchyPDFReal 0 (γ := 1)).mul_const (∫ x : ℝ, f x*η x)
  have he : (∫ v : ℝ, cauchyPDFReal 0 1 v * ∫ x : ℝ, f x*η x) = ∫ x : ℝ, f x*η x := by
    rw [integral_mul_const, integral_cauchyPDFReal_eq_one 0 one_ne_zero, one_mul]
  rw [poisson_pairing_fubini hf hη hη₀ hη₁ e, ← he, ← integral_sub hi hc]
  calc
    _ ≤ ∫ v : ℝ, |cauchyPDFReal 0 1 v * (∫ x : ℝ, f x*η (x+e*v)) -
      cauchyPDFReal 0 1 v * (∫ x : ℝ, f x*η x)| := abs_integral_le_integral_abs
    _ ≤ _ := by
      apply integral_mono (hi.sub hc).abs (integrable_cauchyTranslationError hf e)
      intro v
      change |cauchyPDFReal 0 1 v * (∫ x : ℝ, f x*η (x+e*v)) -
        cauchyPDFReal 0 1 v * (∫ x : ℝ, f x*η x)| ≤
          cauchyPDFReal 0 1 v * (∫ x : ℝ, |f (-e*v+x)-f x|)
      rw [← mul_sub, abs_mul, abs_of_pos (cauchyPDF_pos 0 one_ne_zero v)]
      have hb := abs_integral_pairing_shift_sub_le hf hη hη₀ hη₁ (e*v)
      simpa only [neg_mul] using mul_le_mul_of_nonneg_left hb (cauchyPDF_pos 0 one_ne_zero v).le

end GGC.Analysis
