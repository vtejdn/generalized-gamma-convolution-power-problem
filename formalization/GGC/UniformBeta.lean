import GGC.BetaPosterior
import GGC.CommonUniforms

/-! # The common-uniform formula has the actual beta law

We identify distributions by half-line evaluations and integrate the beta
density explicitly. This is a local adapter, not part of E-T1.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Topology
namespace GGC
open RandomMeasure

theorem beta_one_constant (B : PosReal) : 1 / beta 1 B.val = B.val := by
  rw [beta, Real.Gamma_one, one_mul, add_comm 1 B.val,
    Real.Gamma_add_one (ne_of_gt B.property)]
  field_simp [ne_of_gt (Real.Gamma_pos_of_pos B.property)]

private theorem betaPDF_one_indicator (B : PosReal) :
    betaPDF 1 B.val = (Ioo (0 : ℝ) 1).indicator
      (fun x => ENNReal.ofReal (B.val * (1-x)^(B.val-1))) := by
  funext x
  by_cases hx : x ∈ Ioo (0 : ℝ) 1
  · have hx' : 0 < x ∧ x < 1 := hx
    rw [betaPDF, betaPDFReal, if_pos hx', indicator_of_mem hx, beta_one_constant]
    simp
  · have hx' : ¬(0 < x ∧ x < 1) := hx
    rw [betaPDF, betaPDFReal, if_neg hx', indicator_of_notMem hx]
    simp

theorem betaMeasure_one_Iic (B : PosReal) {z : ℝ} (hz : z ∈ Icc (0 : ℝ) 1) :
    betaMeasure 1 B.val (Iic z) = ENNReal.ofReal (1 - (1-z)^B.val) := by
  rw [betaMeasure, withDensity_apply _ measurableSet_Iic, betaPDF_one_indicator,
    lintegral_indicator measurableSet_Ioo, Measure.restrict_restrict measurableSet_Ioo]
  have he : (volume : Measure ℝ).restrict (Ioo 0 1 ∩ Iic z) =
      volume.restrict (Ioo 0 z) := by
    apply Measure.restrict_congr_set
    have hn : ∀ᵐ x : ℝ ∂volume, x ≠ z := by
      simp only [ae_iff, not_not]
      exact measure_singleton z
    filter_upwards [hn] with x hx
    apply propext
    change (0 < x ∧ x < 1) ∧ x ≤ z ↔ 0 < x ∧ x < z
    constructor
    · intro h
      exact ⟨h.1.1, lt_of_le_of_ne h.2 hx⟩
    · intro h
      exact ⟨⟨h.1, h.2.trans_le hz.2⟩, h.2.le⟩
  rw [he]
  have hr : IntervalIntegrable (fun x : ℝ => x^(B.val-1)) volume (1-z) 1 :=
    intervalIntegral.intervalIntegrable_rpow' (by linarith [B.property])
  have hi : IntervalIntegrable (fun x : ℝ => B.val * (1-x)^(B.val-1)) volume 0 z := by
    have ht := (hr.comp_sub_left 1).symm
    simp only [sub_self, sub_sub_cancel] at ht
    exact ht.const_mul B.val
  rw [← ofReal_integral_eq_lintegral_ofReal
    ((intervalIntegrable_iff_integrableOn_Ioo_of_le hz.1).mp hi)
    (ae_restrict_of_forall_mem measurableSet_Ioo (fun x hx =>
      mul_nonneg B.property.le (Real.rpow_nonneg (by linarith [hz.2, hx.2]) _))),
    ← integral_Ioc_eq_integral_Ioo, ← intervalIntegral.integral_of_le hz.1,
    intervalIntegral.integral_const_mul,
    intervalIntegral.integral_comp_sub_left (fun x : ℝ => x^(B.val-1)),
    integral_rpow (Or.inl (by linarith [B.property]))]
  simp only [sub_add_cancel, sub_zero, Real.one_rpow]
  congr 1
  field_simp [ne_of_gt B.property]

theorem betaWeightLaw_Iic (B : PosReal) (z : UnitWeight) :
    (betaWeightLaw B : Measure UnitWeight) (Iic z) =
      ENNReal.ofReal (1 - (1-z.val)^B.val) := by
  have h := congrArg (fun m : Measure ℝ => m (Iic z.val)) (betaWeightLaw_map_val B)
  rw [Measure.map_apply measurable_subtype_coe measurableSet_Iic] at h
  exact h.trans (betaMeasure_one_Iic B z.property)

/-- The same explicit fraction formula is used for every mass on the common space. -/
theorem uniformBreak_map (B : PosReal) :
    Measure.map (uniformBreak B) (volume : Measure UnitWeight) =
      (betaWeightLaw B : Measure UnitWeight) := by
  have hm : Measurable (uniformBreak B) :=
    measurable_uniformBreak.comp (measurable_prodMk_left (x := B))
  haveI : IsProbabilityMeasure (Measure.map (uniformBreak B) (volume : Measure UnitWeight)) :=
    Measure.isProbabilityMeasure_map hm.aemeasurable
  apply Measure.ext_of_Iic
  intro z
  rw [Measure.map_apply hm measurableSet_Iic, betaWeightLaw_Iic]
  let a : UnitWeight := ⟨(1-z.val)^B.val,
    Real.rpow_nonneg (sub_nonneg.mpr z.property.2) _,
    Real.rpow_le_one (sub_nonneg.mpr z.property.2) (by linarith [z.property.1]) B.property.le⟩
  have he : (uniformBreak B) ⁻¹' Iic z = Ici a := by
    ext u
    change 1 - u.val^(1/B.val) ≤ z.val ↔ (1-z.val)^B.val ≤ u.val
    rw [show (1 - u.val^(1/B.val) ≤ z.val) ↔ 1-z.val ≤ u.val^(1/B.val) by
      constructor <;> intro h <;> linarith]
    simpa only [one_div] using
      Real.le_rpow_inv_iff_of_pos (sub_nonneg.mpr z.property.2) u.property.1 B.property
  rw [he, unitInterval.volume_Ici]

end GGC
