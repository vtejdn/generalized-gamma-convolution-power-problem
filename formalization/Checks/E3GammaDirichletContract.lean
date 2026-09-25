import GGC.Foundations.DirichletUpdate
import GGC.DirichletPosterior

/-!
# E3.1 and E3.2 complete contract and boundary checks

Created by: constructor. Maintainer: shared designer-constructor.
Target: Blueprint Sections 19.2-19.3 and 24, API-069/070/076. Status: active.
This is not an independent-reviewer-owned artifact.

Checks the full positive-total joint law, its all-zero extension, deterministic
single-positive-coordinate case, zero selected shape, and the exact original
E-J3 type with arbitrary Polish/Borel base, D, Z and atom. Production proofs
replace the mathematical gaps; these examples check their exposed contracts.
Axiom output must be compared with standard logic only. This does not establish
independent design acceptance or replace the full project build/audit.

Working directory: formalization. Pinned Lean: v4.32.2.
Command: C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe env lean Checks/E3GammaDirichletContract.lean
Evidence: ConstructionReport Sections 43 and 48; .lake/close-dirichlet.log.
Maintenance: E-J3 relocation changes only its import/public name; the explicit
topology-binder check and all original mathematical contracts are preserved.
Production: GGC/Foundations/GammaDirichlet.lean and DirichletUpdate.lean.
Lifecycle: retain for full-interface and degenerate-case regression checks.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set GGC.RandomMeasure
open scoped ENNReal NNReal BigOperators

example {n : ℕ} (a : Fin n → ℝ≥0) (B : ℝ) (hB : 0 < B)
    (hMass : ∑ i, (a i : ℝ) = B) :
    Measure.map (fun x : Fin n → ℝ => (normalize x, ∑ i, x i))
      (Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ))) =
    (dirichletLaw a : Measure (Fin n → ℝ)).prod (gammaMeasure B 1) :=
  gammaVector_normalize_sum_of_pos a B hB hMass

example {n : ℕ} (a : Fin n → ℝ≥0) :
    Measure.map (fun x : Fin n → ℝ => (normalize x, ∑ i, x i))
      (Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ))) =
    (dirichletLaw a : Measure (Fin n → ℝ)).prod
      (gammaShapeLaw (∑ i, a i) : Measure ℝ) := gammaVector_normalize_sum a

example {n : ℕ} (j : Fin n) (c : ℝ≥0) (hc : c ≠ 0) :
    (dirichletLaw (fun i => if i = j then c else 0) : Measure (Fin n → ℝ)) =
      Measure.dirac (fun i => if i = j then (1 : ℝ) else 0) :=
  dirichletLaw_single_positive _ j (by simpa using hc) (by intro i hi; simp [hi])

-- The empty vector cannot satisfy a positive-total contract.
example (a : Fin 0 → ℝ≥0) (B : ℝ) (hB : 0 < B)
    (hMass : ∑ i, (a i : ℝ) = B) : False := by
  have : B = 0 := by simpa using hMass.symm
  exact hB.ne' this

-- The update theorem has no selected-shape positivity hypothesis.
example {n : ℕ} (a : Fin n → ℝ≥0) (ha : ∑ i, a i ≠ 0) (j : Fin n)
    (_hj : a j = 0) :
    Measure.map (coordinateMixture j)
      ((dirichletLaw a : Measure (Fin n → ℝ)).prod
        (betaMeasure 1 (∑ i, (a i : ℝ)))) =
    (dirichletLaw (incrementShape a j) : Measure (Fin n → ℝ)) :=
  dirichlet_coordinate_update a ha j

variable {E : Type*} [MeasurableSpace E] [TopologicalSpace E] [PolishSpace E] [BorelSpace E]

-- The original E-J3 declaration, preserving every binder and hypothesis.
example
    (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B)
    (Z : ProbabilityMeasure UnitWeight)
    (hZ : Measure.map (fun z : UnitWeight => z.val) (Z : Measure UnitWeight) =
      ProbabilityTheory.betaMeasure 1 B) (b : E) :
    IsDirichletProcess (U + Measure.dirac b) (atomMixtureLaw D Z b) :=
  @GGC.beta_atom_posterior E _ _ _ _ U D hD B hB hMass Z hZ b

#print axioms GGC.RandomMeasure.gammaVector_normalize_sum
#print axioms GGC.RandomMeasure.gammaVector_normalize_sum_of_pos
#print axioms GGC.RandomMeasure.dirichletLaw_single_positive
#print axioms GGC.RandomMeasure.gammaVector_addCoordinate
#print axioms GGC.RandomMeasure.dirichlet_coordinate_update
#print axioms GGC.RandomMeasure.beta_atom_posterior
#print axioms GGC.beta_atom_posterior
