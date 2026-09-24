import GGC.Thorin.Basic
import GGC.Thorin.Sequence
import GGC.Thorin.Normalization
import GGC.LaplaceTightness

/-! # Realization and finite-atomic approximation from actual gamma laws

This module assembles the common sequence by independent tightness and Laplace
identification. The sequence hypotheses are supplied by the explicit Thorin
approximation construction; no literature input occurs in this lower layer.
-/

noncomputable section
open MeasureTheory Filter Topology
open scoped BigOperators
namespace GGC

/-- A common sequence of actual finite gamma laws identifies a supplied law
with its original-definition GGC approximation. No moment bound is assumed. -/
theorem isGGC_of_laplace_sequence (μ : NonnegLaw) {L : ℝ → ℝ}
    (hμ : ∀ s : ℝ, 0 < s → laplace μ s = L s)
    (μs : ℕ → NonnegLaw)
    (hfinite : ∀ n, IsFiniteGammaConvolution (μs n))
    (hbound : ∀ n s, 0 < s → L s ≤ laplace (μs n) s)
    (hlim : ∀ s : ℝ, 0 < s → Tendsto (fun n => laplace (μs n) s) atTop (𝓝 (L s)))
    (hzero : Tendsto L (𝓝[>] 0) (𝓝 1)) : IsGGC μ := by
  refine ⟨μs, hfinite, nonnegLaw_tendsto_of_laplace_tendsto
    (isTightMeasureSet_of_laplace_lower_bound μs hbound hzero) ?_⟩
  intro s hs
  rw [hμ s hs]
  exact hlim s hs

/-- The probability-measure and positive-parameter output required by the
primitive finite-atomic approximation contract. Each transform certificate
comes from an actual finite gamma convolution, including the empty sum. -/
theorem finite_atomic_approximation_of_laplace_sequence
    (μ : NonnegLaw) {L : ℝ → ℝ}
    (hμ : ∀ s : ℝ, 0 < s → laplace μ s = L s)
    (μs : ℕ → NonnegLaw)
    (hfinite : ∀ n, IsFiniteGammaConvolution (μs n))
    (hbound : ∀ n s, 0 < s → L s ≤ laplace (μs n) s)
    (hlim : ∀ s : ℝ, 0 < s → Tendsto (fun n => laplace (μs n) s) atTop (𝓝 (L s)))
    (hzero : Tendsto L (𝓝[>] 0) (𝓝 1)) :
    ∃ νs : ℕ → ProbabilityMeasure ℝ,
      Tendsto νs atTop (𝓝 μ.law) ∧
      ∀ n : ℕ,
        (∀ᵐ x ∂(νs n : Measure ℝ), 0 ≤ x) ∧
        ∃ k : ℕ, ∃ α β : Fin k → PosReal,
          ∀ s : ℝ, 0 < s →
            (∫ x : ℝ, Real.exp (-s * x) ∂(νs n : Measure ℝ)) =
              Real.exp (-(∑ i : Fin k, (α i).val * Real.log (1 + s / (β i).val))) := by
  obtain ⟨νs, hfinite', hconv⟩ :=
    isGGC_of_laplace_sequence μ hμ μs hfinite hbound hlim hzero
  refine ⟨fun n => (νs n).law, hconv, fun n => ⟨(νs n).nonneg, ?_⟩⟩
  obtain ⟨k, α, β, heq⟩ := hfinite' n
  refine ⟨k, α, β, fun s hs => ?_⟩
  change laplace (νs n) s = _
  rw [heq]
  exact laplace_finiteGammaLaw k α β hs.le

/-- The primitive probability-measure realization output, obtained from a
common lower bound and convergence of one sequence of nonnegative laws.
The construction of that sequence is a separate analytical obligation. -/
theorem thorin_realization_of_laplace_sequence (d : ThorinData)
    (μs : ℕ → NonnegLaw)
    (hbound : ∀ n s, 0 < s → thorinLaplace d s ≤ laplace (μs n) s)
    (hlim : ∀ s : ℝ, 0 < s →
      Tendsto (fun n => laplace (μs n) s) atTop (𝓝 (thorinLaplace d s)))
    (hzero : Tendsto (thorinLaplace d) (𝓝[>] 0) (𝓝 1)) :
    ∃ μ : ProbabilityMeasure ℝ,
      (∀ᵐ x ∂(μ : Measure ℝ), 0 ≤ x) ∧
      ∀ s : ℝ, 0 < s →
        (∫ x : ℝ, Real.exp (-s * x) ∂(μ : Measure ℝ)) =
          Real.exp (-d.drift * s -
            ∫ b : PosReal, Real.log (1 + s / b.val) ∂d.measure) := by
  obtain ⟨μ, hμ⟩ := exists_nonnegLaw_of_laplace_tendsto
    (isTightMeasureSet_of_laplace_lower_bound μs hbound hzero) hlim
  exact ⟨μ.law, μ.nonneg, hμ⟩

/-- Every admissible Thorin datum is realized by an actual nonnegative
probability measure. Tightness follows from the common transform lower bound
of the explicit finite-gamma sequence, without a moment assumption. -/
theorem thorin_realization_core (d : ThorinData) :
    ∃ μ : ProbabilityMeasure ℝ,
      (∀ᵐ x ∂(μ : Measure ℝ), 0 ≤ x) ∧
      ∀ s : ℝ, 0 < s →
        (∫ x : ℝ, Real.exp (-s * x) ∂(μ : Measure ℝ)) =
          Real.exp (-d.drift * s -
            ∫ b : PosReal, Real.log (1 + s / b.val) ∂d.measure) := by
  exact thorin_realization_of_laplace_sequence d (ThorinApproximation.law d)
    (fun n s hs => ThorinApproximation.thorinLaplace_le_laplace_law d n hs.le)
    (fun s hs => ThorinApproximation.tendsto_laplace_law d hs.le)
    (tendsto_thorinLaplace_zero d)

/-- A supplied law with an admissible Thorin transform is the narrow limit of
one sequence of actual finite gamma convolutions. The target may have drift,
infinite Thorin mass, or rates arbitrarily close to zero. -/
theorem finite_atomic_approximation_core (μ : NonnegLaw) (d : ThorinData)
    (hμ : ∀ s : ℝ, 0 < s → laplace μ s = thorinLaplace d s) :
    ∃ νs : ℕ → ProbabilityMeasure ℝ,
      Tendsto νs atTop (𝓝 μ.law) ∧
      ∀ n : ℕ,
        (∀ᵐ x ∂(νs n : Measure ℝ), 0 ≤ x) ∧
        ∃ k : ℕ, ∃ α β : Fin k → PosReal,
          ∀ s : ℝ, 0 < s →
            (∫ x : ℝ, Real.exp (-s * x) ∂(νs n : Measure ℝ)) =
              Real.exp (-(∑ i : Fin k, (α i).val * Real.log (1 + s / (β i).val))) := by
  exact finite_atomic_approximation_of_laplace_sequence μ hμ (ThorinApproximation.law d)
    (ThorinApproximation.isFiniteGammaConvolution_law d)
    (fun n s hs => ThorinApproximation.thorinLaplace_le_laplace_law d n hs.le)
    (fun s hs => ThorinApproximation.tendsto_laplace_law d hs.le)
    (tendsto_thorinLaplace_zero d)

end GGC
