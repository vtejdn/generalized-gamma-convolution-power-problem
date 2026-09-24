import Definitions

/-! Basic law and power-pushforward lemmas, separated from the public statement. -/

noncomputable section
open MeasureTheory Filter Topology
namespace GGC

/-- The underlying probability measure determines a nonnegative law. -/
theorem NonnegLaw.ext {μ ν : NonnegLaw} (h : μ.law = ν.law) : μ = ν := by
  cases μ
  cases ν
  cases h
  rfl

/-- The pushforward semantics, exposed for inspection without unfolding structures. -/
theorem powerLaw_toMeasure (μ : NonnegLaw) (q : ℝ) (hq : 0 ≤ q) :
    ((powerLaw μ q hq).law : Measure ℝ) =
      Measure.map (fun x : ℝ => x ^ q) (μ.law : Measure ℝ) := rfl

/-- Endpoint sanity check: exponent one leaves the actual law unchanged. -/
theorem powerLaw_one (μ : NonnegLaw) : powerLaw μ 1 zero_le_one = μ := by
  apply NonnegLaw.ext
  apply ProbabilityMeasure.toMeasure_injective
  change Measure.map (fun x : ℝ => x ^ (1 : ℝ)) (μ.law : Measure ℝ) = _
  simp only [Real.rpow_one]
  exact Measure.map_id

/-- A nonnegative constant law, including the constant zero. -/
def diracLaw (a : ℝ) (ha : 0 ≤ a) : NonnegLaw where
  law := ⟨Measure.dirac a, inferInstance⟩
  nonneg := by simpa using ha

/-- The GGC power-closure endpoint follows from the identity pushforward. -/
theorem isGGC_powerLaw_one (μ : NonnegLaw) (hμ : IsGGC μ) :
    IsGGC (powerLaw μ 1 zero_le_one) := by
  simpa only [powerLaw_one] using hμ

/-- Constant laws are pushed forward to the corresponding powered constants. -/
theorem powerLaw_diracLaw (a : ℝ) (ha : 0 ≤ a) (q : ℝ) (hq : 0 ≤ q) :
    powerLaw (diracLaw a ha) q hq = diracLaw (a ^ q) (Real.rpow_nonneg ha q) := by
  apply NonnegLaw.ext
  apply ProbabilityMeasure.toMeasure_injective
  change Measure.map (fun x : ℝ => x ^ q) (Measure.dirac a) = Measure.dirac (a ^ q)
  exact Measure.map_dirac' (Real.continuous_rpow_const hq).measurable a

/-- Fixed nonnegative real powers preserve weak convergence of the underlying laws.
No GGC assumption or moment condition is required. -/
theorem power_pushforward_tendsto (μs : ℕ → NonnegLaw) (μ : NonnegLaw)
    (q : ℝ) (hq : 0 ≤ q)
    (hlim : Tendsto (fun n => (μs n).law) atTop (𝓝 μ.law)) :
    Tendsto (fun n => (powerLaw (μs n) q hq).law) atTop
      (𝓝 (powerLaw μ q hq).law) := by
  exact ProbabilityMeasure.tendsto_map_of_tendsto_of_continuous
    (fun n => (μs n).law) μ.law hlim (Real.continuous_rpow_const hq)

end GGC
