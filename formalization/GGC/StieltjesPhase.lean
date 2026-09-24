import GGC.StieltjesMean
import GGC.Foundations.ProbabilityBorel
import GGC.Foundations.PoissonBoundary
import External.SSV
import Mathlib.MeasureTheory.Function.SpecialFunctions.Basic
import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap
import Mathlib.MeasureTheory.Measure.ResolventTransform

/-! # The canonical measurable Stieltjes phase

The representative is the limsup of the normalized negative argument along
the heights `1 / (n + 1)`. All constructions use actual probability measures
on positive rates and their Giry measurable structure. No boundary limit at
every point, endpoint moment, or representation theorem is assumed here.
-/

noncomputable section
open MeasureTheory Set Filter

namespace GGC

def complexStieltjesMean (P : ProbabilityMeasure PosReal) (z : ℂ) : ℂ :=
  ∫ b, (z + (b.val : ℂ))⁻¹ ∂(P : Measure PosReal)

/-- mathlib uses `(b - a)⁻¹`; our positive-rate convention is its value at `a = -z`. -/
theorem complexStieltjesMean_eq_resolventTransform (P : ProbabilityMeasure PosReal) (z : ℂ) :
    complexStieltjesMean P z =
      resolventTransform ((P : Measure PosReal).map Subtype.val) (-z) := by
  rw [resolventTransform_apply, integral_map measurable_subtype_coe.aemeasurable
    (measurable_resolvent (𝕜 := ℝ) (a := -z)).aestronglyMeasurable]
  simp only [complexStieltjesMean, resolvent, Ring.inverse_eq_inv', sub_neg_eq_add]
  congr 1
  funext b
  congr 1
  exact add_comm _ _

@[fun_prop] theorem measurable_complexStieltjesMean :
    Measurable (fun x : ProbabilityMeasure PosReal × ℂ => complexStieltjesMean x.1 x.2) := by
  let κ : ProbabilityTheory.Kernel (ProbabilityMeasure PosReal × ℂ) PosReal :=
    ⟨fun a => (a.1 : Measure PosReal), measurable_subtype_coe.comp measurable_fst⟩
  haveI : ProbabilityTheory.IsMarkovKernel κ := ⟨fun a => a.1.property⟩
  have hm : Measurable (fun x : (ProbabilityMeasure PosReal × ℂ) × PosReal =>
      (x.1.2 + (x.2.val : ℂ))⁻¹) := by fun_prop
  exact (hm.stronglyMeasurable.integral_kernel_prod_right (κ := κ)
    (f := fun a b => (a.2 + (b.val : ℂ))⁻¹)).measurable

theorem complexStieltjesMean_ofReal (P : ProbabilityMeasure PosReal) (s : ℝ) :
    complexStieltjesMean P (s : ℂ) = (stieltjesMean P s : ℂ) := by
  unfold complexStieltjesMean stieltjesMean
  rw [← integral_complex_ofReal]
  apply integral_congr_ae
  exact Eventually.of_forall fun b => by simp [Complex.ofReal_add]

theorem integrable_complexStieltjesMean (P : ProbabilityMeasure PosReal)
    {z : ℂ} (hz : 0 < z.im) :
    Integrable (fun b : PosReal => (z + (b.val : ℂ))⁻¹) (P : Measure PosReal) := by
  have hz' : -z ∉ algebraMap ℝ ℂ '' ((P : Measure PosReal).map Subtype.val).support := by
    rintro ⟨x, _, hx⟩
    have hi := congrArg Complex.im hx
    change 0 = -z.im at hi
    linarith
  have hi := integrable_resolvent (A := ℂ) hz'
  rw [integrable_map_measure (measurable_resolvent (𝕜 := ℝ) (a := -z)).aestronglyMeasurable
    measurable_subtype_coe.aemeasurable] at hi
  simpa only [Function.comp_def, resolvent, Ring.inverse_eq_inv', sub_neg_eq_add, add_comm] using! hi

theorem norm_complexStieltjesMean_le (P : ProbabilityMeasure PosReal)
    {z : ℂ} (hz : 0 < z.im) : ‖complexStieltjesMean P z‖ ≤ 1 / z.im := by
  calc ‖complexStieltjesMean P z‖ ≤
      ∫ b : PosReal, ‖(z + (b.val : ℂ))⁻¹‖ ∂(P : Measure PosReal) := norm_integral_le_integral_norm _
    _ ≤ ∫ _ : PosReal, 1 / z.im ∂(P : Measure PosReal) := by
      apply integral_mono (integrable_complexStieltjesMean P hz).norm (integrable_const _)
      intro b
      change ‖(z + (b.val : ℂ))⁻¹‖ ≤ 1 / z.im
      rw [norm_inv, ← one_div]
      exact one_div_le_one_div_of_le hz (by simpa using Complex.im_le_norm (z + (b.val : ℂ)))
    _ = 1 / z.im := by simp

theorem complexStieltjesMean_im_neg (P : ProbabilityMeasure PosReal)
    {z : ℂ} (hz : 0 < z.im) : (complexStieltjesMean P z).im < 0 := by
  have hi := integrable_complexStieltjesMean P hz
  have hn (b : PosReal) : 0 < -((z + (b.val : ℂ))⁻¹).im := by
    have hne : z + (b.val : ℂ) ≠ 0 := by
      intro h
      have := congrArg Complex.im h
      simp only [Complex.add_im, Complex.ofReal_im, add_zero, Complex.zero_im] at this
      linarith
    simp only [Complex.inv_im, Complex.add_im, Complex.ofReal_im, add_zero, neg_div, neg_neg]
    exact div_pos hz (Complex.normSq_pos.mpr hne)
  have hp : 0 < ∫ b : PosReal, -((z + (b.val : ℂ))⁻¹).im ∂(P : Measure PosReal) := by
    rw [integral_pos_iff_support_of_nonneg (fun b => (hn b).le) hi.im.neg]
    have he : Function.support (fun b : PosReal => -((z + (b.val : ℂ))⁻¹).im) = univ := by
      ext b
      simp only [Function.mem_support, mem_univ, iff_true]
      exact ne_of_gt (hn b)
    rw [he]
    simp
  rw [integral_neg] at hp
  have he : (∫ b : PosReal, ((z + (b.val : ℂ))⁻¹).im ∂(P : Measure PosReal)) =
      (complexStieltjesMean P z).im := integral_im hi
  rw [he] at hp
  exact neg_pos.mp hp

theorem complexStieltjesMean_ne_zero (P : ProbabilityMeasure PosReal)
    {z : ℂ} (hz : 0 < z.im) : complexStieltjesMean P z ≠ 0 := by
  intro h
  have := complexStieltjesMean_im_neg P hz
  simp [h] at this

/-- A positive height; using `n+1` includes exactly the integer heights in the blueprint. -/
def phaseHeight (n : ℕ) : ℝ := 1 / ((n : ℝ) + 1)

theorem phaseHeight_pos (n : ℕ) : 0 < phaseHeight n := by
  unfold phaseHeight
  positivity

def phaseApprox (P : ProbabilityMeasure PosReal) (t : ℝ) (n : ℕ) : ℝ :=
  -Complex.arg (complexStieltjesMean P (-(t : ℂ) + (phaseHeight n : ℂ) * Complex.I)) / Real.pi

theorem phaseApprox_bounds (P : ProbabilityMeasure PosReal) (t : ℝ) (n : ℕ) :
    0 < phaseApprox P t n ∧ phaseApprox P t n < 1 := by
  have hz : 0 < (-(t : ℂ) + (phaseHeight n : ℂ) * Complex.I).im := by
    simpa using phaseHeight_pos n
  have hn := Complex.arg_neg_iff.mpr (complexStieltjesMean_im_neg P hz)
  have hp := Complex.neg_pi_lt_arg
    (complexStieltjesMean P (-(t : ℂ) + (phaseHeight n : ℂ) * Complex.I))
  unfold phaseApprox
  constructor
  · exact div_pos (neg_pos.mpr hn) Real.pi_pos
  · rw [div_lt_one Real.pi_pos]
    linarith

@[fun_prop] theorem measurable_phaseApprox (n : ℕ) :
    Measurable (fun x : ProbabilityMeasure PosReal × ℝ => phaseApprox x.1 x.2 n) := by
  have hp : Measurable (fun x : ProbabilityMeasure PosReal × ℝ =>
      (x.1, -(x.2 : ℂ) + (phaseHeight n : ℂ) * Complex.I)) := by fun_prop
  exact ((Complex.measurable_arg.comp (measurable_complexStieltjesMean.comp hp)).neg).div_const _

/-- The minus sign is inside the limsup, as required by the boundary prescription. -/
def stieltjesPhase (P : ProbabilityMeasure PosReal) (t : ℝ) : ℝ :=
  limsup (phaseApprox P t) atTop

@[fun_prop] theorem phase_jointlyMeasurable :
    Measurable (fun x : ProbabilityMeasure PosReal × ℝ => stieltjesPhase x.1 x.2) :=
  Measurable.limsup measurable_phaseApprox

theorem stieltjesPhase_bounds (P : ProbabilityMeasure PosReal) (t : ℝ) :
    0 ≤ stieltjesPhase P t ∧ stieltjesPhase P t ≤ 1 := by
  have h₀ : ∀ᶠ n in atTop, 0 ≤ phaseApprox P t n :=
    Eventually.of_forall fun n => (phaseApprox_bounds P t n).1.le
  have h₁ : ∀ᶠ n in atTop, phaseApprox P t n ≤ 1 :=
    Eventually.of_forall fun n => (phaseApprox_bounds P t n).2.le
  have hb : IsBoundedUnder (· ≤ ·) atTop (phaseApprox P t) := ⟨1, h₁⟩
  have hc : IsCoboundedUnder (· ≤ ·) atTop (phaseApprox P t) := by
    exact ⟨0, fun a ha => le_of_not_gt fun h =>
      (h₀.and ha).exists.elim fun n hn => (not_lt_of_ge (hn.1.trans hn.2)) h⟩
  exact ⟨le_limsup_of_le hb (fun a ha =>
    (h₀.and ha).exists.elim fun _ hn => hn.1.trans hn.2), limsup_le_of_le hc h₁⟩

/-- Every L¹ kernel can be integrated against the constructed representative. -/
theorem integrable_stieltjesPhase_mul (P : ProbabilityMeasure PosReal)
    {k : ℝ → ℝ} {μ : Measure ℝ} (hk : Integrable k μ) :
    Integrable (fun t => stieltjesPhase P t * k t) μ := by
  have hm := phase_jointlyMeasurable.comp (measurable_prodMk_left (x := P))
  simp only [Function.comp_def] at hm
  apply hk.norm.mono' (hm.aestronglyMeasurable.mul hk.aestronglyMeasurable)
  exact Eventually.of_forall fun t => by
    change ‖stieltjesPhase P t * k t‖ ≤ ‖k t‖
    rw [norm_mul, Real.norm_eq_abs (stieltjesPhase P t),
      abs_of_nonneg (stieltjesPhase_bounds P t).1]
    exact mul_le_of_le_one_left (norm_nonneg _) (stieltjesPhase_bounds P t).2

theorem abs_integral_stieltjesPhase_mul_le (P : ProbabilityMeasure PosReal)
    {k : ℝ → ℝ} {μ : Measure ℝ} (hk : Integrable k μ) :
    |∫ t, stieltjesPhase P t * k t ∂μ| ≤ ∫ t, |k t| ∂μ := by
  calc _ ≤ ∫ t, |stieltjesPhase P t * k t| ∂μ := abs_integral_le_integral_abs
    _ ≤ _ := by
      apply integral_mono (integrable_stieltjesPhase_mul P hk).abs hk.abs
      intro t
      change |stieltjesPhase P t * k t| ≤ |k t|
      rw [abs_mul, abs_of_nonneg (stieltjesPhase_bounds P t).1]
      exact mul_le_of_le_one_left (abs_nonneg _) (stieltjesPhase_bounds P t).2

theorem complexStieltjesMean_dirac (b : PosReal) (z : ℂ) :
    complexStieltjesMean ⟨Measure.dirac b, inferInstance⟩ z = (z + (b.val : ℂ))⁻¹ := by
  simp [complexStieltjesMean]

/-- At the atom itself the prescribed representative has the value 1/2.
This is a pointwise statement, including the exceptional jump boundary. -/
theorem phaseApprox_dirac_self (b : PosReal) (n : ℕ) :
    phaseApprox ⟨Measure.dirac b, inferInstance⟩ b.val n = 1 / 2 := by
  unfold phaseApprox
  rw [complexStieltjesMean_dirac]
  have he : -(b.val : ℂ) + (phaseHeight n : ℂ) * Complex.I + (b.val : ℂ) =
      (phaseHeight n : ℂ) * Complex.I := by ring
  rw [he, Complex.arg_inv, Complex.arg_real_mul _ (phaseHeight_pos n), Complex.arg_I,
    if_neg (by linarith [Real.pi_pos] : Real.pi / 2 ≠ Real.pi)]
  field_simp

theorem stieltjesPhase_dirac_self (b : PosReal) :
    stieltjesPhase ⟨Measure.dirac b, inferInstance⟩ b.val = 1 / 2 := by
  have he : phaseApprox ⟨Measure.dirac b, inferInstance⟩ b.val = (fun _ => 1 / 2) :=
    funext (phaseApprox_dirac_self b)
  exact (congrArg (fun f : ℕ → ℝ => limsup f atTop) he).trans (limsup_const _)

theorem phaseHeight_tendsto_zero : Tendsto phaseHeight atTop (nhds 0) :=
  tendsto_one_div_add_atTop_nhds_zero_nat

/-- Taking the imaginary part of the registered complex representation gives
the actual normalized Poisson integral. This step asserts no boundary limit. -/
theorem phaseApprox_eq_poisson {P : ProbabilityMeasure PosReal} {η : ℝ → ℝ}
    (hη : External.SSV.Phase P η) (t : ℝ) (n : ℕ) :
    phaseApprox P t n = ∫ u in Ioi 0,
      ProbabilityTheory.cauchyPDFReal t ⟨phaseHeight n, (phaseHeight_pos n).le⟩ u * η u := by
  let z : ℂ := -(t:ℂ) + (phaseHeight n:ℂ)*Complex.I
  have hz : 0 < z.im := by simpa [z] using phaseHeight_pos n
  have h := congrArg Complex.im (hη.complex_anchor_one z hz)
  have him : (∫ u in Ioi 0, (η u:ℂ) * ((z+(u:ℂ))⁻¹-((1+u:ℝ):ℂ)⁻¹)).im =
      ∫ u in Ioi 0, ((η u:ℂ) * ((z+(u:ℂ))⁻¹-((1+u:ℝ):ℂ)⁻¹)).im :=
    (integral_im (hη.complex_integrable z hz)).symm
  rw [Complex.sub_im, Complex.log_im, Complex.ofReal_im, sub_zero, him] at h
  change (complexStieltjesMean P z).arg = _ at h
  change -(complexStieltjesMean P z).arg / Real.pi = _
  rw [h, ← integral_neg, ← integral_div]
  apply integral_congr_ae
  exact Eventually.of_forall fun u => by
    simp only [Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im, Complex.sub_im,
      mul_zero, zero_mul, add_zero, Complex.inv_im, Complex.add_im, Complex.add_re,
      Complex.neg_im, Complex.neg_re, Complex.mul_re, Complex.I_re, Complex.I_im,
      mul_one, sub_zero, Complex.normSq_apply, neg_zero, zero_add, z]
    simp only [ProbabilityTheory.cauchyPDFReal_def, zero_div, sub_zero]
    change -(η u * (-(phaseHeight n) / ((-t+u)*(-t+u)+phaseHeight n*phaseHeight n))) /
      Real.pi = Real.pi⁻¹ * phaseHeight n * ((u-t)^2+phaseHeight n^2)⁻¹ * η u
    have hd : (-t+u)*(-t+u)+phaseHeight n*phaseHeight n = (u-t)^2+phaseHeight n^2 := by ring
    rw [hd]
    ring

/-- The prescribed limsup agrees a.e. with any phase supplied by E-S1.
The recovery theorem is proved locally from Lebesgue differentiation. -/
theorem phase_eq_ae_of_representation {P : ProbabilityMeasure PosReal} {η : ℝ → ℝ}
    (hη : External.SSV.Phase P η) :
    stieltjesPhase P =ᵐ[volume.restrict (Ioi 0)] η := by
  have h := Analysis.ae_tendsto_halfLine_cauchy_integral hη.measurable hη.bounds
    phaseHeight_pos phaseHeight_tendsto_zero
  filter_upwards [h] with t ht
  simp_rw [← phaseApprox_eq_poisson hη t] at ht
  exact ht.limsup_eq

/-- The canonical, jointly Borel measurable representative satisfies the real
representation contract, without any integrability assumption at zero. -/
theorem stieltjesPhase_realPhase (P : ProbabilityMeasure PosReal) :
    External.SSV.RealPhase P (stieltjesPhase P) := by
  obtain ⟨η, hη, _⟩ := External.SSV.phase_representation P
  have he := phase_eq_ae_of_representation hη
  have hm : Measurable (stieltjesPhase P) := by
    have h := phase_jointlyMeasurable.comp
      (show Measurable (fun t : ℝ => (P,t)) from measurable_const.prodMk measurable_id)
    exact h
  refine ⟨hm, stieltjesPhase_bounds P, ?_, ?_⟩
  · intro s hs
    exact (hη.integrable s hs).congr (he.symm.mono fun t ht => by dsimp only; rw [ht])
  · intro s hs
    exact (hη.anchor_one s hs).trans (integral_congr_ae
      (he.symm.mono fun t ht => by dsimp only; rw [ht]))

theorem integrable_phase_anchor_one (P : ProbabilityMeasure PosReal) {s : ℝ} (hs : 0 < s) :
    IntegrableOn (fun t => stieltjesPhase P t * ((s+t)⁻¹-(1+t)⁻¹)) (Ioi 0) :=
  (stieltjesPhase_realPhase P).integrable s hs

theorem phase_anchor_one (P : ProbabilityMeasure PosReal) {s : ℝ} (hs : 0 < s) :
    Real.log (stieltjesMean P s) - Real.log (stieltjesMean P 1) =
      ∫ t in Ioi 0, stieltjesPhase P t * ((s+t)⁻¹-(1+t)⁻¹) := by
  simpa only [stieltjesMean, one_div] using (stieltjesPhase_realPhase P).anchor_one s hs

/-- Uniqueness is a.e. on the positive half-line, with explicit real-axis data. -/
theorem phase_unique_ae (P : ProbabilityMeasure PosReal) {η : ℝ → ℝ}
    (hm : Measurable η) (hb : ∀ t, 0 ≤ η t ∧ η t ≤ 1)
    (hi : ∀ s : ℝ, 0 < s → IntegrableOn (fun t => η t * ((s+t)⁻¹-(1+t)⁻¹)) (Ioi 0))
    (hr : ∀ s : ℝ, 0 < s → Real.log (stieltjesMean P s) - Real.log (stieltjesMean P 1) =
      ∫ t in Ioi 0, η t * ((s+t)⁻¹-(1+t)⁻¹)) :
    η =ᵐ[volume.restrict (Ioi 0)] stieltjesPhase P := by
  obtain ⟨ζ, hζ, hu⟩ := External.SSV.phase_representation P
  have hη : External.SSV.RealPhase P η := ⟨hm, hb, hi, by
    simpa only [stieltjesMean, one_div] using hr⟩
  exact (hu η hη).trans (phase_eq_ae_of_representation hζ).symm

end GGC
