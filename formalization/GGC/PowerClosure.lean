import GGC.Identification.DynamicIdentification
import GGC.Identification.InitialData
import GGC.Reduction

/-! # GGC closure under deterministic real powers q ≥ 1

The finite-input theorem is obtained from the constructed nonlinear log-rate
evolution and its dynamic identification at time log q. The original weak-limit
definition and continuity of the fixed power map remove all construction
moment and finite-mass assumptions. The literature trust boundary is audited
in `AxiomAudit.lean`; the public definitions remain in `main.lean`.
-/

noncomputable section
open MeasureTheory
namespace GGC
open Identification

theorem isGGC_power_valueLaw (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ))
    (q : ℝ) (hq : 1 ≤ q) :
    IsGGC (powerLaw (valueLaw B F hF) q (zero_le_one.trans hq)) := by
  rcases hq.eq_or_lt with rfl | hq
  · exact isGGC_powerLaw_one _ (isGGC_valueLaw B F hF)
  have hT : 0 < Real.log q := Real.log_pos hq
  obtain ⟨w⟩ := LogRate.exists_weakLogRateSolution B F hF (Real.log q) hT
  have he := isGGC_power_valueLaw_of_weakSolution w hT.le hF ⟨hT.le,le_rfl⟩
  simpa only [Real.exp_log (zero_lt_one.trans hq)] using he

/-- Includes the empty sum, arbitrary positive shapes and rates, and every
real exponent at least one. -/
theorem isGGC_power_finiteGammaLaw (k : ℕ) (α b : Fin k → PosReal)
    (q : ℝ) (hq : 1 ≤ q) :
    IsGGC (powerLaw (finiteGammaLaw k α b) q (zero_le_one.trans hq)) := by
  cases k with
  | zero =>
      rw [finiteGammaLaw_zero, powerLaw_diracLaw]
      exact isGGC_diracLaw _ _
  | succ k =>
      obtain ⟨B,F,hF,he⟩ := exists_finiteGamma_initialData (Nat.succ_pos k) α b
      rw [← he]
      exact isGGC_power_valueLaw B F hF q hq

theorem isGGC_power_of_isFiniteGammaConvolution (μ : NonnegLaw)
    (q : ℝ) (hq : 1 ≤ q) (hμ : IsFiniteGammaConvolution μ) :
    IsGGC (powerLaw μ q (zero_le_one.trans hq)) := by
  obtain ⟨k,α,b,rfl⟩ := hμ
  exact isGGC_power_finiteGammaLaw k α b q hq

/-- The complete public target: no moment, drift, Thorin-mass, support,
atomicity or nondegeneracy restriction remains on the input law. -/
theorem ggc_rpow : GGCPowerClosure :=
  ggcPowerClosure_of_finiteGamma isGGC_power_of_isFiniteGammaConvolution

end GGC
