# Mathematical completion audit of the GGC power argument

Date: **2026-09-06**. Entry: WIP-6.23.

[WIP](../WIP.md) | [BigPicture](../BigPicture.md) |
[Full assembly](23-power-theorem-assembly-audit.md) |
[Direct generator verification](24-direct-log-generator-resolvent.md)

**Status: [PROVED IN PROJECT; INTERNAL MATHEMATICAL AUDIT COMPLETE].**
This is a statement about the written mathematical argument in this
repository. It is not a claim of external peer review, publication,
Lean verification, or priority over the literature. A future concrete
counterargument must be evaluated on its mathematical merits and may
require correction of this status.

The user's instruction is to defer TeX writing until the mathematical
goal is attained. Existing partial drafts were therefore frozen during
this pass. The decision below uses the proofs in the ledger, not the
existence, typesetting or compilation of a manuscript.

<a id="wip-6-23"></a>
## WIP-6.23 — audited conclusion at the original quantifiers

The completed project conclusion is

\[
\boxed{X\in GGC,\quad q\ge1\quad\Longrightarrow\quad X^q\in GGC,}
\]

where \(X\) is any finite nonnegative random variable, and \(q\) is an
ordinary finite real deterministic exponent. No finite-Thorin-mass,
drift-free, finite-support, shape, contrast or logarithmic-moment
restriction is imposed on the final input. This entry records completion
of the audit of WIP-6.21, not an additional independent theorem to count
as a second solution.

### Constructive proof of the conclusion

First let \(X=\sum_{i=1}^n b_i^{-1}G_{\beta_i}^{(i)}\), with arbitrary
\(n\ge1\), positive rates and shapes, and independent unit-rate gamma
variables. Put
\(B_0=\sum_i\beta_i\) and
\(F_0=B_0^{-1}\sum_i\beta_i\delta_{\log b_i}\).
This initial log-rate probability has a finite second moment.

Fix any \(q>1\) and set \(T=\log q\). WIP-6.18--6.19 construct, on
this entire finite interval, a narrowly continuous probability curve
\(F_t\) with a uniform second log-rate moment, solving the weak equation
for the specific generator of WIP-6.16, with \(B_t=B_0e^{-t}\). The
construction uses positive probability kernels and a vanishing cumulative
consistency error; it is not an existence assertion inferred from a
tangent or a minimum principle.

The measures \(U_t=B_t\exp_*F_t\) are positive and Thorin-admissible,
because
\(\int\log(1+1/b)U_t(db)\le B_t(\log2+F_t|y|)<\infty\).
They therefore define zero-drift GGC laws. The exact current-law
resolvent identity, established in WIP-6.16 and directly verified again
in WIP-6.22, is
\[
F_t(\mathcal G_{B_t,F_t}\varphi_s)
=\frac{h_t(s)+g_t(s)}{B_t},
\qquad \varphi_s(y)=(s+e^y)^{-1}.
\]
Here \(h_t\) is the power tangent of the current GGC law; its identity
does not assume that any positive-time power is already GGC.

Every hypothesis of WIP-6.20 is supplied by this construction. The
uniform logarithmic moment of its value laws justifies the absolute
zero-Laplace-endpoint integration. The resulting linear weak equation
on value space has generator \(x\log x\,\partial_x\). Its explicit
log-value transport identifies these GGC laws with
\(\mathcal L(X^{e^t})\) on all of \([0,T]\). In particular
\(X^q\in GGC\). The endpoint \(q=1\) is immediate. This proves the
claim for every finite gamma convolution and every finite real \(q\ge1\).

For a general \(X\in GGC\), WIP-0.1 gives finite gamma convolutions
\(X_m\Rightarrow X\). With this fixed \(q\), each \(X_m^q\) is GGC
by the proved finite-input statement. Continuity of \(x\mapsto x^q\)
on \([0,\infty)\) gives \(X_m^q\Rightarrow X^q\). GGC weak closure
proves the conclusion. The approximation theorem includes drift and
infinite Thorin mass; \(\delta_0\) is also a gamma scale-zero limit.
Thus no condition used only to construct the finite-input evolution
survives as an extra hypothesis on the final \(X\).

Two uniformity issues are worth making explicit. For each fixed finite
\(q\), only one finite-time construction on \([0,\log q]\) is needed;
an a priori curve on an infinite time horizon is not required. Likewise,
the Euler and second-moment constants need not be uniform over the
approximating sequence \(X_m\). Each powered approximant has already
been proved GGC separately, and the last step uses only weak closure
at the actual probability limit \(X^q\).

### Requirement-by-requirement evidence

The audit was conducted backwards from the displayed conclusion, then
forwards through the construction. A row is passed because of the stated
argument and estimates, not merely because an automated check or another
reviewer reported no error.

