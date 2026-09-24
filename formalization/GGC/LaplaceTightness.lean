import GGC.LaplaceContinuity
import GGC.Foundations.TailMoments

/-! # Moment-free tightness from a common Laplace lower bound

The generic tail estimates retain their public names for existing consumers.
Their proofs and the tightness criterion are independent of all literature inputs.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology ENNReal
namespace GGC.Identification
open GGC.Analysis

theorem measureReal_Iic_exp_neg_le_laplace (μ : NonnegLaw) (r : ℝ) :
    (μ.law : Measure ℝ).real (Iic (Real.exp (-r))) ≤ Real.exp 1*laplace μ (Real.exp r) := by
  have hi := (laplace_integrable μ (Real.exp_pos r).le).const_mul (Real.exp 1)
  have h0 : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 ≤ Real.exp 1*Real.exp (-Real.exp r*x) :=
    Eventually.of_forall fun _ => by positivity
  have hb := measureReal_le_integral hi h0 (s := Iic (Real.exp (-r))) (fun x hx => by
    rw [← Real.exp_add, Real.one_le_exp_iff]
    have hm := mul_le_mul_of_nonneg_left hx (Real.exp_pos r).le
    rw [← Real.exp_add, add_neg_cancel, Real.exp_zero] at hm
    linarith)
  simpa only [integral_const_mul, laplace] using hb

theorem exp_neg_one_le_half : Real.exp (-1) ≤ (1 : ℝ)/2 := by
  have h : 2 ≤ Real.exp 1 := by linarith [Real.add_one_le_exp (1 : ℝ)]
  rw [Real.exp_neg]
  simpa only [one_div] using (inv_le_inv₀ (Real.exp_pos 1) (by norm_num : (0 : ℝ) < 2)).mpr h

theorem measureReal_Ioi_exp_le_one_sub_laplace (μ : NonnegLaw) (r : ℝ) :
    (μ.law : Measure ℝ).real (Ioi (Real.exp r)) ≤ 2*(1-laplace μ (Real.exp (-r))) := by
  have hi : Integrable (fun x : ℝ => 2*(1-Real.exp (-Real.exp (-r)*x))) (μ.law : Measure ℝ) :=
    ((integrable_const 1).sub (laplace_integrable μ (Real.exp_pos (-r)).le)).const_mul (2 : ℝ)
  have h0 : ∀ᵐ x ∂(μ.law : Measure ℝ), 0 ≤ 2*(1-Real.exp (-Real.exp (-r)*x)) := by
    filter_upwards [laplace_integrand_le_one μ (Real.exp_pos (-r)).le] with x hx
    linarith
  have hb := measureReal_le_integral hi h0 (s := Ioi (Real.exp r)) (fun x hx => by
    have hm := mul_le_mul_of_nonneg_left hx.le (Real.exp_pos (-r)).le
    rw [← Real.exp_add, neg_add_cancel, Real.exp_zero] at hm
    have he : Real.exp (-Real.exp (-r)*x) ≤ Real.exp (-1) := Real.exp_le_exp.mpr (by linarith)
    linarith [exp_neg_one_le_half])
  rw [integral_const_mul, integral_sub (integrable_const 1) (laplace_integrable μ (Real.exp_pos (-r)).le)] at hb
  simpa [laplace] using! hb

end GGC.Identification

namespace GGC

