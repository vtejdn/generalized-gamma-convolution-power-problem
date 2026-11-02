# Independent Formalization Audit Report

Maintainer: **independent auditor**. Governance:
[README](README.md#roles-and-permissions). This is the single live record of
independent audit scope, findings, evidence, conclusions and actual rechecks.

**Editorial consolidation, 2026-10-31:** the user authorized merging the two
dated auditor reports preserved at commit
`4ddc3967c568ee99268f72ae8d443da7641d0fe1`. This consolidation does not perform
a new audit, recheck the repaired code, renew an earlier verdict or transfer
future judgment ownership to the designer/constructor. Original snapshots,
corrections and limitations are retained below and in immutable source records.

<a id="final-independent-audit"></a>
## Latest recorded independent verdict

The **2026-09-25 final independent audit** found **no blocking defect in the
main theorem within the reviewed scope, relative to E-S1**, and raised two
nonblocking findings F-01/F-02. Both remained open in that auditor record.

Its subject was an **uncommitted pre-F-01-repair working tree based on
`5f1b295a6cf3ef2561f0b109ccfa5239a55c07b1`**, including E4. The audit recorded
166 Lean files and three pinned configurations matching the designer's
`tmp/designer-acceptance-2026-09-25/source-end.json`. A base commit alone is
not an exact identity for that working tree.

Later project disposition belongs to [AcceptanceReport](AcceptanceReport.md).
The record contains **no auditor recheck of the repaired J2/J3 wrappers or
corrected blueprint after that final audit**. Designer acceptance does not
change the auditor's original snapshot conclusion.

| Final-audit check actually recorded | Result and limits |
|---|---|
| Direct `main.lean` elaboration | Passed with pinned Lean 4.32.2 |
| All seven `Checks/*.lean` files | Passed; 28 standard-logic-only outputs |
| `lean -t 0 AxiomAudit.lean` | Passed; 1067/1067 matching requests/outputs |
| Main theorem transitive dependencies | Exactly standard logic plus `GGC.External.SSV.phase_representation` |
| SSV original pages and errata | Independently revisited; no blocking adaptation defect found |
| Review boundary | No new clean build or line-by-line rederivation of every historical analytic lemma; fresh outputs inspected in session, without saving a new probe/log |

The [unchanged original final-review record](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/SemanticAudit-2026-09-25.md#L302) is the
authority for these historical observations. Source locations, line numbers
and phrases such as "current" in that record refer to its reviewed snapshot,
not to the repaired or reorganized checkout.

<a id="findings"></a>
## Findings and auditor recheck states

| ID | Recorded impact | Last actual auditor state | Separate disposition or historical evidence |
|---|---|---|---|
| F-01 | Medium; J2/J3 public interface narrowing and mistaken design/acceptance baseline, not a main power-theorem failure | Open at final audited snapshot; no post-repair auditor recheck recorded | [Designer repair acceptance](AcceptanceReport.md#f01) |
| F-02 | Low; stale blueprint declaration count, no proof effect | Open at final audited snapshot; no post-correction auditor recheck recorded | [Designer closure](AcceptanceReport.md#f02) |
| R2-01 | Low; stale main-theorem trust-boundary comment | Resolved in final audit | [Recorded final-audit disposition](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/SemanticAudit-2026-09-25.md#L390) |
| D1 | Low; stale proof-location comment in Definitions | Correction confirmed in second round | [Recorded second-round finding update](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/SemanticAudit-2026-09-25.md#L34) |
| S1-SOURCE | First-round absence of original-page evidence | Independently examined and closed in second round; revisited in final review | [Source review below](#ssv-source-review) |

Only the auditor changes this report's independent findings/recheck judgments.
Links to project dispositions identify designer decisions, not auditor sign-off.
Keep these axes separate when pruning or rolling the reports.

<a id="f01"></a>
### F-01: original measurable-only J2/J3 types were narrowed

At the final audited snapshot, public wrappers required TopologicalSpace,
PolishSpace and BorelSpace instances in addition to MeasurableSpace. The
historical axioms and existing lower proofs actually used only
`{E : Type*} [MeasurableSpace E]`. Historical ambient topology variables were
omitted from the elaborated axiom types; source parameter text did not establish
type equality. Contract checks that already supplied the extra instances did
not detect the narrowing.

The auditor independently re-elaborated historical J2 at
`5f1b295:formalization/External/James.lean` and J3 at
`baae2e9:formalization/External/James.lean` with the current-at-review imports.
`#check @...` confirmed the differing binder lists. The design baseline also
required the erroneous topology parameters, so implementation compliance with
that baseline did not establish original-type preservation.

Impact was on callers possessing only a measurable-space instance. Lower
theorems already provided the required generality; positive-real production
consumers and the main power theorem were unaffected. The recommendation was
to restore public measurable-only types, correct the baseline and exercise
public names without extra instances. No new mathematical proof was needed.

The second-round claim that E-J3 preserved the complete historical type was
**corrected by this final finding** and must not be carried forward as accepted.
The [original evidence and recommendation](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/SemanticAudit-2026-09-25.md#L314) remain unchanged.
Designer closure is recorded in [AcceptanceReport](AcceptanceReport.md#f01);
this consolidation supplies no post-repair auditor verdict.

<a id="f02"></a>
### F-02: stale blueprint declaration count

The final audit found a blueprint inventory claiming 954 declarations while
the actual central audit contained 1067 distinct requests with 1067 matched
fresh outputs. The recommendation was to correct that documentation; no proof
depended on the count. See [the original finding](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/SemanticAudit-2026-09-25.md#L367).
Project correction/closure is recorded in [AcceptanceReport](AcceptanceReport.md#f02).
No separate auditor post-correction recheck is recorded.

<a id="ssv-source-review"></a>
## Recorded independent SSV source review

The first round did not obtain images of the specified 2010 first-edition
pages and left that source-evidence check open, despite finding no formula,
branch, anchor or errata error. In the second round the auditor independently
recomputed the source hash, rendered the original pages and errata and closed
the original-page gap. The final audit independently revisited them.

| Physical PDF page (one-based) | Printed location | Recorded inspection |
|---|---|---|
| 5 | Copyright | 2010 first-edition identity and ISBN 978-3-11-021530-4 |
| 24 | 11, Definition 2.1 | Stieltjes representation and integrability |
| 71-72 | 58-59, Theorem 6.10 and proof | Bounded measurable phase, representation, uniqueness, principal logarithm and complex extension |
| 73 | 60, Remark 6.11 | Zero-anchor condition and class relation corrected by errata |
| 76 | 63, Theorem 7.3 | Nonzero reciprocal theorem |
| Official errata page 2 | 2010 first edition; 2022-12-01 errata | Corrected Herglotz measure domain/finiteness and one-way inclusion |

For `M(s) = integral (s+b)^(-1) P(db)`, probability normalization gives a nonzero
Stieltjes function. The recorded source adaptation applies 7.3 and 6.10 to
`1/M`, negates the logarithm and subtracts at one. The negative imaginary part
of M in the upper half-plane fixes the principal logarithm. Anchored kernels
are absolutely integrable without an inverse moment at zero. Real-formula
uniqueness supplies only almost-everywhere uniqueness. A Borel representative
can have global bounds without altering the integral.

The erroneous reverse inclusion in Remark 6.11 and an extra zero anchor were
not used. Boundary recovery, joint measurability and generator continuity remain
local obligations. **This is source-correspondence review, not a Lean proof of
E-S1.** Source/errata identities and constructor preparation locators remain in
[External/README](External/README.md#ssv-source-provenance).
See [the original independent source evidence](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/SemanticAudit-2026-09-25.md#L201).

## Earlier independent reviews and evidence boundaries

| Review | Exact recorded subject | Verdict, evidence and limits |
|---|---|---|
| 2026-09-24 first round | Working tree based on `88b8529a29da851b015d545c2cee3a566b779b7c`, including existing uncommitted document changes | Main statement semantic pass. Eight declared external inputs; seven in the main theorem. Seven literature interfaces checked against original pages; E-S1 original-page evidence still open. Incremental 3940-job build and 883 dependency outputs; no full analytic rederivation. [Original record](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/SemanticAudit-2026-09-24.md) |
| 2026-09-25 second round | Working tree based on `4012d38aa7c812b1a4877d5dbde479b4ec0b7fa7`, including Thorin and Gamma/Dirichlet replacements; 158 Lean sources unchanged during review | Pass within reviewed scope relative to J2/T1/S1; SSV source gap closed; R2-01 found. Incremental 3955-job build, 1005 dependency outputs, independent contract/environment probe, five existing checks, ForHumanCheck and direct elaboration of 22 key modules. E-J3 exact-type preservation claim subsequently corrected by F-01. [Original record](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/SemanticAudit-2026-09-25.md#L15) |
| 2026-09-25 final round | Pre-repair E4 working tree and snapshot described above | No blocking main-theorem defect relative to E-S1; F-01/F-02 open at that snapshot. Direct main/seven-contract/1067-output checks, no new clean build. [Original record](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/SemanticAudit-2026-09-25.md#L302) |

All three rounds used pinned Lean 4.32.2 and mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`. Historical axiom counts above describe
those environments, not the current inventory. Original reports contain the
complete historical dependency lists, inspected-source/contract details and
supplemental ignored-log locations. Those local files are not promised to be
available in a fresh clone; immutable tracked records and source revisions
remain the durable evidence boundary.

The independent review sampled/targeted the stated chains and did not newly
rederive every unchanged analytic lemma or establish publication/priority.
Source correspondence, Lean proof checking, design acceptance and external
mathematical peer review retain distinct meanings.
