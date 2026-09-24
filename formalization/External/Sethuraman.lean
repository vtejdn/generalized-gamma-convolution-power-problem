import GGC.Foundations.StickBreaking
import Mathlib.Probability.Distributions.Beta
import Mathlib.Probability.Independence.InfinitePi

/-! # Registered stick-breaking input E-T1

J. Sethuraman, A constructive definition of Dirichlet priors,
Statistica Sinica 4 (1994), 639--650. Section 2, printed pp.642--643,
equation (2.1), and Theorem 3.4, printed p.645.
Primary reprint inspected 2026-09-24:
https://www.cs.princeton.edu/courses/archive/fall07/cos597C/readings/Sethuraman1994.pdf

This source-derived formulation states the joint independent input law as
an actual product of countable products. The beta fractions, not their
dependent stick weights, are independent. The output is the shared
finite-partition DP predicate, including zero-mass cells.

The caller supplies a measurable probability-valued version of the sum,
equal to the stick measure almost surely. Thus this interface assumes no
parameterized measurability, common event, sampling construction or tail
estimate; those are local obligations. No project proof module is imported.
-/

open MeasureTheory Set
namespace GGC.External.Sethuraman
open RandomMeasure

/-- E-T1: finite-partition laws of the actual independent beta stick sum. -/
axiom stick_breaking
    {E Ω : Type*} [MeasurableSpace E] [MeasurableSpace Ω]
    (m : ProbabilityMeasure Ω) (B : ℝ) (hB : 0 < B) (F : ProbabilityMeasure E)
    (Z : ProbabilityMeasure UnitWeight)
    (hZ : Measure.map Subtype.val (Z : Measure UnitWeight) =
      ProbabilityTheory.betaMeasure 1 B)
    (V : Ω → ℕ → UnitWeight) (Y : Ω → ℕ → E)
    (hV : Measurable V) (hY : Measurable Y)
    (hInput : Measure.map (fun ω => (V ω, Y ω)) (m : Measure Ω) =
      (Measure.infinitePi (fun _ : ℕ => (Z : Measure UnitWeight))).prod
        (Measure.infinitePi (fun _ : ℕ => (F : Measure E))))
    (Q : Ω → ProbabilityMeasure E) (hQ : Measurable Q)
    (hSum : ∀ᵐ ω ∂(m : Measure Ω),
      (Q ω : Measure E) = stickMeasure (V ω) (Y ω)) :
    IsDirichletProcess (ENNReal.ofReal B • (F : Measure E)) (m.map hQ.aemeasurable)

end GGC.External.Sethuraman
