import GGC.StieltjesPhase
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-! # Narrow continuity of Stieltjes means and fixed-height phases

API-022: the varying-law step uses the standard bounded-continuous-test
characterization of narrow convergence. These are interior-height statements;
no pointwise continuity of the boundary phase is inferred from them.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC

theorem continuous_stieltjesMean_law {s : ℝ} (hs : 0 < s) :
    Continuous (fun P : ProbabilityMeasure PosReal => stieltjesMean P s) := by
  have hc : Continuous (fun b : PosReal => 1/(s+b.val)) :=
    continuous_const.div (continuous_const.add continuous_subtype_val)
      (fun b => ne_of_gt (add_pos hs b.property))
  have hb (b : PosReal) : ‖1/(s+b.val)‖ ≤ 1/s := by
    rw [Real.norm_eq_abs, abs_of_pos (one_div_pos.mpr (add_pos hs b.property))]
    exact one_div_le_one_div_of_le hs (le_add_of_nonneg_right b.property.le)
  let f : BoundedContinuousFunction PosReal ℝ :=
    BoundedContinuousFunction.mkOfBound ⟨_,hc⟩ (2/s) (fun b c => by
      rw [dist_eq_norm]
      exact (norm_sub_le _ _).trans ((add_le_add (hb b) (hb c)).trans_eq (by ring)))
  exact ProbabilityMeasure.continuous_integral_boundedContinuousFunction f

theorem continuous_complexStieltjesMean_law {z : ℂ} (hz : 0 < z.im) :
    Continuous (fun P : ProbabilityMeasure PosReal => complexStieltjesMean P z) := by
  have hn (b : PosReal) : z+(b.val:ℂ) ≠ 0 := by
    intro he
    have hi := congrArg Complex.im he
    simp only [Complex.add_im, Complex.ofReal_im, add_zero, Complex.zero_im] at hi
    linarith
  have hc : Continuous (fun b : PosReal => (z+(b.val:ℂ))⁻¹) :=
    (continuous_const.add (Complex.continuous_ofReal.comp continuous_subtype_val)).inv₀ hn
  have hb (b : PosReal) : ‖(z+(b.val:ℂ))⁻¹‖ ≤ 1/z.im := by
    rw [norm_inv, ← one_div]
    exact one_div_le_one_div_of_le hz (by simpa using Complex.im_le_norm (z+(b.val:ℂ)))
  let f : BoundedContinuousFunction PosReal ℂ :=
    BoundedContinuousFunction.mkOfBound ⟨_,hc⟩ (2/z.im) (fun b c => by
      rw [dist_eq_norm]
      exact (norm_sub_le _ _).trans ((add_le_add (hb b) (hb c)).trans_eq (by ring)))
  rw [continuous_iff_continuousAt]
  intro P
  exact (ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto ℂ).mp
    (tendsto_id : Tendsto (fun P : ProbabilityMeasure PosReal => P) (𝓝 P) (𝓝 P)) f

theorem abs_stieltjesMean_sub_le (P : ProbabilityMeasure PosReal) {s t : ℝ}
    (hs : 0 < s) (ht : 0 < t) :
    |stieltjesMean P s - stieltjesMean P t| ≤ |s - t| / (s * t) := by
  have hb (r : PosReal) : |1 / (s + r.val) - 1 / (t + r.val)| ≤ |s - t| / (s * t) := by
    have hsr := add_pos hs r.property
    have htr := add_pos ht r.property
    have he : 1 / (s + r.val) - 1 / (t + r.val) =
        (t - s) / ((s + r.val) * (t + r.val)) := by
      field_simp
      ring
    rw [he, abs_div, abs_of_pos (mul_pos hsr htr), abs_sub_comm]
    exact div_le_div_of_nonneg_left (abs_nonneg _) (mul_pos hs ht)
      (mul_le_mul (le_add_of_nonneg_right r.property.le)
        (le_add_of_nonneg_right r.property.le) ht.le hsr.le)
  unfold stieltjesMean
  rw [← integral_sub (integrable_stieltjesMean P hs) (integrable_stieltjesMean P ht)]
  have h := norm_integral_le_of_norm_le_const (μ := (P : Measure PosReal))
    (f := fun r : PosReal => 1 / (s + r.val) - 1 / (t + r.val))
    (Eventually.of_forall fun r => by simpa only [Real.norm_eq_abs] using hb r)
  simpa only [Real.norm_eq_abs, probReal_univ, mul_one] using h

