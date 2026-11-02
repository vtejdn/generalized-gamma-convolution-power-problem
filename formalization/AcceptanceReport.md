# Formalization Acceptance Report

Maintainer: **designer**. Rolling record under
[README](README.md#report-maintenance): only unresolved project issues and
currently valid acceptance conclusions belong here. Documentary reorganization:
2026-10-31. Mathematical/design acceptance dates below are preserved, not renewed.

## Unresolved issues

No construction or design-acceptance item remains pending within the accepted
scope. E-S1 formalization, RV-1, general unbounded J1 and the unused Thorin
converse/equivalence remain outside that scope.

Auditor post-repair rechecks of F-01/F-02 are **not recorded**. This is an audit
coverage state, not an unresolved construction item; see the
[auditor-owned findings](AuditReport.md#findings). A new concrete objection
reopens or qualifies the affected acceptance conclusion with its exact scope.

## Current acceptance conclusions

<a id="main-theorem"></a>
### A-MAIN: full original-definition power closure

**Design accepted, 2026-09-25, relative to E-S1.**
`GGC.ggc_rpow : GGC.GGCPowerClosure` covers every nonnegative GGC probability
law and every real q >= 1, with no extra drift, mass, support or moment
restriction. Definitions use actual gamma measures and finite product/sum
laws followed by probability weak limits; powers are actual pushforwards.
M0-M7 and E1-E4 are accepted within that boundary.

Evidence is preserved from the final designer reacceptance, which reviewed
the repaired working tree identified in its original delivery record, not
merely an earlier base commit.
That delivery was committed in `3c9fd56`; the full pre-reorganization source
record is retained at `4ddc3967c568ee99268f72ae8d443da7641d0fe1`.
The recorded toolchain is Lean 4.32.2 and mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`, with `LEAN_NUM_THREADS=2`.

| Recorded designer validation | Result and boundary |
|---|---|
| `lake build` | Exit 0; 3961-job default incremental build, caches retained |
| All seven `lake env lean Checks/<file>.lean` commands | Exit 0; 28 outputs matched requests by name/multiplicity, standard logic only |
| `lake env lean -t 0 AxiomAudit.lean` | Exit 0; 1067 distinct requests and matching outputs, all within the allowed boundary |
| Source review | Only two public wrappers and two shared contracts changed in the bounded repair; lower mathematics and protected sources retained their hashes |

The main theorem's exact recorded dependency set is:

```text
propext
Classical.choice
Quot.sound
GGC.External.SSV.phase_representation
```

The detailed [final acceptance evidence](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/ConstructionReport.md#L4914) retains commands,
working-tree comparisons and supplemental local-log pointers. Counts above
belong to that snapshot. The final binder repair used incremental verification;
it did not claim a new clean rebuild, literature audit or manual rederivation
of unchanged analytic lemmas. Acceptance is not publication or external
mathematical peer review.

<a id="local-foundations"></a>
### A-FOUNDATIONS: retained local replacements

**Design accepted.** E-B1 Thorin realization, E-B3 finite approximation,
E-J3 Beta atom posterior, bounded Markov-Krein, E-T1 stick-breaking and
E-J2 nonnegative Palm have local Lean proofs. The primitive Thorin and
Gamma/Dirichlet/Palm/stick interfaces use standard logic only. Their full
current contracts and owner modules are in
[Blueprint](Blueprint.md#local-foundation-contracts).

The recorded E4 designer validation included a project-only clean build of
158/158 production modules (3961 jobs), direct 1067/1067 dependency outputs
and all seven contracts. This earlier E4 result is distinct from the final
F-01 incremental reacceptance. E4's mistaken topology/type-baseline claims
were corrected by A-F01 below; the later repair does not validate those claims.
See [E4 acceptance and its original limits](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/ConstructionReport.md#L4570).

<a id="f01"></a>
### A-F01: public J2/J3 contract repair

**Project closed by designer reacceptance, 2026-09-25.** Both public wrappers
now require only `{E : Type*} [MeasurableSpace E]`, matching the historical
elaborated contracts. The lower proofs were already sufficiently general.
The original topology-preservation/type-comparison acceptance was mistaken
and remains withdrawn. Mathematical arguments and conclusions were preserved.

The designer re-elaborated the complete historical J2 source at `5f1b295`
and J3 source at `baae2e9`, compared actual Lean type expressions
(`oldDecl.type == newDecl.type`) with the repaired public declarations,
and reran the default build, seven contracts and central audit. Ambient
variables were not manually added to the historical source.
See [the original reacceptance evidence](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/ConstructionReport.md#L4914).

**Auditor recheck: not recorded.** The [F-01 audit finding](AuditReport.md#f01)
remains valid for its original pre-repair snapshot. Project closure does not
constitute a new auditor sign-off or rewrite that finding.

<a id="f02"></a>
### A-F02: dependency inventory count

**Project closed, 2026-09-25.** The stale blueprint count was corrected to
1067 and confirmed by the final direct audit. Current reports treat this as
a snapshot observation, not an immutable acceptance target.
**Auditor post-correction recheck: not recorded**; see
[F-02](AuditReport.md#f02) and [designer disposition](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/ConstructionReport.md#L4914).

<a id="source-review"></a>
### A-SOURCE: retained E-S1 source correspondence

**Designer source-review acceptance, 2026-09-24.** The designer freshly
rendered the 2010 first-edition identity/original pages and official errata,
checked real/complex formulas, principal branch, anchor, integrability,
uniqueness and adaptations, and closed S1-SOURCE at project level.
See [the preserved source-review acceptance](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/ConstructionReport.md#L2829).
The auditor's later independent source judgment is separately recorded in
[AuditReport](AuditReport.md#ssv-source-review).
The [source identities and preparation locators](External/README.md#ssv-source-provenance)
are retained. Source review does not prove E-S1 inside Lean.

<a id="scope"></a>
### A-SCOPE: agreed exclusions and retired interfaces

E-S1 is deliberately retained as the sole external mathematical assumption.
RV-1 is withdrawn; general unbounded J1 is retired after proving a bounded
specialization; unused E-B2 and its converse/equivalence consumers are
removed; the undeclared E-B4 fallback is withdrawn. These are scope decisions,
not proofs of the retired statements or outstanding construction tasks.

<a id="documentation"></a>
### A-DOCS: governance and report reorganization

The 2026-10-31 user-authorized migration centralizes governance in README,
keeps effective contracts in Blueprint, replaces the construction diary with
this rolling designer report, and consolidates auditor records in AuditReport.
Historical text is preserved at the immutable pre-reorganization revision.
It carries existing evidence forward without issuing a new mathematical,
source-literature or independent-auditor conclusion.

**Documentation verification passed.** The delivery is a working tree based on
`4ddc3967c568ee99268f72ae8d443da7641d0fe1`. Checks covered all 10 changed/new
Markdown files and 287 links, including local anchors and immutable Git
file/line targets. No retired live-report reference or broken checked link
remains. All 81 API IDs and six GAP IDs are preserved; the core mathematical
contract block from the former Blueprint is retained verbatim.

All 166 Lean files have identical text outside comments relative to the
baseline; eight files change documentation comments only. The three Lean/Lake
configuration files are unchanged, and `git diff --check` passes. Two existing
ResearchStatus PDF links now use the already documented local-library junction.
The supplemental check driver/result are `tmp/check_formalization_docs.py` and
`tmp/formalization-docs-reorganization-check.json`; these ignored artifacts
supplement the tracked conclusion and Git delta. No Lean rebuild, literature
review or independent-auditor recheck is claimed for this documentation delivery.
