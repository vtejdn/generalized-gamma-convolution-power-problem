import GGC.Identification.LogTests
import GGC.LogRate.Existence

/-! # The zero-drift value law of admissible log-rate data

Realization uses precisely the already registered E-B1 contract. Subsequent
continuity and logarithmic moment assertions require separate proofs.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Identification
open GGC.Analysis GGC.LogRate

def logRateThorinData (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) : ThorinData where
  drift := 0
  drift_nonneg := le_rfl
  measure := baseMeasure B F
  admissible := thorinAdmissible_baseMeasure B F hF

def valueLaw (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) : NonnegLaw :=
  (exists_law_thorinLaplace (logRateThorinData B F hF)).choose

theorem laplace_valueLaw (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) {s : ℝ} (hs : 0 < s) :
    laplace (valueLaw B F hF) s = Real.exp (-B.val*∫ y, logTest s y ∂(F : Measure ℝ)) := by
  have h := (exists_law_thorinLaplace (logRateThorinData B F hF)).choose_spec s hs
  simpa [valueLaw, thorinLaplace, logRateThorinData, integral_baseMeasure_log] using h

theorem isGGC_valueLaw (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) : IsGGC (valueLaw B F hF) := by
  apply HasThorinRepresentation.isGGC
  exact ⟨logRateThorinData B F hF, (exists_law_thorinLaplace (logRateThorinData B F hF)).choose_spec⟩

theorem valueLaw_eq_of_laplace (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) (μ : NonnegLaw)
    (hμ : ∀ s : ℝ, 0 < s → laplace μ s = Real.exp (-B.val*∫ y, logTest s y ∂(F : Measure ℝ))) :
    valueLaw B F hF = μ :=
  nonnegLaw_eq_of_laplace_eq _ _ (fun s hs => (laplace_valueLaw B F hF hs).trans (hμ s hs).symm)

theorem laplace_valueLaw_lower_bound (B : PosReal) (F : ProbabilityMeasure ℝ)
    (hF : Integrable (fun y : ℝ => y^2) (F : Measure ℝ)) {K s s₀ B₀ : ℝ}
    (hK : (∫ y : ℝ, y^2 ∂(F : Measure ℝ)) ≤ K) (hB : B.val ≤ B₀)
    (hs : 0 < s) (hs₀ : s ≤ s₀) :
    Real.exp (-B₀*(Real.log (1+s₀)+Real.sqrt K)) ≤ laplace (valueLaw B F hF) s := by
  rw [laplace_valueLaw B F hF hs, Real.exp_le_exp]
  have hi := integral_logTest_le F hF hs.le hK
  have hl : Real.log (1+s) ≤ Real.log (1+s₀) :=
    Real.log_le_log (by positivity) (by linarith)
  have hc : 0 ≤ Real.log (1+s₀)+Real.sqrt K :=
    add_nonneg (Real.log_nonneg (by linarith)) (Real.sqrt_nonneg K)
  have hb := mul_le_mul_of_nonneg_right hB hc
  have ht := mul_le_mul_of_nonneg_left (hi.trans (add_le_add hl le_rfl)) B.property.le
  nlinarith

namespace WeakLogRateSolution

theorem integrable_sq {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) {t : ℝ} (ht : t ∈ Icc 0 T) :
    Integrable (fun y : ℝ => y^2) (w.law t : Measure ℝ) :=
  ((w.moment_bound.choose_spec).2 t ht).1

def value {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (t : Icc (0 : ℝ) T) : NonnegLaw :=
  valueLaw (massAt B₀ t.val) (w.law t.val) (integrable_sq w t.property)

theorem uniform_laplace_lower_bound {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) {s₀ : ℝ} (_hs₀ : 0 < s₀) :
    ∃ K : ℝ, 0 ≤ K ∧
      (∀ t ∈ Icc 0 T, (∫ y : ℝ, y^2 ∂(w.law t : Measure ℝ)) ≤ K) ∧
      0 < Real.exp (-B₀.val*(Real.log (1+s₀)+Real.sqrt K)) ∧
      ∀ (t : Icc (0 : ℝ) T) (s : ℝ), 0 < s → s ≤ s₀ →
        Real.exp (-B₀.val*(Real.log (1+s₀)+Real.sqrt K)) ≤ laplace (value w t) s := by
  obtain ⟨K, hK, hk⟩ := w.moment_bound
  refine ⟨K, hK, (fun t ht => (hk t ht).2), Real.exp_pos _, ?_⟩
  intro t s hs hss
  exact laplace_valueLaw_lower_bound _ _ _ (hk t.val t.property).2
    (massAt_mem_Icc B₀ t.property).2 hs hss

end WeakLogRateSolution
end GGC.Identification
