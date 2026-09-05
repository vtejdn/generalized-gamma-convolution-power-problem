# Current Goal: Bondesson's GGC power problem

Last updated: **2026-09-05**.

## Current goal

> **The current goal of this repository is to attempt, in ranked order, the
> first five of the seven proof routes documented below for Bondesson's GGC
> power conjecture. Routes 6--7 remain recorded as deferred research paths,
> but they are not part of the current active goal.**

The conjecture is

\[
X\in GGC,\qquad q\ge 1
\quad\stackrel{?}{\Longrightarrow}\quad
X^q\in GGC.
\tag{C1}
\]

The complete ranking is:

1. Gamma--Dirichlet means plus a negatively tilted stable factorization;
2. the Thorin log-derivative/Stieltjes criterion in Volterra form;
3. cumulants as a Stieltjes moment sequence, combined with moment
   determinacy and the multiplicative power semigroup;
4. HCM only after all random parameters have been averaged, followed by
   Bernstein/Kontorovich--Lebedev inversion;
5. a shape-matched Beta--Gamma/Dirichlet recursion in the number of gamma
   summands;
6. rational powers through Mellin--Barnes and Barnes-beta factorizations;
7. the local power flow near \(q=1\), supplemented by size-bias/Palm
   identities.

Routes 1--5 constitute the **active program**. Routes 6--7 constitute the
**deferred backlog**: their statements, proof obligations, and stop criteria
are maintained here so that they can be activated later without repeating
the initial analysis.

The ranking measures the estimated chance of reaching the full conjecture,
not merely the ease of proving an isolated special case. All seven routes
are high-risk. A rigorous counterexample is also a successful resolution of
the project. Numerical calculations may select a candidate parameter
regime, but only an analytic identity, an exact sign argument, or a
certified interval bound counts as proof.

