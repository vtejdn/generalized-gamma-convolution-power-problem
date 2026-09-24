import GGC.Identification.AbsoluteLaplaceKernels
import GGC.Identification.TangentMeasurability

/-! # Absolute integrability of every term of the current-law tangent -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Identification

theorem integral_absLogKernel_nonneg (second : Bool) (μ : NonnegLaw) {s : ℝ} (hs : 0 ≤ s) :
    0 ≤ ∫ x, absLogKernel second s x ∂(μ.law : Measure ℝ) :=
  integral_nonneg_of_ae (μ.nonneg.mono fun _ hx => absLogKernel_nonneg second hs hx)

theorem abs_dampedLogMoment_zero_le (μ : NonnegLaw) {s : ℝ} (_hs : 0 ≤ s) :
    |dampedLogMoment μ 0 s| ≤ ∫ x, absLogKernel false s x ∂(μ.law : Measure ℝ) := by
  calc
    _ ≤ ∫ x, |x*Real.log x*Real.exp (-s*x)| ∂(μ.law : Measure ℝ) := by
      simpa only [dampedLogMoment, zero_add, pow_one] using
        (abs_integral_le_integral_abs (f := fun x => x*Real.log x*Real.exp (-s*x))
          (μ := (μ.law : Measure ℝ)))
    _ = _ := integral_congr_ae (μ.nonneg.mono fun x hx => by
      simp only [absLogKernel, Bool.false_eq_true, ↓reduceIte, abs_mul, abs_of_nonneg hx,
        abs_of_pos (Real.exp_pos _)])

theorem abs_mul_dampedLogMoment_one_le (μ : NonnegLaw) {s : ℝ} (hs : 0 ≤ s) :
    |s*dampedLogMoment μ 1 s| ≤ ∫ x, absLogKernel true s x ∂(μ.law : Measure ℝ) := by
  calc
    _ = |∫ x, s*(x^2*Real.log x*Real.exp (-s*x)) ∂(μ.law : Measure ℝ)| := by
      simp only [dampedLogMoment, Nat.reduceAdd, integral_const_mul]
    _ ≤ ∫ x, |s*(x^2*Real.log x*Real.exp (-s*x))| ∂(μ.law : Measure ℝ) :=
      abs_integral_le_integral_abs
    _ = _ := integral_congr_ae (Eventually.of_forall fun x => by
      simp only [absLogKernel, ↓reduceIte, abs_mul, abs_of_nonneg hs,
        abs_of_nonneg (sq_nonneg x), abs_of_pos (Real.exp_pos _)]
      ring)

theorem mul_dampedMoment_one_nonneg (μ : NonnegLaw) {s : ℝ} (hs : 0 ≤ s) :
    0 ≤ s*dampedMoment μ 1 s := by
  apply mul_nonneg hs
  exact integral_nonneg_of_ae (μ.nonneg.mono fun x hx => by
    simpa only [pow_one, Pi.zero_apply] using! mul_nonneg hx (Real.exp_pos (-s*x)).le)

theorem mul_dampedMoment_one_le (μ : NonnegLaw) {s : ℝ} (hs : 0 < s) :
    s*dampedMoment μ 1 s ≤ Real.exp (-1) := by
  calc
    _ = ∫ x, s*(x*Real.exp (-s*x)) ∂(μ.law : Measure ℝ) := by
      simp only [dampedMoment, pow_one, integral_const_mul]
    _ ≤ ∫ _ : ℝ, Real.exp (-1) ∂(μ.law : Measure ℝ) := by
      have hi : Integrable (fun x : ℝ => s*(x*Real.exp (-s*x))) (μ.law : Measure ℝ) := by
        simpa only [pow_one] using! (integrable_damped_pow μ 1 hs).const_mul s
      apply integral_mono hi (integrable_const _)
      intro x
      simpa only [← mul_assoc, neg_mul] using Real.mul_exp_neg_le_exp_neg_one (s*x)
    _ = _ := by simp

