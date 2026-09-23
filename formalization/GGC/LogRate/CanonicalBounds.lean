import GGC.LogRate.CanonicalGenerator
import Mathlib.Analysis.Calculus.Deriv.Support

/-! # Compact-test bounds without rate or log-rate moments

These estimates are uniform over every sampling law D and state y, with B in
an arbitrary compact positive interval. Consequently the generator of a
compactly supported C² test is integrable against every probability F.
-/

noncomputable section
open MeasureTheory Set

namespace GGC.LogRate

theorem canonicalGenerator_compactTest_bound {φ : ℝ → ℝ}
    (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) {a b : ℝ} (ha : 0 < a) :
    ∃ C : ℝ, ∀ (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal),
      B.val ∈ Icc a b → ∀ y, |canonicalGenerator D B φ y| ≤ C := by
  have hd : Continuous (deriv φ) := hφ.continuous_deriv (by norm_num)
  have hd₂ : Continuous (deriv (deriv φ)) :=
    (hφ.deriv' : ContDiff ℝ 1 (deriv φ)).continuous_deriv (by norm_num)
  obtain ⟨C₁, hC₁⟩ := hs.deriv.exists_bound_of_continuous hd
  obtain ⟨C₂, hC₂⟩ := hs.deriv.deriv.exists_bound_of_continuous hd₂
  have hys : HasCompactSupport (fun y : ℝ => y * deriv φ y) := hs.deriv.mul_left
  obtain ⟨Cy, hCy⟩ := hys.exists_bound_of_continuous (continuous_id.mul hd)
  obtain ⟨Cd, hCd⟩ := driftBound_boundedOn_Icc (b := b) ha
  refine ⟨Cy + |Cd| * C₁ + C₂ / 2 * jumpSecondMoment, ?_⟩
  intro D B hB y
  have hoff := abs_phaseDrift_sub_le phase_jointlyMeasurable
    (fun P t => (stieltjesPhase_bounds P t).1) (fun P t => (stieltjesPhase_bounds P t).2) D B y
  have hdc : |canonicalDrift D B y - y| ≤ |Cd| :=
    hoff.trans ((hCd B.val hB).trans (le_abs_self Cd))
  have hfirst : |canonicalDrift D B y * deriv φ y| ≤ Cy + |Cd| * C₁ := by
    calc _ = |y * deriv φ y + (canonicalDrift D B y - y) * deriv φ y| := by congr 1; ring
      _ ≤ |y * deriv φ y| + |canonicalDrift D B y - y| * |deriv φ y| := by
        simpa only [abs_mul] using abs_add_le (y * deriv φ y) ((canonicalDrift D B y - y) * deriv φ y)
      _ ≤ Cy + |Cd| * C₁ := add_le_add (by simpa only [Real.norm_eq_abs] using hCy y)
        (mul_le_mul hdc (by simpa only [Real.norm_eq_abs] using hC₁ y)
          (abs_nonneg _) (abs_nonneg _))
  have hj := abs_compensatedJump_le
    (fun v => (canonicalAcceptance_bounds D B y v).1)
    (fun v => (canonicalAcceptance_bounds D B y v).2) hφ
    (fun x => by simpa only [Real.norm_eq_abs] using hC₂ x) y
  exact (abs_add_le _ _).trans (add_le_add hfirst hj)

theorem integrable_canonicalGenerator_compactTest
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal)
    (F : ProbabilityMeasure ℝ) {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ)
    (hs : HasCompactSupport φ) : Integrable (canonicalGenerator D B φ) (F : Measure ℝ) := by
  obtain ⟨C, hC⟩ := canonicalGenerator_compactTest_bound hφ hs (a := B.val) (b := B.val) B.property
  have hp : Measurable (fun y : ℝ => (D, B, y)) := by fun_prop
  have hm := (canonicalGenerator_jointlyMeasurable hφ).comp hp
  simp only [Function.comp_def] at hm
  apply (integrable_const C).mono' hm.aestronglyMeasurable
  exact Filter.Eventually.of_forall fun y => by
    simpa only [Real.norm_eq_abs] using hC D B ⟨le_rfl, le_rfl⟩ y

end GGC.LogRate
