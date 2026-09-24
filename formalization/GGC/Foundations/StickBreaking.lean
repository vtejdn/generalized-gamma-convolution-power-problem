import GGC.Foundations.Posterior
import Mathlib.Analysis.SpecialFunctions.Pow.NNReal
import Mathlib.MeasureTheory.Constructions.UnitInterval
import Mathlib.Topology.Algebra.InfiniteSum.ENNReal

/-! # Concrete stick-breaking measures and the parameter-independent event

This file contains only deterministic measure semantics and local proofs.
Distributional assertions about independent beta fractions belong to E-T1.
In particular no independence of the resulting weights is asserted.
-/

noncomputable section
open MeasureTheory Set Filter Topology
open scoped BigOperators ENNReal
namespace GGC.RandomMeasure

def stickResidual (V : ℕ → UnitWeight) (n : ℕ) : ℝ :=
  ∏ i ∈ Finset.range n, (1 - (V i).val)

def stickWeight (V : ℕ → UnitWeight) (n : ℕ) : ℝ :=
  (V n).val * stickResidual V n

theorem stickResidual_nonneg (V : ℕ → UnitWeight) (n : ℕ) : 0 ≤ stickResidual V n :=
  Finset.prod_nonneg fun i _ => sub_nonneg.mpr (V i).property.2

theorem stickWeight_nonneg (V : ℕ → UnitWeight) (n : ℕ) : 0 ≤ stickWeight V n :=
  mul_nonneg (V n).property.1 (stickResidual_nonneg V n)

theorem sum_stickWeight (V : ℕ → UnitWeight) (n : ℕ) :
    ∑ i ∈ Finset.range n, stickWeight V i = 1 - stickResidual V n := by
  induction n with
  | zero => simp [stickResidual]
  | succ n ih =>
    rw [Finset.sum_range_succ, ih]
    simp only [stickWeight, stickResidual, Finset.prod_range_succ]
    ring

theorem hasSum_stickWeight_iff (V : ℕ → UnitWeight) :
    HasSum (stickWeight V) 1 ↔ Tendsto (stickResidual V) atTop (𝓝 0) := by
  rw [hasSum_iff_tendsto_nat_of_nonneg (stickWeight_nonneg V)]
  simp only [sum_stickWeight]
  constructor
  · intro h
    have := (tendsto_const_nhds (x := (1 : ℝ))).sub h
    simpa using this
  · intro h
    simpa using (tendsto_const_nhds (x := (1 : ℝ))).sub h

@[fun_prop] theorem measurable_stickResidual (n : ℕ) :
    Measurable (fun V : ℕ → UnitWeight => stickResidual V n) := by
  unfold stickResidual
  fun_prop

@[fun_prop] theorem measurable_stickWeight (n : ℕ) :
    Measurable (fun V : ℕ → UnitWeight => stickWeight V n) := by
  unfold stickWeight
  fun_prop

/-- The prescribed common-uniform fraction, with endpoints defined everywhere. -/
def uniformBreak (B : {b : ℝ // 0 < b}) (u : UnitWeight) : UnitWeight :=
  ⟨1 - u.val ^ (1 / B.val), sub_nonneg.mpr
      (Real.rpow_le_one u.property.1 u.property.2 (one_div_nonneg.mpr B.property.le)),
    sub_le_self _ (Real.rpow_nonneg u.property.1 _)⟩

@[fun_prop] theorem measurable_uniformBreak :
    Measurable (fun x : {b : ℝ // 0 < b} × UnitWeight => uniformBreak x.1 x.2) := by
  unfold uniformBreak
  fun_prop

theorem stickResidual_uniformBreak (B : {b : ℝ // 0 < b}) (T : ℕ → UnitWeight) (n : ℕ) :
    stickResidual (fun i => uniformBreak B (T i)) n =
      (∏ i ∈ Finset.range n, (T i).val) ^ (1 / B.val) := by
  simp only [stickResidual, uniformBreak, sub_sub_cancel]
  exact Real.finsetProd_rpow _ _ (fun i _ => (T i).property.1) _

/-- One event, independent of both mass and base probability. -/
def stickCommonEvent : Set (ℕ → UnitWeight) :=
  {T | Tendsto (fun n => ∏ i ∈ Finset.range n, (T i).val) atTop (𝓝 0)}

theorem measurableSet_stickCommonEvent : MeasurableSet stickCommonEvent :=
  measurableSet_tendsto (𝓝 (0 : ℝ)) (fun n => by fun_prop)

theorem hasSum_uniformBreak_on_commonEvent {T : ℕ → UnitWeight} (hT : T ∈ stickCommonEvent)
    (B : {b : ℝ // 0 < b}) : HasSum (stickWeight (fun i => uniformBreak B (T i))) 1 := by
  rw [hasSum_stickWeight_iff]
  change Tendsto (fun n => stickResidual (fun i => uniformBreak B (T i)) n) atTop (𝓝 0)
  simp_rw [stickResidual_uniformBreak]
  have hpow : ContinuousAt (fun x : ℝ => x ^ (1 / B.val)) 0 :=
    Real.continuousAt_rpow_const _ _ (Or.inr (one_div_nonneg.mpr B.property.le))
  simpa only [Function.comp_def, Real.zero_rpow (ne_of_gt (one_div_pos.mpr B.property))]
    using hpow.tendsto.comp hT

variable {E : Type*} [MeasurableSpace E]

def stickMeasure (V : ℕ → UnitWeight) (Y : ℕ → E) : Measure E :=
  Measure.sum (fun i => ENNReal.ofReal (stickWeight V i) • Measure.dirac (Y i))

theorem stickMeasure_univ (V : ℕ → UnitWeight) (Y : ℕ → E)
    (hV : HasSum (stickWeight V) 1) : stickMeasure V Y univ = 1 := by
  simp only [stickMeasure, Measure.sum_apply _ MeasurableSet.univ, Measure.smul_apply,
    Measure.dirac_apply_of_mem (mem_univ _), smul_eq_mul, mul_one]
  rw [← ENNReal.ofReal_tsum_of_nonneg (stickWeight_nonneg V) hV.summable, hV.tsum_eq]
  simp

def stickProbability (V : ℕ → UnitWeight) (Y : ℕ → E)
    (hV : HasSum (stickWeight V) 1) : ProbabilityMeasure E :=
  ⟨stickMeasure V Y, ⟨stickMeasure_univ V Y hV⟩⟩

theorem measurable_stickMeasure :
    Measurable (fun x : (ℕ → UnitWeight) × (ℕ → E) => stickMeasure x.1 x.2) := by
  apply Measure.measurable_of_measurable_coe
  intro s hs
  simp only [stickMeasure, Measure.sum_apply _ hs, Measure.smul_apply, smul_eq_mul]
  apply Measurable.tsum
  intro i
  exact ((measurable_stickWeight i).comp measurable_fst).ennreal_ofReal.mul
    ((Measure.measurable_coe hs).comp (Measure.measurable_dirac.comp
      ((measurable_pi_apply i).comp measurable_snd)))

end GGC.RandomMeasure
