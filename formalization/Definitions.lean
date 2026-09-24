import Mathlib.Analysis.SpecialFunctions.Pow.Continuity
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.MeasureTheory.Measure.FiniteMeasurePi
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.Probability.Distributions.Gamma

/-!
# GGC power closure: definitions and complete statement

This is the definition/statement entry point, following Blueprint Sections 2.1
and 4.1. All project-specific definitions needed to read `GGCPowerClosure` are
given here. Auxiliary lemmas belong in `GGC/Basic.lean` and other proof modules.
Thorin representability is a separate analytic predicate in `GGC/Thorin.lean`.

`IsGGC` uses the original definition: a weak limit of actual finite convolutions
of gamma laws. The finite product below encodes independence, and the sum
pushforward is the distribution of their sum. No transform identity or external
mathematical axiom is used to define this class.

`GGCPowerClosure` declares the target proposition independently of its proof.
The public proof entry point is `main.lean`; finite-input details live in `GGC/PowerClosure.lean`. This file
imports mathlib only and contains only definitions and their construction proofs.
The final target has no restriction on drift, Thorin mass, support or moments.
-/

noncomputable section

open MeasureTheory Filter Topology
open scoped ENNReal BigOperators

namespace GGC

/-- Strictly positive real parameters, used for both gamma shapes and rates.
In particular, rates are not assumed to be bounded away from zero. -/
abbrev PosReal := {b : ℝ // 0 < b}

/-- A probability distribution of finite, nonnegative real values.
Nonnegativity is almost everywhere, with no chosen ambient sample space. -/
structure NonnegLaw where
  law : ProbabilityMeasure ℝ
  nonneg : ∀ᵐ x ∂(law : Measure ℝ), 0 ≤ x

/-- The gamma probability law with positive shape α and positive rate b.

The underlying mathlib measure is Lebesgue measure with density
`b^α / Real.Gamma α * x^(α-1) * exp (-b*x)` on nonnegative x and zero
elsewhere. The value of the density at zero does not change the law.
Normalization is mathlib's proved gamma-integral theorem, not an axiom. -/
def gammaLaw (α b : PosReal) : NonnegLaw where
  law := ⟨ProbabilityTheory.gammaMeasure α.val b.val,
    ProbabilityTheory.isProbabilityMeasure_gammaMeasure α.property b.property⟩
  nonneg := by
    change ∀ᵐ x ∂ProbabilityTheory.gammaMeasure α.val b.val, 0 ≤ x
    simp only [ae_iff, not_le]
    change ProbabilityTheory.gammaMeasure α.val b.val (Set.Iio 0) = 0
    rw [ProbabilityTheory.gammaMeasure, withDensity_apply _ measurableSet_Iio]
    exact ProbabilityTheory.lintegral_gammaPDF_of_nonpos le_rfl

/-- The law of the sum of k independent gamma variables with shapes α and rates b.

`ProbabilityMeasure.pi` is the finite product of the component probability measures.
Its pushforward under summation supplies the law; there is no coupling premise.
The index k may be zero: the empty product and empty sum give the zero law.
No restriction is imposed on k, the shapes, or the variation of the rates. -/
def finiteGammaLaw (k : ℕ) (α b : Fin k → PosReal) : NonnegLaw where
  law := ProbabilityMeasure.map (f := fun x : Fin k → ℝ => ∑ i, x i)
    (ProbabilityMeasure.pi (fun i => (gammaLaw (α i) (b i)).law)) (by fun_prop)
  nonneg := by
    change ∀ᵐ y ∂Measure.map (fun x : Fin k → ℝ => ∑ i, x i)
      (Measure.pi (fun i => ((gammaLaw (α i) (b i)).law : Measure ℝ))), 0 ≤ y
    apply (ae_map_iff (by fun_prop) measurableSet_Ici).2
    have hcoords : ∀ᵐ x ∂Measure.pi
        (fun i => ((gammaLaw (α i) (b i)).law : Measure ℝ)),
        ∀ i, 0 ≤ x i := by
      apply Filter.eventually_all.2
      intro i
      exact Measure.tendsto_eval_ae_ae.eventually (gammaLaw (α i) (b i)).nonneg
    filter_upwards [hcoords] with x hx
    exact Finset.sum_nonneg fun i _ => hx i

/-- Membership in the class of actual finite gamma convolution laws.
Equality is equality of laws, not equality of their transforms. -/
def IsFiniteGammaConvolution (μ : NonnegLaw) : Prop :=
  ∃ (k : ℕ) (α b : Fin k → PosReal), μ = finiteGammaLaw k α b

/-- The original GGC definition: a weak limit of finite gamma convolutions.

The topology on `ProbabilityMeasure ℝ` is weak convergence against bounded
continuous tests. Every approximant and the limit are nonnegative probability
laws, so the definition cannot admit a defective limit. Parameters and numbers
of factors may vary without any uniform moment or support assumption.
There is no reference to Thorin measures in this definition. -/
def IsGGC (μ : NonnegLaw) : Prop :=
  ∃ μs : ℕ → NonnegLaw,
    (∀ n, IsFiniteGammaConvolution (μs n)) ∧
      Tendsto (fun n => (μs n).law) atTop (𝓝 μ.law)

/-- The actual deterministic-power pushforward for a nonnegative real exponent.
The argument hq supplies continuity; the main target derives it from q ≥ 1.
This is neither a convolution power nor a product of independent copies. -/
def powerLaw (μ : NonnegLaw) (q : ℝ) (hq : 0 ≤ q) : NonnegLaw where
  law := μ.law.map (Real.continuous_rpow_const hq).measurable.aemeasurable
  nonneg := by
    change ∀ᵐ x ∂Measure.map (fun x : ℝ => x ^ q) (μ.law : Measure ℝ), 0 ≤ x
    apply (ae_map_iff (Real.continuous_rpow_const hq).measurable.aemeasurable
      measurableSet_Ici).2
    filter_upwards [μ.nonneg] with x hx
    exact Real.rpow_nonneg hx q

/-- **The complete main theorem statement.**

For every nonnegative probability law μ and every finite real q ≥ 1,
membership in the finite-gamma weak-limit class is preserved by x ↦ x^q.
All project-specific definitions used here occur above in this file.
In particular, neither Thorin representability nor an evolution-existence
assumption appears in the statement.

Defining this proposition does not assert it. The genuine theorem
`GGC.ggc_rpow : GGCPowerClosure` is proved in `GGC/PowerClosure.lean`,
relative to the registered literature inputs audited by `AxiomAudit.lean`.
-/
def GGCPowerClosure : Prop :=
  ∀ (μ : NonnegLaw) (q : ℝ) (hq : 1 ≤ q),
    IsGGC μ → IsGGC (powerLaw μ q (zero_le_one.trans hq))

end GGC
