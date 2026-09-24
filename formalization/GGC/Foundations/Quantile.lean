import GGC.Foundations.ProbabilityBorel
import Mathlib.Probability.CDF
import Mathlib.MeasureTheory.Constructions.UnitInterval
import Mathlib.Topology.Order.Monotone
import Mathlib.Tactic

/-! # Ordered quantiles of real probability laws

The generic measurable sampler used in M2 has no ordered coupling contract.
Here the actual inverse CDF supplies that additional structure, using the
standard CDF, conditional infimum, measurable-evaluation and interval-volume APIs.
The endpoint values of the unit-interval sampler are set to zero.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology Classical
namespace GGC.RandomMeasure

def quantile (P : ProbabilityMeasure ℝ) (u : ℝ) : ℝ :=
  sInf {x : ℝ | u ≤ cdf (P : Measure ℝ) x}

theorem quantile_set_nonempty (P : ProbabilityMeasure ℝ) {u : ℝ} (hu : u < 1) :
    {x : ℝ | u ≤ cdf (P : Measure ℝ) x}.Nonempty := by
  obtain ⟨x, hx⟩ := ((tendsto_cdf_atTop (P : Measure ℝ)).eventually (lt_mem_nhds hu)).exists
  exact ⟨x, hx.le⟩

theorem quantile_set_bddBelow (P : ProbabilityMeasure ℝ) {u : ℝ} (hu : 0 < u) :
    BddBelow {x : ℝ | u ≤ cdf (P : Measure ℝ) x} := by
  obtain ⟨a, ha⟩ := ((tendsto_cdf_atBot (P : Measure ℝ)).eventually (gt_mem_nhds hu)).exists
  refine ⟨a, fun x hx => le_of_not_gt ?_⟩
  intro hxa
  exact not_lt_of_ge hx ((monotone_cdf _ hxa.le).trans_lt ha)

theorem le_cdf_quantile (P : ProbabilityMeasure ℝ) {u : ℝ} (hu₀ : 0 < u) (hu₁ : u < 1) :
    u ≤ cdf (P : Measure ℝ) (quantile P u) := by
  rw [← (cdf (P : Measure ℝ)).iInf_Ioi_eq (quantile P u)]
  apply le_ciInf
  intro r
  obtain ⟨x, hx, hxr⟩ := (csInf_lt_iff (quantile_set_bddBelow P hu₀)
    (quantile_set_nonempty P hu₁)).mp r.property
  exact hx.trans (monotone_cdf _ hxr.le)

theorem quantile_le_iff (P : ProbabilityMeasure ℝ) {u x : ℝ} (hu₀ : 0 < u) (hu₁ : u < 1) :
    quantile P u ≤ x ↔ u ≤ cdf (P : Measure ℝ) x := by
  constructor
  · intro h
    exact (le_cdf_quantile P hu₀ hu₁).trans (monotone_cdf _ h)
  · intro h
    exact csInf_le (quantile_set_bddBelow P hu₀) h

theorem quantile_lt_iff_rat (P : ProbabilityMeasure ℝ) {u a : ℝ}
    (hu₀ : 0 < u) (hu₁ : u < 1) :
    quantile P u < a ↔ ∃ r : ℚ, (r : ℝ) < a ∧ u ≤ cdf (P : Measure ℝ) r := by
  constructor
  · intro h
    obtain ⟨r, hr₀, hr₁⟩ := exists_rat_btwn h
    exact ⟨r, hr₁, (quantile_le_iff P hu₀ hu₁).mp hr₀.le⟩
  · rintro ⟨r, hr, hu⟩
    exact ((quantile_le_iff P hu₀ hu₁).mpr hu).trans_lt hr

theorem monotoneOn_quantile (P : ProbabilityMeasure ℝ) :
    MonotoneOn (quantile P) (Ioo 0 1) := by
  intro u hu v hv huv
  exact (quantile_le_iff P hu.1 hu.2).mpr (huv.trans (le_cdf_quantile P hv.1 hv.2))

theorem measurable_cdf_law (a : ℝ) :
    Measurable (fun P : ProbabilityMeasure ℝ => cdf (P : Measure ℝ) a) := by
  simp_rw [cdf_eq_real, measureReal_def]
  exact ((Measure.measurable_coe measurableSet_Iic).comp measurable_subtype_coe).ennreal_toReal

def quantileSampler (P : ProbabilityMeasure ℝ) (u : unitInterval) : ℝ :=
  if 0 < u.val ∧ u.val < 1 then quantile P u.val else 0

