import GGC.LogRate.EulerIteration
import GGC.Foundations.MomentTightness

/-! # Uniform tightness of all Euler mesh laws on a finite horizon -/

noncomputable section
open MeasureTheory Set
namespace GGC.LogRate

def eulerLawsUpTo (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ) (T : ℝ) : Set (ProbabilityMeasure ℝ) :=
  {F | ∃ (h : EulerStep) (n : ℕ), (n : ℝ)*h.val ≤ T ∧ F = eulerIterate h (eulerMass h B₀) F₀ n}

theorem isTightMeasureSet_eulerLawsUpTo (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ) :
    IsTightMeasureSet {((F : ProbabilityMeasure ℝ) : Measure ℝ) | F ∈ eulerLawsUpTo B₀ F₀ T} := by
  obtain ⟨C, hC, hb⟩ := eulerIterate_uniform_secondMoment B₀ F₀ hF T
  apply Analysis.isTightMeasureSet_of_secondMoment_bound hC
  · rintro F ⟨h, n, _, rfl⟩
    exact integrable_sq_eulerIterate h (eulerMass h B₀) F₀ hF n
  · rintro F ⟨h, n, hn, rfl⟩
    exact hb h n hn

theorem isCompact_closure_eulerLawsUpTo (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ) :
    IsCompact (closure (eulerLawsUpTo B₀ F₀ T)) :=
  isCompact_closure_of_isTightMeasureSet (isTightMeasureSet_eulerLawsUpTo B₀ F₀ hF T)

end GGC.LogRate
