# Literature Interfaces and the Retained External Input

The sole explicit external mathematical axiom is **E-S1**,
`GGC.External.SSV.phase_representation`, used by the main theorem beyond
Lean's standard logical axioms. E-B1, E-B3, E-J2, E-J3 and E-T1 are local
theorems; bounded Markov-Krein is a separately proved specialization.
No project core deduction is registered as an axiom.

The [README whitelist](../README.md#external-inputs) owns the trust policy;
[Blueprint](../Blueprint.md#local-foundation-contracts) owns current contracts;
[AcceptanceReport](../AcceptanceReport.md) owns design acceptance;
[AuditReport](../AuditReport.md) owns independent source/semantic judgments.
E-S1 remains an assumption even though its source correspondence was reviewed.
Its local formalization is outside the agreed scope.

## Retained interfaces and owners

| ID | Current declaration / owner | Contract and boundary |
|---|---|---|
| E-B1, local | `GGC.thorin_realization`, [Thorin/Interfaces](../GGC/Thorin/Interfaces.lean) | Realizes arbitrary nonnegative drift and Thorin-admissible positive-rate measure as a nonnegative probability law with its Laplace transform |
| E-B3, local | `GGC.finite_atomic_approximation`, [Thorin/Interfaces](../GGC/Thorin/Interfaces.lean) | One finite-gamma/finite-atomic approximation sequence for all positive Laplace parameters; no uniform moments |
| Bounded Markov-Krein, local | `GGC.RandomMeasure.markov_krein_of_bounded`, [Foundations/MarkovKrein](../GGC/Foundations/MarkovKrein.lean) | Measurable nonnegative bounded test; does not prove the retired general unbounded J1 interface |
| E-J2, local | `GGC.posterior_palm_nonneg`, [DirichletPalm](../GGC/DirichletPalm.lean) | Full measurable-only nonnegative one-observation disintegration with arbitrary supplied measurable posterior kernel and ENNReal joint test |
| E-J3, local | `GGC.beta_atom_posterior`, [DirichletPosterior](../GGC/DirichletPosterior.lean) | DP(U + dirac b) law of the actual independent-product atom mixture, with supplied Beta(1,B) weight law |
| E-T1, local | `GGC.stick_breaking`, [DirichletStickBreaking](../GGC/DirichletStickBreaking.lean) | Arbitrary-measurable-space finite-partition DP law of supplied independent Beta/location input and measurable probability-valued stick sum |
| E-S1, axiom | `GGC.External.SSV.phase_representation`, [SSV](SSV.lean) | Bounded measurable phase, real and complex anchor-one formulas, absolute integrability and a.e. uniqueness on the positive half-line |

E-B2 and its unused original-GGC-to-Thorin converse/equivalence are removed;
E-B4 was never declared and is withdrawn. General unbounded/log-integrable
E-J1 is retired. These retirements are not proofs of the omitted statements.
The original GGC definition remains in Definitions; its weak closure is proved
locally. The retained represented-law membership direction uses local E-B3.

## Source contracts and adaptations

**Bondesson:** L. Bondesson, *Generalized Gamma Convolutions and Related Classes
of Distributions and Densities*, Lecture Notes in Statistics 76, Springer, 1992,
[DOI](https://doi.org/10.1007/978-1-4612-2948-3). E-B1 locators: Section 3.1,
printed p.29 and pp.34-35 (retained PDF pp.38,43-44). E-B3 locator: final
paragraph of printed p.35 (PDF p.44). Retired E-B2 was Theorem 3.1.5, p.34.

Thorin rates are strictly positive but may approach zero. Admissibility is
integrability of `log(1 + 1/b)`, with no finite-total-mass requirement. Drift
may be positive and the measure may be zero. Positive-parameter transform
identities require the displayed integrability. Local endpoint equivalence
includes local finiteness, logarithmic integrability below one and reciprocal
integrability above one. Identify actual finite gamma sums using the local
Laplace formula and uniqueness; transform notation alone is not membership.

**James:** L. F. James (2005), *Annals of Statistics* 33, 647-660,
[DOI](https://doi.org/10.1214/009053604000001237),
[primary reprint math/0505606v1](https://arxiv.org/pdf/math/0505606).
Reprint p.2, (1)-(3), supplies the transform context; reprint pp.4-5 and (8)
supply posterior/disintegration context. Reprint pagination is not journal
pagination. J3 is source-derived from Gamma normalization and the posterior
construction, not quoted as a separately numbered source theorem.

The current J2/J3 public Lean contracts require **only a measurable space**.
Historical claims that Polish/Borel instances were original binders were
corrected by F-01; see [designer acceptance](../AcceptanceReport.md#f01) and
[the independent finding](../AuditReport.md#f01). Finite-partition DP semantics
allow zero-mass cells, arbitrary finite positive base mass and atomic/mixed
bases. J2 supplies a nonnegative identity; signed applications require local
absolute-integrability/Fubini proofs. J3 supplies no logarithmic bounds or
joint parameter continuity. Bounded Markov-Krein preserves its consumer's
type while discharging the bound internally.

**Sethuraman:** J. Sethuraman (1994), *Statistica Sinica* 4, 639-650,
[primary reprint](https://www.cs.princeton.edu/courses/archive/fall07/cos597C/readings/Sethuraman1994.pdf).
Equation (2.1), printed pp.642-643, and Theorem 3.4, p.645. The input product
encodes iid Beta(1,B) fractions, iid base locations and independence of those
sequences, not independence of the stick weights. The caller supplies a
measurable probability-valued Q equal a.s. to the explicit stick sum and
proves unit mass/common-event/parameter properties locally. The full interface
does not require topology, nonatomicity, a specific sampler or a DP tail.

**SSV:** R. L. Schilling, R. Song and Z. Vondracek, *Bernstein Functions:
Theory and Applications*, **2010 first edition**, Theorems 6.10 and 7.3,
printed pp.58-60 and 63, [publisher DOI](https://doi.org/10.1515/9783110215311),
with the [official 2022-12-01 first-edition errata](https://www.motapa.de/bernstein_functions/misprints-ssv.pdf).
E-S1 is a source-derived specialization for a probability on positive rates.
For its nonzero Stieltjes transform M, apply the representation to 1/M,
negate the logarithm and subtract at one. Retain the principal-log formula on
`0 < z.im`, absolute integrability and only Lebesgue-a.e. uniqueness.
No inverse moment at zero or zero-anchor condition is assumed. The corrected
Herglotz measure is finite on [0,infinity); the erroneous reverse inclusion
in Remark 6.11 is unused.

Boundary recovery is local: ApproximateIdentity and PoissonBoundary use
Lebesgue differentiation; StieltjesPhase transfers the complex formula to
the canonical limsup representative. Joint measurability, weak/scaling phase
continuity and generator conclusions remain local proofs, not axiom fields.

<a id="ssv-source-provenance"></a>
## SSV source identities and preparation evidence

The following preserves constructor preparation metadata from 2026-09-24;
it is not a new inspection or an independent-audit conclusion. The former
standalone source-preparation document is retained in
[immutable Git history](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/4ddc3967c568ee99268f72ae8d443da7641d0fe1/formalization/SSVSourceCheck-2026-09-24.md). Independent judgments are in
[AuditReport](../AuditReport.md#ssv-source-review), and designer source acceptance
is in [AcceptanceReport](../AcceptanceReport.md#source-review).

| Source | Recorded identity |
|---|---|
| Book | 2010 first edition, ISBN 978-3-11-021530-4; 328 PDF pages, 1,865,683 bytes |
| Book SHA256 | `8A06BBC186F355C3A4475DAB588F65FE41E5E5552794D2C896A41BCA1CD36702` |
| Original local reading copy | `literature/pdf/SSV.pdf`, through a junction to `E:\AI\GitHub\literature\ggcpp\SSV.pdf`; local/ignored availability is not guaranteed in a fresh clone |
| Errata | Dated 2022-12-01, three pages, 163,098 bytes; page 2 inspected in the recorded preparation/reviews |
| Errata SHA256 | `8B1A84D42F825BA4F6DC4EADF6C1EDEC9703D386E1F53ECA912A003328EB4A7C` |

The physical one-based PDF/printed-page mapping is: title 4, copyright 5,
Definition 2.1 printed p.11 -> PDF 24, Theorem 6.10 printed pp.58-59 -> PDF
71-72, Remark 6.11 printed p.60 -> PDF 73, and Theorem 7.3 printed p.63 ->
PDF 76. The earlier preparation compared complete hypotheses, real/complex
signs and branch, anchor-one subtraction, integrability, measurable versions,
a.e. uniqueness and errata. Original rendered pages/logs were supplemental
local artifacts; the source identities, locators and record remain in Git.

## Checking and extension rules

From `formalization`, use the pinned toolchain and relevant commands, including:

```powershell
lake env lean GGC/Thorin/Interfaces.lean
lake env lean Checks/ThorinInterfacesContract.lean
lake env lean -t 0 AxiomAudit.lean
```

These check local proofs and elaborate assumption types. The actual transitive
dependency set of `GGC.ggc_rpow`, not a proposition definition or file move,
establishes the remaining boundary. Apply the
[interface lifecycle](../README.md#external-interface-lifecycle): locally proved
wrappers leave External/GGC.External, with full caller/check/audit migration
and no old-name alias or forwarding file. Preserve source citations and exact
contracts. Remaining assumption modules must not import their consumers.
Definitions imports mathlib only; main consumes proved helpers. New shared
semantics belong in an independent lower foundation, not a target assumption.

The [primary-interface note](../../notes/log-rate-power-proof-primary-interfaces.md)
and [reference map](../../ledger/references.md) preserve wider provenance.
Project acceptance and independent audit statements remain in their separate
owner reports; source preparation, a passing build and independent source
review have distinct meanings.
