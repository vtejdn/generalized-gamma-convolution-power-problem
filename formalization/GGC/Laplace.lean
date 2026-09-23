import GGC.Basic

/-! Laplace-transform definitions and, in later stages, their analytic lemmas. -/

noncomputable section
open MeasureTheory
namespace GGC

/-- The ordinary Laplace transform. Membership uses it only for s > 0. -/
def laplace (μ : NonnegLaw) (s : ℝ) : ℝ :=
  ∫ x : ℝ, Real.exp (-s * x) ∂(μ.law : Measure ℝ)

end GGC
