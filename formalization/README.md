# Lean Formalization Roadmap: Non-Self-Decomposability of the α-Cauchy Distribution

> **Status:** reviewed engineering blueprint; no Lake project or Lean implementation exists yet.
>
> **Primary manuscript:** [`version-1/SD2.tex`](../version-1/SD2.tex).
>
> **Supporting derivation:** [`notes/07-Jensen-obstruction-and-non-SD.md`](../notes/07-Jensen-obstruction-and-non-SD.md).
>
> **Provisional API baseline:** Lean `4.32.2` with mathlib commit `905b95818eb32af7874a58b427f50c1711a5e96c`. Milestone M0 must pin this pair in a Lake project and compile smoke checks before the API names are treated as verified.

This roadmap has been reviewed for mathematical consistency, dependency order, and Lean feasibility. The central analytic argument is coherent, but it is new work in this repository and has not been externally peer reviewed. The final theorem must therefore be obtained from checked Lean proofs, not from this document or the manuscript being treated as an authority.

The words “Lean standard library” and “mathlib” are kept distinct below. `Init` and `Std` ship with Lean. Probability measures, integration, characteristic functions, Gamma and Beta functions, Fourier analysis, and complex analysis come from mathlib.

## 1. Objective, deliverables, and non-goals

For α greater than one, the α-Cauchy law is the probability distribution on the real line with density

`fα(x) = α sin(π/α) / [2π (1 + |x|^α)].`

The main goal is a Lean theorem saying:

`If 1 < α < 2, then the α-Cauchy distribution is not self-decomposable.`

A probability measure is self-decomposable when, for every scale `c` strictly between zero and one, it factors as the convolution of its dilation by `c` with another probability measure.

The first implementation should establish the result for a general parameter `1 < α < 2`. The value `α = 3/2` is useful as a regression test and debugging instance, but should not be developed as a separate duplicate proof.

The project has three deliverables:

1. A self-contained analytic obstruction showing that an explicit function `Jα` is integrable and has a negative total integral, so it cannot be a characteristic function.
2. An identification theorem connecting the actual α-Cauchy characteristic function to the Laplace representation used by the analytic argument.
3. A probability-theory bridge showing that self-decomposability would force `Jα` to be a characteristic function.

The first deliverable must not depend on the definition of self-decomposability. This separation allows the new analytic work to be completed without waiting for the much larger Lévy–Khintchine and background-driving infrastructure.

Here SD means self-decomposable, ID means infinitely divisible, BDLP means background driving Lévy process, and LK means the Lévy–Khintchine representation.

The first release does not include:

- the SD status of `|Cα|` or `|Cα|⁻ᵖ`;
- a general theory of hyperbolically completely monotone densities, generalized Gamma convolutions, Thorin measures, or beta-prime distributions;
- general Lévy path spaces or stochastic integration;
- Wang’s full non-ID result for `α > 2`;
- the application to stable-process first hitting times.

Those topics may be added only after the theorem for `1 < α < 2` is complete.

## 2. Mathematical setup and conventions

### 2.1 Kernel and Laplace quantities

Fix `1 < α < 2` and set `p = 1 + α`. All kernel statements below use `y > 0`.

| Name | Definition and role |
|---|---|
| `cα` | `cos(πα/2)`. It is negative in the target parameter range. |
| `Dα(y)` | `y^(2α) + 2 cα y^α + 1`, the denominator of the Laplace kernel. |
| `Hα(y)` | `1 / Dα(y)`. |
| `Aα(t)` | For `t ≥ 0`, the unnormalized integral `∫₀∞ exp(-ty) y^α Hα(y) dy`. Differentiability is asserted only for `t > 0`. |
| `Fα(t)` | `t^p Aα(t) / Γ(p)`. If `G` has Gamma shape `p` and rate `1`, then `Fα(t) = E[Hα(G/t)]`. |
| `qα(t)` | For `t > 0`, `-t Aα′(t) / Aα(t)`. |
| `Jα(t)` | For `t > 0`, `1 - qα(t)/p`. |
| `kα` | `1 / Aα(0)`, once finiteness and positivity of `Aα(0)` have been proved. |
| `φα(t)` | The actual characteristic function, to be identified with `kα Aα(|t|)`. |
| `Ψα(t)` | `-log φα(t)` wherever the characteristic function has been proved positive. |

The analytic core should use `Aα` rather than `φα`. The factor `kα` cancels from `qα`, `Jα`, and `Fα`, so normalization and distribution identification can remain in a separate module.

The denominator is strictly positive because it can be rewritten as

`Dα(y) = (y^α + cα)² + sin²(πα/2).`

This identity is preferable to a fragile sequence of inequalities.

### 2.2 One-sided definitions and even extensions

The manuscript informally writes `qα(t) = t Ψα′(t)` on the whole real line. That is not an acceptable Lean definition: for `1 < α < 2`, the characteristic exponent is generally not differentiable at zero.

The implementation should instead:

- define `qα(t)` from the positive-half-line Laplace ratio when `t > 0`;
- set `qα(0) = 0`;
- define negative arguments by even reflection;
- prove continuity at zero and evenness;
- prove the log-derivative identity only away from zero.

