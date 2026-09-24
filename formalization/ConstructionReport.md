# Formalization 施工报告

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

Current construction status: **M0 and M1 accepted as `verified`; M2–M7 construction
`verified` relative to registered literature inputs, with independent design
acceptance pending**.
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
## 11. M2 施工完成：Dirichlet realizations, canonical phase and current-law tangent — 2026-09-24

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
## 12. M3 施工完成：specified generator and absolutely convergent resolvent identity — 2026-09-24

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
## 13. M2 交付复核与连续性辅助引理收尾 — 2026-09-24

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
## 14. M4 施工进展：L¹ phase continuity and the sample generator — 2026-09-24

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
## 15. M2 收尾：有序分位数接入与全量复核 — 2026-09-24

**施工结论：M2 已完成，验证相对于已登记的文献输入成立，待独立设计验收。**
本次按“推进至完成 M2”的范围复核 Blueprint 第 5 节 A 及第 6 节 M2，
接入此前已编译的有序分位数模块，并重新验证实际 Dirichlet、后验、切线及其下游。
历史记录保留；蓝图没有改动。下表列出本次检查的交付接口。

| M2 合同 | 已检查的声明或模块 |
|---|---|
| 实际幂分布的导数及识别所需导数桥 | `powerLogDerivative_eq_powerLaw`、`hasDerivAt_powerLogDerivative_q`、`powerTangent_eq_deriv_mul_tiltedXLog`、`mixed_log_powerLaplace_commute`；`power_log_integrand_bound` 在正参数邻域提供支配，不引入原分布的 `X log X` 矩假设。 |
| Gamma–Dirichlet 归一化切线 | `normalized_powerTangent` 和 `exists_normalized_powerTangent`；保留原质量对应的 `digamma (B+1)`，后者自行提供实际 DP 法律。 |
| Gamma/Beta 分析前提 | `GammaAnalysis`、`BetaAnalysis` 中绝对对数可积性、精确矩公式、Gamma 负对数上界，以及正质量紧区间上的连续性和有界性。 |
| 公共概率空间和联合可测实现 | `dirichletLaw_isDirichlet`、`posteriorSample_isDirichlet`、`ae_all_parameters_stick_realization`、`ratePosteriorSample_isDirichlet`、`exists_dirichletProcess`；覆盖原子、非原子和混合基底。单个满概率事件中的质量与基底量词保持不变。 |
| 规范相位 | `phase_jointlyMeasurable`、`stieltjesPhase_bounds`、`phase_eq_ae_of_representation`、`phase_anchor_one`、`phase_unique_ae`；保持整数高度序列的 limsup 定义、锚点一和 a.e. 唯一性。 |
| 语义和外部输入边界 | 既有 Giry 与窄拓扑 Borel 结构兼容性证明保留；E-J1–3、E-T1、E-S1 的契约及完整审计保持。未新增外部输入或未完成证明。 |

### 本次实现与 mathlib 复用

[Quantile](GGC/Foundations/Quantile.lean) 定义实际逆 CDF，并证明
`quantile_le_iff`、`measurable_quantileSampler` 和 `quantileSampler_map`。
端点 `u=0,1` 赋值为零，利用其零测性得到精确推送分布，无连续分布假设。
[QuantileContinuity](GGC/Foundations/QuantileContinuity.lean) 从 Portmanteau
定理得到 CDF 在连续点的收敛，再用单调函数的不连续点可数性证明
`ae_tendsto_quantileSampler`。该结果的例外集由极限分位数确定。

[DirichletRealization](GGC/DirichletRealization.lean) 的实际位置坐标已改用
`quantileSampler`。Beta 断棒比例、公共空间、统一质量一事件、联合可测性和
有限分割 DP 契约均重新编译通过。正率输运、后验、归一化切线及既有生成元
消费者也通过构建。

[MathlibAPI](MathlibAPI.md) 的 API-027 记录检索范围、具体复用接口和本次证据：
CDF、条件下确界、测度求值、单位区间体积、Portmanteau，以及单调函数的
可数不连续点定理均复用现有库。未找到导出的实数有序分位数耦合合同，因此
保留这层局部适配证明。API-008 的通用可测采样适配器仍保留并显式纳入审计；
其边缘分布合同本身不蕴含这里所需的耦合性质。

### 本次验证

在 `formalization` 目录运行以下命令，退出码均为 **0**：

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

- 默认构建通过 **3791 个任务**，使用缓存的 mathlib 依赖，并非清空依赖后的重建。
- 独立审计检查 **413 项声明**，包括新增纳入审计的 **17 项分位数结果**；这 17 项
  仅依赖 `propext`、`Classical.choice`、`Quot.sound` 中的标准逻辑公理。
- 全项目仍仅使用上述标准逻辑公理及既有 **8 项已登记文献输入**；未发现额外公理。
- 成功构建及审计日志没有 warning、error、`sorryAx` 或额外原生求值信任依赖。
  Lean 源码扫描和 `git diff --check` 通过。
- 日志保存在被忽略的 `.lake/m2-quantile-completion-build.log` 和
  `.lake/m2-quantile-completion-audit.log`。Lean 与 mathlib 固定版本保持不变。

蓝图本次开始和结束的 SHA256 均为
`AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`；
设计师原有修改保留。没有执行 commit 或 push。

M4 仍需证明公共空间断棒和及后验的 a.e. 弱收敛，再完成生成元期望和变化外层
分布的连续性。本次位置坐标的耦合结果不替代这些结论。M5–M7 及最终
`GGC.ggc_rpow` 仍未完成；完整形式化目标保持进行中。

<a id="m4-completion-2026-09-24"></a>
## 16. M4 收尾：公共空间耦合、后验支配与平均生成元连续性 — 2026-09-24

