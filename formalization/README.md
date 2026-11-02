# GGC Power Closure: Governance and Project Rules

The public theorem [GGC.ggc_rpow](main.lean) establishes closure of every
nonnegative GGC probability law under every deterministic real power q >= 1,
using the original finite-gamma weak-limit definition. The accepted trust
boundary is Lean's standard logical axioms plus **E-S1**, the SSV phase
representation assumption. E-S1's local formalization is outside the agreed scope.

The [Acceptance Report](AcceptanceReport.md) owns current design-acceptance
conclusions. The [Audit Report](AuditReport.md) owns independent audit conclusions
and their source snapshots. Project closure of F-01/F-02 is recorded; a
post-repair auditor recheck is not recorded. These are separate statuses.

This README is the single governance specification for roles, permissions,
handoffs and evidence states. [Blueprint.md](Blueprint.md) owns current
mathematical and technical contracts. Maintain these documents and all Lean
comments/docstrings in English, preserving Lean identifiers and notation.

<a id="document-ownership"></a>
## 1. Document ownership and history

| Artifact | Purpose | Maintainer |
|---|---|---|
| This README | Role permissions, handoffs, evidence states, maintenance and completion rules | Designer |
| [Blueprint](Blueprint.md) | Current target, full contracts, dependency graph, module owners, construction order and acceptance gates | Designer; read-only during construction |
| [Acceptance Report](AcceptanceReport.md) | Only unresolved project issues and currently valid acceptance conclusions | Designer |
| [Audit Report](AuditReport.md) | Independent scope, findings, evidence, conclusions and auditor rechecks | Auditor |
| [Mathlib API index](MathlibAPI.md) | Current reuse decisions, actual applications, compatibility and scoped gaps | Designer and constructor jointly |
| [Checks rules and inventory](Checks/README.md) | Check-specific execution, ownership, evidence and retirement | Respective check maintainers under this README |
| [External inventory](External/README.md) | Exact literature contracts, versions, source locators and adaptations | Constructor supplies provenance; designer maintains contract consistency; auditor owns audit judgments |
| [Ledger](../ledger/README.md), [WIP](../WIP.md), [manuscript](../manuscript/ggc-power-closure.tex) | Written mathematics and presentation | Their existing owners |
| [ResearchStatus](../ResearchStatus.md) | Mathematical research assessment | Its existing owner; report changes do not themselves change mathematics |

Keep one authoritative home for each fact. Other files link to it. In particular,
the Blueprint and API index do not maintain a second acceptance or audit ledger.
Constructors deliver implementation and self-check evidence through the work
handoff; permanent mathematical/API knowledge belongs in its owner module or
index, rather than an accumulating construction diary.

Both reports describe current effective records. Replace superseded text and
remove resolved project issues from the pending list; do not append dated
completion diaries. Keep supporting evidence within the relevant conclusion.
Use stable IDs, including existing F-01/F-02, rather than renumbering each cycle.
Retain effective conclusions and exact evidence boundaries when pruning.

Full old records live in Git. The pre-reorganization reference is commit
`4ddc3967c568ee99268f72ae8d443da7641d0fe1`; for example:

```powershell
git show 4ddc3967c568ee99268f72ae8d443da7641d0fe1:formalization/ConstructionReport.md
git show 4ddc3967c568ee99268f72ae8d443da7641d0fe1:formalization/SemanticAudit-2026-09-25.md
```

Historical citations use immutable commit/file/line references. New current
references use the live reports and stable IDs. A renamed report or editorial
consolidation does not constitute a new acceptance, independent review or
transfer of report ownership. Ignored logs and local reference-library files
are supplemental; retain commands, revisions, source identities and the
essential evidence in tracked artifacts or their cited Git history.

<a id="roles-and-permissions"></a>
## 2. Roles and permissions

| Role | Responsibilities | Permissions and limits |
|---|---|---|
| Designer | Specify and revise complete contracts, dependency/module boundaries and acceptance gates; address design defects; examine deliveries and necessary evidence; decide design acceptance and project disposition | Maintains this README, Blueprint and Acceptance Report. May maintain ordinary shared checks and API decisions. Assigns production implementation/repair to the constructor. Records responses to audits without editing auditor judgments or auditor-owned check logic |
| Constructor | Implement proofs and interface migrations; search/reuse mathlib; establish side conditions; run affected self-checks; submit exact gaps, source snapshot and reproducible evidence | Edits authorized production modules and ordinary shared checks/API entries. Treats Blueprint as read-only; proposes contract revisions to the designer. Does not weaken the target, add unregistered assumptions, write acceptance decisions or claim independent audit completion |
| Auditor | Choose independent methods and scope; inspect both design and implementation, definitions, hidden premises, axiom boundaries and source adaptations; record findings and actual rechecks | Maintains Audit Report and auditor-owned probes. Can challenge Blueprint and acceptance baselines. Does not take over implementation or design acceptance through an audit finding; sends proposed corrections and evidence to the designer |

