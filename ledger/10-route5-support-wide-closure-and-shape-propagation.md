# Route 5E: support-wide closure and shape propagation

Last-cut and all-cut balance, the finite total-shape-one theorem, and propagation to smaller total shape.

Entries: WIP-5.25, WIP-5.26, WIP-5.29.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

Original WIP identifiers and equation numbers are preserved. Positional words such as "above" and "below" refer to the original numbered proof sequence.

## Progress entries


<a id="wip-5-25"></a>
### WIP-5.25 — universal last-cut endpoint balance

**Status: [PROVED THE WIP-5.22 ENDPOINT TARGET; PROVED A STRICT
LAST-CUT BALANCE FOR EVERY TOTAL-SHAPE-ONE FINITE DIRICHLET MEAN].**

The open endpoint question after (5.243) has a positive answer, and the
condition \(c_M\ge0\) is not needed for the unweighted balance itself.
We first prove the three-rate statement in the notation

\[
(\alpha,\beta,\gamma),\qquad A<B<C,\qquad
p=\alpha+\beta=1-\gamma,\qquad s_2=\sin(\pi\gamma).
\]

Let

\[
(Q_1,Q_2,Q_3)\sim{\rm Dir}(\alpha,\beta,\gamma),\qquad
R=AQ_1+BQ_2+CQ_3.
\]

The order-one Markov--Krein identity and the density formula on the last
cut give

\[
a(x)=\mathbb E\frac1{R+x},\qquad
f_R(x)=\frac{s_2}{\pi}m_2(x),\qquad
h(x):=\frac{G_2(x)}{s_2}
=\frac{a(x)}{\pi f_R(x)}
\quad(B<x<C).
\tag{5.269}
\]

For arbitrary \(x\in(B,C)\), put \(q(x)=\mathbb P(R\le x)\) and define
the regularized endpoint balance

\[
\begin{aligned}
\mathcal F(x):={}&
U(0)+\int_x^C\bigl(G_2(x)-G_2(r)\bigr)m_2(r)\,dr\\
&-\pi\left[d_2+\frac{G_2(x)}{s_2}\right].
\end{aligned}
\]

The same total-mass cancellation as in (5.238), now without requiring
\(x=r_*\), gives

\[
\boxed{
\mathcal F(x)=L(x)-\pi h(x)q(x),\qquad
L(x)=\mathbb E\log\frac{R+x}{C-R}
+\pi\cot(\pi\gamma).
}
\tag{5.270}
\]

On the rising branch, \(\mathcal F\) is algebraically the same balance
\(F_{\rm full}\) defined in (5.233); the new notation extends that balance
to the whole last cut.  In particular,
\(\mathcal F(r_*)=F_{\rm full}(r_*)\).

The proof of positivity uses Dirichlet neutrality.  Set

\[
S=\frac{AQ_1+BQ_2}{Q_1+Q_2},\qquad W=Q_3.
\]

Then \(S\) and \(W\) are independent,
\(W\sim{\rm Beta}(\gamma,p)\), and

\[
R=S+(C-S)W.
\tag{5.271}
\]

Condition on \(S=\sigma\).  The conditional law is precisely the
two-rate, total-shape-one model with rates \((\sigma,C)\) and shapes
\((p,\gamma)\).  Its density, local likelihood ratio, and lower-tail
probability at \(x\) are

\[
\begin{aligned}
f_\sigma(x)
 &=\frac{s_2}{\pi}(x-\sigma)^{-p}(C-x)^{-\gamma},\\
h_\sigma(x)
 &=\frac1{s_2}
 \left(\frac{x-\sigma}{x+\sigma}\right)^p
 \left(\frac{C-x}{C+x}\right)^\gamma,\\
q_\sigma(x)
 &=I_{(x-\sigma)/(C-\sigma)}(\gamma,p).
\end{aligned}
\tag{5.272}
\]

Define

