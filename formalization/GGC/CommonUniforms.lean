import GGC.Foundations.StickBreaking
import Mathlib.Probability.Independence.InfinitePi
import Mathlib.Probability.Independence.Integration
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic

/-! # A fixed uniform sequence and a common probability-one event

The exceptional set is independent of every mass and base parameter.
Its nullity is proved locally from the summable expectations of residual
products. No literature input or parameter-dependent intersection is used.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Topology
open scoped BigOperators ENNReal
namespace GGC
open RandomMeasure

def uniformSequenceLaw : ProbabilityMeasure (ℕ → UnitWeight) :=
  ⟨Measure.infinitePi (fun _ : ℕ => (volume : Measure UnitWeight)), inferInstance⟩

theorem lintegral_uniform_coordinate :
    (∫⁻ u : UnitWeight, ENNReal.ofReal u.val) = ENNReal.ofReal (1 / 2 : ℝ) := by
  have hi : Integrable (fun u : UnitWeight => u.val) :=
    Continuous.integrable_of_hasCompactSupport continuous_subtype_val
      (HasCompactSupport.of_compactSpace _)
  rw [← ofReal_integral_eq_lintegral_ofReal hi
    (Eventually.of_forall fun u => u.property.1)]
  rw [integral_subtype measurableSet_Icc (fun x : ℝ => x), integral_Icc_eq_integral_Ioc,
    ← intervalIntegral.integral_of_le (zero_le_one : (0 : ℝ) ≤ 1), integral_id]
  norm_num

theorem lintegral_uniform_product (n : ℕ) :
    (∫⁻ T : ℕ → UnitWeight, ENNReal.ofReal (∏ i ∈ Finset.range n, (T i).val)
      ∂(uniformSequenceLaw : Measure (ℕ → UnitWeight))) =
      ENNReal.ofReal ((1 / 2 : ℝ)^n) := by
  have hp (T : ℕ → UnitWeight) : ENNReal.ofReal (∏ i ∈ Finset.range n, (T i).val) =
      ∏ i ∈ Finset.range n, ENNReal.ofReal (T i).val :=
    ENNReal.ofReal_prod_of_nonneg (fun i _ => (T i).property.1)
  simp_rw [hp]
  have hind : iIndepFun (fun i (T : ℕ → UnitWeight) => ENNReal.ofReal (T i).val)
      (uniformSequenceLaw : Measure (ℕ → UnitWeight)) :=
    iIndepFun_infinitePi (X := fun _ (u : UnitWeight) => ENNReal.ofReal u.val)
      (fun _ => by fun_prop)
  rw [lintegral_prod_eq_prod_lintegral_of_indepFun (Finset.range n) _ hind
    (fun _ => by fun_prop)]
  have he (i : ℕ) :
      (∫⁻ T : ℕ → UnitWeight, ENNReal.ofReal (T i).val
        ∂(uniformSequenceLaw : Measure (ℕ → UnitWeight))) = ENNReal.ofReal (1 / 2 : ℝ) := by
    rw [← lintegral_map (by fun_prop : Measurable (fun u : UnitWeight => ENNReal.ofReal u.val))
      (by fun_prop : Measurable (fun T : ℕ → UnitWeight => T i))]
    change (∫⁻ u : UnitWeight, ENNReal.ofReal u.val
      ∂(Measure.infinitePi (fun _ : ℕ => (volume : Measure UnitWeight))).map (fun T => T i)) = _
    rw [Measure.infinitePi_map_eval, lintegral_uniform_coordinate]
  simp_rw [he]
  simp only [Finset.prod_const, Finset.card_range]
  exact (ENNReal.ofReal_pow (by norm_num : (0 : ℝ) ≤ 1 / 2) n).symm

theorem ae_stickCommonEvent :
    ∀ᵐ T ∂(uniformSequenceLaw : Measure (ℕ → UnitWeight)), T ∈ stickCommonEvent := by
  have hm (n : ℕ) : Measurable (fun T : ℕ → UnitWeight =>
      ENNReal.ofReal (∏ i ∈ Finset.range n, (T i).val)) := by fun_prop
  have hsum : (∫⁻ T : ℕ → UnitWeight, ∑' n, ENNReal.ofReal
      (∏ i ∈ Finset.range n, (T i).val)
        ∂(uniformSequenceLaw : Measure (ℕ → UnitWeight))) ≠ ∞ := by
    rw [lintegral_tsum (fun n => (hm n).aemeasurable)]
    simp_rw [lintegral_uniform_product]
    rw [← ENNReal.ofReal_tsum_of_nonneg (fun _ => by positivity) summable_geometric_two,
      tsum_geometric_two]
    exact ENNReal.ofReal_ne_top
  filter_upwards [ae_lt_top (Measurable.tsum hm) hsum] with T hT
  have ht := (ENNReal.continuousAt_toReal ENNReal.zero_ne_top).tendsto.comp
    (ENNReal.tendsto_atTop_zero_of_tsum_ne_top hT.ne)
  change Tendsto (fun n => ∏ i ∈ Finset.range n, (T i).val) atTop (𝓝 0)
  simpa only [Function.comp_def,
    ENNReal.toReal_ofReal (Finset.prod_nonneg (fun i _ => (T i).property.1)),
    ENNReal.toReal_zero] using ht

/-- The quantifier over all masses is inside a single probability-one event. -/
theorem ae_all_masses_stickWeight_hasSum :
    ∀ᵐ T ∂(uniformSequenceLaw : Measure (ℕ → UnitWeight)),
      ∀ B : {b : ℝ // 0 < b}, HasSum (stickWeight (fun i => uniformBreak B (T i))) 1 := by
  filter_upwards [ae_stickCommonEvent] with T hT B
  exact hasSum_uniformBreak_on_commonEvent hT B

end GGC
