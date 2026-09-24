import GGC.Thorin.FiniteWeights
import GGC.Thorin.GridMeasure
import GGC.Thorin.Drift

/-!
# One sequence of actual gamma laws for arbitrary Thorin data

The optional coordinate carries the drift approximation when the drift is
positive. The remaining coordinates carry the finite upward-grid cell masses.
Zero weights are omitted by the finite-gamma constructor. The sequence is
chosen once, independently of the Laplace parameter.
-/

noncomputable section
open MeasureTheory Filter Topology
open scoped BigOperators

namespace GGC.ThorinApproximation

/-- Nonnegative gamma weights for the drift coordinate and the rate cells. -/
def weight (d : ThorinData) (n : ℕ) : Option (Grid n) → ℝ
  | none => if 0 < d.drift then (driftGammaShape n).val else 0
  | some j => (d.measure (cell n j)).toReal

/-- Every coordinate has a positive rate, including those with zero weight. -/
def rate (d : ThorinData) (n : ℕ) : Option (Grid n) → PosReal
  | none => if h : 0 < d.drift then driftGammaRate d.drift h n else ⟨1, zero_lt_one⟩
  | some j => gridRate n j

theorem weight_nonneg (d : ThorinData) (n : ℕ) (i : Option (Grid n)) :
    0 ≤ weight d n i := by
  cases i with
  | none =>
    simp only [weight]
    split_ifs
    · exact (driftGammaShape n).property.le
    · exact le_rfl
  | some j => exact ENNReal.toReal_nonneg

/-- The single finite logarithmic sum contains both approximation mechanisms. -/
theorem sum_weight_log_rate (d : ThorinData) (n : ℕ) (s : ℝ) :
    (∑ i : Option (Grid n), weight d n i * Real.log (1 + s / (rate d n i).val)) =
      driftGammaExponent d.drift n s + ∫ b, kernel n s b ∂d.measure := by
  rw [Fintype.sum_option]
  change weight d n none * Real.log (1 + s / (rate d n none).val) +
    (∑ j : Grid n, (d.measure (cell n j)).toReal *
      Real.log (1 + s / (gridRate n j).val)) = _
  rw [← integral_kernel_eq_sum d.admissible n s]
  congr 1
  by_cases ha : 0 < d.drift
  · simpa only [weight, rate, if_pos ha, dif_pos ha] using
      (driftGammaExponent_eq_log_rate ha n s).symm
  · have hz : d.drift = 0 := le_antisymm (not_lt.mp ha) d.drift_nonneg
    simp [weight, hz]

/-- One actual finite gamma law at each mesh size, selected before any test parameter. -/
def law (d : ThorinData) (n : ℕ) : NonnegLaw :=
  Classical.choose (exists_finiteGammaLaw_of_nonneg_weights
    (weight d n) (weight_nonneg d n) (rate d n))

theorem law_spec (d : ThorinData) (n : ℕ) :
    IsFiniteGammaConvolution (law d n) ∧
      ∀ s : ℝ, 0 ≤ s → laplace (law d n) s =
        Real.exp (-(∑ i : Option (Grid n),
          weight d n i * Real.log (1 + s / (rate d n i).val))) :=
  Classical.choose_spec (exists_finiteGammaLaw_of_nonneg_weights
    (weight d n) (weight_nonneg d n) (rate d n))

theorem isFiniteGammaConvolution_law (d : ThorinData) (n : ℕ) :
    IsFiniteGammaConvolution (law d n) := (law_spec d n).1

/-- Exact Laplace transform of the actual finite independent gamma sum. -/
theorem laplace_law (d : ThorinData) (n : ℕ) {s : ℝ} (hs : 0 ≤ s) :
    laplace (law d n) s =
      Real.exp (-driftGammaExponent d.drift n s - ∫ b, kernel n s b ∂d.measure) := by
  rw [(law_spec d n).2 s hs, sum_weight_log_rate d n s]
  congr 1
  ring

/-- Upward rounding and the gamma drift inequality give a common lower bound. -/
theorem thorinLaplace_le_laplace_law (d : ThorinData) (n : ℕ) {s : ℝ}
    (hs : 0 ≤ s) : thorinLaplace d s ≤ laplace (law d n) s := by
  rw [laplace_law d n hs, thorinLaplace]
  apply Real.exp_le_exp.mpr
  have hd := driftGammaExponent_le d.drift_nonneg hs n
  have hU := integral_kernel_le d.admissible n hs
  linarith

/-- This same sequence converges in Laplace transform at every nonnegative parameter. -/
theorem tendsto_laplace_law (d : ThorinData) {s : ℝ} (hs : 0 ≤ s) :
    Tendsto (fun n => laplace (law d n) s) atTop (𝓝 (thorinLaplace d s)) := by
  simp_rw [laplace_law d _ hs]
  have harg := (tendsto_driftGammaExponent d.drift s).neg.sub
    (tendsto_integral_kernel d.admissible hs)
  simpa only [thorinLaplace, neg_mul, Function.comp_def] using
    (Real.continuous_exp.tendsto _).comp harg

end GGC.ThorinApproximation
