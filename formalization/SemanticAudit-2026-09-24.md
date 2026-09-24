# Semantic Audit of the Main Theorem and External Axioms

Maintenance policy: this report sits beside `Blueprint.md` and is maintained
independently by the auditor, in English. As requested by the user, audit findings,
proposed corrections, and verification status are recorded here without directly
editing existing project documentation.

Audit date: 2026-09-24. Base commit: `88b8529a29da851b015d545c2cee3a566b779b7c`.
The audit examined the current working tree. `Blueprint.md`, `ConstructionReport.md`,
`MathlibAPI.md`, and `README.md` already had uncommitted changes when the audit began.
The auditor did not modify those files or any Lean source.

## Conclusions and evidence limits

The main theorem passes the semantic audit: `GGC.ggc_rpow` states closure of every
nonnegative GGC probability law under every real power `q ≥ 1`. No narrowing of
scope, circular definition, substitution of a different power operation, or hidden
additional moment assumption was found.

Seven external axioms, E-B1, E-B2, E-B3, E-J1, E-J2, E-J3, and E-T1, were checked
directly against the original book or papers. No missing hypothesis, reversed
parameter, or unsupported strengthening was found. Checks of E-S1's formula,
principal logarithm, anchor, and official errata found no error. However, images
of the specified pages of the 2010 first edition were not obtained during this
audit. Its original-page verification remains open; this report does not certify
that all eight axioms have completed that verification.

One low-priority documentation issue was found: `Definitions.lean:119` still says
that the final theorem is proved in `GGC/PowerClosure.lean`. The public theorem is
actually at `main.lean:26`; the former file provides the finite-input proof.
This does not affect the proposition or proof.

## Main theorem: statement correspondence

The mathematical target appears at
`../ledger/25-mathematical-completion-audit.md:25–34`; the extension to general
inputs appears at `../manuscript/sections/06-completion.tex:20–31`.

| Item | Lean location | Finding |
|---|---|---|
| Probability and nonnegativity | `Definitions.lean:39–41` | `ProbabilityMeasure ℝ` with almost-everywhere nonnegativity; neither a subprobability law nor an extended-real-valued object. |
| Concrete Gamma semantics | `Definitions.lean:49–79` | Actual mathlib Gamma measures with positive shapes and rates, followed by the sum pushforward of a finite independent product. |
| GGC definition | `Definitions.lean:83–96` | Probability weak limits of sequences of actual finite Gamma convolutions. Neither power closure nor an evolution solution is built into the definition. |
| Power operation | `Definitions.lean:101–108`; `GGC/Basic.lean:17–19` | `Measure.map (fun x : ℝ => x ^ q)`: the deterministic real power of the same value. |
| Quantifiers and assumptions | `Definitions.lean:122–124` | All nonnegative probability laws and all real `q ≥ 1`, with `IsGGC μ` as the sole membership premise. |
| Endpoints and degenerate laws | `GGC/FiniteGamma.lean:38–44`; `GGC/Basic.lean:22–27,40–45` | The empty sum, the law concentrated at zero, constant-law pushforwards, and `q=1` are covered. |
| Removal of construction restrictions | `main.lean:26–49`; `GGC/WeakClosure.lean:21–39` | Powers are applied to each finite Gamma approximant, followed by the continuous mapping argument and locally proved weak closure. No finite-mass or second-moment assumption remains. |
| Finite inputs and evolution | `GGC/Identification/InitialData.lean:60–77`; `GGC/PowerClosure.lean:19–42` | Nonempty inputs supply the actual initial law and required moments; for `q>1`, the proof uses finite time `T=log q`. The empty sum is handled separately. |

The law formulation fully expresses this distributional property and preserves
the scope of the random-variable formulation. The correspondence between the
manuscript's Thorin representation and the original GGC definition is established
at `GGC/Thorin.lean:250–283` using E-B2/E-B3. Interpretation of the scope as including
nonzero drift and infinite Thorin mass therefore belongs to this explicit trust
boundary.

## External axioms: correspondence with the literature

### Bondesson: E-B1, E-B2, E-B3

