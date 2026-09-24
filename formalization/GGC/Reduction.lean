import GGC.WeakClosure

/-!
# Conditional reduction to finite gamma inputs

Blueprint node W / M1; WIP-6.21 and manuscript Section 6, final approximation.
This proves the final weak-limit step, keeping the finite-input power theorem
as an explicit premise. `GGC.PowerClosure` supplies its proved instance. In particular,
this module does not declare `GGC.ggc_rpow` or use a core literature axiom.
-/

noncomputable section
open Filter Topology
namespace GGC

/-- For a fixed nonnegative exponent, finite-input closure suffices for every
GGC law. The approximants come directly from the original definition. -/
theorem isGGC_powerLaw_of_finiteGamma (q : ℝ) (hq : 0 ≤ q)
    (hfinite : ∀ ν : NonnegLaw, IsFiniteGammaConvolution ν → IsGGC (powerLaw ν q hq))
    (μ : NonnegLaw) (hμ : IsGGC μ) : IsGGC (powerLaw μ q hq) := by
  obtain ⟨μs, hμs, hlim⟩ := hμ
  exact isGGC_of_tendsto (fun n => powerLaw (μs n) q hq) (powerLaw μ q hq)
    (fun n => hfinite (μs n) (hμs n)) (power_pushforward_tendsto μs μ q hq hlim)

/-- Conditional assembly of the complete target. Its sole mathematical premise
is the finite-gamma power-closure theorem for all real q ≥ 1. -/
theorem ggcPowerClosure_of_finiteGamma
    (hfinite : ∀ (ν : NonnegLaw) (q : ℝ) (hq : 1 ≤ q),
      IsFiniteGammaConvolution ν → IsGGC (powerLaw ν q (zero_le_one.trans hq))) :
    GGCPowerClosure := by
  intro μ q hq hμ
  exact isGGC_powerLaw_of_finiteGamma q (zero_le_one.trans hq)
    (fun ν hν => hfinite ν q hq hν) μ hμ

end GGC
