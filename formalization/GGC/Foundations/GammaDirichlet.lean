import GGC.Foundations.BetaGamma
import Mathlib.MeasureTheory.Measure.FiniteMeasureProd

/-!
# Finite Gamma vectors and Dirichlet normalization

The zero-shape Gamma law is the point mass at zero. Joint-law statements
use this convention, including degenerate finite vectors.
-/

noncomputable section
open MeasureTheory ProbabilityTheory
open scoped NNReal ENNReal BigOperators
namespace GGC.RandomMeasure

/-- Positive shapes agree with mathlib's unit-rate Gamma law. -/
theorem gammaShapeLaw_of_ne_zero {a : ℝ≥0} (ha : a ≠ 0) :
    (gammaShapeLaw a : Measure ℝ) = gammaMeasure a 1 := by
  simp [gammaShapeLaw, ha]

/-- The actual ratio law, with the same zero-total convention as normalization. -/
def gammaRatioLaw (a b : ℝ≥0) : ProbabilityMeasure ℝ :=
  ((gammaShapeLaw a).prod (gammaShapeLaw b)).map
    (by fun_prop : Measurable (fun p : ℝ × ℝ => p.1 / (p.1 + p.2))).aemeasurable

/-- Ratio-total independence extends to zero shapes by point masses. -/
theorem gammaShape_ratio_sum (a b : ℝ≥0) :
    Measure.map (fun p : ℝ × ℝ => (p.1 / (p.1 + p.2), p.1 + p.2))
      ((gammaShapeLaw a : Measure ℝ).prod (gammaShapeLaw b : Measure ℝ)) =
    (gammaRatioLaw a b : Measure ℝ).prod (gammaShapeLaw (a + b) : Measure ℝ) := by
  have hm : Measurable (fun p : ℝ × ℝ => (p.1 / (p.1 + p.2), p.1 + p.2)) := by
    fun_prop
  suffices h : ∃ ν : Measure ℝ,
      Measure.map (fun p : ℝ × ℝ => (p.1 / (p.1 + p.2), p.1 + p.2))
        ((gammaShapeLaw a : Measure ℝ).prod (gammaShapeLaw b : Measure ℝ)) =
      ν.prod (gammaShapeLaw (a + b) : Measure ℝ) by
    obtain ⟨ν, hν⟩ := h
    have hf := congrArg Measure.fst hν
    rw [Measure.fst_map_prodMk (by fun_prop), Measure.fst_prod] at hf
    exact hν.trans (congrArg (fun ρ : Measure ℝ =>
      ρ.prod (gammaShapeLaw (a + b) : Measure ℝ)) hf.symm)
  by_cases ha : a = 0
  · subst a
    refine ⟨Measure.dirac 0, ?_⟩
    simp only [zero_add, gammaShapeLaw_zero, Measure.dirac_prod]
    rw [Measure.map_map hm (by fun_prop)]
    simp [Function.comp_def]
  · by_cases hb : b = 0
    · subst b
      refine ⟨Measure.dirac 1, ?_⟩
      simp only [add_zero, gammaShapeLaw_zero, Measure.prod_dirac, Measure.dirac_prod]
      rw [Measure.map_map hm (by fun_prop)]
      apply Measure.map_congr
      filter_upwards [gammaShapeLaw_pos ha] with x hx
      simp [hx.ne']
    · refine ⟨betaMeasure a b, ?_⟩
      rw [gammaShapeLaw_of_ne_zero ha, gammaShapeLaw_of_ne_zero hb,
        gammaShapeLaw_of_ne_zero (add_ne_zero.mpr (Or.inl ha))]
      exact GGC.BetaGamma.gamma_ratio_sum_map a b
        (by exact_mod_cast (pos_iff_ne_zero.mpr ha))
        (by exact_mod_cast (pos_iff_ne_zero.mpr hb))



/-- Nonnegativity holds simultaneously for every coordinate of a Gamma vector. -/
theorem gammaVector_nonneg {n : ℕ} (a : Fin n → ℝ≥0) :
    ∀ᵐ x ∂Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ)), ∀ i, 0 ≤ x i := by
  exact Filter.eventually_all.2 fun i =>
    Measure.tendsto_eval_ae_ae.eventually (gammaShapeLaw_nonneg (a i))

