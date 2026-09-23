import GGC.LogRate.DriftBounds
import GGC.LogRate.JumpCalculus

/-! # Generator formulas with an explicit input phase

This is the actual posterior averaging construction for a supplied phase and
law D. It does not assert that D is a Dirichlet law or that the input phase is
the canonical Stieltjes phase. Those identifications remain separate M2 work.
-/

noncomputable section
open MeasureTheory

namespace GGC.LogRate

def phaseAcceptance (ξ : ProbabilityMeasure PosReal × ℝ → ℝ)
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal) (y v : ℝ) : ℝ :=
  ∫ P, ξ (P, Real.exp (y + v))
    ∂(posteriorMixtureLaw D B ⟨Real.exp y, Real.exp_pos y⟩ : Measure (ProbabilityMeasure PosReal))

theorem phaseAcceptance_jointlyMeasurable {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) :
    Measurable (fun x : ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × ℝ × ℝ =>
      phaseAcceptance ξ x.1 x.2.1 x.2.2.1 x.2.2.2) := by
  have hp : Measurable (fun x : ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × ℝ × ℝ =>
      (x.1, x.2.1, (⟨Real.exp x.2.2.1, Real.exp_pos _⟩ : PosReal))) := by fun_prop
  have hR := posteriorMixtureLaw_jointlyMeasurable.comp hp
  have hq : Measurable (fun x : (ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × ℝ × ℝ) ×
      ProbabilityMeasure PosReal => (x.2, Real.exp (x.1.2.2.1 + x.1.2.2.2))) := by fun_prop
  exact RandomMeasure.measurable_probability_integral hR
    (f := fun x P => ξ (P, Real.exp (x.2.2.1 + x.2.2.2))) (hξ.comp hq)

theorem measurable_phaseAcceptance {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal) (y : ℝ) :
    Measurable (phaseAcceptance ξ D B y) := by
  have hm : Measurable (fun x : ℝ × ProbabilityMeasure PosReal => ξ (x.2, Real.exp (y + x.1))) :=
    hξ.comp (measurable_snd.prodMk (measurable_const.add measurable_fst).exp)
  exact hm.stronglyMeasurable.integral_prod_right'.measurable

theorem phaseAcceptance_bounds {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) (h₀ : ∀ P t, 0 ≤ ξ (P,t)) (h₁ : ∀ P t, ξ (P,t) ≤ 1)
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal) (y v : ℝ) :
    0 ≤ phaseAcceptance ξ D B y v ∧ phaseAcceptance ξ D B y v ≤ 1 := by
  have hi : Integrable (fun P => ξ (P, Real.exp (y + v)))
      (posteriorMixtureLaw D B ⟨Real.exp y, Real.exp_pos y⟩ : Measure (ProbabilityMeasure PosReal)) := by
    apply (integrable_const (1 : ℝ)).mono'
      (hξ.comp (measurable_id.prodMk measurable_const)).aestronglyMeasurable
    exact Filter.Eventually.of_forall fun P => by
      change ‖ξ (P, Real.exp (y + v))‖ ≤ 1
      rw [Real.norm_eq_abs, abs_of_nonneg (h₀ P _)]
      exact h₁ P _
  refine ⟨integral_nonneg (fun P => h₀ P _), ?_⟩
  simpa [phaseAcceptance] using! integral_mono hi (integrable_const (1 : ℝ)) (fun P => h₁ P _)

def phaseGenerator (ξ : ProbabilityMeasure PosReal × ℝ → ℝ)
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal) (φ : ℝ → ℝ) (y : ℝ) : ℝ :=
  phaseDrift ξ D B y * deriv φ y + compensatedJump (phaseAcceptance ξ D B y) φ y

theorem phaseGenerator_jointlyMeasurable {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) :
    Measurable (fun x : ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × ℝ =>
      phaseGenerator ξ x.1 x.2.1 φ x.2.2) := by
  have hd : Measurable (deriv φ) := (hφ.continuous_deriv (by norm_num)).measurable
  have hp : Measurable (fun x : (ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × ℝ) × ℝ =>
      (x.1.1, x.1.2.1, x.1.2.2, x.2)) := by fun_prop
  have hy : Measurable (fun x : (ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × ℝ) × ℝ =>
      x.1.2.2) := by fun_prop
  have ht : Measurable (fun x : (ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × ℝ) × ℝ =>
      taylorRemainder φ x.1.2.2 x.2) :=
    ((hφ.continuous.measurable.comp (hy.add measurable_snd)).sub
      (hφ.continuous.measurable.comp hy)).sub (measurable_snd.mul (hd.comp hy))
  have hj := (ht.mul ((phaseAcceptance_jointlyMeasurable hξ).comp hp)).stronglyMeasurable
    |>.integral_prod_right' (ν := jumpMeasure) |>.measurable
  exact ((phaseDrift_jointlyMeasurable hξ).mul
    (hd.comp (measurable_snd.comp measurable_snd))).add hj

theorem integrable_phaseGenerator_jumps {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) (h₀ : ∀ P t, 0 ≤ ξ (P,t)) (h₁ : ∀ P t, ξ (P,t) ≤ 1)
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) (y : ℝ) :
    Integrable (fun v => taylorRemainder φ y v * phaseAcceptance ξ D B y v) jumpMeasure :=
  integrable_compensatedJump (measurable_phaseAcceptance hξ D B y)
    (fun v => (phaseAcceptance_bounds hξ h₀ h₁ D B y v).1)
    (fun v => (phaseAcceptance_bounds hξ h₀ h₁ D B y v).2) hφ hC y

theorem phaseGenerator_nonneg_at_min {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) (h₀ : ∀ P t, 0 ≤ ξ (P,t)) (h₁ : ∀ P t, ξ (P,t) ≤ 1)
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal)
    {φ : ℝ → ℝ} {y : ℝ} (hmin : ∀ x, φ y ≤ φ x) :
    0 ≤ phaseGenerator ξ D B φ y := by
  have hd : deriv φ y = 0 := (show IsLocalMin φ y from Filter.Eventually.of_forall hmin).deriv_eq_zero
  simpa [phaseGenerator, hd] using compensatedJump_nonneg_at_min
    (fun v => (phaseAcceptance_bounds hξ h₀ h₁ D B y v).1) hmin

theorem phaseGenerator_sq_le {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) (h₀ : ∀ P t, 0 ≤ ξ (P,t)) (h₁ : ∀ P t, ξ (P,t) ≤ 1)
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal) (y : ℝ) :
    phaseGenerator ξ D B (fun x => x^2) y ≤ 3*y^2 + (driftBound B.val)^2 + jumpSecondMoment := by
  have hj := compensatedJump_sq_le
    (fun v => (phaseAcceptance_bounds hξ h₀ h₁ D B y v).1)
    (fun v => (phaseAcceptance_bounds hξ h₀ h₁ D B y v).2) y
  have hd := abs_phaseDrift_sub_le hξ h₀ h₁ D B y
  have hs : (phaseDrift ξ D B y - y)^2 ≤ (driftBound B.val)^2 := by
    simpa only [sq_abs] using!
      (sq_le_sq₀ (abs_nonneg _) (driftBound_nonneg B.val)).2 hd
  have hderiv : deriv (fun x : ℝ => x^2) y = 2*y := by simp
  unfold phaseGenerator
  rw [hderiv]
  nlinarith [sq_nonneg (phaseDrift ξ D B y - 2*y)]

end GGC.LogRate
