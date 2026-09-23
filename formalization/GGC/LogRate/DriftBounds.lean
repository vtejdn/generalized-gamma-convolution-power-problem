import GGC.BetaPosterior
import GGC.LogRate.Kernel

/-! # Posterior drift estimates for a measurable bounded phase

The phase is an explicit function argument, not a presumed Stieltjes
representation. These estimates can be specialized after the canonical phase
and the actual Dirichlet law have been constructed.
-/

noncomputable section
open MeasureTheory Set

namespace GGC.LogRate

def phaseCorrection (ξ : ℝ → ℝ) : ℝ := ∫ u in Ioi 0, ξ u * correctionKernel u

theorem integrable_phaseCorrection {ξ : ℝ → ℝ} (hξ : Measurable ξ)
    (h₀ : ∀ u, 0 ≤ ξ u) (h₁ : ∀ u, ξ u ≤ 1) :
    IntegrableOn (fun u => ξ u * correctionKernel u) (Ioi 0) := by
  apply integrableOn_correctionKernel.abs.mono' (hξ.mul measurable_correctionKernel).aestronglyMeasurable
  apply Filter.Eventually.of_forall
  intro u
  change ‖ξ u * correctionKernel u‖ ≤ |correctionKernel u|
  rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (h₀ u)]
  exact mul_le_of_le_one_left (abs_nonneg _) (h₁ u)

/-- The signed correction has the sharper bound obtained from the two signs of K. -/
theorem phaseCorrection_bounds {ξ : ℝ → ℝ} (hξ : Measurable ξ)
    (h₀ : ∀ u, 0 ≤ ξ u) (h₁ : ∀ u, ξ u ≤ 1) :
    Real.log 2 - 1 ≤ phaseCorrection ξ ∧ phaseCorrection ξ ≤ 1 - Real.log 2 := by
  have hi := integrable_phaseCorrection hξ h₀ h₁
  have hn := hi.mono_set (show Ioc (0 : ℝ) 1 ⊆ Ioi 0 from Ioc_subset_Ioi_self)
  have hp := hi.mono_set (Ioi_subset_Ioi zero_le_one)
  have hkn := integrableOn_correctionKernel.mono_set
    (show Ioc (0 : ℝ) 1 ⊆ Ioi 0 from Ioc_subset_Ioi_self)
  have hkp := integrableOn_correctionKernel.mono_set (Ioi_subset_Ioi zero_le_one)
  have hneg : (∫ u in Ioc 0 1, correctionKernel u) ≤
      (∫ u in Ioc 0 1, ξ u * correctionKernel u) ∧
      (∫ u in Ioc 0 1, ξ u * correctionKernel u) ≤ 0 := by
    constructor
    · apply integral_mono_ae hkn hn
      filter_upwards [ae_restrict_mem measurableSet_Ioc] with u hu
      have hk := correctionKernel_nonpos hu.1 hu.2
      nlinarith [mul_nonneg (sub_nonneg.mpr (h₁ u)) (neg_nonneg.mpr hk)]
    · apply integral_nonpos_of_ae
      filter_upwards [ae_restrict_mem measurableSet_Ioc] with u hu
      exact mul_nonpos_of_nonneg_of_nonpos (h₀ u) (correctionKernel_nonpos hu.1 hu.2)
  have hpos : 0 ≤ (∫ u in Ioi 1, ξ u * correctionKernel u) ∧
      (∫ u in Ioi 1, ξ u * correctionKernel u) ≤ ∫ u in Ioi 1, correctionKernel u := by
    constructor
    · apply integral_nonneg_of_ae
      filter_upwards [ae_restrict_mem measurableSet_Ioi] with u hu
      exact mul_nonneg (h₀ u) (correctionKernel_nonneg hu.le)
    · apply integral_mono_ae hp hkp
      filter_upwards [ae_restrict_mem measurableSet_Ioi] with u hu
      exact mul_le_of_le_one_left (correctionKernel_nonneg hu.le) (h₁ u)
  rw [integral_Ioc_eq_integral_Ioo, integral_correctionKernel_Ioo_zero_one] at hneg
  rw [integral_correctionKernel_Ioi_one] at hpos
  unfold phaseCorrection
  rw [← Ioc_union_Ioi_eq_Ioi zero_le_one,
    setIntegral_union (by simp [Set.disjoint_left]) measurableSet_Ioi hn hp]
  constructor <;> linarith

