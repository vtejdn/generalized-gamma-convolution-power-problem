# GGC power theorem: Lean formalization blueprint

Date: 2026-09-06. The subject is the current [TeX manuscript](../manuscript/ggc-power-closure.tex),
specifically its logarithmic Thorin evolution proof, rather than the α-Cauchy SD proof in the background project.

**This directory currently contains only a blueprint, a source-level API audit, and an external axiom boundary; there is no Lean implementation or machine verification.**
The manuscript source cleanup for this round is complete; it has not been compiled, as previously requested.
All module names and local theorem names below are proposed names, not existing Lean declarations.

Reading order: this document → [mathlib API audit](mathlib-api-audit.md) →
[external axiom contracts](axiom-boundary.md). For mathematical status, see
[ResearchStatus](../ResearchStatus.md); for individual proofs, see [WIP](../WIP.md) and
[ledger 19–25](../ledger/README.md).

## 1. Goal and trust boundary

The final public theorem must preserve the original quantifiers: for every nonnegative GGC probability distribution μ and every real q ≥ 1,
the pushforward under x ↦ x^q is again GGC. The final interface must retain no restrictions requiring finite Thorin mass,
zero drift, finite second moments, finite rate support, or an upper bound on shape parameters.

As requested by the user for this work, verified theorems from external papers and monographs are generally declared as `axiom`.
The engineering goal is therefore “machine-check the new derivations in this paper relative to an explicit list of literature axioms.”
This is not a formalization from scratch without external mathematical axioms. Existing mathlib theorems should be reused directly, not axiomatized again.
Generator continuity, Euler existence, dynamic identification, and power closure in this paper must not enter the external axiom whitelist
merely because they are difficult to formalize.

Selected source baseline: mathlib commit
`810b3888d0aa94294b18587c453466bc86c1f0fc`, paired with
`leanprover/lean4:v4.34.0-rc2`. Actual source code was checked in this audit; the API list was not reconstructed from memory.
**Neither `#check` nor `lake build` was run with this version.** The locally installed v4.32.x
cannot establish that these newer interfaces compile. Implementation must begin by pinning the versions and running minimal smoke tests.

## 2. Dependencies from manuscript to implementation

```text
Nonnegative laws, real powers, Thorin representations, test functions
    ├─ Literature interfaces: Bondesson / James / SSV / Sethuraman
    ├─ Gamma–Beta logarithmic moments, exponential tilting, parameter differentiation
    └─ Explicit K kernel, reference jump measure, absolute integrability estimates
            ↓
    Palm-based log-rate generator and direct resolvent identity
            ↓
    DP parameter coupling + weak-star phase limits → joint generator continuity
            ↓
    Positive Euler kernels → second moments and time modulus → compactness → nonlinear weak equation
            ↓
    Extension to unbounded tests → Laplace evolution → uniqueness of log-value transport
            ↓
    Finite gamma convolutions for arbitrary q → weak approximation → all GGC laws
```

| Manuscript | Local implementation responsibility | New conclusions that must not be axiomatized |
|---|---|---|
| §2 Foundations (01-foundations.tex) | Laws, Thorin, DP, literature interfaces, and adaptation of measurable representatives | Jointly measurable phase selection and local parameter changes in literature formulas |
| §3 Power tangent (02-power-tangent.tex) | Tilted laws, q and s differentiation, Gamma logarithmic moments | The exact tangent in the power direction |
| §4 Log generator (03-log-generator.tex) | K kernel, Palm drift, compensation at all jump sizes, absolute integrals | Positive generator and direct resolvent cancellation identity |
| §5 Evolution (04-evolution.tex) | Common coupling, phase compactness, positive Euler scheme, weak limits | Joint continuity and existence of positive solutions on finite time intervals |
| §6 Identification (05-identification.tex) | Logarithmic moments, truncation, parameter integrals, density of tests, transport | The constructed curve is the actual power flow |
| §7 Completion (06-completion.tex) | q=1, T=log q, continuous mapping, weak closure | Final assembly preserving all quantifiers |