Document the acting role and scope at handoff. Independence is relative to the
work examined: designer reruns can be independent of construction while still
examining the designer's own contract. They are **design acceptance**, not an
auditor review of that contract. Disclose participation in the audited design or
implementation; assigning a new role label does not make self-review independent.
An independent conclusion for work in which the reviewer participated requires
a reviewer who did not perform that work.

Designers and constructors may maintain ordinary shared checks with a stated
reason. An auditor owns the judgment logic and conclusions of independent
checks; other roles propose changes. Deleting or replacing auditor-owned
evidence requires the auditor's confirmation unless the user explicitly directs
the change. User human-check files retain their ownership. Shared maintenance
never transfers an independent report or turns a check's creator into its reviewer.

<a id="evidence-states"></a>
## 3. Separate evidence states

| Layer | Conclusion owner | Meaning and required evidence |
|---|---|---|
| Construction self-check | Constructor | What the submitted implementation passed or failed at a specified snapshot; exact commands/results, dependency sets and remaining gaps |
| Design acceptance | Designer | Whether that delivery satisfies the complete specified contract; scope, source snapshot, actual inspections/reruns, decision and limitations |
| Independent audit | Auditor | What was independently examined at an identified snapshot, by which method, with which findings, conclusions and coverage limits |

`verified`, if retained in a project status, means **design acceptance passed
within its stated trust boundary**. It does not imply independent audit coverage.
Construction uses self-check/submission language until the designer accepts it.
Keep API evidence levels (`source_read`, `minimal_use_compiled`, etc.) separate
from both design acceptance and audit judgments. File presence, successful
compilation and a printed axiom list each establish only their actual scope.

Every material conclusion identifies the source commit or working-tree hash
snapshot, Lean version, mathlib revision, checked contracts and actual commands
with exit statuses. Distinguish cached/default builds, project-only clean builds,
direct source elaboration and clean dependency rebuilds. Match axiom requests
and outputs by declaration and multiplicity and compare actual sets to the
allowed boundary. Counts are observations for that snapshot, not permanent
acceptance constants or proof-completion metrics.

<a id="handoff-workflow"></a>
## 4. Handoffs and findings

1. **Design:** the designer publishes current contracts, owners and acceptance
   gates in Blueprint. Contract questions or counterevidence go to the designer;
   routine implementation and reuse choices within the contract need no new
   permission step.
2. **Construction:** the constructor implements and submits the affected files,
   stable contract/API IDs, source snapshot, self-check commands/results,
   actual axiom sets, boundary cases and exact remaining gaps. Mathematical
   scope changes are explicit design items, not silent compilation fixes.
3. **Acceptance:** the designer examines the actual types/semantics and sufficient
   fresh evidence, then records accepted, partially accepted, returned or pending
   evidence in Acceptance Report. Receiving a constructor log alone is not an
   independently performed rerun.
4. **Audit:** the auditor chooses scope and methods and records findings in
   Audit Report. Audit can examine the design before, during or after construction;
   it is not restricted to testing compliance with a possibly mistaken Blueprint.
5. **Response and repair:** the designer records the project response and any
   contract revision. The constructor repairs production/check implementations;
   the designer checks the repair and records project disposition.
6. **Auditor recheck:** the auditor records any actual re-examination against the
   specified repaired snapshot and updates the audit conclusion. Never infer this
   step from designer acceptance, document renaming or issue removal.

<a id="finding-disposition"></a>
### Project closure and auditor recheck

These are two axes with different owners:

| Axis | Examples | Authoritative record |
|---|---|---|
| Project disposition | Unresolved; repair awaiting acceptance; project closed after verified repair; explicitly withdrawn within scope | Acceptance Report, maintained by designer |
| Auditor recheck | Not rechecked; rechecked with no remaining issue; rechecked with an issue still present; unable to verify | Audit Report, maintained by auditor |

Designer closure must state the remedy and evidence, with a link to the audit
finding. It does not erase the finding at its original snapshot, validate an
earlier mistaken acceptance or mean that the auditor has rechecked it. This
workflow does not require auditor sign-off for every project closure. Preserve
the auditor's last actual conclusion and label missing post-repair coverage.

