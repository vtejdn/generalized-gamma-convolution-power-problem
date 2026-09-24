import GGC.Identification.ValueLaw
import GGC.Foundations.GrowthContinuity

/-! # Continuity of the actual value transforms along a weak log-rate solution -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Identification
open GGC.Analysis GGC.LogRate

theorem logTest_linearGrowth {s : ℝ} (hs : 0 ≤ s) :
    ∀ y, |logTest s y| ≤ (Real.log (1+s)+1)*(1+|y|) := by
  intro y
  rw [abs_of_nonneg (logTest_nonneg hs y)]
  have hl : 0 ≤ Real.log (1+s) := Real.log_nonneg (by linarith)
  have hb := (logTest_le hs y).trans (add_le_add le_rfl (max_le (neg_le_abs y) (abs_nonneg y)))
  nlinarith [mul_nonneg hl (abs_nonneg y)]

theorem continuous_logTest_integral {X : Type*} [TopologicalSpace X] [SequentialSpace X]
    (F : X → ProbabilityMeasure ℝ) (hc : Continuous F)
    (hi : ∀ x, Integrable (fun y : ℝ => y^2) (F x : Measure ℝ))
    {K : ℝ} (hK : 0 ≤ K) (hb : ∀ x, (∫ y : ℝ, y^2 ∂(F x : Measure ℝ)) ≤ K)
    {s : ℝ} (hs : 0 ≤ s) : Continuous (fun x => ∫ y, logTest s y ∂(F x : Measure ℝ)) :=
  continuous_integral_of_uniform_secondMoment F hc hi hK hb (continuous_logTest hs)
    (by linarith [Real.log_nonneg (show 1 ≤ 1+s by linarith)]) (logTest_linearGrowth hs)

namespace WeakLogRateSolution

theorem continuous_logTest_integral {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) {s : ℝ} (hs : 0 ≤ s) :
    Continuous (fun t : Icc (0 : ℝ) T => ∫ y, logTest s y ∂(w.law t.val : Measure ℝ)) := by
  obtain ⟨K, hK, hk⟩ := w.moment_bound
  exact Identification.continuous_logTest_integral (fun t : Icc (0 : ℝ) T => w.law t.val)
    (w.law.continuous.comp continuous_subtype_val) (fun t => (hk t.val t.property).1)
    hK (fun t => (hk t.val t.property).2) hs

theorem continuous_laplace {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) {s : ℝ} (hs : 0 < s) :
    Continuous (fun t : Icc (0 : ℝ) T => laplace (value w t) s) := by
  have he : (fun t : Icc (0 : ℝ) T => laplace (value w t) s) =
      fun t => Real.exp (-(massAt B₀ t.val).val*∫ y, logTest s y ∂(w.law t.val : Measure ℝ)) := by
    funext t
    exact laplace_valueLaw _ _ _ hs
  rw [he]
  exact Real.continuous_exp.comp
    ((continuous_subtype_val.comp ((continuous_massAt B₀).comp continuous_subtype_val)).neg.mul
      (continuous_logTest_integral w hs.le))

end WeakLogRateSolution
end GGC.Identification
