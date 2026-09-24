import GGC.LogRate.SampleResolvent
import Mathlib.MeasureTheory.Integral.Prod

/-! # Absolutely integrable posterior averaging of the sample generator

The product integral is controlled before signed Fubini is applied (API-021).
The law `D` is arbitrary here; the Dirichlet Palm step is a later consumer.
-/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.LogRate

theorem canonicalDrift_eq_integral_sampleDrift
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal) (y : ℝ) :
    canonicalDrift D B y = ∫ P, sampleDrift B P y
      ∂(posteriorMixtureLaw D B ⟨Real.exp y, Real.exp_pos y⟩ : Measure (ProbabilityMeasure PosReal)) := by
  let b : PosReal := ⟨Real.exp y, Real.exp_pos y⟩
  have hi := (integrable_posteriorLog D B b).add
    (integrable_scaledPhaseCorrection phase_jointlyMeasurable
      (fun P t => (stieltjesPhase_bounds P t).1) (fun P t => (stieltjesPhase_bounds P t).2) b
      (posteriorMixtureLaw D B b))
  change Integrable (fun P => posteriorLog b P +
    scaledPhaseCorrection (fun x => stieltjesPhase x.1 x.2) b P)
      (posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal)) at hi
  have he (P : ProbabilityMeasure PosReal) : sampleDrift B P y =
      (y-digamma (B.val+1)-1) + (posteriorLog b P +
        scaledPhaseCorrection (fun x => stieltjesPhase x.1 x.2) b P) := by
    rw [sampleDrift_eq_offset]
    dsimp only [b]
    ring
  simp_rw [he]
  rw [integral_add (integrable_const _) hi]
  simp only [integral_const, probReal_univ, one_smul]
  rfl

theorem integrable_sampleJump_product (R : ProbabilityMeasure (ProbabilityMeasure PosReal))
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) (y : ℝ) :
    Integrable (fun x : ProbabilityMeasure PosReal × ℝ =>
      taylorRemainder φ y x.2 * stieltjesPhase x.1 (Real.exp (y+x.2)))
      ((R : Measure (ProbabilityMeasure PosReal)).prod jumpMeasure) := by
  have hi : Integrable (fun v => taylorRemainder φ y v) jumpMeasure := by
    simpa only [mul_one] using integrable_compensatedJump measurable_const
      (fun _ => zero_le_one) (fun _ => le_rfl) hφ hC y
  have hp : Measurable (fun x : ProbabilityMeasure PosReal × ℝ => (x.1, Real.exp (y+x.2))) := by
    fun_prop
  have hm := phase_jointlyMeasurable.comp hp
  apply (hi.comp_snd (R : Measure (ProbabilityMeasure PosReal))).mul_bdd hm.aestronglyMeasurable (c := 1)
  exact Eventually.of_forall fun x => by
    change ‖stieltjesPhase x.1 (Real.exp (y+x.2))‖ ≤ 1
    rw [Real.norm_eq_abs, abs_of_nonneg (stieltjesPhase_bounds _ _).1]
    exact (stieltjesPhase_bounds _ _).2

theorem integrable_sampleGenerator (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B : PosReal) {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) (y : ℝ) :
    Integrable (fun P => sampleGenerator B P φ y)
      (posteriorMixtureLaw D B ⟨Real.exp y, Real.exp_pos y⟩ : Measure (ProbabilityMeasure PosReal)) :=
  ((integrable_sampleDrift D B y).mul_const (deriv φ y)).add
    (integrable_sampleJump_product _ hφ hC y).integral_prod_left

theorem integral_sampleJump_eq_canonicalJump
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) (y : ℝ) :
    (∫ P, compensatedJump (fun v => stieltjesPhase P (Real.exp (y+v))) φ y
      ∂(posteriorMixtureLaw D B ⟨Real.exp y, Real.exp_pos y⟩ : Measure (ProbabilityMeasure PosReal))) =
      compensatedJump (canonicalAcceptance D B y) φ y := by
  unfold compensatedJump
  rw [integral_integral_swap (integrable_sampleJump_product _ hφ hC y)]
  simp_rw [integral_const_mul]
  rfl

theorem canonicalGenerator_eq_integral_sampleGenerator
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal)
    {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) (y : ℝ) :
    canonicalGenerator D B φ y = ∫ P, sampleGenerator B P φ y
      ∂(posteriorMixtureLaw D B ⟨Real.exp y, Real.exp_pos y⟩ : Measure (ProbabilityMeasure PosReal)) := by
  change canonicalDrift D B y * deriv φ y + compensatedJump (canonicalAcceptance D B y) φ y = _
  have hj : Integrable (fun P => compensatedJump (fun v => stieltjesPhase P (Real.exp (y+v))) φ y)
      (posteriorMixtureLaw D B ⟨Real.exp y, Real.exp_pos y⟩ : Measure (ProbabilityMeasure PosReal)) :=
    (integrable_sampleJump_product _ hφ hC y).integral_prod_left
  rw [canonicalDrift_eq_integral_sampleDrift,
    ← integral_sampleJump_eq_canonicalJump D B hφ hC y, ← integral_mul_const]
  exact (integral_add ((integrable_sampleDrift D B y).mul_const (deriv φ y)) hj).symm