theorem abs_phaseCorrection_le {ξ : ℝ → ℝ} (hξ : Measurable ξ)
    (h₀ : ∀ u, 0 ≤ ξ u) (h₁ : ∀ u, ξ u ≤ 1) :
    |phaseCorrection ξ| ≤ 1 - Real.log 2 := by
  have h := phaseCorrection_bounds hξ h₀ h₁
  exact abs_le.mpr ⟨by linarith [h.1], h.2⟩

def scaledPhaseCorrection (ξ : ProbabilityMeasure PosReal × ℝ → ℝ)
    (b : PosReal) (P : ProbabilityMeasure PosReal) : ℝ :=
  phaseCorrection (fun u => ξ (P, b.val * u))

theorem measurable_scaledPhaseCorrection {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) (b : PosReal) : Measurable (scaledPhaseCorrection ξ b) := by
  have hm : Measurable (fun x : ProbabilityMeasure PosReal × ℝ =>
      ξ (x.1, b.val * x.2) * correctionKernel x.2) :=
    (hξ.comp (measurable_fst.prodMk (measurable_snd.const_mul b.val))).mul
      (measurable_correctionKernel.comp measurable_snd)
  exact hm.stronglyMeasurable.integral_prod_right'.measurable

theorem scaledPhaseCorrection_jointlyMeasurable {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) :
    Measurable (fun x : PosReal × ProbabilityMeasure PosReal => scaledPhaseCorrection ξ x.1 x.2) := by
  have hp : Measurable (fun x : (PosReal × ProbabilityMeasure PosReal) × ℝ =>
      (x.1.2, x.1.1.val * x.2)) := by fun_prop
  have hm := (hξ.comp hp).mul (measurable_correctionKernel.comp measurable_snd)
  exact hm.stronglyMeasurable.integral_prod_right'.measurable

theorem integrable_scaledPhaseCorrection {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) (h₀ : ∀ P t, 0 ≤ ξ (P,t)) (h₁ : ∀ P t, ξ (P,t) ≤ 1)
    (b : PosReal) (R : ProbabilityMeasure (ProbabilityMeasure PosReal)) :
    Integrable (scaledPhaseCorrection ξ b) (R : Measure (ProbabilityMeasure PosReal)) := by
  apply (integrable_const (1 - Real.log 2)).mono'
    (measurable_scaledPhaseCorrection hξ b).aestronglyMeasurable
  apply Filter.Eventually.of_forall
  intro P
  rw [Real.norm_eq_abs]
  exact abs_phaseCorrection_le
    (hξ.comp (measurable_const.prodMk (measurable_id.const_mul b.val)))
    (fun u => h₀ P _) (fun u => h₁ P _)

def phaseDrift (ξ : ProbabilityMeasure PosReal × ℝ → ℝ)
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal) (y : ℝ) : ℝ :=
  let b : PosReal := ⟨Real.exp y, Real.exp_pos y⟩
  y - digamma (B.val + 1) - 1 +
    ∫ P, posteriorLog b P + scaledPhaseCorrection ξ b P
      ∂(posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal))

theorem phaseDrift_jointlyMeasurable {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) :
    Measurable (fun x : ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × ℝ =>
      phaseDrift ξ x.1 x.2.1 x.2.2) := by
  have hp : Measurable (fun x : ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × ℝ =>
      (x.1, x.2.1, (⟨Real.exp x.2.2, Real.exp_pos _⟩ : PosReal))) := by fun_prop
  have hR := posteriorMixtureLaw_jointlyMeasurable.comp hp
  have hq : Measurable (fun x : (ProbabilityMeasure (ProbabilityMeasure PosReal) × PosReal × ℝ) ×
      ProbabilityMeasure PosReal => ((⟨Real.exp x.1.2.2, Real.exp_pos _⟩ : PosReal), x.2)) := by
    fun_prop
  have hi := RandomMeasure.measurable_probability_integral hR
    (f := fun x P => posteriorLog ⟨Real.exp x.2.2, Real.exp_pos _⟩ P +
      scaledPhaseCorrection ξ ⟨Real.exp x.2.2, Real.exp_pos _⟩ P)
    ((measurable_posteriorLog.comp hq).add ((scaledPhaseCorrection_jointlyMeasurable hξ).comp hq))
  have hd : Continuous (fun B : PosReal => digamma (B.val + 1)) :=
    continuousOn_digamma.comp_continuous (continuous_subtype_val.add continuous_const)
      (fun B => show 0 < B.val + 1 from add_pos B.property zero_lt_one)
  exact (((measurable_snd.comp measurable_snd).sub
    (hd.measurable.comp (measurable_fst.comp measurable_snd))).sub measurable_const).add hi