theorem integrableOn_of_absLogKernel_bound (second : Bool) (μ : NonnegLaw)
    (hp : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) {f : ℝ → ℝ} {s₀ c : ℝ}
    (hf : Measurable f) (hc : 0 ≤ c)
    (hb : ∀ s ∈ Ioc 0 s₀, |f s| ≤ c*(∫ x, absLogKernel second s x ∂(μ.law : Measure ℝ))) :
    IntegrableOn f (Ioc 0 s₀) ∧
      (∫ s in Ioc 0 s₀, |f s|) ≤ c*(∫ x, |Real.log x| ∂(μ.law : Measure ℝ)) := by
  have hk := integrable_integral_absLogKernel second μ hp hi
  have hsub : Ioc (0 : ℝ) s₀ ⊆ Ioi 0 := Ioc_subset_Ioi_self
  have hfI : IntegrableOn f (Ioc 0 s₀) := by
    apply ((hk.mono_set hsub).const_mul c).mono' hf.aestronglyMeasurable
    filter_upwards [ae_restrict_mem measurableSet_Ioc] with s hs
    simpa only [Real.norm_eq_abs] using hb s hs
  refine ⟨hfI, ?_⟩
  calc
    _ ≤ ∫ s in Ioc 0 s₀, c*(∫ x, absLogKernel second s x ∂(μ.law : Measure ℝ)) := by
      apply integral_mono_ae hfI.abs ((hk.mono_set hsub).const_mul c)
      exact (ae_restrict_mem measurableSet_Ioc).mono fun s hs => hb s hs
    _ = c*(∫ s in Ioc 0 s₀, ∫ x, absLogKernel second s x ∂(μ.law : Measure ℝ)) := integral_const_mul _ _
    _ ≤ c*(∫ s in Ioi 0, ∫ x, absLogKernel second s x ∂(μ.law : Measure ℝ)) := by
      apply mul_le_mul_of_nonneg_left _ hc
      exact setIntegral_mono_set hk
        ((ae_restrict_mem measurableSet_Ioi).mono fun s hs => integral_absLogKernel_nonneg second μ hs.le)
        (Eventually.of_forall fun s hs => hsub hs)
    _ = _ := by rw [integral_integral_absLogKernel second μ hp hi]

theorem integrableOn_tiltedXLog_bound (μ : NonnegLaw)
    (hp : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) {s₀ D : ℝ}
    (hD : 0 < D) (hL : ∀ s ∈ Ioc 0 s₀, D ≤ laplace μ s) :
    IntegrableOn (tiltedXLog μ) (Ioc 0 s₀) ∧
      (∫ s in Ioc 0 s₀, |tiltedXLog μ s|) ≤ (∫ x, |Real.log x| ∂(μ.law : Measure ℝ))/D := by
  have h := integrableOn_of_absLogKernel_bound false μ hp hi
    (measurable_tiltedXLog μ) (s₀ := s₀) (c := 1/D) (by positivity) (by
      intro s hs
      rw [tiltedXLog, abs_div, abs_of_pos (laplace_pos μ hs.1.le)]
      calc
        _ ≤ (∫ x, absLogKernel false s x ∂(μ.law : Measure ℝ))/laplace μ s :=
          div_le_div_of_nonneg_right (abs_dampedLogMoment_zero_le μ hs.1.le) (laplace_pos μ hs.1.le).le
        _ ≤ (∫ x, absLogKernel false s x ∂(μ.law : Measure ℝ))/D :=
          div_le_div_of_nonneg_left (integral_absLogKernel_nonneg false μ hs.1.le) hD (hL s hs)
        _ = _ := by ring)
  simpa only [one_div, inv_mul_eq_div] using h

