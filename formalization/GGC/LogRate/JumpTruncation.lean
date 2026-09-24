import GGC.LogRate.JumpMeasure
import Mathlib.MeasureTheory.Integral.IntegralEqImproper
import Mathlib.MeasureTheory.Measure.Lebesgue.Integral

/-! # Finite truncations of the reference jump measure

API-032: improper FTC and reflection give the exact tail mass. The original
finite second moment controls first moments away from zero.
-/

noncomputable section
open MeasureTheory Set Filter Real
open scoped Topology
namespace GGC.LogRate

def jumpTail (ε : ℝ) : Set ℝ := {v | ε < |v|}

@[measurability] theorem measurableSet_jumpTail (ε : ℝ) : MeasurableSet (jumpTail ε) :=
  measurableSet_lt measurable_const continuous_abs.measurable

theorem jumpTail_eq (ε : ℝ) : jumpTail ε = Iio (-ε) ∪ Ioi ε := by
  ext v
  simp only [jumpTail, mem_setOf_eq, mem_union, mem_Iio, mem_Ioi, lt_abs]
  constructor <;> intro h <;> rcases h with h | h
  · exact Or.inr h
  · exact Or.inl (by linarith)
  · exact Or.inr (by linarith)
  · exact Or.inl h

private theorem hasDerivAt_jumpTailPrimitive {v : ℝ} (hv : 0 < v) :
    HasDerivAt (fun x => -((exp x - 1)⁻¹)) (jumpDensity v) v := by
  have he : exp v - 1 ≠ 0 := ne_of_gt (sub_pos.mpr (one_lt_exp_iff.mpr hv))
  simpa only [Pi.neg_apply, Pi.inv_apply, neg_div, neg_neg, jumpDensity] using!
    (((hasDerivAt_exp v).sub_const 1).inv he).neg

private theorem tendsto_jumpTailPrimitive :
    Tendsto (fun x : ℝ => -((exp x - 1)⁻¹)) atTop (𝓝 0) := by
  have he : Tendsto (fun x : ℝ => exp x - 1) atTop atTop :=
    tendsto_atTop_mono (fun x => by change x ≤ exp x - 1; linarith [add_one_le_exp x]) tendsto_id
  simpa using (tendsto_inv_atTop_zero.comp he).neg

theorem integrableOn_jumpDensity_Ioi {ε : ℝ} (hε : 0 < ε) :
    IntegrableOn jumpDensity (Ioi ε) :=
  integrableOn_Ioi_deriv_of_nonneg'
    (fun _ hv => hasDerivAt_jumpTailPrimitive (hε.trans_le hv))
    (fun v _ => jumpDensity_nonneg v) tendsto_jumpTailPrimitive

theorem integral_jumpDensity_Ioi {ε : ℝ} (hε : 0 < ε) :
    (∫ v in Ioi ε, jumpDensity v) = 1 / (exp ε - 1) := by
  simpa only [zero_sub, neg_neg, one_div] using
    integral_Ioi_of_hasDerivAt_of_nonneg'
      (fun v hv => hasDerivAt_jumpTailPrimitive (hε.trans_le hv))
      (fun v _ => jumpDensity_nonneg v) tendsto_jumpTailPrimitive

theorem integrableOn_jumpDensity_jumpTail {ε : ℝ} (hε : 0 < ε) :
    IntegrableOn jumpDensity (jumpTail ε) := by
  rw [jumpTail_eq]
  have hp := integrableOn_jumpDensity_Ioi hε
  refine IntegrableOn.union ?_ hp
  rw [← (Measure.measurePreserving_neg (volume : Measure ℝ)).integrableOn_comp_preimage
    (Homeomorph.neg ℝ).measurableEmbedding]
  simpa only [Function.comp_def, jumpDensity_neg, neg_preimage, neg_Iio, neg_neg] using hp

