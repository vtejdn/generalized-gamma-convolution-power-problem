import GGC.Laplace
import Mathlib.MeasureTheory.Measure.Prokhorov
import Mathlib.MeasureTheory.Measure.LevyProkhorovMetric

/-! # Narrow continuity and Laplace identification of actual nonnegative laws -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC

def boundedLaplaceTest {s : ℝ} (hs : 0 ≤ s) : BoundedContinuousFunction ℝ ℝ :=
  BoundedContinuousFunction.mkOfBound ⟨fun x => Real.exp (-s*max x 0), by fun_prop⟩ 2 (by
    intro x y
    have hx : Real.exp (-s*max x 0) ≤ 1 := Real.exp_le_one_iff.mpr
      (mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr hs) (le_max_right _ _))
    have hy : Real.exp (-s*max y 0) ≤ 1 := Real.exp_le_one_iff.mpr
      (mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr hs) (le_max_right _ _))
    change |Real.exp (-s*max x 0)-Real.exp (-s*max y 0)| ≤ 2
    rw [abs_le]
    constructor <;> linarith [Real.exp_pos (-s*max x 0), Real.exp_pos (-s*max y 0)])

theorem integral_boundedLaplaceTest (μ : NonnegLaw) {s : ℝ} (hs : 0 ≤ s) :
    (∫ x, boundedLaplaceTest hs x ∂(μ.law : Measure ℝ)) = laplace μ s := by
  apply integral_congr_ae
  filter_upwards [μ.nonneg] with x hx
  change Real.exp (-s*max x 0) = Real.exp (-s*x)
  rw [max_eq_left hx]

theorem tendsto_laplace_of_narrow {ι : Type*} {l : Filter ι} {μs : ι → NonnegLaw} {μ : NonnegLaw}
    (h : Tendsto (fun i => (μs i).law) l (𝓝 μ.law)) {s : ℝ} (hs : 0 ≤ s) :
    Tendsto (fun i => laplace (μs i) s) l (𝓝 (laplace μ s)) := by
  have ht := (ProbabilityMeasure.continuous_integral_boundedContinuousFunction
    (boundedLaplaceTest hs)).tendsto μ.law |>.comp h
  simpa only [Function.comp_def, integral_boundedLaplaceTest] using ht

theorem nonnegative_of_narrow_limit {F : ℕ → ProbabilityMeasure ℝ} {G : ProbabilityMeasure ℝ}
    (h : Tendsto F atTop (𝓝 G)) (hn : ∀ n, ∀ᵐ x ∂(F n : Measure ℝ), 0 ≤ x) :
    ∀ᵐ x ∂(G : Measure ℝ), 0 ≤ x := by
  have he : (fun n => (F n : Measure ℝ) (Iio 0)) = fun _ => 0 := by
    funext n
    have hh := hn n
    rw [ae_iff] at hh
    simpa only [not_le] using! hh
  have hp := ProbabilityMeasure.le_liminf_measure_open_of_tendsto h (isOpen_Iio (a := (0 : ℝ)))
  rw [he, liminf_const] at hp
  rw [ae_iff]
  simpa only [not_le] using! le_antisymm hp bot_le

/-- Tightness and local Laplace uniqueness identify every extracted limit.
There is no moment hypothesis on this abstract convergence theorem. -/
theorem nonnegLaw_tendsto_of_laplace_tendsto {μs : ℕ → NonnegLaw} {μ : NonnegLaw}
    (ht : IsTightMeasureSet {((μs n).law : Measure ℝ) | n : ℕ})
    (hL : ∀ s : ℝ, 0 < s → Tendsto (fun n => laplace (μs n) s) atTop (𝓝 (laplace μ s))) :
    Tendsto (fun n => (μs n).law) atTop (𝓝 μ.law) := by
  have hcomp : IsCompact (closure (range (fun n => (μs n).law))) :=
    isCompact_closure_of_isTightMeasureSet (by simpa using ht)
  apply tendsto_of_subseq_tendsto
  intro ns hns
  obtain ⟨ν, _, ms, hms, hlim⟩ := hcomp.tendsto_subseq
    (fun n => subset_closure (mem_range_self (ns n)))
  have hv : ∀ᵐ x ∂(ν : Measure ℝ), 0 ≤ x :=
    nonnegative_of_narrow_limit hlim (fun n => (μs (ns (ms n))).nonneg)
  let ρ : NonnegLaw := ⟨ν, hv⟩
  have heq : ρ = μ := nonnegLaw_eq_of_laplace_eq ρ μ (fun s hs =>
    tendsto_nhds_unique (tendsto_laplace_of_narrow (μ := ρ) (μs := fun n => μs (ns (ms n))) hlim hs.le)
      ((hL s hs).comp (hns.comp hms.tendsto_atTop)))
  have heq' : ν = μ.law := congrArg NonnegLaw.law heq
  exact ⟨ms, heq' ▸ hlim⟩

end GGC
