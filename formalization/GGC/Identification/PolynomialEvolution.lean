import GGC.Identification.ExponentialTests
import GGC.Identification.LaplaceEvolution

/-! # Laplace evolution for all polynomials in the exponential coordinate -/

noncomputable section
open MeasureTheory Set Filter
open scoped Polynomial
namespace GGC.Identification

theorem polynomial_exp_time_equation
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T)
    {t : ℝ} (ht : t ∈ Icc 0 T) (p : ℝ[X]) :
    (∫ x, expTest (fun z => p.eval z) x ∂((valueAt w hT t).law : Measure ℝ)) -
      (∫ x, expTest (fun z => p.eval z) x ∂((valueAt w hT 0).law : Measure ℝ)) =
      ∫ r in 0..t, ∫ x, expGenerator (fun z => p.eval z) x ∂((valueAt w hT r).law : Measure ℝ) := by
  induction p using Polynomial.induction_on' with
  | add p q hp hq =>
    have htest : expTest (fun z => (p+q).eval z) =
        fun x => expTest (fun z => p.eval z) x + expTest (fun z => q.eval z) x := by
      funext x
      simp only [expTest, Polynomial.eval_add]
    have hgen : expGenerator (fun z => (p+q).eval z) =
        fun x => expGenerator (fun z => p.eval z) x + expGenerator (fun z => q.eval z) x := by
      funext x
      rw [expGenerator_polynomial (p+q), expGenerator_polynomial p, expGenerator_polynomial q,
        Polynomial.derivative_add, Polynomial.eval_add, mul_add]
    rw [htest,hgen]
    rw [integral_add (integrable_expTest _ (contDiff_polynomial_eval p))
        (integrable_expTest _ (contDiff_polynomial_eval q)),
      integral_add (integrable_expTest _ (contDiff_polynomial_eval p))
        (integrable_expTest _ (contDiff_polynomial_eval q))]
    simp_rw [integral_add (integrable_expGenerator _ (contDiff_polynomial_eval p))
      (integrable_expGenerator _ (contDiff_polynomial_eval q))]
    rw [intervalIntegral.integral_add
      ((continuous_integral_expGenerator (valueAt w hT) (continuous_valueAt w hT)
        (contDiff_polynomial_eval p)).intervalIntegrable 0 t)
      ((continuous_integral_expGenerator (valueAt w hT) (continuous_valueAt w hT)
        (contDiff_polynomial_eval q)).intervalIntegrable 0 t)]
    linarith
  | monomial n a =>
    simp_rw [expTest_monomial, expGenerator_monomial, integral_const_mul]
    by_cases hn : n = 0
    · subst n
      simp
    · have hn' : 0 < (n : ℝ) := Nat.cast_pos.mpr (Nat.pos_of_ne_zero hn)
      have he := laplace_time_equation w hT ht hn'
      rw [intervalIntegral.integral_const_mul] at he
      have hm (r : ℝ) : (∫ x, x*Real.log x*Real.exp (-(n : ℝ)*x)
          ∂((valueAt w hT r).law : Measure ℝ)) = dampedLogMoment (valueAt w hT r) 0 n := by
        simp only [dampedLogMoment, zero_add, pow_one]
      simp_rw [hm]
      change a*laplace (valueAt w hT t) n-a*laplace (valueAt w hT 0) n =
        ∫ r in 0..t, (a * -(n : ℝ))*dampedLogMoment (valueAt w hT r) 0 n
      rw [intervalIntegral.integral_const_mul]
      linear_combination a*he

end GGC.Identification