Define `Jα` by the same even-extension pattern. This removes any hidden use of `deriv Ψα 0`.

## 3. Proof architecture

### 3.1 Kernel and Laplace regularity

First prove positivity, continuity, measurability, and endpoint bounds for `Dα` and `Hα`. The required weighted functions must be absolutely integrable on the relevant domains.

For `t > 0`, prove that `Aα(t)` is positive and differentiable, and justify differentiating under the integral sign. The Gamma change of variables then gives `Fα(t) = E[Hα(G/t)]`.

All expectations in Lean should preferably be written directly as integrals against `gammaMeasure p 1`. This avoids introducing an unspecified probability space and random variable.

### 3.2 Endpoint estimates

The proof needs the following limits and bounds:

- `qα(t) → 0` as `t ↓ 0`;
- `qα(t) → p` as `t → ∞`;
- `Jα(t) = O(t⁻ᵅ)` as `t → ∞`;
- `|log Fα(t)| ≤ C(1 + |log t|)` near zero;
- `|log Fα(t)| ≤ C t⁻ᵅ` near infinity;
- `t log Fα(t) → 0` at both endpoints.

The last three items must be stated explicitly. The limits of `qα` and a tail bound for `Jα` do not, by themselves, prove the integrability of `log Fα` or justify integration by parts.

Continuity handles the compact middle interval. Combined with the endpoint estimates, it gives boundedness of `qα`, absolute integrability of the even extension of `Jα`, and absolute integrability of `log Fα` on the positive half-line.

The formal proof should use direct estimates rather than importing Watson’s lemma or the Hardy–Littlewood Tauberian theorem as new black boxes. Exact asymptotic coefficients are unnecessary when a big-O bound is enough.

A promising direct route is:

- near zero, bound the derivative numerator by `O(t^(α-2))`, which gives `qα(t) = O(t^(α-1))`;
- near infinity, prove `|Hα(y) - 1| ≤ C y^α` and `|y Hα′(y)| ≤ C y^α` near zero;
- combine those inequalities with finite Gamma moments to show that `Fα(t) - 1`, `t Fα′(t)`, `log Fα(t)`, and `Jα(t)` are all `O(t⁻ᵅ)`.

This route avoids differentiating a previously stated asymptotic expansion.

### 3.3 Exact logarithmic cancellation

Define

`Kα = ∫₀∞ log Dα(y) / y² dy.`

The target is `Kα = 0`, together with the stronger prerequisite that the same integral with `|log Dα(y)|` is finite.

After real integration by parts and the substitution `u = y^α`, the proof becomes the rational integral

`Kα = ∫₀∞ [(2u + 2cα) / (u² + 2cαu + 1)] u^(-1/α) du.`

Write `θ = πα/2`. The rational factor is the sum

`exp(iθ)/(1 + exp(iθ)u) + exp(-iθ)/(1 + exp(-iθ)u).`

The complex beta-ray theorem evaluates the two terms with phases `i` and `-i`, so they cancel. This real-first route avoids splitting a principal complex logarithm. If a fallback proof factors `log Dα` into complex logarithms instead, it must separately prove the principal-log addition identity.

### 3.4 Strict logarithmic Jensen step

For each `t > 0`, strict concavity of the logarithm gives

`log Fα(t) > E[log Hα(G/t)].`

Strictness is not automatic from the phrase “`Hα` is nonconstant.” The formal proof must show that:

- the Gamma measure has full support on the positive half-line;
- `Hα` is continuous and nonconstant;
- therefore `Hα(G/t)` is not almost everywhere constant;
- both sides are measurable and integrable.

The Gamma scaling identity gives

`∫₀∞ E[log Hα(G/t)] dt = E[G] ∫₀∞ log Hα(y)/y² dy = -p Kα = 0.`

Absolute integrability must be proved before using Fubini. Pointwise strict inequality then yields a strictly positive integral only after the Jensen gap is shown measurable, integrable, and positive on a set of positive measure.

### 3.5 Negative integral of `Jα`

A direct differentiation gives

`Jα(t) = (t/p) (log Fα(t))′.`

Apply integration by parts first on a finite interval `[ε, R]`. The endpoint estimates make both boundary terms vanish when `ε ↓ 0` and `R → ∞`. The result is

`∫₀∞ Jα(t) dt = -(1/p) ∫₀∞ log Fα(t) dt < 0.`

Since `Jα` is even, its integral over the whole real line is also negative.

This is the central analytic theorem. It should compile without importing any SD, ID, BDLP, or LK module.

### 3.6 Characteristic-function obstruction

For every probability measure on the real line whose characteristic function `χ` is integrable,

`Re(∫ χ(t) dt) ≥ 0.`

The preferred proof uses Gaussian regularization. Multiply `χ(t)` by `exp(-εt²)`, expand the characteristic function, and use Fubini plus the Fourier transform of a Gaussian. The regularized integral is nonnegative. Dominated convergence then removes the Gaussian as `ε ↓ 0`.

Applying this result to the real, even, integrable function `Jα` contradicts its negative total integral. Therefore `Jα` is not a characteristic function.

### 3.7 The two external bridges