theorem tendsto_stieltjesMean {ι : Type*} {l : Filter ι}
    {P : ι → ProbabilityMeasure PosReal} {Q : ProbabilityMeasure PosReal}
    (hP : Tendsto P l (𝓝 Q)) {s : ι → ℝ} {t : ℝ} (ht : 0 < t)
    (hs : Tendsto s l (𝓝 t)) :
    Tendsto (fun i => stieltjesMean (P i) (s i)) l (𝓝 (stieltjesMean Q t)) := by
  have hc : Tendsto (fun _ : ι => t) l (𝓝 t) := tendsto_const_nhds
  have herr : Tendsto (fun i => |t - s i| / (t * s i)) l (𝓝 0) := by
    simpa only [sub_self, abs_zero, zero_div] using!
      ((hc.sub hs).abs).div (hc.mul hs) (mul_ne_zero ht.ne' ht.ne')
  apply (((continuous_stieltjesMean_law ht).tendsto Q).comp hP).congr_dist
  apply squeeze_zero' (Eventually.of_forall fun _ => dist_nonneg) ?_ herr
  filter_upwards [hs.eventually (lt_mem_nhds ht)] with i hi
  rw [Real.dist_eq]
  exact abs_stieltjesMean_sub_le (P i) ht hi

theorem continuous_stieltjesMean :
    Continuous (fun x : ProbabilityMeasure PosReal × PosReal => stieltjesMean x.1 x.2.val) := by
  rw [continuous_iff_continuousAt]
  intro x
  exact tendsto_stieltjesMean continuous_fst.continuousAt x.2.property
    (continuous_subtype_val.comp continuous_snd).continuousAt

theorem continuous_phaseApprox_law (t : ℝ) (n : ℕ) :
    Continuous (fun P : ProbabilityMeasure PosReal => phaseApprox P t n) := by
  let z : ℂ := -(t:ℂ)+(phaseHeight n:ℂ)*Complex.I
  have hz : 0 < z.im := by simpa [z] using phaseHeight_pos n
  rw [continuous_iff_continuousAt]
  intro P
  have ha := Complex.continuousAt_arg (Complex.mem_slitPlane_iff.mpr
    (Or.inr (ne_of_lt (complexStieltjesMean_im_neg P hz))))
  have hc : ContinuousAt (fun Q : ProbabilityMeasure PosReal => complexStieltjesMean Q z) P :=
    (continuous_complexStieltjesMean_law hz).continuousAt
  have h := ha.comp (f := fun Q : ProbabilityMeasure PosReal => complexStieltjesMean Q z) hc
  exact h.neg.div_const Real.pi

/-- The canonical representative has the same Poisson integrals as every
represented phase; the a.e. equality is used only under the integral. -/
theorem phaseApprox_eq_poisson_canonical (P : ProbabilityMeasure PosReal) (t : ℝ) (n : ℕ) :
    phaseApprox P t n = ∫ u in Ioi 0,
      ProbabilityTheory.cauchyPDFReal t ⟨phaseHeight n, (phaseHeight_pos n).le⟩ u *
        stieltjesPhase P u := by
  obtain ⟨η,hη,_⟩ := External.SSV.phase_representation P
  rw [phaseApprox_eq_poisson hη]
  apply integral_congr_ae
  filter_upwards [(phase_eq_ae_of_representation hη).symm] with u hu
  rw [hu]

theorem tendsto_integral_phaseApprox_mul {P : ℕ → ProbabilityMeasure PosReal}
    {Q : ProbabilityMeasure PosReal} (hP : Tendsto P atTop (𝓝 Q))
    {k : ℝ → ℝ} {μ : Measure ℝ} (hk : Integrable k μ) (n : ℕ) :
    Tendsto (fun j => ∫ t, k t * phaseApprox (P j) t n ∂μ) atTop
      (𝓝 (∫ t, k t * phaseApprox Q t n ∂μ)) := by
  apply tendsto_integral_of_dominated_convergence (fun t => ‖k t‖)
  · intro j
    have hp : Measurable (fun t : ℝ => (P j,t)) := measurable_const.prodMk measurable_id
    exact hk.aestronglyMeasurable.mul ((measurable_phaseApprox n).comp hp).aestronglyMeasurable
  · exact hk.norm
  · intro j
    exact Eventually.of_forall fun t => by
      rw [norm_mul, Real.norm_eq_abs (phaseApprox _ _ _), abs_of_pos (phaseApprox_bounds _ _ _).1]
      exact mul_le_of_le_one_right (norm_nonneg _) (phaseApprox_bounds _ _ _).2.le
  · exact Eventually.of_forall fun t =>
      (((continuous_phaseApprox_law t n).tendsto Q).comp hP).const_mul (k t)

end GGC
