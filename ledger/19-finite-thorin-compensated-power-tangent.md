# Finite Thorin measures: measurable phases and compensated power tangents

This module extends the finite-atom calculation of
[WIP-6.9](16-power-flow-loewner-tangent.md#wip-6-9) to general finite
Thorin measures. It proves a weak operator on a stated test domain and
its exact resolvent action. It does not construct a nonlinear evolution,
an iterable approximation scheme, or a positive-time GGC power theorem.

Entries: WIP-6.11--WIP-6.15. All new lemmas are **[PROJECT DERIVATION]**;
no literature priority is claimed. Checked on 2026-09-05.

## External interfaces and conventions

1. L. F. James, *Functionals of Dirichlet processes, the
   Cifarelli--Regazzini identity and Beta-Gamma processes*, Annals of
   Statistics **33** (2005), 647--660,
   [DOI 10.1214/009053604000001237](https://doi.org/10.1214/009053604000001237).
   Checked [arXiv:math/0505606v1](https://arxiv.org/pdf/math/0505606v1),
   27 May 2005, PDF/reprint p. 2, Section 1 and equations (1)--(3):
   a Dirichlet process is a normalized gamma process; its total gamma
   mass is independent of the normalized process; the logarithmic
   integrability condition and Markov--Krein identity apply to measurable
   nonnegative functionals. The base probability may be atomic,
   nonatomic or mixed. The nonatomic restrictions on later partition
   formulae are not assumptions on this identity.
2. R. L. Schilling, R. Song and Z. Vondraček, *Bernstein Functions:
   Theory and Applications*, de Gruyter, **2010 edition**,
   [local primary text](../literature/SSV.pdf),
   [author's book and edition information](https://www.motapa.de/bernstein_functions/).
   Theorem 7.3, printed p. 63 / PDF p. 76: the reciprocal of a nonzero
   Stieltjes function is a complete Bernstein function. Theorem 6.10,
   printed pp. 58--59 / PDF pp. 71--72, supplies its exponential
   representation with a measurable density in \([0,1]\). Its proof
   gives the Poisson formula for the argument; Remark 6.8(ii), printed
   p. 57 / PDF p. 70, gives boundary recovery. Remark 6.11, printed
   p. 60 / PDF p. 73, requires an additional endpoint condition when
   anchoring at zero. We anchor at one and do not use that additional
   assertion. These page ranges were read directly in the local PDF.

The Poisson approximate-identity argument, beta integral differentiations
and absolute-integral estimates used below are supplied explicitly. No
general positive-minimum-principle or viability theorem is imported.

Throughout, \(U\) is a positive Borel measure on \((0,\infty)\) with

\[
0<B:=U((0,\infty))<\infty,
\qquad
\int\log(1+1/b)\,U(db)<\infty.
\tag{6.65}
\]

Let \(X\) be the zero-drift GGC with rate-form Thorin measure \(U\).
Let \(P\sim\operatorname{DP}(U)\) mean a random probability measure
whose finite-partition masses have Dirichlet parameters given by \(U\).
Zero-parameter cells have zero mass and are omitted from the ordinary
Dirichlet vector. In particular \(\mathbb E P=U/B\).

The adjective "non-atomic" in the extension concerns the allowed base
measure \(U\): a sample of the Dirichlet process is generally discrete.
We do not assert that the random \(P\) has a density.

<a id="wip-6-11"></a>
## WIP-6.11 — the Dirichlet tangent and a jointly measurable phase

**Status: [PROVED FOR EVERY ADMISSIBLE NONZERO FINITE THORIN MEASURE,
WITH ZERO DRIFT].**

For \(s>0\), define

\[
M_P(s)=\int\frac{P(db)}{s+b},\qquad
W_P(s)=M_P(s)+sM_P'(s)
=\int\frac{b\,P(db)}{(s+b)^2},\qquad
\Psi_B=\frac{\Gamma'(B+1)}{\Gamma(B+1)}.
\tag{6.66}
\]

Exponential tilting of \(X\) by \(e^{-sX}\), denoted by \(X_s\),
has the distributional representation

\[
\boxed{X_s\overset d=G_B M_P(s),\qquad G_B\perp P.}
\tag{6.67}
\]

The same law of \(P\) is used for every \(s\); this is a convenient
coupling of the tilted marginal laws, not a joint assertion about the
original tilting operations. With
\(g_q(s)=-\partial_s\log\mathbb E e^{-sX^q}\) and
\(h_U(s)=\partial_qg_q(s)|_{q=1}\),

\[
\boxed{
h_U(s)=B\mathbb E_P\left[
W_P(s)(\Psi_B+\log M_P(s))+sM_P'(s)
\right].
}
\tag{6.68}
\]

There is a jointly Borel measurable choice \((P,t)\mapsto\xi_P(t)\)
with values in \([0,1]\), satisfying

\[
\xi_P(t)=\limsup_{n\to\infty}
\frac{-\arg M_P(-t+i/n)}\pi
=\limsup_{n\to\infty}
\frac{\arg(1/M_P(-t+i/n))}{\pi},
\tag{6.69}
\]

where the ordinary limit exists for Lebesgue-almost every \(t\).
The limsup fixes a value at the remaining points, without affecting
any integral. Then

\[
\boxed{
\log M_P(s)=\log M_P(1)
+\int_0^\infty\xi_P(t)
\left(\frac1{s+t}-\frac1{1+t}\right)dt.
}
\tag{6.70}
\]

The integral and every positive-order \(s\)-derivative are absolutely
convergent, uniformly in \(P\) when \(s\) lies in a fixed compact
subset of \((0,\infty)\). If \(P\) is supported on \([a,A]\),
where \(0<a\le A<\infty\), then \(\xi_P=0\) below \(a\) and
\(\xi_P=1\) above \(A\), up to Lebesgue-null sets.

**Proof of the gamma--Dirichlet and tangent identities.** The
Markov--Krein identity applied to the bounded positive function
\(b\mapsto1/(s+b)\) gives

\[
\mathbb E e^{-vG_BM_P(s)}
=\exp\left\{-\int\log\left(1+\frac v{s+b}\right)U(db)\right\}
=\frac{\mathbb E e^{-(s+v)X}}{\mathbb E e^{-sX}}.
\]

This proves (6.67). Condition (6.65) also permits the un-tilted
representation \(X\overset d=G_B\int b^{-1}P(db)\), with a finite
mean functional almost surely, by James's logarithmic condition.

As in WIP-6.6, differentiation in power and then in Laplace argument
gives \(h_U(s)=\partial_s[s\mathbb E_s(X\log X)]\).
The gamma integral yields
\(\mathbb E[G_B\log G_B]=B\Psi_B\), so
\(\mathbb E_s[X\log X]=B\mathbb E[M_P(s)(\Psi_B+\log M_P(s))]\).
Differentiating gives (6.68). To justify this without a lower bound on
\(M_P\), note that

\[
0<M_P(s)\le1/s,\quad 0<W_P(s)\le M_P(s),\quad
|M_P^{(j)}(s)|\le j!s^{-j}M_P(s).
\]

On a compact positive \(s\)-set, all required derivatives of
\(M_P\log M_P\) are therefore bounded by a constant times
\(M_P(1+|\log M_P|)\), which is uniformly bounded. For the original
expectations, the mixed derivatives use bounded functions of the form
\(y^r(\log y)^j e^{-sy}\), \(r>0\), after \(y=x^q\), with
\(q\) in a compact positive interval. These bounds justify all the
differentiations and quotients just used.

**Proof of phase existence and measurability.** For every probability
measure \(P\) on the positive rates, \(M_P\) is a nonzero Stieltjes
function. Its upper-half-plane imaginary part is strictly negative;
thus \(1/M_P\) is a nonzero complete Bernstein function by SSV,
Theorem 7.3. Theorem 6.10 applied to \(1/M_P\), followed by
subtraction of the real logarithms at \(s\) and 1, gives (6.70) for
some uniquely determined almost-everywhere phase density in \([0,1]\).
The kernel difference has absolute integral \(|\log s|\); its
derivatives have integrable power bounds. In particular anchoring at
one requires no finiteness of \(M_P(0)\).

The imaginary part of that exponential representation is

\[
\arg(1/M_P(-t+i\epsilon))
=\int_0^\infty
\frac{\epsilon}{(u-t)^2+\epsilon^2}\,\xi_P(u)\,du.
\]

Extend the density by zero to the negative line. Dividing this formula
by \(\pi\) gives its Poisson approximate identity; at every Lebesgue
point it tends to the density. This follows by splitting the integral
outside a fixed neighborhood, where the kernel has vanishing mass,
and using the Lebesgue-point average inside that neighborhood. The
exceptional set is Lebesgue-null. Therefore the second limsup in
(6.69) recovers the representing density almost everywhere.

For each \(n\), the map
\((P,t)\mapsto\int(b-t+i/n)^{-1}P(db)\) is jointly Borel
measurable on the space of probability measures with its weak Borel
structure. This can be seen first for bounded simple kernels and then
by bounded measurable approximation; the kernel has modulus at most
\(n\). Its reciprocal lies in the upper half-plane, so its argument
is a continuous function there. Taking a limsup proves the claimed
joint measurability. For every \(P\) the resulting density differs
from the unique representing one only on a Lebesgue-null set; hence
(6.70) holds for this fixed jointly measurable choice. Fubini can
therefore be applied later without a selection of nonmeasurable phases.
The compact-support statements follow directly from the real boundary
sign of \(M_P(-t)\) outside \([a,A]\). \(\square\)

<a id="wip-6-12"></a>
## WIP-6.12 — a complete weak operator for compact rate support

**Status: [PROVED ON ALL OF \(C_b^2\) FOR COMPACTLY SUPPORTED FINITE
THORIN MEASURES; NO EVOLUTION EXISTENCE ASSERTION].**

Assume additionally \(\operatorname{supp}U\subseteq[a,A]\),
\(0<a\le A<\infty\). Here \(C_b^2\) consists of real twice
continuously differentiable functions on \((0,\infty)\) whose
function and first two derivatives are bounded. Put
\(\chi_b(t)=\mathbf1_{\{|t-b|<1\}}\), and define

\[
C_P(b)=-(\Psi_B+1+\log M_P(1))
+\int_0^\infty\xi_P(t)
\left[\frac1{1+t}-\frac{1-\chi_b(t)}{t-b}\right]dt.
\tag{6.71}
\]

For \(f\in C_b^2\), the following is well defined:

\[
\boxed{
\begin{aligned}
\mathcal A_U f&=\mathbb E_P\mathfrak A_Pf,\\
\mathfrak A_Pf&=\int b\,P(db)\left\{
C_P(b)f'(b)
+\int_0^\infty\xi_P(t)
\frac{f(t)-f(b)-(t-b)\chi_b(t)f'(b)}{(t-b)^2}\,dt
\right\}.
\end{aligned}
}
\tag{6.72}
\]

The values at \(t=b\) are assigned the continuous Taylor remainder
limit, or any other value, since \(dt\) gives the diagonal zero mass.
All integrals, including the expectation, converge absolutely. Moreover,

\[
|\mathcal A_Uf|
\le C_{a,A,B}
(\|f\|_\infty+\|f'\|_\infty+\|f''\|_\infty).
\tag{6.73}
\]

For \(f_s(t)=1/(s+t)\),

\[
\boxed{
\mathcal A_U f_s=\frac{h_U(s)+g_1(s)}B
=\left.\frac d{d\tau}
\left[\frac{e^\tau}B g_{e^\tau}(s)\right]\right|_{\tau=0}.
}
\tag{6.74}
\]

Also \(\mathcal A_U1=0\), and the positive minimum property is

\[
\boxed{f\ge0,\quad f=0\ U\text{-almost everywhere}
\quad\Longrightarrow\quad \mathcal A_Uf\ge0.}
\tag{6.75}
\]

**Proof of absolute convergence and bounds.** The correction kernel in
(6.71) is bounded near its removed pole and at zero. At infinity it is
\(-(1+b)/[(1+t)(t-b)]\), which is integrable. In fact the elementary
split at \(b-1\) and \(b+1\) gives

\[
\int_0^\infty\left|\frac1{1+t}
-\frac{1-\chi_b(t)}{t-b}\right|dt
\le3\log(b+2).
\]

For \(b<1\) the integral equals \(2\log(b+2)\); for \(b\ge1\)
it equals \(\log b+2\log(b+2)\). On the compact support,
\(M_P(1)\) lies between \(1/(1+A)\) and \(1/(1+a)\), so
\(C_P(b)\) is uniformly bounded.

For \(|t-b|<1\), Taylor's theorem bounds the jump numerator by
\(\|f''\|_\infty(t-b)^2/2\). For \(|t-b|\ge1\), it is at
most \(2\|f\|_\infty\). Thus the absolute jump integral, before
multiplication by \(b\), is bounded by
\(\|f''\|_\infty+4\|f\|_\infty\), uniformly in \(b\) and
\(P\). Since \(b\le A\), all required triple integrals and
Fubini exchanges are justified, proving (6.73).

**Proof of the resolvent action.** Combining the two integrals in
(6.71)--(6.72), their integrand is

\[
\frac{f(t)-f(b)}{(t-b)^2}
-\frac{f'(b)}{t-b}+\frac{f'(b)}{1+t}.
\]

For \(f=f_s\), this equals
\((s+b)^{-2}[(s+t)^{-1}-(1+t)^{-1}]\), by the partial fraction
identity in WIP-6.7. The logarithmic representation (6.70) therefore
gives

\[
\mathfrak A_P f_s=W_P(s)(\Psi_B+1+\log M_P(s)).
\]

Now \(\mathbb E M_P(s)=g_1(s)/B\). Equation (6.68) and
\(W_P=M_P+sM_P'\) prove (6.74).

For (6.75), \(\mathbb E P=U/B\) implies that almost surely \(P\)
is concentrated on the zero set of \(f\). Every such positive rate
is an interior minimum, so \(f'(b)=0\) there. The drift and the
subtractions consequently vanish \(P\)-almost everywhere, leaving
the nonnegative integral of \(b\xi_P(t)f(t)/(t-b)^2\). Its
finiteness is already included in the Taylor bound. Constants give
zero in (6.72) directly. \(\square\)

For a finite atomic \(U\), \(\xi_P=\mathbf1_{D_P}\) almost
everywhere. Equations (6.70)--(6.72), combined with the finite-atom
logarithmic identity, recover WIP-6.9 exactly: the change from anchor
zero to anchor one changes the displayed drift coefficient and the
integral compensator by opposite amounts, not the operator.

<a id="wip-6-13"></a>
## WIP-6.13 — a controlled domain when rates approach zero and infinity

**Status: [PROVED WEAK OPERATOR ON A SPECIFIED DOMAIN FOR EVERY
ADMISSIBLE FINITE \(U\); NO UNIFORM ITERATION ESTIMATE].**

Drop compact support, retaining (6.65). Choose \(R>0\) with
\(\alpha:=U((0,R])>0\). Then

\[
\boxed{
\mathbb E|\log M_P(1)|
\le\ell(U;R):=\log(1+R)+\psi(B)-\psi(\alpha)<\infty,
}
\tag{6.76}
\]

where \(\psi=\Gamma'/\Gamma\). The finite-atomic assumption is
unnecessary. Define the linear test domain

\[
\mathcal D=\operatorname{span}\left(
\{1\}\cup C_c^2((0,\infty))
\cup\left\{t\mapsto\frac{(-1)^k k!}{(s+t)^{k+1}}:
s>0,\ k=0,1,\ldots\right\}\right).
\tag{6.77}
\]

For every \(f\in\mathcal D\), (6.71)--(6.72) converge absolutely
and define \(\mathcal A_Uf\). Statements (6.74)--(6.75) remain
valid, and derivatives of the resolvent identity can be taken to any
fixed order, locally uniformly in positive \(s\).

**Proof of logarithmic integrability.** Since \(0<M_P(1)\le1\),
put \(Z=P((0,R])\) and note \(M_P(1)\ge Z/(1+R)\).
The variable \(Z\) is beta with parameters \((\alpha,B-\alpha)\).
If \(\alpha=B\), it is identically one. Differentiation of the
beta integral gives
\(\mathbb E[-\log Z]=\psi(B)-\psi(\alpha)\), finite for
\(\alpha>0\), including the stated degenerate case. This proves
(6.76). In particular no logarithmic moment of the large rates is
being assumed.

The correction-kernel estimate in WIP-6.12 holds for every \(b>0\),
so

\[
|C_P(b)|\le |\Psi_B+1|+|\log M_P(1)|+3\log(b+2).
\]

**Compactly supported tests.** If \(f\in C_c^2\) has support in
\([a,A]\subset(0,\infty)\), then its drift coefficient is
nonzero only for \(b\in[a,A]\). Its absolute expectation is finite
by (6.76). For the absolute jump integral including the factor \(b\),
the bounds improve outside this interval:

\[
\begin{aligned}
b\int_0^\infty
\frac{|f(t)-f(b)-(t-b)\chi_b(t)f'(b)|}{(t-b)^2}dt
&=O_f(b) &&(0<b<a/2),\\
&=O_f(b^{-1}) &&(b>2A).
\end{aligned}
\tag{6.78}
\]

Indeed \(f(b)=f'(b)=0\) there and the remaining \(t\)-integral
is restricted to \([a,A]\), separated from \(b\). On the middle
compact interval the Taylor bound of WIP-6.12 applies. Consequently
this expression is uniformly bounded for all \(b>0\), and can be
integrated against every probability \(P\) and then averaged.

**Resolvent tests.** The compensated algebra also controls both
endpoints without moment assumptions on the rates. Its exact combined
kernel is

\[
\boxed{
\frac{f_s(t)-f_s(b)-(t-b)f_s'(b)}{(t-b)^2}
+\frac{f_s'(b)}{1+t}
=\frac1{(s+b)^2}
\left(\frac1{s+t}-\frac1{1+t}\right).
}
\tag{6.79}
\]

The right side, multiplied by \(b\), has absolute \(t\)-integral
\(b|\log s|/(s+b)^2\). Subtracting the correction kernel times
\(f_s'(b)\) changes it to the locally truncated jump kernel in
(6.72). Therefore

\[
b\int_0^\infty
\frac{|f_s(t)-f_s(b)-(t-b)\chi_b(t)f_s'(b)|}{(t-b)^2}dt
\le\frac b{(s+b)^2}
\bigl(|\log s|+3\log(b+2)\bigr).
\tag{6.80}
\]

The right side is bounded over \(b>0\), locally uniformly in
\(s>0\). The drift is controlled by the same bound and
\(\sup_b b/(s+b)^2=1/(4s)\), together with (6.76).

For the higher tests in (6.77), differentiate (6.79) a fixed number
of times in \(s\). The undifferentiated kernel difference has
absolute integral \(|\log s|\); its \(j\)-th derivative for
\(j\ge1\) has absolute integral \((j-1)!s^{-j}\).
The prefactors are constant multiples of \((s+b)^{-r}\),
\(r\ge2\). The subtracted correction kernel is controlled by
\(b\log(b+2)/(s+b)^r\), again bounded in \(b\), locally
uniformly in \(s\). These estimates justify the absolute integrals
and all fixed-order differentiations. Linearity covers \(\mathcal D\);
the positivity proof of (6.75) applies verbatim. \(\square\)

**What the bounds do and do not supply.** For a fixed compactly supported
test, or a compact positive set of resolvents and any fixed number of
derivatives, the displayed estimates bound the weak functional by a
constant times \(1+|\Psi_B+1|+\ell(U;R)\). Thus a family with
\(B\) in a compact positive interval and a fixed positive lower bound
on \(U((0,R])\) has uniform bounds on these tests. This is a
specified endpoint-and-tail estimate, not a claimed bound on every
\(C_b^2\) function for arbitrary \(U\). The crude jump estimate
for general \(C_b^2\) grows like \(b\), and finite Thorin mass
alone does not bound its large-rate integral.

The functional is defined beyond compact support, but no conclusion is
made that an Euler construction preserves the necessary uniform bounds,
the logarithmic Thorin condition at zero, or tightness of its evolving
measures. Existence, consistency, uniqueness or another identification
mechanism still has to be proved before a positive evolution could be
identified with the actual power flow.

<a id="wip-6-14"></a>
## WIP-6.14 — conditional Thorin mass under powers for every finite-mass input

**Status: [PROVED CONDITIONAL MASS FORMULA WITHOUT A TAUBERIAN INPUT;
NO GGC POWER-CLOSURE ASSERTION].**

For the zero-drift finite-mass \(X\) in (6.65) and every \(q>1\),
if \(Y=X^q\) is GGC, then its drift is zero and its Thorin measure
has total mass \(B/q\). This extends the finite-gamma constraint of
[WIP-6.4](15-global-criteria-and-power-flow.md#wip-6-4).

**Proof.** The tilted marginal representation (6.67) gives a coupling

\[
sX_s\overset d=G_BV_s,\qquad
V_s=\int\frac{s}{s+b}P(db)\uparrow1
\quad\text{almost surely as }s\to\infty.
\tag{6.81}
\]

Here \(G_B\) and \(P\) are fixed independent variables on the
coupling space. For every \(c>0\), the function
\(z\mapsto e^{z-cz^q}\) is bounded and continuous on
\([0,\infty)\), because \(q>1\). Consequently dominated
convergence and the gamma density yield

\[
\begin{aligned}
\frac{L_Y(cs^q)}{L_X(s)}
&=\mathbb E_s e^{sX-c(sX)^q}\\
&\longrightarrow\mathbb E e^{G_B-cG_B^q}
=\frac1{\Gamma(B)}\int_0^\infty z^{B-1}e^{-cz^q}dz\\
&=\frac{\Gamma(B/q)}{q\Gamma(B)}c^{-B/q}.
\end{aligned}
\tag{6.82}
\]

The positive limit at \(c=1\) permits division. With \(t=s^q\),

\[
\frac{L_Y(ct)}{L_Y(t)}\longrightarrow c^{-B/q}
\qquad(c>0).
\tag{6.83}
\]

Suppose now \(Y\) is GGC, and write its drift as \(d_Y\ge0\)
and rate-form Thorin measure as \(U_Y\), not initially assumed
finite. Fix \(c>1\). Its Thorin representation gives

\[
-\log\frac{L_Y(ct)}{L_Y(t)}
=d_Y(c-1)t+
\int\log\left(\frac{b+ct}{b+t}\right)U_Y(db).
\tag{6.84}
\]

The left side tends to \((B/q)\log c<\infty\). The first term
therefore forces \(d_Y=0\). For every \(b>0\), the nonnegative
integrand increases in \(t\) to \(\log c\); its derivative is
\(b(c-1)/[(b+ct)(b+t)]>0\). Monotone convergence now proves

\[
\boxed{d_Y=0,\qquad U_Y((0,\infty))=B/q.}
\tag{6.85}
\]

In particular infinite Thorin mass is excluded by the finite limit.
No Tauberian equivalence or unproved boundary inversion has been used.
\(\square\)

Thus, on any interval where power membership has independently been
established, \(e^\tau U_{X^{e^\tau}}/B\) is a probability measure.
Equation (6.74) is its necessary resolvent tangent at zero. The weak
functional in WIP-6.13 gives an extension of that tangent to the stated
test domain; it does not prove that the actual Thorin measures have weak
derivatives on every such test, or that those measures exist at positive
time without the conditional membership hypothesis.

<a id="wip-6-15"></a>
## WIP-6.15 — finite-mass local closure is an exact sufficient verification domain

**Status: [PROVED LOCAL-TO-GLOBAL REDUCTION; THE LOCAL HYPOTHESIS
REMAINS OPEN].**

Let \(\mathcal T_{\mathrm{fin}}^0\) be the class of zero-drift GGC
laws with a nonzero finite Thorin measure satisfying (6.65). Consider
the hypothesis

\[
\boxed{
\text{for every }Z\in\mathcal T_{\mathrm{fin}}^0
\text{ there is }\epsilon_Z>0\text{ such that }
Z^r\in GGC\text{ for }1\le r<1+\epsilon_Z.
}
\tag{6.86}
\]

This hypothesis is equivalent to the full GGC power conjecture. Thus
the domain of a sufficient local theorem may be restricted to
\(\mathcal T_{\mathrm{fin}}^0\), rather than every GGC law as in
[WIP-6.5](15-global-criteria-and-power-flow.md#wip-6-5).

**Proof.** The full conjecture immediately implies (6.86). For the
converse, fix any nonzero finite gamma convolution \(X\), whose
initial Thorin mass is some \(B>0\), and set

\[
S_X=\{q\ge1:X^q\in GGC\},\qquad
r_*:=\sup\{r\ge1:[1,r]\subseteq S_X\}.
\tag{6.87}
\]

The set \(S_X\) is closed in \([1,\infty)\): if
\(q_n\in S_X\) tends to \(q\), then \(X^{q_n}\to X^q\)
almost surely, and GGC weak closure applies. Hypothesis (6.86) at the
initial finite gamma law gives \(r_*>1\).

Suppose \(r_*<\infty\). The definition and closedness imply
\([1,r_*]\subseteq S_X\), in particular \(X^{r_*}\in GGC\).
By WIP-6.14, this law has zero drift and Thorin mass \(B/r_*>0\).
It is therefore still in \(\mathcal T_{\mathrm{fin}}^0\), although
it need not be a finite gamma convolution. Applying (6.86) to this
current law gives

\[
(X^{r_*})^r=X^{r_*r}\in GGC
\qquad(1\le r<1+\epsilon_{X^{r_*}}).
\tag{6.88}
\]

This extends the interval in \(S_X\) beyond \(r_*\), a
contradiction. Hence \(r_*=\infty\), and every finite gamma
convolution has a GGC power for every \(q\ge1\).

For any fixed \(q\ge1\), the finite-gamma weak-density and weak-closure
reduction in [WIP-0.1](00-foundations.md#wip-0-1) then extends the
result to every GGC law. That reduction includes deterministic drift,
infinite Thorin mass and degenerate limits, using finite gamma
approximants and continuity of the power map. This proves the full
conjecture. \(\square\)

The weak-closure input is Bondesson (1992), Theorem 3.1.5, as audited in
the [foundational source note](../notes/bondesson-1992-ggc-hcm-foundational-infrastructure.md);
the finite-gamma density input is precisely the existing WIP-0.1
interface, not an approximation newly asserted here.

No uniform lower bound on \(\epsilon_Z\) over masses \(B\), shapes,
supports or laws is required by this continuation argument. However,
(6.86) still requires every admissible finite Thorin measure, including
non-atomic bases and supports accumulating at zero or infinity. A
compact-support-only local theorem does not supply (6.86), and a
positive tangent or a formal weak equation is not a local closure
theorem. WIP-6.12--6.13 advance the operator's domain but do not prove
its finite-time preservation or the local hypothesis.
