import GGC.FiniteGamma

/-!
# Finite nonnegative weights as actual gamma convolutions

Zero weights are omitted before constructing the independent gamma product.
The all-zero case therefore uses the empty product and has the zero law.
One law realizes the finite logarithmic sum at every nonnegative parameter.
-/

noncomputable section
open scoped BigOperators

namespace GGC

/-- A finite family of nonnegative weights has an actual finite gamma law.
Only strictly positive weights are used as gamma shapes. -/
theorem exists_finiteGammaLaw_of_nonneg_weights {ι : Type*} [Fintype ι]
    [DecidableEq ι] (w : ι → ℝ) (hw : ∀ i, 0 ≤ w i) (b : ι → PosReal) :
    ∃ μ : NonnegLaw, IsFiniteGammaConvolution μ ∧
      ∀ s : ℝ, 0 ≤ s → laplace μ s =
        Real.exp (-(∑ i, w i * Real.log (1 + s / (b i).val))) := by
  classical
  let I := {i : ι // 0 < w i}
  let e : Fin (Fintype.card I) ≃ I := (Fintype.equivFin I).symm
  let α : Fin (Fintype.card I) → PosReal := fun i => ⟨w (e i).val, (e i).property⟩
  let rates : Fin (Fintype.card I) → PosReal := fun i => b (e i).val
  refine ⟨finiteGammaLaw _ α rates, isFiniteGammaConvolution_finiteGammaLaw _ _ _, ?_⟩
  intro s hs
  rw [laplace_finiteGammaLaw _ α rates hs]
  have hzero : (∑ i : {i : ι // ¬0 < w i},
      w i.val * Real.log (1 + s / (b i.val).val)) = 0 := by
    apply Finset.sum_eq_zero
    intro i _
    have hi : w i.val = 0 := le_antisymm (not_lt.mp i.property) (hw i.val)
    simp only [hi, zero_mul]
  have hsum : (∑ i : I, w i.val * Real.log (1 + s / (b i.val).val)) =
      ∑ i, w i * Real.log (1 + s / (b i).val) := by
    simpa only [hzero, add_zero] using
      (Fintype.sum_subtype_add_sum_subtype (fun i : ι => 0 < w i)
        (fun i => w i * Real.log (1 + s / (b i).val)))
  congr 2
  exact (e.sum_comp (fun i : I => w i.val * Real.log (1 + s / (b i.val).val))).trans hsum

end GGC
