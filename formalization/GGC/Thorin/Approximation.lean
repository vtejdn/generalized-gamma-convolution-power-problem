import GGC.Thorin.Basic
import Mathlib.MeasureTheory.Function.Floor
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-! # Upward rate grids and dominated Thorin kernel approximation

The cutoff and upward rounding are applied on the original admissible measure.
No normalization, finite total mass, or realizing probability law is assumed.
-/

noncomputable section
open MeasureTheory Set Filter Topology
namespace GGC.ThorinApproximation

/-- The positive integer mesh scale. -/
def scale (n : ℕ) : ℝ := n + 1

theorem scale_pos (n : ℕ) : 0 < scale n := by unfold scale; positivity

/-- Compact rate window used for the nth approximation. -/
def window (n : ℕ) : Set PosReal := {b | 1 / scale n ≤ b.val ∧ b.val ≤ scale n}

theorem measurableSet_window (n : ℕ) : MeasurableSet (window n) :=
  (measurableSet_le measurable_const measurable_subtype_coe).inter
    (measurableSet_le measurable_subtype_coe measurable_const)

/-- Natural ceiling index; positivity prevents a zero rounded rate. -/
def cellIndex (n : ℕ) (b : PosReal) : ℕ := ⌈scale n * b.val⌉₊

theorem cellIndex_pos (n : ℕ) (b : PosReal) : 0 < cellIndex n b := by
  exact Nat.one_le_ceil_iff.mpr (mul_pos (scale_pos n) b.property)

/-- Upward-rounded rate on the mesh of size 1/(n+1). -/
def roundedRate (n : ℕ) (b : PosReal) : PosReal :=
  ⟨(cellIndex n b : ℝ) / scale n, div_pos (by exact_mod_cast cellIndex_pos n b) (scale_pos n)⟩

theorem measurable_cellIndex (n : ℕ) : Measurable (cellIndex n) :=
  Nat.measurable_ceil.comp (measurable_const.mul measurable_subtype_coe)

theorem measurable_roundedRate (n : ℕ) : Measurable (roundedRate n) := by
  apply Measurable.subtype_mk
  exact ((measurable_of_countable (fun j : ℕ => (j : ℝ))).comp (measurable_cellIndex n)).div_const _

theorem le_roundedRate (n : ℕ) (b : PosReal) : b.val ≤ (roundedRate n b).val := by
  exact (le_div_iff₀ (scale_pos n)).mpr (by simpa [cellIndex, mul_comm] using Nat.le_ceil (scale n * b.val))