The reliable problem statement and the audit of the 2026 claimed proof are
in [ResearchStatus.md](ResearchStatus.md). The principal sources are
[Bondesson (2015)](literature/Bondesson2015.pdf),
[Bondesson's monograph](literature/Bondesson.pdf), and the
[Sjödin (2026) article under audit](literature/the-power-problem-for-generalized-gamma-convolutions-ggc-and-related-questions.pdf).
Verified results and open obligations produced while executing this plan are
stored by mathematical module in the [project ledger](ledger/README.md) and
resolved by stable identifier through the [WIP master index](WIP.md).

## Common reduction and notation

### Finite-gamma reduction

**[DERIVED: GGC-R1]** It is enough to prove (C1) for every finite gamma
convolution

\[
X=\sum_{i=1}^n \frac{G_{\beta_i}^{(i)}}{b_i},
\qquad
G_{\beta_i}^{(i)}\sim\Gamma(\beta_i,1)
\quad\text{independently},
\tag{0.1}
\]

with \(\beta_i,b_i>0\). Indeed, finite gamma convolutions are weakly dense in
GGC; the map \(x\mapsto x^q\) is continuous on \([0,\infty)\); and GGC is
weakly closed. Any use of this reduction must separately account for drift,
atoms at zero, and the limiting step.

Throughout, write

\[
B=\sum_{i=1}^n\beta_i,
\qquad
\rho=\frac1q\in(0,1),
\qquad
Y=X^q,
\]

and

\[
\psi_q(s)=\mathbb E[e^{-sY}],
\qquad
\Phi_q(s)=-\log\psi_q(s).
\tag{0.2}
\]

### Two complementary Dirichlet representations

Two different Dirichlet averages will be used. They should not be silently
identified as the same coupling.

First, beta--gamma algebra gives

\[
X\overset d=G_BM,
\qquad
M=\sum_{i=1}^n\frac{P_i}{b_i},
\qquad
(P_1,\ldots,P_n)\sim\operatorname{Dir}(\beta_1,\ldots,\beta_n),
\tag{0.3}
\]

where \(G_B\sim\Gamma(B,1)\) and \(G_B\perp M\).

Second, direct convolution on a simplex gives

\[
f_X(x)=
\frac{\prod_i b_i^{\beta_i}}{\Gamma(B)}
x^{B-1}\mathbb E[e^{-Rx}],
\qquad
R=\sum_{i=1}^n b_iQ_i,
\tag{0.4}
\]

where \(Q\sim\operatorname{Dir}(\beta_1,\ldots,\beta_n)\). Formula (0.3) is
suited to structural factorization; formula (0.4) is suited to Laplace and
Volterra analysis.

## Ranked route 1: Gamma--Dirichlet mean plus tilted stable factorization

**Estimated feasibility: highest of the five.**

### Structural target

Let \(S_\rho\) be a standard positive \(\rho\)-stable variable,

\[
\mathbb E[e^{-\lambda S_\rho}]=e^{-\lambda^\rho}.
\]

Define its \((-\rho B)\)-power-biased version \(T_{\rho,B}\) by

\[
\mathbb E[f(T_{\rho,B})]
=
\frac{\mathbb E[S_\rho^{-\rho B}f(S_\rho)]}
     {\mathbb E[S_\rho^{-\rho B}]}.
\tag{1.1}
\]

The negative moments

\[
\mathbb E[S_\rho^{-u}]
=
\frac{\Gamma(1+u/\rho)}{\Gamma(1+u)},
\qquad u>0,
\tag{1.2}
\]

lead to the candidate factorization

\[
\boxed{
G_B^q\overset d=\frac{G_{\rho B}}{T_{\rho,B}},
}
\tag{1.3}
\]

with independent variables on the right. Combining (0.3) and (1.3) gives

\[
\boxed{
X^q\overset d=
G_{\rho B}N_{\rho,B,F},
\qquad
N_{\rho,B,F}:=\frac{M^q}{T_{\rho,B}}.
}
\tag{1.4}
\]

The principal target is therefore:

> **[CONJECTURE: R1-DM]** For every finite Dirichlet mean \(M=M_B(F)\), the
> variable \(N_{\rho,B,F}\) in (1.4) is a Dirichlet mean of order \(\rho B\).

If R1-DM holds, (1.4) is a finite-Thorin-mass GGC representation of \(X^q\).
This route treats arbitrary real \(q>1\) and arbitrary \(n\) in one
framework.

### Attempt blueprint

1. **Prove the stable factorization.** Establish (1.2) with all
   normalizations, prove (1.3) first by a direct density mixture calculation,
   and use Mellin transforms as an independent check. Record independence
   explicitly.
2. **Fix the exact Dirichlet-mean recognition theorem.** State and reference,
   or reprove from the Markov--Krein identity, the equivalence between a GGC
   with finite Thorin mass \(c\) and a product \(G_cM_c(F)\).
3. **Compute the generalized Stieltjes transform.** Derive an exact formula
   for
   \[
   \mathbb E[(1+sN_{\rho,B,F})^{-\rho B}].
   \tag{1.5}
   \]
   Search for a probability measure \(F_q\) such that (1.5) equals
   \[
   \exp\!\left{-\rho B
   \int_{(0,\infty)}\log(1+sx)\,F_q(dx)\right}.
   \tag{1.6}
   \]
4. **Secure the one-atom case.** For \(F=\delta_c\), recover the already
   known GGC property of a positive power of one gamma variable. This checks
   every constant and tilt.
5. **Attack the two-atom case.** Put
   \[
   M=c_2+(c_1-c_2)U,
   \qquad U\sim\operatorname{Beta}(\beta_1,\beta_2),
   \tag{1.7}
   \]
   and determine whether (1.5) admits a Markov--Krein representation. This
   was the first genuinely new square case when this route was drafted.
   WIP-5.30 now gives its Markov--Krein representation for every two-atom
   shape pair; the corresponding active target has \(q\ne2\).  WIP-1.14
   now makes \(q=3/2\) the first exact test: its tilted-stable residual is
   \((3\sqrt3/2)\sqrt{VY}\), and the required Stieltjes function is the
   [Wright--beta logarithmic quotient (1.90)](ledger/02-route1-q-three-halves-wright-bessel.md#wip-1-14).
   The residual itself
   is not ID, so product closure through a residual GGC is unavailable.
   WIP-1.17 nevertheless proves the two-half-gamma model is GGC on a
   nonexplicit open neighborhood of equal rates; arbitrary contrast is the
   remaining two-atom \(q=3/2\) target.  WIP-1.18 further proves that the
   exact residual is never \(HM_{2/3}\), so Sjödin's gamma--\(HM_k\)
   theorem cannot provide the missing all-contrast step.  WIP-1.19 rewrites
   the remaining phase as an even logarithmic arcsine convolution satisfying
   a radial Klein--Gordon equation; the next exact target is its Abel
   boundary-compensation inequality.
6. **Search the Poisson--Kingman interface.** Compare the negative stable
   tilt in (1.1) with known stable Poisson--Kingman and
   coagulation/fragmentation identities. The required conclusion is an
   ordinary Dirichlet mean, not merely a Pitman--Yor mean.
7. **Extend from finite atomic \(F\).** Only after the two-atom and finite
   atomic cases are proved should weak approximation of the base measure be
   used.

### Success and stop criteria

- **Success:** exhibit \(F_q\) and prove (1.6), or construct the associated
  Dirichlet random measure directly.
- **Decisive failure:** an exact violation of a necessary Stieltjes/Hankel
  condition for (1.5) gives a counterexample to R1-DM and potentially to
  (C1).
- **Stop condition:** if the construction yields only a
  \(PD(\rho,\theta)\)-mean with no transformation to a
  \(PD(0,\rho B)\)-mean, record that precise gap rather than treating the
  Poisson--Dirichlet analogy as a proof.

### Supporting lemma: power laws remain fixed-shape gamma mixtures

From (0.4),

\[
f_X(x)=x^{B-1}h(x),
\qquad h\ \text{completely monotone}.
\]

Consequently,

\[
f_{X^q}(y)=\rho y^{\rho B-1}h(y^\rho).
\tag{1.8}
\]

Since \(y\mapsto y^\rho\) is a Bernstein function,
\(h(y^\rho)\) is completely monotone. Thus \(X^q\) is always a gamma mixture
of fixed shape \(\rho B\). The missing step is not gamma-mixture membership;
it is the special structure of the mixing law required for GGC.

## Ranked route 2: Thorin log-derivative and the Volterra kernel

**Estimated feasibility: high relative to the remaining analytic routes.**

### Exact recognition target

The desired conclusion is equivalent to

\[
g_q(s):=\Phi_q'(s)
=-\frac{\psi_q'(s)}{\psi_q(s)}
=a+\int_{(0,\infty)}\frac{U_q(dt)}{s+t}
\tag{2.1}
\]

for an admissible Thorin measure \(U_q\). In particular, \(g_q\) must be a
Stieltjes function. Complete monotonicity of \(g_q\) alone is not sufficient.

Define

\[
K_{\nu,q}(s,r)=
\int_0^\infty x^{\nu-1}e^{-sx^q-rx}\,dx.
\tag{2.2}
\]

Formula (0.4) yields

\[
\psi_q(s)=C\,\mathbb E[K_{B,q}(s,R)]
\tag{2.3}
\]

and hence

\[
g_q(s)=
\frac{\mathbb E[K_{B+q,q}(s,R)]}
     {\mathbb E[K_{B,q}(s,R)]}.
\tag{2.4}
\]

All Dirichlet variables have been averaged before the quotient is taken.

If \(f_Y\) is the density of \(Y\), then, in the no-drift case, the inverse
Laplace transform \(k_q=\mathcal L^{-1}g_q\) is characterized by

\[
yf_Y(y)=\int_0^y k_q(y-x)f_Y(x)\,dx.
\tag{2.5}
\]

Thus the real-variable target is

\[
\boxed{k_q\ \text{is completely monotone}.}
\tag{2.6}
\]

### Attempt blueprint

1. **Establish the equivalence carefully.** Prove (2.5) from
   \(-\psi_q'=g_q\psi_q\), including local integrability, uniqueness of the
   Volterra kernel, treatment of a drift term, and Laplace inversion.
2. **Work first with two gamma summands.** Derive an explicit density for
   \(X\), transform it to \(f_Y\), and solve or iteratively represent
   \(k_q\) in (2.5).
3. **Seek a positive Laplace representation of the kernel.** The successful
   form would be
   \[
   k_q(x)=\int_0^\infty e^{-tx}\,U_q(dt).
   \tag{2.7}
   \]
   Possible tools are Volterra resolvents, total positivity, differential
   equations satisfied by the two-gamma density, and variation-diminishing
   kernels.
4. **Exploit the low-total-shape region.** When \(\rho B\le1\), (1.8) shows
   that \(f_Y\) itself is completely monotone, hence \(\psi_q\) is
   Stieltjes. In this region define the canonical boundary phase
   \[
   \eta_q(t)=-\frac1\pi\arg\psi_q(-t+i0).
   \tag{2.8}
   \]
   Prove the relevant canonical-representation theorem with its hypotheses;
   the remaining target is that \(\eta_q\) is nondecreasing, in which case
   \(U_q=d\eta_q\).
5. **Use a concrete benchmark.** Start with
   \[
   \beta_1=\beta_2=\frac12,
   \qquad b_1=e^\theta,\quad b_2=e^{-\theta},
   \qquad \theta>0,
   \tag{2.9}
   \]
   first for \(q=2\), then for \(1<q\le2\). Here the density is expressible
   using \(I_0\), while \(B=1\le q\) places the problem in the phase regime.
6. **Generalize only after a positive invariant is identified.** Extend from
   the symmetric-shape two-rate model to arbitrary two-gamma parameters,
   then to finite \(n\), and finally invoke GGC-R1.

### Success and stop criteria

- **Success:** prove (2.7), or prove monotonicity of (2.8) and identify
  \(U_q\).
- **Decisive failure:** an exact derivative-sign violation of \(k_q\), or a
  rigorously decreasing interval of \(\eta_q\), disproves GGC membership for
  that parameter choice.
- **Stop condition:** if the two-gamma model yields only positivity of
  \(k_q\), rather than complete monotonicity, do not promote it to GGC; move
  to Route 3's exact necessary conditions.

## Ranked route 3: cumulant Stieltjes moments and the power semigroup

**Estimated feasibility: medium to high.**

### Discrete recognition target

For a GGC variable \(Y\) with all moments and scale-form Thorin measure
\(\tau\),

\[
\kappa_m(Y)=(m-1)!\int_0^\infty c^m\,\tau(dc),
\qquad m\ge1.
\tag{3.1}
\]

Therefore

\[
a_n(Y):=\frac{\kappa_{n+1}(Y)}{n!},
\qquad n\ge0,
\tag{3.2}
\]

must be a Stieltjes moment sequence. Equivalently, for every \(m\ge0\),

\[
\bigl(a_{i+j}\bigr)_{i,j=0}^m\succeq0,
\qquad
\bigl(a_{i+j+1}\bigr)_{i,j=0}^m\succeq0.
\tag{3.3}
\]

For a finite gamma convolution and \(1<q\le2\), the tail of \(Y=X^q\)
satisfies a Hardy-type condition and \(Y\) is Stieltjes-moment determinate.
After all integrability details are proved, (3.3) can therefore be promoted
from a necessary condition to a sufficient condition: construct a measure
representing \((a_n)\), convert it into a Thorin measure plus possible drift,
construct the corresponding GGC, and identify it with \(Y\) by moment
determinacy.

WIP-3.10 now proves uniformly that every finite gamma convolution square
passes both nontrivial \(2\times2\) Stieltjes--Hankel gates, strictly:
\[
a_0a_2-a_1^2>0,\qquad a_1a_3-a_2^2>0.
\]
The proof gives exact positive moment-spread decompositions. This removes
those two minors from the counterexample search, but says nothing about
the first \(3\times3\) matrices or higher orders.

### Attempt blueprint

1. **Prove the necessity theorem.** Derive (3.1)--(3.3) from the Thorin
   representation with all differentiations and moment hypotheses stated.
2. **Prove the determinate converse.** Given a Stieltjes representing measure
   for \((a_n)\), handle its atom at zero as drift, verify Thorin
   integrability, and show that the constructed GGC has the same cumulants
   and moments as \(Y\).
3. **Prove moment determinacy for \(1<q\le2\).** Establish
   \(\mathbb E[e^{\varepsilon\sqrt{Y}}]<\infty\) for a suitable
   \(\varepsilon>0\), including the endpoint \(q=2\).
4. **Derive exact finite-gamma moments.** For two summands use
   \[
   X\overset d=G_B[c_2+(c_1-c_2)U],
   \qquad U\sim\operatorname{Beta}(\beta_1,\beta_2),
   \tag{3.4}
   \]
   and
   \[
   \mathbb E[Y^n]
   =\frac{\Gamma(B+qn)}{\Gamma(B)}
   \mathbb E[(c_2+(c_1-c_2)U)^{qn}].
   \tag{3.5}
   \]
   Convert moments to cumulants by an explicitly recorded Bell-polynomial
   or partition formula.
5. **Search for an all-order positive representation.** The real proof
   target is to express every quadratic form associated with (3.3) as an
   integral of a square against a positive measure. Candidate tools are
   Dirichlet moment formulas, partition lattices, total positivity, and the
   stable factorization from Route 1.
6. **Use the multiplicative power semigroup.** Let
   \[
   \mathcal Q=\{q\ge1:\ X\in GGC\Rightarrow X^q\in GGC
   \text{ for every }X\}.
   \tag{3.6}
   \]
   Prove that \(\mathcal Q\) is closed under multiplication and limits. If
   \((1,2]\subset\mathcal Q\), then every \(Q>1\) follows by writing
   \(Q=r^m\) with \(r\in(1,2]\). More generally, a universal sequence
   \(q_j\downarrow1\) contained in \(\mathcal Q\) is enough.

### Success and stop criteria

- **Success:** prove all Hankel and shifted-Hankel matrices in (3.3) are
  positive semidefinite for \(1<q\le2\), then use determinacy and the power
  semigroup.
- **Decisive failure:** one exactly negative principal minor is a rigorous
  counterexample. A numerical negative value must be converted to an exact
  formula, analytic bounds, or certified interval arithmetic.
- **Stop condition:** checking any finite number of minors, however many,
  is evidence only. Without an all-order argument it is not a proof of GGC.

## Ranked route 4: final averaged HCM and KL/Bernstein inversion

**Estimated feasibility: medium.**

### Exact HCM target

Let \(Y_1,Y_2\) be independent copies of \(Y=X^q\). For \(t>0\) put

\[
w=t+t^{-1}\ge2.
\]

Exchange symmetry gives the fully averaged identity

\[
\begin{aligned}
H_s(w)
&:=\psi_q(st)\psi_q(s/t)\\
&=\mathbb E\!\left[
e^{-\frac{s}{2}(Y_1+Y_2)w}
\cosh\!\left(
\frac{s}{2}(Y_1-Y_2)\sqrt{w^2-4}
\right)
\right].
\end{aligned}
\tag{4.1}
\]

The HCM criterion asks whether, for every \(s>0\), \(H_s\) is completely
monotone in \(w\). Equivalently, find a positive measure \(\eta_s\) such that

\[
H_s(w)=\int_0^\infty e^{-\lambda w}\,\eta_s(d\lambda).
\tag{4.2}
\]

The expectation in (4.1) must be kept intact: the fixed
\((Y_1,Y_2)\)-fibres are generally not completely monotone.

### Attempt blueprint

1. **Prove the symmetrized formula.** Derive (4.1) and all density versions
   by Tonelli and explicit changes of variables.
2. **Construct the candidate inverse measure.** Set \(w=2\cosh u\). Then
   \(H_s(2\cosh u)\) is related to the Kontorovich--Lebedev transform through
   \[
   \int_{\mathbb R}e^{i\xi u}e^{-2\lambda\cosh u}\,du
   =2K_{i\xi}(2\lambda).
   \tag{4.3}
   \]
   Derive a rigorous KL inversion formula for the candidate \(\eta_s\),
   including function spaces, boundary behavior, and possible distributional
   terms.
3. **Prove positivity in the first nontrivial model.** Use two unequal-rate,
   nonintegral-shape gamma summands. Begin with \(q=2\), where the kernel
   \(K_{\nu,2}\) can be related to parabolic-cylinder functions.
4. **Identify a positivity mechanism.** Possible mechanisms are total
   positivity of a weighted self-convolution, a differential equation for
   the finite-gamma density, or a positive product formula for the special
   functions. Positivity of a generic KL inverse cannot be assumed.
5. **Extend parameters in a controlled order.** Move from the benchmark to
   arbitrary two-gamma parameters, then to finite \(n\), then to real
   \(q>1\), and finally apply GGC-R1.

### Success and stop criteria

- **Success:** prove \(\eta_s\ge0\) for every \(s>0\), yielding (4.2).
- **Decisive failure:** an exact negative pairing of \(\eta_s\) against a
  nonnegative test function disproves HCM for that law.
- **Stop condition:** never replace the averaged problem by pointwise
  complete monotonicity of an inner beta/Dirichlet integral. That assertion
  already fails in the two-variable specialization used in the Sjödin audit.

## Ranked route 5: shape-matched Beta--Gamma/Dirichlet recursion

**Estimated feasibility: medium to low, but high payoff if successful.**

### Recursive target

Suppose a finite gamma convolution with total shape \(B\) is represented as

\[
X=G_BM,
\qquad G_B\perp M.
\]

After adding \(G_\beta/b\), beta--gamma algebra gives

\[
X_+=G_{B+\beta}M_+,
\qquad
M_+=UM+(1-U)b^{-1},
\tag{5.1}
\]

where

\[
U\sim\operatorname{Beta}(B,\beta)
\]

is independent of \(M\). The desired recursive theorem is a statement of
the form

\[
G_B^qM^q\in GGC
\quad\Longrightarrow\quad
G_{B+\beta}^q
\bigl(UM+(1-U)b^{-1}\bigr)^q\in GGC,
\tag{5.2}
\]

but only for \(M\) in the class of Dirichlet means whose order is matched to
\(B\). The same claim for an arbitrary bounded positive \(M\) is likely too
strong.

### Attempt blueprint

1. **Define the matched state space.** Let \(\mathcal D_B\) be the class of
   order-\(B\) finite Dirichlet means and formulate (5.2) only for
   \(M\in\mathcal D_B\).
2. **Derive the exact update operator.** Compute the Laplace transform of the
   right-hand side of (5.2), with \(U,M\), and the gamma variable all
   integrated before any HCM or Stieltjes assertion is made.
3. **Search for a fractional-integral recursion.** Use the Euler--Beta
   integral and the Dirichlet-spline recursion to express the new transform
   as a positive operator acting on the old final transform or its Thorin
   kernel.
4. **Check the base and first induction step.** The base \(n=1\) is known.
   The passage \(n=1\to2\) must be proved without freezing the beta variable;
   this is the essential test.
5. **Track parameter-dependent measures.** If a Bernstein representing
   measure is introduced, retain its dependence on all outer variables.
   It cannot be treated as a fixed measure during the next integration.
6. **Connect to Route 1.** Rewrite the update in terms of
   \(N_{\rho,B,F}=M^q/T_{\rho,B}\). A compatible recursion for these mixing
   variables would prove R1-DM by induction on the number of atoms of \(F\).
7. **Close the induction and weak limit.** Only after the finite-atom
   recursion is rigorous should one pass to arbitrary finite gamma
   convolutions and then arbitrary GGC laws.

**Execution update (2026-09-05).**  WIP-5.11 now proves the complete
two-rate first-update theorem in the special but nontrivial case
\(B=1,\ q=2\):

\[
\left(G_p/b_1+G_{1-p}/b_2\right)^2\in GGC
\qquad(0<p<1,\ b_1,b_2>0).
\]

The proof uses an exact true-lobe comparison after the full Beta average.
At that point the Route-5 obligation ceased to be a rate-contrast problem
in this benchmark and became a third-rate or shape-changing update.
WIP-5.26 has since completed the arbitrary finite-rate update at
\(B=1,\ q=2\), and WIP-5.29 propagates it to every \(0<B\le1\).
WIP-5.30 closes the entire two-rate \(q=2\) problem for arbitrary positive
shapes and rates; WIP-5.27--WIP-5.28 are independent proofs of important
slices.  The remaining Route-5 target is therefore a multirate update for
\(q=2,\ B>1\), or a general update with \(q\ne2\).

WIP-5.12 carries the same Möbius comparison onto the first cut for an
arbitrary finite total-shape-one Dirichlet rate mean, conditional on an
explicit support-nesting inequality.  It also proves that this inequality
can fail already for three rates, that a single scalar centering cannot
simultaneously cancel all spectral cuts, and that a generic
positive-definite-kernel aggregation argument is unavailable.  These are
obstructions to three direct proof mechanisms, not counterexamples to GGC.
WIP-5.13 then proves a strictly larger algebraic lobe-mass condition which
does not require support nesting and covers the exact three-rate example
from WIP-5.12.  WIP-5.14 carries out the weighted-centering alternative
for arbitrary finite \(n\): the
multicut phase term has a strictly favorable derivative, and the unknown
sign reduces to one residual covariance and yields a global multirate
sufficient cone.  WIP-5.15 makes that cone directly checkable through an
interlacing critical polynomial, endpoint envelopes, and explicit
rate-contrast inequalities.  At that stage WIP-5.16 reduced the
unresolved three-rate central range to finitely many cumulative prefixes
and identified the exact second-prefix inequality (5.164); it also proves
phase-aware and last-cut-suppression cones.  WIP-5.17 shows why the
first-cut Möbius reflection does
not copy verbatim to this second prefix: the upper exterior cancellation is
coupled and its local reflected kernel has no fixed sign.  WIP-5.18 then
uses monotone zero-temperature mass ratios to control both rising prefixes
in a new complete three-rate parameter cone, with exact and root-free
tests.  WIP-5.19 regularizes the coupled upper tail and constructs an
adjacent-cut transport which proves a second, genuinely different
three-rate cone and the exact example (5.199).  WIP-5.20 now supplies an
arbitrary finite-cut phase-capacity theorem: a peak-gap hypothesis leaves
at most one active cut, while a prefix-normalized reverse-order covariance
propagates a single zero-temperature check to every \(t>0\).  In three
rates it improves the WIP-5.18 threshold to
\(g_{2,*}\le\omega_{1,0}\Delta\).  It also proves that this certificate has
open regions arbitrarily close to the equal-rate diagonal along every
fixed gap profile, but not a full diagonal neighborhood when gap ratios
degenerate.

WIP-5.21 solves the optimization problem left in (5.193): the exact
transport supremum is determined by a quadratic, a scaled-AM--GM envelope
is strictly better than (5.193), and the zero-temperature adjacent mass
average is strictly better still.  The resulting hierarchy gives the exact
GGC examples (5.228) and (5.231), with (5.231) lying in the average cone
but outside the exact pointwise-supremum cone.  WIP-5.22 then retains all
lower-support positive mass.  Its endpoint derivative (5.234), regularized
upper-tail identity (5.238), and explicit cone (5.240) strictly enlarge
the old WIP-5.18 mass test; the existing law (5.199) is an exact witness.
A rational curvature calculation also rules out a global one-step
Jensen/chord estimate for the layer-cake profile.

WIP-5.23 removes the main structural restriction in WIP-5.20.  The full
lower-triangular capacities
\[
\mathfrak C_j(t)=\frac{P(t)+H_j(t)}{T_j(t)}
\]
are strictly increasing and protect every active rising root separately.
Thus \(g_{j,*}\le\mathfrak C_j(0)\) proves the arbitrary finite-rate
square theorem without a peak-gap or one-active-cut hypothesis.  The
four-rate law (5.250) satisfies the new parameter cone, violates
\(g_{3,*}\le\delta_3\), and has two cuts simultaneously active for small
positive \(t\), so the enlargement is strict on the actual phase
trajectory.

WIP-5.25 settles the endpoint question left by WIP-5.22:
\[
\mathcal F(x)>0\qquad(B<x<C),\qquad
\mathcal F(r_*)=F_{\rm full}(r_*)
\]
without assuming \(c_M\ge0\).  The proof conditions on the aggregate
lower-rate Dirichlet mean, invokes the complete two-rate true-lobe theorem,
and uses two exact covariance inequalities to preserve strict positivity
under mixing.  Consequently \(c_M\ge0\) alone controls the entire second
rising prefix; the same unweighted endpoint statement holds on the last
cut for every finite total-shape-one Dirichlet mean.

WIP-5.26 applies the same conditioning simultaneously to the lower and
upper blocks at every cut.  After tilting the independent block means by
the conditional density, the only mixing remainder becomes a covariance
of two functions that are coordinatewise increasing in the same order.
This proves the complete finite theorem
\[
\boxed{
\left(\sum_{i=1}^nG_{\beta_i}^{(i)}/b_i\right)^2\in GGC
\qquad\text{whenever}\qquad
\beta_i>0,\quad\sum_i\beta_i=1.
}
\]
An unweighted all-cut prefix theorem is lifted back to every Gaussian
weight by integration by parts.  Thus no total-shape-one multirate prefix
remains open; WIP-5.12--WIP-5.23 retain value as independent mechanisms,
explicit certificates, and obstruction analyses.

WIP-5.24 advances the shape-changing branch independently.  It gives an
exact averaged phase-kernel criterion for every two-rate square with
\(0<B\le2\), and proves that the naive
\(M^2\in HM_{B/2}\) invariant fails for every nondegenerate unequal-shape
affine beta mean and for all unequal-rate models with \(0<B<2\).
WIP-5.27 then carries its integer argument through a fractional Abel
inversion and proves the sharp statement
\[
M^2\in HM_k\iff k\ge1,\qquad
\left(G_k^{(1)}/b_1+G_k^{(2)}/b_2\right)^2\in GGC
\quad(k\ge1).
\]
WIP-5.28 separately evaluates the complete boundary phase at total shape
two and proves
\[
\left(G_a^{(1)}/b_1+G_{2-a}^{(2)}/b_2\right)^2\in GGC
\qquad(0<a<2).
\]
WIP-5.29 then proves a general downward-total-shape propagation lemma.
WIP-5.30 supplies the missing shape-changing mechanism: the exact
Gauss-hypergeometric logarithmic derivative gives a finite Thorin measure
for \(G_{B/2}M^2\), identifies \(M^2\) as an order-\(B/2\) Dirichlet mean,
and proves
\[
\left(G_a^{(1)}/b_1+G_c^{(2)}/b_2\right)^2\in GGC
\qquad(a,c,b_1,b_2>0).
\]
WIP-5.31 proves at the same time that the pointwise phase-kernel shortcut
fails for every \(0<B\le2\); positivity appears only after the exact beta
average.  Thus the next targets are a three-or-more-rate extension at
\(q=2,\ B>1\), and the two-rate problem for \(q\ne2\).

WIP-5.32 has now computed the exact third-atom conditional Thorin measure.
After the outer Dirichlet mean is integrated, its log-derivative is a
posterior quotient, not the average of those measures.  Strict Jensen,
small-\(s\) concavity, explicit cumulant corrections, and a mismatch of
Dirichlet orders rule out the literal positive generalized-Stieltjes or
barycentric recursion.  These are proof-method obstructions, not a failure
of GGC membership.

WIP-5.33 gives the complementary global reduction: the three-rate square
transform is an Appell \(F_1\) function evaluated on a correlated complex
one-dimensional curve.  A negative fourth-order mixed coefficient proves
that, for unequal shapes, the raw Lauricella logarithm cannot possess the
fixed positive multivariate Markov representation suggested by WIP-5.30.
The active target is therefore the phase of the physical Appell curve (or
the equivalent posterior quotient), not positivity in independent
Lauricella variables.

WIP-5.34 and WIP-5.35 now supply two exact normalization theorems with
three genuinely distinct scales. The first proves
\[
(rG_1+dG_1'+lG_1'')^2\in GGC
\]
for all positive \(l,d,r\), with an explicit rate-form Thorin measure of
mass \(3/2\). The second proves
\[
(rG_a+dG_b+lG_c)^2\in GGC,
\qquad a+b+c=2,\quad0<a,b,c\le1,
\]
again for all positive scales, using the order-two Markov--Krein Cauchy
transform and a Möbius comparison; its auxiliary Thorin measure has mass
one. WIP-5.37 removes the coordinatewise restriction and proves the
three-rate total-shape-two theorem for every positive shape vector.
Hadamard finite parts and reciprocal Dirichlet duality identify the
Thorin atom when one coordinate exceeds one. WIP-5.36 identifies the
exact physical-curve target below total shape two: for
\(0<a+b+c<2\), membership of the sufficient auxiliary factor
\(G_kM^2\) is equivalent to monotonic decrease of the Abel ratio
\(B_k(x)/A_k(x)\) on both sides of the middle knot, together with the
one-sided nonnegative phase-jump condition in (5.396).  WIP-5.38 proves
all endpoint and middle-knot jumps have the correct sign, identifies their
possible Thorin atoms, and proves punctured-knot monotonicity when the
middle shape is below \(k\).  WIP-5.39 then conditions the projective odds
on one beta coordinate.  A two-node Abel Wronskian and a monotone posterior
covariance prove both complete interval interiors whenever the shapes at
the two extreme scales are at most one.  This closes all coordinatewise-
at-most-one vectors in \(1<B<2\), and also permits the unique shape above
one at the middle scale.  The configurations with that unique large shape
at an extreme scale remain open.

The remaining Route-5 square targets include three rates away from total
shapes \(1,2\) and the isolated shape-\((1,1,1)\) total-three slice, as
well as supports of four or more rates; the two-rate problem is completely
closed. For \(q\ne2\), even the two-rate family remains active.

### Success and stop criteria

- **Success:** construct a positive transform-level or
  Dirichlet-mean-level operator implementing (5.2).
- **Decisive failure:** failure already at \(n=1\to2\), certified by Route 2
  or Route 3, decides the relevant parameter case.
- **Stop condition:** if the induction requires pointwise HCM of a bounded
  nondegenerate beta-affine Laplace transform, it has reproduced the false
  step in the audited 2026 proof and must be abandoned.

## Ranked route 6: rational powers and Mellin--Barnes factorization

**Estimated feasibility: low as a complete proof route. Status: deferred,
outside the current active goal.**

### Mellin target

For the two-gamma model

\[
X=c_1G_{\beta_1}+c_2G_{\beta_2},
\qquad
B=\beta_1+\beta_2,
\tag{6.1}
\]

beta--gamma algebra gives, throughout its initial strip of convergence,

\[
\mathbb E[X^z]
=
\frac{\Gamma(B+z)}{\Gamma(B)}c_2^z
{}_2F_1\!\left(
-z,\beta_1;B;1-\frac{c_1}{c_2}
\right).
\tag{6.2}
\]

Consequently,

\[
\mathbb E[(X^q)^z]
=
\frac{\Gamma(B+qz)}{\Gamma(B)}c_2^{qz}
{}_2F_1\!\left(
-qz,\beta_1;B;1-\frac{c_1}{c_2}
\right).
\tag{6.3}
\]

For integer \(q=m\), Gauss multiplication supplies the exact factorization

\[
G_B^m
\overset d=
m^m\prod_{k=0}^{m-1}G_{(B+k)/m},
\tag{6.4}
\]

with independent gamma factors on the right. For rational \(q=m/\ell\), the
candidate tools are gamma multiplication, Barnes integrals, and Barnes-beta
laws.

The route is not complete merely when (6.3) has been factorized. Its final
target must still be one of the exact GGC certificates:

- a product of independent factors already proved to be GGC;
- a positive Thorin/Stieltjes density obtained from a boundary jump;
- or a positive Bernstein measure proving the HCM condition.

### Attempt blueprint

1. **Fix the Mellin strip.** Derive (6.2)--(6.3) from the beta integral,
   specify the maximal strip in which the expectation exists, and only then
   continue meromorphically.
2. **Separate the gamma-power factor.** Apply Gauss multiplication for
   integer \(q\), then its Barnes analogue for rational \(q=m/\ell\), with
   every normalizing constant checked at \(z=0\).
3. **Analyze the hypergeometric remainder.** Seek a Barnes-beta or positive
   gamma-ratio representation of the \({}_2F_1\) factor. Check pole/zero
   interlacing and positivity of all proposed parameters.
4. **Connect Mellin data to an additive GGC criterion.** Use the resulting
   Barnes integral to compute either the negative-axis boundary values of
   \(g_q=-\psi_q'/\psi_q\) from Route 2 or the KL inverse from Route 4.
   Mellin factorization by itself is not a GGC proof.
5. **Begin with explicit exponents.** Treat \(q=2\), then \(q=3/2\), in the
   two-gamma benchmark. Determine which special functions simplify and
   whether their product formula has a positive measure.
6. **Use density of rational powers only at the end.** If every rational
   \(q>1\) is proved uniformly for every finite gamma convolution, then
   \(q_j\to q\), continuous mapping, and weak closure give all real
   \(q>1\).

### Success and stop criteria

- **Success:** obtain a positive factorization or boundary-density formula
  that directly implies one of the exact GGC criteria.
- **Decisive failure:** a rigorously located forbidden zero or a signed
  boundary density can disprove GGC membership for the chosen law.
- **Stop condition:** if the Barnes representation generates formulas but
  no sign-controlling structure, retain it only as a computational tool for
  Routes 2--4. Do not infer additive infinite divisibility from a formal
  Mellin product.
- **Activation condition:** promote this route into the active program only
  when an earlier route identifies a special-function quotient or boundary
  term for which Mellin--Barnes analysis supplies missing sign information.

## Ranked route 7: local power flow, size bias, and Palm calculus

**Estimated feasibility: lowest as a stand-alone proof route, but potentially
high leverage. Status: deferred, outside the current active goal.**

### Local-flow target

Put

\[
Y_t=X^{e^t},
\qquad t\ge0.
\tag{7.1}
\]

If \(f_t\) is the density of \(Y_t\), the deterministic power flow satisfies

\[
\partial_t f_t(y)
=-\partial_y\bigl(y\log y\,f_t(y)\bigr).
\tag{7.2}
\]

Its Laplace transform therefore has initial variation

\[
\left.\partial_t\mathbb E[e^{-sY_t}]\right|_{t=0}
=-s\,\mathbb E[X\log X\,e^{-sX}].
\tag{7.3}
\]

The ambitious target is to prove that the cone of Thorin--Bernstein
exponents, or equivalently the cone of Stieltjes log-derivatives, is forward
invariant under (7.2). A **uniform** interval

\[
[1,1+\varepsilon]\subset\mathcal Q
\tag{7.4}
\]

would imply the full conjecture by the multiplicative semigroup in (3.6).
Even a universal sequence \(q_j\downarrow1\) contained in \(\mathcal Q\)
would suffice by taking suitable integer powers and a weak limit.

### Size-bias/Palm reformulation

Assume \(0<\mathbb E[Y]<\infty\), and let \(Y^*\) denote the size-biased
version of \(Y\). Since

\[
\mathbb E[e^{-sY^*}]
=\frac{-\psi_Y'(s)}{\mathbb E[Y]}
=\psi_Y(s)\frac{g_Y(s)}{\mathbb E[Y]},
\tag{7.5}
\]

the GGC target can be reformulated as the construction of an independent
residual \(R\) such that

\[
Y^*\overset d=Y+R,
\qquad
R\ \text{is a mixture of exponentials, possibly with an atom at }0.
\tag{7.6}
\]

For \(Y=X^q\), its size-biased law is

\[
Y^*\overset d=(X^{[q]})^q,
\tag{7.7}
\]

where \(X^{[q]}\) denotes \(X\) biased by \(x^q\). Gamma-process Palm
calculus may describe integer-order biases by adding jumps; the unresolved
issue is to turn the nonlinear difference after taking the power into the
independent exponential-mixture residual required by (7.6).

### Attempt blueprint

1. **Prove the semigroup amplification lemma.** Establish rigorously that
   \(\mathcal Q\) is multiplicatively and sequentially closed, and that a
   universal sequence \(q_j\downarrow1\) suffices for all powers.
2. **Differentiate the exact criterion.** Compute the first and, if needed,
   second variations of
   \[
   g_t(s)=-\partial_s\log\mathbb E[e^{-sY_t}]
   \tag{7.8}
   \]
   at \(t=0\) for a finite gamma convolution.
3. **Identify the correct tangent cone.** Determine what it means for the
   variation of a Stieltjes function to remain in the Stieltjes cone. Treat
   an atomic initial Thorin measure distributionally rather than assuming
   that it is an interior point.
4. **Seek a uniform invariant.** A local interval depending on the
   particular law \(X\) does not prove (C1); the estimate must be uniform
   over the GGC class, or over a dense finite-gamma class with a stable
   limiting argument.
5. **Prove the size-bias characterization.** Derive (7.5)--(7.6) from the
   Stieltjes representation of \(g_Y\), including the converse and the atom
   at zero.
6. **Apply Palm calculus first to integer powers.** Compute the law of the
   \(q\)-biased finite gamma convolution for integer \(q\), and test whether
   a coupling can make the residual in (7.6) independent.
7. **Investigate fractional bias only after the integer case.** Possible
   tools are fractional Palm identities, stable tilting from Route 1, and
   Poisson--Kingman changes of measure.

### Success and stop criteria

- **Success:** prove a uniform forward-invariance theorem for the Stieltjes
  cone, or explicitly construct the exponential-mixture residual in (7.6)
  for arbitrary finite gamma convolutions.
- **Decisive failure:** a first variation lying strictly outside a necessary
  tangent cone, or failure of the residual to be an exponential mixture,
  yields an exact obstruction for the proposed local theorem.
- **Stop condition:** ordinary continuity at \(q=1\) is insufficient because
  finite atomic Thorin measures lie on the boundary of the relevant cones.
  Likewise, existence of some independent nonnegative residual in (7.6)
  proves at most infinite divisibility; the residual must be an
  exponential mixture to prove GGC.
- **Activation condition:** promote this route only after Routes 1--3 expose
  a tractable tangent-cone formula, a stable change of measure, or a Palm
  coupling with a plausible independence mechanism.

## Parallel exact falsification gate

This gate is not a sixth positive-proof route. It runs alongside all five
routes to prevent a long attempt to prove a false statement.

Use the smallest unresolved family

\[
X=c_1G_{\beta_1}+c_2G_{\beta_2},
\qquad
0<\beta_1,\beta_2<1,
\qquad c_1\ne c_2,
\tag{F.1}
\]

and concentrate first on \(1<q\le2\), especially \(q\downarrow1\). Compute
moments from (3.5), cumulants exactly, and the first Hankel and shifted-Hankel
determinants from (3.3). Also test the Volterra kernel and boundary phase.

- A numerical sign is only a search signal.
- A negative sign counts only after exact symbolic simplification, analytic
  upper/lower bounds, or outward-rounded interval certification.
- Positive results at finitely many orders do not prove the conjecture.
- Every failed necessary condition should be converted immediately into a
  short analytic counterexample certificate.

## Recommended execution order

The execution order is not exactly the ranking order, because several
routes share lemmas and some should run in parallel.

### Stage 0: lock the common infrastructure

1. Prove and ledger the finite-gamma reduction (0.1).
2. Prove both Dirichlet representations (0.3)--(0.4), with constants.
3. Record the precise HCM-Laplace and Thorin/Stieltjes equivalences.
4. Prove the multiplicative-semigroup and weak-limit properties of
   \(\mathcal Q\) in (3.6).
5. Fix one notation for rates, scales, Thorin measures, and gamma variables.

### Stage 1: validate the structural route

1. Prove (1.1)--(1.4).
2. Recover the one-gamma case.
3. Compute (1.5) for a two-atom Dirichlet base; at \(q=3/2\), use the exact
   Wright--beta formula (1.90) of WIP-1.14 and the half-shape
   Wright--Bessel boundary formula (1.107)--(1.113) of WIP-1.15.
   WIP-1.16 proves the two first \(3\times3\) gates at both exact contrast
   endpoints, and WIP-1.17 proves phase monotonicity uniformly for all
   sufficiently small contrasts.  WIP-1.18 rules out the
   \(N_\theta\in HM_{2/3}\) shortcut, and WIP-1.19 supplies the exact
   log-convolution/PDE/current formulation.  The remaining analytic
   obligation is arbitrary-contrast phase monotonicity through a genuine
   boundary-compensation estimate.
4. Search for the Markov--Krein representation (1.6), without assuming that
   the residual mean is itself ID or GGC.

This stage determines whether Route 1 contains genuinely new structure or
only restates the conjecture.

### Stage 2: analyze the same two-gamma model by an exact analytic criterion

Run Route 2 in parallel with the falsification gate:

1. derive \(f_Y\), \(g_q\), and the Volterra equation;
2. retain the half-shape model (2.9) and \(q=2\) as a normalization check;
   WIP-5.30 has now closed the entire two-rate square family;
3. prove complete monotonicity of \(k_q\), or identify an exact sign failure;
4. for the active \(q=3/2\) two-rate problem, test the Wright--beta quotient
   (1.90), using the WIP-1.17 Kummer--Wronskian theorem as the equal-rate
   neighborhood and its separated-scale kernel obstruction to rule out an
   overstrong pointwise strategy.  WIP-1.18 also rules out the
   gamma--\(HM_{2/3}\) residual shortcut.  Start the all-contrast analysis
   from the exact convolution current (1.160) of WIP-1.19 and seek an Abel
   boundary compensation, rather than applying naive separation integration
   by parts; for the \(q=2\) three-rate problem with
   \(B>1\), derive the
   boundary phase along the correlated Appell curve (5.349), rather than
   seeking a positive kernel in independent Lauricella variables. Use
   WIP-5.34 and the completed total-shape-two theorem WIP-5.35/WIP-5.37
   as exact normalization templates, and use the piecewise Abel-ratio and
   knot-jump equivalence (5.396) in the unresolved range below \(B=2\).
   WIP-5.38 has closed every node jump.  WIP-5.39 closes both complete
   interval interiors when the two extreme-scale shapes are at most one,
   including the formerly uncontrolled \(b\ge B/2\) finite-part case in
   that parameter range.  Focus next on the remaining configuration in
   which the unique shape above one is carried by an extreme scale.

The output must be either a Thorin measure, a reusable positive-kernel
lemma, or a rigorous obstruction.

### Stage 3: launch the all-order discrete route

1. Prove the determinate converse behind Route 3.
2. WIP-3.10 already supplies \(\kappa_1,\ldots,\kappa_4\) and both
   \(2\times2\) gates for every finite gamma convolution square. Generate
   \(\kappa_5,\kappa_6\) next and attack the first \(3\times3\)
   unshifted and shifted Hankel matrices.  WIP-1.16 has done this for the
   half-gamma \(q=3/2\) model at equal rates and infinite contrast; the
   interior affine-arcsine parameter interval remains to be certified.
   Its exact two-point witness shows that no arbitrary-multiplier theorem
   can replace the target-family calculation.
3. Seek a partition or total-positivity proof of all Hankel inequalities.
4. Feed any candidate representing measure back into Route 1.

Route 3 should not wait for Routes 1--2 to finish, but substantial symbolic
work should begin only after the normalization and benchmark family are
fixed.

### Stage 4: attempt final averaged HCM

1. Establish (4.1)--(4.3) rigorously for the benchmark family.
2. Derive the candidate KL inverse.
3. Look for positivity using whatever density, Thorin, or Dirichlet
   structure Stages 1--3 have uncovered.

This route is attempted at the final level only. No pointwise inner-kernel
substitute is permitted.

### Stage 5: attempt the recursion

Attempt Route 5 after Route 1 has clarified the correct state space and
Route 2 or Route 4 has produced a positive invariant. First prove the
\(n=1\to2\) update, then formulate the general induction. If the representing
measure depends on outer parameters, carry that dependence through the full
integral.  The total-shape-one square update \(n=1\to2\) is now complete by
WIP-5.11; WIP-5.12--5.17 reduce the \(n=2\to3\) update to the exact
second-prefix obligation (5.164) and provide several explicit parameter
cones in which it is already controlled or suppressed.  WIP-5.18 combines
zero-temperature first- and second-prefix bounds into a complete sufficient
theorem for a directly checkable three-rate cone.
WIP-5.19 supplies a complementary phase-coupled adjacent-cut transport and
an exact three-rate certificate outside the golden-ratio, mean,
first-shape, and last-cut-suppression cones.  WIP-5.20 extends the
zero-temperature mechanism to arbitrarily many cuts through increasing
prefix-normalized phase capacities and improves the three-rate threshold.
WIP-5.21 replaces the coarse adjacent-cut envelope first by an exact
quadratic maximum and then by its strictly smaller zero-temperature
average, producing two further exact GGC examples.  WIP-5.22 retains the
full lower buffer and regularized upper tail, producing still wider
second-prefix cones and identifying a precise curvature obstruction to a
naive Jensen closure.  WIP-5.23 removes WIP-5.20's peak-gap condition
altogether: increasing full capacities protect several simultaneous active
cuts, as witnessed by the exact four-rate example (5.250).  WIP-5.25 uses
conditional two-rate true-lobe positivity to settle the WIP-5.22 endpoint
question and its arbitrary finite last-cut analogue.  On the
shape-changing branch, WIP-5.24 supplies the exact two-rate phase kernel
for \(0<B\le2\) and identifies the endpoint obstruction that rules out
the direct \(HM_{B/2}\) invariant for all nondegenerate asymmetric affine
beta means and throughout \(0<B<2\) at unequal rates.  WIP-5.26 then
conditions on both Dirichlet
blocks at an arbitrary cut, proves the all-cut unweighted balance by a
product-association covariance, and lifts it through the Gaussian weight.
It therefore completes the square problem for every finite gamma
convolution of total shape one, without any rate or shape-vector
restriction beyond positivity and unit total shape.  WIP-5.27 adds the
sharp fractional result \(M^2\in HM_k\iff k\ge1\) for symmetric affine
beta means and proves the associated two-rate square theorem for every
real \(k\ge1\).  WIP-5.28 proves the complementary total-shape-two
two-rate theorem for arbitrary positive summand shapes by an explicit
canonical phase computation.  WIP-5.29 propagates arbitrary-support
fixed-power results downward in total shape, and WIP-5.30 uses a
Dyachenko--Karp hypergeometric Markov measure to prove the two-rate square
theorem for every positive shape pair and rate pair.  Its explicit
Thorin measure is for the gamma--beta factor before the final independent
product.  WIP-5.31 records why this success cannot be recast as pointwise
phase-kernel positivity.  WIP-5.32 computes the exact conditional Thorin
update and proves that simple measure averaging and the literal
generalized-Stieltjes/barycentric recursion fail.  WIP-5.33 reduces the
three-rate transform to Appell \(F_1\), and rules out the naive fixed
positive multivariate Markov kernel for unequal shapes. WIP-5.34 proves
the complete three-scale shape-\((1,1,1)\) theorem and gives its explicit
mass-\(3/2\) Thorin measure. WIP-5.35 proves the total-shape-two,
coordinatewise-at-most-one slice by a different Markov--Krein/Möbius
argument, and WIP-5.37 completes total shape two for every positive
three-coordinate shape vector using finite parts and reciprocal duality.
WIP-5.36 converts the physical Appell phase below total shape two into
the piecewise Abel-ratio and knot-jump criterion (5.396). WIP-5.38 closes
every node jump, identifies all possible atomic phase masses, and closes
the two punctured knot neighborhoods when the middle shape is below half
the total shape.  Its global projective rewrite turns the remaining ratio
into signed negative-moment odds for hyperbolically transformed Dirichlet
knots.  WIP-5.39 carries out the proposed conditioning and outer
one-variable covariance argument: it proves full-interval monotonicity for
arbitrary rates when the shapes at both extreme scales are at most one.
The next recursion attempt should determine whether the same posterior
mechanism can be renormalized when one extreme-scale shape is above one;
it must retain the physical-curve cancellations.

Completion of Stages 0--5 is the present **active goal**. It does not require
starting Routes 6--7.  Their activation conditions are only reasons for a
future explicit update of this file; Routes 6--7 remain inactive throughout
the current goal.

### Deferred stage 6: use Mellin--Barnes when a sign target is available

Keep the exact Mellin formulas ready as supporting infrastructure. Activate
Route 6 if Routes 2 or 4 reduce the problem to the sign of a specific
special-function quotient, cut jump, or KL transform. Begin with rational
\(q\) in the two-gamma model; do not start a general Barnes expansion without
an identified GGC recognition target.

### Deferred stage 7: investigate local invariance or a Palm coupling

Activate Route 7 only if the preceding work provides either a usable tangent
description of the Stieltjes cone or a stable/Gamma coupling that could
produce the independent residual in (7.6). Its first deliverable must be a
uniform statement over the relevant GGC class, not a law-dependent
neighborhood of \(q=1\).

### Decision order

At every stage apply the following decision rule:

1. an exact negative necessary condition takes priority and becomes a
   counterexample project;
2. a positive two-gamma result must identify the mechanism that can survive
   arbitrary shapes, rates, and summand number;
3. a route that succeeds only through a stronger false pointwise statement
   is stopped;
4. once one route constructs the Thorin measure, the other routes become
   independent verification rather than additional proof obligations;
5. after the finite-gamma result, complete (C1) by continuous mapping and
   weak closure, with drift and endpoint cases stated explicitly.
