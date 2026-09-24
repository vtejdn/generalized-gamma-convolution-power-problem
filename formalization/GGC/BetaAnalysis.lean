import GGC.GammaAnalysis
import Mathlib.Analysis.SpecialFunctions.Integrability.Basic

/-! # The beta logarithmic moment

Differentiate an actual beta integral through its Mellin transform. Endpoint
integrability is part of the proof, rather than an extra literature assumption.
-/

noncomputable section
open MeasureTheory Set Filter Topology Asymptotics

namespace GGC

private def betaTail (B : ℝ) : ℝ → ℂ :=
  (Ioo 0 1).indicator (fun x : ℝ => ((1 - x) ^ (B - 1) : ℝ))

private theorem integrable_betaTail {B : ℝ} (hB : 0 < B) : Integrable (betaTail B) := by
  have hr : IntervalIntegrable (fun x : ℝ => x^(B - 1)) volume 0 1 :=
    intervalIntegral.intervalIntegrable_rpow' (by linarith)
  have ht : IntervalIntegrable (fun x : ℝ => (1 - x)^(B - 1)) volume 0 1 := by
    simpa using (hr.comp_sub_left 1).symm
  have hi : IntegrableOn (fun x : ℝ => (1 - x)^(B - 1)) (Ioo 0 1) :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le zero_le_one).mp ht
  exact (integrable_indicator_iff measurableSet_Ioo).2 hi.ofReal

private theorem betaTail_at_zero (B : ℝ) : Tendsto (betaTail B) (𝓝[>] 0) (𝓝 1) := by
  have hc : ContinuousAt (fun x : ℝ => (((1 - x)^(B - 1) : ℝ) : ℂ)) 0 := by
    fun_prop (disch := norm_num)
  apply (show Tendsto (fun x : ℝ => (((1 - x)^(B - 1) : ℝ) : ℂ))
    (𝓝[>] 0) (𝓝 1) by simpa using hc.tendsto.mono_left nhdsWithin_le_nhds).congr'
  filter_upwards [eventually_mem_nhdsWithin,
    (eventually_lt_nhds zero_lt_one).filter_mono nhdsWithin_le_nhds] with x hx hx₁
  change _ = (Ioo (0 : ℝ) 1).indicator (fun x : ℝ => (((1 - x)^(B - 1) : ℝ) : ℂ)) x
  rw [indicator_of_mem (show x ∈ Ioo (0 : ℝ) 1 from ⟨hx, hx₁⟩)]

private theorem betaTail_isBigO_atTop (B a : ℝ) :
    betaTail B =O[atTop] (fun x : ℝ => x^(-a)) := by
  apply Asymptotics.IsBigO.of_bound 0
  filter_upwards [eventually_ge_atTop (1 : ℝ)] with x hx
  simp [betaTail, not_lt.mpr hx]

private theorem betaTail_mellin_deriv {B : ℝ} (hB : 0 < B) :
    MellinConvergent (fun t => Real.log t • betaTail B t) (1 : ℂ) ∧
      HasDerivAt (mellin (betaTail B))
        (mellin (fun t => Real.log t • betaTail B t) 1) 1 := by
  apply mellin_hasDerivAt_of_isBigO_rpow (a := 2) (b := 0)
    ((integrable_betaTail hB).locallyIntegrable.locallyIntegrableOn _)
    (betaTail_isBigO_atTop B 2) (by norm_num)
    _ (by norm_num)
  simpa using isBigO_const_of_tendsto (betaTail_at_zero B) (one_ne_zero : (1 : ℂ) ≠ 0)

private theorem mellin_betaTail (B : ℝ) (s : ℂ) :
    mellin (betaTail B) s = Complex.betaIntegral s B := by
  have heq : ∀ t : ℝ, (t : ℂ)^(s - 1) • betaTail B t =
      (Ioo 0 1).indicator (fun t : ℝ =>
        (t : ℂ)^(s - 1) * (1 - (t : ℂ))^((B : ℂ) - 1)) t := by
    intro t
    by_cases ht : t ∈ Ioo (0 : ℝ) 1
    · rw [betaTail, indicator_of_mem ht, indicator_of_mem ht]
      simp only [smul_eq_mul]
      rw [Complex.ofReal_cpow (by linarith [ht.2] : 0 ≤ 1 - t)]
      push_cast
      rfl
    · simp [betaTail, indicator_of_notMem ht]
  simp_rw [mellin, heq]
  rw [integral_indicator measurableSet_Ioo, Measure.restrict_restrict measurableSet_Ioo,
    inter_eq_left.mpr Ioo_subset_Ioi_self, Complex.betaIntegral,
    intervalIntegral.integral_of_le zero_le_one, integral_Ioc_eq_integral_Ioo]

