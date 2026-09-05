# Current Goal: Bondesson's GGC power problem

Mathematical goal completed in project: **2026-09-06**.
Status: **[PROVED IN PROJECT; INTERNAL MATHEMATICAL AUDIT COMPLETE]**,
as recorded in [WIP-6.23](ledger/25-mathematical-completion-audit.md#wip-6-23).
This status does not assert external peer review, publication, Lean
verification or literature priority. The support-wide square theorem
remains an independent proof record.

## Current goal and scope

The original objective is retained without weakening its quantifiers:

> Resolve Bondesson's deterministic-power conjecture for GGC laws, by a
> proof or a rigorous counterexample. All routes below, and mathematically
> justified new routes, are eligible for investigation. The former
> restriction to original Routes 1--5 is removed.

\[
X\in GGC,\qquad q\ge1
\quad\Longrightarrow\quad X^q\in GGC.
\]

The displayed conclusion is now proved in project for every nonnegative
GGC law and every finite real exponent q >= 1, including drift, infinite
Thorin mass and degenerate limits. The proof and audit, not completion of
a list of experiments, establish completion of the mathematical objective.
The ranked routes and attempt sequences below are retained as historical
and optional research blueprints; none is a remaining prerequisite and
none automatically starts another research goal.

**Handoff update, 2026-09-06:** the earlier instruction to defer TeX until
mathematical completion was observed during the audit. The user's subsequent
request explicitly resumed manuscript writing and requested a Lean blueprint.
The [manuscript source](manuscript/ggc-power-closure.tex) is now completed;
[formalization/](formalization/README.md) contains the blueprint, pinned
mathlib API audit and external-literature axiom contracts. TeX was not
compiled; no Lean implementation or verification is claimed. Publication,
submission and remote pushing are not authorized by these deliverables.
Manuscript preparation was not a prerequisite for the mathematical
completion decision.

[ResearchStatus.md](ResearchStatus.md) governs mathematical status.
[WIP.md](WIP.md) is the master result index; proofs belong in the
[ledger](ledger/README.md), and external theorem audits belong in
[notes](notes/README.md). This file records completion and preserves the
research blueprint without presenting completed derivations as new tasks.

Sjödin's 2026 claimed proof remains under audit: its false Lemma 2 is not
an available induction theorem. See the
[audit certificate](ResearchStatus.md#audit-certificate-for-the-2026-claimed-proof).

## Retained priorities and historical correspondence

The ranking records the allocation used before completion. It is retained
for provenance and possible future independent representations, not as an
active queue or an estimate of the probability of solving the conjecture.

| Former rank / ID | Program | Completion or retained optional deliverable | Historical inputs |
|---|---|---|---|
| 1 / P5 | Logarithmic Thorin evolution and full power-theorem audit | completed: full original theorem and internal mathematical audit; no further proof obligation is deferred to TeX | WIP-6.11--6.23 |
| 2 / P1 | Fully averaged phase and positive-complement comparison | retain the independent support-wide B <= 2 square proof; pursue explicit representations as a secondary front | WIP-5.49--5.50; old Routes 2 and 5 |
| 3 / P2 | Fractional gamma-peeling closure | a noninteger-shape preservation theorem beyond the proved integer operator | WIP-7.1--7.6; old Route 5; Bondesson-note B92-C3 |
| 4 / P3 | Positive-argument Hausdorff and Loewner positivity | a parameter-uniform all-order certificate for the actual final log-derivative | WIP-6.3 and WIP-6.7; old Routes 2 and 3 |
| 5 / P4 | Matched PD/Dirichlet means and stable scaling | a correct representation of the exact residual without an extra stable factor | old Route 1; James and James--Lijoi--Prünster |
| 6 / P6 | Fully averaged HCM and Bernstein/KL inversion | a nonnegative representing measure after every random parameter is averaged | old Route 4 |
| 7 / P7 | Rational-power Mellin/Barnes factorization | an exact factorization or boundary formula that closes an additive GGC certificate | old Route 6 |

All seven routes remain documented. Explicit representation problems and
stronger auxiliary closure assertions may still be interesting, but do
not prolong the completed original objective or authorize additional work.

P5 supplied uniform drift/jump bounds, a positive finite-time Euler
construction and identification with the actual power flow. The full
argument is assembled in
[WIP-6.21](ledger/23-power-theorem-assembly-audit.md#wip-6-21), directly
checked at the generator interface in
[WIP-6.22](ledger/24-direct-log-generator-resolvent.md#wip-6-22), and
mathematically closed by
[WIP-6.23](ledger/25-mathematical-completion-audit.md#wip-6-23).
Internal mathematical and primary-interface reviews have passed; no
missing lemma is assigned to later manuscript production. External peer
review and literature priority do not follow from these internal checks.
The changed assessment is tracked in [BigPicture.md](BigPicture.md).

Legacy filenames, WIP identifiers and equation tags are unchanged.
In particular, WIP-1.x does not mean current P1, and the new WIP-6.x family
records cross-route infrastructure, not the historical Mellin route.
The old seven-route plan is recoverable from Git history; its completed
steps are not new tasks.

## Common objects and exact interfaces

### Finite-gamma reduction and notation

Use [WIP-0.1--0.3](ledger/00-foundations.md), with
\[
X=\sum_{i=1}^n b_i^{-1}G_{\beta_i}^{(i)},\qquad
B=\sum_i\beta_i,\qquad \rho=q^{-1},\qquad Y=X^q,
\]
where all rates and shapes are positive and the unit-rate gamma variables
are independent. Fix q > 1 unless an endpoint is explicitly being treated.

Two complementary representations are
\[
X\overset d=G_B M,\qquad
M=\sum_i b_i^{-1}P_i,\qquad G_B\perp P,
\]
and
\[
f_X(x)=C x^{B-1}\mathbb E e^{-Rx},\qquad
C=\frac{\prod_i b_i^{\beta_i}}{\Gamma(B)},\qquad
R=\sum_i b_iQ_i.
\]
Both P and Q have Dirichlet shape vector \((\beta_i)\); these formulae
do not assert that the two averages have the same coupling. Hence
\[
f_Y(y)=C\rho y^{\rho B-1}\mathbb E e^{-Ry^\rho}.
\]

An arbitrary-support finite-gamma theorem for a fixed q extends to GGC
by continuous mapping and weak closure. The approximation must include
deterministic drift and zero degeneracies; a fixed support-size theorem
does not suffice.

### Shared recognition problem

Put
\[
\psi_q(s)=\mathbb E e^{-sY},\qquad
g_q(s)=-\psi_q'(s)/\psi_q(s),\qquad s>0.
\]

| Certificate | Logical role |
|---|---|
| \(g_q(s)=d+\int(s+t)^{-1}U_q(dt)\), with admissible positive Thorin measure | equivalent to GGC |
| normalized \(\psi_q\) is HCM | equivalent to GGC; this is a transform-side statement |
| no-drift Volterra identity \(yf_Y(y)=\int_0^y k_q(y-x)f_Y(x)\,dx\), with CM \(k_q\) | equivalent once existence, inversion and integrability are justified |
| size-bias decomposition with \(0<\mathbb EY<\infty\): \(Y^*\overset d=Y+R_*\), \(R_*\perp Y\), with exponential-mixture residual, allowing an atom at zero | equivalent; not a construction merely because the transform quotient is written |
| \(g_q\) is CM, or \(k_q\ge0\) | ID-level information only; insufficient for GGC |
| an HCM density or a shape-matched gamma--HM sufficient theorem | stronger sufficient input, not a necessary condition |

Sources: [Bondesson infrastructure](notes/bondesson-1992-ggc-hcm-foundational-infrastructure.md),
[Sato/size-bias audit](notes/sato-id-volterra-size-bias-ggc.md), and
[WIP-2.x](ledger/03-route2-thorin-volterra.md).
These are related certificates of the same positivity problem, not
independent breakthroughs.

### Baseline that should not be rediscovered

| Parameter family | Recorded result |
|---|---|
| q = 2, arbitrary finite support, \(0<B\le1\) | GGC; WIP-5.26 and WIP-5.29 |
| q = 2, two rates, arbitrary positive shapes | GGC; WIP-5.30 |
| q = 2, three rates, total shape 2 | GGC with no coordinatewise shape restriction; WIP-5.35 and WIP-5.37 |
| q = 2, three rates, \(1<B<2\), both extreme-scale shapes at most 1 | GGC; WIP-5.39 |
| q = 2, at most three rates, \(0<B\le2\), arbitrary positive shapes | GGC; WIP-5.44 closes both heavy-endpoint orientations |
| q = 2, arbitrary finite support, 0 < B <= 2 | GGC; WIP-5.49--5.50 close every cut and use split/separate limits and padding |
| log-rate finite-Thorin evolution | uniform bounds, weak continuity, positive Euler construction and conditional identification; WIP-6.16--6.20 |
| full GGC power conjecture | proved in project at the original quantifiers; internal mathematical audit complete; WIP-6.21--6.23 |
| integer peeling order, arbitrary GGC input, any fixed q >= 1 | normalized operator preserves GGC; WIP-7.1--7.2 |
| integer prefix at the smallest rates, followed by a proved uniform-in-rates residual family | fixed-power bootstrap; WIP-7.3--7.4 |
| finite-gamma initial law at q = 1 | positive Loewner nullspace tangents, a compensated jump functional and a genuine GGC curve with the same first-order tangent; WIP-6.6--6.10 |
| q = 2, three exponentials | WIP-5.34 gives an explicit auxiliary Thorin measure; membership also lies in the classical \(PF_\infty\) case |
| \(X_\theta=e^\theta G_{1/2}+e^{-\theta}G'_{1/2}\), q = 3/2 | GGC for every finite contrast by the full power theorem; WIP-1.17 remains an independent local phase proof |
| endpoint/middle-knot jumps and interval interiors in the three-rate fractional-Abel problem, 1 < B < 2 | settled by WIP-5.38, WIP-5.39 and WIP-5.44 |

The full conjecture and its all-contrast nonquadratic membership cases
are now proved in project. The
independent phase proof already covers arbitrary support through total
shape two. A universal square theorem alone would still not establish
all real powers; the full theorem instead uses continuous time.

## P1. Fully averaged phase and positive-complement comparison

**Assessment:** the complement mechanism now covers arbitrary finite
support at total shape two. Explicit representations and an independent
all-contrast nonquadratic phase proof are optional secondary questions,
not gaps in original-law membership or prerequisites of the completed P5 proof.

### P1-C1 and P1-C3 completed: support-wide square closure

**[COMPLETED FORMER P1-C1]**
[WIP-5.44](ledger/14-averaged-phase-compensation.md#wip-5-44) proves the
strict heavy-endpoint compensation inequality. The key change is
\[
r_\infty d_c-n_c=C_H(1+\lambda)^{-m}H(\lambda),
\qquad H'<0<F',\qquad C_H>0,
\]
where \(d_c=C_d(1+\lambda)^{-m}F\). The physical ratio becomes
\[
\rho_k=r_\infty-\frac{C_H}{C_d}
\frac{\mathbb E[(1+\lambda)^{-m}H(\lambda)]}
     {\mathbb E[(1+\lambda)^{-m}F(\lambda)]}.
\]
Its sign follows from a comparison of two positive posteriors and the
decreasing function \(L/(1+\lambda)\). This does not repair the false
old score invariant or the false generic Bernstein-posterior order in
[WIP-5.43](ledger/14-averaged-phase-compensation.md#wip-5-43).

**[COMPLETED P1-C3, WITH A STRONGER SUPPORT-WIDE RESULT]**
[WIP-5.49--5.50](ledger/18-four-rate-balanced-phase.md#wip-5-49)
prove every finite-gamma square of total shape at most two. Conditioning
on the two groups separated by a cut yields an elementary beta Cauchy
primitive. Its two positive averages have uniformly separated
logarithmic derivatives. Light knots give the complete positive Thorin
certificate; splitting and perturbing rates removes heavy or coincident
knots, and support-wide padding gives all smaller positive total shapes.
The former unbalanced four-rate minimum is strictly positive.

**Optional representation tasks, not prerequisites for P5.** Seek explicit Thorin
representations above total shape two, or an auxiliary gamma--Dirichlet
square theorem there. The full original-law power theorem does not
supply an unproved cancellation theorem for its auxiliary factors.
Preserve the independent phase proof, since it constructs a more explicit
representation than original-law membership alone.

### P1-C2: nonquadratic all-contrast benchmark

The former target was GGC of \(X_\theta^{3/2}\) for every finite contrast;
the full power theorem now supplies that membership. An optional
independent phase proof can use the zero-free Wright--Bessel ray, the local theorem, and the
logarithmic-arcsine / radial Klein--Gordon reduction in
[WIP-1.14--1.19](ledger/02-route1-q-three-halves-wright-bessel.md).

The retained phase target is a direct proof of the sign of the complete averaged phase/current,
including Abel boundary compensation. Generic pointwise positivity,
the residual-GGC shortcut, and \(N_\theta\in HM_{2/3}\) are already
excluded. A wrong-sign bulk term after incomplete integration by parts
does not decide the full average.

Use this independent benchmark to test whether compensation survives beyond
gamma duplication. Do not infer universal q = 3/2 from this single family.

## P2. Fractional gamma-peeling closure

**Retained mechanism assessment:** a reusable integer-order theorem is
proved. Matched finite-gamma output membership is covered by the full
power theorem. A direct fractional-order operator theorem or a stronger
arbitrary-GGC-input invariant is a separate optional question, not a gap
in the original objective.

Bondesson (1992), Theorem 6.2.7, proves the \(PF_\infty\) power theorem
using a smallest-rate exponential peeling step and Theorem 6.2.4.
[The source audit](notes/bondesson-1992-ggc-hcm-foundational-infrastructure.md)
records the actual induction, not just its conclusion.

Let \(\widetilde X\) have all rates greater than b, and independently add
\(G_\beta/b\). Direct convolution gives
\[
\begin{aligned}
f_{(\widetilde X+G_\beta/b)^q}(y)
={}&\frac{b^\beta\rho}{\Gamma(\beta)}
 y^{\rho-1}e^{-by^\rho}\\
&\times\int_0^{y^\rho}(y^\rho-t)^{\beta-1}
 e^{bt}f_{\widetilde X}(t)\,dt.
\end{aligned}
\]
The exponentially tilted old density, after normalization, has the
shifted positive rates. The beta = 1 case is the ordinary-integral
prototype; arbitrary beta yields the fractional kernel.
[WIP-6.2](ledger/15-global-criteria-and-power-flow.md#wip-6-2)
contains the identity and the precise matched-input closure target.

[WIP-7.1--7.2](ledger/17-exponential-peeling-closure.md) prove normalized
closure for every positive integer beta and every GGC input, including
singular probability laws. WIP-7.3 gives a valid integer-prefix induction
with strictly positive rate shifts and equal-rate limits. These steps
should now be used as inputs, not repeated as open deliverables.

**[RETAINED OPERATOR TARGET P2-C1]** Find a directly represented, recursively stable class covering these
shifted-rate gamma inputs on which this operator preserves the final
powered GGC law for 0 < beta < 1. Arbitrary-GGC-input closure is proved
for integer beta only; its fractional analogue must not be assumed.

**Attempt sequence.**

1. Use the proved integer closure and rate-order bookkeeping in WIP-7.1--7.4.
2. Treat one peeling step with 0 < beta < 1 and q = 3/2, first with one
   remaining gamma, then with two rates.
3. Identify a positive Thorin, Stieltjes, or fully averaged HCM
   representation of the output, with a class invariant usable again.
4. Address repeated rates by merging equal-rate gammas or a justified
   limiting argument; extend shapes and support only after closure is proved.

**Success / redirection.** An invariant supporting arbitrary repetitions
would give a genuine induction. A frozen-beta HCM assertion, arbitrary
shape substitution, or averaging conditional Thorin measures reproduces
known obstructions rather than closing this route.

In particular [WIP-7.6](ledger/17-exponential-peeling-closure.md#wip-7-6)
proves that HCM density is not a preserved output invariant, even for a
matched single-gamma input and 1 <= q < 2. It does not disprove GGC
closure. [WIP-7.5](ledger/17-exponential-peeling-closure.md#wip-7-5)
shows that uniformly small individual shapes suffice only when support
size is unrestricted; ordered integer peeling cannot simply remove every
integer part behind a smaller-rate fractional atom.

## P3. Tilted Hausdorff moments and Loewner kernels

**Retained mechanism assessment:** an all-order recognition interface.
The target inequalities follow from the completed GGC power theorem;
an explicit independent formula is optional, not an open membership gate.

For s > 0, let \(Y_s\) denote exponential tilting by \(e^{-sY}\), and let
\(\kappa_m(s)\) be its cumulants. Then
\[
(-1)^n g_q^{(n)}(s)=\kappa_{n+1}(s),\qquad
c_n(s)=\frac{s^n}{n!}\kappa_{n+1}(s).
\]
Sokal's Stieltjes criterion gives the exact target
\[
\sum_{j=0}^k(-1)^j\binom{k}{j}c_{n+j}(s)\ge0
\quad\text{for every }s>0,\ n,k\ge0.
\]
Equivalently, each sequence c_n(s) has a positive representing measure on
[0,1]. The first nontrivial inequality is
\(\mathbb E_sY-s\operatorname{Var}_sY\ge0\).
See [WIP-6.3](ledger/15-global-criteria-and-power-flow.md#wip-6-3)
and the [Sokal source note](notes/sokal-stieltjes-hausdorff-criterion.md).

The parallel Bondesson (1992), Theorem 3.4.2, interface is positivity of all
finite matrices built from
\[
K_q(s,t)=\frac{g_q(s)-g_q(t)}{t-s},\qquad
K_q(s,s)=-g_q'(s)=\operatorname{Var}_sY.
\]

**[OPTIONAL REPRESENTATION P3-C1]** Construct an explicit all-order positive integral,
combinatorial representation, or Gram representation for these quantities
for the actual powered finite-gamma law.

**Attempt sequence.**

1. Use positive s throughout; exponential damping supplies all moments,
   including for q > 2, and the compact Hausdorff problem avoids a
   zero-point moment-determinacy detour.
2. Derive exact low-order expressions to identify a pattern, not to infer
   uncomputed orders.
3. Seek a parameter-uniform square-integral or positive-kernel formula.
   The representing measure must not be assumed positive in its definition.
4. Compare diagonal/coalescing Loewner limits with the existing Hankel
   gates to reuse certificates rather than count them as new evidence.

**Success / redirection.** Prove every required order for every positive
argument, or rigorously violate a necessary condition for the original Y.
The divided-cumulant and signed-Jacobi constructions of WIP-3.6--3.7 do
not prove positivity for g_q. The original zero-point Route-3 determinacy
argument remains available for 1 < q <= 2, with its hypotheses.

## P4. Matched PD/Dirichlet means and stable scaling

**Retained mechanism assessment:** the source-matched stable/Dirichlet
route remains useful for explicit representation questions. The blueprint
below records that route's constructive target, not an unresolved
original-law power-closure requirement after P5.

Use the project convention
\[
\mathbb P(T_{\rho,B}\in dt)
=\frac{t^{-\rho B}\mathbb P(S_\rho\in dt)}
       {\mathbb E S_\rho^{-\rho B}},
\qquad \mathbb E e^{-sS_\rho}=e^{-s^\rho}.
\]
The exact factorization is
\[
X^{1/\rho}\overset d=G_{\rho B}N,\qquad
N=M_B(F)^{1/\rho}/T_{\rho,B}.
\]
James (2006), Theorem 4.1(iv), already contains the gamma-power
factorization; Proposition 5.14 contains the tilted composition after
parameter conversion. Existing project derivations remain useful checks,
not claims of priority.

James's Proposition 5.7 also gives
\[
S_\rho N\overset d=M_{\rho B}(F_\rho),\qquad
F_\rho=\mathcal L\bigl(V^{1/\rho}S_\rho/S_\rho'\bigr),\quad V\sim F,
\]
with the independent factors specified in the source note. This identifies
the stable-multiplied variable, not N itself.

James--Lijoi--Prünster (2008), Theorem 2.1, supplies the other interface:
for 0 < a < 1, theta > 0, a nonatomic underlying base H, nonnegative f
and \(H(f^a)<\infty\),
\[
P_{a,\theta}(f)\overset d=
M_\theta\bigl(\mathcal L(P_{a,0}(f))\bigr).
\]
Thus a correctly matched positive linear PD mean can already be converted
to an ordinary Dirichlet mean. The missing task is the representation of
N, not a general absence of a PD-to-DP conversion theorem.
An atomic law for f is compatible with a nonatomic underlying H, by
using a step function; these two notions of atomicity are distinct.
Precise versions, hypotheses and parameter conventions are in the
[James source note](notes/james-dirichlet-means-stable-scaling.md).

**[OPTIONAL REPRESENTATION P4-C1]** Construct N explicitly as an order-rho B ordinary Dirichlet
mean, possibly by first constructing a \(PD(a,\rho B)\) positive linear
mean. The equality in law and the independence of the gamma factor are
part of the task.

**Attempt sequence.**

1. Calibrate one-atom F and the already-solved two-atom square.
2. Test Mellin transforms, generalized Stieltjes transforms and integrability
   for a proposed two-atom q = 3/2 representation.
3. Use matched beta scaling and posterior/Möbius identities only with their
   stated orders.
4. Extend to finite bases only after the exact target law is matched.

**Success / redirection.** A valid matched representation is sufficient.
A representation only for \(S_\rho N\), an unmatched PD parameter, or a
residual HM condition already refuted by WIP-1.18 is not progress on the
missing implication. Neither stable nor gamma product closure supplies
an unproved cancellation theorem.

## P5. Completed logarithmic Thorin evolution and full-theorem audit

**Completion assessment:** this route proves the full original theorem
in project. Its finite-time construction, dynamic identification and
general-GGC approximation have passed the internal mathematical audit
in WIP-6.23. No unproved mathematical step is deferred to TeX preparation.

For log-rate law \(F_t\), set \(U_t=B_0e^{-t}\exp_*F_t\).
The exact generator in WIP-6.16 has nonnegative jump acceptance bounded
by one, reference measure
\[
\nu(dv)=\frac{e^v}{(e^v-1)^2}\,dv,
\qquad \int v^2\nu(dv)=2\pi^2/3,
\]
and drift \(a_{B,F}(y)=y+O_B(1)\), uniformly over rate measures.
These estimates permit an actual positive Euler scheme with a uniform
second log-rate moment and cumulative error tending to zero.

### Completed mathematical interfaces

1. [WIP-6.11--6.17](ledger/19-finite-thorin-compensated-power-tangent.md)
   and [log coordinates](ledger/20-finite-thorin-positive-steps.md):
   current-law tangent, Palm disintegration and uniform log-rate bounds.
2. [WIP-6.18--6.19](ledger/21-log-thorin-euler-evolution.md):
   weak continuity, positive iterated probabilities, time compactness and
   passage through the nonlinear generator.
3. [WIP-6.20](ledger/22-power-flow-identification.md):
   every such solution gives the actual law \(X^{e^t}\), with explicit
   zero-Laplace-endpoint control and transport uniqueness.
4. [WIP-6.21](ledger/23-power-theorem-assembly-audit.md):
   all finite-gamma inputs and every finite time, followed by weak
   approximation to all GGC laws, including drift and infinite mass.
5. [WIP-6.22](ledger/24-direct-log-generator-resolvent.md) and
   [WIP-6.23](ledger/25-mathematical-completion-audit.md):
   direct absolute resolvent verification and the completed backwards/
   forwards audit of every mathematical interface and the original quantifiers.

The rate law \(F_t\) and the logarithm of the random-variable law are
different objects. The posterior mass \(B+1\) does not replace \(B\)
in the tangent's digamma factor, and \(B_t'= -B_t\) must be retained.
The old finite-atom one-step curve is still not the actual flow; its
limitations are not limitations of the new iterated log-rate proof.

### Completed execution record and handoff boundary

1. The direct generator-to-power interface in WIP-6.22 was checked,
   including its absolute posterior bound; the rate-coordinate
   intermediate operator is not required for that direct proof.
2. WIP-6.23 audited the full argument backwards and forwards: weak
   approximation, identification, admissible positive evolution,
   generator continuity, exact tangent and primary inputs.
3. Every mathematical requirement was supplied by a written proof;
   the status is now proved in project, not externally peer-reviewed,
   published or formally verified.
4. The later user-authorized handoff completed manuscript sources and a
   Lean blueprint; compilation, publishing and submission do not start
   automatically. If a concrete
   mathematical gap is later found, record and reopen that exact
   implication without weakening the original objective.

The three primary interfaces (James, SSV and Bondesson weak closure)
have been independently reread in the current pass. Their exact locators
and hypotheses remain attached to the ledger proof.
No numerical experiment, positive-minimum principle by itself, or
unproved transport-uniqueness theorem is a substitute for this chain.

## P6. Fully averaged HCM and Bernstein/KL inversion

**Retained mechanism assessment:** an optional route to explicit fully
averaged Bernstein measures. The completed original-law theorem supplies
GGC membership, but does not establish positivity of a different frozen
inverse or an unjustified inversion formula.

For independent copies Y_1,Y_2, \(w=t+t^{-1}\),
\[
\psi_q(st)\psi_q(s/t)=
\mathbb E\!\left[
e^{-s(Y_1+Y_2)w/2}
\cosh\!\left(\frac{s(Y_1-Y_2)}2\sqrt{w^2-4}\right)
\right].
\]
For every s > 0, seek a positive Bernstein measure in w (or w - 2).
Use the identities and function-space requirements already derived in
[WIP-4.1--4.6](ledger/05-route4-averaged-hcm.md).

**Retained attempt sequence.** Start from a specific family requiring an explicit formula; carry out
all beta/Dirichlet averaging; derive the inverse with any singular terms;
then establish positivity of the complete measure. Positive special-function
product formulas would justify promoting this route.

**Success / redirection.** A positive measure for every s closes the HCM
certificate. A signed inverse without a sign mechanism is only an exact
reduction. Pointwise positivity of frozen fibres is not required and is
known to fail. A negative pairing refutes this target only when it concerns
the actual fully averaged transform.

## P7. Rational powers and Mellin/Barnes structure

**Assessment:** useful for exact formula discovery; a Mellin identity alone
does not prove additive GGC membership.

For \(X=c_1G_{\beta_1}+c_2G_{\beta_2}\), \(B=\beta_1+\beta_2\),
\[
\mathbb E X^z=
\frac{\Gamma(B+z)}{\Gamma(B)}c_2^z
\,{}_2F_1(-z,\beta_1;B;1-c_1/c_2),\qquad \Re z>-B.
\]
For Y = X^q substitute qz, with initial strip \(\Re z>-B/q\).
Gamma multiplication and stable Mellin formulae supply normalizations;
see [stable infrastructure](notes/stable-mellin-poisson-tilt-infrastructure.md)
and the explicit q = 3/2 ledger.

**Attempt sequence.** Separate the gamma-power part; analyze the
hypergeometric remainder and admissible Barnes parameters; check
independence and normalization; convert the result to an actual positive
Thorin kernel, fully averaged HCM measure, or independent product of known
GGC factors.

**Success / redirection.** Require one of those additive GGC certificates.
ID of log Y and a formal factorization of its Mellin transform are
insufficient. Rational approximation closes real q only after the rational
theorems have the needed universal quantifiers.

## Excluded mechanisms and safeguards

The following exclusions concern specified methods, not counterexamples
to the conjecture.

- **Global mixing-density log-concavity in the low-shape target family is
  refuted.** For q > 1 and B/q <= 1, the B92-C2 sufficient criterion cannot
  apply, even at equal rates. A log-concave sigma with
  \(\int\sigma(t)t^{-1}dt=1\) has finite nonnegative moments, whereas the
  powered density has infinite f(0+) if B/q < 1, or infinite -f'(0+) if
  B/q = 1. See [WIP-6.1](ledger/15-global-criteria-and-power-flow.md#wip-6-1).
  Bondesson's theorem itself remains valid.
- Conditional GGC does not imply GGC after arbitrary mixing; the correct
  log-derivative is a posterior quotient, not an average Thorin measure.
- The bounded-affine-beta HCM-Laplace assertion in the 2026 induction is
  false. Generic independent-variable Appell positivity and several
  residual-HM shortcuts are also excluded by the existing ledger.
- Universal TP2/pointwise kernel positivity is stronger than the required
  average and has failed in the benchmark.
- Finite collections of positive minors, numerical scans, and increasing
  formal series length do not prove all-order positivity.
- Exact negative certificates must target a necessary property of the
  original powered law, not merely a stronger auxiliary construction.

## Completion and optional future directions

1. **Original mathematical objective completed.** WIP-6.23 records the
   theorem at its full quantifiers and the completed internal audit.
   No further special case or typeset manuscript is required to fill a
   mathematical gap in that argument.
2. **Authoritative records.** ResearchStatus, WIP and BigPicture record
   proved-in-project status with external validation explicitly separate.
3. **Independent and optional work.** Preserve P1's explicit square
   proof and all seven route histories. Further representations,
   simplifications or stronger auxiliary theorems are optional projects,
   not automatically resumed tasks.
4. **User-controlled handoff.** The requested manuscript-source completion
   and Lean blueprint/API audit are now delivered. Compilation, Lean
   implementation, publication, submission and remote pushes are separate
   activities, not implicitly completed by a blueprint. Evaluate a future
   concrete counterargument on its mathematics and correct the record if necessary.

Source attributions, analytic interchanges, endpoint conditions and
counterexample scope remain explicit. "Derived here" does not assert
mathematical novelty, and internal completion does not assert external
human review.

## Reference entry points

- Bondesson (2015), Conjecture 1, p. 1075:
  [article audit](notes/bondesson-2015-product-closure-audit.md).
- Bondesson (1992), Theorems 3.4.2, 4.2.1, 6.2.4 and 6.2.7:
  [foundational note](notes/bondesson-1992-ggc-hcm-foundational-infrastructure.md).
- James (2006), arXiv:math/0610218v3, Theorem 4.1 and Propositions 5.7, 5.14;
  James--Lijoi--Prünster (2008), Theorem 2.1:
  [parameter and source audit](notes/james-dirichlet-means-stable-scaling.md).
- Sokal (2010), checked arXiv:0902.0065v2, Theorem 1 and its Hausdorff proof:
  [criterion audit](notes/sokal-stieltjes-hausdorff-criterion.md).
- Complete bibliographic and theorem-level map:
  [ledger/references.md](ledger/references.md).

No numerical experiment is a proof. Analytic continuation, exchanges of
limits/integrals, inversion, moment determinacy and endpoint claims must be
justified in the linked proof, not hidden in the roadmap.
