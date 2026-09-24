import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Log

/-! # Registered bounded-phase representation input E-S1

Schilling--Song--Vondracek, Bernstein Functions: Theory and Applications,
2010 first edition, Theorem 6.10 (printed pp.58--60, including its analytic
extension) and Theorem 7.3 (printed p.63). Official first-edition errata:
https://www.motapa.de/bernstein_functions/misprints-ssv.pdf (2022-12-01).
Publisher: https://doi.org/10.1515/9783110215311

Source-review status (2026-09-24): S1-SOURCE is independently verified and closed.
The designer freshly rendered and inspected the 2010 first-edition pages and
official errata, confirming the file identity and all interface adaptations.
See `SSVSourceCheck-2026-09-24.md` and `ConstructionReport.md`, Section 34.
`SemanticAudit-2026-09-24.md` retains its historical findings unchanged.
This declaration remains an assumption. Local source: `literature/pdf/SSV.pdf`.
This is a source-derived specialization to the nonzero Stieltjes transform
of a probability measure on positive rates. Apply 6.10 to its reciprocal
using 7.3, negate the logarithm and subtract the value at one. The upper
half-plane identity retains the principal logarithm, whose imaginary part
is negative for the original Stieltjes transform.

The corrected intermediate Herglotz measure is finite on [0,infinity).
We use neither the false reverse inclusion in Remark 6.11 nor a zero anchor.
The contract assumes no inverse moment at zero.

Only representation, integrability and a.e. uniqueness are external inputs.
Boundary limits, canonical limsup representatives, joint measurability and
varying-law continuity are NOT asserted here. All objects in this file are
standard measures, functions and integrals; no project proof is imported.
-/

noncomputable section
open MeasureTheory Set
namespace GGC.External.SSV

/-- The real-axis, anchor-one portion of the registered source contract. -/
structure RealPhase (P : ProbabilityMeasure {b : ℝ // 0 < b}) (η : ℝ → ℝ) : Prop where
  measurable : Measurable η
  bounds : ∀ t, 0 ≤ η t ∧ η t ≤ 1
  integrable : ∀ s : ℝ, 0 < s →
    IntegrableOn (fun t => η t * ((s+t)⁻¹-(1+t)⁻¹)) (Ioi 0)
  anchor_one : ∀ s : ℝ, 0 < s →
    Real.log (∫ b, (s+b.val)⁻¹ ∂(P : Measure {b : ℝ // 0 < b})) -
      Real.log (∫ b, (1+b.val)⁻¹ ∂(P : Measure {b : ℝ // 0 < b})) =
      ∫ t in Ioi 0, η t * ((s+t)⁻¹-(1+t)⁻¹)

/-- Retain the complex-domain representation needed for local Poisson recovery. -/
structure Phase (P : ProbabilityMeasure {b : ℝ // 0 < b}) (η : ℝ → ℝ) : Prop
    extends RealPhase P η where
  complex_integrable : ∀ z : ℂ, 0 < z.im →
    IntegrableOn (fun t : ℝ => (η t : ℂ) * ((z+(t:ℂ))⁻¹-((1+t:ℝ):ℂ)⁻¹)) (Ioi 0)
  complex_anchor_one : ∀ z : ℂ, 0 < z.im →
    Complex.log (∫ b, (z+(b.val:ℂ))⁻¹ ∂(P : Measure {b : ℝ // 0 < b})) -
      (Real.log (∫ b, (1+b.val)⁻¹ ∂(P : Measure {b : ℝ // 0 < b})) : ℂ) =
      ∫ t in Ioi 0, (η t : ℂ) * ((z+(t:ℂ))⁻¹-((1+t:ℝ):ℂ)⁻¹)

/-- E-S1, source-derived specialization. The phase is unique only almost everywhere. -/
axiom phase_representation (P : ProbabilityMeasure {b : ℝ // 0 < b}) :
    ∃ η : ℝ → ℝ, Phase P η ∧
      ∀ ζ : ℝ → ℝ, RealPhase P ζ → ζ =ᵐ[volume.restrict (Ioi 0)] η

end GGC.External.SSV
