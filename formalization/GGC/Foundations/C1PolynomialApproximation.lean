import Mathlib.Topology.ContinuousMap.Weierstrass
import Mathlib.Analysis.Calculus.Deriv.Polynomial
import Mathlib.Analysis.Calculus.ContDiff.Deriv
import Mathlib.Analysis.Calculus.MeanValue
import Mathlib.Tactic

/-! # Simultaneous polynomial approximation of a function and its derivative -/

noncomputable section
open Set
open scoped Polynomial
namespace GGC.Analysis

theorem exists_polynomial_primitive (q : ℝ[X]) (c : ℝ) :
    ∃ p : ℝ[X], p.derivative = q ∧ p.eval 0 = c := by
  have hp : ∃ p : ℝ[X], p.derivative = q := by
    induction q using Polynomial.induction_on' with
    | add q r hq hr =>
      obtain ⟨p,hp⟩ := hq
      obtain ⟨s,hs⟩ := hr
      exact ⟨p+s, by simp only [Polynomial.derivative_add, hp, hs]⟩
    | monomial n a =>
      refine ⟨Polynomial.monomial (n+1) (a/(n+1)), ?_⟩
      rw [Polynomial.derivative_monomial_succ]
      congr 1
      field_simp
  obtain ⟨p,hp⟩ := hp
  refine ⟨p+Polynomial.C (c-p.eval 0), ?_, ?_⟩
  · simp only [Polynomial.derivative_add, Polynomial.derivative_C, add_zero, hp]
  · simp

/-- Both errors have the same bound on the unit interval. The primitive is
normalized exactly at zero; only the library's continuous approximation is used. -/
theorem exists_polynomial_C1_approximation {f : ℝ → ℝ} (hf : ContDiff ℝ 1 f)
    {ε : ℝ} (hε : 0 < ε) :
    ∃ p : ℝ[X], p.eval 0 = f 0 ∧ ∀ x ∈ Icc (0 : ℝ) 1,
      |p.eval x-f x| ≤ ε ∧ |p.derivative.eval x-deriv f x| ≤ ε := by
  obtain ⟨q,hq⟩ := exists_polynomial_near_of_continuousOn 0 1 (deriv f)
    hf.continuous_deriv_one.continuousOn ε hε
  obtain ⟨p,hp,hp0⟩ := exists_polynomial_primitive q (f 0)
  have hd (x : ℝ) : HasDerivAt (fun x => p.eval x-f x) (q.eval x-deriv f x) x := by
    rw [← hp]
    exact (p.hasDerivAt x).sub ((hf.differentiable (by norm_num) x).hasDerivAt)
  refine ⟨p,hp0,fun x hx => ⟨?_, by rw [hp]; exact (hq x hx).le⟩⟩
  have hb := norm_image_sub_le_of_norm_deriv_le_segment'
    (fun x (_hx : x ∈ Icc (0 : ℝ) 1) => (hd x).hasDerivWithinAt)
    (fun x (hx : x ∈ Ico (0 : ℝ) 1) => by
      simpa only [Real.norm_eq_abs] using (hq x ⟨hx.1,hx.2.le⟩).le) x hx
  simp only [hp0, sub_self, sub_zero, Real.norm_eq_abs] at hb
  exact hb.trans (by nlinarith [hx.2])

end GGC.Analysis