/-- Splitting off the first coordinate commutes with normalization on the
nonnegative orthant, including the zero-total face. -/
theorem normalize_cons {n : ℕ} (x : ℝ) (y : Fin n → ℝ)
    (hx : 0 ≤ x) (hy : ∀ i, 0 ≤ y i) :
    normalize (Fin.cons x y) = Fin.cons (x / (x + ∑ i, y i))
      (fun i => (1 - x / (x + ∑ i, y i)) * normalize y i) := by
  have hs : 0 ≤ ∑ i, y i := Finset.sum_nonneg fun i _ => hy i
  ext i
  refine Fin.cases ?_ (fun j => ?_) i
  · simp [normalize, Fin.sum_univ_succ]
  · simp only [normalize, Fin.sum_univ_succ, Fin.cons_zero, Fin.cons_succ]
    by_cases hsum : (∑ i, y i) = 0
    · have hj : y j = 0 := (Finset.sum_eq_zero_iff_of_nonneg (fun i _ => hy i)).1
        hsum j (Finset.mem_univ j)
      simp [hj]
    · have ht : x + ∑ i, y i ≠ 0 := ne_of_gt (add_pos_of_nonneg_of_pos hx
        (lt_of_le_of_ne hs (Ne.symm hsum)))
      field_simp
      ring

/-- A permutation of three independent factors, expressed through mathlib's
product associator and swap rather than a custom product measure. -/
theorem measurePreserving_swap_first_two {A C T : Type*}
    [MeasurableSpace A] [MeasurableSpace C] [MeasurableSpace T]
    (μ : Measure A) (ν : Measure C) (τ : Measure T)
    [SFinite μ] [SFinite ν] [SFinite τ] :
    MeasurePreserving (fun p : A × C × T => (p.2.1, p.1, p.2.2))
      (μ.prod (ν.prod τ)) (ν.prod (μ.prod τ)) := by
  exact (measurePreserving_prodAssoc ν μ τ).comp
    (((Measure.measurePreserving_swap (μ := μ) (ν := ν)).prod
      (MeasurePreserving.id τ)).comp (measurePreserving_prodAssoc μ ν τ).symm)

