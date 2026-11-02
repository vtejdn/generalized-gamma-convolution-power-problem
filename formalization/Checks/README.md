# Reproducible Auxiliary Checks

Role permissions, handoffs, evidence levels and report maintenance are governed
by the [formalization README](../README.md#checks-governance). This file owns
check-specific execution, provenance, maintenance and inventory. Checks are
auxiliary evidence, not a production proof layer.

## Admission, ownership and headers

Each Lean file has an English header identifying creator and current maintainer,
contract/API or exact review target, purpose/scope/exclusions, explicit command,
pinned environment, lifecycle status and evidence/replacement reference.
Distinguish creator, person performing a rerun, design acceptance and auditor
ownership. A `Contract`/`Independent` filename confers no ownership or verdict.

Designers create API/design probes; constructors create delivery/contract/boundary
checks; auditors control their own independent checks. The current seven files
are constructor-authored ordinary shared checks. Designer reruns do not change
that authorship or make them auditor-owned.

Use `.lake/` for temporary experiments. Prefer tracked production evidence to
duplicate probes. No `sorry`, new axiom or assumed target may be counted as a
completed proof. Production must not import Checks. These files are outside
default build globs and run explicitly.

## Execution and evidence

Run from `formalization` with pinned Lean 4.32.2/mathlib, for example:

```powershell
lake env lean Checks/E3GammaDirichletContract.lean
```

The constructor runs affected files and submits the snapshot, command, exit
status, checked scope and actual axiom outputs. Match output names and
multiplicity to requests and compare sets with the allowed boundary; printing
alone does not enforce the boundary. The designer records acceptance in
[AcceptanceReport](../AcceptanceReport.md); the auditor chooses independent
methods and records actual findings/rechecks in [AuditReport](../AuditReport.md).
Passing a small probe does not establish a full build or semantic audit.

Evidence is specific to its source and dependency revision. Assess changes
before carrying a conclusion forward. Put durable API decisions in MathlibAPI
and current acceptance/audit conclusions in their reports, not dated diaries
here. Immutable Git citations preserve previous results and replaced probes.

## Current inventory

| File | Creator / maintenance | Contract and current evidence |
|---|---|---|
| [E3BetaGammaContract](E3BetaGammaContract.lean) | Constructor / shared designer-constructor | API-068; full positive-real-shape joint Beta/Gamma law, one standard-logic-only output; [local-foundation acceptance](../AcceptanceReport.md#local-foundations) |
| [E3GammaDirichletContract](E3GammaDirichletContract.lean) | Constructor / shared designer-constructor | API-069/070/076; full normalized-vector/total law, all-zero and single-positive cases, zero selected shape, historical measurable-only public J3; seven outputs; [F-01 acceptance](../AcceptanceReport.md#f01) |
| [E3MarkovKreinContract](E3MarkovKreinContract.lean) | Constructor / shared designer-constructor | API-071; bounded transform, measurability/integrability, C=0, zero shapes, unchanged consumer and t=0; seven outputs; excludes retired general J1 |
| [ThorinInterfacesContract](ThorinInterfacesContract.lean) | Constructor / shared designer-constructor | API-075; both public names at complete primitive E-B1/E-B3 types; two outputs |
| [E4SizeBiasContract](E4SizeBiasContract.lean) | Constructor / shared designer-constructor | API-077; zero/single-positive shapes, impossible positive-total empty vector and actual stationary product law; seven outputs |
| [E4StickBreakingContract](E4StickBreakingContract.lean) | Constructor / shared designer-constructor | API-073; arbitrary-measurable-space full input/Q contract, zero prefix and mass-to-summability adapter; one output |
| [E4PalmContract](E4PalmContract.lean) | Constructor / shared designer-constructor | API-072/078/080/081; measurable-only public J2, arbitrary K/Phi, zero finite measures, empty/universal/zero-mass cells and infinite-valued test; three outputs; [F-01 acceptance](../AcceptanceReport.md#f01) |

The recorded final designer acceptance covers all seven files and 28 outputs,
using standard logic only. This is a snapshot result, not a permanent expected
count or a fresh auditor post-repair sign-off. See
[AcceptanceReport](../AcceptanceReport.md#main-theorem) and the separately
recorded [auditor coverage](../AuditReport.md#findings).

## Maintenance and retirement

Designer and constructor may maintain ordinary shared checks with a recorded
reason. For auditor-owned checks, other roles propose changes rather than
changing judgment logic; deleting/replacing their evidence requires auditor
confirmation unless the user explicitly directs otherwise. Human-check files
retain their separate ownership. No report or evidence ownership transfers
through a shared-check policy.

Retire redundant probes with tracked production/check replacement references.
Full dated results remain in Git. The removed `E3BetaGammaReuse.lean` design
probe is covered by the [BetaGamma production proof](../GGC/Foundations/BetaGamma.lean),
the active contract and central dependency audit; its historical six-call
results are not current reproducible check files.
