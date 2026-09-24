import GGC.Laplace
import GGC.FiniteGamma
import Mathlib.Algebra.Order.Ring.Pow
import Mathlib.MeasureTheory.Integral.IntegrableOn

/-!
# Independent Thorin data and finite-atomic certificates

These definitions and analytic lemmas do not depend on any external mathematical
input. The separate `GGC.Thorin` facade provides the characterization and
realization adapters.
-/

noncomputable section
open MeasureTheory Filter Topology
open scoped BigOperators ENNReal
namespace GGC

/-- The combined Thorin integrability condition at zero and infinity.
There is deliberately no assumption that `U` has finite total mass.
`Integrable` prevents the default value of a nonintegrable real integral
from being mistaken for a finiteness certificate. -/
def ThorinAdmissible (U : Measure PosReal) : Prop :=
  Integrable (fun b : PosReal => Real.log (1 + 1 / b.val)) U

/-- Admissibility at one controls every nonnegative Laplace parameter.
Bernoulli's inequality with a natural number n ≥ s supplies the integrable
dominator n * log (1 + 1/b), even when U has infinite total mass. -/
theorem ThorinAdmissible.integrable_log {U : Measure PosReal} (hU : ThorinAdmissible U)
    {s : ℝ} (hs : 0 ≤ s) : Integrable (fun b : PosReal => Real.log (1 + s / b.val)) U := by
  obtain ⟨n, hn⟩ := exists_nat_ge s
  apply (hU.const_mul (n : ℝ)).mono'
    (show Measurable (fun b : PosReal => Real.log (1 + s / b.val)) by fun_prop).aestronglyMeasurable
  apply Filter.Eventually.of_forall
  intro b
  have hbpos := b.property
  have hb : 0 ≤ 1 / b.val := by positivity
  have hlog : 0 ≤ Real.log (1 + s / b.val) := Real.log_nonneg (by linarith [div_nonneg hs hbpos.le])
  rw [Real.norm_eq_abs, abs_of_nonneg hlog]
  calc
    Real.log (1 + s / b.val) ≤ Real.log ((1 + 1 / b.val) ^ n) := by
      apply Real.log_le_log (by positivity)
      calc
        1 + s / b.val ≤ 1 + (n : ℝ) * (1 / b.val) := by
          simpa only [mul_one_div, add_comm] using add_le_add_right (div_le_div_of_nonneg_right hn b.property.le) 1
        _ ≤ _ := one_add_mul_le_pow (by linarith : -2 ≤ 1 / b.val) n
    _ = (n : ℝ) * Real.log (1 + 1 / b.val) := Real.log_pow _ _

/-- Admissible Thorin measures have finite mass below every positive rate cutoff.
This does not assert finite total mass. -/
theorem ThorinAdmissible.measure_le_lt_top {U : Measure PosReal} (hU : ThorinAdmissible U)
    (R : ℝ) (hR : 0 < R) : U {b | b.val ≤ R} < ∞ := by
  have hc : 0 < Real.log (1 + 1 / R) := Real.log_pos (by linarith [one_div_pos.mpr hR])
  have hint : IntegrableOn (fun _ : PosReal => (1 : ℝ)) {b | b.val ≤ R} U := by
    apply (hU.integrableOn.const_mul (Real.log (1 + 1 / R))⁻¹).mono' (by fun_prop)
    filter_upwards [ae_restrict_mem (measurableSet_le measurable_subtype_coe measurable_const)] with b hb
    have hlog : Real.log (1 + 1 / R) ≤ Real.log (1 + 1 / b.val) :=
      Real.log_le_log (by positivity)
        (by linarith [one_div_le_one_div_of_le b.property hb])
    simpa [div_eq_mul_inv, mul_comm] using (one_le_div hc).2 hlog
  simpa using ((integrableOn_const_iff (by simp)).mp hint)

theorem ThorinAdmissible.isLocallyFiniteMeasure {U : Measure PosReal}
    (hU : ThorinAdmissible U) : IsLocallyFiniteMeasure U := by
  constructor
  intro b
  refine ⟨{c | c.val < b.val + 1}, ?_, ?_⟩
  · exact (isOpen_lt continuous_subtype_val continuous_const).mem_nhds (by simp)
  · calc
      U {c | c.val < b.val + 1} ≤ U {c | c.val ≤ b.val + 1} :=
        measure_mono (by
          intro c hc
          change c.val ≤ b.val + 1
          exact le_of_lt hc)
      _ < ∞ := hU.measure_le_lt_top (b.val + 1) (by linarith [b.property])

/-- Classical endpoint conditions, with local finiteness stated explicitly.
Integrability of log means absolute logarithmic integrability. Local finiteness
cannot be dropped: the logarithm vanishes at rate one. -/
def ThorinEndpointAdmissible (U : Measure PosReal) : Prop :=
  IsLocallyFiniteMeasure U ∧
    IntegrableOn (fun b : PosReal => Real.log b.val) {b | b.val ≤ 1} U ∧
    IntegrableOn (fun b : PosReal => 1 / b.val) {b | 1 < b.val} U