private theorem integrable_betaTail_log {B : ℝ} (hB : 0 < B) :
    IntegrableOn (fun t : ℝ => Real.log t * (1 - t)^(B - 1)) (Ioo 0 1) := by
  have hm := (betaTail_mellin_deriv hB).1
  simp only [MellinConvergent, sub_self, Complex.cpow_zero, one_smul] at hm
  have hr : IntegrableOn (fun t => (Real.log t • betaTail B t).re) (Ioi 0) := hm.re
  apply (hr.mono_set Ioo_subset_Ioi_self).congr_fun _ measurableSet_Ioo
  intro t ht
  simp [betaTail, indicator_of_mem ht]

private theorem betaTail_mellin_log_re (B : ℝ) :
    (mellin (fun t => Real.log t • betaTail B t) (1 : ℂ)).re =
      ∫ t in Ioo 0 1, Real.log t * (1 - t)^(B - 1) := by
  have heq : (fun t => Real.log t • betaTail B t) =
      (Ioo 0 1).indicator (fun t : ℝ =>
        ((Real.log t * (1 - t)^(B - 1) : ℝ) : ℂ)) := by
    funext t
    by_cases ht : t ∈ Ioo (0 : ℝ) 1
    · simp [betaTail, indicator_of_mem ht, Complex.real_smul]
    · simp [betaTail, indicator_of_notMem ht]
  simp only [mellin, sub_self, Complex.cpow_zero, one_smul, heq]
  rw [integral_indicator measurableSet_Ioo, Measure.restrict_restrict measurableSet_Ioo,
    inter_eq_left.mpr Ioo_subset_Ioi_self, integral_complex_ofReal]
  rfl

private theorem hasDerivAt_beta_one {B : ℝ} (hB : 0 < B) :
    HasDerivAt (fun a : ℝ => ProbabilityTheory.beta a B)
      (ProbabilityTheory.beta 1 B * (digamma 1 - digamma (1 + B))) 1 := by
  have h₁ := (hasDerivAt_Gamma_integral (s := 1) zero_lt_one).differentiableAt.hasDerivAt
  have h₂ := (hasDerivAt_Gamma_integral (s := 1 + B) (by linarith)).differentiableAt.hasDerivAt
  have hc : HasDerivAt (fun a : ℝ => Real.Gamma (a + B)) (deriv Real.Gamma (1 + B)) 1 := by
    simpa only [Function.comp_def, mul_one] using! h₂.comp 1 ((hasDerivAt_id 1).add_const B)
  have hG : Real.Gamma (1 + B) ≠ 0 := ne_of_gt (Real.Gamma_pos_of_pos (by linarith))
  convert! (h₁.mul_const (Real.Gamma B)).div hc hG using 1
  simp only [ProbabilityTheory.beta, digamma_apply, Real.Gamma_one, one_mul, div_one]
  field_simp

/-- The differentiated beta kernel is absolutely integrable at both endpoints. -/
theorem integrableOn_beta_log_kernel {B : ℝ} (hB : 0 < B) :
    IntegrableOn (fun t : ℝ => Real.log t * (1 - t)^(B - 1)) (Ioo 0 1) :=
  integrable_betaTail_log hB

theorem integral_beta_log_kernel {B : ℝ} (hB : 0 < B) :
    (∫ t in Ioo 0 1, Real.log t * (1 - t)^(B - 1)) =
      ProbabilityTheory.beta 1 B * (digamma 1 - digamma (1 + B)) := by
  have hm : HasDerivAt (fun a : ℝ => (mellin (betaTail B) (a : ℂ)).re)
      (mellin (fun t => Real.log t • betaTail B t) 1).re 1 :=
    (betaTail_mellin_deriv hB).2.real_of_complex
  rw [betaTail_mellin_log_re] at hm
  have heq : (fun a : ℝ => ProbabilityTheory.beta a B) =ᶠ[𝓝 1]
      (fun a : ℝ => (mellin (betaTail B) (a : ℂ)).re) := by
    filter_upwards [eventually_gt_nhds (show (0 : ℝ) < 1 by norm_num)] with a ha
    rw [mellin_betaTail, ProbabilityTheory.beta_eq_betaIntegralReal a B ha hB]
  exact (hm.congr_of_eventuallyEq heq).unique (hasDerivAt_beta_one hB)