\[
L_\sigma(x)=
\mathbb E\left[
\left.\log\frac{R+x}{C-R}\right|S=\sigma
\right]+\pi\cot(\pi\gamma),
\qquad
K_\sigma(x)=L_\sigma(x)-\pi h_\sigma(x)q_\sigma(x).
\]

Differentiating
\({\rm B}(\gamma,1-\gamma)=\pi/\sin(\pi\gamma)\) shows that

\[
\mathbb E\log\frac W{1-W}=-\pi\cot(\pi\gamma),
\]

and consequently

\[
L_\sigma(x)=
\mathbb E_W\log\left(
1+\frac{x+\sigma}{(C-\sigma)W}
\right)>0.
\tag{5.273}
\]

More importantly, the two-rate Möbius true-lobe theorem
(5.84)--(5.89) gives

\[
\boxed{K_\sigma(x)>0\qquad(\sigma<x<C).}
\tag{5.274}
\]

Indeed, after scaling \((\sigma,C)\) to the normalization of WIP-5.11
and identifying that subsection's beta parameter with \(\gamma\),
\(K_\sigma(x)\) is exactly its unweighted true-lobe balance
\(\widehat P_0-\widehat N_1\).  Thus those earlier formulas directly
cover the rising branch.
If \(x\) is instead on the descending branch of the conditional
\(G_\sigma\), let \(x_-\) be the rising point at the same height.  Then

\[
K_\sigma(x)=K_\sigma(x_-)
+\int_{x_-}^x
\bigl(G_\sigma(u)-G_\sigma(x)\bigr)m_\sigma(u)\,du
>0.
\]

At the peak, the same conclusion follows from the strict true-lobe
decomposition, or by a one-sided limit.

It remains to check that mixing over \(S\) preserves this strict balance.
For fixed \(x\), \(f_\sigma(x)\) increases with \(\sigma\), whereas
\(h_\sigma(x)\) and \(q_\sigma(x)\) decrease:

\[
\partial_\sigma\log f_\sigma(x)=\frac p{x-\sigma}>0,\qquad
\partial_\sigma\log h_\sigma(x)
=-p\left(\frac1{x-\sigma}+\frac1{x+\sigma}\right)<0,
\tag{5.275}
\]

and

\[
\partial_\sigma\frac{x-\sigma}{C-\sigma}
=-\frac{C-x}{(C-\sigma)^2}<0.
\]

Since

\[
f_R(x)=\mathbb E f_S(x),\qquad
a(x)=\pi\mathbb E[f_S(x)h_S(x)],\qquad
q(x)=\mathbb E q_S(x),
\]

the reverse-order covariance of \(f_S,h_S\) and the same-order covariance
of \(h_S,q_S\) imply

\[
h(x)=\frac{\mathbb E[f_Sh_S]}{\mathbb E f_S}
\le\mathbb E h_S,\qquad
\mathbb E[h_Sq_S]\ge
\mathbb E h_S\,\mathbb E q_S
\ge h(x)\mathbb E q_S.
\tag{5.276}
\]

Combining (5.270), (5.274), and (5.276) gives the exact positive
decomposition

\[
\boxed{
\begin{aligned}
\mathcal F(x)
={}&\mathbb E K_S(x)
+\pi\{\mathbb E[h_Sq_S]-h(x)\mathbb E q_S\}\\
={}&\mathbb E K_S(x)
+\pi\left\{
\operatorname{Cov}(h_S,q_S)
+(\mathbb E h_S-h(x))\mathbb E q_S
\right\}>0.
\end{aligned}
}
\tag{5.277}
\]

Therefore

\[
\boxed{F_{\rm full}(r_*)>0.}
\tag{5.278}
\]

In particular, \(c_M\ge0\) alone now implies the endpoint inequality in
(5.235); by WIP-5.22's support-order argument it controls every actual
second-cut rising prefix for all \(t>0\).  The hypothesis \(c_M\ge0\)
is still needed at that final step to ensure that all density
contributions below the second cut used by the comparison are
nonnegative.  Equation (5.278) does not by itself control the first cut.

