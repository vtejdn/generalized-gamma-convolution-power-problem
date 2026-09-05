# Full power theorem: assembled argument and end-to-end audit

Entry: WIP-6.21. This is the full-scope assembly of the log-rate
construction, not a replacement of the original goal by a special case.

[WIP](../WIP.md) | [BigPicture](../BigPicture.md) |
[Continuity and existence](21-log-thorin-euler-evolution.md) |
[Identification](22-power-flow-identification.md)

**Current status: [PROVED IN PROJECT; INTERNAL MATHEMATICAL AUDIT
COMPLETE, 2026-09-06].** See the requirement-by-requirement
[completion audit, WIP-6.23](25-mathematical-completion-audit.md).
The component lemmas have written proofs and have undergone internal
cross-checking. This file records the precise consequence and
its dependency audit. It is not a claim of publication, external peer
review, Lean verification, or literature priority.

<a id="wip-6-21"></a>
## WIP-6.21 — assembly at the full conjecture's quantifiers

The project conclusion, with its mathematical audit now complete, is
\[
\boxed{X\in GGC,\qquad q\ge1\quad\Longrightarrow\quad X^q\in GGC.}
\tag{6.150}
\]
The proof has two stages. In the first, the log-rate second-moment
assumption is an invariant of the constructed evolution, not an
assumption on the final general GGC input. It is removed in the second
stage by the already established finite-gamma weak-density reduction.

### Stage A: every finite-gamma input, with arbitrary shapes and rates

Take independent unit-rate gammas and write
\[
X=\sum_{i=1}^n b_i^{-1}G_{\beta_i}^{(i)},\qquad
B_0=\sum_i\beta_i>0,
\qquad F_0=\frac1{B_0}\sum_i\beta_i\delta_{\log b_i}.
\tag{6.151}
\]
This \(F_0\) is a probability with finite second moment. No bound is
imposed on \(n,B_0\), the individual shapes, the rate contrast, or
coincidences between rates.

Fix any finite \(q>1\), and set \(T=\log q\).
WIP-6.19 constructs a narrowly continuous probability curve \(F_t\)
on \([0,T]\), with a uniform second log-rate moment, satisfying
the weak equation for the exact generator in WIP-6.16. Define
\[
U_t=B_0e^{-t}\exp_*F_t.
\tag{6.152}
\]
These are positive finite measures, and their logarithmic Thorin
integrability follows from the moment bound. Thus each defines a
genuine zero-drift GGC law \(\nu_t\), not merely a signed formal
Thorin candidate. At time zero, its transform is that of \(X\).

All the hypotheses of WIP-6.20 are exactly those supplied by
WIP-6.19, with no additional tail or uniqueness assumption. That
identification gives
\[
\nu_t=\mathcal L(X^{e^t})\quad(0\le t\le T),
\qquad \nu_T=\mathcal L(X^q)\in GGC.
\tag{6.153}
\]
Since \(q>1\) was arbitrary, this proves the finite-gamma conclusion
at every real exponent above one. The endpoint \(q=1\) is immediate.
There is no need to interpolate from integer or rational powers, and
no need to iterate a local result on finite atomic Thorin measures.
Intermediate measures in the Euler construction need not be atomic.

### Stage B: all GGC inputs, including drift and infinite Thorin mass

