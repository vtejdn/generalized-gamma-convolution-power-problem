import GGC.Foundations.DirichletSizeBias
import GGC.Foundations.StickBreaking
import Mathlib.Probability.Independence.InfinitePi
import Mathlib.MeasureTheory.Measure.HasOuterApproxClosed
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-!
# Finite-prefix Dirichlet stick breaking

The auxiliary tail is an independent finite Gamma-normalized Dirichlet vector.
No Dirichlet-process tail law or external theorem is used in this module.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Topology
open scoped NNReal ENNReal BigOperators
namespace GGC.RandomMeasure

/-- Probability mass of the actual stick measure implies real summability.
This is the converse adapter needed for arbitrary supplied probability versions. -/
theorem hasSum_stickWeight_of_mass_one {E : Type*} [MeasurableSpace E]
    (V : ℕ → UnitWeight) (Y : ℕ → E) (h : stickMeasure V Y univ = 1) :
    HasSum (stickWeight V) 1 := by
  have hs : ∑' i, ENNReal.ofReal (stickWeight V i) = 1 := by
    simpa only [stickMeasure, Measure.sum_apply _ MeasurableSet.univ,
      Measure.smul_apply, Measure.dirac_apply_of_mem (mem_univ _), smul_eq_mul,
      mul_one] using h
  have ht := ENNReal.hasSum_toReal (f := fun i => ENNReal.ofReal (stickWeight V i))
    (by rw [hs]; exact ENNReal.one_ne_top)
  rw [← ENNReal.tsum_toReal_eq (fun _ => ENNReal.ofReal_ne_top), hs] at ht
  simpa only [hs, ENNReal.toReal_one,
    ENNReal.toReal_ofReal (stickWeight_nonneg V _)] using ht

/-- Apply a finite sequence of stick updates, starting from an attached vector. -/
def stickPrefix {d : ℕ} : (k : ℕ) → (Fin k → Fin d × ℝ) → (Fin d → ℝ) → Fin d → ℝ
  | 0, _, x => x
  | k+1, v, x => coordinateMixture (v 0).1 (stickPrefix k (fun i => v i.succ) x, (v 0).2)

@[fun_prop] theorem measurable_stickPrefix {d : ℕ} (k : ℕ) :
    Measurable (fun p : (Fin k → Fin d × ℝ) × (Fin d → ℝ) => stickPrefix k p.1 p.2) := by
  induction k with
  | zero => exact measurable_snd
  | succ k ih =>
    have hm : Measurable (fun p : Fin d × ((Fin d → ℝ) × ℝ) =>
        coordinateMixture p.1 p.2) :=
      measurable_from_prod_countable_right fun j => measurable_coordinateMixture j
    have ht : Measurable (fun p : (Fin (k+1) → Fin d × ℝ) × (Fin d → ℝ) =>
        stickPrefix k (fun i => p.1 i.succ) p.2) := ih.comp
      (by fun_prop : Measurable (fun p : (Fin (k+1) → Fin d × ℝ) × (Fin d → ℝ) =>
        ((fun i : Fin k => p.1 i.succ), p.2)))
    exact hm.comp ((by fun_prop : Measurable (fun p :
      (Fin (k+1) → Fin d × ℝ) × (Fin d → ℝ) => (p.1 0).1)).prodMk
      (ht.prodMk (by fun_prop)))

/-- Stationarity with the categorical index and Beta fraction paired first. -/
theorem dirichlet_stationary_update_paired {d : ℕ} (a : Fin d → ℝ≥0)
    (ha : ∑ i, a i ≠ 0) :
    Measure.map (fun p : (Fin d × ℝ) × (Fin d → ℝ) =>
      coordinateMixture p.1.1 (p.2, p.1.2))
      (((coordinateChoice a).prod (betaMeasure 1 (∑ i, (a i : ℝ)))).prod
        (dirichletLaw a : Measure (Fin d → ℝ))) =
      (dirichletLaw a : Measure (Fin d → ℝ)) := by
  haveI := coordinateChoice_isProbabilityMeasure a ha
  have hb : 0 < ∑ i, (a i : ℝ) := by
    rw [← NNReal.coe_sum]
    exact_mod_cast (pos_iff_ne_zero.mpr ha)
  haveI := isProbabilityMeasureBeta zero_lt_one hb
  let J := coordinateChoice a
  let Z := betaMeasure 1 (∑ i, (a i : ℝ))
  let D := (dirichletLaw a : Measure (Fin d → ℝ))
  have hp := ((MeasurePreserving.id J).prod (Measure.measurePreserving_swap (μ := Z) (ν := D))).comp
    (measurePreserving_prodAssoc J Z D)
  have hm : Measurable (fun p : Fin d × ((Fin d → ℝ) × ℝ) =>
      coordinateMixture p.1 p.2) :=
    measurable_from_prod_countable_right fun j => measurable_coordinateMixture j
  have h := congrArg (Measure.map (fun p : Fin d × ((Fin d → ℝ) × ℝ) =>
      coordinateMixture p.1 p.2)) hp.map_eq
  rw [Measure.map_map hm hp.measurable] at h
  exact h.trans (dirichlet_stationary_update a ha)