/-- The normalized finite Gamma vector and its total have their actual product
law. This stronger form also covers the all-zero shape vector. -/
theorem gammaVector_normalize_sum {n : ℕ} (a : Fin n → ℝ≥0) :
    Measure.map (fun x : Fin n → ℝ => (normalize x, ∑ i, x i))
      (Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ))) =
    (dirichletLaw a : Measure (Fin n → ℝ)).prod
      (gammaShapeLaw (∑ i, a i) : Measure ℝ) := by
  have hm : ∀ n, Measurable (fun x : Fin n → ℝ => (normalize x, ∑ i, x i)) :=
    fun n => (measurable_normalize n).prodMk (by fun_prop)
  induction n with
  | zero =>
    rw [dirichletLaw_toMeasure, Measure.pi_of_empty _ (fun i => Fin.elim0 i)]
    simp [Measure.map_dirac' (measurable_normalize 0),
      Measure.dirac_prod_dirac]
  | succ n ih =>
    let t : Fin n → ℝ≥0 := fun i => a i.succ
    let μ := (gammaShapeLaw (a 0) : Measure ℝ)
    let ν := (dirichletLaw t : Measure (Fin n → ℝ))
    let τ := (gammaShapeLaw (∑ i, t i) : Measure ℝ)
    let ρ := (gammaRatioLaw (a 0) (∑ i, t i) : Measure ℝ)
    let σ := (gammaShapeLaw (a 0 + ∑ i, t i) : Measure ℝ)
    let f : (Fin n → ℝ) × ℝ → Fin (n+1) → ℝ := fun p =>
      Fin.cons p.2 (fun i => (1-p.2)*p.1 i)
    have mf : Measurable f := by
      apply measurable_pi_iff.2
      intro i
      refine Fin.cases ?_ (fun j => ?_) i <;> simp [f] <;> fun_prop
    have hsplit : MeasurePreserving
        (fun x : Fin (n+1) → ℝ => (x 0, fun i : Fin n => x i.succ))
        (Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ)))
        (μ.prod (Measure.pi (fun i => (gammaShapeLaw (t i) : Measure ℝ)))) := by
      simpa [MeasurableEquiv.piFinSuccAbove, Fin.insertNthEquiv, Fin.tail, μ, t] using!
        measurePreserving_piFinSuccAbove (fun i => (gammaShapeLaw (a i) : Measure ℝ)) 0
    have ht : MeasurePreserving (fun y : Fin n → ℝ => (normalize y, ∑ i, y i))
        (Measure.pi (fun i => (gammaShapeLaw (t i) : Measure ℝ))) (ν.prod τ) :=
      ⟨hm n, ih t⟩
    have hr : MeasurePreserving (fun p : ℝ × ℝ =>
        (p.1 / (p.1 + p.2), p.1 + p.2)) (μ.prod τ) (ρ.prod σ) :=
      ⟨by fun_prop, gammaShape_ratio_sum _ _⟩
    have hf : MeasurePreserving f (ν.prod ρ) (Measure.map f (ν.prod ρ)) :=
      ⟨mf, rfl⟩
    have h := (hf.prod (MeasurePreserving.id σ)).comp
      ((measurePreserving_prodAssoc ν ρ σ).symm.comp
      (((MeasurePreserving.id ν).prod hr).comp
      ((measurePreserving_swap_first_two μ ν τ).comp
      (((MeasurePreserving.id μ).prod ht).comp hsplit))))
    have hjoint : Measure.map (fun x : Fin (n+1) → ℝ => (normalize x, ∑ i, x i))
        (Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ))) =
        (Measure.map f (ν.prod ρ)).prod σ := by
      rw [← h.map_eq]
      apply Measure.map_congr
      filter_upwards [gammaVector_nonneg a] with x hx
      have hc := normalize_cons (x 0) (fun i : Fin n => x i.succ) (hx 0)
        (fun i => hx i.succ)
      have he : Fin.cons (x 0) (fun i : Fin n => x i.succ) = x := by
        ext i
        exact Fin.cases rfl (fun _ => rfl) i
      rw [he] at hc
      simpa [Function.comp_def, Prod.map, f, MeasurableEquiv.prodAssoc, Fin.sum_univ_succ] using
        congrArg (fun q => (q, ∑ i, x i)) hc
    have hfirst := congrArg Measure.fst hjoint
    rw [Measure.fst_map_prodMk (by fun_prop), Measure.fst_prod] at hfirst
    rw [dirichletLaw_toMeasure, hfirst]
    simpa [σ, t, Fin.sum_univ_succ] using hjoint


/-- The nondegenerate ratio is exactly the Beta law. -/
theorem gammaRatioLaw_of_pos {a b : ℝ≥0} (ha : a ≠ 0) (hb : b ≠ 0) :
    (gammaRatioLaw a b : Measure ℝ) = betaMeasure a b := by
  have hp : 0 < (a : ℝ) := by exact_mod_cast (pos_iff_ne_zero.mpr ha)
  have hq : 0 < (b : ℝ) := by exact_mod_cast (pos_iff_ne_zero.mpr hb)
  haveI := isProbabilityMeasure_gammaMeasure (add_pos hp hq) zero_lt_one
  have h := congrArg Measure.fst (GGC.BetaGamma.gamma_ratio_sum_map a b hp hq)
  rw [Measure.fst_map_prodMk (by fun_prop), Measure.fst_prod] at h
  simpa only [gammaRatioLaw, ProbabilityMeasure.toMeasure_map,
    ProbabilityMeasure.toMeasure_prod, gammaShapeLaw_of_ne_zero ha,
    gammaShapeLaw_of_ne_zero hb] using h