The proof extends verbatim to the last cut of any finite
total-shape-one Dirichlet mean.  Aggregate the first \(n-1\) coordinates
into

\[
S=\frac{\sum_{i<n}b_iQ_i}{1-Q_n},\qquad W=Q_n.
\]

Then \(S\perp W\), \(W\sim{\rm Beta}(\beta_n,1-\beta_n)\), and,
conditionally on \(S\), the last-cut law is again the complete two-rate
model already proved in WIP-5.11.  Thus the last-cut analogue of
\(\mathcal F(x)\) is strictly positive at every
\(x\in(b_{n-1},b_n)\).  Turning this unweighted endpoint theorem into a
weighted prefix certificate still requires nonnegative coefficients on
all lower pieces.  Every assertion in this subsection is a new project
derivation; the only non-elementary input is the already proved
WIP-5.11 two-rate theorem.

<a id="wip-5-26"></a>
### WIP-5.26 — all-cut conditional balance and the finite total-shape-one square theorem

**Status: [PROVED THE SQUARE IS GGC FOR EVERY FINITE GAMMA CONVOLUTION
OF TOTAL SHAPE ONE].**

The conditional argument in WIP-5.25 is not confined to the last cut.
Applied simultaneously to the lower and upper Dirichlet blocks, it closes
every cut and removes all parameter conditions from the finite
total-shape-one square problem.

Let \(\mu\) be the law of the rate Dirichlet mean \(R\), and write

\[
a_\mu(r)=\int\frac{\mu(dy)}{y+r},\qquad
\mathscr H_\mu(r)=\operatorname {pv}\!\int\frac{\mu(dy)}{y-r},
\]

with \(f_\mu\) denoting the density of \(\mu\).  For a fixed real center
\(\xi\), define

\[
\boxed{
\kappa_{\mu,\xi}(r)
=a_\mu(r)+\mathscr H_\mu(r)-\pi\xi f_\mu(r),\qquad
A_{\mu,\xi}(x)=\int_0^x\kappa_{\mu,\xi}(r)\,dr.
}
\tag{5.279}
\]

For a finite total-shape-one Dirichlet mean, the Cauchy boundary values
show that on \(I_j\)

\[
\kappa_{\mu,\xi}(r)
=a(r)+s_j(d_j-\xi)m_j(r)
=\pi f_\mu(r)\bigl(g_j(r)+d_j-\xi\bigr);
\]

on the two exteriors it is exactly the signed density used in
WIP-5.14.  Direct integration of the two Stieltjes kernels gives the
manifestly linear prefix formula

\[
\boxed{
A_{\mu,\xi}(x)=
\int\log\frac{y+x}{|y-x|}\,\mu(dy)
-\pi\xi F_\mu(x),\qquad
F_\mu(x)=\mu((0,x)).
}
\tag{5.280}
\]

Indeed, in the principal-value sense,

\[
\int_0^x\left(\frac1{y+r}+\frac1{y-r}\right)dr
=\log\frac{y+x}{|y-x|}.
\]

The logarithmic singularity is locally integrable.  Formula (5.280),
rather than a pointwise exchange of Hilbert transforms, makes linearity
under probability mixtures rigorous.

Fix \(1\le j<n\), \(x\in I_j=(b_j,b_{j+1})\), and put

\[
p=A_j=\sum_{i\le j}\beta_i,\qquad
\gamma=1-p,\qquad
s=\sin(\pi p)=\sin(\pi\gamma),\qquad
d_j=\cot(\pi p).
\]

Dirichlet neutrality supplies three mutually independent variables

\[
S=\frac{\sum_{i\le j}b_iQ_i}{\sum_{i\le j}Q_i},\qquad
T=\frac{\sum_{i>j}b_iQ_i}{\sum_{i>j}Q_i},\qquad
W=\sum_{i>j}Q_i\sim{\rm Beta}(\gamma,p),
\]

such that