The first version should formalize only this dependency chain. There is no need to formalize all seven historical routes,
HCM theory, the Lévy–Khintchine formula, continuous-time jump SDEs, general McKean–Vlasov theory, or
Wasserstein duality at the same time. None is a necessary prerequisite for the current proof.

## 3. Suggested encoding of the core objects

### 3.1 Probability laws, positive rates, and real powers

Use `MeasureTheory.ProbabilityMeasure ℝ` with a nonnegativity field:
`∀ᵐ x ∂μ, 0 ≤ x`. This connects directly to mathlib's Gamma and Beta distributions,
tilted measures, and Bochner integrals on ℝ.

For `powerLaw μ q`, use `ProbabilityMeasure.map μ (fun x : ℝ => x ^ q)`.
It has been verified that `Real.continuous_rpow_const` gives continuity on all of ℝ for q ≥ 0;
no separate extension to the negative half-line is needed for this goal. However, semantic identities such as multiplication of powers
must still assume x ≥ 0; probabilistic conclusions cannot be inferred from Lean's totalized definition on negative inputs.
Prove nonnegativity of the pushforward and handle q=1 separately.

For rates, use `PosReal := {b : ℝ // 0 < b}`, or explicitly require the measure to be concentrated almost everywhere on
`Ioi 0`. **Do not require the topological support to lie in `(0,∞)`**: rates may accumulate at 0 even when there is no mass at 0.
`F : ProbabilityMeasure ℝ` is the log-rate law, with
`U = B • exp_*F` and B strictly positive; defining the jump generator does not require F to have a second moment.

In contrast, `log_*μ` is the log-value law, not F. Use distinct type aliases or namespaces for the two.
Since `Real.log` is not continuous on all of ℝ, the continuous mapping theorem for the whole space cannot be applied directly.
Lift a strictly positive μ to `PosReal` before mapping by log, or prove the corresponding continuity-set version.
The established uniform logarithmic moment control is also needed here to prevent loss of tightness near zero.

### 3.2 The GGC definition must not conceal the conclusion

Define `ThorinData` with drift a ≥ 0, a measure U of type `Measure PosReal`, classical Thorin
integrability, and the finite real integral for every s>0:

\[
\Psi(s)=as+\int\log(1+s/b)\,U(db).
\]

`IsGGC μ` means that such data exist and that the Laplace transform of μ equals exp(−Ψ).
U may have infinite total mass. One may store the classical piecewise integrability conditions first, then prove equivalence to
`Integrable (fun b => log (1 + 1/b)) U` and derive integrability for all s>0.
**Do not store only a Bochner integral identity without integrability**: Lean assigns a default value to the integral of a nonintegrable function,
which could make the definition incorrectly accept invalid Thorin data.

“Every valid set of Thorin data is realized by a probability law” is an external existence theorem, separate from the definition above.
Construct `finiteGammaLaw` as the pushforward of an actual finite product of Gamma measures under summation, not as an unexplained predicate.
The empty convolution may be defined as δ0; the main evolution first treats nonempty convolutions with positive shapes and B>0.

### 3.3 DP and phases

DP must have explicit semantics: the finite-partition distributions of the random probability measure are Dirichlet, allowing atomic bases
and partition cells of zero mass. This property can be defined via normalized finite-dimensional laws of independent Gamma variables,
and then realized by stick-breaking. Another valid approach is to define the stick-breaking law directly
and declare its DP finite-partition property as an external theorem of Sethuraman.

Do not assume that the space of probability measures automatically has every required standard Borel instance. M1 should verify the interface
between the evaluation σ-algebra and the Borel σ-algebra of the narrow topology, measurability of random measures, and measurability of parameter integrals.
The complete chain of existing instances has not been verified in this audit. Prefer an explicit common probability space with countably many independent uniform coordinates,
to reduce dependence on the full theory establishing that the space of random measures is Polish.

The external SSV input first supplies phase existence and a.e. uniqueness for each M. Locally, then fix the bounded truncation of
`limsup_n (−arg M(−t+i/(n+1)) / π)` as the representative, and prove joint Borel measurability,
a.e. equality with the external phase, and compatibility with scaling. The minus sign is **inside** the limsup.
Choosing a phase with `Classical.choose` alone does not establish joint measurability in P.

### 3.4 Test functions and weak solutions

