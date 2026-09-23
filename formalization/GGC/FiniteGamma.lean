import GGC.Basic
import GGC.Laplace
import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap
import Mathlib.MeasureTheory.Integral.Pi

/-!
# Actual finite gamma convolutions and elementary membership

These lemmas use only the original weak-limit definition. They do not use
Thorin characterization or external mathematical axioms. The Laplace formulas
below are derived from the actual gamma density and independent product law.
-/

noncomputable section
open MeasureTheory Filter Topology
open scoped BigOperators
namespace GGC

/-- Expose the exact independent-product/sum-pushforward semantics. -/
theorem finiteGammaLaw_toMeasure (k : ℕ) (α b : Fin k → PosReal) :
    ((finiteGammaLaw k α b).law : Measure ℝ) =
      Measure.map (fun x : Fin k → ℝ => ∑ i, x i)
        (Measure.pi (fun i => ProbabilityTheory.gammaMeasure (α i).val (b i).val)) := rfl

/-- A finite gamma convolution is a GGC by the constant approximating sequence. -/
theorem isGGC_of_isFiniteGammaConvolution (μ : NonnegLaw)
    (hμ : IsFiniteGammaConvolution μ) : IsGGC μ :=
  ⟨fun _ => μ, fun _ => hμ, tendsto_const_nhds⟩

theorem isFiniteGammaConvolution_finiteGammaLaw (k : ℕ) (α b : Fin k → PosReal) :
    IsFiniteGammaConvolution (finiteGammaLaw k α b) := ⟨k, α, b, rfl⟩

theorem isGGC_finiteGammaLaw (k : ℕ) (α b : Fin k → PosReal) :
    IsGGC (finiteGammaLaw k α b) :=
  isGGC_of_isFiniteGammaConvolution _ (isFiniteGammaConvolution_finiteGammaLaw k α b)

/-- The empty finite product and sum give the zero law, not an undefined case. -/
theorem finiteGammaLaw_zero (α b : Fin 0 → PosReal) :
    finiteGammaLaw 0 α b = diracLaw 0 le_rfl := by
  apply NonnegLaw.ext
  apply ProbabilityMeasure.toMeasure_injective
  change Measure.map (fun x : Fin 0 → ℝ => ∑ i, x i)
    (Measure.pi (fun i => ((gammaLaw (α i) (b i)).law : Measure ℝ))) = Measure.dirac 0
  simp

/-- With one coordinate the sum pushforward is the component gamma law. -/
theorem finiteGammaLaw_one (α b : PosReal) :
    finiteGammaLaw 1 (fun _ => α) (fun _ => b) = gammaLaw α b := by
  apply NonnegLaw.ext
  apply ProbabilityMeasure.toMeasure_injective
  change Measure.map (fun x : Fin 1 → ℝ => ∑ i, x i)
    (Measure.pi (fun _ : Fin 1 => ((gammaLaw α b).law : Measure ℝ))) = _
  simpa only [Fin.sum_univ_one] using
    (measurePreserving_eval (μ := fun _ : Fin 1 =>
      ((gammaLaw α b).law : Measure ℝ)) (0 : Fin 1)).map_eq

theorem isGGC_gammaLaw (α b : PosReal) : IsGGC (gammaLaw α b) := by
  rw [← finiteGammaLaw_one α b]
  exact isGGC_finiteGammaLaw _ _ _

theorem isGGC_zero : IsGGC (diracLaw 0 le_rfl) := by
  rw [← finiteGammaLaw_zero (fun i => Fin.elim0 i) (fun i => Fin.elim0 i)]
  exact isGGC_finiteGammaLaw _ _ _

/-- Integration of an integrable test against the actual gamma density. -/
theorem integral_gammaLaw (α b : PosReal) (f : ℝ → ℝ)
    (_hf : Integrable f ((gammaLaw α b).law : Measure ℝ)) :
    (∫ x, f x ∂((gammaLaw α b).law : Measure ℝ)) =
      ∫ x, ProbabilityTheory.gammaPDFReal α.val b.val x * f x := by
  change (∫ x, f x ∂(volume.withDensity
    (fun x => ENNReal.ofReal (ProbabilityTheory.gammaPDFReal α.val b.val x)))) = _
  rw [integral_withDensity_eq_integral_toReal_smul (by fun_prop)
    (Filter.Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)]
  simp only [ENNReal.toReal_ofReal (ProbabilityTheory.gammaPDFReal_nonneg
    α.property b.property _), smul_eq_mul]