**施工结论：M4 已完成，验证相对于已登记的文献输入成立，待独立设计验收。**
本次完成 Blueprint 第 5 节 C 的连续性合同、第 6 节 M4 和
[WIP-6.18](../ledger/21-log-thorin-euler-evolution.md#wip-6-18) 对应的剩余证明。
第 14–15 节中的 M4 缺口由本节关闭；历史记录和只读蓝图保持原样。
M2、M3 的交付继续通过全库验证。此结论不包含 M5 的正核迭代和存在性。

### 合同与实际交付

| M4 合同 | 实际声明及范围 |
|---|---|
| 规范边界相位对每个 L¹ 核的弱星连续性 | 既有 `continuous_integral_stieltjesPhase_mul`、`tendsto_integral_stieltjesPhase_mul_of_l1` 和缩放模块继续通过验证。允许正率法律、正尺度和 L¹ 核同时变化，没有逐点相位连续性假设。 |
| 公共空间上的断棒和及后验耦合 | `ae_tendsto_dirichletSample`、`ae_tendsto_posteriorSample`、`ae_tendsto_ratePosteriorSample`。使用有序分位数和同一个质量一事件，涵盖原子、非原子及混合基底。 |
| 实际生成元的联合连续性 | `LogRate.continuous_generator_compact`：每个 `ContDiff ℝ 2 φ` 且 `HasCompactSupport φ` 的测试函数，映射 `(B,F,y) ↦ generator B F φ y` 连续。参数为任意正质量、实数概率基底与实数状态。 |
| 正质量紧区间上的全局一致上界 | 既有 `LogRate.generator_compactTest_bound` 给出依赖于质量区间和测试函数的有限常数，对所有基底与所有状态同时成立。它显式用于本次外层积分证明。 |
| 对变化基底积分后的连续性 | `LogRate.averaged_generator_continuous`：`(B,F) ↦ ∫ y, generator B F φ y ∂F` 连续。证明使用紧集上的一致收敛、窄收敛序列的紧性和上述全局上界。 |

入口为 [GGC/LogRate/Continuity.lean](GGC/LogRate/Continuity.lean)。
其中 `averagedGenerator` 直接定义实际生成元对实际基底的积分。
连续性定理不增加基底或正率的矩条件，也不要求无原子基底。

### 本次新增模块及证明结构

本次新增 **8 个证明模块、42 项公开定理**，均已加入 `AxiomAudit.lean`。

| 模块 | 公开定理数 | 作用与关键声明 |
|---|---:|---|
| [Foundations/ProbabilitySeries](GGC/Foundations/ProbabilitySeries.lean) | 3 | `tendsto_tsum_abs_sub_probability`、`tendsto_probability_weighted_tsum`：由坐标收敛与总质量守恒得到概率权重的 ℓ¹ 收敛及有界加权级数收敛。 |
| [Foundations/StickContinuity](GGC/Foundations/StickContinuity.lean) | 6 | Beta 断棒比例、有限残余及权重的连续性；`integral_stickProbability`、`tendsto_stickProbability` 和 `tendsto_atomMixture`。 |
| [DirichletContinuity](GGC/DirichletContinuity.lean) | 14 | 公共均匀坐标、实际 Dirichlet/后验样本的 a.e. 窄收敛，以及 `continuous_dirichletLaw`、`continuous_posteriorLaw` 和正率输运后的连续性。 |
| [RateSampleLaws](GGC/RateSampleLaws.lean) | 4 | 正率输运与原子混合交换；`rateDirichletSample_map`、`ratePosteriorSample_map` 给出实际样本的精确法律。 |
| [PosteriorDomination](GGC/PosteriorDomination.lean) | 6 | `uniformBreak_antitone_mass`、统一可积负对数坐标及 `posteriorLog_ratePosteriorSample_le`，控制变化参数下的后验漂移。 |
| [LogRate/GeneratorContinuity](GGC/LogRate/GeneratorContinuity.lean) | 5 | 样本漂移绝对值估计、`generator_eq_integral_ratePosteriorSample` 和实际生成元的联合连续性。 |
| [Foundations/VaryingIntegral](GGC/Foundations/VaryingIntegral.lean) | 1 | `tendsto_integral_of_narrow_locally_uniform`：连续测试函数局部一致收敛且有共同全局上界时，对变化概率法律的积分收敛。 |
| [LogRate/Continuity](GGC/LogRate/Continuity.lean) | 3 | `generator_tendstoUniformlyOn_compact`、`tendsto_averagedGenerator`、`averaged_generator_continuous`。 |

断棒和的无限尾部通过质量守恒处理。对非负概率权重，先对变化权重与极限权重
的逐项最小值应用 mathlib 的 Tannery 定理，再由绝对差恒等式得到 ℓ¹ 收敛。
有界连续测试函数与位置坐标的收敛随后给出整个随机测度的窄收敛。
这一步不要求断棒权重独立，也不假设一个统一可求和的权重上界。

后验平均需要单独控制无界的漂移。固定比邻近质量更大的正质量 `M`，令
`Z_M(ω) = (uniformBreak M ω.2).val`。对于 `B ≤ M`，a.e. 有

\[
\operatorname{posteriorLog}(e^y,P_{B,F,y}(\omega))
\le \log 2-\log Z_M(\omega).
\]

右端对公共概率空间可积，且与变化的 `B,F,y` 无关。证明复用精确 Beta
推送法律及既有对数矩。实际正率后验的推送恒等式把生成元写成公共空间上的
样本生成元积分，再结合 a.e. 后验耦合和样本连续性应用支配收敛。
不需要另加 Dirichlet 法律唯一性假设。

外层积分按蓝图要求处理：联合连续性给出紧集上的一致收敛；弱收敛序列及
极限组成紧集，mathlib 的 Prokhorov 接口给出一致紧性。将积分误差拆到状态
紧集及其补集，前者使用局部一致收敛，后者使用全局生成元上界，最后对固定
有界连续测试函数应用窄收敛。没有用联合连续性替代非紧状态空间上的上界。

### mathlib 复用与信任边界

[MathlibAPI.md](MathlibAPI.md) 的 **API-028–031** 记录检索与实际消费者：
Tannery 级数支配收敛、Dirac 和测度积分、a.e. 收敛蕴含分布收敛、推送测度
及乘积运算、支配收敛、Prokhorov 紧性、紧开拓扑与紧集上一致收敛均直接复用。
检索中未找到合同完全匹配的离散概率权重 ℓ¹ 收敛或变化函数与法律的联合积分
定理，因此保留上述局部适配证明；未据此新增外部公理。

独立审计确认：概率级数、断棒连续性、Dirichlet/后验耦合及法律连续性、精确
正率推送、共同后验支配和变化积分适配器只使用标准逻辑公理。
`continuous_generator_compact` 与 `averaged_generator_continuous` 通过规范
相位的样本连续性依赖既有 **E-S1**；它们没有新增文献依赖。
全项目的外部输入仍为既有 **8 项**：E-B1–3、E-J1–3、E-T1、E-S1。

### 验证与交接

在 `formalization` 目录运行以下命令，退出码均为 **0**：

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

- 默认构建通过 **3814 个任务**，使用缓存的 mathlib 依赖，并非清空依赖后的重建。
- 独立审计检查 **455 项声明**；本次 **42/42** 项公开定理都有公理输出。
  依赖集合仍为 `propext`、`Classical.choice`、`Quot.sound` 和上述 8 项文献输入。
- 成功构建和独立审计日志没有 warning、error、`sorryAx` 或额外原生求值信任依赖。
  Lean 源码扫描未发现未完成证明，`git diff --check` 通过。
- 日志保存在被忽略的 `.lake/m4-completion-build.log` 和
  `.lake/m4-completion-audit.log`。Lean 与 mathlib 固定版本保持不变。

蓝图本次开始和结束的 SHA256 均为
`AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`；
设计师原有修改保留。没有执行 commit 或 push。

下一阶段为 **M5**：对 `0 < h ≤ 1/16` 构造实际可测 Euler 概率核，证明截断强度
上界、留驻质量至少 `1/2`、总质量一、精确均值和二阶矩递推，再完成紧性、时间
控制、与测试函数无关的子列选择及极限弱方程。M6 动态识别、M7 最终组装和
真正的 `GGC.ggc_rpow` 均未完成；完整形式化目标保持进行中。

<a id="m5-euler-foundation-2026-09-24"></a>
## 17. M5 推进：正 Euler 核、实际迭代、矩界与局部一致性 — 2026-09-24

**施工结论：M5 `in_progress`。** 本次按 Blueprint 第 5 节 C、第 6 节 M5 和
[WIP-6.19](../ledger/21-log-thorin-euler-evolution.md#wip-6-19) 推进正 Euler 构造。
已证明下表中的离散构造及估计；时间控制、与测试函数无关的统一子列、时间
积分的极限传递和完整弱方程仍未完成。本节不作 M5 存在性完成或设计验收结论。

### 已证明的合同

| 合同 | 实际交付 |
|---|---|
| 严格正截断的精确质量 | `truncatedJumpMeasure_mass`、`truncatedJumpMeasure_mass_le`：参考测度在 `|v| > ε` 上的质量为 `2 / (exp ε - 1)`，且不超过 `2 / ε`。截断一阶矩的绝对可积性已证明。 |
| 实际接受率和补偿漂移 | `truncatedIntensity`、`truncatedMeanJump`、`truncatedDrift` 直接使用已有 `acceptance B F y v` 与 `drift B F y`；联合可测性和带密度核的有限性已证明。 |
| 小步长正概率核 | `EulerStep = {h : ℝ // 0 < h ∧ h ≤ 1/16}`，`eulerCutoff h = sqrt h`。`eulerStay_ge_half`、`eulerMeasure_mass` 和 `eulerKernel_isMarkov` 分别证明留驻质量至少 `1/2`、总质量一及实际 Markov 核。 |
| 精确一、二阶增量矩 | `integral_euler_increment` 给出 `E[Δ | y] = h * drift B F y`；`integral_euler_increment_sq` 给出截断跳跃二阶矩加漂移原子项的精确公式。两种增量均先证明可积。 |
| 非线性概率分布迭代 | `eulerUpdate` 为实际核与当前法律的复合，`eulerIterate` 在每步用当前法律冻结核；`eulerMass` 为 `B₀ * exp (-n*h)`。所有网格法律保持为概率法律。 |
| 二阶矩递推与有限时间一致界 | `integrable_sq_eulerIterate` 按步数归纳证明有限二阶矩；`integral_sq_eulerIterate_succ_le`、`eulerIterate_uniform_secondMoment` 给出递推和覆盖所有容许步长、所有 `n*h ≤ T` 的共同上界。 |
| 所有网格法律的一致紧性 | `isTightMeasureSet_eulerLawsUpTo`、`isCompact_closure_eulerLawsUpTo`：由共同二阶矩界、Markov 不等式和 Prokhorov 定理得到整个状态法律族的紧性及闭包紧性。 |
| 与实际生成元的局部一致性 | `integral_euler_error_eq` 精确分离漂移原子的 Taylor 余项和遗漏小跳跃；`abs_euler_error_le_sqrt` 给出显式单步误差界。补偿覆盖所有跳跃大小。 |

[Euler.lean](GGC/LogRate/Euler.lean) 中实际测度严格保留蓝图公式：

\[
\Pi_h(y,dz)=p(y)\delta_{y+h a_\epsilon(y)/p(y)}(dz)
+h\int_{|v|>\epsilon}\delta_{y+v}(dz)k_{B,F}(y,v)\nu_0(dv).
\]

`eulerMeasure` 的两项分别由缩放 Dirac 测度和实际保留跳跃测度的平移推送组成；
`eulerKernel` 包装同一个测度及其可测性证明。未通过事后归一化改变核或其矩。

### 矩界与一致性估计

截断补偿项采用 mathlib Hölder 不等式在两个指数均为二时的特例：

\[
m_\epsilon(y)^2\le\lambda_\epsilon(y)m_2,
\qquad m_2=\int v^2\,\nu_0(dv)<\infty.
\]

结合精确二阶增量矩、`p ≥ 1/2` 和 `ε = sqrt h`，本次得到

\[
\int z^2\,\Pi_h(y,dz)
\le(1+4h)y^2+h\{2D_B^2+3m_2\},
\qquad D_B=\operatorname{driftBound}(B).
\]

证明先给出每步所需的绝对可积性，再对实际更新法律积分。质量沿
`B₀ exp(-n*h)` 留在 `[B₀ exp(-T), B₀]`，既有紧质量区间界提供共同常数。
标量递推通过几何增长界和 `1+4h ≤ exp(4h)` 得到有限时间一致二阶矩界。
这同时支持归纳中的下一步积分，未预设尚未证明的后续法律矩存在性。

对于 `φ ∈ C_c²`、全局二阶导数界 `|φ''| ≤ C`，已证明

\[
\left|\Pi_h\varphi(y)-\varphi(y)-h\mathcal G_{B,F}\varphi(y)\right|
\le 4Ch^2(y^2+D_B^2)
+Ch\sqrt h\,(1+4m_2).
\]

其中小跳跃界来自 `v² * jumpDensity v ≤ 1` 和
`integral_sq_smallJumps_le`。Cauchy–Schwarz 的补偿项估计给出所需的消失误差
尺度，不必先求出截断一阶绝对矩的对数原函数。上述界适用于任意基底，且未
增加蓝图有限二阶矩之外的初始条件。它是单步估计；沿时间累计、消失极限及
极限弱方程的证明仍需在下一阶段接入。

### 新增模块与 mathlib 复用

本次新增 **9 个证明模块、76 项公开定理、4 个实例**，80 项全部纳入公理审计。

| 模块 | 定理 / 实例 | 责任 |
|---|---:|---|
| [LogRate/JumpTruncation](GGC/LogRate/JumpTruncation.lean) | 11 / 1 | 严格正截断的质量、有限性和截断一阶矩。 |
| [LogRate/RetainedJumps](GGC/LogRate/RetainedJumps.lean) | 16 / 1 | 实际接受率的带密度核、截断系数、可测性与积分接口。 |
| [LogRate/Euler](GGC/LogRate/Euler.lean) | 16 / 2 | 小步长、实际概率核、精确增量矩。 |
| [LogRate/EulerMoments](GGC/LogRate/EulerMoments.lean) | 8 / 0 | Cauchy–Schwarz 补偿界、原子项估计和状态二阶矩界。 |
| [LogRate/EulerIteration](GGC/LogRate/EulerIteration.lean) | 13 / 0 | 实际法律更新、非线性递推、质量时序及一致二阶矩界。 |
| [LogRate/SmallJumps](GGC/LogRate/SmallJumps.lean) | 2 / 0 | 遗漏小跳跃的精确尺度上界。 |
| [Foundations/MomentTightness](GGC/Foundations/MomentTightness.lean) | 1 / 0 | 将统一实数二阶矩界适配到库的紧性定义。 |
| [LogRate/EulerTightness](GGC/LogRate/EulerTightness.lean) | 2 / 0 | 所有容许网格法律的一致紧性与闭包紧性。 |
| [LogRate/EulerConsistency](GGC/LogRate/EulerConsistency.lean) | 7 / 0 | 精确补偿恒等式、单步余项和显式误差界。 |

[MathlibAPI.md](MathlibAPI.md) 的 **API-032–035** 记录源代码检索和实际复用：
反常积分基本定理、反射换元、带密度核、可测核截面、推送积分、核复合的
可积性与积分、Hölder、Markov 和 Prokhorov 均使用现有 mathlib 接口。
局部适配层仅提供本项目密度公式、二阶矩紧性接口和实际 Euler 构造的组合证明。

### 验证与剩余工作

在 `formalization` 目录运行以下命令，退出码均为 **0**：

```powershell
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' build
& 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe' env lean AxiomAudit.lean
```

- 默认构建通过 **3825 个任务**，使用缓存 mathlib 依赖，并非清空依赖后的重建。
- 独立审计检查 **535 项声明**。本次新增的 **80/80** 项定理和实例全部仅依赖
  `propext`、`Classical.choice`、`Quot.sound`；没有新增外部数学输入。
  全库仍仅使用这些标准逻辑公理和既有 8 项已登记文献输入。
- 成功构建和独立审计日志均无 warning、error、`sorryAx` 或额外原生求值信任依赖。
  源码未完成证明检查、审计覆盖检查及 `git diff --check` 通过。
- 日志为被忽略的 `.lake/m5-euler-foundation-build.log` 和
  `.lake/m5-euler-foundation-audit.log`。工具链、依赖固定版本和外部公理声明未改动。

蓝图本次开始和结束的 SHA256 均为
`AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`；
设计师原有修改保留。没有执行 commit 或 push。

后续 M5 必须继续完成：时间控制与连续插值、测试函数无关的统一子列、时间上
一致的窄收敛、极限二阶矩界、累计一致性误差趋零，以及对每个紧支撑 C² 测试
函数和每个时间的弱方程。状态法律族的紧性不替代这些结论。M6、M7 和最终
`GGC.ggc_rpow` 仍未完成；完整目标继续保持进行中。

<a id="m5-completion-2026-09-24"></a>
## 18. M5 有限时域弱解构造完成 — 2026-09-24

施工范围：蓝图 C、M5、WIP-6.19。蓝图仅被读取，其 SHA256 仍为
`AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`。
用户将持续施工目标更新为完成蓝图或发现项目证明错误；本节完成 M5 后继续 M6。
本节覆盖第 17 节尚缺的全部 M5 义务，不修改设计师的验收状态。

### 实际交付与量词

`GGC/LogRate/Existence.lean` 证明了 `GGC.LogRate.exists_weakLogRateSolution`：
任意 `B₀ : PosReal`、任意实线上概率 `F₀`、其平方坐标可积，以及任意
实数 `T > 0`，均有 `Nonempty (WeakLogRateSolution B₀ F₀ T)`。
结构中的性质由具体 Euler 极限证明，包含：

- `law : C(ℝ, ProbabilityMeasure ℝ)`，使用概率测度原有的窄拓扑；
- `law 0 = F₀`；
- 一个非负有限常数同时控制 `[0,T]` 上全部平方积分，并逐时证明平方可积；
- 对每个紧支撑 `C²` 测试函数和每个 `t ∈ [0,T]`，满足蓝图的积分弱方程，
  时间质量参数为实际的 `massAt B₀ r = B₀ * exp (-r)`，生成元为 M3/M4 的同一对象。

区间外采用常值延拓以方便后续参数积分；弱方程和矩界只在 `[0,T]` 断言。
定理没有额外的有限支撑、密度、原始值变量矩、生成元存在性或预先给定极限等假设。

### 证明链与 mathlib 复用

1. `EulerWeakEstimates` 把真实一步误差在当前法律下积分，并对实际迭代望远镜求和。
   每个紧支撑 `C²` 测试的网格时间增量有统一 Lipschitz 界，累计误差随步长消失。
2. `ProbabilityMixture`、`LinearInterpolation` 和 `EulerInterpolation` 构造相邻
   Euler 法律的凸组合。证明跨网格边界的时间估计、精确积分式和一致二阶矩界；
   末端下一个网格点由 `T+1` 上的已证矩界控制。
3. `CompactSmoothTests` 对两测度相对于其和的 Radon–Nikodym 密度使用 mathlib 的
   `ae_eq_of_integral_contDiff_smul_eq`，证明紧支撑 `C²` 测试分离有限测度。
   `CurveCompactness` 在紧法律族上把测试坐标等度连续性传递为法律曲线的等度连续性，
   复用 `BoundedContinuousFunction.arzela_ascoli` 和 `IsCompact.tendsto_subseq`。
   抽取发生在整个 `C([0,T], ProbabilityMeasure ℝ)` 空间中：同一子列在紧时间域上
   一致窄收敛，不依赖测试函数或考察时刻。此实现直接用紧支撑测试控制法律曲线，
   无需额外构造离散路径空间或引入鞅存在定理。
4. `MomentLimits` 使用非负无界连续函数版 Portmanteau，给出同一极限曲线的平方
   可积性和一致矩界。没有将有界测试的窄收敛误用到平方函数。
5. `MeshIntegral` 复用区间积分的相邻可加性，证明左网格函数的积分恰为网格和，
   并控制末段残余区间。`EulerTime` 给出正步长 `T/(ceil(16T)+n+1) ≤ 1/16`
   趋零、左网格时刻趋向真实时刻、质量参数与连续延拓。
6. `EulerLimitGenerator` 在移动左网格时刻评价整条曲线的极限，使用 M4 的实际
   平均生成元连续性及紧质量区间上的统一界，通过支配收敛交换时间积分与极限。
   `EulerWeakEquation` 合并插值误差、累计局部误差及末段积分误差，证明统一的
   `K*(h+sqrt h)` 界；再由极限唯一性得到每个测试、每个时刻的精确弱方程。

上述标准 API 的来源、适配理由和实际使用见共享索引 API-036–042。
所有公共声明已纳入 `AxiomAudit.lean`；本节增加 89 个审计项，包含对象定义及定理。

### 构建与实际信任边界

使用已固定的
`C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe`，
在 `formalization/` 中依次运行：

- `lake build`：退出码 0，3891 jobs；日志 `.lake/m5-completion-build.log`；
- `lake env lean AxiomAudit.lean`：退出码 0，624 个声明；日志
  `.lake/m5-completion-audit.log`；
- 公理集合解析：仅 `propext`、`Classical.choice`、`Quot.sound` 及既有八项文献
  公理；无 `sorryAx`、本机信任公理、错误或警告；
- 源码检查无证明占位；八个 `axiom` 均仍在既有 External 模块中；
  `git -c core.safecrlf=false diff --check` 通过。

最终 `exists_weakLogRateSolution` 除标准逻辑外，仅传递依赖
`GGC.External.SSV.phase_representation`（E-S1）。统一时间误差和实际迭代估计
本身仅使用标准逻辑；相位表示通过 M4 的极限连续性进入最终构造。
没有新增外部公理、修改文献契约、改变 Lean/mathlib pin 或执行 commit/push。

**施工结论：M5 实现完成并通过构建和公理审计，独立设计验收待进行。**
M6 的对数矩、值分布连续性、测试域扩张、零端点与输运识别，以及 M7 的最终
`GGC.ggc_rpow` 仍需施工。当前没有发现项目数学证明错误，完整目标继续进行。

<a id="m6-moments-continuity-2026-09-24"></a>
## 19. M6 值分布的对数矩、正值性与连续性 — 2026-09-24

施工范围：蓝图 D 的识别输入。此节不是 M6 完成声明。蓝图保持只读，
SHA256 仍为 `AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`。

### 已证明的实际对象与界

- `Identification/LogTests` 从 M5 的 log-rate 二阶矩证明
  `U = B * exp_* F` 的 Thorin 可容许性，并给出
  `F(log(1+s*exp(-y))) ≤ log(1+s)+sqrt K`。
- `Identification/ValueLaw` 选择 E-B1 的真实概率实现，证明其精确 Laplace
  公式及原始定义下的 GGC 成员资格。对每个固定 `s₀>0`，M5 的同一矩界给出
  蓝图指定的统一下界 `D = exp(-B₀*(log(1+s₀)+sqrt K)) > 0`。
- `ValuePositivity` 证明 `μ({0})=0`，故真实值分布严格为正。证明使用
  `logTest(exp r)y ≥ r-y`、Laplace 变换在无穷远趋零及单点质量的积分上界。
- `ValueTails`、`LogTailIntegral`、`Moments` 证明实际的 `Integrable Real.log μ`。
  对 `B∈[a,b]`、`a>0`、`F(y²)≤K`，有明确界
  `∫|log x|dμ ≤ exp(1+b*sqrt K)/a + 8*b*(1+K)`。
  取 `a=B₀*exp(-T)`、`b=B₀` 得到整条 M5 曲线的一致对数矩界。

本次选用 Laplace 尾界与 layer cake 实现蓝图的同一矩契约：负对数尾由
`exp 1 * L(exp r)` 控制，正对数尾由 `2*(1-L(exp(-r)))` 控制；后者的
log-rate 核在 `r>0` 上积分不超过 `4*(1+y²)`。先证明乘积空间的绝对可积性，
再交换积分。此路线的常数比稿件的 gamma–Dirichlet/Frullani 路线更宽松，
但没有添加原始值变量矩、指数矩或新的文献输入。

### 连续性与 mathlib 复用

`Foundations/GrowthContinuity` 用输出截断及 `f²/R` 误差界，将窄收敛扩张到
具有线性增长且受同一二阶矩控制的连续测试；由此得到 Laplace 变换的时间连续性。
`LogMomentTightness` 给出值分布族紧性，`GGC/LaplaceContinuity` 复用
Portmanteau 保持非负支持、Prokhorov 抽取子列，再用已有 Laplace 唯一性识别
每个子列极限。`ValueContinuity.continuous_valueLaw` 因而证明整条实际曲线窄连续。

`LogValueContinuity` 对真实 log 推前单独证明紧性和连续性：一致对数矩给出
log 法律的一阶矩界；把子列极限经全局连续的 exp 推前，用正值性及
`log ∘ exp = id` 识别极限。因此没有把 `Real.log` 误当作全局连续函数。
它还给出正实数子类型上的连续概率曲线、正确的实数边缘，以及
`valueKernel` 和 `valueKernel_isMarkov`。

上述标准工具、与最接近候选的契约差异及保留适配证明的理由见 API-043–051。
新增 82 项公共声明均已加入 `AxiomAudit.lean`。

### 验证与剩余义务

使用第 18 节记录的固定可执行文件，在 `formalization/` 中运行：

- `lake build`：退出码 0，3907 jobs；日志 `.lake/m6-moments-continuity-build.log`；
- `lake env lean AxiomAudit.lean`：退出码 0，706 项声明；日志
  `.lake/m6-moments-continuity-audit.log`；
- 两份日志无 warning、error、`sorryAx` 或原生求值信任依赖；公理集合仍仅为
  三项标准逻辑公理和既有八项已登记文献输入；
- 源码无证明占位，`git -c core.safecrlf=false diff --check` 通过。

本节的值法律实现、正值性、矩界和连续性仅在标准逻辑之外使用 E-B1；
原始 GGC 成员资格另经既有 E-B3 的表征方向。通用紧性、尾积分和连续性
适配本身不添加数学公理。使用缓存依赖，不声称清空 mathlib 后重建。

仍需完成 M6 的测试域扩张、resolvent 时间方程、完整 tangent 的绝对
空间时间可积性、零端点归一化、C¹ 测试逼近及输运唯一性，最后推进 M7。
没有修改蓝图、工具链或文献契约，也没有执行 commit/push。

<a id="m6-endpoint-2026-09-24"></a>
## 20. M6 完整 tangent 的零端点与空间时间积分 — 2026-09-24

施工范围：蓝图 D 的完整零端点契约。新增五个模块，公共声明新增 49 项，
均已加入独立公理审计。共享 mathlib 复用索引为 API-052–053。

`Identification/LaplaceEndpoint` 对任何绝对对数矩有限的非负概率法律证明：
`L(s) → 1`、`s*A(s) → 0`（`s↓0`），以及在 `L(s)≥D>0`、
`∫|log x|dμ≤C` 时的统一界 `|s*A(s)|≤exp(-1)*C/D`。
支配函数为 `exp(-1)*|log x|`；无需原始法律的 `X log X` 可积性。

`AbsoluteLaplaceKernels` 复用 mathlib 的 Gamma 积分，证明两核
`x*|log x|*exp(-s*x)` 与 `s*x²*|log x|*exp(-s*x)` 在正 Laplace
半轴与值空间乘积上的实际绝对可积性；每个核的二重积分恰为 `∫|log x|dμ`。
这里先证明乘积可积性，再调用 Fubini，没有使用未证明的积分交换。

`TangentMeasurability` 复用第 19 节的真实 Borel 概率核及 mathlib 的
kernel-integral 可测性，证明 damped moments、`A_t(s)` 和实际 q 导数
`powerTangent μ_t s` 的联合 Borel 可测性；展开公式只在 `s>0` 使用。

`TangentIntegrability` 分别证明展开式三项的绝对可积性与界：

- `∫|A(s)|ds ≤ C/D`；
- `∫|s E_s[X² log X]|ds ≤ C/D`；
- 乘积项 `∫|s E_s[X] A(s)|ds ≤ exp(-1)*C/D²`。

因此完整 `h(s)` 在 `(0,s₀]` 可积，绝对积分不超过
`(2/D+exp(-1)/D²)*C`。`integral_powerTangent_zero_endpoint` 在此之后
调用允许单侧端点极限的微积分基本定理，证明 `∫₀ˢ h(r)dr = s*A(s)`。

`TangentSpaceTime` 使用普通 Lebesgue 时间测度在 `[0,T]` 上的子类型限制，
证明其总质量确为 `T`。`value_tangent_spaceTime_bound` 得到蓝图要求的
`T*(2/D+exp(-1)/D²)*C` 界及实际乘积可积性；`exp(-1)=1/e`，与蓝图常数相同。
`integral_valueTangent_swap_zero_endpoint` 给出经过绝对可积性验证的时间–Laplace
Fubini 公式；`tendsto_integral_mul_tiltedXLog_zero` 给出时间积分后的零端点极限。
此证明仅使用逐时收敛和统一支配界，没有假定时间上一致的端点收敛。

验证使用既有固定工具链，工作目录为 `formalization/`：

- `lake build`：退出码 0，3912 jobs；日志 `.lake/m6-endpoint-build.log`；
- `lake env lean AxiomAudit.lean`：退出码 0，755 个声明；日志
  `.lake/m6-endpoint-audit.log`；
- 两份日志无 warning、error、`sorryAx` 或额外原生信任依赖；公理集合仍为
  三项标准逻辑公理与八项既有文献输入；
- 通用端点与绝对积分定理只用标准逻辑；应用于实际值分布曲线时只额外依赖
  E-B1。没有新增文献公理；使用缓存依赖，不声称清空依赖后重建；
- 蓝图 SHA256 保持 `AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`，
  `git -c core.safecrlf=false diff --check` 通过。

**M6 仍在施工。** 剩余为弱方程测试域扩张、resolvent 时间方程、C¹ 测试
与生成元的同时逼近、log-value 输运唯一性和动态幂律识别；然后组装 M7。
未发现项目数学证明错误，持续施工目标保持进行中。

<a id="m6-test-extension-2026-09-24"></a>
## 21. M6 弱方程的测试函数域扩张 — 2026-09-24

完成蓝图 D、识别章节的光滑截断步骤。`LinearGrowthC2 φ` 明确要求 φ 为 C²、
至多线性增长且一阶、二阶导数有界。没有直接将非紧支撑测试代入 M5 的方程。

- `Foundations/SmoothCutoff` 复用 mathlib 的 `ContDiffBump`，构造 χ(y/R)，
  证明紧支撑、内部恒等、外部消失和一、二阶导数公式。
- `Foundations/SmoothCutoffBounds.exists_cutoffTest_uniform_bound` 为 χ(y/R)φ(y)
  证明独立于 R≥1 的增长及导数界。
- `LogRate/TestLimits` 以漂移的线性增长和跳跃的二阶矩控制生成元，证明测试
  积分、逐点生成元及平均生成元的截断极限；复用既有 acceptance 可测性定理。
- `Identification/TestExtension.weakEquation_linearGrowth` 用空间及时间的控制
  收敛，将每个已构造弱解的方程扩张到上述完整测试类。统一二阶矩提供时间
  控制，不增加 rate 或 value 的矩假设。

库复用证据登记于 API-054。通用截断及空间极限只依赖标准逻辑；最后时间
极限和弱方程扩张通过 M4 的紧支撑平均生成元连续性额外依赖 E-S1。

验证使用 README 登记的 Lean 4.32.2 工具链完整路径，在 `formalization` 执行：

- `lake build`：退出码 0，3916 jobs；日志 `.lake/m6-test-extension-full-build.log`；
- `lake env lean AxiomAudit.lean`：退出码 0，790 个声明；日志
  `.lake/m6-test-extension-audit.log`；
- 日志无 warning、error、`sorryAx` 或原生信任依赖；整个审计的公理集合仍为
  三项标准逻辑公理与八项既有文献输入。使用缓存依赖，无新公理或依赖变更。

**M6 仍在施工。** 下一步是 resolvent 时间方程与 Laplace 演化，再完成 C¹
测试和生成元的同时逼近、log-value 输运唯一性及动态幂律识别。蓝图保持只读。

<a id="m6-laplace-evolution-2026-09-24"></a>
## 22. M6 resolvent 与 Laplace 时间演化 — 2026-09-24

完成蓝图 D 从扩张的弱方程到指数测试演化的步骤，对应稿件
`eq:id-resolvent-evolution`、`eq:id-exponent-evolution` 和
`eq:id-laplace-evolution`。沿用 M5 的实际弱解及既有值分布构造。

1. `Identification/ResolventCalculus` 证明 resolvent 属于 `LinearGrowthC2`，
   并在正 Laplace 参数处通过积分号下求导，证明实际值分布的
   `powerLogDerivative μ 1 s = B * F(logResolvent s)`。
2. `Identification/TestExtension` 补齐扩张测试的平均生成元在时间上的统一
   界、可测性及区间可积性。`Foundations/IntegratingFactor` 复用 mathlib 的
   绝对连续原函数和乘积积分定理，仅由积分弱方程得到质量积分因子公式。
3. `Identification/ResolventEvolution.resolvent_time_equation` 将 M3 的实际
   resolvent 恒等式代入，严格消去 `B'=-B` 对应的额外项，得到
   `g_t(s)-g_0(s)=∫₀ᵗ h_u(s) du`。
4. `Identification/ValueTime` 用标准 `projIcc` 作端点常值延拓，并证明固定
   时间子类型上的限制测度积分与普通区间积分相等。`LogLaplaceEvolution`
   消费已证明的完整 tangent 空间时间可积性和 Fubini 恒等式，从零端点
   归一化得到 `log L_t(s)-log L_0(s)=-∫₀ᵗ s A_u(s) du`。
5. `DampedContinuity` 用有界连续测试及 `Real.continuous_mul_log` 证明阻尼
   对数矩随窄连续法律族连续。`Identification/LaplaceEvolution.laplace_time_equation`
   对上式取指数，证明
   `L_t(s)-L_0(s)=-∫₀ᵗ s*dampedLogMoment(μ_u,0,s) du`，并证明右侧时间
   被积函数连续。没有假设未阻尼的 `X log X` 矩。

库复用证据见 API-055–056。积分因子与阻尼矩连续性只依赖标准逻辑；最终
Laplace 时间方程额外依赖 E-B1、三个既有 James 输入、E-S1 和既有
Sethuraman 输入。它未使用 GGC 弱闭包或有限原子逼近作为动态识别前提。

验证使用 README 的完整工具链路径，在 `formalization` 执行：

- `lake build`：退出码 0，3923 jobs；日志 `.lake/m6-laplace-evolution-full-build.log`；
- `lake env lean AxiomAudit.lean`：退出码 0，818 个声明；日志
  `.lake/m6-laplace-evolution-audit.log`；
- 审计无 warning、error、`sorryAx` 或原生信任依赖；整体公理集合仍为三项
  标准逻辑公理与八项既有文献输入。缓存构建，无依赖或文献合同变更；
- 蓝图 SHA256 仍为 `AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`，
  `git -c core.safecrlf=false diff --check` 通过。

**M6 尚未完成。** 后续为测试函数及生成元的 C¹ 同时逼近、log-value 输运
唯一性和实际幂律识别，再组装 M7。未发现数学证明错误。

<a id="m6-log-transport-2026-09-24"></a>
## 23. M6 C¹ 同时逼近、值分布弱方程与 log-value 输运方程 — 2026-09-24

完成蓝图 D 的测试函数及生成元同时逼近，以及值空间到对数值空间的弱方程
转换。稿件对应 `eq:id-c1-polynomials`、`eq:id-generator-norm`、
`eq:id-value-weak` 和 `eq:id-log-transport`。

- `Foundations/C1PolynomialApproximation` 直接使用 mathlib 的 Weierstrass
  定理逼近连续导数，以多项式求导的单项式规则构造指定零点值的原函数，
  再用均值定理控制函数误差。没有重建 Bernstein 或 Weierstrass 证明。
- `Identification/ExponentialTests.exists_expTest_generator_approximation`
  同时控制 `f(exp(-x))` 与其真实生成元 `x*log x*H'(x)` 在 x≥0 上的
  一致误差；后一误差由既有阻尼对数核界控制。
- `PolynomialEvolution` 对实际多项式作归纳，消费已证明的 Laplace 时间
  方程，并显式核对概率积分和时间积分的可积性。`C1Evolution.C1_exp_time_equation`
  通过任意精度误差界传递函数项及生成元项；没有仅凭函数一致收敛就传递导数。
- `NonnegTests` 提供非负法律族的统一有界测试积分接口；`DampedContinuity`
  复用该接口，移除重复的负半轴截断证明。
- `Foundations/LogTestCoordinates` 用紧支撑及 log 在零点附近的发散证明
  零延拓局部恒为零，随后证明光滑性、紧支撑和链式导数。
- `ValueWeakEquation.compact_value_time_equation` 给出全部紧支撑 C¹ 且
  H(0)=0 的值空间测试方程，因而涵盖 C_c¹((0,∞))。
  `LogTransport.log_value_time_equation` 利用已证明的严格正值性及实际 log
  推前积分公式，得到 `λ_t(ζ)-λ_0(ζ)=∫₀ᵗ λ_r(z*ζ'(z)) dr`。
  `continuous_logValueAt` 提供这一法律族的实际窄连续性。

库复用与精确缺口见 API-057–058。逼近、坐标辅助引理和一般积分适配只用
标准逻辑。最终输运方程的额外依赖与 Section 22 的 Laplace 时间方程相同。

验证使用 README 的完整工具链路径，在 `formalization` 执行：

- `lake build`：退出码 0，3932 jobs；日志 `.lake/m6-log-transport-full-build.log`；
- `lake env lean AxiomAudit.lean`：退出码 0，857 个声明；日志
  `.lake/m6-log-transport-audit.log`；
- 两份日志无 warning、error、`sorryAx` 或原生信任依赖。公理边界及依赖
  pin 未变；这是使用缓存依赖的构建；
- 蓝图 SHA256 不变，`git -c core.safecrlf=false diff --check` 通过。

**M6 仍在施工。** 现有输运方程尚不能代替唯一性证明。下一步按蓝图以
反向测试函数及分割求和证明唯一性，识别实际幂律，再完成 M7 的组装。

<a id="m6-completion-2026-09-24"></a>
## 24. M6 完成：分割求和、输运唯一性及实际幂律识别 — 2026-09-24

**施工结论：M6 实现完成，通过全库构建与独立公理审计，待独立设计验收。**
本节闭合蓝图 D 的动态识别合同；前置的矩界、连续性、零端点与测试函数扩张
证据见第 19–23 节。蓝图保持只读，未修改文献契约、依赖版本或公开目标定义。

| 合同 | 已编译声明及实现 |
|---|---|
| 固定测试到反向测试 | `Identification/BackwardTests.lean` 定义 ζ(exp(T-u)z)，证明时间及空间导数、全局一致界和对固定概率测度的积分求导。`Foundations/JointProbabilityIntegral.lean` 复用变化测度积分引理证明实际二参数配对的联合连续性。 |
| 分割求和 | `Analysis.eq_endpoints_of_partition_cancellation` 对等距有限分割逐格估计，以紧集上的一致连续性控制误差，再由望远镜求和得到端点相等。 |
| 输运唯一性 | `Identification.transport_pairing_eq` 从原有固定紧支撑 C¹ 测试方程推导精确单格增量，调用分割引理；`transport_law_eq_map` 再以已有光滑测试分离测度，得到实际 dilation 推前。没有假定时间依赖测试方程或概率曲线可微性。 |
| 动态幂律识别 | `logValueAt_eq_map`、`valueAt_eq_powerLaw` 应用于 M5 弱解的实际 log-value 法律族，指数推前及 a.e. 正值性给出 μ_t = powerLaw(μ_0, exp t)。 |
| 初值及成员资格 | `valueAt_zero` 恢复给定的初始值分布；`isGGC_power_valueLaw_of_weakSolution` 用已构造的时刻 t 值分布证明该幂律是 GGC。 |

复用证据为 API-059：`ContinuousMap.continuous_of_continuous_uncurry`、紧集上一致
收敛、支配积分求导、经典 FTC、`IsCompact.uniformContinuousOn_of_continuous`、
`Finset.sum_range_sub`、既有光滑测试分离定理、`Measure.map_map`、
`Measure.map_congr` 和 `Real.rpow_def_of_pos` 均有生产代码编译使用。
局部保留的分割论证负责概率测度弱输运唯一性这一库中未找到直接替代的合同。

验证（固定 Lean/mathlib 版本，使用既有依赖缓存）：

- `lake build`：成功，3937 jobs，日志 `.lake/m6-completion-build.log`。
- `lake env lean AxiomAudit.lean`：成功，876 项声明，日志 `.lake/m6-completion-audit.log`。
- 两份日志无 warning、error、`sorryAx` 或 `ofReduceBool`；`git diff --check` 通过。
- 蓝图 SHA256 仍为 `AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`。

新通用分析与输运唯一性引理仅依赖标准逻辑。`valueAt_eq_powerLaw` 的文献依赖为
E-B1、E-J1–3、E-S1、E-T1；GGC 成员资格另使用既有 E-B3。未新增外部公理。
这里的验证均相对于完整登记的文献输入，不能替代独立设计验收。

M7 继续构造有限 Gamma 初始 log-rate 数据及二阶矩证明，取 T=log q，并用已证
弱极限约化组装 `GGC.ggc_rpow`。该最终声明此检查点尚未实现；未发现数学证明错误。

<a id="m7-completion-2026-09-24"></a>
## 25. M7 有限输入与完整主定理组装 — 2026-09-24

**施工结论：M7 `verified`，相对于登记的文献公理成立，待独立设计验收。**
`GGC/PowerClosure.lean`、全库干净构建和单独执行的公理审计均已通过。
本节保留 `main.lean` 的全部公开定义和目标量词，只更新其状态注释。蓝图保持只读。

完整目标展开为：

```lean
∀ (μ : GGC.NonnegLaw) (q : ℝ) (hq : 1 ≤ q),
  GGC.IsGGC μ → GGC.IsGGC (GGC.powerLaw μ q (zero_le_one.trans hq))
```

真正的证明声明为 `GGC.ggc_rpow : GGC.GGCPowerClosure`，通过
`import GGC.PowerClosure` 使用。`AxiomAudit.lean` 明确按上述展开类型检查主定理，
并打印该证明的传递公理依赖；对目标命题定义本身的检查不替代此证明检查。

| 合同 | 生产声明与证明连接 |
|---|---|
| 初始归一化及矩 | `Identification.exists_logRate_initialData` 用 mathlib `FiniteMeasure.normalize` 构造 B>0 和 log-rate 概率分布 F，证明平方可积并恢复原始 base measure。 |
| 有限 Gamma 初始值 | `finiteThorinMeasure_ne_zero` 覆盖所有非空有限输入；`exists_finiteGamma_initialData` 复用有限原子积分和 Laplace 唯一性，将该实际独立 Gamma 和识别为初始 value law。 |
| 时间组装 | `isGGC_power_valueLaw` 在 q>1 时取 T=log q，调用已证明的 `exists_weakLogRateSolution` 与 `isGGC_power_valueLaw_of_weakSolution`。q=1 调用恒等推前引理。 |
| 空和与有限输入 | `isGGC_power_finiteGammaLaw` 显式分离空和，通过常数律引理处理零分布；`isGGC_power_of_isFiniteGammaConvolution` 解包原始有限卷积定义。形状、率及实数指数没有额外限制。 |
| 一般输入 | `ggc_rpow` 使用已证 `ggcPowerClosure_of_finiteGamma`。原始定义给出有限 Gamma 逼近，固定实幂连续推前和原始 GGC 弱闭包移除有限质量及矩假设；极限仍是实际概率分布。 |

API-060 记录标准库归一化、测度缩放/推前下的可积性、有限求和及 exp/log 的实际
编译使用。M1 的有限原子积分、Laplace 唯一性与弱极限约化直接复用，未重建对应
基础。M5 存在性与 M6 识别均以已证定理调用，没有留下未提供的核心前提。

### 最终验证

生产目标构建 `lake build GGC.PowerClosure` 成功，3933 jobs，日志
`.lake/m7-power-closure-build.log`。加入最终类型/公理检查后的默认全库构建成功，
3939 jobs，日志 `.lake/m7-completion-build.log`。

首次清理项目输出后的默认并发构建失败，日志 `.lake/m7-clean-build.log` 包含
`std::bad_alloc`、Windows 退出码 3221226505/3221225477 及导入文件读取错误。
报错所指的 Lean/mathlib 库文件经检查仍存在且非空。随后再次执行
`lake clean ggc_power_closure`，核实 `.lake/build` 不存在，再以当前命令进程的
`LEAN_NUM_THREADS=2` 重跑默认目标；不更改项目源码、依赖或系统持久设置。
线程池环境变量的行为已对照 [Lean 官方任务与线程文档](https://lean-lang.org/doc/reference/latest/IO/Tasks-and-Threads/)，
并在已安装 4.32.2 运行库中核对该变量。第二次日志为
`.lake/m7-clean-build-threads2.log`：退出码 0，3939 jobs。逐项比对构建日志与
源码模块清单，全部 136 个项目 Lean 模块均有本次 `Built` 记录。

单独运行 `lake env lean AxiomAudit.lean`：退出码 0，日志
`.lake/m7-completion-audit.log`。883 项公理检查与审计源文件中的 883 条声明逐项
计数相符；所有实际公理均在白名单内。两份最终成功日志均无 warning、error、
`sorryAx` 或 `ofReduceBool`。源码扫描未发现未完成证明或新增非白名单公理；
`git diff --check` 通过。

固定环境仍为 Lean 4.32.2、mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`，mathlib 检出无本地修改。蓝图 SHA256
仍为 `AEDB0D9A2B5D1FD9ADA47B7CF033FB3B4303D745472957C17F30B70B8B1028BD`。
外部契约的本地传递导入仅涉及 `RandomMeasure`、`Posterior`、`StickBreaking`
三个共享语义模块，没有依赖 `main` 或项目核心推导。

从 `formalization` 目录复现最终检查，使用固定工具链的实际可执行文件：

```powershell
$taskLake = 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe'
$env:LEAN_NUM_THREADS = '2'
& $taskLake clean ggc_power_closure
& $taskLake build
& $taskLake env lean AxiomAudit.lean
```

`clean` 显式指定本项目包名，清理的是 `formalization/.lake/build`；固定依赖的
构建缓存保留。因此本节的干净构建是项目源码的重新编译，不声称从零重编译全部
mathlib。环境变量仅作用于运行这些命令的进程环境。

干净构建与独立审计一致确认 `GGC.ggc_rpow` 的实际文献依赖如下：

| ID | 公理 |
|---|---|
| E-B1 | `GGC.External.Bondesson.thorin_realization` |
| E-B3 | `GGC.External.Bondesson.finite_atomic_approximation` |
| E-J1 | `GGC.External.James.markov_krein` |
| E-J2 | `GGC.External.James.posterior_palm_nonneg` |
| E-J3 | `GGC.External.James.beta_atom_posterior` |
| E-T1 | `GGC.External.Sethuraman.stick_breaking` |
| E-S1 | `GGC.External.SSV.phase_representation` |

此外只有 `propext`、`Classical.choice`、`Quot.sound`。E-B2 仍在项目的 Thorin
刻画证明中使用，但不在最终主定理的依赖链中；没有新增 E-B4 或其他公理。
上述七个外部文献输入仍是公理，尚未在本项目中给出 Lean 证明。因而准确的
结论是“项目的 GGC 幂封闭推导已在 Lean 中验证，相对于列出的文献公理成立”，
不能声称已消除全部外部数学公理。

### 蓝图施工节点结案表

此表记录施工验证；M2–M7 的独立设计验收仍待设计师进行，不改写只读蓝图。
旧报告中的未完成状态保留为历史检查点，以本表和本节最终验证为准。

| 节点 | 施工验证状态 | 主要证据 |
|---|---|---|
| M0 | `verified`，设计已验收 | [第 4 节](#m0-design-acceptance-2026-09-23)，固定接口和环境 |
| M1 | `verified`，设计已验收 | [第 6 节](#m1-design-acceptance-2026-09-23)，刻画、唯一性和最终约化 |
| M2 | `verified`，相对于登记输入 | [第 11 节](#m2-completion-2026-09-24)、[第 15 节](#m2-quantile-completion-2026-09-24)，Dirichlet/后验、phase、tangent、有序分位数及公共空间 |
| M3 | `verified`，相对于登记输入 | [第 12 节](#m3-completion-2026-09-24)，实际生成元与绝对收敛的 resolvent 恒等式 |
| M4 | `verified`，相对于登记输入 | [第 16 节](#m4-completion-2026-09-24)，公共空间耦合与平均生成元连续性 |
| M5 | `verified`，相对于登记输入 | [第 18 节](#m5-completion-2026-09-24)，实际 Euler 构造和有限时域弱解存在性 |
| M6 | `verified`，相对于登记输入 | [第 19–24 节](#m6-completion-2026-09-24)，矩、端点、测试域、分割唯一性及实际幂律识别 |
| M7 | `verified`，相对于登记输入 | 本节；`GGC.ggc_rpow` 的完整类型、干净构建和公理白名单审计 |

所有蓝图核心推导均已有 Lean 证明，最终目标没有遗留的存在性、有限输入封闭性或
额外矩条件前提。本次未发现项目数学证明错误；后续工作是独立设计复核以及另行
形式化上述文献输入，不属于此白名单下尚未完成的核心施工节点。
