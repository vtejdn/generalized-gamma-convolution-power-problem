import Mathlib.MeasureTheory.Measure.FiniteMeasurePi
import Mathlib.MeasureTheory.Measure.GiryMonad
import Mathlib.Probability.Distributions.Gamma

/-!
# Concrete finite-partition semantics for Dirichlet processes

This shared foundation imports mathlib only. A Dirichlet vector is the
normalization of independent, unit-rate gamma variables. A zero shape means
the constant zero variable, so empty and zero-base-mass partition cells are
permitted. `IsDirichletProcess` is a predicate on an actual law of probability
measures, not a transform identity or an abstract type with assumed properties.
The measurable structure on probability measures is mathlib's Giry structure.
-/

noncomputable section

open MeasureTheory
open scoped ENNReal NNReal BigOperators

namespace GGC.RandomMeasure

/-- The unit-rate gamma law, extended at shape zero by the point mass at zero. -/
def gammaShapeLaw (a : ℝ≥0) : ProbabilityMeasure ℝ :=
  if h : a = 0 then ⟨Measure.dirac 0, inferInstance⟩
  else ⟨ProbabilityTheory.gammaMeasure a 1,
    ProbabilityTheory.isProbabilityMeasure_gammaMeasure
      (by exact_mod_cast (pos_iff_ne_zero.mpr h)) zero_lt_one⟩

@[simp] theorem gammaShapeLaw_zero :
    (gammaShapeLaw 0 : Measure ℝ) = Measure.dirac 0 := by
  simp [gammaShapeLaw]

theorem gammaShapeLaw_nonneg (a : ℝ≥0) :
    ∀ᵐ x ∂(gammaShapeLaw a : Measure ℝ), 0 ≤ x := by
  by_cases ha : a = 0
  · simp [ha]
  · simp only [gammaShapeLaw, dif_neg ha]
    simp only [ae_iff, not_le]
    change ProbabilityTheory.gammaMeasure a 1 (Set.Iio 0) = 0
    rw [ProbabilityTheory.gammaMeasure, withDensity_apply _ measurableSet_Iio]
    exact ProbabilityTheory.lintegral_gammaPDF_of_nonpos le_rfl

theorem gammaShapeLaw_pos {a : ℝ≥0} (ha : a ≠ 0) :
    ∀ᵐ x ∂(gammaShapeLaw a : Measure ℝ), 0 < x := by
  have hz : ∀ᵐ x ∂(gammaShapeLaw a : Measure ℝ), x ≠ 0 := by
    simp only [ae_iff, not_not, gammaShapeLaw, dif_neg ha]
    change ProbabilityTheory.gammaMeasure a 1 {0} = 0
    simp [ProbabilityTheory.gammaMeasure]
  filter_upwards [gammaShapeLaw_nonneg a, hz] with x hx hx₀
  exact lt_of_le_of_ne hx (Ne.symm hx₀)

/-- Normalization of a finite vector. The zero-total convention is zero. -/
def normalize {n : ℕ} (x : Fin n → ℝ) (i : Fin n) : ℝ := x i / ∑ j, x j

theorem measurable_normalize (n : ℕ) :
    Measurable (normalize : (Fin n → ℝ) → Fin n → ℝ) := by
  unfold normalize
  fun_prop

/-- The actual Dirichlet law, including zero coordinates, as a gamma pushforward.
The all-zero parameter vector is defined too; positive total mass is required
when this law specifies a Dirichlet process. -/
def dirichletLaw {n : ℕ} (a : Fin n → ℝ≥0) : ProbabilityMeasure (Fin n → ℝ) :=
  (ProbabilityMeasure.pi (fun i => gammaShapeLaw (a i))).map
    (measurable_normalize n).aemeasurable

theorem dirichletLaw_toMeasure {n : ℕ} (a : Fin n → ℝ≥0) :
    (dirichletLaw a : Measure (Fin n → ℝ)) =
      Measure.map normalize (Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ))) := rfl

