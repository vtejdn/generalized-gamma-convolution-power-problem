import GGC.DampedMoments
import GGC.LaplaceContinuity
import GGC.NonnegTests

/-! # Narrow continuity of exponentially damped logarithmic moments -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC

theorem continuous_laplace_of_narrow {X : Type*} [TopologicalSpace X]
    (μ : X → NonnegLaw) (hc : Continuous (fun x => (μ x).law))
    {s : ℝ} (hs : 0 ≤ s) : Continuous (fun x => laplace (μ x) s) :=
  continuous_iff_continuousAt.mpr fun x => tendsto_laplace_of_narrow (hc.tendsto x) hs

theorem continuous_dampedLogMoment_of_narrow {X : Type*} [TopologicalSpace X]
    (μ : X → NonnegLaw) (hc : Continuous (fun x => (μ x).law))
    (n : ℕ) {s : ℝ} (hs : 0 < s) : Continuous (fun x => dampedLogMoment (μ x) n s) := by
  obtain ⟨C, _, hb⟩ := damped_log_pow_bound n hs
  let f : ℝ → ℝ := fun x => x^(n+1) * Real.log x * Real.exp (-s*x)
  have hf : Continuous f := by
    have h := ((continuous_id.pow n).mul Real.continuous_mul_log).mul
        (show Continuous (fun x : ℝ => Real.exp (-s*x)) by fun_prop)
    convert! h using 1
    funext x
    dsimp [f]
    ring
  exact continuous_integral_nonnegLaw_test μ hc hf (fun x hx => hb s x le_rfl hx)

theorem continuous_tiltedXLog_of_narrow {X : Type*} [TopologicalSpace X]
    (μ : X → NonnegLaw) (hc : Continuous (fun x => (μ x).law))
    {s : ℝ} (hs : 0 < s) : Continuous (fun x => tiltedXLog (μ x) s) :=
  (continuous_dampedLogMoment_of_narrow μ hc 0 hs).div
    (continuous_laplace_of_narrow μ hc hs.le) (fun x => ne_of_gt (laplace_pos (μ x) hs.le))

end GGC
