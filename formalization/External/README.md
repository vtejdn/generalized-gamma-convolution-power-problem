# External mathematical axioms

This folder contains all literature theorems currently introduced as Lean
axioms. They are explicit assumptions in the formalization's trust boundary.
Compiling an axiom declaration checks its type; it does not prove the external
mathematical result. No project core result, including GGC power closure, is
registered here as an axiom.

The current declarations are in [Bondesson.lean](Bondesson.lean), under
`GGC.External.Bondesson`. That file imports mathlib only. It writes every
assumption and conclusion using actual measures, integrals, probability laws,
and weak convergence, without importing `main.lean` or using an opaque GGC
predicate. Consequently it cannot create an import cycle with the main file.

## Introduced declarations

| ID | Lean declaration | Contract and intended consumers |
|---|---|---|
| E-B1 | `GGC.External.Bondesson.thorin_realization` | Realize every nonnegative drift and Thorin-admissible positive-rate measure as a nonnegative probability law with the displayed Laplace transform. Intended for Thorin/value-law construction, Blueprint M0/M1 and M6. |
| E-B2 | `GGC.External.Bondesson.weak_closure` | A weak limit of represented laws, already known to be a probability law, inherits nonnegative concentration and an admissible Thorin representation. Under the approved original GGC definition, this can supply the original-membership-to-representation direction in M1. |
| E-B3 | `GGC.External.Bondesson.finite_atomic_approximation` | Approximate every represented law by nonnegative probability laws with zero-drift finite-atomic Thorin transforms. After local identification of these approximants with actual finite gamma sums, this can supply the representation-to-original-membership direction in M1. |