/-- Zero shape coordinates are zero almost surely, not an undefined gamma law. -/
theorem dirichletLaw_zero_coordinate {n : ℕ} (a : Fin n → ℝ≥0) (i : Fin n)
    (hi : a i = 0) : ∀ᵐ x ∂(dirichletLaw a : Measure (Fin n → ℝ)), x i = 0 := by
  rw [dirichletLaw_toMeasure]
  apply (ae_map_iff (measurable_normalize n).aemeasurable
    (measurableSet_eq_fun (measurable_pi_apply i) measurable_const)).2
  have h : ∀ᵐ x ∂(gammaShapeLaw (a i) : Measure ℝ), x = 0 := by
    simp [hi]
  have hc := Measure.tendsto_eval_ae_ae (μ := fun j =>
    (gammaShapeLaw (a j) : Measure ℝ)) (i := i) |>.eventually h
  filter_upwards [hc] with x hx
  simp [normalize, hx]

/-- A nonzero shape vector gives a probability vector almost surely. In
particular, allowing zero cells does not cause loss of total mass. -/
theorem dirichletLaw_simplex {n : ℕ} (a : Fin n → ℝ≥0) (ha : ∃ i, a i ≠ 0) :
    ∀ᵐ x ∂(dirichletLaw a : Measure (Fin n → ℝ)),
      (∀ i, 0 ≤ x i) ∧ ∑ i, x i = 1 := by
  rw [dirichletLaw_toMeasure]
  apply (ae_map_iff (measurable_normalize n).aemeasurable (by
    simp only [Set.setOf_and, Set.setOf_forall]
    exact (MeasurableSet.iInter fun i => measurableSet_le measurable_const
      (measurable_pi_apply i)).inter
      (measurableSet_eq_fun (by fun_prop) measurable_const))).2
  obtain ⟨j, hj⟩ := ha
  have hn : ∀ᵐ x ∂Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ)),
      ∀ i, 0 ≤ x i := by
    apply Filter.eventually_all.2
    intro i
    exact Measure.tendsto_eval_ae_ae.eventually (gammaShapeLaw_nonneg (a i))
  have hp : ∀ᵐ x ∂Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ)), 0 < x j :=
    Measure.tendsto_eval_ae_ae.eventually (gammaShapeLaw_pos hj)
  filter_upwards [hn, hp] with x hx hjx
  have hs : 0 < ∑ i, x i :=
    Finset.sum_pos' (fun i _ => hx i) ⟨j, Finset.mem_univ j, hjx⟩
  refine ⟨fun i => div_nonneg (hx i) hs.le, ?_⟩
  simp only [normalize, ← Finset.sum_div, div_self (ne_of_gt hs)]

/-- A finite measurable partition. Cells may be empty. -/
structure Partition (E : Type*) [MeasurableSpace E] (n : ℕ) where
  cell : Fin n → Set E
  measurable_cell : ∀ i, MeasurableSet (cell i)
  disjoint : Pairwise (fun i j => Disjoint (cell i) (cell j))
  covers : ⋃ i, cell i = Set.univ

variable {E : Type*} [MeasurableSpace E]

/-- Positive finite base mass supplies a nonzero shape in every covering partition. -/
theorem Partition.exists_nonzero_shape {n : ℕ} (p : Partition E n) (U : Measure E)
    [IsFiniteMeasure U] (hU : U Set.univ ≠ 0) :
    ∃ i, (U (p.cell i)).toNNReal ≠ 0 := by
  by_contra h
  push Not at h
  apply hU
  rw [← p.covers]
  apply measure_iUnion_null
  intro i
  exact ((ENNReal.toNNReal_eq_zero_iff _).mp (h i)).resolve_right (measure_ne_top U _)

/-- Actual evaluations of a random probability measure on a finite partition. -/
def partitionEval {n : ℕ} (p : Partition E n) (P : ProbabilityMeasure E) : Fin n → ℝ :=
  fun i => ((P : Measure E) (p.cell i)).toReal

theorem measurable_partitionEval {n : ℕ} (p : Partition E n) :
    Measurable (partitionEval p) := by
  apply measurable_pi_lambda
  intro i
  exact ((Measure.measurable_coe (p.measurable_cell i)).comp
    measurable_subtype_coe).ennreal_toReal

