import GGC.NonnegTests
import GGC.DampedMoments
import GGC.Foundations.C1PolynomialApproximation
import Mathlib.Analysis.Calculus.ContDiff.Polynomial

/-! # Exponential-coordinate tests and their transport generator -/

noncomputable section
open MeasureTheory Set Filter
open scoped Polynomial
namespace GGC.Identification

def expTest (f : ℝ → ℝ) (x : ℝ) : ℝ := f (Real.exp (-x))

def expGenerator (f : ℝ → ℝ) (x : ℝ) : ℝ :=
  -(x*Real.log x*Real.exp (-x))*deriv f (Real.exp (-x))

theorem continuous_expTest {f : ℝ → ℝ} (hf : Continuous f) : Continuous (expTest f) :=
  hf.comp (by fun_prop)

theorem continuous_expGenerator {f : ℝ → ℝ} (hf : ContDiff ℝ 1 f) :
    Continuous (expGenerator f) :=
  ((Real.continuous_mul_log.mul (by fun_prop)).neg).mul
    (hf.continuous_deriv_one.comp (by fun_prop))

theorem hasDerivAt_expTest {f : ℝ → ℝ} (hf : ContDiff ℝ 1 f) (x : ℝ) :
    HasDerivAt (expTest f) (-Real.exp (-x)*deriv f (Real.exp (-x))) x := by
  convert! ((hf.differentiable (by norm_num) (Real.exp (-x))).hasDerivAt).comp x
    ((hasDerivAt_id x).neg.exp) using 1
  simp only [Pi.neg_apply, id_eq, neg_mul, mul_neg, mul_one]
  ring

theorem expGenerator_eq_mul_deriv {f : ℝ → ℝ} (hf : ContDiff ℝ 1 f) (x : ℝ) :
    expGenerator f x = x*Real.log x*deriv (expTest f) x := by
  rw [(hasDerivAt_expTest hf x).deriv]
  dsimp only [expGenerator]
  ring

theorem expTest_generator_bounded {f : ℝ → ℝ} (hf : ContDiff ℝ 1 f) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ x, 0 ≤ x → |expTest f x| ≤ C ∧ |expGenerator f x| ≤ C := by
  obtain ⟨A,hA⟩ := isCompact_Icc.exists_bound_of_continuousOn
    (hf.continuous.continuousOn (s := Icc (0 : ℝ) 1))
  obtain ⟨B,hB⟩ := isCompact_Icc.exists_bound_of_continuousOn
    (hf.continuous_deriv_one.continuousOn (s := Icc (0 : ℝ) 1))
  obtain ⟨D,hD,hd⟩ := damped_log_pow_bound 0 (a := 1) zero_lt_one
  refine ⟨|A|+D*|B|, by positivity, fun x hx => ?_⟩
  have he : Real.exp (-x) ∈ Icc (0 : ℝ) 1 :=
    ⟨(Real.exp_pos _).le,Real.exp_le_one_iff.mpr (neg_nonpos.mpr hx)⟩
  have ha : |f (Real.exp (-x))| ≤ |A| := by
    have ha' : |f (Real.exp (-x))| ≤ A := by simpa only [Real.norm_eq_abs] using hA _ he
    exact ha'.trans (le_abs_self A)
  have hb : |deriv f (Real.exp (-x))| ≤ |B| := by
    have hb' : |deriv f (Real.exp (-x))| ≤ B := by simpa only [Real.norm_eq_abs] using hB _ he
    exact hb'.trans (le_abs_self B)
  have hweight : |x*Real.log x*Real.exp (-x)| ≤ D := by
    simpa only [zero_add, pow_one, neg_mul, one_mul] using hd 1 x le_rfl hx
  refine ⟨ha.trans (le_add_of_nonneg_right (by positivity)), ?_⟩
  rw [expGenerator, abs_mul, abs_neg]
  exact (mul_le_mul hweight hb (abs_nonneg _) hD).trans (le_add_of_nonneg_left (abs_nonneg A))

theorem integrable_expTest (μ : NonnegLaw) {f : ℝ → ℝ} (hf : ContDiff ℝ 1 f) :
    Integrable (expTest f) (μ.law : Measure ℝ) := by
  obtain ⟨_,_,hb⟩ := expTest_generator_bounded hf
  exact integrable_nonnegLaw_test μ (continuous_expTest hf.continuous) (fun x hx => (hb x hx).1)