/-- Independent Gamma shapes add even if either input shape is zero. -/
theorem gammaShape_sum (a b : ℝ≥0) :
    Measure.map (fun p : ℝ × ℝ => p.1 + p.2)
      ((gammaShapeLaw a : Measure ℝ).prod (gammaShapeLaw b : Measure ℝ)) =
    (gammaShapeLaw (a + b) : Measure ℝ) := by
  have h := congrArg Measure.snd (gammaShape_ratio_sum a b)
  simpa only [Measure.snd_map_prodMk (by fun_prop :
    Measurable (fun p : ℝ × ℝ => p.1 / (p.1 + p.2))), Measure.snd_prod] using h

/-- The E3.1 joint law at any positive real total shape. -/
theorem gammaVector_normalize_sum_of_pos {n : ℕ} (a : Fin n → ℝ≥0)
    (B : ℝ) (hB : 0 < B) (hMass : (∑ i, (a i : ℝ)) = B) :
    Measure.map (fun x : Fin n → ℝ => (normalize x, ∑ i, x i))
      (Measure.pi (fun i => (gammaShapeLaw (a i) : Measure ℝ))) =
    (dirichletLaw a : Measure (Fin n → ℝ)).prod (gammaMeasure B 1) := by
  have hs : (∑ i, a i : ℝ≥0) ≠ 0 := by
    intro h
    have hz := congrArg (fun z : ℝ≥0 => (z : ℝ)) h
    simp only [NNReal.coe_sum, NNReal.coe_zero, hMass] at hz
    exact hB.ne' hz
  rw [gammaVector_normalize_sum, gammaShapeLaw_of_ne_zero hs]
  simp only [NNReal.coe_sum, hMass]


/-- With exactly one positive shape, normalization is the deterministic simplex
vertex, regardless of how many zero coordinates are present. -/
theorem dirichletLaw_single_positive {n : ℕ} (a : Fin n → ℝ≥0) (j : Fin n)
    (hj : a j ≠ 0) (hz : ∀ i, i ≠ j → a i = 0) :
    (dirichletLaw a : Measure (Fin n → ℝ)) =
      Measure.dirac (fun i => if i = j then (1 : ℝ) else 0) := by
  have hc : ∀ᵐ x ∂(dirichletLaw a : Measure (Fin n → ℝ)), ∀ i, i ≠ j → x i = 0 := by
    apply Filter.eventually_all.2
    intro i
    by_cases hi : i = j
    · simp [hi]
    · filter_upwards [dirichletLaw_zero_coordinate a i (hz i hi)] with x hx
      exact fun _ => hx
  have he : (id : (Fin n → ℝ) → (Fin n → ℝ)) =ᵐ[(dirichletLaw a : Measure (Fin n → ℝ))]
      (fun _ => fun i => if i = j then (1 : ℝ) else 0) := by
    filter_upwards [hc, dirichletLaw_simplex a ⟨j, hj⟩] with x hx hs
    have hsum : (∑ i, x i) = x j := by
      apply Finset.sum_eq_single j
      · exact fun i _ hi => hx i hi
      · simp
    have hvalue : x j = 1 := hsum.symm.trans hs.2
    ext i
    by_cases hi : i = j
    · simp [hi, hvalue]
    · simp [hi, hx i hi]
  calc
    (dirichletLaw a : Measure (Fin n → ℝ)) = Measure.map id (dirichletLaw a : Measure (Fin n → ℝ)) :=
      Measure.map_id.symm
    _ = Measure.map (fun _ => fun i => if i = j then (1 : ℝ) else 0) (dirichletLaw a : Measure (Fin n → ℝ)) :=
      Measure.map_congr he
    _ = _ := by simp

end GGC.RandomMeasure
