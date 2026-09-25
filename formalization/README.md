# GGC Power Closure: Status and Project Rules

**Final acceptance (2026-09-25): F-01 and F-02 are closed.** Both J2/J3
public interfaces have the historical measurable-only types, verified by fresh
Lean elaboration and exact type-expression comparison. The main theorem remains
accepted relative to E-S1. Earlier claims that topology instances belonged to
the original types remain withdrawn; the repaired interfaces are accepted on
new evidence. See [Section 56](ConstructionReport.md#f01-designer-acceptance-2026-09-25)
for the build, seven contract checks and 1067-result audit.

## Current status

[GGC.ggc_rpow](main.lean) proves that every nonnegative GGC probability law
remains GGC under the deterministic power map \(x \mapsto x^q\) for every real
\(q \ge 1\). GGC membership uses the original finite-gamma weak-limit definition.
The result includes arbitrary drift, infinite Thorin mass and degenerate laws,
with no additional moment assumptions.

The proof is relative to **E-S1** (SSV phase representation). Thorin realization,
finite atomic approximation, the Beta atom posterior, the bounded Markov-Krein
formula, stick-breaking and the nonnegative Palm identity have local Lean proofs.
[Definitions.lean](Definitions.lean) contains the public definitions;
[main.lean](main.lean) assembles the theorem, with details in
[GGC/PowerClosure.lean](GGC/PowerClosure.lean).
[AxiomAudit.lean](AxiomAudit.lean) inspects the actual declarations and dependencies.
E4's local replacements and the final E-S1 boundary have passed
[independent designer acceptance](ConstructionReport.md#e4-design-acceptance-2026-09-25).

All comments and documentation comments in project Lean source files must be
written in English. Maintain [Blueprint.md](Blueprint.md) in English, including
its prose, tables, milestone descriptions and future updates. Preserve Lean
identifiers and mathematical notation.

## 1. Document responsibilities

Keep this README limited to a brief current-status summary and project rules.
Record construction progress, milestone history, design handoffs and acceptance
findings in the documents assigned below.

| Content | Maintained in |
|---|---|
| Principles, trust boundary, development and acceptance rules | This README |
| Read-only construction specification: dependency graph, interfaces, modules and acceptance criteria | [Blueprint](Blueprint.md) |
| Shared mathlib API mapping, compatibility decisions, evidence pointers and search gaps | [Mathlib API](MathlibAPI.md), jointly maintained by designer and constructor |
| Current milestone status, implementation/completion reports, API evidence, build results and axiom audits | [Construction Report](ConstructionReport.md) |
| Independent semantic/source audits and their evidence limits | Dated `SemanticAudit-*.md` reports, maintained by the auditor; designer responses belong in the construction report |
| Written proofs and stable result identifiers | [ledger](../ledger/README.md), [WIP](../WIP.md) |
| Literature versions, locators and hypothesis audits | [Primary-interface audit](../notes/log-rate-power-proof-primary-interfaces.md), [reference map](../ledger/references.md) |
| Mathematical research status | [ResearchStatus](../ResearchStatus.md) |
| Manuscript presentation | [manuscript](../manuscript/ggc-power-closure.tex) |

Use the assembly in [WIP-6.21](../ledger/23-power-theorem-assembly-audit.md#wip-6-21)
and the requirements in [WIP-6.23](../ledger/25-mathematical-completion-audit.md#wip-6-23)
to check the main theorem. TeX labels locate results; they do not replace proofs.
Resolve discrepancies between the ledger, manuscript and Lean types explicitly.
Do not silently weaken the theorem or strengthen its assumptions to make it compile.

## 2. General principles

1. **Check the proposition before proving its type.** Write the mathematical
   statement, quantifiers, domains, assumptions and provenance first.
   A proof of a weaker proposition does not complete the original obligation.
2. **Give definitions mathematical semantics.** GGC membership, Thorin measures,
   Dirichlet processes, power laws and weak solutions must refer to actual
   measures, integrals and distributions. Do not define membership as `True`,
   include power closure in its definition, or assume an unsupported object
   possessing every required property.
3. **Keep dependencies transparent.** Definitions must not import the main
   theorem; external axioms must not import their consumer deductions.
   Once a registered axiom is locally proved, move its public theorem/interface
   out of `External` into the appropriate project module under the
   [external-interface lifecycle rule](#external-interface-lifecycle).
   The current-law tangent must not assume that positive-time powers are GGC.
4. **Reuse mathlib first.** Search the pinned source, read the actual type and
   compile a minimal use before building new foundations. Follow the
   [reuse workflow](#mathlib-reuse-workflow): prefer library objects, then
   library theorems with thin local adapters. A name remembered from another
   version is not API evidence.
5. **Make analytic obligations explicit.** Prove measurability, absolute
   integrability, uniform parameter bounds, almost-everywhere conditions,
   probability normalization and hypotheses for every limit interchange.
6. **Remove intermediate restrictions.** Positive mass, zero drift and finite
   second log-rate moments are valid construction hypotheses. Remove them by
   proved extension steps. Taking logarithms must not exclude zero or constant
   laws from the final statement.
7. **Separate computation from proof.** Python output, plots and finite scans
   do not prove analytic claims. An exact certificate needs a Lean-checked
   connection to the proposition it certifies.
8. **Report evidence, not apparent progress.** Distinguish plans, declarations,
   incomplete scaffolding, local proofs and completed theorems. File counts
   are not completion measures. Record genuine mathematical gaps against
   their ledger nodes and resolve them.

<a id="mathlib-reuse-workflow"></a>
### 2.1 Required mathlib reuse workflow

The objective is to minimize locally maintained foundations while preserving
the full mathematical contract. Proof length or the number of library calls
is not a completion metric. This workflow applies before substantial work on
each new module and at the focused re-search triggers below; it does not
require a repository-wide search before every elementary lemma.

1. **Specify and decompose the contract.** Write the exact types, quantifiers,
   hypotheses and conclusion. Separate distribution semantics, measurability,
   integrability, measure transport, differentiation, uniqueness and limit
   interchange. Search each reusable component before fixing new wrappers.
2. **Search from specific terminology to general structure.** Start with the
   shared API index and the pinned source in `.lake/packages/mathlib/Mathlib`.
   Use `rg --files` and `rg`: search project terminology, mathematical synonyms,
   then the underlying general structure. For example, Laplace uniqueness may
   be a specialization of finite-measure separation; parameterized sampling
   may be a kernel representation theorem. Inspect nearby declarations and
   actual call sites. A filename or one unsuccessful guessed name is not
   evidence of mathematical coverage or absence.
3. **Prefer standard objects and small adapters.** Reuse a library definition
   directly when its semantics match. When a project-facing definition is
   needed, prove equality or the exact transport relation once and reuse that
   bridge. Keep adapters in their mathematical owner module; shared consumers
   should import them rather than copy proofs. Preserve `Definitions.lean`'s complete
   public definitions and the external-input import boundary.
4. **Read the full type and compile a real use.** Check implicit/typeclass
   assumptions, domains, signs, parameter conventions, null sets and measure
   structures. In particular distinguish Giry measurability from the Borel
   structure of weak convergence, and integrability from a formal integral
   identity. Do not accept extra moments, finite mass or support restrictions
   unless they are proved from the existing contract. `#check` alone does not
   establish that a candidate applies to the project's actual objects.
5. **Record the decision and retain evidence.** Use the [shared API table](MathlibAPI.md) to
   classify each substantial component as direct reuse, local adapter or
   local proof required. State the exact missing bridge for partial matches.
   Record searched paths, concepts and the closest candidates when none fits;
   say "not found in the searched pinned sources", not "mathlib has none".
6. **Re-search when the evidence changes.** Before introducing a generic
   foundational definition, starting a substantial foundational proof,
   declaring an allowed literature axiom, or copying an argument already used
   elsewhere, perform a focused search. Also revisit candidates when a proof
   stalls because of representation/typeclass mismatch. Stop when an applicable
   API is compiled or a concrete gap and local route are documented; do not
   repeatedly scan the entire library without a new reason. Search failure
   does not authorize a new axiom or a weaker theorem.

Use [MathlibAPI.md](MathlibAPI.md) as the single shared **API index and gap
list**.
Both designer and constructor may edit this file directly: the constructor
records searches, actual uses, probes and unresolved mismatches; the designer
records contract decisions, review conclusions and cross-module ownership.
Distinguish reported compilation from independent acceptance. Neither role
overwrites the other's evidence without recording the reason. This shared
editing permission does not make the Blueprint writable during construction.
ConstructionReport.md retains chronological implementation/build records and
links to stable API IDs; the API table links back to those records.
Update the table as work proceeds. Reuse a prior
validated entry when its revision and hypotheses still match. Before fixing
a module's implementation interfaces, supply these fields for its substantial
reusable components:

| Required field | Content |
|---|---|
| Contract / owner | Blueprint node, project module, exact required statement and assumptions |
| Candidate | Pinned mathlib revision, source path, imports and full declaration name |
| Compatibility / decision | Direct reuse, adapter or local proof; exact type, sign, measure-structure and hypothesis differences |
| Evidence | `to_find → source_read → #check_passed → minimal_use_compiled`; actual tracked proof/probe location, command and result |
| Remaining gap / search scope | Unmet obligations, closest rejected candidates and why; searched paths/concepts; recheck trigger |

Production proofs using the API are preferred durable evidence; no duplicate
probe is needed for them. Important probes that justify a future interface
must be version-controlled in `Checks/` with an explicitly documented command
by default; do not automatically include them in the production build.
Follow the [Checks governance](#checks-governance). `.lake/` is suitable for temporary
experiments and logs, but cannot be the only home of an adopted design's
reproducible evidence. Do not count a probe as completion of its consumer.
Record evidence against the pinned revision; a dependency upgrade is a
separate change requiring renewed compatibility/build checks.

<a id="checks-governance"></a>
### Checks governance: designer, constructor and independent reviewer

The user approved the [Checks rules](Checks/README.md) on 2026-09-25. That file
is the authoritative operational policy for creation, ownership, headers,
execution, evidence and retirement. Designers create design/API/contract probes;
constructors create delivery compatibility/contract/regression checks;
independent reviewers create and control their independent review checks.
Creation and independent verification are distinct roles and must be recorded.

Temporary experiments belong in `.lake/`; durable checks need a stated purpose,
scope, owner, explicit command and evidence link. Production must not import
`Checks`. No `sorry` or new axiom is permitted in a durable check, and a target
assumed as a hypothesis is not counted as proved. Run affected checks on
construction submission; designers assess the contract and independent reviewers
choose their own verification method rather than adopting a passing log alone.

Ordinary shared checks may be maintained by designer and constructor with a
recorded reason. Do not change an independent reviewer's judgment logic without
agreement; their confirmation is required to delete or replace their evidence.
Retire redundant checks with replacement links while preserving dated results.
These rules do not change ownership of user files or the independent audit.

At review, justify retained generic definitions and substantial foundational
proofs against the closest library alternative. Check the adapter semantics,
unchanged mathematical scope, build coverage and axiom dependencies. A
library-backed replacement must discharge the same obligations as the proof
it replaces. The Blueprint's [module reuse gate](Blueprint.md#module-reuse-gate)
turns this workflow into module-level construction and acceptance requirements.

## 3. Shared modeling conventions

Keep law and power-pushforward semantics in [Definitions.lean](Definitions.lean)
and the separate Thorin predicate in `GGC/Thorin/Basic.lean`. Preserve the
distinction between original GGC membership and Thorin representation.

### 3.1 Laws, powers and coordinates

- Use a law-first interface: `NonnegLaw` bundles
  `MeasureTheory.ProbabilityMeasure ℝ` with `∀ᵐ x ∂μ, 0 ≤ x`.
  The distribution version is the full required deliverable; no random-variable
  corollary is required. Different laws need not share a probability space.
- `powerLaw μ q hq` is the actual pushforward \((x\mapsto x^q)_*\mu\), with
  exponent type `ℝ`. Prove measurability, nonnegativity and the continuous
  mapping result for fixed \(q\ge1\). Handle \(q=1\) explicitly.
  The implemented argument `hq : 0 ≤ q` supplies continuity; the main target
  derives it from \(1\le q\), adding no hypothesis to the target theorem.
- Use `PosReal := {b : ℝ // 0 < b}` for rates and `ℝ` for log-rates.
  Rates may accumulate at zero. Do not strengthen concentration on positive
  rates to a support condition excluding that behavior.
- Distinguish the log-rate law \(F\), its Thorin measure \(U=B\exp_*F\),
  the value law \(\mu\), and the log-value law \(\log_*\mu\).
- Use log-value transport only after proving strict positivity of the
  intermediate laws. Total definitions of `Real.log` and `Real.rpow`
  do not discharge their mathematical side conditions.

mathlib's `ProbabilityMeasure` carries the weak-convergence topology.
Check coercions, pushforward arguments and imports in the version pinned
by the project; see the [mathlib probability-measure documentation](https://leanprover-community.github.io/mathlib4_docs/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.html).

### 3.2 Original GGC definition, represented-law membership and integrals

Define `gammaLaw`, `finiteGammaLaw`, `IsFiniteGammaConvolution` and `IsGGC`
completely in `Definitions.lean`. A finite gamma convolution is the sum pushforward
of a finite product of actual gamma laws with positive shapes and rates;
the product encodes independence. Permit the empty sum, giving \(\delta_0\).
Use mathlib's `ProbabilityTheory.gammaMeasure` with its shape/rate convention
and supply normalization and nonnegative-concentration proofs.

The original definition is

\[
\operatorname{IsGGC}(\mu)\iff
\exists(\mu_n)_{n\in\mathbb N},\quad
(\forall n,\ \operatorname{IsFiniteGammaConvolution}(\mu_n))
\ \land\ \mu_n\Rightarrow\mu.
\]

Use weak convergence of the underlying `ProbabilityMeasure ℝ` values, with
no uniform moments, common probability space or Thorin data in the definition.
Prove weak closure locally by a closure/sequential-closure bridge or a metric
diagonal argument. The final reduction extracts approximants from `IsGGC`
itself, then uses fixed-power continuity and this closure theorem.

`laplace` is in `GGC/Laplace.lean`; `ThorinData`, `ThorinAdmissible`
and `thorinLaplace` are in `GGC/Thorin/Basic.lean`. The separate analytic predicate
is named `HasThorinRepresentation`. It asserts the existence of \(a\ge0\) and a measure
\(U\) on positive rates, with `Integrable` for \(\log(1+1/b)\), such that

\[
L_\mu(s)=\exp\!\left(-as-\int\log(1+s/b)\,U(db)\right),\qquad s>0.
\]

The mass of U need not be finite. The admissibility convention is locally
proved equivalent to the endpoint conditions and gives integrability at every
positive parameter. Arbitrary admissible Thorin data is realized by locally
proved E-B1. `HasThorinRepresentation.isGGC` proves represented-law membership
through locally proved E-B3, including zero/constant laws and positive drift.

The forward/equivalence characterization and E-B2/E-B4 are outside the
required scope. Do not introduce them as assumptions or premises of the main
theorem. A local proof of the full characterization is optional.

A real integral's default value outside the integrable case can make a
meaningless identity hold. Include `Integrable` or equivalent conditions
with signed integral identities and moment bounds. Prove finiteness before
converting extended integrals to real numbers, and strict positivity before
dividing by a mass or normalizer. Record hypotheses and dominating functions
for Fubini, differentiation under integrals, dominated convergence and
\(s\downarrow0\).

### 3.3 Random measures, phases and weak solutions

Give Dirichlet processes explicit finite-partition or stick-breaking
semantics, including atomic and mixed bases and zero-mass partition cells.
Pointwise existence or `Classical.choose` does not give joint measurability.
SSV initially supplies phases only up to a.e. equality; jointly measurable
representatives, parameter changes, scaling and weak-star limits remain
project obligations. Fix the anchor at 1 without adding a zero-endpoint condition.

`WeakLogRateSolution` describes an output: initial data, probability status,
narrow continuity, a uniform second log-rate moment and the integral weak
equation for compactly supported twice continuously differentiable tests.
Its existence must be proved, not assumed in the main theorem.

<a id="external-inputs"></a>
## 4. External mathematical input whitelist

Retain the repository's established policy: precisely audited literature
results not yet formalized may be registered as explicit external axioms.
The target is **Lean verification of the project's GGC power closure
derivation relative to the registered literature axioms**.
Do not re-axiomatize mathlib results. The active mathematical axiom is E-S1,
which occurs in the main theorem. E-B1, E-B3, E-J2, E-J3 and E-T1 are
local theorems. The bounded Markov-Krein formula is proved locally; the
general E-J1 interface is retired and is not claimed as proved. E-B2/E-B4
are not active inputs. The [external inventory](External/README.md) identifies
the exact declarations, source provenance and adaptations.

**Project scope:** E-S1 is retained as a literature assumption; its local
formalization is outside this project. The accepted completion boundary is
standard logic plus E-S1 as the sole external mathematical input. Existing
external declarations remain assumptions until their local replacements are
proved and accepted; the intended boundary does not change the current inventory.

For every actual declaration, record its stable ID, full source and version,
theorem/formula/page locator, original statement or derived interface, exact
inputs and conclusion, consumers, local adaptation obligations and Blueprint
node. Additional literature inputs require the same registration.

**Source-review responsibilities (confirmed by the user, 2026-09-24):** the
constructor locates the local references, checks the edition, original pages,
hypotheses and Lean adaptations, and submits reproducible evidence in the
construction report. The designer or independent auditor reviews that evidence
and confirms closure; the independent audit report remains auditor-maintained.
File availability, construction self-check and independent acceptance remain
separate statuses.

Prove local specializations by default. If a literature corollary is directly
axiomatized, label it a **source-derived interface** and check every adaptation.
Do not append conclusions the source does not supply.

| ID | Permitted input and source locator | Work not supplied by that axiom |
|---|---|---|
| E-B1 (local theorem) | Bondesson (1992), Section 3.1, printed p.29 and pp.34–35: realization of Thorin-admissible data by a nonnegative probability law | Gives `HasThorinRepresentation`; original-GGC membership uses the locally proved represented-law direction. No power closure input |
| E-B3 (local theorem) | Same book, final paragraph of p.35: the declared interface approximates every represented law by laws with finite-atomic Thorin transforms | Identify approximants with actual finite gamma sums using their transforms and Laplace uniqueness. This gives the representation-to-original-definition direction, not finite-input power closure |
| E-J1 (retired general interface) | James (2005), arXiv:math/0505606v1, reprint p.2, (1)–(3): original unbounded/log-integrable statement is no longer declared or whitelisted | The unchanged consumer uses the separately named local bounded Markov-Krein theorem; the general statement is not claimed as proved |
| E-J2 (local theorem) | Same paper, pp.4–5, posterior formula and (8): nonnegative one-observation Palm/posterior identity for atomic, nonatomic and mixed bases | Absolute integrability before the signed version; arbitrary signed Fubini is not an input |
| E-J3 (local theorem) | A source-derived interface from the posterior result and Gamma normalization: independent \(Q\sim DP(U)\), \(Z\sim\mathrm{Beta}(1,B)\) give \((1-Z)Q+Z\delta_b\sim DP(U+\delta_b)\); proved locally | Posterior logarithmic bounds and joint continuity; the original tangent coefficient stays \(\psi(B+1)\), not \(\psi(B+2)\) |
| E-S1 | SSV (2010 first edition), Theorems 6.10 and 7.3, printed pp.58–60 and 63, with the 2022-12-01 errata: reciprocal representation for nonzero Stieltjes functions, bounded phase and a.e. uniqueness | Jointly measurable representatives, boundary-recovery adaptations, scaling, weak-star limits and generator continuity |
| E-T1 (local theorem) | Sethuraman (1994), Section 2, (2.1), pp.642–643; Theorem 3.4, p.645: the DP law of stick-breaking with independent Beta break variables and independent base locations | Common-coordinate convergence as \(B,F,y\) vary, tail control and uniform integrability |

These locators come from the retained
[primary-interface audit](../notes/log-rate-power-proof-primary-interfaces.md)
and [reference map](../ledger/references.md).

E-J2/E-J3 retain arbitrary Polish/Borel base spaces `E` and finite positive
base measure U of real mass B>0. Current production consumers specialize E
to positive rates; this is not a restriction on the registered interfaces.
Preserve the following contract details:

- **Local bounded Markov-Krein:** For \(P\sim DP(U)\) and measurable
  \(0\le g\le C<\infty\), the proved formula is
  \(\mathbb E(1+\int g\,dP)^{-B}=\exp(-\int\log(1+g)\,dU)\).
  Boundedness supplies integrability for every probability P and finite U.
  The unused general E-J1 statement is retired, not an active assumption.
- **E-J2 (local theorem):** The nonnegative measurable identity is
  \(\mathbb E_{DP(U)}\int\Phi(b,P)P(db)
  =\int(U/B)(db)\,\mathbb E_{DP(U+\delta_b)}\Phi(b,P)\).
  Make joint measurability and random-measure evaluation explicit.
- **E-S1:** For \(s>0\), let \(M_P(s)=\int(s+b)^{-1}P(db)>0\).
  The anchor-one interface is
  \(\log M_P(s)-\log M_P(1)
  =\int_0^\infty\xi_P(t)((s+t)^{-1}-(1+t)^{-1})\,dt\),
  with \(0\le\xi_P\le1\) and a.e. uniqueness. Mark a directly registered
  specialization as source-derived. If boundary recovery uses the complex
  representation, retain its complex-domain contract; an insufficient
  real-axis interface does not supply the boundary formula.
- **E-T1 (local theorem):** For \(B>0\), take i.i.d. \(V_j\sim\mathrm{Beta}(1,B)\),
  i.i.d. \(Y_j\sim F\), and independence of the two sequences.
  Set \(W_j=V_j\prod_{i<j}(1-V_i)\), \(Q=\sum_jW_j\delta_{Y_j}\).
  The weights \(W_j\) are not independent. Prove unit total mass or include
  it in the precisely registered construction theorem. The residual-mass
  expectation \((B/(B+1))^m\) can support a local proof.

Do not mix SSV editions and page numbers. First-edition errata correct the
intermediate Herglotz measure's domain and finiteness and replace an equality
in Remark 6.11 by an inclusion. Do not use the erroneous reverse inclusion
or an additional zero-anchor formula. Any missing general boundary-recovery
or compactness theorem needs a proof or a separate source registration;
it is not automatically part of E-S1 or E-T1.

### 4.1 Core deductions excluded from the whitelist

The power tangent, posterior absolute drift bound, generator resolvent
identity, joint generator continuity, positive Euler evolution, dynamic
power-flow identification, finite Gamma power closure and final GGC power
closure must be proved locally, including equivalent reformulations.

Hiding these conclusions in typeclass instances, `ExternalFacts`,
`PowerAdmissible`, structure fields, local variables or a solution-existence
parameter still leaves the main proof incomplete.

## 5. Engineering and collaboration rules

### 5.1 Environment and API evidence

The current configuration pins `leanprover/lean4:v4.32.2` and mathlib commit
`905b95818eb32af7874a58b427f50c1711a5e96c` (the upstream `v4.32.2` tag).
The [toolchain](lean-toolchain), [Lake configuration](lakefile.toml) and
[manifest](lake-manifest.json) are source artifacts; `.lake/` is ignored.
Check any reused dependency cache against the manifest and verify its source
state before treating it as evidence for the pinned environment.

Handle upgrades separately and rebuild affected proofs. Lake's manifest
records concrete dependency versions and belongs in version control;
see the [official Lake documentation](https://lean-lang.org/doc/reference/latest/Build-Tools-and-Distribution/Lake/).

Use four API evidence levels:
`to_find → source_read → #check_passed → minimal_use_compiled`.
Record revision, imports, full declaration name and verification result.
Online `latest` documentation is a navigation aid. Prefer `rg` for searches;
failure to find one guessed name does not establish that a theory is missing.

### 5.2 Files and declarations

<a id="external-interface-lifecycle"></a>
#### Lifecycle of a formalized external interface

**User instruction, 2026-09-25:** once an external mathematical axiom has been
formalized as a project theorem, its public theorem and any compatibility
wrapper must leave `External/` and the `GGC.External` namespace. Put them in the
project module that owns the mathematics. Preserve the full mathematical
contract, source provenance and appropriate public consumer types. A literature
origin is not a reason to retain a locally proved interface under `External`.

- Designate the destination module and public name in the Blueprint. For future
  formalization deliveries, include this migration in the delivery and its
  acceptance gates. Existing accepted proofs remain accepted; schedule any
  remaining structural migration explicitly rather than claiming it already
  happened.
- Migrate callers, explicit imports, shared contract checks, audit requests and
  current inventories together. Do not retain an old `GGC.External` alias or
  forwarding wrapper/file. If a module still owns unproved axioms, keep those
  axioms there and remove only the proved interface and its now-unused imports.
  Delete a source module only when it has no remaining required declarations.
- Preserve an acyclic, independent lower proof layer. Remaining External axioms
  may import shared semantics but must not import consumer deductions or proved
  interface modules merely to re-export them. A proof still using another
  registered axiom must disclose that dependency; relocation alone never proves
  standard-logic-only status or a main-theorem axiom reduction.
- Keep literature citations and dated evidence. Distinguish a same-contract
  local proof, retirement of an unused interface, and a narrower replacement.
  Only the actual declaration inventory and transitive audit establish the
  remaining trust boundary.
- Synchronize current trust-boundary comments and documentation whenever that
  boundary changes, including `main.lean`. Comments must not count locally
  proved or retired interfaces as external axioms. Independent-audit findings
  become explicit Blueprint construction items; the designer records their
  disposition after checking the submitted correction. Auditor-owned reports
  and probes remain under their original ownership.

Locally proved wrappers have no exception to this rule. Do not delete
still-used axioms or weaken a theorem to move its name.

#### General module conventions

- The Blueprint owns the module tree. The public namespace is
  `GGC`, with external axioms only in `GGC.External`. Name files by
  responsibility and theorems by content; put WIP IDs in docstrings.
- Keep modules focused and imports specific. The human-audit entry point is
  `main.lean`, containing `GGC.ggc_rpow : GGC.GGCPowerClosure` with
  explicit approximation, finite-input closure, power-map convergence and
  weak-closure steps and mathematical comments. The complete required definitions
  and their construction proof fields belong in `Definitions.lean`, importing
  mathlib only. Detailed assembly remains in `GGC/PowerClosure.lean`; auxiliary
  lemmas keep their corresponding modules. No dependency of `main` may import
  it.
  External mathematical axioms must be placed in `External/` with complete
  types and source records. Extract reusable analysis lemmas rather than
  copying estimates.
- `classical` and `noncomputable` are allowed; neither proves existence,
  measurability or integrability. Automation must produce kernel-checkable
  proofs. Do not expand the default trust boundary to native evaluation.
- Do not globally suppress errors or material warnings. Split difficult
  goals before raising resource limits; document necessary local settings.
- Fix shared contracts and file ownership before parallel implementation.
  Notify consumers of interface changes and preserve others' uncommitted
  work. Formalization difficulty does not justify changing the conclusion.

Record each major declaration in [ConstructionReport.md](ConstructionReport.md), not in the blueprint, using:

```text
Node ID / WIP ID:
Mathematical statement and complete assumptions:
Proposed or actual Lean name and file:
Dependency nodes / external input IDs:
Source (ledger, TeX label or literature):
Status / exact remaining gap:
MathlibAPI.md entry IDs / reuse decisions / retained local-proof justification:
Verification commands, versions and results:
```

### 5.3 Incomplete proofs

Use `sorry`, `admit` and temporary core assumptions only in marked drafts.
Drafts must not enter the definition entry point, the verified helper/audit
modules, or the proof entry point's transitive import closure, and
must not count as completed nodes. The proof entry point is currently
`main.lean`. A genuine reduction theorem saying “the finite
Gamma case implies the general case” is useful early work, but must not use
the final theorem's name before its premise is discharged. An unregistered
axiom is not a substitute for completing a draft.

Treat the Blueprint as read-only during construction and follow its requirements.
Record `planned / in_progress / blocked / verified` and actual progress in
[ConstructionReport.md](ConstructionReport.md); do not update the Blueprint's status text.
A blocked node records the exact obstacle. A verified node needs a complete
proof, build evidence and a dependency audit. A file depending on an
unfinished draft is not verified merely because it contains no `sorry` itself.

## 6. Verification and completion criteria

For each module submitted for acceptance, include the
[reuse evidence](#mathlib-reuse-workflow) alongside its mathematical and axiom
checks. The designer checks the API mapping, preserved assumptions and the
reason for any retained generic foundation. This is part of the normal review,
not a separate permission step during construction.

The current statement and external contracts are checked by the default
library build. Run from `formalization`:

```powershell
lake env lean --version
lake build
lake env lean AxiomAudit.lean
```

The existing [AxiomAudit.lean](AxiomAudit.lean) prints the full target,
definitions, external contracts and axiom dependencies of the implemented lemmas.
It imports `main` and checks the actual main theorem.
Lake covers `main`, all `GGC` and `External` descendants, and the audit.
The audit prints both membership predicates, the endpoint condition, finite
Thorin data and the retained represented-law membership direction, and checks
the declarations' dependencies. Keep its requests aligned with the actual
declaration inventory.

`GGC.ggc_rpow` is included in the default build and the audit. The following
commands inspect its type, proof and actual transitive dependencies:

```lean
#check GGC.ggc_rpow
#print GGC.ggc_rpow
#print axioms GGC.ggc_rpow
```

`#print axioms` reports transitive axiom dependencies, including `sorryAx`.
It does not replace checking the theorem's meaning and hidden premises.
See the [Lean axiom reference](https://lean-lang.org/doc/reference/latest/Axioms/)
and [proof validation guide](https://lean-lang.org/doc/reference/latest/ValidatingProofs/).

Completion requires all of the following:

1. `GGC.ggc_rpow` retains the full target quantifiers. Its mathematical
   assumptions are GGC membership and \(q\ge1\), with no core premise,
   unconstructed instance or finite-moment restriction.
2. `IsGGC` uses the original finite-gamma weak-limit definition, independently
   of `HasThorinRepresentation`. Check actual product/sum and power-pushforward
   semantics, the retained represented-law membership direction, and the
   zero law, positive constant laws, \(q=1\) and a single Gamma law. A proof of
   representability alone does not establish original-definition membership.
3. Every required Blueprint node is recorded as `verified` in the construction
   report with evidence; all project
   core deductions have complete Lean proofs.
4. The proof entry point (`main.lean`), its supporting
   `GGC/PowerClosure.lean`, and `AxiomAudit.lean` build
   reproducibly in the pinned environment. Default targets include the main
   theorem and required modules; the audit additionally inspects the proof's
   transitive dependencies. Record toolchain, mathlib commit, commands, exit statuses
   and audit output.
5. The actual axiom set is a subset of
   `{propext, Classical.choice, Quot.sound}` and the registered, checked
   external mathematical declarations. No `sorryAx`, unregistered axiom or
   extra native-evaluation trust dependency is permitted.
6. Inspect the full theorem type and dependent definitions: no circular
   definitions, vacuous assumptions, default-integral loopholes or
   function/typeclass parameters that merely assume the main result.

An accurate completion statement is: “The project's GGC power closure
derivation has been verified in Lean relative to the listed literature
axioms.” Claiming a full formalization without external mathematical axioms
also requires Lean proofs of those inputs.
