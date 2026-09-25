import GGC.Foundations.GammaDirichlet
import GGC.Foundations.Posterior

/-!
# Dirichlet coordinate updates and the Beta atom posterior

An independent shape-one Gamma is added to the selected coordinate. Zero
selected shape is allowed. Finite partition laws then give the full posterior
statement for arbitrary Dirichlet-process laws and Beta weight realizations.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped NNReal ENNReal BigOperators
namespace GGC.RandomMeasure

/-- Add one to a selected Dirichlet shape, retaining all zero coordinates. -/
def incrementShape {n : ℕ} (a : Fin n → ℝ≥0) (j : Fin n) : Fin n → ℝ≥0 :=
  fun i => a i + if i = j then 1 else 0

/-- Add an independent scalar at the selected coordinate. -/
def addCoordinate {n : ℕ} (j : Fin n) (p : ℝ × (Fin n → ℝ)) : Fin n → ℝ :=
  fun i => p.2 i + if i = j then p.1 else 0

@[fun_prop] theorem measurable_addCoordinate {n : ℕ} (j : Fin n) :
    Measurable (addCoordinate j) := by
  apply measurable_pi_iff.2
  intro i
  unfold addCoordinate
  split_ifs <;> fun_prop

/-- Adding a shape-one Gamma changes exactly one shape. The proof splits the
finite product at that coordinate and reuses Gamma shape addition. -/
theorem gammaVector_addCoordinate {n : ℕ} (a : Fin n → ℝ≥0) (j : Fin n) :
    Measure.map (addCoordinate j)
      ((gammaShapeLaw 1 : Measure ℝ).prod
        (Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ)))) =
    Measure.pi (fun i => (gammaShapeLaw (incrementShape a j i) : Measure ℝ)) := by
  cases n with
  | zero => exact Fin.elim0 j
  | succ n =>
    let μ := (gammaShapeLaw 1 : Measure ℝ)
    let ν := (gammaShapeLaw (a j) : Measure ℝ)
    let τ := Measure.pi (fun i : Fin n => (gammaShapeLaw (a (j.succAbove i)) : Measure ℝ))
    let e := MeasurableEquiv.piFinSuccAbove (fun _ : Fin (n+1) => ℝ) j
    have hs := measurePreserving_piFinSuccAbove
      (fun i => (gammaShapeLaw (a i) : Measure ℝ)) j
    have ha : MeasurePreserving (fun p : ℝ × ℝ => p.2 + p.1)
        (μ.prod ν) (gammaShapeLaw (a j + 1) : Measure ℝ) := by
      refine ⟨by fun_prop, ?_⟩
      simpa [μ, ν, add_comm] using gammaShape_sum 1 (a j)
    have h := (ha.prod (MeasurePreserving.id τ)).comp
      ((measurePreserving_prodAssoc μ ν τ).symm.comp
        ((MeasurePreserving.id μ).prod hs))
    have ht := measurePreserving_piFinSuccAbove
      (fun i => (gammaShapeLaw (incrementShape a j i) : Measure ℝ)) j
    apply e.map_measurableEquiv_injective
    rw [Measure.map_map e.measurable (measurable_addCoordinate j)]
    have he : e ∘ addCoordinate j =
        (Prod.map (fun p : ℝ × ℝ => p.2+p.1) id) ∘
        MeasurableEquiv.prodAssoc.symm ∘ Prod.map id e := by
      funext p
      apply Prod.ext
      · simp [e, MeasurableEquiv.piFinSuccAbove, Fin.insertNthEquiv,
          addCoordinate, Function.comp_def, Prod.map, MeasurableEquiv.prodAssoc]
      · ext i
        simp [e, MeasurableEquiv.piFinSuccAbove, Fin.insertNthEquiv,
          addCoordinate, Function.comp_def, Prod.map, MeasurableEquiv.prodAssoc,
          Fin.removeNth, Fin.succAbove_ne]
    rw [he, h.map_eq, ht.map_eq]
    simp [incrementShape, Fin.succAbove_ne, τ]

