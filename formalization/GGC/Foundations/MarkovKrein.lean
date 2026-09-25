import GGC.Foundations.MarkovKreinFinite
import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.MeasureTheory.Function.SimpleFuncDense

/-!
# Bounded Markov-Krein formula

Finite fiber partitions give the simple-function identity. Approximation in
[0,C] and dominated convergence extend it to every bounded nonnegative
measurable function. This does not assert the unused unbounded interface.
-/
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Topology
open scoped NNReal ENNReal BigOperators
namespace GGC.RandomMeasure
variable {E : Type*} [MeasurableSpace E]

/-- Bounded nonnegative measurable tests are integrable for every finite measure. -/
theorem integrable_nonneg_bounded (μ : Measure E) [IsFiniteMeasure μ]
    {g : E → ℝ} (hg : Measurable g) (hg₀ : ∀ x, 0 ≤ g x)
    (C : ℝ) (hgC : ∀ x, g x ≤ C) : Integrable g μ := by
  apply (integrable_const C).mono' hg.aestronglyMeasurable
  exact Eventually.of_forall fun x => by simpa [Real.norm_eq_abs, abs_of_nonneg (hg₀ x)] using hgC x

/-- Integration against an actual varying probability measure is measurable. -/
theorem measurable_probability_mean {g : E → ℝ} (hg : Measurable g) :
    Measurable (fun P : ProbabilityMeasure E => ∫ x, g x ∂(P : Measure E)) :=
  measurable_probability_integral measurable_id (hg.comp measurable_snd)

/-- Measurability of the negative-power test used in the outer integral. -/
theorem measurable_mean_rpow {g : E → ℝ} (hg : Measurable g) (B : ℝ) :
    Measurable (fun P : ProbabilityMeasure E => (1+∫ x, g x ∂(P : Measure E))^(-B)) :=
  (measurable_rpow_const (-B)).comp (measurable_const.add (measurable_probability_mean hg))

/-- The outer integrand is bounded by one for nonnegative means. -/
theorem norm_mean_rpow_le_one (P : ProbabilityMeasure E) {g : E → ℝ}
    (hg₀ : ∀ x, 0 ≤ g x) {B : ℝ} (hB : 0 ≤ B) :
    ‖(1+∫ x, g x ∂(P : Measure E))^(-B)‖ ≤ 1 := by
  have hi : 0 ≤ ∫ x, g x ∂(P : Measure E) := integral_nonneg hg₀
  rw [Real.norm_eq_abs, abs_of_nonneg (Real.rpow_nonneg (by positivity) _)]
  exact Real.rpow_le_one_of_one_le_of_nonpos (by linarith) (neg_nonpos.mpr hB)

/-- The logarithmic integrand has a constant bound on [0,C]. -/
theorem norm_log_one_add_le {x C : ℝ} (hx : 0 ≤ x) (hC : x ≤ C) :
    ‖Real.log (1+x)‖ ≤ Real.log (1+C) := by
  rw [Real.norm_eq_abs, abs_of_nonneg (Real.log_nonneg (by linarith))]
  exact Real.log_le_log (by positivity) (by linarith)

/-- The bounded nonnegative Markov-Krein formula for the actual finite-partition
Dirichlet-process law. The base, law, total mass and test are arbitrary.
The bound may be zero, and no individual partition mass must be positive. -/
theorem markov_krein_of_bounded
    (U : Measure E) (D : ProbabilityMeasure (ProbabilityMeasure E))
    (hD : IsDirichletProcess U D) (B : ℝ) (hB : 0 < B)
    (hMass : U univ = ENNReal.ofReal B)
    (g : E → ℝ) (hg : Measurable g) (hg₀ : ∀ x, 0 ≤ g x)
    (C : ℝ) (hgC : ∀ x, g x ≤ C) :
    (∫ P, (1+∫ x, g x ∂(P : Measure E))^(-B)
      ∂(D : Measure (ProbabilityMeasure E))) =
      Real.exp (-(∫ x, Real.log (1+g x) ∂U)) := by
  letI : IsFiniteMeasure U := hD.isFiniteMeasure
  have hC : 0 ≤ C := by
    obtain ⟨x, _⟩ := nonempty_of_measure_ne_zero hD.base_ne_zero
    exact (hg₀ x).trans (hgC x)
  let f : ℕ → SimpleFunc E ℝ := SimpleFunc.approxOn g hg (Icc 0 C) 0 ⟨le_rfl, hC⟩
  have hf (n : ℕ) (x : E) : f n x ∈ Icc 0 C := SimpleFunc.approxOn_mem hg _ n x
  have hfm (n : ℕ) : Measurable (f n) := (f n).measurable
  have hlim (x : E) : Tendsto (fun n => f n x) atTop (𝓝 (g x)) :=
    SimpleFunc.tendsto_approxOn hg _ (subset_closure ⟨hg₀ x, hgC x⟩)
  have hmean (P : ProbabilityMeasure E) :
      Tendsto (fun n => ∫ x, f n x ∂(P : Measure E)) atTop (𝓝 (∫ x, g x ∂(P : Measure E))) := by
    apply tendsto_integral_of_dominated_convergence (fun _ => C)
      (fun n => (hfm n).aestronglyMeasurable) (integrable_const _)
    · intro n
      exact Eventually.of_forall fun x => by
        simpa [Real.norm_eq_abs, abs_of_nonneg (hf n x).1] using (hf n x).2
    · exact Eventually.of_forall hlim
  have hleft : Tendsto
      (fun n => ∫ P, (1+∫ x, f n x ∂(P : Measure E))^(-B)
        ∂(D : Measure (ProbabilityMeasure E))) atTop
      (𝓝 (∫ P, (1+∫ x, g x ∂(P : Measure E))^(-B)
        ∂(D : Measure (ProbabilityMeasure E)))) := by
    apply tendsto_integral_of_dominated_convergence (fun _ => (1 : ℝ))
      (fun n => (measurable_mean_rpow (hfm n) B).aestronglyMeasurable) (integrable_const _)
    · intro n
      exact Eventually.of_forall fun P => norm_mean_rpow_le_one P (fun x => (hf n x).1) hB.le
    · apply Eventually.of_forall
      intro P
      have hp : 0 < 1+∫ x, g x ∂(P : Measure E) := by
        have : 0 ≤ ∫ x, g x ∂(P : Measure E) := integral_nonneg hg₀
        linarith
      exact (Real.continuousAt_rpow_const _ (-B) (Or.inl hp.ne')).tendsto.comp
        (tendsto_const_nhds.add (hmean P))
  have hlog : Tendsto (fun n => ∫ x, Real.log (1+f n x) ∂U) atTop
      (𝓝 (∫ x, Real.log (1+g x) ∂U)) := by
    apply tendsto_integral_of_dominated_convergence (fun _ => Real.log (1+C))
      (fun n => ((measurable_const.add (hfm n)).log).aestronglyMeasurable) (integrable_const _)
    · intro n
      exact Eventually.of_forall fun x => norm_log_one_add_le (hf n x).1 (hf n x).2
    · apply Eventually.of_forall
      intro x
      exact (Real.continuousAt_log (by linarith [hg₀ x] : 1+g x ≠ 0)).tendsto.comp
        (tendsto_const_nhds.add (hlim x))
  have hright := Real.continuous_exp.continuousAt.tendsto.comp hlog.neg
  apply tendsto_nhds_unique hleft
  convert hright using 1
  funext n
  exact markov_krein_simple U D hD B hB hMass (f n) (fun x => (hf n x).1)

end GGC.RandomMeasure
