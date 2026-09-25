# Lean Blueprint for GGC Power Closure

**Language convention:** maintain this blueprint in English, including prose,
tables, milestone descriptions and future updates. Preserve Lean identifiers
and mathematical notation.

The deliverable is a Lean proof of the main theorem: **every nonnegative GGC probability law remains GGC under every finite real power \(q\ge1\)**. Toolchain setup, definitions, and tangent identities are intermediate deliverables, not substitutes for that theorem.

**User scope correction, 2026-09-24: M0–M7 are accepted as `verified`
within the registered trust boundary.** The distribution version is the complete
mathematical deliverable. The user withdraws the random-variable corollary
requirement: RV-1 is withdrawn by scope decision, not implemented.

E1's readability migration is implemented with root `Definitions.lean` and
an explicit four-step proof in `main.lean`; **E1 is accepted as `verified`**.
The independent clean build passed 3940 jobs with 137/137 project modules
freshly compiled; the subsequent direct audit matched all 883 checks. See
[Section 14](#e1-design-acceptance-2026-09-24).
The root location and English-only Lean comments follow the current project
conventions recorded in the E1 construction report and README. Section 4.1
records the actual ownership. The mathematical scope and RV-1 withdrawal remain unchanged.

The earlier M7 independent clean project build passed **3939 jobs**, freshly compiling
all **136 project Lean modules**. The subsequent direct audit matched all
**883 axiom checks** and found only the registered whitelist. Dependency
caches were retained. [lean-toolchain](lean-toolchain) still pins Lean
**4.32.2** and [lakefile.toml](lakefile.toml) pins mathlib
**`905b95818eb32af7874a58b427f50c1711a5e96c`**.

[Definitions.lean](Definitions.lean) retains the complete original weak-limit
definition and target; [main.lean](main.lean) supplies the readable final proof.
[GGC/PowerClosure.lean](GGC/PowerClosure.lean) retains the finite-input details.
Thorin representability remains separate. E-B1 and E-B3 are now locally proved
theorems. The unused E-B2 axiom and its forward/equivalence characterization
interfaces have been removed; the undeclared E-B4 fallback is withdrawn. E3.1/E3.2 are independently accepted: E-J3 is now a locally proved theorem.
E3.3 is also independently accepted: the bounded Markov-Krein formula is proved
and the unused general E-J1 interface is retired, not fully formalized. The
final law theorem now uses exactly E-J2, E-T1 and E-S1, plus `propext`,
`Classical.choice`, and `Quot.sound`. See [Section 23](#e3-three-accepted).
The R2-01 comment correction, E-J3 public-interface relocation and retirement
of the superseded reuse probe are also accepted; see [Section 24](#audit-r2-and-j3-relocation).

**E2 is independently accepted as `verified`.** E-B3 finite-atomic approximation
and E-B1 Thorin realization preserve their original complete primitive types
and use standard logic only. The independent clean build passed **3950 jobs**,
freshly compiling **147/147 project modules**; the subsequent direct audit
matched **957/957 checks**. That E2 snapshot had six project axioms; the later
E2-P cleanup leaves five, all used by the main theorem. See the
[construction contract](#e2-bondesson-formalization) and
[independent acceptance](#e2-design-acceptance-2026-09-24).

**S1-SOURCE is closed by independent source review.** The actual 2010
first-edition pages and errata were inspected against the E-S1 interface;
the historical [semantic audit](SemanticAudit-2026-09-24.md) remains unchanged.
The [designer response](#semantic-audit-followup) records the closure.
This source review does not remove E-S1's axiom status.

Sections 8–13 preserve earlier acceptance and design snapshots; Section 14
records E1 acceptance; Section 17 records the E2/source-review snapshot.
[Section 18](#unused-axiom-cleanup) records the subsequent E-B2 removal and
[Section 19](#e3-james-reduction-plan) proposes the next reduction round.
RV-1 remains withdrawn. The [reuse gate](#module-reuse-gate) continues to apply, and
the jointly maintained [MathlibAPI.md](MathlibAPI.md) records accepted uses
and the entry-point migration evidence.

General rules and trust boundaries are in the [README](README.md); external inputs use its [single whitelist](README.md#external-inputs). This blueprint specifies dependencies, mathematical contracts, construction order, and acceptance criteria. The mathematical index is [WIP](../WIP.md); the main assembly and audit are [WIP-6.21](../ledger/23-power-theorem-assembly-audit.md#wip-6-21) and [WIP-6.23](../ledger/25-mathematical-completion-audit.md#wip-6-23).

## 1. Final theorem and required scope

For a real-valued probability law \(\mu\) concentrated on \([0,\infty)\), and \(q\in\mathbb R\) with \(1\le q\), prove

\[
\operatorname{IsGGC}(\mu)
\quad\Longrightarrow\quad
\operatorname{IsGGC}\bigl((x\mapsto x^q)_*\mu\bigr).
\]

The declaration `GGC.GGCPowerClosure : Prop` in [Definitions.lean](Definitions.lean) has this quantifier structure and unfolds Section 2.1's original weak-limit definition. Its proof is `GGC.ggc_rpow` in [main.lean](main.lean). The substantive hypotheses are only nonnegativity of the probability law, GGC membership, and \(q\ge1\); the registered literature dependencies remain explicit in the audit. Its scope includes:

- Every finite real exponent, including noninteger powers and \(q=1\), rather than only squares or a local interval of exponents.
- Arbitrary drift \(a\ge0\), infinite total Thorin mass, and nonatomic Thorin measures.
- All nonnegative degenerate laws, including \(\delta_0\) and \(\delta_a\). Random-variable values are finite real numbers; \(+\infty\) is not an additional value.
- No final assumptions of finite moments, finite logarithmic moments, finite Thorin mass, finite support, or zero drift.

First prove power closure for finite gamma convolutions. Then, for each fixed \(q\), use weak approximation and GGC weak closure. The second log-rate moments and construction constants may depend on each finite input and on \(T=\log q\). They need not be uniform over the approximating sequence. An evolution on an infinite time interval is not required.

## 2. Objects and interface conventions

Use a **law-first, supported-real** model. The implemented `GGC.NonnegLaw` in [Definitions.lean](Definitions.lean) wraps `MeasureTheory.ProbabilityMeasure ℝ` together with an a.e. nonnegativity proof for its underlying measure. That file owns all project-specific definitions required to read the main statement. The distribution theorem is the complete required result; no random-variable corollary is required. Choosing a common probability space, independent copies, or a path process must not become additional main-theorem hypotheses.

| Object | Current representation or remaining contract |
|---|---|
| Nonnegative value law \(\mu\) | `NonnegLaw` and `powerLaw μ q hq` are implemented in `Definitions.lean`, where `hq : 0 ≤ q`. The definition uses the actual map \(x\mapsto x^q\), its continuity for nonnegative exponents, and a proof of nonnegative concentration. `powerLaw_toMeasure` exposes this semantics; `powerLaw_one` and `isGGC_powerLaw_one` supply the exponent-one sanity check. `GGC/Basic.lean` now proves fixed-power preservation of weak convergence as `power_pushforward_tendsto`. |
| Positive rate \(b\) | `PosReal := {b : ℝ // 0 < b}` is implemented in `Definitions.lean`. Rate space and value space are distinct. Log rates live in \(\mathbb R\); `RateRealization` supplies the measurable `exp`/`log` equivalence and pushforward adapters. |
| Thorin data | `ThorinAdmissible` and `ThorinData` live in `GGC/Thorin/Basic.lean`, re-exported by `GGC/Thorin.lean`. They contain nonnegative drift \(a\), a positive rate measure \(U\), and `Integrable` for \(\log(1+1/b)\), without finite total mass. `ThorinAdmissible.integrable_log` proves integrability for every \(s\ge0\); `thorinAdmissible_iff_endpoint` proves the endpoint equivalence, explicitly including local finiteness. These data describe the analytic characterization, not the original GGC definition. |
| GGC membership | Implemented: `IsGGC μ` means that \(\mu\) is a weak limit of actual finite gamma convolutions, as specified in Section 2.1. It has no Thorin-representation premise. |
| Thorin representability | `HasThorinRepresentation` remains separate from `IsGGC`. `HasThorinRepresentation.isGGC` proves the direction required by the main theorem, using locally proved E-B3. The unused converse and equivalence were retired with E-B2. `existsUnique_law_thorinLaplace` combines the locally proved E-B1 with local Laplace uniqueness, using standard logic only. |
| Finite gamma law | `gammaLaw`, `finiteGammaLaw`, and `IsFiniteGammaConvolution` use actual gamma measures and a finite product/sum pushforward in `Definitions.lean`. `ProbabilityMeasure.pi` has underlying measure `Measure.pi`. No transform formula defines this class. `laplace_finiteGammaLaw` proves its exponential finite-sum transform for every \(s\ge0\); `finiteThorinMeasure`, `finiteThorinData` and `hasThorinRepresentation_finiteGammaLaw` supply the adapter \(U=\sum_i\alpha_i\delta_{b_i}\). The empty product/sum gives \(\delta_0\). `Identification.exists_finiteGamma_initialData` supplies normalized log-rate data and the nonempty mass/second-moment certificates. |
| Log-rate state \(F\) | `ProbabilityMeasure ℝ`, with an additional finite-second-moment hypothesis where needed. Set \(U=B\exp_*F\). Define coefficients for every probability \(F\), before proving Thorin admissibility, so the Euler iteration is not circular. |
| Evolution \(F_t\) | `LogRate.WeakLogRateSolution` packages a narrowly continuous probability curve, its initial state, a uniform second-moment bound and the integral weak equation for the specified generator on \([0,T]\). `LogRate.exists_weakLogRateSolution` constructs an inhabitant from the actual Euler curves for every \(T>0\); it does not assume an existence axiom. |
| Value and log-value laws | \(\mu_t\) is the zero-drift GGC law associated with \(U_t\); \(\lambda_t=(\log)_*\mu_t\). Prove \(\mu_t((0,\infty))=1\) before taking log values. \(F_t\) describes log **rates**, whereas \(\lambda_t\) describes log **values**. |
| Test functions | Specify predicates or structures for \(C_c^2(\mathbb R)\), linearly growing \(C^2\) functions with bounded first and second derivatives, and \(C_c^1((0,\infty))\). Moving between test domains requires an extension lemma. |

The initial files now select concrete imports and APIs in the pinned revision. Follow the README for their actual validation status. Further APIs for weak convergence, probability kernels, differentiation, and parameterized random measures must still be inspected and tested. Failure to find an API does not authorize narrowing these mathematical contracts.

<a id="original-ggc-definition"></a>

### 2.1 Original definition and the represented-law adapter

For \(k\in\mathbb N\) and shapes/rates \(\alpha_i,b_i>0\), define the finite gamma law by
\[
\operatorname{finiteGammaLaw}(k,\alpha,b)
 =\left(x\mapsto\sum_{i\in\mathrm{Fin}(k)}x_i\right)_*
   \bigotimes_{i\in\mathrm{Fin}(k)}\operatorname{Gamma}(\alpha_i,b_i).
\]
The product measure encodes independence. A law is `IsFiniteGammaConvolution` exactly when it equals such a pushforward. Shapes and rates may vary with every approximant, \(k=0\) is permitted, and no boundedness or uniform moment condition is added. The actual gamma law uses the shape/rate density already represented by mathlib's `ProbabilityTheory.gammaMeasure`; give the complete project wrappers in `Definitions.lean` and prove their normalization and nonnegative concentration.

The public definition is
\[
\operatorname{IsGGC}(\mu)\;:\!\Longleftrightarrow\;
\exists(\mu_n)_{n\in\mathbb N},\quad
 (\forall n,\ \operatorname{IsFiniteGammaConvolution}(\mu_n))
 \ \land\ \mu_n\Rightarrow\mu.
\]
Use a sequence of `NonnegLaw` objects and `Tendsto` of their underlying `ProbabilityMeasure ℝ` values to `μ.law` in the weak topology. This statement does not quantify over a shared sample space or over Thorin data. If topology-based closure is used internally, prove its equivalence with this sequential definition. In particular, prove weak closure of this class locally by the sequential/closure bridge or a metric diagonal argument; it does not follow merely by unfolding one existential sequence.

Keep the analytic predicate separate:
\[
\operatorname{HasThorinRepresentation}(\mu)\;:\!\Longleftrightarrow\;
\exists a\ge0,\ U\ge0,\quad
 \int\log(1+1/b)\,U(db)<\infty,
\quad\forall s>0,\quad
 L_\mu(s)=\exp\{-as-\int\log(1+s/b)\,U(db)\}.
\]
`GGC/Thorin.lean` exposes `HasThorinRepresentation.isGGC` for every
`NonnegLaw`. This locally proved direction covers zero and constant laws,
nonzero drift, nonatomic measures and infinite Thorin mass. It is sufficient
to certify the value laws constructed in the power-closure proof. It is never
the definition of `IsGGC` or an extra hypothesis of `ggc_rpow`.

**User scope correction after E2:** the converse
`IsGGC.hasThorinRepresentation` and equivalence
`isGGC_iff_hasThorinRepresentation` had no production consumers. They are
removed together with the E-B2 axiom on which they depended. The former E-B4
fallback is withdrawn, not replaced by another axiom. A full characterization
may be added later with a local proof, but it is not a required deliverable.
This removes optional interfaces; it does not prove E-B2 or the converse.
The original finite-gamma weak-limit definition and final theorem are unchanged.

Arbitrary admissible Thorin data has a unique realizing law through locally
proved E-B1 and Laplace uniqueness. E-B3 supplies actual finite-gamma
approximation and the represented-law membership direction. Positive constant
laws therefore remain locally proved GGC members. Admissibility includes local
finiteness through a proved equivalence; no extra mass/moment assumption is
added to `IsGGC`.

**Semantic acceptance:** inspect the full definitions of `gammaLaw`,
`finiteGammaLaw`, `IsFiniteGammaConvolution`, `IsGGC` and
`HasThorinRepresentation`, together with the retained membership direction.
Check actual product-law independence, weak convergence, empty sums, single
Gamma laws and every nonnegative constant. The axiom-free original-GGC weak
closure remains in `GGC.WeakClosure`; it is not the removed E-B2 statement.

The dated M1/E2 records in Sections 11 and 17 preserve the former two-direction
characterization and its then-dependencies. Current scope is governed by this
section and Section 18. Source provenance remains Bondesson (1992), Section
3.1, pp.29 and 34-35, as recorded in the
[primary-interface audit](../notes/log-rate-power-proof-primary-interfaces.md).

## 3. Main dependency graph

Use the **direct log-generator resolvent verification** of [WIP-6.22](../ledger/24-direct-log-generator-resolvent.md#wip-6-22). This removes a dependency on the intermediate rate-coordinate operator. The general rate operator, conditional mass formula, and local continuation route in WIP-6.12--6.15 are optional extensions, not prerequisites for the first main-theorem implementation.

```mermaid
flowchart TD
  A[Nonnegative laws / original GGC definition / power pushforward] --> B[Finite gamma transform and initial log rates]
  A --> L[Primitive Laplace uniqueness / realization adapters]
  L --> B
  B --> H[Represented law to original GGC / local approximation]
  S[Shared random-measure semantics] --> D[Gamma-Dirichlet / Palm / parameterized realization]
  Q[Gamma / beta analytic lemmas] --> D
  Q --> B
  L --> D
  D --> T[Current-law power tangent]
  Q --> T
  P[Stieltjes phase / jointly measurable version] --> G[Log-rate generator and quantitative bounds]
  D --> G
  Q --> G
  T --> R[Direct resolvent identity]
  G --> R
  P --> C[Weak continuity of the generator]
  D --> C
  G --> C
  G --> E[Positive Euler kernel / moments / time compactness]
  C --> V[Finite-time weak evolution]
  E --> V
  A --> M[Value-law logarithmic moments / zero Laplace endpoint]
  D --> M
  L --> M
  Q --> M
  H --> M
  V --> M
  R --> I[Test extension / current-law Laplace equation]
  M --> I
  I --> J[Log-value transport / dynamic identification]
  B --> F[All finite gamma inputs / all real powers]
  V --> F
  J --> F
  A --> W[Approximation from definition / locally proved weak closure]
  F --> Z[Full GGC power closure theorem]
  W --> Z
```

All core graph nodes now have Lean implementations, including B's initial log-rate data, V's constructed weak evolution, J's dynamic identification and Z's final law theorem. L's Laplace uniqueness and E-B1 realization are locally proved. H uses the locally proved E-B3 membership direction only. E-B2 and the unused characterization consumers are removed; E-B4 is withdrawn. W's original-definition weak closure and reduction use standard logical axioms only. `PowerClosure` discharges W's finite-input premise using the constructed evolution at \(T=\log q\). The graph describes mathematical contracts, not the exact Lean import graph; Section 4.2 maps the contracts to their actual modules. External sources supply only the foundational inputs individually listed in the README. The project generator, continuity, Euler limit, dynamic identification and final assembly are proved locally. The user has withdrawn the random-variable corollary requirement.

## 4. Implemented modules and source mapping

Paths are relative to `formalization/`. The Lake library is `GGCPower`, with roots `Definitions`, `main`, `GGC`, `External`, and `AxiomAudit`. Its globs explicitly include `Definitions`, `main`, `AxiomAudit`, and every `GGC` and `External` submodule. `Definitions.lean` owns definitions; `main.lean` is the readable theorem entry point. The current files are:

| Existing file | Current contents and limits |
|---|---|
| [lean-toolchain](lean-toolchain), [lakefile.toml](lakefile.toml) | Pinned Lean/mathlib and the Lake library configuration. The generated `.lake` directory is excluded by the repository ignore rules. |
| [Definitions.lean](Definitions.lean) | Complete original GGC definition, actual gamma/product/sum and power laws, and `GGCPowerClosure`. Imports mathlib only. |
| [main.lean](main.lean) | The unique `ggc_rpow`, with explicit approximation, finite-input closure, power-pushforward convergence and weak-closure steps and English mathematical comments. |
| [GGC/Basic.lean](GGC/Basic.lean) | Moved law/endpoint lemmas, the constant-law power identity, and fixed-power preservation of weak convergence. |
| [GGC/FiniteGamma.lean](GGC/FiniteGamma.lean) | Product/sum semantics, empty- and one-factor identities, finite-gamma and zero-law GGC membership via constant sequences. Scalar and finite-sum Laplace formulas are proved from the gamma density and product integration, including \(s=0\). The finite-atomic adapter is in `GGC.Thorin`; initial log rates are constructed in `GGC.Identification.InitialData`. |
| [GGC/Laplace.lean](GGC/Laplace.lean) | Laplace integrability, normalization, positivity, bounds and constant-law formula; `measure_eq_of_laplace_nat_eq` and `nonnegLaw_eq_of_laplace_eq` prove finite-measure/nonnegative-law uniqueness without extra moments or external mathematical axioms. |
| [GGC/Thorin/Basic.lean](GGC/Thorin/Basic.lean) | Independent Thorin data, separate representation predicate, parameter integrability, endpoint equivalence and finite-atomic certificates; moved definitions and proofs preserve their public names and semantics. |
| [GGC/LaplaceTightness.lean](GGC/LaplaceTightness.lean), [GGC/Thorin/Approximation.lean](GGC/Thorin/Approximation.lean), `GridMeasure`, `GridMeasureMap`, `FiniteWeights`, `Drift`, `Normalization`, `Sequence`, [Realization](GGC/Thorin/Realization.lean) | Independent finite-gamma approximation, drift absorption, lower-bound tightness and full E-B1/E-B3 core proofs. Section 15.3 records the accepted decomposition. No literature axiom is used. |
| [GGC/Thorin.lean](GGC/Thorin.lean) | Public facade for represented-law membership and realization adapters. All retained declarations use standard logic only; the unused converse and equivalence are removed. Varying-data regularity and derivatives remain in `Identification`. |
| [GGC/WeakClosure.lean](GGC/WeakClosure.lean) | `isGGC_iff_mem_closure` and `isGGC_of_tendsto` prove original-GGC weak closure through metrization and sequential closure, with no Thorin dependency. |
| [GGC/Reduction.lean](GGC/Reduction.lean) | `isGGC_powerLaw_of_finiteGamma` and `ggcPowerClosure_of_finiteGamma` prove the conditional reduction. `GGC.PowerClosure` now discharges its explicit finite-input premise. |
| [GGC/Thorin/Interfaces.lean](GGC/Thorin/Interfaces.lean) | E-B1 `thorin_realization` and E-B3 `finite_atomic_approximation`, with primitive measure/Laplace contracts and source annotations. Both are locally proved compatibility theorems. E-B2 is removed; this file declares no axiom. |
| [GGC/DirichletPosterior.lean](GGC/DirichletPosterior.lean) | `GGC.beta_atom_posterior`, preserving the complete original E-J3 primitive type and Polish/Borel binders over the independent `Foundations.DirichletUpdate` proof. No External dependency; standard logic only. |
| [External/README.md](External/README.md), [External/James.lean](External/James.lean), [External/SSV.lean](External/SSV.lean), [External/Sethuraman.lean](External/Sethuraman.lean) | Six retained literature interfaces: locally proved E-B1/E-B3/E-J3 and three remaining axioms. General E-J1 is retired; a separately named local bounded theorem serves its former consumer. E-B2 survives only in historical source/acceptance records; E-B4 is withdrawn. SSV imports mathlib; James and Sethuraman additionally use independent shared random-measure semantics. The relocated Thorin interfaces import the independent Thorin proof layer; James imports only independent posterior semantics and the required topology API; E-J3 is owned by `GGC.DirichletPosterior`. |
| [GGC/PowerClosure.lean](GGC/PowerClosure.lean) | `isGGC_power_valueLaw`, `isGGC_power_finiteGammaLaw`, `isGGC_power_of_isFiniteGammaConvolution`; detailed finite-input assembly. The public `ggc_rpow` now lives in `main`. |
| [AxiomAudit.lean](AxiomAudit.lean) | Prints definitions and complete external contracts, checks the expanded final theorem type, and audits 954 declarations including `ggc_rpow`. The persistent audit also prints its actual proof body. |

<a id="statement-proof-separation"></a>

### 4.1 E1: definitions module and readable main theorem

**Implemented and independently accepted (`verified`).** The earlier recommendation
was `GGC/Definitions.lean`; the accepted implementation choice places
`Definitions.lean` in the formalization root. This preserves the intended
separation from `GGC/Basic.lean`. The declaration namespace remains `GGC`.
The construction report records the user's subsequent root-path override;
this section now reflects the actual root module and explicit Lake coverage.
Earlier acceptance records retain the paths used at their time.

| Target file | Ownership after E1 |
|---|---|
| `Definitions.lean` | Move all current definitions: `PosReal`, `NonnegLaw`, `gammaLaw`, `finiteGammaLaw`, `IsFiniteGammaConvolution`, `IsGGC`, `powerLaw`, `GGCPowerClosure`. Keep complete definitions, explanatory comments, and construction proof fields for normalization and nonnegativity. Import mathlib only, with no external or downstream proof dependencies. |
| `GGC/Basic.lean` and other helpers | Replace old definition-layer `import main` with `import Definitions` where needed. Existing elementary, analytic and Thorin lemmas keep their owners. None of the new main's dependencies may import `main`. |
| `GGC/PowerClosure.lean` | Retain `isGGC_power_valueLaw`, `isGGC_power_finiteGammaLaw`, `isGGC_power_of_isFiniteGammaConvolution` and detailed finite-input assembly using the existing evolution/identification modules. Move the public `ggc_rpow` out; do not duplicate it under a second name. |
| New `main.lean` | Import `Definitions` and proof modules, principally `GGC.PowerClosure` and `GGC.WeakClosure`. Own the unique `GGC.ggc_rpow : GGC.GGCPowerClosure`, with the visible mathematical steps below. No `main : IO Unit` is required. |
| `AxiomAudit.lean` | Import the new `main`; preserve definition and external-contract checks. Check the expanded main theorem type, print its proof body and transitive axioms from the new owner. |

The final proof must visibly carry out the following steps using existing
lemmas, rather than remaining a one-line application of the general reduction:

1. Introduce `μ`, real `q ≥ 1` and the GGC hypothesis. Unpack `IsGGC`
   to obtain finite-gamma laws `μs n` converging weakly to `μ`. Explain that
   their moments, shapes and rates need not have uniform bounds.
2. Prove each powered approximant is GGC using
   `isGGC_power_of_isFiniteGammaConvolution`. Explain its packaged argument:
   empty sums and `q = 1` are covered; for nonempty inputs and `q > 1`,
   normalized finite Thorin data gives an initial log-rate law, the evolution
   is constructed to `T = log q`, and dynamic identification gives the actual
   power law. These details stay in `PowerClosure` and its dependencies.
3. Use `power_pushforward_tendsto` to obtain weak convergence of the powered
   laws to `powerLaw μ q …`. Explain why continuity of the fixed power map
   applies and why the limit is the actual probability law.
4. Use `isGGC_of_tendsto` to conclude. Explain that the limit step removes
   the intermediate finite-mass and log-rate-moment restrictions.

Use named intermediate membership and convergence facts. The file overview
should link the definitions and detailed modules; the theorem docstring
should state the full law scope and its current three literature dependencies
(seven at the E1 acceptance snapshot; reduced by the accepted E2 proofs).
Comments should explain mathematical purpose and hypotheses, not merely
repeat tactics. All project Lean comments and docstrings are written in English,
following the current README convention; retain Lean names and mathematical notation.
Do not move lengthy analysis or duplicate generic proofs into `main`.

The intended dependency direction is:

```text
mathlib → Definitions → GGC helpers → GGC.PowerClosure → main → AxiomAudit
mathlib → shared random-measure semantics → External → GGC proof modules
```

Arrows point from dependency to consumer. External files keep their independent
shared semantics. After migration, `import main` exposes the final theorem;
`import GGC.PowerClosure` exposes its supporting lemmas, not `ggc_rpow`.
Do not add a compatibility back-import that would create a cycle.

**Acceptance:** preserve definition semantics, names and the full theorem type;
inspect the real proof steps and comments; replace every old definition-layer
`import main`; update audit imports, module docstrings, README layout and API
consumers. Verify `Definitions` is explicitly included in Lake roots and globs,
and that the default build includes `main`, all proof modules and the audit. Require an acyclic import
graph, a clean project build followed by a direct audit, and preservation of
the trust boundary for a pure migration. E1 preserved seven literature axioms
plus standard logic; the separately accepted E2 proofs now reduce this to five.
Record fresh module/check counts; old counts do not verify the migration.
The accepted M7 mathematics remains closed; E1 has separate migration evidence.

### 4.2 Proof contracts and actual implementation

The first table preserves the original contract decomposition and manuscript locators. Its proposed filenames and theorem names are not all literal current APIs: construction split several contracts into smaller modules. The implementation map following it gives the actual consumers. Local adapters belong with the relevant mathematics and import `Definitions` as needed; the public final theorem belongs to `main.lean`.

| Proposed file | Proposed declarations or deliverable | Written proof and manuscript locator |
|---|---|---|
| `GGC/Basic.lean` | The existing basic declarations listed in Section 4.1, followed by `power_pushforward_weaklyContinuous` and its `NonnegLaw`/`powerLaw` adapter; imports `Definitions` | [Definitions.lean](Definitions.lean), existing helper proofs; [WIP-0.1](../ledger/00-foundations.md#wip-0-1); [completion section](../manuscript/sections/06-completion.tex) |
| `GGC/Laplace.lean` | `laplace`, `nonnegLaw_eq_of_laplace_eq`, Laplace normalization/positivity/integrability; primitive probability-measure statements with no moment assumptions. Realization adapters using Thorin data belong to `GGC.Thorin`, avoiding a reverse import | [foundations](../manuscript/sections/01-foundations.tex), `lem:gamma-dirichlet`; [identification](../manuscript/sections/05-identification.tex), transform-uniqueness argument following `eq:id-positive-log`; E-B1 local obligations |
| `GGC/FiniteGamma.lean` | Product/sum semantics lemmas, scalar and finite-sum Laplace formulas, finite-gamma membership and zero-law membership via constant sequences; imports `GGC.Basic` and `GGC.Laplace`, not `GGC.Thorin` | Section 2.1; [foundations ledger](../ledger/00-foundations.md) |
| `GGC/WeakClosure.lean` | Sequential/closure equivalence or metric diagonal construction, then `isGGC_of_tendsto`; consumes the original definition and `GGC.Basic`, with no Thorin-characterization dependency | Section 2.1; [preliminaries](../manuscript/sections/01-foundations.tex), `lem:ggc-closure` |
| `GGC/Thorin.lean` | Thorin data and `HasThorinRepresentation`, integrability and derivative lemmas, realization adapters, `HasThorinRepresentation.isGGC`, `hasThorinRepresentation_diracLaw`, and revised `isGGC_diracLaw`; imports finite-gamma/Laplace results and only the external contracts actually used | Section 2.1; [foundations ledger](../ledger/00-foundations.md); [preliminaries](../manuscript/sections/01-foundations.tex), `eq:thorin-representation` |
| `GGC/Reduction.lean` | Conditional finite-gamma-to-general reduction; consumes `GGC.Basic`, `GGC.WeakClosure`, and approximation from the original definition; no final theorem assumed or claimed | [WIP-6.21](../ledger/23-power-theorem-assembly-audit.md#wip-6-21); [completion section](../manuscript/sections/06-completion.tex) |
| `GGC/Foundations/RandomMeasure.lean` | Actual random-measure evaluation, finite-partition Dirichlet semantics including zero-mass cells, and required measurable structures; no project conclusions or external axioms | [foundations](../manuscript/sections/01-foundations.tex), Dirichlet-process convention; [measurable realizations](../manuscript/sections/07-measurable-realizations.tex); E-J1--E-J3 and E-T1 prerequisites |
| `GGC/GammaAnalysis.lean` | Gamma/beta density conventions, digamma semantics, gamma and beta logarithmic integrals, and uniform bounds on compact positive mass intervals; reuse mathlib and prove missing analytic adapters locally | [tangent](../manuscript/sections/02-power-tangent.tex), proof of `lem:tangent`; [generator](../manuscript/sections/03-log-generator.tex), proof of `lem:bounds`; [identification](../manuscript/sections/05-identification.tex), `eq:id-log-moment` |
| `GGC/GammaDirichlet.lean` | `dirichletMean_laplace`, `tiltedLaw_eq_gammaDirichlet`, `posterior_palm`, `parameterized_dirichlet`, and the locally proved Dirichlet pushforward adapters connecting log-rate and positive-rate bases | [WIP-6.11](../ledger/19-finite-thorin-compensated-power-tangent.md#wip-6-11), [WIP-6.16](../ledger/20-finite-thorin-positive-steps.md#wip-6-16); [measurable realizations appendix](../manuscript/sections/07-measurable-realizations.tex), `lem:parameterized-dirichlet` |
| `GGC/StieltjesPhase.lean` | `phase_jointlyMeasurable`, `phase_anchor_one`, `phase_unique_ae`, `phase_integrals_tendsto` | [WIP-6.11](../ledger/19-finite-thorin-compensated-power-tangent.md#wip-6-11), [WIP-6.18](../ledger/21-log-thorin-euler-evolution.md#wip-6-18); [preliminaries](../manuscript/sections/01-foundations.tex), `lem:phase` |
| `GGC/PowerTangent.lean` | `currentLaw_power_tangent`, `normalized_power_tangent`, `power_tangent_eq_deriv_s_mul_tilted_logMoment` | [WIP-6.11](../ledger/19-finite-thorin-compensated-power-tangent.md#wip-6-11); [tangent section](../manuscript/sections/02-power-tangent.tex), `lem:tangent`; [identification](../manuscript/sections/05-identification.tex), `eq:id-current-tangent` |
| `GGC/LogRate/Generator.lean` | `jumpMeasure`, `correctionKernel`, `logDrift`, `acceptance`, `logGenerator`; joint measurability | [WIP-6.16](../ledger/20-finite-thorin-positive-steps.md#wip-6-16); [generator section](../manuscript/sections/03-log-generator.tex), `eq:generator` |
| `GGC/LogRate/Bounds.lean` | `correctionKernel_integrable`, `jump_secondMoment_finite`, `drift_linear_bound`, quadratic Lyapunov bound | [WIP-6.17](../ledger/20-finite-thorin-positive-steps.md#wip-6-17); [generator section](../manuscript/sections/03-log-generator.tex), `lem:bounds` |
| `GGC/LogRate/Resolvent.lean` | `direct_resolvent_cancellation`, `averaged_generator_resolvent` | [WIP-6.22](../ledger/24-direct-log-generator-resolvent.md#wip-6-22); [generator section](../manuscript/sections/03-log-generator.tex), `lem:generator` |
| `GGC/LogRate/Continuity.lean` | `averaged_generator_continuous`, uniform boundedness for compact tests over all states and masses in a compact positive interval | [WIP-6.18](../ledger/21-log-thorin-euler-evolution.md#wip-6-18); [evolution section](../manuscript/sections/04-evolution.tex), `lem:continuity` |
| `GGC/LogRate/Euler.lean` | `positiveEulerKernel`, exact one-step moments, uniform second moments, time modulus, cumulative consistency error | [WIP-6.19](../ledger/21-log-thorin-euler-evolution.md#wip-6-19); [evolution section](../manuscript/sections/04-evolution.tex), `eq:positive-euler-kernel` through `eq:euler-total-error` |
| `GGC/LogRate/Existence.lean` | `exists_weakLogRateSolution` | [WIP-6.19](../ledger/21-log-thorin-euler-evolution.md#wip-6-19); [evolution section](../manuscript/sections/04-evolution.tex), `thm:evolution` |
| `GGC/Identification/Moments.lean` | `valueLaw_logMoment_bound`, strict positivity, narrow continuity of value laws, Thorin admissibility | [WIP-6.20, Sections 1--2](../ledger/22-power-flow-identification.md#wip-6-20); [identification section](../manuscript/sections/05-identification.tex), `eq:id-log-moment` |
| `GGC/Identification/WeakEquation.lean` | Test-domain extension, `tangent_spaceTime_integrable`, `zero_endpoint_bound`, `laplace_weak_equation`, `value_weak_equation` | [WIP-6.20, Sections 3--7](../ledger/22-power-flow-identification.md#wip-6-20); [identification section](../manuscript/sections/05-identification.tex), `eq:id-absolute-fubini`, `eq:id-value-weak` |
| `GGC/Identification/Transport.lean` | `log_value_transport_unique`, `identify_power_flow` | [WIP-6.20, Section 8](../ledger/22-power-flow-identification.md#wip-6-20); [identification section](../manuscript/sections/05-identification.tex), `thm:identification` |
| `GGC/PowerClosure.lean` | Finite-input closure and detailed assembly; E1 has moved the public `ggc_rpow : GGCPowerClosure` to `main.lean`. No random-variable corollary is required | [WIP-6.21](../ledger/23-power-theorem-assembly-audit.md#wip-6-21); [completion section](../manuscript/sections/06-completion.tex); [full-scope audit](../ledger/25-mathematical-completion-audit.md#wip-6-23) |

| Contract / stage | Actual implementation and principal endpoint |
|---|---|
| M2 analysis, Dirichlet and posterior laws | `GammaAnalysis`, `BetaAnalysis`, `GammaDirichlet`, `GammaDirichletTangent`, `Palm`, `RateRealization`, `DirichletRealization`; `Foundations/Quantile` and `QuantileContinuity` supply the ordered real sampler. |
| M2 phase and power calculus | `StieltjesPhase`, `PowerTangent` and their analytic foundations: canonical measurable phase and the differentiated actual power-law Laplace transform. |
| M3 generator and resolvent | `LogRate/Generator`, `CanonicalBounds`, `GeneratorResolvent`; endpoint `integral_generator_eq_normalized_powerTangent` uses the actual `(B,F)` generator. |
| M4 weak continuity | `PhaseWeakContinuity`, `DirichletContinuity`, `LogRate/GeneratorContinuity`, `LogRate/Continuity`: L¹ phase pairing, common-space posterior coupling and varying-law generator integration. |
| M5 finite-time evolution | `LogRate/Euler`, `EulerMoments`, `EulerTightness`, `EulerInterpolation`, `EulerLimitCurve`, `EulerWeakEquation`, `Existence`; endpoint `exists_weakLogRateSolution`. |
| M6 moments and time equations | `Identification/ValueLaw`, `Moments`, `LogValueContinuity`, `TangentSpaceTime`, `TestExtension`, `LaplaceEvolution`, `LogTransport` and their supporting modules. |
| M6 identification | `Identification/TransportUniqueness`, `DynamicIdentification`; endpoint `valueAt_eq_powerLaw`, followed by `isGGC_power_valueLaw_of_weakSolution`. |
| M7 assembly | `Identification/InitialData` and `PowerClosure`; actual finite-gamma law is matched to its initial value law, and `ggc_rpow` discharges the full original-definition target. Distribution delivery accepted; the readable final theorem is in `main`. |

WIP-6.23 audits the assembled proof; it is not a second independent theorem. Exact foundational source interfaces are recorded in the [primary-interface audit](../notes/log-rate-power-proof-primary-interfaces.md) and the README whitelist. Parameterized realizations, measurable representatives and their applications are local Lean constructions, separate from the literature axioms.

<a id="module-reuse-gate"></a>
### 4.3 Module design and mathlib reuse gate

**Checks governance (user-approved 2026-09-25):** follow
[Checks/README.md](Checks/README.md) for creating, running, maintaining and
retiring durable checks. Record creation role separately from independent
verification. Use explicit commands by default; production must not import
Checks. Independent-review ownership is preserved. Historical probes covered
by production proofs are not automatically required submission checks; update
replacement evidence when retiring them. This governs the checks requested
throughout this blueprint without changing any mathematical contract.

Apply the [README reuse workflow](README.md#mathlib-reuse-workflow) before
substantial implementation in each module. Before fixing its interfaces,
record an API mapping in [MathlibAPI.md](MathlibAPI.md): the exact
mathematical contract, candidate source and full declaration name, required
adapter, evidence level, and remaining gap. Existing validated entries may be
referenced instead of searched again. Separate mathematical sub-obligations
so generic library results can be reused even when no project-named theorem
exists. Record both adopted and rejected close matches.

The designer and constructor jointly maintain this API table. Constructors
may update its candidates, evidence and gaps during implementation; designers
maintain contract compatibility and acceptance decisions. Use stable entry
IDs in construction reports. Keep compilation status distinct from design
acceptance; keep chronological build records in ConstructionReport.md. The
Blueprint remains a designer-maintained construction specification.

Prefer standard objects; retain project definitions where required for the
readable statement or mathematical conventions, with proved compatibility
lemmas in their owner modules. Consumers reuse the bridge. Do not move proof
dependencies into `Definitions` under E1, create external/project import cycles, or alter
public hypotheses merely to match an available theorem. A broad kernel or
measure theorem can replace infrastructure only after its exact assumptions
and resulting semantics are checked.

The constructor must perform a focused re-search before a new generic
foundation, substantial foundational proof, permitted literature axiom or
duplicated argument, and when representation mismatches reveal a plausible
broader API. Document a specific gap and proceed with the local proof when
appropriate; neither exhaustive searching nor fresh user permission is
required for routine reuse choices within the approved contracts.

At module acceptance, the designer checks:

1. Every substantial generic component has a reuse decision with an actual
   pinned-source/type comparison; new generic definitions and long foundation
   proofs have a concrete reason to remain local.
2. Adopted APIs have `minimal_use_compiled` evidence on the project's real
   types, preserved assumptions and conventions, and tracked production
   proofs or durable probes with a build/acceptance command.
3. Equality/transport adapters preserve probability semantics, sign and rate
   conventions, measurability structures, integrability and null-set scope.
   Compiled infrastructure is not credited as a missing project theorem.
4. The shared gap list, remaining obligations and actual transitive axiom set
   agree with the implementation. Only completed mathematical contracts earn
   `verified`; reuse counts and shorter proofs do not substitute for them.

Apply this gate to new or materially revised modules. The accepted M0/M1
results remain accepted; routine documentation completion does not require
rebuilding unrelated proofs.

<a id="m2-m3-reuse-map"></a>
### 4.4 M2/M3 reuse priorities and remaining boundaries

These design inputs come from the
[2026-09-24 pinned-source reuse audit](ConstructionReport.md#mathlib-reuse-2026-09-24).
Its adopted uses and sampling probe were reported compiled at mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`. These priorities guide subsequent
construction; it is not an independent acceptance of all M2/M3 modules.
Keep the actual source/API/adapter/evidence mapping in the joint
[MathlibAPI table](MathlibAPI.md#api-mapping), not in a second blueprint table.
Reuse API-002 for tilting, API-003/004 for varying-law integration and
pushforwards, API-005 for digamma conventions, API-006 for the resolvent bridge,
and API-007 for interval projection. Preserve the real/complex and sign
adapters, `digamma (B + 1)`, endpoint behavior, and all absolute-integrability
obligations. GAP-003–006 identify what those library results do not supply.

Prioritize API-008 (`Kernel.exists_measurable_map_eq_unitInterval`) for
sampling from supplied Markov kernels with nonempty standard Borel targets.
GAP-001/002 retain the missing Dirichlet kernel, target instances,
narrow-Borel/Giry compatibility and common-space requirements.

Promote the future-sampling evidence currently in `.lake/ReuseCheck.lean` to
a tracked proof or durable probe before depending on it in a new interface.
Reuse the library's measurable-sampling construction instead of reproving it
when its contract suffices. If the blueprint's remaining argument needs a
particular coupling, common event or pathwise parameter property, state and
prove that extra bridge explicitly; equality of marginal laws alone does not
discharge it. Do not mark Dirichlet realization complete from the sampling
probe.

For remaining work, search general kernel/measure, bounded-continuous-function,
transform and calculus interfaces as well as project terminology. In
particular, retain compensated kernels and their absolute-integrability
proofs where separate library integrals would lose cancellation. Failure to
find a named Thorin, Dirichlet or phase theorem is a recorded search result,
not evidence that every supporting construction must be written locally.

## 5. Critical mathematical contracts

### Foundational adapters shared by the proof nodes

`GGC/Laplace.lean` now proves `nonnegLaw_eq_of_laplace_eq`: two nonnegative probability laws with the same Laplace transform at every positive parameter are equal, without extra moments. The locally proved E-B1 gives existence; `existsUnique_law_thorinLaplace` combines it with local uniqueness, using standard logic only. Reuse uniqueness to identify realizations with gamma--Dirichlet products and subsequential limits in M6. Choosing one E-B1 witness does not itself prove continuity or measurability as its data vary. Those properties remain outputs of `Identification/Moments.lean`, using the logarithmic tail bounds. For the supported-real model, also justify the passage to probabilities on the positive subtype and continuity of the log pushforward; `Real.log` is not continuous at zero.

`GGC/GammaAnalysis.lean` must use shape/rate gamma conventions and actual beta laws; below \(B>0\) and \(G_B\sim\mathrm{Gamma}(B,1)\) has unit rate. Set \(\psi=\Gamma'/\Gamma\) on positive arguments (or prove equivalence with a reused definition), and supply
\[
\mathbb E[G_B\log G_B]=B\psi(B+1),\qquad
\mathbb E[-\log Z]=\psi(B+1)-\psi(1),\quad Z\sim\mathrm{Beta}(1,B),
\]
with absolute integrability, as well as the gamma negative-log bound \(\mathbb E(\log G_B)^-\le[\Gamma(B)B^2]^{-1}\). Supply continuity and bounds for these constants on compact subsets of \((0,\infty)\). These are local analytic obligations, not extra conclusions supplied by E-J1 or E-J3.

### A. Current-law tangent and measurable phase

The input is any admissible, nonzero, finite Thorin measure \(U\), of mass \(B>0\), with its associated zero-drift value law \(\mu\). For \(P\sim DP(U)\) and \(s>0\), define

\[
M_P(s)=\int\frac{P(db)}{s+b},\qquad
W_P(s)=\int\frac{b\,P(db)}{(s+b)^2},\qquad
g(s)=-\partial_s\log L_\mu(s).
\]

Deliver the actual power derivative
\(h_U(s)=\left.\partial_q[-\partial_s\log L_{\operatorname{powerLaw}(\mu,q)}(s)]\right|_{q=1}\), together with

\[
\frac{h_U(s)+g(s)}B
=\mathbb E\bigl[W_P(s)\{\psi(B+1)+1+\log M_P(s)\}\bigr].
\]

This is differentiability at the **current law**; it does not assume that any positive-time power is GGC. Exponential tilting needs a marginal distribution identity for each \(s\), not a joint coupling assertion about the original tilts.

The tangent module must also deliver the bridge consumed by identification. With
\[
A_U(s)=\frac{\int x\log x\,e^{-sx}\,\mu(dx)}{L_\mu(s)},
\qquad h_U(s)=\partial_s\{sA_U(s)\},
\]
prove the second equality for the actual power derivative defined above, not as a new definition of an unrelated tangent. Establish the required mixed differentiation and domination locally on compact positive \((s,q)\)-intervals around \(q=1\), and positivity of the normalizer. The bounds apply under the tilted integrals and require no un-tilted \(X\log X\) moment.

For the phase, deliver \(0\le\xi_P(t)\le1\), joint Borel measurability in \((P,t)\), the anchor-one formula, and a.e. uniqueness:

\[
\log M_P(s)-\log M_P(1)
=\int_0^\infty\xi_P(t)\left(\frac1{s+t}-\frac1{1+t}\right)dt.
\]

Construct a specific representative using the boundary `limsup` along integers \(n\ge1\). Separate external existence of a bounded phase representation from the project's jointly measurable version. Do not assume convergence at every boundary point or add \(M_P(0)<\infty\).

### B. The specified generator and its resolvent identity

Define \(a_{B,F}\) and \(k_{B,F}\) exactly as in [WIP-6.16--6.17](../ledger/20-finite-thorin-positive-steps.md). The Palm posterior is \(DP(U+\delta_b)\), but the tangent's digamma coefficient remains \(\psi(B+1)\), using the original mass. The generator is

\[
\mathcal G_{B,F}\varphi(y)=a_{B,F}(y)\varphi'(y)
+\int_{\mathbb R}[\varphi(y+v)-\varphi(y)-v\varphi'(y)]
 k_{B,F}(y,v)\,\nu_0(dv),\qquad
\nu_0(dv)=\frac{dv}{4\sinh^2(v/2)}.
\]

The reference measure has no atom at zero. Compensation covers **all** jump sizes. First prove \(K\in L^1\), \(m_2=\int v^2\nu_0(dv)<\infty\), \(0\le k\le1\), and \(|a-y|\le C_I\). For \(B\in I\Subset(0,\infty)\), the constants must be independent of \(F,y\). The main proof needs only finiteness of \(m_2\); its closed form \(2\pi^2/3\) need not add a dependency.

For \(\varphi_s(y)=(s+e^y)^{-1}\), prove

\[
F(\mathcal G_{B,F}\varphi_s)=\frac{h_U(s)+g(s)}B.
\]

The proof sequence is: algebraic cancellation of combined kernels; absolute integrability of each term used; the sample identity; an absolute posterior drift bound; then signed Palm/Fubini. Integrate the three terms defining \(K\) together, rather than splitting divergent integrals and cancelling them afterward. Use [WIP-6.22](../ledger/24-direct-log-generator-resolvent.md#wip-6-22).

### C. Continuity, positive discrete kernels, and existence

The continuity contract is: if \(B_n\to B>0\), \(F_n\Rightarrow F\), and \(y_n\to y\), then for every \(\varphi\in C_c^2\),
\(\mathcal G_{B_n,F_n}\varphi(y_n)\to\mathcal G_{B,F}\varphi(y)\); consequently \(H_\varphi(B,F)=F(\mathcal G_{B,F}\varphi)\) is continuous. Use common uniforms, quantiles, stick-breaking, and weak-star phase convergence against \(L^1\) kernels. Pointwise continuity of boundary phases cannot replace this argument. In stick-breaking, the independent variables are the Beta break fractions \(V_j\) and the locations, not the weights \(W_j=V_j\prod_{i<j}(1-V_i)\).

This interface also supplies, for every compact positive mass interval \(I\), a finite constant \(C_{I,\varphi}\) with
\(\sup_{B\in I,F,y}|\mathcal G_{B,F}\varphi(y)|\le C_{I,\varphi}\).
Derive it from B's drift bound and compact support of \(\varphi'\). Use it with local uniform convergence and tightness to integrate against varying \(F\), and later to pass through the time integral. Joint continuity alone does not supply this bound on the noncompact state space.

For an Euler step, take **\(0<h\le1/16\)**, \(\epsilon=\sqrt h\), and freeze \(B,F\). In the finite-horizon construction choose \(h=T/N\) with \(N\ge1\) large enough to meet this bound, and let \(N\to\infty\). Set

\[
\lambda_\epsilon(y)=\int_{|v|>\epsilon}k(y,v)\nu_0(dv),\quad
m_\epsilon(y)=\int_{|v|>\epsilon}vk(y,v)\nu_0(dv),\quad
a_\epsilon=a-m_\epsilon,\quad p=1-h\lambda_\epsilon.
\]

The actual iteration kernel must be

\[
\Pi_h(y,dz)=p(y)\delta_{y+h a_\epsilon(y)/p(y)}(dz)
+h\int_{|v|>\epsilon}\delta_{y+v}(dz)k(y,v)\nu_0(dv).
\]

Prove the uniform truncation bound \(\lambda_\epsilon(y)\le2/(e^\epsilon-1)\le2/\epsilon\), so \(p(y)\ge1-2\sqrt h\ge1/2\). This is a small-step contract, not a claim for arbitrary positive \(h\).

Acceptance requires kernel measurability, \(p\ge1/2\), total mass exactly one, the exact mean \(\mathbb E(\Delta\mid y)=ha(y)\), and the second-moment recursion, for the admissible steps just specified. Prove uniform tightness and time control, and choose a subsequence independently of the test function. The cumulative error must vanish, for example through
\(C[\sqrt h+h(1+|\log h|^2)]\to0\).

The existence output must be precisely: for every \(B_0>0\), probability \(F_0\) with finite second moment, and \(T>0\), there is a narrowly continuous \(F_t\) with the prescribed initial state, a uniform second-moment bound, \(B_t=B_0e^{-t}\), and

\[
F_t(\varphi)-F_0(\varphi)
=\int_0^t F_r(\mathcal G_{B_r,F_r}\varphi)\,dr
\qquad(\varphi\in C_c^2,\ 0\le t\le T).
\]

A positive minimum property, a formal tangent, or positivity of one step does not satisfy this existence contract. Do not replace the construction with an unproved general nonlinear-generator existence axiom.

### D. Endpoint control, dynamic identification, and final assembly

The identification theorem consumes exactly C's output and uses the same \(\mathcal G\). First prove admissibility of \(U_t=B_t\exp_*F_t\), strict positivity and narrow continuity of its value law \(\mu_t\), and

\[
\sup_{t\le T}\int|\log x|\,\mu_t(dx)<\infty.
\]

Extend the weak equation by cutoffs to linearly growing tests with bounded derivatives. Combine it with B's resolvent identity; \(B_t'=-B_t\) cancels the extra \(g_t\) term. For \(A_t(s)=\mathbb E_{t,s}[X\log X]\), consume A's derivative bridge and prove the expanded identity
\[
h_t(s)=\partial_s\{sA_t(s)\}
=A_t(s)-s\mathbb E_{t,s}[X^2\log X]
 +s\mathbb E_{t,s}[X]A_t(s).
\]
The zero-endpoint contract is all of the following, for every fixed \(s_0>0\):

- A Borel probability kernel \(t\mapsto\mu_t\), and joint measurability of \(A_t(s)\) and \(h_t(s)\) on \([0,T]\times(0,\infty)\).
- A uniform positive lower bound \(L_t(s)\ge D:=\exp\{-B_0[\log(1+s_0)+\sqrt{K_T}]\}>0\) for \(0<s\le s_0\), where \(K_T=\sup_{0\le t\le T}F_t(y^2)\).
- Absolute space-time integrability of **\(h\)**, including its product term:
  \[
  \int_0^T\int_0^{s_0}|h_t(s)|\,ds\,dt
  \le T\left(2D^{-1}+(eD^2)^{-1}\right)C_{\log,T}<\infty,
  \]
  where \(C_{\log,T}\) bounds \(\int|\log x|\,\mu_t(dx)\). For the product term use \(s\mathbb E_{t,s}X\le(eD)^{-1}\) and \(\int_0^{s_0}|A_t(s)|\,ds\le D^{-1}C_{\log,T}\).
- For each fixed \(t\), \(sA_t(s)\to0\) as \(s\downarrow0\), with \(|sA_t(s)|\le C_{\log,T}/(eD)\). This bound permits dominated convergence in time; uniform convergence in \(t\) is not required.

Only then conclude \(\int_0^s h_t(r)\,dr=sA_t(s)\), perform time--Laplace Fubini, and normalize at \(s=0\). Integrability of \(A\) and its boundary limit alone do not prove integrability of its differentiated expression \(h\). Do not assume \(\mathbb E|X\log X|<\infty\) for the original value laws. The source for this complete contract is `eq:id-tangent-expanded` through `eq:id-zero-endpoint` in the [identification section](../manuscript/sections/05-identification.tex).

Approximate simultaneously in the norms of the **test function and its generator** to derive

\[
\mu_t(H)-\mu_0(H)=\int_0^t\mu_u(x\log x\,H'(x))\,du
\qquad(H\in C_c^1((0,\infty))).
\]

For \(\lambda_t=(\log)_*\mu_t\), obtain the transport equation with velocity \(z\). Prove uniqueness using partition sums and backward tests \(\zeta_u(z)=\zeta(e^{t-u}z)\), yielding
\(\mu_t=(x\mapsto x^{e^t})_*\mu_0\). This is a dynamic identification; resemblance between two static transform formulas is insufficient.

Finally take \(T=\log q\) for the finite gamma theorem and handle \(q=1\) separately. For general GGC inputs, use \(\mu_n\Rightarrow\mu\), continuity of the fixed power map, and GGC weak closure. The weak limit is the actual probability law \(\operatorname{powerLaw}(\mu,q)\), with no loss of mass. The general input must not inherit C's moment assumptions.

## 6. Milestones and acceptance gates

Change a milestone's status only after providing checkable Lean declarations, dependencies, and build evidence. Completing a stage does not automatically verify the main theorem. If explicit external assumptions remain, use the README's relative-verification designation.

Every new or materially revised module submitted within these stages must
also satisfy the [reuse gate](#module-reuse-gate). Attach its shared API-index
references, compiled-use evidence and reasons for retained generic proofs
to the construction report; keep the mathematical acceptance criteria below
unchanged.

| Stage | Status | Deliverables and acceptance criteria |
|---|---|---|
| M0: Reproducible project and fixed interfaces | `verified` | Pins, original-definition semantics, helper ownership and build/audit coverage pass review. Empty-sum, single-gamma, exponent-one and constant-power cases, Laplace integrability, normalization and positivity pass. Historical evidence: Section 10; formerly deferred contracts are covered by M2. |
| M1: Thorin adapters and final reduction | `verified` | Transforms, local Laplace uniqueness, finite-atomic/admissibility adapters, endpoint equivalence, constant-law membership, original-GGC weak closure and reduction pass. The unused characterization converse/equivalence were retired by E2-P; retained Thorin adapters, realization and constant-law membership use standard logic. Historical acceptance: Sections 11 and 17; the finite-input premise is now discharged in `PowerClosure`. |
| M2: Dirichlet theory, phases, and tangent | `verified` relative to registered inputs | Shared finite-partition semantics, full external types, Gamma/Beta analysis, actual posterior laws, fixed common space, ordered quantiles, common event and joint measurability pass review. Canonical measurable phase and actual power tangent are locally proved. |
| M3: Generator and direct resolvent | `verified` relative to registered inputs | Actual `(B,F)` generator, quantitative bounds, compensated cancellation and absolutely integrable posterior/Palm resolvent identity pass. No hidden rate or log-rate moment hypothesis; the original mass determines `digamma (B + 1)`. |
| M4: Weak continuity | `verified` relative to registered inputs | Phase pairing against every L¹ kernel, joint parameter continuity, common-space posterior coupling and integration against varying laws pass. Pointwise phase continuity is not assumed. |
| M5: Positive Euler scheme and finite-time existence | `verified` relative to registered inputs | Actual Markov kernel, exact moments, tightness, whole-curve common subsequence, consistency and limiting equation pass. `exists_weakLogRateSolution` constructs every required finite-horizon solution; every compact C² test and every time share the same curve. |
| M6: Dynamic identification | `verified` relative to registered inputs | Absolute logarithmic moments, strict positivity, zero-endpoint/Fubini bounds, test-domain extension and partition-based transport uniqueness pass. `valueAt_eq_powerLaw` identifies actual probability laws without assuming power closure. |
| M7: Full distribution theorem | `verified` relative to registered inputs | The full law theorem passed the recorded clean build/type/axiom checks. The user withdrew RV-1; the distribution version completes the mathematical delivery. |
| E1: Readable theorem entry point | `verified` | Root `Definitions.lean` owns the unchanged definitions; `main.lean` owns the unique theorem and four visible steps; `GGC/PowerClosure.lean` retains detail. Independent clean build: 137 fresh modules / 3940 jobs; direct audit: 883 matching checks. See Section 14. |
| E2: Formalize E-B3 and E-B1 | `verified` | Same complete primitive contracts, proved from mathlib and local lemmas only; accepted common approximation/tightness infrastructure. Independent clean build: 147 fresh modules / 3950 jobs; direct audit: 957 matching checks. At E2 acceptance: five literature axioms in the main theorem and six project-wide. E2-P subsequently removes the unused sixth axiom. See Sections 15, 17 and 18. |
| E2-P: Remove unused axiom and interfaces | `verified` | E-B2 and its two unused characterization consumers removed; E-B4 fallback withdrawn. Main theorem and retained proofs unchanged. Default rebuild passed 3950 jobs; 954/954 direct audit checks matched. Five actual axioms project-wide and in the main theorem. |
| E3.0–2: Gamma-Dirichlet foundation and full E-J3 | `verified` | Complete joint laws including zero shapes and same-type E-J3 proof. Four remaining axioms: J1/J2/T1/S1. See Section 22. |
| E3.3: bounded Markov-Krein | `verified` | Bounded formula proved; complete consumer preserved; unused general J1 retired. Three axioms remain: J2/T1/S1. See Section 23. |

M0's acceptance checklist is:

1. Reproduce the pinned version, default build, and existing audit; record the actual executable, working directory, commands and exit statuses, distinguishing cached validation from a clean rebuild. **Passed:** the independent M0 acceptance rerun verified Lean 4.32.2, the mathlib pin, the default build (`2788 jobs`) and direct audit; see the [review evidence](ConstructionReport.md#m0-design-acceptance-2026-09-23). This used cached dependencies, not a clean mathlib rebuild.
2. Inspect the complete target quantifiers and public definitions, the three existing E-B contracts and their source adaptations, and the actual import/axiom graph. The original-definition semantics pass the migration audit. M1 originally supplied the two-direction characterization; current scope retains the locally proved represented-law membership direction and retires its unused converse. No core axiom or unfinished proof may enter the verified closure.
3. **Passed:** the \(q=1\) lemmas, single-gamma and empty-sum membership cases, and actual power-pushforward identity for \(\delta_a\) are proved. `GGC/Laplace.lean` supplies `laplace_integrable` for every \(s\ge0\), `laplace_zero` and `laplace_pos` for every \(s\ge0\), for arbitrary `NonnegLaw` without moment assumptions. The separate positive-constant membership obligation has now also passed M1 review, with its E-B3 dependency disclosed.
4. Implement and validate Section 2.1's original definition and Section 4.1's ownership changes, preserving the full target quantifiers and checking changed membership semantics explicitly. Update Lake module coverage and audit imports together. This migration is complete; the former characterization passed M1 review before its unused converse was retired by E2-P. No unfinished final theorem is introduced.

M0–M7 are accepted within the registered trust boundary.
E1 and E2 are also accepted; review evidence is recorded in Sections 14 and 17. Earlier milestones need not
be reconstructed to supply this adapter; changes to their contracts would
require fresh review of the affected proofs.

## 7. Risks and next delivery

| Risk | Required response |
|---|---|
| Unverified mathlib APIs or duplicated foundations | Apply the module reuse gate before fixing interfaces and at focused re-search triggers. Search synonyms and general structures, inspect candidate types/call sites, and compile an actual use. Share adapters and API evidence. Record specific gaps; do not invent imports, claim absence after one search, or strengthen the main theorem's hypotheses. |
| Probability-valued measurability and common null sets | Follow the common-event construction in the [measurable realizations appendix](../manuscript/sections/07-measurable-realizations.tex) for quantiles, stick-breaking, and the Palm kernel. Do not intersect uncountably many parameter-dependent full-measure events. |
| Default integral values hiding divergence | Prove absolute integrability before splitting, substitution, Fubini, or differentiation. In particular audit \(K\), signed Palm, and the product term at the zero Laplace endpoint. |
| Discontinuous boundary phases | Use boundedness, a.e. uniqueness, and weak-star convergence against \(L^1\) kernels. Do not depend on pointwise phase continuity. |
| Mistaking tangent positivity for existence | M5 must construct an actual probability-kernel iteration, a probability limit, and the exact weak equation. A positive-minimum-property placeholder is insufficient. |
| Unproved extension of test domains | Do not insert resolvent or logarithmic tests directly into the original \(C_c^2\) equation. Verify cutoff limits and space-time domination separately. |
| A theorem covering only restricted inputs | Audit every parameter of `ggc_rpow`; remove shape, mass, support, drift, or moment restrictions belonging only to intermediate construction. Check \(q=1\), \(\delta_0\), and positive drift. |
| A mismatch with the written proof | Locate the issue by WIP ID and manuscript label; repair the proof or contract and update status. Do not absorb a mathematical gap into an external axiom. |

**Current handoff:** E2 is closed with no blocking findings; E-B1/E-B3 are locally proved at their complete original scope. D1 and S1-SOURCE are closed; RV-1 remains withdrawn. E2-P removes E-B2 and its unused auxiliary interfaces. E3.0–3 are now accepted: the remaining trust boundary is exactly J2/T1/S1. Section 23 records current acceptance; Section 19.5 retains the separate follow-on feasibility plans. Future code changes should preserve the current definition/proof separation and scope and receive checks appropriate to that change.

For each completed module, record the actual file, Lean declaration, precise WIP/manuscript source, verification command, and external-dependency status in [ConstructionReport.md](ConstructionReport.md). The designer updates this blueprint's accepted status and contracts after review. Retain the proposed label for nonexistent files. Completion evidence must be the main theorem's actual type, a dependency tree without core gaps, and a reproducible build, rather than this blueprint itself.

<a id="design-review-2026-09-23"></a>
## 8. Design review and engineering acceptance — 2026-09-23

Scope: compare this blueprint with the existing scaffold, external inventory, manuscript and written proof ledgers; revise design contracts and run the existing acceptance commands. No Lean implementation, external axiom, toolchain pin or manuscript was changed. This was not a new primary-literature audit or a proof of the planned Lean nodes.

| Review ID | Finding and consequence | Design resolution and remaining acceptance |
|---|---|---|
| R1 — high | C previously allowed arbitrary \(h>0\) while requiring \(p\ge1/2\). The source requires small steps. For \(F=\delta_y\), \(k(y,v)=1_{v>0}\) a.e.; at \(h=4\), \(p=1-4/(e^2-1)<1/2\). | Restrict \(h=T/N\le1/16\) and expose the uniform truncation estimate. M5 must still prove this contract. |
| R2 — high | The power-derivative-to-\(s\)-derivative bridge was implicit, and the zero-endpoint wording did not identify \(h\) as the function needing absolute space-time integrability. The missing distinction could leave time--Laplace Fubini unjustified. | A now exports the bridge; D lists \(h\)'s three terms, its \(L^1\) bound including the product term, and the pointwise endpoint limit with time domination. M2/M6 remain planned. |
| R3 — medium | Laplace uniqueness and gamma/beta analytic dependencies had no explicit module owner; the graph omitted the Dirichlet input used by value-law logarithmic moments. | Add planned primitive Laplace, gamma-analysis and shared-semantics modules, and the missing dependency edges. Also expose C's uniform compact-test bound. These are contracts, not new proved lemmas. |
| R4 — medium | M0 required all deferred external semantics, while M2 and its prerequisite semantic module were scheduled only afterward. The module tree did not assign that shared foundation, and M0's remaining checks were unspecified. | Assign shared semantics and deferred contracts to M2's initial gate, list M0's remaining checks, and allow independent work once the public interfaces are frozen. No actual import cycle was found in the existing scaffold. |
| R5 — medium | Generic `lake` commands did not replay in this review environment: the elan shim reported `couldn't find value of ELAN_HOME`. Earlier evidence did not record the actual executable path. | The pinned toolchain's executable passed version/build/audit. Record the exact invocation and cached-build limit in the README; no environment or code change was made. |

Acceptance verdict: the existing statement/scaffold and its documented axiom boundary pass the checks run in this review. **M0 remains `in_progress`; M1--M7 remain `planned`; the main theorem is not accepted as implemented or proved.** No scope conflict was found for noninteger powers, \(q=1\), drift, infinite Thorin mass, nonatomic inputs or degenerate laws. The contract corrections above do not by themselves change the written argument's research status.

Subsequent design decision on the same date: the user approved storing proof details separately while retaining complete definitions in `main.lean`. Section 4.1 records that approved migration and supersedes the former plan to assemble the proof in `main`. The review/build evidence above predates the migration; no file movement or new proof verification is claimed by this design update.

Further approved decision on the same date: use the original finite-gamma weak-limit definition of `IsGGC` in `main`; move Thorin representability to a separate characterization. Section 2.1 records proof-first implementation and the authorized E-B4 literature fallback if the work is substantial. The previous acceptance record concerns the old representation-based scaffold only. Neither the semantic migration nor a characterization proof/axiom has been implemented by this documentation update.

<a id="migration-acceptance-2026-09-23"></a>
## 9. Original-definition migration acceptance — 2026-09-23

This implementation follows the approved Sections 2.1 and 4.1 design and
supersedes their earlier "not implemented" status descriptions. It does not
change the historical design-review results in Section 8.

- `main.lean` now contains actual normalized gamma laws, finite-product/sum
  laws, finite-gamma membership, sequential weak-limit `IsGGC`, powers and
  the full target. It imports mathlib only and has no auxiliary theorem.
- `GGC.Basic`, `GGC.FiniteGamma`, `GGC.Laplace` and `GGC.Thorin` own the
  separated helpers and analytic definitions. The former constant-law
  membership proof is correctly renamed `hasThorinRepresentation_diracLaw`;
  it is not silently reused for the new definition.
- The empty-sum and single-gamma identities and original-definition membership
  are proved, as are the exponent-one case, constant-law power pushforward
  and fixed-power preservation of weak convergence.
- The default Lake build includes all new modules and `AxiomAudit`. Running
  the pinned Lake executable's `build` command from `formalization` succeeded
  with exit code 0 (`2781 jobs`, using cached mathlib dependencies).
  The audit prints both predicates and their definitions. Every audited local
  lemma and the target definition depend only on `propext`, `Classical.choice`
  and `Quot.sound`; the three separately inspected external axioms are unchanged.
- No new axiom, `sorry` or unfinished final theorem was introduced. The target
  is still an unproved proposition. M0 remains `in_progress`; the separate
  characterization, general weak closure, positive-constant membership and
  final power proof remain open. No E-B4 fallback has been selected merely
  to perform this definition migration.

<a id="m0-design-acceptance-2026-09-23"></a>
## 10. M0 design acceptance — 2026-09-23

**Verdict: M0 accepted as `verified`, with no blocking finding.** This review
checked the implementation against all four Section 6 gates and independently
reran the pinned version, default build and direct axiom audit. The actual
commands, exit statuses and declaration-level evidence are in the
[design acceptance record](ConstructionReport.md#m0-design-acceptance-2026-09-23).
The build passed with `2788 jobs` using cached dependencies; it was not a clean
rebuild of mathlib. All audited local results use only
`propext`, `Classical.choice` and `Quot.sound`. The three registered Bondesson
assumptions are unchanged and are separately reported as assumptions.

The acceptance includes the original finite-product/sum and weak-limit
semantics, complete target quantifiers, statement/helper separation, endpoint
sanity cases, and moment-free Laplace integrability, normalization and
positivity. No Lean proof, external contract, dependency pin or main statement
was changed during this review. The existing source-adaptation records were
checked; this was not a new primary-literature verification.

M1 remains `in_progress`: its scalar/finite-gamma transforms, local weak closure
and conditional reduction also passed review, but the Thorin characterization,
remaining measure/integrability adapters and positive-constant membership are
unfinished. The finite-input power-closure premise is still explicit and
unproved. M2–M7 remain `planned`; `GGC.ggc_rpow` does not exist. Sections 8–9
retain their historical verdicts and are superseded by this acceptance for
current status.

<a id="m1-design-acceptance-2026-09-23"></a>
## 11. M1 design acceptance — 2026-09-23

**Verdict: M1 accepted as `verified` relative to the registered literature
axioms, with no blocking finding.** The full Section 2.1 and M1 contracts were
checked against the actual definitions, proofs, theorem signatures and
transitive axiom reports. The independent current-tree build passed with
`2831 jobs`, and the direct audit passed after the build. Dependencies were
cached; this was not a clean rebuild of mathlib. Commands, scope and the
reviewed snapshot differences are recorded in the
[independent acceptance report](ConstructionReport.md#m1-design-acceptance-2026-09-23).

Accepted results include Laplace uniqueness without moments, parameter and
endpoint admissibility, actual finite-atomic Thorin data, the full
`isGGC_iff_hasThorinRepresentation`, nonnegative-constant original membership,
unique realization, local original-GGC weak closure and the conditional
finite-input reduction. With standard logical axioms understood, the
characterization uses exactly E-B2/E-B3, constant membership uses E-B3, and
realization uses E-B1. The analytic adapters, weak closure and reduction use
no external mathematical axioms. No E-B4, `sorryAx` or unregistered axiom was
introduced. The existing three primitive external types are unchanged.

The current `ProbabilityMeasure.pi` wrapper is definitionally the same
finite product measure used at M0; the sum-pushforward certificate still
holds by `rfl`. The original GGC definition, full target scope and statement/
proof separation are preserved. No Lean source was changed by this review.

M0 remains accepted; M2–M7 remain `planned`. Initial normalized log-rate data,
parameterized random-measure constructions, evolution and identification,
finite-input power closure and `GGC.ggc_rpow` are not completed by M1. The
conditional reduction retains its finite-input premise. This verdict
supersedes Section 10's M1 status, not its historical verification record.

<a id="final-design-acceptance-2026-09-24"></a>
## 12. M2–M7 design acceptance — 2026-09-24

Historical verdict: Section 13 withdraws RV-1 at the user's request and closes M7. The independent verification evidence below remains valid.

**Verdict: M2–M6 accepted as `verified` relative to their registered inputs;
`GGC.ggc_rpow` accepted at full law scope; M7 delivery remains `in_progress`
for RV-1.** The constructor's Section 25 completion claim is superseded by
this distinction. No mathematical defect was found in the reviewed core chain.

Review followed the public definitions, actual generator and posterior
semantics, common-event quantifiers, Euler construction, limiting weak
equation, endpoint integrability, transport uniqueness and final reduction.
In particular, `WeakLogRateSolution` is inhabited by a constructed curve;
`valueAt_eq_powerLaw` identifies measures; and `ggc_rpow` has no extra
existence, finite-mass, finite-support, drift or moment premise. The empty
gamma sum and `q = 1` are handled explicitly before the general weak limit.

Independent verification at source commit
`e2edc76e360e098e8ffaabbff61111b7e94138cc` passed: project-only clean, default
build (3939 jobs; 136/136 fresh project modules), direct `AxiomAudit` (883/883
matching checks), and a separate print/type/dependency check of the final
proof. The import graph is acyclic. The external files' local dependency
closure consists only of `RandomMeasure`, `Posterior` and `StickBreaking`.
No core axiom, unfinished proof or unregistered transitive axiom was found.
Commands and logs are in the
[independent report](ConstructionReport.md#final-design-acceptance-2026-09-24).

The final theorem uses exactly E-B1, E-B3, E-J1, E-J2, E-J3, E-T1 and E-S1,
plus the three standard logical axioms. M5 existence uses E-S1 beyond
standard logic; the generic transport-uniqueness theorem uses standard logic
only. All eight registered mathematical axioms occur in the wider audit,
including E-B2 for the separate characterization. This review checks their
stated scope and local adapters against the registered inventory; it does
not supply Lean proofs of them or claim a new primary-text literature audit.

**RV-1 (historical finding; withdrawn by Section 13):** `GGC/PowerClosure.lean` ends after
the law theorem and contains no random-variable corollary. Sections 2, 4.1
and 4.2 already require it. The exact next-step contract is in Section 7:
derive the law of the power of the same measurable random variable on an
arbitrary probability space, with no added mathematical restrictions. Add
its audit and passing build evidence, then resubmit M7 for closure. The
missing wrapper does not invalidate the accepted law theorem.

The reuse gate is accepted for the submitted production proofs at the
pinned revision; the shared API index records scope and retained gaps.
Search evidence is scoped, not a claim that every possible mathlib reuse
has been exhausted. No Lean construction source, pin or external contract
was changed by this design review.

<a id="entrypoint-design-2026-09-24"></a>
## 13. User scope correction and E1 entry-point design — 2026-09-24

The user accepts the current distribution version and explicitly removes the
random-variable corollary from the required deliverables. RV-1 is withdrawn,
not proved; M7 is accepted as `verified` relative to the same seven literature
axioms on the strength of Section 12's completed independent verification.

The new request is E1 (`planned`). Recommend `GGC/Definitions.lean` for the
current definition file; the new `main.lean` will contain the unique public
theorem with explicit approximation, finite-input closure, power-map convergence
and weak-closure steps. Detailed proofs stay in `GGC/PowerClosure.lean` and its
dependencies. Section 4.1 supersedes all earlier main-file ownership rules.

This update changes documentation only. It does not claim that the rename,
proof reorganization or a fresh migration build/audit has already occurred.

<a id="e1-design-acceptance-2026-09-24"></a>
## 14. E1 independent design acceptance — 2026-09-24

**Verdict: E1 accepted as `verified`, with no blocking finding.** The actual
root `Definitions.lean` layout and English Lean comments are accepted; the
earlier subdirectory and Chinese-comment recommendations are superseded.
M0–M7 remain accepted relative to the registered inputs; RV-1 stays withdrawn.

At source commit `88b8529a29da851b015d545c2cee3a566b779b7c`, the moved
definition body matches the accepted pre-migration file byte for byte after
newline/trailing-whitespace normalization. The unique public `ggc_rpow` in
`main` visibly extracts finite-gamma approximants, proves `hpowered`,
proves `hpowered_lim` by power-pushforward continuity, and applies original-GGC
weak closure. English comments explain the packaged finite-input construction
and why its moment restrictions are absent from the final target.

The independent project-only clean build passed (3940 jobs; 137/137 fresh
project modules), followed by a direct audit (883/883 matched axiom checks).
Pinned dependency caches were retained. The audit prints the actual proof
body and checks its full type. The import graph is acyclic: `Definitions`
imports only mathlib, `PowerClosure` retains detailed helpers, and only
`AxiomAudit` imports `main`. Lake explicitly includes the root definitions
module. No new core axiom or unfinished proof was found.

The final theorem still uses exactly E-B1, E-B3, E-J1–3, E-T1 and E-S1 plus
`propext`, `Classical.choice`, `Quot.sound`. These literature inputs remain
assumptions. All Lean sources were left unchanged by this review.
Three legacy path comments in `Definitions`, `Thorin` and `WeakClosure`
are recorded as nonblocking D1; they do not change the correct imports or
proofs. Commands, counts and locations are in
[ConstructionReport Section 29](ConstructionReport.md#e1-design-acceptance-2026-09-24).

<a id="e2-bondesson-formalization"></a>
## 15. E2: finite-atomic approximation and Thorin realization — 2026-09-24

**Status: `verified`; independently accepted with no blocking finding.**
E2.0–E2.4 satisfy the following contracts. The constructor implemented the shared
approximation and tightness route; the designer inspected the full proofs and
independently reran the clean build, complete audit and original-type checks.
M0–M7 and E1 remain accepted. API-062–066 are now `accepted` in the jointly
maintained `MathlibAPI.md`; Section 17 and ConstructionReport Section 34 record
the independent evidence. This section records the E2 contract and acceptance
snapshot; Section 18 supersedes only its E-B2 retention, unused characterization
scope and project-wide counts. The proved E-B1/E-B3 contracts remain unchanged.

### 15.1 Deliverables and unchanged mathematical scope

Replace these declarations in `External/Bondesson.lean` by theorems with the
same fully elaborated types and public names:

- E-B3: `GGC.External.Bondesson.finite_atomic_approximation`.
- E-B1: `GGC.External.Bondesson.thorin_realization`.

Both proofs and their new lower-level lemmas must depend only on mathlib and
local proofs with standard logical axioms. Retaining the `GGC.External` names
is a compatibility choice, not a reason to retain them as assumptions. Keep
their source provenance and label them as locally proved after verification.
Do not introduce a replacement axiom, invoke E-B2/E-B4, or assume a law exists
inside the common approximation construction. E2 originally left E-B2 unchanged;
the later E2-P scope cleanup in Section 18 removes it and the unused converse.

Preserve arbitrary `a >= 0`, every positive-rate measure `U` satisfying only
`Integrable (fun b => Real.log (1 + 1 / b.val)) U`, and all `s > 0`.
Allow infinite total Thorin mass, rates approaching zero, nonatomic measures,
zero mass and nonzero drift. No uniform moment hypothesis is permitted.
E-B3 must produce one sequence of actual nonnegative probability laws converging
to the supplied law, with zero-drift finite-atomic transforms and strictly
positive shapes/rates. Empty sums are allowed. E-B1 must construct a probability
law, not a subprobability limit or a formal transform.

### 15.2 Construction stages and preferred common route

| Gate | Deliverable | Acceptance evidence |
|---|---|---|
| E2.0 | Extract the existing axiom-free Thorin definitions/lemmas and generic Laplace tail estimate into an independent lower layer; preserve public names. | Import graph has no cycle; moved proofs have no literature dependency; affected modules compile. |
| E2.1 | Prove tightness of nonnegative laws from a common Laplace lower bound tending to one at zero. | A compiled generic lemma, using the existing tail bound and mathlib tightness criterion; no moments or realized Thorin law assumed. |
| E2.2 | Construct one finite-gamma sequence from `(a,U)`, prove its exact transforms, convergence for every positive parameter, a common lower bound and the target's normalization at zero. | Compiled witnesses and convergence statements at full admissibility scope, including zero cells and the drift branches. |
| E2.3 | Prove E-B3 by the existing Laplace identification theorem; prove E-B1 by a tight subsequence and transform identification. | Both unchanged primitive endpoints compile and their `#print axioms` contain standard logic only. |
| E2.4 | Integrate the theorem wrappers, update consumers/docs, run a clean project build and direct full audit, then submit for independent design acceptance. | Five remaining main-theorem literature axioms; six project-wide; all source modules and all requested audit declarations accounted for. |

The following is the preferred mathematical route. Equivalent routes are
allowed if they preserve the complete contracts and give stronger reuse evidence.

1. **Truncate and round rates upward.** For `m = n + 1`, restrict `U` to
   `K_m = {b : PosReal | 1/m <= b.val and b.val <= m}`. The existing
   `ThorinAdmissible.measure_le_lt_top` proves finite mass of this restriction.
   Push it through `r_m(b) = ceil(m*b.val)/m`, with natural-number ceiling.
   On `K_m`, its range lies in `{j/m | 1 <= j <= m^2}`. Prove measurability,
   `b.val <= r_m(b) < b.val + 1/m`, and eventual inclusion of every fixed
   positive `b` in `K_m`. Express the pushforward as a finite sum of Dirac
   measures. Prove each cell mass finite before taking `toReal`, and discard
   zero-mass cells before constructing `PosReal` shapes; do not assume all
   grid cells have positive mass.
2. **Control the logarithmic kernels on the original measure.** Write
   `J(s) = integral log(1+s/b) dU` and `J_m(s)` for the rounded finite sum.
   For each fixed `s > 0`, the cut-off rounded kernel converges pointwise to
   `log(1+s/b)` and lies between zero and that same integrable function.
   Apply dominated convergence on `U`, without normalizing an infinite
   measure or postulating weak convergence of `U`. Obtain
   `0 <= J_m(s) <= J(s)` and `J_m(s) -> J(s)` for one common grid sequence.
3. **Absorb drift into a finite gamma factor.** For `a > 0`, append the
   shape/rate pair `(m, m/a)` to the finite convolution. Its Laplace exponent
   is `m*log(1+a*s/m)`, which lies in `[0,a*s]` and tends to `a*s`.
   Use the elementary logarithm limit and `laplace_finiteGammaLaw`; no new
   Gamma moment or Gamma addition theorem is needed. For `a = 0`, append
   nothing. With zero `U` and zero drift, use the empty convolution.
4. **Obtain a common Laplace lower bound.** Set
   `L(s) = exp(-a*s-J(s))`. The constructed laws `mu_m` satisfy
   `L(s) <= laplace mu_m s <= 1` and `laplace mu_m s -> L(s)` for every
   `s > 0`. Prove `L(s) -> 1` as `s -> 0+` directly from admissibility:
   for `0 <= s <= 1`, the logarithmic kernel is dominated by
   `log(1+1/b)`, and the drift term tends to zero. This step cannot invoke
   E-B1's as-yet-unconstructed realizing law.
5. **Prove tightness without moments.** Reuse the existing generic estimate
   `mu((exp r,infinity)) <= 2*(1-laplace mu (exp(-r)))` from
   `Identification/ValueTails.lean`, after extracting it below the external
   inputs. The common lower bound makes the right side uniformly at most
   `2*(1-L(exp(-r)))`, tending to zero. Together with nonnegative support,
   compact intervals and mathlib's tightness criterion, this proves tightness
   of the entire sequence. Pointwise Laplace convergence alone must not be
   passed to an API that still requires a tightness argument.
6. **Assemble the two endpoints.** For E-B3, the supplied target law has
   transform `L`; apply `nonnegLaw_tendsto_of_laplace_tendsto` to the actual
   finite-gamma sequence and the tightness proof. For E-B1, apply Prokhorov
   compactness to extract a probability limit; reuse
   `nonnegative_of_narrow_limit` and `tendsto_laplace_of_narrow` to identify
   its support and transform. One extracted subsequence works for every
   parameter because it converges as measures. Local Laplace uniqueness
   continues to supply the existing unique-realization adapter.

### 15.3 Module ownership and import contract

The following implemented ownership is accepted. Construction split the planned
approximation file into seven focused modules; this preserves the contract and
introduces no extra assumptions. Existing public names and moved proof bodies
are retained. All ten new modules are built and covered by the central audit.

| Module | Ownership and permitted dependencies |
|---|---|
| `GGC/Thorin/Basic.lean` | Move `ThorinAdmissible`, endpoint equivalence, `ThorinData`, `thorinLaplace`, `HasThorinRepresentation` and finite-atomic certificates here. Depend on `Definitions`, `Laplace`, `FiniteGamma` and mathlib only; no `External` import. |
| `GGC/LaplaceTightness.lean` | Generic extracted tail bound and the common-lower-bound tightness lemma. Use `LaplaceContinuity`, the independent `Foundations.TailMoments` layer and mathlib; never import `Identification`. Existing `ValueTails` consumes this layer. |
| `GGC/Thorin/Approximation.lean` | Rounded positive rates, truncation windows, measurable kernels, domination and pointwise/integral convergence on the original Thorin measure. |
| `GGC/Thorin/GridMeasure.lean`, `GridMeasureMap.lean` | Finite measurable cells, finite cell masses, exact finite-sum integrals and the explicit rounded pushforward/Dirac-sum identity. |
| `GGC/Thorin/FiniteWeights.lean` | Filter zero weights and construct actual finite gamma laws with positive shapes/rates and a transform formula for every parameter. |
| `GGC/Thorin/Drift.lean`, `Normalization.lean` | Gamma drift exponent bounds/limit and direct zero-endpoint normalization from admissibility. |
| `GGC/Thorin/Sequence.lean` | One common actual finite-gamma sequence, exact transforms, common lower bound and convergence for all nonnegative parameters. These modules use only independent lower layers. |
| `GGC/Thorin/Realization.lean` | Tightness-based E-B1/E-B3 core endpoints and their measure/transform adapters, using `Sequence` and the independent Laplace tools. |
| `External/Bondesson.lean` | E-B1/E-B3 are same-type theorem wrappers over the independent proofs. E-B2 was retained at E2 acceptance and removed by the later E2-P cleanup. This is an explicit exception to the old mathlib-only import rule for this compatibility module. |
| `GGC/Thorin.lean` | Keep the existing facade: import the new lower layer and `External.Bondesson`, retain the represented-law membership and realization adapters. E2-P retires the unused converse/equivalence. The facade must not be imported by the E2 proof layer. |

All new proof modules must have no transitive import of `External`, the
`GGC.Thorin` facade, `Identification`, `PowerClosure` or `main`. In particular,
do not import `ValueTails` merely to reuse its generic estimate: its current
module imports realized value-law results. Moving the generic proof down is
necessary to prevent circular imports and keep the new endpoints independent.
`Definitions.lean` remains mathlib-only; `main.lean` retains the readable
four-step theorem. Update its dependency comment only after the new audit passes.

### 15.4 Evidence and acceptance

API-062–066 now record compiled production use and independent acceptance.
The first feasibility pass covered E2.1 and the rounded kernel, followed by the
full construction. The earlier 1–2-hour trial and 8–24-hour overall estimates
were planning figures; they are not measured implementation times. Fresh
verification commands, measured build time and exact dependency sets appear in
[ConstructionReport Section 34](ConstructionReport.md#e2-design-acceptance-2026-09-24).

Acceptance requires all of the following:

- Compare the complete elaborated E-B1/E-B3 types with the accepted primitive
  contracts; check the quantifier order (one sequence, all `s > 0`), all
  measure/integrability hypotheses and strictly positive finite shapes/rates.
- Audit every new public core lemma and both compatibility endpoints: only
  a subset of `propext`, `Classical.choice`, `Quot.sound` is allowed. In
  particular, neither endpoint may depend on the other as an axiom or on
  any remaining literature input. Existing `existsUnique_law_thorinLaplace`,
  `HasThorinRepresentation.isGGC` and `isGGC_diracLaw` must become free of
  literature axioms; the full characterization may retain E-B2 only.
- Keep the eight source/interface IDs as provenance, but reduce the actual
  project `axiom` declarations from eight to six. `#print axioms GGC.ggc_rpow`
  must contain exactly E-J1, E-J2, E-J3, E-T1 and E-S1 beyond standard logic.
  E-B2 stays absent. Check names, not just counts; no `sorryAx`,
  `Lean.ofReduceBool` or unregistered replacement is accepted.
- Review zero measure/zero drift, positive drift with zero measure, vanishing
  grid cells and arbitrary admissible infinite mass through the generic
  proofs. Do not discharge only concrete examples or finite-mass variants.
- On the pinned toolchain, run project-only clean, default build and direct
  `AxiomAudit.lean` in that order, using `LEAN_NUM_THREADS=2` on this machine.
  Retain dependency caches and record actual counts for the revised layout;
  137 modules/883 checks are the previous baseline, not required new totals.
- Update current README, external inventory, main/source comments and API
  status only to match the verified result. Preserve dated historical audit
  evidence, and submit the construction report for independent acceptance.

<a id="semantic-audit-followup"></a>
## 16. Independent semantic-audit follow-up — 2026-09-24

The [independent report](SemanticAudit-2026-09-24.md) remains auditor-owned and
unchanged. This design response distinguishes its two follow-up items:

- **D1, source-path comments: corrected.** `Definitions` now locates
  `ggc_rpow` in `main.lean`; `Thorin` and `WeakClosure` locate the original
  definition in `Definitions`. These are comment-only changes and also close
  the three-path observation in Section 14.
- **S1-SOURCE: independently verified and closed.** The constructor submitted
  [the source comparison](SSVSourceCheck-2026-09-24.md); the designer freshly
  rendered and inspected the same local [2010 first-edition PDF](../literature/pdf/SSV.pdf).
  Title/copyright pages establish the edition; printed pp.11, 58–60 and 63 map
  to PDF pp.24, 71–73 and 76. The real and complex contracts, principal branch,
  anchor at one, integrability, uniqueness and first-edition errata all pass.
  Source identity, hashes and adaptations are recorded in Section 17 and
  ConstructionReport Section 34. This closes the historical access/review gap
  without changing the auditor-owned report. E-S1 remains an axiom; this source
  review is separate from E2. `literature/pdf` remains a directory junction to
  the local reference library.

**Ownership confirmed by the user:** the constructor owns S1-SOURCE's material
preparation and self-check: verify the title/copyright page, identify the 2010
first edition, map printed pages to PDF pages, compare the full theorem
hypotheses/conclusions and the principal-log/anchor/errata adaptations, and
submit the file path or hash and precise page references in the construction
report. The designer or independent auditor owns independent verification and
the closure decision. The auditor alone maintains the independent report;
the designer records acceptance in this blueprint. Finding the PDF does not
authorize either role to mark the mathematical/source check passed without
the corresponding evidence.

The designer's response and validation are recorded in
[ConstructionReport Section 30](ConstructionReport.md#e2-design-2026-09-24);
the local-file inventory and confirmed assignment are recorded in
[Section 31](ConstructionReport.md#source-review-ownership-2026-09-24).
The completed preparation is in Section 32 and `SSVSourceCheck`; independent
closure is in [Section 34](ConstructionReport.md#e2-design-acceptance-2026-09-24).

<a id="e2-design-acceptance-2026-09-24"></a>
## 17. E2 and S1-SOURCE independent acceptance — 2026-09-24

Historical E2 snapshot: Section 18 subsequently removes E-B2 and its unused
characterization interfaces; the verification evidence below is preserved.

**Verdict: E2.0–E2.4 accepted as `verified`; S1-SOURCE closed. No blocking
finding remains in this submission.** The original distribution-only scope
and RV-1 withdrawal remain unchanged. E-B1/E-B3 keep their public names and
complete primitive types; an independent Lean probe using the original
committed declarations confirms compatibility. The GGC definitions, main
proof code and extracted Thorin foundation are unchanged modulo comments
and whitespace.

The inspected construction handles arbitrary admissible Thorin measures,
including infinite total mass, zero cells, zero measure and positive drift.
It selects one actual finite-gamma sequence before quantifying over parameters.
Tightness follows from a common Laplace lower bound and direct normalization;
realization extracts a probability limit without assuming its existence.
The graph of 147 project modules is acyclic. The ten new modules have a
16-module local dependency closure without External, the Thorin facade,
Identification, PowerClosure or main.

On the pinned Lean 4.32.2/mathlib revision, the independent project-only clean
build passed **3950 jobs**, freshly compiling **147/147 project modules**.
The subsequent direct audit matched **957/957** requested declarations by
name, including all 74 added checks; the separate original-type probe passed.
There were no compiler warnings/errors, unfinished proofs or extra trust
axioms. Dependency caches were retained. Full commands, logs and the measured
13 minute 17 second build are in
[ConstructionReport Section 34](ConstructionReport.md#e2-design-acceptance-2026-09-24).

E-B1/E-B3, all new core declarations, unique realization, reverse
characterization and constant-law membership use standard logic only.
The full characterization retains E-B2 alone. The main theorem uses exactly
E-J1, E-J2, E-J3, E-T1 and E-S1 beyond standard logic; the project has six
actual mathematical axioms. The remaining five main inputs are still
assumptions, not formalized by E2.

S1-SOURCE passed a separate independent visual review of the specified
2010 pages and 2022-12-01 errata, including all local adaptations to E-S1.
This closes the original-page review issue and does not turn E-S1 into a
Lean theorem. The auditor-owned report remains byte-for-byte unchanged.
Current README/API/source comments are synchronized; dated construction and
acceptance snapshots are retained as history.

<a id="unused-axiom-cleanup"></a>
## 18. E2-P: remove unused external assumptions — 2026-09-24

**Status: `verified`.** The default incremental build passed 3950 jobs,
rebuilding 72 of 147 project modules; the subsequent direct audit matched all
954 requests. Both exited 0, with no warnings/errors or unregistered axioms.
This was incremental validation, not a new clean rebuild.
The user requests removal of unused external axioms. Repository-wide Lean
reference search and the accepted E2 audit identify E-B2 as the only remaining
mathematical axiom absent from the main theorem. Its only proof consumer was
`IsGGC.hasThorinRepresentation`, used only to assemble
`isGGC_iff_hasThorinRepresentation`; neither has a production consumer.

Remove all three declarations and their obsolete audit requests. Retain
`HasThorinRepresentation.isGGC`, realization, finite-gamma certificates,
constant-law membership and original-definition weak closure. These continue
to use standard logic only. E-B1/E-B3 retain their proven primitive contracts.
The main theorem and its mathematical hypotheses are unchanged. The complete
characterization is retired from required scope, not proved.

Withdraw the never-declared E-B4 fallback from the active whitelist. Do not
retain removed statements as axioms in an unimported file or behind a parameter.
Keep provenance and dated acceptance records as history. A future local proof
of the converse is permissible, but this cleanup does not schedule it.

The active axiom set is exactly E-J1, E-J2, E-J3, E-T1 and E-S1 in both the
project and main theorem. Audit requests decrease from 957 to 954 by removing
the three retired declarations. The source module count remains 147.
Fresh validation is recorded in
[ConstructionReport Section 35](ConstructionReport.md#unused-axiom-cleanup-2026-09-24).

<a id="e3-james-reduction-plan"></a>
## 19. E3 proposal: shared Gamma-Dirichlet foundation, then James reduction

**Current status:** E3.0-3 are independently accepted (`verified`). API-068-071
record completed local proofs. The full original E-J3 is proved; the bounded
Markov-Krein formula preserves its consumer while the unused general E-J1 is
retired, not claimed fully formalized. The current actual/main axiom set is
J2/T1/S1. API-072-074 retain their separate feasibility status. The accepted
Thorin interface migration is structural and removes no axiom. See
[Section 23](#e3-three-accepted) for the latest evidence and scope limits.

### 19.1 Priorities and expected dependency reductions

| Priority | Deliverable | Dependency outcome and limits |
|---|---|---|
| E3.0-1 | Two-variable Beta-Gamma product identity; finite Gamma vector normalization jointly independent of its total | Shared standard-logic-only foundation. Marginal identities alone do not pass. No axiom reduction yet. |
| E3.2 | Full original E-J3 `beta_atom_posterior` as a same-type theorem | Five actual/main axioms become four: J1, J2, T1, S1. Arbitrary original D, Z and b remain supported. |
| E3.3 | Prove bounded Markov-Krein; replace its only production call; remove the old general E-J1 axiom | Four become three: J2, T1, S1. The general log-integrable E-J1 interface is retired, not claimed fully formalized. |
| Later | E-J2 finite-dimensional size-bias and measure extension; E-T1 Dirichlet-invariant stick recursion | Share E3's foundation, with separate feasibility gates. Do not count anticipated reductions now. |
| Last / separate research | E-S1 half-plane phase representation | Largest analytic adaptation risk. Source review is closed, but its Lean representation theorem remains an axiom. |

E3 is medium to substantial work. Uncertainty is concentrated in the Beta-Gamma
change of variables and the joint finite-dimensional law. Existing Gamma/Beta
densities do not reduce this to a few wrappers. Record actual probe time and
remaining obligations at E3.0 before refining an overall time estimate.
A failed gate calls for a revised proof design, not a new axiom or stronger
main-theorem hypothesis. Bounded J1 follows the same core more directly than
full J2, which additionally needs a joint-measure extension argument.

### 19.2 E3.0-1: the reusable finite-dimensional core

For positive a,b and independent unit-rate Gamma variables X,Y, prove the
actual pushforward identity for `(X/(X+Y), X+Y)` with law
`Beta(a,b) × Gamma(a+b,1)`. Prove almost-sure positivity of the denominator.
Two marginal laws are insufficient: the product law encodes independence.

Reuse `MeasureTheory.prod_withDensity`, Tonelli, shear transformations such as
`measurePreserving_prod_add`, and one-dimensional scaling if convenient.
Generic Jacobian APIs are a fallback; do not first construct a general
n-dimensional simplex transformation. Reuse Gamma/Beta normalization and
beta integral constants with their actual shape/rate conventions.
A Gamma addition law from existing Laplace formulas/uniqueness is useful,
but does not replace the required independence theorem.

For a finite nonnegative shape vector alpha with total B>0, prove the joint
law of `(RandomMeasure.normalize X, sum X)` is
`RandomMeasure.dirichletLaw alpha × Gamma(B,1)`. Include zero coordinates
using `gammaShapeLaw_zero` and existing zero-coordinate lemmas; only total
shape is positive. Use finite-product reindexing, preserving the actual
normalized-Gamma definition of `dirichletLaw`.

Suggested lower-layer owners: new `GGC/Foundations/BetaGamma.lean` and
`GGC/Foundations/GammaDirichlet.lean`. These are proposed names, not compiled APIs.
The common core must not import `External`, upper `GGC.GammaDirichlet`,
`DirichletRealization`, `Palm`, `PowerClosure` or `main`. Keep shared semantic
definitions unchanged and reuse lemmas without copying proofs.

### 19.3 E3.2: retain the complete E-J3 interface

Add an independent shape-one unit-rate Gamma to coordinate j and normalize.
The common core gives `(1-Z)Q + Z e_j` law Dirichlet(alpha+e_j), including
alpha_j=0. For each finite measurable partition, take its unique cell containing
b, use the original `hD` partition law, and apply this update. The exact product
pushforward using the given `hZ` handles arbitrary `ProbabilityMeasure UnitWeight`
with the specified Beta marginal.

Keep the complete type of `External.James.beta_atom_posterior`: the original
Polish/Borel E, arbitrary U/D satisfying `hD`, positive total B, arbitrary Z
satisfying `hZ`, and arbitrary b. Do not specialize to positive rates, positive
cells or the project's sampler. This route needs no DP-law uniqueness theorem
on random measures and no Gamma-process construction.
Suggested owner: `GGC/Foundations/DirichletUpdate.lean`; the External declaration
becomes a thin same-type theorem wrapper over this independent layer.

### 19.4 E3.3: prove the required bounded Markov-Krein formula

**Accepted:** the following contract is implemented; see Section 23. The former
production call described below has been replaced by the local bounded theorem.

Reference search finds one production use of E-J1, in
`GGC.dirichletMean_laplace` in the module `GGC.GammaDirichlet`. It uses only the transform conclusion
with `g(b)=t/(s+b)`, t>=0 and s>0, hence `0<=g(b)<=t/s`. The unbounded
log-integrable extension and its a.s. integrability conclusion are not consumed.

Propose a distinctly named local theorem `markov_krein_of_bounded`: retain
U, D, `IsDirichletProcess U D`, B>0 and the exact mass equation; assume g
measurable, nonnegative and bounded above by a finite constant C. Conclude
`integral (1 + integral g dP)^(-B) dD = exp(-integral log(1+g) dU)`.
Boundedness gives integrability for every probability P and for finite U.
Keep the full public `dirichletMean_laplace` type; discharge the bound in its
proof, not as a new assumption on the main theorem.

First prove the formula for nonnegative simple functions via their finite
fiber partitions and the common Gamma/Dirichlet joint law. Then use
`SimpleFunc.approxOn` with range `Icc 0 C`, `approxOn_mem`, and
`tendsto_approxOn`. These approximations need not be monotone. Apply bounded
DCT under each P with bound C, under D with bound 1, and under U with bound
`log(1+C)`. Prove parameter-integral measurability. Include t=0, C=0 and
zero-mass partition cells. No posterior kernel or random-measure uniqueness
is needed for this extension. Suggested owner: `GGC/Foundations/MarkovKrein.lean`.

Once its consumer and audit compile, delete the old `External.James.markov_krein`
axiom and obsolete full-interface audit. Do not reuse its old name with a
silently narrowed type or label the general interface a same-type proof.
Distinguish the proved bounded specialization from the retired unbounded
statement in the source inventory. A full general theorem is optional future work.
If reusing an axiom-free lemma currently in `GGC.GammaDirichlet`, move it to an
independent lower layer with its name preserved; do not back-import the consumer.

### 19.5 Separate follow-on contracts

- **E-J2:** prove the finite Dirichlet size-bias identity, including zero selected
  shape, then equality of two joint measures on partition evaluation cylinders
  and extension through a generating pi system. Reuse Giry evaluation
  measurability, `ext_of_generate_finite` and `lintegral_compProd`. Preserve
  arbitrary measurable posterior K and every nonnegative ENNReal test. J3
  identifies a posterior law; it does not itself prove Palm.
- **E-T1:** prove weighted Dirichlet coordinate-update invariance, then attach
  an independent Dirichlet tail to each finite stick prefix. Existing `hSum`
  and probability status yield total stick mass one;
  `hasSum_stickWeight_iff` gives residual convergence. The prefix/tail error is
  bounded by that residual. Preserve arbitrary measurable E/Omega; use topology
  only on finite-dimensional vectors. Do not assume E Polish or re-prove the
  stronger common-parameter event already supplied by `CommonUniforms`.
- **E-S1:** Poisson boundary recovery is downstream, not a proof of initial
  phase representation. Investigate half-plane harmonic representation,
  support/bounded density, principal-log branch, anchor-one integrability and
  uniqueness from the real formula. Mathlib's disk Poisson formula and
  `WeakDual.isSeqCompact_closedBall` are candidates, not the target theorem.
  Do not infer absence of sequential compactness from an old weak-dual TODO.

### 19.6 Construction and acceptance gates

1. E3.0 must compile the complete two-variable product-law identity and audit
   it to standard logic only. A `#check`, density normalization or two separate
   marginals does not pass the feasibility gate.
2. E3.1 must compile the general finite-vector joint law including zero
   coordinates. E3.2 then proves the exact original J3 type, including an atom
   added to a zero-mass cell in the generic proof.
3. E3.3 preserves the consumer's complete type, proves its test bound locally,
   and removes the unused general J1 declaration. Audit the finite-simple-function
   argument, bounded DCT extension and retained consumers.
4. New core theorems may use no remaining literature axiom. The original E3
   design temporarily allowed a same-type James wrapper over the independent
   proof. The user-approved lifecycle rule now requires proved wrappers to move
   out of External; Section 24 records the completed E-J3 migration. Audit
   the actual graph and all new public declarations, with no lower-layer path
   back to External or consumers.
5. Each submitted reduction needs the pinned project clean build and direct
   full audit, matched requested names and actual axiom declarations. After J3:
   J1/J2/T1/S1. After bounded J1 retirement: J2/T1/S1. Do not claim the latter
   if only J3 is complete.
6. Maintain construction reports and the shared API table. Only independent
   design acceptance changes planned stages to `verified`. Preserve the full
   main theorem, original definitions, English Lean comments and accepted E2
   proofs. Source-inspected candidates need actual compiled use before the
   evidence level becomes `minimal_use_compiled`.

<a id="e3-zero-construction-handoff"></a>
## 20. E3.0 construction handoff: the two-variable Beta-Gamma joint law

**Status: `verified`, independently accepted on 2026-09-24.** The constructor
completed the exact contract and BG-0-4 below. [Section 20.5](#e3-zero-accepted)
records the independent evidence. This acceptance does not remove any of the
five literature axioms or complete E3.1-3. The original proof route and acceptance
requirements are retained as the contract for this implementation.

### 20.1 Required public contract and ownership

Implemented owner: `GGC/Foundations/BetaGamma.lean`. Accepted public name:
`GGC.BetaGamma.gamma_ratio_sum_map`. The production theorem proves the
following complete type; its separate contract check also compiles:

```lean
theorem gamma_ratio_sum_map
    (a b : ℝ) (ha : 0 < a) (hb : 0 < b) :
    Measure.map
      (fun p : ℝ × ℝ => (p.1 / (p.1 + p.2), p.1 + p.2))
      ((ProbabilityTheory.gammaMeasure a 1).prod
        (ProbabilityTheory.gammaMeasure b 1)) =
      (ProbabilityTheory.betaMeasure a b).prod
        (ProbabilityTheory.gammaMeasure (a + b) 1)
```

Use the actual mathlib measures. Shapes are arbitrary positive real numbers,
including shapes below one; the second Gamma argument is **rate**, fixed at
one. The product on the right is essential: it states joint independence.
Do not replace it by two marginal results or a Gamma addition law. There is
no moment, integer-shape, compact-support or shape-at-least-one assumption.

The lower layer should import mathlib and, if needed, independent shared
semantics such as `Foundations.RandomMeasure`. It must satisfy Section 19.2's
import exclusions. Preserve all existing semantic definitions and endpoints.
No James consumer or axiom declaration needs to change at this stage.

### 20.2 Proof cards and the concrete transformation

Write `T(x,y) = (x/(x+y), x+y)`. Use the open source and target domains

```text
Q = Ioi 0 ×ˢ Ioi 0
R = Ioo 0 1 ×ˢ Ioi 0
Ψ(u,s) = (s*u, s*(1-u))
```

On these domains, T and Ψ are inverses and the absolute Jacobian of Ψ is s.
The selected route obtains this factor by a one-dimensional scaling; it does
not require a separate two-dimensional derivative/determinant development.

| Card | Required result | Reuse and evidence boundary |
|---|---|---|
| BG-0: semantics | Elaborate the complete contract and prove measurability of T. | `measurable_ratio_sum` and the complete public theorem compile; `Checks/E3BetaGammaContract.lean` checks the primitive type. |
| BG-1: support | Prove the input product is concentrated on Q, hence `0 < x+y` a.e.; prove T maps Q to R, and the two inverse identities there. | Reuse Gamma absolute continuity/density support and, where useful, `gammaShapeLaw_nonneg/pos` through the positive-shape adapter. Completed by `gamma_ae_pos`, `gamma_prod_ae_pos`, the three geometry lemmas and the open-density identities. |
| BG-2: density algebra | Prove the factorization below on R for all positive a,b. | `normalizing_constant` and `density_factorization` prove the full identity, reusing the existing Beta definition and real-power APIs. |
| BG-3: change of variables | Prove equality of integrals against every measurable test `Φ : ℝ × ℝ → ℝ≥0∞`, with the actual densities. | `lintegral_interval_scale` and `lintegral_quadrant` complete the shear, support restrictions, Tonelli and scaling arguments. |
| BG-4: joint law | Use `Measure.ext_of_lintegral` or measurable-set extensionality to obtain the exact public equality; register and audit the theorem. | `gamma_ratio_sum_map` completes the assembly via `Measure.ext_of_lintegral`; all 13 new public theorems pass the direct axiom audit. |

For BG-2, the exact density identity on `0<u<1`, `0<s` is

```text
gammaPDF a 1 (s*u) * gammaPDF b 1 (s*(1-u)) * ENNReal.ofReal s
  = betaPDF a b u * gammaPDF (a+b) 1 s.
```

Unfold `ProbabilityTheory.beta`: it is already defined as
`Real.Gamma a * Real.Gamma b / Real.Gamma (a+b)`. Use positivity of these
Gamma values to cancel the constants. Re-proving the complex beta integral
identity is unnecessary. Real-power manipulations use positive bases, with
arbitrary exponents `a-1` and `b-1`; these exponents need not be nonnegative.
Keep the change-of-variables factor `ENNReal.ofReal s` explicit.

For BG-3, use this order:

1. Expand the product Gamma law with `MeasureTheory.prod_withDensity`. Work with
   nonnegative measurable tests, so no extra integrability or moment assumption
   is introduced.
2. Apply the volume-preserving shear `(x,y) ↦ (x,x+y)` and its inverse
   `(x,s) ↦ (x,s-x)`, using `measurePreserving_prod_add` and
   `measurePreserving_prod_sub`. The positive quadrant becomes `0<x<s`.
3. Apply Tonelli to integrate first in x at fixed `s>0`. Use
   `lintegral_image_eq_lintegral_abs_deriv_mul` from
   `Mathlib.MeasureTheory.Function.JacobianOneDim` for `x=s*u`, mapping
   `(0,1)` onto `(0,s)`. The compiled probe accepts an arbitrary nonnegative
   function for this scaling step and introduces precisely the factor s.
4. Substitute BG-2, rearrange the nonnegative integrals into `(u,s)` product
   order, and identify the Beta and Gamma densities. Discharge all
   measurability, restriction and product-measure hypotheses at their actual
   uses; the final result is equality of measures on the whole product space.

Gamma's density is defined using `0 ≤ x`, whereas Beta's uses `0<x<1`.
Consequently, use the factorization on the open support and prove the needed
boundary nullity/concentration before extending it a.e. A global pointwise
factorization is not required and can fail at endpoints. The total Lean map T
is measurable, but is not globally continuous; only use continuity where its
denominator is nonzero. If probability instances are needed, install them from
`isProbabilityMeasure_gammaMeasure` and `isProbabilityMeasureBeta` with the
positive-shape hypotheses; they are not unconditional instances.

The general Jacobian API remains a fallback. Before changing routes, report
the exact unresolved restriction or assembly obligation; a missing convenience
lemma alone does not justify developing a general simplex transformation.

### 20.3 Design evidence and retired probe

The former `Checks/E3BetaGammaReuse.lean` elaborated the primitive contract and
compiled six bounded API calls. It was a designer probe, subsequently superseded
by the full production proof and deleted during the Section 24 closeout.
Its original experiment and commands remain dated history in ConstructionReport
Sections 37–39; the removed file is not current executable evidence.

Current reproducible evidence is [the production proof](GGC/Foundations/BetaGamma.lean),
[the full contract check](Checks/E3BetaGammaContract.lean) and
[AxiomAudit.lean](AxiomAudit.lean). The production proof covers the adopted calls,
full factorization and joint law (API-068). Run the live contract check explicitly
from `formalization` with the pinned toolchain:

```powershell
lake env lean Checks/E3BetaGammaContract.lean
```

This check does not by itself establish a full-project build or completion of
later stages. Section 20.5 retains the original build/audit provenance;
Section 24.5 records acceptance of the probe's retirement.

### 20.4 Construction submission and acceptance

Deliver the new production module, its audit entries, updated API-068 and a
construction report identifying the actual completed cards and any remaining
gap. Keep the tracked probe until its important uses are covered by tracked
production proofs and update its evidence links when retiring duplication.
All new source comments must be in English.

E3.0 passes only when all of the following hold:

- The exact joint-law type above has a compiled proof and an independent
  type-compatibility check. An assumed equality, a structure field requiring
  it, two marginals, or the design probe alone does not pass.
- The support and boundary arguments are proved. No positivity of every
  future finite-vector coordinate, nonnegative density exponent, or additional
  integrability assumption has entered the contract.
- All new public proofs, including the joint law, have transitive axioms
  contained in `{propext, Classical.choice, Quot.sound}`. No literature input,
  `sorryAx`, `Lean.ofReduceBool`, renamed assumption or hidden typeclass premise
  supplies the missing law. The import graph has no path back to External or
  the excluded consumers.
- The submitted production module is covered by the default Lake target.
  Run the pinned project clean build and then the direct complete
  `AxiomAudit.lean`; report the actual module/check counts and match declarations
  by name, rather than reusing the E2-P counts after adding declarations.
- The five existing literature axioms and the main theorem's scope remain
  unchanged at this gate. Only an independent designer acceptance changes
  E3.0 to `verified`.

After acceptance, start E3.1 with explicit zero-shape branches. Existing
`gammaShapeLaw 0` is Dirac zero, not `gammaMeasure 0 1`; never invoke E3.0 with
a zero shape or invent `Beta(a,0)` to close an induction. Include the case
with exactly one positive coordinate (deterministic normalization) and the
positive-total exclusion of the empty vector. Use the completed E3.0 proof
and its measured construction effort to refine the remaining schedule.


<a id="e3-zero-accepted"></a>
### 20.5 Independent acceptance — 2026-09-24

E3.0 is `verified`. The exact measure equality, positive-real-shape scope,
unit rate, joint independence and boundary arguments match this contract.
All 13 public theorems use only standard logical axioms. The local import
closure is exactly `Foundations.BetaGamma` and `Foundations.RandomMeasure`.

The reviewer matched all 148 current production source hashes to the
constructor's pre-clean snapshot and all 148 module names to fresh `Built`
records in the submitted 3951-job clean-build log. The reviewer then ran a new
3951-job default build (incremental), direct audit with **967/967** matched
requests, and the complete primitive-type check; all exited 0. This is an
independent review of the submitted clean build plus fresh incremental/audit
validation, not a second independent clean rebuild. See
[ConstructionReport Section 39](ConstructionReport.md#e3-zero-design-acceptance-2026-09-24).

The five-axiom boundary and main theorem are unchanged. E3.1 may now use this
accepted theorem, retaining the zero-shape branches required by Section 20.4.
No overall agent-time estimate follows from the short module compilation time:
the reported 23-minute construction clean build measures validation only.

<a id="thorin-interface-migration"></a>
## 21. Tidy-Thorin: move locally proved interfaces out of External

**Status: `verified`, independently accepted on 2026-09-25.** E-B1/E-B3 now
live in `GGC/Thorin/Interfaces.lean`, with the required new names and unchanged
primitive types/proof calls. `External/Bondesson.lean` is deleted and all live
callers/audits use the new module. The migration contract below is retained;
Section 21.3 records its acceptance. This structural change removes none of
the five literature axioms and does not complete E3.1.

### 21.1 Exact ownership and naming changes

| Former declaration | Accepted declaration and owner |
|---|---|
| `GGC.External.Bondesson.thorin_realization` | `GGC.thorin_realization` in new `GGC/Thorin/Interfaces.lean` |
| `GGC.External.Bondesson.finite_atomic_approximation` | `GGC.finite_atomic_approximation` in the same file |

Preserve each complete primitive type, binder order and mathematical scope
verbatim, changing only its qualified name. Reuse the same calls to
`GGC.thorin_realization_core` and `GGC.finite_atomic_approximation_core`.
Keep the existing English documentation and precise Bondesson provenance;
E-B1/E-B3 remain historical source labels, not external assumptions.

The new module imports `GGC.Thorin.Realization`. `GGC/Thorin.lean` imports
`GGC.Thorin.Interfaces` instead of `External.Bondesson` and redirects its two
calls. Preserve the full names/types of `HasThorinRepresentation.isGGC`,
`isGGC_diracLaw`, `exists_law_thorinLaplace`, `existsUnique_law_thorinLaplace`
and all higher consumers. The independent lower construction must not import
this interface layer or the upper Thorin facade.

Delete `External/Bondesson.lean` after migrating callers. Do not leave an empty
file, forwarding import or old-namespace aliases elsewhere. This explicitly
supersedes the earlier E2 requirement to retain the old wrapper names and its
Bondesson-specific External import exception. Preserve dated historical records
as history; update current inventories, layout, commands and links. Do not
remove the local proofs, source PDF or provenance merely because the old
module is removed. James wrappers and the other remaining External inputs
are outside this structural change.

### 21.2 Construction and acceptance package

1. Move the two interfaces, update the facade and every actual import/reference,
   and replace their central audit names/import. The existing `GGC.+` glob
   should cover `Thorin.Interfaces`; confirm this in build evidence.
2. Compile a durable same-type check of both new names against the old primitive
   statements. Audit both wrappers, the unchanged cores and the retained
   high-level Thorin endpoints to standard logic only.
3. Verify no production Lean reference remains to `External.Bondesson` or
   `GGC.External.Bondesson`; distinguish preserved historical prose from live
   references. Verify an acyclic import graph and no lower-layer back-edge.
4. Run the pinned project clean build, subsequent complete direct audit and
   explicit type check. Report actual module/check names and counts: a one-for-one
   module/name replacement should not itself add audit requests, but counts
   must be recomputed against the submitted tree.
5. Preserve `Definitions.lean`, `main.lean`, the complete E3.0 proof and all
   unrelated user files, including human-check files. The main theorem still
   uses precisely J1/J2/J3/T1/S1; no new axiom or hypothesis is permitted.
6. Update the shared API index (API-075), construction report and current
   README/External inventory. The designer independently accepts the migration
   before marking it `verified`. E3.1 remains a distinct mathematical delivery.


### 21.3 Independent acceptance — 2026-09-25

The original file and the relocated file are identical after replacing only
the opening/closing namespace. The saved original also matches the previously
accepted E3.0 source hash. Apart from this one-for-one module move, the only
production changes are the specified facade calls/import and audit names/import.
All retained primitive and high-level contracts are preserved; no obsolete
module, alias or production reference remains. The graph is acyclic and the
lower Thorin layer has no path to the interface, facade or External.

The reviewer matched all 148 production hashes and fresh module records to
the submitted 3951-job clean build, then independently reran a default build
(incremental), the full direct audit (**967/967** matching requests) and both
primitive-type checks. All commands exited 0. Both wrappers, both cores and
four retained high-level endpoints audit to standard logic only. The five
main-theorem literature dependencies remain J1/J2/J3/T1/S1. This verifies the
submitted clean-build evidence; it does not claim a second clean rebuild.

See [ConstructionReport Section 42](ConstructionReport.md#tidy-thorin-design-acceptance-2026-09-25).
API-075 is accepted. At this migration acceptance, E3.1 remained planned;
its subsequent acceptance with the zero-shape and positive-total requirements
is recorded in Section 22. No separate independent-auditor
review is implied by this designer acceptance.


<a id="e3-one-two-accepted"></a>
## 22. E3.1/E3.2 independent acceptance — 2026-09-25

**Status: both stages `verified`; no blocking finding.** The existing original
finite-gamma, normalized-vector, partition and atom-mixture definitions are
unchanged. The proofs add no mathematical assumption or final-theorem premise.

| Stage | Accepted production contract |
|---|---|
| E3.1 | `GGC.RandomMeasure.gammaVector_normalize_sum` identifies the actual joint law with `dirichletLaw a` times `gammaShapeLaw (sum a)` for every finite nonnegative shape vector. `gammaVector_normalize_sum_of_pos` gives the exact Gamma(B,1) factor for B>0. Zero shapes, the all-zero extension, the empty vector and a single positive coordinate are handled explicitly. |
| E3.2 | `dirichlet_coordinate_update` allows the selected shape to be zero. `RandomMeasure.beta_atom_posterior` proves the result for every finite partition of arbitrary U/D and every original Z satisfying hZ. `External.James.beta_atom_posterior` retains the complete original type, including Polish/Borel binders, and is now a theorem. |

`GGC/Foundations/GammaDirichlet.lean` inducts through genuine finite product
measures, using the accepted two-variable law only for positive shapes and
Dirac laws on zero-shape faces. Marginals identify the existing Dirichlet law;
no replacement definition supplies independence. `DirichletUpdate.lean` adds
an independent shape-one Gamma at arbitrary j, then uses product pushforwards
and finite partition evaluation to handle the supplied D/Z/b. No DP-law
uniqueness, Gamma-process assumption or sampler restriction enters the proof.

Both new lower-layer closures are independent of External and upper consumers.
The full graph is acyclic. All 25 new declarations and the existing E-J3 wrapper
have only standard logical axioms. The contract check explicitly exercises the
original topology binders, the full joint law and degenerate cases.

The reviewer matched **150/150** current production hashes and module names to
the submitted **3953-job** project clean build, then reran a default build
(incremental), direct audit (**992/992** requests) and complete contract check
(**7/7** endpoint axiom lists). All exited 0. This is verified submitted clean
build evidence plus fresh incremental validation, not a second clean rebuild.
See [ConstructionReport Section 44](ConstructionReport.md#e3-one-two-design-acceptance-2026-09-25).

The actual and main-theorem literature axiom sets both decrease **5 to 4**:
E-J1, E-J2, E-T1 and E-S1. `Definitions.lean` and `main.lean` are unchanged.
Historical five-axiom counts in E2-P/E3.0/Tidy-Thorin records describe those
snapshots; this section supersedes their current-boundary statements.

At the E3.1/E3.2 acceptance, the next stage was E3.3 under Section 19.4;
its subsequent acceptance is recorded in Section 23. The required contract was: Prove a distinctly named bounded Markov-Krein
formula, preserve `GGC.dirichletMean_laplace`, and retire the unused general
E-J1 declaration only after replacing its sole consumer and passing validation.
The unbounded/log-integrable general interface is not already proved by E3.1/2.
At E3.1/E3.2 acceptance, James still contained two actual axioms and retained
the same-type E-J3 wrapper. Section 23 records subsequent J1 retirement;
Section 24 records the subsequent wrapper relocation under the new lifecycle rule.


<a id="e3-three-accepted"></a>
## 23. E3.3 independent acceptance — 2026-09-25

**Status: `verified`; E3.0-3 are complete within their specified scope.**
`GGC.RandomMeasure.markov_krein_of_bounded` is proved for arbitrary measurable
base spaces, U/D with the original finite positive mass B, and measurable
nonnegative g bounded above by a real C. C need not be strictly positive.
The mean is measurable and bounded g is integrable under every probability law.

`Foundations/MarkovKreinFinite.lean` supplies the Gamma-vector transform,
finite-partition formula and simple-function identity using accepted joint
normalization, scalar Gamma Laplace and finite-product integration.
`Foundations/MarkovKrein.lean` uses `SimpleFunc.approxOn` and three dominated
convergence arguments with bounds C, 1 and log(1+C). Zero-shape cells, C=0 and
t=0 are covered; no monotone-approximation or extra moment premise is added.
Both modules have independent lower import closures without External or the
upper consumers.

`GGC.dirichletMean_laplace` retains its complete original type and discharges
`g(b)=t/(s+b) <= t/s` internally. The proof body of
`GGC.tiltedLaw_eq_gammaDirichlet` is unchanged. Both now use standard logic only.
The old `External.James.markov_krein` and obsolete audit request are removed;
E-J2 and the accepted E-J3 theorem are preserved verbatim.

This proves the bounded specialization under a new name. The former general
unbounded/log-integrable interface, including its general a.s. integrability
conclusion, is retired from required scope and is **not claimed proved**.
The main theorem, its hypotheses and original GGC definition are unchanged.

The reviewer matched 152 current source hashes and fresh module records to the
submitted 3955-job project clean build, then reran a default incremental build,
1005/1005 direct audit and complete contract check (7/7 endpoint axiom lists).
All commands exited 0; all 14 new theorems and both consumers (16/16) use standard
logic only. This verifies the submitted clean build plus fresh incremental
checks, not a second clean rebuild. See
[ConstructionReport Section 46](ConstructionReport.md#e3-three-design-acceptance-2026-09-25).

Actual declarations and final-theorem dependencies now contain exactly three
literature axioms: J2 (`posterior_palm_nonneg`), T1 (`stick_breaking`) and
S1 (`phase_representation`). Historical counts in preceding sections describe
those dated snapshots; this section supplies the current boundary.
J2/T1/S1 remain separate follow-on work under Section 19.5, with no completed
proof or new construction acceptance implied by closing E3.


<a id="audit-r2-and-j3-relocation"></a>
## 24. Second-round audit response and E-J3 interface relocation

**Status: `verified`, designer acceptance on 2026-09-25; see Section 24.5.**
The following contract was handed off before construction. The user requests that
annotation corrections be designed here before construction, and requires
formalized external interfaces to leave External. This is a documentation and
structural delivery; E3.0-3 remain mathematically accepted. No new axiom proof
or reduction of the three remaining axioms is claimed.

### 24.1 Independent findings and exact comment correction

The [second-round independent report](SemanticAudit-2026-09-25.md) passes within
its stated semantic/interface review scope relative to J2/T1/S1. At its audited snapshot it recorded one
low-priority issue, **R2-01**, at `main.lean:24-25`: the theorem docstring
listed five literature inputs, including retired E-J1 and locally proved
E-J3. The submitted correction is verified in Section 24.5. This is a comment defect, not a proof defect. The prior proof-location
comment is already corrected, and the auditor independently closes its former
SSV original-page evidence gap. Neither fact means S1 has a Lean proof.

For R2-01, replace the two stale dependency sentences with this English wording:

```text
The proof is relative to three registered literature axioms: E-J2,
E-T1, and E-S1. `AxiomAudit.lean` checks its transitive dependencies.
```

Preserve the surrounding scope description, theorem type, proof body and four
human-readable proof steps. Changing a comment here is explicitly authorized;
previous instructions to keep `main.lean` unchanged do not prohibit this scoped
correction. Scan other current dependency comments/inventories for the same
stale count and reconcile them with the actual audit. Preserve accurately dated
historical counts and retain the distinction between proved and retired inputs.
The design decision alone did not close R2-01. It is now **closed by designer
verification** in Section 24.5 and ConstructionReport Section 49. Both
auditor-owned reports and the independent probe remain unchanged; this is
not a new independent-auditor sign-off.

### 24.2 Mandatory lifecycle and immediate application to E-J3

Apply the [project lifecycle rule](README.md#external-interface-lifecycle).
After local formalization, relocate the public theorem and any compatibility
wrapper to its mathematical project module; do not retain an External alias or
forwarding file. Future deliveries include this relocation in their acceptance
package. Accepted past mathematics is not invalidated by the new organizational
rule; this delivery resolves the remaining E-J3 placement explicitly.

| Existing declaration | Required declaration and owner |
|---|---|
| `GGC.External.James.beta_atom_posterior` in `External/James.lean` | `GGC.beta_atom_posterior` in new `GGC/DirichletPosterior.lean` |
| `GGC.RandomMeasure.beta_atom_posterior` in `Foundations/DirichletUpdate.lean` | Retain unchanged as the stronger measurable-space lower theorem |
| `GGC.External.James.posterior_palm_nonneg` | Retain unchanged in `External/James.lean`; it is still the E-J2 axiom |

Move the wrapper with its complete original primitive type, binder order,
Polish/Borel parameters, source docstring and existing one-line proof call.
The new public name is a deliberate namespace change; the mathematical contract
is not weakened to match the stronger lower theorem's shorter binder list.
Keep any needed linter setting narrowly scoped. The destination imports
`GGC.Foundations.DirichletUpdate` and the required mathlib topology declarations,
not External, the upper GammaDirichlet/DirichletRealization/Palm modules or main.
No second proof of the lower result or new semantic definition is needed.

Remove only the E-J3 wrapper and its obsolete documentation/imports from James.
E-J2 still uses independent `Foundations.Posterior` semantics and its original
Polish/Borel contract; give it the explicit imports it needs without importing
the new wrapper or DirichletUpdate proof merely for transitive access. Do not
delete James while E-J2 remains. The old temporary permission to keep a proved
James wrapper under External is superseded by this contract.

### 24.3 Known callers and coordinated edits

| File | Required change |
|---|---|
| `GGC/GammaDirichlet.lean` | Replace the direct James import with `GGC.DirichletPosterior`; update `posteriorMixture_isDirichlet` to the new public name without changing its type. |
| `GGC/DirichletRealization.lean` | Redirect its direct E-J3 call and import to the new interface; preserve its sampler and other theorem contracts. Keep its still-needed Sethuraman import. |
| `GGC/Palm.lean` | Add an explicit `External.James` import for its genuine E-J2 call. It currently obtains James transitively through GammaDirichlet; do not depend on that disappearing path. Its mathematical proof remains unchanged. |
| `AxiomAudit.lean` | Import/check the new public wrapper and replace the old printed/axiom-audited name. Retain E-J2 and lower-theorem requests. |
| `Checks/E3GammaDirichletContract.lean` | Use the new module/name, including the explicit `@` application checking all original topology binders and the corresponding axiom output. Record the shared check's maintenance reason. |
| Current README/API/External/Checks inventories | Update owner, imports, names, live links and acceptance evidence; preserve Bondesson/James literature provenance and historical reports. |

Search all production sources and shared Checks for further consumers instead
of assuming this list is exhaustive. Auditor-owned temporary probes may retain
old names as snapshot evidence: do not modify them or describe them as current
checks after migration. Supply the updated shared contract check for this
delivery; the independent auditor controls any later update of its own artifact.
Keep the existing human-check file and accepted lower proofs untouched.

### 24.4 Submission and acceptance gates

1. Submit the comment correction and complete relocation together, with a
   change-to-contract map. Confirm that the only main-theorem change is the
   specified docstring: its full type and proof text remain unchanged.
2. Prove exact primitive-type compatibility of the new name, including original
   explicit topology binders. Compare old/new wrapper declarations and proof
   calls after namespace normalization. E-J2's full declaration must be unchanged.
3. Scan production and shared Checks for the old E-J3 name, old wrapper aliases
   and unnecessary proof imports under External. Distinguish preserved audit
   snapshots and historical prose. The new interface and its lower proof closure
   must not reach External or upper consumers; the whole graph remains acyclic.
4. Run the pinned project clean build, subsequent complete direct audit and the
   affected E3GammaDirichlet contract check. Inspect the main and new-wrapper
   dependencies. J2/T1/S1 must remain exactly the main theorem's three literature
   axioms; both posterior theorems remain standard-logic-only. Confirm default
   build coverage of the new module; recompute module/check counts by name.
5. Record R2-01 as corrected in the construction report with comment, type/proof
   comparison and actual dependency evidence. The designer verifies the correction
   and migration before marking this delivery `verified`; this is not an edit
   to the independent auditor's finding or a claim of new auditor sign-off.
6. Preserve source citations, retired E-J1/B2 scope statements, unrelated user
   work and audit-owned artifacts. Update API-076 and current inventories.
   No change to the accepted mathematical scope or further axiom formalization
   belongs to this delivery.

Pre-delivery baseline: 152 production modules and 1005 direct audit requests. A new
wrapper module adds one module; replacing a wrapper name does not itself add an
audit request. These are planning expectations, not substitute build evidence.


### 24.5 Designer acceptance — 2026-09-25

**Verified; no remaining blocking finding.** R2-01 is corrected exactly as
specified, with the full main theorem type, proof text and four readable steps
unchanged. `GGC.beta_atom_posterior` preserves the original wrapper's declaration,
topology binders, source docstring and lower proof call. E-J2 is unchanged.
Callers, explicit imports, the central audit and shared contract check use the
new interface. The old External name and aliases are absent from production
and shared checks. The new lower closure is independent of External and upper
consumers; the complete production graph is acyclic.

The designer verified all **153/153** production hashes and fresh module records
against the submitted **3956-job** project clean build, then independently ran a
default incremental build, the complete direct audit (**1005/1005** requests)
and E3GammaDirichletContract (**7/7** standard-logic-only endpoint lists).
All commands exited 0 without warnings or errors. Both posterior theorems use
standard logic only; the main theorem still uses exactly **E-J2/E-T1/E-S1**.
The other three active contract logs were inspected, not independently rerun.
This is verified submitted clean-build evidence plus fresh incremental checks,
not a second clean rebuild. Full evidence and commands are in
[ConstructionReport Section 49](ConstructionReport.md#r2-j3-design-acceptance-2026-09-25).

Retirement of the superseded designer reuse probe is accepted. Section 20.3
now links to live production/contract evidence; dated reports preserve the
original experiment. A minor documentation issue found during acceptance was
fixed by the designer: the constructor-added closeout section was removed from
README, which retains only a brief current summary and project rules.
No production/check proof, human-check file or auditor-owned artifact was edited
during acceptance. Mathematical scope and the three-axiom boundary are unchanged.
