import GGC.Foundations.DirichletPalm

/-! # Locally proved one-observation Palm identity (former E-J2)

Source: L. F. James (2005), Annals of Statistics 33, 647--660,
doi:10.1214/009053604000001237, arXiv:math/0505606v1.
Primary reprint checked 2026-09-23: https://arxiv.org/pdf/math/0505606 .
Reprint pagination: p.2 (1)--(3); pp.4--5 posterior discussion and (8).

The complete nonnegative contract is proved by the independent lower layer.
The public interface and lower result require only a measurable space, matching
the historical elaborated axiom type. No new source audit is claimed.
-/

open MeasureTheory Set
open scoped ENNReal
namespace GGC
open RandomMeasure

/-- E-J2: the nonnegative one-observation disintegration underlying (8).
K is an explicitly measurable posterior probability kernel. Atomic,
nonatomic and mixed bases are allowed. Signed transfer needs local L1 proofs. -/
theorem posterior_palm_nonneg
    {E : Type*} [MeasurableSpace E]
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
  RandomMeasure.posterior_palm_nonneg U D hD B hB hMass K hK hpost Φ hΦ

end GGC
