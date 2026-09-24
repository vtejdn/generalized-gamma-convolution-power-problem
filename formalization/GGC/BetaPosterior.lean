import GGC.BetaAnalysis
import GGC.StieltjesMean
import Mathlib.MeasureTheory.Measure.FiniteMeasureProd
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.Topology.Order.ProjIcc

/-! # Beta atom mixtures and posterior logarithmic domination

The sampling law is an actual product followed by the measurable atom-mixture
map. The bounds hold for every law D on positive-rate probability measures.
Identifying this mixture as DP(U + δ_b) remains a separate distribution theorem.
-/

noncomputable section
open MeasureTheory Set
open scoped ENNReal

namespace GGC
open RandomMeasure

def unitWeight (z : ℝ) : UnitWeight :=
  Set.projIcc 0 1 zero_le_one z

@[fun_prop] theorem measurable_unitWeight : Measurable unitWeight :=
  (continuous_projIcc (h := (zero_le_one : (0 : ℝ) ≤ 1))).measurable

theorem unitWeight_val_of_mem {z : ℝ} (hz : z ∈ Icc 0 1) : (unitWeight z).val = z := by
  exact congrArg Subtype.val (Set.projIcc_of_mem zero_le_one hz)

theorem betaLaw_mem_Ioo (a b : PosReal) :
    ∀ᵐ z ∂(betaLaw a b : Measure ℝ), z ∈ Ioo (0 : ℝ) 1 := by
  change ∀ᵐ z ∂volume.withDensity (ProbabilityTheory.betaPDF a.val b.val), _
  unfold ProbabilityTheory.betaPDF
  rw [ae_withDensity_iff (ProbabilityTheory.measurable_betaPDFReal a.val b.val).ennreal_ofReal]
  apply Filter.Eventually.of_forall
  intro z hz
  by_contra h
  exact hz (by simp [ProbabilityTheory.betaPDFReal,
    show ¬(0 < z ∧ z < 1) from h])

/-- `Beta(1,B)` as a law of genuine weights, with no exceptional invalid mixtures. -/
def betaWeightLaw (B : PosReal) : ProbabilityMeasure UnitWeight :=
  (betaLaw ⟨1, zero_lt_one⟩ B).map measurable_unitWeight.aemeasurable

private theorem measurable_betaPDF_one :
    Measurable (fun x : PosReal × ℝ => ProbabilityTheory.betaPDF 1 x.1.val x.2) := by
  have hG : Continuous (fun B : PosReal => Real.Gamma B.val) :=
    Real.differentiableOn_Gamma_Ioi.continuousOn.comp_continuous continuous_subtype_val
      (fun B => B.property)
  have hG₁ : Continuous (fun B : PosReal => Real.Gamma (1 + B.val)) :=
    Real.differentiableOn_Gamma_Ioi.continuousOn.comp_continuous
      (continuous_const.add continuous_subtype_val) (fun B =>
        show 0 < 1 + B.val from add_pos zero_lt_one B.property)
  have hn : Measurable (fun B : PosReal => 1 / ProbabilityTheory.beta 1 B.val) :=
    (measurable_const.div ((measurable_const.mul hG.measurable).div hG₁.measurable))
  unfold ProbabilityTheory.betaPDF ProbabilityTheory.betaPDFReal
  apply Measurable.ennreal_ofReal
  apply Measurable.ite
    ((measurableSet_lt measurable_const measurable_snd).inter
      (measurableSet_lt measurable_snd measurable_const))
  · exact ((hn.comp measurable_fst).mul (measurable_snd.pow_const _)).mul
      ((measurable_const.sub measurable_snd).pow
        ((measurable_subtype_coe.comp measurable_fst).sub measurable_const))
  · exact measurable_const

theorem measurable_betaLaw_one : Measurable (betaLaw ⟨1, zero_lt_one⟩) := by
  apply Measurable.subtype_mk
  change Measurable (fun B : PosReal => volume.withDensity (ProbabilityTheory.betaPDF 1 B.val))
  have hd : Measurable (Function.uncurry
      (fun (B : PosReal) (z : ℝ) => ProbabilityTheory.betaPDF 1 B.val z)) := by
    simpa only [Function.uncurry_def] using! measurable_betaPDF_one
  have hm := measurable_withDensity (μ := (volume : Measure ℝ)) hd
  exact hm

@[fun_prop] theorem measurable_betaWeightLaw : Measurable betaWeightLaw :=
  (measurable_probability_map measurable_unitWeight).comp measurable_betaLaw_one

theorem betaWeightLaw_pos (B : PosReal) :
    ∀ᵐ z ∂(betaWeightLaw B : Measure UnitWeight), 0 < z.val := by
  change ∀ᵐ z ∂Measure.map unitWeight (betaLaw ⟨1, zero_lt_one⟩ B : Measure ℝ), _
  apply (ae_map_iff measurable_unitWeight.aemeasurable
    (measurableSet_lt measurable_const measurable_subtype_coe)).2
  filter_upwards [betaLaw_mem_Ioo ⟨1, zero_lt_one⟩ B] with z hz
  rw [unitWeight_val_of_mem ⟨hz.1.le, hz.2.le⟩]
  exact hz.1

