import GGC.StieltjesMean
import GGC.DampedMoments

/-! # Moment-free differentiation of Stieltjes means -/

noncomputable section
open MeasureTheory Set Filter Topology
namespace GGC
open RandomMeasure

def stieltjesSquare (P : ProbabilityMeasure PosReal) (s : ℝ) : ℝ :=
  ∫ b, 1 / (s + b.val)^2 ∂(P : Measure PosReal)

def stieltjesWeight (P : ProbabilityMeasure PosReal) (s : ℝ) : ℝ :=
  ∫ b, b.val / (s + b.val)^2 ∂(P : Measure PosReal)

@[fun_prop] theorem measurable_stieltjesSquare :
    Measurable (fun x : ProbabilityMeasure PosReal × ℝ => stieltjesSquare x.1 x.2) := by
  apply measurable_probability_integral measurable_fst
  unfold Function.uncurry
  fun_prop

@[fun_prop] theorem measurable_stieltjesWeight :
    Measurable (fun x : ProbabilityMeasure PosReal × ℝ => stieltjesWeight x.1 x.2) := by
  apply measurable_probability_integral measurable_fst
  unfold Function.uncurry
  fun_prop

theorem integrable_stieltjesSquare (P : ProbabilityMeasure PosReal) {s : ℝ} (hs : 0 < s) :
    Integrable (fun b : PosReal => 1 / (s+b.val)^2) (P : Measure PosReal) := by
  apply (integrable_const (1/s^2)).mono'
    ((show Measurable (fun b : PosReal => 1/(s+b.val)^2) by fun_prop).aestronglyMeasurable)
  apply Eventually.of_forall
  intro b
  rw [Real.norm_eq_abs, abs_of_nonneg (by positivity : 0 ≤ 1 / (s+b.val)^2)]
  exact one_div_le_one_div_of_le (sq_pos_of_pos hs) (by nlinarith [b.property])

theorem stieltjesSquare_bounds (P : ProbabilityMeasure PosReal) {s : ℝ} (hs : 0 < s) :
    0 ≤ stieltjesSquare P s ∧ stieltjesSquare P s ≤ (1/s) * stieltjesMean P s := by
  refine ⟨integral_nonneg (fun b => by positivity), ?_⟩
  rw [stieltjesSquare, stieltjesMean, ← integral_const_mul]
  apply integral_mono (integrable_stieltjesSquare P hs)
    ((integrable_stieltjesMean P hs).const_mul _)
  intro b
  have hb : 0 < s+b.val := add_pos hs b.property
  calc 1/(s+b.val)^2 = (1/(s+b.val)) * (1/(s+b.val)) := by
        simp only [one_div, pow_two, mul_inv_rev]
    _ ≤ (1/s) * (1/(s+b.val)) :=
      mul_le_mul_of_nonneg_right (one_div_le_one_div_of_le hs (by linarith [b.property]))
        (one_div_pos.mpr hb).le