theorem integral_jumpDensity_jumpTail {ε : ℝ} (hε : 0 < ε) :
    (∫ v in jumpTail ε, jumpDensity v) = 2 / (exp ε - 1) := by
  have hi := integrableOn_jumpDensity_jumpTail hε
  rw [jumpTail_eq] at hi ⊢
  rw [setIntegral_union (by
    apply disjoint_left.mpr
    intro v hv hn
    simp only [mem_Iio, mem_Ioi] at hv hn
    linarith) measurableSet_Ioi
      (hi.mono_set subset_union_left) (hi.mono_set subset_union_right)]
  have hn : (∫ v in Iio (-ε), jumpDensity v) = ∫ v in Ioi ε, jumpDensity v := by
    rw [← integral_Iic_eq_integral_Iio, ← integral_comp_neg_Ioi ε]
    simp only [jumpDensity_neg]
  rw [hn, integral_jumpDensity_Ioi hε]
  ring

/-- The cutoff is strictly positive, so this restriction is a finite measure. -/
def truncatedJumpMeasure (ε : {r : ℝ // 0 < r}) : Measure ℝ :=
  jumpMeasure.restrict (jumpTail ε.val)

theorem truncatedJumpMeasure_mass (ε : {r : ℝ // 0 < r}) :
    truncatedJumpMeasure ε univ = ENNReal.ofReal (2 / (exp ε.val - 1)) := by
  rw [truncatedJumpMeasure, Measure.restrict_apply_univ, jumpMeasure,
    withDensity_apply _ (measurableSet_jumpTail _),
    ← ofReal_integral_eq_lintegral_ofReal (integrableOn_jumpDensity_jumpTail ε.property)
      (Eventually.of_forall fun v => jumpDensity_nonneg v),
    integral_jumpDensity_jumpTail ε.property]

instance truncatedJumpMeasure_isFinite (ε : {r : ℝ // 0 < r}) :
    IsFiniteMeasure (truncatedJumpMeasure ε) := ⟨by rw [truncatedJumpMeasure_mass]; exact ENNReal.ofReal_lt_top⟩

theorem truncatedJumpMeasure_mass_real (ε : {r : ℝ // 0 < r}) :
    (truncatedJumpMeasure ε).real univ = 2 / (exp ε.val - 1) := by
  rw [measureReal_def, truncatedJumpMeasure_mass, ENNReal.toReal_ofReal]
  exact div_nonneg (by norm_num) (sub_nonneg.mpr (one_le_exp ε.property.le))

theorem truncatedJumpMeasure_mass_le (ε : {r : ℝ // 0 < r}) :
    (truncatedJumpMeasure ε).real univ ≤ 2 / ε.val := by
  rw [truncatedJumpMeasure_mass_real]
  exact div_le_div_of_nonneg_left (by norm_num) ε.property (by linarith [add_one_le_exp ε.val])

theorem integrable_id_truncatedJumpMeasure (ε : {r : ℝ // 0 < r}) :
    Integrable (fun v : ℝ => v) (truncatedJumpMeasure ε) := by
  apply ((integrable_sq_jumpMeasure.restrict (s := jumpTail ε.val)).div_const ε.val).mono'
    measurable_id.aestronglyMeasurable
  filter_upwards [ae_restrict_mem (measurableSet_jumpTail ε.val)] with v hv
  change ε.val < |v| at hv
  change |v| ≤ v^2 / ε.val
  apply (le_div_iff₀ ε.property).mpr
  nlinarith [mul_le_mul_of_nonneg_left hv.le (abs_nonneg v), sq_abs v]

theorem integral_sq_truncatedJumpMeasure_le (ε : {r : ℝ // 0 < r}) :
    (∫ v, v^2 ∂truncatedJumpMeasure ε) ≤ jumpSecondMoment := by
  exact integral_mono_measure Measure.restrict_le_self
    (Eventually.of_forall fun v => sq_nonneg v) integrable_sq_jumpMeasure

end GGC.LogRate
