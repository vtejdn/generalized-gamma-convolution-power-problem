import Mathlib.MeasureTheory.Covering.Differentiation
import Mathlib.MeasureTheory.Covering.BesicovitchVectorSpace
import Mathlib.MeasureTheory.Integral.Average
import Mathlib.MeasureTheory.Measure.Haar.NormedSpace
import Mathlib.MeasureTheory.Group.Integral

/-! # Bounded measurable functions and dilated integrable kernels

API-014: the local part reuses Lebesgue differentiation on closed balls;
the tail is controlled uniformly by the L¹ norm of the kernel. No boundary
continuity of the function is assumed.
-/

noncomputable section
open MeasureTheory MeasureTheory.Measure Set Filter Metric
open scoped Topology
namespace GGC.Analysis

theorem integral_affine (f : ℝ → ℝ) (a : ℝ) {e : ℝ} (he : 0 < e) :
    (∫ u, f (a + e * u)) = e⁻¹ * ∫ x, f x := by
  rw [integral_comp_mul_left (fun x => f (a+x)),
    integral_add_left_eq_self, abs_of_pos (inv_pos.mpr he), smul_eq_mul]

theorem integral_closedBall_affine (f : ℝ → ℝ) (a R : ℝ) {e : ℝ} (he : 0 < e) :
    (∫ u in closedBall 0 R, f (a + e*u)) =
      e⁻¹ * ∫ x in closedBall a (e*R), f x := by
  rw [← integral_indicator measurableSet_closedBall,
    ← integral_indicator measurableSet_closedBall, ← integral_affine _ a he]
  apply integral_congr_ae
  exact ae_of_all _ fun u => by
    have hm : a+e*u ∈ closedBall a (e*R) ↔ u ∈ closedBall 0 R := by
      simp only [mem_closedBall, Real.dist_eq, add_sub_cancel_left, sub_zero,
        abs_mul, abs_of_pos he, mul_le_mul_iff_right₀ he]
    by_cases hu : u ∈ closedBall 0 R
    · simp [hu, hm.mpr hu]
    · simp [hu, mt hm.mp hu]

theorem integrable_bounded_mul {k f : ℝ → ℝ} (hk : Integrable k)
    (hf : Measurable f) {C : ℝ} (hC : ∀ x, |f x| ≤ C) :
    Integrable (fun x => k x * f x) := by
  apply (hk.norm.mul_const C).mono'
    (hk.aestronglyMeasurable.mul hf.aestronglyMeasurable)
  exact ae_of_all _ fun x => by
    change ‖k x * f x‖ ≤ ‖k x‖ * C
    simp only [norm_mul, Real.norm_eq_abs]
    exact mul_le_mul_of_nonneg_left (hC x) (abs_nonneg _)

theorem locallyIntegrable_of_bounded {f : ℝ → ℝ} (hf : Measurable f)
    {C : ℝ} (hC : ∀ x, |f x| ≤ C) : LocallyIntegrable f volume := by
  apply (locallyIntegrable_const C).mono hf.aestronglyMeasurable
  exact ae_of_all _ fun x => (hC x).trans (le_abs_self C)

