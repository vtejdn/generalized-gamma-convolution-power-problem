# External mathematical axioms: contracts, sources, and prohibited extensions

Date: 2026-09-06. Back to the [blueprint](README.md) · [API audit](mathlib-api-audit.md).

This document follows the user's engineering policy: results cited from external papers and monographs are generally declared as `axiom`.
Only planned contracts are registered at present; **no `.lean` axioms have been added, and no machine-verification claims are made**.
Sources are based on the [primary-interface audit](../notes/log-rate-power-proof-primary-interfaces.md)
and the [manuscript bibliography](../manuscript/references.bib).

## 1. Basic policy

External axioms isolate literature theory that has not been formalized; they must not relabel this paper's difficult lemmas as external facts.
Each declaration must include a stable ID, an exact source and version, definitions of the mathematical objects,
complete assumptions, a conclusion, consuming modules, and an explanation of adaptations from the original.

The following distinctions must be enforced in code and documentation:

- **External theorem**: precisely traceable to a specified paper or monograph; placed in `GGC.External`.
- **Local specialization of an external theorem**: derived by variable substitution, tilting, normalization, etc.;
  written as a theorem by default, to avoid silently strengthening conclusions inside an axiom.
- **New derivation in this project**: requires a completed Lean proof and cannot enter the external whitelist.
- **Engineering placeholder**: any development use of `sorry` or temporary premises must be clearly marked incomplete;
  compilation of the target file does not establish completion of the formalization.

If, to reduce the cost of defining objects from external theory, a verified literature corollary is ultimately declared directly as a specialized axiom,
its registration must document every mathematical adaptation from the original statement, label it a
“source-derived interface,” and undergo human review to confirm that it is indeed a consequence of the source.
Citing a source name alone does not authorize an arbitrarily strong interface.

## 2. Bondesson: GGC structure and final closure

