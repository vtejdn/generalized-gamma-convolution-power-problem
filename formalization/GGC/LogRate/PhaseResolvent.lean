import GGC.StieltjesPhase
import GGC.LogRate.Resolvent
import GGC.LogRate.DriftBounds

/-! # Absolutely convergent phase cancellation in rate-ratio coordinates

API-020 reuses positive-half-line scaling. All subtractions of integrals below
are preceded by absolute integrability; the compensation kernel stays intact.
-/

noncomputable section
open MeasureTheory Set Filter

namespace GGC.LogRate

theorem integrable_scaledPhase_mul (P : ProbabilityMeasure PosReal) (b : ℝ)
    {k : ℝ → ℝ} {μ : Measure ℝ} (hk : Integrable k μ) :
    Integrable (fun u => stieltjesPhase P (b*u) * k u) μ := by
  have hp : Measurable (fun u : ℝ => (P, b*u)) := by fun_prop
  have hm := phase_jointlyMeasurable.comp hp
  apply hk.bdd_mul hm.aestronglyMeasurable (c := 1)
  exact Eventually.of_forall fun u => by
    change ‖stieltjesPhase P (b*u)‖ ≤ 1
    rw [Real.norm_eq_abs, abs_of_nonneg (stieltjesPhase_bounds P _).1]
    exact (stieltjesPhase_bounds P _).2

theorem integrable_phase_two_anchors (P : ProbabilityMeasure PosReal)
    {s b : ℝ} (hs : 0 < s) (hb : 0 < b) :
    IntegrableOn (fun t => stieltjesPhase P t * ((s+t)⁻¹-(b+t)⁻¹)) (Ioi 0) := by
  apply ((integrable_phase_anchor_one P hs).sub (integrable_phase_anchor_one P hb)).congr
  exact Eventually.of_forall fun t => by simp only [Pi.sub_apply]; ring

theorem phase_two_anchors (P : ProbabilityMeasure PosReal)
    {s b : ℝ} (hs : 0 < s) (hb : 0 < b) :
    Real.log (stieltjesMean P s) - Real.log (stieltjesMean P b) =
      ∫ t in Ioi 0, stieltjesPhase P t * ((s+t)⁻¹-(b+t)⁻¹) := by
  calc _ = (Real.log (stieltjesMean P s)-Real.log (stieltjesMean P 1)) -
      (Real.log (stieltjesMean P b)-Real.log (stieltjesMean P 1)) := by ring
    _ = _ := by
      rw [phase_anchor_one P hs, phase_anchor_one P hb,
        ← integral_sub (integrable_phase_anchor_one P hs) (integrable_phase_anchor_one P hb)]
      apply integral_congr_ae
      exact Eventually.of_forall fun t => by dsimp only; ring

theorem integrable_phase_scaled_resolventBracket (P : ProbabilityMeasure PosReal)
    {s b : ℝ} (hs : 0 < s) (hb : 0 < b) :
    IntegrableOn (fun u => stieltjesPhase P (b*u) *
      (b / (s+b*u) - 1 / (1+u))) (Ioi 0) :=
  integrable_scaledPhase_mul P b (integrableOn_scaled_resolventBracket hs hb)

/-- WIP-6.157, with no inverse moment at the zero endpoint. -/
theorem phase_scaled_resolventBracket (P : ProbabilityMeasure PosReal)
    {s b : ℝ} (hs : 0 < s) (hb : 0 < b) :
    Real.log (stieltjesMean P s) - Real.log (stieltjesMean P b) =
      ∫ u in Ioi 0, stieltjesPhase P (b*u) * (b / (s+b*u) - 1 / (1+u)) := by
  let f := fun t => stieltjesPhase P t * ((s+t)⁻¹-(b+t)⁻¹)
  have hscale := integral_comp_mul_left_Ioi f 0 hb
  simp only [mul_zero, smul_eq_mul] at hscale
  calc _ = ∫ t in Ioi 0, f t := phase_two_anchors P hs hb
    _ = b * ∫ u in Ioi 0, f (b*u) := by rw [hscale]; field_simp
    _ = _ := by
      rw [← integral_const_mul]
      apply setIntegral_congr_fun measurableSet_Ioi
      intro u hu
      dsimp only [f]
      have h₁ : s+b*u ≠ 0 := ne_of_gt (add_pos hs (mul_pos hb hu))
      have h₂ : 1+u ≠ 0 := by have : 0 < u := hu; positivity
      have h₃ : b+b*u ≠ 0 := ne_of_gt (add_pos hb (mul_pos hb hu))
      field_simp

theorem integrable_phase_compensated_resolvent (P : ProbabilityMeasure PosReal)
    {s b : ℝ} (hs : 0 < s) (hb : 0 < b) :
    IntegrableOn (fun u => stieltjesPhase P (b*u) *
      (((s+b*u)⁻¹-(s+b)⁻¹+b*Real.log u/(s+b)^2)/(u-1)^2)) (Ioi 0) :=
  integrable_scaledPhase_mul P b (integrableOn_compensated_resolvent hs hb)

/-- Integrated combined-kernel cancellation, justified in L¹ before subtraction. -/
theorem phase_integral_cancellation (P : ProbabilityMeasure PosReal)
    {s b : ℝ} (hs : 0 < s) (hb : 0 < b) :
    (∫ u in Ioi 0, stieltjesPhase P (b*u) *
      (((s+b*u)⁻¹-(s+b)⁻¹+b*Real.log u/(s+b)^2)/(u-1)^2)) -
      b/(s+b)^2 * phaseCorrection (fun u => stieltjesPhase P (b*u)) =
    b/(s+b)^2 * (Real.log (stieltjesMean P s)-Real.log (stieltjesMean P b)) := by
  have hi := integrable_phase_compensated_resolvent P hs hb
  have hk := integrable_scaledPhase_mul P b integrableOn_correctionKernel
  rw [phase_scaled_resolventBracket P hs hb, phaseCorrection,
    ← integral_const_mul, ← integral_const_mul, ← integral_sub hi (hk.const_mul _)]
  apply integral_congr_ae
  have hne : ∀ᵐ u : ℝ ∂volume.restrict (Ioi 0), u ≠ 1 := by
    apply ae_restrict_of_ae
    rw [ae_iff]
    simp
  filter_upwards [ae_restrict_mem measurableSet_Ioi, hne] with u hu h₁
  have hc := resolvent_cancellation hs hb hu h₁
  linear_combination stieltjesPhase P (b*u) * hc

end GGC.LogRate
