import GGC.Basic
import Mathlib.MeasureTheory.Measure.LevyProkhorovMetric
import Mathlib.Topology.Sequences

/-!
# Weak closure of the original GGC class

Blueprint node W / M1; manuscript `lem:ggc-closure`.
The weak topology on real probability measures is metrizable. Consequently
the sequential definition in `main` is equivalent to membership in the
topological closure of the finite-gamma laws. No Thorin characterization or
external mathematical axiom is used.
-/

noncomputable section
open MeasureTheory Filter Topology
namespace GGC

/-- The original sequential definition equals topological closure in the space
of probability measures. The image retains the actual finite-gamma semantics. -/
theorem isGGC_iff_mem_closure (μ : NonnegLaw) :
    IsGGC μ ↔ μ.law ∈ closure (NonnegLaw.law '' {ν | IsFiniteGammaConvolution ν}) := by
  rw [mem_closure_iff_seq_limit]
  constructor
  · rintro ⟨μs, hμs, hlim⟩
    exact ⟨fun n => (μs n).law, fun n => ⟨μs n, hμs n, rfl⟩, hlim⟩
  · rintro ⟨μs, hμs, hlim⟩
    choose νs hνs heq using hμs
    refine ⟨νs, hνs, ?_⟩
    simpa only [heq] using hlim

/-- Weak limits of GGC probability laws are GGC, proved from the original
finite-gamma weak-limit definition. No uniform moment hypothesis is needed. -/
theorem isGGC_of_tendsto (μs : ℕ → NonnegLaw) (μ : NonnegLaw)
    (hμs : ∀ n, IsGGC (μs n))
    (hlim : Tendsto (fun n => (μs n).law) atTop (𝓝 μ.law)) : IsGGC μ := by
  apply (isGGC_iff_mem_closure μ).2
  exact isClosed_closure.mem_of_tendsto hlim
    (Filter.Eventually.of_forall fun n => (isGGC_iff_mem_closure (μs n)).1 (hμs n))

end GGC
