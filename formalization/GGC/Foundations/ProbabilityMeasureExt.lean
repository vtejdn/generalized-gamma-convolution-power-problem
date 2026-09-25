import GGC.Foundations.PartitionRefinement
import Mathlib.MeasureTheory.Measure.Prod

/-! # Finite-measure extension from partition evaluations

These cylinders generate the original Giry measurable space. The extension
results allow arbitrary finite measures, including zero measures, without
topological or Dirichlet-process assumptions.
-/
noncomputable section
open MeasureTheory Set MeasurableSpace
namespace GGC.RandomMeasure
variable {E : Type*} [MeasurableSpace E]

def partitionCylinders : Set (Set (ProbabilityMeasure E)) :=
  {S | ∃ (n : ℕ) (p : Partition E n) (C : Set (Fin n → ℝ)),
    MeasurableSet C ∧ S = partitionEval p ⁻¹' C}

theorem measurableSet_partitionCylinder {n : ℕ} (p : Partition E n)
    {C : Set (Fin n → ℝ)} (hC : MeasurableSet C) :
    MeasurableSet (partitionEval p ⁻¹' C) := (measurable_partitionEval p) hC

theorem univ_mem_partitionCylinders : (univ : Set (ProbabilityMeasure E)) ∈ partitionCylinders :=
  ⟨1, Partition.trivial, univ, MeasurableSet.univ, by simp⟩

theorem isPiSystem_partitionCylinders : IsPiSystem (@partitionCylinders E _) := by
  rintro S ⟨n, p, C, hC, rfl⟩ T ⟨m, q, D, hD, rfl⟩ _
  refine ⟨n*m, p.refine q, leftSum ⁻¹' C ∩ rightSum ⁻¹' D,
    ((measurable_leftSum n m) hC).inter ((measurable_rightSum n m) hD), ?_⟩
  ext P
  simp only [mem_inter_iff, mem_preimage, leftSum_partitionEval, rightSum_partitionEval]

theorem giry_eq_generate_partitionCylinders :
    (inferInstance : MeasurableSpace (ProbabilityMeasure E)) = generateFrom partitionCylinders := by
  apply le_antisymm
  · let M := generateFrom (@partitionCylinders E _)
    have hp {n : ℕ} (p : Partition E n) :
        @Measurable (ProbabilityMeasure E) (Fin n → ℝ) M inferInstance (partitionEval p) := by
      intro C hC
      exact measurableSet_generateFrom ⟨n, p, C, hC, rfl⟩
    have he (A : Set E) (hA : MeasurableSet A) :
        @Measurable (ProbabilityMeasure E) ENNReal M inferInstance
          (fun P => (P : Measure E) A) := by
      have h := ((measurable_pi_apply (0 : Fin 2)).comp (hp (Partition.binary A hA))).ennreal_ofReal
      simpa only [Function.comp_def, ofReal_partitionEval_binary_zero] using h
    have hc : @Measurable (ProbabilityMeasure E) (Measure E) M inferInstance
        (fun P => (P : Measure E)) := Measure.measurable_of_measurable_coe _ he
    have hi : @Measurable (ProbabilityMeasure E) (ProbabilityMeasure E) M
        ProbabilityMeasure.instMeasurableSpace id :=
      hc.subtype_mk (p := fun μ : Measure E => IsProbabilityMeasure μ) (h := fun P => P.property)
    simpa only [MeasurableSpace.comap_id] using hi.comap_le
  · apply generateFrom_le
    rintro S ⟨n, p, C, hC, rfl⟩
    exact measurableSet_partitionCylinder p hC

theorem measure_ext_of_partitionCylinders (μ ν : Measure (ProbabilityMeasure E))
    [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (h : ∀ (n : ℕ) (p : Partition E n) (C : Set (Fin n → ℝ)), MeasurableSet C →
      μ (partitionEval p ⁻¹' C) = ν (partitionEval p ⁻¹' C)) : μ = ν := by
  apply ext_of_generate_finite partitionCylinders giry_eq_generate_partitionCylinders
    isPiSystem_partitionCylinders
  · rintro S ⟨n, p, C, hC, rfl⟩
    exact h n p C hC
  · simpa using h 1 Partition.trivial univ MeasurableSet.univ

theorem slice_apply {AType : Type*} [MeasurableSpace AType]
    (M : Measure (AType × ProbabilityMeasure E)) (A : Set AType)
    (T : Set (ProbabilityMeasure E)) (hT : MeasurableSet T) :
    Measure.map Prod.snd (M.restrict (A ×ˢ univ)) T = M (A ×ˢ T) := by
  rw [Measure.map_apply measurable_snd hT, Measure.restrict_apply (measurable_snd hT)]
  congr 1
  ext p
  simp [and_comm]

theorem joint_measure_ext_of_partitionCylinders {AType : Type*} [MeasurableSpace AType]
    (M N : Measure (AType × ProbabilityMeasure E)) [IsFiniteMeasure M] [IsFiniteMeasure N]
    (h : ∀ (A : Set AType), MeasurableSet A →
      ∀ (n : ℕ) (p : Partition E n) (C : Set (Fin n → ℝ)), MeasurableSet C →
        M (A ×ˢ (partitionEval p ⁻¹' C)) = N (A ×ˢ (partitionEval p ⁻¹' C))) : M = N := by
  apply Measure.ext_prod
  intro A T hA hT
  have he : Measure.map Prod.snd (M.restrict (A ×ˢ univ)) =
      Measure.map Prod.snd (N.restrict (A ×ˢ univ)) := by
    apply measure_ext_of_partitionCylinders
    intro n p C hC
    rw [slice_apply _ _ _ (measurableSet_partitionCylinder p hC),
      slice_apply _ _ _ (measurableSet_partitionCylinder p hC)]
    exact h A hA n p C hC
  have hh := congrArg (fun μ : Measure (ProbabilityMeasure E) => μ T) he
  simpa only [slice_apply _ _ _ hT] using hh

end GGC.RandomMeasure