The analytic obstruction does not yet mention the α-Cauchy distribution or self-decomposability. Two independent theorems complete the connection.

The identification bridge must prove that the normalized α-Cauchy density is a probability density and that its characteristic function equals `kα Aα(|t|)`. This is the Fourier–Laplace formula corresponding to Wang, Lemma 2.7.

The SD bridge must prove the following specialized statement:

- start with a symmetric self-decomposable probability measure;
- use symmetry, continuity, the value one at zero, and absence of real zeros to prove that its characteristic function is positive before taking a real logarithm;
- identify `q(t) = t Ψ′(t)` away from zero as the exponent of its background-driving law;
- transfer symmetry to the background-driving exponent and its Lévy measure;
- assume `q` is bounded and has a finite positive limit `L` at infinity;
- use the symmetric LK representation to eliminate the Gaussian part and obtain a finite symmetric Lévy measure `ν` with `ν(ℝ) ≤ L`;
- define `ρ = (1 - ν(ℝ)/L) δ₀ + ν/L`;
- prove that `ρ` is a symmetric probability measure with characteristic function `1 - q/L`.

The atom at zero repairs a normalization gap in the manuscript. Fatou’s lemma gives only `ν(ℝ) ≤ L`, not equality. Equality can also be recovered later by dominated convergence once finiteness is known, but it is not needed.

For the α-Cauchy application, the endpoint theorem supplies `L = 1 + α > 0`. If the α-Cauchy law were SD, the bridge would make `Jα` a characteristic function, contradicting the analytic obstruction.

### 3.8 Dependency graph

An arrow means that the source must be available before the target.

~~~text
Parameters ──> Kernel ──> LaplaceCore ──> LaplaceBounds ──────────────┐
                    └──> LogCancellation <── ComplexBetaRay            │
GammaMoments ──> GammaScaling ────────────────────────────────────────┤
GammaSupport ─────────────────────────────────────────────────────────┤
StrictLogJensen ──────────────────────────────────────────────────────┤
                                                                       v
                                                              NegativeIntegralJ
                                                                       │
IntegrableCharFun ─────────────────────────────────────────────────────┤
                                                                       v
                                                                 JNotCharFun
                                                                       │
AlphaCauchyIdentification ─────────────────────────────────────────────┤
SymmetricLK ──> SelfDecomposableBridge ────────────────────────────────┤
                                                                       v
                                                            Main non-SD theorem
~~~

Generic Gamma and Jensen modules do not depend on the Laplace representation. `LogCancellation` depends on both the kernel facts and the complex beta-ray result.

## 4. Review findings and mandatory repairs

The following points are part of the implementation contract, not optional refinements.

1. **Pin the environment.** A prose audit baseline is not reproducible. M0 must record the exact `lean-toolchain` value and mathlib Git commit in the Lake project, then compile a small API-audit file.
2. **Keep every binder explicit.** Use `set_option autoImplicit false` in project files. The earlier interface sketches silently relied on undeclared variables such as `α`, `μ`, and `X`.
3. **Restrict real powers to the intended domain.** Kernel lemmas must state `y > 0` or use a type that carries positivity. Do not silently extend real-power identities to negative `y`.
4. **Define the normalization constant.** Prove `Aα(0)` finite and positive before defining `kα = 1/Aα(0)`. Keep `kα` out of the analytic core whenever possible.
5. **Do not differentiate at zero.** Define `qα` piecewise and prove its continuous even extension.
6. **Strengthen the endpoint package.** Include explicit bounds for `log Fα` and both limits of `t log Fα(t)`.
7. **Correct the large-frequency coefficient in the manuscript.** The first correction term for `log Fα(t)` contains the factor `-2 cos(πα/2)`. The manuscript omits the factor `2`. Prefer the weaker and sufficient statement `O(t⁻ᵅ)` in Lean.
8. **Prove absolute Fubini hypotheses first.** The function `log Dα` changes sign. Establish the integral of `|log Dα(y)|/y²` before exchanging integrals.
9. **Make strict Jensen genuinely strict.** Full support and almost-everywhere nonconstancy must be formal lemmas, followed by a strict integral argument.
10. **Control the complex contour.** Prove denominator nonvanishing, contour admissibility, orientations, and all improper-limit estimates. Handle the negative phase by complex conjugation. A principal-log addition lemma is required only if the fallback complex-log proof is used.
11. **Use finite-interval integration by parts.** Work on `[ε, R]` and pass to the two limits separately.
12. **Repair the SD normalization.** Assume `0 < L` and use the added atom at zero described above.
13. **Prove, rather than postulate, both external bridges.** Literature references document provenance; they do not replace Lean proofs or justify project-defined axioms.
14. **Keep project namespaces local.** Put analysis and probability helpers below `AlphaCauchy/` rather than creating collision-prone top-level `Analysis/` and `Probability/` directories.
15. **Use `α = 3/2` as a test, not a fork.** General parameter lemmas should exist from the beginning.
16. **Correct the milestone order.** The negative-integral theorem depends on the Laplace bounds. Generic Gamma and Jensen infrastructure may be built early, but the sign theorem cannot precede those bounds.
17. **Do not cite missing repository files.** The earlier roadmap linked to a nonexistent `version-1/remarks/levy-measure-normalization.tex`. The normalization repair is now stated directly in this document.

