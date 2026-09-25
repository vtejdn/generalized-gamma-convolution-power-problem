import GGC.Foundations.DirichletUpdate
import Mathlib.MeasureTheory.Measure.WithDensity

/-!
# Gamma and Dirichlet size bias

The zero-shape Gamma law is treated separately as Dirac zero. Density
identities for positive shapes are used only almost everywhere, avoiding
the exceptional value of real powers at zero.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped NNReal ENNReal BigOperators
namespace GGC.RandomMeasure

/-- Transport a measurable density through a measurable pushforward. -/
theorem map_withDensity_comp {A C : Type*} [MeasurableSpace A] [MeasurableSpace C]
    (μ : Measure A) (f : A → C) (g : C → ℝ≥0∞)
    (hf : Measurable f) (hg : Measurable g) :
    Measure.map f (μ.withDensity (g ∘ f)) = (Measure.map f μ).withDensity g := by
  ext s hs
  rw [Measure.map_apply hf hs, withDensity_apply _ (hf hs),
    withDensity_apply _ hs, setLIntegral_map hs hg hf]
  rfl

/-- Multiplication by the coordinate increments a unit-rate Gamma shape.
This includes shape zero, where both measures vanish. -/
theorem gammaShape_withDensity_self (a : ℝ≥0) :
    (gammaShapeLaw a : Measure ℝ).withDensity (fun x => ENNReal.ofReal x) =
      ENNReal.ofReal (a : ℝ) • (gammaShapeLaw (a + 1) : Measure ℝ) := by
  by_cases ha : a = 0
  · subst a
    simp [dirac_withDensity]
  have hp : 0 < (a : ℝ) := by exact_mod_cast (pos_iff_ne_zero.mpr ha)
  rw [gammaShapeLaw_of_ne_zero ha,
    gammaShapeLaw_of_ne_zero (by positivity : a + 1 ≠ 0)]
  simp only [gammaMeasure, NNReal.coe_add, NNReal.coe_one]
  have hm (s : ℝ) : Measurable (gammaPDF s 1) :=
    (measurable_gammaPDFReal s 1).ennreal_ofReal
  rw [← withDensity_mul _ (hm _) (by fun_prop),
    ← withDensity_smul _ (hm _)]
  apply withDensity_congr_ae
  have hz : ∀ᵐ x : ℝ ∂volume, x ≠ 0 := by
    rw [ae_iff]
    simp
  filter_upwards [hz] with x hx
  simp only [Pi.mul_apply, Pi.smul_apply, smul_eq_mul]
  by_cases hxp : 0 < x
  · rw [gammaPDF_of_nonneg hxp.le, gammaPDF_of_nonneg hxp.le]
    simp only [Real.one_rpow, one_mul]
    rw [← ENNReal.ofReal_mul (by positivity), ← ENNReal.ofReal_mul hp.le]
    congr 1
    rw [Real.Gamma_add_one hp.ne']
    have hg := (Real.Gamma_pos_of_pos hp).ne'
    have hr : x ^ ((a : ℝ) + 1 - 1) = x * x ^ ((a : ℝ) - 1) := by
      rw [show (↑a : ℝ) + 1 - 1 = (↑a - 1) + 1 by ring,
        Real.rpow_add hxp, Real.rpow_one]
      ring
    rw [hr]
    field_simp
  · have hn : x < 0 := lt_of_le_of_ne (le_of_not_gt hxp) hx
    simp [gammaPDF_of_neg hn, ENNReal.ofReal_of_nonpos hn.le]

/-- Tilting one coordinate of the independent Gamma vector increments that
shape and multiplies the measure by the original shape. -/
theorem gammaVector_withDensity_coordinate {n : ℕ} (a : Fin n → ℝ≥0) (j : Fin n) :
    (Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ))).withDensity
      (fun x => ENNReal.ofReal (x j)) =
    ENNReal.ofReal (a j : ℝ) •
      Measure.pi (fun i => (gammaShapeLaw (incrementShape a j i) : Measure ℝ)) := by
  cases n with
  | zero => exact Fin.elim0 j
  | succ n =>
    let e := MeasurableEquiv.piFinSuccAbove (fun _ : Fin (n+1) => ℝ) j
    have hs := measurePreserving_piFinSuccAbove
      (fun i => (gammaShapeLaw (a i) : Measure ℝ)) j
    have ht := measurePreserving_piFinSuccAbove
      (fun i => (gammaShapeLaw (incrementShape a j i) : Measure ℝ)) j
    apply e.map_measurableEquiv_injective
    have he : (fun x : Fin (n+1) → ℝ => ENNReal.ofReal (x j)) =
        (fun p : ℝ × (Fin n → ℝ) => ENNReal.ofReal p.1) ∘ e := rfl
    rw [he, map_withDensity_comp _ _ _ e.measurable (by fun_prop), hs.map_eq,
      ← prod_withDensity_left (by fun_prop), gammaShape_withDensity_self,
      Measure.prod_smul_left, Measure.map_smul, ht.map_eq]
    simp [incrementShape, Fin.succAbove_ne]