theorem integrableOn_secondTangentTerm_bound (μ : NonnegLaw)
    (hp : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) {s₀ D : ℝ}
    (hD : 0 < D) (hL : ∀ s ∈ Ioc 0 s₀, D ≤ laplace μ s) :
    IntegrableOn (fun s => s*dampedLogMoment μ 1 s/laplace μ s) (Ioc 0 s₀) ∧
      (∫ s in Ioc 0 s₀, |s*dampedLogMoment μ 1 s/laplace μ s|) ≤
        (∫ x, |Real.log x| ∂(μ.law : Measure ℝ))/D := by
  have hm : Measurable (fun s => s*dampedLogMoment μ 1 s/laplace μ s) :=
    (measurable_id.mul (measurable_dampedLogMoment μ 1)).div (measurable_laplace μ)
  have h := integrableOn_of_absLogKernel_bound true μ hp hi hm
    (s₀ := s₀) (c := 1/D) (by positivity) (by
      intro s hs
      rw [abs_div, abs_of_pos (laplace_pos μ hs.1.le)]
      calc
        _ ≤ (∫ x, absLogKernel true s x ∂(μ.law : Measure ℝ))/laplace μ s :=
          div_le_div_of_nonneg_right (abs_mul_dampedLogMoment_one_le μ hs.1.le) (laplace_pos μ hs.1.le).le
        _ ≤ (∫ x, absLogKernel true s x ∂(μ.law : Measure ℝ))/D :=
          div_le_div_of_nonneg_left (integral_absLogKernel_nonneg true μ hs.1.le) hD (hL s hs)
        _ = _ := by ring)
  simpa only [one_div, inv_mul_eq_div] using h

theorem integrableOn_productTangentTerm_bound (μ : NonnegLaw)
    (hp : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) {s₀ D : ℝ}
    (hD : 0 < D) (hL : ∀ s ∈ Ioc 0 s₀, D ≤ laplace μ s) :
    IntegrableOn (fun s => s*dampedMoment μ 1 s*dampedLogMoment μ 0 s/(laplace μ s)^2) (Ioc 0 s₀) ∧
      (∫ s in Ioc 0 s₀, |s*dampedMoment μ 1 s*dampedLogMoment μ 0 s/(laplace μ s)^2|) ≤
        (Real.exp (-1)/D^2)*(∫ x, |Real.log x| ∂(μ.law : Measure ℝ)) := by
  apply integrableOn_of_absLogKernel_bound false μ hp hi
    (f := fun s => s*dampedMoment μ 1 s*dampedLogMoment μ 0 s/(laplace μ s)^2)
    (((measurable_id.mul (measurable_dampedMoment μ 1)).mul (measurable_dampedLogMoment μ 0)).div
      ((measurable_laplace μ).pow_const 2)) (by positivity)
  intro s hs
  rw [abs_div, abs_mul, abs_of_nonneg (mul_dampedMoment_one_nonneg μ hs.1.le),
    abs_of_nonneg (sq_nonneg (laplace μ s))]
  calc
    _ ≤ (Real.exp (-1)*(∫ x, absLogKernel false s x ∂(μ.law : Measure ℝ)))/(laplace μ s)^2 := by
      apply div_le_div_of_nonneg_right _ (sq_nonneg _)
      exact mul_le_mul (mul_dampedMoment_one_le μ hs.1) (abs_dampedLogMoment_zero_le μ hs.1.le)
        (abs_nonneg _) (Real.exp_pos _).le
    _ ≤ (Real.exp (-1)*(∫ x, absLogKernel false s x ∂(μ.law : Measure ℝ)))/D^2 := by
      apply div_le_div_of_nonneg_left
        (mul_nonneg (Real.exp_pos _).le (integral_absLogKernel_nonneg false μ hs.1.le)) (sq_pos_of_pos hD)
      exact pow_le_pow_left₀ hD.le (hL s hs) 2
    _ = _ := by ring

