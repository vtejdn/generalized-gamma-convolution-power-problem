import GGC.Foundations.RandomMeasure
import Mathlib.Logic.Equiv.Fin.Basic

/-! # Finite measurable partitions and full-vector refinement projections

Cells may be empty. No representative points or topological assumptions are used.
-/
noncomputable section
open MeasureTheory Set
open scoped ENNReal BigOperators
namespace GGC.RandomMeasure
variable {E : Type*} [MeasurableSpace E]

def Partition.trivial : Partition E 1 where
  cell _ := univ
  measurable_cell _ := MeasurableSet.univ
  disjoint := by intro i j h; exact (h (Subsingleton.elim _ _)).elim
  covers := by
    apply eq_univ_of_forall
    intro b
    exact mem_iUnion.mpr ⟨0, mem_univ b⟩

def Partition.binary (A : Set E) (hA : MeasurableSet A) : Partition E 2 where
  cell i := if i = 0 then A else Aᶜ
  measurable_cell i := by
    split_ifs
    · exact hA
    · exact hA.compl
  disjoint := by
    intro i j hij
    fin_cases i <;> fin_cases j <;> simp_all
    · exact disjoint_compl_right
    · exact disjoint_compl_left
  covers := by
    apply eq_univ_of_forall
    intro b
    by_cases hb : b ∈ A
    · exact mem_iUnion.mpr ⟨0, by simpa using hb⟩
    · exact mem_iUnion.mpr ⟨1, by simpa using hb⟩

@[simp] theorem Partition.binary_zero (A : Set E) (hA : MeasurableSet A) :
    (Partition.binary A hA).cell 0 = A := by simp [Partition.binary]

@[simp] theorem partitionEval_binary_zero (A : Set E) (hA : MeasurableSet A)
    (P : ProbabilityMeasure E) :
    partitionEval (Partition.binary A hA) P 0 = ((P : Measure E) A).toReal := by
  simp [partitionEval]

theorem ofReal_partitionEval_binary_zero (A : Set E) (hA : MeasurableSet A)
    (P : ProbabilityMeasure E) :
    ENNReal.ofReal (partitionEval (Partition.binary A hA) P 0) = (P : Measure E) A := by
  rw [partitionEval_binary_zero, ENNReal.ofReal_toReal (measure_ne_top _ _)]