## 5. Lean architecture

### 5.1 Proposed modules

| Module | Responsibility | Expected effort |
|---|---|---:|
| `AlphaCauchy/Parameters` | Parameter object for `1 < α < 2`; signs of trigonometric terms; real-power identities | Low |
| `AlphaCauchy/Kernel` | `Dα` and `Hα`; positivity, continuity, measurability, endpoint bounds, and weighted integrability | Medium |
| `AlphaCauchy/LaplaceCore` | `Aα`, `Fα`, differentiation under the integral, and Gamma representation | Medium |
| `AlphaCauchy/LaplaceBounds` | Limits and quantitative bounds for `qα`, `Jα`, `Fα`, and `log Fα` | High |
| `AlphaCauchy/LogCancellation` | Absolute integrability, finite-interval integration by parts, power substitution, and `Kα = 0` | Medium |
| `AlphaCauchy/AnalyticObstruction` | Assembly of `Jα ∈ L¹`, its negative integral, and failure to be a characteristic function | Low after dependencies |
| `AlphaCauchy/Distribution` | The α-Cauchy density, normalization, symmetry, and probability measure | Medium |
| `AlphaCauchy/CharacteristicFunction` | Identification of the actual characteristic function with the Laplace integral | Very high |
| `AlphaCauchy/Analysis/ComplexBetaRay` | Complex beta-ray identity and all branch and contour estimates | High |
| `AlphaCauchy/Analysis/StrictLogJensen` | Reusable strict logarithmic Jensen theorem | Medium |
| `AlphaCauchy/Probability/GammaMoments` | Moments of `gammaMeasure shape rate`, especially the first moment | Low |
| `AlphaCauchy/Probability/GammaSupport` | Positivity, full support, interval positivity, and nondegeneracy | Low |
| `AlphaCauchy/Probability/GammaScaling` | Scaling identity and its absolute-integrability version | Medium |
| `AlphaCauchy/Probability/IntegrableCharFun` | Gaussian regularization and nonnegativity of the real total integral | Medium |
| `AlphaCauchy/Probability/InfiniteDivisibility/SymmetricLK` | Minimal symmetric LK representation needed by this project | Very high |
| `AlphaCauchy/Probability/SelfDecomposable/Basic` | Dilation-and-convolution definition and characteristic-function formulation | Medium |
| `AlphaCauchy/Probability/SelfDecomposable/BackgroundDriving` | Specialized SD-to-background-exponent bridge and finite Lévy-measure reduction | Very high |
| `AlphaCauchy/Main` | Composition of closed theorems only | Low |

The project should implement only the exponent-level Lévy theory required by the final bridge. General path-space and stochastic-integral infrastructure remains out of scope.

### 5.2 Proposed directory tree

~~~text
formalization/
├── README.md
├── lean-toolchain
├── lakefile.toml
├── AlphaCauchy.lean
└── AlphaCauchy/
    ├── Parameters.lean
    ├── Kernel.lean
    ├── LaplaceCore.lean
    ├── LaplaceBounds.lean
    ├── LogCancellation.lean
    ├── AnalyticObstruction.lean
    ├── Distribution.lean
    ├── CharacteristicFunction.lean
    ├── Main.lean
    ├── Analysis/
    │   ├── ComplexBetaRay.lean
    │   └── StrictLogJensen.lean
    ├── Probability/
    │   ├── GammaMoments.lean
    │   ├── GammaSupport.lean
    │   ├── GammaScaling.lean
    │   ├── IntegrableCharFun.lean
    │   ├── InfiniteDivisibility/
    │   │   └── SymmetricLK.lean
    │   └── SelfDecomposable/
    │       ├── Basic.lean
    │       └── BackgroundDriving.lean
    └── Scratch/
~~~

`AlphaCauchy.lean` is the public import. `AlphaCauchy/Main.lean` contains no long analytic proof. The analytic modules must not import the self-decomposability modules.

Exploratory files may live in `Scratch/`, but nothing there may be imported by the public entry point.

### 5.3 Declaration-level contracts

Exact Lean signatures should be chosen only after M0 compiles, but the public theorem responsibilities are already fixed.

| Proposed declaration | Contract |
|---|---|
| `AlphaCauchy.denom_pos` | `Dα(y) > 0` for an admissible α and positive `y`. |
| `AlphaCauchy.logDenom_integrable` | Absolute integrability of `log Dα(y)/y²` on the positive half-line. |
| `AlphaCauchy.logDenom_integral_eq_zero` | The exact cancellation `Kα = 0`. |
| `AlphaCauchy.laplace_deriv` | Differentiation of `Aα` for `t > 0` with all domination hypotheses discharged. |
| `AlphaCauchy.j_integrable` | Absolute integrability of the even extension of `Jα`. |
| `AlphaCauchy.integral_j_neg` | The total integral of `Jα` is negative. |
| `AlphaCauchy.strictLogJensen` | Strict logarithmic Jensen inequality for an explicit measure and measurable function. |
| `AlphaCauchy.integral_re_charFun_nonneg` | The real part of the total integral of an integrable characteristic function is nonnegative. |
| `AlphaCauchy.j_not_charFun` | No probability measure has characteristic function `Jα`. |
| `AlphaCauchy.charFun_eq_laplace` | The actual α-Cauchy characteristic function equals the normalized Laplace integral. |
| `AlphaCauchy.selfDecomposable_implies_j_charFun` | The specialized SD/BDLP/LK bridge with `0 < L` and atom correction. |
| `AlphaCauchy.not_selfDecomposable` | Final theorem for every `1 < α < 2`. |

