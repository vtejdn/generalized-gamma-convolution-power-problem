# Current goal

Updated: **2026-09-23**.

## Current authorized work: blueprint-aligned Lean definition migration

Following the [principles](formalization/README.md) and
[blueprint](formalization/Blueprint.md), establish a pinned Lean project,
ignore `.lake/`, and provide a human-auditable [main.lean](formalization/main.lean)
containing the full **GGC power closure** statement and its necessary definitions.
Every introduced literature axiom belongs in the separate
[External directory](formalization/External/README.md), with a complete Lean
type, source locator and explicit scope.

The current code defines `GGC.GGCPowerClosure` as the unproved target proposition.
`main.lean` now uses actual finite gamma products and weak limits for `IsGGC`,
with no external imports. Basic, finite-gamma, Laplace and Thorin declarations
are separated into `GGC/` modules, and the audit and Lake coverage follow that
layout. `HasThorinRepresentation` is a separate predicate; its characterization
and positive-constant membership proof remain M1 work. The three Bondesson
interfaces are unchanged. The main construction and proof remain pending; no
core conclusion is assumed as an axiom or represented by an unfinished proof.
This stage includes compilation and dependency inspection of the scaffold.
The mathematical assessment in [ResearchStatus](ResearchStatus.md) is unchanged.

## Previous maintenance handoff (2026-09-06)

**Documentation cleanup, shared-material migration and SD-directory removal complete.**
The user authorized deletion of the three obsolete checkpoint links and the
entire local SD directory, including ignored build products.
The GGC proofs, manuscript, computation scripts and Lean blueprint are
unchanged. The cleanup is a separate repository-maintenance handoff;
Git history and remote verification record its commit/synchronization state.

### Authorized work at that time

The current maintenance request is complete: shared SD-era content is in
the GGC notes and literature, obsolete local references are removed, and
the former `background/` directory is deleted.
The user subsequently authorized committing this cleanup and pushing it
to `origin/main`. This does not authorize a new proof route, a change to
the theorem or its audit status, TeX compilation, or Lean implementation.

The pre-cleanup version is preserved by the annotated and pushed tag
`snapshot-2026-09-06-pre-cleanup`, pointing to `527a78a`.

## Completed migration and removal

The [migration record](ledger/checkpoints/2026-09-06-background-migration.md)
maps retained material to its new home and records the user's final
decision. General source facts and the beta-prime boundary remain separate
from the log-rate theorem's inputs.

The three obsolete source-list links were deleted, not retargeted.
The checkpoint preface records that limited edit; its mathematical and
historical text remains intact. The entire old directory was removed:
18 tracked files remain recoverable from the pre-cleanup tag, while
16 ignored build products were deleted without a separate copy.
The SD-specific ignore rules were removed with the directory.

## Completed first-pass scope and completion criteria

1. Give each root document one responsibility, as specified in the
   [README](README.md#where-to-read-and-where-to-write).
2. Keep current status and evidence in [ResearchStatus](ResearchStatus.md);
   move long historical status and route narratives to dated checkpoints.
3. Preserve the complete per-result [WIP index](WIP.md), stable IDs and
   proof links. Keep the thematic module table only in
   [ledger/README.md](ledger/README.md).
4. Correct stale navigation and artifact-status wording. Index every
   verification script by its actual ledger claim and distinguish exact
   certificates from numerical reconnaissance.
5. Verify local links, unchanged WIP entries and hashes of protected
   mathematical/source files; run `git diff --check` before handoff.

The first pass preserved research records and stable proof-module paths.
The separately authorized SD-directory removal is recorded above.
No certificate algorithm, GGC manuscript or mathematical proof was edited;
no compilation, Lean implementation or publication was performed.
The pre-cleanup tag remains unchanged. The cleanup handoff is separate
from that snapshot; remote synchronization is reported after verification.

## Mathematical objective and historical routes

The original objective is Bondesson's GGC power conjecture for all finite
real \(q\ge1\). Its recorded project status and exact quantifiers are in
[ResearchStatus](ResearchStatus.md), with the internal completion audit in
[WIP-6.23](ledger/25-mathematical-completion-audit.md#wip-6-23).
This organizational pass does not upgrade that verification status.

The complete P1--P7 descriptions, rankings, attempt blueprints and exclusions
are preserved in the
[historical route blueprint](ledger/checkpoints/2026-09-06-route-blueprint.md).
P5 is the log-rate evolution argument; P1 supplies an independent square
proof. Historical route numbers, P-labels and stable WIP IDs are distinct.
Retained routes are not outstanding requirements of the recorded theorem,
and no former Routes 1--5 restriction is reinstated.

## Possible next maintenance stage

If code refactoring is undertaken, first capture the certificate scripts'
existing outputs and assertions as regression checks. Compare their
polynomial representations and coefficient conventions before sharing any
helpers; duplicate function names alone do not establish interchangeable
semantics. Keep the numerical scan in `route1_q32_hankel3.py` separate
from exact certificates.

Any later mathematical or Lean work should name its precise obligation
and dependency boundary before starting. The current request does not
automatically resume those projects.
