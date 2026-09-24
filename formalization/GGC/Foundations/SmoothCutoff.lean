import Mathlib.Analysis.Calculus.BumpFunction.FiniteDimension
import Mathlib.Analysis.Calculus.Deriv.Support
import Mathlib.Topology.Algebra.ConstMulAction
import Mathlib.Tactic

/-! # Scaled smooth cutoffs for the weak test domain -/

noncomputable section
open Set Filter
open scoped Topology
namespace GGC.Analysis

def unitBump : ContDiffBump (0 : ℝ) := ⟨1, 2, by norm_num, by norm_num⟩

def smoothCutoff (R x : ℝ) : ℝ := unitBump (x/R)

theorem contDiff_smoothCutoff (R : ℝ) {n : ℕ∞} : ContDiff ℝ n (smoothCutoff R) :=
  unitBump.contDiff.comp (contDiff_id.div_const R)

theorem smoothCutoff_nonneg (R x : ℝ) : 0 ≤ smoothCutoff R x := unitBump.nonneg

theorem smoothCutoff_le_one (R x : ℝ) : smoothCutoff R x ≤ 1 := unitBump.le_one

theorem hasCompactSupport_smoothCutoff {R : ℝ} (hR : 0 < R) : HasCompactSupport (smoothCutoff R) := by
  have h := unitBump.hasCompactSupport.comp_smul (inv_ne_zero hR.ne')
  simpa only [smul_eq_mul, smoothCutoff, div_eq_mul_inv, mul_comm] using! h

theorem smoothCutoff_eq_one {R x : ℝ} (hR : 0 < R) (hx : |x| ≤ R) : smoothCutoff R x = 1 := by
  apply unitBump.one_of_mem_closedBall
  change dist (x/R) 0 ≤ 1
  rw [Real.dist_eq, sub_zero, abs_div, abs_of_pos hR]
  exact (div_le_one hR).mpr hx

theorem smoothCutoff_eventuallyEq_one {R x : ℝ} (hx : |x| < R) :
    smoothCutoff R =ᶠ[𝓝 x] 1 := by
  have hR : 0 < R := (abs_nonneg x).trans_lt hx
  filter_upwards [(continuous_abs.continuousAt.eventually_lt continuousAt_const hx)] with y hy
  exact smoothCutoff_eq_one hR hy.le

theorem smoothCutoff_eq_zero {R x : ℝ} (hR : 0 < R) (hx : 2*R ≤ |x|) : smoothCutoff R x = 0 := by
  apply unitBump.zero_of_le_dist
  change 2 ≤ dist (x/R) 0
  rw [Real.dist_eq, sub_zero, abs_div, abs_of_pos hR]
  exact (le_div_iff₀ hR).mpr hx

theorem smoothCutoff_eventuallyEq_zero {R x : ℝ} (hR : 0 < R) (hx : 2*R < |x|) :
    smoothCutoff R =ᶠ[𝓝 x] 0 := by
  filter_upwards [continuousAt_const.eventually_lt continuous_abs.continuousAt hx] with y hy
  exact smoothCutoff_eq_zero hR hy.le

theorem hasDerivAt_smoothCutoff (R x : ℝ) :
    HasDerivAt (smoothCutoff R) (deriv (unitBump : ℝ → ℝ) (x/R)/R) x := by
  have hb : DifferentiableAt ℝ (unitBump : ℝ → ℝ) (x/R) :=
    (unitBump.contDiff : ContDiff ℝ 1 _).differentiable (by norm_num) _
  convert! hb.hasDerivAt.comp x ((hasDerivAt_id x).div_const R) using 1
  simp [div_eq_mul_inv]

theorem deriv_smoothCutoff (R x : ℝ) :
    deriv (smoothCutoff R) x = deriv (unitBump : ℝ → ℝ) (x/R)/R :=
  (hasDerivAt_smoothCutoff R x).deriv

theorem deriv_deriv_smoothCutoff (R x : ℝ) :
    deriv (deriv (smoothCutoff R)) x = deriv (deriv (unitBump : ℝ → ℝ)) (x/R)/R^2 := by
  have hb : DifferentiableAt ℝ (deriv (unitBump : ℝ → ℝ)) (x/R) :=
    ((unitBump.contDiff : ContDiff ℝ 2 _).deriv' : ContDiff ℝ 1 _).differentiable (by norm_num) _
  have he : deriv (smoothCutoff R) = fun y => deriv (unitBump : ℝ → ℝ) (y/R)/R :=
    funext (deriv_smoothCutoff R)
  have hd : HasDerivAt (fun y => deriv (unitBump : ℝ → ℝ) (y/R)/R)
      ((deriv (deriv (unitBump : ℝ → ℝ)) (x/R)*(1/R))/R) x := by
    simpa only [Function.comp_def, id_eq] using
      (hb.hasDerivAt.comp x ((hasDerivAt_id x).div_const R)).div_const R
  rw [he, hd.deriv]
  ring

def cutoffTest (R : ℝ) (φ : ℝ → ℝ) (x : ℝ) : ℝ := smoothCutoff R x * φ x

theorem contDiff_cutoffTest {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) (R : ℝ) :
    ContDiff ℝ 2 (cutoffTest R φ) := (contDiff_smoothCutoff R).mul hφ

theorem hasCompactSupport_cutoffTest (φ : ℝ → ℝ) {R : ℝ} (hR : 0 < R) :
    HasCompactSupport (cutoffTest R φ) := (hasCompactSupport_smoothCutoff hR).mul_right

theorem cutoffTest_eventuallyEq {φ : ℝ → ℝ} {R x : ℝ} (hx : |x| < R) :
    cutoffTest R φ =ᶠ[𝓝 x] φ := by
  filter_upwards [smoothCutoff_eventuallyEq_one hx] with y hy
  change smoothCutoff R y*φ y = φ y
  rw [hy, Pi.one_apply, one_mul]

theorem cutoffTest_eq {φ : ℝ → ℝ} {R x : ℝ} (hx : |x| < R) : cutoffTest R φ x = φ x :=
  (cutoffTest_eventuallyEq hx).eq_of_nhds

theorem deriv_cutoffTest_eq {φ : ℝ → ℝ} {R x : ℝ} (hx : |x| < R) :
    deriv (cutoffTest R φ) x = deriv φ x := (cutoffTest_eventuallyEq hx).deriv_eq

theorem cutoffTest_eventually_eventuallyEq (φ : ℝ → ℝ) (x : ℝ) :
    ∀ᶠ R : ℝ in atTop, cutoffTest R φ =ᶠ[𝓝 x] φ :=
  (eventually_gt_atTop |x|).mono fun _ hR => cutoffTest_eventuallyEq hR

theorem abs_cutoffTest_le (φ : ℝ → ℝ) (R x : ℝ) : |cutoffTest R φ x| ≤ |φ x| := by
  rw [cutoffTest, abs_mul, abs_of_nonneg (smoothCutoff_nonneg R x)]
  exact mul_le_of_le_one_left (abs_nonneg _) (smoothCutoff_le_one R x)

end GGC.Analysis