Define `IsSelfDecomposable μ` directly through dilation and convolution: for every `c` in `(0,1)`, there is a probability measure `ρ` such that `μ = dilation(c, μ) * ρ`.

Use a separate intermediate predicate, such as `HasSymmetricBackgroundExponent μ q`, to isolate the expensive probability theory. This allows the finite-measure-to-characteristic-function theorem to be completed before the full SD-to-BDLP direction.

## 6. Implementation notes for the delicate arguments

### 6.1 Complex beta-ray identity

Let `0 < s < 1` and `0 ≤ θ < π`. Apply rectangular Cauchy–Goursat to

`g(w) = exp(sw) / (1 + exp(w)).`

The proof must:

- show that the rectangle avoids every pole;
- bound one vertical side by a multiple of `exp(sx)` as `x → -∞`;
- bound the other by a multiple of `exp(-(1-s)x)` as `x → ∞`;
- control the horizontal sides and their orientations;
- pass to the improper limits;
- derive the negative-θ case by complex conjugation;
- connect the resulting ray integral to the real logarithmic cancellation.

The intended ray formula is

`exp(iθ) ∫₀∞ u^(s-1)/(1 + exp(iθ)u) du = exp(i(1-s)θ) π/sin(πs).`

For this project, use `s = 1 - 1/α` and `θ = πα/2`. The right-hand phase becomes `i`; conjugation supplies `-i`, and the sum vanishes.

A slit-plane analytic-continuation proof is a fallback, not the default. It normally requires heavier locally uniform estimates.

### 6.2 Gaussian regularization

For `ε > 0`, define the regularized integral

`Iε = ∫ℝ χ(t) exp(-εt²) dt.`

Expanding the characteristic function and evaluating the Gaussian Fourier integral gives a nonnegative real expression proportional to

`∫ℝ exp(-x²/(4ε)) μ(dx).`

Before swapping integrals, prove absolute integrability from `|χ(t)| ≤ 1` and Gaussian integrability. If `χ` itself is integrable, use `|χ|` as the dominating function to let `ε ↓ 0`.

The theorem conclusion must use the real part because complex numbers are not ordered. For a symmetric probability measure, a companion lemma may show directly that the integral is real.

### 6.3 Strict logarithmic Jensen inequality

A reusable theorem should make the underlying measurable space, measure, and function explicit. Its assumptions should include:

- a probability measure;
- a measurable, almost-everywhere positive real-valued function `X`;
- integrability of `X`;
- integrability of `log X`;
- proof that `X` is not almost everywhere constant.

Let `m = ∫X` and apply `log u ≤ u - 1` to `u = X/m`. The equality case of the strict version forces `X = m` almost everywhere, contradicting nonconstancy.

For the application, instantiate `X(y) = Hα(y/t)` directly under `gammaMeasure p 1`. Prove nonconstancy using two positive intervals on which continuity gives separated values and Gamma full support gives positive measure.

## 7. Milestones and acceptance criteria

### M0 — Reproducible project and API smoke test

- Create `lean-toolchain` and `lakefile.toml`.
- Pin an exact mathlib commit, not merely a Lean version.
- Add a small compile-only API audit covering every imported theorem named in Appendix A.
- Enable CI with `lake build`.
- Enable `set_option autoImplicit false` in project modules.

M0 is not accepted merely because empty files import. The API smoke file must contain at least one checked declaration or `#check` for every capability on which the blueprint relies.

### M1 — General parameters and kernel

- Define the admissible parameter object once.
- Prove positivity and basic real-power identities for general `1 < α < 2`.
- Prove the kernel’s local and endpoint comparison bounds.
- Establish absolute integrability of the logarithmic kernel.
- Add `α = 3/2` as a regression example.

No numerical integration or floating-point approximation may be used as proof.

### M2 — Laplace core and endpoint bounds

- Define `Aα`, `Fα`, `qα`, and `Jα` with correct domains.
- Close all measurability and domination obligations for differentiation under the integral.
- Prove the Gamma representation of `Fα`.
- Prove the `qα` limits, the `Jα` tail bound, both `log Fα` bounds, and both boundary limits.
- Prove continuity, global boundedness, and absolute integrability by splitting the domain into two tails and a compact interval.

Do not use unformalized Watson or Hardy–Littlewood results.

### M3 — Independent analytic infrastructure

This milestone can proceed in parallel with M2.

- Compile the complex beta-ray theorem with all contour and branch obligations.
- Compile reusable Gamma moment, support, and scaling theorems.
- Compile the strict logarithmic Jensen theorem and its Gamma specialization.
- Compile the Gaussian characteristic-function obstruction.

