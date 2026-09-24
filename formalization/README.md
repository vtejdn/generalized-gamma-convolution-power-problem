# GGC Power Closure: Lean Formalization Principles and Rules

Updated: 2026-09-24. Construction plan: [Blueprint.md](Blueprint.md).

The main theorem is **GGC power closure**:

\[
X\in GGC,\qquad q\in\mathbb R,\quad q\ge1
\quad\Longrightarrow\quad X^q\in GGC.
\]

This is a deterministic real power of the same nonnegative random variable.
The final theorem covers every GGC probability law, including nonzero drift,
infinite Thorin mass and degenerate laws. Finite support, shape bounds,
moment conditions and finite Thorin mass must not remain as extra hypotheses.

**Current status: `GGC.ggc_rpow : GGC.GGCPowerClosure` is implemented in
[GGC/PowerClosure.lean](GGC/PowerClosure.lean) and compiles relative to the
registered literature inputs.** The definition entry point is
[main.lean](main.lean), which contains all project-specific definitions needed
to read the complete target. `import GGC.PowerClosure` exposes its genuine
proof; `AxiomAudit.lean` checks the fully expanded type and transitive axioms.
The project's mathematical assessment in [ResearchStatus](../ResearchStatus.md)
is separate from Lean verification. M0 and M1 are accepted: Laplace uniqueness,
Thorin endpoint equivalence, finite-atomic adapters, the characterization and
constant-law membership are now proved, alongside the earlier weak reduction.
The characterization uses the existing E-B2/E-B3 axioms; no E-B4 was added.
The earlier conditional reduction is now supplied with the finite-input power
theorem. For the accepted base, see the
[M1 acceptance](ConstructionReport.md#m1-design-acceptance-2026-09-23).
M2–M7 implementations are complete and pass the build/axiom audit relative to
the registered literature inputs; independent design acceptance is pending.
The [M2 report](ConstructionReport.md#m2-completion-2026-09-24) and
[M3 report](ConstructionReport.md#m3-completion-2026-09-24) record their
contracts, evidence and remaining later-stage obligations. The
[M2 completion check](ConstructionReport.md#m2-quantile-completion-2026-09-24)
records the integrated ordered-quantile realization. The
[M4 completion report](ConstructionReport.md#m4-completion-2026-09-24)
adds a.e. common-space coupling of the actual Dirichlet/posterior samples,
joint continuity of the actual generator, and continuity after integration
against varying laws. Its proof combines the L¹ phase-pairing results,
common integrable posterior bounds, local uniform convergence and tightness.
M5's [Euler construction report](ConstructionReport.md#m5-euler-foundation-2026-09-24)
records the actual Markov kernel, exact increment moments, nonlinear law
iteration, uniform second moments, tightness and local consistency estimates.
The [M5 completion report](ConstructionReport.md#m5-completion-2026-09-24)
adds uniform time control, one subsequence of whole narrowly continuous curves,
the limiting weak equation and `LogRate.exists_weakLogRateSolution`.
The latest clean project build passes 3939 jobs and freshly compiles all 136
project Lean modules, with 883 declarations checked by the independent axiom
audit. M6's [moment and continuity report](ConstructionReport.md#m6-moments-continuity-2026-09-24)
records admissibility, strict positivity, uniform absolute logarithmic moments,
narrow continuity on real and positive value spaces, and an actual Borel kernel.
The [M6 endpoint report](ConstructionReport.md#m6-endpoint-2026-09-24) adds joint
Borel measurability, absolute space-time integrability of the full tangent,
zero-endpoint bounds and the justified Fubini identity. The
[M6 test extension report](ConstructionReport.md#m6-test-extension-2026-09-24)
extends the weak equation to linearly growing C² tests with bounded first and
second derivatives. The [M6 Laplace evolution report](ConstructionReport.md#m6-laplace-evolution-2026-09-24)
adds the resolvent time equation, zero-endpoint normalization and actual Laplace
time evolution. The [M6 value and transport equation report](ConstructionReport.md#m6-log-transport-2026-09-24)
adds simultaneous C¹ approximation, the compact value-test equation and the
actual log-value transport equation. The [M6 completion report](ConstructionReport.md#m6-completion-2026-09-24)
adds backward-test partition uniqueness and the actual power-law identification.
The [M7 completion report](ConstructionReport.md#m7-completion-2026-09-24)
records finite initial data, final assembly and successful clean-build/audit
verification. The final proof uses seven literature axioms: E-B1, E-B3,
E-J1–3, E-T1 and E-S1, beyond the standard logical axioms. The clean build
uses `LEAN_NUM_THREADS=2` after an initial memory-allocation failure; pinned
dependency caches are retained and the report preserves both attempts.
The layout and historical evidence below describe the accepted M0/M1 base.

**Implemented migration (2026-09-23):** `main.lean` now uses the
original definition of `IsGGC` as a weak limit of actual finite gamma
convolutions, retaining all definitions needed to read `GGCPowerClosure`.
Thorin representability is a separate predicate. Its characterization now
follows the local E-B2/E-B3 bridge (route 2) in the
[definition contract](Blueprint.md#original-ggc-definition).
Auxiliary lemmas have moved to their proof modules; the genuine final proof belongs
to `GGC/PowerClosure.lean`. The [migration contract](Blueprint.md#statement-proof-separation)
specifies ownership and acceptance. No new external axiom was needed for this
migration or the characterization. The full power-closure proof is now implemented.

## Current project layout

```text
formalization/
  lean-toolchain          Lean 4.32.2
  lakefile.toml           default GGCPower library target
  lake-manifest.json      exact dependency revisions
  Blueprint.md            design, interfaces, milestones and acceptance criteria
  MathlibAPI.md           shared API mapping, reuse decisions and search gaps
  ConstructionReport.md   implementation reports, build evidence and axiom audits
  main.lean               original GGC definition and complete target statement
  GGC/
    Basic.lean            law and power-pushforward lemmas
    FiniteGamma.lean      product/sum semantics, membership and Laplace formulas
    Laplace.lean          integrability, normalization, bounds and uniqueness
    WeakClosure.lean      original-definition closure in the weak topology
    Reduction.lean        conditional finite-input-to-general power reduction
    Thorin.lean           admissibility, atomic data, characterization, realization
    Foundations/         generic analytic and random-measure foundations
    LogRate/             specified generator, continuity, Euler scheme and weak solution
    Identification/      moments, endpoint control, weak transport and power-law identification
    PowerClosure.lean    proved finite-input theorem and complete GGC power closure
  AxiomAudit.lean         declaration and axiom inspection
  External/
    Bondesson.lean        complete E-B1, E-B2 and E-B3 axiom contracts
    README.md             external-input inventory and source adaptations
  .lake/                  ignored dependencies and build products
```

The current external contracts use explicit measure and Laplace formulas and
import mathlib or the designated independent shared semantics. `main.lean`
imports only mathlib and owns the public
definitions, with no dependency on external mathematical assumptions.

After this migration, `GGC.Basic` imports `main`, and proof modules
import the definitions, helper lemmas and external results they use. Adapters
belong in their corresponding proof modules. `main` imports mathlib only and
does not import its consumers. Its former unused `External.Bondesson` import
has been removed. `GGC.PowerClosure` assembles the final proof, and `AxiomAudit`
imports and inspects that proof entry point. Thus the complete definitions
remain readable in `main` without an import cycle. The final theorem is available through
`import GGC.PowerClosure`, rather than through `import main`.

## 1. Document responsibilities

| Content | Maintained in |
|---|---|
| Principles, trust boundary, development and acceptance rules | This README |
| Read-only construction specification: dependency graph, interfaces, modules and acceptance criteria | [Blueprint](Blueprint.md) |
| Shared mathlib API mapping, compatibility decisions, evidence pointers and search gaps | [Mathlib API](MathlibAPI.md), jointly maintained by designer and constructor |
| Current milestone status, implementation/completion reports, API evidence, build results and axiom audits | [Construction Report](ConstructionReport.md) |
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
   theorem; external interfaces must not import project deductions.
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
   should import them rather than copy proofs. Preserve `main.lean`'s complete
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
list**, seeded from the [2026-09-24 reuse audit](ConstructionReport.md#mathlib-reuse-2026-09-24).
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
must be version-controlled, for example in a proposed
`Checks/MathlibReuse.lean`, and included in the default build or an explicitly
documented acceptance command when created. `.lake/` is suitable for temporary
experiments and logs, but cannot be the only home of an adopted design's
reproducible evidence. Do not count a probe as completion of its consumer.
Record evidence against the pinned revision; a dependency upgrade is a
separate change requiring renewed compatibility/build checks.

At review, justify retained generic definitions and substantial foundational
proofs against the closest library alternative. Check the adapter semantics,
unchanged mathematical scope, build coverage and axiom dependencies. A
library-backed replacement must discharge the same obligations as the proof
it replaces. The Blueprint's [module reuse gate](Blueprint.md#module-reuse-gate)
turns this workflow into module-level construction and acceptance requirements.

## 3. Shared modeling conventions

Laws and power pushforwards are implemented in [main.lean](main.lean).
The original finite-gamma weak-limit definition is implemented. The separate
Thorin predicate lives in `GGC/Thorin.lean`; its characterization is accepted
relative to E-B2/E-B3. Random-measure realizations, canonical phases and the
averaged generator/resolvent identity are implemented and build/audit verified;
weak continuity, weak evolution and dynamic identification also pass the build
and audit. Final power closure is implemented. See the construction report
for declaration-level status.

### 3.1 Laws, powers and coordinates

- Use a law-first interface: `NonnegLaw` bundles
  `MeasureTheory.ProbabilityMeasure ℝ` with `∀ᵐ x ∂μ, 0 ≤ x`.
  Derive the random-variable statement by taking distributions at the end;
  different laws need not share a probability space.
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
at M0; see the [mathlib probability-measure documentation](https://leanprover-community.github.io/mathlib4_docs/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.html).

### 3.2 Original GGC definition, Thorin characterization and integrals

Define `gammaLaw`, `finiteGammaLaw`, `IsFiniteGammaConvolution` and `IsGGC`
completely in `main.lean`. A finite gamma convolution is the sum pushforward
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
and `thorinLaplace` are in `GGC/Thorin.lean`. The separate analytic predicate
is named `HasThorinRepresentation`. It asserts the existence of \(a\ge0\) and a measure
\(U\) on positive rates, with `Integrable` for \(\log(1+1/b)\), such that

\[
L_\mu(s)=\exp\!\left(-as-\int\log(1+s/b)\,U(db)\right),\qquad s>0.
\]

The mass of \(U\) need not be finite. Prove equivalence of this admissibility
convention with the classical endpoint conditions and integrability at every
\(s>0\). State `isGGC_iff_hasThorinRepresentation` for all `NonnegLaw`, including
zero/constant laws and nonzero drift. Realization of arbitrary admissible
Thorin data remains the separate E-B1 existence input.

First assess reuse of mathlib and local proofs. A short derivation from the
already declared E-B2/E-B3 is also acceptable, but it still depends on
literature axioms. If the full bridge requires substantial new work, E-B4
below is an authorized fallback. Record the selected route and exact axiom
dependencies; do not add E-B4 redundantly when E-B2/E-B3 settle the bridge
cheaply. The characterization must never become an extra hypothesis of the
main theorem. See [Blueprint Section 2.1](Blueprint.md#original-ggc-definition)
for the two directions and semantic acceptance cases.

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
Do not re-axiomatize mathlib results. E-B1, E-B2 and E-B3 are implemented in
[External/Bondesson.lean](External/Bondesson.lean). E-J1–E-J3 are registered in
[External/James.lean](External/James.lean), using actual shared random-measure
semantics. E-T1 is registered with explicit independent input and stick-sum premises;
E-S1 is registered with the real anchor-one and upper-half-plane complex contracts.
Boundary recovery is proved locally. The [external inventory](External/README.md) identifies the exact
declarations and adaptations. E-B3 returns finite atomic Thorin transforms;
`GGC.HasThorinRepresentation.isGGC` identifies its approximants with actual
finite gamma sums using the local transform certificate and Laplace uniqueness.

For every actual declaration, record its stable ID, full source and version,
theorem/formula/page locator, original statement or derived interface, exact
inputs and conclusion, consumers, local adaptation obligations and Blueprint
node. Additional literature inputs require the same registration.

Prove local specializations by default. If a literature corollary is directly
axiomatized, label it a **source-derived interface** and check every adaptation.
Do not append conclusions the source does not supply.

| ID | Permitted input and source locator | Work not supplied by that axiom |
|---|---|---|
| E-B1 | Bondesson (1992), Section 3.1, printed p.29 and pp.34–35: realization of Thorin-admissible data by a nonnegative probability law | Gives `HasThorinRepresentation`; original-GGC membership uses the separate characterization. No power closure input |
| E-B2 | Same book, Theorem 3.1.5, p.34: the declared primitive interface is weak closure of Thorin representability at a probability limit | Finite-gamma transform certificates connect this to the original-definition-to-representation direction. Original GGC weak closure is proved locally |
| E-B3 | Same book, final paragraph of p.35: the declared interface approximates every represented law by laws with finite-atomic Thorin transforms | Identify approximants with actual finite gamma sums using their transforms and Laplace uniqueness. This gives the representation-to-original-definition direction, not finite-input power closure |
| E-B4 — authorized fallback, not declared | Same book, Section 3.1 p.29, Theorem 3.1.5 p.34 and finite-gamma approximation p.35: original finite-gamma weak-limit membership iff Thorin representability, with exact source adaptations recorded | Use only if characterization work is substantial. Primitive full formulas in planned `External/ThorinCharacterization.lean`; public-predicate adapter and dependency audit remain local. No realization or power/evolution conclusion is added |
| E-J1 | James (2005), arXiv:math/0505606v1, reprint p.2, (1)–(3): Gamma normalization and Markov–Krein identities, with logarithmic integrability and independence | Substitution, normalization and identification of the particular tilted law |
| E-J2 | Same paper, pp.4–5, posterior formula and (8): nonnegative one-observation Palm/posterior identity for atomic, nonatomic and mixed bases | Absolute integrability before the signed version; arbitrary signed Fubini is not an input |
| E-J3 | A source-derived interface from the posterior result and Gamma normalization: independent \(Q\sim DP(U)\), \(Z\sim\mathrm{Beta}(1,B)\) give \((1-Z)Q+Z\delta_b\sim DP(U+\delta_b)\); alternatively prove locally | Posterior logarithmic bounds and joint continuity; the original tangent coefficient stays \(\psi(B+1)\), not \(\psi(B+2)\) |
| E-S1 | SSV (2010 first edition), Theorems 6.10 and 7.3, printed pp.58–60 and 63, with the 2022-12-01 errata: reciprocal representation for nonzero Stieltjes functions, bounded phase and a.e. uniqueness | Jointly measurable representatives, boundary-recovery adaptations, scaling, weak-star limits and generator continuity |
| E-T1 | Sethuraman (1994), Section 2, (2.1), pp.642–643; Theorem 3.4, p.645: the DP law of stick-breaking with independent Beta break variables and independent base locations | Common-coordinate convergence as \(B,F,y\) vary, tail control and uniform integrability |

These locators come from the retained
[primary-interface audit](../notes/log-rate-power-proof-primary-interfaces.md)
and [reference map](../ledger/references.md), not a new primary-text audit
performed during this documentation update.

E-J1–E-J3 require a finite positive base measure \(U\) on positive rates,
with real mass \(B=U((0,\infty))\in(0,\infty)\).
Preserve the following contract details:

- **E-J1:** For \(P\sim DP(U)\) and admissible \(g\ge0\),
  \(\mathbb E(1+\int g\,dP)^{-B}=\exp(-\int\log(1+g)\,dU)\).
  State a.s. finiteness of the random mean, or begin with a nonnegative
  extended integral and derive it.
- **E-J2:** First register the nonnegative measurable identity
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
- **E-T1:** For \(B>0\), take i.i.d. \(V_j\sim\mathrm{Beta}(1,B)\),
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
This compatible installed version was selected instead of requiring an
unrelated toolchain upgrade. The local dependency cache was copied only
after checking its revisions and clean source state against the manifest.

Handle upgrades separately and rebuild affected proofs. Lake's manifest
records concrete dependency versions and belongs in version control;
see the [official Lake documentation](https://lean-lang.org/doc/reference/latest/Build-Tools-and-Distribution/Lake/).

Use four API evidence levels:
`to_find → source_read → #check_passed → minimal_use_compiled`.
Record revision, imports, full declaration name and verification result.
Online `latest` documentation is a navigation aid. Prefer `rg` for searches;
failure to find one guessed name does not establish that a theory is missing.

### 5.2 Files and declarations

- The Blueprint owns the module tree. The public namespace is
  `GGC`, with external axioms only in `GGC.External`. Name files by
  responsibility and theorems by content; put WIP IDs in docstrings.
- Keep modules focused and imports specific. The human-audit entry point is
  `main.lean`; it contains the full main statement and its required definitions.
  Definition-internal proof fields remain with their objects; auxiliary lemmas
  live in the corresponding proof modules. The completed theorem will be
  exposed by `GGC/PowerClosure.lean`, with unchanged name `GGC.ggc_rpow` and
  type `GGC.GGCPowerClosure`. `main` must not import modules depending on it.
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
must not count as completed nodes. The proof entry point is
`GGC/PowerClosure.lean`. A genuine reduction theorem saying “the finite
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
It imports `GGC.PowerClosure` and checks the actual main theorem.
Lake covers `main`, all `GGC` and `External` descendants, and the audit.
The audit prints both membership predicates, the endpoint condition, finite
Thorin data and the characterization type, and checks the completed M0/M1
declarations' dependencies. No new characterization axiom has been added.

`GGC.ggc_rpow` is included in the default build and the audit. The following
commands inspect its type, proof and actual transitive dependencies:

```lean
#check GGC.ggc_rpow
#print GGC.ggc_rpow
#print axioms GGC.ggc_rpow
```

**Build evidence (2026-09-23):** the installed pinned Lean 4.32.2 toolchain's
Lake executable completed the default `lake build` with exit code 0, including
`External.Bondesson`, `main` and `AxiomAudit`. Dependencies were reused from
the verified local cache; this was not a fresh download or a rebuild of all
mathlib sources. The audit printed the complete external contracts and the
target proposition. `powerLaw_toMeasure`, `powerLaw_one`, `isGGC_diracLaw`
and `isGGC_powerLaw_one` depend only on `propext`, `Classical.choice` and
`Quot.sound`. Each external axiom's audit lists itself as an assumption,
as expected. No main-theorem proof or final-theorem axiom audit is claimed.

**Design-review acceptance rerun (2026-09-23):** in this review environment,
the generic elan-shim invocations `lake env lean --version` and `lake build`
failed with `couldn't find value of ELAN_HOME` (exit code 1). The already
installed pinned toolchain worked when invoked directly. From
`E:\AI\GitHub\generalized-gamma-convolution-power-problem\formalization`,
the actual successful commands were:

```powershell
& 'C:\Users\Jdn\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean --version
& 'C:\Users\Jdn\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\Jdn\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

All three succeeded (exit code 0). The version was Lean 4.32.2, commit
`f3b06c705e6c85f5314019d5d3baab0fec5b580c`; the build reported
`Build completed successfully (2549 jobs)` and replayed the cached audit.
The separate audit command also passed and printed the same target,
three external assumptions and elementary-lemma dependencies recorded above.
This was cached-project validation, not a clean rebuild of mathlib, and no
environment configuration or implementation was changed. The direct path
is machine-specific; on another machine use its installed pinned toolchain.
The [design review](ConstructionReport.md#design-review-2026-09-23)
records the contract corrections and remaining acceptance obligations.
M0 remains `in_progress`; the main theorem has not been proved.

These historical build records precede the definition/helper migration. They
validate the former representation-based scaffold only. In particular,
the recorded `isGGC_diracLaw` proof establishes representability; original
membership needs a new argument. The migrated proof is accurately named
`hasThorinRepresentation_diracLaw`; positive-constant GGC membership and the
Thorin characterization remain M1 obligations. Current migration evidence
is recorded separately below.

**Original-definition migration check (2026-09-23):** from the same working
directory and using the pinned Lake executable shown above, `build` succeeded
with exit code 0 (`2781 jobs`, with cached mathlib dependencies). It compiled
the rewritten `main`, `GGC.Basic`, `GGC.FiniteGamma`, `GGC.Laplace`,
`GGC.Thorin` and the updated `AxiomAudit`. The statement imports mathlib only;
the actual product/sum law and weak-limit definition are visible in its source.
The audit prints both `IsGGC` and `HasThorinRepresentation`. All audited local
lemmas, including the single-gamma/zero membership cases, constant-power
identity and weak-convergence adapter, use only the three standard logical
axioms. The three external contracts are unchanged. No new axiom or unfinished
proof was added. The target's quantifiers are preserved, but its membership
predicate now has the requested original semantics. Characterization and
the final power-closure proof remain pending; M0 is still `in_progress`.

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
   semantics, the separate characterization and its dependencies, and the
   zero law, positive constant laws, \(q=1\) and a single Gamma law. A proof of
   representability alone does not establish original-definition membership.
3. Every required Blueprint node is recorded as `verified` in the construction
   report with evidence; all project
   core deductions have complete Lean proofs.
4. The proof entry point `GGC/PowerClosure.lean` and `AxiomAudit.lean` build
   reproducibly in the pinned environment. Default targets include the main
   theorem and required modules; checking `main.lean` alone checks the
   statement layer. Record toolchain, mathlib commit, commands, exit statuses
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

The present deliverables include the complete target and its proof, with the
original finite-gamma weak-limit definition preserved. Construction evidence
and independent design acceptance remain distinct; see the latest completion
record in [ConstructionReport.md](ConstructionReport.md).