/-- Gamma normalization as a real density integral, reused in the rate shift. -/
theorem integral_gammaPDFReal (α b : PosReal) :
    (∫ x, ProbabilityTheory.gammaPDFReal α.val b.val x) = 1 := by
  have h := integral_gammaLaw α b (fun _ => 1) (integrable_const _)
  simpa using h.symm

/-- The single-gamma Laplace transform in the shape/rate convention.
M1 finite-input transform certificate; valid also at the zero endpoint. -/
theorem laplace_gammaLaw (α b : PosReal) {s : ℝ} (hs : 0 ≤ s) :
    laplace (gammaLaw α b) s = b.val ^ α.val / (b.val + s) ^ α.val := by
  have hbs : 0 < b.val + s := add_pos_of_pos_of_nonneg b.property hs
  have hp : (b.val + s) ^ α.val ≠ 0 := (Real.rpow_pos_of_pos hbs _).ne'
  rw [laplace, integral_gammaLaw α b _ (laplace_integrable (gammaLaw α b) hs)]
  have hdensity (x : ℝ) :
      ProbabilityTheory.gammaPDFReal α.val b.val x * Real.exp (-s * x) =
        (b.val ^ α.val / (b.val + s) ^ α.val) *
          ProbabilityTheory.gammaPDFReal α.val (b.val + s) x := by
    unfold ProbabilityTheory.gammaPDFReal
    split_ifs with hx
    · rw [mul_assoc, ← Real.exp_add]
      rw [show -(b.val * x) + -s * x = -((b.val + s) * x) by ring]
      field_simp
    · simp
  simp_rw [hdensity]
  rw [integral_const_mul, integral_gammaPDFReal α ⟨b.val + s, hbs⟩, mul_one]

/-- The same scalar certificate in the logarithmic form used by Thorin data. -/
theorem laplace_gammaLaw_eq_exp (α b : PosReal) {s : ℝ} (hs : 0 ≤ s) :
    laplace (gammaLaw α b) s = Real.exp (-α.val * Real.log (1 + s / b.val)) := by
  have hbs : 0 < b.val + s := add_pos_of_pos_of_nonneg b.property hs
  rw [laplace_gammaLaw α b hs, Real.rpow_def_of_pos b.property,
    Real.rpow_def_of_pos hbs, ← Real.exp_sub]
  congr 1
  rw [show 1 + s / b.val = (b.val + s) / b.val by field_simp [b.property.ne'],
    Real.log_div hbs.ne' b.property.ne']
  ring

/-- Absolute integrability of the product integrand before applying Fubini. -/
theorem finiteGamma_laplace_integrable (k : ℕ) (α b : Fin k → PosReal)
    {s : ℝ} (hs : 0 ≤ s) :
    Integrable (fun x : Fin k → ℝ => ∏ i, Real.exp (-s * x i))
      (Measure.pi (fun i => ((gammaLaw (α i) (b i)).law : Measure ℝ))) :=
  Integrable.fintype_prod (fun i => laplace_integrable (gammaLaw (α i) (b i)) hs)

/-- Independence of the product coordinates factors the finite-sum transform.
The preceding lemma supplies absolute integrability at every allowed parameter. -/
theorem laplace_finiteGammaLaw_eq_prod (k : ℕ) (α b : Fin k → PosReal)
    {s : ℝ} (_hs : 0 ≤ s) :
    laplace (finiteGammaLaw k α b) s = ∏ i, laplace (gammaLaw (α i) (b i)) s := by
  rw [laplace, finiteGammaLaw_toMeasure, integral_map (by fun_prop) (by fun_prop)]
  simp_rw [Finset.mul_sum, Real.exp_sum]
  exact integral_fintype_prod_eq_prod (μ := fun i =>
    ((gammaLaw (α i) (b i)).law : Measure ℝ)) (fun _ x => Real.exp (-s * x))

/-- The complete finite-atomic Thorin transform for the actual gamma sum.
The empty sum is included; no external representation theorem is used. -/
theorem laplace_finiteGammaLaw (k : ℕ) (α b : Fin k → PosReal)
    {s : ℝ} (hs : 0 ≤ s) :
    laplace (finiteGammaLaw k α b) s =
      Real.exp (-∑ i, (α i).val * Real.log (1 + s / (b i).val)) := by
  rw [laplace_finiteGammaLaw_eq_prod k α b hs]
  simp_rw [laplace_gammaLaw_eq_exp _ _ hs, neg_mul]
  rw [← Real.exp_sum, Finset.sum_neg_distrib]

end GGC
