---
title: "Bondesson (1992): GGC/HCM foundational infrastructure for the power problem"
source: "../literature/Bondesson.pdf"
source_type: "research monograph"
status: "audited"
last_verified: "2026-09-05"
source_sha256: "835E73FD3EA8C46F31EF7513ABABE9EB0E43BFC0E339CABBAC03173DA2857F3A"
topics:
  - generalized gamma convolutions
  - Thorin measures
  - hyperbolic complete monotonicity
  - Stieltjes functions
  - Loewner matrices
  - PF-infinity distributions
  - Bondesson class
---

# Bondesson (1992): theorem-level research note

Primary source: [Bondesson.pdf](../literature/Bondesson.pdf).

Bibliographic identity: Lennart Bondesson, *Generalized Gamma Convolutions
and Related Classes of Distributions and Densities*, Lecture Notes in
Statistics 76, Springer, 1992, DOI 10.1007/978-1-4612-2948-3.

In the main text, the printed page number is the PDF page number minus nine.

## 0. Reading contract

- **[SOURCE]** is a theorem, definition, or argument stated in the monograph.
- **[PROJECT CONNECTION]** explains how a source result interfaces with a
  current proof route; it is not an assertion by Bondesson.
- **[PROJECT LEMMA]** is a deduction already justified in this repository.
- **[CANDIDATE]** is a precise proposed target, not a proved theorem.
- **[CAUTION]** records an assumption or distinction that must survive reuse.

The monograph writes the moment generating function

\[
\phi(z)=\mathbb E[e^{zX}],
\qquad z\le 0,
\]

and analytically continues it to \(\mathbb C\setminus[0,\infty)\).  The
project usually writes the Laplace transform

\[
L(s)=\mathbb E[e^{-sX}]=\phi(-s),
\]

whose cut is \(( -\infty,0]\).  Consequently, a boundary-value statement
must be translated by \(z=-s\); the side of the cut and the sign of the
argument change.  In particular, for the upper boundary value of the
Laplace transform the project convention

\[
\eta(t)=-\pi^{-1}\arg L(-t+i0)
\]

matches Bondesson's increasing cumulative Thorin phase.

## 1. Executive assessment

This source is directly useful, not merely general background.  Its most
actionable additions to the present project are:

1. a Loewner-matrix characterization of GGC membership (Theorem 3.4.2);
2. a real hyperbolic divided-difference characterization of Stieltjes
   functions (Theorem 6.1.3);
3. a log-concave exponential-mixing sufficient condition for GGC
   (Theorem 4.2.1);
4. the actual induction behind the known \(PF_\infty\) power theorem
   (Theorem 6.2.7);
5. the decomposition of the GGC test into Bondesson-class membership plus
   monotonicity of a spectral density (Theorems 9.1.2--9.1.4).

The route map is:

| Source mechanism | Current use | Priority |
|---|---|---:|
| Stieltjes log derivative and boundary inversion | Route 2 | high |
| Loewner matrices | Routes 2--3 and exact falsification | high |
| \(PF_\infty\) convolution induction | Route 5 | high |
| log-concave exponential mixing | low-total-shape part of Route 2 | medium |
| HCM recognition and weighting | Routes 4--5 | medium |
| Bondesson class \(BO\) as an intermediate class | Route 2 | medium |

## 2. GGC representations and exact recognition criteria

### 2.1 Thorin and Levy representations

**[SOURCE: Definition, printed p. 29 / PDF p. 38]** A GGC has the mgf

\[
\phi(z)=
\exp\left\{
az+\int_{(0,\infty)}\log\frac{t}{t-z}\,U(dt)
\right\},
\tag{2.1}
\]

with \(a\ge0\) and an admissible Thorin measure \(U\).  Equivalently,