All three use L. Bondesson, *Generalized Gamma Convolutions and Related Classes
of Distributions and Densities*, Lecture Notes in Statistics **76**, Springer,
**1992**, [DOI 10.1007/978-1-4612-2948-3](https://doi.org/10.1007/978-1-4612-2948-3).
The source locators are:

- **E-B1:** Section 3.1, printed p. 29 and pp. 34–35; retained PDF pp. 38, 43–44.
- **E-B2:** Theorem 3.1.5, printed p. 34; retained PDF p. 43.
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
Before manipulating these integrals, prove locally that the admissibility
condition implies integrability of `log (1 + s / b)` for every such `s`, and
verify its equivalence with the classical Thorin conditions. The Laplace
integrand is bounded on the law's nonnegative concentration set; the formal
integrability proof and all changes of variables remain local work.

E-B2 uses mathlib's weak topology on `ProbabilityMeasure ℝ`. Thus its limit is
a nondefective probability law, as required by the source. It does not assert
that an arbitrary pointwise transform limit has mass one, or include the
source's converse canonical-measure claim.

E-B3 specifies an exponential of a finite sum of logarithms with positive
shapes and rates. It allows an empty sum, representing the law concentrated
at zero. The finite sum must still be connected locally to an atomic Thorin
measure and to an actual sum of independent gamma variables. This gamma-sum
API has not been implemented. No moment bound uniform over the approximating
sequence is assumed. Neither E-B2 nor E-B3 supplies continuity of the power
pushforward or power closure of the finite inputs.

The contracts intentionally contain no power exponent, log-rate generator,
Euler solution, or dynamic identification conclusion. Their use cannot by
itself complete the project's main theorem.

## Original definition and authorized characterization fallback

The approved [definition contract](../Blueprint.md#original-ggc-definition)
requires `main.lean` to define GGC by weak limits of actual finite gamma sums.
Thorin representability becomes the separate `HasThorinRepresentation`
predicate in planned `GGC/Thorin.lean`. Existing E-B1--E-B3 do not change their
primitive types: their adapters must use the representation predicate rather
than treating it as definitionally equal to the new `IsGGC`.

Prefer a characterization proof using mathlib and local lemmas if modest.
Alternatively, the already declared E-B2/E-B3 permit a local derivation once
finite-gamma transform certificates and Laplace uniqueness are available.
That derivation is verified relative to E-B2/E-B3, not axiom-free.

**E-B4 is authorized as a fallback, but has no Lean declaration.** If the
characterization requires substantial new work, register
`GGC.External.Bondesson.thorin_characterization` in the proposed
`External/ThorinCharacterization.lean`. For every nonnegative probability law
\(\mu\), its complete primitive contract must equate:

- Existence of a weakly convergent sequence with limit \(\mu\), each term the
  sum pushforward of a finite product of actual shape/rate gamma measures
  with positive parameters. Permit zero summands; no uniform moment bound
  or common sample space is required.
- Existence of \(a\ge0\) and a measure \(U\) on positive rates with
  `Integrable` for \(\log(1+1/b)\), and
  \(\int e^{-sx}\,\mu(dx)=\exp\{-as-\int\log(1+s/b)\,U(db)\}\)
  for every \(s>0\). Permit infinite Thorin mass and nonzero drift.

Use mathlib measures, products, maps, weak convergence and integrals, so the
external file imports mathlib only and does not import `main` or either public
predicate. The local adapter must prove equivalence of these exact primitive
formulas with the project's wrappers. E-B1 realization of arbitrary data
remains a separate existence contract.

Provenance: Bondesson (1992), Section 3.1, printed p.29, Theorem 3.1.5 on p.34
and the finite-gamma approximation paragraph on p.35, with the existing
primary-interface audit linked above. Before introduction, match both
directions and the integrability convention to the source and record local
adaptations. Record the cost assessment, selected route and dependency audit;
do not introduce E-B4 redundantly if the E-B2/E-B3 bridge is already cheap.
No new approval is needed for this user-authorized fallback. This permission
does not extend to any project power-closure or evolution/identification
result. No new source audit or axiom declaration is claimed by this update.

The final finite-input-to-general reduction uses approximation directly from
the original definition and locally proved weak closure. It therefore needs
neither E-B2/E-B3 nor E-B4 directly; the finite-input proof uses the selected
characterization to establish GGC membership of its constructed value laws.

## Whitelisted inputs not introduced yet

In addition to the optional E-B4 fallback above, the following entries remain
construction requirements. They currently have
**no Lean axiom declaration**; their symbols must not be treated as available
APIs or proved results.

| ID | Planned source and interface | Required work before introduction |
|---|---|---|
| E-J1 | James (2005), arXiv:math/0505606v1, reprint p. 2, (1)–(3): gamma normalization, independence, and Markov–Krein identity. | Define a Dirichlet process with finite-partition or stick-breaking semantics; state the exact random-mean and logarithmic integrability conditions. |
| E-J2 | Same paper, pp. 4–5, posterior formula and (8): nonnegative one-observation Palm/posterior identity, including atomic and mixed bases. | Define measurable random-measure evaluation and the posterior kernel, then state the nonnegative identity. Signed use requires local absolute integrability. |
| E-J3 | A source-derived interface from the James posterior and gamma-normalization results: independent beta mixing realizes the augmented-base posterior. | Supply actual beta and Dirichlet laws, independence and pushforward semantics, or prove this specialization locally. |
| E-S1 | Schilling–Song–Vondracek, *Bernstein Functions*, **2010 first edition**, Theorems 6.10 and 7.3, printed pp. 58–60 and 63, with the official 2022-12-01 errata. | Give the nonzero Stieltjes function, bounded phase, anchor-one integral, a.e. uniqueness, and any complex-domain contract needed for boundary recovery. Joint measurability remains local work. |
| E-T1 | Sethuraman (1994), Section 2, (2.1), pp. 642–643, and Theorem 3.4, p. 645: stick-breaking construction of a Dirichlet process. | Specify independent beta break fractions and independent base locations, the actual random measure, and total mass one. Parameterized convergence and uniform integrability remain local work. |

Do not fill these gaps with an opaque `IsDirichletProcess` predicate, an
uninterpreted phase object, or a structure whose fields assume the project
deductions. Add each external theorem only when its complete Lean semantics,
source, hypotheses, local adaptations, and intended consumers can be audited.

## Checking and extension rules

From `formalization`, the declarations can be checked with:

```powershell
lake env lean External/Bondesson.lean
```

A successful check establishes elaboration in the pinned environment only.
Build evidence and the implementation status are maintained in the parent
[README](../README.md) and [Blueprint](../Blueprint.md).

Every new axiom belongs in this folder, must be registered in the project
whitelist and this inventory, and must carry a complete type and provenance
docstring. Project proof modules import the external contracts they need;
external modules must not import `main`, `GGC.Basic`, or project proof modules.
Under the [approved statement/proof separation](../Blueprint.md#statement-proof-separation),
project proof modules may import `main` to use its complete definitions, while
`main` will no longer import external declarations. That migration remains
pending. If shared semantic definitions are later needed for Dirichlet
processes or phases, put their actual definitions in the independently
reviewable `GGC/Foundations/RandomMeasure.lean` layer, which imports mathlib
only. This keeps external inputs independent of the target and its proof.

Once the genuine main proof exists, import `GGC.PowerClosure` in the audit
and use `#print axioms GGC.ggc_rpow` to check its transitive dependencies
against this inventory. A named target
proposition is not a proof and must not be reported as a completed theorem.
