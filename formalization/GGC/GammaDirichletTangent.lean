import GGC.GammaDirichlet
import GGC.PowerTangent
import GGC.StieltjesCalculus
import GGC.RateRealization

/-! # Gamma--Dirichlet evaluation of the actual current-law power tangent -/

noncomputable section
open MeasureTheory Set Filter Topology
namespace GGC
open RandomMeasure

theorem integral_gammaDirichletLaw
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B s : PosReal)
    (f : ℝ → ℝ) (hf : Measurable f)
    (hi : Integrable f ((gammaDirichletLaw D B s).law : Measure ℝ)) :
    (∫ x, f x ∂((gammaDirichletLaw D B s).law : Measure ℝ)) =
      ∫ P, ∫ g, f (g * stieltjesMean P s.val)
        ∂((gammaLaw B ⟨1, zero_lt_one⟩).law : Measure ℝ)
        ∂(D : Measure (ProbabilityMeasure PosReal)) := by
  rw [gammaDirichletLaw_toMeasure] at hi ⊢
  rw [integral_map (measurable_gammaDirichlet_product s).aemeasurable hf.aestronglyMeasurable]
  exact integral_prod_symm _ ((integrable_map_measure hf.aestronglyMeasurable
    (measurable_gammaDirichlet_product s).aemeasurable).mp hi)

theorem tiltedXLog_eq_dirichlet_of_tiltLaw
    (μ : NonnegLaw) (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B s : PosReal)
    (hLaw : exponentialTilt μ s = gammaDirichletLaw D B s) :
    tiltedXLog μ s.val = B.val *
      ∫ P, stieltjesMean P s.val * (digamma (B.val+1) + Real.log (stieltjesMean P s.val))
        ∂(D : Measure (ProbabilityMeasure PosReal)) := by
  have hi := integrable_self_mul_log_exponentialTilt μ s
  rw [hLaw] at hi
  rw [tiltedXLog_eq_integral, hLaw, integral_gammaDirichletLaw D B s _ (by fun_prop) hi,
    ← integral_const_mul]
  apply integral_congr_ae
  apply Eventually.of_forall
  intro P
  have hp := ne_of_gt (stieltjesMean_pos P s.property)
  have he (g : ℝ) : (g * stieltjesMean P s.val) * Real.log (g * stieltjesMean P s.val) =
      (g * Real.log g) * stieltjesMean P s.val +
        g * (stieltjesMean P s.val * Real.log (stieltjesMean P s.val)) := by
    by_cases hg : g = 0
    · simp [hg]
    · rw [Real.log_mul hg hp]
      ring
  simp_rw [he]
  rw [integral_add ((integrable_self_mul_log_gammaLaw B).mul_const _)
      ((integrable_self_gammaLaw B).mul_const _), integral_mul_const, integral_mul_const,
    integral_self_mul_log_gammaLaw, integral_self_gammaLaw]
  ring

theorem powerLogDerivative_one_eq_dirichlet_of_tiltLaw
    (μ : NonnegLaw) (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B s : PosReal)
    (hLaw : exponentialTilt μ s = gammaDirichletLaw D B s) :
    powerLogDerivative μ 1 s.val =
      B.val * ∫ P, stieltjesMean P s.val ∂(D : Measure (ProbabilityMeasure PosReal)) := by
  have hi := integrable_self_exponentialTilt μ s
  have he : powerLogDerivative μ 1 s.val =
      ∫ x : ℝ, x ∂((exponentialTilt μ s).law : Measure ℝ) := by
    rw [powerLogDerivative_eq_ratio μ 1 s.property, powerMoment_one, powerLaplace_one,
      integral_exponentialTilt]
    simp only [dampedMoment, pow_one, mul_comm (Real.exp _)]
  rw [hLaw] at hi he
  rw [he, integral_gammaDirichletLaw D B s (fun x => x) (by fun_prop) hi,
    ← integral_const_mul]
  apply integral_congr_ae
  exact Eventually.of_forall fun P => by
    dsimp only
    rw [integral_mul_const, integral_self_gammaLaw]