private theorem betaPDFReal_nonneg (B : PosReal) (x : ℝ) :
    0 ≤ ProbabilityTheory.betaPDFReal 1 B.val x := by
  by_cases hx : 0 < x ∧ x < 1
  · exact (ProbabilityTheory.betaPDFReal_pos hx.1 hx.2 zero_lt_one B.property).le
  · simp [ProbabilityTheory.betaPDFReal, hx]

private theorem betaPDF_mul_neg_log (B x : ℝ) :
    ProbabilityTheory.betaPDFReal 1 B x * (-Real.log x) =
      (Ioo 0 1).indicator (fun t : ℝ => -(1 / ProbabilityTheory.beta 1 B) *
        (Real.log t * (1 - t)^(B - 1))) x := by
  by_cases hx : x ∈ Ioo (0 : ℝ) 1
  · rw [indicator_of_mem hx]
    change 0 < x ∧ x < 1 at hx
    simp only [ProbabilityTheory.betaPDFReal, if_pos hx, sub_self, Real.rpow_zero, mul_one]
    ring
  · rw [indicator_of_notMem hx]
    change ¬(0 < x ∧ x < 1) at hx
    simp [ProbabilityTheory.betaPDFReal, hx]

/-- Absolute integrability for the actual `Beta(1,B)` law, without a lower bound on B. -/
theorem integrable_neg_log_betaLaw (B : PosReal) :
    Integrable (fun x : ℝ => -Real.log x) (betaLaw ⟨1, zero_lt_one⟩ B : Measure ℝ) := by
  change Integrable _ (volume.withDensity (fun x =>
    ENNReal.ofReal (ProbabilityTheory.betaPDFReal 1 B.val x)))
  rw [integrable_withDensity_iff_integrable_smul' (by fun_prop)
    (Filter.Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)]
  simp only [ENNReal.toReal_ofReal (betaPDFReal_nonneg B _), smul_eq_mul]
  simp_rw [betaPDF_mul_neg_log]
  exact (integrable_indicator_iff measurableSet_Ioo).2
    ((integrableOn_beta_log_kernel B.property).const_mul _)

/-- The posterior beta logarithm uses the original mass B, hence ψ(B+1). -/
theorem integral_neg_log_betaLaw (B : PosReal) :
    (∫ x, -Real.log x ∂(betaLaw ⟨1, zero_lt_one⟩ B : Measure ℝ)) =
      digamma (B.val + 1) - digamma 1 := by
  change (∫ x, -Real.log x ∂volume.withDensity (fun x =>
    ENNReal.ofReal (ProbabilityTheory.betaPDFReal 1 B.val x))) = _
  rw [integral_withDensity_eq_integral_toReal_smul (by fun_prop)
    (Filter.Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)]
  simp only [ENNReal.toReal_ofReal (betaPDFReal_nonneg B _), smul_eq_mul]
  simp_rw [betaPDF_mul_neg_log]
  rw [integral_indicator measurableSet_Ioo, integral_const_mul, integral_beta_log_kernel B.property]
  have hb : ProbabilityTheory.beta 1 B.val ≠ 0 :=
    ne_of_gt (ProbabilityTheory.beta_pos zero_lt_one B.property)
  rw [add_comm B.val 1]
  field_simp
  ring

theorem continuousOn_betaNegativeLogMoment :
    ContinuousOn (fun B : ℝ => digamma (B + 1) - digamma 1) (Ioi 0) := by
  apply ContinuousOn.sub _ continuousOn_const
  exact continuousOn_digamma.comp (continuous_id.add continuous_const).continuousOn
    (fun B hB => by change 0 < B + 1; have hp : 0 < B := hB; linarith)

theorem betaNegativeLogMoment_boundedOn_Icc {a b : ℝ} (ha : 0 < a) :
    ∃ C : ℝ, ∀ B ∈ Icc a b, |digamma (B + 1) - digamma 1| ≤ C := by
  simpa [Real.norm_eq_abs] using isCompact_Icc.exists_bound_of_continuousOn
    (continuousOn_betaNegativeLogMoment.mono (fun B hB => lt_of_lt_of_le ha hB.1))

end GGC