theorem integrable_expGenerator (μ : NonnegLaw) {f : ℝ → ℝ} (hf : ContDiff ℝ 1 f) :
    Integrable (expGenerator f) (μ.law : Measure ℝ) := by
  obtain ⟨_,_,hb⟩ := expTest_generator_bounded hf
  exact integrable_nonnegLaw_test μ (continuous_expGenerator hf) (fun x hx => (hb x hx).2)

theorem continuous_integral_expGenerator {X : Type*} [TopologicalSpace X]
    (μ : X → NonnegLaw) (hc : Continuous (fun x => (μ x).law))
    {f : ℝ → ℝ} (hf : ContDiff ℝ 1 f) :
    Continuous (fun r => ∫ x, expGenerator f x ∂((μ r).law : Measure ℝ)) := by
  obtain ⟨_,_,hb⟩ := expTest_generator_bounded hf
  exact continuous_integral_nonnegLaw_test μ hc (continuous_expGenerator hf) (fun x hx => (hb x hx).2)

theorem contDiff_polynomial_eval (p : ℝ[X]) : ContDiff ℝ 1 (fun x => p.eval x) := by
  simpa using! p.contDiff_aeval (𝕜 := ℝ) 1

theorem expGenerator_polynomial (p : ℝ[X]) (x : ℝ) :
    expGenerator (fun z => p.eval z) x =
      -(x*Real.log x*Real.exp (-x))*p.derivative.eval (Real.exp (-x)) := by
  rw [expGenerator, Polynomial.deriv]

theorem expTest_monomial (n : ℕ) (a x : ℝ) :
    expTest (fun z => (Polynomial.monomial n a).eval z) x = a*Real.exp (-(n : ℝ)*x) := by
  simp only [expTest, Polynomial.eval_monomial, ← Real.exp_nat_mul, mul_neg, neg_mul]

theorem expGenerator_monomial (n : ℕ) (a x : ℝ) :
    expGenerator (fun z => (Polynomial.monomial n a).eval z) x =
      (a * -(n : ℝ)) * (x*Real.log x*Real.exp (-(n : ℝ)*x)) := by
  rw [expGenerator_eq_mul_deriv (contDiff_polynomial_eval _),
    show expTest (fun z => (Polynomial.monomial n a).eval z) =
      (fun x => a*Real.exp (-(n : ℝ)*x)) from funext (expTest_monomial n a)]
  have hd : HasDerivAt (fun z : ℝ => a*Real.exp (-(n : ℝ)*z))
      (a*(Real.exp (-(n : ℝ)*x)*(-(n : ℝ)))) x := by
    simpa only [id_eq, mul_one] using! (((hasDerivAt_id x).const_mul (-(n : ℝ))).exp.const_mul a)
  rw [hd.deriv]
  ring

theorem exists_expTest_generator_approximation {f : ℝ → ℝ} (hf : ContDiff ℝ 1 f) :
    ∃ D : ℝ, 0 ≤ D ∧ ∀ ε : ℝ, 0 < ε → ∃ p : ℝ[X], ∀ x, 0 ≤ x →
      |expTest (fun z => p.eval z) x-expTest f x| ≤ ε ∧
      |expGenerator (fun z => p.eval z) x-expGenerator f x| ≤ D*ε := by
  obtain ⟨D,hD,hd⟩ := damped_log_pow_bound 0 (a := 1) zero_lt_one
  refine ⟨D,hD,fun ε hε => ?_⟩
  obtain ⟨p,_,hp⟩ := Analysis.exists_polynomial_C1_approximation hf hε
  refine ⟨p,fun x hx => ?_⟩
  have he : Real.exp (-x) ∈ Icc (0 : ℝ) 1 :=
    ⟨(Real.exp_pos _).le,Real.exp_le_one_iff.mpr (neg_nonpos.mpr hx)⟩
  refine ⟨(hp _ he).1, ?_⟩
  have hweight : |x*Real.log x*Real.exp (-x)| ≤ D := by
    simpa only [zero_add, pow_one, neg_mul, one_mul] using hd 1 x le_rfl hx
  rw [expGenerator_polynomial, expGenerator, ← mul_sub, abs_mul, abs_neg]
  exact mul_le_mul hweight (hp _ he).2 (abs_nonneg _) hD

end GGC.Identification
