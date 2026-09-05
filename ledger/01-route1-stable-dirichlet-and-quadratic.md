# Route 1A: stable tilting, Dirichlet means, and the quadratic benchmark

The tilted-stable factorization, exact Dirichlet-mean recognition target, and the first quadratic directing-law reductions.

Entries: WIP-1.1, WIP-1.2, WIP-1.3, WIP-1.4, WIP-1.5, WIP-1.6, WIP-1.7, WIP-1.8, WIP-1.9, WIP-1.10, WIP-1.11, WIP-1.12, WIP-1.13.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

Original WIP identifiers and equation numbers are preserved. Positional words such as "above" and "below" refer to the original numbered proof sequence.


## Route 1: Gamma--Dirichlet means and a tilted stable variable

Throughout this section,

\[
q>1,\qquad \rho=\frac1q,\qquad k=\rho B.
\]

<a id="wip-1-1"></a>
### WIP-1.1 — negative stable moments

**Status: [PROVED].**

Let \(S_\rho\) be normalized by

\[
\mathbb E[e^{-\lambda S_\rho}]=e^{-\lambda^\rho}.
\]

For \(u>0\), Tonelli and the gamma integral give

\[
\begin{aligned}
\mathbb E[S_\rho^{-u}]
&=
\frac1{\Gamma(u)}
\int_0^\infty
\lambda^{u-1}\mathbb E[e^{-\lambda S_\rho}]\,d\lambda\\
&=
\frac1{\Gamma(u)}
\int_0^\infty\lambda^{u-1}e^{-\lambda^\rho}\,d\lambda\\
&=
\frac{\Gamma(u/\rho)}{\rho\Gamma(u)}
=
\frac{\Gamma(1+u/\rho)}{\Gamma(1+u)}.
\end{aligned}
\tag{1.1}
\]

All integrands before the change of variables are nonnegative, so Tonelli
requires no prior integrability assertion.

<a id="wip-1-2"></a>
### WIP-1.2 — the tilted-stable gamma-power factorization

**Status: [PROVED].**

Define \(T_{\rho,B}\) by

\[
\mathbb E[f(T_{\rho,B})]
=
\frac{\mathbb E[S_\rho^{-k}f(S_\rho)]}
     {\mathbb E[S_\rho^{-k}]},
\qquad k=\rho B.
\tag{1.2}
\]

Let \(G_k\sim\Gamma(k,1)\) be independent of \(T_{\rho,B}\), and put
\(Z=G_k/T_{\rho,B}\). Conditional on \(T_{\rho,B}=t\),

\[
f_{Z\mid t}(z)=
\frac{t^k}{\Gamma(k)}z^{k-1}e^{-tz}.
\]

If \(f_\rho\) denotes the density of \(S_\rho\), averaging against the tilted
density \(t^{-k}f_\rho(t)/\mathbb E[S_\rho^{-k}]\) cancels \(t^k\):

\[
\begin{aligned}
f_Z(z)
&=
\frac{z^{k-1}}{\Gamma(k)\mathbb E[S_\rho^{-k}]}
\int_0^\infty e^{-tz}f_\rho(t)\,dt\\
&=
\frac{z^{k-1}e^{-z^\rho}}
{\Gamma(k)\mathbb E[S_\rho^{-k}]}.
\end{aligned}
\]

By (1.1),

\[
\Gamma(k)\mathbb E[S_\rho^{-k}]
=
\Gamma(k)\frac{\Gamma(1+B)}{\Gamma(1+k)}
=\frac{\Gamma(B)}{\rho}.
\]

Therefore

\[
f_Z(z)=
\frac{\rho}{\Gamma(B)}z^{\rho B-1}e^{-z^\rho},
\tag{1.3}
\]

which is exactly the density obtained from \(G_B\) under
\(z=x^{1/\rho}=x^q\). Hence

\[
\boxed{
G_B^q\overset d=\frac{G_{\rho B}}{T_{\rho,B}}.
}
\tag{1.4}
\]

This is a density proof and does not depend on a moment-determinacy
argument.

<a id="wip-1-3"></a>
### WIP-1.3 — exact reformulation for a finite gamma convolution

**Status: [PROVED REDUCTION].**

Combining (0.2) and (1.4), using independent copies on the right, gives

\[
\boxed{
X^q\overset d=
G_{\rho B}N_{\rho,B,F},
\qquad
N_{\rho,B,F}:=\frac{M^q}{T_{\rho,B}},
}
\tag{1.5}
\]

where \(G_{\rho B}\) is independent of \(N_{\rho,B,F}\).

Thus a sufficient target is to prove that \(N_{\rho,B,F}\) is an
order-\(\rho B\) Dirichlet mean.

<a id="wip-1-4"></a>
### WIP-1.4 — why the Dirichlet-mean target is essentially exact

**Status: [PROVED REDUCTION] for finite gamma convolutions without drift.**

Let \(c>0\), let \(F\) be a probability measure on positive scales, and let
\(M_c(F)\) be its order-\(c\) Dirichlet mean. The Markov--Krein identity is

\[
\mathbb E[(1+sM_c(F))^{-c}]
=
\exp\left\{
-c\int_0^\infty\log(1+sx)\,F(dx)
\right\}.
\tag{1.6}
\]

Since

\[
\mathbb E[e^{-sG_cM}\mid M]=(1+sM)^{-c},
\]

the product \(G_cM_c(F)\) is a GGC whose scale-form Thorin measure is
\(cF\). Conversely, a zero-drift GGC with finite Thorin mass \(c\) has this
representation by normalizing its Thorin measure.

For the finite gamma convolution (0.1),

\[
f_X(x)\sim
\frac{\prod_i b_i^{\beta_i}}{\Gamma(B)}x^{B-1}
\quad(x\downarrow0).
\]

Consequently,