theorem canonicalGenerator_logResolvent
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal)
    {s : ℝ} (hs : 0 < s) (y : ℝ) :
    canonicalGenerator D B (logResolvent s) y = ∫ P,
      Real.exp y/(s+Real.exp y)^2 * (digamma (B.val+1)+1+Real.log (stieltjesMean P s))
      ∂(posteriorMixtureLaw D B ⟨Real.exp y, Real.exp_pos y⟩ : Measure (ProbabilityMeasure PosReal)) := by
  rw [canonicalGenerator_eq_integral_sampleGenerator D B (contDiff_logResolvent hs)
    (abs_deriv_deriv_logResolvent_le hs)]
  apply integral_congr_ae
  exact Eventually.of_forall fun P => sampleGenerator_logResolvent B P hs y

/-- The absolute posterior drift term is uniformly bounded in the log-rate state. -/
theorem integral_abs_sampleDrift_resolvent_le
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal)
    {s : ℝ} (hs : 0 < s) (y : ℝ) :
    (∫ P, |sampleDrift B P y * deriv (logResolvent s) y|
      ∂(posteriorMixtureLaw D B ⟨Real.exp y, Real.exp_pos y⟩ : Measure (ProbabilityMeasure PosReal))) ≤
      1+1/s^2 + |(|digamma (B.val+1)+1|+1+digamma (B.val+1)-digamma 1)|/s := by
  simp_rw [abs_mul]
  rw [integral_mul_const]
  let C := |digamma (B.val+1)+1|+1+digamma (B.val+1)-digamma 1
  calc
    _ ≤ (|y|+C) * |deriv (logResolvent s) y| :=
      mul_le_mul_of_nonneg_right (integral_abs_sampleDrift_le D B y) (abs_nonneg _)
    _ = |y*deriv (logResolvent s) y| + C * |deriv (logResolvent s) y| := by rw [abs_mul]; ring
    _ ≤ 1+1/s^2 + |C| * (1/s) := add_le_add (abs_y_mul_deriv_logResolvent_le hs y)
      (mul_le_mul (le_abs_self C) (abs_deriv_logResolvent_le hs y) (abs_nonneg _) (abs_nonneg _))
    _ = _ := by rw [mul_one_div]

/-- Thus even the expected absolute sample drift is integrable for every law F.
This is stronger than integrability of the averaged signed generator. -/
theorem integrable_posterior_abs_sampleDrift_resolvent
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal)
    (F : ProbabilityMeasure ℝ) {s : ℝ} (hs : 0 < s) :
    Integrable (fun y => ∫ P, |sampleDrift B P y * deriv (logResolvent s) y|
      ∂(posteriorMixtureLaw D B ⟨Real.exp y, Real.exp_pos y⟩ : Measure (ProbabilityMeasure PosReal)))
      (F : Measure ℝ) := by
  have hp : Measurable (fun y : ℝ => (D,B,(⟨Real.exp y, Real.exp_pos y⟩ : PosReal))) := by fun_prop
  have hR := posteriorMixtureLaw_jointlyMeasurable.comp hp
  have hd := (contDiff_logResolvent hs).continuous_deriv (by norm_num)
  have hmul := ((sampleDrift_jointlyMeasurable B).comp measurable_swap).mul
    (hd.measurable.comp measurable_fst)
  have hm : Measurable (fun x : ℝ × ProbabilityMeasure PosReal =>
      |sampleDrift B x.2 x.1 * deriv (logResolvent s) x.1|) := by
    simpa only [Real.norm_eq_abs, Function.comp_def, Pi.mul_apply] using! hmul.norm
  have hi := RandomMeasure.measurable_probability_integral hR
    (f := fun y P => |sampleDrift B P y * deriv (logResolvent s) y|) hm
  apply (integrable_const (1+1/s^2 + |(|digamma (B.val+1)+1|+1+digamma (B.val+1)-digamma 1)|/s)).mono'
    hi.aestronglyMeasurable
  exact Eventually.of_forall fun y => by
    rw [Real.norm_eq_abs, abs_of_nonneg (integral_nonneg fun P => abs_nonneg _)]
    exact integral_abs_sampleDrift_resolvent_le D B hs y

end GGC.LogRate
