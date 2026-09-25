# Formalization Construction Report

This report records implementation work, completed declarations, API evidence,
build commands and results, axiom audits, current milestone status and remaining
gaps. [Blueprint.md](Blueprint.md) is the read-only construction specification:
follow its design contracts, module responsibilities and acceptance criteria.
Do not edit the blueprint during implementation, including its status text.
Record actual progress here. General rules belong in [README.md](README.md).

Append future completion reports here, with the date, Blueprint/WIP node,
changed files and declarations, verification evidence, actual dependencies,
and remaining obligations. Do not append completion reports to the blueprint.
Historical entries retain their status at the time; later entries supersede
those statuses without claiming that earlier checks have been rerun.

Current design acceptance: **M0–M7 accepted as `verified` within the registered
trust boundary.** The user accepts the distribution version as the complete
deliverable and withdraws RV-1; it is not recorded as implemented. Section 26's
successful independent verification remains the evidence for the law theorem.
**E1 is independently accepted as `verified`**; see
[Section 29](#e1-design-acceptance-2026-09-24). The root definitions module,
readable final proof and import boundary passed review; the fresh project
build covered 137 modules / 3940 jobs and the subsequent audit matched all
883 checks. Three legacy path comments are recorded as nonblocking D1.
M1's characterization and realization are verified relative to the registered
literature axioms, as detailed in the independent acceptance record.
The main theorem and clean project build pass; the [M7 record](#m7-completion-2026-09-24)
records final verification and all seven literature dependencies. The accepted base is documented in the
[M1 implementation record](#m1-characterization-2026-09-23) and the
[independent M1 design acceptance](#m1-design-acceptance-2026-09-23).
The [M2 completion record](#m2-completion-2026-09-24) supersedes the M2 gaps in
the [M2/M3 continuation record](#m2-m3-canonical-phase-2026-09-24),
the [posterior construction](#m2-m3-posterior-2026-09-23)
and the [initial construction record](#m2-m3-foundations-2026-09-23).
The [M3 completion record](#m3-completion-2026-09-24) closes the generator,
absolute posterior/Palm and averaged resolvent obligations in those entries.
The [M2 whole-tree revalidation](#m2-revalidation-2026-09-24) confirms the
M2 delivery and records the compiled continuity groundwork without claiming
the full M4 contract.
The [M4 phase and sample continuity record](#m4-phase-sample-continuity-2026-09-24)
closes the L¹ phase-pairing gap and proves deterministic sample continuity.
The [M2 quantile completion check](#m2-quantile-completion-2026-09-24) integrates
ordered locations into the common-space realization and revalidates the full
tree, including all 17 quantile results. It preserves the M2 construction
verdict. The [M4 completion record](#m4-completion-2026-09-24) supersedes the
remaining M4 gaps in both entries: common-space coupling, actual posterior
averaging and integration against varying outer laws are now proved. Its
default build passes 3814 jobs and independent audit checks 455 declarations.
The [M5 Euler construction record](#m5-euler-foundation-2026-09-24) proves the
positive kernel, exact moments, actual nonlinear iteration, uniform second
moments, tightness and local consistency. Its default build passes 3825 jobs
and independent audit checks 535 declarations. The subsequent
[M5 completion record](#m5-completion-2026-09-24) closes time control, the common
curve subsequence and the limiting weak equation. Its default build passes
3891 jobs and independent audit checks 624 declarations. The
[M6 completion record](#m6-completion-2026-09-24) adds the actual power-law
identification, with 3937 build jobs and 876 audited declarations. The subsequent
[M7 completion](#m7-completion-2026-09-24) closes final assembly, with 3939 build
jobs, all 136 project modules freshly compiled, and 883 audited declarations.
The [mathlib reuse audit](#mathlib-reuse-2026-09-24) records the subsequent
library search, adopted replacements and remaining library-interface boundaries.

<a id="design-review-2026-09-23"></a>
## 1. Design review and engineering acceptance — 2026-09-23

**Initial design API evidence, 2026-09-23 (before migration):** source-read only at the pinned mathlib revision: `Mathlib.Probability.Distributions.Gamma` supplies `ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.isProbabilityMeasure_gammaMeasure`, and the gamma-integral argument used for normalization. No minimal compile or full characterization feasibility proof was performed in this design update. The eventual cost decision remains an implementation task; failure to find one guessed name is not evidence that the theorem must be axiomatized.

Scope: compare the blueprint with the existing scaffold, external inventory, manuscript and written proof ledgers; revise design contracts and run the existing acceptance commands. No Lean implementation, external axiom, toolchain pin or manuscript was changed. This was not a new primary-literature audit or a proof of the planned Lean nodes.

| Review ID | Finding and consequence | Design resolution and remaining acceptance |
|---|---|---|
| R1 — high | C previously allowed arbitrary \(h>0\) while requiring \(p\ge1/2\). The source requires small steps. For \(F=\delta_y\), \(k(y,v)=1_{v>0}\) a.e.; at \(h=4\), \(p=1-4/(e^2-1)<1/2\). | Restrict \(h=T/N\le1/16\) and expose the uniform truncation estimate. M5 must still prove this contract. |
| R2 — high | The power-derivative-to-\(s\)-derivative bridge was implicit, and the zero-endpoint wording did not identify \(h\) as the function needing absolute space-time integrability. The missing distinction could leave time--Laplace Fubini unjustified. | A now exports the bridge; D lists \(h\)'s three terms, its \(L^1\) bound including the product term, and the pointwise endpoint limit with time domination. M2/M6 remain planned. |
| R3 — medium | Laplace uniqueness and gamma/beta analytic dependencies had no explicit module owner; the graph omitted the Dirichlet input used by value-law logarithmic moments. | Add planned primitive Laplace, gamma-analysis and shared-semantics modules, and the missing dependency edges. Also expose C's uniform compact-test bound. These are contracts, not new proved lemmas. |
| R4 — medium | M0 required all deferred external semantics, while M2 and its prerequisite semantic module were scheduled only afterward. The module tree did not assign that shared foundation, and M0's remaining checks were unspecified. | Assign shared semantics and deferred contracts to M2's initial gate, list M0's remaining checks, and allow independent work once the public interfaces are frozen. No actual import cycle was found in the existing scaffold. |
| R5 — medium | Generic `lake` commands did not replay in this review environment: the elan shim reported `couldn't find value of ELAN_HOME`. Earlier evidence did not record the actual executable path. | The pinned toolchain's executable passed version/build/audit. Record the exact invocation and cached-build limit in the README; no environment or code change was made. |

Acceptance verdict: the existing statement/scaffold and its documented axiom boundary pass the checks run in this review. **M0 remains `in_progress`; M1--M7 remain `planned`; the main theorem is not accepted as implemented or proved.** No scope conflict was found for noninteger powers, \(q=1\), drift, infinite Thorin mass, nonatomic inputs or degenerate laws. The contract corrections above do not by themselves change the written argument's research status.

Subsequent design decision on the same date: the user approved storing proof details separately while retaining complete definitions in `main.lean`. [Blueprint Section 4.1](Blueprint.md#statement-proof-separation) records that approved migration and supersedes the former plan to assemble the proof in `main`. The review/build evidence above predates the migration; no file movement or new proof verification is claimed by this design update.

Further approved decision on the same date: use the original finite-gamma weak-limit definition of `IsGGC` in `main`; move Thorin representability to a separate characterization. [Blueprint Section 2.1](Blueprint.md#original-ggc-definition) records proof-first implementation and the authorized E-B4 literature fallback if the work is substantial. The previous acceptance record concerns the old representation-based scaffold only. Neither the semantic migration nor a characterization proof/axiom has been implemented by this documentation update.

<a id="migration-acceptance-2026-09-23"></a>
## 2. Original-definition migration acceptance — 2026-09-23

This implementation follows the approved Blueprint Sections 2.1 and 4.1 design and
supersedes their earlier "not implemented" status descriptions. It does not
change the historical design-review results in Section 1 of this report.

- `main.lean` now contains actual normalized gamma laws, finite-product/sum
  laws, finite-gamma membership, sequential weak-limit `IsGGC`, powers and
  the full target. It imports mathlib only and has no auxiliary theorem.
- `GGC.Basic`, `GGC.FiniteGamma`, `GGC.Laplace` and `GGC.Thorin` own the
  separated helpers and analytic definitions. The former constant-law
  membership proof is correctly renamed `hasThorinRepresentation_diracLaw`;
  it is not silently reused for the new definition.
- The empty-sum and single-gamma identities and original-definition membership
  are proved, as are the exponent-one case, constant-law power pushforward
  and fixed-power preservation of weak convergence.
- The default Lake build includes all new modules and `AxiomAudit`. Running
  the pinned Lake executable's `build` command from `formalization` succeeded
  with exit code 0 (`2781 jobs`, using cached mathlib dependencies).
  The audit prints both predicates and their definitions. Every audited local
  lemma and the target definition depend only on `propext`, `Classical.choice`
  and `Quot.sound`; the three separately inspected external axioms are unchanged.
- No new axiom, `sorry` or unfinished final theorem was introduced. The target
  is still an unproved proposition. M0 remains `in_progress`; the separate
  characterization, general weak closure, positive-constant membership and
  final power proof remain open. No E-B4 fallback has been selected merely
  to perform this definition migration.

<a id="m0-m1-acceptance-2026-09-23"></a>
## 3. M0 completion and first M1 proofs — 2026-09-23

This record supersedes the earlier milestone statuses in the historical
Sections 1–2 of this report. `main.lean`, the full target and the three external axiom
declarations are unchanged. No new axiom or draft proof is introduced.

| Node / source | Actual declarations and assumptions | Status and dependencies |
|---|---|---|
| A / M0; manuscript Section 1, definition of `L_ν` | `GGC.Laplace`: `laplace_integrand_le_one`, `laplace_integrable`, `laplace_zero`, `laplace_pos`, `laplace_le_one`, `laplace_antitone`, `laplace_diracLaw`. For arbitrary `NonnegLaw`, integrability and bounds hold for every `s ≥ 0`, without moments. | `verified`; imports `GGC.Basic`; no external mathematical axiom. |
| B transform component / M1; foundations Gamma density and `eq:finite-gamma-approximation` | `GGC.FiniteGamma`: `integral_gammaLaw` for integrable tests, `integral_gammaPDFReal`, `laplace_gammaLaw`, `laplace_gammaLaw_eq_exp`, `finiteGamma_laplace_integrable`, `laplace_finiteGammaLaw_eq_prod`, `laplace_finiteGammaLaw`. Positive shapes/rates, arbitrary finite number of factors including zero, and `s ≥ 0`. | `verified`; actual density rate shift and finite-product integration; no external mathematical axiom. B's initial log-rate construction is still planned. |
| W / M1; `lem:ggc-closure` | `GGC.WeakClosure`: `isGGC_iff_mem_closure`, `isGGC_of_tendsto`. Sequential GGC membership equals closure of the image of actual finite gamma laws in `ProbabilityMeasure ℝ`; every weak probability limit of GGC laws is GGC. | `verified`; `GGC.Basic`, mathlib's Lévy–Prokhorov metrization and sequential closure; no Thorin or external dependency. |
| W / M1; WIP-6.21 Stage B, manuscript Section 6 final approximation | `GGC.Reduction`: `isGGC_powerLaw_of_finiteGamma` for a fixed `q ≥ 0`, and `ggcPowerClosure_of_finiteGamma` for all real `q ≥ 1`. Both retain an explicit finite-input power-closure premise. | Conditional reduction `verified`; imports `GGC.WeakClosure`; no external mathematical axiom. The premise and main theorem are **not** proved. |

### API evidence and characterization assessment

At mathlib revision `905b95818eb32af7874a58b427f50c1711a5e96c`, the following
APIs are now `minimal_use_compiled` in the default project build:

- `MeasureTheory.integral_exp_pos`, `Integrable.mono'` and
  `MeasureTheory.integral_mono_ae` in `GGC.Laplace`.
- `MeasureTheory.integral_withDensity_eq_integral_toReal_smul`,
  `MeasureTheory.Integrable.fintype_prod`, `MeasureTheory.integral_map`
  and `MeasureTheory.integral_fintype_prod_eq_prod` in `GGC.FiniteGamma`.
- `MeasureTheory.instMetrizableSpaceProbabilityMeasure`,
  `mem_closure_iff_seq_limit` and `IsClosed.mem_of_tendsto` in `GGC.WeakClosure`.
  The metrization instance requires the explicit
  `Mathlib.MeasureTheory.Measure.LevyProkhorovMetric` import.

The pinned `Probability/Distributions/Gamma.lean` supplies density and
normalization, but no scalar Laplace formula. The local rate-shift proof above
closes that missing adapter. Searches across pinned mathlib did not locate a
ready-made nonnegative-law Laplace uniqueness theorem. The inspected
`Probability/Moments/ComplexMGF.lean` still explicitly lists equality in
distribution from equal MGF as a TODO; this does not prove that another
uniqueness route is unavailable. A uniqueness argument through the compact
pushforward `x ↦ exp (-x)` and polynomial approximation remains a possible
local route and has not been implemented or costed fully here.

Consequently, route 2 of [Blueprint Section 2.1](Blueprint.md#original-ggc-definition) is not yet a complete bridge: finite-atomic
Thorin measure/integrability adapters, Laplace uniqueness, and the E-B2/E-B3
public-predicate adapters remain. The local transform component is now proved;
no E-B4 fallback is selected or declared in this increment. The final cost
decision for the remaining bridge stays open. M1 remains `in_progress`, with
positive-constant GGC membership and the endpoint admissibility equivalence
also pending. M2–M7 remain `planned`.

### Reproducible verification

Working directory:
`E:\AI\GitHub\generalized-gamma-convolution-power-problem\formalization`.
The generic elan shims again failed with `couldn't find value of ELAN_HOME`;
the installed pinned toolchain was invoked directly, without changing the
environment or dependency pins:

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean --version
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

All three pass with exit code 0. Lean reports 4.32.2, commit
`f3b06c705e6c85f5314019d5d3baab0fec5b580c`; mathlib's checked-out HEAD matches
the pin. The default build reports `2788 jobs`, using cached mathlib
dependencies, with no Lean warning or error. This is project compilation,
not a clean rebuild of mathlib. Existing Lake globs cover the two new modules
without a configuration change.

`AxiomAudit.lean` prints the complete conditional signatures and audits every
new declaration listed above. Their axiom sets are exactly
`{propext, Classical.choice, Quot.sound}`, with no `sorryAx`, external
mathematical axiom or native-evaluation dependency. The original three external
contracts remain independently printed and audited. Local build/audit logs are
retained in ignored `.lake/m0-m1-build.log` and `.lake/m0-m1-audit.log`.

The pre-existing working-tree change to `lake-manifest.json` was preserved.
No final `GGC.ggc_rpow` declaration or `GGC/PowerClosure.lean` is claimed.

<a id="m0-design-acceptance-2026-09-23"></a>
## 4. Independent M0 design acceptance — 2026-09-23

**Verdict: accepted; M0 `verified`, M1 `in_progress`, M2–M7 `planned`.**
The designer inspected the actual sources and independently reran verification,
rather than accepting Section 3's reported results alone. No blocking M0
finding remains. This review updates the blueprint and this acceptance record;
it does not modify Lean implementation, dependency pins or external contracts.
Pre-existing working-tree changes were preserved.

| Blueprint M0 gate | Review evidence and conclusion |
|---|---|
| 1 — reproducible environment and coverage | Lean 4.32.2, commit `f3b06c705e6c85f5314019d5d3baab0fec5b580c`; `lakefile.toml`, manifest and the clean mathlib source checkout agree on `905b95818eb32af7874a58b427f50c1711a5e96c`. Default library roots/globs cover `main`, all `GGC`/`External` submodules and `AxiomAudit`. Version, build and direct audit pass with exit code 0. |
| 2 — semantics and trust boundary | Source and printed definitions retain arbitrary `NonnegLaw` and every real `q ≥ 1`. `finiteGammaLaw` maps the actual product of gamma probability measures under `x ↦ ∑ i, x i`; `IsGGC` is sequential weak approximation by these laws. `powerLaw` is the actual real-power pushforward. Thorin representability is separate. Only E-B1–E-B3 are declared as external axioms; their primitive types match the whitelist and recorded source adaptations. No new primary-text audit is claimed. |
| 3 — endpoints and Laplace checks | Rechecked `finiteGammaLaw_zero`, `finiteGammaLaw_one`, `isGGC_zero`, `isGGC_gammaLaw`, `powerLaw_one`, `isGGC_powerLaw_one` and `powerLaw_diracLaw`. `laplace_integrable μ hs` proves actual integrability for `hs : 0 ≤ s`, by a.e. domination by one; `laplace_zero μ` gives normalization; `laplace_pos μ hs` proves positivity using that integrability. There is no finite-moment premise or reliance on a default value for a divergent integral. Positive-constant original-GGC membership remains M1 work. |
| 4 — ownership and import graph | `main` imports mathlib only and contains the complete target definitions and construction proofs. Helpers reside in their assigned modules. `WeakClosure → Basic → main` and `Reduction → WeakClosure` have no Thorin/external dependency. `External.Bondesson` imports mathlib only. The graph is acyclic and the audit imports the implemented modules. No unfinished final theorem is present. |

The review also confirms Section 3's completed M1 components:
`laplace_gammaLaw`, `laplace_gammaLaw_eq_exp`, the finite-product integrability
and transform formulas, `isGGC_iff_mem_closure`, `isGGC_of_tendsto`, and both
conditional reduction theorems. Their actual signatures and proofs preserve
the stated scope. In particular, `ggcPowerClosure_of_finiteGamma` still takes
the finite-input theorem as a premise; it does not supply that theorem.

Verification working directory:
`E:\AI\GitHub\generalized-gamma-convolution-power-problem\formalization`.

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean --version
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
git -C .lake/packages/mathlib rev-parse HEAD
git -C .lake/packages/mathlib status --short
```

All commands succeeded with exit code 0; mathlib's status output is empty.
The default build reported `Build completed successfully (2788 jobs)`.
This is validation using cached dependencies, not a clean mathlib rebuild.
The direct audit reran separately. No Lean warning or error appeared in either
log. Every audited local declaration has exactly
`{propext, Classical.choice, Quot.sound}` as its axiom set; each external
contract additionally lists itself. There is no `sorryAx`, unregistered
mathematical axiom or native-evaluation dependency in those audited results.
Source inspection found no unfinished proof or extra axiom declaration in the
project modules. Logs are retained locally in ignored
`.lake/m0-design-review-build.log` and `.lake/m0-design-review-audit.log`.

The blueprint now records the accepted M0 status, the implemented M1 subset,
current module/import coverage and the remaining handoff. Remaining M1 work
includes finite-atomic Thorin data, admissibility adapters, the characterization
route decision and its proof/adapter, Laplace uniqueness if using route 2,
and positive-constant original-GGC membership. Initial log-rate construction
also remains open. The earlier external-file documentation still contains
historical wording about the gamma-sum API and statement/helper migration being
unimplemented; this is a nonblocking documentation follow-up for the next
external-interface update, not an additional mathematical gap.

No characterization axiom was added. No main-theorem proof or acceptance of
M1 as a whole is claimed.

<a id="m1-characterization-2026-09-23"></a>
## 5. M1 characterization and admissibility — 2026-09-23

**Construction result: M1 implementation verified, ready for independent
design acceptance.** This is the constructor's implementation/build report,
not an independent designer acceptance. It completes the remaining M1
contracts listed in the accepted blueprint and reuses Section 3's finite-gamma
transform, original-GGC weak closure and conditional reduction.

### Selected route and mathematical scope

Selected **Blueprint Section 2.1, route 2**: a local derivation using the
already registered E-B2 and E-B3. No E-B4, replacement characterization axiom,
or new external declaration was necessary. The construction does not weaken
the original definition or introduce extra hypotheses on the main theorem.

The missing Laplace uniqueness proof turned out to be modest after locating
mathlib's `ext_of_forall_mem_subalgebra_integral_eq_of_polish`. On nonnegative
reals, `exp (-x)` is bounded, continuous and injective. Polynomial combinations
of this function form a star subalgebra separating points. Agreement of the
nonnegative-integer Laplace integrals gives agreement on its monomials, then
all polynomials, hence equality of finite measures. For `NonnegLaw`, map by
`Real.toNNReal`, use probability normalization for the zero parameter, and
recover the original measures by the real coercion and a.e. nonnegativity.
There is no moment or compact-support assumption. This is the implemented
route, superseding Section 3's tentative compact-pushforward proposal.

For the forward characterization, construct the actual atomic Thorin measure
of each finite gamma approximant and apply E-B2 to their weak probability
limit. For the reverse direction, E-B3 supplies approximants with finite-atomic
transforms; local uniqueness identifies each with `finiteGammaLaw`. Their
existing weak convergence then witnesses the original `IsGGC` definition.
The equivalence covers arbitrary nonnegative drift, zero laws, infinite Thorin
mass and nonatomic measures, without moment restrictions.

### Completed declarations and provenance

All names below are in namespace `GGC`. Base logical axioms are abbreviated
as **L = `{propext, Classical.choice, Quot.sound}`**.

| Blueprint node / source | File and actual declarations | Complete scope / audit result |
|---|---|---|
| L / M1; Blueprint primitive Laplace interface, manuscript Section 5 transform identification | `GGC/Laplace.lean`: `measure_eq_of_laplace_nat_eq`, `nonnegLaw_eq_of_laplace_eq` | Finite measures on `ℝ≥0` with equal transforms at all natural parameters; arbitrary `NonnegLaw` with equal transforms at every positive real parameter. No moments. **L only.** |
| H / M1; `eq:thorin-admissibility`, Blueprint Section 2.1 | `GGC/Thorin.lean`: `ThorinAdmissible.integrable_log`, `measure_le_lt_top`, `isLocallyFiniteMeasure` | `log (1+s/b)` is integrable for all `s ≥ 0`; the measure has finite mass on every `{b ≤ R}`, `R > 0`, and is locally finite. No finite-total-mass hypothesis. **L only.** |
| H / M1; classical endpoint adaptation in the same source contract | `ThorinEndpointAdmissible`, `thorinAdmissible_iff_endpoint` | For every measure on positive rates: admissibility iff local finiteness, integrability of `log b` on `{b ≤ 1}`, and integrability of `1/b` on `{1 < b}`. `IntegrableOn` includes absolute integrability. **L only.** |
| B transform / H / M1; WIP-0.1, `eq:finite-gamma-approximation` | `finiteThorinMeasure`, `finiteThorinData`, `integrable_finiteThorinMeasure`, `integral_finiteThorinMeasure`, `hasThorinRepresentation_finiteGammaLaw` | Actual measure `∑ i, ofReal (α i) • dirac (b i)` with positive shapes/rates; exact integral formula and zero-drift representation of the independent sum, including `k = 0`. **L only.** |
| H / M1; Bondesson registered E-B2 | `IsGGC.hasThorinRepresentation` | Original GGC weak-limit membership implies the separate representation predicate. **L + E-B2.** |
| H / M1; Bondesson registered E-B3 | `HasThorinRepresentation.isGGC` | Representation implies original finite-gamma weak-limit membership. **L + E-B3.** |
| H / M1; Blueprint characterization contract | `isGGC_iff_hasThorinRepresentation` | `∀ μ : NonnegLaw, IsGGC μ ↔ HasThorinRepresentation μ`. **L + E-B2 + E-B3**, with no E-B1 or E-B4 dependency. |
| M1 semantic acceptance; nonnegative constants and positive drift | `isGGC_diracLaw` | Every `a ≥ 0`, including positive constants, is an original GGC law. **L + E-B3.** The earlier zero-law proof remains axiom-free apart from L. |
| L / M1 realization adapter; registered E-B1 | `exists_law_thorinLaplace`, `existsUnique_law_thorinLaplace` | Every `ThorinData` has exactly one realizing `NonnegLaw`. **L + E-B1**; uniqueness is local and does not use E-B2/E-B3. |

The parameter bound uses a natural `n ≥ s` and Bernoulli's inequality to
dominate `log (1+s/b)` by `n * log (1+1/b)`. Endpoint equivalence uses explicit
comparisons with `-log b` near zero and `1/b` at infinity. The reverse direction
uses local finiteness on the compact rate interval `[exp (-1), 1]`.
That local-finiteness clause is essential: integrability of `log b` alone
cannot rule out infinite mass at rate one. Local finiteness is proved from
`ThorinAdmissible`, not added to the public GGC membership definition.

### API evidence and trust boundary

At the pinned mathlib revision, the finite-measure separation theorem,
bounded-continuous-function integration, polynomial induction/monomial
evaluation, finite-sum measure integration, restricted integrability and
compact-set finiteness APIs are all `minimal_use_compiled` in their actual
proofs. Positive-rate subtypes do not synthesize `CompactIccSpace` here;
the proof explicitly transfers compactness of a real closed interval through
`Subtype.isCompact_iff` instead of changing the rate space.

`AxiomAudit.lean` now prints the endpoint predicate and finite Thorin data,
checks the public uniqueness/characterization/realization types, and audits
every new public theorem. The dependency sets are exactly those in the table.
No `sorryAx`, native-evaluation dependency or unregistered mathematical axiom
occurs. Original-GGC weak closure and the conditional reduction continue to
use L only. `main.lean` still imports mathlib only and is unchanged.

The primitive E-B1/E-B2/E-B3 declaration types are unchanged. Their comments
and `External/README.md` now identify the actual consumers and completed local
adapters, fixing the historical gamma-sum/migration wording noted in the M0
review. This is an implementation/dependency update, not a new primary-text
literature audit.

### Verification and handoff

Working directory:
`E:\AI\GitHub\generalized-gamma-convolution-power-problem\formalization`.
The installed pinned executable was reused:

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lean.exe' --version
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
git -C .lake/packages/mathlib rev-parse HEAD
```

All passed with exit code 0. Lean is 4.32.2, commit
`f3b06c705e6c85f5314019d5d3baab0fec5b580c`; mathlib HEAD is
`905b95818eb32af7874a58b427f50c1711a5e96c`. The default build completed
successfully with **2830 jobs** using cached mathlib dependencies. The direct
audit ran separately. Neither log contains a Lean warning/error or `sorryAx`.
This is not a clean rebuild of mathlib. Logs are retained locally in ignored
`.lake/m1-characterization-build.log` and `.lake/m1-characterization-audit.log`.
`git diff --check` passed.

The blueprint was read but not edited. Its SHA-256 before and after this
construction is identical:
`52C5FE84C5C511740CAB0725F3E385A175854529023F5BA379A12277CC77CE09`.
The designer's pre-existing blueprint edits and all other pre-existing work
were preserved. No dependency pins or Lake coverage configuration changed.

**Next construction:** M2's shared random-measure semantics and fully stated
deferred external contracts, followed by Gamma/Dirichlet and tangent work.
The initial finite-input log-rate construction is still open; it is distinct
from the M1 finite-atomic Thorin adapter completed here. M2–M7, the finite-input
power theorem and `GGC.ggc_rpow` remain unimplemented. The conditional reduction
is still conditional, and no full power-closure acceptance is claimed.

<a id="m1-design-acceptance-2026-09-23"></a>
## 6. Independent M1 design acceptance — 2026-09-23

**Verdict: accepted; M1 `verified` relative to the existing literature inputs.
No blocking finding.** This review checks the actual current working tree,
not just Section 5's construction report. M0 remains accepted and M2–M7 remain
`planned`. Only the blueprint and this report were edited during the review;
all pre-existing implementation changes were preserved.

### Contract and dependency review

Let L denote `{propext, Classical.choice, Quot.sound}`. The independent direct
audit confirms the following dependency sets.

| M1 obligation | Inspected implementation and verdict | Axioms |
|---|---|---|
| Finite-gamma transform and atomic adapter | Actual independent-product/sum semantics; scalar and finite-sum Laplace formulas; `finiteThorinMeasure` is the weighted Dirac sum with exact integration formula; `finiteThorinData` has zero drift. All finite sizes, including zero, are covered. Passed. | L |
| Laplace uniqueness | `measure_eq_of_laplace_nat_eq` uses the bounded continuous exponential algebra separating points on `ℝ≥0`; `nonnegLaw_eq_of_laplace_eq` handles parameter zero by probability normalization and recovers the original real measures by a.e. nonnegativity. No moment or bounded-support premise. Passed. | L |
| Admissibility | `ThorinAdmissible.integrable_log` covers every `s ≥ 0` by integrable domination; local finiteness and `thorinAdmissible_iff_endpoint` are proved. Local finiteness in the endpoint predicate prevents uncontrolled mass at rate one and is not an added assumption on original GGC membership. Infinite total mass remains permitted. Passed. | L |
| Forward characterization | `IsGGC.hasThorinRepresentation` applies E-B2 to the actual finite-gamma approximants and their atomic representations. Passed. | L + E-B2 |
| Reverse characterization | `HasThorinRepresentation.isGGC` uses E-B3's nonnegative probability approximants and local uniqueness to prove equality with actual finite gamma laws, preserving their weak limit. Passed. | L + E-B3 |
| Public characterization | `isGGC_iff_hasThorinRepresentation (μ : NonnegLaw)` has no extra drift, support, moment or total-mass assumptions. It follows selected route 2; E-B4 is neither declared nor needed. Passed. | L + E-B2 + E-B3 |
| Constant laws | `isGGC_diracLaw a ha` proves original membership for every `a ≥ 0`, including positive constants, separately from representability. The earlier `isGGC_zero` proof still uses only L. Passed. | L + E-B3 |
| Realization | `exists_law_thorinLaplace` and `existsUnique_law_thorinLaplace` cover arbitrary `ThorinData`; uniqueness is locally proved. Neither theorem asserts parameter regularity. Passed. | L + E-B1 |
| Weak closure and final reduction | `isGGC_of_tendsto` uses local sequential/closure equivalence; both reduction theorems retain their explicit finite-input power premise. No Thorin import or external axiom enters these proofs. Passed as a conditional reduction. | L |

The complete original `IsGGC` and target quantifiers remain unchanged in
meaning. `main` imports only mathlib. `Thorin` imports `Laplace`, `FiniteGamma`
and `External.Bondesson`; those dependencies do not import `Thorin`. The
import graph is acyclic. Only the three registered Bondesson axioms occur;
their declaration types are unchanged (the external-file diff changes
documentation). Their existing source adaptations and whitelist were checked;
this review does not claim a new primary-literature audit.

### Current snapshot and verification evidence

The current tree differs from the M0 snapshot and from Section 5's statement
that `main.lean` is unchanged: `finiteGammaLaw` now uses
`ProbabilityMeasure.pi` and imports `FiniteMeasurePi`. Inspection of the pinned
mathlib definition shows this is the same `Measure.pi` with its probability
proof. `finiteGammaLaw_toMeasure` still compiles with proof `rfl`, and the
empty/single-factor and power sanity results pass. This is an accepted
semantics-preserving wrapper change, not a hidden change of independence or
GGC membership. The current build has **2831 jobs**, superseding Section 5's
2830-job count for this reviewed snapshot. No attempt is made to attribute
the timing or author of the pre-existing wrapper change.

Working directory:
`E:\AI\GitHub\generalized-gamma-convolution-power-problem\formalization`.

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean --version
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
# Run after build completes:
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
git -C .lake/packages/mathlib rev-parse HEAD
git -C .lake/packages/mathlib status --short
```

The version, completed build and post-build direct audit each returned exit
code 0. Lean is 4.32.2, commit
`f3b06c705e6c85f5314019d5d3baab0fec5b580c`. Mathlib HEAD matches the pinned
`905b95818eb32af7874a58b427f50c1711a5e96c`, and its source status is clean.
The build compiled current project modules using cached mathlib dependencies;
it was not a clean rebuild of mathlib. Final build/audit logs contain no Lean
warning or error. No audited result uses `sorryAx`, native-evaluation trust
or an unregistered mathematical axiom. Project source inspection found no
unfinished proof or extra axiom declaration.

Logs: ignored `.lake/m1-design-review-build.log` and
`.lake/m1-design-review-audit.log`. An initial direct audit was launched before
the build finished and returned exit code 1 because `GGC.FiniteGamma.olean`
was not yet available; that invocation is not acceptance evidence. Its log is
retained as `.lake/m1-design-review-audit-premature.log`. The separate rerun
after successful build completion passed.

The blueprint now records M1 acceptance, the selected route and exact trust
boundary, updated module status and the M2 handoff. Initial normalized
log-rate data and their mass/moment certificates remain future finite-input
construction work. M2's shared semantics, deferred external contracts and
parameterized constructions, and M3–M7's core results remain unimplemented.
In particular, neither the finite-input power theorem nor `GGC.ggc_rpow` is
proved. No main-theorem acceptance is claimed.

<a id="m2-m3-foundations-2026-09-23"></a>
## 7. M2/M3 foundations and deterministic analysis — 2026-09-23

**Partial implementation, not M2/M3 completion.** The request to complete both
milestones is not yet fulfilled. This entry records actual Lean proofs; it
does not replace the blueprint's A/B contracts with weaker deliverables.
No independent design acceptance is claimed for these changes.

### Implemented declarations

| File | Implemented and checked scope |
|---|---|
| `GGC/Foundations/RandomMeasure.lean` | Mathlib-only shared semantics. `gammaShapeLaw` is an actual unit-rate gamma probability for positive shapes and a point mass at zero for shape zero. `dirichletLaw` is the normalization pushforward of the actual independent finite gamma product. `dirichletLaw_zero_coordinate` proves zero cells vanish almost surely; `dirichletLaw_simplex` proves nonnegativity and total mass one whenever some shape is nonzero. |
| Same foundation | `Partition` permits empty cells and includes measurability, disjointness and coverage. `Partition.exists_nonzero_shape` verifies that a nonzero finite base cannot produce an all-zero covering-partition shape vector. `partitionEval` uses actual measure evaluations, with a measurability proof. `IsDirichletProcess` is a predicate on a probability law of probability measures, using every finite measurable partition. It imposes no nonatomicity restriction. |
| Same foundation | `measurable_probability_map`, `Partition.comap`, `partitionEval_map` and `IsDirichletProcess.map` prove transport under arbitrary measurable maps, without injectivity or additional randomness. This is a reusable adapter for rate-coordinate changes. The current measurable structure is mathlib's Giry structure; a weak-topology Borel compatibility theorem has not been supplied. No existence theorem for a DP law or parameterized DP realization is claimed. |
| `GGC/GammaAnalysis.lean` | Defines the real digamma as `deriv Real.Gamma / Real.Gamma`, and `betaLaw` using the actual mathlib beta measure with its normalization proof. Derives the absolutely integrable gamma logarithmic kernel and real Gamma derivative from mathlib's Mellin differentiation theorem. Proves absolute integrability of both `log G` and `G * log G`, then `E[log G] = ψ(B)` and `E[G log G] = B ψ(B+1)` for every positive shape and unit rate. |
| Same gamma module | Proves continuity of the Gamma derivative and digamma on positive reals, and digamma bounds on arbitrary compact positive intervals. Proves `∫₀¹ x^(B-1)(-log x) dx = 1/B²`, then the actual gamma-law negative-log bound `E[max(-log G,0)] ≤ 1/(Γ(B) B²)`. The bound function is continuous and bounded on compact positive intervals. Beta logarithmic expectations are **not** yet proved. |
| `GGC/LogRate/Kernel.lean` | Defines the specified combined correction kernel with `K(1)=0`. Proves measurability, the cleared-denominator identity and numerator derivative, nonpositive/nonnegative sign bounds on the two sides of one, and absolute integrability by separate bounds near zero, near one and at infinity. A continuous primitive proves the signed integrals `log 2 - 1` and `1 - log 2`; hence `∫₀∞ |K| = 2(1-log 2)`. L'Hôpital's rule proves the removable singularity at one. No subtraction of divergent improper integrals is used. |
| `GGC/LogRate/JumpMeasure.lean` | Defines the actual Lebesgue-density measure with density `exp v/(exp v-1)^2`, proves its equality to `1/(4 sinh²(v/2))`, evenness and zero singleton mass. A bounded second-moment integrand near zero and exponential domination at infinity prove `Integrable (fun v => v²) jumpMeasure`. `jumpSecondMoment` is thus a genuine finite integral, not a default value of a divergent Bochner integral. Its exact numerical value is not needed or claimed. |
| `GGC/LogRate/Resolvent.lean` | Proves the direct pointwise cancellation with the full factor `b/(s+b)^2`. Proves absolute integrability of the combined reciprocal bracket, its signed integral and absolute integral, including the scaled formula `∫₀∞ |b/(s+bu)-1/(1+u)| du = |log(s/b)|`. Also proves integrability of the whole compensated resolvent term before it is split into integrals. These are deterministic kernel results, not the stochastic generator/resolvent identity. |
| `AxiomAudit.lean` | Imports all five new modules, prints the shared semantics and key definitions, checks the principal result types, and audits the new proof dependencies. Existing checks remain. |

The two additional deterministic modules `LogRate/Kernel.lean` and
`LogRate/JumpMeasure.lean` separate reusable estimates from the future
`Generator.lean` and `Bounds.lean`. No placeholder generator with arbitrary
coefficient fields was introduced. `main.lean` and all existing theorem
statements were left unchanged during this implementation.

### Trust boundary and verification

All newly audited results depend only on
`propext`, `Classical.choice` and `Quot.sound`. No external mathematical axiom
was introduced or used by these new results. The three pre-existing
Bondesson axioms retain their existing M1 uses. The foundation imports
mathlib only, and neither `main` nor any external/project proof module.

The default library build completed successfully with **3520 jobs**, using
the pinned Lean 4.32.2 and cached mathlib dependencies. The separate direct
`AxiomAudit.lean` invocation was run after the build. Final build and audit
logs are `.lake/m2-m3-build.log` and `.lake/m2-m3-audit.log` (ignored artifacts).
Commands, run in `formalization`:

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
# After the build has completed:
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

Both return exit code 0. The final logs contain no Lean warnings/errors,
`sorryAx` or native-evaluation trust dependency. New source files contain no
`sorry`, `admit`, new `axiom` declaration or `native_decide`. Development
iterations with elaboration failures were fixed before the final validation;
those failed iterations are not verification evidence. This was not a clean
rebuild of mathlib.

`Blueprint.md` remained read-only. Its SHA256 before and after this work is
`433DC088DBB57D86F171A72145C26C78B3C58D54B07F6C333682C7703272A37B`.
The working tree already contained designer and M1 changes; those were
preserved. The blueprint's milestone verdicts were not edited.

### Remaining acceptance obligations

**M2 remains incomplete.** Shared finite-partition semantics and the gamma
analytic results above are implemented, but the deferred E-J1–E-J3, E-T1 and
complex-domain E-S1 contracts have not been introduced or source-audited in
this work. No external-input gate completion is claimed. Still required are
the beta negative-log identity and its integrability, parameterized common-space
stick-breaking/quantile/posterior constructions and their joint measurability,
Gamma–Dirichlet tilt and signed Palm adapters, the explicit boundary-limsup
phase with anchor formula and a.e. uniqueness, and the actual current-law
power tangent including mixed differentiation, domination and the
`s`-derivative bridge. These are substantive missing proofs.

**M3 remains incomplete.** The deterministic correction/jump estimates,
cancellation and absolute-integrability results are available for use.
The specified posterior-derived `acceptance`, `logDrift` and `logGenerator`
and their joint measurability have not been constructed. Uniform posterior
drift bounds, generator test-domain estimates, the positive minimum
property, sample phase identity, signed Palm/Fubini step and
`F(G φ_s) = (h_U(s)+g(s))/B` remain open. The implemented deterministic
`resolvent_cancellation` must not be described as proving that last identity.

Next construction should finish the shared-semantics/external-contract gate
and beta logarithmic analysis, then build the parameterized DP and measurable
phase needed by both the actual tangent and the specified generator. No
moment restrictions or unproved core assumptions were added to shorten
those obligations. `GGC.ggc_rpow` is still absent.

<a id="m2-m3-posterior-2026-09-23"></a>
## 8. M2/M3 continuation: beta moments, tilted laws, Palm and generator estimates — 2026-09-23–24

**Status: substantial additional proofs implemented; M2 and M3 remain
`in_progress`, not complete or accepted.** This entry supersedes Section 7's
pending list for the items proved below. In particular, beta logarithmic
analysis, the gamma–Dirichlet tilted marginal, and the signed Palm adapter
are no longer pending. It does not certify the missing canonical phase,
common-space construction, actual power tangent or final generator identity.

### Implemented laws and analytic results

| File | Verified content and scope |
|---|---|
| [GGC/BetaAnalysis.lean](GGC/BetaAnalysis.lean) | Mellin differentiation of the actual beta integral, endpoint absolute integrability, `integral_neg_log_betaLaw : E[-log Z] = ψ(B+1)-ψ(1)`, continuity and compact-positive-mass bounds. No new analytic axiom. |
| [GGC/Foundations/Posterior.lean](GGC/Foundations/Posterior.lean) | Actual probability measure `(1-z)Q+zδ_b`, joint Giry measurability, integrability/integration formulas, independent-product pushforward `atomMixtureLaw`, and its measurable dependence on b. Generic measurable integration against varying probability measures. The dependency closure of this foundation is mathlib only. |
| [GGC/StieltjesMean.lean](GGC/StieltjesMean.lean) | Actual Stieltjes integral, joint measurability, strict positivity and bound `M_P(s)≤1/s`; posterior atom bound `z/2≤b M_P(b)≤1` and logarithmic domination. All positive-rate probability measures are allowed. |
| [GGC/BetaPosterior.lean](GGC/BetaPosterior.lean) | Actual Beta(1,B) weight law on `[0,1]`; density support and real pushforward identities; independent beta atom-mixture law. `integrable_posteriorLog` and `integral_posteriorLog_bounds` prove absolute integrability and `0≤E[-log(bM_P(b))]≤log 2+ψ(B+1)-ψ(1)` uniformly in the atom and in the law of Q. |
| [GGC/ExponentialTilt.lean](GGC/ExponentialTilt.lean) | Normalized positive density defining the actual tilted nonnegative law, its integral formula and Laplace ratio. No un-tilted moment hypothesis. |
| [GGC/GammaDirichlet.lean](GGC/GammaDirichlet.lean) | Actual independent product `gammaDirichletLaw`, its locally proved gamma transform, `dirichletMean_laplace`, and `tiltedLaw_eq_gammaDirichlet` using E-J1 and local Laplace uniqueness. The latter is equality of each fixed-s marginal, not a coupling of all tilts. `posteriorMixture_isDirichlet` connects the actual beta mixture to DP(U+δ_b) via E-J3. |
| [GGC/Palm.lean](GGC/Palm.lean) | Actual evaluation/posterior Markov kernels and composition-product joint measures. E-J2/E-J3 give their equality after swapping coordinates. `integrable_posteriorJoint_iff` transfers absolute integrability; `posterior_palm` then applies Bochner Fubini on both sides. Its joint-measure L1 hypothesis is explicit and must be discharged for each application. |

The Beta law is defined on real values and then pushed to genuine weights
using a measurable clamp. A density-support proof shows that the clamp is
the identity almost surely; `betaWeightLaw_map_val` verifies the exact real
Beta marginal required by E-J3. No defective mixture or unsupported beta
parameter is introduced, including for `0<B≤1`.

### Generator estimates now available

[GGC/LogRate/JumpCalculus.lean](GGC/LogRate/JumpCalculus.lean) proves the
second-order Taylor bound for every real jump, absolute integrability of
the fully compensated jump integral, its bound by `C m₂/2`, nonnegativity
at a global minimum, and the exact quadratic jump remainder. It uses the
previously proved finite second moment of the actual reference jump measure.

[GGC/LogRate/DriftBounds.lean](GGC/LogRate/DriftBounds.lean) derives the signed
correction interval `[log 2-1,1-log 2]` from the two signs of K. For an
explicit measurable phase ξ valued in `[0,1]`, posterior averaging proves

\[
y-\psi(B+1)-2+\log 2\le a(y)\le y-\psi(1),
\qquad |a(y)-y|\le C_B,
\]

with a locally defined `driftBound`, uniformly bounded on compact positive
mass intervals. The sample drift offset is proved absolutely integrable,
with the stronger bound

\[
\mathbb E|\widehat a-y|
\le |\psi(B+1)+1|+1+\psi(B+1)-\psi(1).
\]

This uses the signed correction bound and the actual beta logarithmic
estimate. It requires no rate or log-rate moments. The original coefficient
is consistently `ψ(B+1)`, not the posterior total-mass shift `ψ(B+2)`.

[GGC/LogRate/PhaseGenerator.lean](GGC/LogRate/PhaseGenerator.lean) implements
the posterior-averaged acceptance and drift for a **supplied phase and
supplied law D**, then proves acceptance bounds, jump integrability,
the positive-minimum property and

\[
\mathcal G(y^2)\le3y^2+C_B^2+m_2.
\]

These are reusable conditional analytic results. The phase argument is an
actual function, with explicit measurability/range hypotheses; no structure
field assumes a generator identity or tangent. However, a canonical
Stieltjes phase and parameterized DP law have not been supplied. Consequently
`phaseGenerator` is **not** claimed to be the completed Blueprint
`logGenerator`, and these bounds do not complete M3.

### External registration and trust boundary

[External/James.lean](External/James.lean) registers exactly the authorized
E-J1, E-J2 and source-derived E-J3 contracts. Source/version, reprint page
locators, exact semantics, adaptations and remaining work are recorded in
the declaration docstrings and [external inventory](External/README.md#james-registration--2026-09-23).
The primary James reprint was checked in this work. E-T1 and E-S1 remain
undeclared; no new source verification is claimed for those contracts.

The project now has **six** external mathematical axioms: the three existing
Bondesson inputs and these three James inputs. No E-B4 or project-core axiom
was added. Dependency checks show:

- Beta/gamma analysis, mixture semantics, Stieltjes bounds, exponential
  tilting, gamma-product integration, posterior logarithmic bounds and all
  the supplied-phase generator estimates use only `propext`,
  `Classical.choice`, `Quot.sound`.
- `dirichletMean_laplace` and `tiltedLaw_eq_gammaDirichlet` additionally use
  only `GGC.External.James.markov_krein` (E-J1).
- `posteriorMixture_isDirichlet` additionally uses only
  `GGC.External.James.beta_atom_posterior` (E-J3).
- The joint-law equality, integrability transfer and `posterior_palm`
  additionally use E-J2 and E-J3. Signed Fubini is a local theorem, not an
  enlarged external assumption.

`main.lean`, the target proposition, and the prior mathematical contracts
were not changed. `External/Bondesson.lean` only has its introductory
inventory sentence adjusted because it is no longer the sole external file.
The existing designer/M1 working-tree changes are preserved.

### Verification

The pinned executable's default `lake build` succeeded with **3557 jobs**,
exit code 0, using the existing mathlib cache. Its log is
`.lake/m2-m3-continuation-build.log`. `AxiomAudit.lean` now explicitly imports
the added modules, prints the actual laws and external contracts, checks the
key theorem types, and prints their transitive dependencies.

The independent direct audit is run after the completed default build:

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

The direct audit also completed with **exit code 0**; its log is
`.lake/m2-m3-continuation-audit.log`. Final validation was completed on
2026-09-24 (Asia/Hong_Kong). Both final logs contain no Lean warnings/errors,
`sorryAx`, or native-evaluation trust dependency. The audit's complete axiom
set was checked against the three standard logical axioms and the six
registered literature inputs, with no unexpected dependency. The new local
proof files contain no `sorry`, `admit`, or axiom declaration; only the three
registered declarations in `External/James.lean` extend the boundary.
This is not a clean rebuild of mathlib. Development elaboration failures
were corrected; they are not counted as verification evidence.

`Blueprint.md` remains read-only. Its SHA256 is unchanged from the beginning
of this work:
`433DC088DBB57D86F171A72145C26C78B3C58D54B07F6C333682C7703272A37B`.
All construction status and verification evidence is recorded here, not in
the blueprint.

### Remaining acceptance obligations

**M2 is incomplete.** Still required:

- E-T1 stick-breaking semantics/registration, a fixed common probability
  space and quantile realization as B and F vary, tails and joint parameter
  measurability. Current theorems take a law D with its DP predicate;
  they do not prove that such a law exists for every admissible base.
- The required Giry/weak-Borel compatibility for the parameterized
  constructions, where needed. Existing measurability statements explicitly
  use mathlib's Giry measurable structure.
- Complex-domain E-S1 registration and the explicit integer-boundary-limsup
  phase, joint measurability, anchor-one formula and a.e. uniqueness.
- The actual current-law power derivative, mixed differentiation with
  compact `(s,q)` domination, the normalized tangent formula and the
  `∂s(s A_U(s))` bridge. None is assumed in the implemented modules.

**M3 is incomplete.** The supplied-phase estimates above must be instantiated
with those genuine constructions, including full joint `(B,F,y,v)`
measurability. Remaining obligations also include compact-test/resolvent
integrability against arbitrary F, scaling of the canonical phase, the
sample resolvent identity in the v-coordinate generator, and absolute
Palm/Fubini justification for the averaged identity
`F(G φ_s)=(h_U(s)+g(s))/B`. The signed Palm adapter proves a valid transfer
rule, not integrability of every future application. The earlier
deterministic `resolvent_cancellation` still does not prove the averaged
identity. `GGC.ggc_rpow` remains absent.

<a id="m2-m3-canonical-phase-2026-09-24"></a>
## 9. M2/M3 continuation: canonical phase and measurable coefficients — 2026-09-24

Scope: Blueprint Section 5 A/B; WIP-6.11 (Stieltjes means and phase),
WIP-6.16–18 (generator coefficients, bounds and compact tests);
`manuscript/sections/07-measurable-realizations.tex`, `sec:phase-proof`,
and `03-log-generator.tex`, `eq:generator` / `lem:bounds`.
This entry supersedes only the obligations explicitly discharged below.
**M2 and M3 remain in progress.** No blueprint, external contract, toolchain
pin, public target or original GGC definition was changed in this continuation.

### Canonical phase construction

`GGC/StieltjesPhase.lean` now defines `complexStieltjesMean` as the actual
complex Bochner integral against a probability on positive rates. It proves
joint Giry measurability, absolute integrability in the upper half-plane,
the bound `‖M_P(z)‖ ≤ 1 / Im z`, agreement with the existing real Stieltjes
mean, strict negativity of its imaginary part, and nonvanishing.

`phaseHeight n = 1 / (n + 1)`, `phaseApprox`, and `stieltjesPhase` implement
the specified integer-boundary representative. The minus sign and division
by π are inside the limsup. `phaseApprox_bounds`, `phase_jointlyMeasurable`
and `stieltjesPhase_bounds` prove the strict approximant bounds, joint
measurability and `[0,1]` bounds for the representative, for every actual P
and every real t. There is no endpoint-moment assumption and no assumption
that the sequence converges at every boundary point.

`integrable_stieltjesPhase_mul` and
`abs_integral_stieltjesPhase_mul_le` supply domination for every L¹ kernel,
even for an arbitrary measure on the real line. The actual Dirac case is
also checked: `complexStieltjesMean_dirac`, `phaseApprox_dirac_self` and
`stieltjesPhase_dirac_self` give phase `1/2` at the atom, including this
exceptional boundary point.

This constructs the requested representative; it does **not** yet prove
the anchor-one representation, a.e. uniqueness, or convergence against L¹
kernels as P varies. Those assertions require the missing complex-domain
representation and boundary-recovery argument.

### Joint parameter measurability and instantiated estimates

- `GGC/Foundations/Posterior.lean` adds
  `measurable_probability_map_parameterized` and
  `atomMixtureLaw_jointlyMeasurable`. Both the sampling law and the measurable
  sampling function may vary. The foundation still imports only mathlib
  and the mathlib-only random-measure semantics; no project axiom is used.
- `GGC/BetaPosterior.lean` proves `measurable_betaLaw_one`,
  `measurable_betaWeightLaw`, and `posteriorMixtureLaw_jointlyMeasurable`
  from the actual beta density and product/pushforward constructions.
  The last result varies all of `(D,B,b)` together.
- `GGC/LogRate/DriftBounds.lean` adds
  `scaledPhaseCorrection_jointlyMeasurable` and
  `phaseDrift_jointlyMeasurable`. `PhaseGenerator.lean` adds
  `phaseAcceptance_jointlyMeasurable` and
  `phaseGenerator_jointlyMeasurable`. These integrate the varying posterior
  law, rather than treating its parameters as fixed constants.
  `JumpMeasure.lean` supplies `jumpMeasure_sigmaFinite` for the jump integral.
- `GGC/LogRate/CanonicalGenerator.lean` defines `canonicalAcceptance`,
  `canonicalDrift`, and `canonicalGenerator` using the constructed phase.
  It instantiates joint measurability in `(D,B,y,v)` / `(D,B,y)`, acceptance
  bounds, the correct `digamma(B+1)` drift interval, compensated jump
  integrability, the positive minimum principle, and the quadratic bound.
  The phase hypothesis is discharged. D remains an explicit probability
  law of probabilities, not an assumed realization of `DP(BF)`.
- `GGC/LogRate/CanonicalBounds.lean` proves
  `canonicalGenerator_compactTest_bound`: for a compactly supported C² test,
  a uniform absolute bound over every D and y, with B in any compact positive
  interval. `integrable_canonicalGenerator_compactTest` then gives absolute
  integrability against **every** probability F on log rates. No moment
  restriction on F appears in either theorem.

### Remaining acceptance obligations

M2 still needs E-T1 and the fixed common-space Dirichlet/quantile
construction, the required narrow-Borel/Giry compatibility, E-S1 with its
complex-domain contract, phase boundary recovery and anchor/uniqueness,
and the actual power tangent with the mixed-derivative bridge. The new
phase is defined explicitly, but its representation property is not assumed
or silently inferred from its bounds.

M3 still needs the `(B,F)` Dirichlet-law construction composed with these
coefficients, canonical phase scaling, the resolvent-test estimates and
sample resolvent identity, and the absolute Palm/Fubini argument for the
averaged identity. The compact-test integrability obligation is now covered
for every supplied D, including any genuine Dirichlet law once constructed.
No `GGC.ggc_rpow` declaration has been introduced.

### Verification

The pinned executable's default build completed successfully with **3560
jobs**, exit code 0, using cached mathlib dependencies. After that build
finished, the independent direct audit also completed with exit code 0:

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

Both commands ran from `formalization`. The ignored evidence logs are
`.lake/m2-m3-canonical-phase-build.log` and
`.lake/m2-m3-canonical-phase-audit.log`. The audit now explicitly imports
all three new modules, prints the actual phase and generator definitions,
checks key theorem types and inspects **186 declarations** in total.
Its extracted axiom set contains exactly the three standard logical axioms
and the same six registered Bondesson/James inputs. There are **zero
unexpected axioms**. Each of the 36 newly audited declarations depends only
on `propext`, `Classical.choice` and `Quot.sound` (or a subset).

Both final logs contain no Lean warning/error, `sorryAx`, or native-evaluation
trust dependency. Source scans of the changed proof modules found no
`sorry`, `admit` or axiom declaration. `git diff --check` passed; Git printed
only its existing LF/CRLF conversion notices. Development elaboration errors
were corrected before these final checks and are not verification evidence.
This is not a clean rebuild of mathlib.

The read-only blueprint's SHA256 remains
`433DC088DBB57D86F171A72145C26C78B3C58D54B07F6C333682C7703272A37B`,
matching the start of this continuation. Pre-existing designer and M1
working-tree changes are preserved. All new completion evidence is recorded
here, with no construction report appended to the blueprint.

<a id="mathlib-reuse-2026-09-24"></a>
## 10. Pinned mathlib reuse audit — 2026-09-24

Scope: README Section 2.4 (reuse mathlib first), the existing `main.lean`,
`GGC` proof modules and registered external interfaces, and the remaining
M2/M3 dependencies in Blueprint Section 5 A/B. The source searched was the
project's local **standard mathlib** checkout at
`905b95818eb32af7874a58b427f50c1711a5e96c`, matching both the manifest and
`git -C .lake/packages/mathlib rev-parse HEAD`; Lean remains 4.32.2.
No dependency upgrade or upstream modification was made.

The audit compared local definitions and proofs with the actual declarations
under mathlib's `Probability`, `MeasureTheory`, `Analysis`, and interval
projection modules. Searches covered Gamma/Beta densities and log moments,
Laplace/MGF uniqueness, tilted measures, parameterized kernel integrals and
pushforwards, resolvent/Stieltjes transforms, phase/argument bounds, weak
convergence, Taylor remainders, Dirichlet/stick-breaking constructions,
Thorin/Markov--Krein representations and measurable sampling. Candidate
types and their assumptions were read, and adopted uses were compiled.
The conclusion is a source-and-type audit of this pinned version, not a
formal proof that no other theorem anywhere in mathlib could shorten a proof.

### Missed reuse now adopted

All direct replacements identified for the current implementation were
applied; local adapters retain the existing mathematical statements.

| Project location | Standard mathlib API | Change and compatibility evidence |
|---|---|---|
| `GGC/ExponentialTilt.lean` | `MeasureTheory/Measure/Tilted.lean`: `Measure.tilted`, `isProbabilityMeasure_tilted`, `tilted_absolutelyContinuous`, `integral_tilted`, `integral_exp_tilted` | Replace manual normalization and density-integration proofs. `exponentialTilt_eq_tilted` exposes the library object; the original normalized-density formula `exponentialTilt_toMeasure` still proves by `rfl`. No extra moment assumption is added. |
| `GGC/Foundations/Posterior.lean` | `Probability/Kernel/MeasurableLIntegral.lean`: `Kernel.measurable_kernel_prodMk_left` | Replace the indicator/lintegral proof of parameterized pushforward measurability by the kernel section theorem. Derive fixed-parameter `measurable_atomMixtureLaw` from the existing joint theorem instead of repeating another indicator proof. These statements continue to use the Giry measurable structure. |
| `GGC/GammaAnalysis.lean`, `GGC/BetaAnalysis.lean` | `Analysis/Calculus/LogDeriv.lean`: `logDeriv`; `Analysis/SpecialFunctions/Gamma/Digamma.lean`: `Complex.digamma` | Define the real wrapper using `logDeriv Real.Gamma`, definitionally equal to the original quotient. `digamma_eq_re_complex` proves compatibility with the standard complex function on positive real arguments. The beta derivative proof uses the explicit quotient adapter `digamma_apply`. |
| `GGC/StieltjesPhase.lean` | `MeasureTheory/Measure/ResolventTransform.lean`: `resolventTransform`, `integrable_resolvent`, `measurable_resolvent` | Prove `complexStieltjesMean_eq_resolventTransform`, with positive rates mapped to the real line and argument `-z`, accounting for mathlib's `(b-a)⁻¹` convention. Reuse its integrability theorem. Nonreal `-z` is outside the real support image; rates may still accumulate at zero. |
| `GGC/BetaPosterior.lean` | `Order/Interval/Set/ProjIcc.lean`, `Topology/Order/ProjIcc.lean`: `Set.projIcc`, `continuous_projIcc`, `Set.projIcc_of_mem` | Replace the handwritten `[0,1]` truncation and its elementary proofs. The value remains definitionally `max 0 (min 1 z)`, including endpoint and out-of-interval behavior. |

The complex Stieltjes integral keeps its project-facing positive-rate
definition and the explicit uniform bound `1 / Im z`. The new bridge also
exposes mathlib's transform calculus for future use; it does not assert a
boundary representation or a pointwise limit. Likewise, the real digamma
wrapper is needed because the supplied standard digamma has domain `ℂ`.
Neither adaptation changes the phase convention or the coefficient
`digamma (B + 1)`.

### Existing reuse confirmed; necessary adapters retained

- **Distribution semantics:** `gammaLaw` uses `gammaMeasure` and its proved
  probability normalization. Finite gamma and normalized-gamma laws use
  `ProbabilityMeasure.pi` and measurable pushforwards. The pinned Gamma/Beta
  distribution files provide densities and normalization, but do not supply
  the project's Laplace and absolute log-moment statements directly.
- **Analytic log moments:** the current Gamma/Beta proofs already use
  `Complex.hasDerivAt_GammaIntegral`, `mellin_hasDerivAt_of_isBigO_rpow`,
  real/complex derivative transfer, `integral_re`, and change-of-density
  APIs. A derivative identity alone does not discharge absolute
  integrability. The new digamma import therefore does not remove the local
  endpoint estimates or the beta logarithmic-moment argument.
- **Uniqueness and weak closure:** Laplace uniqueness specializes
  `ext_of_forall_mem_subalgebra_integral_eq_of_polish`; sequential closure
  uses Levy--Prokhorov metrizability and `mem_closure_iff_seq_limit`.
  The inspected complex-MGF uniqueness APIs require different input
  equalities. They are not direct replacements for equality of the real
  Laplace transform on nonnegative laws, without a further analytic bridge.
- **Kernels and signed integration:** varying-law integrals use
  `StronglyMeasurable.integral_kernel_prod_right`; atom mixtures and Palm
  transfer use library product, mapped-measure, density and
  `Measure.integral_compProd` results with explicit integrability. Generic
  conditional-posterior kernels do not prove the Dirichlet beta-mixture
  distributional identity.
- **Phase and generator estimates:** the implementation already uses
  complex argument bounds/measurability, `Measurable.limsup`, library limsup
  inequalities, `taylor_mean_remainder_lagrange_iteratedDeriv`, compact
  support of derivatives and compact continuous bounds. The compensated
  kernels and their endpoint cancellations are project-specific adapters;
  replacing them by separate integrals would lose the required cancellation.

Searches did not locate direct standard-library versions of the registered
Thorin/Dirichlet-process/Markov--Krein statements or the full canonical-phase
representation. In particular, `Measure/Stieltjes.lean` constructs measures
from monotone functions, and `SpecialFunctions/Bernstein.lean` concerns
polynomial approximation; their names alone do not supply those interfaces.
No external input was replaced by a theorem with stronger moment or support
hypotheses, and no external axiom was added or removed.

### Reuse reserved for the remaining M2 construction

`Probability/Kernel/Representation.lean` supplies
`ProbabilityTheory.Kernel.exists_measurable_map_eq_unitInterval`: any
Markov kernel with a nonempty standard Borel target admits a jointly
measurable sampling map from the unit interval. Its proof already handles
inverse-CDF measurability. A compiled local probe specializes this to the
evaluation kernel on `ProbabilityMeasure E`, using its existing Giry
structure. This can be reused for sampling from varying supplied laws,
instead of developing that measurable-sampling argument again.

This theorem takes a kernel as input. It does not construct the required
Dirichlet kernel, identify a specific stick-breaking realization, provide
the blueprint's common probability-one event or establish narrow-Borel/Giry
compatibility. Those obligations remain open. No direct ready-to-use
compatibility instance was found in the inspected probability/finite-measure
and Giry sources. The probe is API evidence, not completion of the remaining
M2 realization or M3 averaging arguments; milestone status is unchanged.

### Verification

The default pinned-toolchain build passed with **3592 jobs**, exit code 0,
using cached mathlib dependencies. The separate API/definition-compatibility
probe also passed: the tilt density, real digamma quotient and weight clamp
agree by `rfl`, and the varying-law sampling specialization elaborates.
Evidence is in the ignored `.lake/mathlib-reuse-build.log`,
`.lake/ReuseCheck.lean` and `.lake/mathlib-reuse-probe.log`.

After the build, the independent direct audit also exited with code 0:

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean .lake/ReuseCheck.lean
```

The commands ran from `formalization`; direct audit evidence is in
`.lake/mathlib-reuse-audit.log`. It inspected **190 declarations**, including
the four new public compatibility lemmas. The extracted axiom set is exactly
`propext`, `Classical.choice`, `Quot.sound`, and the same six registered
Bondesson/James inputs. There are **zero unexpected axioms**; the four new
lemmas depend only on the three standard logical axioms.

The final build, audit and probe logs contain no Lean warning/error,
`sorryAx` or native-evaluation trust dependency. Source inspection found no
new unfinished proof or axiom declaration, and `git diff --check` passed
apart from Git's existing LF/CRLF conversion notices. This is a cached build,
not a clean rebuild of all mathlib. Intermediate elaboration failures were
fixed and are not counted as successful verification evidence.

`Blueprint.md` remains unchanged, with SHA256
`433DC088DBB57D86F171A72145C26C78B3C58D54B07F6C333682C7703272A37B`.
The external contracts, public target, toolchain and dependency pins are
unchanged. All audit and construction reporting remains in this file.

<a id="m2-completion-2026-09-24"></a>
## 11. M2 construction completed: Dirichlet realizations, canonical phase and current-law tangent — 2026-09-24

**Constructor verdict:** M2's implementation contracts are complete and pass
the pinned default build and independent direct axiom audit. This is a
construction/verification verdict relative to the registered literature
inputs; independent design acceptance is pending. M3 and later milestones
are not claimed complete. The full power-closure proposition remains unproved.

Scope: Blueprint Section 5 A, its Gamma/Beta prerequisites, and the M2 row
in Section 6; WIP-6.11 and the measurable-realizations appendix. This work
continues the earlier accepted M0/M1 and existing M2/M3 proofs. The prior
mathlib reuse changes and the designer's updated reuse gate are preserved.

### Completed contracts and tracked declarations

| Contract | Files and concrete completion evidence | Mathematical dependencies |
|---|---|---|
| Current-law power derivative, with local domination and no original-law moments | [DampedMoments](GGC/DampedMoments.lean) proves exponential bounds, integrability, derivatives of actual integrals, and the actual tilted `X log X` quotient. [PowerTangent](GGC/PowerTangent.lean) defines `powerTangent` as the derivative of `powerLogDerivative`, proves compatibility with `powerLaw`, positivity, mixed differentiation, `powerTangent_eq_expanded`, and `powerTangent_eq_deriv_mul_tiltedXLog`. | Standard logic only; API-011 reuses dominated differentiation. Positive `(s,q)` neighborhoods include `q=1`; no un-tilted logarithmic moment is assumed. |
| Normalized Gamma–Dirichlet tangent | [StieltjesCalculus](GGC/StieltjesCalculus.lean) proves the derivatives, bounds and varying-law integrability of `M`, `W`, and `M log M`. [GammaDirichletTangent](GGC/GammaDirichletTangent.lean) proves `normalized_powerTangent`, the exact `(h+g)/B` formula with `digamma (B+1)`, and `exists_normalized_powerTangent`, which supplies the DP law instead of assuming its existence. | E-J1 for the tilted marginal identification; E-T1 only when constructing the DP law. Signed Fubini and differentiation are local. API-012 reuses Gamma integrals and product integration. |
| Gamma/Beta analytic prerequisites | The existing absolute `log G`, `G log G`, and `-log Z` integrability, their digamma formulas, the Gamma negative-log bound and compact-mass continuity/bounds remain checked. [GammaAnalysis](GGC/GammaAnalysis.lean) additionally proves `integrable_self_gammaLaw` and `integral_self_gammaLaw`; the product integration adapter in `GammaDirichlet` is public. | Standard logic only. Original mass `B`, unit Gamma rate, and Beta(1,B) conventions are preserved. |
| One common space and one full-measure event | [Sampling](GGC/Foundations/Sampling.lean) promotes the R10 probe to tracked production code using mathlib's measurable-kernel representation. [StickBreaking](GGC/Foundations/StickBreaking.lean) defines the actual stick measure and proves mass normalization. [CommonUniforms](GGC/CommonUniforms.lean) proves a single measurable event using summable uniform-product expectations. [UniformBeta](GGC/UniformBeta.lean) proves that `1-T^(1/B)` has the actual Beta(1,B) law. | Standard logic only for sampling, common event and Beta transformation. APIs-008/013/018. Independent fractions and locations are distinguished from dependent weights. |
| Joint DP and posterior realizations, including atomic/mixed bases | [DirichletRealization](GGC/DirichletRealization.lean) constructs `dirichletLaw`, `dirichletSample` and `posteriorSample` on the fixed space `((ℕ → [0,1]) × (ℕ → [0,1])) × [0,1]`. It proves joint measurability, actual pushforward laws, finite-partition DP semantics and `ae_all_parameters_stick_realization`. The universal mass/base quantifiers are inside a single a.e. assertion. | E-T1 for the DP law, E-J3 for the posterior law. All common-space, common-event and measurable-version work is local. No uncountable intersection of parameter-dependent full-measure sets is used. |
| Positive-rate/log-rate transport and arbitrary finite bases | [RateRealization](GGC/RateRealization.lean) reuses `Real.expOrderIso` and `FiniteMeasure.normalize`, proves both inverse law maps, transports the jointly measurable samples and posterior laws, and proves `exists_dirichletProcess` for every finite, nonzero positive-rate base. The existing `posterior_palm` continues to transfer signed integrability through the concrete joint-law equality. | API-017; E-T1 for existence, E-J3 for posterior laws, E-J2 for Palm. Atomicity and density assumptions are absent. |
| Narrow Borel/Giry compatibility | [ProbabilityBorel](GGC/Foundations/ProbabilityBorel.lean) proves `probabilityMeasure_measurable_eq_borel` for second-countable metric Borel spaces, using finite atomic simple-function approximations, narrow metrizability and open-set Portmanteau. `probabilityMeasureBorelSpace` certifies the existing Giry instance, which is never replaced. | Standard logic only; APIs-015/016. Applies to real and positive-rate probability laws. |
| Canonical measurable Stieltjes phase | [ApproximateIdentity](GGC/Foundations/ApproximateIdentity.lean) derives bounded-measurable dilation convergence from Lebesgue differentiation and uniform L¹ tail control. [PoissonBoundary](GGC/Foundations/PoissonBoundary.lean) reuses the Cauchy density to prove half-line a.e. recovery. [StieltjesPhase](GGC/StieltjesPhase.lean) proves `phaseApprox_eq_poisson`, `phase_eq_ae_of_representation`, `integrable_phase_anchor_one`, `phase_anchor_one`, and `phase_unique_ae` for the already defined height sequence `1/(n+1)` and limsup. Existing pointwise `[0,1]` bounds and joint measurability now have the narrow Borel certification. | Boundary recovery and the imaginary-part adapter use standard logic only. The existence/uniqueness representation input is precisely E-S1. No inverse moment at zero or convergence at every boundary point is assumed. API-014. |

### External inputs and trust boundary

The two previously deferred, already whitelisted inputs are now explicitly
registered and audited:

- [Sethuraman](External/Sethuraman.lean): E-T1
  `GGC.External.Sethuraman.stick_breaking`, Section 2, equation (2.1),
  printed pp.642–643, and Theorem 3.4, p.645. The independent input law and
  measurable probability-valued stick sum are explicit premises. The
  primary reprint's construction, mass-one statement and DP theorem were
  inspected. The local constructor proves those premises.
- [SSV](External/SSV.lean): E-S1
  `GGC.External.SSV.phase_representation`, a source-derived specialization
  of the **2010 first edition**, Theorems 6.10 and 7.3, printed pp.58–60 and
  63, with the official 2022-12-01 errata. The real anchor-one formula and
  the upper-half-plane principal-log formula retain absolute integrability.
  A.e. uniqueness is restricted to `(0,∞)`. Boundary recovery, a canonical
  representative and parameter measurability are not extra axiom fields.

The complete formulas, source adaptations and consumer boundaries are in
[External/README.md](External/README.md) and printed by `AxiomAudit.lean`.
There are now eight literature declarations: three Bondesson, three James,
one Sethuraman and one SSV. E-B4 remains undeclared. No core project theorem,
Poisson convergence theorem, sampling existence theorem or Borel/Giry
compatibility theorem has been added as an axiom. External files do not
import `main` or project proof consumers.

### Verification and reproducible evidence

From `formalization`, both commands exited with code **0**:

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

The default build completed **3765 jobs**, covering all new `GGC.+` and
`External.+` modules plus the expanded audit. This uses cached mathlib
dependencies, not a clean rebuild. Logs are the ignored
`.lake/m2-completion-build.log` and `.lake/m2-completion-audit.log`.
The separate direct audit checked **288 declarations**. Its unique axiom
set is exactly `propext`, `Classical.choice`, `Quot.sound`, and the eight
registered literature inputs, with **zero unexpected axioms**.

Selected transitive dependencies beyond standard logic:

| Declaration | Literature inputs |
|---|---|
| `powerTangent_eq_deriv_mul_tiltedXLog`, `mixed_log_powerLaplace_commute` | None |
| `normalized_powerTangent` | E-J1 |
| `exists_normalized_powerTangent` | E-J1, E-T1 |
| `exists_dirichletProcess` | E-T1 |
| `ratePosteriorSample_isDirichlet` | E-J3, E-T1 |
| `ae_all_parameters_stick_realization`, `probabilityMeasure_measurable_eq_borel` | None |
| `ae_tendsto_halfLine_cauchy_integral`, `phase_eq_ae_of_representation` | None; the latter takes an explicit representation premise |
| `phase_anchor_one`, `phase_unique_ae` | E-S1 |

The successful build and direct audit contain no warning, error, `sorryAx`
or native-evaluation trust dependency. Source inspection finds no unfinished
proof or unregistered axiom. `git diff --check` passes; Git's LF/CRLF notices
are not Lean diagnostics. Intermediate elaboration failures were fixed
before these successful runs and are not counted as verification evidence.
API-008 and API-011–019 in [MathlibAPI.md](MathlibAPI.md) record tracked
production uses, rejected candidates, exact assumptions and review status.

`Blueprint.md` was read only throughout this construction. Its starting and
ending SHA256 is
`AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`.
This differs from Section 10's historical hash because the designer's reuse
gate update was already present when this work began; those existing
blueprint changes were neither reverted nor edited. The public target,
toolchain and mathlib pins remain unchanged. No commit or push was performed.

### Handoff beyond M2

M3 still needs the averaged generator/resolvent assembly against the completed
tangent and canonical phase. M4 owns weak-star convergence of phases against
L¹ kernels and joint parameter continuity. In particular, the reused location
sampler supplies joint measurability and exact marginal laws; no pathwise
quantile-continuity property has been claimed for that choice. M4 must prove
the required coupling bridge explicitly. This does not leave a parameter
measurability, common mass-one event or DP-existence premise in M2.

M5–M7, the initial finite-input log-rate/moment certificates and the final
`GGC.ggc_rpow` proof remain future work. The blueprint's milestone acceptance
table is left to the designer.

<a id="m3-completion-2026-09-24"></a>
## 12. M3 construction completed: specified generator and absolutely convergent resolvent identity — 2026-09-24

**Constructor verdict:** Blueprint Section 5 B and the M3 row in Section 6
are implemented and pass the pinned default build and separate direct axiom
audit, relative to the registered literature inputs. Independent design
acceptance is pending. This closes the M3 gaps in the earlier construction
records; it does not prove weak continuity, evolution existence or power
closure. M4–M7 remain future work.

The implemented endpoint is
`GGC.LogRate.integral_generator_eq_normalized_powerTangent` in
[GeneratorResolvent](GGC/LogRate/GeneratorResolvent.lean). For positive mass
`B`, any log-rate probability `F`, the admissible base
`U = ENNReal.ofReal B.val • rateLaw F`, and a current nonnegative law with
the zero-drift Thorin Laplace transform, it proves

\[
\int \mathcal G_{B,F}\varphi_s(y)\,F(dy)
=\frac{\operatorname{powerTangent}(\mu,s)
       +\operatorname{powerLogDerivative}(\mu,1,s)}{B},\qquad s>0.
\]

The derivative on the right is the genuine current-law derivative completed
in M2. No positive-time GGC premise, atomicity hypothesis, rate moment or
log-rate moment is added.

### Contract-to-proof evidence

| Blueprint/WIP obligation | Tracked implementation and evidence |
|---|---|
| Actual coefficients for `(B,F)` | [Generator](GGC/LogRate/Generator.lean) defines `baseMeasure`, `acceptance`, `drift` and `generator` using the jointly measurable `rateDirichletLaw B F`. `generator_eq` exposes the specified fully compensated operator. `baseMeasure_mass`, `normalized_baseMeasure` and `baseMeasure_isDirichlet` discharge the normalization and supplied-law premises. The coefficients and C²-test generator are jointly measurable. |
| Reference measure and uniform bounds | The earlier `JumpMeasure` proof identifies the density with `1/(4*sinh(v/2)^2)`, proves no atom at zero and a finite second moment. `Generator.acceptance_bounds`, `drift_compactMass_bound`, `generator_compactTest_bound`, `integrable_generator_jumps`, `generator_nonneg_at_min` and `generator_sq_le` instantiate the deterministic bounds with the actual `(B,F)` law. Constants in the compact-mass bounds are independent of `F,y`. |
| Phase subtraction and positive scaling | [PhaseResolvent](GGC/LogRate/PhaseResolvent.lean) proves `phase_two_anchors` and `phase_scaled_resolventBracket`, the exact WIP-6.157 identity. Each signed subtraction has an L¹ proof. `phase_integral_cancellation` applies the existing complete-kernel algebra after phase weighting; the exceptional point `u=1` is removed only as a null singleton. The three terms of `correctionKernel` are never integrated separately. |
| Actual change of jump coordinates | [JumpCoordinates](GGC/LogRate/JumpCoordinates.lean) proves both `integrable_jumpMeasure_iff` and `integral_jumpMeasure` for `u=exp v`, using mathlib's one-dimensional Jacobian. The transformed density is exactly `(u-1)⁻²`; no principal-value interpretation is used. |
| Resolvent regularity and global bounds | [ResolventTest](GGC/LogRate/ResolventTest.lean) defines `logResolvent`, proves C² regularity and both derivative formulas, bounds `abs φ'` and `abs φ''` by `1/s`, and bounds `abs (y*φ')` by `1+1/s²`. Taylor domination controls every jump size. These bounds do not depend on a distribution of `y`. |
| Deterministic sample identity | [SampleResolvent](GGC/LogRate/SampleResolvent.lean) defines the exact sample drift and sample generator and proves `sampleGenerator_logResolvent` (WIP-6.158). It proves the sample-jump L¹ bound and absolute jump integral bound, relates the sample drift to the previously bounded posterior offset, and proves its posterior absolute-integrability bound. The digamma argument remains `B+1`, with the original mass. |
| Absolute posterior Fubini | [PosteriorResolvent](GGC/LogRate/PosteriorResolvent.lean) proves `integrable_sampleJump_product` before exchanging integrals, then `canonicalGenerator_eq_integral_sampleGenerator` and `canonicalGenerator_logResolvent`. `integral_abs_sampleDrift_resolvent_le` is uniform in `y`; `integrable_posterior_abs_sampleDrift_resolvent` holds for every probability `F`. A bound on the averaged signed drift is not substituted for this bound. |
| Signed Palm and final tangent assembly | [PalmResolvent](GGC/LogRate/PalmResolvent.lean) proves `integrable_resolventPalmIntegrand_samplingJoint` from `W ≤ M` and bounded `M abs(log M)`, before applying `posterior_palm`. It proves the rate-coordinate averaged identity and L¹ integrability. [GeneratorResolvent](GGC/LogRate/GeneratorResolvent.lean) transports the result to `F`, proves `integrable_generator_logResolvent`, and concludes the exact normalized power-tangent identity. |

### Reuse and dependency audit

API-020 and API-021 in [MathlibAPI.md](MathlibAPI.md) record the focused
pinned-source search, exact theorem names, type comparisons and tracked
production evidence. Positive scaling, Jacobian change of variables, density
integration, bounded multiplication, product integration and kernel Fubini
are reused. The earlier Gamma/Dirichlet, phase, posterior and signed Palm
adapters are consumed directly. The new files introduce no generic sampling,
integration or differentiation framework.

No external contract or axiom was added or strengthened. Beyond standard
logic, the principal results have these actual audited dependencies:

| Declaration | Literature inputs |
|---|---|
| `integrable_jumpMeasure_iff`, resolvent derivatives/bounds, posterior absolute drift/jump estimates, `integrable_resolventPalmIntegrand_samplingJoint` | None |
| `phase_scaled_resolventBracket`, `sampleGenerator_logResolvent`, `canonicalGenerator_logResolvent` | E-S1 |
| `integral_canonicalGenerator_logResolvent_rate` | E-J2, E-J3, E-S1 |
| `integral_canonicalGenerator_eq_normalized_powerTangent` | E-J1, E-J2, E-J3, E-S1 |
| `integral_generator_eq_normalized_powerTangent` | E-J1, E-J2, E-J3, E-S1, E-T1 |

The last E-T1 dependency constructs the actual Dirichlet law for arbitrary
base `F`. Its conclusion supplies the DP law; the generator identity is
proved locally. E-B4
remains undeclared. All eight literature declarations from M2 remain the
complete project-wide mathematical axiom set.

### Verification and handoff

From `formalization`, both commands exited **0**:

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

The default build completed **3773 jobs**, including all eight new proof
modules and the expanded audit. This is validation using cached mathlib
dependencies, not a clean rebuild. Logs are the ignored
`.lake/m3-completion-build.log` and `.lake/m3-completion-audit.log`.
The separate direct audit checked **341 declarations**. Both logs contain
no warning/error, `sorryAx` or native-evaluation trust dependency. Its unique
axiom set is exactly the three standard logical axioms and the eight
registered literature inputs, with **zero unexpected axioms**.
All eight new source files pass the unfinished-proof and trailing-whitespace
checks; `git diff --check` passes. Intermediate elaboration failures were
corrected before the successful runs.

`Blueprint.md` remains read only. Its SHA256 remains
`AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`;
the designer's preexisting changes are preserved. `main.lean`, all external
contracts and dependency pins are unchanged by this M3 work. No commit or
push was performed.

Next is M4: convergence of the canonical phases against every L¹ kernel,
the required quantile/common-space coupling bridge, joint parameter
continuity, and integration against varying laws. The current generator
bounds are available for that proof. The positive Euler construction,
dynamic identification, initial finite-input certificates and genuine
`GGC.ggc_rpow` proof remain M5–M7 work; the active project objective is not
complete.

<a id="m2-revalidation-2026-09-24"></a>
## 13. M2 delivery review and completion of continuity helpers — 2026-09-24

**M2 constructor verdict remains complete, pending independent design acceptance.**
The contracts in Blueprint Section 5 A and the M2 milestone row were checked
against the actual declarations recorded in Section 11. In particular,
`exists_normalized_powerTangent` supplies the Dirichlet law for any finite,
nonzero admissible Thorin base; `powerTangent_eq_deriv_mul_tiltedXLog`
connects the genuine power derivative to the identification derivative;
`ae_all_parameters_stick_realization` puts all mass/base parameters inside
one a.e. assertion. The canonical phase has its required joint measurability,
anchor-one formula and a.e. uniqueness. No original-law logarithmic moment,
atomicity or positive-time GGC premise has been introduced.

The worktree also contained continuity groundwork beyond M2. Its remaining
elaboration errors were corrected so that the whole default target builds.
The following tracked modules are now included in the axiom audit:

| Module | Verified result and scope |
|---|---|
| [StieltjesContinuity](GGC/StieltjesContinuity.lean) | Narrow continuity of real and complex Stieltjes means; fixed-height phase continuity; the canonical Poisson identity; convergence of fixed-height phase pairings against every integrable kernel. This is not boundary-phase convergence. |
| [L1Translation](GGC/Foundations/L1Translation.lean) | Continuity of the actual integral `∫ abs (f (a+x) - f x)`, convergence to zero at `a=0`, and its bound by twice the L¹ norm, reusing mathlib's continuous L¹ translation action. |
| [PoissonPairing](GGC/Foundations/PoissonPairing.lean) | Absolute integrability before product Fubini, the translated pairing identity, and a uniform Poisson pairing error bounded by `cauchyTranslationError f e`. This error tends to zero as `e` tends to zero and depends only on the L¹ test function, uniformly over measurable functions with values in `[0,1]`. |

API-022/023 in [MathlibAPI.md](MathlibAPI.md) record the reused APIs and
remaining boundary. These 18 newly audited declarations use only standard
logic, except `phaseApprox_eq_poisson_canonical`, which also uses the
already registered E-S1. No external axiom or contract was added or changed.

### Fresh verification of the complete worktree

From `formalization`, both commands exited **0**:

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

The default build completed **3782 jobs**, using cached mathlib dependencies.
The independent direct audit checked **359 declarations**. Its unique axiom
set is exactly `propext`, `Classical.choice`, `Quot.sound` and the eight
registered literature inputs; there are **zero unexpected axioms**. Both
logs contain no warning, error, `sorryAx` or native-evaluation trust dependency.
The ignored logs are `.lake/m2-revalidation-build.log` and
`.lake/m2-revalidation-audit.log`. Source inspection finds no unfinished
proofs; `git diff --check` and untracked Lean whitespace checks pass.

`Blueprint.md` was read only. Its SHA256 remains
`AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`;
the designer's preexisting modifications are preserved. No commit or push
was performed. M4 still requires the full boundary-phase L¹ pairing limit,
the quantile/common-space coupling bridge, joint generator continuity and
integration against varying laws. M5–M7 and the genuine `GGC.ggc_rpow`
remain open; this record does not certify the main theorem.

<a id="m4-phase-sample-continuity-2026-09-24"></a>
## 14. M4 construction progress: L¹ phase continuity and the sample generator — 2026-09-24

**M4 remains in progress.** This work proves the full boundary-phase pairing
contract and the deterministic sample-generator continuity needed by
Blueprint Section 5 C. It does not yet prove continuity of the actual
Dirichlet/posterior expectation or of integration against varying outer laws.
M2/M3 construction verdicts and their pending design acceptance are unchanged.

### Completed phase contract

For every real kernel `f` integrable on `(0,∞)`,
`continuous_integral_stieltjesPhase_mul` proves continuity of

\[
 P\longmapsto\int_0^\infty f(t)\xi_P(t)\,dt
\]

in the narrow topology on all positive-rate probability measures. The
result applies to every L¹ kernel, with no compact-support or continuity
restriction. The exported convergence statement works along any filter.
`tendsto_integral_stieltjesPhase_mul_of_l1` also permits the kernel to vary
in L¹. No pointwise boundary-phase convergence premise appears.

[PhaseWeakContinuity](GGC/PhaseWeakContinuity.lean) extends each phase by
zero to the negative half-line and transfers M2's Poisson identity to this
extension. `abs_phaseApprox_pairing_sub_le` bounds the smoothing error by
`cauchyTranslationError f (phaseHeight n)`, uniformly over **all** laws `P`.
The already proved L¹ translation estimate makes this error tend to zero.
Mathlib's `continuous_of_dominated` and `TendstoUniformly.continuous` then
give boundary-pairing continuity. This is the missing limit passage from
the previous record, not an inference from fixed-height convergence alone.

[L1Dilation](GGC/Foundations/L1Dilation.lean) transports a half-line kernel
to `logKernel f v = exp v * f (exp v)`. The Jacobian preserves its L¹ norm,
and `dilateKernel f b u = b⁻¹ * f (u/b)` becomes translation by `-log b`.
`tendsto_integral_abs_dilateKernel_sub` therefore proves L¹ continuity as
the positive scale varies, without adding regularity to `f`.
[PhaseScalingContinuity](GGC/PhaseScalingContinuity.lean) combines this with
the phase theorem. Its strongest convergence interface permits the law,
positive scale and L¹ kernel to vary simultaneously.

### Sample generator, with the compensation preserved

[StieltjesContinuity](GGC/StieltjesContinuity.lean) now also proves the
uniform parameter estimate

\[
 |M_P(s)-M_P(t)|\le\frac{|s-t|}{st},\qquad s,t>0,
\]

and uses it for joint continuity in the law and positive parameter.
[SampleContinuity](GGC/LogRate/SampleContinuity.lean) then proves:

| Declaration | Actual conclusion |
|---|---|
| `tendsto_integral_abs_sampleJumpKernel_sub` | The entire compensated Taylor kernel `taylorRemainder φ y (log u)/(u-1)^2` varies in L¹ as `y` varies, for C² tests with bounded second derivative. The proof reuses the global Taylor bound, the finite jump second moment, the exact jump-coordinate formula and dominated convergence. |
| `continuous_sampleJump` | Joint continuity in `(P,y)` of the phase-weighted compensated jump. The law, scale `exp y` and Taylor kernel vary together using the new phase interface. |
| `continuous_sampleDrift` | Joint continuity in `(B,P,y)` of the prescribed sample drift, retaining `digamma (B+1)`, the actual Stieltjes logarithm and the combined correction kernel. |
| `continuous_sampleGenerator_compact` | Joint continuity in `(B,P,y)` of the actual `sampleGenerator` for every compactly supported C² test. The second derivative bound is derived locally from compact support and continuity. |

Separate divergent jump terms are never integrated. These statements
require no rate moment, log-rate moment or inverse-rate moment. They concern
the deterministic sample `P`; continuity after posterior averaging is not
silently included in their conclusions.

### Reuse, trust boundary and verification

API-024–026 in [MathlibAPI.md](MathlibAPI.md) record exact reusable
theorems, their production consumers and the remaining boundaries. The L¹
dilation foundation, joint Stieltjes estimate and Taylor-kernel continuity
use only standard logic. Weak-star phase continuity, scaled phase pairing
continuity and the resulting sample-generator continuity additionally use
the existing E-S1, through the canonical Poisson representation. No axiom,
external contract, toolchain pin or definition of the target was changed.

From `formalization`, these commands both exited **0**:

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

The default build completed **3786 jobs**, with cached mathlib dependencies.
The independent direct audit checked **396 declarations**, including the
37 new audited results. The project-wide axiom set remains the three
standard logical axioms and the same eight registered literature inputs;
there are **zero unexpected axioms**. Both successful logs contain no
warning, error, `sorryAx` or native-evaluation trust dependency. Logs are
the ignored `.lake/m4-phase-sample-build.log` and
`.lake/m4-phase-sample-audit.log`. Source/whitespace checks and
`git diff --check` pass. Intermediate elaboration failures were corrected
before these successful runs.

`Blueprint.md` remains read only, with the unchanged SHA256
`AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`.
The designer's preexisting blueprint changes are preserved. No commit or
push was performed.

### Next M4 obligations

The phase gap GAP-003 is closed at construction level. GAP-001 remains:
construct the ordered quantile coupling, prove a.e. weak convergence of
the common-space stick sums and posterior samples as `(B,F,y)` varies,
and use integrable posterior domination to pass the continuous sample
generator through expectation. API-027 records the focused pinned-library
search: the public measurable sampler gives the already used marginal-law
contract; its private inverse-CDF implementation exports no required
ordered/pathwise convergence theorem. The extra coupling bridge must be
proved explicitly with the available CDF/order/narrow-convergence APIs.

After that, combine the existing compact-mass uniform generator bounds
with tightness/local uniform convergence to integrate against varying `F`.
The positive Euler construction, identification, initial finite-input
certificates and the final `GGC.ggc_rpow` proof remain later obligations.
The full active objective is not complete.

<a id="m2-quantile-completion-2026-09-24"></a>
## 15. M2 completion: ordered quantile integration and full revalidation — 2026-09-24

**Construction verdict: M2 is complete, verified relative to the registered literature inputs, pending independent design acceptance.**
Within the requested scope of completing M2, this pass reviewed Blueprint Section 5 A and Section 6 M2,
integrated the previously compiled ordered quantile modules, and revalidated the actual Dirichlet,
posterior and tangent constructions and their consumers. Historical records are retained;
the blueprint was not changed. The delivery interfaces checked are listed below.

| M2 contract | Checked declarations or modules |
|---|---|
| Derivative of the actual power law and derivative bridge needed for identification | `powerLogDerivative_eq_powerLaw`, `hasDerivAt_powerLogDerivative_q`, `powerTangent_eq_deriv_mul_tiltedXLog`, `mixed_log_powerLaplace_commute`; `power_log_integrand_bound` supplies domination near positive parameters without assuming an `X log X` moment for the original law. |
| Normalized Gamma–Dirichlet tangent | `normalized_powerTangent` and `exists_normalized_powerTangent`; retain `digamma (B+1)` for the original mass, and the latter supplies the actual DP law itself. |
| Gamma/Beta analytic prerequisites | Absolute logarithmic integrability, exact moment formulas, the Gamma negative-log bound, and continuity and boundedness on compact positive-mass intervals in `GammaAnalysis` and `BetaAnalysis`. |
| Common probability space and jointly measurable realizations | `dirichletLaw_isDirichlet`, `posteriorSample_isDirichlet`, `ae_all_parameters_stick_realization`, `ratePosteriorSample_isDirichlet`, `exists_dirichletProcess`; cover atomic, nonatomic and mixed bases. Mass and base quantifiers remain inside one common event of full probability. |
| Canonical phase | `phase_jointlyMeasurable`, `stieltjesPhase_bounds`, `phase_eq_ae_of_representation`, `phase_anchor_one`, `phase_unique_ae`; preserve the limsup definition along integer heights, the anchor at one and a.e. uniqueness. |
| Semantics and external-input boundary | Retain the existing compatibility proof between Giry and narrow-topology Borel structures, the E-J1–3, E-T1 and E-S1 contracts, and the full audit. No new external input or unfinished proof was introduced. |

### Implementation and mathlib reuse in this pass

[Quantile](GGC/Foundations/Quantile.lean) defines the actual inverse CDF and proves
`quantile_le_iff`, `measurable_quantileSampler` and `quantileSampler_map`.
The endpoints `u=0,1` are assigned zero; their nullity yields the exact pushforward law
without assuming a continuous distribution. [QuantileContinuity](GGC/Foundations/QuantileContinuity.lean)
uses Portmanteau to obtain CDF convergence at continuity points, then countability
of discontinuities of monotone functions to prove `ae_tendsto_quantileSampler`.
The exceptional set is determined by the limiting quantile.

The actual location coordinates in [DirichletRealization](GGC/DirichletRealization.lean)
now use `quantileSampler`. Beta stick-breaking proportions, the common space,
the uniform mass-one event, joint measurability and the finite-partition DP contract
all recompiled successfully. Positive-rate transport, posteriors, the normalized
tangent and existing generator consumers also built successfully.

API-027 in [MathlibAPI](MathlibAPI.md) records the search scope, reused interfaces and evidence:
CDFs, conditional infima, measure evaluation, unit-interval volume, Portmanteau and
countability of discontinuities of monotone functions all reuse the library.
No exported contract for ordered real quantile coupling was found, so the local
adapter proof is retained. API-008's generic measurable sampling adapter also remains
and is explicitly audited; its marginal-law contract alone does not imply the
coupling property required here.

### Verification in this pass

The following commands were run from `formalization`, all with exit code **0**:

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

- The default build passed **3791 jobs**, using cached mathlib dependencies; this was not a rebuild after clearing dependencies.
- The independent audit checked **413 declarations**, including **17 newly audited quantile results**; those 17 use only the standard logical axioms among `propext`, `Classical.choice` and `Quot.sound`.
- The whole project still uses only those standard logical axioms and the existing **8 registered literature inputs**; no additional axiom was found.
- Successful build and audit logs contain no warning, error, `sorryAx` or additional native-evaluation trust dependency. The Lean source scan and `git diff --check` passed.
- Logs are retained in the ignored `.lake/m2-quantile-completion-build.log` and `.lake/m2-quantile-completion-audit.log`. Lean and mathlib pins are unchanged.

The blueprint's SHA256 at both the start and end of this pass was
`AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`；
The designer's existing changes were preserved. No commit or push was performed.

M4 still requires a.e. weak convergence of stick sums and posteriors on the common
space, followed by continuity of generator expectations and integration against varying
outer laws. The location-coordinate coupling result does not replace those conclusions.
M5–M7 and the final `GGC.ggc_rpow` remain incomplete; the full formalization remains in progress.

<a id="m4-completion-2026-09-24"></a>
## 16. M4 completion: common-space coupling, posterior domination and averaged-generator continuity — 2026-09-24

**Construction verdict: M4 is complete, verified relative to the registered literature inputs, pending independent design acceptance.**
This pass completes the continuity contract in Blueprint Section 5 C, Section 6 M4,
and the remaining proofs corresponding to [WIP-6.18](../ledger/21-log-thorin-euler-evolution.md#wip-6-18).
It closes the M4 gaps in Sections 14–15; historical records and the read-only blueprint
are unchanged. M2 and M3 continue to pass whole-library verification. This verdict
does not cover M5's positive-kernel iteration and existence result.

### Contracts and actual deliverables

| M4 contract | Actual declarations and scope |
|---|---|
| Weak-star continuity of the canonical boundary phase against every L¹ kernel | Existing `continuous_integral_stieltjesPhase_mul`, `tendsto_integral_stieltjesPhase_mul_of_l1` and the scaling module continue to pass verification. Positive-rate laws, positive scales and L¹ kernels may vary simultaneously; no pointwise phase-continuity assumption is made. |
| Common-space coupling of stick sums and posteriors | `ae_tendsto_dirichletSample`, `ae_tendsto_posteriorSample`, `ae_tendsto_ratePosteriorSample`. Ordered quantiles and the same mass-one event cover atomic, nonatomic and mixed bases. |
| Joint continuity of the actual generator | `LogRate.continuous_generator_compact`: for every test function satisfying `ContDiff ℝ 2 φ` and `HasCompactSupport φ`, the map `(B,F,y) ↦ generator B F φ y` is continuous. Parameters range over arbitrary positive masses, real probability bases and real states. |
| Global uniform bound on compact positive-mass intervals | Existing `LogRate.generator_compactTest_bound` provides a finite constant depending on the mass interval and test function, simultaneously for all bases and states. It is explicitly used in the outer-integral proof. |
| Continuity after integration against varying bases | `LogRate.averaged_generator_continuous`: `(B,F) ↦ ∫ y, generator B F φ y ∂F` is continuous. The proof uses uniform convergence on compact sets, tightness of narrowly convergent sequences and the global bound above. |

The entry point is [GGC/LogRate/Continuity.lean](GGC/LogRate/Continuity.lean).
Its `averagedGenerator` directly defines the integral of the actual generator
against the actual base. The continuity theorems add no moment conditions on
bases or positive rates and do not require nonatomic bases.

### New modules and proof structure

This pass adds **8 proof modules and 42 public theorems**, all included in `AxiomAudit.lean`.

| Module | Public theorems | Role and key declarations |
|---|---:|---|
| [Foundations/ProbabilitySeries](GGC/Foundations/ProbabilitySeries.lean) | 3 | `tendsto_tsum_abs_sub_probability`, `tendsto_probability_weighted_tsum`: coordinate convergence and conservation of total mass yield ℓ¹ convergence of probability weights and convergence of bounded weighted series. |
| [Foundations/StickContinuity](GGC/Foundations/StickContinuity.lean) | 6 | Continuity of Beta stick-breaking proportions, finite residuals and weights; `integral_stickProbability`, `tendsto_stickProbability` and `tendsto_atomMixture`. |
| [DirichletContinuity](GGC/DirichletContinuity.lean) | 14 | Common uniform coordinates, a.e. narrow convergence of actual Dirichlet/posterior samples, `continuous_dirichletLaw`, `continuous_posteriorLaw`, and continuity after positive-rate transport. |
| [RateSampleLaws](GGC/RateSampleLaws.lean) | 4 | Positive-rate transport commutes with atom mixtures; `rateDirichletSample_map` and `ratePosteriorSample_map` give the exact laws of actual samples. |
| [PosteriorDomination](GGC/PosteriorDomination.lean) | 6 | `uniformBreak_antitone_mass`, a common integrable negative-log coordinate and `posteriorLog_ratePosteriorSample_le` control posterior drift under varying parameters. |
| [LogRate/GeneratorContinuity](GGC/LogRate/GeneratorContinuity.lean) | 5 | Absolute sample-drift bounds, `generator_eq_integral_ratePosteriorSample`, and joint continuity of the actual generator. |
| [Foundations/VaryingIntegral](GGC/Foundations/VaryingIntegral.lean) | 1 | `tendsto_integral_of_narrow_locally_uniform`: locally uniform convergence of continuous test functions with a common global bound yields convergence of their integrals against varying probability laws. |
| [LogRate/Continuity](GGC/LogRate/Continuity.lean) | 3 | `generator_tendstoUniformlyOn_compact`、`tendsto_averagedGenerator`、`averaged_generator_continuous`。 |

The infinite stick-sum tail is handled through conservation of mass. For nonnegative
probability weights, mathlib's Tannery theorem is first applied to the coordinatewise
minimum of the varying and limiting weights; the absolute-difference identity then
yields ℓ¹ convergence. Convergence of bounded continuous tests and location coordinates
gives narrow convergence of the entire random measure. This requires neither
independent stick weights nor a common summable bound on the weights.

Posterior averaging requires separate control of the unbounded drift. Fix a positive
mass `M` greater than nearby masses and set `Z_M(ω) = (uniformBreak M ω.2).val`.
For `B ≤ M`, a.e. we have

\[
\operatorname{posteriorLog}(e^y,P_{B,F,y}(\omega))
\le \log 2-\log Z_M(\omega).
\]

The right side is integrable on the common probability space and independent of the
varying `B,F,y`. The proof reuses the exact Beta pushforward law and existing logarithmic
moments. The actual positive-rate posterior pushforward identity expresses the generator
as an integral of sample generators on the common space; a.e. posterior coupling and
sample continuity then permit dominated convergence. No additional uniqueness assumption
for Dirichlet laws is needed.

The outer integral follows the blueprint: joint continuity gives uniform convergence on
compact sets; a weakly convergent sequence together with its limit is compact, and mathlib's
Prokhorov interface supplies uniform tightness. Split the integral error over a compact
state set and its complement, using local uniform convergence on the former and the global
generator bound on the latter, then apply narrow convergence to a fixed bounded continuous
test. Joint continuity does not replace a bound on the noncompact state space.

### Mathlib reuse and trust boundary

**API-028–031** in [MathlibAPI.md](MathlibAPI.md) record the searches and actual consumers:
Tannery dominated convergence for series, Dirac and sum-measure integrals, a.e. convergence
implying convergence in distribution, pushforward and product operations, dominated
convergence, Prokhorov tightness, the compact-open topology and uniform convergence on
compact sets are all reused directly. The search found no theorem matching the full
contract for ℓ¹ convergence of discrete probability weights or joint integration with
varying functions and laws, so the local adapters are retained without adding external axioms.

The independent audit confirms that probability series, stick continuity, Dirichlet/posterior
coupling and law continuity, exact positive-rate pushforwards, common posterior domination
and the varying-integral adapter use only standard logical axioms.
`continuous_generator_compact` and `averaged_generator_continuous` depend on existing **E-S1**
through canonical-phase sample continuity; they add no literature dependency.
The project's external inputs remain the existing **8**: E-B1–3, E-J1–3, E-T1 and E-S1.

### Verification and handoff

The following commands were run from `formalization`, all with exit code **0**:

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

- The default build passed **3814 jobs**, using cached mathlib dependencies; this was not a rebuild after clearing dependencies.
- The independent audit checked **455 declarations**; all **42/42** public theorems from this pass have axiom output. The dependency set remains `propext`, `Classical.choice`, `Quot.sound` and the 8 literature inputs above.
- Successful build and independent audit logs contain no warning, error, `sorryAx` or additional native-evaluation trust dependency. The Lean source scan found no unfinished proof, and `git diff --check` passed.
- Logs are retained in the ignored `.lake/m4-completion-build.log` and `.lake/m4-completion-audit.log`. Lean and mathlib pins are unchanged.

The blueprint's SHA256 at both the start and end of this pass was
`AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`；
The designer's existing changes were preserved. No commit or push was performed.

The next stage is **M5**: for `0 < h ≤ 1/16`, construct an actual measurable Euler
probability kernel, prove the truncated-intensity bound, stay-put mass at least `1/2`,
total mass one, and exact mean and second-moment recurrences; then complete tightness,
time control, a test-independent subsequence and the limiting weak equation. M6 dynamic
identification, M7 final assembly and the genuine `GGC.ggc_rpow` remain incomplete;
the full formalization remains in progress.

<a id="m5-euler-foundation-2026-09-24"></a>
## 17. M5 progress: positive Euler kernels, actual iteration, moment bounds and local consistency — 2026-09-24

**Construction verdict: M5 is `in_progress`.** This pass advances the positive Euler
construction under Blueprint Section 5 C, Section 6 M5 and
[WIP-6.19](../ledger/21-log-thorin-euler-evolution.md#wip-6-19).
The discrete constructions and estimates below are proved. Time control, a common
test-independent subsequence, passage to the limit in time integrals and the full weak
equation remain incomplete. This entry does not claim completion or design acceptance
of M5 existence.

### Proved contracts

| Contract | Actual deliverable |
|---|---|
| Exact mass under a strictly positive cutoff | `truncatedJumpMeasure_mass`, `truncatedJumpMeasure_mass_le`: the reference measure has mass `2 / (exp ε - 1)` on `|v| > ε`, bounded by `2 / ε`. Absolute integrability of the truncated first moment is proved. |
| Actual acceptance and compensated drift | `truncatedIntensity`, `truncatedMeanJump`, `truncatedDrift` directly use the existing `acceptance B F y v` and `drift B F y`; joint measurability and finiteness of the density-weighted kernel are proved. |
| Positive probability kernel for small steps | `EulerStep = {h : ℝ // 0 < h ∧ h ≤ 1/16}`, `eulerCutoff h = sqrt h`. `eulerStay_ge_half`, `eulerMeasure_mass` and `eulerKernel_isMarkov` prove stay-put mass at least `1/2`, total mass one and the actual Markov kernel, respectively. |
| Exact first and second increment moments | `integral_euler_increment` gives `E[Δ | y] = h * drift B F y`; `integral_euler_increment_sq` gives the exact truncated jump second moment plus the drift-atom term. Integrability is established first for both increments. |
| Nonlinear iteration of probability laws | `eulerUpdate` composes the actual kernel with the current law; `eulerIterate` freezes the kernel at the current law at each step; `eulerMass` is `B₀ * exp (-n*h)`. Every grid law remains a probability law. |
| Second-moment recurrence and uniform finite-time bound | `integrable_sq_eulerIterate` proves finite second moments by induction over steps; `integral_sq_eulerIterate_succ_le`, `eulerIterate_uniform_secondMoment` supply the recurrence and a common bound for all admissible steps and all `n*h ≤ T`. |
| Uniform tightness of all grid laws | `isTightMeasureSet_eulerLawsUpTo`, `isCompact_closure_eulerLawsUpTo`: a common second-moment bound, Markov's inequality and Prokhorov give tightness and compact closure of the whole family of state laws. |
| Local consistency with the actual generator | `integral_euler_error_eq` separates exactly the drift atom's Taylor remainder and omitted small jumps; `abs_euler_error_le_sqrt` gives an explicit one-step error bound. Compensation covers all jump sizes. |

The actual measure in [Euler.lean](GGC/LogRate/Euler.lean) preserves the blueprint formula exactly:

\[
\Pi_h(y,dz)=p(y)\delta_{y+h a_\epsilon(y)/p(y)}(dz)
+h\int_{|v|>\epsilon}\delta_{y+v}(dz)k_{B,F}(y,v)\nu_0(dv).
\]

The two terms of `eulerMeasure` are a scaled Dirac measure and the translated pushforward
of the actual retained-jump measure. `eulerKernel` packages that same measure with its
measurability proof. No subsequent normalization changes the kernel or its moments.

### Moment bounds and consistency estimates

The truncated compensation term uses mathlib's Hölder inequality with both exponents equal to two:

\[
m_\epsilon(y)^2\le\lambda_\epsilon(y)m_2,
\qquad m_2=\int v^2\,\nu_0(dv)<\infty.
\]

Combining the exact second increment moment, `p ≥ 1/2` and `ε = sqrt h` gives

\[
\int z^2\,\Pi_h(y,dz)
\le(1+4h)y^2+h\{2D_B^2+3m_2\},
\qquad D_B=\operatorname{driftBound}(B).
\]

The proof first establishes absolute integrability at each step, then integrates against
the actual updated law. The mass follows `B₀ exp(-n*h)` within `[B₀ exp(-T), B₀]`,
so the existing compact-mass-interval bounds supply common constants. Geometric growth
and `1+4h ≤ exp(4h)` turn the scalar recurrence into a uniform finite-time second-moment
bound. This also supports the next integration step in the induction, without assuming
unproved moment existence for subsequent laws.

For `φ ∈ C_c²` with a global second-derivative bound `|φ''| ≤ C`, the following is proved:

\[
\left|\Pi_h\varphi(y)-\varphi(y)-h\mathcal G_{B,F}\varphi(y)\right|
\le 4Ch^2(y^2+D_B^2)
+Ch\sqrt h\,(1+4m_2).
\]

Here the small-jump bound follows from `v² * jumpDensity v ≤ 1` and
`integral_sq_smallJumps_le`. Cauchy–Schwarz bounds the compensation term at the required
vanishing error scale, without first deriving a logarithmic antiderivative for the
truncated absolute first moment. The bound applies to arbitrary bases and adds no initial
condition beyond the blueprint's finite second moment. It is a one-step estimate;
time accumulation, the vanishing limit and the limiting weak equation still need to be integrated.

### New modules and mathlib reuse

This pass adds **9 proof modules, 76 public theorems and 4 instances**; all 80 are included in the axiom audit.

| Module | Theorems / instances | Responsibility |
|---|---:|---|
| [LogRate/JumpTruncation](GGC/LogRate/JumpTruncation.lean) | 11 / 1 | Mass, finiteness and truncated first moments for strictly positive cutoffs. |
| [LogRate/RetainedJumps](GGC/LogRate/RetainedJumps.lean) | 16 / 1 | Density-weighted kernels for actual acceptance, truncated coefficients, measurability and integral interfaces. |
| [LogRate/Euler](GGC/LogRate/Euler.lean) | 16 / 2 | Small steps, actual probability kernels and exact increment moments. |
| [LogRate/EulerMoments](GGC/LogRate/EulerMoments.lean) | 8 / 0 | Cauchy–Schwarz compensation bounds, atom estimates and state second-moment bounds. |
| [LogRate/EulerIteration](GGC/LogRate/EulerIteration.lean) | 13 / 0 | Actual law updates, nonlinear recurrence, the mass schedule and uniform second-moment bounds. |
| [LogRate/SmallJumps](GGC/LogRate/SmallJumps.lean) | 2 / 0 | Exact-scale bounds for omitted small jumps. |
| [Foundations/MomentTightness](GGC/Foundations/MomentTightness.lean) | 1 / 0 | Adapt uniform real second-moment bounds to the library's tightness definition. |
| [LogRate/EulerTightness](GGC/LogRate/EulerTightness.lean) | 2 / 0 | Uniform tightness and compact closure of all admissible grid laws. |
| [LogRate/EulerConsistency](GGC/LogRate/EulerConsistency.lean) | 7 / 0 | Exact compensation identities, one-step remainders and explicit error bounds. |

**API-032–035** in [MathlibAPI.md](MathlibAPI.md) record source searches and actual reuse:
the fundamental theorem for improper integrals, reflection substitution, density-weighted
kernels, measurable kernel sections, pushforward integrals, kernel-composition integrability
and integrals, Hölder, Markov and Prokhorov all use existing mathlib interfaces.
The local adapters supply only this project's density formulas, the second-moment
tightness interface and assembly of the actual Euler construction.

### Verification and remaining work

The following commands were run from `formalization`, all with exit code **0**:

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

- The default build passed **3825 jobs**, using cached mathlib dependencies; this was not a rebuild after clearing dependencies.
- The independent audit checked **535 declarations**. All **80/80** new theorems and instances use only `propext`, `Classical.choice` and `Quot.sound`; no external mathematical input was added. The whole library still uses only these standard logical axioms and the existing 8 registered literature inputs.
- Successful build and independent audit logs contain no warning, error, `sorryAx` or additional native-evaluation trust dependency. Checks for unfinished proofs, audit coverage and `git diff --check` passed.
- Logs are in the ignored `.lake/m5-euler-foundation-build.log` and `.lake/m5-euler-foundation-audit.log`. The toolchain, dependency pins and external axiom declarations are unchanged.

The blueprint's SHA256 at both the start and end of this pass was
`AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`；
The designer's existing changes were preserved. No commit or push was performed.

M5 must still complete time control and continuous interpolation, a common test-independent
subsequence, uniform narrow convergence in time, the limiting second-moment bound,
vanishing accumulated consistency error, and the weak equation for every compactly
supported C² test and every time. Tightness of the state-law family does not replace
these results. M6, M7 and the final `GGC.ggc_rpow` remain incomplete; the full goal remains active.

<a id="m5-completion-2026-09-24"></a>
## 18. M5 finite-horizon weak-solution construction completed — 2026-09-24

Construction scope: blueprint C, M5, WIP-6.19. The blueprint was only read; its SHA256 remains
`AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`。
The user updated the ongoing construction goal to complete the blueprint or find an error
in the project's proof; after completing M5 here, work continues with M6. This entry
covers all M5 obligations left open in Section 17 and does not change the designer's acceptance status.

### Actual deliverables and quantifiers

`GGC/LogRate/Existence.lean` proves `GGC.LogRate.exists_weakLogRateSolution`:
for any `B₀ : PosReal`, any real-line probability `F₀` with integrable squared coordinate,
and any real `T > 0`, there is `Nonempty (WeakLogRateSolution B₀ F₀ T)`.
The structure's properties are proved from a concrete Euler limit and include:

- `law : C(ℝ, ProbabilityMeasure ℝ)`, using the original narrow topology on probability measures;
- `law 0 = F₀`；
- One finite nonnegative constant bounds all squared integrals on `[0,T]`, with square integrability proved at each time;
- For every compactly supported `C²` test and every `t ∈ [0,T]`, the blueprint's integral weak equation holds, with the actual time-dependent mass `massAt B₀ r = B₀ * exp (-r)` and the same generator as in M3/M4.

Constant extension outside the interval simplifies subsequent parameter integrals; the
weak equation and moment bound are asserted only on `[0,T]`. The theorem adds no
finite-support, density, original value-variable moment, generator-existence or
prespecified-limit assumption.

### Proof chain and mathlib reuse

1. `EulerWeakEstimates` integrates the actual one-step error against the current law and telescopes over the actual iteration. Each compactly supported `C²` test has a uniform Lipschitz bound on grid-time increments, and accumulated error vanishes with the step size.
2. `ProbabilityMixture`, `LinearInterpolation` and `EulerInterpolation` construct convex combinations of adjacent Euler laws. They prove time estimates across grid boundaries, exact integral formulas and uniform second-moment bounds; the next grid point beyond the endpoint is controlled by the established bound on `T+1`.
3. `CompactSmoothTests` applies mathlib's `ae_eq_of_integral_contDiff_smul_eq` to the Radon–Nikodym densities of two measures relative to their sum, proving that compactly supported `C²` tests separate finite measures. `CurveCompactness` transfers equicontinuity of test coordinates to equicontinuity of law curves on a compact law family, reusing `BoundedContinuousFunction.arzela_ascoli` and `IsCompact.tendsto_subseq`. Extraction takes place in the entire `C([0,T], ProbabilityMeasure ℝ)` space: one subsequence converges narrowly, uniformly on the compact time domain, independently of the test or observation time. This implementation controls law curves directly through compactly supported tests, without constructing a discrete path space or introducing a martingale existence theorem.
4. `MomentLimits` uses Portmanteau for nonnegative unbounded continuous functions to obtain square integrability and a uniform moment bound for the same limiting curve. Narrow convergence for bounded tests is not misapplied to the square function.
5. `MeshIntegral` reuses additivity of interval integrals over adjacent intervals to prove that the integral of the left-grid function equals the grid sum, and controls the final residual interval. `EulerTime` supplies positive steps `T/(ceil(16T)+n+1) ≤ 1/16` tending to zero, convergence of left-grid times to actual times, the mass parameter and continuous extension.
6. `EulerLimitGenerator` evaluates the whole-curve limit at moving left-grid times, using M4 continuity of the actual averaged generator and the uniform bound on compact mass intervals to exchange time integration and limits by dominated convergence. `EulerWeakEquation` combines interpolation, accumulated local and final-interval integral errors into a uniform `K*(h+sqrt h)` bound; uniqueness of limits then gives the exact weak equation for every test and time.

Sources, adaptation rationale and actual uses of these standard APIs are recorded in
shared index API-036–042. All public declarations are included in `AxiomAudit.lean`;
this entry adds 89 audit items, including object definitions and theorems.

### Build and actual trust boundary

Using the pinned
`C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe`，
The following were run sequentially in `formalization/`:

- `lake build`: exit code 0, 3891 jobs; log `.lake/m5-completion-build.log`;
- `lake env lean AxiomAudit.lean`: exit code 0, 624 declarations; log
  `.lake/m5-completion-audit.log`；
- Axiom-set parsing found only `propext`, `Classical.choice`, `Quot.sound` and the existing eight literature axioms; no `sorryAx`, native trust axiom, error or warning;
- The source scan found no proof placeholder; all eight `axiom` declarations remain in the existing External modules; `git -c core.safecrlf=false diff --check` passed.

Beyond standard logic, the final `exists_weakLogRateSolution` depends transitively only on
`GGC.External.SSV.phase_representation` (E-S1). Uniform time errors and actual iteration
estimates themselves use standard logic only; phase representation enters the final
construction through M4 limit continuity. No external axiom was added, literature contract
modified, Lean/mathlib pin changed, or commit/push performed.

**Construction verdict: M5 implementation is complete and passes the build and axiom audit; independent design acceptance is pending.**
M6 logarithmic moments, value-law continuity, test-domain extension, the zero endpoint
and transport identification, and M7's final `GGC.ggc_rpow` still require construction.
No error has currently been found in the project's mathematical proof; the full goal remains active.

<a id="m6-moments-continuity-2026-09-24"></a>
## 19. M6 logarithmic moments, positivity and continuity of value laws — 2026-09-24

Construction scope: identification inputs for blueprint D. This entry does not declare
M6 complete. The blueprint remains read-only, with SHA256
`AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`.

### Actual objects and bounds proved

- `Identification/LogTests` derives Thorin admissibility of `U = B * exp_* F` from M5's log-rate second moment and gives
  `F(log(1+s*exp(-y))) ≤ log(1+s)+sqrt K`。
- `Identification/ValueLaw` chooses E-B1's actual probability realization and proves its exact Laplace formula and GGC membership under the original definition. For each fixed `s₀>0`, the same M5 moment bound gives the blueprint's uniform lower bound `D = exp(-B₀*(log(1+s₀)+sqrt K)) > 0`.
- `ValuePositivity` proves `μ({0})=0`, so the actual value law is strictly positive. The proof uses `logTest(exp r)y ≥ r-y`, decay of the Laplace transform at infinity and an integral bound on singleton mass.
- `ValueTails`, `LogTailIntegral` and `Moments` prove the actual `Integrable Real.log μ`. For `B∈[a,b]`, `a>0` and `F(y²)≤K`, the explicit bound is
  `∫|log x|dμ ≤ exp(1+b*sqrt K)/a + 8*b*(1+K)`。
  Taking `a=B₀*exp(-T)` and `b=B₀` gives a uniform logarithmic-moment bound along the entire M5 curve.

This pass uses Laplace tail bounds and layer cake to meet the same moment contract:
the negative-log tail is bounded by `exp 1 * L(exp r)` and the positive-log tail by
`2*(1-L(exp(-r)))`; the latter log-rate kernel integrates over `r>0` to at most
`4*(1+y²)`. Absolute integrability on the product space is proved before exchanging
integrals. The constants are less sharp than those of the manuscript's
Gamma–Dirichlet/Frullani route, but no original value-variable moment, exponential
moment or new literature input is added.

### Continuity and mathlib reuse

`Foundations/GrowthContinuity` uses output truncation and the `f²/R` error bound to
extend narrow convergence to continuous tests with linear growth controlled by a
common second moment, yielding time continuity of Laplace transforms.
`LogMomentTightness` gives tightness of the value-law family; `GGC/LaplaceContinuity`
reuses Portmanteau to preserve nonnegative support, Prokhorov to extract subsequences,
and existing Laplace uniqueness to identify each subsequential limit.
`ValueContinuity.continuous_valueLaw` thus proves narrow continuity of the entire actual curve.

`LogValueContinuity` separately proves tightness and continuity of the actual log
pushforward: the uniform logarithmic moment bounds first moments of log laws;
pushing a subsequential limit through the globally continuous exp, positivity and
`log ∘ exp = id` identify the limit. Thus `Real.log` is not incorrectly treated as
globally continuous. The module also supplies a continuous probability curve on the
positive-real subtype, its correct real marginal, `valueKernel` and `valueKernel_isMarkov`.

API-043–051 record these standard tools, contract differences from the closest candidates
and reasons for retaining adapters. All 82 new public declarations are in `AxiomAudit.lean`.

### Verification and remaining obligations

Using the pinned executable recorded in Section 18, run from `formalization/`:

- `lake build`: exit code 0, 3907 jobs; log `.lake/m6-moments-continuity-build.log`;
- `lake env lean AxiomAudit.lean`: exit code 0, 706 declarations; log
  `.lake/m6-moments-continuity-audit.log`；
- Both logs contain no warning, error, `sorryAx` or native-evaluation trust dependency; the axiom set remains the three standard logical axioms and the existing eight registered literature inputs;
- No proof placeholder was found, and `git -c core.safecrlf=false diff --check` passed.

Beyond standard logic, this entry's value-law realization, positivity, moment bounds
and continuity use only E-B1; original GGC membership additionally uses the existing
E-B3 characterization direction. Generic tightness, tail integration and continuity
adapters add no mathematical axiom. Dependencies were cached; no clean mathlib rebuild is claimed.

M6 still requires test-domain extension, the resolvent time equation, absolute
space-time integrability of the full tangent, zero-endpoint normalization, C¹ test
approximation and transport uniqueness, before proceeding to M7. The blueprint,
toolchain and literature contracts were unchanged; no commit/push was performed.

<a id="m6-endpoint-2026-09-24"></a>
## 20. M6 zero endpoint and space-time integration of the full tangent — 2026-09-24

Construction scope: the full zero-endpoint contract in blueprint D. Five modules and
49 public declarations are added, all included in the independent axiom audit.
The shared mathlib reuse entries are API-052–053.

For any nonnegative probability law with finite absolute logarithmic moment,
`Identification/LaplaceEndpoint` proves `L(s) → 1`, `s*A(s) → 0` as `s↓0`, and the
uniform bound `|s*A(s)|≤exp(-1)*C/D` when `L(s)≥D>0` and `∫|log x|dμ≤C`.
The dominator is `exp(-1)*|log x|`; no `X log X` integrability of the original law is needed.

`AbsoluteLaplaceKernels` reuses mathlib's Gamma integral to prove actual absolute
integrability of `x*|log x|*exp(-s*x)` and `s*x²*|log x|*exp(-s*x)` on the product
of the positive Laplace half-line and value space. Each double integral equals
`∫|log x|dμ`. Product integrability is established before Fubini; no unproved
exchange of integrals is used.

`TangentMeasurability` reuses Section 19's actual Borel probability kernel and mathlib's
kernel-integral measurability to prove joint Borel measurability of damped moments,
`A_t(s)` and the actual q derivative `powerTangent μ_t s`. Expanded formulas are used only for `s>0`.

`TangentIntegrability` proves absolute integrability and bounds for all three expanded terms separately:

- `∫|A(s)|ds ≤ C/D`；
- `∫|s E_s[X² log X]|ds ≤ C/D`；
- The product term satisfies `∫|s E_s[X] A(s)|ds ≤ exp(-1)*C/D²`.

Hence the full `h(s)` is integrable on `(0,s₀]`, with absolute integral at most
`(2/D+exp(-1)/D²)*C`. Only then does `integral_powerTangent_zero_endpoint` apply
the fundamental theorem with one-sided endpoint limits to prove `∫₀ˢ h(r)dr = s*A(s)`.

`TangentSpaceTime` uses the subtype restriction of ordinary Lebesgue time measure to
`[0,T]` and proves that its mass is exactly `T`. `value_tangent_spaceTime_bound`
gives the required `T*(2/D+exp(-1)/D²)*C` bound and actual product integrability;
`exp(-1)=1/e`, matching the blueprint's constant. `integral_valueTangent_swap_zero_endpoint`
gives the time–Laplace Fubini identity after absolute integrability is verified;
`tendsto_integral_mul_tiltedXLog_zero` gives the zero-endpoint limit after time integration.
The proof uses only pointwise-in-time convergence and a uniform dominator, without
assuming uniform endpoint convergence in time.

Verification used the existing pinned toolchain from `formalization/`:

- `lake build`: exit code 0, 3912 jobs; log `.lake/m6-endpoint-build.log`;
- `lake env lean AxiomAudit.lean`: exit code 0, 755 declarations; log
  `.lake/m6-endpoint-audit.log`；
- Both logs contain no warning, error, `sorryAx` or additional native trust dependency; the axiom set remains the three standard logical axioms and eight existing literature inputs;
- Generic endpoint and absolute-integral theorems use standard logic only; application to the actual value-law curve adds only E-B1. No literature axiom was added; dependencies were cached, with no claim of a rebuild after clearing them;
- The blueprint SHA256 remains `AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`, and `git -c core.safecrlf=false diff --check` passed.

**M6 remains in progress.** Remaining work comprises weak-equation test-domain extension,
the resolvent time equation, simultaneous C¹ approximation of tests and generators,
log-value transport uniqueness and dynamic power-law identification, followed by M7
assembly. No mathematical proof error was found; the ongoing construction goal remains active.

<a id="m6-test-extension-2026-09-24"></a>
## 21. M6 extension of the weak equation's test-function domain — 2026-09-24

This completes the smooth-cutoff step of blueprint D and the identification section.
`LinearGrowthC2 φ` explicitly requires φ to be C², grow at most linearly and have bounded
first and second derivatives. Noncompact tests are not substituted directly into M5's equation.

- `Foundations/SmoothCutoff` reuses mathlib's `ContDiffBump` to construct χ(y/R), proving compact support, identity in the interior, vanishing outside, and first- and second-derivative formulas.
- `Foundations/SmoothCutoffBounds.exists_cutoffTest_uniform_bound` proves growth and derivative bounds for χ(y/R)φ(y) independent of R≥1.
- `LogRate/TestLimits` controls the generator by linear drift growth and the jump second moment, proving cutoff limits for test integrals, pointwise generators and averaged generators; it reuses existing acceptance-measurability results.
- `Identification/TestExtension.weakEquation_linearGrowth` uses dominated convergence in space and time to extend each constructed weak solution's equation to the full test class above. The uniform second moment supplies time domination without adding rate or value moment assumptions.

API-054 records library reuse. Generic cutoffs and spatial limits use standard logic only;
the final time limit and weak-equation extension additionally use E-S1 through M4 continuity
of the averaged generator for compactly supported tests.

Verification used the full Lean 4.32.2 toolchain path recorded in the README, from `formalization`:

- `lake build`: exit code 0, 3916 jobs; log `.lake/m6-test-extension-full-build.log`;
- `lake env lean AxiomAudit.lean`: exit code 0, 790 declarations; log
  `.lake/m6-test-extension-audit.log`；
- Logs contain no warning, error, `sorryAx` or native trust dependency; the entire audit's axiom set remains the three standard logical axioms and eight existing literature inputs. Dependencies were cached, with no new axiom or dependency change.

**M6 remains in progress.** Next are the resolvent time equation and Laplace evolution,
then simultaneous C¹ approximation of tests and generators, log-value transport uniqueness
and dynamic power-law identification. The blueprint remains read-only.

<a id="m6-laplace-evolution-2026-09-24"></a>
## 22. M6 resolvent and Laplace time evolution — 2026-09-24

This completes blueprint D's passage from the extended weak equation to exponential-test
evolution, corresponding to manuscript `eq:id-resolvent-evolution`,
`eq:id-exponent-evolution` and `eq:id-laplace-evolution`. It uses M5's actual weak
solution and the existing value-law construction.

1. `Identification/ResolventCalculus` proves that the resolvent belongs to `LinearGrowthC2` and differentiates under the integral at positive Laplace parameters to prove, for the actual value law,
   `powerLogDerivative μ 1 s = B * F(logResolvent s)`。
2. `Identification/TestExtension` completes uniform time bounds, measurability and interval integrability of averaged generators for extended tests. `Foundations/IntegratingFactor` reuses mathlib's absolutely continuous primitives and integration-by-parts theorem to derive the mass integrating-factor formula solely from the integral weak equation.
3. `Identification/ResolventEvolution.resolvent_time_equation` substitutes M3's actual resolvent identity and cancels exactly the extra term corresponding to `B'=-B`, yielding
   `g_t(s)-g_0(s)=∫₀ᵗ h_u(s) du`。
4. `Identification/ValueTime` uses standard `projIcc` for constant endpoint extension and equates restricted-measure integrals on the fixed time subtype with ordinary interval integrals. `LogLaplaceEvolution` uses the proved full-tangent space-time integrability and Fubini identity to derive `log L_t(s)-log L_0(s)=-∫₀ᵗ s A_u(s) du` from zero-endpoint normalization.
5. `DampedContinuity` uses bounded continuous tests and `Real.continuous_mul_log` to prove continuity of damped logarithmic moments along narrowly continuous law families. `Identification/LaplaceEvolution.laplace_time_equation` exponentiates the preceding identity to prove `L_t(s)-L_0(s)=-∫₀ᵗ s*dampedLogMoment(μ_u,0,s) du`, and proves continuity of the time integrand on the right. No undamped `X log X` moment is assumed.

API-055–056 record library reuse. The integrating factor and damped-moment continuity
use standard logic only. The final Laplace time equation additionally uses E-B1, the three
existing James inputs, E-S1 and the existing Sethuraman input. GGC weak closure and finite-atomic
approximation are not premises of dynamic identification.

Verification used the README's full toolchain path, from `formalization`:

- `lake build`: exit code 0, 3923 jobs; log `.lake/m6-laplace-evolution-full-build.log`;
- `lake env lean AxiomAudit.lean`: exit code 0, 818 declarations; log
  `.lake/m6-laplace-evolution-audit.log`；
- The audit contains no warning, error, `sorryAx` or native trust dependency; its total axiom set remains the three standard logical axioms and eight existing literature inputs. This was a cached build, with no dependency or literature-contract change;
- The blueprint SHA256 remains `AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`, and `git -c core.safecrlf=false diff --check` passed.

**M6 is not yet complete.** Remaining work comprises simultaneous C¹ approximation of
tests and generators, log-value transport uniqueness and actual power-law identification,
followed by M7 assembly. No mathematical proof error was found.

<a id="m6-log-transport-2026-09-24"></a>
## 23. M6 Simultaneous C¹ Approximation, the Value-Law Weak Equation, and Log-Value Transport — 2026-09-24

Completed the simultaneous approximation of test functions and generators in Blueprint D,
and the conversion of the weak equation from value space to log-value space. The manuscript
references are `eq:id-c1-polynomials`, `eq:id-generator-norm`,
`eq:id-value-weak`, and `eq:id-log-transport`.

- `Foundations/C1PolynomialApproximation` directly uses mathlib's Weierstrass
  theorem to approximate the continuous derivative, constructs an antiderivative with
  the prescribed value at zero using monomial differentiation rules, and controls the
  function error by the mean value theorem. No Bernstein or Weierstrass proof was rebuilt.
- `Identification/ExponentialTests.exists_expTest_generator_approximation`
  simultaneously controls the uniform errors of `f(exp(-x))` and its actual generator
  `x*log x*H'(x)` on x≥0; the latter is controlled by the existing damped logarithmic kernel bound.
- `PolynomialEvolution` inducts on actual polynomials, uses the proved Laplace time
  equation, and explicitly checks integrability for both probability and time integrals.
  `C1Evolution.C1_exp_time_equation` passes both the function and generator terms through
  arbitrarily small error bounds; derivative convergence is not inferred from uniform function convergence alone.
- `NonnegTests` provides a uniform bounded-test integral interface for families of nonnegative
  laws; `DampedContinuity` reuses it, removing duplicate negative-half-line truncation proofs.
- `Foundations/LogTestCoordinates` uses compact support and the divergence of log near zero
  to prove that the zero extension is locally zero, then proves smoothness, compact support,
  and the chain-rule derivative.
- `ValueWeakEquation.compact_value_time_equation` provides the value-space test equation
  for all compactly supported C¹ functions with H(0)=0, thus covering C_c¹((0,∞)).
  `LogTransport.log_value_time_equation` uses the proved strict positivity and the actual
  log-pushforward integral formula to obtain `λ_t(ζ)-λ_0(ζ)=∫₀ᵗ λ_r(z*ζ'(z)) dr`.
  `continuous_logValueAt` supplies actual narrow continuity of this family of laws.

See API-057–058 for library reuse and the precise gaps. The approximation, coordinate
helper lemmas, and general integral adapters use only standard logic. The final transport
equation has the same additional dependencies as the Laplace time equation in Section 22.

Validation used the full toolchain path from README and ran in `formalization`:

- `lake build`: exit code 0, 3932 jobs; log `.lake/m6-log-transport-full-build.log`;
- `lake env lean AxiomAudit.lean`: exit code 0, 857 declarations; log
  `.lake/m6-log-transport-audit.log`；
- Neither log contains warnings, errors, `sorryAx`, or native trust dependencies. The axiom
  boundary and dependency pins are unchanged; this build used cached dependencies;
- The Blueprint SHA256 is unchanged, and `git -c core.safecrlf=false diff --check` passed.

**M6 remains under construction.** The transport equation does not yet replace a uniqueness
proof. Next, follow the Blueprint to prove uniqueness using backward test functions and
partition sums, identify the actual power law, and then complete M7 assembly.

<a id="m6-completion-2026-09-24"></a>
## 24. M6 Completion: Partition Sums, Transport Uniqueness, and Actual Power-Law Identification — 2026-09-24

**Construction verdict: M6 is implemented and passed the full build and independent axiom audit;
independent design acceptance is pending.** This section closes the dynamic identification
contract in Blueprint D; Sections 19–23 provide the preceding evidence for moment bounds,
continuity, the zero endpoint, and test-function extension. The Blueprint remains read-only;
literature contracts, dependency versions, and public target definitions were not changed.

| Contract | Compiled declarations and implementation |
|---|---|
| Fixed tests to backward tests | `Identification/BackwardTests.lean` defines ζ(exp(T-u)z) and proves the time and space derivatives, global uniform bounds, and differentiation under integration against a fixed probability measure. `Foundations/JointProbabilityIntegral.lean` reuses the varying-measure integral lemma to prove joint continuity of the actual two-parameter pairing. |
| Partition sums | `Analysis.eq_endpoints_of_partition_cancellation` estimates each cell of a finite uniform partition, controls errors by uniform continuity on a compact set, and obtains equality of endpoints by telescoping. |
| Transport uniqueness | `Identification.transport_pairing_eq` derives exact single-cell increments from the original fixed compactly supported C¹ test equation and applies the partition lemma; `transport_law_eq_map` then separates measures using existing smooth tests to obtain the actual dilation pushforward. Neither a time-dependent test equation nor differentiability of the probability curve is assumed. |
| Dynamic power-law identification | `logValueAt_eq_map` and `valueAt_eq_powerLaw` apply to the actual log-value laws of the M5 weak solution; exponential pushforward and a.e. positivity give μ_t = powerLaw(μ_0, exp t). |
| Initial value and membership | `valueAt_zero` recovers the prescribed initial value law; `isGGC_power_valueLaw_of_weakSolution` proves that the power law is GGC using the constructed value law at time t. |

Reuse evidence is recorded in API-059: `ContinuousMap.continuous_of_continuous_uncurry`,
uniform convergence on compact sets, dominated differentiation under the integral, the classical FTC,
`IsCompact.uniformContinuousOn_of_continuous`, `Finset.sum_range_sub`, the existing smooth-test
separation theorem, `Measure.map_map`, `Measure.map_congr`, and `Real.rpow_def_of_pos` all
have compiled uses in production code. The local partition argument handles the weak transport
uniqueness contract for probability measures, for which no direct library replacement was found.

Validation (pinned Lean/mathlib versions, using the existing dependency cache):

- `lake build`: succeeded, 3937 jobs; log `.lake/m6-completion-build.log`.
- `lake env lean AxiomAudit.lean`: succeeded, 876 declarations; log `.lake/m6-completion-audit.log`.
- Neither log contains warnings, errors, `sorryAx`, or `ofReduceBool`; `git diff --check` passed.
- The Blueprint SHA256 remains `AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`.

The new general analysis and transport uniqueness lemmas depend only on standard logic.
The literature dependencies of `valueAt_eq_powerLaw` are E-B1, E-J1–3, E-S1, and E-T1;
GGC membership additionally uses the existing E-B3. No external axiom was added.
All validation here is relative to the fully registered literature inputs and does not
replace independent design acceptance.

M7 will construct finite Gamma initial log-rate data and the second-moment proof, take T=log q,
and assemble `GGC.ggc_rpow` using the proved weak-limit reduction. That final declaration is
not yet implemented at this checkpoint; no mathematical proof error was found.

<a id="m7-completion-2026-09-24"></a>
## 25. M7 Finite Inputs and Assembly of the Full Main Theorem — 2026-09-24

**Construction verdict: M7 is `verified` relative to the registered literature axioms;
independent design acceptance is pending.** `GGC/PowerClosure.lean`, a clean full build,
and a separately executed axiom audit all passed. This section preserves all public definitions
and target quantifiers in `main.lean`, updating only its status comments. The Blueprint remains read-only.

The full target expands to:

```lean
∀ (μ : GGC.NonnegLaw) (q : ℝ) (hq : 1 ≤ q),
  GGC.IsGGC μ → GGC.IsGGC (GGC.powerLaw μ q (zero_le_one.trans hq))
```

The actual proof declaration is `GGC.ggc_rpow : GGC.GGCPowerClosure`, available through
`import GGC.PowerClosure`. `AxiomAudit.lean` explicitly checks the main theorem against
the expanded type above and prints the proof's transitive axiom dependencies; checking the
target proposition definition itself does not replace checking this proof.

| Contract | Production declarations and proof connections |
|---|---|
| Initial normalization and moments | `Identification.exists_logRate_initialData` uses mathlib's `FiniteMeasure.normalize` to construct B>0 and a log-rate probability law F, prove square integrability, and recover the original base measure. |
| Finite Gamma initial value | `finiteThorinMeasure_ne_zero` covers all nonempty finite inputs; `exists_finiteGamma_initialData` reuses finite atomic integration and Laplace uniqueness to identify the actual independent Gamma sum as the initial value law. |
| Time assembly | For q>1, `isGGC_power_valueLaw` takes T=log q and invokes the proved `exists_weakLogRateSolution` and `isGGC_power_valueLaw_of_weakSolution`. For q=1, it invokes the identity-pushforward lemma. |
| Empty sums and finite inputs | `isGGC_power_finiteGammaLaw` explicitly separates the empty sum and handles the law concentrated at zero through the constant-law lemma; `isGGC_power_of_isFiniteGammaConvolution` unpacks the original finite-convolution definition. No additional restrictions are placed on shapes, rates, or real exponents. |
| General inputs | `ggc_rpow` uses the proved `ggcPowerClosure_of_finiteGamma`. The original definition supplies finite Gamma approximations; continuous pushforward by a fixed real power and the original GGC weak closure remove finite-mass and moment assumptions, with the limit still an actual probability law. |

API-060 records compiled uses of standard-library normalization, integrability under measure
scaling and pushforward, finite sums, and exp/log. M1's finite atomic integration, Laplace
uniqueness, and weak-limit reduction are reused directly without rebuilding their foundations.
M5 existence and M6 identification are invoked as proved theorems, leaving no unprovided core premise.

### Final validation

The production-target build `lake build GGC.PowerClosure` succeeded with 3933 jobs; log
`.lake/m7-power-closure-build.log`. The default full build after adding the final type and
axiom checks succeeded with 3939 jobs; log `.lake/m7-completion-build.log`.

The first default parallel build after cleaning project outputs failed; `.lake/m7-clean-build.log`
contains `std::bad_alloc`, Windows exit codes 3221226505/3221225477, and imported-file read errors.
The Lean/mathlib library files named in those errors were checked and still existed with nonzero size.
Next, `lake clean ggc_power_closure` was run again, the absence of `.lake/build` was verified,
and the default target was rerun with `LEAN_NUM_THREADS=2` in the current command process,
without changing project source, dependencies, or persistent system settings. The thread-pool
environment variable's behavior was checked against the [official Lean tasks and threads documentation](https://lean-lang.org/doc/reference/latest/IO/Tasks-and-Threads/)
and the installed 4.32.2 runtime. The second log, `.lake/m7-clean-build-threads2.log`, records
exit code 0 and 3939 jobs. Comparing the build log against the source-module inventory confirmed
a `Built` entry from this run for every one of the 136 project Lean modules.

The separate run of `lake env lean AxiomAudit.lean` exited with code 0; log
`.lake/m7-completion-audit.log`. The 883 axiom checks match the 883 declarations in the audit
source one for one; all actual axioms are whitelisted. Neither final successful log contains
warnings, errors, `sorryAx`, or `ofReduceBool`. The source scan found no unfinished proofs or
new non-whitelisted axioms; `git diff --check` passed.

The pinned environment remains Lean 4.32.2 and mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`, with no local modifications in the mathlib checkout.
The Blueprint SHA256 remains `AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`.
Local transitive imports of the external contracts involve only the three shared semantic
modules `RandomMeasure`, `Posterior`, and `StickBreaking`, with no dependency on `main`
or the project's core derivation.

Reproduce the final checks from `formalization` using the actual executables of the pinned toolchain:

```powershell
$taskLake = 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe'
$env:LEAN_NUM_THREADS = '2'
& $taskLake clean ggc_power_closure
& $taskLake build
& $taskLake env lean AxiomAudit.lean
```

`clean` explicitly names this project's package and removes `formalization/.lake/build`;
the pinned dependencies' build caches are retained. Thus the clean build in this section
recompiles project sources and does not claim to rebuild all of mathlib from scratch.
The environment variable affects only the process environment running these commands.

The clean build and independent audit consistently confirm the following actual literature
dependencies of `GGC.ggc_rpow`:

| ID | Axiom |
|---|---|
| E-B1 | `GGC.External.Bondesson.thorin_realization` |
| E-B3 | `GGC.External.Bondesson.finite_atomic_approximation` |
| E-J1 | `GGC.External.James.markov_krein` |
| E-J2 | `GGC.External.James.posterior_palm_nonneg` |
| E-J3 | `GGC.External.James.beta_atom_posterior` |
| E-T1 | `GGC.External.Sethuraman.stick_breaking` |
| E-S1 | `GGC.External.SSV.phase_representation` |

The only additional axioms are `propext`, `Classical.choice`, and `Quot.sound`. E-B2 is still
used in the project's Thorin characterization proof but is absent from the final main theorem's
dependency chain; no E-B4 or other axiom was added. The seven external literature inputs above
remain axioms without Lean proofs in this project. The precise conclusion is therefore that
"the project's GGC power-closure derivation has been verified in Lean relative to the listed
literature axioms"; it cannot be claimed that all external mathematical axioms have been eliminated.

### Blueprint construction milestone closure table

This table records construction validation; independent design acceptance of M2–M7 remains
pending with the designer, and the read-only Blueprint is unchanged. Earlier incomplete statuses
are retained as historical checkpoints; this table and this section's final validation take precedence.

| Milestone | Construction validation status | Main evidence |
|---|---|---|
| M0 | `verified`, design accepted | [Section 4](#m0-design-acceptance-2026-09-23), pinned interfaces and environment |
| M1 | `verified`, design accepted | [Section 6](#m1-design-acceptance-2026-09-23), characterization, uniqueness, and final reduction |
| M2 | `verified` relative to registered inputs | [Section 11](#m2-completion-2026-09-24), [Section 15](#m2-quantile-completion-2026-09-24): Dirichlet/posterior, phase, tangent, ordered quantiles, and the common space |
| M3 | `verified` relative to registered inputs | [Section 12](#m3-completion-2026-09-24), the actual generator and absolutely convergent resolvent identity |
| M4 | `verified` relative to registered inputs | [Section 16](#m4-completion-2026-09-24), common-space coupling and averaged-generator continuity |
| M5 | `verified` relative to registered inputs | [Section 18](#m5-completion-2026-09-24), actual Euler construction and finite-horizon weak-solution existence |
| M6 | `verified` relative to registered inputs | [Sections 19–24](#m6-completion-2026-09-24), moments, endpoints, test domains, partition uniqueness, and actual power-law identification |
| M7 | `verified` relative to registered inputs | This section: the full type of `GGC.ggc_rpow`, the clean build, and the axiom whitelist audit |

All core Blueprint derivations now have Lean proofs, and the final target has no remaining
premises for existence, finite-input closure, or additional moment conditions. No mathematical
proof error was found in this pass. Remaining work consists of independent design review and
separate formalization of the literature inputs above, rather than unfinished core construction
milestones under this whitelist.

<a id="final-design-acceptance-2026-09-24"></a>
## 26. Independent Design Acceptance of M2–M7 — 2026-09-24

Historical acceptance verdict: the user subsequently withdrew RV-1, and M7 was closed in
Section 27; the build, axiom, and semantic review evidence below is retained. The random-variable
corollary is no longer a required supplementary deliverable.

**Verdict: M2–M6 are accepted; the distribution-level main theorem `GGC.ggc_rpow` is accepted
for the full target scope relative to seven registered literature axioms. Overall M7 delivery
is not yet closed and remains `in_progress`: the random-variable corollary explicitly required
by the Blueprint (RV-1) is missing.** This is a delivery gap, not a rejection of the existing
distribution theorem. This section supersedes Section 25's judgment that only independent
review remained and no deliverables were outstanding; the historical construction record is retained.

### Acceptance scope and results

The review examined actual definitions, principal proof interfaces, and dependency chains,
together with recompilation of the entire project and a transitive axiom audit. It was not
merely a file count and does not claim a manual line-by-line reproof of all 136 modules.
The construction source corresponds to commit `e2edc76e360e098e8ffaabbff61111b7e94138cc`;
Blueprint documentation changes already present when acceptance began were preserved.
The designer did not change Lean construction sources, dependency pins, or external axiom types.

| Milestone | Independent acceptance verdict | Main checks performed |
|---|---|---|
| M2 | `verified` relative to registered inputs | Finite-partition Dirichlet semantics including zero-mass cells; actual Gamma/Beta integration and absolute integrability; actual posterior mixing; a fixed common space, ordered quantiles, and common full-measure events; complex phase inputs and local measurable boundary recovery; the tangent of the actual power pushforward. |
| M3 | `verified` relative to registered inputs | `LogRate.Generator` uses the actual Dirichlet law; bounds for the compensated kernel, drift, and second jump moment; the correct `digamma (B + 1)`; absolute integrability of `integral_generator_eq_normalized_powerTangent` without hidden rate-moment conditions. |
| M4 | `verified` relative to registered inputs | Continuity of phase pairings for every L¹ kernel; a countable common event for locations and a common stick event for all mass parameters; actual posterior sample coupling, uniform domination, local uniform convergence, and the averaged generator under varying laws. |
| M5 | `verified` relative to registered inputs | A positive Euler Markov kernel and exact moments, discrete iteration, uniform second moments and tightness; a common subsequence for the entire continuous curve; accumulated errors and the final incomplete grid interval; the limiting weak equation for every test function and every time. `exists_weakLogRateSolution` actually constructs a weak solution. |
| M6 | `verified` relative to registered inputs | Strict positivity, absolute log moments, and continuity of real-valued and positive-valued laws; absolute space-time integrability of every tangent term and normalization at the zero endpoint; extension of the truncated test domain; partition uniqueness derived from the fixed-test equation; identification of actual measures by `valueAt_eq_powerLaw`. |
| M7 distribution main theorem | `verified` relative to seven registered inputs | `InitialData` constructs initial data from the actual finite Thorin measure and handles the empty sum and `q = 1`; it takes `T = log q`, then removes intermediate moment restrictions through the approximation sequence in the original definition and local weak closure. |
| M7 complete delivery | `in_progress` | RV-1 is not yet implemented; see the supplementary delivery contract below. |

`main.lean` preserves the actual Gamma distribution, the finite independent product/sum
pushforward, the `IsGGC` definition by weak limits of finite convolutions, and `powerLaw`
as the actual `Real.rpow` pushforward. The full main-theorem type is:

```lean
∀ (μ : GGC.NonnegLaw) (q : ℝ) (hq : 1 ≤ q),
  GGC.IsGGC μ → GGC.IsGGC (GGC.powerLaw μ q (zero_le_one.trans hq))
```

An independent `#print GGC.ggc_rpow` shows that the actual proof body is
`GGC.ggcPowerClosure_of_finiteGamma GGC.isGGC_power_of_isFiniteGammaConvolution`。
The finite-input premises have been discharged by the preceding constructions; the final type
has no weak-solution existence, additional moment, finite-mass, finite-support, zero-drift,
or nondegeneracy premise. The actual core dependency chain revealed no semantic cycle,
vacuous premise, or missing integrability concealed by default integral values.

### Independent build and audit evidence

The working directory is the repository's `formalization`. The locally installed pinned
toolchain was used, with commands executed sequentially and the independent audit run only
after the build succeeded:

```powershell
$taskLake = 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe'
$env:LEAN_NUM_THREADS = '2'
& $taskLake env lean --version
& $taskLake clean ggc_power_closure
& $taskLake build
& $taskLake env lean AxiomAudit.lean
& $taskLake env lean .lake/FinalDesignCheck.lean
```

- Lean version is 4.32.2; mathlib HEAD is
  `905b95818eb32af7874a58b427f50c1711a5e96c`, with no local dependency-checkout modifications.
- Before cleaning, the target was verified to lie within this project; `clean ggc_power_closure`
  exited with code 0, and `formalization/.lake/build` was then confirmed absent. Only this project
  was cleaned and recompiled, preserving pinned dependency caches; no from-scratch mathlib build is claimed.
- The default build exited with code 0, **3939 jobs**. Comparing source modules one by one
  against this run's `Built` log confirmed new compilation records for **136/136** project Lean modules.
- Direct execution of `AxiomAudit.lean` exited with code 0. Declaration names in the audit
  source matched output one for one, **883/883**, with all transitive axioms in the whitelist.
- Supplementary checks exited with code 0: printing the final proof body and `GGCPowerClosure`,
  `IsGGC`, and `powerLaw`, checking `ggc_rpow` against the full type above, and re-auditing weak-solution
  existence, transport uniqueness, dynamic identification, and the main theorem. Temporary files
  reside only in ignored `.lake` and do not replace the persistent project audit entry point.
- Build, direct-audit, and supplementary-check logs contain no warnings, errors, `sorryAx`, or
  `ofReduceBool`. The source scan found only the eight registered external axioms, with no core axioms
  or unfinished proofs.
- The local import graph is acyclic. The external files' transitive project dependencies are only
  `GGC.Foundations.RandomMeasure`, `Posterior`, and `StickBreaking`; they do not depend on `main`
  or the core derivation. `main` imports only mathlib.
- After updating acceptance documentation, `git diff --check` and relative-file-link checks
  for the four modified documents passed.

The logs for this run are `.lake/final-design-review-clean.log`,
`.lake/final-design-review-build.log`、`.lake/final-design-review-audit.log`、
and `.lake/final-design-review-semantic.log`; item-by-item comparison results are in
`.lake/final-design-review-summary.json`. These are local review artifacts, and `.lake` is
not version-controlled; reproducible commands, counts, and dependency lists are therefore
also recorded in this section.

### Trust-boundary and reuse acceptance

The independent output confirms that the main theorem depends on exactly:

| Literature ID | Actual axiom |
|---|---|
| E-B1 | `GGC.External.Bondesson.thorin_realization` |
| E-B3 | `GGC.External.Bondesson.finite_atomic_approximation` |
| E-J1 | `GGC.External.James.markov_krein` |
| E-J2 | `GGC.External.James.posterior_palm_nonneg` |
| E-J3 | `GGC.External.James.beta_atom_posterior` |
| E-T1 | `GGC.External.Sethuraman.stick_breaking` |
| E-S1 | `GGC.External.SSV.phase_representation` |

Also present are `propext`, `Classical.choice`, and `Quot.sound`. The union across the entire
audit contains eight literature axioms, adding E-B2; it supports the independent Thorin
characterization and is not a transitive dependency of `ggc_rpow`.
Apart from standard logic, `exists_weakLogRateSolution` uses only E-S1; the general
`transport_law_eq_map` uses only standard logic. E-B4 was not introduced.

The types and local adapters of the literature inputs match the registered boundary. This
review neither repeated a full review of the original literature nor formalized those axioms
as Lean theorems. Acceptance wording must therefore retain "relative to the registered literature axioms."

Reuse decisions in the shared [MathlibAPI.md](MathlibAPI.md) were accepted against the actual
consumers in this commit: standard distributions, kernels, pushforwards, CDFs, Mellin/Gamma,
weak topology, Arzelà–Ascoli, FTC, and dominated-integration tools are used; local proofs remain
for stronger contracts such as ordered-quantile adapters, the compensated generator, and weak
transport identification. Acceptance covers contract matching and compiled use at the pinned
version, without claiming exhaustive discovery of all possible mathlib reuse.
Project proof obligations GAP-001–004/006 are closed; GAP-005 remains the trust boundary for literature inputs.

### RV-1: Historical supplementary delivery contract (withdrawn in Section 27)

Blueprint Section 2 describes the random-variable theorem as a pushforward corollary;
Sections 4.1 and 4.2 explicitly list the "random-variable corollary" as a deliverable of
`GGC/PowerClosure.lean`. The actual file ends after the distribution theorem `ggc_rpow`,
and no corresponding corollary was found anywhere in the project. Successful compilation
of the main theorem alone therefore cannot establish completion of the entire delivery.

On an arbitrary probability space, construction must show that for measurable, a.e. nonnegative
`X : Ω → ℝ`, membership of its actual law in GGC implies membership of the law of `X^q`
for the same `X`, for every real `q ≥ 1`. A more general `AEMeasurable` interface is allowed.
A small law wrapper or law-equality adapter suffices: prove the actual `Measure.map` composition
identity and invoke the existing `ggc_rpow`, without introducing independence, moments,
finite-mass, or Thorin-representation premises, or reconstructing the evolution.

Extend API-060 or add a stable reuse-record ID; add the corollary's full type and transitive
axiom checks to `AxiomAudit`, and persistently record `#print GGC.ggc_rpow` as well.
After the default build and direct audit pass, submit M7 for re-acceptance.
The contract of the originally proposed name `finiteGamma_power_closure` is already met by the actual
`isGGC_power_finiteGammaLaw` / `isGGC_power_of_isFiniteGammaConvolution`
so the different name is not another defect. No new external axiom or reopening of M2–M6 is required.

<a id="entrypoint-design-2026-09-24"></a>
## 27. User Scope Revision and Readable Entry-Point Design — 2026-09-24

The user confirmed that the current distribution version already meets the required conclusion
and that a random-variable corollary is no longer needed. RV-1 is therefore withdrawn, and M7
is closed as `verified` based on the independent validation completed in Section 26, still
relative to the original seven registered literature axioms. This is an explicit delivery-scope
revision, not a claim that a new corollary has been proved, and it does not change the existing
mathematical acceptance evidence.

E1 is added with status `planned`: rename the current `main.lean` to `GGC/Definitions.lean`,
preserving all definitions and constructive proof fields needed by the main theorem; place
the unique `GGC.ggc_rpow : GGCPowerClosure` in a new `main.lean`, explicitly displaying four
steps: finite Gamma approximation, power closure of approximants, weak convergence of power
pushforwards, and GGC weak closure. Add readable comments explaining the mathematical roles
and assumptions. Finite-input initial data, Euler construction, dynamic identification, and
other details remain encapsulated in `GGC/PowerClosure.lean` and its dependencies.
The recommended name `Definitions` distinguishes this layer from the existing `Basic` helper lemmas.

Construction must also correct the import direction: lower-level modules reference
`GGC.Definitions`, the new `main` references proof modules, and the audit references the new
`main`; `PowerClosure` must not import `main` in reverse. The main theorem's name, full type,
original GGC definition, and seven literature-axiom dependencies remain unchanged.
See [Blueprint Section 4.1](Blueprint.md#statement-proof-separation) for full responsibilities,
comment standards, and acceptance criteria, and API-061 for the reuse record.

This update changes documentation only; no Lean files were moved or rewritten. After E1,
submit the actual proof, an acyclic import graph, a clean project build, and the subsequent
direct audit; old module or audit counts must not be presented as post-migration validation.

<a id="e1-construction-2026-09-24"></a>
## 28. E1 Migration to a Readable Main-Theorem Entry Point — 2026-09-24

Construction follows Blueprint Sections 4.1 and 13. The mathematical scope of M0–M7 is unchanged;
RV-1 has been withdrawn, and no random-variable corollary was constructed. This section appends
construction evidence without modifying the designer's Blueprint or earlier acceptance records;
independent design acceptance of E1 remains pending.

- `Definitions.lean` takes over all definitions and constructive proof fields from the original
  `main.lean`. From `noncomputable section` onward, it matches the old file in commit `e2edc76`
  verbatim after normalizing line endings and ignoring trailing whitespace. Declaration names
  and definition semantics are unchanged; only the module description was corrected.
- Definition-layer imports in `GGC.Basic` and `GGC.StieltjesMean` now use `Definitions`.
  `GGC/PowerClosure.lean` retains the three finite-input helper theorems and moves out the unique public `ggc_rpow`.
- The new `main.lean` explicitly imports `Definitions`, `GGC.PowerClosure`, and `GGC.WeakClosure`.
  Its proof has four steps: extract finite Gamma approximations, name `hpowered`, name
  `hpowered_lim`, and apply `isGGC_of_tendsto`. Chinese comments explain intermediate conditions
  and the final scope. Mathematical sources remain WIP-6.21, WIP-6.23, and manuscript/sections/06-completion.tex.
- `AxiomAudit.lean` now imports `main`, retains all existing checks, and adds `#print GGC.ggc_rpow`.
  The expanded quantified type check still derives the GGC property of the actual power law
  from arbitrary `NonnegLaw μ`, real `q ≥ 1`, and `IsGGC μ`.
- The three helper lemmas accepted in API-061 are reused, with no new general foundational
  proofs, literature inputs, or toolchain changes. The user subsequently required `Definitions`
  at the root, overriding the Blueprint's recommended path; Lake roots/globs explicitly include
  `Definitions`. Current entry-point descriptions in the root README, ResearchStatus, formalization
  README, and External README were updated together; historical acceptance records retain their original meaning.

Static validation: DFS confirms an acyclic local import graph for 137 project Lean modules;
only `AxiomAudit` imports `main`, and only the new `main` declares `ggc_rpow`. External files
are unchanged, and the definition layer imports only mathlib. The Blueprint SHA256 before
and after construction is
`AF02B6208E82DCE31D48014F87B316BFBB1125FA1D1E38BE6E0F251736BD7E59`。

Reproduction commands (run in `formalization`, preserving dependency caches and cleaning project outputs):

```powershell
$env:LEAN_NUM_THREADS = '2'
$lake = 'C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe'
& $lake clean ggc_power_closure
& $lake build *> .lake/e1-root-clean-build.log
& $lake env lean AxiomAudit.lean *> .lake/e1-audit.log
```

Validation results: project cleaning and the clean build of the final layout both exited with
code 0; the build completed **3940 jobs**. Comparing every project source against the build log
confirmed **137/137 modules marked Built**, including root `Definitions`, the new `main`, and
`AxiomAudit`, rather than reusing the old layout's count of 136 modules. The subsequent direct
audit exited with code 0; **883/883** `#print axioms` requests matched output declarations one
for one. The added ordinary `#print` prints the actual four-step proof body without increasing
the axiom-check count. Full-build and direct-audit logs contain no warnings, errors, `sorryAx`, or `ofReduceBool`.

The dependencies of `GGC.ggc_rpow` are exactly `propext`, `Classical.choice`, and `Quot.sound`, plus:
`Bondesson.thorin_realization`、`Bondesson.finite_atomic_approximation`、
`James.markov_krein`、`James.posterior_palm_nonneg`、`James.beta_atom_posterior`、
`Sethuraman.stick_breaking` and `SSV.phase_representation` (all under `GGC.External`).
E-B2 still appears only in the broader characterization audit, not in the main theorem's
dependencies. The full audit contains only registered whitelist entries.

Process note: the first build used the Blueprint's recommended subdirectory layout; the user
then explicitly required `Definitions` at the root. That run was deliberately stopped, and
`.lake/e1-clean-build.log` is not passing evidence. Final evidence is the freshly cleaned
`.lake/e1-root-clean-build.log` and `.lake/e1-audit.log`. Dependency caches were retained;
Lean 4.32.2 and mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` are unchanged.
Construction verdict: E1 is `verified` relative to the original trust boundary; independent design acceptance is pending.

Subsequent user convention: all project Lean source comments must be English. The Chinese
module description, theorem documentation, and inline comments in main.lean described above
have all been translated into English, and the convention is recorded in README; definitions
and proof code are unchanged. A scan of all project Lean sources found no remaining Han
characters, and the diff whitespace check passed. This was a comments-only change, so the
full build was not rerun.

<a id="e1-design-acceptance-2026-09-24"></a>
## 29. E1 Independent Design Acceptance — 2026-09-24

**Verdict: E1 is accepted with status `verified`.** The distribution version, definition
semantics, and boundary of seven registered literature axioms are unchanged; existing M0–M7
acceptance remains valid, and RV-1 remains withdrawn. Three old-path comments are also recorded
as nonblocking findings; they do not require redoing completed proofs.

### Actual delivery and semantic review

The accepted source commit is `88b8529a29da851b015d545c2cee3a566b779b7c`, with a clean worktree
at the start. The actual definition file is `Definitions.lean` at the formalization root,
accepted under the subsequent path convention recorded in Section 28 and README, replacing
the originally recommended subdirectory path. Lean comments are English, consistent with the
current README convention; the Blueprint has been synchronized. Design acceptance changed no Lean files.

- From `noncomputable section` onward, `Definitions.lean` matches the corresponding part of
  the original `main.lean` in `e2edc76` verbatim after normalizing line endings and ignoring
  trailing whitespace. This includes all definitions, constructive proof fields, and
  `GGCPowerClosure`, with no new parameters or changes to the original weak-limit semantics.
- The new `main.lean` declares exactly one `GGC.ggc_rpow`. It extracts an approximation sequence
  from `IsGGC`, proves the named fact `hpowered` using the finite-input theorem, proves
  `hpowered_lim` using continuity of a fixed-power pushforward, then applies `isGGC_of_tendsto`.
  Comments explain each step's mathematical role, where the empty-sum and exponent-one branches
  are handled, and why intermediate moment/finite-mass conditions do not enter the conclusion.
- `GGC/PowerClosure.lean` retains its original three finite-input helper theorems; only the final
  public theorem moved. Other analysis, Euler, and dynamic identification proofs were not rewritten.
  Existing production lemmas are used, with no new general foundational proofs or literature axioms.
- The import graph of 137 project modules is acyclic. The definition layer imports only mathlib;
  former definition-layer consumers use `import Definitions`; only `AxiomAudit` imports `main`.
  The local dependency closure of external files still contains only `RandomMeasure`, `Posterior`,
  and `StickBreaking`, with no reverse dependency on the main theorem.
- Lake roots/globs explicitly cover root `Definitions`, the new `main`, and the audit entry point.
  `AxiomAudit` checks the full quantified type, the actual four-step proof body, and transitive axioms.

### Independent validation evidence

The working directory is `formalization`, using the actual Lake executable from pinned Lean
4.32.2. The following commands were executed sequentially; the audit ran after the build succeeded:

```powershell
$taskLake = 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe'
$env:LEAN_NUM_THREADS = '2'
& $taskLake env lean --version
& $taskLake clean ggc_power_closure
& $taskLake build
& $taskLake env lean AxiomAudit.lean
```

The absolute project build-directory path was checked before cleaning; cleaning exited with
code 0, and `.lake/build` was confirmed absent. Pinned dependency caches were retained, with
no claim of compiling mathlib from scratch. mathlib HEAD remains
`905b95818eb32af7874a58b427f50c1711a5e96c`, with no local checkout modifications.

The default build exited with code 0, **3940 jobs**; source modules were compared one by one
against this run's `Built` records, confirming recompilation of **137/137** project modules.
The subsequent direct audit exited with code 0, with **883/883** `#print axioms` requests matching
output declarations. The ordinary `#print ggc_rpow` outputs the actual proof body and is not
counted among those 883 axiom checks. Build and audit logs contain no warnings, errors,
`sorryAx`, or `ofReduceBool`.

The main theorem's dependencies remain exactly E-B1, E-B3, E-J1, E-J2, E-J3, E-T1, and E-S1,
plus `propext`, `Classical.choice`, and `Quot.sound`; the full audit additionally includes E-B2
for the independent characterization, with no other axioms. The full type still derives the
GGC property of the actual power pushforward from an arbitrary nonnegative probability law,
real `q ≥ 1`, and the original `IsGGC` hypothesis.

Local logs: `.lake/e1-design-clean.log`, `.lake/e1-design-build.log`, and
`.lake/e1-design-audit.log`; static checks and item-by-item audit results are saved respectively in
`.lake/e1-design-static.json`、`.lake/e1-design-summary.json`。
Artifacts in these ignored directories are not versioned evidence; reproducible commands,
counts, and results are recorded in this section.

### Nonblocking documentation finding D1 (P3)

Comments in three source files still use old locations; correcting them during later maintenance is recommended:

| Location (line numbers in this commit) | Comment correction |
|---|---|
| `Definitions.lean:119` | The proof of `ggc_rpow` is in `main.lean`, not `GGC/PowerClosure.lean`. |
| `GGC/Thorin.lean:10` | The original `IsGGC` definition is in `Definitions.lean`, no longer in `main`. |
| `GGC/WeakClosure.lean:10` | Likewise, change the file location of the sequential definition to `Definitions`. |

These are residual path comments of the same kind; actual imports, definitions, and proofs are
correct, and the new main entry point explains the mathematics clearly. They therefore neither
block E1 acceptance nor create a new proof deliverable. API-061 is updated to design accepted.

<a id="e2-design-2026-09-24"></a>
## 30. E2 Design Delivery and Independent Semantic Audit Follow-Up — 2026-09-24

**Role and status: the designer is delivering the construction specification; E2 is `planned`
and user-authorized for construction.** This update implements no replacement proof for E-B3/E-B1
and does not reduce actual axiom dependencies. Existing relative acceptance of M0–M7 and E1
remains valid. See [Blueprint Section 15](Blueprint.md#e2-bondesson-formalization) for the full
construction specification and shared entries API-062–066 for API search and reuse evidence;
new proofs and minimal compilation prototypes remain for construction.

### Authorized scope and construction stages

The goal is to replace `GGC.External.Bondesson.finite_atomic_approximation` (E-B3) and
`GGC.External.Bondesson.thorin_realization` (E-B1) with complete theorems of the same types,
retaining public names for existing consumers. Both results and their shared foundations may
depend only on mathlib, local proofs, and standard logical axioms; E-B2, E-B4, or other literature
inputs must not serve as substitutes. E-B2's independent characterization role is retained.

| Substage | Construction work | Current status |
|---|---|---|
| E2.0 | Extract external-axiom-free Thorin definitions/lemmas and general Laplace tail bounds, isolating imports of heavy consumers. | `planned` |
| E2.1 | Derive tightness of the entire sequence of nonnegative probability laws from a common Laplace lower bound tending to one at zero. | `planned` |
| E2.2 | Truncate rates and round upward on a grid, delete zero-weight cells, and absorb drift into a Gamma factor; construct one sequence of actual finite Gamma convolutions and prove transform convergence for all positive parameters and a uniform lower bound. | `planned` |
| E2.3 | Complete E-B3 using existing Laplace uniqueness/continuity; complete E-B1 using a Prokhorov probability subsequence limit. | `planned` |
| E2.4 | Integrate compatible same-type theorems, update documentation, perform a clean project build and full direct axiom audit, and submit for independent acceptance. | `planned` |

The key design simplification is to put `m=n+1` and round rates on `[1/m,m]` to `ceil(m*b)/m`.
Rounded rates are at least the original rates, so the discrete logarithmic kernel is no larger
than the original kernel. For positive drift, append `Gamma(m,m/a)`, whose exponent
`m*log(1+a*s/m)` is bounded above by `a*s`. Thus the Laplace transform of every approximating
law is bounded below by the target transform. Combined with the existing
`measureReal_Ioi_exp_le_one_sub_laplace`, this directly yields uniform tail bounds and tightness.
This route retains infinite total Thorin mass and the absence of moment assumptions, without
first assuming existence of the target law.

The approved proposed modules are `GGC/Thorin/Basic.lean`, `GGC/LaplaceTightness.lean`,
`GGC/Thorin/Approximation.lean`, and `GGC/Thorin/Realization.lean`; they have not yet been
created in this update. Existing `GGC/Thorin.lean` retains upper-level characterization/realization
adapters; the new proof layer must not import it, `External`, `Identification`, or the main
theorem in reverse. B1/B3 compatibility theorems in `External/Bondesson.lean` may import this
independent proof layer, an import-rule adjustment explicitly approved by the Blueprint.

The first prototype should prioritize E2.1 and the discrete logarithmic-kernel interface of E2.2.
The previously discussed 1–2 hour prototype and 8–24 hour total duration are low-confidence
scheduling estimates to revise against actual compilation evidence, not completion guarantees.
During construction, the implementer updates this report and the API table; the designer updates
Blueprint status after acceptance.

Acceptance targets: neither new theorem contains literature axioms; actual project axioms fall
from eight to six; literature dependencies of `ggc_rpow` fall from seven to five: E-J1, E-J2,
E-J3, E-T1, and E-S1. Current counts remain the original eight/seven. Preserve drift, zero mass,
infinite mass, positive shapes/rates, a single approximation sequence, and all-positive-parameter
quantifiers in all existing interfaces; do not weaken general conclusions to finite-mass special cases.

### Two follow-up items from the independent report

[SemanticAudit-2026-09-24.md](SemanticAudit-2026-09-24.md) was read and left unchanged,
preserving its independent maintenance. The report confirms the main theorem's semantics and
distinguishes seven source checks from the still-incomplete original-page evidence for E-S1.

1. **Old-path comments D1: corrected.** `Definitions.lean` now identifies `main.lean` as
   the main theorem's proof location; the original-definition locations in `GGC/Thorin.lean`
   and `GGC/WeakClosure.lean` identified in Section 29 were also corrected to `Definitions`.
   All three changes affect comments only.
2. **E-S1 original-page check S1-SOURCE: the evidence description is complete; original-page
   verification remains pending.** README, the external-input directory description, the
   Blueprint, and comments in `External/SSV.lean` now explicitly record that checks of formulas,
   branches, the anchor, and errata found no error, but images of the specified pages from the
   2010 first edition were not obtained; local `literature/SSV.pdf` is currently missing.
   This must not be described as completed original-page verification for all eight inputs,
   nor does it establish a mathematical error in E-S1.

This pass also checked the [author's book page](https://www.motapa.de/bernstein_functions/),
which distinguishes errata for the 2010/2012 editions but does not supply the required first-edition
body pages; reading the publisher's first-edition page returned HTTP 405. No new evidence of
successful original-page verification was added. Closure still requires obtaining printed
pp.58–60, 63 of the matching edition (historical local PDF pp.71–73, 76), checking the theorems,
branches, and errata, and recording reviewable evidence. This source issue is independent of E2
and cannot be replaced by future B1/B3 formalization.

### Validation of this design update

Changes are limited to design/collaboration documents and comments in four Lean files.
After removing comments and whitespace, code in `Definitions.lean`, `GGC/Thorin.lean`,
`GGC/WeakClosure.lean`, and `External/SSV.lean` matches `HEAD`; definitions, propositions,
proofs, and imports are unchanged. `git diff --check` passed. No full Lean build or axiom audit
was rerun, and the historical 3940 jobs / 883 checks are not counted as fresh validation.
E2 completion still requires the Blueprint's clean build, full direct audit, and independent acceptance.

<a id="source-review-ownership-2026-09-24"></a>
## 31. Local Literature Locations and Source-Verification Responsibilities — 2026-09-24

The user explicitly confirmed: **the implementer supplies missing evidence and performs
self-checks; the designer/independent auditor performs review and acceptance.** This division
is recorded in README's source rules, Blueprint Section 16, and the external-input description.
For S1-SOURCE, the implementer checks the specified edition, printed/PDF page mapping, original
hypotheses and conclusions, complex-logarithm branch, anchor, and errata adaptations, and submits
a path or fingerprint and itemized evidence in this report. The designer/independent auditor
confirms closure after review; the independent audit report remains maintained by the auditor.

This pass checked only file locations and readability, not original-page semantics.
`literature/pdf` was found to be a directory junction to `E:\AI\GitHub\literature\ggcpp`;
default `rg --files` did not traverse it. Running
`rg --files --hidden --no-ignore --follow literature/pdf` listed 14 PDFs, including Bondesson and SSV.

The actual SSV entry is [literature/pdf/SSV.pdf](../literature/pdf/SSV.pdf), with size
1,865,683 bytes and SHA-256
`8A06BBC186F355C3A4475DAB588F65FE41E5E5552794D2C896A41BCA1CD36702`。
This location check updates the earlier "locally missing" observation based on the old path
`literature/SSV.pdf`. The filename and existence alone do not establish that it is the specified
first edition; the implementer should first check the copyright and body page numbering.
The current status is **local file located; construction self-check and independent review
pending**, without claiming edition matching or page-by-page audits of all references.

This update preserves the independent audit report and its historical conclusions and changes
no Lean definitions, propositions, or proofs. E2's formalization scope and acceptance targets are unchanged.

<a id="ssv-source-construction-2026-09-24"></a>
## 32. S1-SOURCE Original-Source Preparation and Construction Self-Check — 2026-09-24

Following Blueprint Section 16 and the user-confirmed division of responsibilities, the
implementer completed original-page preparation and itemized self-checks. Detailed reviewable
materials are in [SSVSourceCheck-2026-09-24.md](SSVSourceCheck-2026-09-24.md).
The title, copyright, full theorem, and official errata pages were actually rendered and inspected;
the assessment was not based only on search snippets. Local `literature/pdf/SSV.pdf` is the
2010 first edition, 328 pages, ISBN 978-3-11-021530-4; SHA256 is
`8A06BBC186F355C3A4475DAB588F65FE41E5E5552794D2C896A41BCA1CD36702`.
Printed pp.58–60, 63 correspond to one-based PDF pp.71–73, 76; title and copyright are PDF pp.4, 5.

The self-check covers the full hypotheses for nonzero Stieltjes transforms, the relationship
between reciprocals and complete Bernstein functions, the principal complex logarithm, anchor 1,
a measurable representative taking values everywhere in [0,1], a.e. uniqueness, and the official
first-edition errata. No missing necessary hypothesis or strengthened conclusion was found in
the current E-S1 adapter contract. Temporary extracted text and page images remain in
`tmp/pdfs/ssv-source-check-2026-09-24/` as local review materials, not new project source files.

Status: **construction self-check complete; independent review and closure await the
designer/auditor's decision**. E-S1 remains a literature axiom; the auditor-owned
`SemanticAudit-2026-09-24.md` was not changed, and acceptance was not signed on the designer's behalf in the Blueprint.

<a id="e2-construction-2026-09-24"></a>
## 33. E2 Local Proofs of Finite Atomic Approximation and Thorin Realization — 2026-09-24

This round follows Blueprint Section 15, preserving the full original GGC definition,
main-theorem quantifiers, and original E-B1/E-B3 interfaces. Both compatibility endpoints have
been changed from `axiom` to `theorem`; the full E-B2 declaration is unchanged. This section
records construction evidence; independent design acceptance remains pending. The Blueprint
and auditor-owned semantic audit report remain read-only. Separate S1-SOURCE preparation and
construction self-checks are recorded in Section 32 and are distinct from E2 formalization.

### Actual modules and interfaces

| Stage | Actual files and key declarations | Construction work |
|---|---|---|
| E2.0 | `GGC/Thorin/Basic.lean`; original public Thorin definitions, integrability, and finite atomic certificates | Extracted from the facade with public names unchanged; depends only on Definitions, Laplace, FiniteGamma, and mathlib |
| E2.0–1 | `GGC/LaplaceTightness.lean`; `isTightMeasureSet_of_laplace_lower_bound` | Moves the three existing tail bounds down while retaining their `GGC.Identification` names; obtains tightness of arbitrarily indexed families from a common Laplace lower bound tending to 1, without moment conditions |
| E2.1 | Same module; `exists_nonnegLaw_subseq_of_isTightMeasureSet`, `exists_nonnegLaw_of_laplace_tendsto` | Prokhorov probability subsequences, nonnegative support, and Laplace identification, without presupposing a realizing law |
| E2.2 | `GGC/Thorin/Approximation.lean`; `roundedRate`, `eventually_mem_window`, `tendsto_integral_kernel` | Truncation with m=n+1, natural-number ceiling, finite range, pointwise convergence, and DCT on the original U |
| E2.2 | `GGC/Thorin/GridMeasure.lean`; `cell_mass_lt_top`, `integral_kernel_eq_sum` | A finite measurable grid; each mass is proved finite before taking toReal; the integral equals the exact finite sum |
| E2.2 | `GGC/Thorin/GridMeasureMap.lean`; `map_restrict_window_roundedRate` | Explicitly proves that rounding the truncated measure by pushforward equals the finite sum of Dirac measures weighted by grid masses; this equality holds for arbitrary U |
| E2.2 | `GGC/Thorin/FiniteWeights.lean`; `exists_finiteGammaLaw_of_nonneg_weights` | Filters zero weights and uses the positive-weight subtype and `Fintype.equivFin` to construct an actual finite Gamma convolution; the same law satisfies the formulas for all parameters |
| E2.2 | `GGC/Thorin/Drift.lean`; `driftGammaExponent_le`, `tendsto_driftGammaExponent` | The Gamma(m,m/a) exponent lies in [0,a*s] and tends to a*s; the factor is omitted when a=0 |
| E2.2 | `GGC/Thorin/Normalization.lean`; `tendsto_thorinLaplace_zero` | Proves right-endpoint transform normalization from admissibility and DCT alone, without E-B1 |
| E2.2 | `GGC/Thorin/Sequence.lean`; `law`, `laplace_law`, `thorinLaplace_le_laplace_law`, `tendsto_laplace_law` | Option(Grid n) combines drift and grid; selects one sequence before quantifying over all s≥0, with the exact transform, common lower bound, and convergence |
| E2.3 | `GGC/Thorin/Realization.lean`; `thorin_realization_core`, `finite_atomic_approximation_core` | Realization via tightness and identification of a given target by Laplace uniqueness; both free of literature axioms |
| E2.3–4 | `External/Bondesson.lean` | Two thin theorem wrappers with the same public names and full primitive types; only E-B2 remains an axiom |

The mathematical sources are the full common construction in Blueprint 15.2 and the Bondesson
source interfaces for E-B1/E-B3; the connection to the overall theorem remains WIP-6.21,
WIP-6.23, and manuscript/sections/06-completion.tex. The implementation splits the originally
proposed single Approximation module for independent validation without narrowing the mathematical contract.

### Reuse, boundary cases, and initial feasibility validation

API-062–066 have progressed from source searches to actual compiled calls. Reused APIs include `Nat.ceil`, `Nat.ceil_le`,
`Nat.ceil_lt_add_one`、`Nat.measurable_ceil`，`integral_finsetSum`、
`Measure.map_apply`、`measure_iUnion`、`tsum_fintype`，
`Fintype.equivFin`、`Fintype.sum_subtype_add_sum_subtype`，
`Real.tendsto_mul_log_one_add_div_atTop`, two dominated-convergence APIs, mathlib's compact-set
criterion for tightness and Prokhorov compactness, and the project's existing Laplace
continuity/uniqueness. No Gamma-addition or additional Gamma-moment infrastructure was introduced.

The initial targets E2.1 and the rounded kernel succeeded, followed by completion of E2.2–3.
Retained targeted logs include `.lake/e2-approximation-build.log` (2828 jobs, new module 8.6s),
`.lake/e2-grid-build.log` (2829 jobs, new module 10s), and `.lake/e2-realization-build.log`
(3494 jobs). These are targeted compilation timings with cached dependencies, not the round's
total duration; Blueprint experiment-time estimates are not used as completion evidence.
All 17 requests in endpoint pre-audit log `.lake/e2-realization-audit.log` passed; both endpoints
and their realization adapters depend only on standard logic, while E-B2 reports only itself.

Boundary checks follow from the general proofs themselves: when U=0 and a=0, all weights
vanish and positive-weight filtering may produce an empty index; when U=0 and a>0, the drift
factor remains. Zero cells are not forced to have positive shapes, and dominated convergence
for arbitrary infinite-total-mass U takes place on the original measure. The existential
selecting the sequence contains all s, so a separate sequence for each s is not mistaken for
a common sequence. Finite approximation requires only the mass of each individual grid to be finite.

### Import, contract, and audit validation

DFS confirms an acyclic import graph for 147 project modules. The local transitive closure
of the ten new E2 modules contains 16 modules, with no imports of External, the `GGC.Thorin`
facade, Identification, PowerClosure, or main (log `.lake/e2-import-audit.log`). The three
original general tail bounds retain their existing public names; `ValueTails` now consumes
the independent tightness layer. `Definitions` remains mathlib-only, and the main theorem's
proof steps are unchanged.

Original E-B1/E-B3 signatures are saved in `.lake/e2-bondesson-before.lean`; source comparison
shows exact equality after ignoring line endings and whitespace, while the E-B2 declaration
is verbatim unchanged. `.lake/e2-contract-types.lean` extracts the full primitive types from
those original declarations and places the new theorems in `#check` expressions at those types,
further checking elaborated type compatibility. Central `AxiomAudit.lean` includes all new
public core declarations and both compatibility endpoints while retaining existing audits.

Final reproduction commands, run in `formalization`:

```powershell
$env:LEAN_NUM_THREADS = '2'
$lake = 'C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe'
& $lake clean ggc_power_closure
& $lake build *> .lake/e2-clean-build.log
& $lake env lean AxiomAudit.lean *> .lake/e2-audit.log
& $lake env lean .lake/e2-contract-types.lean *> .lake/e2-contract-types.log
```

After cleaning the project, `.lake/build` was confirmed absent; dependency caches were retained.
The toolchain remains Lean 4.32.2 and mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`,
with no pin updates.

### Final results and construction verdict

In the order above, project cleaning, the clean build, the subsequent direct central audit,
and original-type compatibility checks all exited with code 0. The clean build completed
**3950 jobs**; comparing source-module names one by one against `Built` log entries confirmed
that **147/147 project Lean modules were recompiled**, with none missing. The interval from
creation to the final write of the build log was **14 minutes 17 seconds**; this measures only
the clean-build stage, excluding earlier implementation, targeted probes, and audits.

Central audit requests and output declarations matched one for one, **957/957** (the original
883 plus 74 this round); neither build nor central audit contains warnings, errors, `sorryAx`,
or `Lean.ofReduceBool`. The full primitive-type check retains all original proof binder names,
so the probe disables only the unusedVariables style check; kernel type checking was not
disabled and assumptions were not changed. The final check also has no warnings.

- `thorin_realization`, `finite_atomic_approximation`, all new independent core declarations, and
  `existsUnique_law_thorinLaplace`、`HasThorinRepresentation.isGGC`、
  `isGGC_diracLaw`: depend only on `propext`, `Classical.choice`, and `Quot.sound`.
- Full Thorin characterization: retains only E-B2 beyond standard logic.
- `GGC.ggc_rpow`: beyond standard logic, depends on exactly
  `GGC.External.James.markov_krein`、`GGC.External.James.posterior_palm_nonneg`、
  `GGC.External.James.beta_atom_posterior`、`GGC.External.Sethuraman.stick_breaking`、
  `GGC.External.SSV.phase_representation`. E-B1, E-B3, and E-B2 are all absent from its dependencies.
- There are exactly six project-wide `axiom` declarations: the five above plus E-B2; all audit
  dependencies are in this whitelist. The original eight literature-source IDs remain for provenance.

After removing comments and whitespace, the main-theorem proof code in `main.lean` matches
the accepted version; only dependency descriptions were updated. All new Lean comments are English.
The Blueprint SHA256 remains
`B7169FE084E4778F9E9020B5994F19080B043CA1E6E918A694C9ABB654C0ABC4`；
The auditor's report remains `4A99E2420CFA168A4A63037F0B5A9B708C0375FB4DFD84F622FAEE89592AF94F`.
`git diff --check` passed. Existing designer changes and local temporary files were not discarded.

**E2.0–E2.4 construction is complete and validated; independent design acceptance is pending.**
This does not mean that the main theorem's remaining five literature inputs have been proved
in Lean; the S1-SOURCE construction self-check also still awaits independent source acceptance.

<a id="e2-design-acceptance-2026-09-24"></a>
## 34. Independent Design Acceptance of E2 and S1-SOURCE — 2026-09-24

**Verdict: E2.0–E2.4 are all accepted and marked `verified`; S1-SOURCE original-page verification
is closed. There are no blocking findings in this submission.** This is the designer's independent
review of the construction submissions in Sections 32–33, not mere reuse of the implementer's
compilation or source conclusions. The distribution version remains the complete delivery,
and RV-1 remains withdrawn. E-B1/E-B3 are now local theorems; the main theorem still holds
relative to five literature axioms.

### 34.1 Contracts, mathematical proofs, and module boundaries

Acceptance covers the current worktree, using the original declarations in committed version
`88b8529a29da851b015d545c2cee3a566b779b7c` as the comparison baseline.
The reviewer independently read `git show HEAD:formalization/External/Bondesson.lean`,
extracted the full primitive types of old E-B1/E-B3, and generated two `example` declarations
in `.lake/e2-design-contracts.lean`, filled directly by the new same-name theorems; compilation
passed. Separate comparison of all three E-B declaration types found no changes after ignoring
comments and whitespace. No quantifiers, integrability conditions, positive-shape or positive-rate
conditions were removed, and no parameters or hidden premises were added.

- Definitions in `Definitions.lean` and proof code in `main.lean` match the baseline;
  `IsGGC` remains the weak limit of actual independent finite Gamma sums, and the main theorem
  retains four explicit steps. The original Thorin definitions, integrability, and finite atomic
  certificate code extracted into `Thorin.Basic` are also unchanged.
- Truncation, upward rounding, finite-cell partitions, and the pushforward-measure equality were
  checked section by section. Each cell's mass is proved finite before taking `toReal`; a
  positive-weight subtype filters zero cells, and `Fintype.equivFin` constructs actual finite
  Gamma laws. Zero weights are not forcibly converted to positive shapes.
- The discrete logarithmic kernel is dominated on the original U by integrable `log(1+s/b)`;
  finite total mass of U is not assumed. The drift factor directly reuses mathlib's
  `Real.tendsto_mul_log_one_add_div_atTop`. The positive-weight index may be empty when U=0,
  a=0; the Gamma drift factor remains when U=0, a>0.
- `Sequence.law` first selects a single sequence of actual finite Gamma laws, then supplies
  exact transforms, a common lower bound, and convergence for all parameters. Normalization
  at zero follows directly from admissibility and dominated convergence without first using
  a realizing law. General Laplace tail bounds give tightness of the whole family without new moment conditions.
- E-B3 supplies both tightness and transform convergence to the existing Laplace continuity
  theorem to identify the given target law; E-B1 first extracts a probability subsequence limit,
  then identifies its nonnegative support and transform for all parameters. The probability
  limit and common subsequence are actually constructed; endpoint proofs are not replaced
  by conditional statements with unconstructed witnesses.
- Independent DFS checked all **147 project modules** and found no import cycles. The local
  transitive closure of the ten new E2 modules contains exactly **16 modules**, excluding
  External, the `GGC.Thorin` facade, Identification, PowerClosure, and main. `Definitions`
  continues to import only mathlib. The three general tail bounds retain their names after
  moving down; upper-level `ValueTails` uses the new independent layer.

The implementer's split of the planned `Thorin/Approximation` into seven modules—Approximation,
GridMeasure, GridMeasureMap, FiniteWeights, Drift, Normalization, and Sequence—is accepted.
This only reorganizes proofs of the same contract. Shared entries API-062–066 are upgraded to
`accepted`, recording actual module ownership and reuse evidence. Available mathlib interfaces
for general rounding, dominated convergence, Prokhorov, and logarithmic limits were reused
rather than reproved.

### 34.2 Independent clean build and direct audit

The working directory is `formalization`. The toolchain was independently verified as Lean
4.32.2; mathlib remains pinned to `905b95818eb32af7874a58b427f50c1711a5e96c`, with a clean
source worktree. The independent execution order is below; logs are stored separately from
the implementer's Section 33 logs:

```powershell
$env:LEAN_NUM_THREADS = '2'
$taskLake = 'C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe'
& $taskLake env lean --version
& $taskLake clean ggc_power_closure *> .lake/e2-design-clean.log
& $taskLake build *> .lake/e2-design-build.log
& $taskLake env lean AxiomAudit.lean *> .lake/e2-design-audit.log
& $taskLake env lean .lake/e2-design-contracts.lean *> .lake/e2-design-contracts.log
```

Before cleaning, the absolute `.lake/build` path was checked to lie within this project and
not be a reparse point; successful cleaning was followed by confirmation that the directory
was absent, with dependency caches retained. Cleaning, build, direct audit, and original-type
probes all exited with code **0**.

| Check | Independent acceptance result |
|---|---|
| Default clean build | **3950 jobs** succeeded; source-module names matched `Built` log entries one by one, confirming recompilation of **147/147** project modules |
| Build duration | Local time 20:20:32–20:33:49, **13 minutes 17 seconds**; only this clean-build stage, not total formalization effort |
| Direct central audit after build | 20:34:10–20:34:22, approximately 12 seconds; all **957/957** requests matched output declarations by name and multiplicity |
| Original-type compatibility check | Completed by 20:34:34, approximately 11 seconds; both old full types are satisfied directly by the new same-name endpoints |
| New public-declaration coverage | All public definitions/theorems in the ten new modules are in the central audit; all **74 added checks** have only standard logical dependencies |
| Diagnostics and trust exceptions | No warnings or errors in the build, direct audit, or type probes; no `sorryAx`, `Lean.ofReduceBool`, or unregistered axioms |
| Source stability | SHA256 values of all 147 source modules were compared after build and audit and match those at the start of acceptance |

Static checks and summaries are also saved in `.lake/e2-design-static.json` and
`.lake/e2-design-results.json`; start/end times are in `.lake/e2-design-build-timing.json`
and `.lake/e2-design-audit-timing.json`. Logs in these ignored directories are local review
evidence; this section preserves commands and results for lasting reference.

Dependency conclusions were checked by **declaration name**, not just by counts:

| Declaration/scope | Literature-axiom dependencies |
|---|---|
| E-B1 `thorin_realization`, E-B3 `finite_atomic_approximation`, and both core endpoints | None; only `propext`, `Classical.choice`, and `Quot.sound` |
| All new core declarations; `existsUnique_law_thorinLaplace`, `HasThorinRepresentation.isGGC`, `isGGC_diracLaw` | None; a subset of standard logic |
| `isGGC_iff_hasThorinRepresentation` | Only E-B2 `GGC.External.Bondesson.weak_closure` |
| `GGC.ggc_rpow` | Exactly the following five, plus the three standard logical axioms |

```text
GGC.External.James.markov_krein
GGC.External.James.posterior_palm_nonneg
GGC.External.James.beta_atom_posterior
GGC.External.Sethuraman.stick_breaking
GGC.External.SSV.phase_representation
```

Project-wide `axiom` declarations and mathematical axioms appearing in the audit are exactly
the five above plus E-B2, **six in total**; no substitute axiom was added. E-B2 is absent from
the main theorem's dependencies; the eight source IDs remain for provenance.

### 34.3 S1-SOURCE independent original-page review

Rather than relying only on the construction report or old screenshots, the designer rendered
and inspected title, copyright, definition, and theorem pages anew from the same local PDF,
and inspected the first two pages of the local official first-edition errata.

- Original book: [literature/pdf/SSV.pdf](../literature/pdf/SSV.pdf), whose directory junction
  resolves to `E:\AI\GitHub\literature\ggcpp\SSV.pdf`; independently verified as **1,865,683 bytes,
  328 pages**. SHA256 is `8A06BBC186F355C3A4475DAB588F65FE41E5E5552794D2C896A41BCA1CD36702`.
- Title/copyright on PDF pages 4 and 5 match the authors, year 2010, and ISBN `978-3-11-021530-4`;
  the first errata page explicitly identifies the first edition and the same ISBN, dated **2022-12-01**.
- Actual page mapping: Definition 2.1, printed p.11 / PDF p.24; Theorem 6.10 and its proof,
  printed pp.58–59 / PDF pp.71–72; Remark 6.11, printed p.60 / PDF p.73; Theorem 7.3,
  printed p.63 / PDF p.76. All these pages were inspected as complete images.
- Local errata copy: `tmp/pdfs/ssv-source-check-2026-09-24/misprints-ssv.pdf`, SHA256
  `8B1A84D42F825BA4F6DC4EADF6C1EDEC9703D386E1F53ECA912A003328EB4A7C`;
  source: the author's [official first-edition errata](https://www.motapa.de/bernstein_functions/misprints-ssv.pdf).
  Newly rendered book/errata images are saved in ignored directory `tmp/pdfs/e2-design-source-review/`.

The local adaptation in `External.SSV.phase_representation` was reviewed item by item:
a probability measure on positive rates gives a nonzero Stieltjes transform; taking its
reciprocal under 7.3 gives a nonzero CBF, then 6.10, the negative logarithm, and subtraction
of the value at s=1 yield the real anchored formula with the correct sign. In the upper half-plane,
the original transform has strictly negative imaginary part, so converting the reciprocal's
principal logarithm introduces no extra 2πi term. The anchored kernel is bounded at zero and
decays quadratically at infinity, requiring neither inverse moments nor anchoring at zero.
A Borel version of the measurable phase is chosen and modified on a null set to stay in [0,1].
Any candidate phase satisfying `RealPhase` recovers the constant and representation in 6.10,
so the original uniqueness theorem gives precisely the claimed a.e. uniqueness on the positive
half-line, not uniqueness only under a stronger complex-representation condition.

The errata corrections to the intermediate Herglotz measure's domain and finiteness, and the
replacement of equality by inclusion in Remark 6.11, agree with the code descriptions.
No incorrect reverse inclusion, zero-anchor formula, or additional inverse-moment condition
was used. **S1-SOURCE therefore passes and is closed**; this is literature-source acceptance,
and E-S1 remains an explicit axiom.

The auditor-maintained `SemanticAudit-2026-09-24.md` was not modified; its SHA256 remains
`4A99E2420CFA168A4A63037F0B5A9B708C0375FB4DFD84F622FAEE89592AF94F`。
Its original-page access gap is retained as a historical record and resolved by this section's
independent acceptance.

### 34.4 Status synchronization and scope of changes

The designer updated the Blueprint's current status, module table, and Sections 15–17, the
formalization README, external-input inventory, shared MathlibAPI table, and root README's
acceptance entry; the SSV self-check materials gained an independent-acceptance link.
E1's D1 path-comment issue is closed. This pass also corrected old comments in the Thorin
facade/Basic that still called E-B1/E-B3 external assumptions, the local Bondesson PDF path,
and SSV source-verification status.

These Lean changes are English comments only; post-acceptance code comparison confirms that
all definitions, declarations, and proofs still match the version validated by this clean build.
No proofs, external interfaces, toolchain pins, independent audit report, or manuscript were
changed, and no other implementer or preexisting worktree changes were overwritten.
Final `git diff --check`, documentation-link checks, and current-status consistency checks passed.
Historical build counts, seven/eight-axiom records, and earlier submissions awaiting acceptance
are retained as history.

With E2 closed, no deliverables remain outstanding for this round; the main theorem's five
remaining literature axioms and E-B2 for the separate characterization remain explicitly in
the trust boundary. This acceptance must not be described as eliminating all mathematical
axioms from the project.

<a id="unused-axiom-cleanup-2026-09-24"></a>
## 35. E2-P Unused External Axiom Cleanup and Validation — 2026-09-24

**User instruction: remove unused external axioms, then design another dependency-reduction round.**
The designer completed this cleanup within the main theorem's required scope; this retires
additional interfaces rather than formalizing E-B2. E2-P passed validation and is marked
`verified`. The next round, E3, remains a design proposal; see Section 36 and Blueprint Section 19.

### Removed items and retained interfaces

Reference searches across all project Lean sources were cross-checked against Section 34's
full axiom output: E-B2 is not a dependency of `GGC.ggc_rpow`. Its sole proof consumer is
`GGC.IsGGC.hasThorinRepresentation`, used only to assemble
`GGC.isGGC_iff_hasThorinRepresentation`; neither has other production proof consumers.

This round removes:

1. The `GGC.External.Bondesson.weak_closure` axiom and its declaration documentation in `External/Bondesson.lean`.
2. The forward interface and bidirectional characterization above in `GGC/Thorin.lean`.
3. Corresponding type/declaration/axiom print requests in `AxiomAudit.lean`, retaining and explicitly checking
   `HasThorinRepresentation.isGGC`。
4. Authorization for the fallback E-B4 axiom in the current whitelist and design contract.
   This fallback never had a Lean declaration; it is now withdrawn and cannot be reintroduced
   on the basis of historical text.

The original GGC definition, full main theorem, all main-proof consumers, same-type local
E-B1/E-B3 theorems, `HasThorinRepresentation.isGGC`, unique realization, and constant-law
membership are retained. The full bidirectional characterization is no longer a deliverable;
weak closure of the original definition is still proved locally in `GGC.WeakClosure`.
Historical source audits and M1/E2 acceptance records are preserved so that results that once
used E-B2 are not rewritten as unconditional proofs. Removed axioms were not moved into
unimported project files or hidden premises.

### Build, axiom, and source checks

Run in `formalization` with the original pinned toolchain:

```powershell
$env:LEAN_NUM_THREADS = '2'
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
$taskLake = 'C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe'
& $taskLake build *> .lake/e3-prune-build.log
& $taskLake env lean AxiomAudit.lean *> .lake/e3-prune-audit.log
```

Both commands exited with code **0**. This is an **incremental build** of the default target;
dependencies were not cleaned again, and no clean recompilation of the entire tree is claimed.

| Item | Validation result |
|---|---|
| Default build | **3950 jobs** succeeded; **72 of 147 project modules recompiled**, with valid caches reused for the rest |
| Build time | 21:26:41–21:35:57, approximately **9 minutes 16 seconds**; build stage only, not design or formalization effort |
| Subsequent direct audit | 21:35:57–21:36:12, approximately 15 seconds; requests and output matched by declaration name and multiplicity, **954/954** |
| Count change | Removing 3 checks for the retired axiom and two helper theorems reduces the old 957 axiom checks to 954; all other checks remain |
| Diagnostics and dependencies | No compilation/audit warnings, errors, `sorryAx`, `Lean.ofReduceBool`, or new axioms; the project's literature-axiom set equals the main theorem's |
| Source | Only the 3 Lean files above differ from the pre-cleanup snapshot; after removing the specified declarations, all retained definition/proof code matches. `Definitions.lean` and `main.lean` are verbatim unchanged |
| Imports | DFS confirms no cycles across all 147 project modules; no imports were added |

Scanning actual `axiom` declarations after removing comments and comparing them with the full
audit's transitive dependency set gives exactly the same set:

```text
GGC.External.James.markov_krein
GGC.External.James.posterior_palm_nonneg
GGC.External.James.beta_atom_posterior
GGC.External.Sethuraman.stick_breaking
GGC.External.SSV.phase_representation
```

Thus the project-wide axiom count falls **6→5**, while the main theorem retains the same
**5 axioms**, with no additional unused axioms. E-B1/E-B3, the retained direction from Thorin
representation to GGC, unique realization, and constant-law membership still depend only
on standard logic. Original E-B2 and the retired theorems no longer appear in the audit.
Timing and check summaries are in `.lake/e3-prune-timing.json` and `.lake/e3-prune-results.json`;
the pre-cleanup source snapshot is `.lake/e3-prune-before.json`. All are local evidence in ignored directories.

README, the external inventory, current Blueprint interfaces/milestones, and shared API-067
are synchronized to verified status. The former forward characterization result is distinct
from weak closure of the original GGC definition, and documentation explains them separately.
Toolchain and mathlib pins are unchanged; the auditor's report was not edited, and its SHA256 remains
`4A99E2420CFA168A4A63037F0B5A9B708C0375FB4DFD84F622FAEE89592AF94F`。
Final `git diff --check` and new file-link/anchor checks passed; existing worktree changes were preserved.

<a id="e3-reduction-design-2026-09-24"></a>
## 36. E3 Design for the Next Axiom-Reduction Round — 2026-09-24

**Role: designer; status: `planned`, construction not yet started.** This round performed
parallel read-only assessments of J3's finite-dimensional route, T1's stick-recursion route,
and J1/J2/S1 dependencies and library interfaces, followed by another cross-review of the final
plan. New candidates have source-inspection evidence only, with no new Lean proof or compiled
minimal call. Full mathematical contracts, candidate modules, and acceptance gates are in
[Blueprint Section 19](Blueprint.md#e3-james-reduction-plan); shared reuse entries API-068–074 were added.

Recommended order:

| Stage | Main deliverable | External axiom count after completion and acceptance |
|---|---|---:|
| E3.0 | Full product-law equality for the ratio and sum of two independent Gamma variables | 5 |
| E3.1 | Finite Gamma vectors allowing zero-shape coordinates: independence of the normalized vector and total | 5 |
| E3.2 | A single-coordinate finite Dirichlet update, then a proof of E-J3 preserving its full original type | 4: J1/J2/T1/S1 |
| E3.3 | Bounded Markov–Krein formula, migration of the original consumer, and retirement of the general E-J1 interface | 3: J2/T1/S1 |

The shared foundation must give the actual joint law; proving only Gamma addition or a Beta
marginal and then assuming independence is insufficient. Reuse existing `gammaShapeLaw`,
`dirichletLaw`, actual product/map semantics, zero-coordinate and simplex lemmas. For the
two-dimensional change of variables, first try Tonelli, existing shear transformations, and
one-dimensional scaling; a general Jacobian is the fallback. Pinned mathlib's Gamma/Beta
files provide densities and normalization, but this search found no ready-made theorem matching
the full Beta–Gamma joint decomposition; this conclusion is limited to the search scope.

E-J3 retains its original Polish/Borel base space, arbitrary original D and Z, and arbitrary
added-atom location b. For every finite partition, use the shared foundation to prove an
increase of shape by 1 in one coordinate, including an originally zero-mass cell. No separate
uniqueness theorem for DP laws on random measures or Gamma process is needed.

The only production reference to `External.James.markov_krein` is `GGC.dirichletMean_laplace`
in module `GGC.GammaDirichlet`: it uses only the second conclusion, with test function
`g(b)=t/(s+b)` and bound `0≤g(b)≤t/s`. Proving a bounded version next therefore better matches
the current main theorem's needs. Finite simple functions are handled by the Gamma/Dirichlet
joint law; then use `SimpleFunc.approxOn`, `approxOn_mem`, and `tendsto_approxOn` for approximants
valued in `[0,C]`, applying bounded dominated convergence on P, D, and U with bounds C, 1,
and `log(1+C)`, respectively. Monotone approximation is not required. This needs neither J2's
posterior kernel nor joint cylinder-set extension and covers t=0, C=0, and zero-mass partition cells.

The scope choice is explicit: retain the full type of `dirichletMean_laplace` and prove its
test-function bound locally; prove bounded Markov–Krein under a new name. After replacing the
consumer and passing the audit, delete the original full E-J1 axiom. Almost-sure finiteness of
the random mean and the unbounded extension in the general log-integrable version **are not
formalized** and must be recorded as retired, rather than silently narrowing the original name's
type or claiming a same-type replacement. The main theorem's scope is unchanged.

Further candidates remain:

- J2: finite-dimensional Dirichlet size-bias plus joint-measure extension on generating cylinder
  sets. The original K and all nonnegative test functions must retain their full scope.
- T1: finite-dimensional weighted-update invariance, finite stick prefixes, and an independent
  Dirichlet tail. Original hSum and probability conditions already give total weight one;
  `hasSum_stickWeight_iff` yields vanishing residuals. Do not additionally require a Polish
  base space or redo the existing stronger common event.
- S1: disk Poisson theory and the available `WeakDual.isSeqCompact_closedBall` are candidate
  foundations, but do not directly provide the half-plane phase representation. Complex logarithms,
  support/bounded density, anchored integration, and real-representation uniqueness still need a full design.

No candidate is marked `minimal_use_compiled` this round. The first construction acceptance
gate is E3.0's full two-dimensional product-law equality; after it passes, refine effort estimates
and module divisions using actual evidence. Each stage must audit to standard logic, and the
new independent foundation layer must not import External, GammaDirichlet consumers, Palm,
or DirichletRealization in reverse. The import exception for James theorem wrappers is recorded
in both the Blueprint and external rules; it permits neither new axioms nor cycles.

<a id="e3-zero-design-handoff-2026-09-24"></a>
## 37. E3.0 Designer Handoff and Reproducible API Probes — 2026-09-24

**Role: designer; status: handoff refined, E3.0 still `planned`.** The user
explicitly selected continued design work and refinement of the E3.0
construction delivery. No full Beta-Gamma proof or production-module change
was made in this refinement. The five-axiom production baseline remains E2-P.

[Blueprint Section 20](Blueprint.md#e3-zero-construction-handoff) now supplies
the exact primitive measure contract, proposed owner/name, support and inverse
domains, BG-0–4 proof cards, density identity, selected transformation route,
submission package and independent acceptance gates. A separate read-only
review checked the contract, endpoint pitfalls and compatibility with E3.1.
The Blueprint and new handoff material are in English.

The selected route is volume-preserving shear, Tonelli and one-dimensional
positive scaling. It avoids a new two-dimensional determinant calculation.
`ProbabilityTheory.beta` is definitionally the required Gamma quotient, so its
normalizing factor does not require another complex beta-integral proof.
Source inspection and actual calls corrected the earlier candidate spelling:
the product-density theorem is **`MeasureTheory.prod_withDensity`**, not
`MeasureTheory.Measure.prod_withDensity`. The one-dimensional substitution is
`MeasureTheory.lintegral_image_eq_lintegral_abs_deriv_mul` in
`Mathlib.MeasureTheory.Function.JacobianOneDim`.

Initial experiments were confined to ignored `.lake/e3-design-*` files.
The product-density experiment initially failed on that namespace; the
scaling experiment initially used the wrong side of multiplication's
injectivity lemma. Both were corrected before retaining successful evidence.
The final source is `Checks/E3BetaGammaReuse.lean` (historical file, retired in Section 48),
with no placeholder proof. This durable file satisfies the reuse rule requiring
an important adopted design probe to have a version-controlled home and an
explicit command; it is outside the default production build globs.

| Probe declaration in namespace `E3BetaGammaReuse` | Evidence actually supplied |
|---|---|
| `BetaGammaProductLaw` | Definition of a `Prop` elaborating the complete positive-shape joint-law contract; no proof of that proposition |
| `measurable_ratio_sum_call` | Actual `fun_prop` proof for the total ratio/sum map |
| `gamma_prod_density_call` | Actual `prod_withDensity` application to the two unit-rate Gamma laws |
| `shear_call` | Actual measure-preserving call for `(x,y) ↦ (x,x+y)` |
| `inverse_shear_call` | Actual change of nonnegative integral under `(x,s) ↦ (x,s-x)` |
| `interval_scale_call` | Actual one-dimensional Jacobian application on `(0,1) ↦ (0,s)`, for every `s>0`, with factor s |
| `normalizing_constant_call` | Actual cancellation of the Beta/Gamma normalizing constants using the existing definition |

The final combined probe was run from `formalization`:

```powershell
$env:LEAN_NUM_THREADS = '2'
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
$taskLake = 'C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe'
& $taskLake env lean Checks/E3BetaGammaReuse.lean *> .lake/e3-design-reuse.log
```

It exited **0** at 22:24:56 +08:00, after approximately **12 seconds** for this
single final compiler invocation; this is not the total design/construction
effort. Pin: Lean **4.32.2**, mathlib
**`905b95818eb32af7874a58b427f50c1711a5e96c`**. All **6/6** named proof declarations
printed exactly `[propext, Classical.choice, Quot.sound]`; the final run had no
warnings, errors, `sorryAx` or `Lean.ofReduceBool`. Logs and timing metadata are
`.lake/e3-design-reuse.log` and `.lake/e3-design-reuse-timing.json`.

API-068 is upgraded only for these specific compiled calls. The support and
boundary arguments, complete density factorization and assembled joint-law
equality remain unproved. Extensionality/Tonelli assembly candidates retain
source-only evidence; API-069–074 are not upgraded by this probe. E3.0 acceptance
requires the complete product-law proof and its own production build/audit,
not merely this successful API experiment. No external axiom is removed at E3.0.

README navigation and the shared API index now point to the concrete handoff.
The independent semantic audit was not edited; its SHA256 remains
`4A99E2420CFA168A4A63037F0B5A9B708C0375FB4DFD84F622FAEE89592AF94F`.
This designer-only change did not rerun the full production build or direct
project audit. Their latest accepted results remain Section 35's incremental
3950-job build and 954/954 direct checks. The new probe is separately validated
by the command above and adds no production import or audit count.

<a id="e3-zero-construction-2026-09-24"></a>
## 38. E3.0 Beta-Gamma Joint-Law Construction — 2026-09-24

**Construction submission: the complete E3.0 joint law is implemented;
independent design acceptance is pending.** This implements Blueprint Section
20's first delivery. The Blueprint remains read-only, and E3.1–3 are not claimed
complete. The five current literature axioms and the main theorem's scope are
unchanged. No James declaration or existing semantic definition was modified.

### Production contract and completed proof cards

The new default-build module is
[GGC/Foundations/BetaGamma.lean](GGC/Foundations/BetaGamma.lean). Its public
endpoint has exactly the proposed name and primitive type:

```lean
theorem GGC.BetaGamma.gamma_ratio_sum_map
    (a b : ℝ) (ha : 0 < a) (hb : 0 < b) :
    Measure.map
      (fun p : ℝ × ℝ => (p.1 / (p.1 + p.2), p.1 + p.2))
      ((ProbabilityTheory.gammaMeasure a 1).prod
        (ProbabilityTheory.gammaMeasure b 1)) =
      (ProbabilityTheory.betaMeasure a b).prod
        (ProbabilityTheory.gammaMeasure (a + b) 1)
```

This is an equality of actual measures, including joint independence, for
arbitrary positive real shapes. Shapes below one are allowed; there are no
moment, compact-support, integer-shape or additional integrability premises.
The rate is one. The total map's zero-denominator convention is harmless
because the input denominator is proved strictly positive almost everywhere.

| Card | Production evidence |
|---|---|
| BG-0 | `measurable_ratio_sum` proves measurability of the total map. |
| BG-1 | `gamma_ae_pos` adapts existing `RandomMeasure.gammaShapeLaw_pos`; `gamma_prod_ae_pos` proves positivity of both coordinates and their sum. `ratio_sum_mem`, `ratio_sum_inverse`, and `inverse_ratio_sum` give the open-domain geometry. `gamma_eq_open_density` removes the null zero boundary, and `beta_eq_open_density` gives the exact open Beta support. |
| BG-2 | `normalizing_constant` uses the existing definition of `beta`; `density_factorization` proves the full ENNReal identity on the open target domain, including the explicit factor `ENNReal.ofReal s`. All real powers use positive bases without assuming nonnegative exponents. |
| BG-3 | `lintegral_interval_scale` invokes the one-dimensional Jacobian API for arbitrary nonnegative functions. `lintegral_quadrant` combines the inverse shear, measurable indicators, Tonelli, the empty interval for nonpositive totals, and positive scaling. No integrability premise is added. |
| BG-4 | `gamma_ratio_sum_map` expands both actual product densities, applies the quadrant transformation and density identity, and uses `Measure.ext_of_lintegral`. The conclusion is a measure equality on the whole product space. |

The new module contains 13 public theorems, all registered in `AxiomAudit.lean`.
The existing Lake `GGC.+` glob already covers it. API-068 records actual compiled
uses; API-069–074 retain their previous evidence levels. The tracked design
probe remains as historical evidence, with its adopted calls covered by the
production proofs. No generic multidimensional Jacobian infrastructure was
introduced, and existing Gamma positivity is reused instead of reproved.

### Type compatibility, imports, and targeted validation

[Checks/E3BetaGammaContract.lean](Checks/E3BetaGammaContract.lean) supplies an
independent `example` at the complete primitive Blueprint type using the
production theorem, then prints its axioms. Like the retained design probe,
it is outside the production globs and must be run explicitly.

The targeted `lake build GGC.Foundations.BetaGamma` succeeded with **2826 jobs**;
the new module's reported compilation time was **8.7 seconds**. This is one
cached-dependency compilation, not total construction effort. The first
independent contract invocation also exited 0 and reported only `propext`,
`Classical.choice`, and `Quot.sound`. Logs are `.lake/e3-zero-target-build.log`
and `.lake/e3-zero-contract.log`.

The project has 148 production Lean modules (excluding the two explicit Checks
files). A DFS of all local imports is acyclic. The new module's complete local
closure consists of itself and `GGC.Foundations.RandomMeasure`; there is no
path to External, upper GammaDirichlet, DirichletRealization, Palm, PowerClosure,
or main. The static result is saved in `.lake/e3-zero-static.json`.

### Reproducible full validation

Run from `formalization` using the pinned toolchain:

```powershell
$env:LEAN_NUM_THREADS = '2'
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
$taskLake = 'C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe'
& $taskLake clean ggc_power_closure *> .lake/e3-zero-clean.log
& $taskLake build *> .lake/e3-zero-clean-build.log
& $taskLake env lean AxiomAudit.lean *> .lake/e3-zero-audit.log
& $taskLake env lean Checks/E3BetaGammaContract.lean *> .lake/e3-zero-contract-final.log
```

Commands run sequentially, advancing only after success. Before cleaning, the
resolved `.lake/build` path was verified to be this project's build directory
and not a reparse point; after cleaning, its absence was checked. Pinned
dependency caches are retained: this is a clean recompilation of project
sources, not a from-scratch mathlib build. `LEAN_NUM_THREADS` affects only the
command process. Lean remains 4.32.2 and mathlib remains
`905b95818eb32af7874a58b427f50c1711a5e96c`, with a clean dependency checkout.

### Final results and handoff

Cleaning, the default clean build, the subsequent direct central audit, and
the final primitive-type check all exited **0**, in that order.

| Check | Actual result |
|---|---|
| Default clean build | **3951 jobs** succeeded; source module names matched fresh `Built` records for **148/148** production modules |
| Build duration | Local time 22:54:27–23:17:27 (+08:00), **23 minutes**; this measures only the clean-build stage, not total construction effort |
| Direct full audit | **967/967** requests matched output declarations by name and multiplicity: the prior 954 plus 13 new public theorems |
| New proof dependencies | All **13/13** new theorems have only `propext`, `Classical.choice`, and `Quot.sound` |
| Original-type compatibility | The separate tracked check compiled successfully after the clean build and full audit, with the complete original positive-real-shape contract |
| Diagnostics | No warnings, errors, `sorryAx`, or `Lean.ofReduceBool` in the final build, direct audit, or contract-check logs |
| Source stability | All 148 production source hashes match the pre-clean snapshot; no source was changed while validation ran |

The actual mathematical axiom declarations and the main theorem's transitive
literature dependencies remain exactly:

```text
GGC.External.James.markov_krein
GGC.External.James.posterior_palm_nonneg
GGC.External.James.beta_atom_posterior
GGC.External.Sethuraman.stick_breaking
GGC.External.SSV.phase_representation
```

No new axiom, hidden hypothesis, or substitute literature input was introduced.
The original GGC definitions, existing E2 proofs, main-theorem proof and its
scope are unchanged. The Blueprint SHA256 remains
`F2EE348C62CC1DB8DECE9C1A83AC242047D5EAD24EEC20A15C71503A1B84530D`.
Preexisting worktree changes, including designer documentation, were preserved.
The independent semantic audit report was not edited.

Timing and itemized verification are saved in `.lake/e3-zero-timing.json` and
`.lake/e3-zero-results.json`; the source snapshot is
`.lake/e3-zero-source-before.json`. These ignored local artifacts support the
reproducible commands, counts, and results recorded here. Final whitespace and
relative-file-link checks passed.

**BG-0–4 are complete and validated; E3.0 is submitted for independent design
acceptance.** There is no remaining E3.0 proof gap. Only the designer may mark
the Blueprint stage `verified`. Per Section 20.4, E3.1 starts after that
acceptance, with explicit zero-shape and single-positive-coordinate branches;
this positive-shape theorem must not be invoked at shape zero. E3.1–3 and further
literature-axiom reductions remain outside this completed delivery. No
commit or push was performed in this round.


<a id="e3-zero-design-acceptance-2026-09-24"></a>
## 39. Independent E3.0 Acceptance and Thorin Interface Migration Design — 2026-09-24

**Decision: E3.0 accepted (`verified`); Tidy-Thorin migration `planned`.**
The designer reviewed the complete submitted proof against Blueprint Section 20,
not only the constructor's summary or the earlier API probes. No blocking
mathematical or proof-dependency finding remains. E3.1-3 are not accepted by
this review, and the five literature axioms remain unchanged.

### Mathematical and structural review

The endpoint is the exact primitive measure equality for arbitrary positive
real shapes and unit rate. Its product conclusion proves joint independence;
there is no extra integer-shape, moment or integrability hypothesis. The
Gamma-to-open-density identity uses a.e. positivity, avoiding a false pointwise
claim at zero. The Beta density is restricted to its actual open support.
The density calculation permits negative shape-minus-one exponents, and the
quadrant integral proof explicitly handles nonpositive totals by empty intervals.
The complete proof assembles shear, Tonelli and positive scaling before measure
extensionality. The existing Gamma positivity result is reused correctly.

The local import graph is acyclic. The new theorem module's local closure is
exactly `GGC.Foundations.BetaGamma` and `GGC.Foundations.RandomMeasure`, with no
External or upper-consumer back-edge. All 13 new public theorems are audited.
The original-type check actually applies the production theorem at the full
Blueprint type. `Definitions.lean`, `main.lean`, existing production proofs and
unrelated human-check files were not edited during this review.

### Independent validation and provenance

The reviewer independently recomputed source hashes and matched all **148/148**
production files to `.lake/e3-zero-source-before.json`. All **148/148** source
module names also match fresh `Built` records in the submitted **3951-job**
project clean-build log. Thus the submitted clean build applies to the exact
current production source tree. Pinned dependency caches were retained in that
construction build, as Section 38 records.

The reviewer then ran these commands sequentially, advancing only after success:

```powershell
$env:LEAN_NUM_THREADS = '2'
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
$taskLake = 'C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe'
& $taskLake build *> .lake/e3-zero-design-build.log
& $taskLake env lean AxiomAudit.lean *> .lake/e3-zero-design-audit.log
& $taskLake env lean Checks/E3BetaGammaContract.lean *> .lake/e3-zero-design-contract.log
```

All exited **0**. The fresh default build passed **3951 jobs**. This reviewer
build was **incremental**, not another clean rebuild; independent clean-build
verification above refers to the submitted log and matching source snapshot.
The new direct audit matched **967/967** requested declarations by name and
multiplicity, including axiom-free outputs. All **13/13** new theorems contain
only `propext`, `Classical.choice` and `Quot.sound`. The complete primitive-type
check again compiled and printed only these standard logical axioms.
No warning, error, `sorryAx` or `Lean.ofReduceBool` appears in these final logs.

The main theorem's transitive literature dependencies are exactly J1/J2/J3/T1/S1,
matching the five current external declarations. Import closure, source hashes,
build module names and audit outputs were checked by
`.lake/e3-zero-design-verify.py`; results are saved in
`.lake/e3-zero-design-results.json`. The semantic auditor's report remains
unchanged (SHA256 `4A99E2420CFA168A4A63037F0B5A9B708C0375FB4DFD84F622FAEE89592AF94F`).

The shared API index had two nonblocking documentation inconsistencies: its
introductory paragraph still described the joint law as unproved, and a
four-column detailed API-068 row had been inserted into the two-column acceptance
table. Both are corrected; the missing planned API-069-071 summary is restored.
Blueprint Section 20 and API-068 now record acceptance, with the original
probe history retained separately from production proof evidence.

### User-requested structural migration handoff

[Blueprint Section 21](Blueprint.md#thorin-interface-migration) schedules moving
the two locally proved Bondesson interfaces to `GGC/Thorin/Interfaces.lean`, as
`GGC.thorin_realization` and `GGC.finite_atomic_approximation`. Their full primitive
types, existing core proofs and source provenance must be preserved. Redirect
the Thorin facade, audits and current documentation, then delete the External
file without leaving forwarding modules or old-namespace aliases. Existing
higher-level endpoint names/types remain unchanged.

This explicitly supersedes the historical requirement to preserve the old
External wrapper names. API-075 records the migration and its same-type checks,
acyclic imports, clean-build/audit and five-axiom preservation gates. No production
migration was performed in this designer acceptance; `External/Bondesson.lean`
remains until that separately reviewable construction is submitted. E3.1 may
proceed from the accepted E3.0 foundation, with its zero-shape branches intact.


<a id="checks-governance-2026-09-25"></a>
## 40. User-Approved Checks Governance — 2026-09-25

The user approved the proposed rules for designer, constructor and independent
reviewer checks. The project README now adopts [Checks/README.md](Checks/README.md)
as the operational policy; the Blueprint and shared API index link to it.
The policy covers durable versus temporary experiments, English ownership/scope
headers, explicit commands, the prohibition on production imports and placeholder
proofs/new axioms, role-specific verification, independent-review ownership,
and retirement with replacement evidence and preserved history.

The existing files were classified without changing their Lean statements or
proofs. `E3BetaGammaContract.lean` remains active, created by the constructor and
independently rerun by the designer; its heading no longer implies independent
reviewer authorship. `E3BetaGammaReuse.lean` is marked historical and superseded
by the production module. It is retained to reproduce Section 37's experiment
but is not a routine submission requirement; later deletion should update its
historical evidence links. Neither file is owned by an independent reviewer.
No user human-check file or independent-audit artifact was modified.

This change updates policy, documentation and Lean header comments only. No
production code, Lake target, mathematical contract or axiom boundary changed.
No new Lean build or proof acceptance is claimed; E3.0's prior acceptance remains
Section 39. The directory inventory records current purpose, ownership and
lifecycle status for both checks.

<a id="tidy-thorin-construction-2026-09-25"></a>
## 41. Tidy-Thorin Interface Migration — 2026-09-25

**Construction submission: the structural migration in Blueprint Section 21
is implemented; independent design acceptance is pending.** This relocates
already proved interfaces, without changing mathematics or removing any of
the five remaining literature axioms. E3.0 remains accepted; E3.1 is a separate
mathematical delivery and is not claimed by this migration.

### Interfaces and consumers

| Former public name | New public name and owner |
|---|---|
| `GGC.External.Bondesson.thorin_realization` | `GGC.thorin_realization` in `GGC/Thorin/Interfaces.lean` |
| `GGC.External.Bondesson.finite_atomic_approximation` | `GGC.finite_atomic_approximation` in the same module |

The new module imports only `GGC.Thorin.Realization`. Comparing its full text
with the saved pre-migration file confirms that only the opening and closing
namespace change: primitive types, binder order, calls to the unchanged cores,
English documentation and precise Bondesson provenance are verbatim preserved.
E-B1/E-B3 remain historical source IDs, not mathematical assumptions.

`GGC/Thorin.lean` imports the new module and redirects its two calls. The full
names and types of `HasThorinRepresentation.isGGC`, `isGGC_diracLaw`,
`exists_law_thorinLaplace`, and `existsUnique_law_thorinLaplace` remain unchanged.
`AxiomAudit.lean` replaces the import and the two printed/axiom-audited names,
without adding or removing audit requests. `External/Bondesson.lean` is deleted;
there is no empty file, forwarding import, or old-name alias. A project Lean
source search finds no remaining reference to the old module or namespace.
Historical prose and source-review records retain the old names as history.

[Checks/ThorinInterfacesContract.lean](Checks/ThorinInterfacesContract.lean)
contains constructor-authored `example` checks against both complete primitive types,
extracted from the saved original declarations before moving them. Each example
is filled by its new public theorem, and both axiom lists are printed. The
explicit check is outside the default production globs; it is durable source,
not a temporary replacement for the central audit.

API-075 records actual compiled reuse of the existing cores. Current README
links, declaration inventory, commands and the obsolete Bondesson-specific
External import exception were updated. The read-only Blueprint and the
independent semantic audit report were not edited. The remaining James,
Sethuraman and SSV source modules were not changed.

### Targeted and static validation

`lake build GGC.Thorin.Interfaces GGC.Thorin` passed with **3494 jobs**.
The reported interface/facade compilation times were **42 seconds** and
**9.6 seconds**, respectively; these are module compiler times, not total
migration effort. Log: `.lake/tidy-thorin-target.log`.
The first explicit `lake env lean Checks/ThorinInterfacesContract.lean` run
exited 0, and both wrappers printed only `propext`, `Classical.choice`, and
`Quot.sound`; log `.lake/tidy-thorin-contract.log`.

The one-for-one module migration leaves **148 production modules** under the
actual Lake roots/globs. `ForHumanCheck.lean` and explicit Checks files are not
counted as production modules. DFS finds no import cycle. The local transitive
closure of `GGC.Thorin.Realization` contains neither `GGC.Thorin.Interfaces`,
the `GGC.Thorin` facade, nor any External module. Static evidence is saved in
`.lake/tidy-thorin-static.json`.

### Full validation commands

Run sequentially from `formalization`, advancing only after each command succeeds:

```powershell
$env:LEAN_NUM_THREADS = '2'
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
$taskLake = 'C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe'
& $taskLake clean ggc_power_closure *> .lake/tidy-thorin-clean.log
& $taskLake build *> .lake/tidy-thorin-clean-build.log
& $taskLake env lean AxiomAudit.lean *> .lake/tidy-thorin-audit.log
& $taskLake env lean Checks/ThorinInterfacesContract.lean *> .lake/tidy-thorin-contract-final.log
```

Before cleaning, the resolved `.lake/build` path was checked to be the intended
project directory and not a reparse point. Its absence was checked after clean.
Pinned dependency caches are retained; the clean build recompiles project
sources without claiming a from-scratch mathlib build. The thread setting is
local to the command process. The shell's script-file execution policy was not
changed; validation commands were executed directly. Logs and timing metadata
remain in ignored `.lake`, with reproducible results recorded below.

### Final validation results and submission

All four validation commands exited **0**, in order. The complete clean build
passed **3951 jobs**, with fresh `Built` records matched by module name for
**148/148** production modules, including `GGC.Thorin.Interfaces`. The old
External module is absent from both the source tree and production build.
The direct central audit matched **967/967** requests by declaration name and
multiplicity. These counts were recomputed, not copied from the E3.0 baseline.
The final standalone primitive-type check also passed for both new names.

The clean-build stage ran from **00:12:28 to 00:42:34 (+08:00)** on 2026-09-25,
approximately **30 minutes 6 seconds**; this measures validation only. The direct
audit finished at 00:42:50 and the type check at 00:43:04. Timing metadata is
`.lake/tidy-thorin-timing.json`; itemized results are
`.lake/tidy-thorin-results.json`.

The wrappers `thorin_realization` and `finite_atomic_approximation`, their two
unchanged `_core` theorems, and `HasThorinRepresentation.isGGC`, `isGGC_diracLaw`,
`exists_law_thorinLaplace`, and `existsUnique_law_thorinLaplace` all audit to
standard logical axioms only. Project-wide mathematical declarations and the
main theorem's literature dependency set still coincide exactly:

```text
GGC.External.James.markov_krein
GGC.External.James.posterior_palm_nonneg
GGC.External.James.beta_atom_posterior
GGC.External.Sethuraman.stick_breaking
GGC.External.SSV.phase_representation
```

All final build/audit/type-check logs contain no warning, error, `sorryAx`, or
`Lean.ofReduceBool`. After validation, every production source hash matches
the pre-clean snapshot. The protected-file comparison also confirms that
`Definitions.lean`, `main.lean`, the full `BetaGamma.lean` proof,
`ForHumanCheck.lean`, the Blueprint and the independent semantic audit report
are unchanged. `HumanCheck.lean` was not present on disk at the start and was
not created. Existing unrelated worktree changes were preserved.

Current README/API/External file links and `git diff --check` pass. The Blueprint's
original migration table and dated historical reports still mention the old
location by design; no production Lean reference to the old module or namespace
remains. No proof was weakened, no local interface was discarded, and no
mathematical axiom was removed or introduced. No commit or push was performed.

**Tidy-Thorin construction and validation are complete, submitted for independent
design acceptance.** The designer controls the Blueprint's `verified` status.
E3.1 remains the next distinct mathematical delivery rather than a result of
this structural migration.

The new contract check follows the user-approved Checks governance: its header
states constructor authorship, shared maintenance, API-075, scope/exclusions,
explicit pinned-toolchain command, lifecycle status and evidence location.
`Checks/README.md` registers it as active; it is not an independent-reviewer-owned
artifact. The existing governance record is Section 40; this migration is
Section 41. Header-only clarification after validation leaves both check
statements and proof terms unchanged; the explicit check was rerun afterward.
The post-header rerun exited 0 and again printed only the three standard logical
axioms for both wrappers; log `.lake/tidy-thorin-contract-header.log`. This
comments-only check update did not require another production build.


<a id="tidy-thorin-design-acceptance-2026-09-25"></a>
## 42. Independent Tidy-Thorin Design Acceptance — 2026-09-25

**Decision: `verified`; no blocking finding.** This accepts the structural
migration in Blueprint Section 21, not E3.1. The designer inspected the source,
full primitive contracts, changed callers and audit entries, then independently
validated the submitted evidence and reran the current checks.

The saved original `Bondesson.original.lean` matches the old module's hash in
the previously accepted E3.0 snapshot. Replacing only its opening and closing
namespace produces the new `GGC/Thorin/Interfaces.lean` text exactly. Types,
binder order, proof calls and provenance are preserved. Comparing the whole
production tree with that accepted snapshot finds only the one-for-one module
move and the specified facade/audit changes. No old External file, forwarding
module, alias or production reference remains. The graph is acyclic; the local
closure of `Thorin.Realization` contains no interface/facade or External module.

The reviewer independently matched all **148/148** production source hashes to
the constructor's pre-clean snapshot and all module names to fresh `Built`
records in the submitted **3951-job** clean-build log. Protected-file hashes,
including main, Definitions, BetaGamma, the user human-check file and the semantic
audit, matched before the designer updated the Blueprint. Then the reviewer ran:

```powershell
$env:LEAN_NUM_THREADS = '2'
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
$taskLake = 'C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe'
& $taskLake build *> .lake/tidy-thorin-design-build.log
& $taskLake env lean AxiomAudit.lean *> .lake/tidy-thorin-design-audit.log
& $taskLake env lean Checks/ThorinInterfacesContract.lean *> .lake/tidy-thorin-design-contract.log
```

Commands ran sequentially, advancing only on success, and all exited **0**.
The fresh default build passed **3951 jobs**; this was an **incremental** reviewer
build, not a second clean rebuild. Independent verification of the submitted
clean build is based on its matching current source hashes and module records.
The new direct audit matches **967/967** requests by name and multiplicity.
Both wrappers, both unchanged cores and the four retained high-level Thorin
endpoints use only `propext`, `Classical.choice` and `Quot.sound`. Both complete
original-type checks compile and print that same logical-axiom set. No warning,
error, `sorryAx` or `Lean.ofReduceBool` appears in the final logs. The five
literature dependencies of the main theorem remain exactly J1/J2/J3/T1/S1.

The independent static/evidence checks are reproducible in
`.lake/tidy-thorin-design-verify.py`, with results in
`.lake/tidy-thorin-design-results.json`. Production source remained unchanged
throughout this review. The contract check's header was subsequently updated
to link this acceptance; its statements and proof terms were not changed.
Its creator remains the constructor, with shared maintenance; this review does
not assign it to an independent auditor or claim a separate auditor sign-off.

Blueprint Section 21 and API-075 now record acceptance. Current README,
External inventory and Checks inventory are synchronized. The old file link in
the Blueprint's current module table was replaced. Two current summaries in
the root README/API index had regressed E3.0 to pending acceptance; they were
corrected to its existing Section 39 acceptance. Dated historical records remain
unchanged. This documentation correction does not reopen E3.0 or alter its proof.
E3.1 remains the next planned mathematical delivery, including zero-shape and
single-positive-coordinate cases. No axiom reduction is attributed to this
structural migration.

<a id="e3-one-two-construction-2026-09-25"></a>
## 43. E3.1/E3.2 Finite Gamma Laws and Full Beta Atom Posterior — 2026-09-25

**Construction scope:** Blueprint Section 19.2-19.3, API-069/070. The constructor
read the current Blueprint without editing it. E3.0 and Tidy-Thorin acceptance
are retained. E3.3, the Palm identity, stick-breaking and SSV representation
are not claimed as completed. Independent design acceptance of this submission
is pending; only the designer updates Blueprint milestone status.

### Mathematical implementation

[GGC/Foundations/GammaDirichlet.lean](GGC/Foundations/GammaDirichlet.lean) proves
`gammaVector_normalize_sum` for every finite nonnegative shape vector, using
the existing `gammaShapeLaw` and the original actual `dirichletLaw` pushforward.
Its target is the product of the normalized-vector law and the Gamma law of
the total shape. The all-zero extension uses Dirac zero. The positive-real-total
corollary `gammaVector_normalize_sum_of_pos` has exactly Gamma(B,1) as its
second marginal. `dirichletLaw_single_positive` explicitly identifies every
single-positive-coordinate case with the deterministic simplex vertex.

The induction splits a finite product with mathlib's
`measurePreserving_piFinSuccAbove`, composes product maps, associates and swaps
factors, and applies the accepted Beta-Gamma joint law. The first marginal
identifies the existing Dirichlet law rather than defining a replacement.
`gammaShape_ratio_sum` handles both zero-shape faces separately; no invocation
of a positive-shape Gamma/Beta theorem uses a zero shape. Its second marginal
also supplies `gammaShape_sum`, including zero input shapes.

[GGC/Foundations/DirichletUpdate.lean](GGC/Foundations/DirichletUpdate.lean) first
proves that adding an independent shape-one Gamma at arbitrary coordinate j
increments exactly that shape. It uses the same finite-product split at j
and the proved Gamma addition law. Normalization then gives
`dirichlet_coordinate_update`, the actual distributional identity for
`(1-Z)Q + Z e_j`, with no positivity assumption on a_j.

For an arbitrary finite measurable partition, the proof locates the unique
cell containing b, identifies its incremented shape and evaluates the actual
atom mixture. It transports the given D and Z through `Measure.map_prod_map`
and their stated marginals. `RandomMeasure.beta_atom_posterior` therefore
supports every original D, arbitrary UnitWeight law Z satisfying hZ, and every
b. Its lower-layer proof requires only a measurable base space; it assumes no
Dirichlet-process uniqueness theorem, Gamma process, sampler identification,
nonatomicity or positive cell mass.

`External.James.beta_atom_posterior` is now a thin theorem over this independent
proof. The original entire parameter/conclusion text is unchanged, and the
original Polish/Borel topology binders are explicitly exercised by the contract
check. The narrowly scoped unused-section-variable linter option preserves
these public binders even though the stronger lower theorem does not need them.
The two remaining James axioms and their types are unchanged.

### Reuse, ownership and static evidence

There are **25 new production declarations: 21 theorems and four definitions**.
The audit adds each name once. The existing E-J3 audit entry now checks its
proof rather than an assumption. Mathlib reuse includes finite-product
splitting, product preservation/composition, associators, swaps, marginals,
product pushforwards, finite partition mass additivity and ENNReal conversions.
Existing zero-coordinate and simplex lemmas are reused for the deterministic
case. The new modules contain no `sorry`, axiom or `native_decide`.

[Checks/E3GammaDirichletContract.lean](Checks/E3GammaDirichletContract.lean) is
constructor-authored with shared designer-constructor maintenance, registered
in the Checks inventory. It is outside default production globs and is not an
independent-reviewer-owned artifact. It checks the full positive-total joint
law, all-zero extension, arbitrary-dimensional single-positive-coordinate law,
empty-vector exclusion, zero selected shape and the exact original E-J3 type.
The seven endpoint axiom lists are compared against standard logic only.

The static verifier `.lake/e3-one-two-verify.py` compares source hashes,
original J3 text, import closures, axiom inventory and audit names. Its initial
result `.lake/e3-one-two-static.json` confirms 150 production sources, 992 audit
requests, unchanged protected files and exactly four actual mathematical axioms.
Compared with the accepted Tidy-Thorin source snapshot, the only changed old
production sources are `External/James.lean` and `AxiomAudit.lean`; the two new
foundation modules account for the increase from 148 to 150 modules.
Both new lower closures contain only RandomMeasure, Posterior, BetaGamma and
the new foundations, with no External or upper consumer import.

### Validation

An initial clean-build attempt found a syntax error in the placement of the
local linter option before the E-J3 declaration. It had been inserted between
the documentation comment and theorem. Moving it before the documentation
comment fixes the parser error; a direct compile of the final wrapper exits 0
without warnings (`.lake/e3-one-two-james-final.log`). The failed attempt is
preserved in `.lake/e3-one-two-clean-build-attempt1.log` and is not acceptance
evidence. No mathematical proof or contract changed in this correction.

**Final validation passes.** The project build directory was resolved and checked
to remain inside this workspace, and `lake clean ggc_power_closure` removed it
before the successful build. Mathlib/dependency caches were retained; this is
a clean rebuild of project sources, not a fresh mathlib rebuild.

Commands ran from `formalization`, sequentially, advancing only on success:

```powershell
$env:LEAN_NUM_THREADS = '2'
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
$taskLake = 'C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe'
& $taskLake clean ggc_power_closure
& $taskLake build *> .lake/e3-one-two-clean-build.log
& $taskLake env lean AxiomAudit.lean *> .lake/e3-one-two-audit.log
& $taskLake env lean Checks/E3GammaDirichletContract.lean *> .lake/e3-one-two-contract.log
& $taskLake env lean Checks/E3BetaGammaContract.lean *> .lake/e3-one-two-betagamma-contract.log
& $taskLake env lean Checks/ThorinInterfacesContract.lean *> .lake/e3-one-two-thorin-contract.log
```

| Final check | Result |
|---|---|
| Project-only clean default build | Exit 0; **3953 jobs**, **150/150** production modules matched to fresh `Built` records. |
| Subsequent direct full audit | Exit 0; **992/992** requests matched by declaration name and multiplicity. |
| New declarations plus existing E-J3 wrapper | **26/26** use only `propext`, `Classical.choice` and `Quot.sound` (or a subset). |
| E3.1/E3.2 complete contracts | Exit 0; all cases compile, **7/7** endpoint axiom lists contain standard logic only. |
| Accepted Beta-Gamma and Thorin interface checks | Both exit 0; all three endpoint lists contain standard logic only. |
| Main theorem boundary | Exactly four literature axioms; its type and proof source are unchanged. |
| Source and protected-file snapshots | **150/150** production hashes and all **8** protected hashes match the final pre-clean snapshot; all three check-file hashes also match. |

Every final validation log contains no warning, error, `sorryAx` or
`Lean.ofReduceBool`. All 992 audited declarations stay within standard logic
plus the following four actual mathematical axioms, which are also exactly the
literature dependencies of `GGC.ggc_rpow`:

```text
GGC.External.James.markov_krein
GGC.External.James.posterior_palm_nonneg
GGC.External.Sethuraman.stick_breaking
GGC.External.SSV.phase_representation
```

`.lake/e3-one-two-results.json` records the full source/module/audit comparison;
`.lake/e3-one-two-build-result.json` and `.lake/e3-one-two-check-results.json`
record command exit statuses. The verifier runs from the repository root with
`C:/Users/vtejd/AppData/Roaming/uv/python/cpython-3.14.7-windows-x86_64-none/python.exe formalization/.lake/e3-one-two-verify.py --full`.
The pinned dependency remains clean at mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`, with Lean `v4.32.2`.

The Blueprint, Definitions, main proof, accepted BetaGamma proof, shared
RandomMeasure/Posterior semantics, user `ForHumanCheck.lean` and independent
semantic audit are unchanged. Existing unrelated worktree changes are
preserved. Current README/API/External/Checks file links and `git diff --check`
pass. No commit or push was performed.

**E3.1/E3.2 construction and validation are complete, submitted for independent
design acceptance.** E3.3 remains separate work. The Blueprint was not edited.


<a id="e3-one-two-design-acceptance-2026-09-25"></a>
## 44. Independent E3.1/E3.2 Design Acceptance — 2026-09-25

**Decision: E3.1 and E3.2 `verified`; no blocking finding.** This review accepts
both complete mathematical deliveries. E3.3 remains planned. E-J3 changes from
an external axiom to a locally proved theorem at its full original type; the
project-wide and main-theorem literature dependency sets decrease from five
to four, exactly J1/J2/T1/S1.

### Proof and contract review

The designer read both complete new modules and the James wrapper. The finite
Gamma induction uses the actual product measure and existing normalization,
then identifies the existing Dirichlet marginal. It explicitly branches on
zero shapes before invoking positive-shape Beta-Gamma. The all-zero and empty
vector conventions agree with the original definitions, and the arbitrary
single-positive-coordinate law is a deterministic vertex. The positive-total
corollary has the exact primitive Gamma(B,1) factor, not a replacement law or
an independence premise.

The coordinate update adds an independent shape-one Gamma at arbitrary j;
its previous shape may be zero. The posterior proof identifies the unique cell
containing b in each finite partition, proves the mass/shape identities, and
transports arbitrary supplied D and Z using their exact marginals. There is no
new positivity-of-every-cell, sampler, nonatomicity, Gamma-process or DP-law
uniqueness premise. The lower theorem only needs a measurable base space.
The public wrapper preserves the original Polish/Borel binders; the explicit
`@` application in the contract check verifies their presence and order.
The local linter setting affects unused-section-variable diagnostics, not the
proof kernel or axiom boundary.

The saved original James source matches its hash in the previously accepted
Tidy-Thorin snapshot. The complete original E-J3 parameter/conclusion text
matches the new theorem, and both remaining James axioms are textually unchanged.
Across production sources, only James and the central audit changed, alongside
the two added foundation modules. The import graph is acyclic. Their lower
closures contain only RandomMeasure, Posterior, BetaGamma and the new modules;
no External, upper consumer or Checks import enters them.

### Independent verification

The reviewer checked the constructor's verification script and reran its
source, contract, graph and audit comparisons using a review copy directed to
fresh audit/contract logs. All **150/150** current production source hashes
match the pre-clean snapshot; all **150/150** module names match fresh `Built`
records in the successful **3953-job** construction clean-build log. All eight
protected files and three check files also matched before the designer updated
the Blueprint. The failed initial construction attempt is excluded from this
evidence. Lean is 4.32.2; the clean mathlib checkout remains pinned at
`905b95818eb32af7874a58b427f50c1711a5e96c`.

The reviewer independently ran, from `formalization`, sequentially on success:

```powershell
$env:LEAN_NUM_THREADS = '2'
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
$taskLake = 'C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe'
& $taskLake build *> .lake/e3-one-two-design-build.log
& $taskLake env lean AxiomAudit.lean *> .lake/e3-one-two-design-audit.log
& $taskLake env lean Checks/E3GammaDirichletContract.lean *> .lake/e3-one-two-design-contract.log
```

All exited **0**. The default build passed **3953 jobs**. This was an incremental
reviewer build; the clean-build claim above refers to independently verified
construction evidence, not a second clean rebuild. The fresh direct audit
matched **992/992** requests by name and multiplicity, including declarations
with no axioms. All **25** new declarations (21 theorems and four definitions)
and the existing E-J3 wrapper, **26/26**, use only standard logical axioms or a
subset. All audited declarations stay within standard logic plus the four
registered literature axioms, and the main theorem uses exactly those four.
The fresh complete contract check compiled every example and printed **7/7**
standard-logic-only endpoint lists, including the original E-J3 interface and
zero-selected-shape case. No warnings, errors, `sorryAx` or `Lean.ofReduceBool`
appear in these final logs.

Evidence: `.lake/e3-one-two-design-verify.py` and
`.lake/e3-one-two-design-results.json`, alongside the fresh logs above. The
review copy preserves pre-review protected-file hash checks; after this
acceptance edits the Blueprint, those original protected hashes intentionally
refer to the pre-review snapshot. Production source and check proof files were
not modified by the designer. The user human-check file and independent
semantic audit remain untouched. This is designer acceptance, not a claim
that an independent auditor has separately signed off.

### Status synchronization and next delivery

Blueprint Section 22, API-069/070, current README/External summaries and the
Checks inventory now record acceptance. The current Blueprint trust boundary
and milestones were updated to four assumptions; dated prior snapshots keep
their historical counts. E3.0 and Tidy-Thorin remain accepted.

E3.3 is next under Blueprint Section 19.4: prove the bounded Markov-Krein
formula, preserve the complete `GGC.dirichletMean_laplace` consumer type, then
retire the unused general E-J1 declaration after validation. This acceptance
neither proves that general unbounded statement nor removes J2/T1/S1. No commit
or push was performed in this review.

<a id="e3-three-construction-2026-09-25"></a>
## 45. E3.3 bounded Markov-Krein construction (2026-09-25)

Constructor delivery under Blueprint Section 19.4. E3.1/E3.2 were independently
accepted in Section 44. This section records construction and verification;
independent acceptance of E3.3 remains pending. The Blueprint is unchanged.

### Production scope and proof

`GGC/Foundations/MarkovKreinFinite.lean` proves the finite Dirichlet transform,
the finite measurable-partition formula and the simple-function Markov-Krein
identity. It reuses the accepted normalized-Gamma-vector/total product law and
the existing scalar Gamma Laplace theorem `GGC.laplace_gammaLaw_eq_exp`.
The independent product transform uses mathlib's finite product integral;
partition integrals use finite sums of measurable indicators. Zero Gamma shapes
use the existing Dirac law and are allowed in every finite partition.

`GGC/Foundations/MarkovKrein.lean` proves
`GGC.RandomMeasure.markov_krein_of_bounded` for arbitrary base measure U and
Dirichlet-process law D with positive total mass B, and measurable g satisfying
0 <= g <= C for a finite real C. It also supplies measurability of the probability
mean and its real power, and integrability of bounded g for every probability
measure. No topological structure on the base space is required.

The proof uses `SimpleFunc.approxOn` with range `[0,C]` and pointwise convergence.
It does not assume these approximations are monotone. Three dominated-convergence
arguments use bounds C for the mean under each probability P, 1 for the negative
power under D, and log(1+C) for the logarithmic integral under U. The hypotheses
imply C >= 0; C=0 is included without a strict upper-bound assumption.
Continuity is applied only where 1+g and 1+mean are positive.

The original complete type of `GGC.dirichletMean_laplace` is preserved. Its
integrand g(b)=t/(s+b) satisfies the required bound t/s using the existing t>=0
and s>0 hypotheses, so the boundedness obligation stays inside the proof.
`GGC.tiltedLaw_eq_gammaDirichlet` retains its proof body and now also audits to
standard logic only. The unused general `External.James.markov_krein` axiom and
its audit requests have been removed. This does not prove the former general
unbounded/log-integrable statement, nor rename the narrower theorem as that
interface. E-J2 and the accepted E-J3 theorem are preserved verbatim.

The two new modules introduce 14 theorems and no new axioms. Their transitive
project import closures contain neither External modules nor the upper
GammaDirichlet, DirichletRealization, Palm, PowerClosure or main modules. The
project import graph is acyclic, and no production module imports Checks.

### Durable checks and evidence boundary

`Checks/E3MarkovKreinContract.lean` is constructor-owned and registered in the
Checks inventory. It checks the generic bounded statement, mean measurability
and integrability, C=0, a zero selected Gamma shape, the unchanged full consumer
type and t=0. Its seven endpoint axiom lists must use standard logic only.
The accepted Gamma-Dirichlet, Beta-Gamma and Thorin contract checks are rerun.
These are construction checks, not independently authored acceptance evidence.

### Final verification

Pinned Lean is v4.32.2; mathlib remains
`905b95818eb32af7874a58b427f50c1711a5e96c`, verified against the checkout.
From `formalization`, with `LEAN_NUM_THREADS=2`, the executable was
`C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe`.
The executed commands were:

```text
lake clean ggc_power_closure
lake build
lake env lean AxiomAudit.lean
lake env lean Checks/E3MarkovKreinContract.lean
lake env lean Checks/E3GammaDirichletContract.lean
lake env lean Checks/E3BetaGammaContract.lean
lake env lean Checks/ThorinInterfacesContract.lean
```

All exited **0**. The project build directory was absent after cleaning;
dependency caches were retained. The clean default build passed **3955 jobs**,
with **152/152 project source modules freshly built**. This is a project clean
build, not a clean rebuild of the mathlib dependency. The subsequent direct
audit matched **1005/1005 requests by name and multiplicity**, including
declarations with no axioms. All 14 new theorems and the two existing
identification consumers, **16/16**, use standard logic only. All four contract
files passed; the new check printed **7/7** standard-logic-only endpoint lists.
None of these final logs contains warnings, errors, `sorryAx` or
`Lean.ofReduceBool`.

The complete audit remains within `propext`, `Classical.choice`, `Quot.sound`
and the three retained literature axioms. Both the source declaration inventory
and `GGC.ggc_rpow` have exactly these three literature dependencies:

- `GGC.External.James.posterior_palm_nonneg` (E-J2).
- `GGC.External.Sethuraman.stick_breaking` (E-T1).
- `GGC.External.SSV.phase_representation` (E-S1).

Machine-readable comparison is in `.lake/e3-three-results.json`, generated by
`.lake/e3-three-verify.py --full`. It compares all 152 production source hashes
with the pre-clean snapshot, all four active check files, and ten protected
files with their pre-construction hashes. Protected files include the Blueprint,
Definitions, main, accepted E3.0/E3.1/E3.2 proof files, shared random-measure
semantics, the user's ForHumanCheck file and the independent semantic audit.
The only changed existing production files in this delivery are AxiomAudit,
External/James and the upper GGC/GammaDirichlet; the two MarkovKrein modules are
new. The unchanged consumer type and verbatim E-J2/E-J3 suffix are also checked.

Raw evidence remains in the ignored `.lake` directory:
`e3-three-clean.log`, `e3-three-clean-build.log`, `e3-three-build-result.json`,
`e3-three-audit.log`, `e3-three-contract.log`, `e3-three-dirichlet-contract.log`,
`e3-three-betagamma-contract.log`, `e3-three-thorin-contract.log` and
`e3-three-check-results.json`. Source/protected/check snapshots have the
`e3-three-*-before.json` names. These logs support this construction record;
they are not independent acceptance artifacts.

Current README, External inventory, Checks inventory and API-071/GAP-005 now
record E3.3 construction and the reduced trust boundary. Historical acceptance
records retain their original counts. The Blueprint remains read-only to this
delivery. Independent design acceptance is pending. No commit or push was
performed.


<a id="e3-three-design-acceptance-2026-09-25"></a>
## 46. Independent E3.3 Design Acceptance — 2026-09-25

**Decision: E3.3 `verified`; no blocking finding.** E3.0-3 are now accepted at
their specified contracts. The bounded Markov-Krein theorem is proved locally;
the unused general unbounded/log-integrable E-J1 interface is retired, not
claimed fully formalized. Both the actual axiom inventory and the main theorem
now contain exactly J2, T1 and S1 beyond standard logic.

### Mathematical and interface review

The designer read both complete new modules, the changed consumer and the
retained James declarations. The finite transform uses the actual normalized
Gamma joint law, scalar Laplace formula and finite-product integration. The
product integrand's integrability is established by a bound of one before
Fubini; zero shapes use Dirac zero. Measurable finite fiber partitions supply
the simple-function statement without requiring positive mass in each cell.

The bounded extension uses `SimpleFunc.approxOn` in [0,C], pointwise convergence
and three dominated-convergence arguments. Their bounds are C under each
probability P, 1 under D and log(1+C) under U. The positive base mass supplies
nonemptiness to infer C>=0; C=0 is allowed. Power/log continuity is used only
at positive arguments. The probability mean and its power are measurably
parameterized, and bounded tests are integrable for every finite measure.
No monotonicity or extra moment hypothesis is introduced.

`GGC.dirichletMean_laplace` has exactly the prior complete type. Its proof now
discharges the bound t/s for g(b)=t/(s+b) using the existing hypotheses t>=0
and s>0, including t=0. The full type and proof suffix of
`GGC.tiltedLaw_eq_gammaDirichlet` are unchanged. E-J2 and the E-J3 theorem suffix
are preserved verbatim. The old general J1 declaration and audit request are
absent; no same-name narrower replacement or hidden assumption is introduced.

The saved pre-construction baseline and the original consumer/James files
match the independently accepted E3.1/E3.2 snapshot. Only AxiomAudit, James and
the upper GammaDirichlet changed among existing production files, with two new
foundation modules. Their lower import closures contain no External, excluded
upper consumer or Checks module, and the complete graph is acyclic.

### Independent verification and evidence limits

After inspecting the constructor's verification script, the reviewer used a
review copy directed to fresh audit and contract logs and added comparisons
against the previously accepted baseline. All **152/152** current production
hashes match the pre-clean snapshot and all **152/152** module names match
fresh `Built` records in the submitted **3955-job** clean-build log. Ten
protected files and four active check files matched before the Blueprint was
updated for acceptance.

From `formalization`, the reviewer ran sequentially, advancing only on success:

```powershell
$env:LEAN_NUM_THREADS = '2'
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
$taskLake = 'C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe'
& $taskLake build *> .lake/e3-three-design-build.log
& $taskLake env lean AxiomAudit.lean *> .lake/e3-three-design-audit.log
& $taskLake env lean Checks/E3MarkovKreinContract.lean *> .lake/e3-three-design-contract.log
```

All commands exited **0**. The fresh default build passed **3955 jobs**; it was
incremental, not a second independent clean rebuild. The clean-build claim
above refers to independently verified construction evidence and matching
current sources. The fresh direct audit matched **1005/1005** requests by name
and multiplicity, including axiom-free declarations. All 14 new theorems and
both existing consumers, **16/16**, use standard logic only. The full audit
stays within standard logic plus the three registered literature axioms; the
main theorem uses exactly those three. The new contract check passed all its
examples and printed **7/7** standard-logic-only endpoint lists. Final logs
contain no warning, error, `sorryAx` or `Lean.ofReduceBool`.

The review also checked the submitted passing logs of the three earlier contract
files; it does not claim those were freshly rerun by the reviewer. Evidence is
in `.lake/e3-three-design-verify.py`, `.lake/e3-three-design-results.json` and
the fresh logs above. Protected Blueprint hashes refer to the pre-review state;
this acceptance intentionally updates that document. No production source or
check proof was edited. User human-check and independent-audit files are
untouched. This is designer acceptance, not a separate auditor sign-off.

### Current status

Blueprint Section 23, API-071, current README/External summaries and the Checks
inventory now record acceptance. Historical reports preserve earlier counts.
The main theorem and its mathematical scope are unchanged. The completed E3
round reduces its literature dependencies from five to three through a full
E-J3 proof and the bounded replacement/retirement of E-J1. General unbounded
J1 is outside the completed scope. J2/T1/S1 remain separate follow-on work;
no further completed stage or automatic axiom reduction is implied. No commit
or push was performed.


<a id="audit-r2-design-handoff-2026-09-25"></a>
## 47. Second-Round Audit Response and External-Interface Lifecycle — 2026-09-25

**Designer delivery: rules updated; correction/migration `planned`.** The user
requested review of the new independent report, Blueprint-controlled comment
corrections before construction, and a general rule moving formalized external
axioms into suitable project theorem modules.

The designer read the complete [second-round report](SemanticAudit-2026-09-25.md)
and checked its R2-01 location against current `main.lean`. The report passes
within its stated scope relative to J2/T1/S1, with one low-priority open finding:
the main theorem docstring still lists five inputs including J1 and J3. Its
previous proof-location issue is corrected; its SSV original-page gap is now
independently closed by the auditor. These are the report's conclusions; this
turn did not repeat the auditor's source-page review or Lean validation.

[Blueprint Section 24](Blueprint.md#audit-r2-and-j3-relocation) supplies the exact
replacement comment, unchanged type/proof requirements and a separate designer
closure gate. R2-01 is still open pending the submitted correction. Both audit
reports remain unmodified, as does the auditor-owned temporary contract probe.
The current report's SHA256 is
`5851AB64077BD30E0CEEC855E6B36DA52271586A8CFD5F550035209D190F4CA2`.

The new [README lifecycle rule](README.md#external-interface-lifecycle) requires
proved external public interfaces and compatibility wrappers to leave both
External and its namespace. Future formalization deliveries must include
relocation; older accepted mathematics retains its acceptance while outstanding
structure is scheduled. Still-unproved axioms remain in External. No forwarding
alias/file is retained, no provenance is deleted, and proof dependency status
must come from the actual audit rather than the folder name. Trust-boundary
comments must be synchronized whenever the dependency set changes. This
supersedes the former Bondesson/James wrapper exceptions.

The immediate migration is the original full E-J3 interface to
`GGC.beta_atom_posterior` in new `GGC/DirichletPosterior.lean`, reusing the accepted
stronger lower theorem. Source search identifies direct callers in upper
GammaDirichlet and DirichletRealization, plus the central audit and shared
E3GammaDirichlet check. Palm currently receives James through GammaDirichlet;
it must gain an explicit James import for its genuine E-J2 use. James must
remain for E-J2 with independent semantic imports after its E-J3 wrapper moves.
The full primitive/topology contract and the E-J2 declaration must be preserved.
API-076 records this handoff and its type, import, build and dependency gates.

No production Lean source, check proof, user human-check file or independent
review artifact was edited. Current caller locations remain accurate until
construction. This turn changes design/rules/documentation only, with no new
build, proof acceptance or axiom reduction claimed. The expected three-axiom
boundary is unchanged; historical source/proof records remain as history.

<a id="r2-j3-closeout-2026-09-25"></a>
## 48. R2-01 correction, E-J3 relocation and Checks closeout (2026-09-25)

Constructor submission under Blueprint Section 24 and API-076, following the
user's request to finish closeout and remove unnecessary Lean checks. E3.0–3
remain accepted mathematics. This delivery corrects documentation and module
ownership; it neither proves another external axiom nor reduces the trust
boundary. Independent design acceptance of this structural delivery is pending.

### Change-to-contract map

| Change | Preserved contract and evidence |
|---|---|
| `main.lean` R2-01 correction | The two sentences now use the exact Blueprint wording: three registered literature axioms E-J2/E-T1/E-S1. A full-text comparison permits only that replacement; the theorem type, proof body and all four readable steps are unchanged. |
| New `GGC/DirichletPosterior.lean` | Owns `GGC.beta_atom_posterior`. The old wrapper's complete declaration, original variable/topology binders, source docstring, narrowly scoped linter setting and one-line lower proof call are preserved after namespace normalization. No lower proof is duplicated. |
| `External/James.lean` | Retains the exact E-J2 declaration and source provenance. Imports `Foundations.Posterior` and the needed Polish topology module explicitly. Removes the proved E-J3 wrapper, obsolete Beta/proof imports and associated current-location prose. There is no old-name alias or forwarding module. |
| GammaDirichlet and DirichletRealization | Directly import the new interface and call its public name. All consumer theorem types remain unchanged; Sethuraman remains explicitly imported where needed. |
| Palm | Explicitly imports James for the unchanged E-J2 call; its mathematical proof is unchanged. |
| AxiomAudit | Imports the new module and replaces both the full print and axiom-check name. The lower theorem and E-J2 checks remain. |
| Shared E3GammaDirichletContract | Uses the new module and explicit `@GGC.beta_atom_posterior` application with all original topology binders. Maintenance reason and current evidence are recorded in the header. All seven endpoint checks remain. |

Source comparison, import closure and graph checks are implemented in
`.lake/close-verify.py`. The new public interface reaches only independent
RandomMeasure/Posterior/BetaGamma/GammaDirichlet/DirichletUpdate foundations,
with no External, upper GammaDirichlet, DirichletRealization, Palm or main
dependency. James no longer reaches the DirichletUpdate proof. The entire
project graph is acyclic; production modules do not import Checks. Searches
over production and shared Checks find no old E-J3 name or forwarding alias.

### Retired and retained checks

Deleted only `Checks/E3BetaGammaReuse.lean`, the shared designer probe already
marked historical and superseded. Its six exploratory API uses are covered by
the accepted BetaGamma production proof, active E3BetaGammaContract and central
axiom audit. Its mathematical contract elaboration was not an additional proof.
The user explicitly requested removal of unnecessary checks. Its dated results and provenance
remain in Sections 37–39. The historical report link is now plain text with a
retirement annotation, and current README/API/Checks links point to live evidence.

The Blueprint is read-only in construction. Its dated E3BetaGammaReuse file
link and command remain historical references to the removed file; they are
not current executable evidence. This known historical link is not silently
reported as a valid live link. The original file is also preserved in the local
ignored pre-change snapshot `.lake/close-before/Checks/E3BetaGammaReuse.lean`.

Four active checks remain: E3BetaGammaContract, E3GammaDirichletContract,
E3MarkovKreinContract and ThorinInterfacesContract. They cover distinct primitive
contracts and boundary cases, including explicit binders, so are not redundant
API experiments. No independent reviewer-owned artifact was edited or deleted.
Both semantic audit reports, the user's ForHumanCheck file, Definitions and all
accepted lower proofs match their pre-change hashes. No previous independent
review conclusion is reassigned to a modified shared check.

### Final validation

Pinned Lean remains v4.32.2 and mathlib remains
`905b95818eb32af7874a58b427f50c1711a5e96c`. Commands ran from `formalization`
with `LEAN_NUM_THREADS=2` using
`C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe`:

```text
lake build GGC.DirichletPosterior External.James GGC.GammaDirichlet GGC.DirichletRealization GGC.Palm
lake env lean Checks/E3GammaDirichletContract.lean
lake clean ggc_power_closure
lake build
lake env lean AxiomAudit.lean
lake env lean Checks/E3GammaDirichletContract.lean
lake env lean Checks/E3MarkovKreinContract.lean
lake env lean Checks/E3BetaGammaContract.lean
lake env lean Checks/ThorinInterfacesContract.lean
```

All listed commands exited **0**. The project build directory was absent after
cleaning; dependency caches were retained. The clean default build passed
**3956 jobs**, with **153/153 project modules freshly built**, including
the new public interface. The subsequent direct audit matched **1005/1005**
requests by name and multiplicity. Replacing the wrapper name adds no audit
request. Both the public and lower posterior theorems use only standard logic
(`propext`, `Classical.choice`, `Quot.sound`). All four active contract checks
passed; E3GammaDirichlet printed seven standard-logic-only endpoint lists,
E3MarkovKrein seven, E3BetaGamma one and ThorinInterfaces two.

All direct audit entries remain within standard logic plus exactly the three
registered literature axioms. `GGC.ggc_rpow` still depends on E-J2
(`GGC.External.James.posterior_palm_nonneg`), E-T1
(`GGC.External.Sethuraman.stick_breaking`) and E-S1
(`GGC.External.SSV.phase_representation`). Source inventory also contains
exactly these three axiom declarations. Final build/audit/check logs contain
no warnings, errors, `sorryAx` or `Lean.ofReduceBool`.

Evidence: `.lake/close-before.json`, `.lake/close-source-final.json`,
`.lake/close-verify.py --full` and `.lake/close-results.json`; raw logs are
`.lake/close-target.log`, `close-contract-preclean.log`, `close-clean.log`,
`close-build.log`, `close-audit.log`, `close-dirichlet.log`, `close-bounded.log`,
`close-betagamma.log` and `close-thorin.log`. Exit records are
`close-build-result.json` and `close-check-results.json`. Final source hashes
are checked against the compilation snapshot, and pre-change comparisons
protect the Blueprint, accepted lower proofs, human-check file and independent
audit artifacts. These ignored local logs are construction evidence, not
independent reviewer sign-off.

R2-01 is corrected in this construction, supported by the comment-only comparison
and actual dependency output. The independent auditor's report is untouched;
the designer still controls verification and disposition under Section 24.
Current README, External and Checks inventories and API-076 reflect the new
ownership and retirement. Historical acceptance records retain their original
counts. No Blueprint edit, further axiom formalization, commit or push is part
of this delivery.


<a id="r2-j3-design-acceptance-2026-09-25"></a>
## 49. R2-01 and E-J3 relocation: designer acceptance — 2026-09-25

**Decision: `verified`; API-076 accepted and R2-01 closed by designer verification.**
The submitted Section 48 delivery satisfies Blueprint Section 24. No unresolved
blocking finding remains. This is a structural/documentation acceptance; it
neither formalizes another literature axiom nor expands the mathematical scope.

### Contract and ownership review

The designer inspected the changed sources and the constructor's verification
script, then compared the submitted pre-change hashes with the preceding designer
snapshot. The full text of `main.lean` differs only by the exact prescribed
replacement of its two dependency sentences. Its type, proof body and four
human-readable steps are unchanged.

`GGC.beta_atom_posterior` in `GGC/DirichletPosterior.lean` preserves the old E-J3
wrapper's complete declaration, original Polish/Borel binders, source docstring,
scoped linter setting and lower proof call after namespace normalization.
E-J2's source annotation and complete declaration are unchanged. GammaDirichlet
and DirichletRealization differ only by the intended import/name substitutions;
Palm adds only the explicit James import required for its genuine E-J2 use.
The audit replaces the old wrapper name without adding or dropping requests.
The affected shared contract check explicitly applies the new theorem with all
original topology binders.

The new public interface reaches only the independent RandomMeasure, Posterior,
BetaGamma, GammaDirichlet and DirichletUpdate foundations. It does not reach
External, main or upper consumers. James no longer imports the DirichletUpdate
proof. The production import graph is acyclic and contains no Checks dependency.
Production/shared Checks contain no old E-J3 name or forwarding alias. Definitions,
accepted lower proofs, the human-check file, both semantic audit reports and the
independent temporary contract probe are unchanged. The designer did not edit
any Lean source or check proof during this review.

Retirement of `Checks/E3BetaGammaReuse.lean` is accepted: it was a shared designer
API probe, already superseded by the production BetaGamma proof, active primitive
contract check and central audit. Its earlier results remain historical evidence.
The four distinct active contract files remain. No independent-reviewer-owned
evidence was deleted or transferred to shared ownership.

### Independent verification and evidence limits

All **153/153** current production hashes match the compilation snapshot, and all
153 module names occur as fresh `Built` records in the submitted **3956-job**
project clean build. Dependency caches were retained in that build. The designer
checked the submitted clean-build and exit records rather than claiming another
independent clean rebuild.

From `formalization`, using pinned Lean v4.32.2 and mathlib commit
`905b95818eb32af7874a58b427f50c1711a5e96c`, the designer independently ran these
commands sequentially, proceeding only on success:

```powershell
$env:LEAN_NUM_THREADS = '2'
$taskLake = 'C:/Users/vtejd/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake.exe'
& $taskLake build *> .lake/close-design-build.log
& $taskLake env lean AxiomAudit.lean *> .lake/close-design-audit.log
& $taskLake env lean Checks/E3GammaDirichletContract.lean *> .lake/close-design-dirichlet.log
```

All three commands exited **0**. The fresh incremental default build passed
**3956 jobs**. The direct audit matched **1005/1005** requests by name and
multiplicity, including axiom-free declarations. The contract check passed all
examples and printed **7/7** standard-logic-only endpoint lists. Both public and
lower posterior theorems use only `propext`, `Classical.choice` and `Quot.sound`.
Every audit entry stays within standard logic and the three registered literature
axioms; `GGC.ggc_rpow` uses exactly E-J2 (`posterior_palm_nonneg`), E-T1
(`stick_breaking`) and E-S1 (`phase_representation`). The source inventory also
contains exactly those three axiom declarations. Fresh logs contain no warning,
error, `sorryAx` or `Lean.ofReduceBool`.

The designer inspected the constructor's other three active contract logs
(E3BetaGamma: one endpoint; E3MarkovKrein: seven; ThorinInterfaces: two), all passing
with standard logic only. Those checks were not independently rerun this turn.
No new literature-page audit or independent-auditor sign-off is claimed.

Review evidence is in `.lake/close-design-verify.py --full`,
`.lake/close-design-results.json`, `.lake/close-design-exits.json` and the fresh
logs above. The verification script was inspected and adapted from the constructor
script to consume fresh audit/contract outputs and compare protected files against
the preceding designer snapshot. Its Blueprint baseline check records the
pre-acceptance state; acceptance intentionally updates the Blueprint afterwards.
`.lake/close-design-protected.json` records the reviewed source/check/auditor hashes
for the final post-documentation comparison. Ignored logs are evidence snapshots,
not substitutes for versioned production proofs and contract checks.

### Documentation findings and disposition

- **Minor issue, corrected:** the constructor appended a `Section 24 structural
  closeout` block to `formalization/README.md`, contrary to the user's rule that
  it retain only a brief current-status summary and project rules. The designer
  removed that block. Construction and acceptance evidence remain in this report
  and the Blueprint; no progress log was added back to README.
- **Designer-owned follow-up, completed:** construction correctly left the
  Blueprint read-only, including its link/command for the deleted reuse probe.
  Section 20.3 now records retirement and points to live production/contract
  evidence; historical experiment records are preserved.

Blueprint Section 24 is `verified`, current module ownership is reconciled,
API-076 is `accepted`, and the External/Checks inventories link to this decision.
R2-01 is closed in designer records on the basis of the actual correction and
fresh dependency audit. The independent auditor's original report remains an
unchanged record of its own snapshot. J2/T1/S1 remain separate future work;
there is no further axiom reduction. No commit or push was performed.
