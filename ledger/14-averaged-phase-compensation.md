# Route 2 + 5: averaged phase compensation

Support-aware shape propagation, reciprocal symmetry of the auxiliary
gamma--Dirichlet square, posterior-order obstructions, and the positive
complement that closes the heavy-endpoint compensation.

Entries: WIP-5.40, WIP-5.41, WIP-5.42, WIP-5.43, WIP-5.44.

Last reviewed: 2026-09-05.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

These entries distinguish the original square from its sufficient
auxiliary factor. Historical open-target wording in WIP-5.42--5.43 records
the state before WIP-5.44, which closes the heavy-endpoint compensation.
All new statements below are project deductions; their existing proof
inputs and external sources are identified explicitly.

## Progress entries

<a id="wip-5-40"></a>
### WIP-5.40 — support-count-aware downward propagation

**Status: [PROVED; DOES NOT CLOSE THE REMAINING THREE-RATE CASES].**

For an integer \(N\ge1\) and \(B,q>0\), write
\(\mathsf P_{\le N}(B,q)\) for the assertion that \(X^q\in GGC\)
for every finite gamma convolution of total shape \(B\) having at most
\(N\) distinct positive scales. Gamma variables in this definition are
independent and have unit rate. Equal scales are merged before counting
support points.

For \(N\ge2\), \(0<B<B_0\), and \(q>0\),

\[
\boxed{
\mathsf P_{\le N}(B_0,q)
\quad\Longrightarrow\quad
\mathsf P_{\le N-1}(B,q).
}
\tag{5.459}
\]

**Proof.** Let
\(X=\sum_{j=1}^n c_jG_{\beta_j}^{(j)}\), where
\(n\le N-1\), the \(c_j>0\) are distinct, and
\(\sum_j\beta_j=B\). Take \(H\sim G_{B_0-B}\) independent of
\(X\), and set
\[
X_\varepsilon=X+\varepsilon H.
\]
For every \(\varepsilon>0\), this has total shape \(B_0\) and at
most \(N\) distinct scales. The hypothesis gives
\(X_\varepsilon^q\in GGC\). As \(\varepsilon\downarrow0\),
\(X_\varepsilon^q\to X^q\) almost surely. Weak closure of GGC proves
(5.459). \(\square\)