theorem betaWeightLaw_map_val (B : PosReal) :
    Measure.map (fun z : UnitWeight => z.val) (betaWeightLaw B : Measure UnitWeight) =
      ProbabilityTheory.betaMeasure 1 B.val := by
  change Measure.map _ (Measure.map unitWeight (betaLaw ⟨1, zero_lt_one⟩ B : Measure ℝ)) = _
  rw [Measure.map_map measurable_subtype_coe measurable_unitWeight]
  simp only [Function.comp_def]
  have he : (fun z : ℝ => (unitWeight z).val) =ᵐ[(betaLaw ⟨1, zero_lt_one⟩ B : Measure ℝ)] id := by
    filter_upwards [betaLaw_mem_Ioo ⟨1, zero_lt_one⟩ B] with z hz
    exact unitWeight_val_of_mem ⟨hz.1.le, hz.2.le⟩
  rw [Measure.map_congr he, Measure.map_id]
  rfl

theorem integrable_neg_log_betaWeightLaw (B : PosReal) :
    Integrable (fun z : UnitWeight => -Real.log z.val)
      (betaWeightLaw B : Measure UnitWeight) := by
  change Integrable _ (Measure.map unitWeight (betaLaw ⟨1, zero_lt_one⟩ B : Measure ℝ))
  have hm : Measurable (fun z : UnitWeight => -Real.log z.val) := by fun_prop
  rw [integrable_map_measure hm.aestronglyMeasurable measurable_unitWeight.aemeasurable]
  apply (integrable_neg_log_betaLaw B).congr
  filter_upwards [betaLaw_mem_Ioo ⟨1, zero_lt_one⟩ B] with z hz
  simp only [Function.comp_def, unitWeight_val_of_mem ⟨hz.1.le, hz.2.le⟩]

theorem integral_neg_log_betaWeightLaw (B : PosReal) :
    (∫ z, -Real.log z.val ∂(betaWeightLaw B : Measure UnitWeight)) =
      digamma (B.val + 1) - digamma 1 := by
  change (∫ z : UnitWeight, -Real.log z.val
    ∂Measure.map unitWeight (betaLaw ⟨1, zero_lt_one⟩ B : Measure ℝ)) = _
  have hm : Measurable (fun z : UnitWeight => -Real.log z.val) := by fun_prop
  rw [integral_map measurable_unitWeight.aemeasurable hm.aestronglyMeasurable]
  calc (∫ z, -Real.log (unitWeight z).val ∂(betaLaw ⟨1, zero_lt_one⟩ B : Measure ℝ)) =
      ∫ z, -Real.log z ∂(betaLaw ⟨1, zero_lt_one⟩ B : Measure ℝ) := by
        apply integral_congr_ae
        filter_upwards [betaLaw_mem_Ioo ⟨1, zero_lt_one⟩ B] with z hz
        rw [unitWeight_val_of_mem ⟨hz.1.le, hz.2.le⟩]
    _ = _ := integral_neg_log_betaLaw B

/-- Independent Q and Z, pushed forward by `(Q,Z) ↦ (1-Z)Q+Zδ_b`. -/
def posteriorMixtureLaw (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B b : PosReal) : ProbabilityMeasure (ProbabilityMeasure PosReal) :=
  atomMixtureLaw D (betaWeightLaw B) b

theorem posteriorMixtureLaw_jointlyMeasurable :
    Measurable (fun x : ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × PosReal =>
      posteriorMixtureLaw x.1 x.2.1 x.2.2) := by
  have hp : Measurable (fun x : ProbabilityMeasure (ProbabilityMeasure PosReal) ×
      PosReal × PosReal => (x.1, betaWeightLaw x.2.1, x.2.2)) := by fun_prop
  have hm := atomMixtureLaw_jointlyMeasurable.comp hp
  simpa only [Function.comp_def, posteriorMixtureLaw] using! hm

theorem posteriorMixtureLaw_toMeasure
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B b : PosReal) :
    (posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal)) =
      Measure.map (fun x : ProbabilityMeasure PosReal × UnitWeight => atomMixture x.1 x.2 b)
        ((D : Measure (ProbabilityMeasure PosReal)).prod (betaWeightLaw B : Measure UnitWeight)) := rfl

def posteriorLog (b : PosReal) (P : ProbabilityMeasure PosReal) : ℝ :=
  -Real.log (b.val * stieltjesMean P b.val)

@[fun_prop] theorem measurable_posteriorLog :
    Measurable (fun x : PosReal × ProbabilityMeasure PosReal => posteriorLog x.1 x.2) := by
  unfold posteriorLog
  exact ((measurable_subtype_coe.comp measurable_fst).mul
    (measurable_stieltjesMean.comp (measurable_snd.prodMk
      (measurable_subtype_coe.comp measurable_fst)))).log.neg

theorem posteriorLog_nonneg (b : PosReal) (P : ProbabilityMeasure PosReal) :
    0 ≤ posteriorLog b P := by
  have h := mul_le_mul_of_nonneg_left (stieltjesMean_le P b.property) b.property.le
  have hp := mul_pos b.property (stieltjesMean_pos P b.property)
  apply neg_nonneg.mpr (Real.log_nonpos hp.le _)
  simpa [ne_of_gt b.property] using h

