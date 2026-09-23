import GGC.Foundations.Posterior
import Mathlib.Probability.Distributions.Beta
import Mathlib.Topology.MetricSpace.Polish

/-! # Registered James inputs E-J1--E-J3

Source: L. F. James (2005), Annals of Statistics 33, 647--660,
doi:10.1214/009053604000001237, arXiv:math/0505606v1.
Primary reprint checked 2026-09-23: https://arxiv.org/pdf/math/0505606 .
Reprint pagination: p.2 (1)--(3); pp.4--5 posterior discussion and (8).

These are explicit literature assumptions. This file imports only mathlib
and shared measure semantics, never `main` or project deductions. Its DP
predicate is the actual finite-partition law, including zero-mass cells.
-/

open MeasureTheory Set
open scoped ENNReal

namespace GGC.External.James
open GGC.RandomMeasure

variable {E : Type*} [MeasurableSpace E] [TopologicalSpace E] [PolishSpace E] [BorelSpace E]

/-- E-J1: source-derived real nonnegative specialization of (1)--(3), z=1.
The random mean's a.s. absolute integrability is included explicitly.
Gamma normalization/independence is the source justification; identifying
particular project laws and their tilted marginals is not asserted here. -/
axiom markov_krein
    (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B)
    (g : E → ℝ) (hg : Measurable g) (hg₀ : ∀ b, 0 ≤ g b)
    (hlog : Integrable (fun b => Real.log (1 + g b)) U) :
    (∀ᵐ (P : ProbabilityMeasure E) ∂(D : Measure (ProbabilityMeasure E)), Integrable g (P : Measure E)) ∧
      (∫ (P : ProbabilityMeasure E), (1 + ∫ b, g b ∂(P : Measure E)) ^ (-B)
        ∂(D : Measure (ProbabilityMeasure E))) =
        Real.exp (-(∫ b, Real.log (1 + g b) ∂U))

/-- E-J2: the nonnegative one-observation disintegration underlying (8).
K is an explicitly measurable posterior probability kernel. Atomic,
nonatomic and mixed bases are allowed. Signed transfer needs local L1 proofs. -/
axiom posterior_palm_nonneg
    (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B)
    (K : E → ProbabilityMeasure (ProbabilityMeasure E)) (hK : Measurable K)
    (hpost : ∀ b, IsDirichletProcess (U + Measure.dirac b) (K b))
    (Φ : E × ProbabilityMeasure E → ℝ≥0∞) (hΦ : Measurable Φ) :
    (∫⁻ (P : ProbabilityMeasure E), ∫⁻ b, Φ (b,P) ∂(P : Measure E) ∂(D : Measure (ProbabilityMeasure E))) =
      ∫⁻ b, ∫⁻ P, Φ (b,P) ∂(K b : Measure (ProbabilityMeasure E))
        ∂(ENNReal.ofReal (1 / B) • U)

/-- E-J3, source-derived, not quoted as a numbered theorem: add an independent
unit-rate gamma of shape one at b to the gamma process of base U, then
normalize. Gamma normalization on p.2 yields the independent Beta(1,B)
weight and the DP(U+δ_b) law used in the posterior discussion on pp.4--5.
The independent product and mixture are defined in the shared foundation.
No logarithmic estimate or parameter regularity is assumed. -/
axiom beta_atom_posterior
    (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B)
    (Z : ProbabilityMeasure UnitWeight)
    (hZ : Measure.map (fun z : UnitWeight => z.val) (Z : Measure UnitWeight) =
      ProbabilityTheory.betaMeasure 1 B) (b : E) :
    IsDirichletProcess (U + Measure.dirac b) (atomMixtureLaw D Z b)

end GGC.External.James