/-- The coordinate tilt before normalization has total-shape times the
coordinate-tilted Dirichlet law. This uses joint Gamma normalization. -/
theorem gammaVector_map_normalize_withDensity {n : ℕ} (a : Fin n → ℝ≥0)
    (ha : ∑ i, a i ≠ 0) (j : Fin n) :
    Measure.map normalize
      ((Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ))).withDensity
        (fun x => ENNReal.ofReal (x j))) =
    ENNReal.ofReal (∑ i, (a i : ℝ)) •
      (dirichletLaw a : Measure (Fin n → ℝ)).withDensity
        (fun x => ENNReal.ofReal (x j)) := by
  let μ := Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ))
  let f : (Fin n → ℝ) → (Fin n → ℝ) × ℝ := fun x => (normalize x, ∑ i, x i)
  let g : ((Fin n → ℝ) × ℝ) → ℝ≥0∞ :=
    fun p => ENNReal.ofReal (p.1 j) * ENNReal.ofReal p.2
  have hf : Measurable f := (measurable_normalize n).prodMk (by fun_prop)
  have hg : Measurable g := by fun_prop
  have hd : μ.withDensity (fun x => ENNReal.ofReal (x j)) =
      μ.withDensity (g ∘ f) := by
    apply withDensity_congr_ae
    filter_upwards [gammaVector_nonneg a, gammaVector_sum_pos a ha] with x hx hs
    dsimp [g, f, normalize]
    rw [← ENNReal.ofReal_mul (div_nonneg (hx j) hs.le), div_mul_cancel₀ _ hs.ne']
  change Measure.map normalize (μ.withDensity _) = _
  rw [hd]
  have hn : (normalize : (Fin n → ℝ) → _) = Prod.fst ∘ f := rfl
  rw [hn, ← Measure.map_map measurable_fst hf,
    map_withDensity_comp μ f g hf hg]
  change Measure.map Prod.fst
    ((Measure.map f μ).withDensity g) = _
  rw [show Measure.map f μ =
    (dirichletLaw a : Measure _).prod (gammaShapeLaw (∑ i, a i) : Measure ℝ)
    from gammaVector_normalize_sum a]
  dsimp [g]
  rw [← prod_withDensity (f := fun x : Fin n → ℝ => ENNReal.ofReal (x j))
      (g := fun x : ℝ => ENNReal.ofReal x) (by fun_prop) (by fun_prop),
    gammaShape_withDensity_self, Measure.prod_smul_right, Measure.map_smul]
  change _ • Measure.fst _ = _
  rw [Measure.fst_prod, NNReal.coe_sum]

/-- Full Dirichlet coordinate size-bias, including zero selected shape. -/
theorem dirichlet_withDensity_coordinate {n : ℕ} (a : Fin n → ℝ≥0)
    (ha : ∑ i, a i ≠ 0) (j : Fin n) :
    (dirichletLaw a : Measure (Fin n → ℝ)).withDensity
      (fun x => ENNReal.ofReal (x j)) =
    ENNReal.ofReal ((a j : ℝ) / ∑ i, (a i : ℝ)) •
      (dirichletLaw (incrementShape a j) : Measure (Fin n → ℝ)) := by
  have hb : 0 < ∑ i, (a i : ℝ) := by
    rw [← NNReal.coe_sum]
    exact_mod_cast (pos_iff_ne_zero.mpr ha)
  have h := gammaVector_map_normalize_withDensity a ha j
  rw [gammaVector_withDensity_coordinate, Measure.map_smul,
    ← dirichletLaw_toMeasure] at h
  have he := congrArg (fun μ : Measure (Fin n → ℝ) =>
    (ENNReal.ofReal (∑ i, (a i : ℝ)))⁻¹ • μ) h.symm
  rw [ENNReal.ofReal_div_of_pos hb]
  simpa only [smul_smul, ENNReal.inv_mul_cancel ((ne_of_gt (ENNReal.ofReal_pos.mpr hb)))
    ENNReal.ofReal_ne_top, one_smul, ENNReal.ofReal_div_of_pos hb, div_eq_mul_inv,
    mul_comm] using he

/-- The coordinate size-bias measures sum back to the original simplex law. -/
theorem dirichlet_weighted_increment {n : ℕ} (a : Fin n → ℝ≥0)
    (ha : ∑ i, a i ≠ 0) :
    (dirichletLaw a : Measure (Fin n → ℝ)) = Measure.sum (fun j =>
      ENNReal.ofReal ((a j : ℝ) / ∑ i, (a i : ℝ)) •
        (dirichletLaw (incrementShape a j) : Measure (Fin n → ℝ))) := by
  have hex : ∃ i, a i ≠ 0 := by
    by_contra h
    push Not at h
    exact ha (by simp [h])
  have he : (fun x : Fin n → ℝ => ∑' j, ENNReal.ofReal (x j)) =ᵐ[
      (dirichletLaw a : Measure (Fin n → ℝ))] (fun _ => 1) := by
    filter_upwards [dirichletLaw_simplex a hex] with x hx
    rw [tsum_fintype, ← ENNReal.ofReal_sum_of_nonneg (fun i _ => hx.1 i), hx.2]
    simp
  have h := withDensity_tsum (μ := (dirichletLaw a : Measure (Fin n → ℝ)))
    (f := fun j x => ENNReal.ofReal (x j)) (fun j => by fun_prop)
  simp only [tsum_fintype] at h he
  have he' : (∑ j : Fin n, fun x : Fin n → ℝ => ENNReal.ofReal (x j)) =ᵐ[
      (dirichletLaw a : Measure (Fin n → ℝ))] (fun _ => 1) := by
    filter_upwards [he] with x hx
    simpa only [Finset.sum_apply] using hx
  rw [withDensity_congr_ae he'] at h
  change (dirichletLaw a : Measure (Fin n → ℝ)).withDensity 1 = _ at h
  rw [withDensity_one] at h
  simpa only [dirichlet_withDensity_coordinate a ha] using h

/-- The actual categorical measure used to choose the updated coordinate. -/
def coordinateChoice {n : ℕ} (a : Fin n → ℝ≥0) : Measure (Fin n) :=
  Measure.sum fun j => ENNReal.ofReal ((a j : ℝ) / ∑ i, (a i : ℝ)) • Measure.dirac j

/-- Positive total shape normalizes the categorical measure to mass one. -/
theorem coordinateChoice_isProbabilityMeasure {n : ℕ} (a : Fin n → ℝ≥0)
    (ha : ∑ i, a i ≠ 0) : IsProbabilityMeasure (coordinateChoice a) := by
  have hb : 0 < ∑ i, (a i : ℝ) := by
    rw [← NNReal.coe_sum]
    exact_mod_cast (pos_iff_ne_zero.mpr ha)
  constructor
  simp only [coordinateChoice, Measure.sum_apply _ MeasurableSet.univ,
    Measure.smul_apply, Measure.dirac_apply_of_mem (mem_univ _), smul_eq_mul,
    mul_one, tsum_fintype]
  rw [← ENNReal.ofReal_sum_of_nonneg (fun i _ => div_nonneg (a i).coe_nonneg hb.le),
    ← Finset.sum_div, div_self hb.ne', ENNReal.ofReal_one]

/-- A random coordinate update of an independent Dirichlet vector is stationary.
All three inputs are encoded by the displayed product measure. -/
theorem dirichlet_stationary_update {n : ℕ} (a : Fin n → ℝ≥0)
    (ha : ∑ i, a i ≠ 0) :
    Measure.map (fun p : Fin n × ((Fin n → ℝ) × ℝ) => coordinateMixture p.1 p.2)
      ((coordinateChoice a).prod ((dirichletLaw a : Measure (Fin n → ℝ)).prod
        (betaMeasure 1 (∑ i, (a i : ℝ))))) =
      (dirichletLaw a : Measure (Fin n → ℝ)) := by
  have hb : 0 < ∑ i, (a i : ℝ) := by
    rw [← NNReal.coe_sum]
    exact_mod_cast (pos_iff_ne_zero.mpr ha)
  haveI := isProbabilityMeasureBeta zero_lt_one hb
  have hm : Measurable (fun p : Fin n × ((Fin n → ℝ) × ℝ) =>
      coordinateMixture p.1 p.2) := by
    exact measurable_from_prod_countable_right fun j => measurable_coordinateMixture j
  conv_rhs => rw [dirichlet_weighted_increment a ha]
  rw [coordinateChoice, Measure.prod_sum_left, Measure.map_sum hm.aemeasurable]
  congr 1
  funext j
  rw [Measure.prod_smul_left, Measure.map_smul, Measure.dirac_prod,
    Measure.map_map hm measurable_prodMk_left]
  exact congrArg (fun μ => ENNReal.ofReal ((a j : ℝ) / ∑ i, (a i : ℝ)) • μ)
    (dirichlet_coordinate_update a ha j)

end GGC.RandomMeasure
