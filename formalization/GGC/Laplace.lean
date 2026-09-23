import GGC.Basic
import Mathlib.MeasureTheory.Measure.FiniteMeasureExt
import Mathlib.Algebra.Polynomial.AlgebraMap

/-!
# Laplace transforms of nonnegative probability laws

M0 endpoint checks: domination by one gives integrability without moment
assumptions, and normalization and strict positivity concern actual integrals.
M1 uniqueness uses polynomial combinations of the bounded exponential on
nonnegative reals and mathlib's finite-measure separation theorem.
-/

noncomputable section
open MeasureTheory
open scoped NNReal BoundedContinuousFunction
namespace GGC

/-- The ordinary Laplace transform. Membership uses it only for s > 0. -/
def laplace (μ : NonnegLaw) (s : ℝ) : ℝ :=
  ∫ x : ℝ, Real.exp (-s * x) ∂(μ.law : Measure ℝ)

/-- The Laplace integrand is bounded by one on the law's nonnegative support. -/
theorem laplace_integrand_le_one (μ : NonnegLaw) {s : ℝ} (hs : 0 ≤ s) :
    ∀ᵐ x ∂(μ.law : Measure ℝ), Real.exp (-s * x) ≤ 1 := by
  filter_upwards [μ.nonneg] with x hx
  exact Real.exp_le_one_iff.mpr (mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr hs) hx)

/-- Absolute integrability for every nonnegative parameter, with no moments. -/
theorem laplace_integrable (μ : NonnegLaw) {s : ℝ} (hs : 0 ≤ s) :
    Integrable (fun x : ℝ => Real.exp (-s * x)) (μ.law : Measure ℝ) := by
  apply (integrable_const (1 : ℝ)).mono' (by fun_prop)
  filter_upwards [laplace_integrand_le_one μ hs] with x hx
  simpa only [Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)] using hx

/-- Probability normalization fixes the zero Laplace endpoint. -/
@[simp] theorem laplace_zero (μ : NonnegLaw) : laplace μ 0 = 1 := by
  simp [laplace]

/-- A nonnegative probability law has a strictly positive Laplace transform. -/
theorem laplace_pos (μ : NonnegLaw) {s : ℝ} (hs : 0 ≤ s) : 0 < laplace μ s :=
  integral_exp_pos (laplace_integrable μ hs)

theorem laplace_le_one (μ : NonnegLaw) {s : ℝ} (hs : 0 ≤ s) : laplace μ s ≤ 1 := by
  calc
    laplace μ s ≤ ∫ _ : ℝ, (1 : ℝ) ∂(μ.law : Measure ℝ) :=
      integral_mono_ae (laplace_integrable μ hs) (integrable_const _)
        (laplace_integrand_le_one μ hs)
    _ = 1 := by simp

/-- Increasing the nonnegative parameter can only decrease the transform. -/
theorem laplace_antitone (μ : NonnegLaw) : AntitoneOn (laplace μ) (Set.Ici 0) := by
  intro s hs t ht hst
  apply integral_mono_ae (laplace_integrable μ ht) (laplace_integrable μ hs)
  filter_upwards [μ.nonneg] with x hx
  exact Real.exp_le_exp.mpr (mul_le_mul_of_nonneg_right (neg_le_neg hst) hx)

@[simp] theorem laplace_diracLaw (a : ℝ) (ha : 0 ≤ a) (s : ℝ) :
    laplace (diracLaw a ha) s = Real.exp (-s * a) := by
  simp [laplace, diracLaw]

private def expNeg : ℝ≥0 →ᵇ ℝ :=
  BoundedContinuousFunction.mkOfBound ⟨fun x => Real.exp (-(x : ℝ)), by fun_prop⟩ 2 (by
    intro x y
    have hx := Real.exp_le_one_iff.mpr (neg_nonpos.mpr x.coe_nonneg)
    have hy := Real.exp_le_one_iff.mpr (neg_nonpos.mpr y.coe_nonneg)
    have hx0 := Real.exp_pos (-(x : ℝ))
    have hy0 := Real.exp_pos (-(y : ℝ))
    change |Real.exp (-(x : ℝ)) - Real.exp (-(y : ℝ))| ≤ 2
    rw [abs_le]
    constructor <;> linarith)

private def expNegAlgebra : StarSubalgebra ℝ (ℝ≥0 →ᵇ ℝ) where
  toSubalgebra := (Polynomial.aeval expNeg).range
  star_mem' := by
    intro f hf
    have heq : star f = f := by ext x; simp
    simpa only [heq] using hf

