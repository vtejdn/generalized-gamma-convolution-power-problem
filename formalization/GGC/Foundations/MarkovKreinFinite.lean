import GGC.Foundations.DirichletUpdate
import GGC.FiniteGamma

/-!
# Finite-dimensional Markov-Krein transforms

The normalized Gamma joint law identifies the Dirichlet transform. Zero
coordinates use Dirac zero and require no positive-shape Gamma invocation.
-/
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped NNReal ENNReal BigOperators
namespace GGC.RandomMeasure

/-- Real powers with a fixed exponent are measurable, including at zero. -/
theorem measurable_rpow_const (r : ℝ) : Measurable (fun x : ℝ => x ^ r) := by
  apply measurable_of_continuousOn_compl_singleton 0
  intro x hx
  exact (Real.continuousAt_rpow_const x r (Or.inl (by simpa using hx))).continuousWithinAt

/-- The unit-rate Gamma Laplace formula, including shape zero. -/
theorem gammaShape_laplace (a : ℝ≥0) {t : ℝ} (ht : 0 ≤ t) :
    (∫ x, Real.exp (-t*x) ∂(gammaShapeLaw a : Measure ℝ)) =
      Real.exp (-(a : ℝ) * Real.log (1+t)) := by
  by_cases ha : a = 0
  · simp [ha]
  · rw [gammaShapeLaw_of_ne_zero ha]
    have hp : 0 < (a : ℝ) := by exact_mod_cast pos_iff_ne_zero.mpr ha
    simpa [GGC.laplace] using! GGC.laplace_gammaLaw_eq_exp
      ⟨a, hp⟩ ⟨1, zero_lt_one⟩ ht

/-- The equivalent negative-power form for a positive total shape. -/
theorem gammaShape_laplace_rpow (a : ℝ≥0) {t : ℝ} (ht : 0 ≤ t) :
    (∫ x, Real.exp (-t*x) ∂(gammaShapeLaw a : Measure ℝ)) = (1+t)^(-(a : ℝ)) := by
  rw [gammaShape_laplace a ht, Real.rpow_def_of_pos (by positivity)]
  congr 1
  ring

/-- Independence factors the weighted finite Gamma transform. -/
theorem gammaVector_laplace {n : ℕ} (a : Fin n → ℝ≥0) (c : Fin n → ℝ)
    (hc : ∀ i, 0 ≤ c i) :
    (∫ x : Fin n → ℝ, Real.exp (-(∑ i, c i*x i))
      ∂Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ))) =
      Real.exp (-(∑ i, (a i : ℝ)*Real.log (1+c i))) := by
  simp only [← Finset.sum_neg_distrib, Real.exp_sum]
  calc
    _ = ∏ i, ∫ x, Real.exp (-(c i*x)) ∂(gammaShapeLaw (a i) : Measure ℝ) :=
      integral_fintype_prod_eq_prod (fun i x => Real.exp (-(c i*x)))
    _ = _ := by
      apply Finset.prod_congr rfl
      intro i _
      simpa only [neg_mul] using gammaShape_laplace (a i) (hc i)

/-- The finite Dirichlet transform at nonnegative coefficients, with arbitrary
zero shapes and positive total shape. -/
theorem dirichlet_transform {n : ℕ} (a : Fin n → ℝ≥0) (ha : ∑ i, a i ≠ 0)
    (c : Fin n → ℝ) (hc : ∀ i, 0 ≤ c i) :
    (∫ q, (1+∑ i, c i*q i)^(-(∑ i, (a i : ℝ)))
      ∂(dirichletLaw a : Measure (Fin n → ℝ))) =
      Real.exp (-(∑ i, (a i : ℝ)*Real.log (1+c i))) := by
  let ν := (dirichletLaw a : Measure (Fin n → ℝ))
  let τ := (gammaShapeLaw (∑ i, a i) : Measure ℝ)
  let F : (Fin n → ℝ) × ℝ → ℝ := fun p => Real.exp (-(∑ i, c i*p.1 i)*p.2)
  have hq : ∀ᵐ q ∂ν, ∀ i, 0 ≤ q i := by
    dsimp [ν]
    rw [dirichletLaw_toMeasure]
    apply (ae_map_iff (measurable_normalize n).aemeasurable (by
      simp only [Set.setOf_forall]
      exact MeasurableSet.iInter fun i => measurableSet_le measurable_const
        (measurable_pi_apply i))).2
    filter_upwards [gammaVector_nonneg a] with x hx i
    exact div_nonneg (hx i) (Finset.sum_nonneg fun j _ => hx j)
  have hi : Integrable F (ν.prod τ) := by
    apply (integrable_const (1 : ℝ)).mono' (by fun_prop)
    apply (Measure.ae_prod_iff_ae_ae (by measurability)).2
    filter_upwards [hq] with q hq
    filter_upwards [gammaShapeLaw_nonneg (∑ i, a i)] with s hs
    dsimp [F]
    rw [abs_of_pos (Real.exp_pos _)]
    apply Real.exp_le_one_iff.mpr
    exact mul_nonpos_of_nonpos_of_nonneg
      (neg_nonpos.mpr (Finset.sum_nonneg fun i _ => mul_nonneg (hc i) (hq i))) hs
  have hprod : (∫ p, F p ∂ν.prod τ) =
      ∫ q, (1+∑ i, c i*q i)^(-(∑ i, (a i : ℝ))) ∂ν := by
    rw [integral_prod F hi]
    apply integral_congr_ae
    filter_upwards [hq] with q hq
    simpa [F, τ, NNReal.coe_sum] using gammaShape_laplace_rpow (∑ i, a i)
      (Finset.sum_nonneg fun i _ => mul_nonneg (hc i) (hq i))
  rw [← hprod, show ν.prod τ = _ from (gammaVector_normalize_sum a).symm,
    integral_map ((measurable_normalize n).prodMk (by fun_prop)).aemeasurable
      (by fun_prop : AEStronglyMeasurable F _)]
  calc
    _ = ∫ x : Fin n → ℝ, Real.exp (-(∑ i, c i*x i))
        ∂Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ)) := by
      apply integral_congr_ae
      filter_upwards [gammaVector_sum_pos a ha] with x hx
      dsimp [F, normalize]
      congr 1
      rw [neg_mul, neg_inj, Finset.sum_mul]
      apply Finset.sum_congr rfl
      intro i _
      field_simp
    _ = _ := gammaVector_laplace a c hc


