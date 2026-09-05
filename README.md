# Generalized Gamma Convolution Power Problem

Last mathematical status update: **2026-09-06**.

This repository records a project proof of Bondesson's power conjecture
for nonnegative generalized gamma convolutions:

\[
\boxed{
X\in GGC,\qquad q\ge 1
\quad\Longrightarrow\quad
X^q\in GGC.}
\]

Here \(X^q\) is an ordinary deterministic power. It is neither a
convolution power nor a product of independent copies. The case \(q=1\)
is trivial; the substantive conclusion concerns every finite real \(q>1\).

**Status: proved in project; internal mathematical audit complete.**
The proof is assembled in
[WIP-6.21](ledger/23-power-theorem-assembly-audit.md#wip-6-21);
[WIP-6.23](ledger/25-mathematical-completion-audit.md#wip-6-23)
records the completed requirement-by-requirement audit. The final theorem
imposes no restriction on drift, Thorin mass, support size, shapes or
moments beyond the input being a GGC probability law. This status concerns
the written ledger proofs, not publication, external peer review, Lean verification
or literature priority. A concrete mathematical objection must still be
examined and may require a correction.

Following the user's subsequent instruction on 2026-09-06, the
[TeX manuscript](manuscript/ggc-power-closure.tex) has been completed for
independent review, with its [bibliography](manuscript/references.bib).
Cross-references, citation keys and source structure were statically checked;
no compilation was run in this handoff. Typesetting does not itself validate the
mathematical argument. No remote push was made in this handoff.

The new [Lean formalization blueprint](formalization/README.md) records
the source-audited mathlib APIs, missing infrastructure, implementation
milestones and explicit external-literature axiom contracts. This is a
plan and API audit, not an implemented or Lean-verified proof.

Bondesson (2015) states the target as Conjecture 1. Sjödin (2026) claims
a proof, but our audit finds a false lemma in that induction. The new
log-rate evolution argument is independent of that claimed proof.

- [ResearchStatus.md](ResearchStatus.md) is the detailed and current
  mathematical status record.
- [CurrentGoal.md](CurrentGoal.md) records the proof-route blueprint and
  its current disposition. Earlier P1--P7 rankings and legacy ledger IDs
  retain their historical meaning; they are not outstanding obligations
  for the now-completed power theorem.
- [WIP.md](WIP.md) is the overall progress summary and master result index;
  complete derivations live in the [project ledger](ledger/README.md).
- [BigPicture.md](BigPicture.md) records the overall mathematical
  assessment, structural lessons and remaining independent questions,
  separately from proofs.

An independent phase proof now gives GGC square membership for every
finite gamma convolution of total shape at most two, with no support-size
restriction: [WIP-5.49--5.50](ledger/18-four-rate-balanced-phase.md#wip-5-49).
The general proof instead uses the
[log-rate generator](ledger/20-finite-thorin-positive-steps.md),
[positive finite-time Euler evolution](ledger/21-log-thorin-euler-evolution.md),
and [identification with actual powers](ledger/22-power-flow-identification.md).
[WIP-6.22](ledger/24-direct-log-generator-resolvent.md#wip-6-22)
also gives a direct, absolutely convergent verification of the generator's
resolvent action. It is an alternative interface proof, not a second
independent solution of the full conjecture.

The classical inputs are Bondesson's Thorin representation and weak
closure/density theorems, James's gamma--Dirichlet and posterior
identities, the SSV bounded Stieltjes phase, and Sethuraman's
stick-breaking construction. Their precise hypotheses and checked
versions are saved in the
[primary-interface audit](notes/log-rate-power-proof-primary-interfaces.md).
The logarithmic generator, positive Euler evolution, dynamic
identification and full-quantifier assembly are project deductions.
Bondesson's stronger integral Conjecture 2 and general fractional-peeling
closure are separate questions, not consequences claimed here.

## Scope

The earlier \(\alpha\)-Cauchy self-decomposability investigation is retained
under [background/alpha-cauchy-sd/](background/alpha-cauchy-sd/) as a
completed case study and as provenance for the beta-prime power viewpoint.
It is **background for the GGC project, not a parallel active problem**.

For \(\gamma=1/\alpha\), the identity

\[
|C_\alpha|^\alpha
\overset d=
\frac{\Gamma_\gamma}{\Gamma_{1-\gamma}}
\]

was the original bridge to power-closure questions. Its fractional-root
problem has exponent \(1/\alpha<1\), whereas Bondesson's conjecture concerns
arbitrary positive GGC laws and powers \(q\ge1\); the two questions must not
be conflated.

## Research principles

### 1. Every assertion has a provenance

Research notes and theorem ledgers use the following labels.

- **[LITERATURE]**: stated in an identified external source.
- **[AUDIT]**: obtained by checking a source, including a gap, missing
  hypothesis, or repair.
- **[DERIVED]**: a new deduction proved in this repository.
- **[CONJECTURE]**: unresolved, whether proposed here or in the literature.
- **[HEURISTIC]**: motivation, numerical evidence, or a tentative route;
  never a proof.

"Proved in this repository" and "published, peer-reviewed theorem" are
different statuses. A later paper that claims a theorem is not promoted to
an established literature result until its proof and hypotheses have been
audited.

### 2. References are exact

Every external mathematical input should record its author, title, year,
theorem/proposition/remark number, page when useful, stable bibliographic
identifier, and the precise local version checked. Only hypotheses actually
present in that version may be used.

### 3. Objects and operations remain distinct

- An independent product \(XY\) is not the deterministic power \(X^2\).
- A convolution power of a law is not the random-variable power \(X^q\).
- An HCM density and an HCM Laplace transform play different roles. A
  normalized HCM Laplace transform characterizes a GGC law; an HCM density
  is a stronger sufficient property.
- The positive-law implication chain
  \(HCM_{\rm dens}\Rightarrow GGC\Rightarrow SD\Rightarrow ID\) is one-way
  unless a converse is separately proved.
- Necessary and sufficient conditions, and density-side and transform-side
  criteria, are never silently interchanged.

### 4. Proof obligations are explicit

Numerical experiments may locate identities, counterexamples, or parameter
regimes but do not prove them. Uses of Fubini/Tonelli, differentiation under
an integral, analytic continuation, weak closure, strict Jensen, boundary
values, and inversion must include their hypotheses. Endpoint cases and
the exact parameter range belong to each theorem statement.

Every reduction is labelled as an equivalence, necessary condition, or
sufficient condition. Failed implications and failed routes remain in the
audit trail so that they cannot be silently reused.

### 5. Lemma and conjecture ledger

Each independently checkable step should have:

1. a stable identifier and exact statement;
2. a provenance label and reference;
3. explicit dependencies;
4. a proof or a precise proof gap; and
5. one status: proved, externally established, under audit, conjectural, or
   refuted.

### 6. Reproducibility

Exact or numerical calculations state the software, precision, and identity
being tested. Exact-arithmetic scripts are preferred for certificates.
Generated TeX products are ignored; only manuscript and bibliography sources
are versioned. Under the user's current formalization policy, precisely
referenced external mathematical theorems may be declared as axioms.
The project's new deductions must be proved relative to that explicit
whitelist; no `sorry`, unregistered axiom, hidden core assumption or
untracked normalization repair counts as completion. See the
[axiom boundary](formalization/axiom-boundary.md). The archived SD plan
is a separate historical document, not the policy for this GGC engineering task.

## Repository map

- [ResearchStatus.md](ResearchStatus.md): completed project theorem,
  reliable baseline, preserved 2026 claim audit, historical parameter
  slices, and remaining independent questions.
- [CurrentGoal.md](CurrentGoal.md): proof paths, their historical
  execution blueprints and current disposition.
- [WIP.md](WIP.md): overall progress explanation and master index of stable
  WIP identifiers.
- [BigPicture.md](BigPicture.md): strategic assessment, scope of the
  completed proof and explicit triggers for revising the research outlook.
- [ledger/](ledger/README.md): complete mathematical derivations, organized
  by object and proof mechanism, together with sources and checkpoints.
- [computations/](computations/): exact-arithmetic and symbolic verification
  scripts cited by ledger entries.
- [notes/](notes/): GGC-specific structural and source audits.
- [manuscript/ggc-power-closure.tex](manuscript/ggc-power-closure.tex):
  complete manuscript source, with six included sections and
  [references.bib](manuscript/references.bib); compilation remains user-controlled.
- [formalization/](formalization/README.md): Lean blueprint, pinned mathlib
  API source audit, missing infrastructure and external axiom contracts;
  no Lean implementation yet.
- [literature/](literature/): primary GGC and general analytic references,
  with a source ledger in [literature/README.md](literature/README.md).
- [background/alpha-cauchy-sd/](background/alpha-cauchy-sd/): completed
  \(\alpha\)-Cauchy SD case study, including notes, manuscripts,
  formalization plan, and problem-specific literature.

When an older note conflicts with [ResearchStatus.md](ResearchStatus.md), the
status record governs and the older statement must be re-audited before use.