/-- Dirichlet process with a finite, nonzero base. This includes arbitrary
atomic, nonatomic and mixed bases and all finite measurable partitions. -/
def IsDirichletProcess (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E)) : Prop :=
  IsFiniteMeasure U ∧ U Set.univ ≠ 0 ∧
    ∀ (n : ℕ) (p : Partition E n),
      D.map (measurable_partitionEval p).aemeasurable =
        dirichletLaw (fun i => (U (p.cell i)).toNNReal)

theorem IsDirichletProcess.isFiniteMeasure {U : Measure E}
    {D : ProbabilityMeasure (ProbabilityMeasure E)} (h : IsDirichletProcess U D) :
    IsFiniteMeasure U := h.1

theorem IsDirichletProcess.base_ne_zero {U : Measure E}
    {D : ProbabilityMeasure (ProbabilityMeasure E)} (h : IsDirichletProcess U D) :
    U Set.univ ≠ 0 := h.2.1

variable {E' : Type*} [MeasurableSpace E']

/-- The probability pushforward is measurable for the Giry sigma-fields. -/
theorem measurable_probability_map {f : E → E'} (hf : Measurable f) :
    Measurable (fun P : ProbabilityMeasure E => P.map hf.aemeasurable) := by
  exact ((Measure.measurable_map f hf).comp measurable_subtype_coe).subtype_mk

def Partition.comap {n : ℕ} (p : Partition E' n) {f : E → E'} (hf : Measurable f) :
    Partition E n where
  cell i := f ⁻¹' p.cell i
  measurable_cell i := hf (p.measurable_cell i)
  disjoint := fun i j hij => (p.disjoint hij).preimage f
  covers := by simp [← Set.preimage_iUnion, p.covers]

theorem partitionEval_map {n : ℕ} (p : Partition E' n) {f : E → E'}
    (hf : Measurable f) (P : ProbabilityMeasure E) :
    partitionEval p (P.map hf.aemeasurable) = partitionEval (p.comap hf) P := by
  funext i
  change ((Measure.map f (P : Measure E)) (p.cell i)).toReal =
    ((P : Measure E) (f ⁻¹' p.cell i)).toReal
  rw [Measure.map_apply hf (p.measurable_cell i)]

/-- Dirichlet laws transport under any measurable map; injectivity is unnecessary.
This is the local adapter used for exp/log pushforwards of rate measures. -/
theorem IsDirichletProcess.map {U : Measure E}
    {D : ProbabilityMeasure (ProbabilityMeasure E)} (hD : IsDirichletProcess U D)
    {f : E → E'} (hf : Measurable f) :
    IsDirichletProcess (U.map f)
      (D.map (measurable_probability_map hf).aemeasurable) := by
  letI : IsFiniteMeasure U := hD.1
  refine ⟨inferInstance, ?_, ?_⟩
  · simpa [Measure.map_apply hf MeasurableSet.univ] using hD.2.1
  · intro n p
    apply ProbabilityMeasure.toMeasure_injective
    change Measure.map (partitionEval p)
      (Measure.map (fun P : ProbabilityMeasure E => P.map hf.aemeasurable) (D : Measure _)) = _
    rw [Measure.map_map (measurable_partitionEval p) (measurable_probability_map hf)]
    have he : (partitionEval p) ∘ (fun P : ProbabilityMeasure E => P.map hf.aemeasurable) =
        partitionEval (p.comap hf) := funext (partitionEval_map p hf)
    rw [he]
    have hd := congrArg (fun P : ProbabilityMeasure (Fin n → ℝ) => (P : Measure (Fin n → ℝ)))
      (hD.2.2 n (p.comap hf))
    have hparam : (fun i => ((U.map f) (p.cell i)).toNNReal) =
        (fun i => (U ((p.comap hf).cell i)).toNNReal) := by
      funext i
      rw [Measure.map_apply hf (p.measurable_cell i)]
      rfl
    change _ = (dirichletLaw (fun i => ((U.map f) (p.cell i)).toNNReal) : Measure (Fin n → ℝ))
    rw [hparam]
    exact hd

end GGC.RandomMeasure