\[
\frac{\phi'(z)}{\phi(z)}
=a+\int_{(0,\infty)}\frac{U(dt)}{t-z}.
\tag{2.2}
\]

In Laplace notation this becomes

\[
g(s):=-\frac{L'(s)}{L(s)}
=a+\int_{(0,\infty)}\frac{U(dt)}{s+t}.
\tag{2.3}
\]

Thus the exact Route 2 target is that \(g\) is a Stieltjes function, not
merely completely monotone.

**[SOURCE: Theorem 3.1.1, printed p. 30 / PDF p. 39]** A probability law on
\([0,\infty)\) is GGC if and only if it is infinitely divisible and its Levy
measure has a density \(\ell\) such that \(x\ell(x)\) is completely
monotone.  More precisely,

\[
x\ell(x)=\int_{(0,\infty)}e^{-xt}\,U(dt).
\tag{2.4}
\]

This is the Levy-density form of the same Route 2 recognition problem.

### 2.2 Pick, phase, and inversion criteria

**[SOURCE: Theorem 3.1.2, printed p. 32 / PDF p. 41]** GGC membership is
equivalent to analyticity and zero-freeness of \(\phi\) off the positive cut,
together with

\[
\Im\frac{\phi'(z)}{\phi(z)}\ge0,
\qquad \Im z>0.
\tag{2.5}
\]

**[SOURCE: Theorem 3.1.3, printed p. 33 / PDF p. 42]** Zero-freeness need
not be checked separately if one proves

\[
\Im\!\left(\phi'(z)\overline{\phi(z)}\right)\ge0,
\qquad \Im z>0.
\tag{2.6}
\]

The proof shows that this condition itself rules out zeros.

**[SOURCE: Theorem 3.1.4, printed pp. 33--34 / PDF pp. 42--43]** Under the
stated analytic continuation, nonzero boundary-value, differentiability, and
uniform asymptotic hypotheses, monotonicity of the boundary argument implies
GGC membership.  In Bondesson's mgf convention,

\[
U((0,t))=\frac1\pi\arg\phi(t+i0),
\qquad
U'(t)=\frac1\pi\Im\frac{\phi'(t+i0)}{\phi(t+i0)}
\tag{2.7}
\]

when the density exists.

**[CAUTION]** Boundary phase monotonicity without the analytic and
asymptotic hypotheses of Theorem 3.1.4 is not, by itself, a complete proof.

### 2.3 Weak closure with the canonical measure

**[SOURCE: Theorem 3.1.5, printed pp. 34--35 / PDF pp. 43--44]** After a
compactifying reweighting of \(U\) and the drift, weak convergence of GGC
laws is equivalent to vague convergence of their canonical measures, subject
to the endpoint condition excluding loss of mass at zero.  In particular,
GGC is weakly closed and is precisely the weak closure of finite gamma
convolutions.

**[PROJECT CONNECTION]** This is the exact source behind the finite-gamma
reduction.  A final limiting argument should cite this theorem rather than
say only that closure is "standard"; drift, defective limits, and endpoint
mass must be handled explicitly.

## 3. Two real-variable Stieltjes tests

### 3.1 Loewner matrices

**[SOURCE: Theorem 3.4.2, printed pp. 45--46 / PDF pp. 54--55]** Let
\(\phi\) be the mgf of a probability law on \([0,\infty)\) and put
\(h=\phi'/\phi\).  The law is GGC if and only if, for every
\(s_1,\ldots,s_n<0\), the matrix

\[
M_{ij}=
\begin{cases}
\displaystyle
\frac{h(s_i)-h(s_j)}{s_i-s_j},&i\ne j,\\[1.1ex]
h'(s_i),&i=j,
\end{cases}
\tag{3.1}
\]

is positive semidefinite.  The printed formula is equivalently congruent to
(3.1) after multiplication by the positive diagonal matrix
\(\operatorname{diag}(\phi(s_i))\).

Indeed, if (2.2) holds then

\[
M_{ij}=\int_{(0,\infty)}
\frac{U(dt)}{(t-s_i)(t-s_j)},
\tag{3.2}
\]

which displays positive semidefiniteness as a Gram representation.

**[PROJECT CONNECTION]** This gives a global finite-point alternative to the
cumulant Hankel gates in Route 3.  It does not require moment determinacy.
An exact negative principal minor at negative Laplace arguments would be a
rigorous counterexample; finitely many positive minors would still not prove
the theorem.

### 3.2 Hyperbolic divided differences

**[SOURCE: Theorem 6.1.3, printed p. 91 / PDF p. 100]** A locally integrable
function \(h\) on \((0,\infty)\) has a Stieltjes representation

\[
h(s)=a+\int_{[0,\infty)}\frac{U(dt)}{s+t},
\qquad a\ge0,quad U\ge0,
\tag{3.3}
\]

if and only if

\[
\liminf_{s\downarrow0}s h(s)\ge0
\tag{3.4}
\]

and, for every \(u>0\),

\[
w\longmapsto
H_u(w):=
\frac{v h(uv)-v^{-1}h(u/v)}{v-v^{-1}},
\qquad w=v+v^{-1},
\tag{3.5}
\]

is completely monotone in \(w\in(2,\infty)\).

**[PROJECT CONNECTION]** Set \(h=g_q=-L_q'/L_q\).  Then (3.4)--(3.5) are
an exact Route 2 criterion which avoids analytic continuation to the cut.
It is distinct from Route 4: Route 4 tests HCM of \(L_q\), whereas (3.5)
tests the Stieltjes property of its logarithmic derivative.

**[CANDIDATE B92-C1]** For the two-gamma benchmark, derive (3.5) directly
from the averaged kernel quotient for \(g_q\), and seek a positive Laplace
representation in \(w\).  Any attempt must average all beta/Dirichlet
parameters before asserting complete monotonicity.

## 4. Finite Thorin mass and gamma mixtures

**[SOURCE: Theorem 4.1.1, printed pp. 49--50 / PDF pp. 58--59]** If the
left extremity is zero and

\[
U((0,\infty))=\beta<\infty,
\]

then the density has the form

\[
f_X(x)=x^{\beta-1}h(x),
\qquad h\ \text{completely monotone},
\tag{4.1}
\]

and equivalently

\[
X\overset d=G_\beta Z,
\qquad G_\beta\perp Z.
\tag{4.2}
\]

For a finite gamma convolution the proof uses the standard beta--gamma
decomposition

\[
\sum_j c_jG_{\beta_j}^{(j)}
=G_\beta\sum_jc_jV_j,
\qquad
\beta=\sum_j\beta_j,
\tag{4.3}
\]

where \(V\) is Dirichlet and independent of \(G_\beta\).

**[CAUTION]** Bondesson explicitly says that Theorem 4.1.1 has no direct
converse.  A density of the form (4.1), or a fixed-shape gamma-mixture
factorization (4.2), does not by itself imply GGC.  The stronger
Dirichlet-mean/Markov--Krein recognition needed in Route 1 must come from a
separate theorem.

**[SOURCE: Theorem 4.1.4, printed pp. 51--52 / PDF pp. 60--61]** For a
nondegenerate GGC with left extremity zero, the total Thorin mass is recovered
from the exact density exponent at zero:

\[
U((0,\infty))=
\sup\left\{\alpha:
\lim_{x\downarrow0}\frac{f(x)}{x^{\alpha-1}}=0
\right\}.
\tag{4.4}
\]

This is a normalization check for the gamma shape in Routes 1--2.

## 5. HCM infrastructure and weighting

### 5.1 Density-level HCM

**[SOURCE: Section 5.1 and Theorems 5.1.1--5.1.3, printed pp. 68--72 /
PDF pp. 77--81]** The following statements are available:

\[
X,Y\in HCM_{\rm dens},\ X\perp Y
\Longrightarrow XY,\ X/Y\in HCM_{\rm dens},
\tag{5.1}
\]

\[
HCM_{\rm dens}\subset GGC,
\tag{5.2}
\]

and nondegenerate weak limits of HCM densities remain HCM.  The composition
rules imply

\[
X\in HCM_{\rm dens}
\Longrightarrow X^q\in HCM_{\rm dens},
\qquad |q|\ge1.
\tag{5.3}
\]

**[CAUTION]** An HCM density and an HCM Laplace transform are different
hypotheses.  Formula (5.3) is a density change-of-variable result, not a
general deterministic-power closure theorem for GGC.

### 5.2 Laplace-level HCM

**[SOURCE: Theorem 5.4.1, printed pp. 81--82 / PDF pp. 90--91; restated as
Theorem 6.1.1, printed p. 90 / PDF p. 99]** A function \(L\) with
\(L(0+)=1\) is the Laplace transform of a GGC if and only if \(L\) is HCM.
This is the recognition theorem used in Route 4.

**[SOURCE: Theorems 5.3.1--5.3.4, printed pp. 79--81 / PDF pp. 88--90]**
Bondesson's canonical HCM representation is exact and unique.  In particular,
for an HCM density \(f\), each hyperbolic section

\[
w\longmapsto f(uv)f(u/v),\qquad w=v+v^{-1},
\tag{5.4}
\]

is, after normalization, the Laplace transform of a GGC, which is stronger
than complete monotonicity alone.

**[PROJECT CONNECTION]** This may help identify the representing measures
in Route 4, but it applies only after HCM of the final density has actually
been proved.  It cannot justify fibrewise positivity before averaging.

### 5.3 Weighting a GGC density by a GGC Laplace transform

**[SOURCE: Theorem 6.2.4, printed pp. 94--95 / PDF pp. 103--104]** If \(f\)
is a GGC density and \(h\) is a GGC Laplace transform, then, when integrable,

\[
\frac{h(x)f(x)}{\int_0^\infty h(y)f(y)\,dy}
\tag{5.5}
\]

is again a GGC density.  A related corollary gives a positive integral
operator preserving HCM.

**[PROJECT CONNECTION]** This is the closure mechanism used by the
\(PF_\infty\) induction and is a plausible invariant for the shape-matched
Route 5 recursion.

## 6. Two sufficient criteria with direct power-problem relevance

### 6.1 Log-concavity of the exponential mixing rate

**[SOURCE: Theorem 4.2.1, printed pp. 53--54 / PDF pp. 62--63]** Suppose

\[
f(x)=\int_0^\infty t e^{-tx}m(t)\,dt
\tag{6.1}
\]

is a probability density.  If \(m\), or more generally
\(t\mapsto t m(t)\), is log-concave, then \(f\) is a GGC density.

The proof verifies the complex GGC criterion by symmetrizing an integral;
the sign follows from monotonicity of the logarithmic derivative of the
log-concave mixing function.

**[PROJECT CONNECTION]** When \(\rho B\le1\), the density of a powered finite
gamma convolution is completely monotone and hence is an exponential
mixture.  Theorem 4.2.1 turns the problem in this region into the concrete
sufficient target: recover the unique Bernstein mixing measure and prove
log-concavity of its rate density after multiplication by \(t\).

**[CANDIDATE B92-C2]** For the two-rate benchmark with \(\rho B\le1\), compute
the exponential mixing density exactly and test \(t m(t)\) for log-concavity.
Failure of log-concavity only kills this sufficient route; it is not evidence
against GGC membership.

### 6.2 The \(PF_\infty\) power theorem and its recursive mechanism

**[SOURCE: Example 3.2.2, printed p. 36 / PDF p. 45]** The
\(PF_\infty\) subclass consists of weak limits of convolutions of exponential
laws (with a possible deterministic shift); equivalently, its discrete
Thorin masses are integers.

**[SOURCE: Theorem 6.2.7, printed pp. 96--97 / PDF pp. 105--106]** If

\[
X\in PF_\infty,
\]

then

\[
X^q\in GGC,
\qquad q\ge1.
\tag{6.2}
\]

For a convolution of exponentials with distinct rates
\(t_1>\cdots>t_n\), the proof removes the smallest-rate factor.  Exponential
tilting turns the remaining density into that of an \((n-1)\)-fold
exponential convolution with shifted rates.  After the power change of
variables, the new density is a product of:

1. a generalized-gamma/HCM decreasing factor; and
2. an integral proportional to the cdf of the powered lower-dimensional
   GGC.

Theorem 6.2.4 then closes the induction.

**[PROJECT CONNECTION]** This is the historical prototype for Route 5.  The
specific research question is whether the ordinary integration produced by
an exponential summand can be replaced by a beta or Riemann--Liouville
fractional integral matching an arbitrary gamma shape.

**[CANDIDATE B92-C3]** Formulate and prove a fractional version of the
Theorem 6.2.7 update which preserves the final GGC density, with all beta
parameters integrated before any HCM claim.  Proving only pointwise HCM of
a frozen beta fibre is insufficient and is known to be too strong.

Immediately after Theorem 6.2.7, the monograph explicitly states that the
general implication

\[
X\in GGC\stackrel{?}{\Longrightarrow}X^q\in GGC,
\qquad q\ge1,
\]

remained unproved.  This is the direct historical predecessor of
Bondesson's 2015 Conjecture 1.

## 7. The Bondesson class as an intermediate target

Let \(BO\) denote the class called \(\mathcal B\) in the monograph.

**[SOURCE: Theorem 9.1.2, printed p. 138 / PDF p. 147]** A law is in \(BO\)
if and only if it is ID and its Levy density \(\ell\) itself is completely
monotone.

**[SOURCE: Theorems 9.1.3--9.1.4, printed pp. 138--140 / PDF pp. 147--149]**
The class has a canonical spectral measure \(Q\).  If
\(Q(dt)=q(t)dt\), then its boundary phase recovers \(q\); within \(BO\),

\[
X\in GGC
\quad\Longleftrightarrow\quad
q(t)\ \text{is nondecreasing}.
\tag{7.1}
\]

When (7.1) holds,

\[
q(t)=U((0,t)).
\tag{7.2}
\]

Thus one may split Route 2 into two exact stages:

\[
X^q\in BO
\quad+\quad
q_{X^q}(t)\uparrow
\quad\Longrightarrow\quad
X^q\in GGC.
\tag{7.3}
\]

**[CAUTION]** Membership in \(BO\) is only an intermediate result.  A
\(BO\) law need not be self-decomposable, and (7.3) still leaves the decisive
monotonicity problem.

## 8. Route-specific extraction

### Route 1: stable/Dirichlet factorization

- Theorem 4.1.1 validates the gamma-mixture form and the elementary
  finite-gamma beta--gamma decomposition.
- It does **not** give the converse Dirichlet-mean recognition theorem.
- Theorem 4.1.4 checks the proposed total Thorin mass.

### Route 2: log derivative, Levy density, and phase

- Use Theorem 3.1.1 for the completely monotone Levy kernel.
- Use Theorems 3.1.2--3.1.4 for complex and boundary-phase criteria.
- Add Theorem 6.1.3 as a purely real, exact Stieltjes alternative.
- Add Theorem 3.4.2 as a finite-point Loewner falsification/proof gate.
- Consider \(BO\) plus spectral monotonicity as a two-stage target.

### Route 3: cumulant Stieltjes moments

- Loewner positivity supplies a global criterion without moment
  determinacy.
- Expansions of Loewner matrices can generate derivative/Hankel necessary
  conditions, but a finite truncation remains only a gate.

### Route 4: averaged HCM

- Theorems 5.4.1/6.1.1 are the final recognition theorem.
- Theorem 5.3.4 describes stronger structure only after HCM is known.
- No fibrewise substitution for the final averaged HCM target is licensed.

### Route 5: beta--gamma recursion

- Theorem 6.2.4 is the main closure operator.
- Theorem 6.2.7 is the exact integer-shape induction to generalize.
- Arbitrary gamma shapes require a new fractional-integral preservation
  lemma; total positivity is not used in Bondesson's proof and cannot simply
  be asserted to fill this gap.

## 9. Audit warnings

1. Always translate the mgf/Laplace sign and the side of the branch cut.
2. Fixed-shape gamma mixtures are not automatically GGC.
3. HCM density and HCM Laplace transform are separate notions.
4. Theorem 6.2.1 requires one independent factor to have an HCM density; it
   is not the full \(GGC\times GGC\) theorem proved in 2015.
5. No independent-product theorem proves a deterministic square
   \(X^2=X\cdot X\), because the two factors there are identical, not
   independent.
6. Composition \(L(s^\alpha)\) concerns subordination and is not the
   deterministic map \(X\mapsto X^q\).
7. The discussion around Theorem 4.3.2 explicitly leaves regularity
   conditions imprecise; do not use it as a rigorous external lemma.
8. The 1992 status table predates the 2015 independent-product theorem.
9. Integer Thorin masses in \(PF_\infty\) do not automatically extend to
   noninteger gamma shapes.

## 10. Recommended immediate actions

1. Add the hyperbolic Stieltjes test (3.5) to the Route 2 benchmark family.
2. Add Loewner minors at negative arguments to the exact falsification gate.
3. Rewrite Theorem 6.2.7 as a standalone recursion lemma, then identify the
   precise fractional-integral statement needed for arbitrary shapes.
4. In the low-total-shape region, compute the exponential mixing density and
   test the log-concavity condition of Theorem 4.2.1.
5. Treat \(BO\) membership as a useful intermediate certificate, never as
   completion of the GGC proof.
