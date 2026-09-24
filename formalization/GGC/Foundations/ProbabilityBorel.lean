import GGC.Foundations.RandomMeasure
import Mathlib.MeasureTheory.Measure.LevyProkhorovMetric
import Mathlib.MeasureTheory.Constructions.BorelSpace.Metrizable

/-! # Giry and narrow Borel structures agree

API-015/016. We reuse simple-function approximation and narrow metrizability.
Each finite-valued pushforward is a continuous finite atomic combination of
measurable weights. Its narrow limit gives one inclusion; Portmanteau and
the measurable pi-system theorem give the other. The existing measurable
structure is preserved throughout, and the final instance certifies equality.
-/

noncomputable section
open MeasureTheory Set Filter Topology
open scoped BigOperators ENNReal NNReal
namespace GGC.RandomMeasure

variable {E A : Type*} [MetricSpace E] [MeasurableSpace E] [BorelSpace E]
  [SecondCountableTopology E] [MeasurableSpace A]

private theorem measurable_simple_probability_map_narrow
    (φ : SimpleFunc E E) {P : A → ProbabilityMeasure E} (hP : Measurable P) :
    @Measurable A (ProbabilityMeasure E) _ (borel (ProbabilityMeasure E))
      (fun a => (P a).map φ.aemeasurable) := by
  classical
  letI : MeasurableSpace (FiniteMeasure E) := borel (FiniteMeasure E)
  letI : BorelSpace (FiniteMeasure E) := ⟨rfl⟩
  let δ : E → FiniteMeasure E := fun x => ⟨Measure.dirac x, inferInstance⟩
  let σ : (φ.range → ℝ≥0) → FiniteMeasure E :=
    fun w => ∑ x : φ.range, w x • δ x.val
  have hσ : Continuous σ := by
    unfold σ
    fun_prop
  let w : A → φ.range → ℝ≥0 :=
    fun a x => ((P a : Measure E) (φ ⁻¹' {x.val})).toNNReal
  have hw : Measurable w := measurable_pi_iff.2 fun x =>
    (((Measure.measurable_coe (φ.measurableSet_fiber x.val)).comp
      (measurable_subtype_coe.comp hP)).ennreal_toNNReal)
  have he (a : A) : ((P a).map φ.aemeasurable).toFiniteMeasure = σ (w a) := by
    apply FiniteMeasure.toMeasure_injective
    have hmap := (Measure.ae_mem_finset_iff_map_eq_sum_dirac
      (μ := (P a : Measure E)) (s := φ.range) φ.aemeasurable).mp
        (Eventually.of_forall fun x => φ.mem_range_self x)
    change Measure.map φ (P a : Measure E) = (σ (w a) : Measure E)
    rw [hmap]
    simp only [σ, FiniteMeasure.toMeasure_sum, FiniteMeasure.toMeasure_smul,
      w, δ, ENNReal.smul_def,
      ENNReal.coe_toNNReal (measure_ne_top _ _), Finset.univ_eq_attach]
    exact (Finset.sum_attach _ _).symm
  have hfm : Measurable (fun a => ((P a).map φ.aemeasurable).toFiniteMeasure) := by
    simpa only [← he, Function.comp_def] using hσ.measurable.comp hw
  have hb : borel (ProbabilityMeasure E) =
      (borel (FiniteMeasure E)).comap ProbabilityMeasure.toFiniteMeasure := borel_comap
  rw [hb, measurable_comap_iff]
  exact hfm

theorem measurable_probability_narrow_of_giry {P : A → ProbabilityMeasure E} (hP : Measurable P) :
    @Measurable A (ProbabilityMeasure E) _ (borel (ProbabilityMeasure E)) P := by
  have hid : StronglyMeasurable (id : E → E) := measurable_id.stronglyMeasurable
  let φ := hid.approx
  have hm (n : ℕ) := measurable_simple_probability_map_narrow (φ n) hP
  have hlim (a : A) : Tendsto (fun n => (P a).map (φ n).aemeasurable) atTop (𝓝 (P a)) := by
    apply ProbabilityMeasure.tendsto_iff_forall_integral_tendsto.mpr
    intro f
    have hi := tendsto_integral_of_dominated_convergence (μ := (P a : Measure E))
      (bound := fun _ => ‖f‖) (F := fun n x => f (φ n x)) (f := fun x => f x)
      (fun n => (f.continuous.measurable.comp (φ n).measurable).aestronglyMeasurable)
      (integrable_const _) (fun n => Eventually.of_forall fun x => f.norm_coe_le_norm _)
      (Eventually.of_forall fun x => (f.continuous.tendsto x).comp (hid.tendsto_approx x))
    have he (n : ℕ) : (∫ x, f x ∂((P a).map (φ n).aemeasurable : Measure E)) =
        ∫ x, f (φ n x) ∂(P a : Measure E) :=
      integral_map (φ n).aemeasurable f.continuous.measurable.aestronglyMeasurable
    simpa only [he] using hi
  letI : MeasurableSpace (ProbabilityMeasure E) := borel (ProbabilityMeasure E)
  letI : BorelSpace (ProbabilityMeasure E) := ⟨rfl⟩
  exact measurable_of_tendsto_metrizable hm (tendsto_pi_nhds.mpr hlim)

theorem probabilityMeasure_measurable_eq_borel :
    (inferInstance : MeasurableSpace (ProbabilityMeasure E)) = borel (ProbabilityMeasure E) := by
  apply le_antisymm
  · change (inferInstance : MeasurableSpace (Measure E)).comap
      (fun P : ProbabilityMeasure E => (P : Measure E)) ≤ borel (ProbabilityMeasure E)
    rw [← measurable_iff_comap_le]
    letI : MeasurableSpace (ProbabilityMeasure E) := borel (ProbabilityMeasure E)
    letI : BorelSpace (ProbabilityMeasure E) := ⟨rfl⟩
    apply Measurable.measure_of_isPiSystem_of_isProbabilityMeasure
      (S := {s : Set E | IsOpen s})
      (by rw [BorelSpace.measurable_eq (α := E)]; rfl) isPiSystem_isOpen
    intro s hs
    apply LowerSemicontinuous.measurable
    rw [lowerSemicontinuous_iff_le_liminf]
    intro P
    exact ProbabilityMeasure.le_liminf_measure_open_of_tendsto tendsto_id hs
  · have h := measurable_probability_narrow_of_giry
      (P := (id : ProbabilityMeasure E → ProbabilityMeasure E)) measurable_id
    simpa only [measurable_iff_comap_le, MeasurableSpace.comap_id] using h

/-- Certification of the existing Giry instance; no measurable structure is replaced. -/
instance probabilityMeasureBorelSpace : BorelSpace (ProbabilityMeasure E) :=
  ⟨probabilityMeasure_measurable_eq_borel⟩

end GGC.RandomMeasure
