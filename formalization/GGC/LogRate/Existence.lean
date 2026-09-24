import GGC.LogRate.EulerWeakEquation

/-! # Finite-time existence for the specified nonlinear log-rate generator

The law curve is extended constantly outside the prescribed time interval.
All evolution claims are on that interval. The existence theorem constructs
an inhabitant from the actual Euler kernels; it assumes no existence axiom.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.LogRate

/-- Precisely the finite-horizon output consumed by dynamic identification.
The mass schedule in the equation is the actual `B₀ * exp (-t)`. -/
structure WeakLogRateSolution (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ) (T : ℝ) where
  law : C(ℝ, ProbabilityMeasure ℝ)
  initial : law 0 = F₀
  moment_bound : ∃ C : ℝ, 0 ≤ C ∧ ∀ t ∈ Icc 0 T,
    Integrable (fun y : ℝ => y^2) (law t : Measure ℝ) ∧
      (∫ y : ℝ, y^2 ∂(law t : Measure ℝ)) ≤ C
  weakEquation : ∀ (φ : ℝ → ℝ), ContDiff ℝ 2 φ → HasCompactSupport φ → ∀ t ∈ Icc 0 T,
    (∫ y, φ y ∂(law t : Measure ℝ)) - (∫ y, φ y ∂(F₀ : Measure ℝ)) =
      ∫ r in 0..t, averagedGenerator (massAt B₀ r) (law r) φ

/-- Every probability initial state with finite second moment has an actual
narrowly continuous solution on every positive finite time interval. -/
theorem exists_weakLogRateSolution (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ) (hT : 0 < T) :
    Nonempty (WeakLogRateSolution B₀ F₀ T) := by
  obtain ⟨g, s, hs, hg⟩ := exists_eulerCurve_subsequence B₀ F₀ hF T (eulerStepSequence ⟨T,hT⟩)
  have hh : Tendsto (fun n => (eulerStepSequence ⟨T,hT⟩ (s n)).val) atTop (𝓝 0) :=
    (eulerStepSequence_tendsto_zero ⟨T,hT⟩).comp hs.tendsto_atTop
  refine ⟨{ law := extendEulerCurve hT.le g, initial := ?_, moment_bound := ?_, weakEquation := ?_ }⟩
  · rw [extendEulerCurve_on_interval hT.le g (⟨0, le_rfl, hT.le⟩ : Icc (0 : ℝ) T)]
    exact eulerCurve_limit_initial B₀ F₀ hF hT.le hg
  · obtain ⟨C, hC, hc⟩ := eulerCurve_limit_secondMoment B₀ F₀ hF T hg
    refine ⟨C, hC, fun t ht => ?_⟩
    rw [extendEulerCurve_on_interval hT.le g (⟨t,ht⟩ : Icc (0 : ℝ) T)]
    exact hc ⟨t,ht⟩
  · intro φ hφ hc t ht
    exact eulerCurve_limit_weakEquation B₀ F₀ hF hT.le hh hg hφ hc ht

end GGC.LogRate
