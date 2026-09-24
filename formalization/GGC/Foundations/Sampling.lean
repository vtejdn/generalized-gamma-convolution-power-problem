import GGC.Foundations.RandomMeasure
import Mathlib.Probability.Kernel.Representation

/-! # Joint sampling of supplied probability laws

API-008: this is a production adapter for mathlib's kernel representation theorem.
It supplies a measurable sampler, not a continuous quantile coupling or DP existence.
The parameter space carries the existing Giry structure.
-/

noncomputable section
open MeasureTheory
namespace GGC.RandomMeasure

variable {E : Type*} [MeasurableSpace E] [Nonempty E] [StandardBorelSpace E]

theorem exists_joint_probability_sampler :
    ∃ f : ProbabilityMeasure E → unitInterval → E,
      Measurable (Function.uncurry f) ∧
      ∀ P, volume.map (f P) = (P : Measure E) := by
  let κ : ProbabilityTheory.Kernel (ProbabilityMeasure E) E :=
    ⟨fun P => (P : Measure E), measurable_subtype_coe⟩
  haveI : ProbabilityTheory.IsMarkovKernel κ := ⟨fun P => P.property⟩
  exact ProbabilityTheory.Kernel.exists_measurable_map_eq_unitInterval κ

def probabilitySampler : ProbabilityMeasure E → unitInterval → E :=
  exists_joint_probability_sampler.choose

@[fun_prop] theorem measurable_probabilitySampler :
    Measurable (Function.uncurry (probabilitySampler (E := E))) :=
  exists_joint_probability_sampler.choose_spec.1

theorem probabilitySampler_map (P : ProbabilityMeasure E) :
    volume.map (probabilitySampler P) = (P : Measure E) :=
  exists_joint_probability_sampler.choose_spec.2 P

theorem measurable_probabilitySampler_section (P : ProbabilityMeasure E) :
    Measurable (probabilitySampler P) :=
  measurable_probabilitySampler.of_uncurry_left

end GGC.RandomMeasure
