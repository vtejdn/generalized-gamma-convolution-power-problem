import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Analysis.Calculus.Deriv.MeanValue
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
import Mathlib.Analysis.SpecialFunctions.Integrability.Basic
import Mathlib.Analysis.Calculus.DSlope
import Mathlib.Analysis.Calculus.LHopital
import Mathlib.Tactic

/-! # The deterministic correction kernel

The three terms are kept together: their separate improper integrals must
not be used to justify a cancellation of divergent quantities.
-/

noncomputable section

open MeasureTheory Set Filter Topology

namespace GGC.LogRate

/-- Correction kernel, with the removable point assigned value zero. -/
def correctionKernel (u : ℝ) : ℝ :=
  if u = 1 then 0 else 1 / (1 + u) - 1 / (u - 1) + Real.log u / (u - 1) ^ 2

@[simp] theorem correctionKernel_one : correctionKernel 1 = 0 := by
  simp [correctionKernel]

@[fun_prop] theorem measurable_correctionKernel : Measurable correctionKernel := by
  unfold correctionKernel
  exact Measurable.ite (measurableSet_eq_fun measurable_id measurable_const)
    measurable_const (by fun_prop)

theorem correctionKernel_mul_sq {u : ℝ} (hu : 0 < u) :
    (u - 1) ^ 2 * correctionKernel u = Real.log u - 2 * (u - 1) / (u + 1) := by
  by_cases h : u = 1
  · subst u
    simp
  · rw [correctionKernel, if_neg h]
    have h₁ : u - 1 ≠ 0 := sub_ne_zero.mpr h
    have h₂ : 1 + u ≠ 0 := by positivity
    have h₃ : u + 1 ≠ 0 := by positivity
    field_simp
    ring

/-- Numerator of the combined kernel after clearing the squared denominator. -/
def correctionNumerator (u : ℝ) := Real.log u - 2 * (u - 1) / (u + 1)

theorem hasDerivAt_correctionNumerator {u : ℝ} (hu : 0 < u) :
    HasDerivAt correctionNumerator ((u - 1)^2 / (u * (u + 1)^2)) u := by
  have h₀ : u ≠ 0 := ne_of_gt hu
  have h₁ : u + 1 ≠ 0 := by positivity
  convert! (Real.hasDerivAt_log h₀).sub
    ((((hasDerivAt_id u).sub_const 1).const_mul 2).div
      ((hasDerivAt_id u).add_const 1) h₁) using 1
  dsimp
  field_simp
  ring