/-- Convex mixing with a selected simplex vertex, defined on real weights. -/
def coordinateMixture {n : ℕ} (j : Fin n) (p : (Fin n → ℝ) × ℝ) : Fin n → ℝ :=
  fun i => (1-p.2)*p.1 i + if i = j then p.2 else 0

@[fun_prop] theorem measurable_coordinateMixture {n : ℕ} (j : Fin n) :
    Measurable (coordinateMixture j) := by
  apply measurable_pi_iff.2
  intro i
  unfold coordinateMixture
  split_ifs <;> fun_prop


/-- A positive total shape gives a strictly positive Gamma-vector total. -/
theorem gammaVector_sum_pos {n : ℕ} (a : Fin n → ℝ≥0) (ha : ∑ i, a i ≠ 0) :
    ∀ᵐ x ∂Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ)), 0 < ∑ i, x i := by
  have he : ∃ j, a j ≠ 0 := by
    by_contra h
    apply ha
    apply Finset.sum_eq_zero
    intro i _
    by_contra hi
    exact h ⟨i, hi⟩
  obtain ⟨j, hj⟩ := he
  have hp : ∀ᵐ x ∂Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ)), 0 < x j :=
    Measure.tendsto_eval_ae_ae.eventually (gammaShapeLaw_pos hj)
  filter_upwards [gammaVector_nonneg a, hp] with x hx hjx
  exact Finset.sum_pos' (fun i _ => hx i) ⟨j, Finset.mem_univ j, hjx⟩

/-- The normalized vector and the independent Gamma ratio have the product
of the Dirichlet law and Beta(1,total), including zero vector coordinates. -/
theorem gammaVector_normalize_ratio {n : ℕ} (a : Fin n → ℝ≥0) (ha : ∑ i, a i ≠ 0) :
    Measure.map (fun p : ℝ × (Fin n → ℝ) =>
      (normalize p.2, p.1 / (p.1 + ∑ i, p.2 i)))
      ((gammaShapeLaw 1 : Measure ℝ).prod
        (Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ)))) =
    (dirichletLaw a : Measure (Fin n → ℝ)).prod (betaMeasure 1 (∑ i, (a i : ℝ))) := by
  let μ := (gammaShapeLaw 1 : Measure ℝ)
  let ν := (dirichletLaw a : Measure (Fin n → ℝ))
  let τ := (gammaShapeLaw (∑ i, a i) : Measure ℝ)
  have ht : MeasurePreserving (fun x : Fin n → ℝ => (normalize x, ∑ i, x i))
      (Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ))) (ν.prod τ) :=
    ⟨(measurable_normalize n).prodMk (by fun_prop), gammaVector_normalize_sum a⟩
  have hr : MeasurePreserving (fun p : ℝ × ℝ => p.1 / (p.1+p.2))
      (μ.prod τ) (gammaRatioLaw 1 (∑ i, a i) : Measure ℝ) := ⟨by fun_prop, rfl⟩
  have h := ((MeasurePreserving.id ν).prod hr).comp
    ((measurePreserving_swap_first_two μ ν τ).comp ((MeasurePreserving.id μ).prod ht))
  simpa [Function.comp_def, Prod.map, ν, gammaRatioLaw_of_pos one_ne_zero ha,
    NNReal.coe_sum] using h.map_eq

/-- Normalizing an added coordinate is the corresponding convex vertex mixture. -/
theorem normalize_addCoordinate {n : ℕ} (j : Fin n) (r : ℝ) (x : Fin n → ℝ)
    (hr : 0 < r) (hx : 0 < ∑ i, x i) :
    normalize (addCoordinate j (r,x)) =
      coordinateMixture j (normalize x, r / (r + ∑ i, x i)) := by
  have hs : (∑ i, addCoordinate j (r,x) i) = (∑ i, x i) + r := by
    simp [addCoordinate, Finset.sum_add_distrib]
  have ht := (add_pos hr hx).ne'
  ext i
  simp only [normalize, coordinateMixture]
  rw [hs]
  simp only [addCoordinate]
  split_ifs <;> field_simp <;> ring