/-- The integral of a bounded kernel times the local error vanishes on every
fixed scaled ball. The radius factor is fixed before the height tends to zero. -/
theorem tendsto_local_dilation_error {f k : ℝ → ℝ} (hf : Measurable f)
    {C D : ℝ} (hC : ∀ x, |f x| ≤ C) (hD : ∀ u, |k u| ≤ D)
    {a : ℝ}
    (ha : Tendsto (fun r => ⨍ x in closedBall a r, ‖f x-f a‖) (𝓝[>] 0) (𝓝 0))
    {e : ℕ → ℝ} (he : ∀ n, 0 < e n) (he0 : Tendsto e atTop (𝓝 0))
    {R : ℝ} (hR : 0 < R) :
    Tendsto (fun n => ∫ u in closedBall 0 R, k u * (f (a+e n*u)-f a)) atTop (𝓝 0) := by
  have hr : Tendsto (fun n => e n*R) atTop (𝓝[>] 0) :=
    tendsto_nhdsWithin_iff.2 ⟨by simpa using he0.mul_const R,
      Eventually.of_forall fun n => mul_pos (he n) hR⟩
  have hb := (ha.comp hr).const_mul (2*R*D)
  simp only [mul_zero] at hb
  apply squeeze_zero_norm' _ hb
  filter_upwards with n
  calc
    ‖∫ u in closedBall 0 R, k u * (f (a+e n*u)-f a)‖ ≤
        ∫ u in closedBall 0 R, D * ‖f (a+e n*u)-f a‖ := by
      apply (norm_integral_le_integral_norm _).trans
      apply integral_mono_of_nonneg (ae_of_all _ fun _ => norm_nonneg _) _
        (ae_of_all _ fun u => by simpa only [norm_mul, Real.norm_eq_abs] using
          mul_le_mul_of_nonneg_right (hD u) (abs_nonneg (f (a+e n*u)-f a)))
      have hi : IntegrableOn (fun u => ‖f (a+e n*u)-f a‖) (closedBall 0 R) := by
        apply LocallyIntegrable.integrableOn_isCompact _ (isCompact_closedBall _ _)
        apply locallyIntegrable_of_bounded (by fun_prop) (C := 2*C)
        intro u
        simp only [Real.norm_eq_abs, abs_abs]
        exact (abs_sub (f (a+e n*u)) (f a)).trans (by linarith [hC (a+e n*u), hC a])
      exact hi.const_mul D
    _ = (2*R*D) * ⨍ x in closedBall a (e n*R), ‖f x-f a‖ := by
      have hv : (volume.restrict (closedBall a (e n*R))).real univ = 2*(e n*R) := by
        simpa [measureReal_def] using Real.volume_real_closedBall
          (a := a) (mul_pos (he n) hR).le
      rw [integral_const_mul, integral_closedBall_affine (fun x => ‖f x-f a‖) a R (he n),
        average_eq, hv]
      simp only [smul_eq_mul]
      field_simp [ne_of_gt (he n), ne_of_gt hR]

