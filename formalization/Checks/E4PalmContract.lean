import GGC.DirichletPalm

/-! # E4.2 measurable-space, finite-measure and nonnegative endpoint checks

Creator: constructor. Maintainer: shared designer-constructor. Status: active.
Target: Blueprint 26 and 28 / API-072/078/080/081. Checks the historical
measurable-only public contract, arbitrary K/Phi, zero finite measures, empty-base/zero-size partitions,
and a test identically infinity. No independent acceptance is claimed.
Designer review on 2026-09-25 added explicit public instance application and
empty/universal/zero-mass-cell boundary cases. Acceptance is recorded separately
in ConstructionReport, not established by the authorship of this check.
Constructor F-01 repair on 2026-09-25 removes surplus topology assumptions
from the public application; all boundary examples and axiom outputs remain.
Run from formalization with pinned Lean v4.32.2:
`lake env lean Checks/E4PalmContract.lean`.
Production: GGC/DirichletPalm.lean and its independent foundations.
Evidence: ConstructionReport, E4 construction. Retain for boundary regression.
-/
noncomputable section
open MeasureTheory Set GGC.RandomMeasure
open scoped ENNReal

example {E : Type*} [MeasurableSpace E]
    (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B)
    (K : E → ProbabilityMeasure (ProbabilityMeasure E)) (hK : Measurable K)
    (hpost : ∀ b, IsDirichletProcess (U + Measure.dirac b) (K b))
    (Φ : E × ProbabilityMeasure E → ℝ≥0∞) (hΦ : Measurable Φ) :
    (∫⁻ (P : ProbabilityMeasure E), ∫⁻ b, Φ (b,P) ∂(P : Measure E)
      ∂(D : Measure (ProbabilityMeasure E))) =
      ∫⁻ b, ∫⁻ P, Φ (b,P) ∂(K b : Measure (ProbabilityMeasure E))
        ∂(ENNReal.ofReal (1 / B) • U) :=
  @GGC.posterior_palm_nonneg E _ U D hD B hB hMass K hK hpost Φ hΦ

example {E : Type*} [MeasurableSpace E] (P : ProbabilityMeasure E) :
    partitionEval (Partition.binary (∅ : Set E) MeasurableSet.empty) P 0 = 0 := by
  simp [partitionEval_binary_zero]

example {E : Type*} [MeasurableSpace E] (P : ProbabilityMeasure E) :
    partitionEval (Partition.binary (univ : Set E) MeasurableSet.univ) P 0 = 1 := by
  simp [partitionEval_binary_zero]

-- This includes a nonempty cell whose base mass vanishes: the argument uses
-- only zero mass and does not require the cell itself to be empty.
example {E : Type*} [MeasurableSpace E]
    {U : Measure E} {D : ProbabilityMeasure (ProbabilityMeasure E)}
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B)
    {n : ℕ} (p : Partition E n) (j : Fin n) (hzero : U (p.cell j) = 0)
    (C : Set (Fin n → ℝ)) (hC : MeasurableSet C) :
    (∫⁻ P in partitionEval p ⁻¹' C, ENNReal.ofReal (partitionEval p P j)
      ∂(D : Measure (ProbabilityMeasure E))) = 0 := by
  rw [partition_coordinate_sizeBias hD B hB hMass p j C hC, hzero]
  simp

example {E : Type*} [MeasurableSpace E] (μ : Measure (ProbabilityMeasure E))
    [IsFiniteMeasure μ]
    (h : ∀ (n : ℕ) (p : Partition E n) (C : Set (Fin n → ℝ)), MeasurableSet C →
      μ (partitionEval p ⁻¹' C) = 0) : μ = 0 := by
  apply measure_ext_of_partitionCylinders
  intro n p C hC
  simpa using h n p C hC

example [MeasurableSpace Empty] (p : Partition Empty 0) : Partition Empty (0*2) :=
  p.refine (Partition.binary univ MeasurableSet.univ)

example {E : Type*} [MeasurableSpace E]
    (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B)
    (K : E → ProbabilityMeasure (ProbabilityMeasure E)) (hK : Measurable K)
    (hpost : ∀ b, IsDirichletProcess (U + Measure.dirac b) (K b)) :
    (∫⁻ (P : ProbabilityMeasure E), ∫⁻ _b, (∞ : ℝ≥0∞) ∂(P : Measure E)
      ∂(D : Measure (ProbabilityMeasure E))) =
      ∫⁻ b, ∫⁻ _P, (∞ : ℝ≥0∞) ∂(K b : Measure (ProbabilityMeasure E))
        ∂(ENNReal.ofReal (1 / B) • U) :=
  GGC.RandomMeasure.posterior_palm_nonneg U D hD B hB hMass K hK hpost
    (fun _ => ∞) measurable_const

#print GGC.posterior_palm_nonneg
#print axioms GGC.posterior_palm_nonneg
#print axioms GGC.RandomMeasure.giry_eq_generate_partitionCylinders
#print axioms GGC.RandomMeasure.joint_measure_ext_of_partitionCylinders
