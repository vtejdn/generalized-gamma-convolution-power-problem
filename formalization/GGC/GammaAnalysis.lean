import GGC.FiniteGamma
import Mathlib.Analysis.SpecialFunctions.Gamma.Deriv
import Mathlib.Analysis.SpecialFunctions.Gamma.Digamma
import Mathlib.Probability.Distributions.Beta
import Mathlib.Analysis.Complex.CauchyIntegral
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics

/-! # Gamma and beta analytic conventions

The laws below use actual mathlib densities. The real digamma is the
logarithmic derivative of the real gamma function. No logarithmic moment
formula is made an external assumption.
-/

noncomputable section
open MeasureTheory Set Filter Topology Asymptotics

namespace GGC

/-- The real logarithmic derivative, using mathlib's generic convention. -/
def digamma (s : ℝ) : ℝ := logDeriv Real.Gamma s

theorem digamma_apply (s : ℝ) : digamma s = deriv Real.Gamma s / Real.Gamma s := rfl

/-- Compatibility with mathlib's complex digamma on the positive real axis. -/
theorem digamma_eq_re_complex {s : ℝ} (hs : 0 < s) :
    digamma s = (Complex.digamma (s : ℂ)).re := by
  have hc : DifferentiableAt ℂ Complex.Gamma (s : ℂ) :=
    Complex.differentiableAt_Gamma _ (by
      intro m hm
      have hr := congrArg Complex.re hm
      simp only [Complex.ofReal_re, Complex.neg_re, Complex.natCast_re] at hr
      linarith [Nat.cast_nonneg (α := ℝ) m])
  have he : (fun x : ℝ => Complex.Gamma (x : ℂ)) = fun x => (Real.Gamma x : ℂ) :=
    funext Complex.Gamma_ofReal
  have hd : deriv Complex.Gamma (s : ℂ) = ((deriv Real.Gamma s : ℝ) : ℂ) := by
    rw [← hc.hasDerivAt.comp_ofReal.deriv, he]
    exact (hc.hasDerivAt.real_of_complex.differentiableAt.hasDerivAt.ofReal_comp).deriv
  rw [Complex.digamma, logDeriv_apply, hd, Complex.Gamma_ofReal, ← Complex.ofReal_div]
  rfl

def betaLaw (a b : PosReal) : ProbabilityMeasure ℝ :=
  ⟨ProbabilityTheory.betaMeasure a.val b.val,
    ProbabilityTheory.isProbabilityMeasureBeta a.property b.property⟩

private theorem integrableOn_complex_gamma_log {s : ℂ} (hs : 0 < s.re) :
    IntegrableOn (fun t : ℝ => (t : ℂ)^(s - 1) *
      ((Real.log t : ℂ) * (Real.exp (-t) : ℂ))) (Ioi 0) := by
  convert! (mellin_hasDerivAt_of_isBigO_rpow (E := ℂ)
    (f := fun t => (Real.exp (-t) : ℂ)) (a := s.re + 1) (b := 0)
    ?_ ?_ (lt_add_one _) ?_ hs).1 using 1
  · refine (Continuous.continuousOn ?_).locallyIntegrableOn measurableSet_Ioi
    exact Complex.continuous_ofReal.comp (Real.continuous_exp.comp continuous_neg)
  · rw [← isBigO_norm_left]
    simp_rw [Complex.norm_real, isBigO_norm_left]
    simpa only [neg_one_mul] using
      (isLittleO_exp_neg_mul_rpow_atTop zero_lt_one _).isBigO
  · simp_rw [neg_zero, Real.rpow_zero]
    refine isBigO_const_of_tendsto
      (?_ : Tendsto _ _ (𝓝 (1 : ℂ))) one_ne_zero
    rw [(by simp : (1 : ℂ) = (Real.exp (-0) : ℝ))]
    exact (Complex.continuous_ofReal.comp
      (Real.continuous_exp.comp continuous_neg)).continuousWithinAt

