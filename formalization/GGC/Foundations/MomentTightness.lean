import Mathlib.MeasureTheory.Measure.Prokhorov
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Tactic

/-! # Tightness from a uniform real second moment

This adapter uses mathlib's Markov inequality and the compact-complement
characterization of tightness. Probability measures are the actual family.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped ENNReal
namespace GGC.Analysis

theorem isTightMeasureSet_of_secondMoment_bound {S : Set (ProbabilityMeasure ℝ)} {C : ℝ}
    (hC : 0 ≤ C) (hi : ∀ μ ∈ S, Integrable (fun x : ℝ => x^2) (μ : Measure ℝ))
    (hb : ∀ μ ∈ S, (∫ x : ℝ, x^2 ∂(μ : Measure ℝ)) ≤ C) :
    IsTightMeasureSet {((μ : ProbabilityMeasure ℝ) : Measure ℝ) | μ ∈ S} := by
  rw [isTightMeasureSet_iff_exists_isCompact_measure_compl_le]
  intro ε hε
  by_cases htop : ε = ∞
  · subst ε
    exact ⟨∅, isCompact_empty, fun _ _ => le_top⟩
  have hδ : 0 < ε.toReal := ENNReal.toReal_pos (ne_of_gt hε) htop
  let R : ℝ := Real.sqrt (C / ε.toReal) + 1
  have hR : 0 < R := by dsimp [R]; linarith [Real.sqrt_nonneg (C / ε.toReal)]
  have hCR : C ≤ R^2 * ε.toReal := by
    apply (div_le_iff₀ hδ).mp
    have hs := Real.sq_sqrt (div_nonneg hC hδ.le)
    dsimp [R]
    nlinarith [Real.sqrt_nonneg (C / ε.toReal)]
  refine ⟨Icc (-R) R, isCompact_Icc, ?_⟩
  rintro _ ⟨μ, hμ, rfl⟩
  have htail : (μ : Measure ℝ).real (Icc (-R) R)ᶜ ≤
      (μ : Measure ℝ).real {x : ℝ | R^2 ≤ x^2} := by
    refine measureReal_mono ?_ (measure_ne_top _ _)
    intro x hx
    simp only [mem_compl_iff, mem_Icc, not_and_or, not_le] at hx
    change R^2 ≤ x^2
    rcases hx with hx | hx <;> nlinarith
  have hm := mul_meas_ge_le_integral_of_nonneg
    (μ := (μ : Measure ℝ)) (Eventually.of_forall (fun x : ℝ => sq_nonneg x)) (hi μ hμ) (R^2)
  have ht : (μ : Measure ℝ).real (Icc (-R) R)ᶜ ≤ ε.toReal := by
    apply le_of_mul_le_mul_left (a := R^2) _ (sq_pos_of_pos hR)
    exact (mul_le_mul_of_nonneg_left htail (sq_nonneg R)).trans
      (hm.trans ((hb μ hμ).trans hCR))
  exact (ENNReal.toReal_le_toReal (measure_ne_top _ _) htop).mp ht

end GGC.Analysis