Fix \(q\ge1\) and any nonnegative \(X\in GGC\).
The finite-gamma weak-density and weak-closure input in
[WIP-0.1](00-foundations.md#wip-0-1) gives finite gamma convolutions
\(X_m\Rightarrow X\). By Stage A, every \(X_m^q\) is GGC.
The power map is continuous on \([0,\infty)\), so
\[
X_m^q\Rightarrow X^q,
\qquad X^q\in GGC
\tag{6.154}
\]
by GGC weak closure. The approximation includes deterministic drift:
for a constant \(d>0\), the gamma variables
\((d/m)G_m\) have mean \(d\), variance \(d^2/m\), and converge
in probability to \(d\). The zero constant is a scale-zero limit.
The general finite-gamma density theorem includes infinite Thorin mass;
no finite-mass assumption survives in (6.150).

This assembly uses only the exact existence/identification interfaces
and the known weak-closure reduction. It does not use the auxiliary
square theorem, Bondesson's independent-product theorem, Sjodin's 2026
induction, a fractional peeling assertion, or a numerical experiment.

## Dependency and failure-mode audit

| Required mathematical obligation | Evidence to audit | Failure avoided |
|---|---|---|
| Actual power tangent at every current zero-drift finite-Thorin law | WIP-6.11, (6.67)--(6.70) | treating an initial finite-gamma formula as valid only at the initial atom set |
| Exact compensated weak operator, with finite absolute integrals | WIP-6.12--6.13 | unsigned off-atom jumps without their drift compensation |
| Correct Palm parameter and normalization | WIP-6.16, (6.91)--(6.101) | replacing the original psi(B+1) by a posterior-mass parameter |
| Uniform log-rate drift and jump second moment | WIP-6.17 | rate moments that diverge after the first positive step |
| Continuity under changing non-atomic measures and unbounded support | WIP-6.18 | assuming boundary phases converge pointwise |
| Positive discrete probability kernels | WIP-6.19, (6.121)--(6.124) | applying a minimum principle as an existence theorem |
| Uniform second moments and finite-time compactness | WIP-6.19, (6.125)--(6.126) | loss of mass at zero/infinity after exponentiating rates |
| Vanishing cumulative error and nonlinear passage to the limit | WIP-6.19, (6.127)--(6.128) | matching only one first-order tangent |
| Thorin admissibility and continuity of the associated laws | WIP-6.20, Sections 1--2 | presuming a positive measure already defines a probability transform |
| Named tests legitimately extend beyond compact support | WIP-6.20, Section 3 | silently applying the weak equation to unbounded logarithmic tests |
| Correct mass decay and exact current-law equation | WIP-6.20, (6.138) | forgetting the derivative of B(t) = B(0) exp(-t) |
| Absolute integration at zero Laplace argument | WIP-6.20, (6.140)--(6.142) | an unidentified normalization constant or an assumed finite E[X log X] |
| Uniqueness for the actual distributional evolution | WIP-6.20, Sections 7--8 | using static Laplace uniqueness as dynamic PDE uniqueness |
| Arbitrary real powers and arbitrary initial finite support | Stage A above | substituting a fixed power or bounded support count for the full quantifier |
| Drift, infinite mass and zero degeneracies | Stage B and WIP-0.1 | leaving the final GGC approximation outside the proved range |

## External inputs and provenance

The relevant exact source records are [Sources 20--23](references.md)
and the original foundational weak-closure record. In particular:

- James (2005) supplies the gamma--Dirichlet identity and posterior
  disintegration; the posterior identity also has a finite-partition
  proof in WIP-6.16.
- Schilling--Song--Vondracek (2010), Theorems 6.10 and 7.3, supply the
  unique bounded phase of a Stieltjes reciprocal. The primary pages
  were read directly, including the condition needed for anchoring
  at zero, which the present argument does not assume.
- Sethuraman (1994) is the provenance of the stick-breaking
  construction. WIP-6.18 includes its finite-partition verification
  and the specific weak-continuity coupling needed here.
- GGC finite-gamma weak density and weak closure are the foundational
  input in WIP-0.1; Bondesson (1992), Section 3.1 and Theorem
  3.1.5, printed pp. 34--35 / PDF pp. 43--44, are located in the
  foundational source note.

The log-rate generator, its drift bound, the positive Euler proof and
the dynamic identification are project deductions. Known density
formulae and classical constructions are not being claimed as new.

## Review state and completed mathematical handoff

1. WIP-6.16--6.17 have been derived independently and checked against
   the rate-coordinate identity.
2. WIP-6.18 has two independent checks, including the moving-rate
   resolvent bound and weak-star phase passage.
3. WIP-6.19 has undergone an independent equation-by-equation check
   of positivity, moments, time compactness and consistency.
4. WIP-6.20 and its interfaces with WIP-6.19 have passed the independent
   backward audit; no missing internal mathematical lemma was identified.
   The three critical primary interfaces were also reread directly; see
   [the source audit](../notes/log-rate-power-proof-primary-interfaces.md).
5. On 2026-09-06, the direct resolvent calculation in
   [WIP-6.22](24-direct-log-generator-resolvent.md) supplied a simpler
   independently checked interface, including the absolute posterior
   drift estimate needed for signed Palm disintegration. The full
   mathematical chain was then audited from the original quantifiers
   backwards and through the construction forwards. Its precise
   requirements and their proofs are recorded in
   [WIP-6.23](25-mathematical-completion-audit.md).
6. Per the user's instruction, TeX writing was stopped and the existing
   partial drafts frozen. No mathematical obligation depends on
   typesetting or compilation. The ledger proof and its full-scope
   mathematical audit, not an artifact check, support the completed
   project result.

The completed internally audited project argument is a different status
from an externally checked or published theorem.
Any concrete gap found in this chain must be recorded here and in
ResearchStatus; it must not be concealed by weakening the theorem's
statement or by referring only to passed finite tests.
