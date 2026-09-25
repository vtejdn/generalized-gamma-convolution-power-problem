import GGC.GammaDirichlet
import External.James
import Mathlib.Probability.Kernel.Composition.IntegralCompProd

/-! # The actual posterior kernel and signed Palm transfer

The signed identity is deduced locally from the nonnegative external
disintegration. Its absolute-integrability hypothesis is on the concrete
joint sampling measure, and is transferred to the posterior joint measure
before either Bochner Fubini theorem is used.
-/

noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped ENNReal

namespace GGC
open RandomMeasure

local instance : PolishSpace PosReal := isOpen_Ioi.polishSpace

def evaluationKernel : Kernel (ProbabilityMeasure PosReal) PosReal :=
  ⟨fun P => (P : Measure PosReal), measurable_subtype_coe⟩

instance evaluationKernel_isMarkov : IsMarkovKernel evaluationKernel := ⟨fun P => P.property⟩

def posteriorKernel (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal) :
    Kernel PosReal (ProbabilityMeasure PosReal) :=
  ⟨fun b => (posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal)),
    measurable_subtype_coe.comp (measurable_atomMixtureLaw D (betaWeightLaw B))⟩

instance posteriorKernel_isMarkov (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal) :
    IsMarkovKernel (posteriorKernel D B) := ⟨fun b => (posteriorMixtureLaw D B b).property⟩

def samplingJoint (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) :
    Measure (ProbabilityMeasure PosReal × PosReal) :=
  (D : Measure (ProbabilityMeasure PosReal)) ⊗ₘ evaluationKernel

def posteriorJoint (U : Measure PosReal) (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B : PosReal) : Measure (PosReal × ProbabilityMeasure PosReal) :=
  (ENNReal.ofReal (1 / B.val) • U) ⊗ₘ posteriorKernel D B

theorem samplingJoint_swap_eq_posteriorJoint {U : Measure PosReal}
    {D : ProbabilityMeasure (ProbabilityMeasure PosReal)} (hD : IsDirichletProcess U D)
    (B : PosReal) (hMass : U univ = ENNReal.ofReal B.val) :
    Measure.map Prod.swap (samplingJoint D) = posteriorJoint U D B := by
  letI : IsFiniteMeasure U := hD.isFiniteMeasure
  apply Measure.ext
  intro s hs
  rw [Measure.map_apply measurable_swap hs]
  rw [← lintegral_indicator_one (measurable_swap hs), ← lintegral_indicator_one hs]
  have hl := External.James.posterior_palm_nonneg U D hD B.val B.property hMass
    (posteriorMixtureLaw D B) (measurable_atomMixtureLaw D (betaWeightLaw B))
    (posteriorMixture_isDirichlet hD B hMass) (s.indicator (fun _ => (1 : ℝ≥0∞)))
    (measurable_const.indicator hs)
  rw [samplingJoint, posteriorJoint, Measure.lintegral_compProd
    (measurable_one.indicator (measurable_swap hs)),
    Measure.lintegral_compProd (measurable_one.indicator hs)]
  exact hl

/-- Absolute integrability is preserved by the actual Palm joint-law equality. -/
theorem integrable_posteriorJoint_iff {U : Measure PosReal}
    {D : ProbabilityMeasure (ProbabilityMeasure PosReal)} (hD : IsDirichletProcess U D)
    (B : PosReal) (hMass : U univ = ENNReal.ofReal B.val)
    {Φ : PosReal × ProbabilityMeasure PosReal → ℝ} (hΦ : Measurable Φ) :
    Integrable Φ (posteriorJoint U D B) ↔
      Integrable (fun x : ProbabilityMeasure PosReal × PosReal => Φ (x.2,x.1)) (samplingJoint D) := by
  rw [← samplingJoint_swap_eq_posteriorJoint hD B hMass]
  exact integrable_map_measure hΦ.aestronglyMeasurable measurable_swap.aemeasurable

/-- Signed Palm/Fubini with the requisite absolute-integrability hypothesis. -/
theorem posterior_palm {U : Measure PosReal}
    {D : ProbabilityMeasure (ProbabilityMeasure PosReal)} (hD : IsDirichletProcess U D)
    (B : PosReal) (hMass : U univ = ENNReal.ofReal B.val)
    {Φ : PosReal × ProbabilityMeasure PosReal → ℝ} (hΦ : Measurable Φ)
    (hL1 : Integrable (fun x : ProbabilityMeasure PosReal × PosReal => Φ (x.2,x.1)) (samplingJoint D)) :
    (∫ (P : ProbabilityMeasure PosReal), ∫ b, Φ (b,P) ∂(P : Measure PosReal)
      ∂(D : Measure (ProbabilityMeasure PosReal))) =
      ∫ b, ∫ P, Φ (b,P) ∂(posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal))
        ∂(ENNReal.ofReal (1 / B.val) • U) := by
  letI : IsFiniteMeasure U := hD.isFiniteMeasure
  have hp := (integrable_posteriorJoint_iff hD B hMass hΦ).2 hL1
  have he : (∫ x, Φ (x.2,x.1) ∂samplingJoint D) = ∫ x, Φ x ∂posteriorJoint U D B := by
    rw [← samplingJoint_swap_eq_posteriorJoint hD B hMass,
      integral_map measurable_swap.aemeasurable hΦ.aestronglyMeasurable]
    rfl
  rw [samplingJoint, Measure.integral_compProd hL1, posteriorJoint, Measure.integral_compProd hp] at he
  exact he

end GGC