private theorem thorinLog_low (b : PosReal) (hb : b.val ≤ 1) :
    |Real.log b.val| ≤ Real.log (1 + 1 / b.val) ∧
      Real.log (1 + 1 / b.val) ≤ 1 - Real.log b.val := by
  have hp := b.property
  have hlog : Real.log b.val ≤ 0 := Real.log_nonpos hp.le hb
  constructor
  · rw [abs_of_nonpos hlog, ← Real.log_inv]
    exact Real.log_le_log (by positivity) (by simp [one_div])
  · rw [show 1 + 1 / b.val = (1 + b.val) / b.val by field_simp; ring,
      Real.log_div (by positivity) hp.ne']
    have h := Real.log_le_sub_one_of_pos (show 0 < 1 + b.val by positivity)
    linarith

private theorem thorinLog_high (b : PosReal) (hb : 1 < b.val) :
    1 / b.val ≤ 3 * Real.log (1 + 1 / b.val) ∧
      Real.log (1 + 1 / b.val) ≤ 1 / b.val := by
  have hp := b.property
  have ht : 0 ≤ 1 / b.val := by positivity
  have ht1 : 1 / b.val ≤ 1 := (div_le_one hp).2 hb.le
  constructor
  · have hl := Real.le_log_one_add_of_nonneg ht
    have hlower : (1 / b.val) / 3 ≤ 2 * (1 / b.val) / (1 / b.val + 2) := by
      apply (div_le_div_iff₀ (by norm_num) (by positivity)).2
      nlinarith
    linarith
  · have h := Real.log_le_sub_one_of_pos (show 0 < 1 + 1 / b.val by positivity)
    linarith

/-- Equivalence with the classical zero/infinity endpoint formulation for
arbitrary positive-rate measures, including the required local finiteness. -/
theorem thorinAdmissible_iff_endpoint (U : Measure PosReal) :
    ThorinAdmissible U ↔ ThorinEndpointAdmissible U := by
  constructor
  · intro hU
    refine ⟨hU.isLocallyFiniteMeasure, ?_, ?_⟩
    · apply hU.integrableOn.mono'
        (show Measurable (fun b : PosReal => Real.log b.val) by fun_prop).aestronglyMeasurable
      filter_upwards [ae_restrict_mem (measurableSet_le measurable_subtype_coe measurable_const)] with b hb
      exact (thorinLog_low b hb).1
    · apply (hU.integrableOn.const_mul 3).mono'
        (show Measurable (fun b : PosReal => 1 / b.val) by fun_prop).aestronglyMeasurable
      filter_upwards [ae_restrict_mem (measurableSet_lt measurable_const measurable_subtype_coe)] with b hb
      rw [Real.norm_eq_abs, abs_of_pos (one_div_pos.mpr b.property)]
      exact (thorinLog_high b hb).1
  · rintro ⟨hlocal, hzero, hinfty⟩
    change Integrable (fun b : PosReal => Real.log (1 + 1 / b.val)) U
    letI := hlocal
    let ε : PosReal := ⟨Real.exp (-1), Real.exp_pos _⟩
    let oneRate : PosReal := ⟨1, zero_lt_one⟩
    have hconst_low : IntegrableOn (fun _ : PosReal => (1 : ℝ)) {b | b.val ≤ ε.val} U := by
      apply ((hzero.mono_set (fun b hb => hb.trans (by
        change Real.exp (-1) ≤ 1
        exact Real.exp_le_one_iff.mpr (by norm_num)))).neg).mono' (by fun_prop)
      filter_upwards [ae_restrict_mem (measurableSet_le measurable_subtype_coe measurable_const)] with b hb
      have hlog := Real.log_le_log b.property hb
      change Real.log b.val ≤ Real.log (Real.exp (-1)) at hlog
      rw [Real.log_exp] at hlog
      simpa using (show (1 : ℝ) ≤ -Real.log b.val by linarith)
    have hcompact : IsCompact (Set.Icc ε oneRate) := by
      rw [Subtype.isCompact_iff]
      have himage : Subtype.val '' Set.Icc ε oneRate = Set.Icc ε.val oneRate.val := by
        ext x
        constructor
        · rintro ⟨b, hb, rfl⟩
          exact hb
        · intro hx
          exact ⟨⟨x, ε.property.trans_le hx.1⟩, hx, rfl⟩
      rw [himage]
      exact isCompact_Icc
    have hconst_mid : IntegrableOn (fun _ : PosReal => (1 : ℝ)) (Set.Icc ε oneRate) U :=
      integrableOn_const hcompact.measure_ne_top
    have hconst : IntegrableOn (fun _ : PosReal => (1 : ℝ)) {b | b.val ≤ 1} U := by
      apply (hconst_low.union hconst_mid).mono_set
      intro b hb
      by_cases hbe : b.val ≤ ε.val
      · exact Or.inl hbe
      · exact Or.inr ⟨(not_le.mp hbe).le, hb⟩
    have hsmall : IntegrableOn (fun b : PosReal => Real.log (1 + 1 / b.val))
        {b | b.val ≤ 1} U := by
      apply (hconst.sub hzero).mono'
        (show Measurable (fun b : PosReal => Real.log (1 + 1 / b.val)) by fun_prop).aestronglyMeasurable
      filter_upwards [ae_restrict_mem (measurableSet_le measurable_subtype_coe measurable_const)] with b hb
      have hn : 0 ≤ Real.log (1 + 1 / b.val) := Real.log_nonneg (by
        linarith [one_div_pos.mpr b.property])
      rw [Real.norm_eq_abs, abs_of_nonneg hn]
      exact (thorinLog_low b hb).2
    have hlarge : IntegrableOn (fun b : PosReal => Real.log (1 + 1 / b.val))
        {b | 1 < b.val} U := by
      apply hinfty.mono'
        (show Measurable (fun b : PosReal => Real.log (1 + 1 / b.val)) by fun_prop).aestronglyMeasurable
      filter_upwards [ae_restrict_mem (measurableSet_lt measurable_const measurable_subtype_coe)] with b hb
      have hn : 0 ≤ Real.log (1 + 1 / b.val) := Real.log_nonneg (by
        linarith [one_div_pos.mpr b.property])
      rw [Real.norm_eq_abs, abs_of_nonneg hn]
      exact (thorinLog_high b hb).2
    have huniv : {b : PosReal | b.val ≤ 1} ∪ {b : PosReal | 1 < b.val} = Set.univ := by
      ext b
      simp only [Set.mem_union, Set.mem_setOf_eq, Set.mem_univ, iff_true]
      exact le_or_gt _ _
    simpa only [huniv, integrableOn_univ] using hsmall.union hlarge

/-- General Thorin data, including drift and possibly infinite Thorin mass.
The condition at s = 1 implies integrability of log (1 + s / b) for all s ≥ 0,
as proved by `ThorinAdmissible.integrable_log`. -/
structure ThorinData where
  drift : ℝ
  drift_nonneg : 0 ≤ drift
  measure : Measure PosReal
  admissible : ThorinAdmissible measure

/-- The transform specified by Thorin data. All rates are strictly positive. -/
def thorinLaplace (d : ThorinData) (s : ℝ) : ℝ :=
  Real.exp (-d.drift * s -
    ∫ b : PosReal, Real.log (1 + s / b.val) ∂d.measure)

/-- Thorin representability, separate from the weak-limit definition of GGC.
Reference: Bondesson (1992), Section 3.1, printed p.29 and pp.34--35.
Realization of admissible data is a separate locally proved theorem, not this definition.
Probability normalization already fixes the transform at s = 0 to one. -/
def HasThorinRepresentation (μ : NonnegLaw) : Prop :=
  ∃ d : ThorinData, ∀ s : ℝ, 0 < s → laplace μ s = thorinLaplace d s

/-- Constant laws have zero Thorin measure and drift a. -/
theorem hasThorinRepresentation_diracLaw (a : ℝ) (ha : 0 ≤ a) : HasThorinRepresentation (diracLaw a ha) := by
  refine ⟨⟨a, ha, 0, ?_⟩, ?_⟩
  · exact integrable_zero_measure
  · intro s _hs
    simp [laplace, diracLaw, thorinLaplace, mul_comm]

/-- The actual finite atomic rate measure attached to a finite gamma sum. -/
def finiteThorinMeasure (k : ℕ) (α b : Fin k → PosReal) : Measure PosReal :=
  ∑ i, ENNReal.ofReal (α i).val • Measure.dirac (b i)

/-- Every real-valued function is integrable against this finite atomic measure. -/
theorem integrable_finiteThorinMeasure (k : ℕ) (α b : Fin k → PosReal) (f : PosReal → ℝ) :
    Integrable f (finiteThorinMeasure k α b) := by
  apply integrable_finsetSum_measure.mpr
  intro i _hi
  exact (integrable_dirac (by simp)).smul_measure ENNReal.ofReal_ne_top

theorem integral_finiteThorinMeasure (k : ℕ) (α b : Fin k → PosReal) (f : PosReal → ℝ) :
    (∫ x, f x ∂finiteThorinMeasure k α b) = ∑ i, (α i).val * f (b i) := by
  unfold finiteThorinMeasure
  rw [integral_finsetSum_measure (fun i _ =>
    (integrable_dirac (by simp)).smul_measure ENNReal.ofReal_ne_top)]
  simp [integral_smul_measure, ENNReal.toReal_ofReal (α _).property.le]

/-- Zero-drift Thorin data for the independent finite gamma sum. -/
def finiteThorinData (k : ℕ) (α b : Fin k → PosReal) : ThorinData where
  drift := 0
  drift_nonneg := le_rfl
  measure := finiteThorinMeasure k α b
  admissible := integrable_finiteThorinMeasure k α b _

theorem hasThorinRepresentation_finiteGammaLaw (k : ℕ) (α b : Fin k → PosReal) :
    HasThorinRepresentation (finiteGammaLaw k α b) := by
  refine ⟨finiteThorinData k α b, fun s hs => ?_⟩
  simpa [thorinLaplace, finiteThorinData, integral_finiteThorinMeasure] using
    laplace_finiteGammaLaw k α b hs.le

end GGC
