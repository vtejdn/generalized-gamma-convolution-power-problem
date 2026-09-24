import GGC.StieltjesContinuity
import GGC.Foundations.PoissonPairing
import Mathlib.Topology.UniformSpace.UniformApproximation

/-! # Weak-star continuity of the canonical Stieltjes phase

Poisson-smoothed pairings approximate the boundary pairings uniformly over
all positive-rate probability laws. The error is controlled by translations
of the L¹ test function. Thus the boundary pairing is a uniform limit of
continuous functions, without pointwise convergence of boundary phases.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology
namespace GGC

def zeroExtendedPhase (P : ProbabilityMeasure PosReal) : ℝ → ℝ :=
  (Ioi (0 : ℝ)).indicator (stieltjesPhase P)

theorem measurable_zeroExtendedPhase (P : ProbabilityMeasure PosReal) :
    Measurable (zeroExtendedPhase P) :=
  (phase_jointlyMeasurable.comp (measurable_prodMk_left (x := P))).indicator measurableSet_Ioi

theorem zeroExtendedPhase_bounds (P : ProbabilityMeasure PosReal) (t : ℝ) :
    0 ≤ zeroExtendedPhase P t ∧ zeroExtendedPhase P t ≤ 1 := by
  by_cases ht : t ∈ Ioi (0 : ℝ)
  · simpa only [zeroExtendedPhase, indicator_of_mem ht] using stieltjesPhase_bounds P t
  · simp [zeroExtendedPhase, ht]

theorem phaseApprox_eq_dilation (P : ProbabilityMeasure PosReal) (t : ℝ) (n : ℕ) :
    phaseApprox P t n = ∫ v : ℝ, cauchyPDFReal 0 1 v *
      zeroExtendedPhase P (t + phaseHeight n * v) := by
  rw [phaseApprox_eq_poisson_canonical,
    ← Analysis.integral_cauchy_mul_eq_dilation _ _ (phaseHeight_pos n),
    ← integral_indicator measurableSet_Ioi]
  congr 1
  funext u
  by_cases hu : u ∈ Ioi (0 : ℝ) <;> simp [zeroExtendedPhase, hu]

theorem abs_phaseApprox_pairing_sub_le (P : ProbabilityMeasure PosReal)
    {f : ℝ → ℝ} (hf : Integrable f) (n : ℕ) :
    |(∫ t : ℝ, f t * phaseApprox P t n) - ∫ t : ℝ, f t * zeroExtendedPhase P t| ≤
      Analysis.cauchyTranslationError f (phaseHeight n) := by
  simpa only [phaseApprox_eq_dilation] using
    Analysis.abs_poisson_pairing_sub_le hf (measurable_zeroExtendedPhase P)
      (fun t => (zeroExtendedPhase_bounds P t).1)
      (fun t => (zeroExtendedPhase_bounds P t).2) (phaseHeight n)

theorem continuous_integral_phaseApprox_mul {f : ℝ → ℝ} {μ : Measure ℝ}
    (hf : Integrable f μ) (n : ℕ) :
    Continuous (fun P : ProbabilityMeasure PosReal => ∫ t, f t * phaseApprox P t n ∂μ) := by
  apply continuous_of_dominated (bound := fun t => ‖f t‖)
  · intro P
    have hm : Measurable (fun t : ℝ => phaseApprox P t n) :=
      (measurable_phaseApprox n).comp (measurable_prodMk_left (x := P))
    exact hf.aestronglyMeasurable.mul hm.aestronglyMeasurable
  · intro P
    exact Eventually.of_forall fun t => by
      rw [norm_mul, Real.norm_eq_abs (phaseApprox _ _ _), abs_of_pos (phaseApprox_bounds _ _ _).1]
      exact mul_le_of_le_one_right (norm_nonneg _) (phaseApprox_bounds _ _ _).2.le
  · exact hf.norm
  · exact Eventually.of_forall fun t => (continuous_phaseApprox_law t n).const_mul (f t)

theorem tendstoUniformly_phaseApprox_pairing {f : ℝ → ℝ} (hf : Integrable f) :
    TendstoUniformly (fun n (P : ProbabilityMeasure PosReal) => ∫ t : ℝ, f t * phaseApprox P t n)
      (fun P => ∫ t : ℝ, f t * zeroExtendedPhase P t) atTop := by
  rw [Metric.tendstoUniformly_iff]
  intro ε hε
  have he := (Analysis.cauchyTranslationError_tendsto_zero hf phaseHeight_tendsto_zero).eventually
    (gt_mem_nhds hε)
  filter_upwards [he] with n hn
  intro P
  rw [Real.dist_eq, abs_sub_comm]
  exact (abs_phaseApprox_pairing_sub_le P hf n).trans_lt hn