def Partition.refine {n m : ℕ} (p : Partition E n) (q : Partition E m) :
    Partition E (n*m) where
  cell k := p.cell (finProdFinEquiv.symm k).1 ∩ q.cell (finProdFinEquiv.symm k).2
  measurable_cell k := (p.measurable_cell _).inter (q.measurable_cell _)
  disjoint := by
    intro i j hij
    by_cases h : (finProdFinEquiv.symm i).1 = (finProdFinEquiv.symm j).1
    · have h' : (finProdFinEquiv.symm i).2 ≠ (finProdFinEquiv.symm j).2 := by
        intro h'
        exact hij (finProdFinEquiv.symm.injective (Prod.ext h h'))
      exact (q.disjoint h').mono inter_subset_right inter_subset_right
    · exact (p.disjoint h).mono inter_subset_left inter_subset_left
  covers := by
    apply Set.eq_univ_of_forall
    intro b
    have hp : b ∈ ⋃ i, p.cell i := by rw [p.covers]; trivial
    have hq : b ∈ ⋃ i, q.cell i := by rw [q.covers]; trivial
    obtain ⟨i, hi⟩ := mem_iUnion.mp hp
    obtain ⟨j, hj⟩ := mem_iUnion.mp hq
    exact mem_iUnion.mpr ⟨finProdFinEquiv (i,j), by simpa using And.intro hi hj⟩

@[simp] theorem Partition.refine_cell {n m : ℕ} (p : Partition E n) (q : Partition E m)
    (i : Fin n) (j : Fin m) :
    (p.refine q).cell (finProdFinEquiv (i,j)) = p.cell i ∩ q.cell j := by
  change p.cell (finProdFinEquiv.symm (finProdFinEquiv (i,j))).1 ∩
    q.cell (finProdFinEquiv.symm (finProdFinEquiv (i,j))).2 = _
  rw [Equiv.symm_apply_apply]

def leftSum {n m : ℕ} (x : Fin (n*m) → ℝ) (i : Fin n) : ℝ :=
  ∑ j : Fin m, x (finProdFinEquiv (i,j))

def rightSum {n m : ℕ} (x : Fin (n*m) → ℝ) (j : Fin m) : ℝ :=
  ∑ i : Fin n, x (finProdFinEquiv (i,j))

@[fun_prop] theorem measurable_leftSum (n m : ℕ) :
    Measurable (@leftSum n m) := by unfold leftSum; fun_prop

@[fun_prop] theorem measurable_rightSum (n m : ℕ) :
    Measurable (@rightSum n m) := by unfold rightSum; fun_prop

theorem Partition.refine_left_union {n m : ℕ} (p : Partition E n) (q : Partition E m)
    (i : Fin n) : (⋃ j : Fin m, (p.refine q).cell (finProdFinEquiv (i,j))) = p.cell i := by
  simp only [Partition.refine_cell, ← inter_iUnion, q.covers, inter_univ]

theorem Partition.refine_right_union {n m : ℕ} (p : Partition E n) (q : Partition E m)
    (j : Fin m) : (⋃ i : Fin n, (p.refine q).cell (finProdFinEquiv (i,j))) = q.cell j := by
  simp only [Partition.refine_cell, ← iUnion_inter, p.covers, univ_inter]

theorem leftSum_partitionEval {n m : ℕ} (p : Partition E n) (q : Partition E m)
    (P : ProbabilityMeasure E) : leftSum (partitionEval (p.refine q) P) = partitionEval p P := by
  ext i
  have hd : Pairwise (fun j k : Fin m => Disjoint
      ((p.refine q).cell (finProdFinEquiv (i,j))) ((p.refine q).cell (finProdFinEquiv (i,k)))) := by
    intro j k hjk
    apply (p.refine q).disjoint
    simpa using hjk
  have h := measure_iUnion (μ := (P : Measure E)) hd
    (fun j => (p.refine q).measurable_cell (finProdFinEquiv (i,j)))
  rw [p.refine_left_union q i, tsum_fintype] at h
  simp only [leftSum, partitionEval]
  rw [h, ENNReal.toReal_sum (fun j _ => measure_ne_top _ _)]

theorem rightSum_partitionEval {n m : ℕ} (p : Partition E n) (q : Partition E m)
    (P : ProbabilityMeasure E) : rightSum (partitionEval (p.refine q) P) = partitionEval q P := by
  ext j
  have hd : Pairwise (fun i k : Fin n => Disjoint
      ((p.refine q).cell (finProdFinEquiv (i,j))) ((p.refine q).cell (finProdFinEquiv (k,j)))) := by
    intro i k hik
    apply (p.refine q).disjoint
    simpa using hik
  have h := measure_iUnion (μ := (P : Measure E)) hd
    (fun i => (p.refine q).measurable_cell (finProdFinEquiv (i,j)))
  rw [p.refine_right_union q j, tsum_fintype] at h
  simp only [rightSum, partitionEval]
  rw [h, ENNReal.toReal_sum (fun i _ => measure_ne_top _ _)]

theorem measure_eq_sum_refine_binary {n : ℕ} (p : Partition E n)
    (A : Set E) (hA : MeasurableSet A) (P : ProbabilityMeasure E) :
    (P : Measure E) A = ∑ i : Fin n,
      ENNReal.ofReal (partitionEval (p.refine (Partition.binary A hA)) P
        (finProdFinEquiv (i,0))) := by
  have h := congrFun (rightSum_partitionEval p (Partition.binary A hA) P) 0
  rw [partitionEval_binary_zero] at h
  rw [← ENNReal.ofReal_toReal (measure_ne_top (P : Measure E) A), ← h]
  exact ENNReal.ofReal_sum_of_nonneg (fun i _ => ENNReal.toReal_nonneg)

end GGC.RandomMeasure