\[
\boxed{
R=S+(T-S)W,\qquad
S\le b_j<x<b_{j+1}\le T.
}
\tag{5.281}
\]

Conditionally on \((S,T)=(u,v)\), this is the complete two-rate
total-shape-one model with endpoints \(u<v\) and shapes \((p,\gamma)\).
At \(x\), its density, local likelihood, and lower-tail probability are

\[
\boxed{
\begin{aligned}
f_{u,v}(x)
 &=\frac{s}{\pi}(x-u)^{-p}(v-x)^{-\gamma},\\
h_{u,v}(x)
 &=\frac1s
 \left(\frac{x-u}{x+u}\right)^p
 \left(\frac{v-x}{v+x}\right)^\gamma,\\
q_{u,v}(x)
 &=I_{(x-u)/(v-u)}(\gamma,p).
\end{aligned}
}
\tag{5.282}
\]

Consequently

\[
f_\mu(x)=\mathbb E f_{S,T}(x),\qquad
a_\mu(x)=\pi\mathbb E[f_{S,T}(x)h_{S,T}(x)],
\]

and

\[
\boxed{
h_j(x):=\frac{a_\mu(x)}{\pi f_\mu(x)}
=\frac{\mathbb E(f_{S,T}h_{S,T})}{\mathbb E f_{S,T}},
\qquad
F_\mu(x)=\mathbb E q_{S,T}(x).
}
\tag{5.283}
\]

Let \(\mu_{u,v}\) denote the conditional two-rate law and set

\[
K_{u,v}(x)
=A_{\mu_{u,v},\,d_j+h_{u,v}(x)}(x).
\]

The WIP-5.11 true-lobe theorem gives \(K_{u,v}(x)>0\) when \(x\) lies
on the rising branch of \(h_{u,v}\).  On the descending branch, let
\(x_-\) be the rising point at the same height.  Since the two centers
then agree,

\[
K_{u,v}(x)
=K_{u,v}(x_-)
+\int_{x_-}^x
\pi f_{u,v}(r)\bigl(h_{u,v}(r)-h_{u,v}(x)\bigr)\,dr>0.
\]

The peak follows from the same strict true-lobe decomposition, or by a
one-sided limit.  Thus

\[
\boxed{K_{u,v}(x)>0\qquad(u<x<v).}
\tag{5.284}
\]

Choose the full-model root center
\(\xi_x=d_j+h_j(x)\).  Linearity of (5.280), and the fact that changing
the center by \(\Delta\) subtracts
\(\pi\Delta q_{u,v}(x)\), yield

\[
\boxed{
A_{\mu,\xi_x}(x)
=\mathbb E K_{S,T}(x)
+\pi\left\{
\mathbb E(h_{S,T}q_{S,T})
-h_j(x)\mathbb E q_{S,T}
\right\}.
}
\tag{5.285}
\]

The term in braces is nonnegative for a structural reason.  Put
\(\overline f=\mathbb E f_{S,T}(x)\), tilt the independent law of
\((S,T)\) by \(f_{S,T}(x)/\overline f\), and denote covariance under the
tilted law by \(\operatorname {Cov}_f\).  Since (5.282) factorizes into a
function of \(u\) times a function of \(v\), the tilted law is still a
product law.  With \(r_{u,v}=q_{u,v}/f_{u,v}\), direct algebra gives

\[
\boxed{
\mathbb E(h_{S,T}q_{S,T})-h_j(x)\mathbb E q_{S,T}
=\overline f\,\operatorname {Cov}_f(h_{S,T},r_{S,T}).
}
\tag{5.286}
\]

Both \(h\) and \(r\) are coordinatewise increasing in \((-u,v)\).
For \(h\), this follows from

\[
\partial_u\log h
=-p\left(\frac1{x-u}+\frac1{x+u}\right)<0,\qquad
\partial_v\log h
=\gamma\left(\frac1{v-x}-\frac1{v+x}\right)>0.
\]

For \(r\), put