theorem continuous_integral_zeroExtendedPhase_mul {f : ℝ → ℝ} (hf : Integrable f) :
    Continuous (fun P : ProbabilityMeasure PosReal => ∫ t : ℝ, f t * zeroExtendedPhase P t) :=
  (tendstoUniformly_phaseApprox_pairing hf).continuous
    (Eventually.of_forall (continuous_integral_phaseApprox_mul hf)).frequently

theorem integral_indicator_zeroExtendedPhase (P : ProbabilityMeasure PosReal) (f : ℝ → ℝ) :
    (∫ t : ℝ, (Ioi (0 : ℝ)).indicator f t * zeroExtendedPhase P t) =
      ∫ t in Ioi 0, f t * stieltjesPhase P t := by
  rw [← integral_indicator measurableSet_Ioi]
  congr 1
  funext t
  by_cases ht : t ∈ Ioi (0 : ℝ) <;> simp [zeroExtendedPhase, ht]

/-- Every L¹ test kernel on the positive half-line gives a continuous pairing
with the canonical boundary phase in the narrow topology on probability laws. -/
theorem continuous_integral_stieltjesPhase_mul {f : ℝ → ℝ}
    (hf : IntegrableOn f (Ioi 0)) :
    Continuous (fun P : ProbabilityMeasure PosReal => ∫ t in Ioi 0, f t * stieltjesPhase P t) := by
  simpa only [integral_indicator_zeroExtendedPhase] using
    continuous_integral_zeroExtendedPhase_mul (hf.integrable_indicator measurableSet_Ioi)

theorem tendsto_integral_stieltjesPhase_mul {ι : Type*} {l : Filter ι}
    {P : ι → ProbabilityMeasure PosReal} {Q : ProbabilityMeasure PosReal}
    (hP : Tendsto P l (𝓝 Q)) {f : ℝ → ℝ} (hf : IntegrableOn f (Ioi 0)) :
    Tendsto (fun i => ∫ t in Ioi 0, f t * stieltjesPhase (P i) t) l
      (𝓝 (∫ t in Ioi 0, f t * stieltjesPhase Q t)) :=
  ((continuous_integral_stieltjesPhase_mul hf).tendsto Q).comp hP

theorem abs_stieltjesPhase_pairing_sub_le (P : ProbabilityMeasure PosReal)
    {f g : ℝ → ℝ} {μ : Measure ℝ} (hf : Integrable f μ) (hg : Integrable g μ) :
    |(∫ t, f t * stieltjesPhase P t ∂μ) - ∫ t, g t * stieltjesPhase P t ∂μ| ≤
      ∫ t, |f t - g t| ∂μ := by
  have hfp : Integrable (fun t => f t * stieltjesPhase P t) μ := by
    simpa only [mul_comm] using integrable_stieltjesPhase_mul P hf
  have hgp : Integrable (fun t => g t * stieltjesPhase P t) μ := by
    simpa only [mul_comm] using integrable_stieltjesPhase_mul P hg
  rw [← integral_sub hfp hgp]
  simpa only [Pi.sub_apply, mul_sub, mul_comm] using
    abs_integral_stieltjesPhase_mul_le P (hf.sub hg)

/-- The phase law and the L¹ test kernel may both vary. The L¹ convergence
assumption concerns the actual kernels, not a pointwise phase limit. -/
theorem tendsto_integral_stieltjesPhase_mul_of_l1 {ι : Type*} {l : Filter ι}
    {P : ι → ProbabilityMeasure PosReal} {Q : ProbabilityMeasure PosReal}
    (hP : Tendsto P l (𝓝 Q)) {f : ι → ℝ → ℝ} {g : ℝ → ℝ}
    (hf : ∀ᶠ i in l, IntegrableOn (f i) (Ioi 0)) (hg : IntegrableOn g (Ioi 0))
    (hfg : Tendsto (fun i => ∫ t in Ioi 0, |f i t - g t|) l (𝓝 0)) :
    Tendsto (fun i => ∫ t in Ioi 0, f i t * stieltjesPhase (P i) t) l
      (𝓝 (∫ t in Ioi 0, g t * stieltjesPhase Q t)) := by
  apply (tendsto_integral_stieltjesPhase_mul hP hg).congr_dist
  apply squeeze_zero' (Eventually.of_forall fun _ => dist_nonneg) ?_ hfg
  filter_upwards [hf] with i hi
  rw [Real.dist_eq, abs_sub_comm]
  exact abs_stieltjesPhase_pairing_sub_le (P i) hi hg

end GGC