Each pending issue records ID, precise statement and affected scope, severity,
responsible role, next action and closure condition. Distinguish defects in the
main result from interface, documentation and evidence defects. For substantive
disagreement, retain the finding, response and counterevidence with the affected
acceptance scope unresolved or qualified; administrative closure cannot settle
a mathematical correctness or trust-boundary objection.

<a id="report-maintenance"></a>
### Rolling report maintenance

Acceptance Report has only two substantive sections: **Unresolved issues** and
**Current acceptance conclusions**. The designer replaces obsolete text each
cycle, removes resolved items from the first section and retains still-valid
acceptance conclusions with their evidence. Constructor delivery diaries,
experiments and repeated full logs are excluded. Historical details use Git.

Audit Report is one auditor-maintained Markdown document. It centralizes the
latest recorded scope/verdict, findings and recheck states, necessary evidence
and a compact index of earlier reviews. Replace superseded current summaries
while preserving findings/limitations that remain relevant; full prior text
stays in Git. Historical wording such as "current" is bound to its original
snapshot. Only an actual auditor recheck changes an auditor conclusion.

<a id="mathematical-standards"></a>
## 5. Mathematical standards and trust boundary

Use actual measures, integrals and distributions. `Definitions.lean` must import
mathlib only and give complete gamma/product/sum, original GGC weak-limit and
power-pushforward definitions. The target has every real q >= 1, includes zero
and constant laws, drift and infinite Thorin mass, and adds no moment hypothesis.
Keep Thorin representability separate from original membership. Definitions,
typeclass instances and weak-solution fields must not assume the core result.

Preserve full elaborated types, quantifier order, domains and endpoint cases.
In particular, public E-J2/E-J3 require only `[MeasurableSpace E]`; the former
Polish/Borel baseline was wrong. Prove all measurability, normalization,
absolute-integrability, positivity and domination conditions used by Fubini,
differentiation, logarithms and limit passages. Total real integrals or functions
outside their meaningful domain do not discharge those conditions.

Remove construction-only restrictions by proved extension steps. The current-law
tangent, canonical measurable phase, specified generator, continuity, positive
Euler evolution, dynamic identification and final power closure are local
deductions. They cannot be registered as literature assumptions or hidden in
structures, parameters or unconstructed instances. Finite computation and API
probes prove only their stated bounded claims, not the analytic theorem.

<a id="external-inputs"></a>
### External inputs

The sole active external mathematical axiom is
`GGC.External.SSV.phase_representation` (E-S1), beyond `propext`,
`Classical.choice` and `Quot.sound`. The exact contracts and source provenance
are in [External/README.md](External/README.md). E-B1, E-B3, E-J2, E-J3 and E-T1
are locally proved; the bounded Markov-Krein formula is a proved specialization.
The general unbounded E-J1 interface, unused E-B2/converse/equivalence and E-B4
fallback are retired/withdrawn, not claimed as local proofs. RV-1 is withdrawn.

Precisely audited literature results may be registered only within authorized
scope, with stable ID, complete source/version/page locator, full primitive
type, consumers and adaptation obligations. Prove local specializations by
default; label directly registered specializations as source-derived. Do not
add conclusions absent from the source or re-axiomatize mathlib results.

The constructor prepares source material and self-checks the edition, full
hypotheses/conclusions, branches, signs, anchors and errata. The designer can
review it for design acceptance; the auditor records independent source
judgments in Audit Report. File availability and self-check do not certify
source correspondence. E-S1 source review is recorded, but E-S1 remains an axiom.

<a id="external-interface-lifecycle"></a>
### Lifecycle of locally proved literature interfaces

When an external input is proved locally, its public theorem and compatibility
wrapper leave `External/` and `GGC.External`. The designer specifies the owner
and contract; construction migrates callers, imports, shared checks, axiom
requests and inventories together. Keep provenance and full consumer types.
Do not retain old External aliases or forwarding files. Delete an empty old
assumption module only after all required declarations move.

Maintain an acyclic independent lower proof layer. Remaining assumptions must
not import their consumer deductions or proved facades merely for re-export.
Relocation does not establish axiom reduction: inspect actual transitive sets.
Distinguish same-contract proofs, bounded specializations and retired interfaces.
Update current trust-boundary comments while preserving immutable old evidence.

<a id="mathlib-reuse-workflow"></a>
## 6. Mathlib reuse and engineering