/-- The finite Dirichlet coordinate update, with no positivity assumption on
individual shapes or on the selected coordinate. -/
theorem dirichlet_coordinate_update {n : ℕ} (a : Fin n → ℝ≥0)
    (ha : ∑ i, a i ≠ 0) (j : Fin n) :
    Measure.map (coordinateMixture j)
      ((dirichletLaw a : Measure (Fin n → ℝ)).prod
        (betaMeasure 1 (∑ i, (a i : ℝ)))) =
    (dirichletLaw (incrementShape a j) : Measure (Fin n → ℝ)) := by
  rw [← gammaVector_normalize_ratio a ha,
    Measure.map_map (measurable_coordinateMixture j) (by
      exact ((measurable_normalize n).comp measurable_snd).prodMk (by fun_prop)),
    dirichletLaw_toMeasure, ← gammaVector_addCoordinate a j,
    Measure.map_map (measurable_normalize n) (measurable_addCoordinate j)]
  apply Measure.map_congr
  apply (Measure.ae_prod_iff_ae_ae (measurableSet_eq_fun
    ((measurable_coordinateMixture j).comp
      (((measurable_normalize n).comp measurable_snd).prodMk (by fun_prop)))
    ((measurable_normalize n).comp (measurable_addCoordinate j)))).2
  filter_upwards [gammaShapeLaw_pos (a := 1) one_ne_zero] with r hr
  filter_upwards [gammaVector_sum_pos a ha] with x hx
  exact (normalize_addCoordinate j r x hr hx).symm


variable {E : Type*} [MeasurableSpace E]

/-- Finite partition shapes sum to the base mass, including empty cells. -/
theorem Partition.sum_shape {n : ℕ} (p : Partition E n) (U : Measure E)
    [IsFiniteMeasure U] :
    (∑ i, (U (p.cell i)).toNNReal) = (U univ).toNNReal := by
  have h := measure_iUnion p.disjoint p.measurable_cell (μ := U)
  rw [p.covers, tsum_fintype] at h
  rw [← ENNReal.toNNReal_sum (fun i _ => measure_ne_top U _), ← h]

