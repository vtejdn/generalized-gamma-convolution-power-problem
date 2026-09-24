import GGC.DirichletRealization

/-! # Positive-rate Dirichlet realizations

API-017: the rate/log-rate change of variables is mathlib's exponential
measurable equivalence. The law, sampling and posterior adapters reuse the
locally proved finite-partition pushforward theorem. Arbitrary finite,
nonzero bases are normalized with `FiniteMeasure.normalize`.
-/

noncomputable section
open MeasureTheory Set
open scoped ENNReal NNReal
namespace GGC
open RandomMeasure

def rateEquiv : ℝ ≃ᵐ PosReal := Real.expOrderIso.toHomeomorph.toMeasurableEquiv

@[simp] theorem rateEquiv_apply_val (y : ℝ) : (rateEquiv y).val = Real.exp y := rfl

@[simp] theorem rateEquiv_symm_apply (b : PosReal) : rateEquiv.symm b = Real.log b.val :=
  (Real.log_of_pos b.property).symm

def rateLaw (F : ProbabilityMeasure ℝ) : ProbabilityMeasure PosReal :=
  F.map rateEquiv.measurable.aemeasurable

def logRateLaw (P : ProbabilityMeasure PosReal) : ProbabilityMeasure ℝ :=
  P.map rateEquiv.symm.measurable.aemeasurable

@[fun_prop] theorem measurable_rateLaw : Measurable rateLaw :=
  measurable_probability_map rateEquiv.measurable

@[fun_prop] theorem measurable_logRateLaw : Measurable logRateLaw :=
  measurable_probability_map rateEquiv.symm.measurable

@[simp] theorem rateLaw_logRateLaw (P : ProbabilityMeasure PosReal) :
    rateLaw (logRateLaw P) = P := by
  apply ProbabilityMeasure.toMeasure_injective
  change Measure.map rateEquiv (Measure.map rateEquiv.symm (P : Measure PosReal)) = _
  rw [Measure.map_map rateEquiv.measurable rateEquiv.symm.measurable]
  simpa only [Function.comp_def, MeasurableEquiv.apply_symm_apply, id_eq] using!
    (Measure.map_id (μ := (P : Measure PosReal)))

@[simp] theorem logRateLaw_rateLaw (F : ProbabilityMeasure ℝ) : logRateLaw (rateLaw F) = F := by
  apply ProbabilityMeasure.toMeasure_injective
  change Measure.map rateEquiv.symm (Measure.map rateEquiv (F : Measure ℝ)) = _
  rw [Measure.map_map rateEquiv.symm.measurable rateEquiv.measurable]
  simpa only [Function.comp_def, MeasurableEquiv.symm_apply_apply, id_eq] using!
    (Measure.map_id (μ := (F : Measure ℝ)))

def rateDirichletLaw (B : PosReal) (F : ProbabilityMeasure ℝ) :
    ProbabilityMeasure (ProbabilityMeasure PosReal) :=
  (dirichletLaw B F).map measurable_rateLaw.aemeasurable

theorem rateDirichletLaw_isDirichlet (B : PosReal) (F : ProbabilityMeasure ℝ) :
    IsDirichletProcess (ENNReal.ofReal B.val • (rateLaw F : Measure PosReal)) (rateDirichletLaw B F) := by
  have h := (dirichletLaw_isDirichlet B F).map rateEquiv.measurable
  simpa only [Measure.map_smul, rateLaw, rateDirichletLaw, ProbabilityMeasure.toMeasure_map] using! h

@[fun_prop] theorem measurable_rateDirichletLaw :
    Measurable (fun p : PosReal × ProbabilityMeasure ℝ => rateDirichletLaw p.1 p.2) :=
  (measurable_probability_map measurable_rateLaw).comp measurable_dirichletLaw

def rateDirichletSample (B : PosReal) (F : ProbabilityMeasure ℝ) (ω : DirichletSampleSpace) :
    ProbabilityMeasure PosReal := rateLaw (dirichletSample B F ω)

def ratePosteriorSample (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ)
    (ω : DirichletSampleSpace) : ProbabilityMeasure PosReal := rateLaw (posteriorSample B F y ω)

theorem measurable_rateDirichletSample :
    Measurable (fun p : (PosReal × ProbabilityMeasure ℝ) × DirichletSampleSpace =>
      rateDirichletSample p.1.1 p.1.2 p.2) :=
  measurable_rateLaw.comp measurable_dirichletSample

