import GGC.Identification.TangentIntegrability

/-! # Absolute space-time tangent control and time-integrated zero endpoint -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology ENNReal
namespace GGC.Identification

/-- Ordinary Lebesgue time measure on the closed finite time subtype. -/
def timeMeasure (T : ℝ) : Measure (Icc (0 : ℝ) T) := volume.comap Subtype.val

theorem timeMeasure_univ (T : ℝ) : timeMeasure T univ = ENNReal.ofReal T := by
  rw [timeMeasure, comap_subtype_coe_apply measurableSet_Icc]
  simp only [image_univ, Subtype.range_coe, Real.volume_Icc, sub_zero]

instance timeMeasure_isFinite (T : ℝ) : IsFiniteMeasure (timeMeasure T) :=
  ⟨by rw [timeMeasure_univ]; exact ENNReal.ofReal_lt_top⟩

theorem timeMeasure_real_univ {T : ℝ} (hT : 0 ≤ T) : (timeMeasure T).real univ = T := by
  rw [Measure.real, timeMeasure_univ, ENNReal.toReal_ofReal hT]

theorem aestronglyMeasurable_powerTangent_prod
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (ν : Measure (Icc (0 : ℝ) T)) {s₀ : ℝ} :
    AEStronglyMeasurable (fun p : Icc (0 : ℝ) T × ℝ => powerTangent (WeakLogRateSolution.value w p.1) p.2)
      (ν.prod (volume.restrict (Ioc 0 s₀))) := by
  apply (measurable_expandedPowerTangent_value w).aestronglyMeasurable.congr
  have hs : ∀ᵐ p ∂ν.prod (volume.restrict (Ioc 0 s₀)), p.2 ∈ Ioc (0 : ℝ) s₀ :=
    Measure.quasiMeasurePreserving_snd.ae (ae_restrict_mem measurableSet_Ioc)
  exact hs.mono fun p hp => (powerTangent_eq_expanded _ hp.1).symm

theorem integrable_powerTangent_prod_bound
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T)
    (ν : Measure (Icc (0 : ℝ) T)) [IsFiniteMeasure ν] {s₀ C D : ℝ}
    (_hC : 0 ≤ C) (hD : 0 < D)
    (hlog : ∀ t, Integrable Real.log ((WeakLogRateSolution.value w t).law : Measure ℝ) ∧
      (∫ x, |Real.log x| ∂((WeakLogRateSolution.value w t).law : Measure ℝ)) ≤ C)
    (hL : ∀ t s, s ∈ Ioc 0 s₀ → D ≤ laplace (WeakLogRateSolution.value w t) s) :
    Integrable (fun p : Icc (0 : ℝ) T × ℝ => powerTangent (WeakLogRateSolution.value w p.1) p.2)
      (ν.prod (volume.restrict (Ioc 0 s₀))) ∧
      (∫ t, (∫ s in Ioc 0 s₀, |powerTangent (WeakLogRateSolution.value w t) s|) ∂ν) ≤
        ν.real univ * ((2/D + Real.exp (-1)/D^2)*C) := by
  let M := (2/D + Real.exp (-1)/D^2)*C
  have ht (t : Icc (0 : ℝ) T) :
      IntegrableOn (powerTangent (WeakLogRateSolution.value w t)) (Ioc 0 s₀) ∧
      (∫ s in Ioc 0 s₀, |powerTangent (WeakLogRateSolution.value w t) s|) ≤ M := by
    obtain ⟨hi, hb⟩ := integrableOn_powerTangent_bound _ (valueLaw_pos _ _ _) (hlog t).1 hD (hL t)
    refine ⟨hi, hb.trans ?_⟩
    exact mul_le_mul_of_nonneg_left (hlog t).2 (by positivity)
  have hm := aestronglyMeasurable_powerTangent_prod w ν (s₀ := s₀)
  have hinner : Integrable (fun t => ∫ s in Ioc 0 s₀, ‖powerTangent (WeakLogRateSolution.value w t) s‖) ν := by
    apply (integrable_const M).mono' hm.norm.integral_prod_right'
    apply Eventually.of_forall
    intro t
    rw [Real.norm_of_nonneg (integral_nonneg fun _ => norm_nonneg _)]
    simpa only [Real.norm_eq_abs] using (ht t).2
  refine ⟨(integrable_prod_iff hm).mpr ⟨Eventually.of_forall fun t => (ht t).1, hinner⟩, ?_⟩
  calc
    _ ≤ ∫ _ : Icc (0 : ℝ) T, M ∂ν := by
      apply integral_mono (by simpa only [Real.norm_eq_abs] using hinner) (integrable_const _)
      exact fun t => (ht t).2
    _ = _ := by rw [integral_const, smul_eq_mul]

theorem value_tangent_spaceTime_bound
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T) {s₀ : ℝ} (hs₀ : 0 < s₀) :
    ∃ C D : ℝ, 0 ≤ C ∧ 0 < D ∧
      (∀ t s, s ∈ Ioc 0 s₀ → D ≤ laplace (WeakLogRateSolution.value w t) s) ∧
      Integrable (fun p : Icc (0 : ℝ) T × ℝ => powerTangent (WeakLogRateSolution.value w p.1) p.2)
        ((timeMeasure T).prod (volume.restrict (Ioc 0 s₀))) ∧
      (∫ t, (∫ s in Ioc 0 s₀, |powerTangent (WeakLogRateSolution.value w t) s|) ∂timeMeasure T) ≤
        T*((2/D + Real.exp (-1)/D^2)*C) := by
  obtain ⟨C, hC, hlog⟩ := valueLaw_logMoment_bound w
  obtain ⟨K, _, _, hD, hL⟩ := WeakLogRateSolution.uniform_laplace_lower_bound w hs₀
  refine ⟨C, Real.exp (-B₀.val*(Real.log (1+s₀)+Real.sqrt K)), hC, hD,
    (fun t s hs => hL t s hs.1 hs.2), ?_⟩
  simpa only [timeMeasure_real_univ hT] using
    integrable_powerTangent_prod_bound w (timeMeasure T) hC hD hlog (fun t s hs => hL t s hs.1 hs.2)

