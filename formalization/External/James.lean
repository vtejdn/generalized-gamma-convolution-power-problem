import GGC.Foundations.Posterior
import Mathlib.Topology.MetricSpace.Polish

/-! # Remaining James axiom E-J2

Source: L. F. James (2005), Annals of Statistics 33, 647--660,
doi:10.1214/009053604000001237, arXiv:math/0505606v1.
Primary reprint checked 2026-09-23: https://arxiv.org/pdf/math/0505606 .
Reprint pagination: p.2 (1)--(3); pp.4--5 posterior discussion and (8).

E-J2 remains an explicit literature assumption. The locally proved E-J3
interface now belongs to GGC.DirichletPosterior, outside External. The unused general
E-J1 interface is retired; its consumer uses the separately named local bounded
Markov-Krein formula. This is not a proof of the general unbounded interface.
The DP
predicate is the actual finite-partition law, including zero-mass cells.
-/

open MeasureTheory Set
open scoped ENNReal

namespace GGC.External.James
open GGC.RandomMeasure

variable {E : Type*} [MeasurableSpace E] [TopologicalSpace E] [PolishSpace E] [BorelSpace E]

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

end GGC.External.James
