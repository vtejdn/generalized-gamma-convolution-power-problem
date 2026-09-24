import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Topology.UniformSpace.HeineCantor
import Mathlib.Tactic

/-! # Partition cancellation for backward weak tests -/

noncomputable section
open MeasureTheory Set Filter
open scoped BigOperators
namespace GGC.Analysis

/-- Exact cell identities and joint continuity suffice for the backward-test
argument. No derivative of the probability-valued curve is required. -/
theorem eq_endpoints_of_partition_cancellation {f : ℝ → ℝ} {P : ℝ × ℝ → ℝ}
    {T : ℝ} (hT : 0 ≤ T) (hc : ContinuousOn P (Icc 0 T ×ˢ Icc 0 T))
    (hinc : ∀ a ∈ Icc 0 T, ∀ b ∈ Icc 0 T, a ≤ b →
      f b-f a = ∫ r in a..b, P (b,r)-P (r,a)) : f T=f 0 := by
  rcases hT.eq_or_lt with rfl | hT
  · rfl
  apply sub_eq_zero.mp
  apply abs_eq_zero.mp
  apply le_antisymm ?_ (abs_nonneg _)
  apply le_of_forall_pos_le_add
  intro ε hε
  let η := ε/(T+1)
  have hη : 0 < η := div_pos hε (by linarith)
  obtain ⟨δ,hδ,hd⟩ := Metric.uniformContinuousOn_iff.mp
    ((isCompact_Icc.prod isCompact_Icc).uniformContinuousOn_of_continuous hc) η hη
  have hcell (a b : ℝ) (ha : a ∈ Icc 0 T) (hb : b ∈ Icc 0 T)
      (hab : a ≤ b) (hmesh : b-a < δ) : |f b-f a| ≤ η*(b-a) := by
    rw [hinc a ha b hb hab]
    have hbound (r : ℝ) (hr : r ∈ uIoc a b) : ‖P (b,r)-P (r,a)‖ ≤ η := by
      rw [uIoc_of_le hab] at hr
      have hrT : r ∈ Icc 0 T := ⟨ha.1.trans hr.1.le,hr.2.trans hb.2⟩
      have hdist : dist (b,r) (r,a) < δ := by
        rw [Prod.dist_eq, max_lt_iff]
        simp only [Real.dist_eq, abs_of_nonneg (sub_nonneg.mpr hr.2),
          abs_of_nonneg (sub_nonneg.mpr hr.1.le)]
        constructor <;> linarith [hr.1,hr.2]
      simpa only [Real.dist_eq, Real.norm_eq_abs] using
        (hd (b,r) ⟨hb,hrT⟩ (r,a) ⟨hrT,ha⟩ hdist).le
    have hi := intervalIntegral.norm_integral_le_of_norm_le_const hbound
    simpa only [Real.norm_eq_abs, abs_of_nonneg (sub_nonneg.mpr hab)] using hi
  obtain ⟨N,hN⟩ := exists_nat_gt (T/δ)
  have hNpos : 0 < (N : ℝ) := (div_pos hT hδ).trans hN
  let h : ℝ := T/N
  have hh : 0 < h := div_pos hT hNpos
  have hNh : (N : ℝ)*h=T := by dsimp [h]; field_simp
  have hhδ : h < δ := by
    dsimp only [h]
    apply (div_lt_iff₀ hNpos).mpr
    have hn := (div_lt_iff₀ hδ).mp hN
    linarith
  let τ : ℕ → ℝ := fun i => (i : ℝ)*h
  have hτ0 : τ 0=0 := by simp [τ]
  have hτN : τ N=T := hNh
  have hτ (i : ℕ) (hi : i ≤ N) : τ i ∈ Icc 0 T := by
    refine ⟨mul_nonneg (Nat.cast_nonneg _) hh.le, ?_⟩
    exact (mul_le_mul_of_nonneg_right (Nat.cast_le.mpr hi) hh.le).trans_eq hNh
  have hstep (i : ℕ) : τ (i+1)-τ i=h := by dsimp [τ]; push_cast; ring
  have hsum : (∑ i ∈ Finset.range N, (f (τ (i+1))-f (τ i))) = f T-f 0 := by
    simpa only [hτN,hτ0] using Finset.sum_range_sub (fun i => f (τ i)) N
  calc
    |f T-f 0| = |∑ i ∈ Finset.range N, (f (τ (i+1))-f (τ i))| := congrArg abs hsum.symm
    _ ≤ ∑ i ∈ Finset.range N, |f (τ (i+1))-f (τ i)| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _i ∈ Finset.range N, η*h := by
      apply Finset.sum_le_sum
      intro i hi
      have hiN := Finset.mem_range.mp hi
      have hle : τ i ≤ τ (i+1) := by linarith [hstep i]
      simpa only [hstep] using hcell (τ i) (τ (i+1)) (hτ i hiN.le) (hτ (i+1) hiN)
        hle (by rw [hstep]; exact hhδ)
    _ = η*T := by simp only [Finset.sum_const, Finset.card_range, nsmul_eq_mul]; rw [← hNh]; ring
    _ ≤ 0+ε := by
      dsimp only [η]
      rw [zero_add]
      rw [div_mul_eq_mul_div]
      apply (div_le_iff₀ (show 0 < T+1 by linarith)).mpr
      nlinarith

end GGC.Analysis
