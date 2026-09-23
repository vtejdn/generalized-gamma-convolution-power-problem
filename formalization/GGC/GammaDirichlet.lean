import GGC.BetaPosterior
import GGC.ExponentialTilt
import GGC.Thorin
import External.James

/-! # Concrete gamma--Dirichlet products and the beta posterior adapter

The law is a product pushforward, hence encodes independence. Distributional
identification uses the explicit James contracts; analytic moment estimates
remain in axiom-free modules.
-/

noncomputable section
open MeasureTheory Set
open scoped ENNReal

namespace GGC
open RandomMeasure

local instance : PolishSpace PosReal := isOpen_Ioi.polishSpace

theorem posteriorMixture_isDirichlet {U : Measure PosReal}
    {D : ProbabilityMeasure (ProbabilityMeasure PosReal)} (hD : IsDirichletProcess U D)
    (B : PosReal) (hMass : U univ = ENNReal.ofReal B.val) (b : PosReal) :
    IsDirichletProcess (U + Measure.dirac b) (posteriorMixtureLaw D B b) :=
  External.James.beta_atom_posterior U D hD B.val B.property hMass
    (betaWeightLaw B) (betaWeightLaw_map_val B) b

private theorem measurable_gammaDirichlet_product (s : PosReal) :
    Measurable (fun x : ℝ × ProbabilityMeasure PosReal => x.1 * stieltjesMean x.2 s.val) := by
  have hp : Measurable (fun x : ℝ × ProbabilityMeasure PosReal => (x.2,s.val)) :=
    measurable_snd.prodMk measurable_const
  have hm := measurable_stieltjesMean.comp hp
  exact measurable_fst.mul hm

/-- The actual law of `G_B M_P(s)`, with independent gamma and random P. -/
def gammaDirichletLaw (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B s : PosReal) :
    NonnegLaw where
  law := ((gammaLaw B ⟨1, zero_lt_one⟩).law.prod D).map
    (measurable_gammaDirichlet_product s).aemeasurable
  nonneg := by
    apply (ae_map_iff (measurable_gammaDirichlet_product s).aemeasurable measurableSet_Ici).2
    have hg := (Measure.quasiMeasurePreserving_fst
      (μ := ((gammaLaw B ⟨1, zero_lt_one⟩).law : Measure ℝ))
      (ν := (D : Measure (ProbabilityMeasure PosReal)))).ae (gammaLaw B ⟨1, zero_lt_one⟩).nonneg
    filter_upwards [hg] with x hx
    exact mul_nonneg hx (stieltjesMean_pos x.2 s.property).le

theorem gammaDirichletLaw_toMeasure (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B s : PosReal) :
    ((gammaDirichletLaw D B s).law : Measure ℝ) =
      Measure.map (fun x : ℝ × ProbabilityMeasure PosReal => x.1 * stieltjesMean x.2 s.val)
        (((gammaLaw B ⟨1, zero_lt_one⟩).law : Measure ℝ).prod
          (D : Measure (ProbabilityMeasure PosReal))) := rfl

theorem laplace_gammaDirichletLaw (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B s : PosReal) {t : ℝ} (ht : 0 ≤ t) :
    laplace (gammaDirichletLaw D B s) t =
      ∫ P, (1 + t * stieltjesMean P s.val)^(-B.val) ∂(D : Measure (ProbabilityMeasure PosReal)) := by
  have hi : Integrable (fun x : ℝ × ProbabilityMeasure PosReal =>
      Real.exp (-t * (x.1 * stieltjesMean x.2 s.val)))
      (((gammaLaw B ⟨1, zero_lt_one⟩).law : Measure ℝ).prod
        (D : Measure (ProbabilityMeasure PosReal))) := by
    have hm : Measurable (fun x : ℝ => Real.exp (-t*x)) := by fun_prop
    have hl := laplace_integrable (gammaDirichletLaw D B s) ht
    rw [gammaDirichletLaw_toMeasure] at hl
    exact (integrable_map_measure hm.aestronglyMeasurable
      (measurable_gammaDirichlet_product s).aemeasurable).mp hl
  unfold laplace
  rw [gammaDirichletLaw_toMeasure, integral_map (measurable_gammaDirichlet_product s).aemeasurable
    (by fun_prop), integral_prod_symm _ hi]
  apply integral_congr_ae
  apply Filter.Eventually.of_forall
  intro P
  change (∫ x, Real.exp (-t * (x * stieltjesMean P s.val))
    ∂((gammaLaw B ⟨1, zero_lt_one⟩).law : Measure ℝ)) = _
  have he : (fun x : ℝ => Real.exp (-t * (x * stieltjesMean P s.val))) =
      (fun x : ℝ => Real.exp (-(t * stieltjesMean P s.val) * x)) := by
    funext x
    congr 1
    ring
  rw [he]
  change laplace (gammaLaw B ⟨1, zero_lt_one⟩) (t * stieltjesMean P s.val) = _
  rw [laplace_gammaLaw B ⟨1, zero_lt_one⟩ (mul_nonneg ht (stieltjesMean_pos P s.property).le)]
  change (1 : ℝ)^B.val / (1 + t * stieltjesMean P s.val)^B.val =
    (1 + t * stieltjesMean P s.val)^(-B.val)
  rw [Real.rpow_neg (by linarith [mul_nonneg ht (stieltjesMean_pos P s.property).le])]
  simp only [Real.one_rpow, one_div]