/-- A family of nonnegative probability laws is tight if their Laplace
transforms share a lower bound tending to one from the right at zero.
No moment or regularity condition on the lower bound is required. -/
theorem isTightMeasureSet_of_laplace_lower_bound {ι : Type*}
    (μs : ι → NonnegLaw) {L : ℝ → ℝ}
    (hbound : ∀ i s, 0 < s → L s ≤ laplace (μs i) s)
    (hzero : Tendsto L (𝓝[>] 0) (𝓝 1)) :
    IsTightMeasureSet {((μs i).law : Measure ℝ) | i : ι} := by
  rw [isTightMeasureSet_iff_exists_isCompact_measure_compl_le]
  intro ε hε
  by_cases htop : ε = ∞
  · subst ε
    exact ⟨∅, isCompact_empty, fun _ _ => le_top⟩
  have hδ : 0 < ε.toReal := ENNReal.toReal_pos (ne_of_gt hε) htop
  have hL : Tendsto (fun r : ℝ => L (Real.exp (-r))) atTop (𝓝 1) :=
    hzero.comp (Real.tendsto_exp_atBot_nhdsGT.comp tendsto_neg_atTop_atBot)
  have htail : Tendsto (fun r : ℝ => 2 * (1 - L (Real.exp (-r)))) atTop (𝓝 0) := by
    convert (tendsto_const_nhds.sub hL).const_mul (2 : ℝ) using 1
    norm_num
  obtain ⟨r, hr⟩ := (htail.eventually (gt_mem_nhds hδ)).exists
  refine ⟨Icc 0 (Real.exp r), isCompact_Icc, ?_⟩
  rintro _ ⟨i, rfl⟩
  have hm : ((μs i).law : Measure ℝ) (Icc 0 (Real.exp r))ᶜ ≤
      ((μs i).law : Measure ℝ) (Ioi (Real.exp r)) := by
    apply measure_mono_ae
    filter_upwards [(μs i).nonneg] with x hx
    intro hc
    change Real.exp r < x
    by_contra h
    exact hc ⟨hx, le_of_not_gt h⟩
  have hreal : ((μs i).law : Measure ℝ).real (Icc 0 (Real.exp r))ᶜ ≤ ε.toReal := by
    calc
      _ ≤ ((μs i).law : Measure ℝ).real (Ioi (Real.exp r)) :=
        ENNReal.toReal_mono (measure_ne_top _ _) hm
      _ ≤ 2 * (1 - laplace (μs i) (Real.exp (-r))) :=
        Identification.measureReal_Ioi_exp_le_one_sub_laplace (μs i) r
      _ ≤ 2 * (1 - L (Real.exp (-r))) := by
        linarith [hbound i (Real.exp (-r)) (Real.exp_pos (-r))]
      _ ≤ ε.toReal := hr.le
  exact (ENNReal.toReal_le_toReal (measure_ne_top _ _) htop).mp hreal

/-- Tightness gives one subsequence converging to an actual nonnegative
probability law. Nonnegative support is preserved by the narrow limit. -/
theorem exists_nonnegLaw_subseq_of_isTightMeasureSet {μs : ℕ → NonnegLaw}
    (ht : IsTightMeasureSet {((μs n).law : Measure ℝ) | n : ℕ}) :
    ∃ μ : NonnegLaw, ∃ ns : ℕ → ℕ, StrictMono ns ∧
      Tendsto (fun n => (μs (ns n)).law) atTop (𝓝 μ.law) := by
  have hcomp : IsCompact (closure (range (fun n => (μs n).law))) :=
    isCompact_closure_of_isTightMeasureSet (by simpa using ht)
  obtain ⟨ν, _, ns, hns, hlim⟩ := hcomp.tendsto_subseq
    (fun n => subset_closure (mem_range_self n))
  have hv : ∀ᵐ x ∂(ν : Measure ℝ), 0 ≤ x :=
    nonnegative_of_narrow_limit hlim (fun n => (μs (ns n)).nonneg)
  exact ⟨⟨ν, hv⟩, ns, hns, hlim⟩

/-- A tight sequence with convergent positive-parameter Laplace transforms
realizes the limiting transform as a nonnegative probability law.
The same subsequence identifies every Laplace parameter. -/
theorem exists_nonnegLaw_of_laplace_tendsto {μs : ℕ → NonnegLaw} {L : ℝ → ℝ}
    (ht : IsTightMeasureSet {((μs n).law : Measure ℝ) | n : ℕ})
    (hL : ∀ s : ℝ, 0 < s → Tendsto (fun n => laplace (μs n) s) atTop (𝓝 (L s))) :
    ∃ μ : NonnegLaw, ∀ s : ℝ, 0 < s → laplace μ s = L s := by
  obtain ⟨μ, ns, hns, hlim⟩ := exists_nonnegLaw_subseq_of_isTightMeasureSet ht
  refine ⟨μ, fun s hs => ?_⟩
  exact tendsto_nhds_unique (tendsto_laplace_of_narrow hlim hs.le)
    ((hL s hs).comp hns.tendsto_atTop)

end GGC
