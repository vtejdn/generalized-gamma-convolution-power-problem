import GGC.Foundations.LinearInterpolation
import Mathlib.MeasureTheory.Function.Floor
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic

/-! # Exact time integrals of left-mesh functions and the final-cell error -/

noncomputable section
open MeasureTheory Set Filter
open scoped BigOperators
namespace GGC.Analysis

def meshStep (h : ℝ) (a : ℕ → ℝ) (t : ℝ) : ℝ := a (meshIndex h t)

theorem measurable_meshStep (h : ℝ) (a : ℕ → ℝ) : Measurable (meshStep h a) :=
  (measurable_of_countable a).comp ((measurable_id.div_const h).nat_floor)

theorem meshIndex_eq_on_cell {h t : ℝ} (hh : 0 < h) (n : ℕ)
    (ht : t ∈ Ico ((n : ℝ)*h) (((n : ℝ)+1)*h)) : meshIndex h t = n := by
  have ht0 : 0 ≤ t := (mul_nonneg (Nat.cast_nonneg n) hh.le).trans ht.1
  exact (Nat.floor_eq_iff (div_nonneg ht0 hh.le)).mpr
    ⟨(le_div_iff₀ hh).mpr ht.1, (div_lt_iff₀ hh).mpr ht.2⟩

theorem meshStep_ae_eq_cell {h : ℝ} (hh : 0 < h) (a : ℕ → ℝ) (n : ℕ) :
    meshStep h a =ᵐ[volume.restrict (Ico ((n : ℝ)*h) (((n : ℝ)+1)*h))] fun _ => a n := by
  filter_upwards [ae_restrict_mem measurableSet_Ico] with t ht
  exact congrArg a (meshIndex_eq_on_cell hh n ht)

theorem intervalIntegrable_meshStep_cell {h : ℝ} (hh : 0 < h) (a : ℕ → ℝ) (n : ℕ) :
    IntervalIntegrable (meshStep h a) volume ((n : ℝ)*h) (((n : ℝ)+1)*h) := by
  rw [intervalIntegrable_iff_integrableOn_Ico_of_le (by nlinarith : (n : ℝ)*h ≤ ((n : ℝ)+1)*h)]
  exact (integrable_congr (meshStep_ae_eq_cell hh a n)).mpr
    (integrableOn_const (by simp [Real.volume_Ico]))

theorem integral_meshStep_cell {h : ℝ} (hh : 0 < h) (a : ℕ → ℝ) (n : ℕ) :
    (∫ t in (n : ℝ)*h..((n : ℝ)+1)*h, meshStep h a t) = h*a n := by
  have hle : (n : ℝ)*h ≤ ((n : ℝ)+1)*h := by nlinarith
  calc
    _ = ∫ _t in (n : ℝ)*h..((n : ℝ)+1)*h, a n := by
      simp only [intervalIntegral.integral_of_le hle, ← integral_Ico_eq_integral_Ioc]
      exact integral_congr_ae (meshStep_ae_eq_cell hh a n)
    _ = _ := by rw [intervalIntegral.integral_const]; simp only [smul_eq_mul]; ring

theorem integral_meshStep_upto {h : ℝ} (hh : 0 < h) (a : ℕ → ℝ) (n : ℕ) :
    (∫ t in 0..(n : ℝ)*h, meshStep h a t) = h*∑ j ∈ Finset.range n, a j := by
  have he := intervalIntegral.sum_integral_adjacent_intervals (a := fun j : ℕ => (j : ℝ)*h)
    (n := n) (fun j _ => by
      simpa only [Nat.cast_add, Nat.cast_one] using intervalIntegrable_meshStep_cell hh a j)
  simp only [Nat.cast_zero, zero_mul, Nat.cast_add, Nat.cast_one, integral_meshStep_cell hh a] at he
  rw [← he, Finset.mul_sum]

theorem intervalIntegrable_meshStep_of_bound {h t C : ℝ} (ht : 0 ≤ t) (a : ℕ → ℝ)
    (hb : ∀ r ∈ Icc 0 t, |meshStep h a r| ≤ C) :
    IntervalIntegrable (meshStep h a) volume 0 t := by
  rw [intervalIntegrable_iff_integrableOn_Icc_of_le ht]
  apply (integrableOn_const (C := C) (s := Icc 0 t) (μ := volume) (by simp [Real.volume_Icc])).mono'
    (measurable_meshStep h a).aestronglyMeasurable
  filter_upwards [ae_restrict_mem measurableSet_Icc] with r hr
  exact hb r hr

/-- The integral up to an arbitrary time differs from the mesh sum only on the last cell. -/
theorem abs_integral_meshStep_sub_sum_le {h t C : ℝ} (hh : 0 < h) (ht : 0 ≤ t)
    (hC : 0 ≤ C) (a : ℕ → ℝ) (hb : ∀ r ∈ Icc 0 t, |meshStep h a r| ≤ C) :
    |(∫ r in 0..t, meshStep h a r)-h*∑ j ∈ Finset.range (meshIndex h t), a j| ≤ h*C := by
  have hm0 : 0 ≤ (meshIndex h t : ℝ)*h := mul_nonneg (Nat.cast_nonneg _) hh.le
  have hmt := meshIndex_time_le hh ht
  have him := intervalIntegrable_meshStep_of_bound hm0 a
    (fun r hr => hb r ⟨hr.1, hr.2.trans hmt⟩)
  have hit := intervalIntegrable_meshStep_of_bound ht a hb
  rw [← integral_meshStep_upto hh a,
    intervalIntegral.integral_interval_sub_left hit him]
  have hn := intervalIntegral.norm_integral_le_of_norm_le_const
    (a := (meshIndex h t : ℝ)*h) (b := t) (C := C) (f := meshStep h a) (fun r hr => by
      rw [uIoc_of_le hmt] at hr
      exact hb r ⟨hm0.trans hr.1.le, hr.2⟩)
  simp only [Real.norm_eq_abs, abs_of_nonneg (sub_nonneg.mpr hmt)] at hn
  have hlast : t-(meshIndex h t : ℝ)*h ≤ h := by linarith [time_lt_meshIndex_succ (t := t) hh]
  exact hn.trans ((mul_le_mul_of_nonneg_left hlast hC).trans_eq (mul_comm C h))

end GGC.Analysis