Pin Lean/mathlib through `lean-toolchain`, `lakefile.toml` and the manifest.
Use the installed pinned source as API evidence, with `rg --files` and `rg`.
Before substantial implementation or a new generic foundation:

1. State the full contract and decompose distribution semantics, measure
   transport, regularity, integration and limit obligations.
2. Search specific names, mathematical synonyms and general structures. Read
   the closest pinned declarations and call sites; a failed guessed name does
   not establish a library gap.
3. Prefer standard objects and shared thin adapters. Preserve probability,
   shape/rate and sign conventions, Giry/Borel structures and null-set scope.
4. Read the full type and compile a real application to the project's objects.
   A `#check` or an assumed target is not a proof that the API applies.
5. Record candidate, owner, pin, exact mismatch, decision, tracked application
   and evidence level in MathlibAPI. Scope negative search results and record
   the next useful search trigger.
6. Re-search when stalled by a plausible representation/API mismatch or before
   duplicating a generic proof. Stop at a compiled use or a concrete gap and
   justified local route. Search failure does not authorize extra hypotheses.

Designer and constructor share MathlibAPI: constructors record searches and
compiled uses; designers record compatibility/reuse decisions and acceptance
references. Neither silently overwrites another role's evidence. Actual
acceptance remains in Acceptance Report. Reuse counts and shorter proofs are
not completion measures; use the [module gate](Blueprint.md#module-reuse-gate).

<a id="checks-governance"></a>
### Checks and source maintenance

[Checks/README.md](Checks/README.md) supplies check-specific rules and inventory
under this governance. Designer checks support design/API decisions; constructor
checks support delivery and boundaries; auditor checks support independent
judgments. Record creator separately from maintainer and reviewer. Production
must not import Checks, which run by explicit commands outside default globs.
Durable checks require purpose, scope, owner, command and evidence; no `sorry`
or new axiom is allowed. A filename does not establish independent ownership.

Prefer tracked production evidence to duplicate probes. Keep temporary work in
`.lake/` or ignored `tmp/`; adopted design evidence needs a tracked application
or reproducible command/source description. Retire redundant shared checks
with replacement references while preserving historical results in Git.

Agree contracts and file ownership before concurrent implementation. Preserve
others' changes and notify consumers of interface revisions. Keep generic
foundations separate from consumers, modules acyclic and declarations in their
mathematical owners. Use local resource settings only when necessary and
documented; do not suppress material errors/warnings globally.

Marked drafts may contain incomplete work, but no draft, `sorry`, `admit`,
unregistered axiom or equivalent assumption may enter the verified import
closure of `main`. A reduction with an undischarged finite-input premise is
not the final theorem. Formalization difficulty does not change the target.

<a id="verification-and-completion"></a>
## 7. Verification and completion

Run relevant checks from `formalization` with the pinned toolchain:

```powershell
lake env lean --version
lake build
lake env lean -t 0 AxiomAudit.lean
lake env lean ForHumanCheck.lean
lake env lean Checks/E3BetaGammaContract.lean
lake env lean Checks/E3GammaDirichletContract.lean
lake env lean Checks/E3MarkovKreinContract.lean
lake env lean Checks/E4SizeBiasContract.lean
lake env lean Checks/E4StickBreakingContract.lean
lake env lean Checks/E4PalmContract.lean
lake env lean Checks/ThorinInterfacesContract.lean
```

Default targets cover Definitions, main, all GGC/External descendants and
AxiomAudit. Checks and the user human-check file are separate. Check
`#check GGC.ggc_rpow`, `#print GGC.ggc_rpow` and `#print axioms GGC.ggc_rpow`
against the full target and whitelist. Printing the proposition definition
alone does not verify its proof. Match actual dependency sets, not only counts.

Completion requires the full original-definition theorem, actual law semantics
and endpoint cases; local proofs for every required core deduction; removal of
intermediate restrictions; reproducible checked source and dependencies; and
no circular/vacuous premise, unfinished imported proof, unregistered axiom or
extra native-evaluation trust dependency. Record design acceptance and
independent audit coverage separately, with their material limits.

Run checks appropriate to the change. Assess source/snapshot differences before
carrying a conclusion forward. A documentation reorganization does not require
rebuilding unrelated mathematics and does not constitute a new source-literature
audit, clean rebuild or line-by-line independent mathematical rederivation.

The accurate mathematical completion claim is: the project's GGC power-closure
derivation is verified in Lean relative to E-S1. Publication, external mathematical
peer review and elimination of E-S1 are separate claims requiring their own evidence.