private theorem complex_gamma_log_kernel_real {s t : ℝ} (ht : 0 < t) :
    (t : ℂ)^((s : ℂ) - 1) * ((Real.log t : ℂ) * (Real.exp (-t) : ℂ)) =
      ((t ^ (s - 1) * (Real.log t * Real.exp (-t)) : ℝ) : ℂ) := by
  rw [← Complex.ofReal_one, ← Complex.ofReal_sub, ← Complex.ofReal_cpow ht.le]
  push_cast
  rfl

/-- Absolute integrability of the differentiated gamma integral for every positive shape. -/
theorem integrableOn_gamma_log_kernel {s : ℝ} (hs : 0 < s) :
    IntegrableOn (fun t : ℝ => t ^ (s - 1) * (Real.log t * Real.exp (-t))) (Ioi 0) := by
  have h : IntegrableOn (fun t : ℝ =>
      ((t : ℂ)^((s : ℂ) - 1) * ((Real.log t : ℂ) * (Real.exp (-t) : ℂ))).re) (Ioi 0) :=
    (integrableOn_complex_gamma_log (s := (s : ℂ)) (by simpa using hs)).re
  apply h.congr_fun _ measurableSet_Ioi
  intro t ht
  dsimp only
  rw [complex_gamma_log_kernel_real (s := s) ht]
  rfl

/-- The real gamma derivative is the absolutely convergent logarithmic integral. -/
theorem hasDerivAt_Gamma_integral {s : ℝ} (hs : 0 < s) :
    HasDerivAt Real.Gamma
      (∫ t in Ioi 0, t ^ (s - 1) * (Real.log t * Real.exp (-t))) s := by
  have hc := Complex.hasDerivAt_GammaIntegral (s := (s : ℂ)) (by simpa using hs)
  have heq : Complex.Gamma =ᶠ[𝓝 (s : ℂ)] Complex.GammaIntegral := by
    filter_upwards [(isOpen_lt continuous_const Complex.continuous_re).mem_nhds
      (show (0 : ℝ) < (s : ℂ).re by simpa using hs)] with z hz
    exact Complex.Gamma_eq_integral hz
  have hreal := (hc.congr_of_eventuallyEq heq).real_of_complex
  have hi := integrableOn_complex_gamma_log (s := (s : ℂ)) (by simpa using hs)
  have hre := integral_re hi
  simp only [RCLike.re_to_complex] at hre
  rw [← hre] at hreal
  convert! hreal using 1
  apply setIntegral_congr_fun measurableSet_Ioi
  intro t ht
  dsimp only
  rw [complex_gamma_log_kernel_real (s := s) ht]
  rfl

theorem integral_gamma_log_kernel {s : ℝ} (hs : 0 < s) :
    (∫ t in Ioi 0, t ^ (s - 1) * (Real.log t * Real.exp (-t))) =
      Real.Gamma s * digamma s := by
  rw [← (hasDerivAt_Gamma_integral hs).deriv]
  rw [digamma_apply]
  field_simp [ne_of_gt (Real.Gamma_pos_of_pos hs)]

private theorem gammaPDF_mul_log (B x : ℝ) :
    ProbabilityTheory.gammaPDFReal B 1 x * Real.log x =
      (Ioi 0).indicator (fun t : ℝ => (1 / Real.Gamma B) *
        (t ^ (B - 1) * (Real.log t * Real.exp (-t)))) x := by
  rcases lt_trichotomy x 0 with hx | rfl | hx
  · simp [ProbabilityTheory.gammaPDFReal, not_le.mpr hx, not_lt.mpr hx.le]
  · simp [ProbabilityTheory.gammaPDFReal]
  · rw [indicator_of_mem (show x ∈ Ioi (0 : ℝ) from hx)]
    simp only [ProbabilityTheory.gammaPDFReal, if_pos hx.le, Real.one_rpow, one_mul]
    ring

