import GGC.Foundations.DirichletUpdate
import Mathlib.Topology.MetricSpace.Polish

/-! # The locally proved James E-J3 posterior interface

Source: L. F. James (2005), Annals of Statistics 33, 647--660,
doi:10.1214/009053604000001237, arXiv:math/0505606v1.
Primary reprint: https://arxiv.org/pdf/math/0505606 .
The original primitive contract is preserved over the independent lower proof.
-/

open MeasureTheory Set
open scoped ENNReal
namespace GGC
open GGC.RandomMeasure
variable {E : Type*} [MeasurableSpace E] [TopologicalSpace E] [PolishSpace E] [BorelSpace E]

-- Preserve the original topology binders in the public E-J3 contract.
set_option linter.unusedSectionVars false in
/-- E-J3, source-derived, not quoted as a numbered theorem: add an independent
unit-rate gamma of shape one at b to the gamma process of base U, then
normalize. Gamma normalization on p.2 yields the independent Beta(1,B)
weight and the DP(U+δ_b) law used in the posterior discussion on pp.4--5.
The independent product and mixture are defined in the shared foundation.
Now proved locally from finite Gamma vectors, including zero-mass cells.
No Gamma-process axiom, logarithmic estimate or parameter regularity is assumed. -/
theorem beta_atom_posterior
    (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B)
    (Z : ProbabilityMeasure UnitWeight)
    (hZ : Measure.map (fun z : UnitWeight => z.val) (Z : Measure UnitWeight) =
      ProbabilityTheory.betaMeasure 1 B) (b : E) :
    IsDirichletProcess (U + Measure.dirac b) (atomMixtureLaw D Z b) :=
  GGC.RandomMeasure.beta_atom_posterior U D hD B hB hMass Z hZ b

end GGC