`CompactTest2` bundles a function φ:ℝ→ℝ, `ContDiff ℝ 2 φ`, and `HasCompactSupport φ`.
Also define an extended test class with linear growth and bounded first and second derivatives. Standardize coercions for function values,
derivatives, and integrals early, so later proofs are not dominated by conversions between wrapper types.

`WeakLogRateSolution B₀ F₀ T` should explicitly record:

- T ≥ 0, B(t)=B₀ exp(−t), F(0)=F₀, and narrow continuity of F;
- a finite C such that, for all t∈[0,T], `Integrable (fun y => y^2) (F t)` and the second moment is ≤ C;
- time integrability and the integral identity of the weak equation for every `CompactTest2`.

These fields are outputs to be proved by the Euler construction. Existence of `WeakLogRateSolution` must not be an external axiom,
and a finite second moment must not be expressed solely as an upper bound on a real integral without `Integrable`.

## 4. Infrastructure to build locally

### A. Analysis and integral adaptations (moderate effort)

1. `LaplaceTilt`: bounded weights for s>0, strictly positive normalization, and an integral formula for tilted expectations;
   a common dominating function for q differentiation near q=1, and s differentiation. Estimate 0<x≤1 and x≥1 separately.
2. `GammaLogMoments`: adaptation of real digamma, Gamma log / x log x moments,
   the −log Z moment for Beta(1,B), and common bounds for B in compact positive intervals. Complex-valued infrastructure for differentiating the Gamma integral already exists;
   distribution-level moment formulas and uniformity in parameters still need assembly.
3. `CompensatedKernel`: the removable singularity of K at 1, L¹ bounds, the two pieces of its integral,
   truncated mass/first absolute moment of ν₀, and its finite second moment. Only m₂<∞ is needed here;
   formalizing the closed form of the Basel sum is unnecessary.
4. `TaylorBounds`: the O(v²) compensation remainder at all jump sizes and the second-order error of the truncated drift shift;
   prove norm integrability before every signed Fubini interchange.

### B. DP parameter continuity (high effort)

1. Construct a common uniform coupling using generalized inverse CDFs: if Fₙ⇒F, the location variables converge a.s. in each coordinate.
   No directly usable quantile / Skorohod convergence API was found in this audit;
   `Kernel.exists_measurable_map_eq_unitInterval` supplies only a randomization representation, not this convergence guarantee.
2. Take the Beta weights explicitly as V=1−T^(1/B). Prove continuity of the weights, vanishing tail remainder, and a common full-measure set for countably many coordinates.
3. Use P=(1−Z)Q+Zδ_b for the posterior; prove weak convergence when Bₙ, Fₙ, and yₙ vary simultaneously.
4. A bound on the y derivative of the kernel `e^y/(s e^y+e^z)` yields resolvent convergence under changing scales.
   Passing from convergence for fixed P to random posterior integrals requires a common Beta logarithmic bound.

Sethuraman permits only the distributional identity as external input; the coupling with moving parameters and the uniform integrability arguments above
remain local work. If a Skorohod theorem from a separate source is later adopted as an axiom, add an exact source and contract first;
do not present a generic randomization API as that result.

### C. Weak-star phase compactness (high effort; two implementation choices)

The manuscript uses weak-star compactness of the unit order interval in L∞. mathlib already has Banach–Alaoglu and metrizability of weak-star compact sets
with separable predual, but this audit did not verify a complete, directly reusable surjective representation interface for `(L¹)* ≃ L∞`.
The existence of `WeakDual` does not mean phase limits have been implemented.

First try an equivalent implementation, **currently only a proposed construction, not a verified API**:

\[
w=\frac{u}{1+u},\quad
\sigma_n(dw)=\eta_n\!\left(\frac{w}{1-w}\right)dw,\quad 0\le\sigma_n\le dw
\quad(0\le w\le1).
\]

Extract a weak limit of finite measures on the compact interval and prove that the limit is still dominated by Lebesgue measure.
Radon–Nikodym gives a density 0≤η≤1, with no atoms at the endpoints. For any f∈L¹(du), the transformed test is
`f(w/(1−w))/(1−w)^2`, which belongs to L¹(dw). First pass to the limit for continuous tests, then extend to this test class
using the common domination σₙ≤dw and L¹ density; finally identify the limit by phase uniqueness at anchor 1.
Weak closedness of domination, change of variables, and density adaptations must be proved locally.

