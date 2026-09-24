import GGC.Identification.ValueLaw

/-! # Strict positivity from the actual value-law Laplace transform

The mass at zero is bounded by every Laplace transform. The logarithmic
test lower bound forces these transforms to vanish at infinity.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Identification
open GGC.Analysis GGC.LogRate

theorem logTest_exp_lower (r y : ℝ) : r-y ≤ logTest (Real.exp r) y := by
  calc
    r-y = Real.log (Real.exp r*Real.exp (-y)) := by
      rw [Real.log_mul (Real.exp_ne_zero _) (Real.exp_ne_zero _), Real.log_exp, Real.log_exp]
      ring
    _ ≤ logTest (Real.exp r) y := Real.log_le_log (by positivity) (by linarith)

theorem laplace_valueLaw_exp_bound (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) (r : ℝ) :
    laplace (valueLaw B F hF) (Real.exp r) ≤
      Real.exp (-B.val*(r-∫ y : ℝ, y ∂(F : Measure ℝ))) := by
  rw [laplace_valueLaw B F hF (Real.exp_pos _), Real.exp_le_exp]
  have hi : (∫ y : ℝ, r-y ∂(F : Measure ℝ)) ≤ ∫ y, logTest (Real.exp r) y ∂(F : Measure ℝ) :=
    integral_mono ((integrable_const r).sub (integrable_id_of_integrable_sq F hF))
      (integrable_logTest F hF (Real.exp_pos _).le) (logTest_exp_lower r)
  rw [integral_sub (integrable_const r) (integrable_id_of_integrable_sq F hF)] at hi
  simp only [integral_const, probReal_univ, smul_eq_mul, one_mul] at hi
  nlinarith [mul_le_mul_of_nonneg_left hi B.property.le]

theorem laplace_valueLaw_exp_tendsto_zero (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) :
    Tendsto (fun r : ℝ => laplace (valueLaw B F hF) (Real.exp r)) atTop (𝓝 0) := by
  apply squeeze_zero (fun r => (laplace_pos _ (Real.exp_pos r).le).le)
    (laplace_valueLaw_exp_bound B F hF)
  have ht : Tendsto (fun r : ℝ => r-∫ y : ℝ, y ∂(F : Measure ℝ)) atTop atTop := by
    simpa only [sub_eq_add_neg, id_eq] using!
      tendsto_atTop_add_const_right atTop (-(∫ y : ℝ, y ∂(F : Measure ℝ))) tendsto_id
  exact Real.tendsto_exp_atBot.comp
    (ht.const_mul_atTop_of_neg (neg_neg_of_pos B.property))

theorem measureReal_zero_le_laplace (μ : NonnegLaw) {s : ℝ} (hs : 0 ≤ s) :
    (μ.law : Measure ℝ).real {0} ≤ laplace μ s := by
  have h := setIntegral_le_integral (s := ({0} : Set ℝ)) (laplace_integrable μ hs)
    (Eventually.of_forall fun x : ℝ => (Real.exp_pos (-s*x)).le)
  simpa [integral_singleton, laplace, measureReal_def] using! h

theorem valueLaw_zero_measure (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) :
    ((valueLaw B F hF).law : Measure ℝ) {0} = 0 := by
  have hz : ((valueLaw B F hF).law : Measure ℝ).real {0} ≤ 0 :=
    le_of_tendsto_of_tendsto tendsto_const_nhds (laplace_valueLaw_exp_tendsto_zero B F hF)
      (Eventually.of_forall fun r => measureReal_zero_le_laplace _ (Real.exp_pos r).le)
  have he := le_antisymm hz (measureReal_nonneg (μ := ((valueLaw B F hF).law : Measure ℝ)))
  rw [measureReal_def, ENNReal.toReal_eq_zero_iff] at he
  exact he.resolve_right (measure_ne_top _ _)

theorem valueLaw_pos (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) :
    ∀ᵐ x ∂((valueLaw B F hF).law : Measure ℝ), 0 < x := by
  have hn : ∀ᵐ x ∂((valueLaw B F hF).law : Measure ℝ), x ≠ 0 := by
    rw [ae_iff]
    simpa using valueLaw_zero_measure B F hF
  filter_upwards [(valueLaw B F hF).nonneg, hn] with x hx hn
  exact lt_of_le_of_ne hx hn.symm

end GGC.Identification