Each component must have a small direct test theorem.

### M4 — Analytic obstruction at the regression parameter

- Derive `K₍₃⁄₂₎ = 0`.
- Prove the strict integrated Jensen inequality.
- Complete finite-interval integration by parts and both endpoint limits.
- Prove `J₍₃⁄₂₎` integrable with negative total integral.
- Prove that `J₍₃⁄₂₎` is not a characteristic function.

No dependency reachable from this theorem may contain `sorry`, `admit`, or a project-defined axiom.

### M5 — General analytic obstruction

- Remove every assumption specific to `3/2`.
- Prove the analytic obstruction for every fixed `1 < α < 2`.
- Do not require estimates uniform as `α → 1` or `α → 2`.

### M6 — Actual α-Cauchy identification

- Prove normalization and symmetry of the density.
- Define the associated probability measure.
- Prove `charFun_eq_laplace` with a docstring mapping it to Wang, Lemma 2.7.
- Record every Fourier normalization and sign convention explicitly.

### M7 — SD, symmetric LK, and background-driving bridge

- Compile the dilation-and-convolution definition and its characteristic-function form.
- Prove the minimal symmetric LK theorem required by the bridge.
- Prove the SD-to-background-exponent theorem without project-defined axioms.
- Derive finiteness of the Lévy measure from boundedness.
- Apply the atom correction and the hypothesis `0 < L`.
- Conclude that `1 - q/L` is a symmetric characteristic function.

### M8 — Main theorem

- Assemble `AlphaCauchy.not_selfDecomposable` for every `1 < α < 2`.
- Keep `AlphaCauchy/Main.lean` as composition only.
- Run `lake build`.
- Run an axiom audit such as `#print axioms AlphaCauchy.not_selfDecomposable` and inspect the result.
- Confirm that no `Scratch` file is reachable from the public import.

### M9 — Endpoints and applications

This milestone does not block the first release.

- For `α = 2`, formalize the standard Cauchy characteristic function, stability under scaling, and self-decomposability.
- For `α > 2`, formalize the application of Wang’s non-ID theorem after the necessary foundations already exist.
- Identify the stable-process first-hitting-time distribution and derive its non-SD consequence.

## 8. Risk register and execution order

| Risk | Work item | Why it is difficult | Early evidence required |
|---|---|---|---|
| Critical | SD-to-BDLP and symmetric LK bridge | Mathlib appears not to contain the required theory at the audited baseline | A narrow theorem statement and a compiling exponent-level prototype after M0 |
| Critical | α-Cauchy Fourier–Laplace identification | Requires nontrivial Fourier or complex analysis and careful normalization | A compile-checked proof for one generic intermediate transform |
| High | Complex beta-ray identity | Requires contour limits, pole avoidance, orientation, and branch control | A standalone theorem for positive θ plus conjugation |
| Medium | Laplace endpoint bounds | Many domination and comparison obligations | Separate small- and large-parameter lemmas |
| Medium | Gaussian characteristic-function obstruction | Complex-valued Fubini and Fourier normalization are delicate | A theorem for an arbitrary integrable characteristic function |
| Medium | Strict Jensen nondegeneracy | Requires full support and almost-everywhere equality analysis | A reusable Gamma specialization |
| Low | Kernel algebra and positivity | Mostly real powers, trigonometry, and comparison bounds | General proof plus `3/2` test |
| Low | Gamma moments and scaling | Mechanically derivable from Gamma density integrals | First-moment and absolute-scaling tests |

Recommended execution order:

`M0 → M1 → (M2 and M3 in parallel) → M4 → M5 → (M6 and M7) → M8 → M9.`

The three highest-risk items should receive narrow prototypes immediately after M0, even while the analytic core remains the first full deliverable. This prevents a late discovery that the final bridges require a redesign.

## 9. Coding, proof, and citation policy

- Publicly reachable code may not contain `sorry`, `admit`, project-defined `axiom` declarations, or unproved facts hidden inside typeclass or structure fields.
- Every project file should use explicit parameters and disable automatic implicit-variable creation.
- Exploratory placeholders belong only in `AlphaCauchy/Scratch/`, with an issue number, and must not be imported by `AlphaCauchy.lean`.
- Every core declaration should identify its provenance in the docstring: `[mathlib]`, `[literature]`, `[new derivation]`, or `[gap repair]`.
- An external result must record its authors, title, year, theorem or proposition number, and repository path. “Well known” is not a citation.
- Numerical experiments may suggest conjectures or debug estimates, but may not occur in theorem dependencies.
- Imports should be narrow. Reusable lemmas belong in focused modules; `Main` only assembles them.
- Real-power, Fourier, and Gamma conventions must be documented. In particular, always distinguish Gamma rate from Gamma scale.
- Mathlib’s characteristic function uses `exp(itx)`, while its Fourier API uses a `-2πi` convention. Every conversion must state the sign and scale explicitly.
- Each milestone is accepted by compiled theorems and an axiom audit, not by the existence of files or theorem statements.
- The final theorem should have one stable public name: `AlphaCauchy.not_selfDecomposable`.

