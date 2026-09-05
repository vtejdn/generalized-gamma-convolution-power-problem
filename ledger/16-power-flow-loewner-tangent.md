# Positive Loewner tangents of the finite-gamma power flow

This module advances current P5 at the boundary \(q=1\). It proves an
explicit right tangent and strict positivity on every finite Loewner
nullspace. It does not prove a common interval of GGC power closure.

**[PROJECT DERIVATION]** means proved here; no claim of literature novelty
is made. The external inputs are the gamma--Dirichlet identity in
[WIP-0.2](00-foundations.md#wip-0-2), differentiation of the defining gamma
integral, and the Loewner recognition theorem already recorded in
[WIP-6.3](15-global-criteria-and-power-flow.md#wip-6-3)
(Bondesson, 1992, Theorem 3.4.2). The positivity calculation below is
independent of a numerical experiment or a boundary inversion theorem.

Merge equal rates and write

\[
X=\sum_{i=1}^d\frac{G_{\beta_i}}{b_i},\qquad
0<b_1<\cdots<b_d,\qquad
\beta_i>0,\qquad B=\sum_i\beta_i,
\]

with independent unit-rate gamma variables. Set

\[
L_q(s)=\mathbb E e^{-sX^q},\qquad
g_q(s)=-\partial_s\log L_q(s),\qquad
h(s)=\left.\partial_qg_q(s)\right|_{q=1},\quad s>0.
\tag{6.30}
\]

The derivative with respect to \(q\) at 1 equals the derivative with
respect to logarithmic power time \(\tau=\log q\) at 0.

<a id="wip-6-6"></a>
## WIP-6.6 — the conditional Dirichlet tangent and its rational-log formula

**Status: [PROVED TANGENT IDENTITY; POSITIVE OFF-ATOM BOUNDARY JUMP].**

Let \(P\sim\operatorname{Dirichlet}(\beta_1,\ldots,\beta_d)\). For each
interior simplex point \(p\), define

\[
M_p(s)=\sum_i\frac{p_i}{s+b_i},\qquad
W_p(s)=M_p(s)+sM_p'(s)
=\sum_i\frac{p_i b_i}{(s+b_i)^2}.
\tag{6.31}
\]

Write \(\Psi_B=\Gamma'(B+1)/\Gamma(B+1)\). Then

\[
\boxed{
h(s)=B\mathbb E_P\!\left[
 W_P(s)\{\Psi_B+\log M_P(s)\}+sM_P'(s)
\right].
}
\tag{6.32}
\]

For fixed \(p\), the rational function \(M_p\) has exactly one simple
zero \(-z_i(p)\) between each pair of successive poles, with

\[
b_i<z_i(p)<b_{i+1},\qquad
M_p(s)=\frac{\prod_{i=1}^{d-1}(s+z_i(p))}
              {\prod_{i=1}^{d}(s+b_i)}.
\tag{6.33}
\]

For \(d=1\), the numerator product is one. Define

\[
D_p=\bigcup_{i=1}^{d-1}(b_i,z_i(p))\ \cup\ (b_d,\infty).
\tag{6.34}
\]

The real logarithm on \(s>0\) has the absolutely convergent representation

\[
\boxed{
\log M_p(s)=\log M_p(0)
+\int_{D_p}\left(\frac1{s+t}-\frac1t\right)dt.
}
\tag{6.35}
\]

**Proof of the tangent.** Differentiating \(L_q\) in \(q\), followed by
the \(s\)-derivative, gives

\[
h(s)=\frac{d}{ds}[sA(s)],\qquad
A(s)=\mathbb E_s[X\log X],
\tag{6.36}
\]

where \(\mathbb E_s\) is tilting of \(X\) by \(e^{-sX}\). Under this
tilt the independent gamma rates become \(s+b_i\), with shapes unchanged.
The gamma--Dirichlet identity therefore gives

\[
X\text{ under }\mathbb P_s
\ \overset d=G_B M_P(s),\qquad G_B\perp P,
\]

where the law of \(P\) on the right does not depend on \(s\).
Differentiating the gamma integral shows

\[
\mathbb E G_B=B,\qquad
\mathbb E[G_B\log G_B]=B\Psi_B.
\]

Consequently \(A(s)=B\mathbb E[M_P(s)\{\Psi_B+\log M_P(s)\}]\).
Differentiating \(sA(s)\) gives (6.32).

Here all differentiations are justified on compact positive \(s\)-sets.
The values of \(M_P(s)\) lie between \(1/(s+b_d)\) and \(1/(s+b_1)\);
its derivatives are uniformly bounded in \(P\). Differentiation in \(q\)
near 1 is also valid: with \(y=x^q\), its integrands are sums of

\[
q^{-j}y^r(\log y)^j e^{-sy},\qquad r>0,
\]

which are bounded on \(0<y<\infty\), uniformly when \(q\) and \(s\)
range over compact positive sets. The same bound justifies the mixed
\((s,q)\) derivatives used in the Loewner diagonals below. Since \(L_q(s)>0\),
the required quotients and their first \(q\)-derivatives are continuous.

**Proof of the logarithmic representation.** On each
\((b_i,b_{i+1})\), the function
\(t\mapsto M_p(-t)\) increases strictly from \(-\infty\) to \(+\infty\),
because its derivative is \(\sum_jp_j/(b_j-t)^2>0\). This proves the
simple interlacing zeros in (6.33); the numerator is monic since
\(\sum_i p_i=1\). In particular,
\(D_p=\{t>0:M_p(-t)<0\}\) away from poles and zeros.

Apply

\[
\log(s+a)-\log a
=\int_a^\infty\left(\frac1t-\frac1{s+t}\right)dt
\]

to the numerator and denominator of (6.33). Interlacing cancels the
overlapping intervals and yields (6.35). Its absolute convergence is
uniform in \(p\): \(D_p\subseteq[b_1,\infty)\), and the absolute
integrand is \(s/[t(s+t)]\). Its derivatives in \(s\) also have integrable
bounds on compact positive \(s\)-sets. Finally \(P\) lies in the simplex
interior almost surely because every \(\beta_i>0\). \(\square\)

### The off-atom jump of the tangent

Equation (6.32) defines an analytic continuation of \(h\) to the upper
half-plane: \(M_p(z)\) has strictly negative imaginary part there, so
use the logarithm with argument in \((-\pi,0)\). For
\(t>0\), \(t\ne b_i\), the boundary jump is

\[
\boxed{
-\frac1\pi\Im h(-t+i0)
=B\mathbb E_P\!\left[
\left(\sum_i\frac{P_i b_i}{(b_i-t)^2}\right)
\mathbf1_{\{M_P(-t)<0\}}
\right]\ge0.
}
\tag{6.37}
\]

To justify averaging these boundary values, if the coefficients
\(1/(b_i-t)\) have both signs, split the Dirichlet vector into the positive
and negative groups. Their total positive-group weight \(U\) has a beta
law and is independent of the two internal Dirichlet vectors. Conditional
on those vectors, write

\[
M_P(-t)=a_+U-a_-(1-U),
\]

where \(a_+,a_-\) lie in fixed compact subsets of \((0,\infty)\).
The zero \(a_-/(a_++a_-)\) stays in a compact subinterval of \((0,1)\),
on which the beta density is bounded. Thus
\(\mathbb E|\log|M_P(-t)||<\infty\), uniformly over the internal
vectors. If all coefficients have the same sign, there is no zero.
For small \(\varepsilon>0\), the real part of
\(M_P(-t+i\varepsilon)\) differs from \(M_P(-t)\) by \(O(\varepsilon^2)\)
and its negative imaginary part is bounded above and below by positive
constants times \(\varepsilon\), uniformly in \(P\). These facts give
an integrable bound \(C+|\log|M_P(-t)||\) for the logarithm's magnitude.
The remaining factors in (6.32) are bounded near this fixed \(t\).
Dominated convergence therefore yields (6.37).

**Interpretation.** This is a statement about the analytic boundary jump
of the actual tangent \(h\). It does not presume that a Thorin measure
exists for \(q>1\), or justify interchanging a \(q\)-derivative with an
unproved boundary inversion. Its density has nonintegrable right-hand
singularities at the original rates. Treating it as an ordinary finite
measure derivative would omit essential compensating terms. The next
lemma handles those singularities through exact cancellation.

<a id="wip-6-7"></a>
## WIP-6.7 — strict nullspace tangents and finite-matrix right neighborhoods

**Status: [PROVED FOR EVERY FIXED FINITE NODE SET; NO UNIFORM POWER INTERVAL].**

Fix distinct positive nodes \(s_1,\ldots,s_m\), and define the symmetric
Loewner matrix

\[
K_q(s_j,s_k)=
\begin{cases}
\displaystyle\frac{g_q(s_j)-g_q(s_k)}{s_k-s_j},&j\ne k,\\[1ex]
-g_q'(s_j),&j=k.
\end{cases}
\tag{6.38}
\]

At \(q=1\), \(g_1(s)=\sum_i\beta_i/(s+b_i)\), so

\[
v\in\ker K_1
\quad\Longleftrightarrow\quad
R_v(b_i)=0\text{ for every }i,
\qquad
R_v(t):=\sum_{j=1}^m\frac{v_j}{s_j+t}.
\tag{6.39}
\]

For every such real \(v\),

\[
\boxed{
v^{\mathsf T}\left.\partial_q K_q\right|_{q=1}v
=B\mathbb E_P\int_{D_P}
\left(\sum_i\frac{P_i b_i}{(b_i-t)^2}\right)
R_v(t)^2\,dt.
}
\tag{6.40}
\]

This integral is finite and strictly positive when \(v\ne0\). Moreover,
for this fixed law and fixed node set there exists \(\varepsilon>0\) such
that \(K_q\) is positive definite whenever \(1<q<1+\varepsilon\).

**Proof.** The initial Gram formula is

\[
v^{\mathsf T}K_1v
=\sum_i\beta_iR_v(b_i)^2,
\tag{6.41}
\]

which proves (6.39). Let \(\mathcal K_f\) denote the matrix obtained by
replacing \(g_q\) with a differentiable function \(f\) in (6.38).
Linearity and direct divided differences give

\[
v^{\mathsf T}\mathcal K_{1/(s+b_i)}v=R_v(b_i)^2=0,
\qquad
v^{\mathsf T}\mathcal K_{1/(s+b_i)^2}v
=2R_v(b_i)\sum_j\frac{v_j}{(s_j+b_i)^2}=0.
\tag{6.42}
\]

Thus rational terms involving only those simple and double poles vanish
in this quadratic form. In (6.32), this removes \(sM_P'(s)\), the constant
multiple \(\Psi_B W_P(s)\), and \(W_P(s)\log M_P(0)\).
Insert (6.35) in the remaining term. Taking divided differences,
diagonal derivatives and expectation through the integral is legitimate:
the original integrand is

\[
W_P(s)\left(\frac1{s+t}-\frac1t\right),
\]

which and whose \(s\)-derivative have integrable \(O(t^{-2})\) bounds,
uniformly in \(P\), with \(t\ge b_1>0\). Applying (6.42) also removes
the \(W_P(s)/t\) term from its quadratic form.

For \(t\ne b_i\), the elementary partial fraction identity

\[
\frac1{(s+b_i)^2(s+t)}
=\frac1{(t-b_i)^2}
\left(\frac1{s+t}-\frac1{s+b_i}\right)
+\frac1{t-b_i}\frac1{(s+b_i)^2}
\tag{6.43}
\]

then implies

\[
v^{\mathsf T}\mathcal K_{W_P(s)/(s+t)}v
=\left(\sum_i\frac{P_i b_i}{(b_i-t)^2}\right)R_v(t)^2.
\tag{6.44}
\]

The finitely many excluded \(t=b_i\) do not affect integration. More
explicitly, \(R_v(b_i)=0\) gives \(R_v(t)=O(t-b_i)\) there, so its square
cancels every apparent double pole. The bound is uniform in \(P\), since
\(0\le P_i\le1\). At infinity \(R_v(t)=O(t^{-1})\) and the other factor
is \(O(t^{-2})\), yielding an \(O(t^{-4})\) tail. This proves finiteness
and (6.40), including the required Fubini and diagonal differentiations.
After cancellation the integrand is nonnegative, so Tonelli also applies.

For strictness, every \(D_P\) contains \((b_d,\infty)\), where the weight
in (6.40) is strictly positive. A nonzero \(v\) gives a nonzero rational
function \(R_v\): its simple poles at the distinct \(-s_j\) have residues
\(v_j\). Such a rational function has only finitely many zeros on the
tail, hence (6.40) is strictly positive.

Finally, the differentiability proved in WIP-6.6 gives, in this fixed
finite-dimensional matrix space,

\[
K_{1+\delta}=K_1+\delta H+o(\delta),\qquad
H=\left.\partial_qK_q\right|_{q=1}.
\tag{6.45}
\]

If \(K_1\) is positive definite, continuity suffices. Otherwise decompose
the space as \(\operatorname{ran}K_1\oplus\ker K_1\). The upper-left
block stays positive definite. On the nullspace the lower-right block is
\(\delta H_{NN}+o(\delta)\), and (6.40) makes \(H_{NN}\) positive
definite. The off-diagonal blocks are \(O(\delta)\), whose Schur-complement
contribution is \(O(\delta^2)\). Therefore the whole matrix is positive
definite for all sufficiently small positive \(\delta\). \(\square\)

### Explicit one-gamma check

For \(X=G_B/b\), equation (6.32) reduces to

\[
h(s)=\frac{B\{b[\Psi_B-\log(s+b)]-s\}}{(s+b)^2}.
\tag{6.46}
\]

With two distinct positive nodes, the vector
\(v=(s_1+b,-s_2-b)\) lies in \(\ker K_1\), and (6.40) becomes

\[
v^{\mathsf T}Hv
=Bb(s_1-s_2)^2
\int_b^\infty\frac{dt}{(s_1+t)^2(s_2+t)^2}>0.
\tag{6.47}
\]

This independently displays cancellation of the singular factor
\((t-b)^{-2}\), and fixes the Loewner sign convention.

<a id="wip-6-8"></a>
## WIP-6.8 — any conditional Thorin support immediately reaches zero

**Status: [PROVED TAIL OBSTRUCTION AND CONDITIONAL SUPPORT STATEMENT;
NO DIFFERENTIATION OF THORIN MEASURES].**

For the finite gamma convolution above and every \(q>1\),

\[
\mathbb E\exp(\varepsilon X^q)=\infty
\qquad\text{for every }\varepsilon>0.
\tag{6.48}
\]

If \(X^q\) is GGC and \(U_q\) denotes its rate-form Thorin measure,
then

\[
\boxed{
U_q((0,a))>0\quad\text{for every }a>0,
\qquad \inf\operatorname{supp}U_q=0.
}
\tag{6.49}
\]

The infimum is taken in the ambient closed half-line: the Thorin measure
itself is on \((0,\infty)\), not an atom at zero.

**Proof.** For any one summand, \(X\ge G_{\beta_i}/b_i\) in the
defining coupling. Hence the left side of (6.48) is at least

\[
\frac1{\Gamma(\beta_i)}
\int_0^\infty x^{\beta_i-1}
\exp\{\varepsilon b_i^{-q}x^q-x\}\,dx=\infty.
\tag{6.50}
\]

Indeed \(\varepsilon b_i^{-q}x^q-x\ge x\) for all sufficiently
large \(x\), since \(q>1\).

Suppose now that \(X^q\) is GGC. By
[WIP-6.4](15-global-criteria-and-power-flow.md#wip-6-4), its drift is
zero and its Thorin mass is \(c=B/q\in(0,\infty)\). Normalize
\(U_q/c\) and push it forward by \(t\mapsto1/t\) to a scale
probability measure \(F_q\). The finite-mass gamma--Dirichlet
representation in
[WIP-1.4](01-route1-stable-dirichlet-and-quadratic.md#wip-1-4) gives

\[
X^q\overset d=G_c M_c(F_q),\qquad G_c\perp M_c(F_q).
\tag{6.51}
\]

If \(U_q((0,a))=0\) for some \(a>0\), then \(F_q\) is supported
on \((0,1/a]\). Its Dirichlet mean is at most \(1/a\) almost
surely, because it is an average of values in that interval. Therefore,
for \(0<\varepsilon<a\),

\[
\mathbb E\exp(\varepsilon X^q)
=\mathbb E\big[(1-\varepsilon M_c(F_q))^{-c}\big]
\le(1-\varepsilon/a)^{-c}<\infty,
\tag{6.52}
\]

contradicting (6.48). This proves (6.49). \(\square\)

**What this says about the tangent.** The initial Thorin measure has
support \(\{b_1,\ldots,b_d\}\), whereas every conditional measure
\(U_q\) for \(q>1\) must put positive mass below every positive
cutoff. Yet (6.37) is identically zero on \((0,b_1)\), because all
terms in \(M_P(-t)\) are then positive. Thus the actual tangent at
\(q=1\), continued to the cut, does not by itself describe the
instantaneous support change of a putative positive Thorin evolution.

This is a singular support-edge phenomenon, not a contradiction. We have
not justified interchanging a \(q\)-derivative with approach to the
cut, Stieltjes inversion, or integration over \((0,a)\). In particular,
we do **not** conclude that \(U_q((0,a))=o(q-1)\), that this mass has
a derivative at \(q=1\), or that higher power derivatives vanish
there. Establishing such statements would require additional estimates.

<a id="wip-6-9"></a>
## WIP-6.9 — a compensated positive-jump form of the normalized tangent

**Status: [PROVED FINITE-ATOM WEAK OPERATOR AND POSITIVE MINIMUM
PROPERTY; NO SEMIGROUP OR FORWARD-INVARIANCE THEOREM].**

Here \(C_b^2((0,\infty))\) denotes the twice continuously
differentiable functions for which \(f,f',f''\) are bounded. For each
initial rate put \(\chi_i(t)=\mathbf1_{\{|t-b_i|<1\}}\), and define

\[
\begin{aligned}
C_i(P)&=-(\Psi_B+1+\log M_P(0))\\
&\quad+\int_{D_P}\left[
\frac1t-\frac{1-\chi_i(t)}{t-b_i}\right]dt.
\end{aligned}
\tag{6.53}
\]

The integral is absolutely convergent and \(C_i(P)\) is bounded
uniformly in \(P\), with constants allowed to depend on the fixed
gamma parameters. The cutoff 1 is a chosen compensation convention,
not a distinguished mathematical scale.

For \(f\in C_b^2((0,\infty))\) set

\[
\boxed{
\mathcal A_P f
=\sum_i P_i b_i\left\{
C_i(P)f'(b_i)
+\int_{D_P}
\frac{f(t)-f(b_i)-(t-b_i)\chi_i(t)f'(b_i)}{(t-b_i)^2}\,dt
\right\}.
}
\tag{6.54}
\]

All integrals are absolutely convergent, uniformly in \(P\). With
\(f_s(t)=1/(s+t)\), the exact normalized tangent identity is

\[
\boxed{
\mathbb E_P\mathcal A_P f_s
=\frac{h(s)+g_1(s)}B.
}
\tag{6.55}
\]

Moreover, \(\mathcal A_P1=0\). It has the following positive minimum
property at the support of the initial Thorin measure:

\[
\begin{gathered}
f\ge0,\qquad f(b_i)=0\text{ for every }i\\
\Longrightarrow\quad
\mathbb E_P\mathcal A_P f
=\mathbb E_P\int_{D_P}
\left(\sum_i\frac{P_i b_i}{(t-b_i)^2}\right)f(t)\,dt
\ge0.
\end{gathered}
\tag{6.56}
\]

**Proof of convergence.** In (6.53) the cutoff removes the possible
pole at \(b_i\); the lower endpoint satisfies \(t\ge b_1>0\).
For large \(t\), the integrand is
\(1/t-1/(t-b_i)=O(t^{-2})\). Also
\(1/b_d\le M_P(0)\le1/b_1\). These facts give the claimed
uniform bound. In (6.54), Taylor's theorem bounds the numerator by
\(\|f''\|_\infty(t-b_i)^2/2\) when \(|t-b_i|<1\).
Outside this interval the numerator is bounded by \(2\|f\|_\infty\),
and \((t-b_i)^{-2}\) is integrable. This proves absolute convergence
and also bounds \(|\mathcal A_P f|\) by a constant times
\(\|f\|_\infty+\|f'\|_\infty+\|f''\|_\infty\), uniformly
in \(P\).

**Proof of the resolvent identity.** Combining the two integrals in
(6.53)--(6.54) gives the integrand

\[
\frac{f(t)-f(b_i)}{(t-b_i)^2}
-\frac{f'(b_i)}{t-b_i}+\frac{f'(b_i)}t.
\]

For the resolvent, (6.43) identifies this with

\[
\frac1{(s+b_i)^2}
\left(\frac1{s+t}-\frac1t\right).
\]

Since \(f_s'(b_i)=-(s+b_i)^{-2}\), (6.35) consequently yields

\[
\mathcal A_P f_s=W_P(s)(\Psi_B+1+\log M_P(s)).
\]

On the other hand \(g_1(s)/B=\mathbb E_P M_P(s)\), and
\(M_P(s)+sM_P'(s)=W_P(s)\). Adding \(g_1/B\) to (6.32)
therefore gives (6.55). All combinations of integrals just used are
between absolutely convergent expressions, as checked above.

For (6.56), each \(b_i\) is an interior minimum of \(f\), so
\(f'(b_i)=0\). Substitution in (6.54) proves the assertion;
Taylor's theorem still controls every apparent pole. \(\square\)

**Interpretation and scope.** The jump kernel is nonnegative, while
\(C_i(P)\) supplies the compensating drift at the original atoms.
For each summand separately the usual maximum principle holds whenever
\(f\) attains a global maximum at \(b_i\): its derivative is zero
and its jump term is nonpositive. This is an exact algebraic fact, not
an invocation of a general generator-existence theorem.

In particular, (6.54) is currently a weak functional attached to one
finite-atomic initial state. No well-posed nonlinear evolution on all
Thorin measures, preservation of its integrability domain, or agreement
of such an evolution with the actual power flow has been established.
At this stage the general finite-mass extension required additional
endpoint control. For an admissible finite Thorin measure,
\(M_P(0)\) is in fact finite almost surely by the logarithmic
Dirichlet-mean condition; what is unavailable from finite-atom estimates
is a uniform endpoint bound. The later
[WIP-6.11--6.13](19-finite-thorin-compensated-power-tangent.md)
use a strictly positive logarithmic anchor and supply that extension
on a specified test domain.

<a id="wip-6-10"></a>
## WIP-6.10 — the tangent is realized by an explicit curve of GGC laws

**Status: [PROVED ONE-TIME TANGENT REALIZATION; THE CONSTRUCTED CURVE
IS NOT THE ACTUAL POWER FLOW].**

Write \(w_i=\beta_i/B\), and define the nonnegative jump measures and
finite drift coefficients

\[
J_i(dt)=\frac{b_i\,\mathbb E[P_i\mathbf1_{\{t\in D_P\}}]}
{(t-b_i)^2}\,dt,
\qquad d_i=b_i\mathbb E[P_iC_i(P)].
\tag{6.57}
\]

Values of the displayed densities at \(t=b_i\) may be set arbitrarily.
For \(0<\epsilon<1\), put

\[
\begin{aligned}
J_i^\epsilon&=\mathbf1_{\{|t-b_i|>\epsilon\}}J_i,
&\lambda_i^\epsilon&=J_i^\epsilon((0,\infty)),\\
d_i^\epsilon&=d_i-
\int_{\epsilon<|t-b_i|<1}(t-b_i)J_i(dt).
\end{aligned}
\tag{6.58}
\]

Since \(0\le P_i\le1\) and \(D_P\subseteq[b_1,\infty)\),

\[
\lambda_i^\epsilon=O(\epsilon^{-1}),\qquad
|d_i^\epsilon|=O(1+|\log\epsilon|).
\tag{6.59}
\]

For sufficiently small \(\delta>0\), take \(\epsilon=\sqrt\delta\)
and set \(a_i^\delta=w_i-\delta\lambda_i^\epsilon\). Define

\[
\boxed{
\mu_\delta
=\sum_i a_i^\delta
\delta_{\,b_i+\delta d_i^\epsilon/a_i^\delta}
+\delta\sum_i J_i^\epsilon,
\qquad
\mu_0=\sum_iw_i\delta_{b_i}.
}
\tag{6.60}
\]

Here \(\delta_x\) means a Dirac mass, and the un-subscripted
\(\delta\) is a time increment. Then \(\mu_\delta\) is a
probability measure supported on \([b_1/2,\infty)\), and

\[
\boxed{
\lim_{\delta\downarrow0}
\frac{\mu_\delta(f)-\mu_0(f)}\delta
=\mathbb E_P\mathcal A_P f,
\qquad f\in C_b^2((0,\infty)).
}
\tag{6.61}
\]

**Proof.** The bounds (6.59) follow by integrating respectively
\(b_i|t-b_i|^{-2}\) outside an \(\epsilon\)-neighborhood and
\(b_i|t-b_i|^{-1}\) between \(\epsilon\) and 1.
Consequently \(a_i^\delta=w_i+O(\sqrt\delta)>0\), and every
atomic shift is \(O(\delta(1+|\log\delta|))\). For small
\(\delta\) the shifted rates exceed \(b_1/2\); the jump measures
are supported above \(b_1\). Finally,

\[
\sum_i a_i^\delta+\delta\sum_i\lambda_i^\epsilon
=\sum_iw_i=1,
\]

which proves positivity, support and normalization.

Taylor expansion of the shifted atoms in (6.60) gives

\[
\begin{aligned}
\frac{\mu_\delta(f)-\mu_0(f)}\delta
&=\sum_i\left\{d_i^\epsilon f'(b_i)
+\int[f(t)-f(b_i)]J_i^\epsilon(dt)\right\}\\
&\quad+O\!\left(\|f''\|_\infty
\delta(1+|\log\delta|)^2\right).
\end{aligned}
\tag{6.62}
\]

Indeed each Taylor remainder after division by \(\delta\) is at
most \(\|f''\|_\infty\delta(d_i^\epsilon)^2/(2a_i^\delta)\),
and the denominators are bounded away from zero. Substituting
\(d_i^\epsilon\) combines the first line of (6.62) into

\[
\sum_i\left\{d_if'(b_i)+
\int_{|t-b_i|>\epsilon}
[f(t)-f(b_i)-(t-b_i)\chi_i(t)f'(b_i)]J_i(dt)\right\}.
\]

The omitted small-jump integrals are bounded in absolute value by
\(\|f''\|_\infty\sum_i b_i\epsilon\), using the quadratic
Taylor bound. They tend to zero, as does the remainder in (6.62).
Fubini in (6.54), justified by its absolute uniform bounds, now proves
(6.61). This proof also shows uniform convergence for families with
uniformly bounded \(C_b^2\) norms. \(\square\)

Define finite positive Thorin measures and their log derivatives by

\[
U_\delta=B e^{-\delta}\mu_\delta,
\qquad
\widetilde g_\delta(s)=\int\frac{U_\delta(dt)}{s+t}.
\tag{6.63}
\]

The support lower bound and finite mass ensure
\(\int\log(1+1/t)U_\delta(dt)<\infty\). Thus each
\(U_\delta\), with zero drift, defines a genuine GGC law. By
(6.55) and (6.61),

\[
\boxed{
\widetilde g_\delta(s)=g_1(s)+\delta h(s)+o(\delta).
}
\tag{6.64}
\]

The expansion holds uniformly for \(s\) in any compact subset of
\((0,\infty)\), also after any fixed number of \(s\)-derivatives:
the tests \(\partial_s^k f_s(t)=(-1)^k k!/(s+t)^{k+1}\) have
uniformly bounded \(C_b^2\) norms on such a compact set. The
factor \(e^{-\delta}\) subtracts \(g_1\) from the normalized
tangent \(h+g_1\), explaining the exact match with \(h\).
Here \(\delta\) is logarithmic power time; the actual flow has
\(g_{e^\delta}=g_1+\delta h+o(\delta)\) by WIP-6.6.

**Why this still does not give power closure.** The construction realizes
the compensated functional (6.54) on all the stated smooth tests, not
just selected Loewner quadratic forms. Its resolvent action agrees with
the actual power-transform tangent. This does not assume that an actual
Thorin measure exists beyond time zero or has a weak derivative. It supplies no
time-stepping error estimate, compactness and uniqueness theorem for
iterating the construction, or identification with the nonlinear power
flow beyond first order. Intermediate Thorin measures also need not be
finite atomic, so the finite-atom formula is not already an iterable
evolution theorem.

There is an explicit distinction between the two curves. The constructed
measure \(U_\delta\) stays above \(b_1/2\); the gamma--Dirichlet
argument in WIP-6.8 therefore gives its GGC law finite positive
exponential moments for \(0<\varepsilon<b_1/2\). The actual
\(X^{e^\delta}\) has none when \(\delta>0\). Thus these curves
cannot be equal, despite (6.64) and its fixed-order derivative versions.

## Consequences and remaining obligations

1. Every fixed finite Loewner matrix passes a law- and node-dependent
   right neighborhood of \(q=1\). A fixed finite node set cannot give a
   counterexample arbitrarily close to 1 for one fixed finite-gamma law.
2. The neighborhood may shrink with matrix size, coalescing nodes, node
   location, or the gamma parameters. No common neighborhood over all
   matrices has been proved, so Bondesson's all-matrix criterion cannot
   yet be invoked to conclude GGC.
3. The positivity here concerns tangent quadratic forms on the initial
   nullspace. It does not claim that \(H\) is positive semidefinite on the
   whole space, or that a frozen Dirichlet fibre is HCM/GGC.
4. Formula (6.37) identifies positive off-atom tangent density, with
   singular compensation at the original rates. WIP-6.9 gives the exact
   compensated weak functional, and WIP-6.10 realizes it by a genuine
   GGC curve. Ordinary finite signed-measure differentiation is not
   justified, and the realizing curve is not the actual power flow.
5. WIP-6.8 proves that any GGC representation of a strictly powered
   finite gamma law must have Thorin support reaching zero. The tangent
   jump vanishes below the initial smallest rate, so the moving support
   edge requires estimates beyond the present cut calculation.
6. The next P5 obligation is a remainder estimate or an evolution theorem
   strong enough to control all required Loewner matrices together.
   [WIP-6.5](15-global-criteria-and-power-flow.md#wip-6-5) additionally
   requires local closure on every GGC law, not merely finite gamma sums.
