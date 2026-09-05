# The GGC power problem

Status: **proved in project; internal mathematical audit complete**.
Last checked: **2026-09-06**. This is not a claim of external peer review,
publication, Lean verification or literature priority.

## Target

The original target, Bondesson's Conjecture 1, is now proved in this project:

\[
\boxed{
X\in GGC,\qquad q\ge1
\quad\Longrightarrow\quad
X^q\in GGC.}
\tag{C1}
\]

The case \(q=1\) is trivial; the substantive range is \(q>1\). Here \(X\) is
a nonnegative random variable and \(X^q\) is an ordinary deterministic power,
not a convolution power and not a product of independent copies.

**Primary formulation.** Lennart Bondesson, “A Class of Probability
Distributions that is Closed with Respect to Addition as Well as
Multiplication of Independent Random Variables,” *Journal of Theoretical
Probability* **28** (2015), 1063--1081, Conjecture 1, p. 1075,
DOI 10.1007/s10959-013-0523-y.

## Current reliable status

- **[PROVED IN PROJECT, 2026-09-06]**
  [WIP-6.21](ledger/23-power-theorem-assembly-audit.md#wip-6-21)
  assembles the proof at the full conjecture's quantifiers.
  [WIP-6.23](ledger/25-mathematical-completion-audit.md#wip-6-23)
  records the completed internal mathematical audit: the exact generator,
  positive finite-time Euler construction, actual-power identification
  and final weak approximation have written proofs with their required
  estimates and hypotheses. The final result covers arbitrary GGC
  probability laws, including drift, infinite Thorin mass and zero
  degeneracy, and all finite real \(q\ge1\).
  This is a statement about the project argument, not external validation;
  a future concrete counterargument must be assessed on its merits.
- **[LITERATURE-2015]** Bondesson states (C1) as a conjecture and does not
  prove it.
- **[CLAIM-2026]** Tord Sjödin, “The Power Problem for Generalized Gamma
  Convolutions (GGC) and Related Questions,” *Journal of Theoretical Physics
  & Mathematics Research* **4**(2) (2026), 1--7, Theorem 1,
  DOI 10.64030/3065-8802.04.02.02, claims (C1) for \(q>1\).
- **[AUDIT-2026-09-04]** The proof in that paper is not valid as written. Its
  induction depends on a false Lemma 2; see the short audit certificate below.
- **[PROJECT / LITERATURE DISTINCTION]** The proof is the
  project's independent log-rate argument, not acceptance or repair of
  the 2026 induction. The classical inputs are the cited Bondesson,
  James, SSV and Sethuraman results. The generator, quantitative
  construction and dynamic identification are project deductions;
  neither the published 2026 claim nor those classical sources already
  supplies this argument.

Mathematical completion is based on the ledger proofs, not on a TeX
manuscript. A subsequent user-authorized handoff on 2026-09-06 completed
the [manuscript source](manuscript/ggc-power-closure.tex) and added the
[Lean blueprint, API audit and axiom policy](formalization/README.md).
Neither TeX compilation nor Lean implementation/verification nor a remote
push was performed in that handoff. The independent earlier \(q=2\) proofs remain
valuable even though the general theorem now covers all these families:

- every finite gamma convolution with arbitrary finite support and
  total shape \(0<B\le2\). WIP-5.49--5.50 close every cut by
  conditional-beta derivative separation, then handle heavy or coincident
  knots by splitting and weak limits; the earlier square families below
  remain valid independent proof records;
- every finite gamma convolution of total shape at most one, with arbitrary
  finite positive rate support and shape vector; see WIP-5.26 and WIP-5.29;
- every two-rate gamma convolution, with arbitrary positive summand shapes
  and hence arbitrary total shape; see WIP-5.30;
- three arbitrary positive scales with shape vector \((1,1,1)\); see
  WIP-5.34;
- three arbitrary positive scales with total shape two and arbitrary
  positive summand shapes; WIP-5.35 proves the coordinatewise-at-most-one
  core and WIP-5.37 completes all remaining shape vectors;
- at most three arbitrary positive scales with total shape \(0<B\le2\),
  without a coordinatewise shape restriction. WIP-5.44 closes the
  heavy-endpoint gap left by WIP-5.39 using a positive complementary beta
  solution and a two-posterior comparison;
- integer shapes at an initial segment of the ordered rates followed by
  any proved residual family whose theorem is uniform in all positive
  rates. WIP-7.3--7.4 apply to an arbitrary-support tail of total shape at
  most one, an arbitrary two-rate tail, or an at-most-three-rate tail of
  total shape at most two. No total-shape bound is needed for the
  integer-prefix/arbitrary-two-rate-tail family.

Before the general theorem, WIP-1.17 independently established a
nonquadratic benchmark on a genuinely open neighborhood of equal rates:

\[
\exists\,\theta_*>0:\qquad
\lvert\theta\rvert<\theta_*
\Longrightarrow
\left(e^\theta G_{1/2}+e^{-\theta}G'_{1/2}\right)^{3/2}\in GGC.
\]

This WIP-1.17 argument is nonconstructive in \(\theta_*\) and, on its
own, covers only small contrast. Membership at arbitrary contrast is now
a consequence of (C1); an additional explicit phase formula is a separate
possible research task.

**Completed log-rate proof and audit, 2026-09-06.**
[WIP-6.16--6.17](ledger/20-finite-thorin-positive-steps.md) put the
current-law tangent into logarithmic rates, with a universal finite
jump second moment and a support-independent linear drift bound.
[WIP-6.18--6.19](ledger/21-log-thorin-euler-evolution.md) prove weak
continuity and a positive finite-time Euler limit with uniform second
log-rate moments. [WIP-6.20](ledger/22-power-flow-identification.md)
identifies that exact weak evolution with \(X^{e^t}\).
Their [full assembly](ledger/23-power-theorem-assembly-audit.md) covers
arbitrary finite-gamma inputs and all finite real powers \(q\ge1\), then general GGC by
weak approximation. The
[primary-interface audit](notes/log-rate-power-proof-primary-interfaces.md)
records direct source reinspection, including the official 2010 SSV
first-edition errata.
[WIP-6.22](ledger/24-direct-log-generator-resolvent.md#wip-6-22)
verifies the generator action directly by an absolutely convergent
cancellation and a signed Palm identity.
[WIP-6.23](ledger/25-mathematical-completion-audit.md#wip-6-23)
closes the mathematical audit at the original quantifiers. No
conjectural positivity lemma or future manuscript-preparation step is
left in this argument.

## Historical development of independent routes

The following chronology records what each earlier result did and did
not establish on its own. Its former research frontiers are not current
gaps in (C1). Stronger auxiliary assertions, such as a generic fractional
peeling theorem or Bondesson's integral Conjecture 2, remain separate.

**Earlier reassessment and proof pass on 2026-09-05.** The revised
[CurrentGoal.md](CurrentGoal.md) removes the original Routes 1--5
restriction and ranks eligible programs P1--P7. The subsequent pass adds
the three-rate membership theorem, reusable integer closure and a
positive-tangent construction. Their scope at that historical stage was
strictly smaller than the full theorem subsequently assembled in WIP-6.21.

- [WIP-5.40--5.44](ledger/14-averaged-phase-compensation.md) make the support
  cost of shape-padding explicit, prove general reciprocal duality for the
  auxiliary square factor, and show why the old pointwise posterior
  monotonicity fails in the heavy-endpoint region. WIP-5.43 further
  excludes generic Bernstein-posterior ordering. WIP-5.44 nevertheless
  proves the actual compensated inequality by an exact positive complement.
- [WIP-6.1--6.5](ledger/15-global-criteria-and-power-flow.md) rule out the
  B92-C2 global mixing log-concavity strategy for q > 1 and B/q <= 1,
  derive the fractional gamma-peeling operator and global tilted
  Hausdorff/Loewner criteria, and establish power-flow identities and a
  conditional local-to-global continuation lemma.
- [WIP-6.6--6.10](ledger/16-power-flow-loewner-tangent.md) prove strict
  finite Loewner nullspace tangents, a compensated positive-jump formula,
  and an explicit genuine GGC curve with the actual power tangent. This
  curve is not the power flow; its support stays bounded away from zero,
  whereas any Thorin representation of a strictly powered finite-gamma
  law must reach zero. These first-order entries alone do not prove
  iteration or all-matrix uniformity; WIP-6.18--6.21 subsequently supply
  finite-time evolution, identification and full power closure.
- [WIP-7.1--7.6](ledger/17-exponential-peeling-closure.md) prove the
  arbitrary-GGC-input integer peeling operator from Bondesson's widened
  theorem, derive integer-prefix corollaries and a support-aware
  small-shape reduction, and exclude an HCM-density output invariant.
  Noninteger peeling closure remains open.
- The [James source audit](notes/james-dirichlet-means-stable-scaling.md)
  corrects provenance: gamma-power factorization and tilted composition
  are already in James (2006), and a suitably parameterized positive
  linear PD mean can be converted to an ordinary Dirichlet mean by
  James--Lijoi--Prünster (2008). Identifying the target residual itself
  remains unresolved; an extra independent stable factor cannot be
  cancelled by GGC product closure.

The complete two-rate proof in WIP-5.30 constructs an explicit Thorin
measure for the auxiliary
gamma--beta factor and identifies the squared affine beta mean as a
Dirichlet mean of matching order.  Gamma duplication and Bondesson's
independent-product theorem then give the square of the original two-rate
convolution.  WIP-5.27--WIP-5.28 remain useful independent proofs of
symmetric and total-shape-two slices.
The earlier golden-ratio support cone, the sufficient condition
\(\mathbb E[R]\le2\operatorname*{ess\,inf}R\), and the inverse-Stein
certificate remain recorded as independent intermediate mechanisms.

For the two-rate total-shape-one family
\[
X=G_p/\kappa+G_{1-p},\qquad 0<p<1,
\]
an exact true-lobe comparison now proves \(X^2\in GGC\) for every
\(\kappa>1\).  Equivalently,
\[
\left(G_p/b_1+G_{1-p}/b_2\right)^2\in GGC
\qquad(0<p<1,\ b_1,b_2>0).
\]
This completely settles the two-rate, total-shape-one square problem.
WIP-5.10 retains the earlier compressed-pairing cones and their exact
Bernstein-basis certificate as an independent intermediate argument.
Independently, a rational low/high-frequency Route-2 certificate proves
the symmetric range \(\kappa\le4\).  WIP-5.12 gives a conditional
multirate version of the true-lobe comparison and pinpoints why three rates
require a new mechanism: automatic support nesting can fail, the spectral
cuts cannot all be removed by one scalar centering, and the pair kernel is
not positive definite.  These are proof-route obstructions, not
counterexamples to the GGC conjecture.  WIP-5.13 further proves a larger
algebraic first-cut mass condition that survives failure of support nesting
and covers the explicit three-rate example, thereby isolating global
multicut assembly as the next issue.  WIP-5.14 then gives a weighted
multicut phase decomposition: all phase-baseline mixing terms have a
strictly favorable derivative, the remaining sign is one explicit
residual covariance, and condition (5.138) yields a new global multirate
sufficient cone.  WIP-5.15 turns that implicit cone into finite algebraic
checks using an interlacing critical polynomial and root-free endpoint
envelopes.  WIP-5.16 gives an exact three-rate interface identity and reduces
the central problem to finitely many cumulative prefixes; WIP-5.17 proves
that the remaining upper prefix requires coupled tail cancellation and
cannot be handled by a verbatim reflected copy of the first-cut argument.
WIP-5.18 exploits monotonicity of two zero-temperature mass ratios to
control both rising prefixes simultaneously, yielding a complete new
three-rate sufficient theorem with exact and optimization-free tests.
WIP-5.19 instead retains the phase equation inside an adjacent-cut
transport.  It produces a complementary uniform second-prefix cone and the
exact certificate
\[
\left(
G_{1/4}^{(1)}+G_{1/4}^{(2)}/2+G_{1/2}^{(3)}/4
\right)^2\in GGC,
\]
which lies outside the earlier golden-ratio, mean, first-shape, and
last-cut-suppression cones.  WIP-5.20 promotes the zero-temperature idea to
arbitrarily many cuts: a peak-gap condition leaves at most one active cut,
and a prefix-normalized phase capacity increases under Gaussian tilting.
For three rates this improves the former second-cut threshold to
\(g_{2,*}\le\omega_{1,0}\Delta\).  The certificate has open regions
arbitrarily close to equal rates along every fixed nondegenerate gap
profile, although a hierarchical-gap asymptotic proves that it does not
contain a full neighborhood of the equal-rate diagonal.

WIP-5.21 sharpens the adjacent-cut mechanism twice.  The exact pointwise
transport maximum is obtained from a quadratic equation and has a strictly
smaller explicit AM--GM envelope than (5.193); the true zero-temperature
mass ratio is a strict average of that maximum and is stronger still.  This
gives the new exact GGC laws (5.228) and (5.231), with the latter lying in
the average cone while outside the exact pointwise-supremum cone.  WIP-5.22
then retains all positive mass below the second cut.  Its endpoint and
regularized-upper-tail criteria strictly enlarge the old WIP-5.18 mass
test, as witnessed by the already established law (5.199).  A separate
exact calculation shows that the natural integration-by-parts profile
changes curvature, so a single global Jensen/chord argument cannot close
the remaining inequality.

WIP-5.23 removes the peak-gap hypothesis from the finite-cut capacity
method.  The full capacities
\(\mathfrak C_j=(P+H_j)/T_j\) increase under Gaussian tilting and protect
each active rising root independently, even when several cuts are active.
The exact four-rate law (5.250) satisfies this new cone while strictly
violating the old peak-gap condition, and two of its cuts are genuinely
active at the same small positive times.  WIP-5.25 resolves the endpoint
question left in WIP-5.22: the last-cut unweighted balance is strictly
positive at every interior point.  Its proof conditions on the aggregate
lower-rate Dirichlet mean and preserves the WIP-5.11 two-rate true-lobe
balance by reverse- and same-order covariance.

WIP-5.26 completes this branch for arbitrary finite rate support.  At
each cut it conditions on independent lower and upper Dirichlet block
means.  A density tilt preserves their product structure, and the entire
mixing remainder is a nonnegative same-order covariance.  The resulting
unweighted all-cut prefix theorem survives every Gaussian weight by
integration by parts.  Consequently
\[
\boxed{
\left(\sum_{i=1}^nG_{\beta_i}^{(i)}/b_i\right)^2\in GGC
\quad\text{for all}\quad
\beta_i>0,\quad\sum_i\beta_i=1,\quad b_i>0.
}
\]
This settles \(q=2\) for finite gamma convolutions of total shape one,
and WIP-5.29 propagates it to every smaller positive total shape.
At that stage, larger shapes and the full power conjecture remained
outside the argument. WIP-5.50 later covers every finite support at
total shape at most two, and WIP-6.21 covers the entire original target.

WIP-5.24 develops the complementary shape-changing direction.  For every
two-rate square of total shape \(0<B\le2\), it gives an exact
Stieltjes/phase-kernel GGC criterion.  Endpoint-order theorems show that
the direct \(M^2\in HM_{B/2}\) invariant cannot handle nondegenerate
unequal-shape affine beta means and fails for every unequal-rate model
with \(0<B<2\).  These are proof-route obstructions, not counterexamples
to GGC power closure.

WIP-5.27 solves the fractional symmetric case sharply.  If
\(M=l+(r-l)U\), \(U\sim{\rm Beta}(k,k)\), and \(l<r\), then
\[
M^2\in HM_k\iff k\ge1.
\]
Fractional Abel inversion, Sjödin's gamma--\(HM_k\) criterion, and
Bondesson's product theorem consequently prove
\[
\left(G_k^{(1)}/b_1+G_k^{(2)}/b_2\right)^2\in GGC
\qquad(k\ge1,\ b_1,b_2>0).
\]
WIP-5.28 treats the nonsymmetric boundary \(B=2\) by an explicit
Stieltjes boundary phase, including its endpoint Thorin atoms, and proves
\[
\left(G_a^{(1)}/b_1+G_{2-a}^{(2)}/b_2\right)^2\in GGC
\qquad(0<a<2,\ b_1,b_2>0).
\]

WIP-5.30 supersedes the remaining two-rate square cases.  For
\(A=a/2\), \(C=c/2\), \(k=A+C\), and
\(M=l+(r-l){\rm Beta}(a,c)\), it proves
\[
G_kM^2\in GGC,\qquad
M^2\overset d=M_k(F_*)
\]
with an explicit directing probability \(F_*\).  Gamma duplication then
gives
\[
\boxed{
\left(G_a^{(1)}/b_1+G_c^{(2)}/b_2\right)^2\in GGC
\qquad(a,c,b_1,b_2>0).
}
\]
Thus no two-rate \(q=2\) range remains open.  WIP-5.31 simultaneously
shows that the pointwise phase kernel is negative on an open set for every
\(0<B\le2\); the successful mechanism is the exact beta average and
hypergeometric Markov representation, not pointwise positivity.

Historically, after the two-rate theorem, the next finite-gamma square
cases had at least three rates and total shape \(B>1\).
They are no longer unresolved membership cases. WIP-5.34 was the first
all-scale theorem with three genuinely distinct rates and \(B>1\): for
shape vector \((1,1,1)\) it constructs an explicit rate-form Thorin
measure of mass \(3/2\). WIP-5.35 gives a second all-scale three-rate
theorem at \(B=2\) for coordinates at most one, by a
Markov--Krein/Möbius phase proof. WIP-5.37 removes that coordinate
restriction completely. When one shape exceeds one, the auxiliary
mass-one Thorin measure has an atom of mass \(\max_i\beta_i-1\) at the
inverse squared scale carrying that shape; Hadamard finite parts and
reciprocal Dirichlet duality handle the new endpoint cases.

WIP-5.32 computes the exact conditional Thorin measure after adjoining a
third atom, but shows that the outer average becomes a nonlinear posterior
quotient: strict Jensen, local concavity, cumulant corrections, and a
Dirichlet-order mismatch rule out the literal measure-averaging/barycentric
recursion. WIP-5.33 gives an equivalent global reduction to an Appell
\(F_1\) function on a correlated complex curve. A negative mixed
logarithmic coefficient rules out the naive fixed positive multivariate
Markov kernel for unequal shapes. WIP-5.36 retains the physical curve and
shows that, for \(0<B<2\), membership of the auxiliary
\(G_{B/2}M^2\) is equivalent to monotonicity of one real ratio of
Abel-type integrals on each side of the middle knot, together with a
nonnegative one-sided phase jump there; this auxiliary membership is
sufficient for the original square by gamma duplication. None of these
obstructions is a GGC counterexample. The heavy-endpoint part of this
three-rate phase problem for 1 < B < 2 is closed by WIP-5.44.
That entry alone did not resolve unrestricted support; WIP-5.50 and
the general WIP-6.21 theorem subsequently remove that membership gap.

WIP-5.38 proves that every endpoint and middle-knot phase jump in this
three-rate \(0<B<2\) problem has the required sign.  It identifies the only
possible rate-form Thorin atoms as

\[
(\beta_l-B/2)_+\delta_{l^{-2}}+
(\beta_d-B/2)_+\delta_{d^{-2}}+
(\beta_r-B/2)_+\delta_{r^{-2}},
\]

with at most one nonzero term.  WIP-5.39 then conditions the projective
negative-moment odds into a two-node beta quotient and differentiates its
outer posterior.  An exact Gauss Wronskian, an affine logarithmic flow, and
an opposite-monotonicity covariance prove strict Abel-ratio decrease on
both complete open intervals whenever the shapes at the extreme scales
are at most one.  Consequently
\[
\boxed{
\bigl(rG_a+dG_b+lG_c\bigr)^2\in GGC
}
\]
for arbitrary \(0<l<d<r\), \(1<a+b+c<2\), and \(a,c\le1\), where
\(a,b,c\) are attached to \(r,d,l\), respectively.  This includes every
coordinatewise-at-most-one shape vector and permits the unique shape above
one at the middle scale. WIP-5.44 subsequently handles either extreme
scale by a positive complementary beta solution and reciprocal auxiliary
duality. Thus there is no remaining three-rate original-square gap at
total shape at most two.

For the first nonquadratic test \(q=3/2\), WIP-1.14 factors the tilted
stable residual as
\((3\sqrt3/2)\sqrt{{\rm Beta}((B+1)/3,1/6)\,
\Gamma((B+2)/3)}\) and derives the exact Wright--beta logarithmic quotient
whose Stieltjes property is required.  A light-tail theorem proves that
this residual, and the corresponding candidate Dirichlet mean, are not
infinitely divisible.  This eliminates only the stronger shortcut of
making the residual itself GGC; it does not decide whether the gamma
product \(X^{3/2}\) is GGC.

WIP-1.15 specializes to two half-shape summands at reciprocal scales.
It proves strictly positive the fixed-Thorin-mass gate and the first
unshifted and shifted \(2\times2\) cumulant--Hankel gates; the shifted
lemma in fact holds for every independent multiplier of \(G_1^{3/2}\).
It also proves that the powered density is completely monotone, so its
Laplace transform is Stieltjes and zero-free on the slit plane; a
full-support spectral argument excludes boundary zeros on the ray
\(e^{-2\pi i/3}(0,\infty)\).

WIP-1.16 computes the first two \(3\times3\) cumulant--Hankel determinants
exactly.  Both are strictly positive at equal rates and at infinite
contrast, hence on neighborhoods of those endpoints.  An exact two-point
multiplier makes both determinants negative and therefore rules out a
universal arbitrary-multiplier extension of the \(2\times2\) lemma; it is
not a counterexample to the target affine-arcsine family.

WIP-1.17 proves the displayed small-contrast GGC theorem.  It reduces the
one-rate Wright ray to a Kummer ODE, proves a strictly positive Wronskian,
and then obtains a uniform logarithmic tube around the two-scale diagonal.
The associated pointwise two-scale kernel is negative for sufficiently
separated scales, so the same proof cannot be extended by global pointwise
positivity. Arbitrary contrast lay outside that independent phase proof;
the original law's all-contrast membership is now covered by (C1).

WIP-1.18 rules out a second overstrong shortcut.  In the exact
factorization
\[
X_\theta^{3/2}\overset d=G_{2/3}N_\theta,
\]
the residual density is not \(HM_{2/3}\) for any finite \(\theta\).
The proof uses its exact Kummer density at zero and a fractional Abel
necessary condition whose derivative has a positive
\(\xi^{4/3}\log(1/\xi)\) asymptotic.  Thus Sjödin's gamma--\(HM_k\)
sufficient theorem cannot establish the all-contrast result, but this is
not a GGC counterexample.

WIP-1.19 rewrites the arcsine average as an even convolution on
the logarithmic scale.  The averaged Wright ray obeys a radial
Klein--Gordon equation and an exact current conservation law.  A
separation-derivative identity shows why direct integration by parts does
not close: the arcsine kernel product increases with separation and has a
singular boundary. A direct Abel boundary-compensation proof was the
next target of that route. Such an alternative proof is no longer a
prerequisite for the original membership theorem, proved by WIP-6.21.

The ledger also gives exact Dirichlet-mean, phase, inverse-Stein,
Bernstein-inversion, spectral, Abel, and Kontorovich--Lebedev formulations
of the power problem. See the [master WIP index](WIP.md) and the
[detailed progress ledger](ledger/README.md) for the proofs and remaining
independent auxiliary questions. Historical sign targets must be read
with the completed membership theorem above; project derivations are not
claims attributed to the cited literature.

This status record supersedes older status sentences in
`notes/classes-and-power-closure.md`,
`background/alpha-cauchy-sd/notes/03-beta-prime-reduction.md`,
`background/alpha-cauchy-sd/notes/05-lemmas-and-conjectures.md`,
`notes/bondesson-2015-product-closure-audit.md`, and
`background/alpha-cauchy-sd/literature/README.md` that call the 2026 claim a
proved theorem. The conjecture itself is not refuted by the audit; only that
proof is.

## Audit certificate for the 2026 claimed proof

Sjödin's Lemma 2 (statement on the article's p. 3, proof on pp. 4--5) asserts
a complete-monotonicity property for a two-variable integral. Set its
parameters \(A=B=a>0\) and choose \(b_1\ne b_2\). The asserted conclusion
then implies that

\[
F(av)F(a/v)
\]

is completely monotone in \(v+v^{-1}\), where, up to normalization,

\[
F(z)=\int_0^1
e^{-z[b_1(1-r)+b_2r]}
(1-r)^{\beta_1-1}r^{\beta_2-1}\,dr.
\]

Thus \(F\) would be an HCM Laplace transform. The represented variable
\(b_1(1-U)+b_2U\), with
\(U\sim\operatorname{Beta}(\beta_2,\beta_1)\), is nondegenerate and bounded.
An HCM Laplace transform would make its law GGC, hence infinitely divisible;
but a nondegenerate infinitely divisible distribution cannot have bounded
support. This contradiction disproves Lemma 2 as stated.

The local error occurs in the \(\Delta<0\) case on p. 4: the substitution
\(y\mapsto y^{-1}\) is said to reduce the argument to the \(\Delta>0\) case,
but the required Bernstein-function dependence does not follow. A further
induction gap appears on p. 5: the representing measure for \(J_n\) depends
on the outer parameters \(A\) and \(B\), so inserting it into the remaining
integrals does not identify the integrand pointwise with the \(n-1\) case.

This is an analytic obstruction, not a numerical objection.

## Reliable baseline

### GGC and HCM

A positive GGC law is a weak limit of finite convolutions of gamma laws. Its
Laplace transform has the Thorin form

\[
\phi_X(s)=
\exp\!\left{-as-
\int_{(0,\infty)}\log\!\left(1+\frac{s}{t}\right)U(dt)
\right},
\]

with \(a\ge0\) and an admissible Thorin measure \(U\). Equivalently, a
function \(\phi\) with \(\phi(0+)=1\) is the Laplace transform of a GGC law if
and only if \(\phi\) is HCM. For positive laws,

\[
HCM_{\rm dens}\Longrightarrow GGC\Longrightarrow SD\Longrightarrow ID.
\]

These arrows are not reversible without additional hypotheses.

### What is already known

Bondesson (2015) records the following relevant results.

1. If \(X\) has an HCM density, then \(X^q\) has an HCM density for
   \(|q|\ge1\) (Proposition 4(a), p. 1066). Thus (C1) holds on this proper
   subclass.
2. If \(X,Y\in GGC\) are independent, then \(XY\in GGC\) (Theorem 1,
   pp. 1068--1071).
3. On p. 1075, (C1) is also recorded for Bondesson's class \(R_1\), for
   \(PF_\infty\) laws, and for the stated independent products of one of
   those variables with an HCM-density variable.
4. Conjecture 2 on pp. 1076--1077 is a stronger multivariate
   complete-monotonicity statement proposed as a sufficient route to (C1).
   Bondesson proves only its \(n=1\) case there.
5. If one counterexample to (C1) exists, then counterexamples occur with
   exponents in every interval \((1,1+\varepsilon)\) (Remark 8, p. 1076).

The independent-product theorem does **not** prove \(X^2\in GGC\): applying
it to independent copies \(X_1,X_2\) gives \(X_1X_2\in GGC\), generally a
different law from \(X^2\).

## Two exact recognition targets

Fix \(q>1\) and put

\[
\psi_q(s)=\mathbb E[e^{-sX^q}],
\qquad
\Phi_q(s)=-\log\psi_q(s).
\]

There are two natural ways to prove \(X^q\in GGC\).

### HCM-Laplace target

For every fixed \(s>0\), prove that

\[
\psi_q(sv)\psi_q(s/v)
\]

is completely monotone as a function of \(w=v+v^{-1}\). This is exactly the
HCM criterion for the normalized Laplace transform \(\psi_q\).

### Thorin/Stieltjes target

Prove that

\[
\Phi_q'(s)=
\frac{\mathbb E[X^q e^{-sX^q}]}
     {\mathbb E[e^{-sX^q}]}
\]

is a Stieltjes function with the correct drift and integrability. This would
produce

\[
\Phi_q'(s)=a+\int_{(0,\infty)}\frac{U_q(dt)}{s+t}
\]

and hence the Thorin measure of \(X^q\).

## Finite-gamma reduction

**[DERIVED: GGC-R1]** For a fixed \(q\ge1\), it is enough to prove (C1) for
every finite gamma convolution

\[
S_n=G_1+\cdots+G_n,
\qquad
G_i\sim\Gamma(\beta_i,b_i)
\quad\text{independently}.
\]

Indeed, every GGC variable is a weak limit \(S_{n_k}\Rightarrow X\). The
continuous-mapping theorem gives \(S_{n_k}^q\Rightarrow X^q\), and the GGC
class is weakly closed. This reduction is valid; it does not introduce
independent copies of the same variable.

For finite gamma convolutions the target is therefore

\[
\psi_{n,q}(s)=\mathbb E[e^{-sS_n^q}]\in HCM.
\]

The case \(n=1\) already followed from HCM-density power closure, and
integer gamma shapes from the \(PF_\infty\) case. WIP-5.30 independently
closed arbitrary two-rate squares; WIP-5.50 extended the independent
phase proof to every finite support at total shape at most two.
WIP-6.21, with the completed audit WIP-6.23, now proves the finite-input
statement for every support size, positive shape vector and finite real
\(q\ge1\). There is no remaining finite-gamma membership case assigned
as an unresolved part of (C1).

## Bondesson's stronger integral conjecture

To avoid collision with the alpha-Cauchy parameter, put \(\rho=1/q\). For
positive \(u_i,\lambda_i\), Bondesson's Conjecture 2 asks whether

\[
K(t)=\int_{(0,\infty)^n}
\exp\{-E(v,t)\}\prod_{i=1}^n\frac{dv_i}{v_i}
\]

is completely monotone in \(t+t^{-1}\), where

\[
E(v,t)=
\left(\sum_{i=1}^n u_i v_i^\rho\right)^q
+\left(\sum_{i=1}^n u_i v_i^{-\rho}\right)^q
+\sum_{i=1}^n\lambda_i
\left(\frac{t}{v_i}+\frac{v_i}{t}\right).
\]

If true for all \(n\), this would imply (C1) through the finite-gamma
reduction. Any attempted recursive proof must retain the dependence of every
Bernstein representing measure on all outer integration parameters; this is
exactly where the 2026 claimed induction fails.

Our proof of (C1) does not reverse this implication or establish
Conjecture 2. The latter remains a separate, stronger integral question
in the project.

## Completed blueprint and independent follow-up questions

The execution authority remains [CurrentGoal.md](CurrentGoal.md), not a
second independent ranking in this status file. The two former main
obligations are now fulfilled:

1. WIP-5.49--5.50 extend the independent square-phase argument to arbitrary
   finite support at total shape at most two.
2. WIP-6.16--6.21 construct a positive finite-time Thorin evolution and
   identify it with actual powers. WIP-6.22 supplies a simpler direct
   resolvent verification; WIP-6.23 completes the mathematical audit.

There is no outstanding membership theorem, local-closure hypothesis,
or TeX-production requirement needed to finish (C1). Potential follow-up
work includes external human review, more explicit Thorin representations,
alternative phase proofs, the general noninteger gamma-peeling operator,
and Bondesson's stronger integral Conjecture 2. A matched PD/Dirichlet
representation or a direct all-order Hausdorff certificate could still
provide additional structure, but is not an unproved lemma in the completed
argument. No conclusion about these stronger independent questions is
inferred solely from (C1).

Three quantifier safeguards remain valid as methodological lessons:

- a support-size-limited B = 2 result does not imply the same support-size
  result below B = 2 by adding a vanishing-scale gamma;
- a universal square theorem alone does not give every real exponent;
- law-dependent local power closure gives the full conjecture only if
  the hypothesis covers every GGC law, or a separately justified invariant
  class large enough for the argument, not merely finite gamma sums.

Numerical work can guide discovery, but the project requires an analytic
or rigorously certified exact conclusion. Every claim retains its direction,
provenance, hypotheses, boundary obligations and, where applicable,
precise remaining independent gap.

## Initial lemma/conjecture ledger

| ID | Statement | Provenance | Status |
|---|---|---|---|
| GGC-K1 | normalized HCM Laplace transforms are exactly GGC Laplace transforms | Bondesson, Proposition 3 | established input |
| GGC-K2 | HCM-density laws are closed under \(\lvert q\rvert\ge1\) powers | Bondesson, Proposition 4(a) | established input |
| GGC-K3 | independent GGC products are GGC | Bondesson, Theorem 1 | established input |
| GGC-R1 | it suffices to prove fixed-\(q\) closure for finite gamma convolutions | weak approximation + continuous mapping | proved here |
| GGC-C1 | every GGC is closed under deterministic powers \(q\ge1\) | Bondesson (2015), Conjecture 1, is the source of the question; proof is WIP-6.21 | proved in project; internal mathematical completion audit WIP-6.23 |
| GGC-C2 | Bondesson's multivariate integral is CM in \(t+t^{-1}\) | Bondesson, Conjecture 2 | open sufficient condition; \(n=1\) known |
| GGC-A1 | Sjödin's Lemma 2 supplies the induction step | Sjödin (2026) | refuted as stated by bounded-support specialization |
| GGC-N2 | \(S_2^q\in GGC\) for two arbitrary gamma summands when \(q>1,\ q\ne2\) | historical project target; now WIP-6.21 | proved as a special case of GGC-C1; the independent square proof remains GGC-P17 |
| GGC-P1 | if \(\sum_i\beta_i=1\) and \(\sum_i\beta_i b_i\le2\min_i b_i\), then \((\sum_iG_{\beta_i}/b_i)^2\in GGC\) | WIP-5.7 | proved here |
| GGC-P2 | \((G_p/b_1+G_{1-p}/b_2)^2\in GGC\) for every \(0<p<1\) and \(b_1,b_2>0\) | WIP-5.11 | proved here; complete two-rate, total-shape-one square theorem |
| GGC-P3 | for total shape one, \(\beta_1>1/2\) and \(g_*\le-\cot(\pi\beta_1)\), with \(g_*\) the maximal cut likelihood in (5.136), imply the square of the finite gamma convolution is GGC | WIP-5.14 | proved here; arbitrary finite number of ordered rates |
| GGC-P4 | the cut maxima in GGC-P3 are determined by one interlacing degree-\(n-1\) polynomial and admit the endpoint envelopes (5.150)--(5.151); in particular (5.152) is an explicit three-rate GGC cone | WIP-5.15 | proved here; finite exact or root-free certificate |
| GGC-P5 | the two zero-temperature mass-ratio inequalities (5.174) control every dangerous prefix in the three-rate, total-shape-one square problem; (5.177) and (5.182) are root-free and optimization-free sufficient versions | WIP-5.18 | proved here; complete GGC theorem on the stated parameter cone |
| GGC-P6 | the adjacent-cut transport cone (5.194), together with first-prefix and interface certificates, proves the exact three-rate law (5.199) is GGC | WIP-5.19 | proved here; complementary to the zero-temperature cone |
| GGC-P7 | the prefix-normalized phase-capacity conditions (5.203) prove the square of an arbitrary finite total-shape-one gamma convolution is GGC; in three rates the second threshold improves to (5.209) | WIP-5.20 | proved here; valid peak-gap cone, strictly superseded by GGC-P10 |
| GGC-P8 | the adjacent transport admits the exact quadratic maximum (5.218), the sharper explicit envelope (5.219), and the strictly stronger averaged certificate (5.224); these prove the exact laws (5.228) and (5.231) | WIP-5.21 | proved here; strict hierarchy of second-prefix cones |
| GGC-P9 | the full lower-buffer endpoint test (5.235), global-mass test (5.236), and explicit regularized-tail test (5.240) uniformly control the second rising prefix | WIP-5.22 | proved here; strictly enlarges the older WIP-5.18 second-mass cone; endpoint later closed by GGC-P12 |
| GGC-P10 | the peak-gap-free conditions \(g_{j,*}\le(P(0)+H_j(0))/T_j(0)\), or the parameter cone (5.249), prove the arbitrary finite total-shape-one square theorem while allowing simultaneous active cuts | WIP-5.23 | proved here; strict extension witnessed by the four-rate law (5.250) |
| GGC-P11 | \((G_m^{(1)}/b_1+G_m^{(2)}/b_2)^2\in GGC\) for every integer \(m\ge1\) and all positive rates | WIP-5.24 | proved here via \(M^2\in HM_m\), Sjödin (2021), and GGC product closure; strictly extended to real \(k\ge1\) by GGC-P14 |
| GGC-P12 | the full unweighted last-cut endpoint balance is strictly positive at every interior point; in three rates \(c_M\ge0\) alone therefore controls every second rising prefix | WIP-5.25 | proved here by conditional two-rate true-lobe positivity and covariance mixing |
| GGC-P13 | the square of every finite gamma convolution with total shape one is GGC, for arbitrary positive rates and shape vector | WIP-5.26 | proved here by all-cut two-block conditioning, product association, and an unweighted-to-Gaussian prefix lift |
| GGC-P14 | for an unequal-endpoint affine \({\rm Beta}(k,k)\) mean, \(M^2\in HM_k\iff k\ge1\); consequently \((G_k^{(1)}/b_1+G_k^{(2)}/b_2)^2\in GGC\) for every real \(k\ge1\) | WIP-5.27 | proved here by Bell-polynomial positivity and causal fractional Abel inversion, followed by Sjödin (2021) and product closure |
| GGC-P15 | \((G_a^{(1)}/b_1+G_{2-a}^{(2)}/b_2)^2\in GGC\) for every \(0<a<2\) and all positive rates | WIP-5.28 | proved here from an explicit nondecreasing canonical CBF phase; the endpoint Thorin atom is also identified |
| GGC-P16 | if the fixed-\(q\) finite-gamma theorem holds for arbitrary rate support at total shape \(B_0\), it holds at every \(0<B\le B_0\); in particular every finite gamma convolution of total shape at most one has a GGC square | WIP-5.29 | proved here by adding a gamma of shape \(B_0-B\) at a vanishing scale and using weak closure |
| GGC-P17 | \((G_a^{(1)}/b_1+G_c^{(2)}/b_2)^2\in GGC\) for every \(a,c,b_1,b_2>0\) | WIP-5.30 | proved here by an exact Gauss-hypergeometric Markov representation, an explicit Thorin measure for \(G_{(a+c)/2}M^2\), gamma duplication, and product closure |
| GGC-P18 | \((G_1^{(1)}/b_1+G_1^{(2)}/b_2+G_1^{(3)}/b_3)^2\in GGC\) for all \(b_i>0\) | WIP-5.34 | proved here from the linear Dirichlet spline, a zero-free hyperbolic factorization, and an explicit rate-form Thorin measure of mass \(3/2\) |
| GGC-P19 | if \(0<\beta_i\le1\), \(\sum_{i=1}^3\beta_i=2\), and \(b_i>0\), then \((\sum_{i=1}^3G_{\beta_i}^{(i)}/b_i)^2\in GGC\) | WIP-5.35 | proved here by the order-two Markov--Krein boundary phase, an exact Möbius transport, and a rate-form Thorin measure of mass one; boundary shapes use weak closure |
| GGC-P20 | if \(\beta_i>0\), \(\sum_{i=1}^3\beta_i=2\), and \(b_i>0\), then \((\sum_{i=1}^3G_{\beta_i}^{(i)}/b_i)^2\in GGC\), with no coordinatewise shape restriction | WIP-5.37 | proved here by a repaired right-cut transport, canonical Hadamard finite parts, and reciprocal Dirichlet duality; if \(\max_i\beta_i>1\), the auxiliary Thorin measure has the stated atom of mass \(\max_i\beta_i-1\) |
| GGC-P21 | there exists \(\theta_*>0\) such that \((e^\theta G_{1/2}+e^{-\theta}G'_{1/2})^{3/2}\in GGC\) whenever \(\lvert\theta\rvert<\theta_*\) | WIP-1.17 | independent local proof by a Kummer ODE, positive Wronskian and logarithmic diagonal tube; its threshold is not explicit, while arbitrary-contrast membership now follows from GGC-C1 |
| GGC-P22 | if \(1<\beta_1+\beta_2+\beta_3<2\), the shapes attached to the two extreme scales are at most one, and the three rates are arbitrary positive and distinct, then \((\sum_{i=1}^3G_{\beta_i}^{(i)}/b_i)^2\in GGC\) | WIP-5.39 | proved here by a two-node Abel Wronskian, monotone-likelihood-ratio transport, and an outer posterior covariance; a possible unique shape above one may be attached to the middle scale |
| GGC-H1 | for every finite gamma convolution \(X\), \(a_n=\kappa_{n+1}(X^2)/n!\) satisfies \(a_0a_2-a_1^2>0\) and \(a_1a_3-a_2^2>0\) | WIP-3.10 | proved here by exact moment-spread decompositions; necessary conditions only, not GGC membership |
| GGC-H2 | the reciprocal-scale two-half-gamma \(q=3/2\) model strictly passes its fixed-mass gate and first two \(2\times2\) cumulant--Hankel gates; the shifted gate has a universal multiplier form | WIP-1.15 | proved here by exact moment inequalities and rational certificates; necessary conditions only |
| GGC-H3 | the same \(q=3/2\) model strictly passes both first \(3\times3\) cumulant--Hankel gates at equal rates and at infinite contrast, hence locally at both endpoints | WIP-1.16 | exact rational certificates over the formal \(\pi\)-polynomials; no conclusion is inferred from the intermediate numerical scan |
| GGC-R2 | in the three-rate total-shape-one case, positivity of the cumulative signed mass reduces exactly to the interface and the existing rising roots in (5.162); the only new prefix beyond WIP-5.13 is (5.164) | WIP-5.16 | proved reduction; all remaining prefixes are closed globally by GGC-P13 |
| GGC-R3 | for two rates and \(0<B\le2\), GGC membership of the square is equivalent to nonnegativity of the exact averaged phase kernel in (5.259) | WIP-5.24 | proved reduction; its sign is now settled positively for all parameters by GGC-P17 |
| GGC-R4 | after adjoining one Dirichlet atom, the conditional square has the explicit Thorin measure (5.333), while the unconditional log-derivative is the posterior quotient (5.336) with corrections (5.343) | WIP-5.32 | proved exact reduction for a shape-changing multirate recursion |
| GGC-R5 | every three-rate square transform has the exact Lauricella/Appell representations (5.347)--(5.349), reducing to WIP-5.30 on a two-rate boundary | WIP-5.33 | proved exact reduction; a direct Appell boundary computation was the historical route target, while original-square membership is now covered by GGC-C1 |
| GGC-R6 | for two rates and \(q=3/2\), GGC membership is equivalent to the probability-Stieltjes property of (1.90); in the half-shape model (1.107)--(1.113) give a zero-free Wright--Bessel ray and its canonical phase | WIP-1.14--WIP-1.19 | proved exact nonquadratic reduction and zero-freeness; WIP-1.17 proves phase monotonicity for sufficiently small contrast, while WIP-1.19 gives an exact logarithmic convolution/PDE formulation for arbitrary contrast |
| GGC-R7 | for three rates and \(0<B<2\), \(G_{B/2}M^2\in GGC\) is equivalent to monotonic decrease of the Abel ratio \(B_{B/2}(x)/A_{B/2}(x)\) on both sides of the middle knot plus the nonnegative one-sided phase-jump condition (5.396) | WIP-5.36--WIP-5.39; WIP-5.44 | proved exact reduction and all node signs; WIP-5.44 closes the formerly missing heavy-endpoint interval for every 1 < B < 2 |
| GGC-R8 | in the reciprocal-scale half-gamma \(q=3/2\) model, the physical Wright-ray average is the even logarithmic convolution (1.153), satisfies the radial Klein--Gordon equation (1.154), and has the separation-current representation (1.160) | WIP-1.19 | proved exact all-contrast reduction; direct separation integration by parts still has the wrong bulk sign and a singular boundary, but original-law membership is now GGC-C1 rather than an open target |
| GGC-O1 | the WIP-5.11 support nesting can fail at three rates; one scalar centering and a generic PSD aggregation cannot repair it | WIP-5.12 | proved structural obstructions; not a GGC counterexample |
| GGC-O2 | the natural upper-prefix Möbius coordinates contain two logarithmically divergent terms with a coupled cutoff, and the canonical reflected kernel has no fixed sign | WIP-5.17 | proved obstruction to one proof mechanism; not a GGC counterexample |
| GGC-O3 | if a second-cut rising root is frozen independently of the phase equation, its upper-prefix balance has the negative large-\(t\) asymptotic (5.187) | WIP-5.19 | proved obstruction to a fixed-root proof; not a GGC counterexample |
| GGC-O4 | the layer-cake profile in (5.242) has negative curvature at one exact rising point and positive curvature near its peak | WIP-5.22 | proved obstruction to a single global Jensen/chord argument; not a GGC counterexample |
| GGC-O5 | a nondegenerate affine \({\rm Beta}(a,c)\) mean with \(a\ne c\) never has \(M^2\in HM_{(a+c)/2}\); for unequal rates this invariant also fails throughout \(0<a+c<2\), even at equal shapes | WIP-5.24 | proved endpoint-order obstruction to one induction invariant; not a GGC counterexample |
| GGC-O6 | for a two-rate square of total shape \(B>2\), its Laplace transform is not Stieltjes | WIP-5.24 | proved obstruction to the reciprocal-CBF phase mechanism; not a GGC counterexample |
| GGC-O7 | for every \(0<B\le2\), the pointwise phase kernel in (5.257) is negative on an open set | WIP-5.31 | proved obstruction to pointwise positivity; the required beta average is nevertheless positive by GGC-P17 |
| GGC-O8 | the exact third-atom Thorin measures cannot be simply averaged or inserted into the literal positive generalized-Stieltjes/barycentric recursion | WIP-5.32 | proved by strict Jensen, small-\(s\) concavity, moment corrections, and order mismatch; not a GGC counterexample |
| GGC-O9 | for unequal three-rate shapes, the raw Lauricella logarithm has a negative fourth-order mixed coefficient and cannot have the fixed positive multivariate Markov representation (5.354) | WIP-5.33 | proved obstruction to a multivariate extension of the WIP-5.30 kernel; not a GGC counterexample |
| GGC-O10 | in the two-rate \(q=3/2\) reduction, the tilted-stable residual and candidate mean have Gaussian-type upper tails and are not ID | WIP-1.14 | proved obstruction to the residual-GGC product shortcut; does not imply that \(X^{3/2}\) is not GGC |
| GGC-O11 | the arbitrary-multiplier analogue of the \(q=3/2\) \(3\times3\) Hankel gates is false: an exact two-point multiplier makes both determinants negative | WIP-1.16 | proved obstruction to one universal multiplier lemma; the multiplier is not the target affine-arcsine law |
| GGC-O12 | the symmetric two-scale kernel \(\mathscr S(x,y)\) used in WIP-1.17 is negative for sufficiently separated scales | WIP-1.17 | proved from the exact \(y=0,\ x\to\infty\) asymptotic; this blocks global pointwise kernel positivity but not the required arcsine average |
| GGC-O13 | the exact residual \(N_\theta\) in \(X_\theta^{3/2}\overset d=G_{2/3}N_\theta\) is not \(HM_{2/3}\) for any finite contrast | WIP-1.18 | proved by an exact Kummer density expansion and a fractional Abel necessary condition; blocks Sjödin's gamma--\(HM_k\) shortcut but does not imply failure of GGC membership |

### Additional reductions and obstructions from the reassessment

| ID | Statement | Detailed record | Status |
|---|---|---|---|
| GGC-R9 | an at-most-(n+1)-support theorem at total shape B0 implies an at-most-n-support theorem at B < B0 | [WIP-5.40](ledger/14-averaged-phase-compensation.md#wip-5-40) | proved support-aware reduction |
| GGC-R10 | the auxiliary laws \(G_kM^2\) and \(G_k(M^\dagger)^2\), with total Dirichlet shape 2k and reciprocal scales, have equivalent GGC membership and reciprocal Thorin measures | [WIP-5.41](ledger/14-averaged-phase-compensation.md#wip-5-41) | proved auxiliary equivalence; not gamma cancellation for the original square |
| GGC-O14 | the heavy-endpoint posterior function has positive coordinate derivative at admissible physical points near the middle knot | [WIP-5.42](ledger/14-averaged-phase-compensation.md#wip-5-42) | proved obstruction to the old monotonicity argument; the actual compensation is proved by WIP-5.44 |
| GGC-O15 | the global log-concavity condition of B92-C2 fails for every finite-gamma power with q > 1 and B/q <= 1 | [WIP-6.1](ledger/15-global-criteria-and-power-flow.md#wip-6-1) | proved exclusion of a sufficient method, not of GGC membership |
| GGC-R11 | smallest-rate gamma peeling becomes the normalized fractional integral in the powered density | [WIP-6.2](ledger/15-global-criteria-and-power-flow.md#wip-6-2) | proved identity; its matched GGC closure remains conjectural |
| GGC-R12 | all positive-argument tilted-cumulant Hausdorff differences, or all Loewner matrices, characterize the actual powered law's GGC membership | [WIP-6.3](ledger/15-global-criteria-and-power-flow.md#wip-6-3) | proved application of sourced criteria; for GGC inputs the corresponding all-order signs now follow from GGC-C1, though separate explicit certificates may still be sought |
| GGC-R13 | the continuous power flow has the stated tilted covariance derivative; if a finite-gamma power is GGC its Thorin mass is B/q | [WIP-6.4](ledger/15-global-criteria-and-power-flow.md#wip-6-4) | proved identities and conditional mass constraint, not positivity preservation |
| GGC-R14 | a law-dependent right neighborhood of power closure for every GGC law implies all powers q >= 1 | [WIP-6.5](ledger/15-global-criteria-and-power-flow.md#wip-6-5) | proved conditional continuation lemma; its local hypothesis is now a consequence of GGC-C1, not a remaining proof obligation |

### New closure and tangent results: 2026-09-05

| ID | Statement | Detailed record | Status |
|---|---|---|---|
| GGC-P23 | every finite gamma convolution with at most three distinct rates and total shape 0 < B <= 2 has a GGC square | [WIP-5.44](ledger/14-averaged-phase-compensation.md#wip-5-44) | proved here; the new auxiliary theorem covers 1 < B < 2, and the original-square endpoints use established project results |
| GGC-P24 | the normalized peeling operator preserves every GGC input for every positive integer order and q >= 1 | [WIP-7.1--7.2](ledger/17-exponential-peeling-closure.md) | proved from Bondesson's widened multiplication theorem; fractional orders are not covered |
| GGC-P25 | any uniform-in-rates fixed-power residual theorem can be extended by integer-shape prefixes at smaller rates, including equal-rate limits | [WIP-7.3--7.4](ledger/17-exponential-peeling-closure.md) | proved conditional bootstrap and concrete original-square families |
| GGC-H4 | every fixed finite Loewner matrix of a fixed finite-gamma power is positive definite on its own right neighborhood of q = 1 | [WIP-6.6--6.7](ledger/16-power-flow-loewner-tangent.md) | proved by a strict nullspace square-integral formula and a Schur complement; not a common interval for all matrices |
| GGC-R15 | the normalized finite-atom power tangent has an exact compensated positive-jump form and satisfies the positive minimum property | [WIP-6.9](ledger/16-power-flow-loewner-tangent.md#wip-6-9) | proved weak functional; no nonlinear evolution theorem is invoked |
| GGC-R16 | a genuine positive Thorin curve realizes the compensated functional on bounded smooth tests and matches the power-transform tangent on compact positive Laplace arguments | [WIP-6.10](ledger/16-power-flow-loewner-tangent.md#wip-6-10) | proved one-step construction, explicitly unequal to the actual power flow; no weak derivative of a putative actual Thorin measure is assumed |
| GGC-R17 | a theorem at a fixed power for arbitrary support and individual shapes below any fixed positive threshold suffices for all finite gamma shapes | [WIP-7.5](ledger/17-exponential-peeling-closure.md#wip-7-5) | proved by splitting and rate perturbation; support size is not preserved |
| GGC-O16 | the actual heavy-endpoint posterior does not decrease against all smooth bounded Bernstein tests | [WIP-5.43](ledger/14-averaged-phase-compensation.md#wip-5-43) | proved; compatible with the singular target's positive-complement proof |
| GGC-O17 | a strictly powered finite gamma law has no positive exponential moments; if GGC, its Thorin measure puts mass below every positive cutoff | [WIP-6.8](ledger/16-power-flow-loewner-tangent.md#wip-6-8) | proved tail/conditional-support constraint; not a negative tangent or a GGC counterexample |
| GGC-O18 | matched equal-shape two-gamma outputs have non-HCM densities for every 1 <= q < 2, despite HCM input densities | [WIP-7.6](ledger/17-exponential-peeling-closure.md#wip-7-6) | proved complex-zero obstruction to a stronger invariant only |

### Support-wide phase theorem and the completed log-rate proof

| ID | Statement | Proof record | Status |
|---|---|---|---|
| GGC-P26 | every finite gamma convolution of total shape 0 < B <= 2 has a GGC square, without a support-size restriction | [WIP-5.49--5.50](ledger/18-four-rate-balanced-phase.md#wip-5-49) | proved independently of the general power-flow argument |
| GGC-R18 | the logarithmic Thorin generator has nonnegative jumps, uniform second jump moment and drift y plus a bounded term | [WIP-6.16--6.17](ledger/20-finite-thorin-positive-steps.md) | proved for arbitrary nonzero finite base measures; tangent identification has the stated admissibility hypotheses |
| GGC-P27 | the specific nonlinear log-rate equation has a positive weak solution on every finite interval with uniform second moments | [WIP-6.18--6.19](ledger/21-log-thorin-euler-evolution.md) | proved by an explicit Euler scheme, weak continuity and cumulative error control |
| GGC-R19 | any such specific weak solution induces the actual powers of its initial GGC law | [WIP-6.20](ledger/22-power-flow-identification.md) | proved conditional identification; its existence interface is supplied by GGC-P27 |
| GGC-R20 | the log-rate generator has the exact current-law resolvent action by direct cancellation, with absolute posterior drift and signed Palm estimates | [WIP-6.22](ledger/24-direct-log-generator-resolvent.md#wip-6-22) | proved alternative interface; no enlarged scope or second solution claimed |
| GGC-C1 (assembly) | GGC is closed under every deterministic power q >= 1 | [WIP-6.21](ledger/23-power-theorem-assembly-audit.md); [WIP-6.23](ledger/25-mathematical-completion-audit.md#wip-6-23) | proved in project; internal mathematical audit complete; no external peer-review, publication, Lean or priority claim |

## Sources and working notes

- [Bondesson (2015), primary article](literature/Bondesson2015.pdf).
- [Bondesson monograph](literature/Bondesson.pdf).
- [James--Roynette--Yor (2008), GGC and Dirichlet means](literature/James-Roynette-Yor-2008-GGC-Dirichlet-means.pdf).
- [Schilling--Song--Vondraček (2010), Bernstein functions](literature/SSV.pdf).
- [Steutel--van Harn (2004), infinite divisibility and the light-tail criterion](literature/Steutel.pdf).
- [Martin--Kearney (2010), self-convolutive recurrence](literature/Martin-Kearney-2010-self-convolutive-recurrence.pdf).
- [Sjödin (2021), \(HM_k\) gamma-mixture theorem](literature/Sjodin-2021-HMk-gamma-mixtures-GGC.pdf).
- [Sjödin (2026), claimed solution under audit](literature/the-power-problem-for-generalized-gamma-convolutions-ggc-and-related-questions.pdf).
- [Dyachenko--Karp (2021), hypergeometric-ratio Markov representation](literature/Dyachenko-Karp-2021-arXiv2103.13312v1.pdf).
- [Master WIP result index](WIP.md).
- [Detailed project progress ledger](ledger/README.md).
- [Detailed Bondesson (2015) audit](notes/bondesson-2015-product-closure-audit.md).
- [James stable/Dirichlet scaling and PD conversion audit](notes/james-dirichlet-means-stable-scaling.md).
- [Sokal real-variable Stieltjes/Hausdorff criterion audit](notes/sokal-stieltjes-hausdorff-criterion.md).
- [Class implications and power closure](notes/classes-and-power-closure.md).
- [Beta-prime reduction from the alpha-Cauchy background case](background/alpha-cauchy-sd/notes/03-beta-prime-reduction.md).
- [Historical alpha-Cauchy lemma/conjecture ledger](background/alpha-cauchy-sd/notes/05-lemmas-and-conjectures.md).
- [Completed alpha-Cauchy SD case study](background/alpha-cauchy-sd/README.md).
