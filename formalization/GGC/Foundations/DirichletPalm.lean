import GGC.Foundations.ProbabilityMeasureExt
import GGC.Foundations.DirichletSizeBias
import Mathlib.Probability.Kernel.Composition.MeasureCompProd

/-! # Nonnegative Dirichlet Palm identity from finite coordinate size bias

The two joint measures are compared on refined partition cylinders. Empty and
zero-mass cells are retained, and all integrals are nonnegative ENNReal integrals.
-/
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped ENNReal NNReal BigOperators
namespace GGC.RandomMeasure
variable {E : Type*} [MeasurableSpace E]

theorem IsDirichletProcess.partition_map {U : Measure E}
    {D : ProbabilityMeasure (ProbabilityMeasure E)} (hD : IsDirichletProcess U D)
    {n : ℕ} (p : Partition E n) :
    Measure.map (partitionEval p) (D : Measure (ProbabilityMeasure E)) =
      (dirichletLaw (fun i => (U (p.cell i)).toNNReal) : Measure (Fin n → ℝ)) :=
  congrArg (fun P : ProbabilityMeasure (Fin n → ℝ) => (P : Measure (Fin n → ℝ))) (hD.2.2 n p)

theorem partition_shape_sum {n : ℕ} (p : Partition E n) (U : Measure E)
    [IsFiniteMeasure U] (B : ℝ) (hB : 0 < B) (hMass : U univ = ENNReal.ofReal B) :
    ∑ i, ((U (p.cell i)).toNNReal : ℝ) = B := by
  rw [← NNReal.coe_sum, p.sum_shape U, hMass]
  exact ENNReal.toReal_ofReal hB.le

theorem normalized_base_cell (U : Measure E) [IsFiniteMeasure U]
    (B : ℝ) (hB : 0 < B) (A : Set E) :
    (ENNReal.ofReal (1 / B) • U) A = ENNReal.ofReal ((U A).toReal / B) := by
  rw [Measure.smul_apply, smul_eq_mul, ENNReal.ofReal_div_of_pos hB,
    ENNReal.ofReal_div_of_pos hB, ENNReal.ofReal_one,
    ENNReal.ofReal_toReal (measure_ne_top U A)]
  simp [div_eq_mul_inv, mul_comm]

/-- Coordinate size bias transported through any supplied finite partition law. -/
theorem partition_coordinate_sizeBias {U : Measure E}
    {D : ProbabilityMeasure (ProbabilityMeasure E)} (hD : IsDirichletProcess U D)
    (B : ℝ) (hB : 0 < B) (hMass : U univ = ENNReal.ofReal B)
    {n : ℕ} (p : Partition E n) (j : Fin n) (C : Set (Fin n → ℝ))
    (hC : MeasurableSet C) :
    (∫⁻ P in partitionEval p ⁻¹' C, ENNReal.ofReal (partitionEval p P j)
      ∂(D : Measure (ProbabilityMeasure E))) =
    ENNReal.ofReal ((U (p.cell j)).toReal / B) *
      (dirichletLaw (incrementShape (fun i => (U (p.cell i)).toNNReal) j) :
        Measure (Fin n → ℝ)) C := by
  letI := hD.isFiniteMeasure
  have hs := partition_shape_sum p U B hB hMass
  have ha : ∑ i, (U (p.cell i)).toNNReal ≠ 0 := by
    intro hz
    have he := congrArg (fun t : ℝ≥0 => (t : ℝ)) hz
    simp only [NNReal.coe_sum, NNReal.coe_zero, hs] at he
    exact hB.ne' he
  rw [← setLIntegral_map hC (by fun_prop : Measurable (fun x : Fin n → ℝ =>
    ENNReal.ofReal (x j))) (measurable_partitionEval p), hD.partition_map,
    ← withDensity_apply _ hC, dirichlet_withDensity_coordinate _ ha j,
    Measure.smul_apply, smul_eq_mul, hs]
  rfl