theorem hasDerivAt_stieltjesMean (P : ProbabilityMeasure PosReal) {s : ℝ} (hs : 0 < s) :
    HasDerivAt (stieltjesMean P) (-stieltjesSquare P s) s := by
  have hd := hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (μ := (P : Measure PosReal)) (F := fun t b => 1 / (t+b.val))
    (F' := fun t b => -(1 / (t+b.val)^2)) (bound := fun _ => 1/(s/2)^2)
    (Ioi_mem_nhds (show s/2 < s by linarith))
    (Eventually.of_forall fun t =>
      (show Measurable (fun b : PosReal => 1/(t+b.val)) by fun_prop).aestronglyMeasurable)
    (integrable_stieltjesMean P hs)
    ((show Measurable (fun b : PosReal => -(1/(s+b.val)^2)) by fun_prop).aestronglyMeasurable)
    (Eventually.of_forall fun b t ht => by
      rw [norm_neg, Real.norm_eq_abs, abs_of_nonneg (by positivity : 0 ≤ 1/(t+b.val)^2)]
      apply one_div_le_one_div_of_le (sq_pos_of_pos (half_pos hs))
      have hp : s/2 ≤ t+b.val := le_trans ht.le (le_add_of_nonneg_right b.property.le)
      nlinarith [half_pos hs])
    (integrable_const _) (Eventually.of_forall fun b t ht => by
      have hp : t+b.val ≠ 0 := ne_of_gt (add_pos ((half_pos hs).trans ht) b.property)
      simpa only [one_div, Pi.inv_apply, id_eq, neg_div] using!
        ((hasDerivAt_id t).add_const b.val).inv hp)
  simpa only [stieltjesMean, stieltjesSquare, integral_neg] using! hd.2

theorem integrable_stieltjesWeight (P : ProbabilityMeasure PosReal) {s : ℝ} (hs : 0 < s) :
    Integrable (fun b : PosReal => b.val/(s+b.val)^2) (P : Measure PosReal) := by
  apply ((integrable_stieltjesMean P hs).sub ((integrable_stieltjesSquare P hs).const_mul s)).congr
  apply Eventually.of_forall
  intro b
  change 1/(s+b.val) - s*(1/(s+b.val)^2) = b.val/(s+b.val)^2
  field_simp
  ring

theorem stieltjesWeight_eq (P : ProbabilityMeasure PosReal) {s : ℝ} (hs : 0 < s) :
    stieltjesWeight P s = stieltjesMean P s - s * stieltjesSquare P s := by
  rw [stieltjesWeight, stieltjesMean, stieltjesSquare, ← integral_const_mul,
    ← integral_sub (integrable_stieltjesMean P hs) ((integrable_stieltjesSquare P hs).const_mul s)]
  apply integral_congr_ae
  exact Eventually.of_forall fun b => by
    field_simp
    ring

theorem stieltjesWeight_bounds (P : ProbabilityMeasure PosReal) {s : ℝ} (hs : 0 < s) :
    0 < stieltjesWeight P s ∧ stieltjesWeight P s ≤ stieltjesMean P s := by
  constructor
  · unfold stieltjesWeight
    rw [integral_pos_iff_support_of_nonneg (fun b => div_nonneg b.property.le (sq_nonneg _))
      (integrable_stieltjesWeight P hs)]
    have he : Function.support (fun b : PosReal => b.val/(s+b.val)^2) = univ := by
      ext b
      simp only [Function.mem_support, mem_univ, iff_true]
      exact ne_of_gt (div_pos b.property (sq_pos_of_pos (add_pos hs b.property)))
    rw [he]
    simp
  · rw [stieltjesWeight_eq P hs]
    exact sub_le_self _ (mul_nonneg hs.le (stieltjesSquare_bounds P hs).1)

theorem hasDerivAt_stieltjes_mul_log (P : ProbabilityMeasure PosReal) (c : ℝ)
    {s : ℝ} (hs : 0 < s) :
    HasDerivAt (fun t => stieltjesMean P t * (c + Real.log (stieltjesMean P t)))
      (-stieltjesSquare P s * (c + 1 + Real.log (stieltjesMean P s))) s := by
  have hm := hasDerivAt_stieltjesMean P hs
  have hp := ne_of_gt (stieltjesMean_pos P hs)
  convert! hm.mul ((hm.log hp).const_add c) using 1
  field_simp
  ring

theorem stieltjes_mul_log_bound {a : ℝ} (ha : 0 < a) :
    ∃ K : ℝ, 0 ≤ K ∧ ∀ (P : ProbabilityMeasure PosReal) (s : ℝ), a ≤ s →
      |stieltjesMean P s * Real.log (stieltjesMean P s)| ≤ K := by
  obtain ⟨K, hK⟩ := isCompact_Icc.exists_bound_of_continuousOn
    (s := Icc (0 : ℝ) (1/a)) Real.continuous_mul_log.continuousOn
  refine ⟨max K 0, le_max_right _ _, fun P s hs => ?_⟩
  have hp := stieltjesMean_pos P (ha.trans_le hs)
  have hm : stieltjesMean P s ≤ 1/a :=
    (stieltjesMean_le P (ha.trans_le hs)).trans (one_div_le_one_div_of_le ha hs)
  have hk : |stieltjesMean P s * Real.log (stieltjesMean P s)| ≤ K :=
    hK _ ⟨hp.le, hm⟩
  exact hk.trans (le_max_left _ _)

theorem stieltjes_log_kernel_bounds (c : ℝ) {a : ℝ} (ha : 0 < a) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (P : ProbabilityMeasure PosReal) (s : ℝ), a ≤ s →
      |stieltjesMean P s * (c + Real.log (stieltjesMean P s))| ≤ C ∧
      |-stieltjesSquare P s * (c + 1 + Real.log (stieltjesMean P s))| ≤ C := by
  obtain ⟨K, hK, hk⟩ := stieltjes_mul_log_bound ha
  let C₀ := |c| / a + K
  let C₁ := (1/a) * (|c+1| / a + K)
  have hc₀ : 0 ≤ C₀ := by dsimp [C₀]; positivity
  have hc₁ : 0 ≤ C₁ := by dsimp [C₁]; positivity
  refine ⟨C₀+C₁, add_nonneg hc₀ hc₁, fun P s hs => ?_⟩
  have hs' := ha.trans_le hs
  have hp := (stieltjesMean_pos P hs').le
  have hm : stieltjesMean P s ≤ 1/a :=
    (stieltjesMean_le P hs').trans (one_div_le_one_div_of_le ha hs)
  have hb (d : ℝ) : |stieltjesMean P s * (d+Real.log (stieltjesMean P s))| ≤ |d|/a+K := by
    rw [mul_add]
    refine (abs_add_le _ _).trans (add_le_add ?_ (hk P s hs))
    rw [abs_mul, abs_of_nonneg hp, div_eq_mul_inv]
    simpa only [one_div, mul_comm] using mul_le_mul_of_nonneg_right hm (abs_nonneg d)
  have hsq := stieltjesSquare_bounds P hs'
  have hsq' : stieltjesSquare P s ≤ (1/a) * stieltjesMean P s :=
    hsq.2.trans (mul_le_mul_of_nonneg_right (one_div_le_one_div_of_le ha hs) hp)
  constructor
  · exact (hb c).trans (le_add_of_nonneg_right hc₁)
  · calc |-stieltjesSquare P s * (c+1+Real.log (stieltjesMean P s))| =
        stieltjesSquare P s * |c+1+Real.log (stieltjesMean P s)| := by
          rw [abs_mul, abs_neg, abs_of_nonneg hsq.1]
      _ ≤ ((1/a)*stieltjesMean P s) * |c+1+Real.log (stieltjesMean P s)| :=
        mul_le_mul_of_nonneg_right hsq' (abs_nonneg _)
      _ = (1/a) * |stieltjesMean P s * (c+1+Real.log (stieltjesMean P s))| := by
        rw [abs_mul, abs_of_nonneg hp, mul_assoc]
      _ ≤ C₁ := mul_le_mul_of_nonneg_left (hb (c+1)) (by positivity)
      _ ≤ C₀+C₁ := le_add_of_nonneg_left hc₀

theorem integrable_stieltjes_log_kernel
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (c : ℝ) {s : ℝ} (hs : 0 < s) :
    Integrable (fun P => stieltjesMean P s * (c+Real.log (stieltjesMean P s)))
      (D : Measure (ProbabilityMeasure PosReal)) := by
  obtain ⟨C, _, hC⟩ := stieltjes_log_kernel_bounds c hs
  have hm : Measurable (fun P : ProbabilityMeasure PosReal => stieltjesMean P s) :=
    measurable_stieltjesMean.comp (measurable_id.prodMk measurable_const)
  apply (integrable_const C).mono' ((hm.mul (measurable_const.add hm.log)).aestronglyMeasurable)
  exact Eventually.of_forall fun P => (hC P s le_rfl).1

theorem integrable_stieltjes_log_deriv_kernel
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (c : ℝ) {s : ℝ} (hs : 0 < s) :
    Integrable (fun P => -stieltjesSquare P s * (c+1+Real.log (stieltjesMean P s)))
      (D : Measure (ProbabilityMeasure PosReal)) := by
  obtain ⟨C, _, hC⟩ := stieltjes_log_kernel_bounds c hs
  have hm : Measurable (fun P : ProbabilityMeasure PosReal => stieltjesMean P s) :=
    measurable_stieltjesMean.comp (measurable_id.prodMk measurable_const)
  have hsq : Measurable (fun P : ProbabilityMeasure PosReal => stieltjesSquare P s) :=
    measurable_stieltjesSquare.comp (measurable_id.prodMk measurable_const)
  apply (integrable_const C).mono' ((hsq.neg.mul (measurable_const.add hm.log)).aestronglyMeasurable)
  exact Eventually.of_forall fun P => (hC P s le_rfl).2

theorem integrable_random_stieltjesMean
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) {s : ℝ} (hs : 0 < s) :
    Integrable (fun P => stieltjesMean P s) (D : Measure (ProbabilityMeasure PosReal)) := by
  have hm : Measurable (fun P : ProbabilityMeasure PosReal => stieltjesMean P s) :=
    measurable_stieltjesMean.comp (measurable_id.prodMk measurable_const)
  apply (integrable_const (1/s)).mono' hm.aestronglyMeasurable
  exact Eventually.of_forall fun P => by
    rw [Real.norm_eq_abs, abs_of_pos (stieltjesMean_pos P hs)]
    exact stieltjesMean_le P hs

theorem hasDerivAt_integral_stieltjes_log_kernel
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (c : ℝ) {s : ℝ} (hs : 0 < s) :
    HasDerivAt
      (fun t => ∫ P, stieltjesMean P t * (c+Real.log (stieltjesMean P t))
        ∂(D : Measure (ProbabilityMeasure PosReal)))
      (∫ P, -stieltjesSquare P s * (c+1+Real.log (stieltjesMean P s))
        ∂(D : Measure (ProbabilityMeasure PosReal))) s := by
  obtain ⟨C, _, hC⟩ := stieltjes_log_kernel_bounds c (half_pos hs)
  have hm (t : ℝ) : Measurable (fun P : ProbabilityMeasure PosReal => stieltjesMean P t) :=
    measurable_stieltjesMean.comp (measurable_id.prodMk measurable_const)
  have hsq (t : ℝ) : Measurable (fun P : ProbabilityMeasure PosReal => stieltjesSquare P t) :=
    measurable_stieltjesSquare.comp (measurable_id.prodMk measurable_const)
  exact (hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (μ := (D : Measure (ProbabilityMeasure PosReal)))
    (F := fun t P => stieltjesMean P t * (c+Real.log (stieltjesMean P t)))
    (F' := fun t P => -stieltjesSquare P t * (c+1+Real.log (stieltjesMean P t)))
    (bound := fun _ => C) (Ioi_mem_nhds (show s/2 < s by linarith))
    (Eventually.of_forall fun t => ((hm t).mul (measurable_const.add (hm t).log)).aestronglyMeasurable)
    (integrable_stieltjes_log_kernel D c hs)
    (((hsq s).neg.mul (measurable_const.add (hm s).log)).aestronglyMeasurable)
    (Eventually.of_forall fun P t ht => (hC P t ht.le).2) (integrable_const C)
    (Eventually.of_forall fun P t ht => hasDerivAt_stieltjes_mul_log P c ((half_pos hs).trans ht))).2

end GGC