This route reuses Prokhorov/Radon–Nikodym and may be shorter than developing the full Lp dual representation first.
Both implementations yield only weak-star convergence against L¹ kernels, **not pointwise convergence of boundary phases**.

### D. Positive Euler scheme and nonlinear weak limits (the largest block)

Fix finite T; set h=T/N and ε=√h. For sufficiently large N, explicitly define

\[
\Pi_h(y,dz)=p\delta_{y+h a_\varepsilon/p}(dz)
 +h\int_{|v|>\varepsilon}\delta_{y+v}(dz)k(y,v)\nu_0(dv),
\quad p=1-h\lambda_\varepsilon\ge\tfrac12.
\]

1. Prove this is a measurable Markov kernel, nonnegative and of mass exactly 1.
2. Recursively define `F_{j+1}=F_j Π_h(B_j,F_j)`. At each step, the kernel depends on the current deterministic marginal law;
   it is not a fixed linear semigroup depending only on y.
3. Compute EΔ=ha and EΔ² exactly; use discrete Gronwall to obtain uniform second moments.
4. Construct finite path measures to couple different times. Vanishing cross terms of centered increments can be proved by successive kernel integration,
   without first implementing general martingale L² theory. Obtain second-moment estimates for time increments.
5. **Linearly interpolate the probability laws**; do not interpolate sample paths and assume the marginals agree.
   Extract a limiting curve using Prokhorov and equicontinuity in time.
6. Reuse the Lévy–Prokhorov metrization of the narrow topology: prove from a coupling and Markov tail bounds that
   `d_LP(μ,ν) ≤ (E|Y−Z|²)^(1/3)` (handling zero separately), which suffices for the time modulus.
   This bridging inequality still needs a local proof; the library's topological equivalence is not a quantitative coupling bound.
7. Prove the cumulative consistency error tends to zero at order `√h+h(log h)^2`; then pass through the nonlinear limit
   using joint continuity of Hφ(B,F). Continuity with F frozen is insufficient.

The library's Arzelà–Ascoli theorem cannot be applied directly to a discrete grid. Continuous interpolation, a common compact range, and
equicontinuity must be established first. If estimates give only asymptotic equicontinuity, handle the finitely many early grids separately,
or use diagonal extraction at rational times followed by extension. The final weak equation must hold for all tests simultaneously,
not along a different subsequence for each φ.

### E. Dynamic identification (high effort)

1. Derive valid Uₜ and uniform `E|log X|` for μₜ from the uniform second moment of F; finite EX is unnecessary.
2. Extend the test domain by truncation, proving that errors from the first and second cutoff derivatives and the tail terms vanish.
3. Use the direct resolvent identity and B′=−B to obtain gₜ′=hₜ. Do not omit the mass-decay term.
4. Integrate the identity for δ≤s and let δ↓0; control absolute integration in s×t using a strictly positive Laplace lower bound and `E|log X|`.
   Do not strengthen the assumptions to `E|X log X|<∞` without justification.
5. Approximate J′ by Bernstein polynomials and integrate to obtain C¹ polynomial approximation. After converting back to Hₙ(x)=pₙ(e^(−x)),
   control both the function norm and the generator norm of `x log x H′`. C⁰ density alone is insufficient.
6. For the linear transport weak equation in log-value coordinates, formalize the time-partition proof with backward tests
   ζᵤ(z)=ζ(e^(t−u)z). Static Laplace uniqueness cannot replace this step.
7. Prove that smooth compactly supported tests determine finite measures on the real line, then identify μₜ=law(X₀^(e^t)).

### F. Assembly with all quantifiers (smaller but crucial)

First prove the result for every nonempty finite Gamma convolution and every q>1, taking only T=log q.
Then use Bondesson's zero-drift finite-atomic approximation, continuous mapping by real powers, and weak closure of GGC.
Second-moment constants and Euler grid thresholds may differ between initial approximating laws; uniformity across the approximation family is unnecessary.
Drift, infinite Thorin mass, and δ0 enter through the final closure step; include separate endpoint tests to prevent their accidental exclusion.

