import Mathlib.MeasureTheory.Group.Prod
import Mathlib.MeasureTheory.Function.JacobianOneDim
import Mathlib.Probability.Distributions.Beta
import GGC.Foundations.RandomMeasure
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# The Beta-Gamma joint distribution

The ratio and total of independent unit-rate Gamma variables have the product
of the Beta law and the Gamma law of the summed shapes. The change of variables
uses a volume-preserving shear followed by one-dimensional positive scaling.
All shape parameters are arbitrary positive real numbers.
-/

noncomputable section
open MeasureTheory Set ProbabilityTheory
open scoped ENNReal NNReal
namespace GGC.BetaGamma

/-- The total map is measurable, including its zero-denominator convention. -/
theorem measurable_ratio_sum :
    Measurable (fun p : ℝ × ℝ => (p.1 / (p.1 + p.2), p.1 + p.2)) := by
  fun_prop

/-- Positive-shape Gamma laws charge only strictly positive values. -/
theorem gamma_ae_pos (a : ℝ) (ha : 0 < a) :
    ∀ᵐ x ∂gammaMeasure a 1, 0 < x := by
  let c : ℝ≥0 := a.toNNReal
  have hc : c ≠ 0 := by
    intro he
    have hz := congrArg (fun x : ℝ≥0 => (x : ℝ)) he
    exact ha.ne' (by simpa [c, Real.toNNReal_of_nonneg ha.le] using hz)
  have hp := RandomMeasure.gammaShapeLaw_pos (a := c) hc
  simp only [RandomMeasure.gammaShapeLaw, dif_neg hc, ProbabilityMeasure.coe_mk] at hp
  simpa only [c, Real.coe_toNNReal a ha.le] using hp

/-- In particular, the denominator of the ratio is almost surely positive. -/
theorem gamma_prod_ae_pos (a b : ℝ) (ha : 0 < a) (hb : 0 < b) :
    ∀ᵐ p ∂(gammaMeasure a 1).prod (gammaMeasure b 1),
      0 < p.1 ∧ 0 < p.2 ∧ 0 < p.1 + p.2 := by
  haveI := isProbabilityMeasure_gammaMeasure ha zero_lt_one
  haveI := isProbabilityMeasure_gammaMeasure hb zero_lt_one
  apply (Measure.ae_prod_iff_ae_ae (by measurability)).2
  filter_upwards [gamma_ae_pos a ha] with x hx
  filter_upwards [gamma_ae_pos b hb] with y hy
  exact ⟨hx, hy, add_pos hx hy⟩

/-- The positive quadrant maps to the open ratio-total domain. -/
theorem ratio_sum_mem {x y : ℝ} (hx : 0 < x) (hy : 0 < y) :
    (x / (x + y), x + y) ∈ Ioo (0 : ℝ) 1 ×ˢ Ioi (0 : ℝ) := by
  have hs := add_pos hx hy
  exact ⟨⟨div_pos hx hs, (div_lt_one hs).2 (by linarith)⟩, hs⟩

