# Lean Blueprint for GGC Power Closure

The deliverable is a Lean proof of the main theorem: **every nonnegative GGC probability law remains GGC under every finite real power \(q\ge1\)**. Toolchain setup, definitions, and tangent identities are intermediate deliverables, not substitutes for that theorem.

As of **2026-09-23**, **M0 is `verified` following design acceptance**; see [Section 10](#m0-design-acceptance-2026-09-23). [lean-toolchain](lean-toolchain) pins Lean **4.32.2** and [lakefile.toml](lakefile.toml) pins mathlib revision **`905b95818eb32af7874a58b427f50c1711a5e96c`**. The human-audit entry point [main.lean](main.lean) contains the complete project-specific definitions and the named, **unproved** target proposition. [External/Bondesson.lean](External/Bondesson.lean) contains three fully stated literature assumptions; it proves none of them. [AxiomAudit.lean](AxiomAudit.lean) exposes the current declarations and their dependencies. The independent build/audit rerun is recorded in [ConstructionReport.md](ConstructionReport.md#m0-design-acceptance-2026-09-23); successful compilation does not prove power closure.

**M1 is `verified` relative to the registered literature inputs; M2 through M7 remain `planned`.** M1's transforms, Laplace uniqueness, admissibility and finite-atomic adapters, Thorin characterization, constant-law membership, realization adapters, original-GGC weak closure and conditional reduction are accepted; see [Section 11](#m1-design-acceptance-2026-09-23). Except for the existing files and declarations explicitly identified below, Lean paths and names remain **proposed**, not implemented APIs. The repository's "proved in project" status concerns the written mathematical argument; it does not establish Lean verification of the main theorem. Sections 8–10 preserve historical statuses; Section 11 supplies the current M1 verdict.

**Definition/helper migration implemented (2026-09-23):** `main.lean` defines GGC by weak limits of actual finite gamma convolutions and contains all definitions required to read the target. Helpers live in `GGC/Basic.lean`, `GGC/FiniteGamma.lean`, `GGC/Laplace.lean` and `GGC/Thorin.lean`. Thorin representability remains a separate predicate; its characterization is now proved by [Section 2.1](#original-ggc-definition)'s route 2 using E-B2/E-B3. No E-B4 axiom was introduced. The default build and updated audit pass. The full power-closure proof remains unimplemented.

General rules and trust boundaries are in the [README](README.md); external inputs use its [single whitelist](README.md#external-inputs). This blueprint specifies dependencies, mathematical contracts, construction order, and acceptance criteria. The mathematical index is [WIP](../WIP.md); the main assembly and audit are [WIP-6.21](../ledger/23-power-theorem-assembly-audit.md#wip-6-21) and [WIP-6.23](../ledger/25-mathematical-completion-audit.md#wip-6-23).

## 1. Final theorem and required scope

For a real-valued probability law \(\mu\) concentrated on \([0,\infty)\), and \(q\in\mathbb R\) with \(1\le q\), prove

\[
\operatorname{IsGGC}(\mu)
\quad\Longrightarrow\quad
\operatorname{IsGGC}\bigl((x\mapsto x^q)_*\mu\bigr).
\]

The existing declaration `GGC.GGCPowerClosure : Prop` in [main.lean](main.lean) has this quantifier structure and now unfolds Section 2.1's original weak-limit definition. Defining a proposition does not prove or assume it. There is currently no declaration `GGC.ggc_rpow`; the required future theorem in `GGC/PowerClosure.lean` must prove this proposition without a core axiom or unfinished proof term. Its substantive hypotheses must be only nonnegativity of the probability law, GGC membership, and \(q\ge1\). Its scope includes:

- Every finite real exponent, including noninteger powers and \(q=1\), rather than only squares or a local interval of exponents.
- Arbitrary drift \(a\ge0\), infinite total Thorin mass, and nonatomic Thorin measures.
- All nonnegative degenerate laws, including \(\delta_0\) and \(\delta_a\). Random-variable values are finite real numbers; \(+\infty\) is not an additional value.
- No final assumptions of finite moments, finite logarithmic moments, finite Thorin mass, finite support, or zero drift.

First prove power closure for finite gamma convolutions. Then, for each fixed \(q\), use weak approximation and GGC weak closure. The second log-rate moments and construction constants may depend on each finite input and on \(T=\log q\). They need not be uniform over the approximating sequence. An evolution on an infinite time interval is not required.

## 2. Objects and interface conventions

Use a **law-first, supported-real** model. The implemented `GGC.NonnegLaw` in [main.lean](main.lean) wraps `MeasureTheory.ProbabilityMeasure ℝ` together with an a.e. nonnegativity proof for its underlying measure. That file owns all project-specific definitions required to read the main statement. The random-variable theorem is a future pushforward corollary. Choosing a common probability space, independent copies, or a path process must not become additional main-theorem hypotheses.

| Object | Current representation or remaining contract |
|---|---|
| Nonnegative value law \(\mu\) | `NonnegLaw` and `powerLaw μ q hq` are implemented in `main.lean`, where `hq : 0 ≤ q`. The definition uses the actual map \(x\mapsto x^q\), its continuity for nonnegative exponents, and a proof of nonnegative concentration. `powerLaw_toMeasure` exposes this semantics; `powerLaw_one` and `isGGC_powerLaw_one` supply the exponent-one sanity check. `GGC/Basic.lean` now proves fixed-power preservation of weak convergence as `power_pushforward_tendsto`. |
| Positive rate \(b\) | `PosReal := {b : ℝ // 0 < b}` is implemented in `main.lean`. Rate space and value space are distinct. Log rates live in \(\mathbb R\); future pushforwards under `exp` and `log` need measurability and inverse-map proofs. |
| Thorin data | `ThorinAdmissible` and `ThorinData` live in `GGC/Thorin.lean`. They contain nonnegative drift \(a\), a positive rate measure \(U\), and `Integrable` for \(\log(1+1/b)\), without finite total mass. `ThorinAdmissible.integrable_log` proves integrability for every \(s\ge0\); `thorinAdmissible_iff_endpoint` proves the endpoint equivalence, explicitly including local finiteness. These data describe the analytic characterization, not the original GGC definition. |
| GGC membership | Implemented: `IsGGC μ` means that \(\mu\) is a weak limit of actual finite gamma convolutions, as specified in Section 2.1. It has no Thorin-representation premise. |
| Thorin representability | `HasThorinRepresentation` remains separate from `IsGGC`. `isGGC_iff_hasThorinRepresentation` connects them using exactly E-B2/E-B3 and standard logical axioms. `existsUnique_law_thorinLaplace` realizes arbitrary `ThorinData` using E-B1 for existence and local Laplace uniqueness. |
| Finite gamma law | `gammaLaw`, `finiteGammaLaw`, and `IsFiniteGammaConvolution` use actual gamma measures and a finite product/sum pushforward in `main.lean`. `ProbabilityMeasure.pi` has underlying measure `Measure.pi`. No transform formula defines this class. `laplace_finiteGammaLaw` proves its exponential finite-sum transform for every \(s\ge0\); `finiteThorinMeasure`, `finiteThorinData` and `hasThorinRepresentation_finiteGammaLaw` supply the adapter \(U=\sum_i\alpha_i\delta_{b_i}\). The empty product/sum gives \(\delta_0\). Initial normalized log-rate data and the nonempty mass/second-moment certificates remain future construction work. |
| Log-rate state \(F\) | `ProbabilityMeasure ℝ`, with an additional finite-second-moment hypothesis where needed. Set \(U=B\exp_*F\). Define coefficients for every probability \(F\), before proving Thorin admissibility, so the Euler iteration is not circular. |
| Evolution \(F_t\) | A narrowly continuous probability curve on a fixed finite interval \([0,T]\), with a uniform second-moment bound and the integral weak equation for the specified generator. The proposed `WeakLogRateSolution` packages properties to be proved; defining the structure does not construct an inhabitant. |
| Value and log-value laws | \(\mu_t\) is the zero-drift GGC law associated with \(U_t\); \(\lambda_t=(\log)_*\mu_t\). Prove \(\mu_t((0,\infty))=1\) before taking log values. \(F_t\) describes log **rates**, whereas \(\lambda_t\) describes log **values**. |
| Test functions | Specify predicates or structures for \(C_c^2(\mathbb R)\), linearly growing \(C^2\) functions with bounded first and second derivatives, and \(C_c^1((0,\infty))\). Moving between test domains requires an extension lemma. |

The initial files now select concrete imports and APIs in the pinned revision. Follow the README for their actual validation status. Further APIs for weak convergence, probability kernels, differentiation, and parameterized random measures must still be inspected and tested. Failure to find an API does not authorize narrowing these mathematical contracts.

<a id="original-ggc-definition"></a>

### 2.1 Original definition and separate Thorin characterization

For \(k\in\mathbb N\) and shapes/rates \(\alpha_i,b_i>0\), define the finite gamma law by
\[
\operatorname{finiteGammaLaw}(k,\alpha,b)
 =\left(x\mapsto\sum_{i\in\mathrm{Fin}(k)}x_i\right)_*
   \bigotimes_{i\in\mathrm{Fin}(k)}\operatorname{Gamma}(\alpha_i,b_i).
\]
The product measure encodes independence. A law is `IsFiniteGammaConvolution` exactly when it equals such a pushforward. Shapes and rates may vary with every approximant, \(k=0\) is permitted, and no boundedness or uniform moment condition is added. The actual gamma law uses the shape/rate density already represented by mathlib's `ProbabilityTheory.gammaMeasure`; give the complete project wrappers in `main.lean` and prove their normalization and nonnegative concentration.

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
`GGC/Thorin.lean` must expose `isGGC_iff_hasThorinRepresentation` for every `NonnegLaw`. It covers zero and constant laws, nonzero drift, nonatomic measures and infinite Thorin mass. This is a theorem or an adapter to an explicitly registered axiom, never the definition of `IsGGC`, and never a hypothesis added to `ggc_rpow`.

**Implementation-cost decision:** inspect the pinned source and try the small local adapters first. A modest characterization proof should be formalized. If the full characterization needs substantial new analysis, the user has authorized the standalone literature fallback E-B4 in the README whitelist; record the missing infrastructure and selected route without requiring another approval for that already authorized choice. The permitted routes are:

1. A proof from mathlib and local lemmas, with no external mathematical axioms in this characterization's dependency report.
2. A local Lean derivation from the already registered E-B2/E-B3: original GGC \(\Rightarrow\) representation uses the finite-gamma transform certificate and E-B2; representation \(\Rightarrow\) original GGC uses E-B3, that certificate and Laplace uniqueness. This may be a short bridge, but its dependencies are still literature axioms. Do not call it an axiom-free proof.
3. If substantial work remains, a precisely stated E-B4 `thorin_characterization` in `External/ThorinCharacterization.lean`, followed by a local adapter to the two public predicates. E-B4 repeats the actual finite-product gamma/weak-limit and measure/Laplace formulas in primitive terms, so it need not import `main`. Its scope is exactly the characterization; E-B1 realization remains separate. Avoid adding a redundant second characterization assumption when route 2 already settles the required bridge cheaply.

The source is Bondesson (1992), Section 3.1, printed p.29, Theorem 3.1.5 on p.34 and the finite-gamma approximation paragraph on p.35; see the existing [primary-interface audit](../notes/log-rate-power-proof-primary-interfaces.md). Before introducing E-B4, match both directions and the chosen admissibility convention to that source and record all local adaptations. This authorization does not allow axiomatizing power closure or any project evolution/identification result.

**Initial design API evidence, 2026-09-23 (before migration):** source-read only at the pinned mathlib revision: `Mathlib.Probability.Distributions.Gamma` supplies `ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.isProbabilityMeasure_gammaMeasure`, and the gamma-integral argument used for normalization. No minimal compile or full characterization feasibility proof was performed in this design update. The eventual cost decision remains an implementation task; failure to find one guessed name is not evidence that the theorem must be axiomatized.

**Semantic acceptance:** print the full expansions of `gammaLaw`, `finiteGammaLaw`, `IsFiniteGammaConvolution`, the new `IsGGC`, `HasThorinRepresentation`, and the characterization. Check actual product-law independence and weak convergence. A single gamma law is GGC by a constant approximating sequence; \(\delta_0\) is the empty sum. For \(a>0\), supply the limiting argument \(\operatorname{Gamma}(n+1,(n+1)/a)\Rightarrow\delta_a\), or a proved characterization-based membership argument whose axiom dependencies are disclosed. The old `isGGC_diracLaw` proof only proves representability and cannot be reused unchanged as original-GGC membership.

**Accepted M1 route (2026-09-23):** route 2 is implemented. Local Laplace
uniqueness follows from polynomial combinations of the bounded continuous
function `exp (-x)` on nonnegative reals and mathlib's finite-measure separation
theorem. The forward implication uses the actual finite-atomic transform
adapter and E-B2; the reverse uses E-B3 and local uniqueness to identify its
approximants with actual gamma sums. `isGGC_diracLaw` now proves original
membership for every nonnegative constant using E-B3. The characterization
depends on E-B2/E-B3, not E-B1 or E-B4; it is not an axiom-free result.
Admissibility estimates and endpoint equivalence are locally proved. The
endpoint predicate includes local finiteness alongside absolute logarithmic
integrability below rate one and reciprocal integrability above rate one;
local finiteness is derived from `ThorinAdmissible`, not added to `IsGGC`.

## 3. Main dependency graph

Use the **direct log-generator resolvent verification** of [WIP-6.22](../ledger/24-direct-log-generator-resolvent.md#wip-6-22). This removes a dependency on the intermediate rate-coordinate operator. The general rate operator, conditional mass formula, and local continuation route in WIP-6.12--6.15 are optional extensions, not prerequisites for the first main-theorem implementation.

```mermaid
flowchart TD
  A[Nonnegative laws / original GGC definition / power pushforward] --> B[Finite gamma transform and initial log rates]
  A --> L[Primitive Laplace uniqueness / realization adapters]
  L --> B
  B --> H[Thorin characterization / proved bridge or E-B4]
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

Node A's original-definition migration and M0 Laplace checks are verified. B's finite-gamma transform and atomic-data components are proved; its initial log-rate construction remains open. L's Laplace uniqueness is local, and its realization adapter uses E-B1. H is proved by route 2 using E-B2/E-B3; E-B4 is not declared. W extracts approximants from `IsGGC`, proves weak closure locally, and supplies the conditional reduction in `GGC.Reduction` without external mathematical axioms. The graph describes the full mathematical contracts, not the current Lean import graph; B's transform proof does not depend on Laplace uniqueness. External sources supply only the foundational inputs individually listed in the README. They do **not** supply the project generator, its continuity, the Euler limit, dynamic identification, or the main theorem. Each core node requires a Lean proof. The conditional reduction completes W's reduction step only; it neither discharges F nor proves Z and must not become a project axiom.

## 4. Existing scaffold, planned modules, and source mapping

Paths are relative to `formalization/`. The Lake library is `GGCPower`, with roots `main`, `GGC`, `External`, and `AxiomAudit`. Its globs include every `GGC` and `External` submodule. `main.lean` is the human-audit definition/statement entry point. The current files are:

| Existing file | Current contents and limits |
|---|---|
| [lean-toolchain](lean-toolchain), [lakefile.toml](lakefile.toml) | Pinned Lean/mathlib and the Lake library configuration. The generated `.lake` directory is excluded by the repository ignore rules. |
| [main.lean](main.lean) | Complete original GGC definition, actual gamma/product/sum and power laws, and the unproved `GGCPowerClosure` proposition. Only construction proofs remain here; no external import or auxiliary theorem. |
| [GGC/Basic.lean](GGC/Basic.lean) | Moved law/endpoint lemmas, the constant-law power identity, and fixed-power preservation of weak convergence. |
| [GGC/FiniteGamma.lean](GGC/FiniteGamma.lean) | Product/sum semantics, empty- and one-factor identities, finite-gamma and zero-law GGC membership via constant sequences. Scalar and finite-sum Laplace formulas are proved from the gamma density and product integration, including \(s=0\). The finite-atomic Thorin adapter is in `GGC.Thorin`; initial log rates remain open. |
| [GGC/Laplace.lean](GGC/Laplace.lean) | Laplace integrability, normalization, positivity, bounds and constant-law formula; `measure_eq_of_laplace_nat_eq` and `nonnegLaw_eq_of_laplace_eq` prove finite-measure/nonnegative-law uniqueness without extra moments or external mathematical axioms. |
| [GGC/Thorin.lean](GGC/Thorin.lean) | Thorin data, separate representation predicate, parameter integrability, endpoint equivalence and finite-atomic adapters. Characterization uses E-B2/E-B3; nonnegative-constant GGC membership uses E-B3; unique realization uses E-B1. Regularity in varying data and derivative lemmas remain future obligations. |
| [GGC/WeakClosure.lean](GGC/WeakClosure.lean) | `isGGC_iff_mem_closure` and `isGGC_of_tendsto` prove original-GGC weak closure through metrization and sequential closure, with no Thorin dependency. |
| [GGC/Reduction.lean](GGC/Reduction.lean) | `isGGC_powerLaw_of_finiteGamma` and `ggcPowerClosure_of_finiteGamma` prove the conditional reduction; the finite-input power-closure premise remains explicit and unproved. |
| [External/Bondesson.lean](External/Bondesson.lean) | E-B1 `thorin_realization`, E-B2 `weak_closure`, E-B3 `finite_atomic_approximation`, with primitive measure/Laplace contracts and source annotations. These are explicit external axioms, not proved project deductions. |
| [External/README.md](External/README.md) | Inventory, exact scope, and local proof obligations. James, SSV, and Sethuraman interfaces are listed but have no Lean declarations yet. |
| [AxiomAudit.lean](AxiomAudit.lean) | Prints the current definitions, external contracts, conditional reduction signatures, and dependencies of the M0 and completed M1 lemmas. Auditing the proposition definition does not prove its truth; the future theorem needs its own transitive audit. |

<a id="statement-proof-separation"></a>

### 4.1 Approved separation of statement and proof

`main.lean` remains the **definition and statement entry point**. The future **proof entry point** is `GGC/PowerClosure.lean`, and `AxiomAudit.lean` is the verification entry point. This supersedes the earlier plan for `main.lean` to import the proof modules and contain their adapters and final theorem.

The first migration has the following exact ownership:

| Destination | Declarations or responsibility |
|---|---|
| Keep or define in `main.lean` | `PosReal`, `NonnegLaw`, `gammaLaw`, `finiteGammaLaw`, `IsFiniteGammaConvolution`, the original-definition `IsGGC`, `powerLaw`, and `GGCPowerClosure`, with complete definitions and explanatory comments. Proof fields needed to construct these objects, including probability normalization and nonnegative concentration, remain with their definitions. Section 2.1 supersedes the earlier plan to retain the representation-based definition. |
| Move to `GGC/Basic.lean` | `NonnegLaw.ext`, `powerLaw_toMeasure`, `powerLaw_one`, `diracLaw`, and `isGGC_powerLaw_one`. Preserve the unaffected declarations; check the last lemma against the new membership predicate. `diracLaw` is not required to read the main target. |
| Move to `GGC/Laplace.lean` and `GGC/Thorin.lean` | `laplace` belongs to the former; `ThorinAdmissible`, `ThorinData`, `thorinLaplace`, and the old existential formula renamed `HasThorinRepresentation` belong to the latter. They are no longer definitions needed to read the public target. Thorin also owns the characterization adapter and the revised `isGGC_diracLaw`; its old proof becomes a representability lemma, followed by a membership proof as required in Section 2.1. |
| Prove in `GGC/FiniteGamma.lean` and `GGC/WeakClosure.lean` | The former proves the actual finite-sum transform certificate and membership via constant sequences, including the empty sum. The latter proves weak closure of the original class locally; it imports `GGC.Basic`, not `GGC.Thorin` or the external characterization. |
| Proved in `GGC/Reduction.lean` | The conditional reduction from finite-gamma power closure to the full target, extracting approximants from the original definition and using fixed-power continuity and locally proved GGC weak closure. E-B2/E-B3 are not needed by this reduction. Its finite-input premise remains explicit until discharged. |
| Prove later in `GGC/PowerClosure.lean` | `finiteGamma_power_closure`, `ggc_rpow : GGCPowerClosure`, and the random-variable corollary, assembled from the completed proof modules and reduction. Do not create an unfinished theorem under the final name to enact the file split. |
| Update `AxiomAudit.lean` | Import the implemented definition/helper/characterization modules and external declaration modules explicitly. Print both predicates, the characterization, and the dependencies of the revised membership lemmas; print E-B4 only if actually introduced. Once the genuine final proof exists, also import `GGC.PowerClosure` and audit `GGC.ggc_rpow`. |

**Implemented import direction:** `GGC.Basic` imports `main`; other proof modules import definitions and helpers as needed. `GGC.WeakClosure` imports `GGC.Basic` and mathlib; `GGC.Reduction` imports `GGC.WeakClosure`. `AxiomAudit` explicitly imports `GGC.FiniteGamma`, `GGC.Thorin`, `GGC.Reduction` and `External.Bondesson`. `main` imports mathlib only; it must not import its consumers. The future `GGC.PowerClosure` will import its completed proof dependencies. The primitive Bondesson contracts are unchanged and still do not depend on `main`.

**Shared semantics before deferred external contracts:** the proposed `GGC/Foundations/RandomMeasure.lean` owns the actual random-measure evaluation and Dirichlet-law semantics needed by E-J1--E-J3 and E-T1. It imports mathlib only, with no external axioms or project proof modules. Those future external files may import this foundation; `GGC/GammaDirichlet.lean` then imports the registered external contracts and proves the local constructions. The two dependency branches are `mathlib → main → project lemmas` and `mathlib → shared semantics → external contracts`; they feed the proof modules, then `GGC.PowerClosure`, then `AxiomAudit`. Here arrows point from a dependency to its consumer. This foundation does not relocate the public definitions currently owned by `main.lean`. Fix this interface at the start of M2, before introducing the deferred axioms; it is not an unlisted prerequisite for finishing M0.

Migration acceptance requires the original GGC definition and all its prerequisites in `main`, the same full target quantifiers, unchanged types and axiom dependencies for unaffected moved lemmas, and fresh semantic/dependency checks for membership lemmas and the characterization. Require an acyclic import graph and a default Lake build covering the new `GGC` modules and updated audit. Current roots are `main`, `GGC`, `External`, and `AxiomAudit`; the `GGC.+` and `External.+` globs cover their submodules. Keep coverage and audit imports current when adding files. Record the actual configuration and successful checks. This accepts the definition/helper migration and any completed characterization work, not the future main proof; a build of `main` alone cannot certify that proof. The definition/helper migration, Lake coverage and audit updates are now implemented and checked; see the migration acceptance record below. Characterization and full-proof acceptance remain separate.

### 4.2 Planned proof modules

The following proof decomposition remains **`planned`**, except for the existing and partially implemented modules explicitly inventoried above. Local adapters belong in the module responsible for the relevant mathematics. They may refer to the public definitions by importing `main`; reusable primitive-measure lemmas remain welcome but are no longer required merely to avoid importing it. The final theorem belongs to `GGC/PowerClosure.lean`.

| Proposed file | Proposed declarations or deliverable | Written proof and manuscript locator |
|---|---|---|
| `GGC/Basic.lean` | The existing basic declarations listed in Section 4.1, followed by `power_pushforward_weaklyContinuous` and its `NonnegLaw`/`powerLaw` adapter; imports `main` | [main.lean](main.lean), existing helper proofs; [WIP-0.1](../ledger/00-foundations.md#wip-0-1); [completion section](../manuscript/sections/06-completion.tex) |
| `GGC/Laplace.lean` | `laplace`, `nonnegLaw_eq_of_laplace_eq`, Laplace normalization/positivity/integrability; primitive probability-measure statements with no moment assumptions. Realization adapters using Thorin data belong to `GGC.Thorin`, avoiding a reverse import | [foundations](../manuscript/sections/01-foundations.tex), `lem:gamma-dirichlet`; [identification](../manuscript/sections/05-identification.tex), transform-uniqueness argument following `eq:id-positive-log`; E-B1 local obligations |
| `GGC/FiniteGamma.lean` | Product/sum semantics lemmas, scalar and finite-sum Laplace formulas, finite-gamma membership and zero-law membership via constant sequences; imports `GGC.Basic` and `GGC.Laplace`, not `GGC.Thorin` | Section 2.1; [foundations ledger](../ledger/00-foundations.md) |
| `GGC/WeakClosure.lean` | Sequential/closure equivalence or metric diagonal construction, then `isGGC_of_tendsto`; consumes the original definition and `GGC.Basic`, with no Thorin-characterization dependency | Section 2.1; [preliminaries](../manuscript/sections/01-foundations.tex), `lem:ggc-closure` |
| `GGC/Thorin.lean` | Thorin data and `HasThorinRepresentation`, integrability and derivative lemmas, realization adapters, `isGGC_iff_hasThorinRepresentation`, `hasThorinRepresentation_diracLaw`, and revised `isGGC_diracLaw`; imports finite-gamma/Laplace results and only the external contracts actually used | Section 2.1; [foundations ledger](../ledger/00-foundations.md); [preliminaries](../manuscript/sections/01-foundations.tex), `eq:thorin-representation` |
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
| `GGC/PowerClosure.lean` | `finiteGamma_power_closure`, `ggc_rpow : GGCPowerClosure`, and random-variable corollary; imports the completed construction, identification and reduction modules, and serves as the final proof entry point | [WIP-6.21](../ledger/23-power-theorem-assembly-audit.md#wip-6-21); [completion section](../manuscript/sections/06-completion.tex); [full-scope audit](../ledger/25-mathematical-completion-audit.md#wip-6-23) |

WIP-6.23 audits the assembled proof; it is not a second independent theorem. Exact foundational source interfaces are recorded in the [primary-interface audit](../notes/log-rate-power-proof-primary-interfaces.md) and the README whitelist. Parameterized realizations, measurable representatives, and their subsequent applications still require project proofs.

## 5. Critical mathematical contracts

### Foundational adapters shared by the proof nodes

`GGC/Laplace.lean` now proves `nonnegLaw_eq_of_laplace_eq`: two nonnegative probability laws with the same Laplace transform at every positive parameter are equal, without extra moments. E-B1 gives existence only; `existsUnique_law_thorinLaplace` combines it with local uniqueness. Reuse uniqueness to identify realizations with gamma--Dirichlet products and subsequential limits in M6. Choosing one E-B1 witness does not itself prove continuity or measurability as its data vary. Those properties remain outputs of `Identification/Moments.lean`, using the logarithmic tail bounds. For the supported-real model, also justify the passage to probabilities on the positive subtype and continuity of the log pushforward; `Real.log` is not continuous at zero.

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

| Stage | Status | Deliverables and acceptance criteria |
|---|---|---|
| M0: Reproducible project and fixed interfaces | `verified` | All four checklist items below pass the independent design review. Pins, original-definition semantics, helper ownership, three unchanged Bondesson contracts and build/audit coverage are checked. Empty-sum, single-gamma, exponent-one and constant-power cases pass; Laplace integrability, normalization and positivity are proved. Deferred Dirichlet/phase contracts remain M2 work. See Section 10. |
| M1: Characterization and final reduction | `verified` | Transforms, local Laplace uniqueness, finite-atomic/admissibility adapters, endpoint equivalence, nonnegative-constant membership, original-GGC weak closure and conditional reduction pass review. Route 2 characterization uses E-B2/E-B3; unique realization uses E-B1. All other listed analytic/reduction components use standard logical axioms only. See Section 11. The finite-input power theorem remains unproved. |
| M2: Dirichlet theory, phases, and tangent | `planned` | First freeze the shared random-measure semantics and fully state/audit the deferred external contracts, including the complex-domain input needed for the chosen phase construction. Then complete A's contracts and the required gamma/beta analytic lemmas. Cover atomic, nonatomic, and mixed bases in posterior identities. Supply a fixed common probability space and joint measurability for parameterized random measures. Distinguish external representation inputs from project measurable constructions. |
| M3: Generator and direct resolvent | `planned` | Complete B's contracts, with absolute integrability and the correct digamma parameter. No hidden rate-moment or log-rate-moment restrictions. The deterministic cancellation may be implemented first as an independent lemma. |
| M4: Weak continuity | `planned` | Prove phase convergence against every \(L^1\) kernel, joint parameter continuity, and continuity after integration against varying measures. No pointwise phase convergence hypothesis. |
| M5: Positive Euler scheme and finite-time existence | `planned` | Prove C's kernel, exact moments, tightness, uniform-in-time narrow convergence, consistency, and limiting weak equation. Match the identification input property by property, for every test and every time. |
| M6: Dynamic identification | `planned` | Prove D's logarithmic moments, strict positivity, endpoint bounds, test-domain extension, and transport uniqueness. Identify every solution of the specified weak equation with the actual power laws, without assuming future power closure. |
| M7: Full main theorem | `planned` | Assemble the finite gamma theorem and general GGC reduction in `GGC/PowerClosure.lean`, retaining every quantifier in Section 1. `import GGC.PowerClosure` exposes the theorem; the default build and `AxiomAudit.lean` include this proof entry point; a clean build succeeds; the dependency/axiom report meets README rules; no core node remains an unproved assumption. Disclose the status of every remaining external input. |

M0's acceptance checklist is:

1. Reproduce the pinned version, default build, and existing audit; record the actual executable, working directory, commands and exit statuses, distinguishing cached validation from a clean rebuild. **Passed:** the independent M0 acceptance rerun verified Lean 4.32.2, the mathlib pin, the default build (`2788 jobs`) and direct audit; see the [review evidence](ConstructionReport.md#m0-design-acceptance-2026-09-23). This used cached dependencies, not a clean mathlib rebuild.
2. Inspect the complete target quantifiers and public definitions, the three existing E-B contracts and their source adaptations, and the actual import/axiom graph. The original-definition semantics pass the migration audit. M1 now separately proves equivalence with Thorin representability using E-B2/E-B3. No core axiom or unfinished proof may enter the verified closure.
3. **Passed:** the \(q=1\) lemmas, single-gamma and empty-sum membership cases, and actual power-pushforward identity for \(\delta_a\) are proved. `GGC/Laplace.lean` supplies `laplace_integrable` for every \(s\ge0\), `laplace_zero` and `laplace_pos` for every \(s\ge0\), for arbitrary `NonnegLaw` without moment assumptions. The separate positive-constant membership obligation has now also passed M1 review, with its E-B3 dependency disclosed.
4. Implement and validate Section 2.1's original definition and Section 4.1's ownership changes, preserving the full target quantifiers and checking changed membership semantics explicitly. Update Lake module coverage and audit imports together. This migration is complete; the separate characterization has now passed M1 review and no unfinished final theorem was introduced.

M0 and M1 are accepted. M2's shared-semantics and deferred-contract gate and M3's deterministic kernel estimates can proceed independently once their interfaces are fixed. M5's probability-kernel and compactness infrastructure can begin once its precise continuity interface is fixed. Merge concurrent construction by checking contracts, not file or declaration counts.

## 7. Risks and execution starting point

| Risk | Required response |
|---|---|
| Unverified mathlib APIs | Use the pinned revision, inspect declarations, and compile minimal examples. Initial API choices do not validate later weak-convergence or random-measure interfaces. Prove missing adapters or record a specific gap. Do not invent imports or strengthen the main theorem's hypotheses. |
| Probability-valued measurability and common null sets | Follow the common-event construction in the [measurable realizations appendix](../manuscript/sections/07-measurable-realizations.tex) for quantiles, stick-breaking, and the Palm kernel. Do not intersect uncountably many parameter-dependent full-measure events. |
| Default integral values hiding divergence | Prove absolute integrability before splitting, substitution, Fubini, or differentiation. In particular audit \(K\), signed Palm, and the product term at the zero Laplace endpoint. |
| Discontinuous boundary phases | Use boundedness, a.e. uniqueness, and weak-star convergence against \(L^1\) kernels. Do not depend on pointwise phase continuity. |
| Mistaking tangent positivity for existence | M5 must construct an actual probability-kernel iteration, a probability limit, and the exact weak equation. A positive-minimum-property placeholder is insufficient. |
| Unproved extension of test domains | Do not insert resolvent or logarithmic tests directly into the original \(C_c^2\) equation. Verify cutoff limits and space-time domination separately. |
| A theorem covering only restricted inputs | Audit every parameter of `ggc_rpow`; remove shape, mass, support, drift, or moment restrictions belonging only to intermediate construction. Check \(q=1\), \(\delta_0\), and positive drift. |
| A mismatch with the written proof | Locate the issue by WIP ID and manuscript label; repair the proof or contract and update status. Do not absorb a mathematical gap into an external axiom. |

**Next implementation handoff:** begin M2 by fixing actual shared random-measure/Dirichlet semantics and fully stating and auditing its deferred external contracts, then construct the Gamma/Dirichlet, measurable phase and tangent interfaces. Reuse M1's accepted uniqueness, Thorin characterization, finite-atomic adapters and realization theorem; existence/uniqueness alone supplies no parameter measurability or continuity. Keep the statement layer independent of the bridge. No E-B4 is needed. Initial normalized log-rate data, positive mass and finite second moments remain future finite-input construction obligations; they are distinct from the completed atomic Thorin adapter. Deterministic resolvent/kernel estimates can proceed independently once their interfaces are fixed. Supply `GGC.ggc_rpow` in `GGC/PowerClosure.lean` only when its genuine proof is ready. Generating core theorem stubs containing `sorry` is not progress.

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