/-- Every finite independent prefix preserves the attached Dirichlet law. -/
theorem stickPrefix_map {d : ℕ} (a : Fin d → ℝ≥0) (ha : ∑ i, a i ≠ 0) (k : ℕ) :
    Measure.map (fun p : (Fin k → Fin d × ℝ) × (Fin d → ℝ) => stickPrefix k p.1 p.2)
      ((Measure.pi (fun _ : Fin k =>
        (coordinateChoice a).prod (betaMeasure 1 (∑ i, (a i : ℝ))))).prod
        (dirichletLaw a : Measure (Fin d → ℝ))) =
    (dirichletLaw a : Measure (Fin d → ℝ)) := by
  haveI := coordinateChoice_isProbabilityMeasure a ha
  have hb : 0 < ∑ i, (a i : ℝ) := by
    rw [← NNReal.coe_sum]
    exact_mod_cast (pos_iff_ne_zero.mpr ha)
  haveI := isProbabilityMeasureBeta zero_lt_one hb
  let ν := (coordinateChoice a).prod (betaMeasure 1 (∑ i, (a i : ℝ)))
  let D := (dirichletLaw a : Measure (Fin d → ℝ))
  induction k with
  | zero =>
    change Measure.snd _ = _
    exact Measure.snd_prod
  | succ k ih =>
    have hs := measurePreserving_piFinSuccAbove (fun _ : Fin (k+1) => ν) 0
    have ht : MeasurePreserving (fun p : (Fin k → Fin d × ℝ) × (Fin d → ℝ) =>
        stickPrefix k p.1 p.2) ((Measure.pi (fun _ : Fin k => ν)).prod D) D :=
      ⟨measurable_stickPrefix k, ih⟩
    have hp := ((MeasurePreserving.id ν).prod ht).comp
      ((measurePreserving_prodAssoc ν (Measure.pi (fun _ : Fin k => ν)) D).comp
        (hs.prod (MeasurePreserving.id D)))
    have hm : Measurable (fun p : (Fin d × ℝ) × (Fin d → ℝ) =>
        coordinateMixture p.1.1 (p.2, p.1.2)) := by
      have hm' : Measurable (fun p : Fin d × ((Fin d → ℝ) × ℝ) =>
          coordinateMixture p.1 p.2) :=
        measurable_from_prod_countable_right fun j => measurable_coordinateMixture j
      exact hm'.comp (by fun_prop : Measurable (fun p : (Fin d × ℝ) × (Fin d → ℝ) =>
        (p.1.1, p.2, p.1.2)))
    have h := congrArg (Measure.map (fun p : (Fin d × ℝ) × (Fin d → ℝ) =>
        coordinateMixture p.1.1 (p.2, p.1.2))) hp.map_eq
    rw [Measure.map_map hm hp.measurable] at h
    simpa [stickPrefix, Function.comp_def, Prod.map, MeasurableEquiv.prodAssoc,
      MeasurableEquiv.piFinSuccAbove, Fin.insertNthEquiv, Fin.tail_def, ν, D] using
      h.trans (dirichlet_stationary_update_paired a ha)