| Requirement | Authoritative proof and decisive content | Audit result |
|---|---|---|
| Define the current law without presupposing power closure | WIP-6.11: gamma--Dirichlet representation for every admissible finite zero-drift Thorin measure; tilted marginals use bounded resolvent means | satisfied |
| Correct and measurable phase | WIP-6.11 and the primary source audit: unique anchor-one phase in [0,1], jointly Borel limsup representative, sign inside limsup, absolute difference kernel | satisfied; no boundary pointwise convergence assumption |
| Exact normalized power tangent | WIP-6.11, equations (6.68), (6.70); WIP-6.22, equations (6.155)--(6.158), with explicit posterior absolute drift bound and signed Palm justification | satisfied; original mass stays in the digamma coefficient |
| Positive coefficients and uniform growth control | WIP-6.16--6.17: posterior atom Z/2 bounds the logarithm; correction K is L1; drift equals y plus a mass-dependent bounded term; universal jump second moment is finite | satisfied uniformly over support and base measures |
| Continuity under changing arbitrary current measures | WIP-6.18: common-uniform Dirichlet coupling, scaled resolvent convergence, uniqueness of weak-star phase limits, beta domination, L1 jump tests | satisfied for narrow convergence; no hidden rate moment |
| An actual positive finite-time construction | WIP-6.19: exact probability kernel (6.123), p >= 1/2, exact mean compensation (6.124), scalar second-moment recursion | satisfied for each arbitrary finite T |
| Tightness, time continuity and nonlinear consistency | WIP-6.19: finite-chain martingale time estimate, uniform narrow compactness, total error O(sqrt(h)+h log-squared(h)), continuity of the averaged generator and bad-time subsequence argument | satisfied on the entire interval and for every Cc2 test |
| Thorin integrability and legitimate test extension | WIP-6.20 Sections 1--3: second log-rate moment bounds the Thorin integral, gives UI of first log-rate moments, and controls compact cutoffs of linear-growth tests | satisfied; resolvents and logarithmic tests are in the proved domain |
| Zero-Laplace endpoint with no unproved moment hypothesis | WIP-6.20 Sections 2, 5--6: uniform E(abs(log X)), positive lower bound on tilted normalizers, absolute space-time bounds including the covariance product, and s A(s) tending to zero | satisfied without E(abs(X log X)) |
| Dynamic, not merely static, identification | WIP-6.20 Sections 7--8: C1 polynomial approximation in the generator norm, compact differentiable test equation, and explicit backward log-value transport | satisfied on the full finite interval |
| Match construction and identification assumptions | WIP-6.19 outputs exactly (6.130)--(6.131): probability curve, narrow continuity, uniform second log-rate moment, exact generator and mass B0 exp(-t) | satisfied without an additional uniqueness or future-GGC hypothesis |
| Arbitrary finite support, shapes and real powers | WIP-6.21 Stage A and the proof above: F0 has finite support for every finite gamma input; arbitrary q > 1 is T = log q | satisfied; no fixed support count, B cutoff, rate separation or integer-power interpolation |
| General GGC, drift, infinite mass and zero degeneracy | WIP-0.1; Bondesson (1992), Section 3.1 and Theorem 3.1.5, pp. 34--35; WIP-6.21 Stage B | satisfied by finite-gamma weak approximation and a continuous power map |
| No numerical proof or unstated external closure mechanism | The chain uses only the cited foundational inputs, explicit calculations, positive finite kernels and elementary compactness/transport arguments | satisfied; no product cancellation, fractional peeling, numerical extrapolation or Sjodin induction |

### Sources and distinction between inputs and deductions

Exact source locators and the 2010 SSV first-edition errata are preserved
in [the primary-interface audit](../notes/log-rate-power-proof-primary-interfaces.md)
and [the reference map](references.md). The essential inputs are:

- Bondesson (1992), Section 3.1 and Theorem 3.1.5: Thorin representation,
  finite-gamma weak density and GGC weak closure.
- James (2005), Section 1, reprint p. 2, equations (1)--(3), and Section 2,
  reprint pp. 4--5: gamma normalization, Markov--Krein and posterior
  identities, with no inappropriate nonatomic-base restriction.
- Schilling--Song--Vondracek (2010), Theorems 6.10 and 7.3: reciprocal
  Stieltjes and bounded phase representation. The zero-anchored claim in
  Remark 6.11 is not used; the official errata do not change this interface.
- Sethuraman (1994), Section 2 and Theorem 3.4: stick-breaking, also
  verified by the finite-partition fixed-point calculation in WIP-6.18.

The log-rate generator, quantitative estimates, positive Euler limit,
direct cancellation, dynamic identification and their full-scope
assembly are project deductions. This attribution does not assert that
no related argument exists elsewhere.

### Review outcome and its limits

During this pass the direct cancellation and its absolute Palm interface
were checked separately from the evolution proof; the continuity/Euler
argument was cross-checked independently; and the identification plus
full-quantifier assembly was audited backwards. The main audit also
read the component arguments and recomputed the key estimates and
interfaces. The two wording deficiencies found in WIP-6.22 (the kernel
prefactor and an explicit absolute posterior drift estimate) were
corrected before this conclusion was recorded.

All mathematical requirements above are supplied by written proofs.
There is no remaining conjectural lemma in this argument and no
unfulfilled mathematical step assigned to future manuscript preparation.
Accordingly the project status advances from a complete candidate to
**proved in project**. External human review remains a valuable distinct
validation activity, not an event that has already occurred. Existing
TeX drafts remain frozen; no compilation or remote publication was made.