\[
a=x-u>0,\qquad y=v-x>0,\qquad w=y/a,\qquad
J_\gamma(w)=\int_w^\infty\frac{z^{-\gamma}}{1+z}\,dz.
\]

The substitution \(z=(1-t)/t\) in the incomplete beta integral gives

\[
\boxed{
r_{u,v}(x)=\frac{q_{u,v}(x)}{f_{u,v}(x)}
=a^py^\gamma J_\gamma(w).
}
\tag{5.287}
\]

At fixed \(y\), this is \(y w^{-p}J_\gamma(w)\), and

\[
\frac d{dw}\{w^{-p}J_\gamma(w)\}
=-p w^{-p-1}J_\gamma(w)-\frac{w^{-1}}{1+w}<0.
\]

Since \(w\) increases with \(u\), \(r\) decreases with \(u\).  At fixed
\(a\), it is \(a w^\gamma J_\gamma(w)\).  Integration by parts gives

\[
\boxed{
J_\gamma(w)-\frac{w^{1-\gamma}}{\gamma(1+w)}
=\frac1\gamma\int_w^\infty
\frac{z^{-\gamma}}{(1+z)^2}\,dz>0,
}
\tag{5.288}
\]

and hence

\[
\frac d{dw}\{w^\gamma J_\gamma(w)\}
=\gamma w^{\gamma-1}J_\gamma(w)-\frac1{1+w}>0.
\]

Thus \(r\) increases with \(v\).  A product probability measure is
associated: applying the one-dimensional independent-copy covariance
identity first conditionally in one coordinate and then to the two
conditional means in the other gives

\[
\operatorname {Cov}_f(h_{S,T},r_{S,T})\ge0.
\]

Equations (5.284)--(5.288) prove the all-cut unweighted theorem

\[
\boxed{
A_{\mu,\,d_j+h_j(x)}(x)>0
\qquad(1\le j<n,\ b_j<x<b_{j+1}).
}
\tag{5.289}
\]

Strictness comes from \(\mathbb E K_{S,T}(x)>0\); the covariance need
only be nonnegative.  WIP-5.25 is the special case in which the upper
block mean \(T\) is constant.

It remains to restore the Gaussian weight.  Fix \(\tau>0\), put
\(\xi=\Xi(\tau)\), and abbreviate
\(A_\xi(y)=A_{\mu,\xi}(y)\).  On \(I_j\),

\[
\kappa_{\mu,\xi}(r)
=\pi f_\mu(r)\{h_j(r)-\eta_j\},\qquad
\eta_j=\xi-d_j.
\]

The functions \(h_j=g_j\) are strictly one-peaked and vanish at their cut
endpoints.  Hence the only possible finite interior local minima of
\(A_\xi\) are rising roots of active cuts.  Interfaces cannot be minima:
a negative left side forces \(\eta_{j-1}>0\), hence
\(\eta_j=\eta_{j-1}+d_{j-1}-d_j>0\); a positive right side forces
\(\eta_j\le0\), hence \(\eta_{j-1}<0\).  At a rising root \(x\) on cut
\(j\), one has \(\xi=d_j+h_j(x)\), so (5.289) gives
\(A_\xi(x)>0\).

Consequently \(A_\xi(y)\ge0\) for \(0\le y\le x\) up to every active
rising root \(x\), with strict inequality at \(x\).  Indeed, if the
continuous function \(A_\xi\) were negative somewhere on this compact
interval, it would attain a nonpositive minimum away from \(0\); the sign
classification forces such a minimum to be an earlier rising root or an
interface, both of which have just been excluded.  Integration by parts
now yields

\[
\boxed{
\begin{aligned}
C_\tau(x)
&=\int_0^x e^{-\tau r^2}\kappa_{\mu,\xi}(r)\,dr\\
&=e^{-\tau x^2}A_\xi(x)
+2\tau\int_0^x r e^{-\tau r^2}A_\xi(r)\,dr>0.
\end{aligned}
}
\tag{5.290}
\]