## 5. Proposed directory layout and implementation order

The following is a plan; these Lean files have not yet been created:

```text
formalization/
  README.md                 # This blueprint
  mathlib-api-audit.md       # Source evidence for the pinned version
  axiom-boundary.md          # Literature contracts and final trust whitelist
  [to be added during implementation]
  lean-toolchain
  lakefile.toml
  lake-manifest.json
  GGC/
    Basic/{Law,Power,Thorin,Tests}.lean
    External/{Bondesson,James,SSV,Sethuraman}.lean
    Probability/{GammaLogMoments,Dirichlet,QuantileCoupling}.lean
    Analysis/{Tilt,Tangent,Kernel,PhaseCompactness}.lean
    LogRate/{Generator,Resolvent,Continuity}.lean
    Evolution/{EulerKernel,Moments,Compactness,WeakLimit}.lean
    Identification/{LogMoments,Cutoff,Laplace,Transport}.lean
    Main.lean
  Tests/{API,Endpoints,AxiomAudit}.lean
```

| Milestone | Input → acceptance output | Risk |
|---|---|---|
| M0 Versions and smoke tests | Pin commit/toolchain; compile minimal ProbabilityMeasure, Tilted, Kernel, and Prokhorov interfaces | Low; version drift is manageable |
| M1 Definitions and external contracts | Semantically explicit IsGGC/DP/Test/WeakSolution; individual source correspondence for external axioms | High; incorrect definitions contaminate the entire proof |
| M2 Explicit analytic kernel | Cancellation and absolute integrals for K, second moment of ν₀, and Taylor bounds, all without sorry | Moderate |
| M3 Exact tangent and generator | Gamma logarithmic moments, Palm, direct resolvent identity; signatures with no missing terms | Moderate to high |
| M4 Parameter continuity | Quantile coupling, phase compactness, joint continuity of Hφ | High; first major technical gate |
| M5 Positive Euler scheme | Markov kernel, inductive mass preservation, M₂, and time modulus | High |
| M6 Nonlinear existence | WeakLogRateSolution for every finite T, without assuming its existence | High; largest integration gate |
| M7 Identification of the actual power flow | Truncation, zero endpoint, C¹ approximation, dynamic transport uniqueness | High |
| M8 Main theorem and audit | Arbitrary GGC and real q≥1; endpoint checks; `#print axioms` whitelist | Moderate; quantifier and trust checks are crucial |

Recommended order: M0 → M1 → M2 → M3 → M4 → M5 → M6 → M7 → M8.
After M1, one may first write a closure assembly theorem stating “if the finite Gamma case holds, then it holds for all GGC laws”
to check the public signature early. This is only conditional assembly and does not complete M8.

Prototype these three interfaces first:

- the measurable structure of `ProbabilityMeasure` and parameter integrals over DP samples;
- weak limits of phase measures dominated by Lebesgue measure;
- mass and the first two increment identities of the positive Euler kernel.

These best test the design choices. Writing §7 as ten lines of assembly code does not reflect the difficulty of the main implementation.
Only risk levels are given here; no completion probabilities, precise schedules, or verified Lean line counts are invented.

## 6. Completion criteria

Each local module should link to a TeX label / WIP ID; each external declaration should link to exact literature page numbers.
The final requirements are:

1. A full `lake build` passes with the pinned toolchain, and the public main theorem can be imported independently.
2. `#print axioms` contains no `sorryAx`, only foundational logical axioms and explicitly registered external mathematical axioms.
3. The whitelist contains no synonymous reformulation of the existence, continuity, identification, or target result that this project must prove.
4. The complete IsGGC definition and all Integrable, positivity, and measurability conditions are reviewed together with the code.
5. Check q=1, δ0, arbitrary fixed q>1, and the final signature allowing drift and infinite Thorin mass.
6. Report the statuses of “literature source audit,” “manuscript mathematical audit,” and “Lean verification relative to axioms” separately;
   none substitutes for another.

This delivery stops at the engineering blueprint and source-level API checks; planned modules are not reported as implemented.
