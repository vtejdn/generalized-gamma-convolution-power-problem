import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Topology.Algebra.Support
import Mathlib.Topology.Order.Compact
import Mathlib.Tactic

/-! # Smooth compact tests across the logarithmic coordinate endpoints -/

noncomputable section
open Set Filter
open scoped Topology ContDiff
namespace GGC.Analysis

theorem contDiff_comp_neg_log {H : ℝ → ℝ} {n : ℕ∞ω} (hH : ContDiff ℝ n H)
    (hs : HasCompactSupport H) (h0 : H 0 = 0) :
    ContDiff ℝ n (fun u => H (-Real.log u)) := by
  rw [contDiff_iff_contDiffAt]
  intro u
  by_cases hu : u = 0
  · subst u
    have htop : ∀ᶠ r : ℝ in atTop, H r = 0 :=
      (hasCompactSupport_iff_eventuallyEq.mp hs).filter_mono
        (atTop_le_cocompact.trans cocompact_le_coclosedCompact)
    have hne : ∀ᶠ u : ℝ in 𝓝[≠] 0, H (-Real.log u) = 0 :=
      (tendsto_neg_atBot_atTop.comp Real.tendsto_log_nhdsNE_zero).eventually htop
    apply contDiffAt_const.congr_of_eventuallyEq
    change ∀ᶠ u : ℝ in 𝓝 0, H (-Real.log u) = 0
    rw [← nhdsNE_sup_pure (0 : ℝ), eventually_sup]
    exact ⟨hne, by simpa using h0⟩
  · exact hH.contDiffAt.comp u ((Real.contDiffAt_log.mpr hu).neg)

/-- The logarithmic pullback with its explicit zero value at the singular point. -/
def logValueTest (ζ : ℝ → ℝ) (x : ℝ) : ℝ := if x = 0 then 0 else ζ (Real.log x)

@[simp] theorem logValueTest_zero (ζ : ℝ → ℝ) : logValueTest ζ 0 = 0 := by simp [logValueTest]

theorem logValueTest_eventually_zero {ζ : ℝ → ℝ} (hs : HasCompactSupport ζ) :
    logValueTest ζ =ᶠ[𝓝 (0 : ℝ)] (fun _ => 0) := by
  have hbot : ∀ᶠ r : ℝ in atBot, ζ r = 0 :=
    (hasCompactSupport_iff_eventuallyEq.mp hs).filter_mono
      (atBot_le_cocompact.trans cocompact_le_coclosedCompact)
  have hne : ∀ᶠ x : ℝ in 𝓝[≠] 0, logValueTest ζ x = 0 := by
    filter_upwards [Real.tendsto_log_nhdsNE_zero.eventually hbot] with x hx
    simp only [logValueTest, hx, ite_self]
  change ∀ᶠ x : ℝ in 𝓝 0, logValueTest ζ x = 0
  rw [← nhdsNE_sup_pure (0 : ℝ), eventually_sup]
  exact ⟨hne, by simp⟩

theorem logValueTest_eventuallyEq_log {ζ : ℝ → ℝ} {x : ℝ} (hx : x ≠ 0) :
    logValueTest ζ =ᶠ[𝓝 x] (fun y => ζ (Real.log y)) := by
  filter_upwards [eventually_ne_nhds hx] with y hy
  simp only [logValueTest, if_neg hy]

theorem contDiff_logValueTest {ζ : ℝ → ℝ} {n : ℕ∞ω} (hζ : ContDiff ℝ n ζ)
    (hs : HasCompactSupport ζ) : ContDiff ℝ n (logValueTest ζ) := by
  rw [contDiff_iff_contDiffAt]
  intro x
  by_cases hx : x = 0
  · subst x
    exact contDiffAt_const.congr_of_eventuallyEq (logValueTest_eventually_zero hs)
  · exact (hζ.contDiffAt.comp x (Real.contDiffAt_log.mpr hx)).congr_of_eventuallyEq
      (logValueTest_eventuallyEq_log hx)

theorem hasCompactSupport_logValueTest {ζ : ℝ → ℝ} (hs : HasCompactSupport ζ) :
    HasCompactSupport (logValueTest ζ) := by
  have htop : ∀ᶠ r : ℝ in atTop, ζ r = 0 :=
    (hasCompactSupport_iff_eventuallyEq.mp hs).filter_mono
      (atTop_le_cocompact.trans cocompact_le_coclosedCompact)
  obtain ⟨R,hR⟩ := htop.exists_forall_of_atTop
  apply HasCompactSupport.intro (K := Icc (-Real.exp R) (Real.exp R)) isCompact_Icc
  intro x hx
  by_cases hx0 : x = 0
  · simp only [hx0, logValueTest_zero]
  · rw [logValueTest, if_neg hx0]
    have hab : Real.exp R ≤ |x| := by
      by_contra hb
      exact hx (abs_le.mp (le_of_lt (lt_of_not_ge hb)))
    have hl : R ≤ Real.log x := by
      simpa only [Real.log_exp, Real.log_abs] using Real.log_le_log (Real.exp_pos R) hab
    exact hR (Real.log x) hl

theorem hasDerivAt_logValueTest {ζ : ℝ → ℝ} (hζ : ContDiff ℝ 1 ζ) {x : ℝ} (hx : x ≠ 0) :
    HasDerivAt (logValueTest ζ) (deriv ζ (Real.log x)*x⁻¹) x := by
  exact (((hζ.differentiable (by norm_num) (Real.log x)).hasDerivAt).comp x
    (Real.hasDerivAt_log hx)).congr_of_eventuallyEq (logValueTest_eventuallyEq_log hx)

theorem mul_log_deriv_logValueTest {ζ : ℝ → ℝ} (hζ : ContDiff ℝ 1 ζ)
    {x : ℝ} (hx : x ≠ 0) :
    x*Real.log x*deriv (logValueTest ζ) x = Real.log x*deriv ζ (Real.log x) := by
  rw [(hasDerivAt_logValueTest hζ hx).deriv]
  field_simp

end GGC.Analysis