private theorem measurable_posterior_sample (b : PosReal) :
    Measurable (fun x : ProbabilityMeasure PosReal × UnitWeight =>
      posteriorLog b (atomMixture x.1 x.2 b)) := by
  exact measurable_posteriorLog.comp (measurable_const.prodMk
    (measurable_atomMixture.comp (measurable_fst.prodMk
      (measurable_snd.prodMk (measurable_const (a := b))))))

private theorem posterior_sample_integrable
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B b : PosReal) :
    Integrable (fun x : ProbabilityMeasure PosReal × UnitWeight =>
      posteriorLog b (atomMixture x.1 x.2 b))
      ((D : Measure (ProbabilityMeasure PosReal)).prod (betaWeightLaw B : Measure UnitWeight)) := by
  apply ((integrable_const (Real.log 2)).add
    ((integrable_neg_log_betaWeightLaw B).comp_snd (D : Measure (ProbabilityMeasure PosReal)))).mono'
      (measurable_posterior_sample b).aestronglyMeasurable
  have hz := (Measure.quasiMeasurePreserving_snd
    (μ := (D : Measure (ProbabilityMeasure PosReal))) (ν := (betaWeightLaw B : Measure UnitWeight))).ae
      (betaWeightLaw_pos B)
  filter_upwards [hz] with x hx
  rw [Real.norm_eq_abs, abs_of_nonneg (posteriorLog_nonneg b _)]
  simpa only [posteriorLog, sub_eq_add_neg, Pi.add_apply] using!
    (atomMixture_neg_log_bounds x.1 x.2 hx b).2

/-- Absolute integrability of the logarithm under the actual posterior sampling law. -/
theorem integrable_posteriorLog
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B b : PosReal) :
    Integrable (posteriorLog b)
      (posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal)) := by
  rw [posteriorMixtureLaw_toMeasure]
  have hm := measurable_posteriorLog.comp (measurable_prodMk_left (x := b))
  have hpair : Measurable (fun x : ProbabilityMeasure PosReal × UnitWeight => (x.1, x.2, b)) :=
    measurable_fst.prodMk (measurable_snd.prodMk measurable_const)
  have hp := measurable_atomMixture.comp hpair
  simp only [Function.comp_def] at hm hp
  rw [integrable_map_measure hm.aestronglyMeasurable hp.aemeasurable]
  exact posterior_sample_integrable D B b

/-- Uniform in both the underlying random Q and the atom position b. -/
theorem integral_posteriorLog_bounds
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B b : PosReal) :
    0 ≤ (∫ P, posteriorLog b P ∂(posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal))) ∧
      (∫ P, posteriorLog b P ∂(posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal))) ≤
        Real.log 2 + digamma (B.val + 1) - digamma 1 := by
  refine ⟨integral_nonneg (posteriorLog_nonneg b), ?_⟩
  rw [posteriorMixtureLaw_toMeasure]
  have hm := measurable_posteriorLog.comp (measurable_prodMk_left (x := b))
  have hpair : Measurable (fun x : ProbabilityMeasure PosReal × UnitWeight => (x.1, x.2, b)) :=
    measurable_fst.prodMk (measurable_snd.prodMk measurable_const)
  have hp := measurable_atomMixture.comp hpair
  simp only [Function.comp_def] at hm hp
  rw [integral_map hp.aemeasurable hm.aestronglyMeasurable]
  have hi := (integrable_const (Real.log 2)).add
    ((integrable_neg_log_betaWeightLaw B).comp_snd (D : Measure (ProbabilityMeasure PosReal)))
  calc _ ≤ ∫ x : ProbabilityMeasure PosReal × UnitWeight, Real.log 2 - Real.log x.2.val
      ∂((D : Measure (ProbabilityMeasure PosReal)).prod (betaWeightLaw B : Measure UnitWeight)) := by
        apply integral_mono_ae (posterior_sample_integrable D B b) hi
        have hz := (Measure.quasiMeasurePreserving_snd
          (μ := (D : Measure (ProbabilityMeasure PosReal))) (ν := (betaWeightLaw B : Measure UnitWeight))).ae
            (betaWeightLaw_pos B)
        filter_upwards [hz] with x hx
        exact (atomMixture_neg_log_bounds x.1 x.2 hx b).2
    _ = _ := by
      have hi' : Integrable (fun x : ProbabilityMeasure PosReal × UnitWeight =>
          Real.log 2 - Real.log x.2.val)
          ((D : Measure (ProbabilityMeasure PosReal)).prod (betaWeightLaw B : Measure UnitWeight)) := by
        simpa only [Pi.add_apply, sub_eq_add_neg] using! hi
      rw [integral_prod _ hi']
      simp only [sub_eq_add_neg, integral_add (integrable_const _) (integrable_neg_log_betaWeightLaw B),
        integral_const, probReal_univ, smul_eq_mul, one_mul,
        integral_neg_log_betaWeightLaw]
      ring

end GGC
