# mathlib API source audit

Back to: [formalization blueprint](README.md) · [external axiom boundary](axiom-boundary.md).

## 1. Audit baseline and evidence levels

Search date: 2026-09-06. The search examined an actual source tree obtained from the official
[leanprover-community/mathlib4](https://github.com/leanprover-community/mathlib4) repository:

- commit: `810b3888d0aa94294b18587c453466bc86c1f0fc`;
- commit timestamp: `2026-09-05T15:48:37Z`;
- [lean-toolchain][toolchain]: `leanprover/lean4:v4.34.0-rc2`;
- method: `rg --files`, full-text searches by topic, inspection of declarations and surrounding namespaces,
  and reading complete key signatures, rather than only searching online documentation titles.

All source links below are pinned to this commit to avoid mismatches between current webpages and the local toolchain.
This is a recent snapshot that was actually checked, not a claim that it will always be the latest version.
Here, “available” means **SOURCE-VERIFIED**, not compilation-tested with this project's imports.
Neither `#check`, `#print axioms`, nor `lake build` has been run; M0 must perform these during implementation.

Distinguish Lean `Init` / `Std` from mathlib: the measure theory, probability, and advanced analysis APIs below
primarily belong to mathlib, not the standard library bundled with the Lean compiler. The older baseline of the background SD blueprint
cannot serve as compilation evidence for this table.

## 2. Available general APIs and required adaptations

The tables give complete namespaces or an explicit shared namespace prefix; source line numbers refer to this snapshot.
Module paths use the form `Mathlib/...lean`; actual imports use dots and omit the extension.

### 2.1 Laws, weak convergence, and compactness

| Need | Verified declaration | Source location | Use in this project / remaining work |
|---|---|---|---|
| Probability-law object | `MeasureTheory.ProbabilityMeasure` | [ProbabilityMeasure.lean:103][prob] | Carries probability status and supports the narrow topology; add a separate nonnegativity field |
| Characterization of weak convergence by tests | `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` | [ProbabilityMeasure.lean:364][prob-weak] | Test type is `Ω →ᵇ ℝ`, not arbitrary integrable functions |
| Continuity of test integrals | `MeasureTheory.ProbabilityMeasure.continuous_iff_forall_continuous_integral`, `continuous_integral_boundedContinuousFunction` | [ProbabilityMeasure.lean:391][prob-cont] | Ready for fixed bounded continuous tests; parameter-dependent tests need sup-norm estimates or a common bound |
| Pushforward measure | `MeasureTheory.ProbabilityMeasure.map`, `map_apply_of_aemeasurable` | [ProbabilityMeasure.lean:626][prob-map] | In this snapshot, `map ν f` takes no explicit measurability argument; using its pushforward semantics still requires `AEMeasurable f ν` |
| Continuous maps preserve weak convergence | `MeasureTheory.ProbabilityMeasure.tendsto_map_of_tendsto_of_continuous`, `continuous_map` | [ProbabilityMeasure.lean:657][prob-map-cont] | Directly handles the final power map for fixed q; log cannot be supplied directly because it is not continuous on all of ℝ |
| Prokhorov | `isCompact_closure_of_isTightMeasureSet` in the root namespace | [Prokhorov.lean:530][prok] | The closure of a tight family of measures is compact; passage from M₂ to tightness and extraction in time need local proofs |
| Quantitative compact-set criterion | `isCompact_setOfPred_probabilityMeasure_mass_eq_compl_isCompact_le` in the root namespace | [Prokhorov.lean:505][prok-bound] | Formulated using common compact sets Kₙ and vanishing tail bounds uₙ; can be connected to second-moment tail bounds |
| Portmanteau | `MeasureTheory.ProbabilityMeasure.limsup_measure_closed_le_of_tendsto`, `le_liminf_measure_open_of_tendsto` | [Portmanteau.lean:314][port] | Checks limits on open and closed subsets of the real line; lower semicontinuity of M₂ can also be proved directly with truncated continuous tests |
| Bounded Lipschitz tests | `MeasureTheory.tendsto_iff_forall_lipschitz_integral_tendsto` | [Portmanteau.lean:688][port-lip] | Requires a countably generated filter; gives a topological characterization, not the full properties of a specific BL metric |
| Metrization of the narrow topology | `MeasureTheory.LevyProkhorov.probabilityMeasureHomeomorph` | [LevyProkhorovMetric.lean:676][lp] | Supports compactness of probability-valued curves; quantitative distance bounds from second-moment couplings need proof |
| Compactness of curves | `BoundedContinuousFunction.arzela_ascoli`, `arzela_ascoli₂` | [ArzelaAscoli.lean:90][aa] | Requires continuous interpolation, a common compact range, and equicontinuity; does not directly accept discrete grids |
| Measures determined by test integrals | `MeasureTheory.ext_of_forall_integral_eq_of_IsFiniteMeasure` | [HasOuterApproxClosed.lean:269][measure-ext] | Version for bounded continuous real tests; extension from smooth compactly supported tests requires density/truncation lemmas |

### 2.2 Kernels, randomization, and integration

| Need | Verified declaration | Source location | Use in this project / remaining work |
|---|---|---|---|
| Exponential tilting | `MeasureTheory.Measure.tilted` | [Tilted.lean:42][tilted] | Weight is exp(f), with f(x)=−s x here; may yield the zero measure when `exp f` is not integrable |
| Tilted measure is a probability measure | `MeasureTheory.isProbabilityMeasure_tilted` | [Tilted.lean:126][tilted-prob] | Requires `[NeZero μ]` and `Integrable (fun x => exp (f x)) μ`; not an unconditional instance |
| Tilted integrals | `MeasureTheory.integral_tilted`, `integrable_tilted_iff` | [Tilted.lean:230][tilted-int] | Density/normalization algebra is available; a positive Laplace lower bound and local parameter domination are still needed |
| Kernel composition | `MeasureTheory.Measure.comp_assoc`, `map_comp` | [MeasureComp.lean:30][measure-comp] | Can recursively produce Euler marginals; Markov, measurability, and parameter conditions need local instances |
| Signed kernel Fubini | `MeasureTheory.Measure.integrable_compProd_iff`, `integral_compProd` | [IntegralCompProd.lean:461][comp-int] | The former includes integrability of the outer norm integral; existence of each samplewise integral alone does not justify the latter |
| Finite path kernels | `ProbabilityTheory.Kernel.partialTraj` | [PartialTraj.lean:102][partial] | Can organize finite Euler chains; the specific first two moments and centered cross terms still require local proofs |
| Measurable randomization | `ProbabilityTheory.Kernel.exists_measurable_map_eq_unitInterval` | [Representation.lean:111][randomize] | Gives uniform randomization for standard Borel targets; does not provide an a.s. convergent coupling as the law varies |
| Randomization of a single law | `MeasureTheory.Measure.exists_measurable_map_eq` | [Representation.lean:126][randomize] | Likewise gives no quantile convergence guarantee |
| Countable independent products | `ProbabilityTheory.iIndepFun_infinitePi`, `iIndepFun.hasLaw_infinitePi` | [InfinitePi.lean:106][infinite] | Supports a common uniform probability space; stick-breaking convergence and DP semantics must be supplied separately |
| DCT | `MeasureTheory.tendsto_integral_of_dominated_convergence` | [DominatedConvergence.lean:57][dct] | Requires measurability, a common integrable bound, and a.e. convergence; suitable for posterior logarithmic domination |
| Filter version of DCT | `MeasureTheory.tendsto_integral_filter_of_dominated_convergence` | [DominatedConvergence.lean:69][dct] | Supports countably generated filters; conversion to and from sequential topology must be explicit |
| Ordinary Fubini | `MeasureTheory.integral_prod` | [Integral/Prod.lean:440][fubini] | Prove absolute integrability before applying to s×t and DP sample integrals |
| Differentiation under the integral | `hasDerivAt_integral_of_dominated_loc_of_deriv_le` in the root namespace | [ParametricIntegral.lean:288][param] | Assumes a common parameter neighborhood, integrability at the point, and a common integrable bound for derivatives; returns a conjunction of derivative integrability and HasDerivAt |

### 2.3 Special functions, phases, and test approximation

| Need | Verified declaration | Source location | Use in this project / remaining work |
|---|---|---|---|
| Gamma distribution | `ProbabilityTheory.gammaMeasure`, `isProbabilityMeasure_gammaMeasure` | [Gamma.lean:128][gamma] | Parameters are positive shape a and positive rate r; the distribution-level interface does not supply all required logarithmic moments |
| Beta distribution | `ProbabilityTheory.betaMeasure`, `isProbabilityMeasureBeta` | [Beta.lean:132][beta] | Note the actual spelling of the probability theorem; degenerate partitions with nonnegative shapes cannot directly use positive-parameter Beta/Gamma densities |
| digamma | `Complex.digamma`, `Complex.digamma_apply_add_one` | [Digamma.lean:48][digamma] | This file is complex-valued; do not invent a corresponding `Real.digamma` API; adaptation to the real axis is needed |
| Gamma integral derivative | `Complex.hasDerivAt_GammaIntegral` | [Gamma/Deriv.lean:50][gamma-deriv] | Actual condition is `0 < s.re`; the existing integral formula containing log t can reduce the work on real Gamma logarithmic moments |
| rpow continuity | `Real.continuous_rpow_const` | [Pow/Continuity.lean:226][rpow-cont] | Assumes q≥0; usable for continuous mapping on all of ℝ |
| rpow multiplication | `Real.rpow_mul` | [Pow/Real.lean:415][rpow-mul] | Assumes x≥0; yields `x^(y*z)=(x^y)^z` |
| Algebraic resolvent transform | `MeasureTheory.resolventTransform`, `hasDerivAt_resolventTransform`, `analyticOn_resolventTransform` | [ResolventTransform.lean:104][resolvent] | Not the full SSV Stieltjes class; its parameter derivative is a positive integral of the squared resolvent. Check variables, signs, and conditions outside the spectrum before use |
| Banach–Alaoglu | `WeakDual.isCompact_closedBall`, `isSeqCompact_closedBall` | [WeakDual.lean:269][weakdual] | Native compactness/sequential compactness of closed balls; predual identification, separability, and the L∞ phase representation are not automatic |
| Metrizability of weak-star compact sets | `WeakDual.metrizable_of_isCompact` | [WeakDual.lean:340][weakdual-seq] | Assumptions such as separability of the predual need instances; arbitrary weak-star compactness must not be treated as sequential compactness |
| Radon–Nikodym | `MeasureTheory.Measure.withDensity_rnDeriv_eq`, `rnDeriv_le_one_of_le` | [RadonNikodym.lean:60][rn], [same file:420][rn-le] | Supports the phase-measure compactification route; weak closedness of measure domination and extension to L¹ tests need proof |
| Smooth compactly supported functions | `exists_contDiff_tsupport_subset` in the root namespace | [BumpFunction/FiniteDimension.lean:45][bump] | Gives a bump near a point; uniform cutoffs and derivative bounds after scaling still need construction |
| Smooth approximation | `UniformContinuous.exists_contDiff_dist_le` | [SmoothApprox.lean:48][smooth] | Does not itself guarantee compact support of the approximant; combine with cutoffs and control the error |
| Uniform Bernstein approximation | `bernsteinApproximation_uniform` in the root namespace | [Bernstein.lean:182][bernstein] | Approximates continuous functions; apply it to J′ here, then integrate to construct C¹ polynomial approximation |
| FTC | `intervalIntegral.integral_eq_sub_of_hasDerivAt` | [FundThmCalculus.lean:1148][ftc] | Requires interval integrability of the derivative; adapt to time integrals and polynomial antiderivatives |
| Integration by parts | `intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDerivAt` | [IntegrationByParts.lean:111][ibp] | Supports finite truncated intervals; singular or infinite endpoint limits require local absolute bounds |

## 3. Areas where no ready-made dedicated interface was found

These conclusions concern the snapshot and search scope above; they do not assert absence from every Lean community project.
Unaudited third-party GitHub drafts have not been treated as standard mathlib APIs either.

| Gap | Search finding | Implementation approach |
|---|---|---|
| GGC / Thorin / HCM / complete Bernstein classes | Required classes and theorems were not found in the relevant analysis/probability/measure files | Define semantically explicit Thorin / IsGGC objects; use external axiom contracts for monograph theory |
| Dirichlet process / Markov–Krein / stick-breaking | No directly usable DP definition or required identities found | Build DP finite-partition semantics and measurable random-measure interfaces; use James/Sethuraman results as axioms |
| DP Palm posterior | Generic Bayesian `Kernel.Posterior` exists, but this paper's DP conjugacy formula was not found | Distinguish generic posteriors from DP-specific identities; see the axiom registry |
| Convergence-compatible quantile / Skorohod coupling | CDFs and general randomization exist; the convergence theorem needed here was not found | Locally implement monotonicity and a.e. continuity points of generalized inverse CDFs on the real line, and the common uniform coupling |
| Canonical SSV phase | No bounded analytic Stieltjes phase or jointly measurable representative found | Literature existence/uniqueness plus a local limsup representative and scaling adaptation |
| Full L¹–L∞ dual representation | Natural Hölder pairings and WeakDual compactness were found; the complete required surjective identification was not verified | First try compact-interval phase measures/RN; otherwise evaluate the dual-representation work separately |
| Parameter-uniform Gamma/Beta log-moments | Gamma integral derivatives and distribution densities found, but not all target moment interfaces | Connect real/complex Gamma, density integrals, and local common domination; do not use formulas while ignoring integrability |
| This paper's nonlinear Euler existence theorem | No plug-and-play theorem found; it should not be assumed either | Prove positive kernels, moment estimates, compactness, consistency, and nonlinear limits locally |
| Dynamic transport identification for `x log x` | No API directly covering this proof found | Build the explicit backward-test and time-partition argument, avoiding general PDE uniqueness theory |
| C¹ density of exponential polynomials in generator norm | Bernstein gives C⁰, not the target directly | Approximate the derivative and integrate, then use `sup abs(x log x) exp(−x)<∞` |

Also, “evaluation measurable structure on probability measures = Borel structure of the narrow topology” and the required StandardBorel instance chain
remain **interfaces to verify**, not confirmed library gaps. M0/M1 should test them specifically;
the mere presence of both TopologicalSpace and MeasurableSpace on an object does not establish compatibility.

## 4. Library names that are easy to misinterpret

- `StieltjesFunction` is a CDF/right-continuous monotone function object, not the analytic Stieltjes function class.
- `Analysis/SpecialFunctions/Bernstein.lean` concerns Bernstein polynomials, not representation theory for complete Bernstein functions.
- `ResolventTransform` supplies an integral for a particular spectral resolvent; it does not automatically provide a bounded phase.
- Measurable randomization in `Kernel.Representation` is not a Skorohod convergence coupling.
- `LevyConvergence` / `LevyProkhorovMetric` must not be treated as Lévy–Khintchine APIs.
- `Complex.digamma` is not a packaged interface for real Gamma probability logarithmic moments.

## 5. Reproducing the search and subsequent compilation gates

At the root of the mathlib source tree pinned to the specified commit, the core topic searches are:

```powershell
git rev-parse HEAD
Get-Content lean-toolchain
rg -n -i 'dirichlet process|dirichletprocess|thorin|generalized gamma convolution|gamma convolution|complete bernstein|stieltjes function|quantile|skorohod|skorokhod|stick.break|markov.krein|cifarelli' Mathlib/Probability Mathlib/MeasureTheory Mathlib/Analysis
rg --files Mathlib | rg 'Prokhorov|Portmanteau|Tilted|Representation|WeakDual|Gamma|Beta|Bernstein'
rg -n 'hasDerivAt_integral_of_dominated|tendsto_integral_of_dominated_convergence' Mathlib
```

Next, read the complete signatures and namespaces of candidate declarations; a name at a call site in `rg` output alone
does not establish the theorem's namespace. During implementation, pin the lake manifest and write a separate `Tests/API.lean`:

1. Import the modules actually needed from these tables and `#check` each key declaration.
2. Compile three instantiated examples: weak convergence of pushforwards for positive real q; probability tilting for s>0;
   and passage from second-moment tail bounds to tightness for probabilities on the real line.
3. Separately check parameter measurability for random probability measures, coercions in kernel composition, and real/complex Gamma adaptation.
4. Upgrade each item from source-verified to elaboration-verified individually, rather than declaring the entire table complete at once.

[toolchain]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/lean-toolchain
[prob]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean#L103
[prob-weak]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean#L364
[prob-cont]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean#L391
[prob-map]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean#L626
[prob-map-cont]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean#L657
[prok]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Prokhorov.lean#L530
[prok-bound]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Prokhorov.lean#L505
[port]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Portmanteau.lean#L314
[port-lip]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Portmanteau.lean#L688
[lp]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/LevyProkhorovMetric.lean#L676
[aa]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean#L90
[measure-ext]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/HasOuterApproxClosed.lean#L269
[tilted]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Tilted.lean#L42
[tilted-prob]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Tilted.lean#L126
[tilted-int]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Tilted.lean#L230
[measure-comp]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Kernel/Composition/MeasureComp.lean#L30
[comp-int]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Kernel/Composition/IntegralCompProd.lean#L461
[partial]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Kernel/IonescuTulcea/PartialTraj.lean#L102
[randomize]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Kernel/Representation.lean#L111
[infinite]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Independence/InfinitePi.lean#L106
[dct]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Integral/DominatedConvergence.lean#L57
[fubini]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Integral/Prod.lean#L440
[param]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/Calculus/ParametricIntegral.lean#L288
[gamma]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Distributions/Gamma.lean#L128
[beta]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Distributions/Beta.lean#L132
[digamma]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean#L48
[gamma-deriv]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/SpecialFunctions/Gamma/Deriv.lean#L50
[rpow-cont]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/SpecialFunctions/Pow/Continuity.lean#L226
[rpow-mul]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/SpecialFunctions/Pow/Real.lean#L415
[resolvent]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/ResolventTransform.lean#L104
[weakdual]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/Normed/Module/WeakDual.lean#L269
[weakdual-seq]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/Normed/Module/WeakDual.lean#L340
[rn]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean#L60
[rn-le]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean#L420
[bump]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/Calculus/BumpFunction/FiniteDimension.lean#L45
[smooth]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/Calculus/BumpFunction/SmoothApprox.lean#L48
[bernstein]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/SpecialFunctions/Bernstein.lean#L182
[ftc]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean#L1148
[ibp]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Integral/IntervalIntegral/IntegrationByParts.lean#L111
