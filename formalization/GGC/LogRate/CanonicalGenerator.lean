import GGC.StieltjesPhase
import GGC.LogRate.PhaseGenerator

/-! # Posterior generator with the constructed canonical phase

The input `D` is an actual law of probability measures on positive rates.
The phase argument is now discharged by the integer-boundary construction.
Constructing `D(B,F)` on the common probability space and proving the
Stieltjes representation / resolvent identities are separate obligations.
-/

noncomputable section
open MeasureTheory

namespace GGC.LogRate

def canonicalAcceptance (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B : PosReal) (y v : ℝ) : ℝ :=
  phaseAcceptance (fun x => stieltjesPhase x.1 x.2) D B y v

def canonicalDrift (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B : PosReal) (y : ℝ) : ℝ :=
  phaseDrift (fun x => stieltjesPhase x.1 x.2) D B y

def canonicalGenerator (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B : PosReal) (φ : ℝ → ℝ) (y : ℝ) : ℝ :=
  phaseGenerator (fun x => stieltjesPhase x.1 x.2) D B φ y

theorem canonicalAcceptance_jointlyMeasurable :
    Measurable (fun x : ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × ℝ × ℝ =>
      canonicalAcceptance x.1 x.2.1 x.2.2.1 x.2.2.2) :=
  phaseAcceptance_jointlyMeasurable phase_jointlyMeasurable

theorem canonicalDrift_jointlyMeasurable :
    Measurable (fun x : ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × ℝ =>
      canonicalDrift x.1 x.2.1 x.2.2) :=
  phaseDrift_jointlyMeasurable phase_jointlyMeasurable

theorem canonicalGenerator_jointlyMeasurable {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ) :
    Measurable (fun x : ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × ℝ =>
      canonicalGenerator x.1 x.2.1 φ x.2.2) :=
  phaseGenerator_jointlyMeasurable phase_jointlyMeasurable hφ

theorem canonicalAcceptance_bounds (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B : PosReal) (y v : ℝ) :
    0 ≤ canonicalAcceptance D B y v ∧ canonicalAcceptance D B y v ≤ 1 :=
  phaseAcceptance_bounds phase_jointlyMeasurable
    (fun P t => (stieltjesPhase_bounds P t).1) (fun P t => (stieltjesPhase_bounds P t).2) D B y v

theorem canonicalDrift_bounds (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B : PosReal) (y : ℝ) :
    y - digamma (B.val + 1) - 2 + Real.log 2 ≤ canonicalDrift D B y ∧
      canonicalDrift D B y ≤ y - digamma 1 :=
  phaseDrift_bounds phase_jointlyMeasurable
    (fun P t => (stieltjesPhase_bounds P t).1) (fun P t => (stieltjesPhase_bounds P t).2) D B y

theorem canonicalGenerator_nonneg_at_min (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B : PosReal) {φ : ℝ → ℝ} {y : ℝ} (hmin : ∀ x, φ y ≤ φ x) :
    0 ≤ canonicalGenerator D B φ y :=
  phaseGenerator_nonneg_at_min phase_jointlyMeasurable
    (fun P t => (stieltjesPhase_bounds P t).1) (fun P t => (stieltjesPhase_bounds P t).2) D B hmin

theorem integrable_canonicalGenerator_jumps (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B : PosReal) {φ : ℝ → ℝ} (hφ : ContDiff ℝ 2 φ)
    {C : ℝ} (hC : ∀ x, |deriv (deriv φ) x| ≤ C) (y : ℝ) :
    Integrable (fun v => taylorRemainder φ y v * canonicalAcceptance D B y v) jumpMeasure :=
  integrable_phaseGenerator_jumps phase_jointlyMeasurable
    (fun P t => (stieltjesPhase_bounds P t).1) (fun P t => (stieltjesPhase_bounds P t).2) D B hφ hC y

theorem canonicalGenerator_sq_le (D : ProbabilityMeasure (ProbabilityMeasure PosReal))
    (B : PosReal) (y : ℝ) :
    canonicalGenerator D B (fun x => x^2) y ≤ 3*y^2 + (driftBound B.val)^2 + jumpSecondMoment :=
  phaseGenerator_sq_le phase_jointlyMeasurable
    (fun P t => (stieltjesPhase_bounds P t).1) (fun P t => (stieltjesPhase_bounds P t).2) D B y

end GGC.LogRate