private theorem gammaPDF_mul_self_log (B x : ℝ) :
    ProbabilityTheory.gammaPDFReal B 1 x * (x * Real.log x) =
      (Ioi 0).indicator (fun t : ℝ => (1 / Real.Gamma B) *
        (t ^ ((B + 1) - 1) * (Real.log t * Real.exp (-t)))) x := by
  rcases lt_trichotomy x 0 with hx | rfl | hx
  · simp [ProbabilityTheory.gammaPDFReal, not_le.mpr hx, not_lt.mpr hx.le]
  · simp [ProbabilityTheory.gammaPDFReal]
  · rw [indicator_of_mem (show x ∈ Ioi (0 : ℝ) from hx)]
    simp only [ProbabilityTheory.gammaPDFReal, if_pos hx.le, Real.one_rpow, one_mul,
      add_sub_cancel_right, Real.rpow_sub_one (ne_of_gt hx)]
    field_simp

private theorem integrable_gammaLaw_iff (B : PosReal) (f : ℝ → ℝ) :
    Integrable f ((gammaLaw B ⟨1, zero_lt_one⟩).law : Measure ℝ) ↔
      Integrable (fun x => ProbabilityTheory.gammaPDFReal B.val 1 x * f x) := by
  change Integrable f (volume.withDensity (fun x =>
    ENNReal.ofReal (ProbabilityTheory.gammaPDFReal B.val 1 x))) ↔ _
  rw [integrable_withDensity_iff_integrable_smul' (by fun_prop)
    (Filter.Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)]
  simp only [ENNReal.toReal_ofReal
    (ProbabilityTheory.gammaPDFReal_nonneg B.property zero_lt_one _), smul_eq_mul]

private theorem gammaPDF_mul_self (B x : ℝ) :
    ProbabilityTheory.gammaPDFReal B 1 x * x =
      (Ioi 0).indicator (fun t : ℝ => (1 / Real.Gamma B) *
        (t ^ ((B + 1) - 1) * Real.exp (-t))) x := by
  rcases lt_trichotomy x 0 with hx | rfl | hx
  · simp [ProbabilityTheory.gammaPDFReal, not_le.mpr hx, not_lt.mpr hx.le]
  · simp [ProbabilityTheory.gammaPDFReal]
  · rw [indicator_of_mem (show x ∈ Ioi (0 : ℝ) from hx)]
    simp only [ProbabilityTheory.gammaPDFReal, if_pos hx.le, Real.one_rpow, one_mul,
      add_sub_cancel_right, Real.rpow_sub_one (ne_of_gt hx)]
    field_simp

theorem integrable_self_gammaLaw (B : PosReal) :
    Integrable (fun x : ℝ => x) ((gammaLaw B ⟨1, zero_lt_one⟩).law : Measure ℝ) := by
  rw [integrable_gammaLaw_iff]
  simp_rw [gammaPDF_mul_self]
  apply (integrable_indicator_iff measurableSet_Ioi).2
  have h := (Real.GammaIntegral_convergent (show 0 < B.val + 1 by linarith [B.property])).const_mul
    (1 / Real.Gamma B.val)
  simpa only [mul_comm (Real.exp _)] using! h

theorem integral_self_gammaLaw (B : PosReal) :
    (∫ x : ℝ, x ∂((gammaLaw B ⟨1, zero_lt_one⟩).law : Measure ℝ)) = B.val := by
  rw [integral_gammaLaw _ _ _ (integrable_self_gammaLaw B)]
  simp_rw [gammaPDF_mul_self]
  rw [integral_indicator measurableSet_Ioi, integral_const_mul]
  have he : (∫ x in Ioi (0 : ℝ), x^((B.val+1)-1) * Real.exp (-x)) =
      Real.Gamma (B.val+1) := by
    rw [Real.Gamma_eq_integral (show 0 < B.val + 1 by linarith [B.property])]
    simp only [mul_comm (Real.exp _)]
  rw [he, Real.Gamma_add_one (ne_of_gt B.property)]
  field_simp [ne_of_gt (Real.Gamma_pos_of_pos B.property)]