theorem tendsto_dilation_integral_of_average {f k : ℝ → ℝ} (hf : Measurable f)
    (hk : Integrable k) (hk1 : ∫ u, k u = 1)
    {C D : ℝ} (hC : ∀ x, |f x| ≤ C) (hD : ∀ u, |k u| ≤ D)
    {a : ℝ}
    (ha : Tendsto (fun r => ⨍ x in closedBall a r, ‖f x-f a‖) (𝓝[>] 0) (𝓝 0))
    {e : ℕ → ℝ} (he : ∀ n, 0 < e n) (he0 : Tendsto e atTop (𝓝 0)) :
    Tendsto (fun n => ∫ u, k u * f (a+e n*u)) atTop (𝓝 (f a)) := by
  have hi (n : ℕ) : Integrable (fun u => k u * f (a+e n*u)) :=
    integrable_bounded_mul hk (hf.comp (by fun_prop)) (fun u => hC _)
  have hd (n : ℕ) (u : ℝ) : |f (a+e n*u)-f a| ≤ 2*C :=
    (abs_sub _ _).trans (by linarith [hC (a+e n*u), hC a])
  have hid (n : ℕ) : Integrable (fun u => k u * (f (a+e n*u)-f a)) :=
    integrable_bounded_mul hk ((hf.comp (by fun_prop)).sub_const _) (hd n)
  have ht : Tendsto (fun j : ℕ => ∫ u in (closedBall 0 ((j:ℝ)+1))ᶜ, |k u|)
      atTop (𝓝 0) := by
    have hs : (⋂ j : ℕ, (closedBall (0:ℝ) ((j:ℝ)+1))ᶜ) = ∅ := by
      apply eq_empty_iff_forall_notMem.2
      intro u hu
      obtain ⟨j, hj⟩ := exists_nat_gt |u|
      have h := mem_iInter.mp hu j
      apply h
      simpa only [mem_closedBall, Real.dist_eq, sub_zero] using (by linarith : |u| ≤ (j:ℝ)+1)
    have h := tendsto_setIntegral_of_antitone
      (fun j : ℕ => (measurableSet_closedBall : MeasurableSet (closedBall (0:ℝ) ((j:ℝ)+1))).compl)
      (fun i j hij => compl_subset_compl.mpr (closedBall_subset_closedBall (by exact_mod_cast Nat.add_le_add_right hij 1)))
      ⟨0, hk.abs.integrableOn⟩
    simpa [hs] using h
  have hz : Tendsto (fun n => ∫ u, k u * (f (a+e n*u)-f a)) atTop (𝓝 0) := by
    rw [Metric.tendsto_nhds]
    intro δ hδ
    have htt := ht.const_mul (2*C)
    simp only [mul_zero] at htt
    obtain ⟨j, hj⟩ := (htt.eventually (gt_mem_nhds (half_pos hδ))).exists
    have hl := tendsto_local_dilation_error hf hC hD ha he he0
      (by positivity : 0 < (j:ℝ)+1)
    filter_upwards [hl.eventually (Metric.ball_mem_nhds _ (half_pos hδ))] with n hn
    have htail : ‖∫ u in (closedBall 0 ((j:ℝ)+1))ᶜ, k u * (f (a+e n*u)-f a)‖ ≤
        2*C * ∫ u in (closedBall 0 ((j:ℝ)+1))ᶜ, |k u| := by
      rw [← integral_const_mul]
      apply (norm_integral_le_integral_norm _).trans
      apply integral_mono_of_nonneg (ae_of_all _ fun _ => norm_nonneg _)
        (hk.abs.integrableOn.const_mul _) (ae_of_all _ fun u => ?_)
      change ‖k u * (f (a+e n*u)-f a)‖ ≤ 2*C*|k u|
      rw [norm_mul, Real.norm_eq_abs, Real.norm_eq_abs, mul_comm (2*C)]
      exact mul_le_mul_of_nonneg_left (hd n u) (abs_nonneg _)
    rw [dist_zero_right, ← integral_add_compl
      (s := closedBall 0 ((j:ℝ)+1)) measurableSet_closedBall (hid n)]
    exact (norm_add_le _ _).trans_lt (by
      simp only [dist_zero_right] at hn
      linarith)
  have heq (n : ℕ) : (∫ u, k u * (f (a+e n*u)-f a)) =
      (∫ u, k u * f (a+e n*u)) - f a := by
    simp_rw [mul_sub]
    rw [integral_sub (hi n) (hk.mul_const _), integral_mul_const, hk1, one_mul]
  simp_rw [heq] at hz
  exact tendsto_sub_nhds_zero_iff.mp hz

/-- A fixed sequence of positive dilations recovers every bounded measurable
function almost everywhere. The null set comes from Lebesgue differentiation. -/
theorem ae_tendsto_dilation_integral {f k : ℝ → ℝ} (hf : Measurable f)
    (hk : Integrable k) (hk1 : ∫ u, k u = 1)
    {C D : ℝ} (hC : ∀ x, |f x| ≤ C) (hD : ∀ u, |k u| ≤ D)
    {e : ℕ → ℝ} (he : ∀ n, 0 < e n) (he0 : Tendsto e atTop (𝓝 0)) :
    ∀ᵐ a ∂volume, Tendsto (fun n => ∫ u, k u * f (a+e n*u)) atTop (𝓝 (f a)) := by
  filter_upwards [(Besicovitch.vitaliFamily volume).ae_tendsto_average_norm_sub
    (locallyIntegrable_of_bounded hf hC)] with a ha
  exact tendsto_dilation_integral_of_average hf hk hk1 hC hD
    (ha.comp (Besicovitch.tendsto_filterAt volume a)) he he0

end GGC.Analysis
