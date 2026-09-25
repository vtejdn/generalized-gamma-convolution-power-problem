# Independent Semantic Audit: Second Round

Date: 2026-09-25. Maintainer: independent auditor. Report language: English.

This report is maintained beside `Blueprint.md`, as requested by the user.
Findings and proposed corrections are recorded here; existing project documentation
and production Lean files were not edited. The first-round report,
`SemanticAudit-2026-09-24.md`, remains a historical record.

## Verdict and findings

**Pass within the reviewed scope, relative to three explicitly identified
literature axioms.** No blocking mathematical-statement defect, hidden narrowing
of the main theorem, or unsupported strengthening of the remaining external
interfaces was found. The earlier SSV original-page evidence gap is closed by
this auditor's fresh examination of the specified first-edition pages and errata.

### R2-01 — Low priority: stale trust-boundary comment

Location: `main.lean:24–25`.

The theorem's documentation still lists five literature inputs, including E-J1
and E-J3. The current imported environment and the theorem's actual transitive
dependencies contain only E-J2, E-T1, and E-S1. E-J1 has been retired, and E-J3 is
now a locally proved theorem. Update that comment to the current three-axiom
boundary. This is a documentation defect, not a defect in the Lean theorem or its
proof. No correction was made to the production file during this audit.

### Previous findings

- The stale proof-location comment at `Definitions.lean:119` has been corrected:
  it now points to `main.lean`.
- The missing SSV original-page evidence is resolved below. The first-round
  observation remains accurate for that earlier review, but is no longer an open
  limitation of this second-round review.

## Snapshot and verification scope

The audited working tree is based on commit
`4012d38aa7c812b1a4877d5dbde479b4ec0b7fa7` and includes its uncommitted changes.
In particular, the deletion of `External/Bondesson.lean`, the new Thorin interface
module, and the new Gamma/Dirichlet and Markov–Krein foundation modules were
included. This verdict is about that working tree, not just the committed revision.

The initial snapshot records SHA256 hashes of all 158 project Lean files outside
`.lake`, including the five `Checks` files and `ForHumanCheck.lean`. Hashes are
retained in `../tmp/semantic-audit-2026-09-25/source-start.json`. The final snapshot
also contains 158 files, with no additions, removals, or hash differences. Both
snapshots and `source-comparison.json` are retained alongside the audit logs.

The executable reports Lean 4.32.2, commit
`f3b06c705e6c85f5314019d5d3baab0fec5b580c`. The installed mathlib checkout matches
the configured revision `905b95818eb32af7874a58b427f50c1711a5e96c`; its tracked
working tree was clean when checked.

The review covered the full main statement and its definitions, the final
finite-input/general-input assembly, all remaining external interfaces and their
shared semantics, and the new local replacements for former axioms. It included
targeted inspection of the approximation, normalization, tightness, Gamma-vector,
posterior-update, and bounded-transform arguments. It did not rederive every
unchanged analytic lemma in the entire evolution and transport construction.

## Main theorem and preservation of scope

The target remains the conclusion in
`../ledger/25-mathematical-completion-audit.md:25–34`:

\[
X\in\mathrm{GGC},\qquad q\in\mathbb R,\quad q\ge1
\quad\Longrightarrow\quad X^q\in\mathrm{GGC}.
\]