## Appendix A. Provisional mathlib API map

The earlier audit used the provisional Lean and mathlib baseline stated at the top of this file, but no Lake project currently pins or compiles that environment. Until M0 does so and compiles an API-audit file, treat these names as navigation hints rather than a verified interface contract.

### A.1 Characteristic functions and probability measures

Import `Mathlib.MeasureTheory.Measure.CharacteristicFunction.Basic` for:

- `MeasureTheory.charFun` and `charFun_apply_real`;
- `charFun_zero`, `charFun_neg`, and `norm_charFun_le_one`;
- `stronglyMeasurable_charFun`, `measurable_charFun`, and `intervalIntegrable_charFun`;
- `charFun_map_smul`, `charFun_map_mul`, `charFun_dirac`, and `charFun_conv`;
- `Measure.ext_of_charFun`;
- `charFun_eq_fourierIntegral` and `charFun_eq_fourierIntegral'`.

Import `Mathlib.MeasureTheory.Measure.CharacteristicFunction.TaylorExpansion` for `continuous_charFun` and the higher-derivative results `contDiff_charFun`, `iteratedFDeriv_charFun`, and `iteratedDeriv_charFun`. The latter require moment hypotheses and must not be used to invent differentiability at zero in the target parameter range.

Import `Mathlib.MeasureTheory.Measure.IntegralCharFun` for `integral_charFun_Icc` and `measureReal_abs_gt_le_integral_charFun`.

Import `Mathlib.MeasureTheory.Measure.LevyConvergence` for tightness and weak-convergence results such as `isTightMeasureSet_of_tendsto_charFun`, `ProbabilityMeasure.tendsto_of_tendsto_charFun`, and `ProbabilityMeasure.tendsto_iff_tendsto_charFun`. This file is not a substitute for LK theory.

### A.2 Gamma distributions and Gamma/Beta integrals

Import `Mathlib.Probability.Distributions.Gamma`, in namespace `ProbabilityTheory`, for:

- `gammaPDFReal`, `gammaPDF`, and `gammaMeasure`;
- `gammaPDF_of_neg` and `gammaPDF_of_nonneg`;
- measurability and strong-measurability lemmas for `gammaPDFReal`;
- `gammaPDFReal_pos` and `gammaPDFReal_nonneg`;
- `lintegral_gammaPDF_eq_one`;
- `isProbabilityMeasure_gammaMeasure`.

The arguments of `gammaMeasure a r` are shape and rate. This project uses shape `p` and rate `1`.

Import `Mathlib.Analysis.SpecialFunctions.Gamma.Basic` for `Real.Gamma_eq_integral`, `Real.Gamma_add_one`, `Real.Gamma_pos_of_pos`, `Real.integral_rpow_mul_exp_neg_mul_Ioi`, and their relevant complex counterparts.

Import `Mathlib.Analysis.SpecialFunctions.Gamma.Beta` for `Complex.betaIntegral`, `betaIntegral_convergent`, `betaIntegral_scaled`, `Complex.Gamma_mul_Gamma_eq_betaIntegral`, `Complex.betaIntegral_eq_Gamma_mul_div`, and the real and complex Gamma reflection formulas.

The audited Gamma-distribution file did not expose the exact moments, scaling, Laplace-transform, or full-support theorems required here. Those are project-local helper modules.

### A.3 Integration, limits, and differentiation under the integral

Use `Mathlib.MeasureTheory.Integral.Prod` and `Mathlib.MeasureTheory.Measure.Prod` for Fubini and Tonelli. Representative names include:

- `Integrable.integral_prod_left` and `Integrable.integral_prod_right`;
- `integral_prod`, `integral_integral`, and `integral_integral_swap`;
- `lintegral_prod`, `lintegral_lintegral`, and `lintegral_lintegral_swap`.

Use `Mathlib.MeasureTheory.Integral.DominatedConvergence` for `tendsto_integral_of_dominated_convergence`, `tendsto_integral_filter_of_dominated_convergence`, and `tendsto_integral_filter_of_norm_le_const`.

