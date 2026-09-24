import GGC.Foundations.StickBreaking
import GGC.Foundations.ProbabilitySeries
import Mathlib.MeasureTheory.Integral.Bochner.SumMeasure
import Mathlib.MeasureTheory.Integral.BoundedContinuousFunction

/-! # Weak continuity of normalized stick sums and atom mixtures

The coordinate weights converge in l¹ by mass preservation. Combined with
bounded continuous tests, this controls the entire infinite stick sum without
a uniform summable bound on its residuals. These are deterministic statements;
no distributional or independence assumption is used.
-/

noncomputable section
open MeasureTheory Set Filter
open scoped Topology
namespace GGC.RandomMeasure

@[fun_prop] theorem continuous_uniformBreak :
    Continuous (fun x : {b : ℝ // 0 < b} × UnitWeight => uniformBreak x.1 x.2) := by
  unfold uniformBreak
  apply Continuous.subtype_mk
  apply continuous_const.sub
  exact (continuous_subtype_val.comp continuous_snd).rpow
    (continuous_const.div (continuous_subtype_val.comp continuous_fst)
      (fun x => ne_of_gt x.1.property))
    (fun x => Or.inr (one_div_pos.mpr x.1.property))

@[fun_prop] theorem continuous_stickResidual (n : ℕ) :
    Continuous (fun V : ℕ → UnitWeight => stickResidual V n) := by
  unfold stickResidual
  fun_prop

@[fun_prop] theorem continuous_stickWeight (n : ℕ) :
    Continuous (fun V : ℕ → UnitWeight => stickWeight V n) := by
  unfold stickWeight
  fun_prop

variable {E : Type*} [MeasurableSpace E] [MeasurableSingletonClass E]

theorem integral_stickProbability (V : ℕ → UnitWeight) (Y : ℕ → E)
    (hV : HasSum (stickWeight V) 1) (f : E → ℝ) :
    (∫ x, f x ∂(stickProbability V Y hV : Measure E)) =
      ∑' n, stickWeight V n * f (Y n) := by
  change (∫ x, f x ∂Measure.sum (fun n =>
    ENNReal.ofReal (stickWeight V n) • Measure.dirac (Y n))) = _
  rw [integral_sum_dirac (fun _ => ENNReal.ofReal_ne_top)]
  simp only [ENNReal.toReal_ofReal (stickWeight_nonneg V _), smul_eq_mul]

variable [TopologicalSpace E] [OpensMeasurableSpace E]

theorem tendsto_stickProbability {ι : Type*} {l : Filter ι}
    {V : ι → ℕ → UnitWeight} {W : ℕ → UnitWeight}
    {Y : ι → ℕ → E} {Z : ℕ → E}
    (hV : ∀ i, HasSum (stickWeight (V i)) 1) (hW : HasSum (stickWeight W) 1)
    (htV : ∀ n, Tendsto (fun i => V i n) l (𝓝 (W n)))
    (htY : ∀ n, Tendsto (fun i => Y i n) l (𝓝 (Z n))) :
    Tendsto (fun i => stickProbability (V i) (Y i) (hV i)) l
      (𝓝 (stickProbability W Z hW)) := by
  apply ProbabilityMeasure.tendsto_iff_forall_integral_tendsto.mpr
  intro f
  simp_rw [integral_stickProbability]
  apply Analysis.tendsto_probability_weighted_tsum
    (fun i => stickWeight_nonneg (V i)) (stickWeight_nonneg W) hV hW
    (fun n => ((continuous_stickWeight n).tendsto W).comp (tendsto_pi_nhds.mpr htV))
    (fun n => (f.continuous.tendsto (Z n)).comp (htY n))
    (C := ‖f‖)
  intro i n
  exact f.norm_coe_le_norm (Y i n)

omit [MeasurableSingletonClass E] in
theorem tendsto_atomMixture {ι : Type*} {l : Filter ι}
    {P : ι → ProbabilityMeasure E} {Q : ProbabilityMeasure E}
    {z : ι → UnitWeight} {w : UnitWeight} {y : ι → E} {x : E}
    (hP : Tendsto P l (𝓝 Q)) (hz : Tendsto z l (𝓝 w)) (hy : Tendsto y l (𝓝 x)) :
    Tendsto (fun i => atomMixture (P i) (z i) (y i)) l (𝓝 (atomMixture Q w x)) := by
  apply ProbabilityMeasure.tendsto_iff_forall_integral_tendsto.mpr
  intro f
  have he (R : ProbabilityMeasure E) (a : UnitWeight) (b : E) :
      (∫ t, f t ∂(atomMixture R a b : Measure E)) =
        (1 - a.val) * (∫ t, f t ∂(R : Measure E)) + a.val * f b :=
    integral_atomMixture a b (f.integrable _) f.continuous.measurable
  simp_rw [he]
  have hv := continuous_subtype_val.tendsto w |>.comp hz
  have hi := ProbabilityMeasure.tendsto_iff_forall_integral_tendsto.mp hP f
  exact ((tendsto_const_nhds.sub hv).mul hi).add
    (hv.mul ((f.continuous.tendsto x).comp hy))

end GGC.RandomMeasure
