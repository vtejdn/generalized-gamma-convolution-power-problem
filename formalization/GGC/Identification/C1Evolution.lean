import GGC.Identification.PolynomialEvolution

/-! # Transfer the value equation through simultaneous test-generator approximation -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Identification

theorem C1_exp_time_equation
    {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T)
    {t : ℝ} (ht : t ∈ Icc 0 T) {f : ℝ → ℝ} (hf : ContDiff ℝ 1 f) :
    (∫ x, expTest f x ∂((valueAt w hT t).law : Measure ℝ)) -
      (∫ x, expTest f x ∂((valueAt w hT 0).law : Measure ℝ)) =
      ∫ r in 0..t, ∫ x, expGenerator f x ∂((valueAt w hT r).law : Measure ℝ) := by
  let I : (ℝ → ℝ) → ℝ → ℝ := fun g r => ∫ x, expTest g x ∂((valueAt w hT r).law : Measure ℝ)
  let A : (ℝ → ℝ) → ℝ → ℝ := fun g r => ∫ x, expGenerator g x ∂((valueAt w hT r).law : Measure ℝ)
  let J : (ℝ → ℝ) → ℝ := fun g => ∫ r in 0..t, A g r
  obtain ⟨D,hD,ha⟩ := exists_expTest_generator_approximation hf
  change I f t-I f 0=J f
  apply sub_eq_zero.mp
  apply abs_eq_zero.mp
  apply le_antisymm ?_ (abs_nonneg _)
  apply le_of_forall_pos_le_add
  intro ε hε
  let η := ε/(2+D*t)
  have ht₀ : 0 ≤ t := ht.1
  have hC : 0 < 2+D*t := by positivity
  have hη : 0 < η := div_pos hε hC
  obtain ⟨p,hp⟩ := ha η hη
  let P : ℝ → ℝ := fun x => p.eval x
  have hP : ContDiff ℝ 1 P := contDiff_polynomial_eval p
  have hI (r : ℝ) : |I P r-I f r| ≤ η :=
    abs_integral_sub_nonnegLaw_test_le _ (integrable_expTest _ hP) (integrable_expTest _ hf)
      (fun x hx => (hp x hx).1)
  have hA (r : ℝ) : |A P r-A f r| ≤ D*η :=
    abs_integral_sub_nonnegLaw_test_le _ (integrable_expGenerator _ hP) (integrable_expGenerator _ hf)
      (fun x hx => (hp x hx).2)
  have hJ : |J P-J f| ≤ D*η*t := by
    dsimp only [J]
    rw [← intervalIntegral.integral_sub
      ((continuous_integral_expGenerator (valueAt w hT) (continuous_valueAt w hT) hP).intervalIntegrable 0 t)
      ((continuous_integral_expGenerator (valueAt w hT) (continuous_valueAt w hT) hf).intervalIntegrable 0 t)]
    have hb := intervalIntegral.norm_integral_le_of_norm_le_const
      (a := (0 : ℝ)) (b := t) (C := D*η) (f := fun r => A P r-A f r) (fun r _ => by
        simpa only [Real.norm_eq_abs] using hA r)
    simpa only [Real.norm_eq_abs, sub_zero, abs_of_nonneg ht.1] using hb
  have he : I P t-I P 0=J P := polynomial_exp_time_equation w hT ht p
  have hIt : |I f t-I P t| ≤ η := by rw [abs_sub_comm]; exact hI t
  have hI0 : |I f 0-I P 0| ≤ η := by rw [abs_sub_comm]; exact hI 0
  have hab : |(I f t-I P t)-(I f 0-I P 0)| ≤ |I f t-I P t|+|I f 0-I P 0| := by
    simpa only [sub_zero, zero_sub, abs_neg] using abs_sub_le (I f t-I P t) 0 (I f 0-I P 0)
  calc
    |I f t-I f 0-J f| = |(I f t-I P t)-(I f 0-I P 0)+(J P-J f)| := by congr 1; linarith
    _ ≤ |(I f t-I P t)-(I f 0-I P 0)|+|J P-J f| := abs_add_le _ _
    _ ≤ η+η+D*η*t := by linarith
    _ = 0+ε := by dsimp only [η]; field_simp [ne_of_gt hC]; ring

end GGC.Identification
