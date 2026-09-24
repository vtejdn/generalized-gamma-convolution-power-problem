import GGC.Thorin.Basic
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-!
# Normalization of the Thorin transform at zero

Admissibility alone gives right continuity and value one at zero. The proof
uses domination on the original Thorin measure and does not assume a realizing
probability law, finite total mass, or any moment bound.
-/

noncomputable section
open MeasureTheory Filter Set Topology
namespace GGC

/-- The logarithmic exponent vanishes as the Laplace parameter decreases to zero. -/
theorem ThorinAdmissible.tendsto_integral_log_zero {U : Measure PosReal}
    (hU : ThorinAdmissible U) :
    Tendsto (fun s : ℝ => ∫ b : PosReal, Real.log (1 + s / b.val) ∂U)
      (𝓝[>] 0) (𝓝 0) := by
  have ht := tendsto_integral_filter_of_dominated_convergence
    (μ := U) (F := fun s : ℝ => fun b : PosReal => Real.log (1 + s / b.val))
    (f := fun _ => (0 : ℝ)) (l := 𝓝[>] (0 : ℝ))
    (fun b : PosReal => Real.log (1 + 1 / b.val))
    (Eventually.of_forall fun _ =>
      (show Measurable (fun b : PosReal => Real.log (1 + _ / b.val)) by
        fun_prop).aestronglyMeasurable)
    (by
      filter_upwards [self_mem_nhdsWithin,
        (show ∀ᶠ s : ℝ in 𝓝 0, s < 1 from Iio_mem_nhds zero_lt_one).filter_mono
          nhdsWithin_le_nhds] with s hs hs1
      apply Eventually.of_forall
      intro b
      have hspos : 0 < s := hs
      have hnonneg : 0 ≤ Real.log (1 + s / b.val) :=
        Real.log_nonneg (by linarith [div_nonneg hspos.le b.property.le])
      rw [Real.norm_eq_abs, abs_of_nonneg hnonneg]
      apply Real.log_le_log (add_pos_of_pos_of_nonneg zero_lt_one
        (div_nonneg hspos.le b.property.le))
      linarith [div_le_div_of_nonneg_right hs1.le b.property.le])
    hU (Eventually.of_forall fun b => by
      have hc : ContinuousAt (fun s : ℝ => Real.log (1 + s / b.val)) 0 := by
        fun_prop (disch := norm_num)
      simpa using hc.tendsto.mono_left (nhdsWithin_le_nhds (s := Ioi (0 : ℝ))))
  simpa only [integral_zero] using ht

@[simp]
theorem thorinLaplace_zero (d : ThorinData) : thorinLaplace d 0 = 1 := by
  simp [thorinLaplace]

/-- The normalization is analytic and independent of Thorin realization. -/
theorem tendsto_thorinLaplace_zero (d : ThorinData) :
    Tendsto (thorinLaplace d) (𝓝[>] (0 : ℝ)) (𝓝 1) := by
  unfold thorinLaplace
  have hparam : Tendsto (fun s : ℝ => s) (𝓝[>] 0) (𝓝 0) :=
    tendsto_id.mono_left nhdsWithin_le_nhds
  have harg : Tendsto (fun s : ℝ => -d.drift * s -
      ∫ b : PosReal, Real.log (1 + s / b.val) ∂d.measure) (𝓝[>] 0) (𝓝 0) := by
    simpa only [mul_zero, sub_self] using (hparam.const_mul (-d.drift)).sub
      d.admissible.tendsto_integral_log_zero
  simpa only [Function.comp_def, Real.exp_zero] using
    (Real.continuous_exp.tendsto 0).comp harg

end GGC