Source: Lennart Bondesson, *Generalized Gamma Convolutions and Related Classes
of Distributions and Densities*, Lecture Notes in Statistics 76, Springer,
1992, [DOI 10.1007/978-1-4612-2948-3](https://doi.org/10.1007/978-1-4612-2948-3).
Local copy: [Bondesson.pdf](../literature/Bondesson.pdf), printed p.29 and pp.34–35,
corresponding to audited PDF pp.38 and 43–44. The Thorin representation and integrability are in §3.1;
closure uses Theorem 3.1.5, and finite-atomic approximation uses the final paragraph on p.35.

### E-B1: Realization / recognition of the Thorin representation

Input: a≥0 and a positive measure U on (0,∞) satisfying classical Thorin integrability, explicitly guaranteeing
integrability of `log(1+s/b)` for every s>0. Output: a nonnegative probability law μ exists with

\[
L_\mu(s)=\exp\{-as-\int\log(1+s/b)U(db)\},\qquad s>0.
\]

If `IsGGC` is defined directly by existence of such a representation, recognition is simply unfolding the definition and needs no duplicate axiom;
realization remains a genuine external existence input. U may have infinite mass; do not mistakenly require a “finite positive measure”
in the final GGC definition. Uniqueness can be handled by a local proof of density of Laplace tests,
without a further dedicated uniqueness axiom.

### E-B2: Weak closure at probability limits with no loss of mass

Input: GGC probability laws μₙ with μₙ⇒μ, where μ is already a nonnegative probability law.
Output: `IsGGC μ`. Pointwise convergence of a family of Laplace functions alone does not permit skipping the question of whether
the limit represents a probability law. Other directions of Thm 3.1.5 concerning canonical measures, with any additional assumptions, are not imported by this contract.

### E-B3: Zero-drift finite Gamma approximation of all GGC laws

Input: any GGC probability law μ. Output: a sequence of actual zero-drift finite Gamma convolution laws μₙ,
parameterized by finitely many positive shapes and positive rates, with μₙ⇒μ.

This is the final bridge encompassing drift, infinite Thorin mass, and degenerate limits. The output imposes no uniformity in n
on total shape, number of rates, log-rate second moments, or approximation speed. If the API allows an empty convolution,
prove separately that it is δ0; if each term must be nonempty, handle the zero limit by a degenerate approximation using positive-shape Gamma laws.

**Required local proofs**: the power map for fixed q≥1 preserves weak convergence; apply E-B2 once the finite Gamma case is proved;
obtain the public main theorem with no remaining restrictions on approximation parameters.

## 3. James: Gamma–Dirichlet and the one-observation posterior

Source: Lancelot F. James, *Functionals of Dirichlet Processes, the
Cifarelli–Regazzini Identity and Beta-Gamma Processes*, Annals of Statistics
33(2) (2005), 647–660,
[DOI 10.1214/009053604000001237](https://doi.org/10.1214/009053604000001237).
Pinned version: [arXiv:math/0505606v1](https://arxiv.org/pdf/math/0505606v1),
(1)–(3) on reprint p.2, and the posterior discussion and (8) on pp.4–5.

### E-J1: Markov–Krein identity for DP

Input: a finite positive base U of mass B∈(0,∞); P~DP(U); measurable g≥0 satisfying
`∫ log(1+g(b)) U(db)<∞`. The contract must explicitly guarantee that the corresponding random mean is a.s. finite,
or first define it through a nonnegative extended integral and then derive finiteness. Output:

\[
\mathbb E\bigl(1+\!\int g\,dP\bigr)^{-B}
=\exp\{-\!\int\log(1+g)\,dU\}.
\]

Express independence using a product probability space for a positive Gamma variable G_B and P, rather than omitting the independence assumption.
Together with the Gamma Laplace integral and transform uniqueness, derive locally that, when U satisfies finite Thorin integrability,
G_B∫b⁻¹P(db) has the corresponding zero-drift GGC law.

The identity with g(b)=t/(s+b) also yields locally the tilted law
`X_s =d G_B ∫(s+b)⁻¹P(db)`. This step includes parameterization and normalization and does not additionally assume
positive-order moments of the original law; for s>0 the mean kernel is bounded.

### E-J2: Palm / posterior decomposition for one draw

Let F=U/B. For nonnegative measurable Φ, first register the nonnegative-integral version:

\[
\mathbb E_{DP(U)}\int\Phi(b,P)P(db)
=\int F(db)\,\mathbb E_{DP(U+\delta_b)}\Phi(b,P).
\]

It applies to atomic, nonatomic, and mixed bases. Do not incorrectly import the nonatomic restriction
from a partition-factorization passage in the paper. Random-measure evaluation and joint measurability of Φ must be explicit in the type interface.

**Derive the signed version locally**: first apply the identity to |Φ| to establish absolute integrability, then use positive and negative parts
or Bochner kernel Fubini. An interchange of real integrals without integrability assumptions must not be declared as an axiom.

### E-J3: Convex-mixture realization of the posterior

For each b>0, let Q~DP(U) and Z~Beta(1,B) be independent. Then

\[
(1-Z)Q+Z\delta_b\ \sim\ DP(U+\delta_b).
\]

This is the classical realization of the first-order posterior. It may be registered as an interface to the verified one-observation formula,
or proved locally from the Dirichlet–Gamma algebra of finite DP partitions. If an interface axiom is chosen, state that it is a source-derived version
of the original posterior result combined with Gamma normalization, not a verbatim statement from the paper.

The local proof must establish `Z/2 ≤ b M_P(b) ≤ 1`, its logarithmic domination, and joint parameter continuity.
The constant in the original power tangent remains ψ(B+1); the posterior mass becoming B+1 does not permit replacing it by ψ(B+2).

## 4. SSV: bounded phase representation

Source: René L. Schilling, Renming Song and Zoran Vondraček,
*Bernstein Functions: Theory and Applications*, **2010 first edition**,
de Gruyter Studies in Mathematics 37, ISBN 978-3-11-021530-4.
Theorem 6.10, printed pp.58–59; Theorem 7.3, p.63.
The local [SSV.pdf](../literature/SSV.pdf) has these on PDF pp.71–73 and 76.
Also record the authors'
[2022-12-01 first-edition errata](https://www.motapa.de/bernstein_functions/misprints-ssv.pdf).

### E-S1: Reciprocal CBF representation of a nonzero Stieltjes function

Thm 7.3 relates nonzero Stieltjes functions to reciprocal complete Bernstein functions;
Thm 6.10 supplies their exponential representation with phase density 0≤ξ≤1 and a.e. uniqueness.
One may declare these two original theorems and define the required function classes, or declare the audited resolvent-mean specialization
to avoid formalizing the entire CBF theory. The latter choice must disclose the following adaptation:

For any probability measure P on (0,∞),

\[
M_P(s)=\int\frac{P(db)}{s+b}>0,
\]

is a nonzero Stieltjes function. Apply Thms 7.3 and 6.10 to 1/M_P, take logarithms, and subtract
the representations at s and 1 to obtain a measurable phase ξ_P∈[0,1] satisfying

\[
\log M_P(s)-\log M_P(1)
=\int_0^\infty\xi_P(t)
 \left(\frac1{s+t}-\frac1{1+t}\right)dt,\qquad s>0.
\]

The contract should include a.e. uniqueness of the phase. If the local boundary-recovery proof uses the complex representation,
retain the original theorem's representation on the slit plane as well, rather than only the real-axis identity above.
The normalization constant is fixed by M_P(1). Absolute integrability of the difference kernel can be estimated directly and locally.

Explicitly exclude additional assumptions or conclusions such as M_P(0+)<∞, atomlessness of P, pointwise continuity of the phase in P,
or existence of boundary phase limits everywhere. This proof is anchored at 1 and does not use a zero-anchor formula requiring extra endpoint conditions.

### Local adaptation obligations, not APIs automatically supplied by SSV

1. Fix a representative using the boundary limsup and prove joint measurability in (P,t).
2. Obtain Poisson boundary recovery from the complex representation and prove that this representative equals ξ_P a.e. at Lebesgue points.
   General Poisson/Lebesgue differentiation interfaces still require search and adaptation during implementation. If another external classical theorem
   is ultimately adopted as an axiom, add an exact source; do not extend E-S1 without attribution.
3. Handle parameter scaling and anchor 1 consistently; uniquely identify weak-star phase limits.
4. Prove convergence of L¹ pairings with K and the Taylor kernels, then obtain generator continuity through posterior expectation.

These parameterized conclusions are not a measurable-selection theorem implied merely by “for each P there exists ξ.”

### Errata constraints

- The intermediate Herglotz measure on printed p.59 must be on [0,∞) and have finite total mass;
  do not use the old misprint requiring only finite tail mass.
- A class equality in Remark 6.11 on p.60 has been corrected to a one-way inclusion; the erroneous reverse inclusion must not be used.
- Neither correction changes the current bounded-phase interface anchored at 1. Registered citations must specify the first edition
  together with these errata, without mixing in second-edition page numbers.

## 5. Sethuraman: DP semantics of stick-breaking

Source: Jayaram Sethuraman, *A Constructive Definition of Dirichlet Priors*,
Statistica Sinica 4(2) (1994), 639–650,
[original journal page](https://www3.stat.sinica.edu.tw/statistica/j4n2/j4n216/j4n216.htm).
§2, construction (2.1) on printed pp.642–643; Thm 3.4, Dirichlet property on p.645.

### E-T1: A random discrete measure with independent weights and locations has a DP law

Input: B>0, a probability measure F, i.i.d. V_j with law Beta(1,B), and i.i.d. Y_j with law F,
with the two sequences independent. Set

\[
W_j=V_j\prod_{i<j}(1-V_i),\qquad Q=\sum_jW_j\delta_{Y_j}.
\]

Output: Q realizes DP(BF), allowing atomic or mixed F. The definition of the random measure and its a.s. unit mass must be explicit:
the latter may be proved locally from the expected residual mass `(B/(B+1))^m`, or registered together with the precise construction theorem.
Probability status must not be hidden in an unsupported construction field.

**Not included in E-T1**: sample weak convergence on common coordinates when Bₙ→B, Fₙ⇒F, and yₙ→y;
tail-weight control; a common integrable bound for posterior logarithms; phase limits. These remain part of this paper's continuity proof.

## 6. Core results excluded from the external axiom whitelist

| Project responsibility | Manuscript location | Key content to prove |
|---|---|---|
| `power_tangent` | §3 | Domination and correct parameters for q and s derivatives |
| `posterior_absolute_drift_bound` | §4, `eq:absolute-posterior-drift` | An integrable bound taking absolute values before posterior expectation |
| `generator_resolvent_action` | §4, direct cancellation proof; WIP-6.22 | Signs, coefficients, and absolute Fubini for `(h+g)/B` |
| `generator_joint_continuity` | §5, `lem:continuity` | Simultaneous variation of B, F, y and continuity of Hφ |
| `positive_euler_exists` | §5, `thm:evolution` | Actual probability kernels, M₂, compactness, consistency, nonlinear limits |
| `identify_power_flow` | §6, `thm:identification` | Normalization at s=0, density in generator norm, dynamic transport uniqueness |
| `ggc_rpow` | Main theorem and §7 | Original full quantifiers, with no hidden moment or support conditions |

Wrapping any of these in a structure such as `ExternalFacts`, `PowerAdmissible`, or `EvolutionExists`
and assuming an instance exists still leaves the core unformalized and is not an acceptable final delivery.

## 7. Trust audit and status reporting

After implementation, every external axiom should be accompanied by its registration ID, full bibliographic key,
theorem/page, source version, and whether the declaration is the original theorem or a source-derived interface.
The final audit is `#print axioms GGC.ggc_rpow`:

- Lean's foundational logical axioms, such as `propext`, `Classical.choice`, and `Quot.sound`, are allowed
  (subject to the actual output).
- Verified external mathematical declarations registered in this file are allowed.
- `sorryAx`, unsourced mathematical axioms, and synonymous placeholders for the project's core are prohibited.
- Inspect the definitions of dependent declarations as well, to ensure that incorrectly totalized integrals or circular definitions do not make the conclusion vacuous.

An accurate final report may say: “Lean verified this paper's derivations relative to the registered external literature axioms from
Bondesson, James, SSV, Sethuraman, and other listed sources.” It must not say “Lean proved all cited literature from foundational axioms,”
and the design in this document must not itself be reported as a completed formalization.
