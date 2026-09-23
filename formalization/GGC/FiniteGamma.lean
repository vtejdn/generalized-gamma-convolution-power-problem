import GGC.Basic
import GGC.Laplace

/-!
# Actual finite gamma convolutions and elementary membership

These lemmas use only the original weak-limit definition. They do not use
Thorin characterization or external mathematical axioms. The finite-gamma
Laplace-transform certificate is a later M1 obligation.
-/

noncomputable section
open MeasureTheory Filter Topology
open scoped BigOperators
namespace GGC

/-- Expose the exact independent-product/sum-pushforward semantics. -/
theorem finiteGammaLaw_toMeasure (k : ℕ) (α b : Fin k → PosReal) :
    ((finiteGammaLaw k α b).law : Measure ℝ) =
      Measure.map (fun x : Fin k → ℝ => ∑ i, x i)
        (Measure.pi (fun i => ProbabilityTheory.gammaMeasure (α i).val (b i).val)) := rfl

/-- A finite gamma convolution is a GGC by the constant approximating sequence. -/
theorem isGGC_of_isFiniteGammaConvolution (μ : NonnegLaw)
    (hμ : IsFiniteGammaConvolution μ) : IsGGC μ :=
  ⟨fun _ => μ, fun _ => hμ, tendsto_const_nhds⟩

theorem isFiniteGammaConvolution_finiteGammaLaw (k : ℕ) (α b : Fin k → PosReal) :
    IsFiniteGammaConvolution (finiteGammaLaw k α b) := ⟨k, α, b, rfl⟩

theorem isGGC_finiteGammaLaw (k : ℕ) (α b : Fin k → PosReal) :
    IsGGC (finiteGammaLaw k α b) :=
  isGGC_of_isFiniteGammaConvolution _ (isFiniteGammaConvolution_finiteGammaLaw k α b)

/-- The empty finite product and sum give the zero law, not an undefined case. -/
theorem finiteGammaLaw_zero (α b : Fin 0 → PosReal) :
    finiteGammaLaw 0 α b = diracLaw 0 le_rfl := by
  apply NonnegLaw.ext
  apply ProbabilityMeasure.toMeasure_injective
  change Measure.map (fun x : Fin 0 → ℝ => ∑ i, x i)
    (Measure.pi (fun i => ((gammaLaw (α i) (b i)).law : Measure ℝ))) = Measure.dirac 0
  simp

/-- With one coordinate the sum pushforward is the component gamma law. -/
theorem finiteGammaLaw_one (α b : PosReal) :
    finiteGammaLaw 1 (fun _ => α) (fun _ => b) = gammaLaw α b := by
  apply NonnegLaw.ext
  apply ProbabilityMeasure.toMeasure_injective
  change Measure.map (fun x : Fin 1 → ℝ => ∑ i, x i)
    (Measure.pi (fun _ : Fin 1 => ((gammaLaw α b).law : Measure ℝ))) = _
  simpa only [Fin.sum_univ_one] using
    (measurePreserving_eval (μ := fun _ : Fin 1 =>
      ((gammaLaw α b).law : Measure ℝ)) (0 : Fin 1)).map_eq

theorem isGGC_gammaLaw (α b : PosReal) : IsGGC (gammaLaw α b) := by
  rw [← finiteGammaLaw_one α b]
  exact isGGC_finiteGammaLaw _ _ _

theorem isGGC_zero : IsGGC (diracLaw 0 le_rfl) := by
  rw [← finiteGammaLaw_zero (fun i => Fin.elim0 i) (fun i => Fin.elim0 i)]
  exact isGGC_finiteGammaLaw _ _ _

end GGC
