import GGC.Foundations.MarkovKrein
import GGC.GammaDirichlet

/-!
# E3.3 bounded Markov-Krein and unchanged consumer contracts

Created by: constructor. Maintainer: shared designer-constructor.
Target: Blueprint Section 19.4 / API-071. Status: active.
This is not an independent-reviewer-owned artifact.

Checks the arbitrary bounded measurable test, every finite base and supplied
Dirichlet-process law, mean measurability/integrability, zero bound, zero cell
mass, and the unchanged complete dirichletMean_laplace contract including t=0.
The retired unbounded/log-integrable E-J1 interface is not asserted or checked.
Axiom output must be compared with standard logic only for these endpoints;
this does not replace the full audit or independent design acceptance.

Working directory: formalization. Pinned Lean: v4.32.2.
Command: C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe env lean Checks/E3MarkovKreinContract.lean
Evidence: ConstructionReport Section 45 and .lake/e3-three-contract.log.
Production: GGC/Foundations/MarkovKreinFinite.lean and MarkovKrein.lean.
Lifecycle: retain for the bounded contract, degenerate cases and consumer scope.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set GGC GGC.RandomMeasure
open scoped ENNReal NNReal BigOperators
variable {E : Type*} [MeasurableSpace E]

example (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B)
    (g : E → ℝ) (hg : Measurable g) (hg₀ : ∀ x, 0 ≤ g x)
    (C : ℝ) (hgC : ∀ x, g x ≤ C) :
    (∫ P, (1+∫ x, g x ∂(P : Measure E))^(-B)
      ∂(D : Measure (ProbabilityMeasure E))) =
      Real.exp (-(∫ x, Real.log (1+g x) ∂U)) :=
  markov_krein_of_bounded U D hD B hB hMass g hg hg₀ C hgC

example {g : E → ℝ} (hg : Measurable g) :
    Measurable (fun P : ProbabilityMeasure E => ∫ x, g x ∂(P : Measure E)) :=
  measurable_probability_mean hg

example {g : E → ℝ} (hg : Measurable g) (hg₀ : ∀ x, 0 ≤ g x)
    (C : ℝ) (hgC : ∀ x, g x ≤ C) (P : ProbabilityMeasure E) :
    Integrable g (P : Measure E) := integrable_nonneg_bounded _ hg hg₀ C hgC

-- Zero bound is admitted; there is no strict bound hypothesis.
example (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B) :
    (∫ P, (1+∫ _ : E, (0 : ℝ) ∂(P : Measure E))^(-B)
      ∂(D : Measure (ProbabilityMeasure E))) =
      Real.exp (-(∫ _ : E, Real.log (1+(0 : ℝ)) ∂U)) :=
  markov_krein_of_bounded U D hD B hB hMass (fun _ => 0)
    measurable_const (fun _ => le_rfl) 0 (fun _ => le_rfl)

-- Coefficients on zero-mass cells are unrestricted nonnegative real numbers.
example {n : ℕ} (a : Fin n → ℝ≥0) (ha : ∑ i, a i ≠ 0)
    (j : Fin n) (_hj : a j = 0) (c : Fin n → ℝ) (hc : ∀ i, 0 ≤ c i) :
    (∫ q, (1+∑ i, c i*q i)^(-(∑ i, (a i : ℝ)))
      ∂(dirichletLaw a : Measure (Fin n → ℝ))) =
      Real.exp (-(∑ i, (a i : ℝ)*Real.log (1+c i))) :=
  dirichlet_transform a ha c hc

-- Original public consumer type, with its bound discharged internally.
example {U : Measure PosReal}
    {D : ProbabilityMeasure (ProbabilityMeasure PosReal)} (hD : IsDirichletProcess U D)
    (B : PosReal) (hMass : U univ = ENNReal.ofReal B.val) (s : PosReal)
    {t : ℝ} (ht : 0 ≤ t) :
    laplace (gammaDirichletLaw D B s) t =
      Real.exp (-(∫ b : PosReal, Real.log (1 + t / (s.val + b.val)) ∂U)) :=
  dirichletMean_laplace hD B hMass s ht

example {U : Measure PosReal}
    {D : ProbabilityMeasure (ProbabilityMeasure PosReal)} (hD : IsDirichletProcess U D)
    (B : PosReal) (hMass : U univ = ENNReal.ofReal B.val) (s : PosReal) :
    laplace (gammaDirichletLaw D B s) 0 = 1 := by
  have h := dirichletMean_laplace hD B hMass s (t := 0) le_rfl
  simpa only [zero_div, add_zero, Real.log_one, integral_zero, neg_zero, Real.exp_zero] using h

#print axioms GGC.RandomMeasure.dirichlet_transform
#print axioms GGC.RandomMeasure.markov_krein_simple
#print axioms GGC.RandomMeasure.measurable_probability_mean
#print axioms GGC.RandomMeasure.integrable_nonneg_bounded
#print axioms GGC.RandomMeasure.markov_krein_of_bounded
#print axioms GGC.dirichletMean_laplace
#print axioms GGC.tiltedLaw_eq_gammaDirichlet