/-- The blueprint drift interval, for every B > 0 and every sampling law D. -/
theorem phaseDrift_bounds {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) (h₀ : ∀ P t, 0 ≤ ξ (P,t)) (h₁ : ∀ P t, ξ (P,t) ≤ 1)
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal) (y : ℝ) :
    y - digamma (B.val + 1) - 2 + Real.log 2 ≤ phaseDrift ξ D B y ∧
      phaseDrift ξ D B y ≤ y - digamma 1 := by
  let b : PosReal := ⟨Real.exp y, Real.exp_pos y⟩
  let R := posteriorMixtureLaw D B b
  have hc := integrable_scaledPhaseCorrection hξ h₀ h₁ b R
  have hcpt : ∀ P, Real.log 2 - 1 ≤ scaledPhaseCorrection ξ b P ∧
      scaledPhaseCorrection ξ b P ≤ 1 - Real.log 2 := fun P =>
    phaseCorrection_bounds
      (hξ.comp (measurable_const.prodMk (measurable_id.const_mul b.val)))
      (fun u => h₀ P _) (fun u => h₁ P _)
  have hcint : Real.log 2 - 1 ≤ ∫ P, scaledPhaseCorrection ξ b P ∂(R : Measure _) := by
    simpa using integral_mono (integrable_const (Real.log 2 - 1)) hc (fun P => (hcpt P).1)
  have hcint' : (∫ P, scaledPhaseCorrection ξ b P ∂(R : Measure _)) ≤ 1 - Real.log 2 := by
    simpa using integral_mono hc (integrable_const (1 - Real.log 2)) (fun P => (hcpt P).2)
  have hl := integral_posteriorLog_bounds D B b
  have he : phaseDrift ξ D B y = y - digamma (B.val + 1) - 1 +
      ((∫ P, posteriorLog b P ∂(R : Measure _)) +
        ∫ P, scaledPhaseCorrection ξ b P ∂(R : Measure _)) := by
    exact congrArg (fun r => y - digamma (B.val + 1) - 1 + r)
      (integral_add (integrable_posteriorLog D B b) hc)
  rw [he]
  change 0 ≤ (∫ P, posteriorLog b P ∂(R : Measure _)) ∧ _ at hl
  constructor <;> linarith [hl.1, hl.2]

/-- A finite mass-dependent bound for the deviation from y. -/
def driftBound (B : ℝ) : ℝ := |digamma (B + 1) + 2 - Real.log 2| + |digamma 1|

theorem driftBound_nonneg (B : ℝ) : 0 ≤ driftBound B := add_nonneg (abs_nonneg _) (abs_nonneg _)

theorem abs_phaseDrift_sub_le {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) (h₀ : ∀ P t, 0 ≤ ξ (P,t)) (h₁ : ∀ P t, ξ (P,t) ≤ 1)
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B : PosReal) (y : ℝ) :
    |phaseDrift ξ D B y - y| ≤ driftBound B.val := by
  have h := phaseDrift_bounds hξ h₀ h₁ D B y
  unfold driftBound
  apply abs_le.mpr
  constructor
  · linarith [le_abs_self (digamma (B.val + 1) + 2 - Real.log 2), abs_nonneg (digamma 1)]
  · linarith [neg_le_abs (digamma 1), abs_nonneg (digamma (B.val + 1) + 2 - Real.log 2)]

theorem driftBound_boundedOn_Icc {a b : ℝ} (ha : 0 < a) :
    ∃ C : ℝ, ∀ B ∈ Icc a b, driftBound B ≤ C := by
  have hd : ContinuousOn (fun B : ℝ => digamma (B + 1)) (Icc a b) :=
    continuousOn_digamma.comp (continuous_id.add continuous_const).continuousOn
      (fun B hB => by change 0 < B + 1; linarith [hB.1])
  have hc : ContinuousOn driftBound (Icc a b) :=
    ((hd.add continuousOn_const).sub continuousOn_const).abs.add continuousOn_const
  obtain ⟨C, hC⟩ := isCompact_Icc.exists_bound_of_continuousOn hc
  exact ⟨C, fun B hB => (le_abs_self _).trans (by simpa only [Real.norm_eq_abs] using hC B hB)⟩