theorem normalized_powerTangent_of_tiltLaws
    (μ : NonnegLaw) (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal)
    (hLaw : ∀ s : PosReal, exponentialTilt μ s = gammaDirichletLaw D B s)
    {s : ℝ} (hs : 0 < s) :
    (powerTangent μ s + powerLogDerivative μ 1 s) / B.val =
      ∫ P, stieltjesWeight P s * (digamma (B.val+1) + 1 + Real.log (stieltjesMean P s))
        ∂(D : Measure (ProbabilityMeasure PosReal)) := by
  let c := digamma (B.val+1)
  let I := fun t => ∫ P, stieltjesMean P t * (c+Real.log (stieltjesMean P t))
    ∂(D : Measure (ProbabilityMeasure PosReal))
  let J := ∫ P, -stieltjesSquare P s * (c+1+Real.log (stieltjesMean P s))
    ∂(D : Measure (ProbabilityMeasure PosReal))
  have hI : HasDerivAt I J s := hasDerivAt_integral_stieltjes_log_kernel D c hs
  have hA : HasDerivAt (fun t => t * tiltedXLog μ t) (B.val * I s + s * (B.val * J)) s := by
    have hd : HasDerivAt (fun t => t * (B.val * I t)) (B.val * I s + s * (B.val * J)) s := by
      convert! (hasDerivAt_id s).mul (hI.const_mul B.val) using 1
      simp only [id_eq, one_mul]
    apply hd.congr_of_eventuallyEq
    filter_upwards [eventually_gt_nhds hs] with t ht
    rw [tiltedXLog_eq_dirichlet_of_tiltLaw μ D B ⟨t,ht⟩ (hLaw ⟨t,ht⟩)]
  have hT : powerTangent μ s = B.val * I s + s * (B.val * J) :=
    (hasDerivAt_mul_tiltedXLog_powerTangent μ hs).unique hA
  have hg := powerLogDerivative_one_eq_dirichlet_of_tiltLaw μ D B ⟨s,hs⟩ (hLaw ⟨s,hs⟩)
  have hi := integrable_stieltjes_log_kernel D c hs
  have hj := (integrable_stieltjes_log_deriv_kernel D c hs).const_mul s
  have hm := integrable_random_stieltjesMean D hs
  calc (powerTangent μ s + powerLogDerivative μ 1 s) / B.val =
      I s + s * J + ∫ P, stieltjesMean P s ∂(D : Measure (ProbabilityMeasure PosReal)) := by
        rw [hT, hg]
        field_simp [ne_of_gt B.property]
    _ = ∫ P, (stieltjesMean P s * (c+Real.log (stieltjesMean P s)) +
      s * (-stieltjesSquare P s * (c+1+Real.log (stieltjesMean P s)))) + stieltjesMean P s
        ∂(D : Measure (ProbabilityMeasure PosReal)) := by
      have hsum := integral_add (hi.add hj) hm
      have hpair := integral_add hi hj
      simp only [Pi.add_apply] at hsum hpair
      rw [hsum, hpair, integral_const_mul]
    _ = _ := by
      apply integral_congr_ae
      exact Eventually.of_forall fun P => by
        dsimp only
        rw [stieltjesWeight_eq P hs]
        dsimp only [c]
        ring

/-- Blueprint A's normalized identity, with the genuine DP and current-law premises. -/
theorem normalized_powerTangent {U : Measure PosReal}
    {D : ProbabilityMeasure (ProbabilityMeasure PosReal)} (hD : IsDirichletProcess U D)
    (hU : ThorinAdmissible U) (B : PosReal) (hMass : U univ = ENNReal.ofReal B.val)
    (μ : NonnegLaw)
    (hμ : ∀ t : ℝ, 0 < t → laplace μ t = Real.exp (-(∫ b : PosReal, Real.log (1+t/b.val) ∂U)))
    {s : ℝ} (hs : 0 < s) :
    (powerTangent μ s + powerLogDerivative μ 1 s) / B.val =
      ∫ P, stieltjesWeight P s * (digamma (B.val+1) + 1 + Real.log (stieltjesMean P s))
        ∂(D : Measure (ProbabilityMeasure PosReal)) :=
  normalized_powerTangent_of_tiltLaws μ D B
    (fun t => tiltedLaw_eq_gammaDirichlet hD hU B hMass μ hμ t) hs

/-- The finite-base tangent theorem requires no supplied DP law: the common-space
construction provides one, including for atomic and mixed Thorin bases. -/
theorem exists_normalized_powerTangent (U : Measure PosReal) [IsFiniteMeasure U]
    (hU : ThorinAdmissible U) (B : PosReal) (hMass : U univ = ENNReal.ofReal B.val)
    (μ : NonnegLaw)
    (hμ : ∀ t : ℝ, 0 < t → laplace μ t = Real.exp (-(∫ b : PosReal, Real.log (1+t/b.val) ∂U))) :
    ∃ D : ProbabilityMeasure (ProbabilityMeasure PosReal), IsDirichletProcess U D ∧
      ∀ s : ℝ, 0 < s → (powerTangent μ s + powerLogDerivative μ 1 s) / B.val =
        ∫ P, stieltjesWeight P s * (digamma (B.val+1) + 1 + Real.log (stieltjesMean P s))
          ∂(D : Measure (ProbabilityMeasure PosReal)) := by
  obtain ⟨D, hD⟩ := exists_dirichletProcess U (by
    rw [hMass]
    exact ne_of_gt (ENNReal.ofReal_pos.mpr B.property))
  exact ⟨D, hD, fun _ hs => normalized_powerTangent hD hU B hMass μ hμ hs⟩

end GGC