theorem quantileSampler_eq (P : ProbabilityMeasure ℝ) {u : unitInterval}
    (hu : 0 < u.val ∧ u.val < 1) : quantileSampler P u = quantile P u.val := by
  simp only [quantileSampler, if_pos hu]

theorem measurable_quantileSampler : Measurable (Function.uncurry quantileSampler) := by
  apply measurable_of_Iio
  intro a
  let D : Set (ProbabilityMeasure ℝ × unitInterval) := {x | 0 < x.2.val ∧ x.2.val < 1}
  have hD : MeasurableSet D :=
    (measurableSet_lt measurable_const measurable_snd.subtype_val).inter
      (measurableSet_lt measurable_snd.subtype_val measurable_const)
  have hC : MeasurableSet (⋃ (r : ℚ) (_ : (r : ℝ) < a),
      {x : ProbabilityMeasure ℝ × unitInterval | x.2.val ≤ cdf (x.1 : Measure ℝ) r}) := by
    apply MeasurableSet.iUnion
    intro r
    apply MeasurableSet.iUnion
    intro _
    exact measurableSet_le measurable_snd.subtype_val ((measurable_cdf_law r).comp measurable_fst)
  have hA : MeasurableSet {x : ProbabilityMeasure ℝ × unitInterval | (0 : ℝ) < a} := by
    by_cases ha : (0 : ℝ) < a <;> simp [ha]
  have he : (Function.uncurry quantileSampler) ⁻¹' Iio a =
      (D ∩ ⋃ (r : ℚ) (_ : (r : ℝ) < a),
        {x : ProbabilityMeasure ℝ × unitInterval | x.2.val ≤ cdf (x.1 : Measure ℝ) r}) ∪
      (Dᶜ ∩ {x | (0 : ℝ) < a}) := by
    ext x
    simp only [mem_preimage, mem_Iio, Function.uncurry, quantileSampler, mem_union,
      mem_inter_iff, mem_compl_iff, mem_iUnion, mem_setOf_eq, D, exists_prop]
    by_cases hx : 0 < x.2.val ∧ x.2.val < 1
    · simp only [hx, if_true, true_and, not_true_eq_false, false_and, or_false,
        quantile_lt_iff_rat x.1 hx.1 hx.2]
    · simp only [hx, if_false, false_and, not_false_eq_true, true_and, false_or]
  rw [he]
  exact (hD.inter hC).union (hD.compl.inter hA)

theorem measurable_quantileSampler_section (P : ProbabilityMeasure ℝ) :
    Measurable (quantileSampler P) := measurable_quantileSampler.of_uncurry_left

theorem ae_unitInterval_interior :
    ∀ᵐ u : unitInterval ∂volume, 0 < u.val ∧ u.val < 1 := by
  filter_upwards [(volume : Measure unitInterval).ae_ne 0, (volume : Measure unitInterval).ae_ne 1]
    with u hu₀ hu₁
  constructor
  · exact lt_of_le_of_ne u.property.1 (fun h => hu₀ (Subtype.ext h.symm))
  · exact lt_of_le_of_ne u.property.2 (fun h => hu₁ (Subtype.ext h))

/-- The ordered sampler has exactly the supplied law, including atomic and mixed laws. -/
theorem quantileSampler_map (P : ProbabilityMeasure ℝ) :
    Measure.map (quantileSampler P) (volume : Measure unitInterval) = (P : Measure ℝ) := by
  have hm := measurable_quantileSampler_section P
  haveI : IsProbabilityMeasure (Measure.map (quantileSampler P) (volume : Measure unitInterval)) :=
    Measure.isProbabilityMeasure_map hm.aemeasurable
  apply Measure.ext_of_Iic
  intro x
  let a : unitInterval := ⟨cdf (P : Measure ℝ) x, cdf_nonneg _ _, cdf_le_one _ _⟩
  rw [Measure.map_apply hm measurableSet_Iic]
  have he : (quantileSampler P) ⁻¹' Iic x =ᵐ[volume] Iic a := by
    filter_upwards [ae_unitInterval_interior] with u hu
    apply propext
    change quantileSampler P u ≤ x ↔ u ≤ a
    rw [quantileSampler_eq P hu]
    exact quantile_le_iff P hu.1 hu.2
  rw [measure_congr he, unitInterval.volume_Iic]
  exact ofReal_cdf (P : Measure ℝ) x

end GGC.RandomMeasure
