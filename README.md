# Generalized Gamma Convolution Power Problem

Last structural update: **2026-09-05**.

This repository studies Bondesson's power conjecture for positive
generalized gamma convolutions:

\[
\boxed{
X\in GGC,\qquad q\ge 1
\quad\stackrel{?}{\Longrightarrow}\quad
X^q\in GGC.}
\]

Here \(X^q\) is an ordinary deterministic power. It is neither a
convolution power nor a product of independent copies. The case \(q=1\)
is trivial; the research problem is \(q>1\).

The full conjecture is **not resolved in this repository**. Bondesson
(2015) states it as Conjecture 1. Sjödin (2026) claims a proof, but our
audit finds that the proposed induction uses a false lemma, so that article
is not treated here as establishing the conjecture. The project instead
records independent partial theorems, exact reductions, failed proof
mechanisms, and seven ranked routes toward a proof or counterexample.

- [ResearchStatus.md](ResearchStatus.md) is the detailed and current
  mathematical status record.
- [CurrentGoal.md](CurrentGoal.md) states all seven candidate routes; Routes
  1--5 are the current active goal and Routes 6--7 are deferred.
- [WIP.md](WIP.md) is the overall progress summary and master result index;
  complete derivations live in the [project ledger](ledger/README.md).

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
are versioned. The archived Lean plan is an independent audit layer: no
`sorry`, added axiom, or untracked normalization repair counts as completion.

## Repository map

- [ResearchStatus.md](ResearchStatus.md): reliable baseline, 2026 claim
  audit, proved parameter slices, open gaps, and the central theorem ledger.
- [CurrentGoal.md](CurrentGoal.md): ranked proof paths and their execution
  blueprints.
- [WIP.md](WIP.md): overall progress explanation and master index of stable
  WIP identifiers.
- [ledger/](ledger/README.md): complete mathematical derivations, organized
  by object and proof mechanism, together with sources and checkpoints.
- [computations/](computations/): exact-arithmetic and symbolic verification
  scripts cited by ledger entries.
- [notes/](notes/): GGC-specific structural and source audits.
- [literature/](literature/): primary GGC and general analytic references,
  with a source ledger in [literature/README.md](literature/README.md).
- [background/alpha-cauchy-sd/](background/alpha-cauchy-sd/): completed
  \(\alpha\)-Cauchy SD case study, including notes, manuscripts,
  formalization plan, and problem-specific literature.

When an older note conflicts with [ResearchStatus.md](ResearchStatus.md), the
status record governs and the older statement must be re-audited before use.
