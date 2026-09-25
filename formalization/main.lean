import Definitions
import GGC.PowerClosure
import GGC.WeakClosure

/-!
# GGC closure under real powers q ≥ 1

Complete definitions are in `Definitions.lean`: GGC laws are weak limits of
actual finite gamma convolutions, and `powerLaw` is the probability pushforward
under the power map. Evolution and identification for finite inputs are proved
in `GGC/PowerClosure.lean` and its `Identification` and `LogRate` dependencies.
This entry point extends that result to all GGC laws using continuity of the
fixed power map and `GGC/WeakClosure.lean`.
-/

noncomputable section
open Filter Topology

namespace GGC

/-- Every nonnegative GGC probability law remains GGC under every real power `q ≥ 1`.
This includes arbitrary drift, infinite Thorin mass, nonatomic Thorin measures,
and degenerate laws, with no additional moment conditions.
The proof is relative to the registered literature axiom E-S1.
`AxiomAudit.lean` checks its transitive dependencies. -/
theorem ggc_rpow : GGCPowerClosure := by
  intro μ q hq hμ
  -- The original GGC definition supplies finite gamma approximants, without
  -- requiring uniform bounds on their moments, shapes, or rates.
  obtain ⟨μs, hμs, hlim⟩ := hμ
  -- Finite-input closure covers the empty sum and q = 1. For nonempty inputs
  -- and q > 1, normalized finite Thorin data gives an initial log-rate law;
  -- evolution is constructed up to T = log q, and dynamic identification
  -- yields the actual power law. These analytic details stay in the helpers.
  have hpowered : ∀ n, IsGGC (powerLaw (μs n) q (zero_le_one.trans hq)) := by
    intro n
    exact isGGC_power_of_isFiniteGammaConvolution (μs n) q hq (hμs n)
  -- The fixed nonnegative power map is continuous, so its pushforward preserves
  -- weak convergence. The limit is the actual law powerLaw μ q, not merely
  -- a formally matching transform.
  have hpowered_lim :
      Tendsto (fun n => (powerLaw (μs n) q (zero_le_one.trans hq)).law) atTop
        (𝓝 (powerLaw μ q (zero_le_one.trans hq)).law) :=
    power_pushforward_tendsto μs μ q (zero_le_one.trans hq) hlim
  -- Weak closure of the original GGC class completes the limit argument,
  -- removing the finite Thorin mass and log-rate moment restrictions used
  -- in the finite-input construction without adding hypotheses on μ.
  exact isGGC_of_tendsto (fun n => powerLaw (μs n) q (zero_le_one.trans hq))
    (powerLaw μ q (zero_le_one.trans hq)) hpowered hpowered_lim

end GGC