theorem stickResidual_succ_shift (V : ℕ → UnitWeight) (k : ℕ) :
    stickResidual V (k+1) = (1 - (V 0).val) * stickResidual (fun i => V (i+1)) k := by
  simp only [stickResidual, Finset.prod_range_succ']
  ring

theorem stickWeight_succ_shift (V : ℕ → UnitWeight) (k : ℕ) :
    stickWeight V (k+1) = (1 - (V 0).val) * stickWeight (fun i => V (i+1)) k := by
  simp only [stickWeight, stickResidual_succ_shift]
  ring

/-- The recursive finite update equals the genuine prefix plus its attached tail. -/
theorem stickPrefix_eq {d : ℕ} (k : ℕ) (V : ℕ → UnitWeight) (J : ℕ → Fin d)
    (x : Fin d → ℝ) (i : Fin d) :
    stickPrefix k (fun j => (J j, (V j).val)) x i =
      (∑ j ∈ Finset.range k, if i = J j then stickWeight V j else 0) +
        stickResidual V k * x i := by
  induction k generalizing V J with
  | zero => simp [stickPrefix, stickResidual]
  | succ k ih =>
    change coordinateMixture (J 0)
      (stickPrefix k (fun j => (J (j+1), (V (j+1)).val)) x, (V 0).val) i = _
    simp only [coordinateMixture]
    rw [ih (fun j => V (j+1)) (fun j => J (j+1))]
    rw [Finset.sum_range_succ', stickResidual_succ_shift]
    simp only [stickWeight_succ_shift]
    have he : (∑ j ∈ Finset.range k,
        if i = J (j+1) then (1 - (V 0).val) * stickWeight (fun j => V (j+1)) j else 0) =
        (1 - (V 0).val) * ∑ j ∈ Finset.range k,
          if i = J (j+1) then stickWeight (fun j => V (j+1)) j else 0 := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro j _
      split_ifs <;> simp
    rw [he]
    simp only [stickWeight, stickResidual, Finset.range_zero, Finset.prod_empty, mul_one]
    split_ifs <;> ring

/-- The label of the unique cell containing a point; empty cells require no
representative. The definition is valid even on an empty underlying space. -/
def Partition.label {E : Type*} [MeasurableSpace E] {d : ℕ} (p : Partition E d)
    (b : E) : Fin d := Classical.choose (show ∃ i, b ∈ p.cell i from by
      have h : b ∈ ⋃ i, p.cell i := by rw [p.covers]; trivial
      exact mem_iUnion.mp h)

theorem Partition.mem_label {E : Type*} [MeasurableSpace E] {d : ℕ}
    (p : Partition E d) (b : E) : b ∈ p.cell (p.label b) := by
  unfold Partition.label
  exact Classical.choose_spec (show ∃ i, b ∈ p.cell i from by
    have h : b ∈ ⋃ i, p.cell i := by rw [p.covers]; trivial
    exact mem_iUnion.mp h)

theorem Partition.label_eq_iff {E : Type*} [MeasurableSpace E] {d : ℕ}
    (p : Partition E d) (b : E) (i : Fin d) : p.label b = i ↔ b ∈ p.cell i := by
  constructor
  · rintro rfl
    exact p.mem_label b
  · intro hb
    by_contra h
    exact Set.disjoint_left.mp (p.disjoint h) (p.mem_label b) hb

@[fun_prop] theorem Partition.measurable_label {E : Type*} [MeasurableSpace E] {d : ℕ}
    (p : Partition E d) : Measurable p.label := by
  apply measurable_to_countable'
  intro i
  have he : p.label ⁻¹' {i} = p.cell i := by ext b; exact p.label_eq_iff b i
  rw [he]
  exact p.measurable_cell i

/-- A probability-valued stick sum determines the coordinate limit for every
attached finite vector. No moment bound or Dirichlet tail law is required. -/
theorem stickPrefix_tendsto {E : Type*} [MeasurableSpace E] {d : ℕ}
    (p : Partition E d) (V : ℕ → UnitWeight) (Y : ℕ → E)
    (Q : ProbabilityMeasure E) (hQ : (Q : Measure E) = stickMeasure V Y)
    (x : Fin d → ℝ) :
    Tendsto (fun k => stickPrefix k (fun j => (p.label (Y j), (V j).val)) x)
      atTop (𝓝 (partitionEval p Q)) := by
  have hm : stickMeasure V Y univ = 1 := by rw [← hQ]; exact measure_univ
  have hr := (hasSum_stickWeight_iff V).1 (hasSum_stickWeight_of_mass_one V Y hm)
  apply tendsto_pi_nhds.2
  intro i
  have he : ∑' j, ENNReal.ofReal (if i = p.label (Y j) then stickWeight V j else 0) =
      (Q : Measure E) (p.cell i) := by
    rw [hQ, stickMeasure, Measure.sum_apply _ (p.measurable_cell i)]
    congr 1
    funext j
    rw [Measure.smul_apply, Measure.dirac_apply' _ (p.measurable_cell i)]
    by_cases hj : i = p.label (Y j)
    · simp [hj, p.mem_label]
    · have hn : Y j ∉ p.cell i := fun hi => hj ((p.label_eq_iff _ _).2 hi).symm
      simp [hj, hn]
  have ht := ENNReal.hasSum_toReal
    (f := fun j => ENNReal.ofReal (if i = p.label (Y j) then stickWeight V j else 0))
    (by rw [he]; exact measure_ne_top _ _)
  rw [← ENNReal.tsum_toReal_eq (fun _ => ENNReal.ofReal_ne_top), he] at ht
  have hn (j : ℕ) : 0 ≤ (if i = p.label (Y j) then stickWeight V j else 0) := by
    split_ifs
    · exact stickWeight_nonneg V j
    · exact le_rfl
  simp only [ENNReal.toReal_ofReal (hn _)] at ht
  have hs := ht.tendsto_sum_nat
  have hx := hr.mul_const (x i)
  have hc := hs.add hx
  have heq : (fun k => stickPrefix k (fun j => (p.label (Y j), (V j).val)) x i) =
      (fun k => (∑ j ∈ Finset.range k, if i = p.label (Y j) then stickWeight V j else 0) +
        stickResidual V k * x i) := funext fun k => stickPrefix_eq k V (fun j => p.label (Y j)) x i
  rw [heq]
  simpa only [zero_mul, add_zero, partitionEval] using hc

/-- The first k coordinates of an independent sequence have the finite product law. -/
theorem infinitePi_map_prefix {A : Type*} [MeasurableSpace A]
    (μ : Measure A) [IsProbabilityMeasure μ] (k : ℕ) :
    Measure.map (fun v : ℕ → A => fun i : Fin k => v i)
      (Measure.infinitePi (fun _ : ℕ => μ)) = Measure.pi (fun _ : Fin k => μ) := by
  rw [Measure.map_infinitePi_infinitePi_of_inj (f := fun i : Fin k => (i : ℕ))
    Fin.val_injective, Measure.infinitePi_eq_pi]

/-- Finite paired prefixes of the full independent input have their actual
product law. This extracts independence only for fractions and labels. -/
theorem paired_prefix_map {A C : Type*} [MeasurableSpace A] [MeasurableSpace C]
    (μ : Measure A) (ν : Measure C) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (k : ℕ) :
    Measure.map (fun p : (ℕ → A) × (ℕ → C) => fun i : Fin k => (p.1 i, p.2 i))
      ((Measure.infinitePi (fun _ : ℕ => μ)).prod
        (Measure.infinitePi (fun _ : ℕ => ν))) =
    Measure.pi (fun _ : Fin k => μ.prod ν) := by
  let e := MeasurableEquiv.arrowProdEquivProdArrow A C (Fin k)
  have he := measurePreserving_arrowProdEquivProdArrow A C (Fin k)
    (fun _ => μ) (fun _ => ν)
  have hp : MeasurePreserving (fun p : (ℕ → A) × (ℕ → C) =>
      ((fun i : Fin k => p.1 i), (fun i : Fin k => p.2 i)))
      ((Measure.infinitePi (fun _ : ℕ => μ)).prod
        (Measure.infinitePi (fun _ : ℕ => ν)))
      ((Measure.pi (fun _ : Fin k => μ)).prod (Measure.pi (fun _ : Fin k => ν))) :=
    (show MeasurePreserving (fun v : ℕ → A => fun i : Fin k => v i) _ _ from
      ⟨by fun_prop, infinitePi_map_prefix μ k⟩).prod
    (show MeasurePreserving (fun v : ℕ → C => fun i : Fin k => v i) _ _ from
      ⟨by fun_prop, infinitePi_map_prefix ν k⟩)
  exact (he.symm.comp hp).map_eq

/-- The measurable partition label has the categorical law of its cell masses. -/
theorem Partition.label_map {E : Type*} [MeasurableSpace E] {d : ℕ}
    (p : Partition E d) (F : ProbabilityMeasure E) (a : Fin d → ℝ≥0)
    (hcell : ∀ i, ENNReal.ofReal ((a i : ℝ) / ∑ j, (a j : ℝ)) =
      (F : Measure E) (p.cell i)) :
    Measure.map p.label (F : Measure E) = coordinateChoice a := by
  apply Measure.ext_of_singleton
  intro i
  rw [Measure.map_apply p.measurable_label (measurableSet_singleton i)]
  have he : p.label ⁻¹' {i} = p.cell i := by ext b; exact p.label_eq_iff b i
  rw [he]
  simp [coordinateChoice, Measure.dirac_apply', hcell, Pi.single_apply]

/-- Transport the supplied full input law to each independent finite prefix. -/
theorem stickInput_prefix_map {E Ω : Type*} [MeasurableSpace E] [MeasurableSpace Ω]
    {d : ℕ} (p : Partition E d) (m : ProbabilityMeasure Ω)
    (F : ProbabilityMeasure E) (Z : ProbabilityMeasure UnitWeight)
    (a : Fin d → ℝ≥0)
    (hlabel : Measure.map p.label (F : Measure E) = coordinateChoice a)
    (hZ : Measure.map Subtype.val (Z : Measure UnitWeight) =
      betaMeasure 1 (∑ i, (a i : ℝ)))
    (V : Ω → ℕ → UnitWeight) (Y : Ω → ℕ → E)
    (hV : Measurable V) (hY : Measurable Y)
    (hInput : Measure.map (fun ω => (V ω, Y ω)) (m : Measure Ω) =
      (Measure.infinitePi (fun _ : ℕ => (Z : Measure UnitWeight))).prod
        (Measure.infinitePi (fun _ : ℕ => (F : Measure E)))) (k : ℕ) :
    Measure.map (fun ω => fun i : Fin k => (p.label (Y ω i), (V ω i).val)) (m : Measure Ω) =
      Measure.pi (fun _ : Fin k =>
        (coordinateChoice a).prod (betaMeasure 1 (∑ i, (a i : ℝ)))) := by
  let f : UnitWeight × E → Fin d × ℝ := fun z => (p.label z.2, z.1.val)
  have hf : Measurable f := (p.measurable_label.comp measurable_snd).prodMk (by fun_prop)
  have hmap : Measure.map f ((Z : Measure UnitWeight).prod (F : Measure E)) =
      (coordinateChoice a).prod (betaMeasure 1 (∑ i, (a i : ℝ))) := by
    have hs := (Measure.measurePreserving_swap (μ := (Z : Measure UnitWeight))
      (ν := (F : Measure E))).map_eq
    have ht := congrArg (Measure.map (Prod.map p.label (fun z : UnitWeight => z.val))) hs
    rw [Measure.map_map (p.measurable_label.prodMap measurable_subtype_coe) (by fun_prop),
      ← Measure.map_prod_map _ _ p.measurable_label measurable_subtype_coe, hlabel, hZ] at ht
    exact ht
  have hp := congrArg (Measure.map (fun v : Fin k → UnitWeight × E => fun i => f (v i)))
    (paired_prefix_map (Z : Measure UnitWeight) (F : Measure E) k)
  rw [Measure.map_map (by fun_prop) (by fun_prop), Measure.pi_map_pi (fun _ => hf.aemeasurable)] at hp
  simp only [hmap] at hp
  have hi := congrArg (Measure.map (fun z : (ℕ → UnitWeight) × (ℕ → E) =>
      fun i : Fin k => f (z.1 i, z.2 i))) hInput
  rw [Measure.map_map (by fun_prop) (hV.prodMk hY)] at hi
  exact hi.trans hp

/-- Identification of a constant sequence of finite-dimensional laws by an
almost-everywhere limit, using bounded continuous tests. -/
theorem map_eq_of_constant_law_limit {Ω : Type*} [MeasurableSpace Ω] {d : ℕ}
    (μ : Measure Ω) [IsProbabilityMeasure μ] (ν : Measure (Fin d → ℝ))
    [IsProbabilityMeasure ν] (f : ℕ → Ω → Fin d → ℝ) (g : Ω → Fin d → ℝ)
    (hf : ∀ k, Measurable (f k)) (hg : Measurable g)
    (hlaw : ∀ k, Measure.map (f k) μ = ν)
    (hlim : ∀ᵐ ω ∂μ, Tendsto (fun k => f k ω) atTop (𝓝 (g ω))) :
    Measure.map g μ = ν := by
  haveI : IsProbabilityMeasure (Measure.map g μ) := Measure.isProbabilityMeasure_map hg.aemeasurable
  apply ext_of_forall_integral_eq_of_IsFiniteMeasure
  intro φ
  rw [integral_map hg.aemeasurable φ.continuous.measurable.aestronglyMeasurable]
  have ht := tendsto_integral_of_dominated_convergence (μ := μ)
    (bound := fun _ => ‖φ‖) (F := fun k ω => φ (f k ω)) (f := fun ω => φ (g ω))
    (fun k => (φ.continuous.measurable.comp (hf k)).aestronglyMeasurable)
    (integrable_const _) (fun _ => Filter.Eventually.of_forall fun _ => φ.norm_coe_le_norm _)
    (hlim.mono fun ω hω => (φ.continuous.tendsto (g ω)).comp hω)
  have he (k : ℕ) : (∫ ω, φ (f k ω) ∂μ) = ∫ x, φ x ∂ν := by
    rw [← hlaw k, integral_map (hf k).aemeasurable φ.continuous.measurable.aestronglyMeasurable]
  simp only [he] at ht
  exact (tendsto_nhds_unique tendsto_const_nhds ht).symm

/-- Full finite-partition law for a supplied stick sum, after identifying its
cell probabilities and total Beta shape. -/
theorem stick_partition_law {E Ω : Type*} [MeasurableSpace E] [MeasurableSpace Ω]
    {d : ℕ} (p : Partition E d) (m : ProbabilityMeasure Ω)
    (F : ProbabilityMeasure E) (Z : ProbabilityMeasure UnitWeight)
    (a : Fin d → ℝ≥0) (ha : ∑ i, a i ≠ 0)
    (hlabel : Measure.map p.label (F : Measure E) = coordinateChoice a)
    (hZ : Measure.map Subtype.val (Z : Measure UnitWeight) =
      betaMeasure 1 (∑ i, (a i : ℝ)))
    (V : Ω → ℕ → UnitWeight) (Y : Ω → ℕ → E)
    (hV : Measurable V) (hY : Measurable Y)
    (hInput : Measure.map (fun ω => (V ω, Y ω)) (m : Measure Ω) =
      (Measure.infinitePi (fun _ : ℕ => (Z : Measure UnitWeight))).prod
        (Measure.infinitePi (fun _ : ℕ => (F : Measure E))))
    (Q : Ω → ProbabilityMeasure E) (hQ : Measurable Q)
    (hSum : ∀ᵐ ω ∂(m : Measure Ω), (Q ω : Measure E) = stickMeasure (V ω) (Y ω)) :
    Measure.map (fun ω => partitionEval p (Q ω)) (m : Measure Ω) =
      (dirichletLaw a : Measure (Fin d → ℝ)) := by
  let D := (dirichletLaw a : Measure (Fin d → ℝ))
  let μ := (m : Measure Ω).prod D
  let f (k : ℕ) (t : Ω × (Fin d → ℝ)) :=
    stickPrefix k (fun i => (p.label (Y t.1 i), (V t.1 i).val)) t.2
  let g (t : Ω × (Fin d → ℝ)) := partitionEval p (Q t.1)
  have hf (k : ℕ) : Measurable (f k) := (measurable_stickPrefix k).comp
    (show Measurable (fun t : Ω × (Fin d → ℝ) =>
      ((fun i : Fin k => (p.label (Y t.1 i), (V t.1 i).val)), t.2)) from by fun_prop)
  have hg : Measurable g := (measurable_partitionEval p).comp (hQ.comp measurable_fst)
  have hlaw (k : ℕ) : Measure.map (f k) μ = D := by
    have hin := stickInput_prefix_map p m F Z a hlabel hZ V Y hV hY hInput k
    have hm : Measurable (fun ω => fun i : Fin k => (p.label (Y ω i), (V ω i).val)) := by fun_prop
    have hp : MeasurePreserving (fun ω => fun i : Fin k => (p.label (Y ω i), (V ω i).val))
        (m : Measure Ω) _ := ⟨hm, hin⟩
    have ht := hp.prod (MeasurePreserving.id D)
    have he := congrArg (Measure.map (fun z : (Fin k → Fin d × ℝ) × (Fin d → ℝ) =>
      stickPrefix k z.1 z.2)) ht.map_eq
    rw [Measure.map_map (measurable_stickPrefix k) ht.measurable] at he
    exact he.trans (stickPrefix_map a ha k)
  have hlim : ∀ᵐ t ∂μ, Tendsto (fun k => f k t) atTop (𝓝 (g t)) := by
    have h := (Measure.quasiMeasurePreserving_fst (μ := (m : Measure Ω)) (ν := D)).ae hSum
    filter_upwards [h] with t ht
    exact stickPrefix_tendsto p (V t.1) (Y t.1) (Q t.1) ht t.2
  have he := map_eq_of_constant_law_limit μ D f g hf hg hlaw hlim
  have hp : Measure.map Prod.fst μ = (m : Measure Ω) := Measure.fst_prod
  have hh := congrArg (Measure.map (fun ω => partitionEval p (Q ω))) hp
  rw [Measure.map_map (show Measurable (fun ω => partitionEval p (Q ω)) from
    (measurable_partitionEval p).comp hQ) measurable_fst] at hh
  exact hh.symm.trans he

/-- The full stick-breaking theorem on arbitrary measurable spaces. The caller
supplies only the original independent input law and a probability-valued sum. -/
theorem stick_breaking
    {E Ω : Type*} [MeasurableSpace E] [MeasurableSpace Ω]
    (m : ProbabilityMeasure Ω) (B : ℝ) (hB : 0 < B) (F : ProbabilityMeasure E)
    (Z : ProbabilityMeasure UnitWeight)
    (hZ : Measure.map Subtype.val (Z : Measure UnitWeight) = betaMeasure 1 B)
    (V : Ω → ℕ → UnitWeight) (Y : Ω → ℕ → E)
    (hV : Measurable V) (hY : Measurable Y)
    (hInput : Measure.map (fun ω => (V ω, Y ω)) (m : Measure Ω) =
      (Measure.infinitePi (fun _ : ℕ => (Z : Measure UnitWeight))).prod
        (Measure.infinitePi (fun _ : ℕ => (F : Measure E))))
    (Q : Ω → ProbabilityMeasure E) (hQ : Measurable Q)
    (hSum : ∀ᵐ ω ∂(m : Measure Ω),
      (Q ω : Measure E) = stickMeasure (V ω) (Y ω)) :
    IsDirichletProcess (ENNReal.ofReal B • (F : Measure E)) (m.map hQ.aemeasurable) := by
  let U := ENNReal.ofReal B • (F : Measure E)
  have hMass : U univ = ENNReal.ofReal B := by simp [U]
  haveI : IsFiniteMeasure U := ⟨by rw [hMass]; exact ENNReal.ofReal_lt_top⟩
  refine ⟨inferInstance, ?_, ?_⟩
  · simpa using (ne_of_gt (ENNReal.ofReal_pos.mpr hB))
  · intro d p
    let a : Fin d → ℝ≥0 := fun i => (U (p.cell i)).toNNReal
    have hs : ∑ i, (a i : ℝ) = B := by
      rw [← NNReal.coe_sum, p.sum_shape U, hMass]
      exact ENNReal.toReal_ofReal hB.le
    have ha : ∑ i, a i ≠ 0 := by
      intro hz
      have he := congrArg (fun t : ℝ≥0 => (t : ℝ)) hz
      simp only [NNReal.coe_sum, NNReal.coe_zero, hs] at he
      exact hB.ne' he
    have hcell (i : Fin d) : ENNReal.ofReal ((a i : ℝ) / ∑ j, (a j : ℝ)) =
        (F : Measure E) (p.cell i) := by
      rw [hs, ENNReal.ofReal_div_of_pos hB]
      change ENNReal.ofReal (U (p.cell i)).toReal / ENNReal.ofReal B = _
      rw [ENNReal.ofReal_toReal (measure_ne_top U _)]
      simp only [U, Measure.smul_apply, smul_eq_mul]
      rw [mul_comm, ENNReal.mul_div_cancel_right (ne_of_gt (ENNReal.ofReal_pos.mpr hB))
        ENNReal.ofReal_ne_top]
    have he := stick_partition_law p m F Z a ha (p.label_map F a hcell)
      (by simpa only [hs] using hZ) V Y hV hY hInput Q hQ hSum
    apply ProbabilityMeasure.toMeasure_injective
    change Measure.map (partitionEval p) (Measure.map Q (m : Measure Ω)) = _
    rw [Measure.map_map (measurable_partitionEval p) hQ]
    exact he

end GGC.RandomMeasure
