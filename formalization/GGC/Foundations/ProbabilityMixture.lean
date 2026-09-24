import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Tactic

/-! # Convex mixtures of actual probability measures -/

noncomputable section
open MeasureTheory Set
open scoped ENNReal
namespace GGC.Analysis

variable {X : Type*} [MeasurableSpace X]

def probabilityMixture (θ : Icc (0 : ℝ) 1) (F G : ProbabilityMeasure X) : ProbabilityMeasure X :=
  ⟨ENNReal.ofReal (1-θ.val) • (F : Measure X) + ENNReal.ofReal θ.val • (G : Measure X), ⟨by
    simp only [Measure.add_apply, Measure.smul_apply, measure_univ, smul_eq_mul, mul_one]
    rw [← ENNReal.ofReal_add (sub_nonneg.mpr θ.property.2) θ.property.1]
    simp⟩⟩

theorem probabilityMixture_toMeasure (θ : Icc (0 : ℝ) 1) (F G : ProbabilityMeasure X) :
    (probabilityMixture θ F G : Measure X) =
      ENNReal.ofReal (1-θ.val) • (F : Measure X) + ENNReal.ofReal θ.val • (G : Measure X) := rfl

@[simp] theorem probabilityMixture_zero (F G : ProbabilityMeasure X) :
    probabilityMixture ⟨0, by simp⟩ F G = F := by
  apply ProbabilityMeasure.toMeasure_injective
  simp [probabilityMixture_toMeasure]

@[simp] theorem probabilityMixture_one (F G : ProbabilityMeasure X) :
    probabilityMixture ⟨1, by simp⟩ F G = G := by
  apply ProbabilityMeasure.toMeasure_injective
  simp [probabilityMixture_toMeasure]

theorem integrable_probabilityMixture (θ : Icc (0 : ℝ) 1) {F G : ProbabilityMeasure X}
    {f : X → ℝ} (hF : Integrable f (F : Measure X)) (hG : Integrable f (G : Measure X)) :
    Integrable f (probabilityMixture θ F G : Measure X) := by
  rw [probabilityMixture_toMeasure]
  exact (hF.smul_measure ENNReal.ofReal_ne_top).add_measure (hG.smul_measure ENNReal.ofReal_ne_top)

theorem integral_probabilityMixture (θ : Icc (0 : ℝ) 1) {F G : ProbabilityMeasure X}
    {f : X → ℝ} (hF : Integrable f (F : Measure X)) (hG : Integrable f (G : Measure X)) :
    (∫ x, f x ∂(probabilityMixture θ F G : Measure X)) =
      (1-θ.val)*(∫ x, f x ∂(F : Measure X)) + θ.val*(∫ x, f x ∂(G : Measure X)) := by
  rw [probabilityMixture_toMeasure, integral_add_measure
    (hF.smul_measure ENNReal.ofReal_ne_top) (hG.smul_measure ENNReal.ofReal_ne_top)]
  simp only [integral_smul_measure, smul_eq_mul,
    ENNReal.toReal_ofReal (sub_nonneg.mpr θ.property.2), ENNReal.toReal_ofReal θ.property.1]

theorem integral_probabilityMixture_le (θ : Icc (0 : ℝ) 1) {F G : ProbabilityMeasure X}
    {f : X → ℝ} (hF : Integrable f (F : Measure X)) (hG : Integrable f (G : Measure X))
    {C : ℝ} (hFC : (∫ x, f x ∂(F : Measure X)) ≤ C) (hGC : (∫ x, f x ∂(G : Measure X)) ≤ C) :
    (∫ x, f x ∂(probabilityMixture θ F G : Measure X)) ≤ C := by
  rw [integral_probabilityMixture θ hF hG]
  have h₁ := mul_le_mul_of_nonneg_left hFC (sub_nonneg.mpr θ.property.2)
  have h₂ := mul_le_mul_of_nonneg_left hGC θ.property.1
  nlinarith

end GGC.Analysis