variable {E : Type*} [MeasurableSpace E]

/-- Integrate a function constant on each cell of a finite measurable partition.
Empty and zero-measure cells require no special positivity assumption. -/
theorem Partition.integral_eq_sum {n : ℕ} (p : Partition E n) (μ : Measure E)
    [IsFiniteMeasure μ] (g : E → ℝ) (c : Fin n → ℝ)
    (hg : ∀ i x, x ∈ p.cell i → g x = c i) :
    (∫ x, g x ∂μ) = ∑ i, c i * (μ (p.cell i)).toReal := by
  have hf : g = fun x => ∑ i, (p.cell i).indicator (fun _ => c i) x := by
    funext x
    obtain ⟨j, hj⟩ : ∃ j, x ∈ p.cell j := by
      apply mem_iUnion.mp
      rw [p.covers]
      trivial
    rw [Finset.sum_eq_single j, indicator_of_mem hj, hg j x hj]
    · intro i _ hij
      apply indicator_of_notMem
      intro hi
      exact Set.disjoint_left.mp (p.disjoint hij) hi hj
    · simp
  rw [hf, integral_finsetSum _ (fun i _ =>
    (integrable_const (c i)).indicator (p.measurable_cell i))]
  apply Finset.sum_congr rfl
  intro i _
  rw [integral_indicator (p.measurable_cell i), setIntegral_const]
  simp [measureReal_def, mul_comm]

/-- Markov-Krein for any nonnegative function constant on a finite partition. -/
theorem markov_krein_partition
    (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B) {n : ℕ} (p : Partition E n)
    (g : E → ℝ) (c : Fin n → ℝ) (hc : ∀ i, 0 ≤ c i)
    (hg : ∀ i x, x ∈ p.cell i → g x = c i) :
    (∫ P, (1 + ∫ x, g x ∂(P : Measure E))^(-B)
      ∂(D : Measure (ProbabilityMeasure E))) =
      Real.exp (-(∫ x, Real.log (1 + g x) ∂U)) := by
  letI : IsFiniteMeasure U := hD.isFiniteMeasure
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
    congrArg (fun P : ProbabilityMeasure (Fin n → ℝ) => (P : Measure (Fin n → ℝ)))
      (hD.2.2 n p)
  have hlog : (∫ x, Real.log (1 + g x) ∂U) =
      ∑ i, (a i : ℝ)*Real.log (1+c i) := by
    rw [p.integral_eq_sum U (fun x => Real.log (1+g x))
      (fun i => Real.log (1+c i)) (fun i x hx => by rw [hg i x hx])]
    apply Finset.sum_congr rfl
    intro i _
    exact mul_comm _ _
  rw [hlog]
  calc
    _ = ∫ P, (1 + ∑ i, c i * partitionEval p P i)^(-B)
        ∂(D : Measure (ProbabilityMeasure E)) := by
      apply integral_congr_ae
      exact Eventually.of_forall fun P => by dsimp only; rw [p.integral_eq_sum (P : Measure E) g c hg]; rfl
    _ = ∫ q, (1 + ∑ i, c i*q i)^(-B) ∂(dirichletLaw a : Measure (Fin n → ℝ)) := by
      have hm : Measurable (fun q : Fin n → ℝ => (1+∑ i, c i*q i)^(-B)) :=
        (measurable_rpow_const (-B)).comp (by fun_prop)
      rw [← hd, integral_map (measurable_partitionEval p).aemeasurable hm.aestronglyMeasurable]
    _ = _ := by simpa only [hs] using dirichlet_transform a ha c hc

/-- Every nonnegative simple function has the Markov-Krein transform, using its
finite fiber partition rather than positivity of individual base masses. -/
theorem markov_krein_simple
    (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B) (g : SimpleFunc E ℝ) (hg : ∀ x, 0 ≤ g x) :
    (∫ P, (1 + ∫ x, g x ∂(P : Measure E))^(-B)
      ∂(D : Measure (ProbabilityMeasure E))) =
      Real.exp (-(∫ x, Real.log (1 + g x) ∂U)) := by
  let n := Fintype.card g.range
  let e : Fin n ≃ g.range := (Fintype.equivFin g.range).symm
  let p : Partition E n := {
    cell := fun i => g ⁻¹' {(e i).val}
    measurable_cell := fun i => g.measurableSet_fiber _
    disjoint := by
      intro i j hij
      apply Disjoint.preimage
      apply Set.disjoint_singleton.mpr
      intro he
      exact hij (e.injective (Subtype.ext he))
    covers := by
      ext x
      simp only [mem_iUnion, mem_preimage, mem_singleton_iff, mem_univ, iff_true]
      exact ⟨e.symm ⟨g x, g.mem_range_self x⟩, by simp⟩ }
  apply markov_krein_partition U D hD B hB hMass p g (fun i => (e i).val)
  · intro i
    obtain ⟨x, hx⟩ := g.mem_range.mp (e i).property
    rw [← hx]
    exact hg x
  · intro i x hx
    exact hx

end GGC.RandomMeasure