Thus every possible rising local minimum of \(C_\tau\) is positive.
Multiplication by the positive Gaussian does not change the cut or
interface sign classification.  The lower exterior is positive; the
upper exterior is negative; and
\(C_\tau(0)=C_\tau(\infty)=0\), with \(C_\tau(b_n)>0\) from the strict
negative upper tail.  Therefore

\[
\boxed{
C_\tau(y)\ge0\quad(y>0),\qquad
\Xi'(\tau)>0\quad(\tau>0),
}
\tag{5.291}
\]

where the second assertion follows from the integration-by-parts identity
(5.142).  The total-shape-one phase criterion (5.13a) finally proves

\[
\boxed{
\left(\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i}\right)^2\in GGC,
\qquad
\beta_i>0,\qquad\sum_{i=1}^n\beta_i=1.
}
\tag{5.292}
\]

Tangent cases create no missing minima:
\(\eta_j=0\) makes the cut density nonnegative,
\(\eta_j=g_{j,*}\) gives an isolated tangency without a sign change, and
values outside \([0,g_{j,*}]\) make the cut one-signed.  Coincident rates
are merged using
\(G_\alpha/b+G_\beta/b\overset d=G_{\alpha+\beta}/b\); zero shapes are
deleted.  With one distinct rate, the conclusion is the standard HCM
power closure for \(G_1^2/b^2\).  Thus the distinct-positive-rate notation
causes no loss.

This theorem completely settles \(q=2\) for finite gamma convolutions of
total shape one.  It does **not** settle arbitrary total shape, arbitrary
\(q>1\), or Bondesson's full power conjecture.  Every assertion in this
subsection is a new project derivation, built on the WIP-5.11 two-rate
theorem and the standard Dirichlet neutrality already recorded in this
ledger.

<a id="wip-5-29"></a>
### WIP-5.29 — downward propagation in total shape

**Status: [PROVED A GENERAL SHAPE-PADDING LEMMA; CONSEQUENTLY PROVED THE
SQUARE THEOREM FOR EVERY FINITE GAMMA CONVOLUTION OF TOTAL SHAPE AT MOST
ONE].**

For \(B_0,q>0\), let \(\mathsf P(B_0,q)\) denote the statement that
\(Y^q\in GGC\) for every finite gamma convolution

\[
Y=\sum_{j=1}^n c_jG_{\gamma_j}^{(j)},\qquad
c_j,\gamma_j>0,\qquad \sum_j\gamma_j=B_0.
\]

Assume \(\mathsf P(B_0,q)\), fix \(0<B<B_0\), and let
\(X=\sum_jc_jG_{\beta_j}^{(j)}\) have total shape \(B\).  On an enlarged
probability space take \(H\sim G_{B_0-B}\) independent of \(X\), and put

\[
X_\varepsilon=X+\varepsilon H,\qquad \varepsilon>0.
\]

This is a finite gamma convolution of total shape \(B_0\), so
\(X_\varepsilon^q\in GGC\).  Moreover
\(X_\varepsilon^q\to X^q\) almost surely as
\(\varepsilon\downarrow0\).  The weak closure of GGC therefore proves

\[
\boxed{
\mathsf P(B_0,q)\quad\Longrightarrow\quad
\mathsf P(B,q)\ \text{for every }0<B\le B_0.
}
\tag{5.312}
\]

The added gamma has a vanishing scale, not a vanishing shape.  This is why
the hypothesis at \(B_0\) must allow arbitrary finite rate support.
Applying (5.312) to WIP-5.26, with \(B_0=1\) and \(q=2\), gives

\[
\boxed{
\left(\sum_{j=1}^n\frac{G_{\beta_j}^{(j)}}{b_j}\right)^2\in GGC
\quad\text{whenever}\quad
\beta_j,b_j>0,\qquad \sum_j\beta_j\le1.
}
\tag{5.313}
\]

This is a new project deduction from WIP-5.26 and the established weak
closure of GGC.  It does not propagate a theorem upward in total shape.