private theorem expNegAlgebra_separatesPoints :
    (expNegAlgebra.map (BoundedContinuousFunction.toContinuousMapStarₐ ℝ)).SeparatesPoints := by
  intro x y hxy
  refine ⟨expNeg, ⟨expNeg.toContinuousMap, ?_, rfl⟩, ?_⟩
  · exact ⟨expNeg, ⟨Polynomial.X, Polynomial.aeval_X expNeg⟩, rfl⟩
  · intro h
    apply hxy
    apply NNReal.coe_injective
    exact neg_injective (Real.exp_injective h)

/-- On nonnegative reals, the nonnegative-integer Laplace parameters determine
a finite measure. Polynomial combinations of `exp (-x)` form a bounded
continuous algebra separating points (the finite-measure Stone-Weierstrass API). -/
theorem measure_eq_of_laplace_nat_eq (μ ν : Measure ℝ≥0)
    [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (h : ∀ n : ℕ, (∫ x, Real.exp (-(n : ℝ) * (x : ℝ)) ∂μ) =
      ∫ x, Real.exp (-(n : ℝ) * (x : ℝ)) ∂ν) : μ = ν := by
  apply ext_of_forall_mem_subalgebra_integral_eq_of_polish expNegAlgebra_separatesPoints
  intro g hg
  obtain ⟨p, rfl⟩ := hg
  change (∫ x, (Polynomial.aeval expNeg p) x ∂μ) =
    ∫ x, (Polynomial.aeval expNeg p) x ∂ν
  induction p using Polynomial.induction_on' with
  | add p q hp hq =>
    simp only [map_add, BoundedContinuousFunction.coe_add, Pi.add_apply]
    rw [integral_add ((Polynomial.aeval expNeg p).integrable μ)
      ((Polynomial.aeval expNeg q).integrable μ),
      integral_add ((Polynomial.aeval expNeg p).integrable ν)
      ((Polynomial.aeval expNeg q).integrable ν), hp, hq]
  | monomial n a =>
    simpa [Polynomial.aeval_monomial, expNeg, ← Real.exp_nat_mul, neg_mul, mul_neg,
      integral_const_mul] using congrArg (fun t : ℝ => a * t) (h n)

/-- Laplace uniqueness for arbitrary nonnegative probability laws, with no
moment assumption. M1 / Blueprint primitive Laplace interface. -/
theorem nonnegLaw_eq_of_laplace_eq (μ ν : NonnegLaw)
    (h : ∀ s : ℝ, 0 < s → laplace μ s = laplace ν s) : μ = ν := by
  let μ' := Measure.map Real.toNNReal (μ.law : Measure ℝ)
  let ν' := Measure.map Real.toNNReal (ν.law : Measure ℝ)
  have hnat (ξ : NonnegLaw) (n : ℕ) :
      (∫ x : ℝ≥0, Real.exp (-(n : ℝ) * (x : ℝ))
        ∂(Measure.map Real.toNNReal (ξ.law : Measure ℝ))) = laplace ξ n := by
    rw [integral_map (by fun_prop) (by fun_prop)]
    apply integral_congr_ae
    filter_upwards [ξ.nonneg] with x hx
    rw [Real.coe_toNNReal x hx]
  have heq : μ' = ν' := by
    apply measure_eq_of_laplace_nat_eq
    intro n
    rw [hnat, hnat]
    cases n with
    | zero => simp
    | succ n => exact h _ (by positivity)
  have hrecover (ξ : NonnegLaw) :
      Measure.map (fun x : ℝ≥0 => (x : ℝ))
        (Measure.map Real.toNNReal (ξ.law : Measure ℝ)) = (ξ.law : Measure ℝ) := by
    rw [Measure.map_map (by fun_prop) (by fun_prop)]
    calc
      _ = Measure.map id (ξ.law : Measure ℝ) := by
        apply Measure.map_congr
        filter_upwards [ξ.nonneg] with x hx
        exact Real.coe_toNNReal x hx
      _ = _ := Measure.map_id
  apply NonnegLaw.ext
  apply ProbabilityMeasure.toMeasure_injective
  rw [← hrecover μ, ← hrecover ν]
  exact congrArg (Measure.map (fun x : ℝ≥0 => (x : ℝ))) heq

end GGC
