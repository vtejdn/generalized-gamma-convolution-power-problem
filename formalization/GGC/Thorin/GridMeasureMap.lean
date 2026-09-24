import GGC.Thorin.GridMeasure

/-! # The rounded rate pushforward as a finite atomic measure -/

noncomputable section
open MeasureTheory Set
open scoped BigOperators ENNReal
namespace GGC.ThorinApproximation

/-- Distinct ceiling indices define disjoint grid cells. -/
theorem disjoint_cells (n : ℕ) {i j : Grid n} (hij : i ≠ j) :
    Disjoint (cell n i) (cell n j) := by
  apply Set.disjoint_left.mpr
  intro b hbi hbj
  exact hij (Fin.ext (hbi.2.symm.trans hbj.2))

/-- Rounding the restricted Thorin measure is exactly the finite weighted
Dirac sum, before converting its finite cell masses to real gamma shapes.
This identity itself is valid for every measure, without admissibility. -/
theorem map_restrict_window_roundedRate (U : Measure PosReal) (n : ℕ) :
    (U.restrict (window n)).map (roundedRate n) =
      ∑ j : Grid n, U (cell n j) • Measure.dirac (gridRate n j) := by
  classical
  ext s hs
  rw [Measure.map_apply (measurable_roundedRate n) hs,
    Measure.restrict_apply ((measurable_roundedRate n) hs)]
  let C : Grid n → Set PosReal := fun j =>
    if gridRate n j ∈ s then cell n j else ∅
  have hC : ∀ j, MeasurableSet (C j) := by
    intro j
    dsimp [C]
    split_ifs <;> simp [measurableSet_cell]
  have hdisj : Pairwise (fun i j => Disjoint (C i) (C j)) := by
    intro i j hij
    dsimp [C]
    split_ifs <;> simp [disjoint_cells n hij]
  have hset : roundedRate n ⁻¹' s ∩ window n = ⋃ j, C j := by
    ext b
    constructor
    · rintro ⟨hb, hw⟩
      let j : Grid n := ⟨cellIndex n b, Nat.lt_succ_of_le (cellIndex_le n hw)⟩
      have hc : b ∈ cell n j := ⟨hw, rfl⟩
      have hj : gridRate n j ∈ s := by
        simpa only [Set.mem_preimage, roundedRate_eq_gridRate n j hc] using hb
      exact mem_iUnion.mpr ⟨j, by simpa [C, hj] using hc⟩
    · intro hb
      obtain ⟨j, hj⟩ := mem_iUnion.mp hb
      by_cases hs' : gridRate n j ∈ s
      · have hc : b ∈ cell n j := by simpa [C, hs'] using hj
        exact ⟨by simpa only [Set.mem_preimage, roundedRate_eq_gridRate n j hc] using hs', hc.1⟩
      · simp [C, hs'] at hj
  rw [hset, measure_iUnion hdisj hC, tsum_fintype]
  simp only [Measure.coe_finsetSum, Finset.sum_apply, Measure.smul_apply]
  apply Finset.sum_congr rfl
  intro j _
  by_cases hj : gridRate n j ∈ s <;>
    simp [C, hj, Measure.dirac_apply' _ hs]

end GGC.ThorinApproximation
