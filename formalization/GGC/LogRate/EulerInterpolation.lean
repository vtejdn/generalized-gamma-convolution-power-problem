import GGC.LogRate.EulerWeakEstimates
import GGC.Foundations.ProbabilityMixture
import GGC.Foundations.LinearInterpolation
import GGC.Foundations.CompactSmoothTests
import GGC.Foundations.MomentTightness

/-! # Actual continuous Euler law interpolations on a finite horizon

The interpolation is a convex mixture of neighboring Euler laws. Its second
moment bound is uniform in time and step size. Compact C² tests give uniform
Lipschitz estimates, and their compact-family embedding gives narrow continuity.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology NNReal
namespace GGC.LogRate
open GGC.Analysis

def eulerInterpolation (h : EulerStep) (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (t : ℝ≥0) : ProbabilityMeasure ℝ :=
  probabilityMixture
    ⟨meshFraction h.val t.val, (meshFraction_mem_Ico h.property.1 t.property).1,
      (meshFraction_mem_Ico h.property.1 t.property).2.le⟩
    (eulerIterate h (eulerMass h B₀) F₀ (meshIndex h.val t.val))
    (eulerIterate h (eulerMass h B₀) F₀ (meshIndex h.val t.val+1))

@[simp] theorem eulerInterpolation_zero (h : EulerStep) (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ) :
    eulerInterpolation h B₀ F₀ 0 = F₀ := by
  apply ProbabilityMeasure.toMeasure_injective
  simp [eulerInterpolation, probabilityMixture_toMeasure, meshIndex, meshFraction]

@[simp] theorem eulerInterpolation_mesh (h : EulerStep) (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (n : ℕ) :
    eulerInterpolation h B₀ F₀ ⟨(n : ℝ)*h.val, mul_nonneg (Nat.cast_nonneg n) h.property.1.le⟩ =
      eulerIterate h (eulerMass h B₀) F₀ n := by
  apply ProbabilityMeasure.toMeasure_injective
  simp [eulerInterpolation, probabilityMixture_toMeasure, meshIndex, meshFraction, ne_of_gt h.property.1]

theorem integral_eulerInterpolation (h : EulerStep) (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (t : ℝ≥0) {φ : ℝ → ℝ}
    (hφ : ∀ n, Integrable φ (eulerIterate h (eulerMass h B₀) F₀ n : Measure ℝ)) :
    (∫ y, φ y ∂(eulerInterpolation h B₀ F₀ t : Measure ℝ)) =
      linearInterpolate h.val (fun n => ∫ y, φ y ∂(eulerIterate h (eulerMass h B₀) F₀ n : Measure ℝ)) t.val := by
  exact integral_probabilityMixture _ (hφ _) (hφ _)

theorem integrable_sq_eulerInterpolation (h : EulerStep) (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (t : ℝ≥0) :
    Integrable (fun y : ℝ => y^2) (eulerInterpolation h B₀ F₀ t : Measure ℝ) :=
  integrable_probabilityMixture _
    (integrable_sq_eulerIterate h (eulerMass h B₀) F₀ hF _)
    (integrable_sq_eulerIterate h (eulerMass h B₀) F₀ hF _)

theorem eulerInterpolation_uniform_secondMoment (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (h : EulerStep) (t : ℝ≥0), t.val ≤ T →
      (∫ y : ℝ, y^2 ∂(eulerInterpolation h B₀ F₀ t : Measure ℝ)) ≤ C := by
  obtain ⟨C, hC, hb⟩ := eulerIterate_uniform_secondMoment B₀ F₀ hF (T+1)
  refine ⟨C, hC, ?_⟩
  intro h t ht
  have hn := (meshIndex_time_le h.property.1 t.property).trans ht
  have hn' : ((meshIndex h.val t.val+1 : ℕ) : ℝ)*h.val ≤ T+1 := by
    push_cast
    nlinarith [h.property.2]
  apply integral_probabilityMixture_le _
    (integrable_sq_eulerIterate h (eulerMass h B₀) F₀ hF _)
    (integrable_sq_eulerIterate h (eulerMass h B₀) F₀ hF _)
  · exact hb h _ (by linarith)
  · exact hb h _ hn'

def eulerInterpolatedLawsUpTo (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ) (T : ℝ) :
    Set (ProbabilityMeasure ℝ) :=
  {F | ∃ (h : EulerStep) (t : ℝ≥0), t.val ≤ T ∧ F = eulerInterpolation h B₀ F₀ t}

theorem isTightMeasureSet_eulerInterpolatedLawsUpTo (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ) :
    IsTightMeasureSet {((F : ProbabilityMeasure ℝ) : Measure ℝ) | F ∈ eulerInterpolatedLawsUpTo B₀ F₀ T} := by
  obtain ⟨C, hC, hb⟩ := eulerInterpolation_uniform_secondMoment B₀ F₀ hF T
  apply Analysis.isTightMeasureSet_of_secondMoment_bound hC
  · rintro F ⟨h, t, _, rfl⟩
    exact integrable_sq_eulerInterpolation h B₀ F₀ hF t
  · rintro F ⟨h, t, ht, rfl⟩
    exact hb h t ht

theorem isCompact_closure_eulerInterpolatedLawsUpTo (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ) :
    IsCompact (closure (eulerInterpolatedLawsUpTo B₀ F₀ T)) :=
  isCompact_closure_of_isTightMeasureSet (isTightMeasureSet_eulerInterpolatedLawsUpTo B₀ F₀ hF T)

/-- The mesh bound gives a uniform Lipschitz estimate at all ordered times. -/
theorem eulerInterpolation_uniform_testTime (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) :
    ∃ L : ℝ, 0 ≤ L ∧ ∀ (h : EulerStep) (s t : ℝ≥0), s ≤ t → t.val ≤ T →
      |(∫ y, φ y ∂(eulerInterpolation h B₀ F₀ t : Measure ℝ)) -
        (∫ y, φ y ∂(eulerInterpolation h B₀ F₀ s : Measure ℝ))| ≤ (t.val-s.val)*L := by
  obtain ⟨L, hL, hb⟩ := eulerIterate_uniform_testTime B₀ F₀ hF (T+1) hφ hs
  refine ⟨L, hL, ?_⟩
  intro h s t hst ht
  have hi n : Integrable φ (eulerIterate h (eulerMass h B₀) F₀ n : Measure ℝ) :=
    hφ.continuous.integrable_of_hasCompactSupport hs
  rw [integral_eulerInterpolation h B₀ F₀ t hi, integral_eulerInterpolation h B₀ F₀ s hi]
  apply abs_linearInterpolate_sub_le h.property.1 s.property hst
  intro i j hij hj
  apply hb h i j hij
  have ht' := meshIndex_time_le h.property.1 t.property
  have hj' : (j : ℝ) ≤ (meshIndex h.val t.val : ℝ)+1 := by exact_mod_cast hj
  have hb' := mul_le_mul_of_nonneg_right hj' h.property.1.le
  nlinarith [h.property.2]

def eulerCurve (h : EulerStep) (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ) (T : ℝ)
    (t : Icc (0 : ℝ) T) : ProbabilityMeasure ℝ :=
  eulerInterpolation h B₀ F₀ ⟨t.val, t.property.1⟩

theorem lipschitzWith_eulerCurve_test (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) :
    ∃ L : ℝ≥0, ∀ h : EulerStep,
      LipschitzWith L (fun t : Icc (0 : ℝ) T => ∫ y, φ y ∂(eulerCurve h B₀ F₀ T t : Measure ℝ)) := by
  obtain ⟨L, hL, hb⟩ := eulerInterpolation_uniform_testTime B₀ F₀ hF T hφ hs
  refine ⟨(⟨L, hL⟩ : ℝ≥0), fun h => ?_⟩
  apply LipschitzWith.of_dist_le_mul
  intro s t
  change |(∫ y, φ y ∂(eulerCurve h B₀ F₀ T s : Measure ℝ)) -
    (∫ y, φ y ∂(eulerCurve h B₀ F₀ T t : Measure ℝ))| ≤ L*|s.val-t.val|
  rcases le_total s.val t.val with hst | hts
  · have he := hb h ⟨s.val,s.property.1⟩ ⟨t.val,t.property.1⟩ hst t.property.2
    rw [abs_sub_comm s.val t.val, abs_of_nonneg (sub_nonneg.mpr hst)]
    rw [abs_sub_comm] at he
    simpa only [eulerCurve, mul_comm] using! he
  · have he := hb h ⟨t.val,t.property.1⟩ ⟨s.val,s.property.1⟩ hts s.property.2
    rw [abs_of_nonneg (sub_nonneg.mpr hts)]
    simpa only [eulerCurve, mul_comm] using! he

theorem continuous_eulerCurve (h : EulerStep) (B₀ : PosReal) (F₀ : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F₀ : Measure ℝ)) (T : ℝ) :
    Continuous (eulerCurve h B₀ F₀ T) := by
  let K := closure (eulerInterpolatedLawsUpTo B₀ F₀ T)
  have hK : IsCompact K := isCompact_closure_eulerInterpolatedLawsUpTo B₀ F₀ hF T
  have hm (t : Icc (0 : ℝ) T) : eulerCurve h B₀ F₀ T t ∈ K :=
    subset_closure ⟨h, ⟨t.val,t.property.1⟩, t.property.2, rfl⟩
  let f : Icc (0 : ℝ) T → K := fun t => ⟨eulerCurve h B₀ F₀ T t, hm t⟩
  have hc : Continuous f := by
    apply (isClosedEmbedding_compactC2Integrals hK).isEmbedding.isInducing.continuous_iff.mpr
    apply continuous_pi
    intro φ
    obtain ⟨L, hL⟩ := lipschitzWith_eulerCurve_test B₀ F₀ hF T φ.property.1 φ.property.2
    exact (hL h).continuous
  exact continuous_subtype_val.comp hc

end GGC.LogRate