This is the support-count version of
[WIP-5.29](10-route5-support-wide-closure-and-shape-propagation.md#wip-5-29).
That entry assumes the theorem at \(B_0\) for **arbitrary finite
support**, which is why its conclusion preserves arbitrary support.
Weak closure is an external input: see Bondesson (1992), Theorem 3.1.5,
printed pp. 34--35 / PDF pp. 43--44, as recorded in the
[foundational note](../notes/bondesson-1992-ggc-hcm-foundational-infrastructure.md).

In particular, the three-rate, total-shape-two theorem
[WIP-5.37](12-route5-three-rate-reductions-and-anchors.md#wip-5-37)
does not, by this argument, prove the three-rate theorem for
\(1<B<2\). Padding a three-rate law generally produces four rates.
For sufficiently small \(\varepsilon\), its scale differs from all
three original positive scales. Adding the missing shape at an original
scale instead would not produce a summand tending to zero and would
change the limiting law.

A theorem for arbitrary finite support at \(B_0=2,q=2\) would imply
the square theorem for arbitrary finite support and \(0<B\le2\).
More narrowly, a four-rate theorem at total shape two would suffice to
deduce the three-rate theorem below total shape two. Neither hypothesis
is supplied by WIP-5.37.

<a id="wip-5-41"></a>
### WIP-5.41 — reciprocal duality at the matched auxiliary gamma order

**Status: [PROVED FOR ARBITRARY FINITE SUPPORT AND EVERY POSITIVE TOTAL
SHAPE; AN EQUIVALENCE FOR THE AUXILIARY FACTOR].**

Let \(\beta_i,x_i>0\),
\(B=\sum_{i=1}^n\beta_i=2k\), and define
\[
M=\sum_i x_iP_i,\qquad
M^\dagger=\sum_i x_i^{-1}\widehat P_i,
\qquad
P,\widehat P\sim\operatorname{Dir}(\beta_1,\ldots,\beta_n).
\]
Only the marginal Dirichlet laws matter; a joint coupling is unnecessary.
Put \(K=\prod_i x_i^{-\beta_i}\) and
\[
L_M(s)=\mathbb E(1+sM^2)^{-k},\qquad
L_{M^\dagger}(s)=\mathbb E(1+s(M^\dagger)^2)^{-k}.
\]
Then, for \(s>0\),
\[
\boxed{L_M(s)=K s^{-k}L_{M^\dagger}(s^{-1}).}
\tag{5.460}
\]
Consequently, with each gamma independent of its mean,
\[
\boxed{
G_kM^2\in GGC
\quad\Longleftrightarrow\quad
G_k(M^\dagger)^2\in GGC.
}
\tag{5.461}
\]
If either law is GGC, both have zero drift and Thorin mass \(k\).
Their rate-form Thorin measures are related by the pushforward
\(u\mapsto1/u\).

**Projective identity.** For every bounded Borel function \(h\),
\[
\mathbb E[M^{-B}h(M^{-1})]
=K\,\mathbb E[h(M^\dagger)].
\tag{5.462}
\]
For completeness, set \(Q_i=x_iP_i/M\) on the open simplex, and
\(R=\sum_iQ_i/x_i\). Then \(M^{-1}=R\) and
\(P_i=Q_i/(x_iR)\). In the first \(n-1\) simplex coordinates, the
absolute Jacobian of this inverse map is
\[
\left(\prod_i x_i^{-1}\right)R^{-n}.
\]
This follows by differentiating \(Q_i/(x_iR)\) and applying the
rank-one determinant identity; equivalently, use
\(R=x_n^{-1}+\sum_{i<n}(x_i^{-1}-x_n^{-1})Q_i\).
The Dirichlet density times the Jacobian becomes
\[
K R^{-B}\,
\frac{\Gamma(B)}{\prod_i\Gamma(\beta_i)}
\prod_iQ_i^{\beta_i-1}.
\]
Multiplication by \(M^{-B}=R^B\) cancels the extra factor, proving
(5.462). The case \(n=1\) is immediate. The means stay in a compact
subinterval of \((0,\infty)\), so all weights used here are bounded.

Since
\[
(1+sM^2)^{-k}
=s^{-k}M^{-2k}(1+s^{-1}M^{-2})^{-k},
\]
(5.462), with \(B=2k\), proves (5.460).

**Thorin equivalence.** Write \(g_M=-(\log L_M)'\), and similarly
for \(M^\dagger\). Differentiating (5.460) yields
\[
g_M(s)=\frac{k}{s}-\frac{g_{M^\dagger}(1/s)}{s^2}.
\tag{5.463}
\]
For either of these bounded positive means, direct differentiation and
dominated convergence give
\[
\lim_{s\to\infty}s g_M(s)=k.
\]
Indeed, factor \(s^{-k}M^{-2k}\) from the denominator and the
corresponding \(s^{-k-1}M^{-2k}\) from its derivative. If
\(G_k(M^\dagger)^2\) is GGC, its Stieltjes representation
\[
g_{M^\dagger}(t)=d+\int_{(0,\infty)}\frac{\tau(du)}{t+u}
\]
therefore has \(d=0\) and \(|\tau|=k\), by monotone convergence
applied to \(t/(t+u)\). Substituting this representation into (5.463)
gives
\[
\boxed{
g_M(s)=\int\frac{u}{1+su}\,\tau(du)
=\int\frac{\tau(du)}{s+u^{-1}}.
}
\tag{5.464}
\]
This is Stieltjes. Its integral from zero to any positive \(s\) is
finite because \(L_M(0)=1\) and \(g_M\) is bounded near zero.
Thus it is an admissible Thorin representation for \(L_M\).
Applying the same reasoning to the reciprocal scales proves the
converse. This proof uses no unverified logarithmic moment of \(\tau\).
\(\square\)

The Stieltjes/Thorin equivalence is the external input in this last
step: Schilling--Song--Vondraček (2010), Theorem 8.2, printed pp. 73--75,
as fixed in [Source 3](references.md). The projective identity extends
[WIP-5.2](06-route5-recursion-and-initial-cones.md#wip-5-2), and
(5.460)--(5.464) extend the \(k=1\) argument of
[WIP-5.37](12-route5-three-rate-reductions-and-anchors.md#wip-5-37).

For three scales \(l<d<r\), reciprocation reverses their order and
carries their shapes with them. Thus the unresolved case with a shape
above one at the largest scale is equivalent, at the auxiliary level,
to one with a shape above one at the smallest scale.

This equivalence concerns \(Z=G_{B/2}M^2\). Gamma duplication gives
\[
X=G_BM,\qquad
X^2\overset d=4Z\,G_{(B+1)/2},
\tag{5.465}
\]
with independent factors on the right. The independent-product theorem
of Bondesson (2015), Theorem 1, printed pp. 1068--1071
([Source 1](references.md)), makes \(Z\in GGC\) sufficient for
\(X^2\in GGC\). No converse cancellation of the last gamma factor
has been established. In particular, a failure for \(Z\) alone would
not be a counterexample to the original power conjecture.

<a id="wip-5-42"></a>
### WIP-5.42 — the heavy-endpoint obstruction and the averaged target

**Status: [PROVED ASYMPTOTIC OBSTRUCTION TO THE OLD POINTWISE INVARIANT;
PROVED EXACT REDUCTION; AVERAGED COMPENSATION REMAINS A CONJECTURE].**

**Subsequent resolution:** the open compensation status in this entry is
superseded by [WIP-5.44](#wip-5-44), which proves (5.478). The pointwise
obstruction remains valid.

Assume
\[
\frac12<k<1,\qquad a,b>0,\qquad 1<c<2k,\qquad
a+b+c=2k,\qquad 0<l<d<r.
\tag{5.466}
\]
The shapes \((a,b,c)\) are attached to scales \((r,d,l)\). By
WIP-5.41 this is the only heavy-endpoint orientation requiring a new
argument. Set
\[
p=a+b=2k-c,\quad m=2k-1,\quad\delta=c-1,\quad
\gamma=k-\delta.
\]
Then \(0<\delta<m<k<1\), \(p=m-\delta>0\), and
\(0<\gamma<1\).

For \(W\sim\operatorname{Beta}(p,c)\), define, for \(\lambda>0\),
\[
\begin{aligned}
d_c(\lambda)&=\mathbb E[(1-(1+\lambda)W)^{-k};
                         W<(1+\lambda)^{-1}],\\
n_c(\lambda)&=\mathbb E[((1+\lambda)W-1)^{-k};
                         W>(1+\lambda)^{-1}],\\
r_c(\lambda)&=n_c(\lambda)/d_c(\lambda),\qquad
j_c(\lambda)=-(\log d_c)'(\lambda).
\end{aligned}
\tag{5.467}
\]
The functions \(d_c,n_c,r_c\) are positive, finite, and smooth for
\(\lambda>0\). The logarithmic derivative \(j_c\) is finite and
smooth there but is not assumed positive.

#### Exact denominator and endpoint asymptotics

The change of variables used in (5.449) of
[WIP-5.39](13-route5-three-rate-fractional-abel.md#wip-5-39)
does not require \(c\le1\). It gives
\[
d_c(\lambda)=
\frac{B(p,1-k)}{B(p,c)}(1+\lambda)^{-m}F(\lambda),
\qquad
F(\lambda)=\mathbb E(\lambda+T)^\delta,
\quad T\sim\operatorname{Beta}(1-k,p).
\tag{5.468}
\]
Here \(B(\cdot,\cdot)\) is Euler's beta function. To check directly,
substitute \(W=v/(1+\lambda)\) in \(d_c\), and then put
\(T=1-v\); the power of \(1+\lambda\) is
\(-p-c+1=-m\).

Define the strictly positive constant
\[
D=\frac{\delta B(1-k,k-\delta)}
        {B(1-k+\delta,p)}.
\tag{5.469}
\]
Then
\[
\boxed{
j_c(\lambda)\sim-D\lambda^{-\gamma},\qquad
j_c'(\lambda)\sim\gamma D\lambda^{-\gamma-1}
\quad(\lambda\downarrow0).
}
\tag{5.470}
\]

**Proof.** Dominated convergence first gives
\[
F(0)=\frac{B(1-k+\delta,p)}{B(1-k,p)}>0.
\]
For \(j=1,2\), scale \(t=\lambda v\) in the beta integrals for
\(F^{(j)}\). The part with \(t\) bounded away from zero stays bounded;
on a fixed neighborhood of zero dominated convergence after scaling
applies, since the limiting integrands are integrable both at zero and
infinity. This yields
\[
\begin{aligned}
F'(\lambda)&\sim
\frac{\delta B(1-k,k-\delta)}{B(1-k,p)}
\lambda^{-\gamma},\\
F''(\lambda)&\sim
\frac{\delta(\delta-1)B(1-k,k+1-\delta)}{B(1-k,p)}
\lambda^{-\gamma-1}.
\end{aligned}
\tag{5.471}
\]
For a detailed domination, split the original integral at any fixed
\(\varepsilon\in(0,1)\). On \((0,\varepsilon)\), the factor
\((1-t)^{p-1}\) is bounded, and after scaling the two dominating
functions are proportional to
\(v^{-k}(1+v)^{\delta-j}\), \(j=1,2\).
On \((\varepsilon,1)\), integrability of \((1-t)^{p-1}\) gives a
uniform bound. Both displayed singular powers diverge, so this latter
part is negligible.

The beta recurrence
\[
B(1-k,k+1-\delta)
=\frac{\gamma}{1-\delta}B(1-k,k-\delta)
\]
fixes the second constant. Finally,
\[
j_c=\frac{m}{1+\lambda}-\frac{F'}F,\qquad
j_c'=-\frac{m}{(1+\lambda)^2}-\frac{F''}F+
\left(\frac{F'}F\right)^2.
\]
The square term has order \(\lambda^{-2\gamma}\), which is smaller
than \(\lambda^{-\gamma-1}\) because \(\gamma<1\). Equations
(5.469)--(5.471) prove (5.470). \(\square\)

#### The old monotonicity fails inside admissible physical intervals

Fix the three scales. For \(x\in(l,d)\), put
\[
u=\frac{x-l}{x+l},\qquad
z_j=\frac{x_j-x}{x_j+x},\qquad
\lambda_d=\frac{z_d}{u},\quad\lambda_r=\frac{z_r}{u},
\qquad (x_d,x_r)=(d,r).
\]
Then \(0<\lambda_d<\lambda_r\). With \(y=\log x\), the affine
coordinate \(\lambda(Q)=\lambda_d+(\lambda_r-\lambda_d)Q\), for
fixed \(Q\in[0,1]\), satisfies
\[
\frac{d\lambda(Q)}{dy}=-L_x(\lambda(Q)),\qquad
L_x(\lambda)=\alpha_0(x)+\alpha_1(x)\lambda>0
\quad(\lambda_d\le\lambda\le\lambda_r),
\tag{5.472}
\]
where
\[
\alpha_0=\frac{1+u^2\lambda_d\lambda_r}{2u},\qquad
\alpha_1-\alpha_0=-\frac u2(1+\lambda_d)(1+\lambda_r).
\tag{5.473}
\]
These are the physical flow identities (5.446)--(5.447). Define
\(G_{c,x}(\lambda)=L_x(\lambda)j_c(\lambda)\), taking
\(\partial_\lambda\) with \(x\) fixed.

As \(x\uparrow d\),
\[
u\to u_0=\frac{d-l}{d+l}>0,\quad
\lambda_d\to0,\quad
\lambda_r\to R_0=\frac{r-d}{(r+d)u_0}>0,
\quad\alpha_0\to\frac1{2u_0},
\]
and \(\alpha_1\) has a finite limit. Choose the admissible interior
point \(\lambda_*(x)=2\lambda_d(x)\). For all \(x\) sufficiently
close to \(d\), it lies strictly between \(\lambda_d\) and
\(\lambda_r\); its corresponding beta coordinate is
\[
Q_*(x)=\frac{\lambda_d(x)}{\lambda_r(x)-\lambda_d(x)}\in(0,1).
\]
Using (5.470) and the bounded coefficients in (5.473) gives
\[
\boxed{
\partial_\lambda G_{c,x}(\lambda_*(x))
\sim\frac{\gamma D}{2u_0}
       \lambda_*(x)^{-\gamma-1}>0
\qquad(x\uparrow d).
}
\tag{5.474}
\]
Indeed \(\partial_\lambda G_{c,x}=\alpha_1 j_c+L_xj_c'\),
and the first term is smaller by one power of \(\lambda_*\).
Thus the attempted extension of (5.452), asserting that
\(G_{c,x}\) decreases throughout every physical interval, is false
for every parameter vector (5.466). The failure occurs at admissible
interior points, not only in an extension beyond the physical interval.
This does not determine the sign of the averaged phase derivative.

#### Exact averaged compensation target

Let \(Q\sim\operatorname{Beta}(a,b)\), and define the posterior law
\[
\Pi_x(dQ)=
\frac{d_c(\lambda(Q))}{\mathbb E_Qd_c(\lambda(Q))}
\operatorname{Beta}(a,b)(dQ).
\tag{5.475}
\]
Projective Dirichlet conditioning, as in (5.445), identifies the
physical Abel ratio with
\[
\rho_k(x)=\mathbb E_{\Pi_x}r_c(\lambda(Q)).
\]
For each fixed \(x\in(l,d)\), its \(\lambda\)-interval is compact
inside \((0,\infty)\). Differentiation under the beta integral is
therefore justified locally in \(x\), and logarithmic differentiation
of the posterior density gives the exact identity
\[
\boxed{
\frac{d\rho_k}{d\log x}
=-\mathbb E_{\Pi_x}[L_x(\lambda)r_c'(\lambda)]
+\operatorname{Cov}_{\Pi_x}
       (r_c(\lambda),G_{c,x}(\lambda)).
}
\tag{5.476}
\]
In particular, no sign for the covariance is assumed. The positive
two-node derivative is explicit:
\[
\boxed{
r_c'(\lambda)=
\frac{\Gamma(2k)^2\Gamma(1-k)}
     {\Gamma(k)\Gamma(p)\Gamma(c)}
\frac{\lambda^{c-k-1}}
     {(1+\lambda)^{2k}d_c(\lambda)^2}>0.
}
\tag{5.477}
\]
To verify the normalization, put \(t=(1+\lambda)^{-1}\). The
unnormalized Abel denominator \(D_{p,c}(t)\) in (5.439) satisfies
\(d_c=t^kD_{p,c}/B(p,c)\). Substituting this into the Wronskian
(5.442), and using \(dt/d\lambda=-t^2\), gives (5.477).
Thus (5.477) depends only on the already proved two-node lemma in
[WIP-5.39](13-route5-three-rate-fractional-abel.md#wip-5-39).

**[CONJECTURE: heavy-endpoint averaged compensation].** For every
parameter vector (5.466) and every \(x\in(l,d)\),
\[
\boxed{
\operatorname{Cov}_{\Pi_x}
       (r_c(\lambda),G_{c,x}(\lambda))
<\mathbb E_{\Pi_x}[L_x(\lambda)r_c'(\lambda)].
}
\tag{5.478}
\]
This is exactly the missing strict left-cut inequality in (5.476).
The non-strict version is necessary and sufficient for the
nonincreasing left-cut Abel ratio. Strictness is the proposed stronger
target; GGC membership only requires the non-strict version.

Under (5.466), \(a<1\). The right-cut proof of WIP-5.39 requires only
this condition on the shape at the largest scale, so it already proves
the required strict right-cut inequality. All knot and endpoint jumps
were handled in
[WIP-5.38](13-route5-three-rate-fractional-abel.md#wip-5-38).
Together with those results, the non-strict form of (5.478) would prove
\(G_kM^2\in GGC\) by the exact auxiliary criterion (5.396) in
[WIP-5.36](13-route5-three-rate-fractional-abel.md#wip-5-36).
Reciprocal duality would then handle the opposite heavy endpoint.
The remaining shapes are covered by WIP-5.39. This describes a possible
completion of the three-rate auxiliary theorem for \(1<B<2\);
it is not a claim that the completion has been proved.

A useful next proof must control the actual beta posterior in (5.475),
for example by an integrated identity or a boundary compensation.
Equation (5.474) rules out restoring the old decreasing-score argument.
A negative derivative of the auxiliary phase would refute the
corresponding auxiliary GGC assertion, while a counterexample to the
original square would still require a necessary-condition failure for
the original law in (5.465).

<a id="wip-5-43"></a>
### WIP-5.43 — a positive score spectrum and failure of generic posterior order

**Status: [PROVED SPECTRAL AND BERNSTEIN STRUCTURE; PROVED FAILURE OF
GENERIC BERNSTEIN-TEST MONOTONICITY; TARGET COMPENSATION STILL OPEN].**

**Subsequent resolution:** [WIP-5.44](#wip-5-44) proves the target-specific
compensation. The generic posterior-order obstructions proved here remain
valid and explain why that later proof compares a different pair of
positive posteriors.

Retain every hypothesis and notation of WIP-5.42, especially
\[
\delta=c-1,\quad p=a+b=m-\delta,\quad m=2k-1,\quad
\gamma=k-\delta\in(0,1),\qquad
F(\lambda)=\mathbb E(\lambda+T)^\delta,
\quad T\sim\operatorname{Beta}(1-k,p).
\]
This entry first makes the favorable spectral information precise, then
shows why it does not give a general order comparison of the outer
posteriors.

#### Positive spectrum of the fractional power average

There is a positive measure \(\sigma\) on \((0,1)\), with total
mass \(\delta\), such that
\[
\boxed{
\frac{F'(\lambda)}{F(\lambda)}
=\int_{(0,1)}\frac{\sigma(dt)}{\lambda+t},\qquad
j_c(\lambda)=\frac{m}{1+\lambda}
-\int_{(0,1)}\frac{\sigma(dt)}{\lambda+t}.
}
\tag{5.479}
\]
In particular the positive spectral mass being subtracted is strictly
smaller than the mass of the positive pole: \(\delta<m\).

**Proof.** Use principal powers to continue \(F\) to the cut plane.
For \(\operatorname{Im}z>0\), all values \((z+t)^\delta\) have
arguments in \((0,\pi\delta)\). This sector has opening less than
\(\pi\), so their positive average cannot vanish. The reflected
statement applies below the real axis. For \(0<u<1\), write
\[
\begin{aligned}
A(u)&=\mathbb E[(T-u)^\delta;T>u],&
B(u)&=\mathbb E[(u-T)^\delta;T<u],\\
A_-(u)&=\mathbb E[(T-u)^{\delta-1};T>u],&
B_-(u)&=\mathbb E[(u-T)^{\delta-1};T<u].
\end{aligned}
\]
All four are finite at each interior \(u\), because \(\delta>0\)
and the beta density is smooth there. The upper boundary is
\(F(-u+i0)=A(u)+e^{i\pi\delta}B(u)\), with
\(A'=-\delta A_-<0\) and \(B'=\delta B_->0\). Its phase
\(\theta(u)\) therefore satisfies
\[
\boxed{
\theta'(u)=
\frac{\delta\sin(\pi\delta)
       \{A(u)B_-(u)+B(u)A_-(u)\}}
     {A(u)^2+2A(u)B(u)\cos(\pi\delta)+B(u)^2}>0.
}
\tag{5.480}
\]
Dominated convergence in the positive-power averages gives
\(\theta(0+)=0\) and \(\theta(1-)=\pi\delta\). The phase is
constant outside these endpoints, so it has no endpoint jump.

For clarity, the analytic inversion has no omitted residues. The
logarithmic derivative \(h=F'/F\) has identical real boundary values
on \(( -\infty,-1)\) and extends across that interval: the constant
factors \(e^{\pm i\pi\delta}\) in the two branches cancel in
the ratio. It is therefore holomorphic off \([-1,0]\). Moreover
\(h(z)\sim\delta/z\) at infinity. At zero, the beta scaling of
WIP-5.42 gives \(h(z)=O(|z|^{-\gamma})\). At the other endpoint,
\(F(-1\pm i0)\ne0\), and the corresponding beta scaling gives
\(h(z)=O(|z+1|^{m-1})\). The latter exponent comes from
\(p+\delta-1=m-1\) in the local integral for \(F'\).
These bounds hold on the indented cut-plane contours; splitting the
beta integral into a fixed endpoint neighborhood and its complement
gives the same integrable power bounds. Since \(\gamma<1\) and
\(m>0\), the small-circle integrals vanish. The keyhole Cauchy formula
thus reconstructs \(h\) from
\[
-\frac1\pi\operatorname{Im}h(-u+i0)
=\frac{\theta'(u)}\pi.
\]
Set \(\sigma(du)=\theta'(u)du/\pi\). This proves (5.479), and
\(|\sigma|=\delta\) follows either from the total phase change or
the asymptotic at infinity. There are no endpoint atoms. \(\square\)

This is the same cut-plane inversion used in
[WIP-5.34](12-route5-three-rate-reductions-and-anchors.md#wip-5-34).
The argument is given here as a direct project derivation; no claim of
literature novelty for fractional power averages is made.

Since \(F(0)>0\), integration of (5.479) shows that
\(F(0)/F(\lambda)\) is a GGC Laplace transform. Its Thorin
integrability follows from the finiteness of
\(\log F(\lambda)-\log F(0)\), using Tonelli. In particular
\(1/F\) is completely monotone. Combining (5.468) and (5.477) now
gives, with a constant \(K_r>0\),
\[
\boxed{
r_c'(\lambda)
=K_r\lambda^{-\gamma}(1+\lambda)^{2k-2}F(\lambda)^{-2},
\quad
K_r=
\frac{\Gamma(2k)^2\Gamma(1-k)}
     {\Gamma(k)\Gamma(p)\Gamma(c)}
\left(\frac{B(p,c)}{B(p,1-k)}\right)^2.
}
\tag{5.481}
\]
Every factor on the right is CM. Product closure of CM functions
(Schilling--Song--Vondraček (2010), Corollary 1.6, printed pp. 5--6;
[Source 3](references.md)) proves that \(r_c'\) is CM. Thus \(r_c\)
is an increasing, concave Bernstein function. It is bounded: its
derivative has order \(\lambda^{-\gamma}\) at zero and order
\(\lambda^{\gamma-2}\) at infinity, both integrable at the respective
endpoints. Also \(r_c(0+)=0\), by (5.467) or the endpoint beta
scaling. Crucially, \(r_c'(0+)=\infty\).

#### The outer posterior moves in the wrong direction for simple tests

Fix any parameter vector (5.466), and let \(x\uparrow d\). Write
\[
A_x=\lambda_d(x)\downarrow0,\quad
\Delta_x=\lambda_r(x)-\lambda_d(x)\longrightarrow R_0>0,
\qquad
\lambda=A_x+\Delta_x Q,
\quad Q\sim\operatorname{Beta}(a,b).
\]
The limits \(R_0\) and \(\alpha_{00}=1/(2u_0)>0\) are those of
WIP-5.42. Put
\[
Z_x=\mathbb E_Qd_c(A_x+\Delta_xQ),\quad
Z_0=\mathbb E_Qd_c(R_0Q)>0,\quad d_0=d_c(0+)>0.
\]
The function \(d_c\) extends continuously to zero, so dominated
convergence gives \(Z_x\to Z_0\). Since
\[
p=\gamma+k-1<\gamma,\qquad 0<a<p,
\]
the constant
\[
C_0=\frac{d_0}{Z_0}\,R_0^{-a}
       \frac{B(a,\gamma-a)}{B(a,b)}
\tag{5.482}
\]
is finite and positive, and
\[
\boxed{
\mathbb E_{\Pi_x}\lambda^{-\gamma}
\sim C_0 A_x^{a-\gamma},\qquad
\mathbb E_{\Pi_x}G_{c,x}(\lambda)
\sim-\alpha_{00}D C_0 A_x^{a-\gamma}
\longrightarrow-\infty.
}
\tag{5.483}
\]

**Proof of the singular averages.** In the beta integral for the first
expectation, substitute \(Q=A_x v/\Delta_x\). The leading factor is
\(A_x^{a-\gamma}\Delta_x^{-a}\), and the limiting integral is
\[
\int_0^\infty v^{a-1}(1+v)^{-\gamma}\,dv
=B(a,\gamma-a).
\]
It converges because \(0<a<\gamma\). Splitting at a fixed small
positive beta coordinate justifies dominated convergence after scaling;
the part away from zero stays bounded and is negligible against the
diverging factor \(A_x^{a-\gamma}\). The continuous factors give
\(d_0/Z_0\) and \(R_0^{-a}\). For the second expectation, use
\(j_c(\lambda)\sim-D\lambda^{-\gamma}\), the convergence of
\(\alpha_0\), and boundedness of \(\alpha_1\) from (5.473).
The term involving \(\lambda j_c(\lambda)\) stays bounded because
\(1-\gamma>0\). The same split proves (5.483). \(\square\)

For any fixed function \(f\in C^1[0,R_1]\), with \(R_1>R_0\) chosen
to contain all the physical intervals for \(x\) sufficiently close
to \(d\), the posterior
differentiation identity is
\[
\frac d{d\log x}\mathbb E_{\Pi_x}f(\lambda)
=-\mathbb E_{\Pi_x}[L_x(\lambda)f'(\lambda)]
+\operatorname{Cov}_{\Pi_x}(f(\lambda),G_{c,x}(\lambda)).
\tag{5.484}
\]
Suppose \(f(0)=0\), \(f\ge0\), and
\[
\mu_{f,0}:=
\frac{\mathbb E_Q[d_c(R_0Q)f(R_0Q)]}{Z_0}>0.
\]
Its derivative is bounded on this compact interval, and
\(f(\lambda)=O(\lambda)\) near zero. Therefore the first expectation
in (5.484) is bounded, as is
\(\mathbb E_{\Pi_x}[f(\lambda)G_{c,x}(\lambda)]\).
Indeed the only new endpoint factor is
\(O(\lambda^{1-\gamma})\), which is bounded. Dominated convergence
also gives \(\mathbb E_{\Pi_x}f(\lambda)\to\mu_{f,0}\).
Consequently (5.483)--(5.484) imply
\[
\boxed{
\frac d{d\log x}\mathbb E_{\Pi_x}f(\lambda)
\sim\mu_{f,0}\alpha_{00}D C_0 A_x^{a-\gamma}>0
\qquad(x\uparrow d).
}
\tag{5.485}
\]

Taking \(f(\lambda)=\lambda\) proves that the posterior mean
increases near the middle knot. Thus these posteriors are not
decreasing in increasing-concave order; the linear function is already
an admissible increasing concave test. More strongly, for every fixed
\(t>0\), (5.485) applies to the bounded Bernstein function
\[
f_t(\lambda)=1-e^{-t\lambda}.
\]
Hence generic monotonicity for bounded Bernstein tests also fails.

The facts \(|\sigma|=\delta<m\) and \(r_c\in BF\) are therefore
insufficient to justify a theorem asserting decreasing posterior
expectations for every Bernstein test. Such a theorem is contradicted
by the actual posteriors, not by an unrelated mixing law. The true
target \(r_c\) has a singular derivative of order
\(\lambda^{-\gamma}\); its negative drift term in (5.476) need not
be bounded and can balance the adverse covariance. No conclusion about
its sign follows from (5.485). The target-specific compensation
(5.478), auxiliary GGC membership, and the original power conjecture
remain distinct open questions at this step.

<a id="wip-5-44"></a>
### WIP-5.44 — complementary beta solution and closure of heavy-endpoint compensation

**Status: [PROVED THE HEAVY-ENDPOINT COMPENSATION; COMPLETED THE
THREE-RATE SQUARE THEOREM FOR TOTAL SHAPE AT MOST TWO].**

The open target (5.478) has a positive answer. Retain (5.466), with
\(p=a+b\), \(\delta=c-1\), \(m=2k-1\), and
\(\gamma=k-\delta\). Then
\[
\boxed{
\frac{d\rho_k(x)}{d\log x}<0
\qquad(l<x<d).
}
\tag{5.486}
\]
The proof uses the positive complement of the conditional ratio rather
than an order comparison for all Bernstein tests of the original
posterior. The latter remains false by WIP-5.43.

#### 1. An exact positive complement of the two-node ratio

Define
\[
\begin{gathered}
C_d=\frac{B(p,1-k)}{B(p,c)},\qquad
w(\lambda)=(1+\lambda)^{-m},\qquad
T\sim\operatorname{Beta}(1-k,p),\qquad
V\sim\operatorname{Beta}(1-p,k),\\
F(\lambda)=\mathbb E(\lambda+T)^\delta,\qquad
H(\lambda)=\mathbb E(\lambda+V)^{k-1},\\
r_\infty=
\frac{B(1-k,k-p)}{B(p,1-k)}
=\frac{\sin(\pi p)}{\sin(\pi(k-p))},\qquad
C_H=-\frac{\Gamma(c)\Gamma(p-k)}{\Gamma(k)B(p,c)}>0.
\end{gathered}
\tag{5.487}
\]
All beta parameters are positive: \(0<p<k<1\). Also
\(-1<p-k<0\), which fixes the displayed sign of \(C_H\).
The two functions satisfy \(F>0,F'>0,H>0,H'<0\) on
\((0,\infty)\). The required identity is
\[
\boxed{
d_c(\lambda)=C_dw(\lambda)F(\lambda),\qquad
r_\infty d_c(\lambda)-n_c(\lambda)
=C_Hw(\lambda)H(\lambda)>0.
}
\tag{5.488}
\]
In particular \(r_\infty-r_c=(C_H/C_d)H/F\).

Here is a differential-equation proof that determines the constants
without relying on a formal hypergeometric connection. The beta
integration-by-parts identity
\[
\mathbb E[T(1-T)\varphi'(T)]
=\mathbb E[((u+v)T-u)\varphi(T)],
\qquad T\sim\operatorname{Beta}(u,v),
\]
is justified by the vanishing factor \(t^u(1-t)^v\) at both
endpoints. Apply it with \(\varphi(t)=(\lambda+t)^{e-1}\).
After expressing the resulting moments through
\(Y(\lambda)=\mathbb E(\lambda+T)^e\) and its derivatives, one
obtains
\[
\lambda(1+\lambda)Y''-
\{e-1+u+(2e-2+u+v)\lambda\}Y'
+e(e-1+u+v)Y=0.
\]
For \((u,v,e)=(1-k,p,\delta)\) and
\((1-p,k,k-1)\), respectively, this is the same equation:
\[
\boxed{
\lambda(1+\lambda)Y''+
\{\gamma+(2-k-\delta)\lambda\}Y'
+\delta(k-1)Y=0.
}
\tag{5.489}
\]
Thus both \(F\) and \(H\) solve (5.489). Their asymptotics
\(F(\lambda)\sim\lambda^\delta\) and
\(H(\lambda)\sim\lambda^{k-1}\) at infinity show that they are
linearly independent and form a basis of solutions on
\((0,\infty)\).

The same equation is satisfied by \(U(\lambda)=n_c(\lambda)/w(\lambda)\).
Indeed, the unnormalized Abel numerator \(N_{p,c}(t)\) in (5.439)
solves (5.441), here written
\[
t(1-t)N''+(2-\gamma-2t)N'-k(1-k)N=0.
\]
Since
\(n_c=t^kN_{p,c}/B(p,c)\), putting
\(t=(1+\lambda)^{-1}\) gives
\(U=t^{1-k}N_{p,c}/B(p,c)\). Direct chain-rule differentiation
transforms the last displayed equation into (5.489).
This uses the already proved two-node Abel equation in
[WIP-5.39](13-route5-three-rate-fractional-abel.md#wip-5-39).

To identify the coefficient of \(F\), substitute
\(z=(1+\lambda)W\) in the defining numerator (5.467):
\[
n_c(\lambda)=\frac{(1+\lambda)^{-p}}{B(p,c)}
\int_1^{1+\lambda}(z-1)^{-k}z^{p-1}
       \left(1-\frac{z}{1+\lambda}\right)^{c-1}dz.
\]
As \(\lambda\to\infty\), dominated convergence applies: the last
factor is at most one because \(c>1\), and
\[
\int_1^\infty(z-1)^{-k}z^{p-1}dz=B(1-k,k-p)<\infty.
\]
Consequently
\(U(\lambda)\sim C_dr_\infty\lambda^\delta\), so
\(U=C_dr_\infty F+A_HH\) for some constant \(A_H\).
At zero, \(n_c(0+)=0\), while
\[
F(0)=\frac{B(c-k,p)}{B(1-k,p)},\qquad
H(0)=\frac{B(k-p,k)}{B(1-p,k)}>0.
\]
The numerator limit follows, for example, by the substitution
\(W=(1+\lambda v)/(1+\lambda)\), which extracts a factor
\(\lambda^{c-k}\); its remaining beta integral stays bounded.
It follows that
\[
A_H=-\frac{C_dr_\infty F(0)}{H(0)}=-C_H.
\]
The final equality follows by beta--gamma identities and
\(\Gamma(p-k)=\Gamma(1+p-k)/(p-k)\). This proves (5.488).

**Independent special-function normalization check.** Euler's integrals
give
\[
\begin{aligned}
F(\lambda)&=\lambda^\delta\,
{}_2F_1(-\delta,1-k;\gamma;-1/\lambda),\\
H(\lambda)&=\lambda^{k-1}\,
{}_2F_1(1-k,1-p;2-\gamma;-1/\lambda),\\
\frac{n_c(\lambda)}{w(\lambda)}
&=\frac{B(1-k,c)}{B(p,c)}\lambda^{c-k}
{}_2F_1(1-p,1-k;c+1-k;-\lambda).
\end{aligned}
\tag{5.490}
\]
The infinity connection formula
[NIST DLMF 15.8.2](https://dlmf.nist.gov/15.8.E2), with parameters
\((1-p,1-k;c+1-k)\) and argument \(-\lambda\), produces precisely
the two coefficients in (5.488). Its bold function is normalized:
\(\mathbf F(A,B;C;z)={}_2F_1(A,B;C;z)/\Gamma(C)\), as specified
in [DLMF 15.2.2](https://dlmf.nist.gov/15.2.E2). Converting that
normalization gives the ordinary-function coefficients
\[
\frac{\Gamma(c)\Gamma(p-k)}{\Gamma(k)B(p,c)}=-C_H,
\qquad
\frac{\Gamma(1-k)\Gamma(k-p)}{\Gamma(1-p)B(p,c)}=C_dr_\infty.
\]
Here \(p-k\in(-1,0)\) is not an integer, and
\(\arg(-(-\lambda))=0\), so the nonresonant connection formula
applies without taking limits. These primary-source formulas were
checked on 2026-09-05; the ODE proof above supplies an independent
derivation of the same identity.

#### 2. Comparing two positive posteriors

Fix \(x\in(l,d)\), write \(y=\log x\), and retain
\(\lambda(Q)=\lambda_d+(\lambda_r-\lambda_d)Q\),
\(Q\sim\operatorname{Beta}(a,b)\). Put
\[
\begin{aligned}
Z_F(x)&=\mathbb E_Q[w(\lambda)F(\lambda)],&
\nu_F(dQ)&=\frac{w(\lambda)F(\lambda)}{Z_F}\,\mathbb P_Q(dQ),\\
Z_H(x)&=\mathbb E_Q[w(\lambda)H(\lambda)],&
\nu_H(dQ)&=\frac{w(\lambda)H(\lambda)}{Z_H}\,\mathbb P_Q(dQ).
\end{aligned}
\tag{5.491}
\]
Both normalizers are finite and strictly positive. Equation (5.488)
turns the physical ratio into
\[
\rho_k(x)=r_\infty-\frac{C_H}{C_d}\frac{Z_H(x)}{Z_F(x)}.
\]
Define the positive physical function
\[
A_x(\lambda)=\frac{L_x(\lambda)}{1+\lambda}.
\]
Since \(\alpha_1-\alpha_0<0\),
\(A_x'(\lambda)=(\alpha_1-\alpha_0)/(1+\lambda)^2<0\).
Also \(H/F\) is strictly decreasing because \(H'<0<F'\).
The density ratio of the two posteriors is proportional to \(H/F\).
Therefore the elementary independent-copy covariance identity yields
\[
\boxed{
\mathbb E_{\nu_H}A_x-\mathbb E_{\nu_F}A_x
=\frac{\operatorname{Cov}_{\nu_F}(A_x,H/F)}
        {\mathbb E_{\nu_F}(H/F)}\ge0.
}
\tag{5.492}
\]
Only two functions with the same monotonicity are compared here; no
monotonicity assertion is made for the original posterior as \(x\)
varies.

For fixed \(Q\), the physical flow is
\(d\lambda/dy=-L_x(\lambda)\). Hence
\[
\begin{aligned}
\frac{d}{dy}\log[w(\lambda)F(\lambda)]
&=mA_x(\lambda)-L_x(\lambda)F'(\lambda)/F(\lambda),\\
\frac{d}{dy}\log[w(\lambda)H(\lambda)]
&=mA_x(\lambda)-L_x(\lambda)H'(\lambda)/H(\lambda).
\end{aligned}
\]
The \(\lambda\)-interval stays in a compact subset of
\((0,\infty)\) locally in \(x\), which justifies differentiation
under both expectations. Subtraction gives the exact positive
decomposition
\[
\boxed{
\begin{aligned}
\mathcal J(x):=
\frac d{dy}\log\frac{Z_H}{Z_F}
={}&m\{\mathbb E_{\nu_H}A_x-\mathbb E_{\nu_F}A_x\}\\
&+\mathbb E_{\nu_H}\left[-L_x\frac{H'}H\right]
+\mathbb E_{\nu_F}\left[L_x\frac{F'}F\right]>0.
\end{aligned}
}
\tag{5.493}
\]
The first term is nonnegative by (5.492) and \(m>0\); each of the
last two terms is strictly positive. Consequently
\[
\boxed{
\frac{d\rho_k}{d\log x}
=-\frac{C_H}{C_d}\frac{Z_H}{Z_F}\mathcal J(x)<0.
}
\tag{5.494}
\]
This proves (5.486), and the exact identity (5.476) proves the strict
compensation conjecture (5.478). The crucial replacement is the
complement \(r_\infty d_c-n_c\): its positive decreasing factor
\(H\), compared to the increasing factor \(F\), produces the
required covariance sign between two posteriors.

#### 3. Completed parameter range and limits of the conclusion

When \(c>1\), the right-cut proof of WIP-5.39 already applies because
\(a<1\). WIP-5.38 supplies every knot and endpoint jump. Equations
(5.486)--(5.494) therefore complete the auxiliary GGC criterion (5.396)
in this orientation. WIP-5.41 transfers it to the case \(a>1\).
WIP-5.39 covers the remaining vectors, including \(b>1\). Since at
most one coordinate can exceed one for \(1<B<2\), this proves
\[
\boxed{
G_{B/2}(rP_r+dP_d+lP_l)^2\in GGC,
\quad
(P_r,P_d,P_l)\sim\operatorname{Dir}(a,b,c),
\quad a,b,c>0,\quad 1<B=a+b+c<2,
\quad0<l<d<r.
}
\tag{5.495}
\]
Here \(G_{B/2}\) is independent of the Dirichlet vector \(P\).
Gamma duplication and Bondesson's independent-product theorem, exactly
as in (5.465), give the corresponding original square. Combining it
with WIP-5.26/WIP-5.29 for \(B\le1\) and WIP-5.37 for \(B=2\)
gives
\[
\boxed{
(rG_a+dG_b+lG_c)^2\in GGC
\qquad(a,b,c>0,\quad a+b+c\le2,\quad l,d,r>0).
}
\tag{5.496}
\]
The gammas are independent. Equal scales are merged and use the
two-rate theorem WIP-5.30 or the one-gamma case. This is a theorem for
at most three distinct scales; it is not the arbitrary-support,
total-shape-two theorem needed by the support-wide padding argument.
Nor does it prove arbitrary total shape or powers other than two.

#### 4. Endpoint balance as an independent sign check

The new global certificate agrees with the singular terms isolated in
WIP-5.43. Let \(J_0=\lim_{\lambda\downarrow0}
\lambda^\gamma r_c'(\lambda)=K_r/F(0)^2\). Beta--gamma reflection
identities give
\[
\frac{J_0}{D}=\frac{\sin(\pi\gamma)}{\sin(\pi\delta)},\qquad
\frac{J_0}{D}-r_\infty
=\frac{\sin^2(\pi k)}
       {\sin(\pi\delta)\sin(\pi\gamma)}>0.
\tag{5.497}
\]
Here \(p=\gamma+k-1\) and \(\delta=k-\gamma\); expanding
\(\sin(\pi p)\sin(\pi\delta)\) verifies the second identity.
Writing \(\rho_0=\lim_{x\uparrow d}\rho_k(x)\), dominated
convergence and (5.488) give \(0<\rho_0<r_\infty\). The same
beta scaling as (5.483) then yields
\[
\frac{d\rho_k}{d\log x}
\sim-\alpha_{00}C_0(J_0-D\rho_0)A_x^{a-\gamma}<0.
\tag{5.498}
\]
To check the residual term, \(r_c(\lambda)=O(\lambda^{1-\gamma})\)
implies \(r_c(\lambda)G_{c,x}(\lambda)
=O(\lambda^{1-2\gamma})\). Its beta average is bounded, logarithmic,
or of order \(A_x^{a+1-2\gamma}\), according to the exponent.
In all cases it is \(o(A_x^{a-\gamma})\), since
\(1-\gamma>0\). Thus the singular negative drift in the actual
target supplies precisely the compensation unavailable to the smooth
Bernstein tests in WIP-5.43.

The complement identity, posterior comparison and completed theorem are
new project deductions from the existing Abel equation and phase
criterion. The external closure inputs are those already cited in
WIP-5.41; the optional independent connection check has the exact DLMF
references above. No numerical sign evidence is used in this proof.