theorem dirichletMean_laplace {U : Measure PosReal}
    {D : ProbabilityMeasure (ProbabilityMeasure PosReal)} (hD : IsDirichletProcess U D)
    (B : PosReal) (hMass : U univ = ENNReal.ofReal B.val) (s : PosReal)
    {t : ℝ} (ht : 0 ≤ t) :
    laplace (gammaDirichletLaw D B s) t =
      Real.exp (-(∫ b : PosReal, Real.log (1 + t / (s.val + b.val)) ∂U)) := by
  letI : IsFiniteMeasure U := hD.isFiniteMeasure
  have hlog : Integrable (fun b : PosReal => Real.log (1 + t / (s.val + b.val))) U := by
    apply (integrable_const (Real.log (1 + t / s.val))).mono'
      ((show Measurable (fun b : PosReal => Real.log (1 + t / (s.val + b.val))) by
        fun_prop).aestronglyMeasurable)
    apply Filter.Eventually.of_forall
    intro b
    have hg : 0 ≤ t / (s.val + b.val) := div_nonneg ht (add_pos s.property b.property).le
    rw [Real.norm_eq_abs, abs_of_nonneg (Real.log_nonneg (by linarith))]
    apply Real.log_le_log (by linarith)
    linarith [div_le_div_of_nonneg_left ht s.property (le_add_of_nonneg_right b.property.le)]
  have hj := (External.James.markov_krein U D hD B.val B.property hMass
    (fun b : PosReal => t / (s.val + b.val)) (by fun_prop)
    (fun b => div_nonneg ht (add_pos s.property b.property).le) hlog).2
  rw [laplace_gammaDirichletLaw D B s ht]
  convert! hj using 1
  congr 1
  funext P
  have hi : (∫ b : PosReal, t / (s.val + b.val) ∂(P : Measure PosReal)) =
      t * stieltjesMean P s.val := by
    simp only [div_eq_mul_inv, stieltjesMean, one_mul, integral_const_mul]
  rw [hi]

/-- Each actual tilted marginal is the independent gamma--Dirichlet product.
This claims equality of laws for a fixed s, with no coupling of different tilts. -/
theorem tiltedLaw_eq_gammaDirichlet {U : Measure PosReal}
    {D : ProbabilityMeasure (ProbabilityMeasure PosReal)} (hD : IsDirichletProcess U D)
    (hU : ThorinAdmissible U) (B : PosReal) (hMass : U univ = ENNReal.ofReal B.val)
    (μ : NonnegLaw)
    (hμ : ∀ t : ℝ, 0 < t → laplace μ t = Real.exp (-(∫ b : PosReal, Real.log (1 + t / b.val) ∂U)))
    (s : PosReal) : exponentialTilt μ s = gammaDirichletLaw D B s := by
  apply nonnegLaw_eq_of_laplace_eq
  intro t ht
  have hst : 0 < s.val + t := add_pos s.property ht
  rw [laplace_exponentialTilt, hμ _ hst, hμ _ s.property,
    dirichletMean_laplace hD B hMass s ht.le, ← Real.exp_sub]
  congr 1
  have hid : (∫ b : PosReal, Real.log (1 + t / (s.val + b.val)) ∂U) =
      (∫ b : PosReal, Real.log (1 + (s.val + t) / b.val) ∂U) -
      (∫ b : PosReal, Real.log (1 + s.val / b.val) ∂U) := by
    rw [← integral_sub (hU.integrable_log hst.le) (hU.integrable_log s.property.le)]
    apply integral_congr_ae
    apply Filter.Eventually.of_forall
    intro b
    change Real.log (1 + t / (s.val + b.val)) =
      Real.log (1 + (s.val + t) / b.val) - Real.log (1 + s.val / b.val)
    have hp : 0 < 1 + (s.val + t) / b.val := by linarith [div_pos hst b.property]
    have hp' : 0 < 1 + s.val / b.val := by linarith [div_pos s.property b.property]
    rw [← Real.log_div (ne_of_gt hp) (ne_of_gt hp')]
    congr 1
    field_simp [ne_of_gt hp', ne_of_gt b.property, ne_of_gt (add_pos s.property b.property),
      ne_of_gt (add_pos b.property s.property)]
    ring
  linarith

end GGC
