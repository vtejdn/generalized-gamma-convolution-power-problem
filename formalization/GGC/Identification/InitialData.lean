import GGC.Identification.ValueLaw

/-! # Normalized log-rate initial data for finite gamma convolutions

Normalization is mathlib's `FiniteMeasure.normalize`; the log/exp change of
variables reuses the existing measurable equivalence. The second moment is
proved from the actual finite atomic Thorin measure.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped BigOperators
namespace GGC.Identification

/-- Finite nonzero rate data with a square-log moment give admissible initial
data for the log-rate evolution, with exactly the original base measure. -/
theorem exists_logRate_initialData (U : Measure PosReal) [IsFiniteMeasure U]
    (hU : U ≠ 0) (hlog : Integrable (fun b : PosReal => (Real.log b.val)^2) U) :
    ∃ (B : PosReal) (F : ProbabilityMeasure ℝ),
      Integrable (fun y : ℝ => y^2) (F : Measure ℝ) ∧ LogRate.baseMeasure B F=U := by
  letI : Nonempty PosReal := ⟨⟨1,zero_lt_one⟩⟩
  let m : FiniteMeasure PosReal := ⟨U,inferInstance⟩
  have huniv : U univ ≠ 0 := fun h => hU (Measure.measure_univ_eq_zero.mp h)
  have hpos : 0 < (m.mass : ℝ) := by
    rw [NNReal.coe_pos, pos_iff_ne_zero]
    change (U univ).toNNReal ≠ 0
    exact ENNReal.toNNReal_ne_zero.mpr ⟨huniv,measure_ne_top U univ⟩
  let B : PosReal := ⟨m.mass,hpos⟩
  have he : ENNReal.ofReal B.val • (m.normalize : Measure PosReal) = U := by
    have hm := congrArg (fun ν : FiniteMeasure PosReal => (ν : Measure PosReal))
      m.self_eq_mass_smul_normalize
    change ENNReal.ofReal (m.mass : ℝ) • (m.normalize : Measure PosReal) = U
    rw [ENNReal.ofReal_coe_nnreal]
    simpa only [FiniteMeasure.toMeasure_smul,
      ProbabilityMeasure.toMeasure_comp_toFiniteMeasure_eq_toMeasure, ENNReal.smul_def] using! hm.symm
  refine ⟨B,logRateLaw m.normalize,?_,?_⟩
  · have hi : Integrable (fun b : PosReal => (Real.log b.val)^2)
        (m.normalize : Measure PosReal) := by
      rw [← he] at hlog
      exact (integrable_smul_measure (ne_of_gt (ENNReal.ofReal_pos.mpr B.property))
        ENNReal.ofReal_ne_top).mp hlog
    change Integrable (fun y : ℝ => y^2)
      (Measure.map rateEquiv.symm (m.normalize : Measure PosReal))
    apply (integrable_map_measure (by fun_prop) rateEquiv.symm.measurable.aemeasurable).mpr
    simpa only [Function.comp_def, rateEquiv_symm_apply] using hi
  · simpa only [LogRate.baseMeasure, rateLaw_logRateLaw] using he

theorem finiteThorinMeasure_ne_zero {k : ℕ} (hk : 0 < k) (α b : Fin k → PosReal) :
    finiteThorinMeasure k α b ≠ 0 := by
  intro hz
  have hpos : 0 < ∑ i, (α i).val := Finset.sum_pos'
    (fun i _ => (α i).property.le) ⟨⟨0,hk⟩,Finset.mem_univ _,(α ⟨0,hk⟩).property⟩
  have he := integral_finiteThorinMeasure k α b (fun _ => 1)
  rw [hz, integral_zero_measure] at he
  simp only [mul_one] at he
  linarith

/-- Every nonempty finite gamma convolution is the initial value law of
positive-mass log-rate data with a proved finite second moment. -/
theorem exists_finiteGamma_initialData {k : ℕ} (hk : 0 < k) (α b : Fin k → PosReal) :
    ∃ (B : PosReal) (F : ProbabilityMeasure ℝ)
      (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)),
      valueLaw B F hF=finiteGammaLaw k α b := by
  letI : IsFiniteMeasure (finiteThorinMeasure k α b) := by
    constructor
    simp only [finiteThorinMeasure, Measure.finsetSum_apply, Measure.smul_apply,
      smul_eq_mul, Measure.dirac_apply_of_mem (mem_univ _), mul_one]
    exact ENNReal.sum_lt_top.mpr (fun _ _ => ENNReal.ofReal_lt_top)
  obtain ⟨B,F,hF,hbase⟩ := exists_logRate_initialData (finiteThorinMeasure k α b)
    (finiteThorinMeasure_ne_zero hk α b) (integrable_finiteThorinMeasure k α b _)
  refine ⟨B,F,hF,valueLaw_eq_of_laplace B F hF (finiteGammaLaw k α b) ?_⟩
  intro s hs
  have he := integral_baseMeasure_log B F s
  rw [hbase, integral_finiteThorinMeasure] at he
  rw [laplace_finiteGammaLaw k α b hs.le, he]
  congr 1
  ring

end GGC.Identification
