import GGC.Foundations.ApproximateIdentity
import Mathlib.Probability.Distributions.Cauchy

/-! # Almost-everywhere Poisson boundary recovery

The Cauchy density is mathlib's normalized upper-half-plane Poisson kernel.
The local approximate-identity proof applies to arbitrary bounded measurable
functions, including the zero extension of a phase on the positive half-line.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology NNReal
namespace GGC.Analysis

theorem cauchyPDFReal_affine (a : ℝ) {e : ℝ} (he : 0 < e) (u : ℝ) :
    cauchyPDFReal a ⟨e, he.le⟩ (a+e*u) = e⁻¹ * cauchyPDFReal 0 1 u := by
  simp only [cauchyPDFReal_def']
  change Real.pi⁻¹ * e⁻¹ * (1 + ((a+e*u-a)/e)^2)⁻¹ =
    e⁻¹ * (Real.pi⁻¹ * (1:ℝ)⁻¹ * (1+((u-0)/1)^2)⁻¹)
  simp only [add_sub_cancel_left, mul_div_cancel_left₀ _ he.ne',
    inv_one, mul_one, sub_zero, div_one]
  ring

theorem integral_cauchy_mul_eq_dilation (f : ℝ → ℝ) (a : ℝ) {e : ℝ} (he : 0 < e) :
    (∫ x, cauchyPDFReal a ⟨e, he.le⟩ x * f x) =
      ∫ u, cauchyPDFReal 0 1 u * f (a+e*u) := by
  have h := integral_affine (fun x => cauchyPDFReal a ⟨e, he.le⟩ x * f x) a he
  simp_rw [cauchyPDFReal_affine a he, mul_assoc] at h
  rw [integral_const_mul] at h
  exact (mul_left_cancel₀ (inv_ne_zero he.ne') h).symm

theorem cauchyPDFReal_standard_bound (u : ℝ) : |cauchyPDFReal 0 1 u| ≤ Real.pi⁻¹ := by
  rw [abs_of_pos (cauchyPDF_pos 0 one_ne_zero u)]
  simp only [cauchyPDFReal_def, NNReal.coe_one, mul_one, sub_zero, one_pow]
  apply mul_le_of_le_one_right (inv_pos.mpr Real.pi_pos).le
  exact inv_le_one_of_one_le₀ (by nlinarith [sq_nonneg u])

theorem ae_tendsto_cauchy_integral {f : ℝ → ℝ} (hf : Measurable f)
    {C : ℝ} (hC : ∀ x, |f x| ≤ C) {e : ℕ → ℝ}
    (he : ∀ n, 0 < e n) (he0 : Tendsto e atTop (𝓝 0)) :
    ∀ᵐ a ∂volume, Tendsto (fun n => ∫ x, cauchyPDFReal a ⟨e n, (he n).le⟩ x * f x)
      atTop (𝓝 (f a)) := by
  have h := ae_tendsto_dilation_integral hf (integrable_cauchyPDFReal (x₀ := 0) (γ := 1))
    (integral_cauchyPDFReal_eq_one 0 one_ne_zero) hC cauchyPDFReal_standard_bound he he0
  simpa only [integral_cauchy_mul_eq_dilation _ _ (he _)] using h

theorem ae_tendsto_halfLine_cauchy_integral {η : ℝ → ℝ} (hm : Measurable η)
    (hb : ∀ t, 0 ≤ η t ∧ η t ≤ 1) {e : ℕ → ℝ}
    (he : ∀ n, 0 < e n) (he0 : Tendsto e atTop (𝓝 0)) :
    ∀ᵐ t ∂volume.restrict (Ioi 0),
      Tendsto (fun n => ∫ u in Ioi 0, cauchyPDFReal t ⟨e n, (he n).le⟩ u * η u)
        atTop (𝓝 (η t)) := by
  let f := (Ioi (0:ℝ)).indicator η
  have hf : Measurable f := hm.indicator measurableSet_Ioi
  have hb' (x : ℝ) : |f x| ≤ 1 := by
    by_cases hx : x ∈ Ioi (0:ℝ)
    · simpa [f, hx, abs_of_nonneg (hb x).1] using (hb x).2
    · simp [f, hx]
  have h := ae_tendsto_cauchy_integral hf hb' he he0
  filter_upwards [ae_restrict_of_ae h, self_mem_ae_restrict measurableSet_Ioi] with t ht htp
  have hi (n : ℕ) :
      (∫ x, cauchyPDFReal t ⟨e n, (he n).le⟩ x * f x) =
      ∫ x in Ioi 0, cauchyPDFReal t ⟨e n, (he n).le⟩ x * η x := by
    rw [← integral_indicator measurableSet_Ioi]
    congr 1
    funext x
    by_cases hx : x ∈ Ioi (0:ℝ) <;> simp [f, hx]
  simpa only [hi, f, indicator_of_mem htp] using ht

end GGC.Analysis