theorem measurable_ratePosteriorSample :
    Measurable (fun p : ((PosReal × ProbabilityMeasure ℝ) × ℝ) × DirichletSampleSpace =>
      ratePosteriorSample p.1.1.1 p.1.1.2 p.1.2 p.2) :=
  measurable_rateLaw.comp measurable_posteriorSample

theorem rateDirichletSample_isDirichlet (B : PosReal) (F : ProbabilityMeasure ℝ) :
    IsDirichletProcess (ENNReal.ofReal B.val • (rateLaw F : Measure PosReal))
      (dirichletSampleSpaceLaw.map
        (measurable_rateDirichletSample.comp (measurable_prodMk_left (x := (B,F)))).aemeasurable) := by
  have h := (dirichletSample_isDirichlet B F).map rateEquiv.measurable
  have he : (dirichletSampleSpaceLaw.map
      (measurable_dirichletSample.comp (measurable_prodMk_left (x := (B,F)))).aemeasurable).map
      measurable_rateLaw.aemeasurable = dirichletSampleSpaceLaw.map
        (measurable_rateDirichletSample.comp (measurable_prodMk_left (x := (B,F)))).aemeasurable := by
    apply ProbabilityMeasure.toMeasure_injective
    exact Measure.map_map measurable_rateLaw
      (measurable_dirichletSample.comp (measurable_prodMk_left (x := (B,F))))
  simpa only [Measure.map_smul, ← he, rateLaw, ProbabilityMeasure.toMeasure_map] using! h

theorem ratePosteriorSample_isDirichlet (B : PosReal) (F : ProbabilityMeasure ℝ) (y : ℝ) :
    IsDirichletProcess (ENNReal.ofReal B.val • (rateLaw F : Measure PosReal) + Measure.dirac (rateEquiv y))
      (dirichletSampleSpaceLaw.map
        (measurable_ratePosteriorSample.comp (measurable_prodMk_left (x := ((B,F),y)))).aemeasurable) := by
  have h := (posteriorSample_isDirichlet B F y).map rateEquiv.measurable
  have he : (dirichletSampleSpaceLaw.map
      (measurable_posteriorSample.comp (measurable_prodMk_left (x := ((B,F),y)))).aemeasurable).map
      measurable_rateLaw.aemeasurable = dirichletSampleSpaceLaw.map
        (measurable_ratePosteriorSample.comp (measurable_prodMk_left (x := ((B,F),y)))).aemeasurable := by
    apply ProbabilityMeasure.toMeasure_injective
    exact Measure.map_map measurable_rateLaw
      (measurable_posteriorSample.comp (measurable_prodMk_left (x := ((B,F),y))))
  rw [Measure.map_add _ _ rateEquiv.measurable, Measure.map_smul,
    Measure.map_dirac' rateEquiv.measurable] at h
  simpa only [← he, rateLaw, ProbabilityMeasure.toMeasure_map] using! h

/-- Existence for every finite, nonzero base, with no atomicity assumption. -/
theorem exists_dirichletProcess (U : Measure PosReal) [IsFiniteMeasure U] (hU : U univ ≠ 0) :
    ∃ D : ProbabilityMeasure (ProbabilityMeasure PosReal), IsDirichletProcess U D := by
  letI : Nonempty PosReal := ⟨⟨1, zero_lt_one⟩⟩
  let m : FiniteMeasure PosReal := ⟨U, inferInstance⟩
  have hpos : 0 < (m.mass:ℝ) := by
    rw [NNReal.coe_pos, pos_iff_ne_zero]
    change (U univ).toNNReal ≠ 0
    exact ENNReal.toNNReal_ne_zero.mpr ⟨hU, measure_ne_top U univ⟩
  let B : PosReal := ⟨m.mass, hpos⟩
  refine ⟨rateDirichletLaw B (logRateLaw m.normalize), ?_⟩
  have h := rateDirichletLaw_isDirichlet B (logRateLaw m.normalize)
  rw [rateLaw_logRateLaw] at h
  have he : ENNReal.ofReal B.val • (m.normalize : Measure PosReal) = U := by
    have hm := congrArg (fun ν : FiniteMeasure PosReal => (ν : Measure PosReal))
      m.self_eq_mass_smul_normalize
    change ENNReal.ofReal (m.mass:ℝ) • (m.normalize : Measure PosReal) = U
    rw [ENNReal.ofReal_coe_nnreal]
    simpa only [FiniteMeasure.toMeasure_smul,
      ProbabilityMeasure.toMeasure_comp_toFiniteMeasure_eq_toMeasure, ENNReal.smul_def] using! hm.symm
  rwa [he] at h

end GGC
