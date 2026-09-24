import GGC.Foundations.Quantile
import Mathlib.MeasureTheory.Measure.Portmanteau
import Mathlib.Topology.Algebra.Module.Cardinality

/-! # Almost-everywhere quantile coupling under weak convergence

Portmanteau supplies CDF convergence at continuity points. The inverse-CDF
inequalities then give quantile convergence at every continuity point of
the limiting quantile. The exceptional set is countable by monotonicity.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology
namespace GGC.RandomMeasure

theorem measure_singleton_eq_zero_of_continuousAt_cdf (P : ProbabilityMeasure ℝ) {x : ℝ}
    (hx : ContinuousAt (cdf (P : Measure ℝ)) x) : (P : Measure ℝ) {x} = 0 := by
  have hl : Function.leftLim (cdf (P : Measure ℝ)) x = cdf (P : Measure ℝ) x :=
    hx.continuousWithinAt.leftLim_eq
  rw [← measure_cdf (P : Measure ℝ), StieltjesFunction.measure_singleton, hl,
    sub_self, ENNReal.ofReal_zero]

theorem tendsto_cdf_of_narrow {ι : Type*} {l : Filter ι}
    {P : ι → ProbabilityMeasure ℝ} {Q : ProbabilityMeasure ℝ}
    (hP : Tendsto P l (𝓝 Q)) {x : ℝ} (hx : ContinuousAt (cdf (Q : Measure ℝ)) x) :
    Tendsto (fun i => cdf (P i : Measure ℝ) x) l (𝓝 (cdf (Q : Measure ℝ) x)) := by
  have hb : (Q : Measure ℝ) (frontier (Iic x)) = 0 := by
    simpa only [frontier_Iic] using measure_singleton_eq_zero_of_continuousAt_cdf Q hx
  have ht := ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto' hP hb
  simpa only [cdf_eq_real, measureReal_def, Function.comp_def] using
    (ENNReal.tendsto_toReal (measure_ne_top (Q : Measure ℝ) (Iic x))).comp ht

theorem exists_continuousAt_cdf_between (P : ProbabilityMeasure ℝ) {a b : ℝ} (hab : a < b) :
    ∃ x : ℝ, a < x ∧ x < b ∧ ContinuousAt (cdf (P : Measure ℝ)) x := by
  have hc := (monotone_cdf (P : Measure ℝ)).countable_not_continuousAt
  obtain ⟨x, hx, hxI⟩ := (Set.Countable.dense_compl ℝ hc).exists_mem_open
    isOpen_Ioo (nonempty_Ioo.mpr hab)
  exact ⟨x, hxI.1, hxI.2, by simpa only [mem_compl_iff, mem_setOf_eq, not_not] using hx⟩

theorem tendsto_quantile_at_continuity {ι : Type*} {l : Filter ι}
    {P : ι → ProbabilityMeasure ℝ} {Q : ProbabilityMeasure ℝ}
    (hP : Tendsto P l (𝓝 Q)) {u : ℝ} (hu₀ : 0 < u) (hu₁ : u < 1)
    (hu : ContinuousAt (quantile Q) u) :
    Tendsto (fun i => quantile (P i) u) l (𝓝 (quantile Q u)) := by
  apply tendsto_order.mpr
  constructor
  · intro a ha
    obtain ⟨x, hax, hxq, hcx⟩ := exists_continuousAt_cdf_between Q ha
    have hxu : cdf (Q : Measure ℝ) x < u := by
      by_contra hn
      exact not_le_of_gt hxq ((quantile_le_iff Q hu₀ hu₁).mpr (not_lt.mp hn))
    filter_upwards [(tendsto_cdf_of_narrow hP hcx).eventually (gt_mem_nhds hxu)] with i hi
    have hxi : x < quantile (P i) u := by
      by_contra hn
      exact not_le_of_gt hi ((quantile_le_iff (P i) hu₀ hu₁).mp (not_lt.mp hn))
    exact hax.trans hxi
  · intro b hb
    have hq : ∀ᶠ v in 𝓝 u, quantile Q v < b := hu.tendsto.eventually (gt_mem_nhds hb)
    have hv : ∀ᶠ v in 𝓝[>] u, u < v ∧ v < 1 ∧ quantile Q v < b := by
      filter_upwards [self_mem_nhdsWithin, hq.filter_mono nhdsWithin_le_nhds,
        (eventually_lt_nhds hu₁).filter_mono nhdsWithin_le_nhds] with v hv hqv hv₁
      exact ⟨hv, hv₁, hqv⟩
    obtain ⟨v, huv, hv₁, hqv⟩ := hv.exists
    obtain ⟨x, hqx, hxb, hcx⟩ := exists_continuousAt_cdf_between Q hqv
    have hux : u < cdf (Q : Measure ℝ) x :=
      huv.trans_le ((quantile_le_iff Q (hu₀.trans huv) hv₁).mp hqx.le)
    filter_upwards [(tendsto_cdf_of_narrow hP hcx).eventually (lt_mem_nhds hux)] with i hi
    exact ((quantile_le_iff (P i) hu₀ hu₁).mpr hi.le).trans_lt hxb

/-- A single uniform random variable couples any narrowly convergent family
of real laws. Its exceptional set depends only on the limiting quantile. -/
theorem ae_tendsto_quantileSampler {ι : Type*} {l : Filter ι}
    {P : ι → ProbabilityMeasure ℝ} {Q : ProbabilityMeasure ℝ}
    (hP : Tendsto P l (𝓝 Q)) :
    ∀ᵐ u : unitInterval ∂volume,
      Tendsto (fun i => quantileSampler (P i) u) l (𝓝 (quantileSampler Q u)) := by
  let bad : Set ℝ := {u ∈ Ioo 0 1 | ¬ContinuousWithinAt (quantile Q) (Ioo 0 1) u}
  have hc : bad.Countable := (monotoneOn_quantile Q).countable_not_continuousWithinAt
  have hn : ∀ᵐ u : unitInterval ∂volume, u.val ∉ bad :=
    unitInterval.measurePreserving_coe.quasiMeasurePreserving.ae
      (ae_restrict_of_ae (hc.ae_notMem (volume : Measure ℝ)))
  filter_upwards [ae_unitInterval_interior, hn] with u hu hbad
  have hw : ContinuousWithinAt (quantile Q) (Ioo 0 1) u.val := by
    by_contra h
    exact hbad ⟨hu, h⟩
  have ht := tendsto_quantile_at_continuity hP hu.1 hu.2
    (hw.continuousAt (isOpen_Ioo.mem_nhds hu))
  simpa only [quantileSampler, if_pos hu] using ht

end GGC.RandomMeasure
