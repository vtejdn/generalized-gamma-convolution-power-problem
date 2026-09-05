# Cross-route infrastructure: global criteria and continuous powers

This module records exact recognition criteria, a failed sufficient
condition, and two reduction mechanisms shared by the active routes.
The stable identifiers `WIP-6.1`--`WIP-6.5` are a new ledger namespace;
they do **not** reactivate or rename the historical Route 6
(Mellin--Barnes factorization).

All results labelled **[PROJECT DERIVATION]** are proved below from the
stated external interfaces. No claim of priority or literature novelty is
made. A reduction or conditional theorem is not a proof of the GGC power
conjecture.

Throughout, \(G_a\) is gamma with shape \(a>0\) and unit rate. Gamma
variables in a sum are independent. For a finite gamma convolution write

\[
X=\sum_{i=1}^n\frac{G_{\beta_i}}{b_i},\qquad
B=\sum_i\beta_i,\qquad b_i,\beta_i>0,
\qquad q\ge1,\quad \rho=q^{-1}.
\tag{6.1}
\]

## Source interfaces

- Bondesson (1992), Theorem 3.1.1, printed p. 30 / PDF p. 39:
  GGC recognition through a completely monotone Levy kernel; equivalently
  its Laplace log derivative is Stieltjes. Theorem 3.1.5, printed
  pp. 34--35 / PDF pp. 43--44: weak closure. Theorem 3.4.2, printed
  pp. 45--46 / PDF pp. 54--55: Loewner matrices. Theorems 4.2.1 and
  6.2.7, printed pp. 53--54 and 96--97 / PDF pp. 62--63 and 105--106:
  the mixing sufficient condition and the exponential-peeling prototype.
  See the [audited Bondesson note](../notes/bondesson-1992-ggc-hcm-foundational-infrastructure.md).
