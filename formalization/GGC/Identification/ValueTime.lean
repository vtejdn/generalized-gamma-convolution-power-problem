import GGC.Identification.TangentSpaceTime

/-! # Real-time notation for the value curve on a closed finite horizon -/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.Identification

/-- Constant extension beyond the time endpoints, using the standard interval
projection. All evolution assertions below concern the original interval. -/
def valueAt {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T) (r : ℝ) : NonnegLaw :=
  WeakLogRateSolution.value w (projIcc 0 T hT r)

theorem valueAt_eq_value {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T) {r : ℝ} (hr : r ∈ Icc 0 T) :
    valueAt w hT r = WeakLogRateSolution.value w ⟨r,hr⟩ := by
  simp only [valueAt, projIcc_of_mem hT hr]

theorem continuous_valueAt {B₀ : PosReal} {F₀ : ProbabilityMeasure ℝ} {T : ℝ}
    (w : LogRate.WeakLogRateSolution B₀ F₀ T) (hT : 0 ≤ T) :
    Continuous (fun r => (valueAt w hT r).law) :=
  (continuous_valueLaw w).comp continuous_projIcc

/-- Lebesgue time restricted to `(0,t]`, retained on the fixed horizon subtype. -/
def timeUpTo (T t : ℝ) : Measure (Icc (0 : ℝ) T) :=
  (timeMeasure T).restrict {r | r.val ∈ Ioc 0 t}

instance timeUpTo_isFinite (T t : ℝ) : IsFiniteMeasure (timeUpTo T t) := by
  unfold timeUpTo
  infer_instance

theorem integral_timeUpTo {T t : ℝ} (hT : 0 ≤ T) (ht : t ∈ Icc 0 T)
    (f : Icc (0 : ℝ) T → ℝ) :
    (∫ r, f r ∂timeUpTo T t) = ∫ r in 0..t, f (projIcc 0 T hT r) := by
  let g : ℝ → ℝ := (Ioc 0 t).indicator (fun r => f (projIcc 0 T hT r))
  have hg : (∫ r : Icc (0 : ℝ) T, g r.val ∂timeMeasure T) =
      ∫ r, f r ∂timeUpTo T t := by
    rw [timeUpTo, ← integral_indicator (s := {r : Icc (0 : ℝ) T | r.val ∈ Ioc 0 t})
      (show MeasurableSet {r : Icc (0 : ℝ) T | r.val ∈ Ioc 0 t} from
        measurableSet_Ioc.preimage measurable_subtype_coe)]
    apply integral_congr_ae
    apply Eventually.of_forall
    intro r
    simp only [g, indicator_apply, mem_setOf_eq, projIcc_of_mem hT r.property]
  rw [← hg, timeMeasure, integral_subtype_comap measurableSet_Icc]
  rw [show g = (Ioc 0 t).indicator (fun r => f (projIcc 0 T hT r)) from rfl,
    setIntegral_indicator measurableSet_Ioc, intervalIntegral.integral_of_le ht.1]
  have hsub : Ioc (0 : ℝ) t ⊆ Icc 0 T := fun r hr => ⟨hr.1.le,hr.2.trans ht.2⟩
  rw [inter_eq_right.mpr hsub]

end GGC.Identification
