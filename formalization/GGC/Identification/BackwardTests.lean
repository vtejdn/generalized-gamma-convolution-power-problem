import GGC.Foundations.JointProbabilityIntegral
import Mathlib.Analysis.Calculus.Deriv.Support
import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Topology.Algebra.ConstMulAction
import Mathlib.Topology.ContinuousMap.BoundedCompactlySupported

/-! # Backward dilation tests and their actual probability pairings -/

noncomputable section
open MeasureTheory Set Filter
namespace GGC.Identification
open GGC.Analysis

def backwardTest (T : ℝ) (ζ : ℝ → ℝ) (u z : ℝ) : ℝ := ζ (Real.exp (T-u)*z)

def backwardDerivative (T : ℝ) (ζ : ℝ → ℝ) (u z : ℝ) : ℝ :=
  -(Real.exp (T-u)*z*deriv ζ (Real.exp (T-u)*z))

theorem contDiff_backwardTest (T : ℝ) {ζ : ℝ → ℝ} (hζ : ContDiff ℝ 1 ζ) (u : ℝ) :
    ContDiff ℝ 1 (backwardTest T ζ u) := hζ.comp (contDiff_const.mul contDiff_id)

theorem hasCompactSupport_backwardTest (T : ℝ) {ζ : ℝ → ℝ} (hs : HasCompactSupport ζ) (u : ℝ) :
    HasCompactSupport (backwardTest T ζ u) := by
  change HasCompactSupport (fun z => ζ (Real.exp (T-u)*z))
  simpa only [smul_eq_mul] using! hs.comp_smul (Real.exp_ne_zero (T-u))

theorem hasDerivAt_backwardTest_time (T : ℝ) {ζ : ℝ → ℝ} (hζ : ContDiff ℝ 1 ζ) (u z : ℝ) :
    HasDerivAt (fun r => backwardTest T ζ r z) (backwardDerivative T ζ u z) u := by
  have hd := ((hζ.differentiable (by norm_num) (Real.exp (T-u)*z)).hasDerivAt).comp u
    ((((hasDerivAt_id u).const_sub T).exp).mul_const z)
  convert! hd using 1
  simp only [backwardDerivative, id_eq, mul_neg, mul_one]
  ring

theorem hasDerivAt_backwardTest_space (T : ℝ) {ζ : ℝ → ℝ} (hζ : ContDiff ℝ 1 ζ) (u z : ℝ) :
    HasDerivAt (backwardTest T ζ u) (deriv ζ (Real.exp (T-u)*z)*Real.exp (T-u)) z := by
  simpa only [id_eq, mul_one] using!
    ((hζ.differentiable (by norm_num) (Real.exp (T-u)*z)).hasDerivAt).comp z
      ((hasDerivAt_id z).const_mul (Real.exp (T-u)))

theorem backwardTest_transport_identity (T : ℝ) {ζ : ℝ → ℝ} (hζ : ContDiff ℝ 1 ζ) (u z : ℝ) :
    z*deriv (backwardTest T ζ u) z = -backwardDerivative T ζ u z := by
  rw [(hasDerivAt_backwardTest_space T hζ u z).deriv]
  dsimp only [backwardDerivative]
  ring

theorem continuous_backwardDerivative (T : ℝ) {ζ : ℝ → ℝ} (hζ : ContDiff ℝ 1 ζ) :
    Continuous (fun p : ℝ × ℝ => backwardDerivative T ζ p.1 p.2) := by
  have harg : Continuous (fun p : ℝ × ℝ => Real.exp (T-p.1)*p.2) := by fun_prop
  exact (harg.mul (hζ.continuous_deriv_one.comp harg)).neg

theorem backwardTest_derivative_bound (T : ℝ) {ζ : ℝ → ℝ} (hζ : ContDiff ℝ 1 ζ)
    (hs : HasCompactSupport ζ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ u z, |backwardTest T ζ u z| ≤ C ∧ |backwardDerivative T ζ u z| ≤ C := by
  obtain ⟨A,hA⟩ := hs.exists_bound_of_continuous hζ.continuous
  have hg : HasCompactSupport (fun z : ℝ => z*deriv ζ z) := hs.deriv.mul_left
  obtain ⟨B,hB⟩ := hg.exists_bound_of_continuous (continuous_id.mul hζ.continuous_deriv_one)
  refine ⟨|A|+|B|, by positivity, fun u z => ?_⟩
  have ha : |backwardTest T ζ u z| ≤ A := hA _
  have hb : |backwardDerivative T ζ u z| ≤ B := by
    simpa only [backwardDerivative, abs_neg, Real.norm_eq_abs] using hB (Real.exp (T-u)*z)
  exact ⟨ha.trans (by linarith [le_abs_self A,abs_nonneg B]),
    hb.trans (by linarith [le_abs_self B,abs_nonneg A])⟩

theorem continuous_backward_pairing (T : ℝ) (laws : ℝ → ProbabilityMeasure ℝ) (hlaws : Continuous laws)
    {ζ : ℝ → ℝ} (hζ : ContDiff ℝ 1 ζ) (hs : HasCompactSupport ζ) :
    Continuous (fun p : ℝ × ℝ => ∫ z, backwardDerivative T ζ p.2 z ∂(laws p.1 : Measure ℝ)) := by
  obtain ⟨C,_,hb⟩ := backwardTest_derivative_bound T hζ hs
  apply continuous_integral_bounded_joint (fun p : ℝ × ℝ => laws p.1) (hlaws.comp continuous_fst)
    (C := C)
  · exact (continuous_backwardDerivative T hζ).comp
      (show Continuous (fun p : (ℝ × ℝ) × ℝ => (p.1.2,p.2)) by fun_prop)
  · intro p z
    simpa only [Real.norm_eq_abs] using (hb p.2 z).2

theorem hasDerivAt_integral_backwardTest (T : ℝ) (μ : ProbabilityMeasure ℝ)
    {ζ : ℝ → ℝ} (hζ : ContDiff ℝ 1 ζ) (hs : HasCompactSupport ζ) (u : ℝ) :
    HasDerivAt (fun r => ∫ z, backwardTest T ζ r z ∂(μ : Measure ℝ))
      (∫ z, backwardDerivative T ζ u z ∂(μ : Measure ℝ)) u := by
  obtain ⟨C,_,hb⟩ := backwardTest_derivative_bound T hζ hs
  have hi : Integrable (backwardTest T ζ u) (μ : Measure ℝ) :=
    (integrable_const C).mono' (contDiff_backwardTest T hζ u).continuous.measurable.aestronglyMeasurable
      (Eventually.of_forall fun z => by simpa only [Real.norm_eq_abs] using (hb u z).1)
  have hd := hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (μ := (μ : Measure ℝ)) (F := fun r z => backwardTest T ζ r z)
    (F' := fun r z => backwardDerivative T ζ r z) (bound := fun _ => C)
    (s := univ) (by simp)
    (Eventually.of_forall fun r => (contDiff_backwardTest T hζ r).continuous.measurable.aestronglyMeasurable)
    hi (((continuous_backwardDerivative T hζ).comp (continuous_const.prodMk continuous_id)).measurable.aestronglyMeasurable)
    (Eventually.of_forall fun z r _ => by simpa only [Real.norm_eq_abs] using (hb r z).2)
    (integrable_const _) (Eventually.of_forall fun z r _ => hasDerivAt_backwardTest_time T hζ r z)
  exact hd.2

end GGC.Identification
