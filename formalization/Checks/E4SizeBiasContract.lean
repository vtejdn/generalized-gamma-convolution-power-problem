import GGC.Foundations.DirichletSizeBias

/-!
# E4.0 size-bias and stationarity boundary checks

Creator: constructor. Maintainer: shared designer-constructor. Status: active.
Target: Blueprint 25.2 / API-077. These checks cover shape zero, a zero selected
coordinate, a single positive coordinate, and the complete product-law endpoint.
They do not constitute independent acceptance or prove T1/J2.
Run from formalization with pinned Lean v4.32.2:
`lake env lean Checks/E4SizeBiasContract.lean`.
Production: GGC/Foundations/DirichletSizeBias.lean. Evidence belongs in the
construction report. Retain as the boundary/contract regression check.
-/

noncomputable section
open MeasureTheory ProbabilityTheory GGC.RandomMeasure
open scoped NNReal ENNReal BigOperators

example : (gammaShapeLaw 0 : Measure ℝ).withDensity (fun x => ENNReal.ofReal x) = 0 := by
  simpa using gammaShape_withDensity_self 0

example (a : Fin 0 → ℝ≥0) (ha : ∑ i, a i ≠ 0) : False := ha (by simp)

example {n : ℕ} (a : Fin n → ℝ≥0) (ha : ∑ i, a i ≠ 0)
    (j : Fin n) (hj : a j = 0) :
    (dirichletLaw a : Measure (Fin n → ℝ)).withDensity
      (fun x => ENNReal.ofReal (x j)) = 0 := by
  simp [dirichlet_withDensity_coordinate a ha j, hj]

example (c : ℝ≥0) (hc : c ≠ 0) :
    (dirichletLaw (fun _ : Fin 1 => c) : Measure (Fin 1 → ℝ)).withDensity
      (fun x => ENNReal.ofReal (x 0)) =
    (dirichletLaw (incrementShape (fun _ : Fin 1 => c) 0) : Measure (Fin 1 → ℝ)) := by
  have hp : (c : ℝ) ≠ 0 := by exact_mod_cast hc
  simpa [hp] using dirichlet_withDensity_coordinate (fun _ : Fin 1 => c)
    (by simpa using hc) 0

example {n : ℕ} (a : Fin n → ℝ≥0) (ha : ∑ i, a i ≠ 0) :
    Measure.map (fun p : Fin n × ((Fin n → ℝ) × ℝ) => coordinateMixture p.1 p.2)
      ((coordinateChoice a).prod ((dirichletLaw a : Measure (Fin n → ℝ)).prod
        (betaMeasure 1 (∑ i, (a i : ℝ))))) =
      (dirichletLaw a : Measure (Fin n → ℝ)) := dirichlet_stationary_update a ha

#print axioms gammaShape_withDensity_self
#print axioms gammaVector_withDensity_coordinate
#print axioms gammaVector_map_normalize_withDensity
#print axioms dirichlet_withDensity_coordinate
#print axioms dirichlet_weighted_increment
#print axioms coordinateChoice_isProbabilityMeasure
#print axioms dirichlet_stationary_update
