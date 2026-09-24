import GGC.RateRealization
import GGC.LogRate.CanonicalBounds

/-! # The specified generator for mass and log-rate law

The Dirichlet law is the jointly measurable common-space realization, not an
unsupplied parameter. These adapters expose Blueprint B's actual coefficients.
-/

noncomputable section
open MeasureTheory Set
namespace GGC.LogRate

def baseMeasure (B : PosReal) (F : ProbabilityMeasure ℝ) : Measure PosReal :=
  ENNReal.ofReal B.val • (rateLaw F : Measure PosReal)

instance baseMeasure_isFinite (B : PosReal) (F : ProbabilityMeasure ℝ) :
    IsFiniteMeasure (baseMeasure B F) := ⟨by simp [baseMeasure]⟩

theorem baseMeasure_mass (B : PosReal) (F : ProbabilityMeasure ℝ) :
    baseMeasure B F univ = ENNReal.ofReal B.val := by simp [baseMeasure]

theorem normalized_baseMeasure (B : PosReal) (F : ProbabilityMeasure ℝ) :
    ENNReal.ofReal (1/B.val) • baseMeasure B F = (rateLaw F : Measure PosReal) := by
  rw [baseMeasure, smul_smul, ← ENNReal.ofReal_mul (one_div_pos.mpr B.property).le]
  simp [ne_of_gt B.property]

theorem baseMeasure_isDirichlet (B : PosReal) (F : ProbabilityMeasure ℝ) :
    RandomMeasure.IsDirichletProcess (baseMeasure B F) (rateDirichletLaw B F) :=
  rateDirichletLaw_isDirichlet B F

def acceptance (B : PosReal) (F : ProbabilityMeasure ℝ) (y v : ℝ) : ℝ :=
  canonicalAcceptance (rateDirichletLaw B F) B y v

def drift (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) : ℝ :=
  canonicalDrift (rateDirichletLaw B F) B y

def generator (B : PosReal) (F : ProbabilityMeasure ℝ) (φ : ℝ → ℝ) (y : ℝ) : ℝ :=
  canonicalGenerator (rateDirichletLaw B F) B φ y

theorem generator_eq (B : PosReal) (F : ProbabilityMeasure ℝ) (φ : ℝ → ℝ) (y : ℝ) :
    generator B F φ y = drift B F y * deriv φ y +
      ∫ v, (φ (y+v)-φ y-v*deriv φ y) * acceptance B F y v ∂jumpMeasure := rfl

@[fun_prop] theorem acceptance_jointlyMeasurable :
    Measurable (fun x : PosReal × ProbabilityMeasure ℝ × ℝ × ℝ =>
      acceptance x.1 x.2.1 x.2.2.1 x.2.2.2) := by
  have hd := measurable_rateDirichletLaw.comp
    (show Measurable (fun x : PosReal × ProbabilityMeasure ℝ × ℝ × ℝ => (x.1,x.2.1)) from
      measurable_fst.prodMk (measurable_fst.comp measurable_snd))
  have hp := hd.prodMk (measurable_fst.prodMk
    ((measurable_fst.comp (measurable_snd.comp measurable_snd)).prodMk
      (measurable_snd.comp (measurable_snd.comp measurable_snd))))
  have h := canonicalAcceptance_jointlyMeasurable.comp hp
  exact h

@[fun_prop] theorem drift_jointlyMeasurable :
    Measurable (fun x : PosReal × ProbabilityMeasure ℝ × ℝ => drift x.1 x.2.1 x.2.2) := by
  have hd := measurable_rateDirichletLaw.comp
    (show Measurable (fun x : PosReal × ProbabilityMeasure ℝ × ℝ => (x.1,x.2.1)) from
      measurable_fst.prodMk (measurable_fst.comp measurable_snd))
  have hp := hd.prodMk (measurable_fst.prodMk (measurable_snd.comp measurable_snd))
  have h := canonicalDrift_jointlyMeasurable.comp hp
  exact h

theorem generator_jointlyMeasurable {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) :
    Measurable (fun x : PosReal × ProbabilityMeasure ℝ × ℝ => generator x.1 x.2.1 φ x.2.2) := by
  have hd := measurable_rateDirichletLaw.comp
    (show Measurable (fun x : PosReal × ProbabilityMeasure ℝ × ℝ => (x.1,x.2.1)) from
      measurable_fst.prodMk (measurable_fst.comp measurable_snd))
  have hp := hd.prodMk (measurable_fst.prodMk (measurable_snd.comp measurable_snd))
  have h := (canonicalGenerator_jointlyMeasurable hφ).comp hp
  exact h

theorem acceptance_bounds (B : PosReal) (F : ProbabilityMeasure ℝ) (y v : ℝ) :
    0 ≤ acceptance B F y v ∧ acceptance B F y v ≤ 1 :=
  canonicalAcceptance_bounds _ B y v

theorem abs_drift_sub_le (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    |drift B F y-y| ≤ driftBound B.val :=
  abs_phaseDrift_sub_le phase_jointlyMeasurable
    (fun P t => (stieltjesPhase_bounds P t).1) (fun P t => (stieltjesPhase_bounds P t).2) _ B y

theorem drift_compactMass_bound {a b : ℝ} (ha : 0 < a) :
    ∃ C : ℝ, ∀ (B : PosReal) (F : ProbabilityMeasure ℝ), B.val ∈ Icc a b →
      ∀ y, |drift B F y-y| ≤ C := by
  obtain ⟨C,hC⟩ := driftBound_boundedOn_Icc (b := b) ha
  exact ⟨C, fun B F hB y => (abs_drift_sub_le B F y).trans (hC B.val hB)⟩

theorem integrable_generator_jumps (B : PosReal) (F : ProbabilityMeasure ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) (y : ℝ) :
    Integrable (fun v => taylorRemainder φ y v * acceptance B F y v) jumpMeasure :=
  integrable_canonicalGenerator_jumps _ B hφ hC y

theorem generator_nonneg_at_min (B : PosReal) (F : ProbabilityMeasure ℝ)
    {φ : ℝ → ℝ} {y : ℝ} (hmin : ∀ x, φ y ≤ φ x) : 0 ≤ generator B F φ y :=
  canonicalGenerator_nonneg_at_min _ B hmin

theorem generator_sq_le (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    generator B F (fun x => x^2) y ≤ 3*y^2+(driftBound B.val)^2+jumpSecondMoment :=
  canonicalGenerator_sq_le _ B y

theorem generator_compactTest_bound {φ : ℝ → ℝ}
    (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) {a b : ℝ} (ha : 0 < a) :
    ∃ C : ℝ, ∀ (B : PosReal) (F : ProbabilityMeasure ℝ), B.val ∈ Icc a b →
      ∀ y, |generator B F φ y| ≤ C := by
  obtain ⟨C,hC⟩ := canonicalGenerator_compactTest_bound (b := b) hφ hs ha
  exact ⟨C, fun B F hB y => hC (rateDirichletLaw B F) B hB y⟩

theorem integrable_generator_compactTest (B : PosReal) (F : ProbabilityMeasure ℝ)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (hs : HasCompactSupport φ) :
    Integrable (generator B F φ) (F : Measure ℝ) :=
  integrable_canonicalGenerator_compactTest _ B F hφ hs

end GGC.LogRate
