import GGC.DirichletStickBreaking

/-! # E4.1 original arbitrary-space contract

Creator: constructor. Maintainer: shared designer-constructor. Status: active.
Target: Blueprint 25.3 / API-073. Checks the full original input and probability
version contract, the zero-length prefix, and residual summability. No topology,
canonical sampler or DP tail premise is introduced. This is not independent acceptance.
Run from formalization with pinned Lean v4.32.2:
`lake env lean Checks/E4StickBreakingContract.lean`.
Production: GGC/DirichletStickBreaking.lean and its foundation.
Evidence: ConstructionReport, E4 construction. Retain for full-contract regression.
-/
noncomputable section
open MeasureTheory Set GGC.RandomMeasure
open scoped ENNReal

example {E Ω : Type*} [MeasurableSpace E] [MeasurableSpace Ω]
    (m : ProbabilityMeasure Ω) (B : ℝ) (hB : 0 < B) (F : ProbabilityMeasure E)
    (Z : ProbabilityMeasure UnitWeight)
    (hZ : Measure.map Subtype.val (Z : Measure UnitWeight) = ProbabilityTheory.betaMeasure 1 B)
    (V : Ω → ℕ → UnitWeight) (Y : Ω → ℕ → E) (hV : Measurable V) (hY : Measurable Y)
    (hInput : Measure.map (fun ω => (V ω, Y ω)) (m : Measure Ω) =
      (Measure.infinitePi (fun _ : ℕ => (Z : Measure UnitWeight))).prod
        (Measure.infinitePi (fun _ : ℕ => (F : Measure E))))
    (Q : Ω → ProbabilityMeasure E) (hQ : Measurable Q)
    (hSum : ∀ᵐ ω ∂(m : Measure Ω), (Q ω : Measure E) = stickMeasure (V ω) (Y ω)) :
    IsDirichletProcess (ENNReal.ofReal B • (F : Measure E)) (m.map hQ.aemeasurable) :=
  GGC.stick_breaking m B hB F Z hZ V Y hV hY hInput Q hQ hSum

example {d : ℕ} (v : Fin 0 → Fin d × ℝ) (x : Fin d → ℝ) : stickPrefix 0 v x = x := rfl

example {E : Type*} [MeasurableSpace E] (V : ℕ → UnitWeight) (Y : ℕ → E)
    (Q : ProbabilityMeasure E) (hQ : (Q : Measure E) = stickMeasure V Y) :
    HasSum (stickWeight V) 1 :=
  hasSum_stickWeight_of_mass_one V Y (by rw [← hQ]; exact measure_univ)

#print GGC.stick_breaking
#print axioms GGC.stick_breaking