/-- The inverse transformation on the open target domain. -/
theorem ratio_sum_inverse {u s : ℝ} (_hu : u ∈ Ioo (0 : ℝ) 1) (hs : 0 < s) :
    ((s*u) / (s*u + s*(1-u)), s*u + s*(1-u)) = (u,s) := by
  have h : s*u + s*(1-u) = s := by ring
  simp [h, hs.ne']

/-- The inverse transformation recovers both positive input coordinates. -/
theorem inverse_ratio_sum {x y : ℝ} (hx : 0 < x) (hy : 0 < y) :
    ((x+y)*(x/(x+y)), (x+y)*(1-x/(x+y))) = (x,y) := by
  have h := (add_pos hx hy).ne'
  apply Prod.ext <;> dsimp
  · field_simp
  · field_simp; ring

/-- Cancellation of the existing Beta and Gamma normalizing constants. -/
theorem normalizing_constant (a b : ℝ) (ha : 0 < a) (hb : 0 < b) :
    (1 / beta a b) * (1 / Real.Gamma (a + b)) =
      (1 / Real.Gamma a) * (1 / Real.Gamma b) := by
  have hab : Real.Gamma (a + b) ≠ 0 := (Real.Gamma_pos_of_pos (add_pos ha hb)).ne'
  rw [beta]
  field_simp

/-- Density factorization, with the scaling Jacobian kept explicit. -/
theorem density_factorization (a b : ℝ) (ha : 0 < a) (hb : 0 < b)
    {u s : ℝ} (hu : u ∈ Ioo (0 : ℝ) 1) (hs : 0 < s) :
    gammaPDF a 1 (s*u) * gammaPDF b 1 (s*(1-u)) * ENNReal.ofReal s =
      betaPDF a b u * gammaPDF (a+b) 1 s := by
  have hu0 : 0 ≤ u := hu.1.le
  have hv : 0 < 1-u := by linarith [hu.2]
  rw [gammaPDF_of_nonneg (mul_pos hs hu.1).le,
    gammaPDF_of_nonneg (mul_pos hs hv).le, betaPDF_of_pos_lt_one hu.1 hu.2,
    gammaPDF_of_nonneg hs.le]
  have hga := (Real.Gamma_pos_of_pos ha).le
  have hgb := (Real.Gamma_pos_of_pos hb).le
  have hgab := (Real.Gamma_pos_of_pos (add_pos ha hb)).le
  have hbeta := (beta_pos ha hb).le
  simp only [Real.one_rpow, one_mul]
  rw [← ENNReal.ofReal_mul (by positivity), ← ENNReal.ofReal_mul (by positivity),
    ← ENNReal.ofReal_mul (by positivity)]
  congr 1
  rw [Real.mul_rpow hs.le hu.1.le, Real.mul_rpow hs.le hv.le]
  have hp : s^(a-1) * s^(b-1) * s = s^(a+b-1) := by
    rw [← Real.rpow_add hs, ← Real.rpow_add_one hs.ne']
    congr 1
    ring
  have he : Real.exp (-(s*u)) * Real.exp (-(s*(1-u))) = Real.exp (-s) := by
    rw [← Real.exp_add]
    congr 1
    ring
  calc
    _ = ((1/Real.Gamma a)*(1/Real.Gamma b)) *
        (s^(a-1)*s^(b-1)*s) * (u^(a-1)*(1-u)^(b-1)) *
        (Real.exp (-(s*u))*Real.exp (-(s*(1-u)))) := by ring
    _ = _ := by rw [hp, he, ← normalizing_constant a b ha hb]; ring

/-- Positive scaling of an open interval, with no integrability assumption. -/
theorem lintegral_interval_scale (s : ℝ) (hs : 0 < s) (g : ℝ → ℝ≥0∞) :
    (∫⁻ x in Ioo 0 s, g x) =
      ∫⁻ u in Ioo (0 : ℝ) 1, ENNReal.ofReal s * g (s * u) := by
  have hd (u : ℝ) (_hu : u ∈ Ioo (0 : ℝ) 1) :
      HasDerivWithinAt (fun x : ℝ => s * x) s (Ioo (0 : ℝ) 1) u := by
    simpa using ((hasDerivAt_id u).const_mul s).hasDerivWithinAt
  have hi : InjOn (fun x : ℝ => s * x) (Ioo (0 : ℝ) 1) :=
    (mul_right_injective₀ hs.ne').injOn
  simpa only [image_mul_left_Ioo hs, mul_zero, mul_one, abs_of_pos hs] using
    lintegral_image_eq_lintegral_abs_deriv_mul measurableSet_Ioo hd hi g

/-- The shear and interval scaling transform nonnegative integrals on the quadrant. -/
theorem lintegral_quadrant (f : ℝ × ℝ → ℝ≥0∞) (hf : Measurable f) :
    (∫⁻ p in Ioi (0 : ℝ) ×ˢ Ioi (0 : ℝ), f p ∂(volume.prod volume)) =
      ∫⁻ s in Ioi (0 : ℝ), ∫⁻ u in Ioo (0 : ℝ) 1,
        ENNReal.ofReal s * f (s*u, s*(1-u)) := by
  let q : Set (ℝ × ℝ) := Ioi (0 : ℝ) ×ˢ Ioi (0 : ℝ)
  have hq : MeasurableSet q := measurableSet_Ioi.prod measurableSet_Ioi
  have hm : Measurable (q.indicator f) := hf.indicator hq
  rw [← lintegral_indicator hq]
  change (∫⁻ p, q.indicator f p ∂(volume.prod volume)) = _
  rw [← (measurePreserving_prod_sub volume volume).lintegral_comp hm]
  rw [lintegral_prod_symm _ (by fun_prop)]
  have hinner (s : ℝ) :
      (∫⁻ x : ℝ, q.indicator f (x, s-x)) =
        ∫⁻ x in Ioo 0 s, f (x, s-x) := by
    rw [← lintegral_indicator measurableSet_Ioo]
    apply lintegral_congr
    intro x
    have h : (x, s-x) ∈ q ↔ x ∈ Ioo 0 s := by
      simp only [q, mem_prod, mem_Ioi, mem_Ioo]
      constructor <;> intro h <;> constructor <;> linarith [h.1, h.2]
    simp only [indicator, h]
  simp_rw [hinner]
  have hout : (∫⁻ s : ℝ, ∫⁻ x in Ioo 0 s, f (x,s-x)) =
      ∫⁻ s in Ioi (0 : ℝ), ∫⁻ x in Ioo 0 s, f (x,s-x) := by
    symm
    apply setLIntegral_eq_of_support_subset
    intro s hs
    by_contra hn
    have hle : s ≤ 0 := le_of_not_gt hn
    have he : Ioo (0 : ℝ) s = ∅ := Ioo_eq_empty_of_le hle
    exact hs (by simp [he])
  rw [hout]
  apply setLIntegral_congr_fun measurableSet_Ioi
  intro s hs
  dsimp only
  rw [lintegral_interval_scale s hs]
  apply setLIntegral_congr_fun measurableSet_Ioo
  intro u _
  dsimp only
  rw [show s - s*u = s*(1-u) by ring]

/-- The open Gamma support removes the null boundary before changing variables. -/
theorem gamma_eq_open_density (a : ℝ) (ha : 0 < a) :
    gammaMeasure a 1 = (volume.restrict (Ioi (0 : ℝ))).withDensity (gammaPDF a 1) := by
  rw [← restrict_withDensity measurableSet_Ioi]
  exact (Measure.restrict_eq_self_of_ae_mem (gamma_ae_pos a ha)).symm

/-- The Beta density vanishes outside its open support. -/
theorem beta_eq_open_density (a b : ℝ) :
    betaMeasure a b = (volume.restrict (Ioo (0 : ℝ) 1)).withDensity (betaPDF a b) := by
  rw [← withDensity_indicator measurableSet_Ioo]
  apply withDensity_congr_ae
  filter_upwards [] with u
  by_cases hu : u ∈ Ioo (0 : ℝ) 1
  · simp [hu]
  · rw [indicator_of_notMem hu]
    change ¬ (0 < u ∧ u < 1) at hu
    simp only [betaPDF, betaPDFReal, if_neg hu, ENNReal.ofReal_zero]

/-- The full ratio-total pushforward is the Beta-Gamma product law. -/
theorem gamma_ratio_sum_map
    (a b : ℝ) (ha : 0 < a) (hb : 0 < b) :
    Measure.map
      (fun p : ℝ × ℝ => (p.1 / (p.1 + p.2), p.1 + p.2))
      ((gammaMeasure a 1).prod (gammaMeasure b 1)) =
      (betaMeasure a b).prod (gammaMeasure (a + b) 1) := by
  apply Measure.ext_of_lintegral
  intro f hf
  rw [lintegral_map hf measurable_ratio_sum]
  rw [gamma_eq_open_density a ha, gamma_eq_open_density b hb,
    prod_withDensity (by unfold gammaPDF; fun_prop) (by unfold gammaPDF; fun_prop),
    Measure.prod_restrict,
    lintegral_withDensity_eq_lintegral_mul _ (by unfold gammaPDF; fun_prop)
      (by fun_prop)]
  rw [lintegral_quadrant _ (by unfold gammaPDF; fun_prop)]
  rw [beta_eq_open_density a b, gamma_eq_open_density (a+b) (add_pos ha hb),
    prod_withDensity (by unfold betaPDF; fun_prop) (by unfold gammaPDF; fun_prop),
    lintegral_withDensity_eq_lintegral_mul _ (by unfold betaPDF gammaPDF; fun_prop) hf,
    lintegral_prod_symm _ (by unfold betaPDF gammaPDF; fun_prop)]
  apply setLIntegral_congr_fun measurableSet_Ioi
  intro s hs
  apply setLIntegral_congr_fun measurableSet_Ioo
  intro u hu
  dsimp only [Pi.mul_apply, Function.comp_apply]
  rw [ratio_sum_inverse hu hs]
  calc
    _ = (gammaPDF a 1 (s*u) * gammaPDF b 1 (s*(1-u)) * ENNReal.ofReal s) * f (u,s) := by ring
    _ = _ := by rw [density_factorization a b ha hb hu hs]

end GGC.BetaGamma
