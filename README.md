# Generalized Gamma Convolution Power Problem

This repository studies Bondesson's Conjecture 1:

\[
X\in GGC,\qquad q\ge1
\quad\Longrightarrow\quad X^q\in GGC.
\]

Here \(X^q\) is a deterministic power, not a convolution power or a
product of independent copies.

**Recorded status (2026-09-06): proved in project; internal mathematical
audit complete.** This written-proof assessment is not external peer review,
publication or a priority claim. The scope, evidence and qualifications
are maintained in [ResearchStatus.md](ResearchStatus.md).
The [manuscript source](manuscript/ggc-power-closure.tex) is available;
compilation remains user-controlled.

## Lean formalization

**Completed and accepted (2026-09-25).** The [Lean proof](formalization/main.lean)
establishes GGC closure under every real power \(q\ge1\), using the original
finite-gamma weak-limit definition. Beyond Lean's standard logical axioms, its
sole external input is the SSV phase-representation theorem (E-S1).
The project build, contract checks and dependency audit pass; all final review
findings are closed. See the [formalization overview](formalization/README.md)
and [final acceptance record](formalization/ConstructionReport.md#f01-designer-acceptance-2026-09-25).

## Where to read and where to write

| Question or artifact | Maintained in |
|---|---|
| What is the project, and what standards govern it? | This README |
| What are we doing now, and what is out of scope? | [CurrentGoal.md](CurrentGoal.md) |
| What is proved, audited, disputed or still independent? | [ResearchStatus.md](ResearchStatus.md) |
| Why did a mechanism work, and what do the obstructions teach? | [BigPicture.md](BigPicture.md) |
| Where is a particular WIP result? | [WIP.md](WIP.md), the per-result index |
| Where are the full proofs and their dependencies? | [ledger/README.md](ledger/README.md), the thematic module map |
| What exactly do the external sources say? | [notes/README.md](notes/README.md), [ledger/references.md](ledger/references.md) and [literature/README.md](literature/README.md) |
| What can be checked by code? | [computations/README.md](computations/README.md) |
| Where is the written presentation? | [Manuscript](manuscript/ggc-power-closure.tex) and [bibliography](manuscript/references.bib) |
| What is the Lean formalization status? | [Formalization overview](formalization/README.md), [main theorem](formalization/main.lean) and [external input](formalization/External/README.md) |

For a quick orientation, read ResearchStatus, then BigPicture.
For a proof audit, start with the
[assembly](ledger/23-power-theorem-assembly-audit.md#wip-6-21) and
[completion audit](ledger/25-mathematical-completion-audit.md#wip-6-23),
following their lemma and source dependencies.

The earlier \(\alpha\)-Cauchy investigation motivated the
[beta-prime power-boundary example](notes/beta-prime-power-boundary.md).
The [migration record](ledger/checkpoints/2026-09-06-background-migration.md)
documents the retained shared material and completed directory removal.
The subunit-root question must not be conflated with the present
\(q\ge1\) question.

## Research principles

1. **Keep provenance explicit.** Use `[LITERATURE]`, `[AUDIT]`,
   `[DERIVED]`, `[CONJECTURE]` or `[HEURISTIC]` as appropriate.
   A project proof, a published claim and an independently validated
   theorem are different statuses. New deductions do not by themselves
   establish novelty.
2. **Cite the exact input.** Record author, title, year, theorem or remark
   number, relevant pages, stable identifier and the version actually
   checked. Do not silently strengthen hypotheses or promote an unaudited
   claim to an established input.
3. **Distinguish objects and directions.** Keep deterministic powers,
   convolution powers and independent products separate; distinguish
   HCM densities from HCM Laplace transforms. Use only the implications
   and power ranges justified in the
   [class-and-power note](notes/classes-and-power-closure.md).
   Label reductions as necessary, sufficient or equivalent.
4. **Write the analytic obligations.** State exact quantifiers, endpoints
   and dependencies. Justify interchanges of limits and integrals,
   differentiation, continuation, inversion, weak limits, strict Jensen
   and boundary-value arguments where they are used.
5. **Make every step auditable.** Each lemma or conjecture needs a stable
   ID, precise statement, provenance, dependencies, proof or exact gap,
   and status. Keep failed implications and refuted auxiliary routes;
   failure of a stronger sufficient condition is not a counterexample
   to the original conjecture.
6. **Keep computation in its proper role.** Numerical experiments guide
   exploration, not proof. Exact certificates state their arithmetic
   domain, script and finite claim; they do not certify an all-order
   analytic conclusion. Only TeX/BibTeX manuscript sources are versioned,
   not generated compilation products.
7. **Respect the formalization boundary.** Precisely cited external
   theorems may be declared as axioms under the
   [explicit whitelist](formalization/README.md#external-inputs).
   Project deductions must be proved relative to that boundary.
   A blueprint, `sorry`, unregistered axiom or hidden core assumption is
   not a completed formalization.

## Maintenance and history

Maintain a fact in its designated home and link to it elsewhere.
WIP is an index, ledger entries contain proofs, notes contain source
audits, and CurrentGoal contains actions rather than a second proof history.
Change BigPicture only when the strategic interpretation changes.

ResearchStatus records the current assessment; it does not override
mathematical evidence. A concrete objection must be checked, the affected
lemma reopened if necessary, and the assessment corrected.

Historical material is explicitly labelled in
[ledger/checkpoints/](ledger/checkpoints/).
The archived [route blueprint](ledger/checkpoints/2026-09-06-route-blueprint.md)
and [status/history](ledger/checkpoints/2026-09-06-status-before-cleanup.md)
preserve the detailed pre-cleanup records.
