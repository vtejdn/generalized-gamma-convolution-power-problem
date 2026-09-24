import GGC.LogRate.EulerLimitCurve
import GGC.Foundations.MeshIntegral
import Mathlib.Topology.Order.ProjIcc

/-! # Vanishing finite-horizon meshes and continuous-time parameter adapters -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.LogRate
open GGC.Analysis

def massAt (B₀ : PosReal) (t : ℝ) : PosReal :=
  ⟨B₀.val*Real.exp (-t), mul_pos B₀.property (Real.exp_pos _)⟩

theorem continuous_massAt (B₀ : PosReal) : Continuous (massAt B₀) := by
  unfold massAt
  fun_prop

theorem massAt_mem_Icc (B₀ : PosReal) {t T : ℝ} (ht : t ∈ Icc 0 T) :
    (massAt B₀ t).val ∈ Icc (B₀.val*Real.exp (-T)) B₀.val := by
  constructor
  · exact mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr (neg_le_neg ht.2)) B₀.property.le
  · have he : Real.exp (-t) ≤ 1 := Real.exp_le_one_iff.mpr (neg_nonpos.mpr ht.1)
    simpa only [massAt, mul_one] using! mul_le_mul_of_nonneg_left he B₀.property.le

theorem eulerMass_eq_massAt (h : EulerStep) (B₀ : PosReal) (n : ℕ) :
    eulerMass h B₀ n = massAt B₀ ((n : ℝ)*h.val) := by
  apply Subtype.ext
  simp [eulerMass, massAt, neg_mul]

def meshLeftTime (h : EulerStep) {T : ℝ} (t : Icc (0 : ℝ) T) : Icc (0 : ℝ) T :=
  ⟨(meshIndex h.val t.val : ℝ)*h.val,
    mul_nonneg (Nat.cast_nonneg _) h.property.1.le,
    (meshIndex_time_le h.property.1 t.property.1).trans t.property.2⟩

theorem meshLeftTime_tendsto {ι : Type*} {l : Filter ι} {h : ι → EulerStep}
    (hh : Tendsto (fun i => (h i).val) l (𝓝 0)) {T : ℝ} (t : Icc (0 : ℝ) T) :
    Tendsto (fun i => meshLeftTime (h i) t) l (𝓝 t) := by
  apply tendsto_subtype_rng.mpr
  apply tendsto_iff_norm_sub_tendsto_zero.mpr
  apply squeeze_zero (fun _ => norm_nonneg _) (fun i => ?_) hh
  change |(meshIndex (h i).val t.val : ℝ)*(h i).val-t.val| ≤ (h i).val
  rw [abs_sub_comm, abs_of_nonneg (sub_nonneg.mpr (meshIndex_time_le (h i).property.1 t.property.1))]
  linarith [time_lt_meshIndex_succ (t := t.val) (h i).property.1]

def extendEulerCurve {T : ℝ} (hT : 0 ≤ T) (g : C(Icc (0 : ℝ) T, ProbabilityMeasure ℝ)) :
    C(ℝ, ProbabilityMeasure ℝ) := g.comp ⟨projIcc 0 T hT, continuous_projIcc⟩

@[simp] theorem extendEulerCurve_on_interval {T : ℝ} (hT : 0 ≤ T)
    (g : C(Icc (0 : ℝ) T, ProbabilityMeasure ℝ)) (t : Icc (0 : ℝ) T) :
    extendEulerCurve hT g t.val = g t := by
  simp [extendEulerCurve, projIcc_val]

/-- The subdivisions tend to infinity and every step has exactly the form `T/N`. -/
def eulerSubdivisions (T : PosReal) (n : ℕ) : ℕ := ⌈16*T.val⌉₊+n+1

theorem eulerSubdivisions_pos (T : PosReal) (n : ℕ) : 0 < eulerSubdivisions T n := by
  unfold eulerSubdivisions
  omega

def eulerStepSequence (T : PosReal) (n : ℕ) : EulerStep :=
  ⟨T.val/(eulerSubdivisions T n : ℝ),
    div_pos T.property (by exact_mod_cast eulerSubdivisions_pos T n), by
      rw [div_le_iff₀ (by exact_mod_cast eulerSubdivisions_pos T n : 0 < (eulerSubdivisions T n : ℝ))]
      have hc := Nat.le_ceil (16*T.val)
      simp only [eulerSubdivisions, Nat.cast_add, Nat.cast_one]
      nlinarith [show (0 : ℝ) ≤ (n : ℝ) from Nat.cast_nonneg n]⟩

theorem eulerStepSequence_tendsto_zero (T : PosReal) :
    Tendsto (fun n => (eulerStepSequence T n).val) atTop (𝓝 0) := by
  have hn : Tendsto (eulerSubdivisions T) atTop atTop := by
    apply tendsto_atTop_mono (fun n => by dsimp [eulerSubdivisions]; omega) tendsto_id
  exact (tendsto_const_div_atTop_nhds_zero_nat T.val).comp hn

end GGC.LogRate