theorem monotoneOn_correctionNumerator : MonotoneOn correctionNumerator (Ioi 0) := by
  apply monotoneOn_of_deriv_nonneg (convex_Ioi 0)
  · exact fun u hu => (hasDerivAt_correctionNumerator hu).continuousAt.continuousWithinAt
  · intro u hu
    exact (hasDerivAt_correctionNumerator (by simpa using hu)).differentiableAt.differentiableWithinAt
  · intro u hu
    have hu' : 0 < u := by simpa using hu
    rw [(hasDerivAt_correctionNumerator hu').deriv]
    positivity

theorem correctionKernel_nonpos {u : ℝ} (hu : 0 < u) (h₁ : u ≤ 1) :
    correctionKernel u ≤ 0 := by
  by_cases h : u = 1
  · simp [h]
  have hn := monotoneOn_correctionNumerator hu (show (1 : ℝ) ∈ Ioi 0 by norm_num) h₁
  have he := correctionKernel_mul_sq hu
  have hp : 0 < (u - 1)^2 := sq_pos_of_ne_zero (sub_ne_zero.mpr h)
  simp [correctionNumerator] at hn
  nlinarith

theorem correctionKernel_nonneg {u : ℝ} (h₁ : 1 ≤ u) :
    0 ≤ correctionKernel u := by
  have hu : 0 < u := by linarith
  by_cases h : u = 1
  · simp [h]
  have hn := monotoneOn_correctionNumerator (show (1 : ℝ) ∈ Ioi 0 by norm_num) hu h₁
  have he := correctionKernel_mul_sq hu
  have hp : 0 < (u - 1)^2 := sq_pos_of_ne_zero (sub_ne_zero.mpr h)
  simp [correctionNumerator] at hn
  nlinarith

theorem correctionKernel_le {u : ℝ} (hu : 0 < u) :
    correctionKernel u ≤ 1 / (u + 1) := by
  by_cases h : u = 1
  · subst u; norm_num
  have hp : 0 < (u - 1)^2 := sq_pos_of_ne_zero (sub_ne_zero.mpr h)
  have he := correctionKernel_mul_sq hu
  have hl := Real.log_le_sub_one_of_pos hu
  have hid : (u - 1)^2 * (1 / (u + 1)) = u - 1 - 2 * (u - 1) / (u + 1) := by
    have : u + 1 ≠ 0 := by positivity
    field_simp
    ring
  nlinarith

theorem le_correctionKernel {u : ℝ} (hu : 0 < u) :
    -(1 / (u * (u + 1))) ≤ correctionKernel u := by
  by_cases h : u = 1
  · subst u; norm_num
  have hp : 0 < (u - 1)^2 := sq_pos_of_ne_zero (sub_ne_zero.mpr h)
  have he := correctionKernel_mul_sq hu
  have hl := Real.one_sub_inv_le_log_of_pos hu
  have hid : (u - 1)^2 * (-(1 / (u * (u + 1)))) =
      1 - u⁻¹ - 2 * (u - 1) / (u + 1) := by
    have : u + 1 ≠ 0 := by positivity
    have : u ≠ 0 := ne_of_gt hu
    field_simp
    ring
  nlinarith

/-- A uniform bound around the removable singularity, independent of log estimates. -/
theorem abs_correctionKernel_le_two {u : ℝ} (hu : 1 / 2 ≤ u) :
    |correctionKernel u| ≤ 2 := by
  have hp : 0 < u := by linarith
  have hupper := correctionKernel_le hp
  have hlower := le_correctionKernel hp
  have h₁ : 1 / (u + 1) ≤ (2 : ℝ) := (div_le_iff₀ (by positivity)).2 (by linarith)
  have h₂ : 1 / (u * (u + 1)) ≤ (2 : ℝ) :=
    (div_le_iff₀ (by positivity)).2 (by nlinarith)
  exact abs_le.mpr ⟨by linarith, hupper.trans h₁⟩

theorem abs_correctionKernel_le_near_zero {u : ℝ} (hu : 0 < u) (hsmall : u ≤ 1 / 2) :
    |correctionKernel u| ≤ 4 * |Real.log u| := by
  have h₁ : u ≠ 1 := by linarith
  have hn := correctionKernel_nonpos hu (by linarith)
  have hl := Real.log_nonpos hu.le (by linarith : u ≤ 1)
  have he := correctionKernel_mul_sq hu
  have ht : 2 * (u - 1) / (u + 1) ≤ 0 :=
    div_nonpos_of_nonpos_of_nonneg (by linarith) (by positivity)
  rw [abs_of_nonpos hn, abs_of_nonpos hl]
  have hp : (1 : ℝ) / 4 ≤ (u - 1)^2 := by nlinarith
  nlinarith

theorem abs_correctionKernel_le_at_top {u : ℝ} (hu : 2 ≤ u) :
    |correctionKernel u| ≤ 4 * (Real.log u / u^2) := by
  have hp : 0 < u := by linarith
  have hn := correctionKernel_nonneg (by linarith : 1 ≤ u)
  have he := correctionKernel_mul_sq hp
  have ht : 0 ≤ 2 * (u - 1) / (u + 1) :=
    div_nonneg (by linarith) (by positivity)
  rw [abs_of_nonneg hn]
  rw [← mul_div_assoc]
  apply (le_div_iff₀ (sq_pos_of_pos hp)).2
  have hsq : u^2 ≤ 4 * (u - 1)^2 := by nlinarith
  have hm := mul_le_mul_of_nonneg_right hsq hn
  nlinarith

private theorem integrableOn_log_div_sq :
    IntegrableOn (fun u : ℝ => Real.log u / u^2) (Ioi 2) := by
  apply integrableOn_Ioi_deriv_of_nonneg'
    (g := fun u : ℝ => -(Real.log u + 1) / u) (l := 0)
  · intro u hu
    have hp : 0 < u := by have := hu; simp only [mem_Ici] at this; linarith
    convert! (((Real.hasDerivAt_log (ne_of_gt hp)).add_const 1).neg.div
      (hasDerivAt_id u) (ne_of_gt hp)) using 1
    dsimp
    field_simp
    ring
  · intro u hu
    exact div_nonneg (Real.log_nonneg (by have := hu; simp only [mem_Ioi] at this; linarith))
      (sq_nonneg u)
  · have hlog := Real.isLittleO_log_id_atTop.tendsto_div_nhds_zero
    have hinv : Tendsto (fun u : ℝ => 1 / u) atTop (𝓝 0) := by
      simpa using tendsto_inv_atTop_zero
    convert (hlog.add hinv).neg using 1 <;> simp [neg_div, add_div]

/-- Absolute integrability of the combined kernel; no divergent-term subtraction. -/
theorem integrableOn_correctionKernel : IntegrableOn correctionKernel (Ioi 0) := by
  have hzero : IntegrableOn correctionKernel (Ioo 0 (1 / 2)) := by
    have hl : IntegrableOn Real.log (Ioo 0 (1 / 2)) :=
      (intervalIntegrable_iff_integrableOn_Ioo_of_le (by norm_num)).mp
        intervalIntegral.intervalIntegrable_log'
    apply (hl.abs.const_mul 4).mono' measurable_correctionKernel.aestronglyMeasurable
    filter_upwards [ae_restrict_mem measurableSet_Ioo] with u hu
    simpa [Real.norm_eq_abs] using abs_correctionKernel_le_near_zero hu.1 hu.2.le
  have hmiddle : IntegrableOn correctionKernel (Icc (1 / 2) 2) := by
    apply (integrableOn_const (C := (2 : ℝ)) (s := Icc (1 / 2) 2)
      (by simp)).mono'
      measurable_correctionKernel.aestronglyMeasurable
    filter_upwards [ae_restrict_mem measurableSet_Icc] with u hu
    simpa [Real.norm_eq_abs] using abs_correctionKernel_le_two hu.1
  have htop : IntegrableOn correctionKernel (Ioi 2) := by
    apply (integrableOn_log_div_sq.const_mul 4).mono'
      measurable_correctionKernel.aestronglyMeasurable
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with u hu
    simpa [Real.norm_eq_abs] using abs_correctionKernel_le_at_top hu.le
  have hunion : Ioo (0 : ℝ) (1 / 2) ∪ Icc (1 / 2) 2 ∪ Ioi 2 = Ioi 0 := by
    ext u
    simp only [mem_union, mem_Ioo, mem_Icc, mem_Ioi]
    constructor <;> intro h <;> grind
  rw [← hunion]
  exact (hzero.union hmiddle).union htop

/-- A primitive with its continuous value at one supplied by the extended slope. -/
def kernelPrimitive (u : ℝ) : ℝ :=
  Real.log (1 + u) - u * dslope Real.log 1 u

theorem kernelPrimitive_of_ne {u : ℝ} (hu : u ≠ 1) :
    kernelPrimitive u = Real.log (1 + u) - (u * Real.log u) / (u - 1) := by
  simp [kernelPrimitive, dslope_of_ne _ hu, slope, div_eq_mul_inv, mul_comm, mul_left_comm]

@[simp] theorem kernelPrimitive_one : kernelPrimitive 1 = Real.log 2 - 1 := by
  norm_num [kernelPrimitive, dslope_same, Real.deriv_log]

private theorem continuousAt_kernelPrimitive_one : ContinuousAt kernelPrimitive 1 := by
  unfold kernelPrimitive
  apply ContinuousAt.sub
  · exact Real.continuousAt_log (by norm_num) |>.comp (continuous_const.add continuous_id).continuousAt
  · exact continuousAt_id.mul (continuousAt_dslope_same.2 (Real.differentiableAt_log one_ne_zero))

private theorem continuousAt_kernelPrimitive_zero : ContinuousAt kernelPrimitive 0 := by
  have hc : ContinuousAt (fun u : ℝ => Real.log (1 + u) -
      (u * Real.log u) / (u - 1)) 0 := by
    apply ContinuousAt.sub
    · exact Real.continuousAt_log (by norm_num) |>.comp (continuous_const.add continuous_id).continuousAt
    · exact Real.continuous_mul_log.continuousAt.div (continuous_id.sub continuous_const).continuousAt
        (by norm_num)
  apply hc.congr_of_eventuallyEq
  filter_upwards [eventually_ne_nhds (show (0 : ℝ) ≠ 1 by norm_num)] with u hu
  exact kernelPrimitive_of_ne hu

theorem hasDerivAt_kernelPrimitive {u : ℝ} (hu : 0 < u) (h₁ : u ≠ 1) :
    HasDerivAt kernelPrimitive (correctionKernel u) u := by
  have hp : 1 + u ≠ 0 := by positivity
  have hm : u - 1 ≠ 0 := sub_ne_zero.mpr h₁
  have h := ((hasDerivAt_const u (1 : ℝ)).add (hasDerivAt_id u)).log hp |>.sub
    ((Real.hasDerivAt_mul_log (ne_of_gt hu)).div ((hasDerivAt_id u).sub_const 1) hm)
  have heq : kernelPrimitive =ᶠ[𝓝 u]
      (fun x : ℝ => Real.log (1 + x) - x * Real.log x / (x - 1)) := by
    filter_upwards [eventually_ne_nhds h₁] with x hx
    exact kernelPrimitive_of_ne hx
  convert! h.congr_of_eventuallyEq heq using 1
  dsimp
  rw [correctionKernel, if_neg h₁]
  field_simp
  ring

theorem kernelPrimitive_alt {u : ℝ} (hu : 0 < u) (h₁ : u ≠ 1) :
    kernelPrimitive u = Real.log (1 + u⁻¹) - Real.log u / (u - 1) := by
  rw [kernelPrimitive_of_ne h₁]
  have hp : 1 + u ≠ 0 := by positivity
  have hm : u - 1 ≠ 0 := sub_ne_zero.mpr h₁
  rw [show 1 + u⁻¹ = (1 + u) / u by field_simp; ring, Real.log_div hp (ne_of_gt hu)]
  field_simp
  ring

private theorem tendsto_kernelPrimitive_atTop : Tendsto kernelPrimitive atTop (𝓝 0) := by
  have h₁ : Tendsto (fun u : ℝ => Real.log (1 + u⁻¹)) atTop (𝓝 0) := by
    have hi : Tendsto (fun u : ℝ => 1 + u⁻¹) atTop (𝓝 1) := by
      simpa using tendsto_const_nhds.add (tendsto_inv_atTop_zero (𝕜 := ℝ))
    have := (Real.continuousAt_log (x := 1) one_ne_zero).tendsto.comp hi
    simpa only [Real.log_one, Function.comp_def] using this
  have h₂ : Tendsto (fun u : ℝ => Real.log u / (u - 1)) atTop (𝓝 0) := by
    simpa [sub_eq_add_neg] using Real.tendsto_pow_log_div_mul_add_atTop 1 (-1) 1 one_ne_zero
  apply (show Tendsto (fun u : ℝ => Real.log (1 + u⁻¹) - Real.log u / (u - 1))
    atTop (𝓝 0) by simpa using h₁.sub h₂).congr'
  filter_upwards [eventually_gt_atTop (1 : ℝ)] with u hu
  exact (kernelPrimitive_alt (by linarith) (ne_of_gt hu)).symm

theorem integral_correctionKernel_Ioi_one :
    (∫ u in Ioi 1, correctionKernel u) = 1 - Real.log 2 := by
  have h := integral_Ioi_of_hasDerivAt_of_tendsto
    continuousAt_kernelPrimitive_one.continuousWithinAt
    (fun u hu => hasDerivAt_kernelPrimitive (by have := hu; simp only [mem_Ioi] at this; linarith)
      (ne_of_gt hu))
    (integrableOn_correctionKernel.mono_set (Ioi_subset_Ioi zero_le_one))
    tendsto_kernelPrimitive_atTop
  simpa using h

theorem integral_correctionKernel_Ioo_zero_one :
    (∫ u in Ioo 0 1, correctionKernel u) = Real.log 2 - 1 := by
  have hint : IntervalIntegrable correctionKernel volume 0 1 :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le zero_le_one).2
      (integrableOn_correctionKernel.mono_set Ioo_subset_Ioi_self)
  have h := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_tendsto zero_lt_one
    (fun u hu => hasDerivAt_kernelPrimitive hu.1 (ne_of_lt hu.2)) hint
    continuousAt_kernelPrimitive_zero.continuousWithinAt.tendsto
    continuousAt_kernelPrimitive_one.continuousWithinAt.tendsto
  norm_num [intervalIntegral.integral_of_le zero_le_one, integral_Ioc_eq_integral_Ioo,
    kernelPrimitive, dslope_of_ne, slope, Real.deriv_log] at h ⊢
  exact h

/-- Exact L1 norm, obtained from the integrable combined kernel and its sign. -/
theorem integral_abs_correctionKernel :
    (∫ u in Ioi 0, |correctionKernel u|) = 2 * (1 - Real.log 2) := by
  have habs : IntegrableOn (fun u => |correctionKernel u|) (Ioi 0) :=
    integrableOn_correctionKernel.abs
  have hleft : (∫ u in Ioo 0 1, |correctionKernel u|) = 1 - Real.log 2 := by
    calc _ = ∫ u in Ioo 0 1, -correctionKernel u := by
           apply setIntegral_congr_fun measurableSet_Ioo
           intro u hu
           exact abs_of_nonpos (correctionKernel_nonpos hu.1 hu.2.le)
      _ = _ := by rw [integral_neg, integral_correctionKernel_Ioo_zero_one]; ring
  have hright : (∫ u in Ioi 1, |correctionKernel u|) = 1 - Real.log 2 := by
    calc _ = ∫ u in Ioi 1, correctionKernel u := by
           apply setIntegral_congr_fun measurableSet_Ioi
           intro u hu
           exact abs_of_nonneg (correctionKernel_nonneg hu.le)
      _ = _ := integral_correctionKernel_Ioi_one
  rw [← Ioc_union_Ioi_eq_Ioi zero_le_one, setIntegral_union (by simp [Set.disjoint_left])
    measurableSet_Ioi
    (habs.mono_set Ioc_subset_Ioi_self)
    (habs.mono_set (Ioi_subset_Ioi zero_le_one)),
    integral_Ioc_eq_integral_Ioo, hleft, hright]
  ring

/-- The prescribed value at one is the removable-singularity limit. -/
theorem continuousAt_correctionKernel_one : ContinuousAt correctionKernel 1 := by
  have hpos : ∀ᶠ u : ℝ in 𝓝[≠] 1, 0 < u :=
    (eventually_gt_nhds (show (0 : ℝ) < 1 by norm_num)).filter_mono nhdsWithin_le_nhds
  have hne : ∀ᶠ u : ℝ in 𝓝[≠] 1, u ≠ 1 := by
    simpa only [mem_compl_iff, mem_singleton_iff] using
      (eventually_mem_nhdsWithin : ∀ᶠ u : ℝ in 𝓝[≠] 1, u ∈ ({(1 : ℝ)} : Set ℝ)ᶜ)
  have hnum : Tendsto correctionNumerator (𝓝[≠] 1) (𝓝 0) := by
    simpa [correctionNumerator] using
      (hasDerivAt_correctionNumerator (show (0 : ℝ) < 1 by norm_num)).continuousAt.tendsto.mono_left
        nhdsWithin_le_nhds
  have hden : Tendsto (fun u : ℝ => (u - 1)^2) (𝓝[≠] 1) (𝓝 0) := by
    have hc : ContinuousAt (fun u : ℝ => (u - 1)^2) 1 := by fun_prop
    simpa using hc.tendsto.mono_left nhdsWithin_le_nhds
  have hratio : Tendsto (fun u : ℝ => ((u - 1)^2 / (u * (u + 1)^2)) / (2 * (u - 1)))
      (𝓝[≠] 1) (𝓝 0) := by
    have hc : ContinuousAt (fun u : ℝ => (u - 1) / (2 * u * (u + 1)^2)) 1 := by
      fun_prop (disch := norm_num)
    apply (show Tendsto (fun u : ℝ => (u - 1) / (2 * u * (u + 1)^2))
      (𝓝[≠] 1) (𝓝 0) by simpa using hc.tendsto.mono_left nhdsWithin_le_nhds).congr'
    filter_upwards [hpos, hne] with u hu h₁
    have h₀ : u ≠ 0 := ne_of_gt hu
    have h₂ : u + 1 ≠ 0 := by positivity
    have hm : u - 1 ≠ 0 := sub_ne_zero.mpr h₁
    field_simp
  have hlim := HasDerivAt.lhopital_zero_nhdsNE
    (hpos.mono (fun _ hu => hasDerivAt_correctionNumerator hu))
    (Filter.Eventually.of_forall (fun u : ℝ => by
      convert! ((hasDerivAt_id u).sub_const 1).pow 2 using 1
      simp))
    (hne.mono (fun u hu => mul_ne_zero (by norm_num) (sub_ne_zero.mpr hu))) hnum hden hratio
  rw [continuousAt_iff_punctured_nhds, correctionKernel_one]
  apply hlim.congr'
  filter_upwards [hpos, hne] with u hu h₁
  have hm : (u - 1)^2 ≠ 0 := pow_ne_zero 2 (sub_ne_zero.mpr h₁)
  apply (div_eq_iff hm).2
  simpa [correctionNumerator, mul_comm] using (correctionKernel_mul_sq hu).symm

end GGC.LogRate
