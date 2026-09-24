import GGC.LogRate.PosteriorResolvent
import GGC.Palm
import GGC.GammaDirichletTangent

/-! # Signed Palm transfer of the absolutely integrable resolvent kernel

The sampling-joint L¹ proof uses `W ≤ M` and the boundedness of `M |log M|`.
This precedes every signed joint-measure identity; no log-rate moment is assumed.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
namespace GGC.LogRate

def resolventPalmIntegrand (B : PosReal) (s : ℝ)
    (x : PosReal × ProbabilityMeasure PosReal) : ℝ :=
  x.1.val/(s+x.1.val)^2 * (digamma (B.val+1)+1+Real.log (stieltjesMean x.2 s))

@[fun_prop] theorem measurable_resolventPalmIntegrand (B : PosReal) (s : ℝ) :
    Measurable (resolventPalmIntegrand B s) := by
  unfold resolventPalmIntegrand
  fun_prop

theorem integral_norm_resolventPalmIntegrand (B : PosReal) (s : ℝ)
    (P : ProbabilityMeasure PosReal) :
    (∫ b, ‖resolventPalmIntegrand B s (b,P)‖ ∂(P : Measure PosReal)) =
      stieltjesWeight P s * |digamma (B.val+1)+1+Real.log (stieltjesMean P s)| := by
  simp only [resolventPalmIntegrand, Real.norm_eq_abs, abs_mul]
  have hn (b : PosReal) : 0 ≤ b.val/(s+b.val)^2 := div_nonneg b.property.le (sq_nonneg _)
  simp_rw [abs_of_nonneg (hn _)]
  rw [integral_mul_const]
  rfl

theorem integrable_resolventPalmIntegrand_samplingJoint
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal)
    {s : ℝ} (hs : 0 < s) :
    Integrable (fun x : ProbabilityMeasure PosReal × PosReal => resolventPalmIntegrand B s (x.2,x.1))
      (samplingJoint D) := by
  have hm : Measurable (fun x : ProbabilityMeasure PosReal × PosReal =>
      resolventPalmIntegrand B s (x.2,x.1)) :=
    (measurable_resolventPalmIntegrand B s).comp measurable_swap
  change Integrable _ ((D : Measure (ProbabilityMeasure PosReal)) ⊗ₘ evaluationKernel)
  apply (Measure.integrable_compProd_iff (μ := (D : Measure (ProbabilityMeasure PosReal)))
    (κ := evaluationKernel) hm.aestronglyMeasurable).2
  constructor
  · apply Eventually.of_forall
    intro P
    change Integrable (fun b : PosReal => b.val/(s+b.val)^2 *
      (digamma (B.val+1)+1+Real.log (stieltjesMean P s))) (P : Measure PosReal)
    exact (integrable_stieltjesWeight P hs).mul_const _
  · change Integrable (fun P : ProbabilityMeasure PosReal =>
      ∫ b, ‖resolventPalmIntegrand B s (b,P)‖ ∂(P : Measure PosReal))
      (D : Measure (ProbabilityMeasure PosReal))
    simp_rw [integral_norm_resolventPalmIntegrand B s]
    have hmeas : Measurable (fun P : ProbabilityMeasure PosReal =>
        stieltjesWeight P s * |digamma (B.val+1)+1+Real.log (stieltjesMean P s)|) := by fun_prop
    apply (integrable_stieltjes_log_kernel D (digamma (B.val+1)+1) hs).norm.mono'
      hmeas.aestronglyMeasurable
    exact Eventually.of_forall fun P => by
      change ‖stieltjesWeight P s * |digamma (B.val+1)+1+Real.log (stieltjesMean P s)|‖ ≤
        ‖stieltjesMean P s * (digamma (B.val+1)+1+Real.log (stieltjesMean P s))‖
      rw [Real.norm_eq_abs, Real.norm_eq_abs, abs_mul, abs_mul, abs_abs,
        abs_of_pos (stieltjesWeight_bounds P hs).1, abs_of_pos (stieltjesMean_pos P hs)]
      exact mul_le_mul_of_nonneg_right (stieltjesWeight_bounds P hs).2 (abs_nonneg _)

