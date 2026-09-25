# Literature interfaces and remaining mathematical axioms

Six retained literature interfaces remain across the project. E-B1, E-B3 and E-J3 are locally
proved theorems with their original types; E-J2, E-T1 and E-S1 are the three
explicit literature axioms, all used by the main theorem. E-B2 and its unused
converse/equivalence consumers are removed. Compiling the three axiom
declarations checks their types, not their mathematical proofs.
No project core result is registered as an axiom.

Project scope retains E-S1 as the sole external mathematical input at
completion. Its local formalization is excluded; `External/SSV.lean` and its
complete audited contract remain required. The current inventory above still
includes J2/T1 until their local replacements pass acceptance.

[GGC/Thorin/Interfaces.lean](../GGC/Thorin/Interfaces.lean) now owns E-B1/E-B3
and imports the independent `GGC.Thorin.Realization` layer. `External` contains
only the three remaining literature axioms. The same-type E-J3 theorem is
`GGC.beta_atom_posterior` in [DirichletPosterior.lean](../GGC/DirichletPosterior.lean),
which reuses [DirichletUpdate.lean](../GGC/Foundations/DirichletUpdate.lean),
whose finite Gamma/Dirichlet proofs import no External input.
That Thorin lower layer imports neither this interface
nor any `External` input, `GGC.Thorin`, `Identification`, `PowerClosure` or `main`.
SSV remains mathlib-only; James and Sethuraman use mathlib and independent shared
random-measure semantics. All retained primitive interface types retain actual measures,
integrals, nonnegative probability laws and the original quantifier order.

