import GGC.Thorin.Basic
import External.Bondesson

/-!
# Thorin representability, separate from GGC membership

The public `IsGGC` predicate is defined by finite-gamma weak limits in `Definitions`.
The analytic predicate is `HasThorinRepresentation`. Its implication to GGC
membership uses locally proved E-B3, finite-gamma certificates and Laplace
uniqueness. Realization and constant-law membership also use standard logic only.
The unused converse and equivalence were removed with the E-B2 axiom; no
full characterization is required by the main theorem.
-/

noncomputable section
open MeasureTheory Filter Topology
open scoped BigOperators ENNReal
namespace GGC

/-- A represented law is an original GGC: the locally proved E-B3 approximants are identified
with actual independent gamma sums by the locally proved Laplace uniqueness. -/
theorem HasThorinRepresentation.isGGC {μ : NonnegLaw} (hμ : HasThorinRepresentation μ) :
    IsGGC μ := by
  obtain ⟨d, hd⟩ := hμ
  obtain ⟨μs, hlim, hμs⟩ := External.Bondesson.finite_atomic_approximation μ.law μ.nonneg
    d.drift d.drift_nonneg d.measure d.admissible hd
  let νs : ℕ → NonnegLaw := fun n => ⟨μs n, (hμs n).1⟩
  refine ⟨νs, ?_, hlim⟩
  intro n
  obtain ⟨k, α, b, hL⟩ := (hμs n).2
  refine ⟨k, α, b, nonnegLaw_eq_of_laplace_eq _ _ ?_⟩
  intro s hs
  exact (hL s hs).trans (laplace_finiteGammaLaw k α b hs.le).symm

/-- All nonnegative constants are original GGC laws, including positive drift.
This membership proof uses the locally proved E-B3 and standard logic only. -/
theorem isGGC_diracLaw (a : ℝ) (ha : 0 ≤ a) : IsGGC (diracLaw a ha) :=
  (hasThorinRepresentation_diracLaw a ha).isGGC

/-- Realization of arbitrary admissible Thorin data, using the locally proved E-B1. -/
theorem exists_law_thorinLaplace (d : ThorinData) :
    ∃ μ : NonnegLaw, ∀ s : ℝ, 0 < s → laplace μ s = thorinLaplace d s := by
  obtain ⟨μ, hμ, hL⟩ := External.Bondesson.thorin_realization
    d.drift d.drift_nonneg d.measure d.admissible
  exact ⟨⟨μ, hμ⟩, hL⟩

/-- E-B1 realization is unique by local Laplace uniqueness. -/
theorem existsUnique_law_thorinLaplace (d : ThorinData) :
    ∃! μ : NonnegLaw, ∀ s : ℝ, 0 < s → laplace μ s = thorinLaplace d s := by
  obtain ⟨μ, hμ⟩ := exists_law_thorinLaplace d
  refine ⟨μ, hμ, fun ν hν => ?_⟩
  exact nonnegLaw_eq_of_laplace_eq ν μ (fun s hs => (hν s hs).trans (hμ s hs).symm)

end GGC