/-- The unit-rate gamma logarithm is absolutely integrable. -/
theorem integrable_log_gammaLaw (B : PosReal) :
    Integrable Real.log ((gammaLaw B ⟨1, zero_lt_one⟩).law : Measure ℝ) := by
  rw [integrable_gammaLaw_iff]
  simp_rw [gammaPDF_mul_log]
  exact (integrable_indicator_iff measurableSet_Ioi).2
    ((integrableOn_gamma_log_kernel B.property).const_mul _)

/-- `G log G` is absolutely integrable for every positive shape, including shapes below one. -/
theorem integrable_self_mul_log_gammaLaw (B : PosReal) :
    Integrable (fun x => x * Real.log x)
      ((gammaLaw B ⟨1, zero_lt_one⟩).law : Measure ℝ) := by
  rw [integrable_gammaLaw_iff]
  simp_rw [gammaPDF_mul_self_log]
  exact (integrable_indicator_iff measurableSet_Ioi).2
    ((integrableOn_gamma_log_kernel (s := B.val + 1) (by linarith [B.property])).const_mul _)

theorem integral_log_gammaLaw (B : PosReal) :
    (∫ x, Real.log x ∂((gammaLaw B ⟨1, zero_lt_one⟩).law : Measure ℝ)) = digamma B.val := by
  rw [integral_gammaLaw _ _ _ (integrable_log_gammaLaw B)]
  simp_rw [gammaPDF_mul_log]
  rw [integral_indicator measurableSet_Ioi, integral_const_mul,
    integral_gamma_log_kernel B.property]
  field_simp [ne_of_gt (Real.Gamma_pos_of_pos B.property)]

/-- The tangent's gamma coefficient has the original mass parameter `B + 1`. -/
theorem integral_self_mul_log_gammaLaw (B : PosReal) :
    (∫ x, x * Real.log x ∂((gammaLaw B ⟨1, zero_lt_one⟩).law : Measure ℝ)) =
      B.val * digamma (B.val + 1) := by
  rw [integral_gammaLaw _ _ _ (integrable_self_mul_log_gammaLaw B)]
  simp_rw [gammaPDF_mul_self_log]
  rw [integral_indicator measurableSet_Ioi, integral_const_mul,
    integral_gamma_log_kernel (by linarith [B.property]),
    Real.Gamma_add_one (ne_of_gt B.property)]
  field_simp [ne_of_gt (Real.Gamma_pos_of_pos B.property)]

private theorem differentiableOn_complexGamma_rightHalfPlane :
    DifferentiableOn ℂ Complex.Gamma {z : ℂ | 0 < z.re} := by
  intro z hz
  apply (Complex.differentiableAt_Gamma z _).differentiableWithinAt
  intro m hm
  have hr := congrArg Complex.re hm
  simp only [Complex.neg_re, Complex.natCast_re] at hr
  have hm₀ : (0 : ℝ) ≤ m := Nat.cast_nonneg m
  change 0 < z.re at hz
  linarith

theorem continuousOn_deriv_Gamma : ContinuousOn (deriv Real.Gamma) (Ioi 0) := by
  have hcomplex := (differentiableOn_complexGamma_rightHalfPlane.deriv
    (isOpen_lt continuous_const Complex.continuous_re)).continuousOn
  have hc : ContinuousOn (fun s : ℝ => (deriv Complex.Gamma (s : ℂ)).re) (Ioi 0) :=
    Complex.continuous_re.comp_continuousOn
      (hcomplex.comp Complex.continuous_ofReal.continuousOn (fun _ hs => hs))
  apply hc.congr
  intro s hs
  have hd := differentiableOn_complexGamma_rightHalfPlane (s : ℂ) (show (s : ℂ) ∈
    {z : ℂ | 0 < z.re} from hs)
  have hda := hd.differentiableAt ((isOpen_lt continuous_const Complex.continuous_re).mem_nhds hs)
  exact hda.hasDerivAt.real_of_complex.deriv

theorem continuousOn_digamma : ContinuousOn digamma (Ioi 0) := by
  exact continuousOn_deriv_Gamma.div Real.differentiableOn_Gamma_Ioi.continuousOn
    (fun _ hs => ne_of_gt (Real.Gamma_pos_of_pos hs))