Use `Mathlib.Analysis.Calculus.ParametricIntegral` for `hasDerivAt_integral_of_dominated_loc_of_lip` and `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

Use `Mathlib.MeasureTheory.Integral.IntegralEqImproper` for power and multiplicative substitutions, including `integral_comp_rpow_Ioi`, `integral_comp_rpow_Ioi_of_pos`, `integrableOn_Ioi_comp_rpow_iff`, `integral_comp_mul_left_Ioi`, `integral_comp_mul_right_Ioi`, `integral_comp_mul_deriv_Ioi`, and `integral_Ioi_mul_deriv_eq_deriv_mul`.

For integration by parts, start with finite-interval results from `Mathlib.MeasureTheory.Integral.IntervalIntegral.IntegrationByParts`, such as `intervalIntegral.integral_mul_deriv_eq_deriv_mul`.

### A.4 Strict Jensen and logarithms

Import `Mathlib.Analysis.Convex.Integral` for `StrictConvexOn.ae_eq_const_or_map_average_lt` and `StrictConcaveOn.ae_eq_const_or_lt_map_average`.

Import `Mathlib.Analysis.Convex.SpecificFunctions.Basic` for `Real.strictConcaveOn_log_Ioi`.

Import `Mathlib.Analysis.SpecialFunctions.Log.Basic` for `Real.log_le_sub_one_of_pos` and `Real.log_lt_sub_one_of_pos`.

The project-specific proof based on `log u ≤ u - 1` is preferred because `Hα` approaches zero and does not have a range inside one fixed compact positive interval.

### A.5 Fourier analysis and Gaussians

Import `Mathlib.Analysis.Fourier.Inversion` for `MeasureTheory.Integrable.fourierInv_fourier_eq`, `Continuous.fourierInv_fourier_eq`, `Real.tendsto_integral_cexp_sq_smul`, and `Real.tendsto_integral_gaussian_smul`.

Import `Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral` for Gaussian integrability and integral formulas, including `GaussianFourier.integrable_exp_neg_mul_sq` and `GaussianFourier.integrable_cexp_neg_mul_sq`.

Import `Mathlib.Analysis.SpecialFunctions.Gaussian.FourierTransform` for `fourierIntegral_gaussian`, `GaussianFourier.integral_cexp_neg_mul_sq_add_real_mul_I`, `integral_cexp_quadratic`, and `fourier_gaussian_pi`.

These should be enough for the Gaussian regularization proof without first formalizing the full theorem that every integrable characteristic function has a continuous density.

### A.6 Complex powers and Cauchy–Goursat

Import `Mathlib.Analysis.Complex.Basic` and `Mathlib.Analysis.Complex.Convex` for the slit plane and its elementary geometry, including `Complex.slitPlane`, `isOpen_slitPlane`, `ofReal_mem_slitPlane`, `slitPlane_ne_zero`, and `starConvex_one_slitPlane`.

Import `Mathlib.Analysis.SpecialFunctions.Pow.Continuity` and `Mathlib.Analysis.SpecialFunctions.Pow.Deriv` for `Complex.continuousAt_cpow_const`, `HasDerivAt.cpow_const`, and `Complex.deriv_cpow_const`.

Import `Mathlib.Analysis.Complex.CauchyIntegral` for `integral_boundary_rect_eq_zero_of_differentiableOn`.

The audited baseline did not provide a directly usable general residue theorem. The default proof should therefore use a rectangular Cauchy–Goursat argument.

### A.7 Existing Cauchy distribution

Import `Mathlib.Probability.Distributions.Cauchy` for `ProbabilityTheory.cauchyPDFReal`, `cauchyMeasure`, `integral_cauchyPDFReal_eq_one`, `integrable_cauchyPDFReal`, and `instIsProbabilityMeasure_cauchyMeasure`.

This covers the standard Cauchy distribution at `α = 2`. The audited file did not provide the characteristic-function formula, stability, or an SD theorem.

### A.8 Missing foundations

The earlier source search did not find a ready-made project-level theory for self-decomposability, infinite divisibility, Lévy triplets, the LK representation, conditionally negative-definite functions, BDLPs, HCM/GGC/Thorin theory, beta-prime laws, or Gamma ratios.

This claim must be rechecked against the pinned mathlib revision in M0. In particular, a file named `LevyConvergence` concerns convergence of measures through characteristic functions; it does not supply Lévy–Khintchine theory.

## Appendix B. Mathematical sources

Repository sources:

- [Current mathematical manuscript](../version-1/SD2.tex).
- [Detailed Jensen-obstruction note](../notes/07-Jensen-obstruction-and-non-SD.md).
- [Literature map and verification log](../literature/literature-audit-and-source-notes.md).
- [Wang ECP proof](../literature/ECP2604-002R1A0.pdf).
- [Yano–Yano–Yor paper](<../literature/On the laws of first hitting times of points for one-dimensional symmetric stable Levy processes.pdf>).
- [Jurek–Vervaat paper](<../literature/An integral representation for selfdecomposable banach space valued random variables.pdf>).
- [Current manuscript bibliography](../version-1/ID.bib).
- [Dossier bibliography](../version-0/references.bib).

Principal references:

- Min Wang, *Infinite divisibility of α-Cauchy distributions*, arXiv:2512.23164, version 3, 15 April 2026; especially Lemma 2.7.
- Kouji Yano, Yuko Yano, and Marc Yor, *On the Laws of First Hitting Times of Points for One-Dimensional Symmetric Stable Lévy Processes*, Séminaire de Probabilités XLII, Lecture Notes in Mathematics 1979 (2009), 187–227; especially Remark 2.9 and Proposition 2.11.
- Zbigniew J. Jurek and Wim Vervaat, *An Integral Representation for Self-Decomposable Banach Space Valued Random Variables*, Z. Wahrscheinlichkeitstheorie verw. Gebiete 62 (1983), 247–262.
- Ken-iti Sato, *Lévy Processes and Infinitely Divisible Distributions*, Cambridge Studies in Advanced Mathematics 68, Cambridge University Press, 1999; especially Theorems 8.1 and 17.5 and Exercise 18.1.

When a Lean declaration depends on one of these sources, its docstring must state the mathematical result being imported into the proof. A bibliographic citation is never a substitute for a formal derivation.
