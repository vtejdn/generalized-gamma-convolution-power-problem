# Mathlib API Cross-Reference / Shared Reuse Index

**Final acceptance (2026-09-25): F-01 and F-02 are closed.** Both J2/J3
public interfaces have the historical measurable-only types, verified by fresh
Lean elaboration and exact type-expression comparison. The main theorem remains
accepted relative to E-S1. Earlier claims that topology instances belonged to
the original types remain withdrawn; the repaired interfaces are accepted on
new evidence. See [Section 56](ConstructionReport.md#f01-designer-acceptance-2026-09-25)
for the build, seven contract checks and 1067-result audit.

Updated: 2026-09-25. Joint maintainers: **designer and constructor**.
Policy: [README reuse workflow](README.md#mathlib-reuse-workflow).
Design gate: [Blueprint Section 4.3](Blueprint.md#module-reuse-gate).

This is the shared current index of reuse decisions and search gaps.
[ConstructionReport.md](ConstructionReport.md) retains chronological evidence;
the Blueprint owns mathematical contracts and stage acceptance. Both roles may
edit this index during work. Constructors add searches, candidates, real uses,
compilation evidence and gaps. Designers add contract decisions, ownership and
independent acceptance. Record the reason when revising another entry; preserve
its evidence link. Updating this file does not authorize changing the Blueprint
or expanding the external-axiom whitelist.

**E2 independently accepted:** API-062–066 record compiled local proofs
for E-B1/E-B3 and are `accepted` at their full contracts. Construction evidence
is in the [E2 report](ConstructionReport.md#e2-construction-2026-09-24); the fresh
independent build, audit and type checks are in
[Section 34](ConstructionReport.md#e2-design-acceptance-2026-09-24).
The source inventory retains provenance; E-B1/E-B3 denote local theorems.
E2-P removes unused E-B2 and its two optional interfaces (API-067, verified:
3950-job default rebuild and 954/954 direct audit checks). The E3 proposal uses API-068-071; API-072/073 are follow-on
candidates. API-068 is independently accepted for the complete E3.0 joint law
and its 13 standard-logic-only theorems. API-069/070 now have complete local
proofs, independently accepted in report Section 44. API-071 records the independently accepted bounded E3.3 proof (Section 46);
API-072/073 and API-077/078/080/081 now have independently **accepted** `minimal_use_compiled` E4 implementations; [Blueprint Section 27](Blueprint.md#e4-design-acceptance-2026-09-25) and [report Section 53](ConstructionReport.md#e4-design-acceptance-2026-09-25) record the clean build, full audit and contract review. Sections 25–26 retain the size-bias/T1/J2 construction contracts. The user excludes S1 formalization: API-074/079 are withdrawn from construction scope, with their source evidence retained. API-075 records the independently accepted Thorin interface relocation.
<a id="design-acceptance-2026-09-24"></a>
## Current independent acceptance — updated 2026-09-25

The accepted E2 baseline review reran a clean project build (3950 jobs;
147/147 fresh project modules), the direct audit (957/957 matching checks),
and a separate full original-type compatibility probe. All new public core
declarations and both endpoints use standard logic only. See the
[E2 independent record](ConstructionReport.md#e2-design-acceptance-2026-09-24).
Earlier M7/E1 evidence remains in its dated reports. E3.1/E3.2 preserve the main
proof type and four steps while reducing its current literature dependencies
to four at acceptance (Section 44). E3.3 now retires general J1 after proving
the bounded replacement, leaving three at that snapshot; independent E3.3 acceptance is recorded in Section 46. E4 is now independently accepted in Section 53, leaving E-S1 alone beyond standard logic.

| Entries / scope | Current design decision |
|---|---|
| API-001, API-009–010 | Prior M1 acceptance retained and revalidated in the complete build. |
| API-002–008, API-011–059 | `accepted` for the submitted production contracts in M2–M6 at the pinned revision. External-interface entries accept the stated trust boundary and local adapters, not proofs of the literature axioms. |
| API-060 | Initial data and final law assembly `accepted`; M7 is closed after the user withdrew RV-1. E1 is tracked separately under API-061. |
| API-061 | `accepted`: root `Definitions` migration, explicit main proof and audit ownership independently verified. E1 preserved the then-seven literature dependencies; E2 separately reduced the set to five without changing the theorem's scope; E3.2 reduced it to four; E3.3 construction now leaves three. |
| API-062–066 | `accepted`: independent foundation, generic Laplace tightness, finite grid and positive weights, drift/normalization, and unchanged E-B1/E-B3 endpoints. Full scope, imports, original types and standard-logic-only audit verified independently. |
| API-067 | `accepted`: E2-P default rebuild passed 3950 jobs and direct audit matched 954/954 requests. Retires unused E-B2/converse/iff; preserves the main theorem and all production consumers. |
| API-068 | `accepted`: complete E3.0 joint law, exact primitive type and 13 standard-logic-only proofs. Submitted 148-module clean-build evidence verified; fresh default build, 967/967 direct audit and contract check passed. See report Section 39. |
| API-069–070 | `accepted`: E3.1/E3.2 production proofs and full-contract checks independently verified; report Section 44. This is a separate delivery from accepted E3.0. |
| API-071 | Bounded E3.3 production proofs compiled; general J1 retired after consumer migration. Independent acceptance: `accepted`; see Section 46. |
| API-076 | `accepted`: R2-01 correction, same-contract E-J3 relocation and superseded probe retirement; fresh build, 1005/1005 audit and seven contract endpoints passed. See report Section 49. |
| API-075 | Implemented structural migration of locally proved E-B1/E-B3 into `Thorin.Interfaces`; no axiom reduction; independently accepted (report Section 42). |
| API-072–073, API-077–078, API-080–081 | `accepted`, with `minimal_use_compiled` evidence: complete shared size-bias, full T1/J2, partition/Giry extension and exact joint-law adapters. Independent clean build: 158/158 fresh modules; audit: 1067/1067; all seven shared checks pass. [Report Section 53](ConstructionReport.md#e4-design-acceptance-2026-09-25). |
| API-074, API-079 | `withdrawn_from_scope`: S1 formalization is excluded by the user. Retain prior `source_read` evidence as history; E-S1 is the approved sole-external-input target after full T1/J2 acceptance. |
| GAP-001–004, GAP-006 | Project proof obligations closed in the accepted implementations; scoped library-search gaps remain documented. |
| GAP-005 | E-B1/E-B3 closed by local proofs; E2-P removes unused E-B2; E3.2 proves full E-J3, leaving four at E3.1/E3.2 acceptance (Section 44). E3.3 bounded construction retires general J1, leaving three actual/main axioms; independent acceptance is complete (Section 46). S1-SOURCE is closed by independent source review. E-S1 is retained as the final external input; its local formalization is excluded by user scope. E4 proves J2/T1 locally; constructor evidence is in Section 52, independently accepted in Section 53; the actual/main axiom set is exactly E-S1 beyond standard logic. |

Acceptance concerns the actual types, adapters and compiled consumers. It does
not assert that every possible library reuse has been exhausted. Earlier
construction evidence remains below with its original build counts; this
section supplies the current decision for those entries. The user has withdrawn
RV-1; no random-variable adapter is needed. E1 is independently accepted with
root `Definitions.lean`, preserving the existing mathematical acceptance.

## Evidence and maintenance conventions

Check creation, role ownership, execution and retirement follow the user-approved
[Checks policy](Checks/README.md). Record whether evidence comes from an active
check, a superseded historical probe or a production proof. E3BetaGammaContract
is constructor-authored and designer-verified; E3BetaGammaReuse was a historical
designer probe covered by production proofs and is now deleted. Its dated
results remain in the construction report; it is not a current check.

- Stable IDs `API-001`, etc. identify reusable components; `GAP-001`, etc.
  identify unresolved obligations. Reports and consumers should cite these IDs.
  Do not renumber existing IDs when adding entries.
- Evidence levels: `to_find → source_read → #check_passed → minimal_use_compiled`.
  Track design acceptance separately: `pending / accepted / needs_revision`.
  An API probe can compile while its project theorem remains unproved.
- Unless specified otherwise, source paths below are relative to
  `.lake/packages/mathlib/Mathlib/`; replace `/` by `.` and omit `.lean` for
  the corresponding `Mathlib.…` import. Pin: Lean **4.32.2**, mathlib
  **`905b95818eb32af7874a58b427f50c1711a5e96c`**. Evidence does not automatically
  transfer to another revision or a different set of hypotheses.
- Prefer tracked production uses as evidence. For a future interface supported
  only by an ignored experiment, retain a tracked minimal probe and its
  acceptance command before relying on it. Do not duplicate probes for an
  existing production proof. No durable sampling-probe file is claimed here.
- Search absence is scoped to the inspected source and types. Add the closest
  rejected candidate, exact mismatch and next search trigger, not an assertion
  that no theorem exists anywhere in mathlib.

**Initialization provenance:** this index extracts the
[2026-09-24 reuse audit](ConstructionReport.md#mathlib-reuse-2026-09-24), denoted
**R10**, and the [independent M1 acceptance](ConstructionReport.md#m1-design-acceptance-2026-09-23),
denoted **M1**. R10 reports a 3592-job build, direct audit and reuse probe;
this documentation update does not rerun those commands or accept M2/M3.
R10's commands were `lake build`, then `lake env lean AxiomAudit.lean` and
`lake env lean .lake/ReuseCheck.lean`, using the pinned executable recorded
there. Its logs are `.lake/mathlib-reuse-{build,audit,probe}.log`.

## API mapping

The conditions below record project-relevant scope; read each full pinned
Lean type before a new use. Names on the mathlib side are library declarations;
names on the project side are compatibility lemmas or consumers.

| ID / contract and owner | Pinned library source and API | Decision / actual project evidence | Scope and remaining boundary | Evidence / design acceptance |
|---|---|---|---|---|
| API-001 — gamma laws and independent finite sums; `Definitions`, `GGC.FiniteGamma` | `Probability/Distributions/Gamma.lean`: `ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.isProbabilityMeasure_gammaMeasure`; `MeasureTheory/Measure/FiniteMeasurePi.lean`: `MeasureTheory.ProbabilityMeasure.pi` | Reuse distributions and product, retain readable project wrappers. [Definitions](Definitions.lean), [FiniteGamma](GGC/FiniteGamma.lean): `finiteGammaLaw_toMeasure` exposes actual product/sum by `rfl`. | Positive shapes/rates; allow zero summands. Normalization does not supply Laplace/log-moment formulas. | `minimal_use_compiled`; M1 accepted; R10 reconfirms reuse |
| API-002 — exponential tilt; `GGC.ExponentialTilt` | `MeasureTheory/Measure/Tilted.lean`: `MeasureTheory.Measure.tilted`, `MeasureTheory.isProbabilityMeasure_tilted`, `MeasureTheory.integral_tilted`, `MeasureTheory.integral_exp_tilted` | Reuse object and integration API. [ExponentialTilt](GGC/ExponentialTilt.lean): `exponentialTilt_eq_tilted`, `exponentialTilt_toMeasure`, `integral_exponentialTilt`. | Nonnegative probability law and positive damping parameter; exponential integrability is proved. Preserve normalized density; prove needed signed-test integrability separately. | `minimal_use_compiled` reported by R10; design accepted (2026-09-24) |
| API-003 — parameterized pushforward; shared posterior foundation | `Probability/Kernel/MeasurableLIntegral.lean`: `ProbabilityTheory.Kernel.measurable_kernel_prodMk_left` | Reuse kernel section theorem. [Posterior](GGC/Foundations/Posterior.lean): `measurable_probability_map_parameterized`, `atomMixtureLaw_jointlyMeasurable`. | Library kernel finiteness/measurability assumptions must hold; project supplies probability kernels. This uses Giry structure and does not prove weak-topology Borel compatibility. | `minimal_use_compiled` reported by R10; design accepted (2026-09-24) |
| API-004 — varying-law Bochner integrals; posterior/phase consumers | `Probability/Kernel/MeasurableIntegral.lean`: `MeasureTheory.StronglyMeasurable.integral_kernel_prod_right` | Shared adapter and direct uses. [Posterior](GGC/Foundations/Posterior.lean): `measurable_probability_integral`; [StieltjesPhase](GGC/StieltjesPhase.lean): `measurable_complexStieltjesMean`. | Check the full target-space and kernel typeclasses. Measurability of an integral-valued function does not establish absolute integrability of every section. | `minimal_use_compiled` reported by R10; design accepted (2026-09-24) |
| API-005 — real digamma convention; Gamma/Beta analysis | `Analysis/Calculus/LogDeriv.lean`: `logDeriv`; `Analysis/SpecialFunctions/Gamma/Digamma.lean`: `Complex.digamma` | Reuse logarithmic derivative, retain real wrapper. [GammaAnalysis](GGC/GammaAnalysis.lean): `digamma_apply` (`rfl`), `digamma_eq_re_complex`. | Real/complex agreement for positive arguments; preserve `digamma (B + 1)`. Absolute log moments and compact-parameter bounds remain distinct analytic obligations. | `minimal_use_compiled` reported by R10; design accepted (2026-09-24) |
| API-006 — complex Stieltjes integral; `GGC.StieltjesPhase` | `MeasureTheory/Measure/ResolventTransform.lean`: `MeasureTheory.resolventTransform`, `MeasureTheory.integrable_resolvent`; `measurable_resolvent` is used by the bridge | Retain positive-rate convention and transport once. [StieltjesPhase](GGC/StieltjesPhase.lean): `complexStieltjesMean_eq_resolventTransform`. | Map rates to reals; evaluate the library `(b-a)⁻¹` transform at `a = -z`. Check its support condition for nonreal arguments. Do not exclude rates accumulating at zero or infer boundary representation. | `minimal_use_compiled` reported by R10; design accepted (2026-09-24) |
| API-007 — projection to unit interval; `GGC.BetaPosterior` | `Order/Interval/Set/ProjIcc.lean`, `Topology/Order/ProjIcc.lean`: `Set.projIcc`, `Set.projIcc_of_mem`, `continuous_projIcc` | Reuse projection. [BetaPosterior](GGC/BetaPosterior.lean): `unitWeight`; R10 checks its value is `max 0 (min 1 z)` by `rfl`. | Match endpoints and out-of-interval behavior; projection alone says nothing about the beta distribution. | `minimal_use_compiled` reported by R10; design accepted (2026-09-24) |
| API-008 — joint sampling of supplied laws | `Probability/Kernel/Representation.lean`: `ProbabilityTheory.Kernel.exists_measurable_map_eq_unitInterval` | R10's ignored probe is now a tracked production adapter: `Foundations/Sampling.exists_joint_probability_sampler`, `probabilitySampler`, its measurability and exact map law. This generic adapter remains available and audited; API-027 refines the real base-location witness to meet the additional ordered-coupling contract. | Nonempty standard Borel target; input is an actual evaluation Markov kernel. Joint measurability and marginal laws do not imply the pathwise quantile coupling needed in M4. Common mass-one events and DP law identification are separately proved. | `minimal_use_compiled`; prior `GGC.RateRealization` build passed; refinement validation recorded under API-027; design accepted (2026-09-24) |
| API-009 — Laplace uniqueness without moments; `GGC.Laplace` | `MeasureTheory/Measure/FiniteMeasureExt.lean`: `MeasureTheory.ext_of_forall_mem_subalgebra_integral_eq_of_polish` | Specialize separating bounded exponential algebra on nonnegative reals. [Laplace](GGC/Laplace.lean): `measure_eq_of_laplace_nat_eq`, `nonnegLaw_eq_of_laplace_eq`. | Finite measures / nonnegative probability laws; no new moment assumption. A different transform uniqueness theorem is not a direct replacement without a proved analytic bridge. | `minimal_use_compiled`; independently accepted in M1 |
| API-010 — original-GGC weak closure; `GGC.WeakClosure` | `MeasureTheory/Measure/LevyProkhorovMetric.lean`: `MeasureTheory.instMetrizableSpaceProbabilityMeasure`; `Topology/Sequences.lean`: `mem_closure_iff_seq_limit` | Reuse metrizability and sequential closure. [WeakClosure](GGC/WeakClosure.lean): `isGGC_iff_mem_closure`, `isGGC_of_tendsto`. | Actual weak probability limits; no Thorin axiom or uniform moment requirement. | `minimal_use_compiled`; independently accepted in M1 |

## Scoped gap and candidate list

### M2 calculus and realization follow-up (constructor, 2026-09-24)

| ID / exact contract | Pinned source / candidate | Decision and production evidence | Remaining boundary / review |
|---|---|---|---|
| API-011 — differentiate damped integrals without original-law moments | `Analysis/Calculus/ParametricIntegral.lean`: `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; `Analysis/SpecialFunctions/Pow/Asymptotics.lean`: `tendsto_rpow_mul_exp_neg_mul_atTop_nhds_zero`; `Real.isLittleO_log_id_atTop` | Reuse dominated differentiation and asymptotics; local bounds handle `x=0`, positive parameter neighborhoods and arbitrary `NonnegLaw`. Tracked uses: `DampedMoments`, `PowerTangent`, `StieltjesCalculus`. `lake build GGC.GammaDirichletTangent` passed (2897 jobs). | Actual tangent, mixed derivatives and normalized formula proved; not a phase or Dirichlet existence theorem. `minimal_use_compiled`; design accepted (2026-09-24). |
| API-012 — Gamma first moment and signed product integration | `Probability/Distributions/Gamma.lean`, `Analysis/SpecialFunctions/Gamma/Integral.lean`: `Real.GammaIntegral_convergent`, `Real.Gamma_eq_integral`; `MeasureTheory/Integral/Prod.lean`: `MeasureTheory.integral_prod_symm` | Reuse Gamma integrals, the recurrence and Fubini. `integrable_self_gammaLaw`, `integral_self_gammaLaw`, `integral_gammaDirichletLaw`, `normalized_powerTangent` compile. Integrability comes from actual tilted laws before splitting signed integrals. | Positive shape, unit rate; original mass coefficient is `digamma (B+1)`. No extra support or moment hypothesis. `minimal_use_compiled`; design accepted (2026-09-24). |
| API-013 — fixed countable product space and independent coordinates | `Probability/Independence/InfinitePi.lean`: `MeasureTheory.Measure.infinitePi`, `ProbabilityTheory.iIndepFun_infinitePi`, `MeasureTheory.Measure.infinitePi_map_pi`; independent-product integration and `lintegral_tsum` | `CommonUniforms` proves the common event from summable residual-product expectations. `DirichletRealization` proves the input product law, joint maps and actual DP/posterior laws. The universal mass/base quantifiers are inside a single a.e. assertion. | Fractions and base locations are independent; stick weights are dependent. No parameter continuity is claimed. `minimal_use_compiled` through `GGC.RateRealization`; design accepted (2026-09-24). |
| API-014 — Poisson boundary recovery | `Analysis/Complex/Harmonic/Poisson.lean` gives disk formulas; `MeasureTheory/Integral/PeakFunction.lean` requires continuity at the evaluation point; `VitaliFamily.ae_tendsto_average_norm_sub`, `Besicovitch.tendsto_filterAt`; `ProbabilityTheory.integrable_cauchyPDFReal`, `integral_cauchyPDFReal_eq_one` | Disk and continuous-point formulas are rejected as direct replacements. Adapt the closed-ball estimate in `ContDiffBump.ae_convolution_tendsto_right_of_locallyIntegrable`, with an L¹ tail bound. Tracked `ApproximateIdentity.ae_tendsto_dilation_integral` and `PoissonBoundary.ae_tendsto_halfLine_cauchy_integral` prove the required bounded-measurable recovery. | `GGC.StieltjesPhase` build passed: Poisson identity, a.e. recovery of the fixed-height limsup, anchor-one formula and a.e. uniqueness. Recovery uses no new axiom. `minimal_use_compiled`; the separate varying-law L¹-kernel convergence is now proved under API-024. |
| API-015 — narrow Borel versus Giry structure | Full pinned-source searches in `GiryMonad`, `ProbabilityMeasure`, `FiniteMeasure`, `LevyProkhorovMetric`, `Prokhorov`, and global `BorelSpace`/`StandardBorelSpace` probability-instance searches | No existing matching compatibility instance was located. `Foundations/ProbabilityBorel.probabilityMeasure_measurable_eq_borel` now proves equality for second-countable metric Borel spaces. | The installed `probabilityMeasureBorelSpace` certifies the existing Giry instance; it does not replace it. Applies to real and positive-rate laws. `minimal_use_compiled`; M2 measurable-structure gap closed, design accepted (2026-09-24). |
| API-016 — finite atomic approximations for the measurable-structure bridge | `StronglyMeasurable.approx`, `StronglyMeasurable.tendsto_approx`; `Measure.ae_mem_finset_iff_map_eq_sum_dirac`; `FiniteMeasure` continuous addition/scaling; `measurable_of_tendsto_metrizable`; `ProbabilityMeasure.le_liminf_measure_open_of_tendsto`; `Measurable.measure_of_isPiSystem_of_isProbabilityMeasure` | `Foundations/ProbabilityBorel` approximates the identity by simple functions, writes each pushforward as a finite continuous atomic combination, and passes to its narrow limit. The reverse direction uses open-set evaluation and the Giry pi-system API. | Production bridge compiled with no external axiom. No new separability theorem for the whole probability space was needed. `minimal_use_compiled`; design accepted (2026-09-24). |
| API-017 — positive-rate transport and normalization | `Real.expOrderIso.toHomeomorph.toMeasurableEquiv`, `Real.log_of_pos`; `FiniteMeasure.normalize`, `FiniteMeasure.self_eq_mass_smul_normalize`; `RandomMeasure.IsDirichletProcess.map` (tracked local finite-partition adapter) | `RateRealization` reuses the standard equivalence and normalization, proves both inverse law maps, transports common-space DP/posterior samples, and proves existence for arbitrary finite, nonzero positive-rate bases. | `lake build GGC.RateRealization` passed (3182 jobs). Normalization is used only at finite, positive total mass. `minimal_use_compiled`; design accepted (2026-09-24). |
| API-018 — Beta fraction from a uniform coordinate | `MeasureTheory.Measure.ext_of_Iic`, `ProbabilityTheory.beta`, `ProbabilityTheory.betaPDFReal`, `Real.Gamma_add_one`, `intervalIntegral.integral_rpow`; monotonicity/inversion of positive real powers | `UniformBeta.uniformBreak_map` proves the exact law of `1-T^(1/B)` locally by its CDF, including interval endpoints. E-T1 supplies only the final stick-sum DP law. | Production specialization compiled through `GGC.DirichletRealization`; design accepted (2026-09-24). |
| API-019 — deferred E-S1 and E-T1 source contracts | API-014's analytic search and API-008/013's probability search do not provide the bounded transform-phase representation or finite-partition stick-sum DP theorem | Register only the preapproved source-derived primitive contracts in `External.SSV.phase_representation` and the now-local `GGC.stick_breaking`; full types and source adaptations are in the external inventory and audit. | The SSV representation remains an explicit assumption; the stick-breaking law is locally proved. Boundary recovery, common event, Beta transform law, measurable versions, and tangent calculus are local proofs. The SSV declaration checks an assumption type; E4 now proves the complete stick-breaking contract locally (Section 52). |

| API-020 — M3 positive scaling and exponential jump coordinates | `MeasureTheory/Integral/IntegralEqImproper.lean`: `MeasureTheory.integral_comp_mul_left_Ioi`, `integrableOn_Ioi_comp_mul_left_iff`; `MeasureTheory/Function/JacobianOneDim.lean`: `MeasureTheory.integral_image_eq_integral_abs_deriv_smul`, `integrableOn_image_iff_integrableOn_abs_deriv_smul`; Bochner `integral_withDensity_eq_integral_toReal_smul`, `integrable_withDensity_iff_integrable_smul'`; `Integrable.bdd_mul` | `PhaseResolvent` reuses positive scaling and bounded multiplication; the inspected Ioi integrability-scaling theorem is unnecessary for its direct L¹ bound. `JumpCoordinates` reuses the injective Jacobian and density APIs to prove both the L¹ equivalence and the signed integral identity for the actual `jumpMeasure`. No direct exp/log jump-measure adapter was found. | `minimal_use_compiled`: default build passed (3773 jobs), tracked adapters audited. Compensation remains intact at `u=1`; its exceptional singleton has zero measure. No additional phase or moment hypothesis. design accepted (2026-09-24). |

| API-021 — M3 absolute posterior Fubini and Palm | `MeasureTheory/Integral/Prod.lean`: `MeasureTheory.Integrable.comp_snd`, `Integrable.integral_prod_left`, `integral_integral_swap`; `MeasureTheory/Function/L1Space/Integrable.lean`: `Integrable.mul_bdd`; `Probability/Kernel/Composition/IntegralCompProd.lean`: `MeasureTheory.Measure.integrable_compProd_iff`, `Measure.integral_compProd` | `PosteriorResolvent` reuses product domination by the integrable Taylor remainder and bounded phase. `PalmResolvent` proves sampling-joint L¹ using the integrated norm and `W ≤ M` before invoking the existing signed `posterior_palm` adapter. `GeneratorResolvent` uses M2's exact tangent and rate-law pushforward. | `minimal_use_compiled`: default build passed (3773 jobs), separate audit passed (341 declarations). Absolute sample drift and jump estimates, actual `(B,F)` coefficients and the final averaged identity are proved without rate/log-rate moments. design accepted (2026-09-24). |

| API-022 — M4 narrow convergence and Poisson smoothing | `ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`, `continuous_integral_boundedContinuousFunction`; `BoundedContinuousFunction.mkOfBound`; `Complex.continuousAt_arg`; dominated convergence and M2's Poisson identity | `StieltjesContinuity` reuses bounded continuous resolvent tests to prove transform and fixed-height phase continuity as the probability law varies. It transfers the Poisson identity to the canonical phase by a.e. equality and proves convergence of fixed-height pairings against integrable kernels. A uniform resolvent difference bound now also proves joint continuity in the law and positive real parameter. | `minimal_use_compiled`: default build passed (3786 jobs), separate audit passed (396 declarations). Only the canonical Poisson identity uses E-S1. API-024 now supplies the separate boundary-phase passage; fixed-height convergence alone was not used to claim it. |

| API-023 — M4 L¹ translation continuity and Poisson approximation | `MeasureTheory/Function/LpSpace/DomAct/Continuous.lean`: `MeasureTheory.Lp.instContinuousVAddDomAddAct`; `MemLp.comp_measurePreserving`, `MemLp.coeFn_toLp`; `MeasureTheory.L1.norm_eq_integral_norm`; `MeasureTheory.Integrable.coeFn_toL1`; `integral_add_right_eq_self`, dominated convergence and product Fubini | `Foundations/L1Translation` converts the existing continuous translation action on L¹ into actual absolute-integral statements. `Foundations/PoissonPairing` integrates translation errors against the standard Cauchy kernel, proves absolute product integrability before Fubini, and bounds the pairing error uniformly over measurable functions taking values in `[0,1]`. The existing pointwise `convolution_tendsto_right` does not replace L¹ convergence. | `minimal_use_compiled`: default build and separate audit passed. The translation error tends to zero as the smoothing height tends to zero; all these adapters use standard logic only. API-024 applies the uniform estimate to the varying canonical boundary phases. |

| API-024 — M4 boundary-phase pairings | `MeasureTheory.continuous_of_dominated`; `Metric.tendstoUniformly_iff`; `TendstoUniformly.continuous`; indicator integration and APIs-022/023 | `PhaseWeakContinuity` proves that Poisson-smoothed pairings converge uniformly over all positive-rate probability laws, then reuses continuity of uniform limits. L¹ kernels on `(0,∞)` are extended by zero. `continuous_integral_stieltjesPhase_mul` covers every real L¹ kernel; `tendsto_integral_stieltjesPhase_mul_of_l1` also permits the kernel to vary in L¹. | `minimal_use_compiled`: default build (3786 jobs) and separate audit (396 declarations) passed. The boundary-pairing limit uses only the existing E-S1 beyond standard logic. No pointwise phase limit, additional moment or abstract duality axiom is assumed. design accepted (2026-09-24). |

| API-025 — M4 varying positive scales | `integrableOn_image_iff_integrableOn_abs_deriv_smul`, `integral_image_eq_integral_abs_deriv_smul`; `integral_comp_mul_left_Ioi`, `integrableOn_Ioi_comp_mul_left_iff`; API-023's L¹ translation continuity | `Foundations/L1Dilation` transports a half-line kernel to logarithmic coordinates as `v ↦ exp v * f (exp v)`. Its density-scaled versions become translations, yielding L¹ continuity under positive dilations. `PhaseScalingContinuity` proves the signed scaling identity and convergence when the law, positive scale and L¹ kernel all vary. | `minimal_use_compiled`: default build and separate audit passed. The dilation foundation uses standard logic only; scaled boundary-pairing continuity additionally uses E-S1 through API-024. No pointwise phase-continuity assumption. design accepted (2026-09-24). |

| API-026 — M4 sample generator continuity | `norm_integral_le_of_norm_le_const`, `Filter.Tendsto.congr_dist`, dominated convergence, continuity of derivatives of `ContDiff` functions; `HasCompactSupport.deriv`, `exists_bound_of_continuous`; existing Taylor and jump-coordinate adapters | `LogRate/SampleContinuity` combines joint Stieltjes continuity with API-025 for the sample drift. It proves L¹ continuity of the full compensated Taylor kernel using the existing quadratic bound and finite jump second moment. `continuous_sampleGenerator_compact` supplies the joint `(B,P,y)` result for every compactly supported C² test. | `minimal_use_compiled`: default build and separate audit passed. Sample continuity uses E-S1 only beyond standard logic. APIs-028–031 now complete the separate coupling, posterior averaging and varying-outer-law obligations. design accepted (2026-09-24). |

| API-027 — ordered quantile realization and coupling | Focused searches of pinned `Probability` and `MeasureTheory` for quantile/inverse-CDF/Skorokhod exports; `Probability/CDF.lean`: `cdf_eq_real`, `monotone_cdf`, `tendsto_cdf_atBot/atTop`; `Kernel/Representation.lean` private inverse-CDF construction on `[0,1]`; `MonotoneOn.countable_not_continuousWithinAt`; `ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto'`; `unitInterval.volume_Iic` | No exported theorem with the required real ordered-quantile and a.e. pathwise convergence contract was located. `Foundations/Quantile` reuses the CDF/order/evaluation/interval-volume APIs to prove joint measurability and exact marginal laws, including atomic and mixed laws. `Foundations/QuantileContinuity` reuses Portmanteau and countability of monotone discontinuities for a.e. coupling. The real-location witness in `DirichletRealization` is refined to this sampler; API-008's generic adapter remains available. | `minimal_use_compiled`: full default build passed (`3791` jobs); independent audit passed (`413` declarations), including all 17 quantile results, which use standard logic only. Dirichlet, posterior, tangent and generator consumers rebuild successfully. No sampling or coupling axiom is added. A.e. convergence of locations alone does not establish continuity of stick sums, posterior averaging or the full generator; APIs-028–031 now prove those additional steps. design accepted (2026-09-24). |

| API-028 — M4 continuity of probability-weighted stick sums | `Analysis/Normed/Group/Tannery.lean`: `tendsto_tsum_of_dominated_convergence`; `Analysis/Normed/Group/InfiniteSum.lean`: `Summable.of_norm_bounded`, `tsum_of_norm_bounded`; `MeasureTheory/Integral/Bochner/SumMeasure.lean`: `integral_sum_dirac`; `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`, `continuous_map`; `Real.continuousAt_rpow` | Searches of infinite sums and measure/integral convergence did not locate a direct discrete Scheffe contract for probability weights. `Foundations/ProbabilitySeries.tendsto_tsum_abs_sub_probability` applies the existing dominated-series theorem to the minimum of varying and limiting weights. `tendsto_probability_weighted_tsum` and `Foundations/StickContinuity.tendsto_stickProbability` reuse it for bounded tests, with the library Dirac-integration and narrow-convergence APIs. | `minimal_use_compiled`: default build passed (3814 jobs), independent audit passed (455 declarations). These foundations use standard logic only. The mass-one common event supplies normalization for every mass; no independence of stick weights or extra rate moments are assumed. design accepted (2026-09-24). |

| API-029 — M4 common-space laws from a.e. coupling | `MeasureTheory/Function/ConvergenceInDistribution.lean`: `MeasureTheory.tendstoInDistribution_of_ae_tendsto`; `Measure.infinitePi_map_eval`; measure-preserving composition and `ae_all_iff`; `ProbabilityMeasure.continuous_map` | `DirichletContinuity` transports the countable quantile coordinates through their exact uniform marginals and combines them with the parameter-independent mass-one event. It proves `ae_tendsto_ratePosteriorSample`, then reuses almost-sure-to-distribution convergence for `continuous_dirichletLaw` and `continuous_posteriorLaw`. No separate local proof of bounded dominated convergence for laws is needed. | `minimal_use_compiled`: default build passed (3814 jobs), independent audit passed (455 declarations). These coupling and law-continuity results use standard logic only. Countably generated filters are required by the library distribution theorem; the pathwise coupling itself uses arbitrary filters, and first countability yields full joint continuity. API-030 proves the separate unbounded-drift domination. design accepted (2026-09-24). |

| API-030 — M4 exact rate-posterior law and common domination | `Measure.map_map`, `Measure.map_prod_map`, `Measure.map_add`, `Measure.map_smul`, `Measure.map_dirac'`; `Real.rpow_le_rpow_of_exponent_ge'`; `integrable_map_measure`; `tendsto_integral_filter_of_dominated_convergence` | `RateSampleLaws.ratePosteriorSample_map` transports the existing real posterior mixture exactly to positive rates. `PosteriorDomination` bounds beta log terms for all nearby masses by the same uniform coordinate transformed at a larger fixed mass; integrability follows from the beta logarithmic moment and exact uniform pushforward. `LogRate/GeneratorContinuity` applies dominated convergence to prove `continuous_generator_compact` for the actual `(B,F,y)` generator. | `minimal_use_compiled`: default build passed (3814 jobs), independent audit passed (455 declarations). The exact laws and common majorant use standard logic only; actual generator continuity additionally uses E-S1 through sample continuity. A weakly continuous posterior law alone is insufficient for the unbounded sample drift. No DP uniqueness assertion or new moment assumption is used. design accepted (2026-09-24). |

| API-031 — M4 varying outer integrals | `MeasureTheory/Measure/Prokhorov.lean`: `isTightMeasureSet_of_isCompact_closure`; `Tendsto.isCompact_insert_range`; `ContinuousMap.continuous_of_continuous_uncurry`, `ContinuousMap.tendsto_iff_forall_isCompact_tendstoUniformlyOn`; `norm_setIntegral_le_of_norm_le_const`, `integral_add_compl` | `Foundations/VaryingIntegral.tendsto_integral_of_narrow_locally_uniform` reuses tightness of a weakly convergent sequence and splits the integral error on a compact set and its uniformly small complement. `LogRate/Continuity` obtains local uniform convergence from joint generator continuity and reuses `generator_compactTest_bound` to prove `averaged_generator_continuous`. No matching combined varying-function/varying-law theorem was located in the searched measure, integral and convergence interfaces. | `minimal_use_compiled`: default build passed (3814 jobs), independent audit passed (455 declarations). The integral adapter uses standard logic only; averaged-generator continuity additionally uses E-S1. Measurability APIs-003/004 alone do not provide this result. The M4 outer-integration obligation is closed at construction level; design accepted (2026-09-24). |

| API-032 — M5 reference jump truncation | `MeasureTheory/Integral/IntegralEqImproper.lean`: `integrableOn_Ioi_deriv_of_nonneg'`, `integral_Ioi_of_hasDerivAt_of_nonneg'`; `MeasureTheory/Measure/Lebesgue/Integral.lean`: `integral_comp_neg_Ioi`; `withDensity_apply`, `ofReal_integral_eq_lintegral_ofReal` | `LogRate/JumpTruncation` reuses improper FTC and reflection for the exact mass outside a positive cutoff. Existing `integrable_sq_jumpMeasure` supplies integrability of truncated first moments by domination. No direct formula for this project's jump density was found in the inspected improper-integral and jump-measure sources. | `minimal_use_compiled`: default build passed (3825 jobs), independent audit passed (535 declarations). `truncatedJumpMeasure_mass` is exactly `2 / (exp ε - 1)`, with the uniform `2 / ε` bound. Standard logic only; design accepted (2026-09-24). |

| API-033 — M5 positive Euler kernel | `Probability/Kernel/WithDensity.lean`: `Kernel.withDensity`, `isFiniteKernel_withDensity_of_bounded`; `Kernel.measurable_kernel_prodMk_left`; `Measure.measurable_dirac`; Bochner `integral_map`, `integral_add_measure`, `integral_smul_measure` | `RetainedJumps` and `Euler` construct the specified atom-plus-retained-jump measure using the actual acceptance and drift. State-dependent translation uses measurable kernel sections; a fixed-map measurability theorem alone does not supply it. The actual `eulerKernel` has a proved Markov instance. | `minimal_use_compiled`: default build passed (3825 jobs), independent audit passed (535 declarations). For `0 < h ≤ 1/16`, the stay weight is at least `1/2`, mass is one, and the first and second increment identities are exact. Standard logic only; design accepted (2026-09-24). This is not a continuous-time existence theorem. |

| API-034 — M5 second moments and local consistency | `integral_mul_norm_le_Lp_mul_Lq`; `MeasureTheory/Function/L2Space.lean`: `memLp_two_iff_integrable_sq`; `Real.self_le_sinh_iff`; `integral_add_compl`; existing Taylor adapter `abs_taylorRemainder_le` | `EulerMoments` specializes Hölder at exponents two to bound the squared compensator by intensity times second moment. `SmallJumps` proves the omitted second moment is at most `2ε`. `EulerConsistency` proves exact compensation and bounds the single-step error by an explicit `h^(3/2) + h²*(1+y²)` expression on compact mass intervals. | `minimal_use_compiled`: default build passed (3825 jobs), independent audit passed (535 declarations). No additional first absolute jump moment is assumed. The estimate meets the required vanishing-error scale without needing a logarithmic antiderivative; cumulative time-error and limit passage remain separate obligations. Standard logic only; design accepted (2026-09-24). |

| API-035 — M5 actual iteration and moment tightness | `Measure.integrable_comp_iff`, `Kernel.integral_comp`, probability preservation by kernel composition; `Real.add_one_le_exp`, `Real.exp_nat_mul`; `mul_meas_ge_le_integral_of_nonneg`, `isTightMeasureSet_iff_exists_isCompact_measure_compl_le`, `isCompact_closure_of_isTightMeasureSet` | `EulerIteration` composes the actual state kernel with the current law, proves finite second moments by induction and a bound uniform over all admissible steps and mesh times up to a finite horizon. `Foundations/MomentTightness` specializes Markov's inequality to real second moments; `EulerTightness` applies it and Prokhorov to the whole family of mesh laws. No matching bundled second-moment-to-tightness adapter was located in the inspected tightness/Prokhorov interfaces. | `minimal_use_compiled`: default build passed (3825 jobs), independent audit passed (535 declarations). Standard logic only. Compactness of the state-law family does not give time control or a single subsequence for an entire evolution; those remain M5 obligations. design accepted (2026-09-24). |

| API-036 — M5 integrated consistency and mesh time control | `MeasureTheory/Integral/Bochner/Basic.lean`: `norm_integral_le_of_norm_le_const`, `integral_sub`, `integral_const_mul`; `Probability/Kernel/MeasurableIntegral.lean`: `StronglyMeasurable.integral_kernel`; `Finset.sum_range_sub`, `Finset.abs_sum_le_sum_abs`; API-034/035's actual one-step error and uniform moments | Integrate the compensated error against the current Euler law, retain its explicit second-moment bound, and telescope actual law increments. Compact-test generator bounds supply a uniform mesh-time estimate; the sum of consistency errors must tend to zero uniformly on a finite horizon. | `minimal_use_compiled`: `EulerWeakEstimates` proves the integrated local error, telescoping formula, uniform compact-test time bounds and vanishing cumulative error. Default build: 3891 jobs; independent audit: 624 declarations. No additional axiom or moment hypothesis. design accepted (2026-09-24). |

| API-037 — M5 compact smooth tests determine probability laws | `Analysis/Distribution/AEEqOfIntegralContDiff.lean`: `ae_eq_of_integral_contDiff_smul_eq`; `MeasureTheory/Measure/Decomposition/RadonNikodym.lean`: `Measure.integrableOn_toReal_rnDeriv`, `MeasureTheory.integral_toReal_rnDeriv_mul`; `ProbabilityMeasure.continuous_integral_boundedContinuousFunction`; `Continuous.isClosedEmbedding` | Apply the library's smooth-test separation theorem to the two Radon–Nikodym densities relative to the sum of the measures. This proves law equality from compact C² tests without reproving mollification or a density theorem. On a compact set of laws, the resulting continuous injection is a topological embedding. | `minimal_use_compiled`: `Foundations/CompactSmoothTests` proves separation and the compact-law embedding, including singular/atomic laws. The Radon–Nikodym adapter is essential because the library distribution theorem compares densities for one measure. Included in the M5 completion build/audit. design accepted (2026-09-24). |

| API-038 — M5 affine interpolation of actual laws | Searches of `ProbabilityMeasure`, `FiniteMeasure`, analysis and topology for convex mixtures and piecewise affine interpolation; `integral_add_measure`, `integral_smul_measure`, `Integrable.smul_measure`; `Nat.floor_le`, `Nat.lt_floor_add_one`, `Nat.floor_mono`; `LipschitzWith.of_dist_le_mul` | No exported equispaced probability-law interpolation contract was located. Use the standard weighted sum of measures, prove probability normalization and the integral formula, and prove the scalar interpolation estimate using the floor API and the two neighboring mesh values. | `minimal_use_compiled`: `ProbabilityMixture`, `LinearInterpolation` and `EulerInterpolation` prove normalization, exact integrals, the cross-cell time estimate, actual continuous probability interpolation and uniform moments. The next endpoint is controlled on horizon `T+1`. Included in the M5 completion build/audit. design accepted (2026-09-24). |

| API-039 — M5 a test-independent curve subsequence | `Topology/ContinuousMap/Bounded/ArzelaAscoli.lean`: `BoundedContinuousFunction.arzela_ascoli`; `ContinuousMap.isometryEquivBoundedOfCompact`; `IsCompact.tendsto_subseq`; `unique_uniformity_of_compact`, `IsEmbedding.comapUniformSpace`, `IsUniformInducing.equicontinuous_iff`, `equicontinuous_iInf_rng`; API-037's compact-law embedding | Transfer coordinatewise compact-test Lipschitz bounds through the compact-family embedding, then apply the library Arzelà–Ascoli theorem to whole probability-valued curves. The single subsequence is chosen in the curve space, before selecting a test function. | `minimal_use_compiled`: `CurveCompactness` and `EulerLimitCurve` extract one subsequence converging in `C([0,T], ProbabilityMeasure ℝ)`, whose topology is uniform narrow convergence on this compact time domain. Uniformity is transported using uniqueness on compact spaces. Included in the M5 completion build/audit. design accepted (2026-09-24). |

| API-040 — M5 moments of weak limits | `MeasureTheory/Measure/Portmanteau.lean`: `lintegral_le_liminf_lintegral_of_forall_isOpen_measure_le_liminf_measure`, `ProbabilityMeasure.le_liminf_measure_open_of_tendsto`; `ofReal_integral_eq_lintegral_ofReal`, `lintegral_ofReal_ne_top_iff_integrable` | Reuse the unbounded nonnegative continuous-function form of Portmanteau to pass a common second-moment bound to a narrow limit. The finite nonnegative integral yields genuine Bochner integrability of the limit's square. | `minimal_use_compiled`: `MomentLimits` and `eulerCurve_limit_secondMoment` give genuine square integrability and a common moment bound for the same limiting curve. No uniform integrability hypothesis or bounded-test substitute is used. Included in the M5 completion build/audit. design accepted (2026-09-24). |

| API-041 — M5 mesh sums as time integrals | `MeasureTheory/Function/Floor.lean`: `Measurable.nat_floor`; `intervalIntegral.sum_integral_adjacent_intervals`, `integral_interval_sub_left`, `norm_integral_le_of_norm_le_const`; `integral_Ico_eq_integral_Ioc` | The left mesh function is constant on each half-open mesh cell. Reuse interval-integral additivity for the exact mesh sum and bound the last partial cell by its length times the common generator bound. Endpoint changes are justified by Lebesgue-null singletons. | `minimal_use_compiled`: `MeshIntegral` proves the exact time-integral/mesh-sum identity and bounds the last partial cell by `h*C`. Null endpoints are handled before interval additivity. Included in the M5 completion build/audit. design accepted (2026-09-24). |

| API-042 — M5 limiting weak equation | `continuous_eval`, `continuous_eval_const`, `tendsto_integral_of_dominated_convergence`, `tendsto_nhds_unique`; APIs-031/036/039/041 for averaged-generator continuity, vanishing errors, a common curve limit and exact mesh integrals | Evaluate the common curve subsequence at its moving left mesh times, pass the actual averaged generator through joint continuity, and use its compact-mass bound for dominated convergence in time. Combine this with the cumulative and interpolation errors for every compact C² test and every time. | `minimal_use_compiled`: `EulerLimitGenerator`, `EulerWeakEquation` and `Existence` prove the time-integral limit, the total error bound `K*(h+sqrt h)`, and construct `WeakLogRateSolution` for every positive mass/horizon and initial probability with finite second moment. Default build: 3891 jobs; independent audit: 624 declarations. The existence theorem uses only E-S1 beyond standard logic. design accepted (2026-09-24). |

| API-043 — M6 first moments, rate tails and logarithmic tests | `MeasureTheory/Function/L2Space.lean`: `MeasureTheory.memLp_two_iff_integrable_sq`; `MemLp.integrable`; `Analysis/Convex/Integral.lean`: `ConvexOn.map_integral_le`; `Analysis/Convex/Mul.lean`: `convexOn_pow`; `mul_meas_ge_le_integral_of_nonneg`, `setIntegral_le_integral`; standard exponential/logarithm monotonicity | Reuse L²-to-L¹ and Jensen for `F(abs y) ≤ sqrt(F(y²))`, and integral monotonicity for the first-moment tail bound. Prove the project logarithmic test bound `log(1+s*exp(-y)) ≤ log(1+s)+max(-y)0`, then transport through the existing rate pushforward and scaling. | `Foundations/MomentBounds` and `Identification/LogTests` compile in the 3907-job default build; public declarations are audited. Squared moments concern log rates, not rates or values. No exponential moment is assumed. `minimal_use_compiled`; design accepted (2026-09-24). |

| API-044 — M6 actual value laws from admissible log rates | Existing compiled `Thorin.exists_law_thorinLaplace`, `nonnegLaw_eq_of_laplace_eq`, `HasThorinRepresentation.isGGC`; `integrable_map_measure`, `integral_map`, `integral_smul_measure`; API-043's bounds | Choose the E-B1 realization of the proved admissible zero-drift data. Expose the exact transform in log-rate coordinates and prove the uniform positive Laplace lower bound from the same second-moment bound supplied by M5. | `Identification/ValueLaw` compiles and is audited. Strict positivity, moment bounds and narrow continuity are separately proved in API-046–051; they are not inferred from witness choice. No added literature contract. `minimal_use_compiled`; design accepted (2026-09-24). |

| API-045 — M6 narrow convergence for tests with linear growth | Pinned `MeasureTheory/Function/UniformIntegrable.lean` gives Vitali convergence on a fixed measure, not the present varying-law contract; `ProbabilityMeasure.continuous_integral_boundedContinuousFunction`, `BoundedContinuousFunction.mkOfBound`, `Set.projIcc`, `continuous_projIcc`, `memLp_two_iff_integrable_sq`, `integral_sub`, `abs_integral_le_integral_abs` | Clip the test's output to `[-R,R]`. The pointwise error is bounded by `f²/R`, so a common second moment gives uniform integral errors. Reuse narrow convergence for each clipped bounded continuous test and pass through the three-error estimate. Linear growth converts the log-rate second moment into a second-moment bound for the test. | `Foundations/GrowthContinuity` and its actual transform-continuity consumer compile and are audited. No unsupported unbounded-test version of narrow convergence or fixed-measure Vitali substitution is used. `minimal_use_compiled`; design accepted (2026-09-24). |

| API-046 — M6 strict positivity of value laws | Pinned global `laplace`/`tendsto` searches: the analytic Laplace transform API integrates against Lebesgue measure, not arbitrary nonnegative laws; `setIntegral_le_integral`, `integral_singleton`, `ENNReal.toReal_eq_zero_iff`, `Real.tendsto_exp_atBot`, `Tendsto.const_mul_atTop_of_neg`, `le_of_tendsto_of_tendsto` | Adapt integral monotonicity to bound the mass at zero by every positive-argument Laplace transform. The project inequality `logTest (exp r) y ≥ r-y` forces the actual value transform to vanish as `r→∞`, proving zero has no mass. This supplies strict positivity without assuming a continuous log pushforward on all reals. | `Identification/ValuePositivity` compiles and is audited. This direct Laplace proof establishes the manuscript's strict-positivity contract without a new law assumption. `minimal_use_compiled`; design accepted (2026-09-24). |

| API-047 — M6 integrability from probability tails | `MeasureTheory/Integral/Layercake.lean`: `MeasureTheory.lintegral_eq_lintegral_meas_lt`; `lintegral_ofReal_ne_top_iff_integrable`, `ofReal_integral_eq_lintegral_ofReal`, `ENNReal.ofReal_toReal`; `Integrable.measure_le_integral` | Adapt the library's nonnegative extended-integral layer-cake identity to a real-valued upper bound on finite-measure tails. Finite upper integral yields actual Bochner integrability and its bound. | `Foundations/TailMoments` compiles and is audited. The proof uses the extended-integral layer cake before establishing Bochner integrability, avoiding a circular integrability premise. `minimal_use_compiled`; design accepted (2026-09-24). |

| API-048 — M6 Laplace tail estimates for logarithmic values | `Integrable.measure_le_integral`, `integral_const_mul`, `integral_sub`, `Real.add_one_le_exp`, `Real.exp_le_exp`, `Real.log_lt_iff_lt_exp`; `Analysis/SpecialFunctions/ImproperIntegrals.lean`: `integrableOn_exp_mul_Ioi`, `integral_exp_mul_Ioi`; API-047 | Bound lower value tails by `exp 1 * L(exp r)` and upper value tails by `2*(1-L(exp(-r)))`. Combined with the actual Thorin transform, these give logarithmic moment control using layer cake. The lower-tail exponential bound uses the log-rate first moment and positive mass. | `Identification/ValueTails` and `Identification/Moments` compile and are audited. The finite uniform logarithmic-moment contract follows by Laplace tails, with a larger explicit constant than the manuscript's gamma–Dirichlet/Frullani bound. No original value moment or new external input. `minimal_use_compiled`; design accepted (2026-09-24). |

| API-049 — M6 integrated logarithmic upper-tail kernel | `integrableOn_exp_mul_Ioi`, `integral_exp_mul_Ioi`, `IntegrableOn.integrable_indicator`, `setIntegral_indicator`, `Real.volume_real_Ioc`; `MeasureTheory.integrable_prod_iff'`, `Integrable.integral_prod_left`, `integral_integral_swap`; API-043's logarithmic bounds | Split at `r=2*abs y`: the kernel `log(1+exp(-r-y))` is bounded by `log 2+abs y` before the split and by `exp(-r/2)` after it. Its positive-half-line integral is at most `4*(1+y²)`. Prove product absolute integrability before Fubini against the log-rate law. | `Identification/LogTailIntegral` and its logarithmic-moment consumer compile and are audited. Actual product absolute integrability precedes Fubini. `minimal_use_compiled`; design accepted (2026-09-24). |

| API-050 — M6 narrow continuity of realized value laws | `MeasureTheory/Measure/Tight.lean`: `isTightMeasureSet_iff_exists_isCompact_measure_compl_le`; `mul_meas_ge_le_integral_of_nonneg`; `Prokhorov.isCompact_closure_of_isTightMeasureSet`; `IsCompact.tendsto_subseq`; `Filter.tendsto_of_subseq_tendsto`; `ProbabilityMeasure.le_liminf_measure_open_of_tendsto`; existing `GGC.nonnegLaw_eq_of_laplace_eq` | Uniform absolute log moments and nonnegative support give compact containment in `[0,exp R]`. Clip only the negative part of the spatial argument to make positive-parameter exponential tests bounded continuous. Portmanteau preserves nonnegative support, and local Laplace uniqueness identifies every compactness subsequential limit. | `Foundations/LogMomentTightness`, `GGC/LaplaceContinuity` and `Identification/ValueContinuity` compile and are audited. Neither E-B1 witness choice nor static transform equality is treated as continuity. `minimal_use_compiled`; design accepted (2026-09-24). |

| API-051 — M6 positive-subtype and log-value continuity | `ProbabilityMeasure.continuous_map` requires global continuity; the pinned Portmanteau and convergence-in-distribution files supply no directly matching a.e.-continuous log-map interface. Reuse `mul_meas_ge_le_integral_of_nonneg`, Prokhorov, `IsCompact.tendsto_subseq`, `Filter.tendsto_of_subseq_tendsto`, `Measure.map_map`, `Measure.map_congr`; existing `GGC.continuous_rateLaw` | Uniform first moments make the log-value laws tight. Map extracted log-law limits through the globally continuous exponential; strict positivity gives `exp_* log_* μ = μ`, and `log ∘ exp = id` gives injectivity, identifying every subsequential limit. Map the continuous log-law curve through `rateEquiv` to produce continuous probability laws on the positive subtype with the correct real marginal. | `Foundations/FirstMomentTightness` and `Identification/LogValueContinuity` compile and are audited, including the actual Borel Markov kernel. This handles the zero boundary without assuming global continuity of `Real.log`. `minimal_use_compiled`; design accepted (2026-09-24). |

| API-052 — M6 zero Laplace endpoint | `Real.mul_exp_neg_le_exp_neg_one`; `MeasureTheory.tendsto_integral_filter_of_dominated_convergence`; `integral_const_mul`, `abs_integral_le_integral_abs`; `intervalIntegral.integral_eq_sub_of_hasDerivAt_of_tendsto` | Bound `abs(s*x*log x*exp(-s*x))` by `exp(-1)*abs(log x)`. Dominated convergence gives the zero endpoint for each law using only its absolute log moment, and a positive Laplace lower bound supplies the uniform bound. The endpoint FTC API will consume separately proved absolute integrability of the full tangent. | `Identification/LaplaceEndpoint`, `TangentIntegrability` and `TangentSpaceTime` compile in the 3912-job default build and are audited. The endpoint FTC consumes the proved absolute integrability of all tangent terms; the time endpoint uses dominated convergence. `minimal_use_compiled`; design accepted (2026-09-24). |

| API-053 — M6 absolute tangent integrability and parameter measurability | `Real.integral_rpow_mul_exp_neg_mul_Ioi`, `Real.Gamma_nat_eq_factorial`, `Integrable.of_integral_ne_zero`; `integrable_prod_iff'`, `integral_integral_swap`, `setIntegral_mono_set`; `StronglyMeasurable.integral_kernel_prod_right`, `Kernel.comap` | Reuse the shape-one and shape-two Gamma integrals for the positive Laplace kernels. Integrate their absolute-log-weighted versions by Fubini after proving product integrability. Bound the tangent's quotient and product terms with a common positive Laplace lower bound. The existing Borel value kernel supplies joint parameter measurability through mathlib's kernel-integral theorem. | `Identification/AbsoluteLaplaceKernels`, `TangentMeasurability`, `TangentIntegrability` and `TangentSpaceTime` compile and are audited. All three tangent terms, actual product integrability, the exact space-time bound and Fubini identity are proved. `minimal_use_compiled`; design accepted (2026-09-24). |

| API-054 — M6 extension of the weak test domain | `Analysis/Calculus/BumpFunction/Basic.lean`: `ContDiffBump`, `ContDiffBump.contDiff`, `one_of_mem_closedBall`, `eventuallyEq_one_of_mem_ball`, `hasCompactSupport`; `HasCompactSupport.comp_smul`; `HasCompactSupport.deriv`, `tsupport_deriv_subset`, `deriv_of_notMem_tsupport`; derivative product/chain rules and dominated convergence | Use one library bump with inner radius 1 and outer radius 2, scaled by `x/R`, and multiply the original test. Compact support and eventual equality are library consequences; explicit first/second derivative formulas give bounds uniform in `R≥1` for linearly growing C² tests with bounded derivatives. Consume the existing generator's drift and second-jump-moment estimates to pass to the weak equation. | `Foundations/SmoothCutoff`, `SmoothCutoffBounds`, `LogRate/TestLimits` and `Identification/TestExtension` compile in the 3916-job default build; 790 declarations pass the independent audit. The actual weak-equation extension and both spatial/time dominated limits are proved. `minimal_use_compiled`; see report Section 21. design accepted (2026-09-24). |

| API-055 — M6 resolvent differentiation and the time integrating factor | `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; existing `LogRate.ResolventTest` derivative bounds; `ContDiffOn.absolutelyContinuousOnInterval`, `IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral`, `IntervalIntegrable.ae_hasDerivAt_integral`, `AbsolutelyContinuousOnInterval.integral_deriv_mul_eq_sub` | Differentiate the already integrable logarithmic Thorin test with bounded resolvent derivatives. For time evolution, use the actual integral weak equation and the library's absolutely continuous FTC/product rule, so the generator need only be integrable in time. This permits the cancellation of the derivative of `B₀*exp(-t)` without assuming differentiability of the weak solution. | The actual resolvent-calculus, time-integrability, integrating-factor and resolvent-evolution consumers compile in the 3923-job full build; the independent audit checks 818 declarations. `minimal_use_compiled`; see report Section 22. design accepted (2026-09-24). |

| API-056 — M6 normalization and Laplace time evolution | `ProbabilityMeasure.continuous_integral_boundedContinuousFunction`, `Real.continuous_mul_log`; `integral_subtype_comap`, `integral_indicator`; `Integrable.integral_prod_right`, `intervalIntegral.integral_eq_sub_of_hasDerivAt_of_tendsto`, `intervalIntegral.integral_hasDerivAt_right` | Extend damped log tests continuously and boundedly to negative arguments by clipping at zero. This proves their narrow continuity without moments. Use the fixed time subtype and restricted measures to consume the proved space-time Fubini contract. Integrate the difference of logarithmic transform derivatives to zero, normalize by `L(0)=1`, and exponentiate the resulting time integral equation after proving its right-hand side continuous. | `DampedContinuity`, `Identification/ValueTime`, `LogLaplaceEvolution` and `LaplaceEvolution` compile in the 3923-job full build and pass the 818-declaration audit. `minimal_use_compiled`; see report Section 22. Undamped value moments and unjustified derivative exchanges are not assumed. design accepted (2026-09-24). |

| API-057 — M6 simultaneous C¹ polynomial approximation | `Topology/ContinuousMap/Weierstrass.lean`: `exists_polynomial_near_of_continuousOn` (proved through the library Bernstein approximation); `Polynomial.induction_on'`, `Polynomial.derivative_monomial_succ`, `Polynomial.hasDerivAt`; `norm_image_sub_le_of_norm_deriv_le_segment'` | Approximate the continuous derivative on `[0,1]`, take a polynomial primitive with the prescribed initial value, and bound the primitive error by the mean-value theorem. Searches in the polynomial algebra/calculus files found no matching primitive constructor or derivative-surjectivity theorem, so the primitive adapter uses monomial induction. No new Bernstein or Weierstrass proof is needed. | `Foundations/C1PolynomialApproximation` and the actual simultaneous generator approximation and weak-equation consumers compile in the 3932-job full build; 857 declarations pass the independent audit. `minimal_use_compiled`; see report Section 23. design accepted (2026-09-24). |

| API-058 — M6 transfer of value tests and logarithmic coordinates | `BoundedContinuousFunction.mkOfBound`, probability integral continuity, `norm_integral_le_of_norm_le_const`, `intervalIntegral.norm_integral_le_of_norm_le_const`; `hasCompactSupport_iff_eventuallyEq`, `Real.tendsto_log_nhdsNE_zero`, `ContDiffAt.congr_of_eventuallyEq`, `HasCompactSupport.intro`, `integral_map` | Reuse a shared bounded-test adapter for nonnegative laws. Polynomial induction consumes the actual Laplace evolution; simultaneous uniform bounds pass both sides of the weak equation. For logarithmic coordinates, compact support makes compositions identically zero near the singular endpoint, so the zero extension is smooth before using change of variables. | `NonnegTests`, `Identification/ExponentialTests`, `PolynomialEvolution`, `C1Evolution`, `Foundations/LogTestCoordinates`, `Identification/ValueWeakEquation` and `LogTransport` compile and are audited (3932 jobs, 857 declarations). `minimal_use_compiled`; see report Section 23. Transport uniqueness is a separate remaining obligation. design accepted (2026-09-24). |

| API-059 — M6 partition proof of dilation transport uniqueness | `IsCompact.uniformContinuousOn_of_continuous`, `Metric.uniformContinuousOn_iff`, `intervalIntegral.norm_integral_le_of_norm_le_const`, `Finset.sum_range_sub`, `ContinuousMap.continuous_of_continuous_uncurry`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, interval FTC, `Measure.map_map`, `Measure.map_congr`, `Real.rpow_def_of_pos`; existing compact C² measure separation | Exact fixed-test increments imply the backward-test cell identity. Joint continuity controls each cell; telescoping and smooth-test separation identify the measures. Exponential inversion gives the actual power law. Focused mathlib `Analysis/ODE` and `MeasureTheory` searches found no matching measure-valued weak transport uniqueness theorem; point-path ODE uniqueness alone does not discharge it. | `minimal_use_compiled`: `PartitionCancellation`, `JointProbabilityIntegral`, `BackwardTests`, `TransportUniqueness`, `DynamicIdentification`; default build 3937 jobs and independent audit 876 declarations. [M6 completion](ConstructionReport.md#m6-completion-2026-09-24). Generic uniqueness uses standard logic only. design accepted (2026-09-24). |
| API-060 — M7 finite initial data and final assembly | `FiniteMeasure.normalize`, `FiniteMeasure.self_eq_mass_smul_normalize` in `MeasureTheory/Measure/ProbabilityMeasure.lean`; `integrable_smul_measure`, `integrable_map_measure` in `MeasureTheory/Function/L1Space/Integrable.lean`; `ENNReal.sum_lt_top`, `Real.exp_log`, `Real.log_pos`; existing finite Thorin integrals, rate/log measurable equivalence, M5 existence, M6 identification and M1 weak-limit reduction | Normalize the actual finite Thorin measure, transfer its square-log integrability, identify the initial value law by proved Laplace uniqueness, then take T=log q. Treat the empty gamma sum and q=1 explicitly; general inputs use the existing power-pushforward continuity and original-definition weak closure. No new existence or closure axiom is needed. | `minimal_use_compiled`: `Identification/InitialData` and `PowerClosure`; default and clean project builds 3939 jobs, all 136 project modules freshly compiled, independent audit 883 declarations, including the complete main theorem type and axiom checks. [M7 report](ConstructionReport.md#m7-completion-2026-09-24) records exact commands and the seven literature dependencies. design accepted; M7 closed by the user scope correction; E1 migration separately accepted under API-061. |

| API-061 — E1 readable main theorem and definition-module migration (designer, 2026-09-24) | Existing project endpoints: `isGGC_power_of_isFiniteGammaConvolution` in `GGC/PowerClosure.lean`; `power_pushforward_tendsto` in `GGC/Basic.lean` (using mathlib `ProbabilityMeasure.tendsto_map_of_tendsto_of_continuous`); `isGGC_of_tendsto` in `GGC/WeakClosure.lean`; current `GGC/Reduction.lean` demonstrates their composition. | Reuse the accepted lemmas in explicit named steps in new `main.lean`; move complete target definitions to `Definitions.lean`. Retain finite-input evolution/identification detail in `PowerClosure` and its dependencies. User override: place `Definitions.lean` in the formalization root, explicitly list `Definitions` in Lake roots/globs, and redirect helpers to `import Definitions`; audit imports `main`. No fresh generic foundation or literature axiom is needed. | `minimal_use_compiled`: final root `Definitions`, `main`, and audit passed a fresh project clean build (3940 jobs; 137/137 modules freshly built), followed by direct audit (883/883 checks). The proof body exposes the four named steps and retains exactly the seven literature axioms. [E1 report](ConstructionReport.md#e1-construction-2026-09-24); independently revalidated and design accepted in [Section 29](ConstructionReport.md#e1-design-acceptance-2026-09-24), including the final English-comment version. |

The following E2 entries describe the implemented and independently accepted
construction. The owner column includes the accepted decomposition of the
original approximation contract into focused modules.

| ID / contract and owner | Pinned source and API | Decision / proposed use | Evidence and remaining work |
|---|---|---|---|
| API-062 — E2.0 independent Thorin foundation; `GGC/Thorin/Basic.lean` | Existing `GGC/Thorin.lean`: `ThorinAdmissible.integrable_log`, `ThorinAdmissible.measure_le_lt_top`, endpoint equivalence, `ThorinData`, `thorinLaplace`, `HasThorinRepresentation`, finite-atomic certificates; API-001/009/010 | Extract the existing axiom-free definitions and proofs, preserving namespaces/names; keep represented-law membership/realization adapters in the facade; its unused E-B2-dependent converse is now retired. New proof modules may import the lower layer, never the facade or `External.Bondesson`. | `minimal_use_compiled`: `Thorin.Basic` and the existing `Thorin` facade compile with unchanged public names; lower-layer axioms are standard logic only. Existing accepted proofs are moved, not duplicated. Independently revalidated; design accepted (2026-09-24), report Section 34. |
| API-063 — E2.1 tightness from a common Laplace lower bound; `GGC/LaplaceTightness.lean` | Existing `Identification/ValueTails.lean`: `measureReal_Ioi_exp_le_one_sub_laplace`; mathlib `MeasureTheory/Measure/Tight.lean`: `MeasureTheory.isTightMeasureSet_iff_exists_isCompact_measure_compl_le`; API-048 | Move the generic estimate below `Identification`; prove that `L(s) <= laplace (mu_n) s` for every n and positive s, with `L(s) -> 1` at zero from the right, implies tightness of all laws. Use nonnegative support and compact intervals; the chosen rounding/drift construction provides the common lower bound. | `minimal_use_compiled`: `isTightMeasureSet_of_laplace_lower_bound`, `exists_nonnegLaw_subseq_of_isTightMeasureSet`, `exists_nonnegLaw_of_laplace_tendsto` in `LaplaceTightness`; generic tail proofs moved without renaming. Only standard logic; arbitrary family and no moments. ValueTails consumer compiles. Independently revalidated; design accepted (2026-09-24), report Section 34. |
| API-064 — E2.2 finite-atomic rate grid and kernel convergence; `Thorin/Approximation`, `GridMeasure`, `GridMeasureMap`, `FiniteWeights`, `Sequence` | `Algebra/Order/Floor/Defs.lean`: `Nat.ceil`, `Nat.ceil_le`; `MeasureTheory/Function/Floor.lean`: `Nat.measurable_ceil`; `MeasureTheory/Integral/DominatedConvergence.lean`: `MeasureTheory.tendsto_integral_of_dominated_convergence`; existing API-062 finite-mass/atomic adapters | Restrict U to `[1/m,m]`, round positive rates upward to `ceil(m*b)/m`, represent finite cell masses by Dirac weights, discard zero cells and index positive weights by `Fin k`. Prove pointwise convergence and domination by `log(1+s/b)` on the original U. | `minimal_use_compiled`: `Thorin.Approximation` proves upward rounding and DCT on original U; `GridMeasure` proves finite cell masses and exact finite-sum integrals; `GridMeasureMap` proves the Dirac-sum pushforward. `FiniteWeights` filters zero weights using Fintype.equivFin before choosing positive shapes. `Sequence` chooses one actual finite-gamma law sequence for all s. No direct matching atomic-approximation theorem was found in the scoped library search; local adapters reuse the inspected primitives. Independently revalidated; design accepted (2026-09-24), report Section 34. |
| API-065 — E2.2 drift and zero-endpoint normalization; `Thorin/Drift`, `Normalization`, `Sequence` | Existing `GGC/FiniteGamma.lean`: `laplace_finiteGammaLaw`; `Analysis/SpecialFunctions/Log/Basic.lean`: logarithm bounds/continuity; `MeasureTheory/Integral/DominatedConvergence.lean`: `MeasureTheory.tendsto_integral_filter_of_dominated_convergence` | For a>0 append Gamma(m,m/a), prove `m*log(1+a*s/m) -> a*s` and the bound by `a*s`; omit the factor for a=0. Prove target transform tends to one at zero by domination by `log(1+1/b)` for `0<=s<=1`. | `minimal_use_compiled`: `Thorin.Drift` directly reuses Real.tendsto_mul_log_one_add_div_atTop from Analysis/SpecialFunctions/Complex/LogBounds.lean; no derivative or Gamma moment reproving. `Normalization` proves tendsto_thorinLaplace_zero directly by DCT. `Sequence` combines optional drift and finite grid and proves exact transforms, common lower bound and convergence. Both zero drift and positive drift supported; no E-B1 assumption. Independently revalidated; design accepted (2026-09-24), report Section 34. |
| API-066 — E2.3 realization/approximation assembly and E2.4 audit | `MeasureTheory/Measure/Prokhorov.lean`: `MeasureTheory.isCompact_closure_of_isTightMeasureSet`; current `GGC/LaplaceContinuity.lean`: `nonnegative_of_narrow_limit`, `tendsto_laplace_of_narrow`, `nonnegLaw_tendsto_of_laplace_tendsto`; `GGC/Laplace.lean`: `nonnegLaw_eq_of_laplace_eq` | Use API-063/064/065 to supply tightness and one actual finite-gamma sequence. Identify it with an existing target for E-B3; extract a probability subsequence to construct the target for E-B1. At E2, keep same-type public theorem wrappers in `External.Bondesson`, backed by an independent `Thorin.Realization` layer. API-075 subsequently moves these interfaces into `GGC.Thorin.Interfaces`. | `minimal_use_compiled`: `thorin_realization_core` and `finite_atomic_approximation_core` in `Thorin.Realization`; original-type wrappers in External.Bondesson now theorems. Directed endpoint audit confirms standard logic only, including existing realization/reverse-characterization consumers. E-B2 was unchanged at E2 acceptance and is subsequently retired by E2-P. Full E2 clean build and audit evidence: E2 construction report; independently revalidated; design accepted (2026-09-24), report Section 34. |


The following entries track the later scope cleanup and proposed reduction.
Pinned mathlib remains `905b95818eb32af7874a58b427f50c1711a5e96c`.
Source inspection is not minimal-use compilation; future owners are proposed.
E3.0 has an independently accepted production joint-law proof (report Section 39). API-069/070 record independently accepted local proofs (Section 44). API-071 records the independently accepted bounded E3.3 proof; API-072/073 and their shared E4 adapters are independently accepted in Section 53. API-074 is withdrawn from construction scope.

| ID / contract and owner | Reuse and scoped source evidence | Design decision / outstanding proof | Status |
|---|---|---|---|
| API-067 — E2-P unused axiom removal | Project references and accepted E2 axiom output: E-B2 feeds only `IsGGC.hasThorinRepresentation`, then `isGGC_iff_hasThorinRepresentation`; neither has a production consumer. | Remove these three declarations and obsolete audit requests; retain `HasThorinRepresentation.isGGC` and all E-B1/E-B3 proofs. Withdraw E-B4 fallback. | `accepted`: default rebuild passed 3950 jobs (72/147 project modules recompiled), followed by 954/954 matched direct audit checks. This retires scope, not a proof of the converse. See report Section 35. |
| API-068 — E3.0 Beta-Gamma joint law; `Foundations/BetaGamma` | `MeasureTheory.prod_withDensity`, `measurePreserving_prod_sub`, `MeasurePreserving.lintegral_comp`, `lintegral_image_eq_lintegral_abs_deriv_mul`, `lintegral_prod_symm`, `lintegral_withDensity_eq_lintegral_mul`, `Measure.ext_of_lintegral`; `ProbabilityTheory.beta`, `Real.Gamma_pos_of_pos`, `Real.mul_rpow`, `Real.rpow_add`, and existing `RandomMeasure.gammaShapeLaw_pos`. | The exact positive-real-shape, unit-rate contract in [Blueprint Section 20](Blueprint.md#e3-zero-construction-handoff) is proved by `GGC.BetaGamma.gamma_ratio_sum_map`. Open-support measure identities remove the Gamma zero boundary before the shear and interval scaling. `density_factorization` retains arbitrary real exponents and the explicit Jacobian. No general two-dimensional Jacobian or new normalization theory is required. | `minimal_use_compiled`: [BetaGamma.lean](GGC/Foundations/BetaGamma.lean) completes BG-0–4, including all restriction and joint-law assembly obligations. [Checks/E3BetaGammaContract.lean](Checks/E3BetaGammaContract.lean) checks the original primitive type and prints its standard-logic-only axioms. The superseded six-call design probe `Checks/E3BetaGammaReuse.lean` was deleted during API-076 closeout; its dated results remain in the report and its adopted uses are covered by production proofs. Clean build: 3951 jobs, 148/148 project modules; direct audit: 967/967 matching requests, all 13 new theorems standard-logic-only. [Section 38](ConstructionReport.md#e3-zero-construction-2026-09-24) records construction validation; [Section 39](ConstructionReport.md#e3-zero-design-acceptance-2026-09-24) records independent acceptance (`accepted`). |
| API-069 — E3.1; `GGC/Foundations/GammaDirichlet.lean` | Reuses accepted `BetaGamma.gamma_ratio_sum_map`, `gammaShapeLaw_zero/pos`, `dirichletLaw_toMeasure`, zero-coordinate and simplex lemmas; mathlib `measurePreserving_piFinSuccAbove`, `measurePreserving_prodAssoc`, `Measure.measurePreserving_swap`, `MeasurePreserving.prod/comp`, and product marginals. | Proves the actual normalized-vector/total product law for every finite nonnegative shape vector, including the all-zero extension. Positive real total gives the primitive Gamma(B,1) contract. Single-positive-coordinate laws are explicitly Dirac vertices. Positive Beta laws are used only after nonzero-shape checks. | Production proofs compiled; clean default build 3953 jobs / 150 fresh modules and direct audit 992/992. Full joint and degenerate contracts in [Checks/E3GammaDirichletContract.lean](Checks/E3GammaDirichletContract.lean). Standard logic only. Construction validation: [Section 43](ConstructionReport.md#e3-one-two-construction-2026-09-25). Independent acceptance: `accepted`; [Section 44](ConstructionReport.md#e3-one-two-design-acceptance-2026-09-25). |
| API-070 — E3.2; `GGC/Foundations/DirichletUpdate.lean` | Reuses API-069 Gamma addition and joint normalization, arbitrary-coordinate finite-product splitting, mathlib `Measure.map_prod_map` and `Measure.map_map`, existing partition and atom-mixture semantics, and finite measure/ENNReal sum APIs. | Proves Gamma coordinate addition and finite Dirichlet vertex mixing, then every partition of arbitrary U/D. Zero selected shape is allowed. Arbitrary original Z is transported only through hZ. The complete original Polish/Borel E-J3 type and binder order are preserved by the thin public theorem (now `GGC.DirichletPosterior`, API-076); the lower theorem needs only a measurable space. No DP-law uniqueness or Gamma process is assumed. | Production proofs and full original-type check compiled; clean default build 3953 jobs / 150 fresh modules and direct audit 992/992. All new proofs and the E-J3 wrapper use standard logic only. Five actual/main literature axioms become four. Construction validation: [Section 43](ConstructionReport.md#e3-one-two-construction-2026-09-25). Independent acceptance: `accepted`; [Section 44](ConstructionReport.md#e3-one-two-design-acceptance-2026-09-25). |
| API-071 — E3.3 bounded Markov-Krein; `Foundations/MarkovKreinFinite` and `Foundations/MarkovKrein` | Reuses accepted `gammaVector_normalize_sum`, existing `GGC.laplace_gammaLaw_eq_exp`, mathlib `integral_fintype_prod_eq_prod`, finite indicator integrals, `SimpleFunc.approxOn`, `approxOn_mem`, `tendsto_approxOn`, and `tendsto_integral_of_dominated_convergence`. | Proves finite Dirichlet, partition and simple-function transforms, then bounded convergence with bounds C, 1 and log(1+C). Includes mean measurability, integrability for every probability, zero shapes, C=0 and t=0. The original `dirichletMean_laplace` type is unchanged; its bound t/s is discharged internally. Deletes the unused general J1 declaration. The unbounded/log-integrable statement is retired, not proved by the bounded theorem. | `minimal_use_compiled`: 14 new theorems and both identification consumers use standard logic only. The constructor-owned [contract check](Checks/E3MarkovKreinContract.lean) covers full and endpoint types. Three literature axioms remain. Construction evidence: [Section 45](ConstructionReport.md#e3-three-construction-2026-09-25); independent acceptance: `accepted`; [Section 46](ConstructionReport.md#e3-three-design-acceptance-2026-09-25). |
| API-072 — E4.2 full E-J2 | Accepted Gamma/Dirichlet laws, planned E4.0 size-bias (API-077), partition/cylinder adapters (API-078) and joint extension (API-080). `Partition.sum_shape`, `Partition.shape_add_dirac`, exact hD/hpost finite-partition laws and the nonnegative compProd API. | E4.2a/b prove generic partition and finite-measure extension first; E4.2c calculates a common finite sum on every rectangle; E4.2d yields the full arbitrary K/Phi endpoint and migrates to `GGC.posterior_palm_nonneg` in `GGC/DirichletPalm.lean`. Delete the empty James module without aliases. Preserve the historical measurable-only contract, zero cells and infinite Phi (Section 28 supersedes the earlier topology requirement). | `accepted` / `minimal_use_compiled`: full `GGC.posterior_palm_nonneg`, arbitrary supplied K and possibly infinite Phi, with the measurable-only binders restored by F-01; final interface reacceptance is complete in [Section 56](ConstructionReport.md#f01-designer-acceptance-2026-09-25). James is deleted after caller migration. [E4 evidence](ConstructionReport.md#e4-construction-2026-09-25); independently accepted in [Section 53](ConstructionReport.md#e4-design-acceptance-2026-09-25). |
| API-073 — E4.1 full E-T1 | Accepted `dirichlet_coordinate_update`, simplex/zero-coordinate laws, `sum_stickWeight`, `hasSum_stickWeight_iff`; planned API-077 stationarity. Pinned `Probability/ProductMeasure.lean`: `Measure.infinitePi_map_restrict`; `Probability/Independence/InfinitePi.lean`: `iIndepFun_infinitePi`, `map_infinitePi_infinitePi_of_inj`; `ext_of_forall_integral_eq_of_IsFiniteMeasure`. | Attach an independent finite Dirichlet vector to each finite stick prefix; prove its invariant law, derive residual convergence from supplied hSum/probability status, and identify every partition limit by bounded continuous tests. Preserve arbitrary measurable E/Omega and full hInput/Q contract. Public destination: `GGC.stick_breaking` in `GGC/DirichletStickBreaking.lean`; remove Sethuraman after migration. | `accepted` / `minimal_use_compiled`: finite paired prefixes from the exact input law, stationary attached vectors, mass-to-HasSum, pointwise prefix convergence and bounded-test identification. Full `GGC.stick_breaking` and realization caller compile; Sethuraman is deleted. [E4 evidence](ConstructionReport.md#e4-construction-2026-09-25); independently accepted in [Section 53](ConstructionReport.md#e4-design-acceptance-2026-09-25). |
| API-074 — historical E-S1 harmonic feasibility | Pinned disk Poisson, resolvent holomorphy/differentiation and sequential weak-dual compactness were source-inspected; no full representation adapter was compiled. | Retain search provenance only. User scope retains `External.SSV.phase_representation` with its complete audited contract; no harmonic-representation proof, phase-contract move or research gate is required. | `withdrawn_from_scope`; former evidence level `source_read`, not a local proof. [Blueprint 25.5](Blueprint.md#e4-remaining-inputs-plan). |
| API-075 — Tidy-Thorin interface migration; `GGC/Thorin/Interfaces.lean` | The original primitive wrappers reuse the unchanged `GGC.Thorin.Realization` cores; API-066 supplies accepted local proof evidence. | The new names are `GGC.thorin_realization` and `GGC.finite_atomic_approximation`, with original binder order, types, proof calls and provenance. The Thorin facade and audit use the new module; the former External module is deleted without aliases. No lower proof is copied or reproved. [Blueprint Section 21](Blueprint.md#thorin-interface-migration). | `minimal_use_compiled`: both relocated wrappers and the facade compile; The constructor-authored [Checks/ThorinInterfacesContract.lean](Checks/ThorinInterfacesContract.lean) checks both original primitive statements. Both wrappers and all retained Thorin endpoints audit to standard logic only. Clean build: 3951 jobs, 148/148 project modules; direct audit: 967/967 matched requests; original-type checks pass. [Section 41](ConstructionReport.md#tidy-thorin-construction-2026-09-25) records construction validation; [Section 42](ConstructionReport.md#tidy-thorin-design-acceptance-2026-09-25) records independent acceptance (`accepted`). Five external axioms remained at that acceptance. |
| API-076 — R2-01 comment correction and E-J3 relocation | Existing accepted `GGC.RandomMeasure.beta_atom_posterior`, the External wrapper (the earlier same-type assessment is corrected by F-01), direct callers in GammaDirichlet/DirichletRealization, and the shared full-contract check. No new mathematical proof or mathlib search is needed. | Move the primitive wrapper to `GGC.beta_atom_posterior` in `GGC/DirichletPosterior.lean`; retain E-J2 in James and add its explicit import in Palm. Correct the main docstring to J2/T1/S1 without changing its type/proof. Apply the mandatory [lifecycle rule](README.md#external-interface-lifecycle). [Blueprint Section 24](Blueprint.md#audit-r2-and-j3-relocation). | `minimal_use_compiled`: F-01 now restores the measurable-only wrapper and public check, with exact historical elaboration evidence in [Section 55](ConstructionReport.md#f01-constructor-repair-2026-09-25); designer interface reacceptance is complete in [Section 56](ConstructionReport.md#f01-designer-acceptance-2026-09-25). Historical relocation evidence follows, with its exact-type claim superseded by Blueprint Section 28: wrapper, callers and shared topology-binder check migrated; main comment corrected with type/proof unchanged. Construction validation is in [Section 48](ConstructionReport.md#r2-j3-closeout-2026-09-25). Designer acceptance: `accepted`; [Section 49](ConstructionReport.md#r2-j3-design-acceptance-2026-09-25) verifies R2-01 closure, the full primitive type, independent imports, fresh 3956-job build, 1005/1005 direct audit and seven contract endpoints. The three-axiom boundary is unchanged. The redundant E3BetaGammaReuse probe is removed with production/contract replacement evidence. |
| API-077 — E4.0 shared finite size-bias | Pinned Gamma density definitions and `Real.Gamma_add_one`; `MeasureTheory.withDensity_mul`, `withDensity_congr_ae`, product-with-density and lintegral transport. Existing production: `gammaVector_normalize_sum`, `dirichletLaw_simplex`, `dirichletLaw_zero_coordinate`, `dirichlet_coordinate_update`. | In new `Foundations/DirichletSizeBias`, prove Gamma tilt including zero shape, `D_a.withDensity (ofReal coordinate_j) = ofReal(a_j/B) • D_(a+e_j)` for positive total and arbitrary j, then the weighted mixture/stationary update law. Avoid a new simplex density, Beta-Gamma proof or hidden positive-coordinate assumption. | `accepted` / `minimal_use_compiled`: Gamma and Dirichlet coordinate tilts, weighted increments and actual product-law stationarity in `Foundations/DirichletSizeBias`. `Checks/E4SizeBiasContract.lean` covers zero/single-positive shapes; all endpoints use standard logic only. [E4 evidence](ConstructionReport.md#e4-construction-2026-09-25). Independent acceptance: [Section 53](ConstructionReport.md#e4-design-acceptance-2026-09-25). |
| API-078 — E4.2a/b partitions and Giry cylinders | Existing `Partition`/`partitionEval`; `Logic/Equiv/Fin/Basic.lean`: `finProdFinEquiv`; finite disjoint measure sums; Giry `Measure.measurable_of_measurable_coe`, `Measurable.subtype_mk`, `ENNReal.measurable_ofReal` / `ofReal_toReal`; `ext_of_generate_finite`. `memPartition` and its finite/disjoint/measurable facts were also inspected. | Prefer a trivial partition, a binary A/complement partition and pair-indexed intersection refinement with full-vector coordinate sums. These suffice for cylinder intersections and both inclusions of the actual Giry generated sigma-algebra. Prove extension for finite measures, including zero-mass slices. Use `memPartition` only if it simplifies these same adapters; do not implement a second general refinement engine. | `accepted` / `minimal_use_compiled`: `PartitionRefinement` and `ProbabilityMeasureExt` prove all constructors, full-vector projections, the Pi-system, both Giry-generation inclusions and finite-measure extension. No replacement measurable-space instance, topology or DP premise. [E4 evidence](ConstructionReport.md#e4-construction-2026-09-25). Independent acceptance: [Section 53](ConstructionReport.md#e4-design-acceptance-2026-09-25). |
| API-079 — historical E-S1 finite-atomic/weighted-L2 alternative | Independent rounded-grid lemmas and pinned L2, Frechet-Riesz duality, weak-dual sequential compactness and Lp separability APIs were source-inspected. | Retain the alternative as prior search provenance only. The user excludes S1 formalization; no interlacing, phase approximation, compactness adapter or uniqueness proof is assigned in this project. | `withdrawn_from_scope`; former evidence level `source_read`, with no compiled representation use or formalization claim. [Blueprint 25.5](Blueprint.md#e4-remaining-inputs-plan). |
| API-080 — E4.2b joint extension | `MeasureTheory/Measure/Prod.lean`: `Measure.ext_prod` for a finite first joint measure; `Measure.map_apply`, `Measure.restrict_apply`; the planned API-078 cylinder extension. Full library types inspected. | For measurable A form `map Prod.snd (M.restrict (A × univ))`; prove its evaluation on T equals `M(A × T)`. Apply finite-measure cylinder extension to these slices, then `Measure.ext_prod`. This replaces a bespoke product-generator proof and needs neither topology nor DP assumptions. | `accepted` / `minimal_use_compiled`: `slice_apply` and `joint_measure_ext_of_partitionCylinders` use restricted marginals and `Measure.ext_prod` on arbitrary finite joint measures. Both standard logic only; no probability premise. [E4 evidence](ConstructionReport.md#e4-construction-2026-09-25). Independent acceptance: [Section 53](ConstructionReport.md#e4-design-acceptance-2026-09-25). |
| API-081 — E4.2c/d Palm rectangle and endpoint | `Probability/Kernel/Composition/MeasureCompProd.lean`: `Measure.compProd_apply_prod`, `compProd_apply_univ`, `lintegral_compProd` and finite/probability instances. Existing `Partition.sum_shape`, `shape_add_dirac`; E4.0 coordinate size-bias; `lintegral_iUnion`, finite sums, `lintegral_map`. | Construct local evaluation and supplied-posterior Markov kernels. Refine p by the A/complement partition; both rectangle masses equal the sum over inside cells of `ofReal(a_j/B) * dirichletLaw(incrementShape a j)(rho inverse C)`. Prove joint equality through API-080 and pass arbitrary ENNReal Phi through map/compProd integrals. No cell-mass division, chosen cell label or canonical-posterior assumption. | `accepted` / `minimal_use_compiled`: both rectangle calculations reduce to the explicit common finite sum; local Markov kernels and normalized base give joint equality and the complete nonnegative endpoint. Full/boundary checks in `Checks/E4PalmContract.lean`. [E4 evidence](ConstructionReport.md#e4-construction-2026-09-25); independently accepted in [Section 53](ConstructionReport.md#e4-design-acceptance-2026-09-25). |

API-001–010 preserve R10's original evidence; API-011–060 record subsequent
focused source searches and tracked production uses. All new external
declarations use the already approved whitelist; these rows provide no new
axiom authorization. Build/audit chronology is in the
[M2 completion report](ConstructionReport.md#m2-completion-2026-09-24).
API-020/021's final verification and dependencies are in the
[M3 completion report](ConstructionReport.md#m3-completion-2026-09-24).
API-022/023's initial tracked proofs are in the
[M2 revalidation and continuity groundwork record](ConstructionReport.md#m2-revalidation-2026-09-24).
API-022–026's phase and sample verification is in the
[M4 phase and sample continuity record](ConstructionReport.md#m4-phase-sample-continuity-2026-09-24).
API-027's integration and fresh whole-tree validation are in the
[M2 quantile completion record](ConstructionReport.md#m2-quantile-completion-2026-09-24).
API-028–031's completed production uses and the latest whole-tree validation are
in the [M4 completion record](ConstructionReport.md#m4-completion-2026-09-24).
API-032–035's production evidence and remaining M5 obligations are in the
[Euler construction record](ConstructionReport.md#m5-euler-foundation-2026-09-24).
API-036–042's completed production uses and verification are in the
[M5 completion record](ConstructionReport.md#m5-completion-2026-09-24).

| ID / owner | Search scope or closest candidate | Exact remaining obligation / next action |
|---|---|---|
| GAP-001 — Dirichlet realization foundation | API-008 and API-013/017/018 have tracked production evidence; API-027 supplies ordered quantiles; API-028–031 supply coupling, domination and integration. | Closed and design accepted: law/kernel, fixed common space, common event, joint measurability, a.e. weak convergence of actual samples, Dirichlet/posterior continuity and actual generator averaging. No independence of stick weights or DP uniqueness assumption is introduced. |
| GAP-002 — probability measurable structures | R10 found no direct instance; API-015/016 provide the locally proved bridge. | Closed and design accepted through `probabilityMeasure_measurable_eq_borel`, with the existing Giry structure preserved. |
| GAP-003 — phase representation and varying-law continuity | API-006/014/019 supply M2's transform and canonical boundary recovery; API-024/025 provide the varying-law and scaling bridges. | Closed and design accepted: continuous pairing against every real L¹ kernel on `(0,∞)`, including simultaneous kernel and positive-scale variation. Pointwise phase continuity is not inferred. API-026–031 separately supply the accepted averaged-generator proof. |
| GAP-004 — absolute Gamma/Beta log moments | R10 found Mellin/Gamma differentiation and complex digamma support, but no direct replacement for the project's full moment contracts. | Project obligations closed and design accepted through `GammaAnalysis`, `BetaAnalysis` and the identification moment/endpoint modules. Retain absolute-integrability estimates; a derivative formula alone is not a replacement. Reopen the reuse question only for a candidate with a matching contract. |
| GAP-005 — Thorin/Dirichlet/Markov–Krein external interfaces | R10 did not locate direct statements in its pinned probability/measure/analysis search. `Analysis/SpecialFunctions/Bernstein.lean` concerns polynomial approximation. E2 adds the scoped decomposition and candidates in API-062--066. | E-B3/E-B1 are locally proved and independently accepted; E-B2 is retired by E2-P, leaving five at E2-P acceptance. E3.1/E3.2 prove full J3 and were accepted with four axioms (Section 44). E3.3 construction proves bounded Markov-Krein and retires unused general J1, leaving three actual/main axioms; independent acceptance is complete (Section 46). E4 now proves J2/T1 from shared size-bias (construction Section 52; independent acceptance Section 53); S1 is retained as the final external input and its formalization is excluded by user scope. Blueprint Sections 25–26 give the active contracts. E-S1 original-page self-check and independent review are complete, closing S1-SOURCE; see SSVSourceCheck-2026-09-24.md and ConstructionReport Section 34. No new axiom is authorized. |
| GAP-006 — compensated generator/resolvent arguments | R10's Taylor/compact-support reuse and API-020/021 now have tracked production proofs. | Closed and design accepted by the actual `(B,F)` generator, sample cancellation, absolute posterior/Palm estimates and `integral_generator_eq_normalized_powerTangent`. M4 continuity and M5 constructed existence are also accepted through their separate contracts. |

## New-entry template and updates

```text
ID / date / updater role:
Blueprint node / owner module / exact contract and assumptions:
Pinned revision / source path / imports / full candidate name:
Decision: direct reuse | adapter | local proof | candidate rejected
Compatibility: types, signs, parameters, measure structures, null sets:
Evidence level / tracked production use or probe / command / result:
ConstructionReport evidence link:
Design review: pending | accepted | needs_revision; scope and evidence:
Remaining gap / searched paths and concepts / next trigger:
Change reason / superseded decision (if any):
```

- **2026-09-24 — designer:** created the shared index at the user's request;
  seeded API-001–010 and GAP-001–006 from R10 and M1 evidence. No Lean source,
  dependency pin, external contract or stage acceptance changed. R10 compilation
  remains reported evidence; full M2/M3 acceptance is still pending.
- **2026-09-24 — constructor:** promoted API-028–031 from source search to
  compiled production proofs, with a 3814-job default build and independent
  audit of 455 declarations. Updated GAP-001/003/006 to reflect M4 construction
  completion; independent design acceptance remains pending. Earlier evidence
  links are retained, and no external assumption or dependency pin changed.
- **2026-09-24 — constructor:** added API-032–035 for the positive Euler
  construction, moments, tightness and local consistency. Full build: 3825
  jobs; independent audit: 535 declarations. All 76 new theorems and 4 new
  instances use standard logic only. M5 remains in progress, with time control,
  a common subsequence and the limiting weak equation still to construct.
- **2026-09-24 — constructor:** promoted API-036–042 to compiled production
  proofs. M5 existence now includes a common curve subsequence and the exact
  weak equation. Default build: 3891 jobs; independent audit: 624 declarations.
  The final existence theorem uses E-S1 only beyond standard logic. No external
  contract or pin changed; independent design acceptance remains pending.
- **2026-09-24 — designer:** independently accepted the submitted M2–M6
  contracts and API-060's complete law-level assembly after the clean build,
  full direct audit and semantic/dependency review. Updated GAP-001–004/006
  to closed; retained GAP-005 as the explicit literature trust boundary.
  M7 delivery still needs RV-1. Historical evidence is preserved; no Lean
  construction source, external contract or dependency pin changed.

- **2026-09-24 — designer, user scope correction:** RV-1 withdrawn, not
  implemented; API-060 and M7 delivery are accepted on the existing law-level
  evidence. Added API-061 for the new E1 definition-file/readable-main migration.
  Its proof and import changes remain unimplemented and require fresh validation.
  Earlier update notes retain the decision that applied at their time.

- **2026-09-24 — constructor, E1:** implemented the readable main proof and root Definitions module per the user's path override. API-061 now has fresh clean-build and direct-audit evidence; mathematical scope and literature inputs are unchanged. Independent design acceptance remains pending.

- **2026-09-24 — designer, E1 acceptance:** API-061 accepted after independent
  clean compilation of all 137 project modules (3940 jobs) and the direct
  883-check audit. Moved definition bodies match the accepted original;
  the main proof explicitly reuses the three existing endpoints. The same
  seven literature dependencies remain. Three legacy source-path comments
  are nonblocking D1 in the acceptance report; no Lean source was changed.

- **2026-09-24 — designer, E2 handoff and semantic-audit follow-up:** added
  API-062--066 after inspecting the pinned APIs and existing production lemmas.
  The upward rounding and Gamma drift bounds provide a common Laplace lower
  bound, simplifying uniform tightness. New proofs/probes remain pending;
  current axiom counts are unchanged. Corrected the three legacy path comments
  and clarified E-S1's open original-page review without editing the auditor's
  report. See [the design record](ConstructionReport.md#e2-design-2026-09-24).

- **2026-09-24 — constructor, E2:** API-062–066 now have compiled production
  proofs and complete integration evidence: clean build 3950 jobs, 147/147
  fresh project modules, subsequent direct audit 957/957 checks, and original
  primitive type checks. E-B1/E-B3 and all new core proofs use standard logic
  only; six project axioms and exactly five final-theorem literature dependencies
  remain. Independent E2 acceptance is pending. S1-SOURCE has a completed
  construction self-check, with independent source review pending.

- **2026-09-24 — designer, E2 acceptance:** API-062–066 accepted after independent
  proof/contract review, clean build (3950 jobs; 147/147 fresh project modules),
  direct audit (957/957 names matched) and a probe using the original committed
  endpoint types. All 74 added audit checks and both E-B1/E-B3 endpoints use
  standard logic only. The accepted module split is recorded in the Blueprint.
  GAP-005 now records six project axioms/five main dependencies; no new axiom
  was introduced. Independently reviewed the specified SSV first-edition pages
  and errata, closing S1-SOURCE while retaining E-S1 as an axiom. See
  [Section 34](ConstructionReport.md#e2-design-acceptance-2026-09-24).

- **2026-09-24 — designer, unused-axiom cleanup and E3 plan:** API-067 records
  removal of unused E-B2 and its two auxiliary consumers, with E-B4 withdrawn.
  API-068-071 propose a shared Gamma-Dirichlet foundation, complete J3 and the
  bounded J1 formula required by the sole production consumer. API-072-074
  retain concrete J2/T1/S1 follow-on gaps. Source inspections were cross-checked
  by three independent planning agents; no new proof or compile probe is
  claimed. The bounded J1 design explicitly retires the unused general contract.
  See [Blueprint Sections 18-19](Blueprint.md#unused-axiom-cleanup).

- **2026-09-24 — designer, E3.0 construction handoff:** refined API-068 into
  a primitive measure contract and BG-0–4 proof cards. Promoted six successful
  bounded experiments to tracked `Checks/E3BetaGammaReuse.lean`, outside the
  default production globs, with an explicit acceptance command. Compilation
  corrected the product-density namespace to `MeasureTheory.prod_withDensity`;
  one-dimensional scaling and the definition of `ProbabilityTheory.beta`
  replace the need for a generic two-dimensional Jacobian or complex integral
  normalization in the primary route. All six probe proofs audit to standard
  logic only. Support, full density factorization and joint-law assembly remain
  construction work; E3.0 and the five-axiom boundary are unchanged. See
  [Section 37](ConstructionReport.md#e3-zero-design-handoff-2026-09-24).

- **2026-09-24 — construction, E3.0 joint law:** API-068 now records the complete
  production proof, support and inverse lemmas, real-power density factorization,
  shear/interval change of variables, and measure extensionality. The original
  primitive type is independently checked. No evidence upgrade is made for
  E3.1–3 or API-069–074; no literature axiom is removed. See
  [Section 38](ConstructionReport.md#e3-zero-construction-2026-09-24).

- **2026-09-24 — designer, E3.0 acceptance and structural handoff:** API-068
  accepted after full proof/contract review, verification of all 148 submitted
  clean-build source hashes/module records, fresh default build, 967/967 direct
  audit and primitive-type check. Corrected a stale unproved-status paragraph
  and the accidentally expanded four-column row in the two-column summary.
  API-075 schedules the user-requested relocation of local Bondesson interfaces;
  no production migration is claimed. See report Section 39.


- **2026-09-25 — construction, Tidy-Thorin:** API-075 now records the relocated
  primitive wrappers, unchanged core proof reuse, caller/audit migration,
  removal of the old module, and durable original-type checks. This is an
  ownership change with no mathematical axiom reduction. Independent acceptance
  is pending; see [Section 41](ConstructionReport.md#tidy-thorin-construction-2026-09-25).

- **2026-09-25 — designer, Tidy-Thorin acceptance:** API-075 accepted after
  exact migration comparison, submitted clean-build/hash validation, fresh
  incremental build, 967/967 direct audit and both primitive-type checks.
  The lower import boundary and five-axiom set are preserved. Also corrected
  a stale current E3.0 acceptance summary; dated reports retain their history.
  See [Section 42](ConstructionReport.md#tidy-thorin-design-acceptance-2026-09-25).

- **2026-09-25 — construction, E3.1/E3.2:** API-069/070 now have complete
  finite Gamma/Dirichlet joint-law and full original E-J3 proofs. Degenerate
  shapes and arbitrary weight realizations are included. E-J3 is a theorem,
  leaving J1/J2/T1/S1 as the four actual/main axioms. The new contract check
  follows Checks governance. Final clean build: 3953 jobs / 150 fresh modules;
  direct audit: 992/992 matching requests. All 26 new/local endpoint checks
  use standard logic only, and all contract checks pass. Independent design
  acceptance is pending;
  API-071-074 are unchanged. See [Section 43](ConstructionReport.md#e3-one-two-construction-2026-09-25).

- **2026-09-25 — designer, E3.1/E3.2 acceptance:** API-069/070 accepted after
  source/contract review, 150 matching clean-build hashes/module records, fresh
  default build, 992/992 direct audit and seven contract endpoint checks.
  All 25 new declarations plus E-J3 use standard logic only. Original J3 type,
  zero-shape cases, independent import closures and unchanged main scope checked.
  Four actual/main literature axioms remain; E3.3 is planned. See Section 44.

- **2026-09-25 — constructor, E3.3:** API-071 now has finite/simple and bounded
  Markov-Krein production proofs, preserving the full consumer type and retiring
  the unused general J1 declaration. Clean build: 3955 jobs / 152 fresh modules;
  direct audit: 1005/1005. All 14 new theorems and both identification consumers
  use standard logic only; all four contract files pass. GAP-005 now records
  J2/T1/S1 as the three actual/main axioms. The unbounded statement is not claimed
  as proved. Independent acceptance is pending; see
  [Section 45](ConstructionReport.md#e3-three-construction-2026-09-25).

- **2026-09-25 — designer, E3.3 acceptance:** API-071 accepted after complete
  proof/consumer review, verification of 152 clean-build hashes/module records,
  fresh 3955-job default build, 1005/1005 direct audit and seven contract endpoints.
  The 14 new theorems and both consumers use standard logic only. Three actual/main
  axioms remain. General unbounded J1 is retired, not claimed fully formalized.
  See [Section 46](ConstructionReport.md#e3-three-design-acceptance-2026-09-25).

- **2026-09-25 — designer, independent audit follow-up and lifecycle rule:**
  read the second-round report (pass within its scope, one open low-priority
  comment finding R2-01). Added API-076 and Blueprint Section 24 for the exact
  comment correction plus E-J3 wrapper relocation. Identified Palm's transitive
  James import as a migration dependency. No production source/check or
  auditor-owned artifact was changed; construction and acceptance remain pending.


- **2026-09-25 — constructor, API-076 closeout:** moved E-J3 to
  `GGC.DirichletPosterior`, preserved its full primitive type/proof and E-J2,
  corrected R2-01's dependency comment, and migrated callers/audit/shared check.
  Deleted only the superseded E3BetaGammaReuse design probe; the four active
  contract files remain and pass. Clean build: 3956 jobs / 153 fresh modules;
  direct audit: 1005/1005. Both posterior theorems use standard logic only;
  the main theorem still has exactly J2/T1/S1. Independent design acceptance
  is pending; [Section 48](ConstructionReport.md#r2-j3-closeout-2026-09-25).

- **2026-09-25 — designer, API-076 acceptance:** verified the exact comment-only
  main change, full original posterior contract, unchanged E-J2 and consumer
  types, independent imports and absence of old aliases. Matched 153 production
  sources to construction clean-build evidence; fresh incremental build,
  1005/1005 audit and seven E3GammaDirichlet contract endpoints passed. Accepted
  probe retirement and updated Blueprint links. Removed the constructor-added
  progress section from README under its current scope rule. See
  [Section 49](ConstructionReport.md#r2-j3-design-acceptance-2026-09-25).

- **2026-09-25 — designer, remaining-input reassessment:** refined API-072/073/074
  and added API-077/078/079. The accepted Gamma joint law and coordinate update
  support a shared finite size-bias bridge, then finite-prefix T1 before the
  joint-measure extension needed for J2. Source inspection found reusable
  membership partitions and exact finite-prefix marginal APIs. S1 retains a
  separate comparison of harmonic and finite-atomic/weighted-L2 routes.
  Evidence stays `source_read` for new uses: no new Lean source, probe, build,
  theorem acceptance or axiom deletion. Full handoff and limits are in
  [Blueprint Section 25](Blueprint.md#e4-remaining-inputs-plan) and
  [ConstructionReport Section 50](ConstructionReport.md#e4-design-reassessment-2026-09-25).

- **2026-09-25 — designer, fixed S1 scope and detailed J2 handoff:** withdrew
  API-074/079 from construction scope while retaining their prior search evidence.
  E-S1 is the approved final external input, not an uncompleted S1 research gate.
  Refined API-072/078 and added API-080/081. Source inspection confirms that
  `Measure.ext_prod` replaces a new product-generator proof; finite restricted
  marginals require a finite-measure cylinder theorem rather than just a
  probability-law uniqueness theorem. Binary/pair-indexed partition adapters
  and a common explicit rectangle sum now have separate acceptance gates.
  No new compiled use or axiom reduction is claimed. See
  [Blueprint Section 26](Blueprint.md#e4-j2-construction-handoff) and
  [report Section 51](ConstructionReport.md#j2-detailed-design-2026-09-25).

### E4 compiled applications — 2026-09-25

The constructor implemented the shared size-bias foundation, full T1 replacement,
and full J2 replacement in that order. API-072/073/077/078/080/081 are promoted
from inspected candidates to compiled production applications. The actual density
lemmas live in `MeasureTheory`, not `MeasureTheory.Measure`; the product scalar
lemmas retain the `Measure` namespace. Finite prefixes use
`map_infinitePi_infinitePi_of_inj`, `infinitePi_eq_pi`, and
`measurePreserving_arrowProdEquivProdArrow`. Summability uses
`ENNReal.hasSum_toReal` together with `ENNReal.tsum_toReal_eq`.

The T1 convergence proof establishes the exact prefix formula and convergence
for every attached real vector using the coordinate series and vanishing
residual; it does not require a tail moment estimate. J2 uses only measurability
in its lower layer, retaining explicit Polish/Borel binders in the public wrapper.
The original Giry instance is explicitly named in the generation proof to avoid
accidentally selecting the locally named candidate structure. No project-wide
measurable-space instance was installed. Full commands, counts and trust checks
are in [Section 52](ConstructionReport.md#e4-construction-2026-09-25).
These are constructor results, not independent design acceptance.

### E4 independent acceptance — 2026-09-25

The designer accepts API-072/073/077/078/080/081 at their full production
contracts. The fresh clean project build compiled 158/158 modules (3961 jobs);
the subsequent direct audit matched 1067/1067 requests, including all 63 new
declarations with standard logic only. All seven shared contract checks passed.
The existing Palm check now explicitly exercises the public instance binders
and empty/universal/zero-mass cells. No production proof or semantic definition
changed during acceptance. The current summary's stale `source_read` wording
is corrected; the constructor's dated evidence above remains historical.
The actual main-theorem boundary is E-S1 plus standard logic, as authorized.
See [ConstructionReport Section 53](ConstructionReport.md#e4-design-acceptance-2026-09-25).


### F-01 public-interface repair — 2026-09-25

API-072 and API-076 now expose measurable-only public contracts. No mathlib API
or lower proof changed. The original historical James source was elaborated
with the pinned toolchain, and its two declaration types compared directly to
the repaired public types as Lean expressions. Both comparisons pass. The full
seven-file contract suite and subsequent central audit are recorded in
[ConstructionReport Section 55](ConstructionReport.md#f01-constructor-repair-2026-09-25).
These are constructor results; designer reacceptance remains pending. Earlier
topology-preservation/type-compatibility claims are superseded, not retroactively
validated by this repair.

### F-01 designer reacceptance — 2026-09-25

API-070/072/076 are accepted at their historical measurable-only public types.
Fresh exact expression comparisons, default build, all seven shared checks and
the 1067-result audit pass. This closes the pending reacceptance in the dated
constructor entry above; earlier topology-preservation claims remain withdrawn.
See [Section 56](ConstructionReport.md#f01-designer-acceptance-2026-09-25).
