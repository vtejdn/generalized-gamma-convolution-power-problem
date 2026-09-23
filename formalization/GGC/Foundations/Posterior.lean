import GGC.Foundations.RandomMeasure
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Probability.Kernel.MeasurableIntegral
import Mathlib.MeasureTheory.Measure.FiniteMeasureProd

/-! # Actual atom mixtures of probability measures

The operation used in the beta--Dirichlet posterior is defined as a measure,
including the endpoint weights. Its measurability is proved for the Giry
sigma-field; a posterior distributional identity is a separate assertion.
-/

noncomputable section
open MeasureTheory Set
open scoped ENNReal

namespace GGC.RandomMeasure

abbrev UnitWeight := {z : ℝ // z ∈ Icc 0 1}

variable {E : Type*} [MeasurableSpace E]

/-- Jointly measurable integration against actual varying probability measures.
This uses the Giry measurable structure, with no topological identification. -/
theorem measurable_probability_integral {A : Type*} [MeasurableSpace A]
    {P : A → ProbabilityMeasure E} (hP : Measurable P)
    {f : A → E → ℝ} (hf : Measurable (Function.uncurry f)) :
    Measurable (fun a => ∫ x, f a x ∂(P a : Measure E)) := by
  let κ : ProbabilityTheory.Kernel A E :=
    ⟨fun a => (P a : Measure E), measurable_subtype_coe.comp hP⟩
  haveI : ProbabilityTheory.IsMarkovKernel κ := ⟨fun a => (P a).property⟩
  exact (hf.stronglyMeasurable.integral_kernel_prod_right (κ := κ)).measurable

/-- Pushforward measurability when both the input law and sampling map vary. -/
theorem measurable_probability_map_parameterized {A F : Type*} [MeasurableSpace A] [MeasurableSpace F]
    {P : A → ProbabilityMeasure E} (hP : Measurable P)
    {f : A → E → F} (hf : Measurable (Function.uncurry f)) :
    Measurable (fun a => (P a).map (f := f a) (hf.of_uncurry_left.aemeasurable)) := by
  let κ : ProbabilityTheory.Kernel A E :=
    ⟨fun a => (P a : Measure E), measurable_subtype_coe.comp hP⟩
  haveI : ProbabilityTheory.IsMarkovKernel κ := ⟨fun a => (P a).property⟩
  apply Measurable.subtype_mk
  apply Measure.measurable_of_measurable_coe
  intro s hs
  have hm : Measurable (fun x : A × E => s.indicator (fun _ => (1 : ℝ≥0∞)) (f x.1 x.2)) :=
    (measurable_const.indicator hs).comp hf
  have hi := hm.lintegral_kernel_prod_right' (κ := κ)
  convert! hi using 1
  funext a
  rw [Measure.map_apply hf.of_uncurry_left hs,
    ← lintegral_indicator_one (hf.of_uncurry_left hs)]
  rfl

def atomMixture (Q : ProbabilityMeasure E) (z : UnitWeight) (b : E) :
    ProbabilityMeasure E :=
  ⟨ENNReal.ofReal (1 - z.val) • (Q : Measure E) +
    ENNReal.ofReal z.val • Measure.dirac b, ⟨by
      simp only [Measure.add_apply, Measure.smul_apply, measure_univ, smul_eq_mul, mul_one]
      rw [← ENNReal.ofReal_add (sub_nonneg.mpr z.property.2) z.property.1]
      simp⟩⟩

theorem atomMixture_toMeasure (Q : ProbabilityMeasure E) (z : UnitWeight) (b : E) :
    (atomMixture Q z b : Measure E) =
      ENNReal.ofReal (1 - z.val) • (Q : Measure E) +
      ENNReal.ofReal z.val • Measure.dirac b := rfl

@[fun_prop] theorem measurable_atomMixture :
    Measurable (fun x : ProbabilityMeasure E × UnitWeight × E =>
      atomMixture x.1 x.2.1 x.2.2) := by
  apply Measurable.subtype_mk
  apply Measure.measurable_of_measurable_coe
  intro s hs
  simp only [Measure.add_apply, Measure.smul_apply, smul_eq_mul]
  exact (((measurable_const.sub (measurable_subtype_coe.comp
    (measurable_fst.comp measurable_snd))).ennreal_ofReal).mul
      ((Measure.measurable_coe hs).comp (measurable_subtype_coe.comp measurable_fst))).add
    (((measurable_subtype_coe.comp (measurable_fst.comp measurable_snd)).ennreal_ofReal).mul
      ((Measure.measurable_coe hs).comp (Measure.measurable_dirac.comp
        (measurable_snd.comp measurable_snd))))

theorem integrable_atomMixture {Q : ProbabilityMeasure E} (z : UnitWeight) (b : E)
    {f : E → ℝ} (hf : Integrable f (Q : Measure E)) (hm : Measurable f) :
    Integrable f (atomMixture Q z b : Measure E) := by
  rw [atomMixture_toMeasure]
  exact (hf.smul_measure ENNReal.ofReal_ne_top).add_measure
    ((integrable_dirac' hm.stronglyMeasurable (by simp)).smul_measure ENNReal.ofReal_ne_top)

theorem integral_atomMixture {Q : ProbabilityMeasure E} (z : UnitWeight) (b : E)
    {f : E → ℝ} (hf : Integrable f (Q : Measure E)) (hm : Measurable f) :
    (∫ x, f x ∂(atomMixture Q z b : Measure E)) =
      (1 - z.val) * (∫ x, f x ∂(Q : Measure E)) + z.val * f b := by
  rw [atomMixture_toMeasure, integral_add_measure
    (hf.smul_measure ENNReal.ofReal_ne_top)
    ((integrable_dirac' hm.stronglyMeasurable (by simp)).smul_measure ENNReal.ofReal_ne_top)]
  simp only [integral_smul_measure, ENNReal.toReal_ofReal (sub_nonneg.mpr z.property.2),
    ENNReal.toReal_ofReal z.property.1, smul_eq_mul, integral_dirac' f b hm.stronglyMeasurable]

theorem measurable_atomMixture_sample (b : E) :
    Measurable (fun x : ProbabilityMeasure E × UnitWeight => atomMixture x.1 x.2 b) := by
  have hp : Measurable (fun x : ProbabilityMeasure E × UnitWeight => (x.1, x.2, b)) :=
    measurable_fst.prodMk (measurable_snd.prodMk measurable_const)
  simpa only [Function.comp_def] using! measurable_atomMixture.comp hp

/-- The product supplies independence; the map supplies the actual posterior mixture. -/
def atomMixtureLaw (D : ProbabilityMeasure (ProbabilityMeasure E))
    (Z : ProbabilityMeasure UnitWeight) (b : E) : ProbabilityMeasure (ProbabilityMeasure E) :=
  (D.prod Z).map (measurable_atomMixture_sample b).aemeasurable

theorem atomMixtureLaw_toMeasure (D : ProbabilityMeasure (ProbabilityMeasure E))
    (Z : ProbabilityMeasure UnitWeight) (b : E) :
    (atomMixtureLaw D Z b : Measure (ProbabilityMeasure E)) =
      Measure.map (fun x : ProbabilityMeasure E × UnitWeight => atomMixture x.1 x.2 b)
        ((D : Measure (ProbabilityMeasure E)).prod (Z : Measure UnitWeight)) := rfl

theorem atomMixtureLaw_jointlyMeasurable :
    Measurable (fun x : ProbabilityMeasure (ProbabilityMeasure E) ×
      ProbabilityMeasure UnitWeight × E => atomMixtureLaw x.1 x.2.1 x.2.2) := by
  have hP : Measurable (fun x : ProbabilityMeasure (ProbabilityMeasure E) ×
      ProbabilityMeasure UnitWeight × E => x.1.prod x.2.1) :=
    (ProbabilityMeasure.measurable_fun_prod.comp
      (measurable_fst.prodMk (measurable_fst.comp measurable_snd))).subtype_mk
  have hp : Measurable (fun x : (ProbabilityMeasure (ProbabilityMeasure E) ×
      ProbabilityMeasure UnitWeight × E) × (ProbabilityMeasure E × UnitWeight) =>
      (x.2.1, x.2.2, x.1.2.2)) := by fun_prop
  have hf := measurable_atomMixture.comp hp
  simp only [Function.comp_def] at hf
  have hm := measurable_probability_map_parameterized hP
    (f := fun x p => atomMixture p.1 p.2 x.2.2) hf
  simpa only [atomMixtureLaw] using! hm

/-- Measurability of the actual posterior probability kernel in its atom. -/
theorem measurable_atomMixtureLaw (D : ProbabilityMeasure (ProbabilityMeasure E))
    (Z : ProbabilityMeasure UnitWeight) : Measurable (atomMixtureLaw D Z) := by
  apply Measurable.subtype_mk
  apply Measure.measurable_of_measurable_coe
  intro s hs
  have hp : Measurable (fun x : E × (ProbabilityMeasure E × UnitWeight) => (x.2.1, x.2.2, x.1)) :=
    (measurable_fst.comp measurable_snd).prodMk
      ((measurable_snd.comp measurable_snd).prodMk measurable_fst)
  have hm := measurable_atomMixture.comp hp
  have hi₀ : Measurable (s.indicator (fun _ => (1 : ℝ≥0∞))) := measurable_const.indicator hs
  have hi := hi₀.comp hm
  have hi' := hi.lintegral_prod_right' (ν := (D : Measure (ProbabilityMeasure E)).prod (Z : Measure UnitWeight))
  convert! hi' using 1
  funext b
  change (Measure.map (fun x : ProbabilityMeasure E × UnitWeight => atomMixture x.1 x.2 b)
    ((D : Measure (ProbabilityMeasure E)).prod (Z : Measure UnitWeight))) s = _
  rw [Measure.map_apply (measurable_atomMixture_sample b) hs]
  simp only [Function.comp_def] at *
  rw [← lintegral_indicator_one ((measurable_atomMixture_sample b) hs)]
  rfl

end GGC.RandomMeasure