- A. D. Sokal, *Real-variables characterization of generalized Stieltjes
  functions*, arXiv:0902.0065v2 (6 May 2009), Theorem 1 and equation (3),
  with the Hausdorff argument in equations (13)--(16).
  [Exact version](https://arxiv.org/html/0902.0065v2);
  [project source note](../notes/sokal-stieltjes-hausdorff-criterion.md).
- The finite-gamma density and gamma--Dirichlet decomposition are recorded
  in [WIP-0.1--0.3](00-foundations.md). The exact finite-mass
  gamma--Dirichlet recognition is
  [WIP-1.4](01-route1-stable-dirichlet-and-quadratic.md#wip-1-4).

<a id="wip-6-1"></a>
## WIP-6.1 — the global log-concavity mixing target is impossible here

**Status: [PROVED OBSTRUCTION TO A SUFFICIENT CRITERION; NOT A
COUNTEREXAMPLE TO GGC].**

Bondesson's Theorem 4.2.1 applies to a probability density

\[
f(y)=\int_0^\infty e^{-ty}\sigma(t)\,dt,
\qquad \sigma(t)=t m(t),\qquad
\int_0^\infty\frac{\sigma(t)}t\,dt=1,
\tag{6.2}
\]

when \(\sigma\) is log-concave; log-concavity of \(m\) is also sufficient,
because \(t m(t)\) is then log-concave. The following elementary restriction
on that hypothesis was absent from the initial source-screening candidate
B92-C2.

**[PROJECT DERIVATION: mixing lemma].** Let \(\sigma\) be a nonzero
nonnegative log-concave function on \((0,\infty)\), with
\(0<\int\sigma(t)t^{-1}dt<\infty\). Then

\[
\int_0^\infty t^j\sigma(t)\,dt<\infty
\qquad\text{for every integer }j\ge0.
\tag{6.3}
\]

**Proof.** The positive support of \(\sigma\) is an interval with nonempty
interior. On that interior set \(\ell=\log\sigma\), a finite concave
function. Choose two interior points \(u<v\) and put
\(m=[\ell(v)-\ell(u)]/(v-u)\). Concavity implies

\[
\ell(t)\le\ell(u)+(t-u)m\quad(t<u),\qquad
\ell(t)\le\ell(v)+(t-v)m\quad(t>v),
\tag{6.4}
\]

whenever \(t\) remains in the positive support. The first bound makes
\(\sigma\) bounded near zero. If the right endpoint of its support is
finite, the second bound and local continuity give boundedness on that
support, hence (6.3).

If its right endpoint is infinite, there must exist an interior chord with
negative slope. Otherwise \(\ell\), and hence \(\sigma\), would be
nondecreasing on an infinite terminal interval; a positive lower bound
there would contradict \(\int\sigma(t)t^{-1}dt<\infty\). Choose \(u,v\)
with that negative slope. The second bound in (6.4) then gives an
exponential upper bound on the entire right tail. Together with the
left-end bound and boundedness on compact interior intervals, this proves
(6.3). Endpoint values, being Lebesgue-null, do not affect the argument.
\(\square\)

It follows by dominated convergence that every density in (6.2) under this
log-concavity hypothesis has finite right derivatives of every order at
zero:

\[
(-1)^j f^{(j)}(0+)=\int_0^\infty t^j\sigma(t)\,dt<\infty.
\tag{6.5}
\]

Now let \(X\) be (6.1), assume \(q>1\), and put \(a=\rho B\le1\).
The simplex change of variables in the gamma convolution gives

\[
f_{X^q}(y)
=C y^{a-1}\mathbb E e^{-R y^\rho},\qquad
C=\frac{\rho\prod_i b_i^{\beta_i}}{\Gamma(B)},\qquad
R=\sum_i b_i V_i,
\tag{6.6}
\]

where \(V\sim\operatorname{Dirichlet}(\beta_1,\ldots,\beta_n)\).
In particular \(0<\min b_i\le R\le\max b_i<\infty\).
If \(a<1\), (6.6) gives \(f_{X^q}(0+)=\infty\), contradicting (6.5)
at \(j=0\). If \(a=1\), direct differentiation gives

\[
-f_{X^q}'(y)
=C\rho y^{\rho-1}\mathbb E[R e^{-R y^\rho}]
\longrightarrow\infty,
\tag{6.7}
\]

since \(0<\rho<1\) and \(0<\mathbb E R<\infty\). This contradicts
(6.5) at \(j=1\).

Thus no representation of (6.6) by a log-concave Bernstein density
\(\sigma=t m\) is possible. This excludes B92-C2 for **every** powered
finite gamma convolution with \(q>1\) and \(B/q\le1\), including equal
rates. In this region the density is completely monotone, but the stronger
global log-concavity mixing condition is unavailable. If its Bernstein
measure does not have a density, the density-based sufficient condition
already cannot apply. The argument excludes neither GGC membership nor
other uses of Bondesson's theorem outside this parameter family.

<a id="wip-6-2"></a>
## WIP-6.2 — exact fractional gamma peeling

**Status: [PROVED OPERATOR IDENTITY; MATCHED CLOSURE IS A CONJECTURE].**

**Subsequent progress:** [WIP-7.1--7.2](17-exponential-peeling-closure.md)
prove closure for every positive integer order, even for arbitrary GGC
inputs. The all-positive-order conjecture below remains open in its
noninteger part. Its formulation and normalization are retained here.

Combine all summands at the smallest rate into one gamma variable, and
write

\[
X=\frac{G_a}{b}+\sum_{i=1}^{m}\frac{G_{\beta_i}}{b_i},
\qquad a,b,\beta_i>0,\quad b_i>b,
\quad m\ge1.
\tag{6.8}
\]

Let

\[
Z=\sum_{i=1}^{m}\frac{G_{\beta_i}}{b_i-b},\qquad
C_b=\prod_{i=1}^{m}\left(\frac{b_i}{b_i-b}\right)^{\beta_i},
\qquad h_q(u)=f_{Z^q}(u).
\tag{6.9}
\]

Define the positive fractional operator

\[
(\mathcal A_{a,b,q}h)(y)
=\frac{\rho}{\Gamma(a)}y^{\rho-1}e^{-b y^\rho}
\int_0^y (y^\rho-u^\rho)^{a-1}h(u)\,du,
\qquad y>0.
\tag{6.10}
\]

For the matched density (6.9), the exact identity is

\[
\boxed{
f_{X^q}(y)=b^a C_b(\mathcal A_{a,b,q}h_q)(y),
\qquad
\int_0^\infty\mathcal A_{a,b,q}h_q(y)\,dy
=b^{-a}\mathbb E e^{-bZ}=\frac1{b^a C_b}.
}
\tag{6.11}
\]

**Proof.** If \(W=\sum_iG_{\beta_i}/b_i\), the independent joint gamma
densities, followed by integration over a fixed sum, give
\(f_W(z)=C_b e^{-bz}f_Z(z)\). Convolve with \(G_a/b\):

\[
f_X(x)=\frac{b^a C_b}{\Gamma(a)}e^{-bx}
\int_0^x(x-z)^{a-1}f_Z(z)\,dz.
\tag{6.12}
\]

Set \(x=y^\rho\) and \(z=u^\rho\). Since
\(f_Z(z)dz=h_q(u)du\), and the outer density change contributes
\(\rho y^{\rho-1}\), this proves the first identity in (6.11).
For normalization, Tonelli and then \(x-z=v\) give

\[
\begin{aligned}
\int_0^\infty\mathcal A_{a,b,q}h_q(y)\,dy
&=\frac1{\Gamma(a)}\int_0^\infty e^{-bx}
  \int_0^x(x-z)^{a-1}f_Z(z)\,dz\,dx\\
&=b^{-a}\int_0^\infty e^{-bz}f_Z(z)\,dz.
\end{aligned}
\tag{6.13}
\]

The gamma Laplace transforms evaluate the last integral as \(C_b^{-1}\).
The endpoint singularity in (6.10) is integrable because \(a>0\);
alternatively (6.12)--(6.13) provide a nonnegative measure-level
justification without any exchange of signed integrals. \(\square\)

For \(a=1\), the integral in (6.10) is the cdf of \(Z^q\). This recovers
the precise ordinary-integration structure in Bondesson's Theorem 6.2.7.
For arbitrary \(a\), (6.12) is the Riemann--Liouville integral of order
\(a\), followed by exponential weighting and the power change of
variables. The case with no remaining rate is the one-gamma base case and
is handled separately, rather than treating a point mass as a density.

**[MATCHED CLOSURE CONJECTURE].** Fix \(q\ge1\). For every finite gamma
convolution \(Z\) as in (6.9), and every \(a,b>0\), assume that the law
with density \(h_q=f_{Z^q}\) is GGC. Then the normalization of
\(\mathcal A_{a,b,q}h_q\) is GGC.

The input is specifically a powered finite gamma convolution with the
same exponent \(q\) used by the operator. No closure assertion is made for
an arbitrary GGC density substituted for \(h_q\). The conjecture is
sufficient for induction on the number of distinct gamma rates: the
shifted rates in (6.9) remain positive, and the dimension decreases by one.
The one-gamma power case is known from HCM density closure. Thus proving
this matched closure for all parameters would settle the finite-gamma
power problem and then its weak-limit extension. Formula (6.11) alone
does not prove that closure, and positivity of the operator kernel alone
does not preserve GGC.

<a id="wip-6-3"></a>
## WIP-6.3 — positive-tilt cumulants, Hausdorff moments, and Loewner matrices

**Status: [PROVED GLOBAL RECOGNITION CRITERIA FROM EXTERNAL THEOREMS].**

Let \(Y\) be any almost surely finite nonnegative random variable; moments
of its un-tilted law are not assumed. For \(s>0\) define

\[
L(s)=\mathbb E e^{-sY},\qquad
g(s)=-\frac{L'(s)}{L(s)},\qquad
\mathbb P_s(Y\in dy)=\frac{e^{-sy}}{L(s)}\mathbb P(Y\in dy).
\tag{6.14}
\]

The tilted law has an mgf near zero:
\(\mathbb E_s e^{tY}=L(s-t)/L(s)\) for \(|t|<s\). Let
\(\kappa_j(s)\) denote its cumulants. Differentiating this identity gives

\[
(-1)^n g^{(n)}(s)=\kappa_{n+1}(s),\qquad
c_n(s)=\frac{s^n}{n!}\kappa_{n+1}(s)
\quad(n\ge0).
\tag{6.15}
\]

Smoothness and differentiation follow because every
\(y^j e^{-s y}\) is bounded uniformly for \(s\) on a compact subset of
\((0,\infty)\).

The following are equivalent:

1. \(Y\) is GGC.
2. For every \(s>0\), \((c_n(s))_{n\ge0}\) is a Hausdorff moment sequence
   of a finite positive measure on \([0,1]\).
3. For all \(s>0\) and all integers \(n,k\ge0\),

\[
\boxed{
D_{n,k}(s):=\sum_{j=0}^k(-1)^j\binom{k}{j}
\frac{s^{n+j}\kappa_{n+j+1}(s)}{(n+j)!}\ge0.
}
\tag{6.16}
\]

**Proof.** If \(Y\) is GGC, write its log derivative as

\[
g(s)=d+\int_{(0,\infty)}\frac{U(dt)}{s+t},\qquad d\ge0.
\tag{6.17}
\]

Map the finite measure \(U(dt)/(s+t)\) to \([0,1]\) by
\(u=s/(s+t)\), and add mass \(d\) at \(u=0\). Call the result
\(\nu_s\). Differentiating (6.17) gives

\[
c_n(s)=\int_{[0,1]}u^n\nu_s(du),\qquad
D_{n,k}(s)=\int_{[0,1]}u^n(1-u)^k\nu_s(du).
\tag{6.18}
\]

This proves the forward implications, including the possible drift atom.
The equivalence of the moment and difference conditions is Hausdorff's
theorem as used by Sokal, equations (4)--(5), (13)--(16).

For the converse, apply Sokal's Theorem 1 to \(g\). Its derivative
quantity is

\[
F_{n,k}(s)=(-1)^n\frac{d^{n+k}}{ds^{n+k}}[s^k g(s)],
\qquad
D_{n,k}(s)=\frac{s^n}{(n+k)!}F_{n,k}(s).
\tag{6.19}
\]

The second identity follows by Leibniz's rule and (6.15), with no
asymptotic expansion. Thus (6.16) makes \(g\) Stieltjes. Its general
representation allows a constant \(d\ge0\) and a measure on
\([0,\infty)\). Since \(L(0+)=1\),
\(\int_0^s g(v)dv=-\log L(s)<\infty\). Consequently the Stieltjes
measure has no atom at zero. Tonelli then gives

\[
-\log L(s)=ds+
\int_{(0,\infty)}\log(1+s/t)\,U(dt).
\tag{6.20}
\]

Finiteness at \(s=1\) supplies the Thorin integrability conditions: near
zero the integrand is comparable to \(1+|\log t|\), and at infinity to
\(1/t\). Hence (6.20) is a GGC representation. \(\square\)

An equivalent finite-point certificate is: for every finite set of
distinct \(s_1,\ldots,s_m>0\), the matrix

\[
K_{ij}=\begin{cases}
\displaystyle-\frac{g(s_i)-g(s_j)}{s_i-s_j},&i\ne j,\\[1ex]
-g'(s_i)=\kappa_2(s_i),&i=j
\end{cases}
\quad\text{is positive semidefinite.}
\tag{6.21}
\]

This is precisely Bondesson's Theorem 3.4.2 after changing from mgf
arguments \(-s_i\) to positive Laplace arguments \(s_i\). Necessity also
has the explicit Gram representation

\[
K_{ij}=\int_{(0,\infty)}
\frac{U(dt)}{(s_i+t)(s_j+t)}.
\tag{6.22}
\]

These are global criteria at strictly positive Laplace arguments. They
avoid the moment-determinacy issue of reconstructing the original law
from its moments at zero. The universal quantifiers in (6.16) and (6.21)
are essential. One exactly negative difference or principal minor
disproves GGC membership; finitely many nonnegative tests do not establish
it. Numerical values are search signals, not sign proofs.

<a id="wip-6-4"></a>
## WIP-6.4 — the exact continuous power flow and conditional Thorin mass

**Status: [PROVED FLOW IDENTITIES AND CONDITIONAL MASS FORMULA; NO
FORWARD-INVARIANCE THEOREM].**

Set \(Y_\tau=X^{e^\tau}\), \(\tau\ge0\), and write \(f_\tau,L_\tau,g_\tau\)
for its density, Laplace transform, and log derivative when these are
defined. For finite gamma \(X\) the density is smooth on \((0,\infty)\),
and

\[
\boxed{
\partial_\tau f_\tau(y)
=-\partial_y[y\log y\,f_\tau(y)].
}
\tag{6.23}
\]

Indeed \(\partial_\tau Y_\tau=Y_\tau\log Y_\tau\). For a smooth test
function compactly supported in \((0,\infty)\), differentiate its
expectation to obtain the weak continuity equation and integrate by
parts; the explicit power density makes this a classical identity on
\(y>0\).

For every \(s>0\), differentiation of expectations gives

\[
\boxed{
\begin{aligned}
\partial_\tau L_\tau(s)
&=-s\mathbb E[Y_\tau\log Y_\tau e^{-sY_\tau}],\\
\partial_\tau g_\tau(s)
&=\mathbb E_{\tau,s}[Y_\tau\log Y_\tau]
-s\operatorname{Cov}_{\tau,s}
  (Y_\tau,Y_\tau\log Y_\tau).
\end{aligned}
}
\tag{6.24}
\]

Here \(\mathbb E_{\tau,s}\) means exponential tilting of the current law.
The first derivative follows from the chain rule; differentiating
\(g_\tau=\mathbb E[Y_\tau e^{-sY_\tau}]/L_\tau\) gives the second.
The factors \(y|\log y|e^{-s y}\) and
\(y^2|\log y|e^{-s y}\) are bounded, with their continuous values zero
at \(y=0\); this justifies differentiation on compact positive
\(s\)-intervals. In fact (6.24) holds for any almost surely finite
nonnegative initial \(X\), taking \(0\log0=0\), even without a density.

For the finite gamma law (6.1), at \(q=e^\tau\) formula (6.6) remains
valid with \(a=Be^{-\tau}>0\), without requiring \(a\le1\).
The substitution \(z=sy\), boundedness of \(R\), and dominated
convergence show

\[
L_\tau(s)\sim C\Gamma(a)s^{-a},\qquad
-L_\tau'(s)\sim C\Gamma(a+1)s^{-a-1},\qquad
s g_\tau(s)\longrightarrow a.
\tag{6.25}
\]

If the current law is GGC, its representation (6.17) and monotone
convergence imply

\[
\boxed{
d_\tau=0,\qquad U_\tau((0,\infty))=Be^{-\tau}.
}
\tag{6.26}
\]

Indeed a positive drift would make \(s g_\tau(s)\) diverge, while with
zero drift the integrands \(s/(s+t)\) increase to one. This also proves
that the total mass is finite. On any interval where GGC membership has
already been established, the scalar mass satisfies
\(\frac d{d\tau}U_\tau((0,\infty))=-U_\tau((0,\infty))\).

The normalized measure \(F_\tau=e^\tau U_\tau/B\) is therefore a natural
candidate state variable. Neither (6.24) nor (6.26) proves a positive
measure evolution for \(F_\tau\). Such an evolution would require an
additional formula controlling its transport or creation of continuous
mass from the initial atomic Thorin measure. The covariance in (6.24)
has no automatic Stieltjes sign.

<a id="wip-6-5"></a>
## WIP-6.5 — a law-dependent local theorem would imply the global conjecture

**Status: [PROVED CONDITIONAL LOCAL-TO-GLOBAL LEMMA; LOCAL HYPOTHESIS OPEN].**

Consider the hypothesis

\[
\text{for every }Y\in GGC\text{ there exists }\varepsilon_Y>0
\text{ such that }Y^r\in GGC
\text{ for every }1\le r<1+\varepsilon_Y.
\tag{6.27}
\]

The interval is allowed to depend on the entire law of \(Y\). If (6.27)
holds, then every GGC law remains GGC under every power \(q\ge1\).

**Proof.** Fix \(X\in GGC\) and define
\(A=\{q\ge1:X^q\in GGC\}\). This set is closed in \([1,\infty)\):
if \(q_j\to q\), the variables \(X^{q_j}\to X^q\) almost surely, and
Bondesson's GGC weak-closure theorem applies. Hypothesis (6.27) at \(X\)
gives a nontrivial initial interval in \(A\). Put

\[
r_*:=\sup\{r\ge1:[1,r]\subseteq A\}.
\tag{6.28}
\]

If \(r_*<\infty\), the definition and closedness give
\([1,r_*]\subseteq A\). Apply (6.27) to the GGC law
\(Y=X^{r_*}\). Since

\[
(X^{r_*})^r=X^{r_*r},
\tag{6.29}
\]

the set \(A\) then contains an interval immediately to the right of
\(r_*\), contradicting its definition. Thus \(r_*=\infty\).
\(\square\)

This argument requires no uniform lower bound on \(\varepsilon_Y\).
Its hypothesis is nevertheless quantified over **every GGC law**,
including the intermediate laws \(X^{r_*}\). A local theorem proved only
for finite gamma convolutions cannot be substituted into (6.27): those
intermediate laws generally leave the finite-gamma class. A passage from
finite approximants would need an independently justified common
interval, or another extension argument, before this continuation lemma
could be applied.

The lemma also does not turn a nonnegative first parameter derivative of
selected inequalities into preservation on an interval. A usable local
theorem must control the full Stieltjes criterion, for example all of
(6.16) or a positive Thorin-measure representation.