/-- A posterior cylinder depends only on the cell containing the observed point. -/
theorem posterior_cylinder_on_cell {U : Measure E} [IsFiniteMeasure U]
    (K : E → ProbabilityMeasure (ProbabilityMeasure E))
    (hpost : ∀ b, IsDirichletProcess (U + Measure.dirac b) (K b))
    {n : ℕ} (p : Partition E n) (j : Fin n) (C : Set (Fin n → ℝ))
    (hC : MeasurableSet C) (b : E) (hb : b ∈ p.cell j) :
    (K b : Measure (ProbabilityMeasure E)) (partitionEval p ⁻¹' C) =
      (dirichletLaw (incrementShape (fun i => (U (p.cell i)).toNNReal) j) :
        Measure (Fin n → ℝ)) C := by
  have hc : ∀ i, b ∈ p.cell i ↔ i = j := by
    intro i
    constructor
    · intro hi
      by_contra hij
      exact Set.disjoint_left.mp (p.disjoint hij) hi hb
    · rintro rfl
      exact hb
  rw [← Measure.map_apply (measurable_partitionEval p) hC,
    (hpost b).partition_map, p.shape_add_dirac U j b hc]

theorem partitionCylinder_refine {n m : ℕ} (p : Partition E n) (q : Partition E m)
    (C : Set (Fin n → ℝ)) :
    partitionEval p ⁻¹' C = partitionEval (p.refine q) ⁻¹' (leftSum ⁻¹' C) := by
  ext P
  simp only [mem_preimage, leftSum_partitionEval]

/-- The sampling and posterior rectangle integrals have the same finite sum. -/
theorem dirichlet_palm_rectangle {U : Measure E}
    {D : ProbabilityMeasure (ProbabilityMeasure E)} (hD : IsDirichletProcess U D)
    (B : ℝ) (hB : 0 < B) (hMass : U univ = ENNReal.ofReal B)
    (K : E → ProbabilityMeasure (ProbabilityMeasure E)) (_hK : Measurable K)
    (hpost : ∀ b, IsDirichletProcess (U + Measure.dirac b) (K b))
    (A : Set E) (hA : MeasurableSet A) {n : ℕ} (p : Partition E n)
    (C : Set (Fin n → ℝ)) (hC : MeasurableSet C) :
    (∫⁻ P in partitionEval p ⁻¹' C, (P : Measure E) A ∂(D : Measure (ProbabilityMeasure E))) =
      ∫⁻ b in A, (K b : Measure (ProbabilityMeasure E)) (partitionEval p ⁻¹' C)
        ∂(ENNReal.ofReal (1 / B) • U) := by
  letI := hD.isFiniteMeasure
  let q := Partition.binary A hA
  let r := p.refine q
  let H : Set (Fin (n*2) → ℝ) := leftSum ⁻¹' C
  have hH : MeasurableSet H := (measurable_leftSum n 2) hC
  have hcyl : partitionEval p ⁻¹' C = partitionEval r ⁻¹' H := partitionCylinder_refine p q C
  let j : Fin n → Fin (n*2) := fun i => finProdFinEquiv (i,0)
  let T : Fin n → ℝ≥0∞ := fun i =>
    (dirichletLaw (incrementShape (fun k => (U (r.cell k)).toNNReal) (j i)) :
      Measure (Fin (n*2) → ℝ)) H
  have hl : (∫⁻ P in partitionEval p ⁻¹' C, (P : Measure E) A
      ∂(D : Measure (ProbabilityMeasure E))) =
      ∑ i : Fin n, ENNReal.ofReal ((U (r.cell (j i))).toReal / B) * T i := by
    have he (P : ProbabilityMeasure E) := measure_eq_sum_refine_binary p A hA P
    simp_rw [he, hcyl]
    change (∫⁻ P in partitionEval r ⁻¹' H, ∑ i : Fin n,
      ENNReal.ofReal (partitionEval r P (j i)) ∂(D : Measure (ProbabilityMeasure E))) = _
    rw [lintegral_finsetSum _ (fun i _ =>
      (show Measurable (fun P => ENNReal.ofReal (partitionEval r P (j i))) from
        (((measurable_pi_apply (j i)).comp (measurable_partitionEval r)).ennreal_ofReal)))]
    apply Finset.sum_congr rfl
    intro i _
    exact partition_coordinate_sizeBias hD B hB hMass r (j i) H hH
  have hu : (⋃ i : Fin n, r.cell (j i)) = A := by
    simpa only [q, Partition.binary_zero] using p.refine_right_union q (0 : Fin 2)
  have hd : Pairwise (fun i k : Fin n => Disjoint (r.cell (j i)) (r.cell (j k))) := by
    intro i k hik
    apply r.disjoint
    simpa [j] using hik
  have hr : (∫⁻ b in A, (K b : Measure (ProbabilityMeasure E)) (partitionEval p ⁻¹' C)
      ∂(ENNReal.ofReal (1 / B) • U)) =
      ∑ i : Fin n, ENNReal.ofReal ((U (r.cell (j i))).toReal / B) * T i := by
    rw [← hu, lintegral_iUnion (fun i => r.measurable_cell (j i)) hd, tsum_fintype]
    apply Finset.sum_congr rfl
    intro i _
    have he : (∫⁻ b in r.cell (j i),
        (K b : Measure (ProbabilityMeasure E)) (partitionEval p ⁻¹' C)
        ∂(ENNReal.ofReal (1 / B) • U)) =
        ∫⁻ _b in r.cell (j i), T i ∂(ENNReal.ofReal (1 / B) • U) := by
      apply setLIntegral_congr_fun (r.measurable_cell (j i))
      intro b hb
      rw [hcyl]
      exact posterior_cylinder_on_cell K hpost r (j i) H hH b hb
    rw [he, lintegral_const, Measure.restrict_apply_univ, normalized_base_cell U B hB]
    exact mul_comm _ _
  exact hl.trans hr.symm

/-- Full nonnegative one-observation disintegration on any measurable base.
The posterior law K is arbitrary subject to its finite-partition contract. -/
theorem posterior_palm_nonneg
    (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B)
    (K : E → ProbabilityMeasure (ProbabilityMeasure E)) (hK : Measurable K)
    (hpost : ∀ b, IsDirichletProcess (U + Measure.dirac b) (K b))
    (Φ : E × ProbabilityMeasure E → ℝ≥0∞) (hΦ : Measurable Φ) :
    (∫⁻ (P : ProbabilityMeasure E), ∫⁻ b, Φ (b,P) ∂(P : Measure E)
      ∂(D : Measure (ProbabilityMeasure E))) =
      ∫⁻ b, ∫⁻ P, Φ (b,P) ∂(K b : Measure (ProbabilityMeasure E))
        ∂(ENNReal.ofReal (1 / B) • U) := by
  letI := hD.isFiniteMeasure
  let F := ENNReal.ofReal (1 / B) • U
  have hF : F univ = 1 := by
    rw [normalized_base_cell U B hB, hMass, ENNReal.toReal_ofReal hB.le,
      div_self hB.ne', ENNReal.ofReal_one]
  haveI : IsProbabilityMeasure F := ⟨hF⟩
  let ev : Kernel (ProbabilityMeasure E) E :=
    ⟨fun P => (P : Measure E), measurable_subtype_coe⟩
  let post : Kernel E (ProbabilityMeasure E) :=
    ⟨fun b => (K b : Measure (ProbabilityMeasure E)), measurable_subtype_coe.comp hK⟩
  haveI : IsMarkovKernel ev := ⟨fun P => P.property⟩
  haveI : IsMarkovKernel post := ⟨fun b => (K b).property⟩
  let L := Measure.map Prod.swap ((D : Measure (ProbabilityMeasure E)) ⊗ₘ ev)
  let N := F ⊗ₘ post
  haveI : IsProbabilityMeasure L := Measure.isProbabilityMeasure_map measurable_swap.aemeasurable
  have he : L = N := by
    apply joint_measure_ext_of_partitionCylinders
    intro A hA n p C hC
    have hT := measurableSet_partitionCylinder p hC
    change Measure.map Prod.swap ((D : Measure (ProbabilityMeasure E)) ⊗ₘ ev)
        (A ×ˢ (partitionEval p ⁻¹' C)) =
      (F ⊗ₘ post) (A ×ˢ (partitionEval p ⁻¹' C))
    rw [Measure.map_apply measurable_swap (hA.prod hT), Set.preimage_swap_prod,
      Measure.compProd_apply_prod hT hA, Measure.compProd_apply_prod hA hT]
    exact dirichlet_palm_rectangle hD B hB hMass K hK hpost A hA p C hC
  have hi := congrArg (fun μ : Measure (E × ProbabilityMeasure E) => ∫⁻ x, Φ x ∂μ) he
  change (∫⁻ x, Φ x ∂Measure.map Prod.swap ((D : Measure (ProbabilityMeasure E)) ⊗ₘ ev)) =
    ∫⁻ x, Φ x ∂(F ⊗ₘ post) at hi
  rw [lintegral_map hΦ measurable_swap, Measure.lintegral_compProd
    (show Measurable (fun x : ProbabilityMeasure E × E => Φ x.swap) from hΦ.comp measurable_swap),
    Measure.lintegral_compProd hΦ] at hi
  exact hi

end GGC.RandomMeasure