/-- Uniformity in the mass parameter is local on arbitrary compact positive intervals. -/
theorem digamma_boundedOn_Icc {a b : ℝ} (ha : 0 < a) :
    ∃ C : ℝ, ∀ s ∈ Icc a b, |digamma s| ≤ C := by
  simpa [Real.norm_eq_abs] using isCompact_Icc.exists_bound_of_continuousOn
    (continuousOn_digamma.mono (fun s hs => lt_of_lt_of_le ha hs.1))

private def powerLogPrimitive (B x : ℝ) : ℝ :=
  x ^ B / B^2 - x ^ B * Real.log x / B

private theorem hasDerivAt_powerLogPrimitive {B x : ℝ} (hB : 0 < B) (hx : 0 < x) :
    HasDerivAt (powerLogPrimitive B) (x ^ (B - 1) * (-Real.log x)) x := by
  have hpow := Real.hasDerivAt_rpow_const (x := x) (p := B) (Or.inl (ne_of_gt hx))
  convert! (hpow.div_const (B^2)).sub
    ((hpow.mul (Real.hasDerivAt_log (ne_of_gt hx))).div_const B) using 1
  rw [Real.rpow_sub_one (ne_of_gt hx)]
  field_simp
  ring

private theorem continuousOn_powerLogPrimitive {B : ℝ} (hB : 0 < B) :
    ContinuousOn (powerLogPrimitive B) (Icc 0 1) := by
  intro x hx
  rcases hx.1.eq_or_lt with rfl | hxpos
  · have hp : Tendsto (fun x : ℝ => x^B) (𝓝[>] 0) (𝓝 0) := by
      simpa [Real.zero_rpow (ne_of_gt hB)] using
        (Real.continuous_rpow_const hB.le).continuousAt.tendsto.mono_left
          (x := 𝓝 (0 : ℝ)) nhdsWithin_le_nhds
    have hl : Tendsto (fun x : ℝ => x^B * Real.log x) (𝓝[>] 0) (𝓝 0) := by
      simpa [mul_comm] using tendsto_log_mul_rpow_nhdsGT_zero hB
    have hc : ContinuousWithinAt (powerLogPrimitive B) (Ioi 0) 0 := by
      unfold ContinuousWithinAt powerLogPrimitive
      simpa only [Real.zero_rpow (ne_of_gt hB), zero_div, zero_mul, sub_zero]
        using (hp.div_const (B^2)).sub (hl.div_const B)
    exact (continuousWithinAt_Ioi_iff_Ici.mp hc).mono Icc_subset_Ici_self
  · have hc : ContinuousAt (powerLogPrimitive B) x := by
      unfold powerLogPrimitive
      fun_prop (disch := positivity)
    exact hc.continuousWithinAt

theorem integrableOn_rpow_neg_log {B : ℝ} (hB : 0 < B) :
    IntegrableOn (fun x : ℝ => x^(B - 1) * (-Real.log x)) (Ioo 0 1) := by
  apply (intervalIntegral.integrableOn_deriv_of_nonneg (continuousOn_powerLogPrimitive hB)
    (fun x hx => hasDerivAt_powerLogPrimitive hB hx.1) ?_).mono_set Ioo_subset_Ioc_self
  intro x hx
  exact mul_nonneg (Real.rpow_nonneg hx.1.le _) (neg_nonneg.mpr (Real.log_nonpos hx.1.le hx.2.le))

theorem integral_rpow_neg_log {B : ℝ} (hB : 0 < B) :
    (∫ x in Ioo 0 1, x^(B - 1) * (-Real.log x)) = 1 / B^2 := by
  have h := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le zero_le_one
    (continuousOn_powerLogPrimitive hB) (fun x hx => hasDerivAt_powerLogPrimitive hB hx.1)
    ((intervalIntegrable_iff_integrableOn_Ioo_of_le zero_le_one).2 (integrableOn_rpow_neg_log hB))
  simpa [intervalIntegral.integral_of_le zero_le_one, integral_Ioc_eq_integral_Ioo,
    powerLogPrimitive, Real.zero_rpow (ne_of_gt hB)] using h