/-- The absolute sample drift offset, needed before signed Palm/Fubini arguments. -/
theorem integrable_sampleDriftOffset {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) (h₀ : ∀ P t, 0 ≤ ξ (P,t)) (h₁ : ∀ P t, ξ (P,t) ≤ 1)
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B b : PosReal) :
    Integrable (fun P => -(digamma (B.val + 1) + 1) + posteriorLog b P +
      scaledPhaseCorrection ξ b P)
      (posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal)) :=
  ((integrable_const _).add (integrable_posteriorLog D B b)).add
    (integrable_scaledPhaseCorrection hξ h₀ h₁ b _)

theorem integral_abs_sampleDriftOffset_le {ξ : ProbabilityMeasure PosReal × ℝ → ℝ}
    (hξ : Measurable ξ) (h₀ : ∀ P t, 0 ≤ ξ (P,t)) (h₁ : ∀ P t, ξ (P,t) ≤ 1)
    (D : ProbabilityMeasure (ProbabilityMeasure PosReal)) (B b : PosReal) :
    (∫ P, |-(digamma (B.val + 1) + 1) + posteriorLog b P + scaledPhaseCorrection ξ b P|
      ∂(posteriorMixtureLaw D B b : Measure (ProbabilityMeasure PosReal))) ≤
      |digamma (B.val + 1) + 1| + 1 + digamma (B.val + 1) - digamma 1 := by
  let R := posteriorMixtureLaw D B b
  have hi : Integrable (fun P => |digamma (B.val + 1) + 1| + posteriorLog b P + (1 - Real.log 2))
      (R : Measure (ProbabilityMeasure PosReal)) :=
    ((integrable_const _).add (integrable_posteriorLog D B b)).add (integrable_const _)
  have hc : ∀ P, |scaledPhaseCorrection ξ b P| ≤ 1 - Real.log 2 := fun P =>
    abs_phaseCorrection_le
      (hξ.comp (measurable_const.prodMk (measurable_id.const_mul b.val)))
      (fun u => h₀ P _) (fun u => h₁ P _)
  have hle : (∫ P, |-(digamma (B.val + 1) + 1) + posteriorLog b P + scaledPhaseCorrection ξ b P|
      ∂(R : Measure (ProbabilityMeasure PosReal))) ≤
      ∫ P, |digamma (B.val + 1) + 1| + posteriorLog b P + (1 - Real.log 2)
        ∂(R : Measure (ProbabilityMeasure PosReal)) := by
    apply integral_mono (integrable_sampleDriftOffset hξ h₀ h₁ D B b).abs hi
    intro P
    have ht := abs_add_le (-(digamma (B.val + 1) + 1) + posteriorLog b P)
      (scaledPhaseCorrection ξ b P)
    have ht' := abs_add_le (-(digamma (B.val + 1) + 1)) (posteriorLog b P)
    rw [abs_neg, abs_of_nonneg (posteriorLog_nonneg b P)] at ht'
    linarith [hc P]
  have he : (∫ P, |digamma (B.val + 1) + 1| + posteriorLog b P + (1 - Real.log 2)
      ∂(R : Measure (ProbabilityMeasure PosReal))) =
      |digamma (B.val + 1) + 1| + (∫ P, posteriorLog b P ∂(R : Measure _)) + (1 - Real.log 2) := by
    have hia : Integrable (fun P => |digamma (B.val + 1) + 1| + posteriorLog b P)
        (R : Measure (ProbabilityMeasure PosReal)) :=
      (integrable_const _).add (integrable_posteriorLog D B b)
    rw [integral_add hia (integrable_const (1 - Real.log 2)),
      integral_add (integrable_const (|digamma (B.val + 1) + 1|)) (integrable_posteriorLog D B b)]
    simp [R]
  rw [he] at hle
  have hl := (integral_posteriorLog_bounds D B b).2
  change (∫ P, posteriorLog b P ∂(R : Measure _)) ≤ _ at hl
  linarith

end GGC.LogRate
