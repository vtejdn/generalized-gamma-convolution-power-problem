import GGC.LogRate.Kernel

/-!
# Deterministic cancellation in the direct log-generator calculation

These identities do not assume a Dirichlet representation, a tangent formula,
or moment bounds on a log-rate law. Integration and the stochastic resolvent
identity are separate proof obligations.
-/

noncomputable section

open MeasureTheory Set Filter Topology

namespace GGC.LogRate

/-- Pointwise cancellation before either term is integrated. The common
`b / (s+b)^2` factor is retained on the complete right-hand side. -/
theorem resolvent_cancellation {s b u : ℝ} (hs : 0 < s) (hb : 0 < b)
    (hu : 0 < u) (hu₁ : u ≠ 1) :
    ((s + b * u)⁻¹ - (s + b)⁻¹ + b * Real.log u / (s + b) ^ 2) / (u - 1) ^ 2
      - b / (s + b) ^ 2 * correctionKernel u =
    b / (s + b) ^ 2 * (b / (s + b * u) - 1 / (1 + u)) := by
  rw [correctionKernel, if_neg hu₁]
  have h₁ : s + b ≠ 0 := by positivity
  have h₂ : s + b * u ≠ 0 := by positivity
  have h₃ : 1 + u ≠ 0 := by positivity
  have h₄ : u - 1 ≠ 0 := sub_ne_zero.mpr hu₁
  field_simp
  ring

private theorem hasDerivAt_logRatio {r u : ℝ} (hr : 0 < r) (hu : 0 ≤ u) :
    HasDerivAt (fun x : ℝ => Real.log (r + x) - Real.log (1 + x))
      (1 / (r + u) - 1 / (1 + u)) u := by
  convert! ((((hasDerivAt_id u).const_add r).log (by positivity)).sub
    (((hasDerivAt_id u).const_add 1).log (by positivity))) using 1

private theorem tendsto_logRatio (r : ℝ) :
    Tendsto (fun u : ℝ => Real.log (r + u) - Real.log (1 + u)) atTop (𝓝 0) := by
  have h := (Real.tendsto_log_comp_add_sub_log r).sub
    (Real.tendsto_log_comp_add_sub_log 1)
  convert h using 1 <;> simp [add_comm]

/-- The resolvent bracket is integrable on the full positive half-line.
The two reciprocal functions need not be integrated separately. -/
theorem integrableOn_resolventBracket {r : ℝ} (hr : 0 < r) :
    IntegrableOn (fun u : ℝ => 1 / (r + u) - 1 / (1 + u)) (Ioi 0) := by
  by_cases hr₁ : r ≤ 1
  · apply integrableOn_Ioi_deriv_of_nonneg' (fun u hu => hasDerivAt_logRatio hr hu)
      _ (tendsto_logRatio r)
    intro u hu
    have hu' : 0 < u := hu
    exact sub_nonneg.mpr (one_div_le_one_div_of_le (by positivity) (by linarith))
  · apply integrableOn_Ioi_deriv_of_nonpos' (fun u hu => hasDerivAt_logRatio hr hu)
      _ (tendsto_logRatio r)
    intro u hu
    have hu' : 0 < u := hu
    exact sub_nonpos.mpr (one_div_le_one_div_of_le (by positivity) (by linarith))

theorem integral_resolventBracket {r : ℝ} (hr : 0 < r) :
    (∫ u in Ioi 0, (1 / (r + u) - 1 / (1 + u))) = -Real.log r := by
  have h := integral_Ioi_of_hasDerivAt_of_tendsto'
    (fun u hu => hasDerivAt_logRatio hr hu) (integrableOn_resolventBracket hr)
    (tendsto_logRatio r)
  simpa using h

theorem integral_abs_resolventBracket {r : ℝ} (hr : 0 < r) :
    (∫ u in Ioi 0, |1 / (r + u) - 1 / (1 + u)|) = |Real.log r| := by
  by_cases hr₁ : r ≤ 1
  · rw [abs_of_nonpos (Real.log_nonpos hr.le hr₁), ← integral_resolventBracket hr]
    apply setIntegral_congr_fun measurableSet_Ioi
    intro u hu
    have hu' : 0 < u := hu
    apply abs_of_nonneg
    exact sub_nonneg.mpr (one_div_le_one_div_of_le (by positivity) (by linarith))
  · rw [abs_of_nonneg (Real.log_nonneg (by linarith))]
    calc _ = ∫ u in Ioi 0, -(1 / (r + u) - 1 / (1 + u)) := by
           apply setIntegral_congr_fun measurableSet_Ioi
           intro u hu
           have hu' : 0 < u := hu
           apply abs_of_nonpos
           exact sub_nonpos.mpr (one_div_le_one_div_of_le (by positivity) (by linarith))
      _ = _ := by rw [integral_neg, integral_resolventBracket hr, neg_neg]

theorem scaled_resolventBracket_eq {s b u : ℝ} (hb : 0 < b) :
    b / (s + b * u) - 1 / (1 + u) = 1 / (s / b + u) - 1 / (1 + u) := by
  congr 1
  rw [show s / b + u = (s + b * u) / b by field_simp, one_div_div]

theorem integrableOn_scaled_resolventBracket {s b : ℝ} (hs : 0 < s) (hb : 0 < b) :
    IntegrableOn (fun u : ℝ => b / (s + b * u) - 1 / (1 + u)) (Ioi 0) := by
  simp_rw [scaled_resolventBracket_eq hb]
  exact integrableOn_resolventBracket (div_pos hs hb)

/-- The absolute bound required before the signed Palm/Fubini step. -/
theorem integral_abs_scaled_resolventBracket {s b : ℝ} (hs : 0 < s) (hb : 0 < b) :
    (∫ u in Ioi 0, |b / (s + b * u) - 1 / (1 + u)|) = |Real.log (s / b)| := by
  simp_rw [scaled_resolventBracket_eq hb]
  exact integral_abs_resolventBracket (div_pos hs hb)

/-- Absolute integrability of the entire compensated jump term in rate ratio
coordinates. This is proved before splitting the cancellation into integrals. -/
theorem integrableOn_compensated_resolvent {s b : ℝ} (hs : 0 < s) (hb : 0 < b) :
    IntegrableOn (fun u : ℝ =>
      ((s + b * u)⁻¹ - (s + b)⁻¹ + b * Real.log u / (s + b)^2) / (u - 1)^2)
      (Ioi 0) := by
  have hi := ((integrableOn_scaled_resolventBracket hs hb).const_mul (b / (s + b)^2)).add
    (integrableOn_correctionKernel.const_mul (b / (s + b)^2))
  apply hi.congr
  have hne : ∀ᵐ u : ℝ ∂volume.restrict (Ioi 0), u ≠ 1 := by
    apply ae_restrict_of_ae
    rw [ae_iff]
    simp
  filter_upwards [ae_restrict_mem measurableSet_Ioi, hne] with u hu h₁
  have hc := resolvent_cancellation hs hb hu h₁
  exact (sub_eq_iff_eq_add.mp hc).symm

end GGC.LogRate