theorem canonicalGenerator_logResolvent_log
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal)
    {s : ℝ} (hs : 0 < s) (b : PosReal) :
    canonicalGenerator D B (logResolvent s) (Real.log b.val) =
      ∫ P, resolventPalmIntegrand B s (b,P)
        ∂(posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal)) := by
  simpa only [Real.exp_log b.property, resolventPalmIntegrand] using!
    canonicalGenerator_logResolvent D B hs (Real.log b.val)

theorem integrable_canonicalGenerator_logResolvent_rate
    {U : Measure PosReal} {D : ProbabilityMeasure (ProbabilityMeasure PosReal)}
    (hD : RandomMeasure.IsDirichletProcess U D) (B : PosReal)
    (hMass : U univ = ENNReal.ofReal B.val) {s : ℝ} (hs : 0 < s) :
    Integrable (fun b : PosReal => canonicalGenerator D B (logResolvent s) (Real.log b.val))
      (ENNReal.ofReal (1/B.val) • U) := by
  letI : IsFiniteMeasure U := hD.isFiniteMeasure
  have hp := (integrable_posteriorJoint_iff hD B hMass (measurable_resolventPalmIntegrand B s)).2
    (integrable_resolventPalmIntegrand_samplingJoint D B hs)
  have hi := hp.integral_compProd
  change Integrable (fun b => ∫ P, resolventPalmIntegrand B s (b,P)
    ∂(posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal)))
      (ENNReal.ofReal (1/B.val) • U) at hi
  simpa only [canonicalGenerator_logResolvent_log D B hs] using hi

/-- The averaged generator formula before identifying the current-law tangent. -/
theorem integral_canonicalGenerator_logResolvent_rate
    {U : Measure PosReal} {D : ProbabilityMeasure (ProbabilityMeasure PosReal)}
    (hD : RandomMeasure.IsDirichletProcess U D) (B : PosReal)
    (hMass : U univ = ENNReal.ofReal B.val) {s : ℝ} (hs : 0 < s) :
    (∫ b : PosReal, canonicalGenerator D B (logResolvent s) (Real.log b.val)
      ∂(ENNReal.ofReal (1/B.val) • U)) =
      ∫ P, stieltjesWeight P s * (digamma (B.val+1)+1+Real.log (stieltjesMean P s))
        ∂(D : Measure (ProbabilityMeasure PosReal)) := by
  simp_rw [canonicalGenerator_logResolvent_log D B hs]
  rw [← posterior_palm hD B hMass (measurable_resolventPalmIntegrand B s)
    (integrable_resolventPalmIntegrand_samplingJoint D B hs)]
  apply integral_congr_ae
  exact Eventually.of_forall fun P => by
    simp only [resolventPalmIntegrand, integral_mul_const, stieltjesWeight]

/-- The genuine current-law power derivative, with no positive-time GGC premise. -/
theorem integral_canonicalGenerator_eq_normalized_powerTangent
    {U : Measure PosReal} {D : ProbabilityMeasure (ProbabilityMeasure PosReal)}
    (hD : RandomMeasure.IsDirichletProcess U D) (hU : ThorinAdmissible U)
    (B : PosReal) (hMass : U univ = ENNReal.ofReal B.val) (μ : NonnegLaw)
    (hμ : ∀ t : ℝ, 0 < t → laplace μ t = Real.exp (-(∫ b : PosReal, Real.log (1+t/b.val) ∂U)))
    {s : ℝ} (hs : 0 < s) :
    (∫ b : PosReal, canonicalGenerator D B (logResolvent s) (Real.log b.val)
      ∂(ENNReal.ofReal (1/B.val) • U)) =
      (powerTangent μ s + powerLogDerivative μ 1 s)/B.val := by
  rw [integral_canonicalGenerator_logResolvent_rate hD B hMass hs]
  exact (normalized_powerTangent hD hU B hMass μ hμ hs).symm

end GGC.LogRate