theorem tendsto_integral_mul_tiltedXLog_zero
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T)
    (ν : Measure (Icc (0 : ℝ) T)) [IsFiniteMeasure ν] :
    Tendsto (fun s => ∫ t, s*tiltedXLog (WeakLogRateSolution.value w t) s ∂ν)
      (𝓝[>] (0 : ℝ)) (𝓝 0) := by
  obtain ⟨C, _, hlog⟩ := valueLaw_logMoment_bound w
  obtain ⟨K, _, _, hD, hL⟩ := WeakLogRateSolution.uniform_laplace_lower_bound w (s₀ := 1) zero_lt_one
  let D := Real.exp (-B₀.val*(Real.log (1+1)+Real.sqrt K))
  have ht := tendsto_integral_filter_of_dominated_convergence
    (μ := ν) (F := fun s t => s*tiltedXLog (WeakLogRateSolution.value w t) s)
    (f := fun _ => (0 : ℝ)) (l := 𝓝[>] (0 : ℝ)) (fun _ => Real.exp (-1)*C/D)
    (Eventually.of_forall fun s =>
      (((measurable_tiltedXLog_value w).comp (measurable_id.prodMk measurable_const)).const_mul s).aestronglyMeasurable)
    (by
      filter_upwards [self_mem_nhdsWithin, (eventually_lt_nhds zero_lt_one).filter_mono nhdsWithin_le_nhds]
        with s hs hs1
      apply Eventually.of_forall
      intro t
      simpa only [Real.norm_eq_abs] using
        abs_mul_tiltedXLog_le _ (hlog t).1 (le_of_lt hs) hD (hL t s hs hs1.le) (hlog t).2)
    (integrable_const _) (Eventually.of_forall fun t => tendsto_mul_tiltedXLog_zero _ (hlog t).1)
  simpa only [integral_zero] using ht

theorem integrable_valueTangent_prod
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T)
    (ν : Measure (Icc (0 : ℝ) T)) [IsFiniteMeasure ν] {s₀ : ℝ} (hs₀ : 0 < s₀) :
    Integrable (fun p : Icc (0 : ℝ) T × ℝ => powerTangent (WeakLogRateSolution.value w p.1) p.2)
      (ν.prod (volume.restrict (Ioc 0 s₀))) := by
  obtain ⟨C, hC, hlog⟩ := valueLaw_logMoment_bound w
  obtain ⟨_, _, _, hD, hL⟩ := WeakLogRateSolution.uniform_laplace_lower_bound w hs₀
  exact (integrable_powerTangent_prod_bound w ν hC hD hlog (fun t s hs => hL t s hs.1 hs.2)).1

theorem integral_valueTangent_swap_zero_endpoint
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T)
    (ν : Measure (Icc (0 : ℝ) T)) [IsFiniteMeasure ν] {s : ℝ} (hs : 0 < s) :
    (∫ r in Ioc 0 s, ∫ t, powerTangent (WeakLogRateSolution.value w t) r ∂ν) =
      ∫ t, s*tiltedXLog (WeakLogRateSolution.value w t) s ∂ν := by
  rw [← integral_integral_swap (integrable_valueTangent_prod w ν hs)]
  apply integral_congr_ae
  apply Eventually.of_forall
  intro t
  obtain ⟨_, _, hlog⟩ := valueLaw_logMoment_bound w
  change (∫ r in Ioc 0 s, powerTangent (WeakLogRateSolution.value w t) r) =
    s*tiltedXLog (WeakLogRateSolution.value w t) s
  rw [← intervalIntegral.integral_of_le hs.le]
  exact integral_powerTangent_zero_endpoint _ (valueLaw_pos _ _ _) (hlog t).1 hs

theorem value_zero_endpoint_bounds
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) {s₀ : ℝ} (hs₀ : 0 < s₀) :
    ∃ C D : ℝ, 0 ≤ C ∧ 0 < D ∧
      (∀ t s, s ∈ Ioc 0 s₀ → |s*tiltedXLog (WeakLogRateSolution.value w t) s| ≤ Real.exp (-1)*C/D) ∧
      ∀ t, Tendsto (fun s => s*tiltedXLog (WeakLogRateSolution.value w t) s) (𝓝[>] (0 : ℝ)) (𝓝 0) := by
  obtain ⟨C, hC, hlog⟩ := valueLaw_logMoment_bound w
  obtain ⟨K, _, _, hD, hL⟩ := WeakLogRateSolution.uniform_laplace_lower_bound w hs₀
  refine ⟨C, Real.exp (-B₀.val*(Real.log (1+s₀)+Real.sqrt K)), hC, hD, ?_, ?_⟩
  · intro t s hs
    exact abs_mul_tiltedXLog_le _ (hlog t).1 hs.1.le hD (hL t s hs.1 hs.2) (hlog t).2
  · exact fun t => tendsto_mul_tiltedXLog_zero _ (hlog t).1

end GGC.Identification