| Semantic obligation | Current evidence | Result |
|---|---|---|
| Actual nonnegative probability laws | `Definitions.lean:39–41` | The law is a probability measure on finite real values, concentrated almost everywhere on nonnegative values. |
| Original GGC class | `Definitions.lean:49–96` | Actual independent finite Gamma sums followed by probability weak limits; no power-closure or evolution assumption enters the definition. |
| Deterministic real powers | `Definitions.lean:101–108` | The actual pushforward under `fun x : ℝ => x ^ q`, rather than an independent product or convolution power. |
| Complete quantifiers | `Definitions.lean:122–124`; `main.lean:26` | Every nonnegative law and every real `q ≥ 1`, with only `IsGGC μ` as the membership premise. The independent probe checks this fully expanded type. |
| Endpoints and zero laws | `GGC/PowerClosure.lean:19–42` | `q=1` and the empty Gamma sum are handled separately; positive times are used only for `q>1`. |
| Genuine finite initial data | `GGC/Identification/InitialData.lean:60–77` | Every nonempty finite Gamma sum supplies positive-mass log-rate data and a proved second moment. |
| Power identification | `GGC/Identification/DynamicIdentification.lean:22–41,54–61` | The constructed value law is identified with the deterministic power of its own initial law. |
| General input closure | `main.lean:26–49`; `GGC/WeakClosure.lean:21–39` | Finite approximants are powered and passed to the weak limit; construction moment and mass restrictions do not survive as main-theorem hypotheses. |

The semantic definitions in `Definitions.lean`, `RandomMeasure.lean`,
`Posterior.lean`, and `StickBreaking.lean` were not weakened in this revision.
The change in `Definitions.lean` relative to the first-round base is the corrected
proof-location comment. The public theorem is still a theorem about distributions,
which expresses the full distributional property of the random-variable claim.

## Former axioms and their local replacements

The decrease in the axiom count is real, but two different kinds of change must
be distinguished: a local proof of an existing contract, and retirement of an
interface that the main theorem no longer needs.

| Former interface | Current status | Semantic assessment |
|---|---|---|
| E-B1 | `GGC.thorin_realization`, `GGC/Thorin/Interfaces.lean:50–60` | Locally proved with the full primitive realization contract, including arbitrary nonnegative drift and possibly infinite Thorin mass. |
| E-B3 | `GGC.finite_atomic_approximation`, `GGC/Thorin/Interfaces.lean:79–99` | Locally proved with one sequence of actual finite Gamma laws, chosen before the Laplace-parameter quantifier. |
| E-B2 | Removed with the unused converse and equivalence | Retirement, not a local proof of the old converse characterization. This does not restrict the original weak-limit definition or the main theorem. |
| E-J3 | `External/James.lean:51–59` | The original full Beta-atom posterior contract is now a theorem, backed by finite Gamma-vector proofs. |
| E-J1 | General interface removed; `markov_krein_of_bounded` added | A proved bounded specialization, not a same-type proof of the former unbounded interface. Its production consumer retains its full type. |

### Thorin construction

`GGC/Thorin/Basic.lean:23–24,189–204` retains actual measures, nonnegative drift,
and integrability of `log(1+1/b)`, without a finite-total-mass premise.

The new construction uses compact rate windows and upward rounding. Cell masses
are proved finite before conversion from extended nonnegative reals. Zero weights
are omitted when constructing positive Gamma shapes, so the all-zero case remains
the empty convolution. A separate Gamma factor approximates positive drift; zero
drift is handled without dividing by zero.

`ThorinApproximation.law` is chosen independently of the Laplace parameter.
Domination proves convergence of its logarithmic kernels, and the common Laplace
lower bound yields tightness without moments. Normalization at zero is proved
directly from Thorin admissibility, before realization. These facts supply an
actual probability limit and identification by Laplace uniqueness.

The independent primitive-contract examples accept arbitrary admissible measures
and target laws. Dependency inspection confirms that realization, approximation,
represented-law membership, and constant-law membership use only standard logical
axioms. No removed Bondesson axiom is hidden in their dependencies.

### Gamma/Dirichlet and E-J3

`GGC/Foundations/BetaGamma.lean:186` proves the actual ratio/total pushforward
identity for two independent positive-shape, unit-rate Gamma variables.
`GGC/Foundations/GammaDirichlet.lean:105` then proves independence of the normalized
finite Gamma vector and its total through equality with the product law.

Zero shapes retain the original point-mass convention. The joint law covers the
all-zero vector; positive total mass is required where a Dirichlet probability
vector or Beta parameter needs it. The atom update permits a zero selected shape.
It uses the correct weight orientation `(1-z)Q+zδ_b` with `z ~ Beta(1,B)`.