/-- Gamma's negative logarithmic moment has the precise bound used for endpoint control. -/
theorem integral_neg_log_gammaLaw_le (B : PosReal) :
    (∫ x, max (-Real.log x) 0 ∂((gammaLaw B ⟨1, zero_lt_one⟩).law : Measure ℝ)) ≤
      1 / (Real.Gamma B.val * B.val^2) := by
  have hi := (integrable_log_gammaLaw B).neg_part
  rw [integral_gammaLaw _ _ _ hi]
  let majorant : ℝ → ℝ := (Ioo 0 1).indicator
    (fun x => (1 / Real.Gamma B.val) * (x^(B.val - 1) * (-Real.log x)))
  have him : Integrable majorant := (integrable_indicator_iff measurableSet_Ioo).2
    ((integrableOn_rpow_neg_log B.property).const_mul _)
  have hbound : ∀ x, ProbabilityTheory.gammaPDFReal B.val 1 x * max (-Real.log x) 0 ≤ majorant x := by
    intro x
    rcases lt_trichotomy x 0 with hx | rfl | hx
    · simp [ProbabilityTheory.gammaPDFReal, majorant, not_le.mpr hx, not_lt.mpr hx.le]
    · simp [majorant, ProbabilityTheory.gammaPDFReal]
    · by_cases hx₁ : x < 1
      · rw [show majorant x = (1 / Real.Gamma B.val) *
            (x^(B.val - 1) * (-Real.log x)) from
              indicator_of_mem (show x ∈ Ioo (0 : ℝ) 1 from ⟨hx, hx₁⟩) _]
        rw [max_eq_left (neg_nonneg.mpr (Real.log_nonpos hx.le hx₁.le))]
        simp only [ProbabilityTheory.gammaPDFReal, if_pos hx.le, Real.one_rpow, one_mul]
        have he : Real.exp (-x) ≤ 1 := Real.exp_le_one_iff.mpr (by linarith)
        have hG : 0 < Real.Gamma B.val := Real.Gamma_pos_of_pos B.property
        have hn : 0 ≤ (1 / Real.Gamma B.val) * x^(B.val - 1) * (-Real.log x) := by
          apply mul_nonneg (by positivity)
          exact neg_nonneg.mpr (Real.log_nonpos hx.le hx₁.le)
        nlinarith [mul_le_mul_of_nonneg_left he hn]
      · have hl := Real.log_nonneg (le_of_not_gt hx₁)
        simp [majorant, not_lt.mpr (le_of_not_gt hx₁), max_eq_right (by linarith : -Real.log x ≤ 0)]
  calc _ ≤ ∫ x, majorant x := integral_mono ((integrable_gammaLaw_iff B _).mp hi) him hbound
    _ = _ := by
      rw [show majorant = _ from rfl, integral_indicator measurableSet_Ioo, integral_const_mul,
        integral_rpow_neg_log B.property]
      simp [div_eq_mul_inv, mul_comm]

theorem continuousOn_gammaNegativeLogBound :
    ContinuousOn (fun B : ℝ => 1 / (Real.Gamma B * B^2)) (Ioi 0) := by
  apply continuousOn_const.div
    (Real.differentiableOn_Gamma_Ioi.continuousOn.mul (continuousOn_id.pow 2))
  intro B hB
  exact mul_ne_zero (ne_of_gt (Real.Gamma_pos_of_pos hB)) (pow_ne_zero 2 (ne_of_gt hB))

theorem gammaNegativeLogBound_boundedOn_Icc {a b : ℝ} (ha : 0 < a) :
    ∃ C : ℝ, ∀ B ∈ Icc a b, |1 / (Real.Gamma B * B^2)| ≤ C := by
  simpa [Real.norm_eq_abs] using isCompact_Icc.exists_bound_of_continuousOn
    (continuousOn_gammaNegativeLogBound.mono (fun B hB => lt_of_lt_of_le ha hB.1))

end GGC