E2's implementation and fresh verification are documented in the
[construction report](../ConstructionReport.md#e2-construction-2026-09-24).
E2 has passed [independent design acceptance](../ConstructionReport.md#e2-design-acceptance-2026-09-24). E2-P subsequently removes E-B2 and its unused forward/equivalence interfaces;
see [the cleanup record](../ConstructionReport.md#unused-axiom-cleanup-2026-09-24).
## Independent source-review status

The auditor's [2026-09-24 report](../SemanticAudit-2026-09-24.md) directly
checked E-B1--3, E-J1--3 and E-T1 against the original pages. E-S1's formula,
principal logarithm, anchor and official errata were checked without finding
an error, but images of the specified 2010 first-edition pages were not
obtained in that audit. The local copy has since been located at
[literature/pdf/SSV.pdf](../../literature/pdf/SSV.pdf), through a directory
junction to the local reference library. The earlier missing-file observation
is superseded. The constructor has now completed the edition and original-page comparison; see [SSVSourceCheck](../SSVSourceCheck-2026-09-24.md). The designer independently rendered and inspected the same edition and errata, confirmed all interface adaptations, and closed **S1-SOURCE**; see [Section 34](../ConstructionReport.md#e2-design-acceptance-2026-09-24). E-S1 remains an axiom.
The user confirmed that the constructor supplies the source comparison and
evidence, and the designer or independent auditor reviews it before closure.
Registration, file presence and passing Lean builds do not close this review.
The independent report is preserved; designer follow-up is recorded in the
[independent acceptance](../ConstructionReport.md#e2-design-acceptance-2026-09-24).
The confirmed assignment and local-file check are recorded in
[the follow-up](../ConstructionReport.md#source-review-ownership-2026-09-24).

## Introduced declarations

| ID | Lean declaration | Contract and intended consumers |
|---|---|---|
| E-B1 (local theorem) | `GGC.thorin_realization` | Realize every nonnegative drift and Thorin-admissible positive-rate measure as a nonnegative probability law with the displayed Laplace transform. Intended for Thorin/value-law construction, Blueprint M0/M1 and M6. |
| E-B3 (local theorem) | `GGC.finite_atomic_approximation` | Approximate every represented law by nonnegative probability laws with zero-drift finite-atomic Thorin transforms. After local identification of these approximants with actual finite gamma sums, this can supply the representation-to-original-membership direction in M1. |
| E-J1 (retired) | Former `GGC.External.James.markov_krein`, deleted | The unused general unbounded/log-integrable interface is retired. `GGC.RandomMeasure.markov_krein_of_bounded` is a distinct proved specialization used by the unchanged `dirichletMean_laplace`; it is not a same-type proof of the former interface. |
| E-J2 | `GGC.External.James.posterior_palm_nonneg` | Nonnegative one-observation disintegration for an explicitly measurable posterior kernel whose values have DP(U+δ_b) laws. Signed applications still require local L1 proofs. |
| E-J3 (local theorem) | `GGC.beta_atom_posterior` in `GGC/DirichletPosterior.lean` | DP(U+δ_b) law of the actual independent-product atom mixture. The supplied weight law must push forward to mathlib's Beta(1,B) measure. M2 consumer: `posteriorMixture_isDirichlet`. |
| E-T1 | `GGC.External.Sethuraman.stick_breaking` | Actual independent beta/location input law; measurable probability-valued stick sum supplied by the caller. Gives the shared finite-partition DP law. Consumer: `dirichletLaw_isDirichlet`. |
| E-S1 | `GGC.External.SSV.phase_representation` | Bounded measurable real phase with anchor-one representation, principal-log representation on the upper half-plane, absolute integrability, and a.e. uniqueness on `(0,∞)`. Consumer: `phase_anchor_one`, via a locally proved Poisson boundary recovery. |

The two active E-B theorem interfaces and retired E-B2 use L. Bondesson, *Generalized Gamma Convolutions and Related Classes
of Distributions and Densities*, Lecture Notes in Statistics **76**, Springer,
**1992**, [DOI 10.1007/978-1-4612-2948-3](https://doi.org/10.1007/978-1-4612-2948-3).
The source locators are:

- **E-B1:** Section 3.1, printed p. 29 and pp. 34–35; retained PDF pp. 38, 43–44.
- **E-B2 (retired):** Theorem 3.1.5, printed p. 34; retained PDF p. 43.
- **E-B3:** Final paragraph of printed p. 35; retained PDF p. 44, using the
  Section 3.1 representation to express the finite-gamma approximation by
  its finite-atomic transform.

These are source-derived interfaces in primitive Lean notation, rather than
verbatim encodings of the book's notation. The retained
[primary-interface audit](../../notes/log-rate-power-proof-primary-interfaces.md)
records the source review of 2026-09-05, updated 2026-09-06. The
[reference map](../../ledger/references.md) and
[project whitelist](../README.md#external-inputs) supply further provenance.
The current scaffolding work does not constitute a new primary-text audit.

## Exact scope and local work

Rates belong to `{b : ℝ // 0 < b}`; they may approach zero. Thorin admissibility
is the integrability of `log (1 + 1 / b)`. There is **no finite-total-mass
requirement** on the Thorin measure. The drift may be nonzero, and the zero
measure is permitted. The represented law is explicitly a probability measure
on the real line concentrated almost everywhere on nonnegative values.

Every displayed Laplace identity is quantified over all real `s > 0`.
`GGC.ThorinAdmissible.integrable_log` now proves integrability of
`log (1 + s / b)` for every `s ≥ 0`. `GGC.thorinAdmissible_iff_endpoint`
proves equivalence with local finiteness, absolute logarithmic integrability
on rates at most one, and reciprocal-rate integrability on rates above one.
The local-finiteness clause controls mass near rate one, where `log b` vanishes.
`GGC.Laplace` proves Laplace integrability and uniqueness without moments.

E-B2 formerly asserted closure of Thorin representability at a probability
limit. It is now retired with its unused characterization consumers. The
locally proved original-GGC weak closure remains unchanged.

E-B3 specifies an exponential of a finite sum of logarithms with positive
shapes and rates. It allows an empty sum, representing the law concentrated
at zero. The finite sum is connected locally to `finiteThorinMeasure` and to
the actual independent gamma sum by `laplace_finiteGammaLaw`. Local Laplace
uniqueness identifies E-B3's approximants. No moment bound uniform over the approximating
sequence is assumed. E-B3 does not supply continuity of the power
pushforward or power closure of the finite inputs.

The contracts intentionally contain no power exponent, log-rate generator,
Euler solution, or dynamic identification conclusion. Their use cannot by
itself complete the project's main theorem.

## Original definition and retained membership direction

The [definition contract](../Blueprint.md#original-ggc-definition) requires
`Definitions.lean` to define GGC by weak limits of actual finite Gamma sums.
`HasThorinRepresentation` remains separate in `GGC/Thorin/Basic.lean`.
The retained `HasThorinRepresentation.isGGC`, `isGGC_diracLaw` and realization
adapters use locally proved E-B1/E-B3 and standard logic only.

At the user's request, E2-P removes the unused E-B2 axiom,
`IsGGC.hasThorinRepresentation` and `isGGC_iff_hasThorinRepresentation`.
This is scope retirement, not a local proof of the converse. No production
consumer or main-theorem hypothesis changes. The former E-B4 fallback was
never declared and is now withdrawn from the active whitelist. It must not
be added under the superseded authorization.

The final reduction extracts approximants directly from the original
`IsGGC` definition and applies locally proved weak closure. The finite-input
proof uses the retained represented-law direction for its constructed laws.
See [Section 35](../ConstructionReport.md#unused-axiom-cleanup-2026-09-24) for
fresh validation and [Blueprint Section 19](../Blueprint.md#e3-james-reduction-plan)
for the James reduction plan. J3 has an independently accepted complete local
proof. E3.3 now proves the bounded Markov-Krein formula and retires the unused
general J1 interface rather than claiming a same-type proof of it. Construction
and validation are in [Section 45](../ConstructionReport.md#e3-three-construction-2026-09-25),
independently accepted; see [Section 46](../ConstructionReport.md#e3-three-design-acceptance-2026-09-25).

## James registration — 2026-09-23

E-J1–E-J3 were originally declared. E3.2 proves J3; E3.3 retires the general J1
interface after proving its required bounded specialization. The [primary reprint](https://arxiv.org/pdf/math/0505606)
was read at its version-marked page 1 and reprint pp.2, 4–5. Bibliography:
L. F. James (2005), *Annals of Statistics* 33, 647–660,
[DOI 10.1214/009053604000001237](https://doi.org/10.1214/009053604000001237).
These page numbers are reprint pages, not the journal pagination.

E-J1 specializes (1)–(3) to a nonnegative real test and z=1. E-J2 uses the
one-observation posterior discussion and (8), with the joint test made
explicit. E-J3 is source-derived: add an independent shape-one gamma atom,
then normalize; the gamma ratio supplies the Beta(1,B) weight. It is not
presented as a separately numbered theorem in the paper.

All three use actual finite-partition DP semantics on a Polish Borel space.
Zero-mass partition cells are permitted. The base has finite positive mass;
there is no nonatomicity or moment assumption. E-J2 supplies no signed Fubini
rule or chosen measurable-kernel construction. E-J3 supplies no posterior
logarithmic bounds. The local beta density adapter, product construction,
mean estimates, and Laplace identification belong in proof modules. None
supplies DP existence, a common parameterized realization, the power tangent,
canonical phase, or a generator identity.

## Sethuraman registration — 2026-09-24

E-T1 is declared in [Sethuraman.lean](Sethuraman.lean) as
`GGC.External.Sethuraman.stick_breaking`. The primary reprint was inspected
at printed pp.642 and 645 (PDF pages 4 and 7); equation (2.1) continues on
p.643. Source: J. Sethuraman, *Statistica Sinica* 4 (1994), 639–650,
[primary reprint](https://www.cs.princeton.edu/courses/archive/fall07/cos597C/readings/Sethuraman1994.pdf).

The source-derived contract uses the actual product law of an iid beta
fraction sequence and an independent iid base-location sequence. Its
conclusion is the existing normalized-gamma finite-partition DP law,
including zero-mass cells, on an arbitrary measurable base space. It does
not restrict the base to be nonatomic. A measurable probability-valued map
equal a.s. to the explicit stick sum is a premise: the local constructor
must establish its unit mass and all parameter measurability. Common-event
convergence is proved separately in `GGC.CommonUniforms`. No continuity,
uniform integrability, posterior identity or power theorem is included.

## SSV registration — 2026-09-24

E-S1 is declared in [SSV.lean](SSV.lean) as
`GGC.External.SSV.phase_representation`. This is a source-derived
specialization of *Bernstein Functions*, **2010 first edition**, Theorems
6.10 and 7.3, printed pp.58–60 and 63, to the Stieltjes transform of a
probability on positive rates. The source record and first-edition
[2022-12-01 errata](https://www.motapa.de/bernstein_functions/misprints-ssv.pdf)
are recorded in [the primary-interface audit](../../notes/log-rate-power-proof-primary-interfaces.md).

The interface applies the exponential representation to the reciprocal,
negates the logarithm, and subtracts the value at one. Its `RealPhase` and
`Phase` structures spell out ordinary measurable functions, `[0,1]` bounds,
absolute integrability, and explicit real/complex integral formulas; they
do not package project conclusions. The complex domain is `0 < z.im`,
with the principal logarithm. Uniqueness is only modulo Lebesgue-null sets
on the positive half-line. There is no inverse moment or zero-anchor premise.
The corrected finite Herglotz measure is on `[0,∞)`; the erroneous reverse
inclusion in Remark 6.11 is unused.

Boundary recovery is **not** an axiom: `GGC.Foundations.ApproximateIdentity`
proves bounded-measurable approximate-identity convergence from mathlib's
Lebesgue differentiation theorem, and `GGC.Foundations.PoissonBoundary`
specializes it to the standard Cauchy density. `GGC.StieltjesPhase` takes
the imaginary part of the complex formula, identifies the fixed-height
limsup almost everywhere, and transfers the anchor formula and uniqueness.
Joint Borel measurability and the narrow-Borel/Giry bridge are also local.
No weak-star phase limit or generator continuity is supplied by E-S1.

The E-B4 fallback is withdrawn and undeclared. No unused mathematical axiom
is retained outside the main theorem's dependency set.

## Checking and extension rules

From `formalization`, the declarations can be checked with:

```powershell
lake env lean GGC/Thorin/Interfaces.lean
lake env lean Checks/ThorinInterfacesContract.lean
lake env lean AxiomAudit.lean
```

A successful check verifies the local theorem proofs and elaborates the
remaining axiom types; it does not supply proofs of those assumptions.
Build evidence and implementation status are maintained in the
[Construction Report](../ConstructionReport.md). The [Blueprint](../Blueprint.md)
is read-only during construction.

Every new axiom belongs in this folder, must be registered in the project
whitelist and this inventory, and must carry a complete type and provenance
docstring. Project proof modules import the external contracts they need;
external assumption modules must not import `main` or consumer proof modules.
The [external-interface lifecycle rule](../README.md#external-interface-lifecycle)
requires locally proved interfaces and their public wrappers to leave this
directory and the `GGC.External` namespace. The old Bondesson/James wrapper
exceptions are superseded. Bondesson has already migrated; the remaining
E-J3 wrapper has moved to `GGC.DirichletPosterior` under
[Blueprint Section 24](../Blueprint.md#audit-r2-and-j3-relocation).
There is no External alias or forwarding wrapper. James retains E-J2 with an
explicit `Foundations.Posterior` import and no DirichletUpdate proof import.
Source provenance and historical audit records remain. Construction validation
is in [Section 48](../ConstructionReport.md#r2-j3-closeout-2026-09-25);
independent design acceptance is complete in
[Section 49](../ConstructionReport.md#r2-j3-design-acceptance-2026-09-25),
with the full primitive contract and unchanged three-axiom boundary verified.
Under the [approved statement/proof separation](../Blueprint.md#statement-proof-separation),
project proof modules import `Definitions` to use its complete definitions, while
`Definitions` imports mathlib only; `main` consumes the proved helpers.
If shared semantic definitions are later needed for Dirichlet
processes or phases, put their actual definitions in the independently
reviewable `GGC/Foundations/RandomMeasure.lean` layer, which imports mathlib
only. This keeps external inputs independent of the target and its proof.

`AxiomAudit.lean` now imports `main` and uses
`#print axioms GGC.ggc_rpow` to check the genuine proof's transitive dependencies
against this inventory. The actual final dependency list and verification
evidence are recorded in the [E2 independent acceptance](../ConstructionReport.md#e2-design-acceptance-2026-09-24); the [M7 report](../ConstructionReport.md#m7-completion-2026-09-24) preserves the earlier seven-input result.
A named target proposition alone is not a proof.


### Relocated local Thorin interfaces

The [Tidy-Thorin migration](../Blueprint.md#thorin-interface-migration) is
implemented and independently accepted; see
[Section 42](../ConstructionReport.md#tidy-thorin-design-acceptance-2026-09-25). E-B1/E-B3 now live in
[GGC/Thorin/Interfaces.lean](../GGC/Thorin/Interfaces.lean), as
`GGC.thorin_realization` and `GGC.finite_atomic_approximation`. Their complete
primitive types, proof calls and Bondesson provenance are preserved.
The former External module is deleted, with no forwarding file or old-name alias.
See [Section 41](../ConstructionReport.md#tidy-thorin-construction-2026-09-25)
for the original-type checks, build and audit. At that migration acceptance,
five mathematical axioms remained. E3.2 subsequently proves E-J3 at its full
original type, reducing the count to four at E3.2; see
[Section 43](../ConstructionReport.md#e3-one-two-construction-2026-09-25).
E3.1/E3.2 are independently accepted; see [Section 44](../ConstructionReport.md#e3-one-two-design-acceptance-2026-09-25). E3.3 now reduces the current count to three, independently accepted; see [Section 46](../ConstructionReport.md#e3-three-design-acceptance-2026-09-25).
The original general J1 declaration is absent; the bounded replacement is in
[MarkovKrein.lean](../GGC/Foundations/MarkovKrein.lean).