The full E-J3 contract still permits an arbitrary supplied DP law, weight
realization, and atom on a Polish Borel space. Existing complete-contract checks
and direct dependency inspection confirm that no extra positivity condition on
each partition cell, no special constructor for the DP law, and no new external
Gamma-process assumption were introduced.

### Bounded Markov–Krein replacement

`GGC/Foundations/MarkovKrein.lean:52` proves the formula for every bounded,
nonnegative measurable test. The finite-partition formula is extended using
simple functions and dominated convergence. Mean measurability and integrability
are supplied locally; the proof does not exploit the default value of an
undefined integral.

The actual consumer at `GGC/GammaDirichlet.lean:90–110` uses
`g(b)=t/(s+b)`, where `t ≥ 0` and `s>0`. The bound `0 ≤ g(b) ≤ t/s` is proved
inside that consumer. Consequently, retiring the general unbounded E-J1 interface
does not add a premise to `dirichletMean_laplace` or to the power theorem. The
consumer's original type, including `t=0`, passes the independent probe.

## Remaining literature axioms

Exactly three project axioms are declared and imported by `main`. All three occur
in the transitive dependency list of `GGC.ggc_rpow`.

### E-J2: one-observation posterior disintegration

Location: `External/James.lean:31–41`.

The original [James (2005) reprint](https://arxiv.org/pdf/math/0505606), version
`math/0505606v1`, was revisited at reprint pages 4–5. Its joint posterior statement
gives base `U+δ_b` and observation marginal `U/B`. The Lean interface correctly
requires a measurable posterior kernel with those DP laws and uses a nonnegative
measurable joint test. The nonatomicity restriction belongs to a separate partition
factorization, not this posterior result. The nonnegative-test formulation follows
from the joint-law statement and is not a verbatim transcription of equation (8).

`GGC/Palm.lean:43–86` first obtains an actual joint-measure equality. Its signed
version separately requires absolute integrability before applying Bochner
Fubini. No unconditional signed interchange is imported through E-J2.

### E-T1: stick-breaking Dirichlet law

Location: `External/Sethuraman.lean:29–43`.

Printed pages 642–643 and 645 of the retained
[Sethuraman (1994) paper](https://www.cs.princeton.edu/courses/archive/fall07/cos597C/readings/Sethuraman1994.pdf)
were freshly rendered and examined. The source permits an arbitrary measurable
space, iid `Beta(1,B)` fractions, iid locations with law `F`, and independence
between those sequences. Equation (2.1) and Theorem 3.4 supply the weighted Dirac
sum and its finite-partition DP law.

The Lean input product specifies precisely that independence. Measurability and
almost-sure agreement of the supplied probability-valued sum are explicit premises.
The caller in `GGC/DirichletRealization.lean:103–128` discharges them locally.
Neither independence of the dependent stick weights nor additional uniform
parameter claims are asserted by the axiom.

### E-S1: bounded-phase representation — source gap closed

Location: `External/SSV.lean:41–64`.

The current book is `../literature/pdf/SSV.pdf`, reached through the reference-library
junction. Its SHA256 was independently recomputed as
`8A06BBC186F355C3A4475DAB588F65FE41E5E5552794D2C896A41BCA1CD36702`.
The copyright page identifies 2010 and ISBN `978-3-11-021530-4`.

Fresh page images were inspected at these physical PDF positions:

| PDF page, one-based | Printed location | Verification |
|---|---|---|
| 5 | Copyright page | First-edition identity |
| 24 | 11, Definition 2.1 | Stieltjes representation and required integrability |
| 71–72 | 58–59, Theorem 6.10 and proof | Bounded measurable phase, exponential representation, uniqueness, principal logarithm and complex extension |
| 73 | 60, Remark 6.11 | Extra zero-anchor condition and the class relation corrected by errata |
| 76 | 63, Theorem 7.3 | Complete reciprocal theorem, explicitly restricted to nonzero functions |

The retained [official first-edition errata](https://www.motapa.de/bernstein_functions/misprints-ssv.pdf)
were also rendered and checked at page 2; their SHA256 is
`8B1A84D42F825BA4F6DC4EADF6C1EDEC9703D386E1F53ECA912A003328EB4A7C`.

For `M(s)=∫(s+b)⁻¹ P(db)`, probability normalization gives a nonzero Stieltjes
function. Applying Theorems 7.3 and 6.10 to `1/M`, negating, and subtracting the
value at one yields the Lean real formula with the correct sign. In the upper
half-plane `Im M(z)<0`, which fixes the principal logarithm without an extra
multiple of `2πi`. The anchored real and complex kernels are absolutely integrable
without an inverse moment at zero.

The real-only uniqueness premise is sufficient: a competing bounded phase's
anchored formula reconstructs an unanchored representation after choosing its
constant at one. Uniqueness then holds almost everywhere, exactly as asserted.
A Borel version extended by zero outside the positive half-line supplies Lean's
global measurable representative and pointwise bounds without changing the
integrals.

The corrected intermediate Herglotz measure and the one-way inclusion in Remark
6.11 are compatible with this specialization. The unrelated correction from
completely monotone to Bernstein in Comments 6.12 is not used. Boundary recovery,
joint parameter measurability, and generator continuity remain local conclusions.

**Independent disposition: the first-round SSV source-verification gap is closed.
E-S1 remains an external axiom; this source review does not prove it inside Lean.**

## Executed validation and evidence

All commands used the installed pinned `lake.exe`, with `LEAN_NUM_THREADS=2`,
from `formalization`:

```powershell
$env:LEAN_NUM_THREADS = '2'
$auditLake = 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe'
& $auditLake build
& $auditLake env lean AxiomAudit.lean
& $auditLake env lean ..\tmp\semantic-audit-2026-09-25\IndependentContracts.lean
& $auditLake env lean ForHumanCheck.lean
```

| Check | Result |
|---|---|
| Default project build | Exit 0; `Build completed successfully (3955 jobs)` |
| Direct `AxiomAudit.lean` | Exit 0; 1005 `#print axioms` commands and 1005 corresponding outputs |
| Auditor-owned `IndependentContracts.lean` | Exit 0; full main and primitive contracts, local dependency lists, actual environment axiom enumeration, and absence of selected retired declarations checked |
| All five existing `Checks/*.lean` files | Each executed directly and exited 0; these are outside the default build globs |
| `ForHumanCheck.lean` | Exit 0; same three-axiom main-theorem dependency list |
| Direct source re-elaboration of 22 key modules | Each exited 0; individual logs retained |

The 22 directly re-elaborated modules comprise the five new Gamma/Dirichlet and
Markov–Krein foundation files, `GGC/GammaDirichlet.lean`, all three current External
files, `main.lean`, all ten files in `GGC/Thorin/`, `GGC/Thorin.lean`, and
`GGC/LaplaceTightness.lean`.

The default build retained caches. Direct Lean invocations re-elaborated the
selected source files against the built imports. This is not described as a clean
rebuild of all project modules or dependencies. No `sorryAx`, `Lean.ofReduceBool`,
or unexpected project axiom was found in the inspected dependency outputs.

The final theorem's actual dependency list is:

```text
propext
Classical.choice
Quot.sound
GGC.External.James.posterior_palm_nonneg
GGC.External.SSV.phase_representation
GGC.External.Sethuraman.stick_breaking
```

The independent imported-environment scan also lists exactly those three project
axioms. `GGC.External.Bondesson.weak_closure`,
`GGC.External.James.markov_krein`, and
`GGC.isGGC_iff_hasThorinRepresentation` are absent from that environment.

Evidence, the independent temporary Lean probe, source hashes, fresh source-check
logs, and rendered source pages are retained under
`../tmp/semantic-audit-2026-09-25/`. The result is a successful statement/interface
audit and checked Lean proof relative to the stated trust boundary, not a claim
that the three external axioms have themselves been formally proved.
