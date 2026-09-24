import Mathlib.Analysis.Normed.Group.Tannery
import Mathlib.Analysis.Normed.Module.FiniteDimension
import Mathlib.Tactic

/-! # Convergence of probability-weighted series

API-028: apply Tannery's theorem to the minimum of the varying and limiting
probability weights. This gives convergence in l¹ from coordinate convergence
and preservation of mass. Bounded test values may vary at the same time.
-/

noncomputable section
open Filter
open scoped Topology
namespace GGC.Analysis

theorem summable_probability_mul {w f : ℕ → ℝ} {C : ℝ}
    (hw : Summable w) (hw₀ : ∀ n, 0 ≤ w n) (hf : ∀ n, |f n| ≤ C) :
    Summable (fun n => w n * f n) := by
  apply (hw.mul_right C).of_norm_bounded
  intro n
  rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (hw₀ n)]
  exact mul_le_mul_of_nonneg_left (hf n) (hw₀ n)

theorem tendsto_tsum_abs_sub_probability {ι : Type*} {l : Filter ι}
    {w : ι → ℕ → ℝ} {v : ℕ → ℝ}
    (hw₀ : ∀ i n, 0 ≤ w i n) (hv₀ : ∀ n, 0 ≤ v n)
    (hw : ∀ i, HasSum (w i) 1) (hv : HasSum v 1)
    (ht : ∀ n, Tendsto (fun i => w i n) l (𝓝 (v n))) :
    Tendsto (fun i => ∑' n, |w i n - v n|) l (𝓝 0) := by
  have hm (i : ι) : Summable (fun n => min (w i n) (v n)) := by
    apply hv.summable.of_norm_bounded
    intro n
    rw [Real.norm_eq_abs, abs_of_nonneg (le_min (hw₀ i n) (hv₀ n))]
    exact min_le_right _ _
  have hmin : Tendsto (fun i => ∑' n, min (w i n) (v n)) l (𝓝 1) := by
    have h := tendsto_tsum_of_dominated_convergence
      (f := fun i n => min (w i n) (v n)) (g := v) hv.summable
      (fun n => by simpa only [min_self] using (ht n).min (tendsto_const_nhds (x := v n)))
      (Eventually.of_forall fun i n => by
        rw [Real.norm_eq_abs, abs_of_nonneg (le_min (hw₀ i n) (hv₀ n))]
        exact min_le_right _ _)
    simpa only [hv.tsum_eq] using h
  have he (i : ι) : (∑' n, |w i n - v n|) = 2 - 2 * ∑' n, min (w i n) (v n) := by
    have hab (n : ℕ) : |w i n - v n| = w i n + v n - 2 * min (w i n) (v n) := by
      rcases le_total (w i n) (v n) with h | h
      · rw [abs_of_nonpos (sub_nonpos.mpr h), min_eq_left h]
        ring
      · rw [abs_of_nonneg (sub_nonneg.mpr h), min_eq_right h]
        ring
    simp_rw [hab]
    rw [((hw i).summable.add hv.summable).tsum_sub ((hm i).mul_left 2),
      (hw i).summable.tsum_add hv.summable, tsum_mul_left, (hw i).tsum_eq, hv.tsum_eq]
    ring
  simp_rw [he]
  simpa only [mul_one, sub_self] using
    (tendsto_const_nhds (x := (2 : ℝ))).sub (hmin.const_mul 2)

theorem tendsto_probability_weighted_tsum {ι : Type*} {l : Filter ι}
    {w : ι → ℕ → ℝ} {v : ℕ → ℝ} {f : ι → ℕ → ℝ} {g : ℕ → ℝ} {C : ℝ}
    (hw₀ : ∀ i n, 0 ≤ w i n) (hv₀ : ∀ n, 0 ≤ v n)
    (hw : ∀ i, HasSum (w i) 1) (hv : HasSum v 1)
    (ht : ∀ n, Tendsto (fun i => w i n) l (𝓝 (v n)))
    (hf : ∀ n, Tendsto (fun i => f i n) l (𝓝 (g n)))
    (hbound : ∀ i n, |f i n| ≤ C) :
    Tendsto (fun i => ∑' n, w i n * f i n) l (𝓝 (∑' n, v n * g n)) := by
  have hfixed : Tendsto (fun i => ∑' n, v n * f i n) l (𝓝 (∑' n, v n * g n)) := by
    apply tendsto_tsum_of_dominated_convergence (hv.summable.mul_right C)
      (fun n => (hf n).const_mul (v n))
    exact Eventually.of_forall fun i n => by
      rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (hv₀ n)]
      exact mul_le_mul_of_nonneg_left (hbound i n) (hv₀ n)
  have hs (i : ι) : Summable (fun n => |w i n - v n|) := by
    simpa only [Real.norm_eq_abs] using ((hw i).summable.sub hv.summable).norm
  have hb (i : ι) : ‖(∑' n, w i n * f i n) - ∑' n, v n * f i n‖ ≤
      C * ∑' n, |w i n - v n| := by
    rw [← (summable_probability_mul (hw i).summable (hw₀ i) (hbound i)).tsum_sub
      (summable_probability_mul hv.summable hv₀ (hbound i))]
    apply tsum_of_norm_bounded ((hs i).hasSum.mul_left C)
    intro n
    rw [← sub_mul, Real.norm_eq_abs, abs_mul]
    exact (mul_le_mul_of_nonneg_left (hbound i n) (abs_nonneg _)).trans_eq (mul_comm _ _)
  have hd : Tendsto (fun i => (∑' n, w i n * f i n) - ∑' n, v n * f i n) l (𝓝 0) := by
    apply squeeze_zero_norm hb
    simpa only [mul_zero] using
      (tendsto_tsum_abs_sub_probability hw₀ hv₀ hw hv ht).const_mul C
  have h := hd.add hfixed
  simpa only [sub_add_cancel, zero_add] using h

end GGC.Analysis