theorem integrableOn_powerTangent_bound (μ : NonnegLaw)
    (hp : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) {s₀ D : ℝ}
    (hD : 0 < D) (hL : ∀ s ∈ Ioc 0 s₀, D ≤ laplace μ s) :
    IntegrableOn (powerTangent μ) (Ioc 0 s₀) ∧
      (∫ s in Ioc 0 s₀, |powerTangent μ s|) ≤
        (2/D + Real.exp (-1)/D^2)*(∫ x, |Real.log x| ∂(μ.law : Measure ℝ)) := by
  obtain ⟨hA, hbA⟩ := integrableOn_tiltedXLog_bound μ hp hi hD hL
  obtain ⟨hB, hbB⟩ := integrableOn_secondTangentTerm_bound μ hp hi hD hL
  obtain ⟨hP, hbP⟩ := integrableOn_productTangentTerm_bound μ hp hi hD hL
  have he : IntegrableOn (fun s => tiltedXLog μ s - s*dampedLogMoment μ 1 s/laplace μ s +
      s*dampedMoment μ 1 s*dampedLogMoment μ 0 s/(laplace μ s)^2) (Ioc 0 s₀) := (hA.sub hB).add hP
  have ht : IntegrableOn (powerTangent μ) (Ioc 0 s₀) :=
    he.congr ((ae_restrict_mem measurableSet_Ioc).mono fun s hs =>
      (powerTangent_eq_expanded μ hs.1).symm)
  refine ⟨ht, ?_⟩
  calc
    _ ≤ ∫ s in Ioc 0 s₀, |tiltedXLog μ s| + |s*dampedLogMoment μ 1 s/laplace μ s| +
        |s*dampedMoment μ 1 s*dampedLogMoment μ 0 s/(laplace μ s)^2| := by
      apply integral_mono_ae ht.abs ((hA.abs.add hB.abs).add hP.abs)
      filter_upwards [ae_restrict_mem measurableSet_Ioc] with s hs
      rw [powerTangent_eq_expanded μ hs.1]
      exact (abs_add_le _ _).trans (add_le_add (abs_sub _ _) le_rfl)
    _ = (∫ s in Ioc 0 s₀, |tiltedXLog μ s|) +
        (∫ s in Ioc 0 s₀, |s*dampedLogMoment μ 1 s/laplace μ s|) +
        (∫ s in Ioc 0 s₀, |s*dampedMoment μ 1 s*dampedLogMoment μ 0 s/(laplace μ s)^2|) := by
      have hab : Integrable (fun s => |tiltedXLog μ s| + |s*dampedLogMoment μ 1 s/laplace μ s|)
          (volume.restrict (Ioc 0 s₀)) := hA.abs.add hB.abs
      rw [integral_add hab hP.abs, integral_add hA.abs hB.abs]
    _ ≤ (∫ x, |Real.log x| ∂(μ.law : Measure ℝ))/D +
        (∫ x, |Real.log x| ∂(μ.law : Measure ℝ))/D +
        (Real.exp (-1)/D^2)*(∫ x, |Real.log x| ∂(μ.law : Measure ℝ)) :=
      add_le_add (add_le_add hbA hbB) hbP
    _ = _ := by ring

theorem integral_powerTangent_zero_endpoint (μ : NonnegLaw)
    (hp : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 < x)
    (hi : Integrable Real.log (μ.law : Measure ℝ)) {s : ℝ} (hs : 0 < s) :
    (∫ r in (0 : ℝ)..s, powerTangent μ r) = s*tiltedXLog μ s := by
  have hint := (integrableOn_powerTangent_bound μ hp hi (laplace_pos μ hs.le)
    (fun r hr => laplace_antitone μ hr.1.le hs.le hr.2)).1
  have h := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_tendsto hs
    (fun r (hr : r ∈ Ioo 0 s) => hasDerivAt_mul_tiltedXLog_powerTangent μ hr.1)
    ((intervalIntegrable_iff_integrableOn_Ioc_of_le hs.le).mpr hint)
    (tendsto_mul_tiltedXLog_zero μ hi)
    ((hasDerivAt_mul_tiltedXLog_powerTangent μ hs).continuousAt.tendsto.mono_left nhdsWithin_le_nhds)
  simpa only [sub_zero] using h

end GGC.Identification
