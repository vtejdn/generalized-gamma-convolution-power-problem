# Reproducible auxiliary checks

**F-01 constructor repair:** the active E3GammaDirichlet and E4Palm examples
now instantiate the public names with only `[MeasurableSpace E]`, as required by
[Blueprint Section 28](../Blueprint.md#final-audit-closeout). All boundary
examples and 28 suite axiom outputs are retained. Construction validation is in
[Section 55](../ConstructionReport.md#f01-constructor-repair-2026-09-25);
designer interface reacceptance is complete in
[Section 56](../ConstructionReport.md#f01-designer-acceptance-2026-09-25).

Policy approved by the user on 2026-09-25. This directory holds durable checks
supporting design, construction and independent review. It is not a production
proof layer. The parent [project rules](../README.md#checks-governance) adopt
this policy; the [Blueprint](../Blueprint.md) owns mathematical contracts.

## Roles and ownership

| Role | May create | Responsibilities |
|---|---|---|
| Designer | Mathlib API-use probes and interface contract checks supporting design decisions | State the verified scope, remaining gaps and construction acceptance requirements. |
| Constructor | Compatibility, contract and necessary regression checks supporting implementation | Run affected checks on submission, record results and propose retirement when production proofs cover a probe. |
| Independent reviewer | Independent type, axiom, definition-semantics and boundary checks | Choose the review method and record an independent conclusion; a constructor's passing log alone is not independent verification. |

Creation role and review role are distinct. A constructor-authored check can
be independently rerun and inspected, but does not thereby become authored by
the independent reviewer. A filename containing `Contract` or `Independent`
does not establish ownership or acceptance.

## Admission and file header

Use `.lake/` for temporary exploration and logs. Add a file here only when it
supports a formal design decision, delivery or review conclusion and needs to
be reproducible. Prefer existing production evidence; do not duplicate checks
whose purpose is already adequately covered.

Each Lean file must have an English header specifying:

- Creating role and current maintainer role; identify independent-review
  ownership explicitly where applicable.
- Blueprint node and API entry, or the exact review target when no API entry
  applies.
- Purpose, verified scope and exclusions. Distinguish an API call, type
  compatibility and an actual proof of the target theorem.
- An explicit command, its working directory and applicable pinned toolchain.
- Lifecycle status, evidence location and any production replacement.

Do not retain `sorry` or declare new axioms here. Explicit hypotheses in a
bounded check must be visible and documented; an assumed target equality or a
definition of its proposition is not a proof of that target.

## Execution and evidence

Production modules must not import `Checks`. Use explicit commands by default;
do not automatically add checks to the default production build. Record any
deliberate build integration and preserve the one-way dependency boundary.

Run commands from `formalization` with the project's pinned Lake/Lean toolchain.
For example:

```powershell
lake env lean Checks/E3BetaGammaContract.lean
```

The constructor runs checks affected by the submitted change and records the
command, revision or source snapshot, exit status, scope and relevant axiom
output in the construction report/API index. A printed axiom list still needs
comparison with the allowed set; printing it alone does not enforce that set.
The designer assesses contract preservation and evidence. The independent
reviewer chooses what to inspect, rerun or check by a separate method, and
records what was actually verified. Do not imply that a full build or an
independent review occurred when only a small check ran.

Successful API use does not prove its consumer. A full type check confirms
compatibility but does not by itself audit every semantic definition. Evidence
is tied to the checked source and dependency revision; changes require assessing
whether the previous conclusion still applies.

## Maintenance and retirement

Designer and constructor may maintain ordinary shared checks, recording the
reason and evidence impact of changes. Checks owned by an independent reviewer
must be explicitly marked. Other roles propose corrections rather than changing
their judgment logic without the reviewer's agreement. A previous review
conclusion does not automatically apply to a modified check.

When production proofs or a better check replace a file, its maintainer may
propose deletion with the replacement evidence and update current links.
Deletion or replacement of independent-review evidence requires the independent
reviewer's confirmation. Preserve dated results as historical records, clearly
separating them from current reproducible evidence. Do not accumulate duplicate
probes indefinitely or delete provenance along with obsolete checks.

## Current inventory

| File | Creating role / maintenance | Status and purpose |
|---|---|---|
| [E3BetaGammaContract.lean](E3BetaGammaContract.lean) | Constructor / shared designer-constructor | Active: E3.0, API-068. Applies the production theorem at the full primitive Blueprint type and prints its axioms. Independently rerun during design acceptance; not an independent-reviewer-owned artifact. |
| [E3MarkovKreinContract.lean](E3MarkovKreinContract.lean) | Constructor / shared designer-constructor | Active: E3.3, API-071. Checks the bounded formula, mean measurability/integrability, C=0, zero-mass coordinates, the unchanged consumer and t=0; prints seven standard-logic-only endpoint lists. Excludes the retired general E-J1 interface. Construction: [Section 45](../ConstructionReport.md#e3-three-construction-2026-09-25). Not an independent-reviewer-owned artifact. |
| [E3GammaDirichletContract.lean](E3GammaDirichletContract.lean) | Constructor / shared designer-constructor | Active: E3.1/E3.2 and E-J3 relocation, API-069/070/076. Checks the full joint law, all-zero extension, deterministic single-positive-coordinate case, zero selected shape and the historical E-J3 type with only a measurable-space instance; prints seven endpoint axiom lists. Construction evidence: [Section 43](../ConstructionReport.md#e3-one-two-construction-2026-09-25); designer rerun and acceptance: [Section 44](../ConstructionReport.md#e3-one-two-design-acceptance-2026-09-25). Not an independent-reviewer-owned artifact. |
| [ThorinInterfacesContract.lean](ThorinInterfacesContract.lean) | Constructor / shared designer-constructor | Active: Tidy-Thorin, API-075. Checks both relocated names against the original primitive types and prints their axioms; constructor validation is recorded in [Section 41](../ConstructionReport.md#tidy-thorin-construction-2026-09-25). Independently rerun and inspected by the designer: [Section 42](../ConstructionReport.md#tidy-thorin-design-acceptance-2026-09-25). Not an independent-reviewer-owned artifact. |
| [E4SizeBiasContract.lean](E4SizeBiasContract.lean) | Constructor / shared designer-constructor | Active: E4.0, API-077. Checks zero and single-positive shapes, impossible positive-total empty vectors, and the actual stationary product law. Prints seven theorem axiom lists. |
| [E4StickBreakingContract.lean](E4StickBreakingContract.lean) | Constructor / shared designer-constructor | Active: E4.1, API-073. Preserves the complete original arbitrary-measurable-space input/Q contract and checks the zero prefix and mass-to-summability adapter. |
| [E4PalmContract.lean](E4PalmContract.lean) | Constructor / shared designer-constructor | Active: E4.2, API-072/078/080/081. Checks the historical measurable-only public contract, arbitrary K/Phi, zero finite measures, empty-base/zero-size partitions and an infinite-valued test. |

E4 construction evidence is in [Section 52](../ConstructionReport.md#e4-construction-2026-09-25).
These three checks were created by the constructor and independently inspected
and rerun by the designer. The designer added explicit instance application and
empty/universal/zero-mass-cell cases to the existing Palm check. All seven active
checks pass; [Section 53](../ConstructionReport.md#e4-design-acceptance-2026-09-25)
records acceptance without changing the original authorship or audit ownership.

All listed files are outside the default build globs. Current E3.0 proof and acceptance
evidence are the production module, the active contract check, the central
`AxiomAudit.lean` and [report Section 39](../ConstructionReport.md#e3-zero-design-acceptance-2026-09-24).
Files outside this directory, including user human-check files and the separate
semantic audit, are not transferred to shared ownership by this policy.


E3.3 designer acceptance: [Section 46](../ConstructionReport.md#e3-three-design-acceptance-2026-09-25).
The designer reran `E3MarkovKreinContract.lean` and checked its seven axiom lists;
constructor authorship/shared maintenance and independent-auditor ownership
boundaries are unchanged.

## Retired shared probe — 2026-09-25

`E3BetaGammaReuse.lean` was deleted during the Section 24 closeout at the user's
request to remove unnecessary checks. Its six design API experiments are
superseded by the accepted [BetaGamma production proof](../GGC/Foundations/BetaGamma.lean),
the active E3BetaGammaContract check and the central axiom audit. Historical
results remain in report Sections 37–39; the former probe is no longer current
reproducible evidence. At designer acceptance, Blueprint Section 20.3 was
updated to link to the live production proof and contract check.

The four pre-E4 contract files remain necessary for full interface and boundary
checks. E3GammaDirichletContract now uses `GGC.DirichletPosterior` and
`@GGC.beta_atom_posterior`, with measurable-only binders after F-01 and all seven
endpoint checks. The earlier topology-preservation acceptance is superseded
by Blueprint Section 28. The import/name maintenance does not transfer prior independent
acceptance to this change. See [Section 48](../ConstructionReport.md#r2-j3-closeout-2026-09-25)
for construction validation and
[Section 49](../ConstructionReport.md#r2-j3-design-acceptance-2026-09-25) for
designer acceptance, including a fresh rerun of this check and inspection of all
seven endpoint lists. No independent reviewer-owned check or user human-check
file was changed or deleted.
