import GGC.Thorin.Approximation

/-! # Finite cell masses of the upward Thorin grid -/

noncomputable section
open MeasureTheory Set Filter Topology
open scoped BigOperators ENNReal
namespace GGC.ThorinApproximation

abbrev Grid (n : ℕ) := Fin ((n + 1)^2 + 1)

def cell (n : ℕ) (j : Grid n) : Set PosReal :=
  window n ∩ {b | cellIndex n b = j.val}

theorem measurableSet_cell (n : ℕ) (j : Grid n) : MeasurableSet (cell n j) :=
  (measurableSet_window n).inter ((measurable_cellIndex n) (measurableSet_singleton _))

theorem cell_mass_lt_top {U : Measure PosReal} (hU : ThorinAdmissible U)
    (n : ℕ) (j : Grid n) : U (cell n j) < ∞ :=
  (measure_mono (fun _ hb => hb.1.2)).trans_lt (hU.measure_le_lt_top (scale n) (scale_pos n))

/-- Cell zero is empty; it is assigned any positive rate before its zero weight is discarded. -/
def gridRate (n : ℕ) (j : Grid n) : PosReal :=
  if h : 0 < j.val then ⟨(j.val : ℝ) / scale n, div_pos (by exact_mod_cast h) (scale_pos n)⟩
  else ⟨1, zero_lt_one⟩

theorem roundedRate_eq_gridRate (n : ℕ) (j : Grid n) {b : PosReal} (hb : b ∈ cell n j) :
    roundedRate n b = gridRate n j := by
  have hj : 0 < j.val := hb.2 ▸ cellIndex_pos n b
  have hi : cellIndex n b = j.val := hb.2
  apply Subtype.ext
  simp [gridRate, hj, roundedRate, hi]

theorem kernel_eq_sum (n : ℕ) (s : ℝ) (b : PosReal) :
    kernel n s b = ∑ j : Grid n,
      (cell n j).indicator (fun _ => Real.log (1 + s / (gridRate n j).val)) b := by
  classical
  by_cases hb : b ∈ window n
  · let j : Grid n := ⟨cellIndex n b, Nat.lt_succ_of_le (cellIndex_le n hb)⟩
    have hc : b ∈ cell n j := ⟨hb, rfl⟩
    rw [Finset.sum_eq_single j]
    · rw [kernel, indicator_of_mem hb, indicator_of_mem hc, roundedRate_eq_gridRate n j hc]
    · intro k _ hkj
      apply indicator_of_notMem
      intro hbk
      apply hkj
      apply Fin.ext
      exact hbk.2.symm
    · simp
  · rw [kernel, indicator_of_notMem hb]
    symm
    apply Finset.sum_eq_zero
    intro j _
    exact indicator_of_notMem (fun hc => hb hc.1) _

theorem integrable_cell_indicator {U : Measure PosReal} (hU : ThorinAdmissible U)
    (n : ℕ) (j : Grid n) (c : ℝ) : Integrable ((cell n j).indicator (fun _ => c)) U := by
  rw [integrable_indicator_iff (measurableSet_cell n j)]
  exact (integrableOn_const_iff).mpr (Or.inr (cell_mass_lt_top hU n j))

theorem integral_kernel_eq_sum {U : Measure PosReal} (hU : ThorinAdmissible U)
    (n : ℕ) (s : ℝ) :
    (∫ b, kernel n s b ∂U) =
      ∑ j : Grid n, (U (cell n j)).toReal * Real.log (1 + s / (gridRate n j).val) := by
  simp_rw [kernel_eq_sum]
  rw [integral_finsetSum _ (fun j _ => integrable_cell_indicator hU n j _)]
  apply Finset.sum_congr rfl
  intro j _
  rw [integral_indicator (measurableSet_cell n j), integral_const]
  simp [Measure.real, smul_eq_mul]

theorem integral_kernel_nonneg {U : Measure PosReal}
    (n : ℕ) {s : ℝ} (hs : 0 ≤ s) : 0 ≤ ∫ b, kernel n s b ∂U :=
  integral_nonneg (kernel_nonneg n hs)

theorem integral_kernel_le {U : Measure PosReal} (hU : ThorinAdmissible U)
    (n : ℕ) {s : ℝ} (hs : 0 ≤ s) :
    (∫ b, kernel n s b ∂U) ≤ ∫ b : PosReal, Real.log (1 + s / b.val) ∂U :=
  integral_mono (integrable_kernel hU n hs) (hU.integrable_log hs) (kernel_le n hs)

end GGC.ThorinApproximation