/-- A partition evaluates the atom mixture as a vertex mixture. -/
theorem partitionEval_atomMixture {n : ℕ} (p : Partition E n) (j : Fin n)
    (b : E) (hc : ∀ i, b ∈ p.cell i ↔ i = j)
    (Q : ProbabilityMeasure E) (z : UnitWeight) :
    partitionEval p (atomMixture Q z b) =
      coordinateMixture j (partitionEval p Q, z.val) := by
  ext i
  simp only [partitionEval, atomMixture_toMeasure, Measure.add_apply,
    Measure.smul_apply, smul_eq_mul, coordinateMixture]
  rw [ENNReal.toReal_add (ENNReal.mul_ne_top ENNReal.ofReal_ne_top (measure_ne_top _ _))
    (ENNReal.mul_ne_top ENNReal.ofReal_ne_top (measure_ne_top _ _))]
  rw [ENNReal.toReal_mul, ENNReal.toReal_mul,
    ENNReal.toReal_ofReal (sub_nonneg.mpr z.property.2),
    ENNReal.toReal_ofReal z.property.1,
    Measure.dirac_apply' b (p.measurable_cell i)]
  by_cases hi : i = j <;> simp [hc, hi]

/-- Adding an atom increments exactly its partition cell's shape. -/
theorem Partition.shape_add_dirac {n : ℕ} (p : Partition E n) (U : Measure E)
    [IsFiniteMeasure U] (j : Fin n) (b : E) (hc : ∀ i, b ∈ p.cell i ↔ i = j) :
    (fun i => ((U + Measure.dirac b) (p.cell i)).toNNReal) =
      incrementShape (fun i => (U (p.cell i)).toNNReal) j := by
  ext i
  rw [Measure.add_apply, ENNReal.toNNReal_add (measure_ne_top _ _) (measure_ne_top _ _),
    Measure.dirac_apply' b (p.measurable_cell i)]
  by_cases hi : i = j <;> simp [incrementShape, hc, hi]

/-- The complete Beta atom posterior, proved from finite Gamma vectors.
No topology, choice of sampler, or positivity of individual cells is required. -/
theorem beta_atom_posterior
    (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B)
    (Z : ProbabilityMeasure UnitWeight)
    (hZ : Measure.map (fun z : UnitWeight => z.val) (Z : Measure UnitWeight) =
      betaMeasure 1 B) (b : E) :
    IsDirichletProcess (U + Measure.dirac b) (atomMixtureLaw D Z b) := by
  letI : IsFiniteMeasure U := hD.isFiniteMeasure
  refine ⟨inferInstance, ?_, ?_⟩
  · simp [Measure.add_apply]
  · intro n p
    obtain ⟨j, hj⟩ : ∃ j, b ∈ p.cell j := by
      have hm : b ∈ ⋃ i, p.cell i := by rw [p.covers]; trivial
      exact mem_iUnion.mp hm
    have hc : ∀ i, b ∈ p.cell i ↔ i = j := by
      intro i
      constructor
      · intro hi
        by_contra hn
        exact Set.disjoint_left.mp (p.disjoint hn) hi hj
      · rintro rfl
        exact hj
    let a : Fin n → ℝ≥0 := fun i => (U (p.cell i)).toNNReal
    have hs : (∑ i, (a i : ℝ)) = B := by
      rw [← NNReal.coe_sum, p.sum_shape U, hMass]
      exact ENNReal.toReal_ofReal hB.le
    have ha : ∑ i, a i ≠ 0 := by
      intro hz
      have he := congrArg (fun z : ℝ≥0 => (z : ℝ)) hz
      simp only [NNReal.coe_sum, NNReal.coe_zero, hs] at he
      exact hB.ne' he
    have hd : Measure.map (partitionEval p) (D : Measure (ProbabilityMeasure E)) =
        (dirichletLaw a : Measure (Fin n → ℝ)) :=
      congrArg (fun P : ProbabilityMeasure (Fin n → ℝ) => (P : Measure (Fin n → ℝ))) (hD.2.2 n p)
    have hp : Measure.map (fun x : ProbabilityMeasure E × UnitWeight =>
        (partitionEval p x.1, x.2.val))
        ((D : Measure _).prod (Z : Measure _)) =
        (dirichletLaw a : Measure _).prod (betaMeasure 1 B) := by
      change Measure.map (Prod.map (partitionEval p) (fun z : UnitWeight => z.val))
        ((D : Measure _).prod (Z : Measure _)) = _
      rw [← Measure.map_prod_map _ _ (measurable_partitionEval p) measurable_subtype_coe,
        hd, hZ]
    apply ProbabilityMeasure.toMeasure_injective
    change Measure.map (partitionEval p) (atomMixtureLaw D Z b : Measure _) = _
    rw [atomMixtureLaw_toMeasure,
      Measure.map_map (measurable_partitionEval p) (measurable_atomMixture_sample b)]
    have he : (partitionEval p) ∘
        (fun x : ProbabilityMeasure E × UnitWeight => atomMixture x.1 x.2 b) =
        (coordinateMixture j) ∘ (fun x : ProbabilityMeasure E × UnitWeight =>
          (partitionEval p x.1, x.2.val)) := by
      funext x
      exact partitionEval_atomMixture p j b hc x.1 x.2
    have mm : Measurable (fun x : ProbabilityMeasure E × UnitWeight =>
        (partitionEval p x.1, x.2.val)) := by
      exact ((measurable_partitionEval p).comp measurable_fst).prodMk
        (measurable_subtype_coe.comp measurable_snd)
    rw [he, ← Measure.map_map (measurable_coordinateMixture j) mm, hp,
      p.shape_add_dirac U j b hc, ← hs]
    exact dirichlet_coordinate_update a ha j

end GGC.RandomMeasure
