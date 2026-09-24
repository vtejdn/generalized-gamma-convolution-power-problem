import Mathlib.Algebra.Order.Floor.Ring
import Mathlib.Topology.MetricSpace.Lipschitz
import Mathlib.Tactic

/-! # Equispaced affine interpolation and transfer of mesh-time bounds -/

noncomputable section
open Set
namespace GGC.Analysis

def meshIndex (h t : ℝ) : ℕ := ⌊t/h⌋₊
def meshFraction (h t : ℝ) : ℝ := t/h-(meshIndex h t : ℝ)

theorem meshFraction_mem_Ico {h t : ℝ} (hh : 0 < h) (ht : 0 ≤ t) :
    meshFraction h t ∈ Ico (0 : ℝ) 1 := by
  have hlo := Nat.floor_le (div_nonneg ht hh.le)
  have hhi := Nat.lt_floor_add_one (t/h)
  change 0 ≤ t/h-(⌊t/h⌋₊ : ℝ) ∧ t/h-(⌊t/h⌋₊ : ℝ) < 1
  constructor <;> linarith

theorem meshIndex_time_le {h t : ℝ} (hh : 0 < h) (ht : 0 ≤ t) :
    (meshIndex h t : ℝ)*h ≤ t := by
  exact (le_div_iff₀ hh).mp (Nat.floor_le (div_nonneg ht hh.le))

theorem time_lt_meshIndex_succ {h t : ℝ} (hh : 0 < h) :
    t < ((meshIndex h t : ℝ)+1)*h := by
  exact (div_lt_iff₀ hh).mp (Nat.lt_floor_add_one (t/h))

theorem meshFraction_mul {h t : ℝ} (hh : 0 < h) :
    meshFraction h t*h = t-(meshIndex h t : ℝ)*h := by
  dsimp [meshFraction]
  field_simp

theorem meshIndex_mono {h s t : ℝ} (hh : 0 < h) (hst : s ≤ t) :
    meshIndex h s ≤ meshIndex h t := Nat.floor_mono (div_le_div_of_nonneg_right hst hh.le)

def linearInterpolate (h : ℝ) (a : ℕ → ℝ) (t : ℝ) : ℝ :=
  (1-meshFraction h t)*a (meshIndex h t) + meshFraction h t*a (meshIndex h t+1)

@[simp] theorem linearInterpolate_mesh {h : ℝ} (hh : 0 < h) (a : ℕ → ℝ) (n : ℕ) :
    linearInterpolate h a ((n : ℝ)*h) = a n := by
  simp [linearInterpolate, meshIndex, meshFraction, ne_of_gt hh]

theorem abs_linearInterpolate_sub_left {h t L : ℝ} (hh : 0 < h) (ht : 0 ≤ t)
    (a : ℕ → ℝ) (ha : |a (meshIndex h t+1)-a (meshIndex h t)| ≤ h*L) :
    |linearInterpolate h a t-a (meshIndex h t)| ≤ (t-(meshIndex h t : ℝ)*h)*L := by
  have hf := (meshFraction_mem_Ico hh ht).1
  calc
    _ = |meshFraction h t * (a (meshIndex h t+1)-a (meshIndex h t))| := by
      congr 1; dsimp [linearInterpolate]; ring
    _ = meshFraction h t * |a (meshIndex h t+1)-a (meshIndex h t)| := by
      rw [abs_mul, abs_of_nonneg hf]
    _ ≤ meshFraction h t * (h*L) := mul_le_mul_of_nonneg_left ha hf
    _ = _ := by rw [← mul_assoc, meshFraction_mul hh]

theorem abs_linearInterpolate_sub_right {h t L : ℝ} (hh : 0 < h) (ht : 0 ≤ t)
    (a : ℕ → ℝ) (ha : |a (meshIndex h t+1)-a (meshIndex h t)| ≤ h*L) :
    |linearInterpolate h a t-a (meshIndex h t+1)| ≤ (((meshIndex h t : ℝ)+1)*h-t)*L := by
  have hf : 0 ≤ 1-meshFraction h t := by linarith [(meshFraction_mem_Ico hh ht).2]
  calc
    _ = |(1-meshFraction h t) * (a (meshIndex h t)-a (meshIndex h t+1))| := by
      congr 1; dsimp [linearInterpolate]; ring
    _ = (1-meshFraction h t) * |a (meshIndex h t+1)-a (meshIndex h t)| := by
      rw [abs_mul, abs_of_nonneg hf, abs_sub_comm]
    _ ≤ (1-meshFraction h t) * (h*L) := mul_le_mul_of_nonneg_left ha hf
    _ = (h-meshFraction h t*h)*L := by ring
    _ = _ := by rw [meshFraction_mul hh]; ring

/-- Linear interpolation preserves the mesh Lipschitz bound, also across mesh boundaries. -/
theorem abs_linearInterpolate_sub_le {h s t L : ℝ} (hh : 0 < h) (hs : 0 ≤ s) (hst : s ≤ t)
    (a : ℕ → ℝ)
    (ha : ∀ i j : ℕ, i ≤ j → j ≤ meshIndex h t+1 →
      |a j-a i| ≤ ((j : ℝ)*h-(i : ℝ)*h)*L) :
    |linearInterpolate h a t-linearInterpolate h a s| ≤ (t-s)*L := by
  have hij := meshIndex_mono hh hst
  have hai : |a (meshIndex h s+1)-a (meshIndex h s)| ≤ h*L := by
    simpa only [Nat.cast_add, Nat.cast_one, add_mul, one_mul, add_sub_cancel_left] using
      ha (meshIndex h s) (meshIndex h s+1) (Nat.le_succ _) (Nat.add_le_add_right hij 1)
  have haj : |a (meshIndex h t+1)-a (meshIndex h t)| ≤ h*L := by
    simpa only [Nat.cast_add, Nat.cast_one, add_mul, one_mul, add_sub_cancel_left] using
      ha (meshIndex h t) (meshIndex h t+1) (Nat.le_succ _) le_rfl
  by_cases heq : meshIndex h s = meshIndex h t
  · have hd : linearInterpolate h a t-linearInterpolate h a s =
        ((t-s)/h)*(a (meshIndex h t+1)-a (meshIndex h t)) := by
      simp only [linearInterpolate, meshFraction, heq]
      ring
    rw [hd, abs_mul, abs_of_nonneg (div_nonneg (sub_nonneg.mpr hst) hh.le)]
    calc
      _ ≤ ((t-s)/h)*(h*L) := mul_le_mul_of_nonneg_left haj
        (div_nonneg (sub_nonneg.mpr hst) hh.le)
      _ = _ := by field_simp
  · have hij' : meshIndex h s+1 ≤ meshIndex h t := Nat.succ_le_of_lt (lt_of_le_of_ne hij heq)
    have hmid := ha (meshIndex h s+1) (meshIndex h t) hij' (Nat.le_succ _)
    have hi := abs_linearInterpolate_sub_right hh hs a hai
    have hj := abs_linearInterpolate_sub_left hh (hs.trans hst) a haj
    have ht₁ := abs_sub_le (linearInterpolate h a t) (a (meshIndex h t)) (linearInterpolate h a s)
    have ht₂ := abs_sub_le (a (meshIndex h t)) (a (meshIndex h s+1)) (linearInterpolate h a s)
    rw [abs_sub_comm (a (meshIndex h s+1))] at ht₂
    simp only [Nat.cast_add, Nat.cast_one] at hmid
    linarith

end GGC.Analysis