theorem roundedRate_lt (n : ℕ) (b : PosReal) :
    (roundedRate n b).val < b.val + 1 / scale n := by
  change (cellIndex n b : ℝ) / scale n < _
  apply (div_lt_iff₀ (scale_pos n)).mpr
  have h := Nat.ceil_lt_add_one (le_of_lt (mul_pos (scale_pos n) b.property))
  dsimp [cellIndex]
  calc
    (⌈scale n * b.val⌉₊ : ℝ) < scale n * b.val + 1 := h
    _ = (b.val + 1 / scale n) * scale n := by field_simp [(scale_pos n).ne']

theorem tendsto_scale : Tendsto scale atTop atTop := by
  exact tendsto_atTop_add_const_right _ 1 tendsto_natCast_atTop_atTop

theorem tendsto_inv_scale : Tendsto (fun n => 1 / scale n) atTop (𝓝 0) := by
  simpa only [one_div, Function.comp_def] using tendsto_inv_atTop_zero.comp tendsto_scale

theorem tendsto_roundedRate (b : PosReal) :
    Tendsto (fun n => (roundedRate n b).val) atTop (𝓝 b.val) := by
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds
    (show Tendsto (fun n => b.val + 1 / scale n) atTop (𝓝 b.val) from by simpa only [add_zero] using tendsto_const_nhds.add tendsto_inv_scale)
  · exact fun n => le_roundedRate n b
  · exact fun n => (roundedRate_lt n b).le

theorem eventually_mem_window (b : PosReal) : ∀ᶠ n in atTop, b ∈ window n := by
  filter_upwards [tendsto_inv_scale.eventually (gt_mem_nhds b.property),
    tendsto_scale.eventually (eventually_ge_atTop b.val)] with n hn hm
  exact ⟨hn.le, hm⟩

theorem cellIndex_le (n : ℕ) {b : PosReal} (hb : b ∈ window n) :
    cellIndex n b ≤ (n + 1)^2 := by
  apply Nat.ceil_le.mpr
  have h := mul_le_mul_of_nonneg_left hb.2 (scale_pos n).le
  simpa [scale, pow_two, Nat.cast_add, Nat.cast_mul] using h

/-- The rounded logarithmic kernel, extended by zero off the finite window. -/
def kernel (n : ℕ) (s : ℝ) (b : PosReal) : ℝ :=
  (window n).indicator (fun b => Real.log (1 + s / (roundedRate n b).val)) b

theorem measurable_kernel (n : ℕ) (s : ℝ) : Measurable (kernel n s) := by
  exact (Real.measurable_log.comp (measurable_const.add
    (measurable_const.div (measurable_roundedRate n).subtype_val))).indicator (measurableSet_window n)

theorem kernel_nonneg (n : ℕ) {s : ℝ} (hs : 0 ≤ s) (b : PosReal) : 0 ≤ kernel n s b := by
  apply Set.indicator_nonneg
  intro b _
  exact Real.log_nonneg (by linarith [div_nonneg hs (roundedRate n b).property.le])

theorem kernel_le (n : ℕ) {s : ℝ} (hs : 0 ≤ s) (b : PosReal) :
    kernel n s b ≤ Real.log (1 + s / b.val) := by
  by_cases hb : b ∈ window n
  · rw [kernel, indicator_of_mem hb]
    apply Real.log_le_log (by have hp := (roundedRate n b).property; positivity)
    exact add_le_add_right (div_le_div_of_nonneg_left hs b.property (le_roundedRate n b)) 1
  · rw [kernel, indicator_of_notMem hb]
    exact Real.log_nonneg (by linarith [div_nonneg hs b.property.le])

theorem tendsto_kernel {s : ℝ} (hs : 0 ≤ s) (b : PosReal) :
    Tendsto (fun n => kernel n s b) atTop (𝓝 (Real.log (1 + s / b.val))) := by
  have h := (tendsto_const_nhds.add
    (tendsto_const_nhds.div (tendsto_roundedRate b) b.property.ne')).log
    (show 1 + s / b.val ≠ 0 by have hp := b.property; positivity)
  apply h.congr'
  filter_upwards [eventually_mem_window b] with n hn
  simp only [kernel, indicator_of_mem hn, Pi.div_apply]

theorem integrable_kernel {U : Measure PosReal} (hU : ThorinAdmissible U)
    (n : ℕ) {s : ℝ} (hs : 0 ≤ s) : Integrable (kernel n s) U := by
  apply (hU.integrable_log hs).mono' (measurable_kernel n s).aestronglyMeasurable
  exact Eventually.of_forall fun b => by
    rw [Real.norm_eq_abs, abs_of_nonneg (kernel_nonneg n hs b)]
    exact kernel_le n hs b

theorem tendsto_integral_kernel {U : Measure PosReal} (hU : ThorinAdmissible U)
    {s : ℝ} (hs : 0 ≤ s) :
    Tendsto (fun n => ∫ b, kernel n s b ∂U) atTop
      (𝓝 (∫ b : PosReal, Real.log (1 + s / b.val) ∂U)) := by
  apply tendsto_integral_of_dominated_convergence (fun b : PosReal => Real.log (1 + s / b.val))
  · exact fun n => (measurable_kernel n s).aestronglyMeasurable
  · exact hU.integrable_log hs
  · intro n
    exact Eventually.of_forall fun b => by
      rw [Real.norm_eq_abs, abs_of_nonneg (kernel_nonneg n hs b)]
      exact kernel_le n hs b
  · exact Eventually.of_forall (tendsto_kernel hs)

end GGC.ThorinApproximation