\[
f_{X^q}(y)\sim
\frac{\rho\prod_i b_i^{\beta_i}}{\Gamma(B)}
y^{\rho B-1}.
\tag{1.7}
\]

Laplace scaling then gives

\[
\psi_q(s)\sim C s^{-\rho B},
\qquad
-\frac{s\psi_q'(s)}{\psi_q(s)}\longrightarrow\rho B.
\tag{1.8}
\]

If \(X^q\) is GGC, the Thorin representation and monotone convergence imply
that the limit in (1.8) is its total Thorin mass; it is therefore exactly
\(\rho B\), with no drift.

It remains to justify cancellation of the gamma factor.  If the finite-mass
representation gives \(X^q\overset d=G_{\rho B}D\), while (1.5) gives
\(X^q\overset d=G_{\rho B}N\), with independence in each product, then for
every \(t\in\mathbb R\)

\[
\frac{\Gamma(\rho B+it)}{\Gamma(\rho B)}
\mathbb E[D^{it}]
=
\frac{\Gamma(\rho B+it)}{\Gamma(\rho B)}
\mathbb E[N^{it}].
\]

The gamma function has no zeros.  Cancelling it identifies the
characteristic functions of \(\log D\) and \(\log N\), hence
\(D\overset d=N\).  The converse direction follows immediately from the
Markov--Krein identity.

Hence, for finite gamma \(X\),

\[
X^q\in GGC
\quad\Longleftrightarrow\quad
N_{\rho,B,F}\text{ in (1.5) is an order-}\rho B
\text{ Dirichlet mean}.
\tag{1.9}
\]

The stable--Dirichlet route is therefore an exact structural re-encoding of
the problem, not a stronger arbitrary sufficient condition.

<a id="wip-1-5"></a>
### WIP-1.5 — generalized Stieltjes transform of the candidate mean

**Status: [PROVED]; this calculation exposes the remaining gap.**

Let \(N=M^q/T_{\rho,B}\) and \(k=\rho B\). Conditional on \(M\), the tilt in
(1.2) gives

\[
\begin{aligned}
\mathbb E[(1+sN)^{-k}\mid M]
&=
\frac{\mathbb E[
S_\rho^{-k}(1+sM^q/S_\rho)^{-k}
]}{\mathbb E[S_\rho^{-k}]}\\
&=
\frac{\mathbb E[(S_\rho+sM^q)^{-k}]}
{\mathbb E[S_\rho^{-k}]}.
\end{aligned}
\tag{1.10}
\]

Using a gamma integral and then (1.1),

\[
\mathbb E[(1+sN)^{-k}]
=
\frac{\rho}{\Gamma(B)}
\int_0^\infty
u^{\rho B-1}e^{-u^\rho}
\mathbb E[e^{-suM^q}]\,du.
\tag{1.11}
\]

Set \(v=u^\rho\). Since \(M^q=M^{1/\rho}\),

\[
uM^q=(vM)^{1/\rho}=(vM)^q
\]

and (1.11) becomes

\[
\begin{aligned}
\mathbb E[(1+sN)^{-k}]
&=
\frac1{\Gamma(B)}
\int_0^\infty
v^{B-1}e^{-v}\mathbb E[e^{-s(vM)^q}]\,dv\\
&=
\mathbb E[e^{-s(G_BM)^q}]
=\psi_q(s).
\end{aligned}
\tag{1.12}
\]

Equation (1.12) is consistent with (1.5), but it also shows that merely
computing this generalized Stieltjes transform does not solve the problem:
one must prove that its logarithm has the Markov--Krein form (1.6). The
route's possible gain must come from a new stable/Poisson--Dirichlet identity,
not from the transform calculation alone.

<a id="wip-1-6"></a>
### WIP-1.6 — a sharp \(B=1,q=2\) target

**Status: [PROVED REDUCTION].**

For \(\rho=1/2\),

\[
S_{1/2}\overset d=\frac1{4G_{1/2}}.
\tag{1.13}
\]

When \(B=1\), the tilt exponent is \(k=1/2\). Tilting
\((4G_{1/2})^{1/2}\) changes \(G_{1/2}\) into \(G_1\), so

\[
T_{1/2,1}\overset d=\frac1{4G_1}.
\tag{1.14}
\]

For the two-gamma model with
\(\beta_1=\beta_2=1/2\),

\[
M=c_2+(c_1-c_2)U,
\qquad U\sim\operatorname{Beta}(1/2,1/2),
\]

and (1.5) becomes

\[
X^2\overset d=
G_{1/2}\,
\left[
4G_1\bigl(c_2+(c_1-c_2)U\bigr)^2
\right].
\tag{1.15}
\]

Thus the first concrete Route 1 problem is:

> **[OPEN STEP R1-A]** Prove or disprove that
> \[
> 4G_1\bigl(c_2+(c_1-c_2)U\bigr)^2
> \]
> is an order-\(1/2\) Dirichlet mean for every \(c_1,c_2>0\).

This is strictly sharper than the original two-gamma formulation and is the
next structural target.

<a id="wip-1-7"></a>
### WIP-1.7 — the stable tilt for integer powers

**Status: [PROVED].**

The Mellin transform following from (1.1)--(1.2) is

\[
\mathbb E[T_{\rho,B}^{-z}]
=
\frac{\Gamma(B+z/\rho)\Gamma(\rho B)}
     {\Gamma(B)\Gamma(\rho B+z)},
\qquad \Re z>-\rho B.
\tag{1.16}
\]

If \(q=m\in\{2,3,\ldots\}\), so that \(\rho=1/m\), Gauss'
multiplication formula cancels the \(k=0\) factor and gives

\[
\boxed{
T_{1/m,B}^{-1}
\overset d=
m^m\prod_{j=1}^{m-1}G_{(B+j)/m},
}
\tag{1.17}
\]

where the gamma variables on the right are independent.  Equality follows
from the Mellin transforms on a real neighborhood of zero, equivalently
from uniqueness of the moment-generating function of the logarithm.

In particular,

\[
\boxed{
T_{1/2,B}^{-1}\overset d=4G_{(B+1)/2}.
}
\tag{1.18}
\]

Consequently the \(q=2\) Dirichlet-mean target for an arbitrary finite
gamma convolution is

\[
N_{1/2,B,F}
\overset d=
4G_{(B+1)/2}M^2.
\tag{1.19}
\]

This generalizes (1.14)--(1.15); it does not by itself prove that the
right-hand side is an order-\(B/2\) Dirichlet mean.

<a id="wip-1-8"></a>
### WIP-1.8 — the one-atom case closes

**Status: [ESTABLISHED INPUT plus PROVED DEDUCTION].**

If \(F=\delta_c\), then \(M=c\) and

\[
X^q=c^qG_B^q,\qquad
N=\frac{c^q}{T_{\rho,B}}.
\]

Gamma densities are HCM, and Bondesson's power theorem says that an
HCM-density random variable remains HCM under powers of absolute value at
least one.  Hence \(c^qG_B^q\) is GGC.  Its density

\[
f(y)=
\frac{\rho c^{-B}}{\Gamma(B)}
y^{\rho B-1}\exp\{-y^\rho/c\}
\tag{1.20}
\]

has Thorin mass \(\rho B\).  Applying the finite-mass equivalence in
WIP-1.4 yields

\[
\boxed{
\frac{c^q}{T_{\rho,B}}
\text{ is an order-}\rho B\text{ Dirichlet mean}.
}
\tag{1.21}
\]

Thus Route 1 is complete for a single Thorin atom.  For \(q=2\), its
explicit mean variable is \(4c^2G_{(B+1)/2}\).

The external inputs are Bondesson (2015), Proposition 4(a), p. 1066, and
the finite-Thorin-mass gamma--Dirichlet representation in
James--Roynette--Yor (2008), Proposition 1.3 and equations (33)--(38),
pp. 355--358.

<a id="wip-1-9"></a>
### WIP-1.9 — exact two-atom transforms and the posterior obstruction

**Status: [PROVED REDUCTION].**

For two atoms, write

\[
M=m(U):=c_2+(c_1-c_2)U,\qquad
U\sim\operatorname{Beta}(\beta_1,\beta_2),\qquad
B=\beta_1+\beta_2.
\tag{1.22}
\]

Let

\[
\ell_{B,q}(z):=\mathbb E[e^{-zG_B^q}].
\]

Then the generalized Stieltjes transform of \(N=M^q/T_{\rho,B}\) is

\[
K_2(s)
=
\int_0^1\ell_{B,q}(s\,m(u)^q)
\frac{u^{\beta_1-1}(1-u)^{\beta_2-1}}
     {\mathrm B(\beta_1,\beta_2)}\,du.
\tag{1.23}
\]

Equivalently, it has the positive two-dimensional kernel

\[
\begin{aligned}
K_2(s)
=\frac{\rho}{\Gamma(B)\mathrm B(\beta_1,\beta_2)}
\int_0^\infty&r^{\rho B-1}e^{-r^\rho}\\
{}\times\int_0^1&
u^{\beta_1-1}(1-u)^{\beta_2-1}
e^{-sr m(u)^q}\,du\,dr .
\end{aligned}
\tag{1.24}
\]

For \(\Re z>-\rho B\), its Mellin transform is

\[
\boxed{
\mathbb E[N^z]
=
\frac{\Gamma(B+qz)\Gamma(\rho B)}
     {\Gamma(B)\Gamma(\rho B+z)}
c_2^{qz}\,
{}_2F_1\!\left(
-qz,\beta_1;B;1-\frac{c_1}{c_2}
\right).
}
\tag{1.25}
\]

These formulas are exact, but a positive mixture is not yet the fixed
Markov--Krein directing measure that is needed.  To expose the obstruction,
put \(k=\rho B\),

\[
h_m(s):=
-\frac1k\frac{d}{ds}\log\ell_{B,q}(s m^q),
\]

and introduce the \(s\)-dependent posterior beta law

\[
\pi_s(du)=
\frac{\ell_{B,q}(s m(u)^q)}{K_2(s)}
\frac{u^{\beta_1-1}(1-u)^{\beta_2-1}}
     {\mathrm B(\beta_1,\beta_2)}\,du.
\tag{1.26}
\]

The normalized logarithmic derivative is

\[
H_2(s):=-\frac1k\frac{K_2'(s)}{K_2(s)}
=\mathbb E_{\pi_s}[h_{m(U)}(s)].
\tag{1.27}
\]

Each single-atom \(h_m\) is Stieltjes by WIP-1.8.  Directly differentiating
the posterior average gives

\[
\boxed{
H_2'(s)
=
\mathbb E_{\pi_s}[h_{m(U)}'(s)]
-k\,\operatorname{Var}_{\pi_s}(h_{m(U)}(s))
\le0.
}
\tag{1.28}
\]

Thus the first nontrivial monotonicity condition holds.  At the next order,
however,

\[
H_2''(s)
=
\mathbb E_{\pi_s}[h_m''(s)]
-3k\,\operatorname{Cov}_{\pi_s}(h_m,h_m')
+k^2\kappa_{3,\pi_s}(h_m),
\tag{1.29}
\]

and the last two terms have no evident joint sign.  In particular,
“average the one-atom Thorin measures” is invalid: the averaging measure
\(\pi_s\) depends on \(s\), and on the cut plane it would in general be a
complex weight.

For later moment tests, the raw moments are

\[
\mathbb E[(X^q)^r]
=
\frac{\Gamma(B+qr)}{\Gamma(B)}
c_2^{qr}\,
{}_2F_1\!\left(
-qr,\beta_1;B;1-\frac{c_1}{c_2}
\right).
\tag{1.30}
\]

> **[OPEN STEP R1-B]** In the two-atom case, prove that \(H_2\) is
> Stieltjes (equivalently, recover a fixed positive directing measure), or
> find a violation of its Pick/Stieltjes boundary condition.  For \(q=2\),
> this is the same problem as proving that
> \(4G_{(B+1)/2}M^2\) is an order-\(B/2\) Dirichlet mean.

<a id="wip-1-10"></a>
### WIP-1.10 — the first auxiliary mean is not itself GGC

**Status: [PROVED; REFUTED ROUTE].**

In the benchmark of WIP-1.6, normalize the two scale atoms as

\[
l=e^{-\theta},\qquad r=e^\theta,\qquad lr=1,\qquad \theta>0,
\]

and let \(M\) have the arcsine law on \([l,r]\).  The auxiliary variable in
(1.15) is

\[
N=4G_1M^2,
\tag{1.31}
\]

with \(G_1\) independent of \(M\).  We now prove that \(N\) is infinitely
divisible but is not GGC.

Conditioning on \(M\) first gives

\[
L_N(s)=\mathbb E\left[\frac1{1+4sM^2}\right].
\tag{1.32}
\]

The arcsine resolvent is

\[
\mathbb E\left[\frac1{1+kM}\right]
=\frac1{\sqrt{(1+kl)(1+kr)}}
=\frac1{\sqrt{1+2ak+k^2}},
\qquad a=\frac{l+r}{2}.
\tag{1.33}
\]

Applying (1.33) after the elementary partial-fraction decomposition of
\((1+4sM^2)^{-1}\), and then squaring, yields

\[
L_N(s)=\frac12\left[
\frac1{\sqrt{1-4s+4ia\sqrt s}}+
\frac1{\sqrt{1-4s-4ia\sqrt s}}
\right],
\]

initially for \(s>0\), with conjugate square-root branches. Their product
is \(\Delta(s)\), and elementary simplification gives

\[
\boxed{
L_N(s)^2=
\frac{\Delta(s)+1-4s}{2\Delta(s)^2},
\qquad
\Delta(s)=
\sqrt{1+4l^2s}\sqrt{1+4r^2s}.
}
\tag{1.34}
\]

Both square roots in (1.34) are their principal branches; this convention
matters on the cut.  Put

\[
x_-:=\frac{l^2}{4},\qquad x_+:=\frac{r^2}{4}.
\]

For \(x\in(x_-,x_+)\), the upper boundary value is

\[
\Delta(-x+i0)=i\delta(x),
\qquad
\delta(x)=
\sqrt{(1-4l^2x)(4r^2x-1)}.
\tag{1.35}
\]

Consequently,

\[
L_N(-x+i0)^2
=-
\frac{1+4x+i\delta(x)}{2\delta(x)^2}.
\tag{1.36}
\]

Since a Stieltjes transform has its upper boundary value in the lower half
plane, the correct square-root branch in (1.36) has

\[
\arg L_N(-x+i0)
=-\frac\pi2+
\frac12\arctan\frac{\delta(x)}{1+4x}.
\tag{1.37}
\]

Thus the canonical phase of the reciprocal complete Bernstein function
\(1/L_N\), on this interval, would have to equal

\[
\boxed{
\eta_N(x)=
\frac12-
\frac1{2\pi}\arctan\frac{\delta(x)}{1+4x}.
}
\tag{1.38}
\]

As \(x\downarrow x_-\) from inside the interval,

\[
\delta(x)=C_\theta\sqrt{x-x_-}\bigl(1+O(x-x_-)\bigr),
\qquad C_\theta>0.
\]

Hence \(\delta(x)/(1+4x)\) is strictly increasing immediately to the
right of \(x_-\), and (1.38) is strictly decreasing there.  The
Thorin--Bernstein criterion in WIP-2.3 requires the canonical phase to have
a nondecreasing representative.  A strict decrease on an interval cannot
be repaired by changing an almost-everywhere representative.  Therefore

\[
\boxed{\theta>0\quad\Longrightarrow\quad N\notin GGC.}
\tag{1.39}
\]

On the other hand, conditioning on \(M\) gives the density

\[
f_N(x)=
\mathbb E\left[
\frac1{4M^2}\exp\left\{-\frac{x}{4M^2}\right\}
\right],
\tag{1.40}
\]

which is completely monotone.  The Goldie--Steutel theorem therefore gives
\(N\in ID\).

This does **not** refute Conjecture 1.  It rigorously rules out only the
stronger shortcut “prove the mixing variable \(N\) itself is HCM/GGC.”  By
itself it does not decide whether \(N\) is an order-\(1/2\) Dirichlet mean;
WIP-1.11 below gives the exact equivalent test, and WIP-5.11 later settles
it positively for every rate contrast.

<a id="wip-1-11"></a>
### WIP-1.11 — exact order-\(1/2\) directing law in the benchmark

**Status: [PROVED FOR EVERY RATE CONTRAST], with the reduction below and
positivity supplied by WIP-5.11.**

For \(\theta>0\), continue with \(l=e^{-\theta}\), \(r=e^\theta\), and let
\(D\) have the arcsine density

\[
p_\theta(d)=
\frac{\mathbf1_{(l,r)}(d)}{\pi\sqrt{(d-l)(r-d)}}.
\]

At \(\theta=0\) use the degenerate convention \(D\equiv1\), equivalently
the weak limit as \(\theta\downarrow0\).

Let \(E\sim\Gamma(1,1)\) be independent and set \(N=4ED^2\).  To avoid
confusing this random variable with the numerator \(N_\theta\) of Route 2,
write in this section

\[
Q_\theta(u)=\mathbb E[e^{-u^2D^2}],
\quad
P_\theta(u)=\mathbb E[e^{-u^2D^2}\operatorname{erfi}(uD)],
\quad
R_\theta(u)=\frac{P_\theta(u)}{Q_\theta(u)}.
\]

Thus \(P_\theta=N_\theta\) and \(R_\theta=\mathcal R_\theta\) in the notation
of (2.23)--(2.24).  Define, with the principal square root,

\[
K_\theta(z)=\mathbb E[(z+N)^{-1/2}],
\qquad z\in\mathbb C\setminus(-\infty,0].
\]

Conditioning on \(D=d\) gives

\[
\mathbb E[(z+4d^2E)^{-1/2}]
=\frac{\sqrt\pi}{2d}e^{z/(4d^2)}
\operatorname{erfc}\!\left(\frac{\sqrt z}{2d}\right).
\tag{1.41}
\]

Because \(lr=1\), inversion preserves the arcsine law with a size weight:

\[
\mathbb E[h(D^{-1})]=\mathbb E[D^{-1}h(D)],
\qquad
\mathbb E[D^{-1}h(D^{-1})]=\mathbb E[h(D)].
\tag{1.42}
\]

This follows directly by substituting \(d\mapsto d^{-1}\) in the displayed
density.  Applying the second identity to (1.41) yields

\[
K_\theta(z)=\frac{\sqrt\pi}{2}\mathbb E\!\left[
e^{zD^2/4}\operatorname{erfc}\!\left(\frac{D\sqrt z}{2}\right)
\right].
\tag{1.43}
\]

Consequently, for \(x>0\) and \(u=\sqrt x/2\),

\[
\boxed{
K_\theta(-x+i0)=\frac{\sqrt\pi}{2}
\bigl(Q_\theta(u)-iP_\theta(u)\bigr).
}
\tag{1.44}
\]

If \(M_{1/2}(F)\) is a Dirichlet mean of order \(1/2\), its homogeneous
Markov--Krein identity is

\[
\mathbb E[(z+M_{1/2}(F))^{-1/2}]
=\exp\left\{-\frac12\int_0^\infty\log(z+y)\,F(dy)\right\}.
\tag{1.45}
\]

At every continuity point of \(F\), the upper boundary in (1.45) has
argument \(-\pi F(x)/2\).  Equation (1.44) therefore shows that the
directing probability law, if it exists, is unique and must have CDF

\[
\boxed{
F_\theta(x)=\frac2\pi
\arctan R_\theta\!\left(\frac{\sqrt x}{2}\right),
\qquad x>0.
}
\tag{1.46}
\]

There is no phase-wrapping ambiguity because the order-\(1/2\) boundary
phase lies in \((-\pi/2,0)\).  The endpoint expansions (2.31)--(2.33) give

\[
F_\theta(0+)=0,
\qquad F_\theta(\infty)=1,
\]

and

\[
\boxed{
F_\theta'(x)=
\frac{R_\theta'(\sqrt x/2)}
{2\pi\sqrt x\,[1+R_\theta(\sqrt x/2)^2]}.
}
\tag{1.47}
\]

More precisely,

\[
F_\theta(x)\sim\frac{2\cosh\theta}{\pi^{3/2}}\sqrt x
\quad(x\downarrow0),
\]

while, for \(\theta>0\),

\[
1-F_\theta(x)
\sim\frac{1}{\pi\sqrt{e^{-\theta}\sinh\theta}}
e^{-e^{-2\theta}x/4}
\quad(x\to\infty).
\tag{1.48}
\]

At \(\theta=0\), \(R_0=\operatorname{erfi}\) gives the same required
logarithmic integrability.  Hence a nondecreasing (1.46) is automatically
an admissible Markov--Krein base law.  Combining WIP-1.4 with the exact
phase criterion in WIP-2.3 proves the chain of equivalences

\[
\boxed{
N\in\mathcal D_{1/2}
\Longleftrightarrow F_\theta\text{ in (1.46) is a probability CDF}
\Longleftrightarrow R_\theta'(u)\ge0\ (u>0)
\Longleftrightarrow X_\theta^2\in GGC,
}
\tag{1.49}
\]

where \(\mathcal D_{1/2}\) denotes the laws of order-\(1/2\) Dirichlet
means and \(X_\theta^2\overset d=G_{1/2}N\), with independent factors on
the right.  The reverse implications here use the gamma-cancellation
equivalence of WIP-1.4 and the full CBF/TBF phase theorem of WIP-2.3; they
are not inferred from a boundary argument alone.

By (2.56),

\[
0\le\theta\le\frac12\log\frac{1+\sqrt5}{2}
\quad\Longrightarrow\quad R_\theta'(u)>0\quad(u>0).
\tag{1.50}
\]

This was the first nontrivial range obtained within Route 1.  The
all-contrast theorem (5.91) and the equivalences (1.49) now upgrade it to

\[
\boxed{
\theta\ge0
\quad\Longrightarrow\quad
R_\theta'(u)>0\ (u>0)
\quad\Longrightarrow\quad
F_\theta\text{ is a directing probability law}.
}
\tag{1.50a}
\]

Therefore (1.46)--(1.47) give an explicit absolutely continuous directing
law for every unequal rate pair.  If
\(\mathsf P_\theta\sim DP(\tfrac12F_\theta)\), then

\[
\boxed{
4G_1D^2\overset d=\int_0^\infty y\,\mathsf P_\theta(dy).
}
\tag{1.51}
\]

Equivalently, if \(C_+\) is standard half-Cauchy and \(R_\theta^{-1}\) is
the inverse of the strictly increasing function in (1.50a), a base atom has
the sampling representation

\[
V_\theta\overset d=4[R_\theta^{-1}(C_+)]^2,
\qquad V_\theta\sim F_\theta.
\tag{1.52}
\]

The base atom \(V_\theta\), the Dirichlet mean in (1.51), and the GGC
\(G_{1/2}N\) are three different random objects.  In particular, WIP-1.10
and (1.50a) give, for every \(\theta>0\), an explicit example of an ID,
non-GGC random variable that nevertheless is an order-\(1/2\) Dirichlet
mean.

For every \(\theta\ge0\), the rate-form Thorin measure of
\(X_\theta^2\), of total mass \(1/2\), is the reciprocal image of the
directing law:

\[
U_\theta=\frac12\operatorname{Law}(V_\theta^{-1}),
\qquad
2U_\theta((0,t])
=\frac2\pi\arctan\frac1{R_\theta(1/(2\sqrt t))}.
\tag{1.53}
\]

Thus \(2U_\theta\), not \(U_\theta\), is a probability measure.
Differentiation of (1.53) reproduces exactly the Route-2 Thorin density in
(2.25).  It also gives a literal bridge to Route 3.  With the notation
\(\xi_\theta(x)=\eta_\theta(1/x)\) of (3.34),

\[
\boxed{
F_\theta(x)=1-2\xi_\theta(x),
\qquad
F_\theta(dx)=-2\,d\xi_\theta(x),
\qquad
\sigma(dx)=\frac{x}{2}F_\theta(dx)=-x\,d\xi_\theta(x).
}
\tag{1.54}
\]

Thus the Route-1 directing law, the Route-2 Thorin phase, and the Route-3
cumulant representing measure are exactly the same candidate measure under
the indicated reciprocal and size transforms.

Two further exact real-variable formulations may be useful.  First,
differentiating (1.45) gives

\[
\boxed{
\int_0^\infty\frac{F_\theta(dy)}{z+y}
=-2\frac{K_\theta'(z)}{K_\theta(z)}
=\frac{\mathbb E[(z+N)^{-3/2}]}
{\mathbb E[(z+N)^{-1/2}]}.
}
\tag{1.55}
\]

For arbitrary contrast, proving that the final ratio is a Stieltjes
function of mass one is equivalent to (1.49), not an independent closure
theorem.  Second, if \(f_N\) is the density in (1.40), set

\[
A_-(x)=\int_0^x\frac{f_N(y)}{\sqrt{x-y}}\,dy,
\qquad
A_+(x)=\int_x^\infty\frac{f_N(y)}{\sqrt{y-x}}\,dy.
\]

The boundary decomposition of the generalized Stieltjes transform is

\[
K_\theta(-x+i0)=A_+(x)-iA_-(x),
\qquad
F_\theta(x)=\frac2\pi\arctan\frac{A_-(x)}{A_+(x)}.
\tag{1.56}
\]

Writing \(\Delta_N(x)=A_-(x)/\pi\), the order-\(1/2\) Abel inversion is

\[
f_N(x)=\frac d{dx}\int_0^x
\frac{\Delta_N(t)}{\sqrt{x-t}}\,dt.
\tag{1.57}
\]

For a general density this identity is read at Lebesgue points.  Here
\(f_N\) is a bounded-scale mixture of exponential densities and is smooth
on \((0,\infty)\), so (1.57) holds pointwise there.

Under the Markov--Krein representation,

\[
\Delta_N(x)=\frac1\pi
\exp\left\{-\frac12\int\log|x-y|\,F_\theta(dy)\right\}
\sin\frac{\pi F_\theta(x)}2.
\tag{1.58}
\]

This is the order-\(1/2\) Cifarelli--Regazzini formula.  Here it follows
directly from (1.45)--(1.56) and supplies an exact identity, not an
additional positivity argument.

Finally, the algebraic Laplace transform \(L_N\) from (1.34) gives the
contour-ready representation

\[
\boxed{
K_\theta(z)=\frac1{\sqrt\pi}\int_0^\infty
t^{-1/2}e^{-zt}L_N(t)\,dt,
\qquad
-2\frac{K_\theta'(z)}{K_\theta(z)}
=2\frac{\int_0^\infty t^{1/2}e^{-zt}L_N(t)\,dt}
{\int_0^\infty t^{-1/2}e^{-zt}L_N(t)\,dt}.
}
\tag{1.59}
\]

This follows from the Gamma integral for \((z+N)^{-1/2}\) and Tonelli in
the right half-plane.  Although (1.34) makes the input algebraic, the ratio
in (1.59) is still a posterior ratio: its first derivative has a variance
sign, while higher derivatives contain unsigned higher cumulants.  It is a
concrete contour-deformation subroute, not a proof.

> **[RESOLVED BENCHMARK R1-C].**  WIP-5.11 proves for every contrast that
> the ratio in (1.55) is Stieltjes, equivalently that the Abel odds
> \(A_-/A_+\) in (1.56) are increasing.  The corresponding problem for
> general powers \(q\ne2\) remains open.  For \(q=2\), WIP-5.30 later
> supplies the directing law for every total shape and every two-rate
> shape pair.

<a id="wip-1-12"></a>
### WIP-1.12 — left/right Abel half-integrals and the elasticity gap

**Status: [PROVED REDUCTION AND PROVED OBSTRUCTION].**

There is a one-dimensional Abel formulation of the monotonicity target in
WIP-1.11 which does not begin with the Route-2 pair kernel.  Put \(t=u^2\)
and define

\[
H_\theta(t)=\mathbb E\!\left[D e^{-tD^2}\right].
\tag{1.60}
\]

The identity

\[
\operatorname{Daw}(x)
=x\int_0^1e^{-x^2(1-v^2)}\,dv
\]

and the relation
\(e^{-x^2}\operatorname{erfi}(x)=2\operatorname{Daw}(x)/\sqrt\pi\)
give, after the substitution \(s=t(1-v^2)\),

\[
\boxed{
P_\theta(\sqrt t)
=\frac1{\sqrt\pi}\int_0^t
\frac{H_\theta(s)}{\sqrt{t-s}}\,ds.
}
\tag{1.61a}
\]

The right-sided half-integral follows directly from Tonelli:

\[
\begin{aligned}
\frac1{\sqrt\pi}\int_t^\infty
\frac{D e^{-sD^2}}{\sqrt{s-t}}\,ds
&=
\frac{De^{-tD^2}}{\sqrt\pi}
\int_0^\infty e^{-vD^2}v^{-1/2}\,dv\\
&=e^{-tD^2}.
\end{aligned}
\]

Consequently,

\[
\boxed{
Q_\theta(\sqrt t)
=\frac1{\sqrt\pi}\int_t^\infty
\frac{H_\theta(s)}{\sqrt{s-t}}\,ds.
}
\tag{1.61b}
\]

After scaling \(s=tx\), set

\[
A_t=\int_0^1\frac{H_\theta(tx)}{\sqrt{1-x}}\,dx,
\qquad
B_t=\int_1^\infty\frac{H_\theta(tx)}{\sqrt{x-1}}\,dx.
\tag{1.62}
\]

The common factor \(\sqrt t/\sqrt\pi\) cancels, so that
\(R_\theta(\sqrt t)=A_t/B_t\).  Define the logarithmic elasticity

\[
\epsilon_\theta(s)
=-s\frac{H_\theta'(s)}{H_\theta(s)}
\tag{1.63}
\]

and the probability measures

\[
\alpha_t(dx)=
\frac{H_\theta(tx)(1-x)^{-1/2}}{A_t}\,dx,
\quad 0<x<1,
\]

\[
\beta_t(dy)=
\frac{H_\theta(ty)(y-1)^{-1/2}}{B_t}\,dy,
\quad y>1.
\]

Differentiation under the scaled integrals gives the exact identity

\[
\boxed{
t\frac d{dt}\log R_\theta(\sqrt t)
=
\mathbb E_{\beta_t}[\epsilon_\theta(tY)]
-
\mathbb E_{\alpha_t}[\epsilon_\theta(tX)].
}
\tag{1.64}
\]

In particular,

\[
\epsilon_\theta\text{ nondecreasing on }(0,\infty)
\quad\Longrightarrow\quad
R_\theta'(u)\ge0\quad(u>0).
\tag{1.65}
\]

This sufficient condition is non-circular, but it is false at large rate
contrast.  Indeed, under the \(D\)-size-biased exponential tilt

\[
\widetilde\nu_t(dd)
=
\frac{d e^{-td^2}}{H_\theta(t)}\,p_\theta(dd),
\]

one has

\[
\epsilon_\theta(t)
=t\,\mathbb E_{\widetilde\nu_t}[D^2],
\qquad
\boxed{
\epsilon_\theta'(t)
=
\mathbb E_{\widetilde\nu_t}[D^2]
-t\operatorname{Var}_{\widetilde\nu_t}(D^2).
}
\tag{1.66}
\]

Let \(\rho=e^\theta\).  The arcsine rate has the representation

\[
\frac{D_\rho}{\rho}
=V+\rho^{-2}(1-V),
\qquad
V\sim\operatorname{Beta}\!\left(\frac12,\frac12\right).
\]

At \(t_\rho=4/\rho^2\), bounded convergence in (1.66) yields

\[
\rho^{-2}\epsilon_\theta'(t_\rho)
\longrightarrow
\frac{I_0I_1+4I_1^2-4I_0I_2}{I_0^2},
\qquad
I_j=\mathbb E[V^{2j+1}e^{-4V^2}].
\tag{1.67}
\]

The limiting numerator is strictly negative by an exact rational
certificate.  If

\[
m_k=\mathbb E[V^k]=\frac{\binom{2k}{k}}{4^k}
\]

and \(P_n(x)=\sum_{k=0}^n(-x)^k/k!\), Taylor's theorem gives

\[
P_{15}(x)\le e^{-x}\le P_{14}(x),
\qquad x\ge0.
\]

Indeed, the Lagrange remainder has sign \((-1)^{n+1}\) for \(x>0\).
Applying these bounds at \(x=4V^2\) and integrating term by term gives

\[
\frac{9353}{10^5}<I_0<\frac{9363}{10^5},
\qquad
I_1<\frac{22905}{10^6},
\qquad
I_2>\frac{11345}{10^6}.
\tag{1.68}
\]

Therefore

\[
\begin{aligned}
I_0I_1+4I_1^2-4I_0I_2
&<
\frac{9363}{10^5}\frac{22905}{10^6}
+4\left(\frac{22905}{10^6}\right)^2\\
&\quad
-4\frac{9353}{10^5}\frac{11345}{10^6}\\
&=
-\frac{24803}{20000000000}<0.
\end{aligned}
\tag{1.69}
\]

The script
[route1_abel_elasticity_obstruction.py](../computations/route1_abel_elasticity_obstruction.py)
checks the integrated Taylor bounds, the simplified outward rational
bounds in (1.68), and (1.69), using only exact
fractions.Fraction arithmetic.

It follows from (1.67)--(1.69) that

\[
\boxed{
\epsilon_\theta'(4e^{-2\theta})<0
\quad\text{for all sufficiently large }\theta.
}
\tag{1.70}
\]

This is not a GGC counterexample.  It rules out only the global strategy
of proving the pointwise monotonicity in (1.65).  The averaged elasticity
comparison (1.64) remains exact and may still hold even when
\(\epsilon_\theta'\) changes sign.

<a id="wip-1-13"></a>
### WIP-1.13 — Cauchy duality and an algebraic-density GGC problem

**Status: [PROVED]; the equivalent GGC property is closed by WIP-5.11.**

Continue with

\[
N=4ED^2,\qquad E\sim\Gamma(1,1),
\]

and the generalized Stieltjes transform

\[
K_\theta(z)=\mathbb E[(z+N)^{-1/2}].
\]

Since \(\mathbb E[D^{-1}]=1\),

\[
K_\theta(0)
=\frac12\mathbb E[E^{-1/2}]\mathbb E[D^{-1}]
=\frac{\sqrt\pi}{2}.
\]

Define \(T_\theta\) by

\[
\mathbb E[e^{-zT_\theta}]
=\frac{K_\theta(z)}{K_\theta(0)}.
\tag{1.71}
\]

The gamma integral for \((z+N)^{-1/2}\) shows that this is a probability
law with density

\[
\boxed{
f_{T_\theta}(t)
=\frac2\pi t^{-1/2}L_N(t),
\qquad t>0.
}
\tag{1.72}
\]

There is also a direct distributional representation.  In the gamma
integral, conditional on the \(N^{-1/2}\)-tilted pair \((E,D)\), the
mixing variable is \(G_{1/2}/N\).  The tilt changes \(E\) from
\(\Gamma(1)\) to \(\Gamma(1/2)\), while (1.42) says that the
\(D^{-1}\)-tilted law of \(D\) is the law of \(D^{-1}\).  Hence, with all
right-hand factors independent,

\[
\boxed{
T_\theta
\overset d=
\frac{D^2}{4}\frac{G_{1/2}}{G'_{1/2}}
=
\left(\frac{DC_+}{2}\right)^2,
}
\tag{1.73}
\]

where \(C_+\) is standard half-Cauchy.

The algebraic transform (1.34) turns (1.72) into the explicit density

\[
\boxed{
f_{T_\theta}(t)
=
\frac{\sqrt{2(\Delta(t)+1-4t)}}{\pi\sqrt t\,\Delta(t)}
=
\frac{4\sqrt2\,\cosh\theta}
{\pi\Delta(t)\sqrt{\Delta(t)-1+4t}},
}
\tag{1.74}
\]

where

\[
\Delta(t)
=\sqrt{1+4e^{-2\theta}t}\sqrt{1+4e^{2\theta}t}.
\]

The equality of the two forms follows from

\[
(\Delta+1-4t)(\Delta-1+4t)
=16t\cosh^2\theta.
\]

The Mellin transform supplies a second exact check:

\[
\boxed{
\mathbb E[T_\theta^s]
=
4^{-s}\frac{P_{2s}(\cosh\theta)}{\cos(\pi s)},
\qquad -\frac12<s<\frac12,
}
\tag{1.75}
\]

where \(P_\nu\) is the Legendre function and the arcsine integral gives
\(\mathbb E[D^{2s}]=P_{2s}(\cosh\theta)\).

Most importantly,

\[
\boxed{
N\in\mathcal D_{1/2}
\quad\Longleftrightarrow\quad
T_\theta\in GGC.
}
\tag{1.76}
\]

For the forward direction, normalize the homogeneous Markov--Krein
identity (1.45) at \(z=0\): (1.71) becomes the Laplace transform of a GGC
whose rate-form Thorin measure is \(\tfrac12F\); equivalently, its
scale-form Thorin measure is the reciprocal image of \(\tfrac12F\).
Conversely, suppose that \(T_\theta\) is GGC.  Since
\(K_\theta(z)\sim z^{-1/2}\) and

\[
-z\frac d{dz}\log\frac{K_\theta(z)}{K_\theta(0)}
\longrightarrow\frac12,
\]

its GGC representation has zero drift and total Thorin mass \(1/2\).
To spell out the homogeneous constant, let \(U\) be the rate-form Thorin
measure of \(T_\theta\) and put
\(\varphi(z)=K_\theta(z)/K_\theta(0)\).  For \(z\ge1\),

\[
z^{1/2}\varphi(z)
=
\exp\left\{
\int_0^\infty\log\frac{zt}{z+t}\,U(dt)
\right\}.
\]

The integrand increases to \(\log t\); its negative part at \(z=1\) is
integrable because \(\varphi(1)>0\).  Monotone convergence, together with
\(z^{1/2}K_\theta(z)\to1\), gives

\[
\int_0^\infty\log t\,U(dt)=-\log K_\theta(0).
\]

It follows exactly that

\[
K_\theta(z)=
\exp\left\{-\int_0^\infty\log(z+t)\,U(dt)\right\}.
\]

Thus \(F=2U\) is the unique directing probability law in (1.45) (or, in
scale-form Thorin notation, one first takes the reciprocal image), proving
the reverse implication.

This equivalent variable has two useful strict properties:

\[
\boxed{
T_\theta\in ID\quad\text{for every }\theta\ge0,
\qquad
\theta>0\Longrightarrow f_{T_\theta}\text{ is not HCM}.
}
\tag{1.77}
\]

Indeed, both \(t^{-1/2}\) and the Laplace transform \(L_N(t)\) are
completely monotone, hence (1.72) is a completely monotone density and the
Goldie--Steutel theorem gives infinite divisibility.  If \(f_{T_\theta}\)
were HCM for \(\theta>0\), multiplication by \(t^{1/2}\) would preserve
HCM, so \(L_N\) would be HCM.  The HCM-Laplace-transform
characterization would then imply \(N\in GGC\), contradicting WIP-1.10.

The equivalent benchmark problem is now resolved: by (1.76) and
WIP-5.11,

\[
\boxed{
T_\theta=\left(DC_+/2\right)^2\in GGC
\qquad(\theta\ge0).
}
\tag{1.78}
\]

For \(\theta>0\), this GGC has the algebraic completely monotone density
(1.74), but that density is not HCM by (1.77).  Thus the benchmark
Route-1 target is closed.  WIP-5.30 later constructs the corresponding
directing law for every two-rate square and every total shape.  The next
two-rate Route-1 problem is therefore power \(q\ne2\), beginning with
\(1<q<2\).