The text and page images of the local `../literature/Bondesson.pdf` were read
directly: printed pages 29 and 34–35, corresponding to PDF pages 38 and 43–44.
The source is Bondesson (1992),
[*Generalized Gamma Convolutions and Related Classes of Distributions and Densities*](https://doi.org/10.1007/978-1-4612-2948-3), Section 3.1.

- E-B1, `External/Bondesson.lean:49–58`: after converting the book's nonpositive
  moment-generating-function parameter to a positive Laplace parameter, the signs
  in `exp(-a*s - ∫ log(1+s/b) U(db))` are correct. Positive rates, nonnegative drift,
  the zero Thorin measure, and infinite total mass are handled correctly. This
  interface is a source-derived consequence, as its documentation acknowledges.
- E-B2, `External/Bondesson.lean:77–96`: `ProbabilityMeasure ℝ` supplies the
  nondefective weak-limit condition in Theorem 3.1.5. The theorem's converse
  statement about canonical measures is not misapplied.
- E-B3, `External/Bondesson.lean:115–134`: the final paragraph of printed page 35
  allows arbitrary target drift and approximation by zero-drift, finite-atomic
  Thorin data. Positive finite shapes and rates, including the empty-sum case,
  match that statement. No uniform moment bound is added.

The notation `Integrable log(1+1/b)` differs from the book's endpoint conditions.
However, `GGC/Thorin.lean:83–86,118–119` establishes equivalence with local finiteness
and the two endpoint integrability conditions. Local finiteness cannot be omitted,
because `log b` vanishes at `b=1`. Integrability for every nonnegative Laplace
parameter is also proved at `GGC/Thorin.lean:32–33`. Lean's default value for a
nonintegrable integral is not used as a substitute for the mathematical integral.

### James: E-J1, E-J2, E-J3

The [original James (2005) reprint](https://arxiv.org/pdf/math/0505606) was checked
directly, including its first-page version marker `math/0505606v1` and reprint
pages 2 and 4–5.

- E-J1, `External/James.lean:29–38`: matches the nonnegative real-function,
  `z=1` specialization of equations (1)–(3) on page 2. Positive finite mass,
  the mass identity, measurability, nonnegativity, and logarithmic integrability
  are explicit. The almost-sure integrability of the random mean is supported
  by the existence condition on the same page.
- E-J2, `External/James.lean:43–52`: the one-observation marginal is `U/B`, and
  the posterior is `DP(U+δ_b)`. The joint-test version follows from the posterior
  distribution statement on page 4, rather than merely substituting into equation
  (8) on page 5. The nonatomicity restriction in a particular partition
  factorization does not apply to this posterior conclusion.
- E-J3, `External/James.lean:54–67`: this is an explicitly identified Beta–Gamma
  corollary. For independent `T ~ Gamma(B,1)` and `G ~ Gamma(1,1)`,
  `Z=G/(T+G) ~ Beta(1,B)`. Taking `Q ~ DP(U)` independently of `(T,G)` gives
  `(1-Z)Q+Zδ_b` the law `DP(U+δ_b)`. `atomMixtureLaw` uses an actual independent
  product, with the correct orientation of the atom's weight. The conclusion
  remains valid when the base measure already has an atom at that location.

The shared DP definition at
`GGC/Foundations/RandomMeasure.lean:24–28,64–70,144–148` uses the actual Dirichlet
law obtained by normalizing independent Gamma variables for every finite measurable
partition. Zero-mass cells are represented by constant zero; the base measure must
have positive finite total mass. E-J2 uses nonnegative integrals and does not assert
an unconditional signed Fubini rule. Signed applications require separate local
L¹ assumptions.

### Sethuraman: E-T1

Printed pages 640–645 of the
[original Sethuraman (1994) paper](https://www.cs.princeton.edu/courses/archive/fall07/cos597C/readings/Sethuraman1994.pdf)
were inspected visually, especially Section 2, equation (2.1), and Theorem 3.4.

The arbitrary measurable space in `External/Sethuraman.lean:29–43` matches printed
page 642; no additional Polish-space assumption is required. The beta fractions
are iid `Beta(1,B)`, the locations are iid `F`, and the two sequences are mutually
independent. The product of two countable product measures in `hInput` expresses
exactly these conditions. Independence is not incorrectly attributed to the final
stick weights.

`stickWeight` and `stickMeasure` define the actual weighted Dirac series. A measurable
probability-valued version `Q`, almost surely equal to that series, is an input
obligation; the axiom supplies its finite-partition DP law. The normalized-Gamma
definition on printed page 640 also supports the convention for zero parameter
coordinates. Additional parameter continuity, a common probability-one event, and
posterior conclusions are not axiomatized here.

### SSV: E-S1, original-page verification open

Code location: `External/SSV.lean:35–58`. The specified source is the 2010 first
edition, Theorems 6.10 and 7.3, printed pages 58–60 and 63.

The audit could read Theorem 6.10, its principal-logarithm argument, and the Chapter 2
description of the reciprocal relation in an
[online transcription of the original book](https://dokumen.pub/bernstein-functions-theory-and-applications-9783110215311-9783110215304.html).
The [authors' official first-edition errata](https://www.motapa.de/bernstein_functions/misprints-ssv.pdf)
were also read directly. The local `literature/SSV.pdf` is currently absent. The
located first-edition PDF mirror returned 404, and the online transcription omits
part of the theorem passage on printed page 63. This audit therefore does not claim
visual verification of all specified original pages.

The independent formula check is as follows. Set `M(s)=∫(s+b)⁻¹ P(db)`, a nonzero
Stieltjes function. Applying the exponential representation to `1/M`, negating,
and subtracting the value at parameter 1 yields the code's identity
`log M(s)-log M(1)=∫η(t)((s+t)⁻¹-(1+t)⁻¹)dt`.
In the upper half-plane, `Im M(z)<0`, so the principal branches satisfy
`Log(1/M(z))=-Log M(z)`. The anchored difference kernel is bounded near zero and
is `O(t⁻²)` at infinity; no inverse-moment or zero-anchor assumption is needed.
Uniqueness is required only Lebesgue-almost everywhere on the positive half-line.

The corrections to the intermediate Herglotz measure's support and finiteness on
page 59, and to the equality replaced by an inclusion in Remark 6.11 on page 60,
are not used in the erroneous direction by this interface. The axiom does not
include pointwise boundary recovery, joint measurability, or generator continuity.
The available evidence reveals no statement error; verification against the
specified first-edition original pages is still required to close the source review.

## Build verification and trust boundary

The following commands were actually run in `formalization`, using the pinned
toolchain:

```powershell
$env:LEAN_NUM_THREADS = '2'
$auditLake = 'C:\Users\vtejd\.elan\toolchains\leanprover--lean4---v4.32.2\bin\lake.exe'
& $auditLake build
& $auditLake env lean AxiomAudit.lean
```

Both commands exited with code 0. The build reported
`Build completed successfully (3940 jobs)`. This was incremental verification
with existing build caches retained, not a new clean compilation of every
dependency. Direct execution of `AxiomAudit.lean` produced 883 axiom-dependency
checks; no `sorryAx`, `Lean.ofReduceBool`, or errors were found. The generic elan
shim initially failed because `ELAN_HOME` was unavailable; the installed pinned
toolchain above then succeeded without source changes.

The actual transitive dependencies of `GGC.ggc_rpow` are:

```text
propext
Classical.choice
Quot.sound
GGC.External.Bondesson.finite_atomic_approximation
GGC.External.Bondesson.thorin_realization
GGC.External.James.beta_atom_posterior
GGC.External.James.markov_krein
GGC.External.James.posterior_palm_nonneg
GGC.External.SSV.phase_representation
GGC.External.Sethuraman.stick_breaking
```

Thus seven of the eight declared external axioms enter the main theorem. E-B2 is
used in the characterization result but is absent from the final theorem's
dependencies. Compilation and dependency inspection establish the Lean result
relative to these axioms; they do not replace the literature-translation review.
This audit did not re-examine every line of the evolution analysis, nor does it
claim to eliminate the external axioms.

Build and direct-audit logs are retained in `../tmp/semantic-audit-2026-09-24/`.
Bondesson page extractions and renderings are in `../tmp/audit-bondesson/`;
the Sethuraman paper is in `../tmp/pdfs/semantic-audit-2026-09-24/`.
