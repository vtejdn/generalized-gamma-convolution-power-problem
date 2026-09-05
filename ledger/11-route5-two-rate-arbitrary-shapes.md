# Route 5F: two-rate squares with arbitrary shapes

The arbitrary-shape phase kernel, fractional HM_k inversion, total shape two, the full two-rate theorem, and the pointwise-kernel obstruction.

Entries: WIP-5.24, WIP-5.27, WIP-5.28, WIP-5.30, WIP-5.31.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

Original WIP identifiers and equation numbers are preserved. Positional words such as "above" and "below" refer to the original numbered proof sequence.

## Progress entries


<a id="wip-5-24"></a>
### WIP-5.24 — arbitrary-shape two-rate phase kernel and the symmetric integer ladder

**Status: [PROVED ARBITRARY-SHAPE BOUNDARY FORMULA; PROVED AN EXACT
\(0<B\le2\) PHASE CRITERION; PROVED A SYMMETRIC INTEGER-SHAPE GGC
FAMILY; PROVED ENDPOINT NO-GO THEOREMS FOR THE DIRECT \(HM_{B/2}\)
INVARIANT].**

The total-shape-one analysis can be separated from the choice \(B=1\).
Let

\[
X=\frac{G_a}{b_1}+\frac{G_c}{b_2},\qquad
B=a+c,\qquad p_b=b_1^ab_2^c,
\]

and let

\[
R=b_1Q+b_2(1-Q),\qquad Q\sim{\rm Beta}(a,c).
\]

All gamma variables in this subsection have unit rate and are independent
unless coupled explicitly.  The Dirichlet factorization in WIP-5.2 gives

\[
\psi(s):=\mathbb E e^{-sX^2}
=\frac{p_b}{\Gamma(B)}
 \mathbb E K_{B,2}(s,R),\qquad
K_{B,2}(s,r)=\int_0^\infty y^{B-1}e^{-sy^2-ry}\,dy.
\tag{5.254}
\]

Define the entire functions

\[
F_B(z)=\int_0^\infty t^{B-1}e^{-t^2}e^{2izt}\,dt,\qquad
F_{\mu,B}(u)=\mathbb E F_B(uR).
\]

For \(x>0\), put \(u=(2\sqrt x)^{-1}\).  Analytic continuation with the
principal square root yields the exact upper boundary value

\[
\boxed{
\psi(-x+i0)
=\frac{p_b}{\Gamma(B)}
 x^{-B/2}e^{-i\pi B/2}F_{\mu,B}(u).
}
\tag{5.255}
\]

Thus, on every interval on which \(F_{\mu,B}\ne0\), a continuous argument
lift gives

\[
\boxed{
\eta_B(x):=-\frac1\pi\Arg\psi(-x+i0)
=\frac B2-\frac1\pi\arg F_{\mu,B}(u).
}
\tag{5.256}
\]

The endpoint asymptotics are

\[
F_{\mu,B}(u)\longrightarrow\frac12\Gamma(B/2)
\quad(u\downarrow0),
\]

and

\[
F_{\mu,B}(u)\sim
\Gamma(B)e^{i\pi B/2}(2u)^{-B}\mathbb E R^{-B}
\quad(u\to\infty).
\]

The Dirichlet identity \(p_b\mathbb E R^{-B}=1\) fixes the local phase
normalizations
\(\eta_B(0+)=0\) and \(\eta_B(\infty)=B/2\).  For \(B>2\), these two
local branches need not belong to one global lift: zeros and the winding
number of \(F_{\mu,B}\) have not been controlled.  For \(0<B\le2\), the
Stieltjes representation below supplies the missing global zero-free
continuation.

There is also an exact averaged kernel.  Set

\[
\mathcal K_B(z_1,z_2)
=\frac12\Im\!\left[
z_1F_B'(z_1)\overline{F_B(z_2)}
+z_2F_B'(z_2)\overline{F_B(z_1)}
\right].
\]

For independent copies \(R_1,R_2\) of \(R\),

\[
\Im\!\left(F_{\mu,B}'(u)\overline{F_{\mu,B}(u)}\right)
=\frac1u\mathbb E\mathcal K_B(uR_1,uR_2),
\]

and hence

\[
\boxed{
\eta_B'(x)
=\frac{2u^2}{\pi|F_{\mu,B}(u)|^2}
 \mathbb E\mathcal K_B(uR_1,uR_2).
}
\tag{5.257}
\]

If \(F_B=C_B+iS_B\), the kernel is equivalently

\[
\begin{aligned}
\mathcal K_B(z_1,z_2)=\frac12\{&
z_1[S_B'(z_1)C_B(z_2)-C_B'(z_1)S_B(z_2)]\\
&+z_2[S_B'(z_2)C_B(z_1)-C_B'(z_2)S_B(z_1)]\}.
\end{aligned}
\]

For \(0<B\le2\), this phase test is an exact GGC criterion rather than
only a boundary identity.  Indeed \(Y=X^2\) has density

\[
f_Y(y)=\frac{p_b}{2\Gamma(B)}
y^{B/2-1}\mathbb E e^{-R\sqrt y}.
\]

Put \(\delta=1-B/2\), and define

\[
\nu_\delta(dq)=\frac{q^{\delta-1}}{\Gamma(\delta)}\,dq
\quad(\delta>0),\qquad
\nu_0=\delta_0,\qquad
\ell_r(dt)=\frac{r}{2\sqrt\pi}t^{-3/2}e^{-r^2/(4t)}\,dt.
\]

The elementary Laplace identities for \(y^{-\delta}\) and
\(e^{-r\sqrt y}\) give the explicit Stieltjes representation

\[
\boxed{
\psi(s)=\int_{[0,\infty)}\frac{\kappa_B(d\lambda)}{s+\lambda},
\qquad
\kappa_B=
\frac{p_b}{2\Gamma(B)}\mathbb E[\nu_\delta*\ell_R].
}
\tag{5.258}
\]

This \(\kappa_B\) is the Stieltjes spectral measure, not a Thorin measure.
The reciprocal-CBF/Thorin--Bernstein phase theorem used in WIP-2.3,
together with (5.257) and the endpoint values above, now gives

\[
\boxed{
X^2\in GGC
\quad\Longleftrightarrow\quad
\eta_B\ \hbox{is nondecreasing}
\quad\Longleftrightarrow\quad
\mathbb E\mathcal K_B(uR_1,uR_2)\ge0
\quad\hbox{for every }u>0,
}
\tag{5.259}
\]

for \(0<B\le2\).  The spectral density in (5.258) is strictly positive,
so the boundary value is nonzero; the displayed phase is the unique
continuous lift joining the two stated endpoint values.

The same reciprocal-Stieltjes mechanism cannot extend unchanged past
\(B=2\).  Scaling (5.254) gives

\[
\psi(s)\sim
\frac{p_b\Gamma(B/2)}{2\Gamma(B)}s^{-B/2}
\quad(s\to\infty).
\]

If \(B>2\), then \(s\psi(s)\to0\).  Every nonzero Stieltjes function

\[
f(s)=\frac{\alpha_0}{s}+\beta_0+
\int_0^\infty\frac{\rho(dt)}{s+t}
\]

instead has a strictly positive or infinite limit for \(sf(s)\), by
monotone convergence.  Therefore

\[
\boxed{B>2\quad\Longrightarrow\quad\psi\ \hbox{is not Stieltjes}.}
\tag{5.260}
\]

This is a no-go only for the WIP-5.3 reciprocal-CBF route.  It is not a
GGC counterexample: at equal rates, for example, \(X\) is gamma and
\(X^2\) has an HCM density.  Equation (5.255) remains valid when \(B>2\),
and (5.256)--(5.257) remain valid on each zero-free interval of
\(F_{\mu,B}\); without zero and winding control, kernel positivity alone
lacks the analytic reconstruction supplied by (5.258).

There is nevertheless a new positive ladder at arbitrary positive integer
summand shape, hence at every positive even-integer total shape.  Fix
\(0<l<r\), let

\[
M=l+(r-l)U,\qquad U\sim{\rm Beta}(m,m),\qquad
m\in\{1,2,\ldots\},
\qquad V=M^2.
\]

The density of \(V\) is

\[
f_V(y)=
\frac{(\sqrt y-l)^{m-1}(r-\sqrt y)^{m-1}}
{2\sqrt y\,{\rm B}(m,m)(r-l)^{2m-1}},
\qquad l^2<y<r^2.
\tag{5.261}
\]

Fix a hyperbolic center \(q\in(l^2,r^2)\), put
\(w=v+v^{-1}\) and \(T=\sqrt v+v^{-1/2}=\sqrt{w+2}\), and restrict to
the nonzero support \(2<w<W_q\) of
\(f_V(qv)f_V(q/v)\).  A direct multiplication gives

\[
f_V(qv)f_V(q/v)=C_qQ_q(w)^{m-1},
\tag{5.262}
\]

where \(C_q>0\) and

\[
\begin{aligned}
Q_q(w)&=P_l(T)P_r(T),\\
P_l(T)&=q+l^2-l\sqrt q\,T,\qquad
P_r(T)=r^2+q-r\sqrt q\,T\\
&>0\qquad(2<w<W_q).
\end{aligned}
\]

Equivalently,

\[
Q_q(w)=A_q+lrq\,w
-\sqrt q\,[l(r^2+q)+r(q+l^2)]\sqrt{w+2},
\]

with \(A_q\) independent of \(w\).  On the support,

\[
\frac{dQ_q}{dT}
=-l\sqrt q\,P_r-r\sqrt q\,P_l<0,
\qquad
(-1)^nQ_q^{(n)}(w)>0\quad(n\ge2).
\]

Thus \(Q_q\) is completely monotone there, and so is its integer power
\(Q_q^{m-1}\).  Extend (5.262) by zero on \(w\ge W_q\).
The factor \(Q_q\) has at least a simple zero at \(W_q\), so the first
\(m-2\) derivatives of \(Q_q^{m-1}\) vanish there.  In the sense of
distributions,

\[
H_q=
\frac{(-1)^m}{(m-1)!}
D^m\!\left(C_qQ_q^{m-1}\mathbf1_{\{w<W_q\}}\right)
\]

is a positive measure.  Interior positivity is complete monotonicity;
the only possible boundary atom has coefficient proportional to
\((-1)^{m+1}h_q^{(m-1)}(W_q-)\ge0\).  Repeated integration, and the
direct endpoint atom when \(m=1\), give

\[
\boxed{
f_V(qv)f_V(q/v)
=\int_{(w,\infty)}(\lambda-w)^{m-1}H_q(d\lambda),
\qquad M^2\in HM_m.
}
\tag{5.263}
\]

Centers outside \([l^2,r^2]\) give the zero function and are trivial;
endpoint centers follow by a limit.

Now let

\[
X=\frac{G_m^{(1)}}{b_1}+\frac{G_m^{(2)}}{b_2}.
\]

For \(b_1\ne b_2\), Gamma--Beta factorization gives \(X=G_{2m}M\), with
\(M\) of the preceding form after ordering \(b_1^{-1},b_2^{-1}\).  The
gamma duplication identity is

\[
G_{2m}^2\overset d=4G_mG_{m+1/2}.
\]

Sjödin's 2021 Theorem 3.1 applied with \(k=l=m\) and (5.263) shows that
\(G_mM^2\) is GGC.  The independent-product closure in Bondesson's 2015
Theorem 1 then yields

\[
\boxed{
\left(\frac{G_m^{(1)}}{b_1}
+\frac{G_m^{(2)}}{b_2}\right)^2\in GGC
\qquad
(m\in\{1,2,\ldots\},\ b_1,b_2>0).
}
\tag{5.264}
\]

If \(b_1=b_2\), then \(X\) is a scaled \(G_{2m}\) variable and its square
has an HCM density, so the same conclusion is immediate.
In particular, \(m=1\) gives the first all-rate two-summand theorem at
total shape \(B=2\).  The only external inputs in this paragraph are the
two cited theorems; the \(HM_m\) verification is a project derivation.

The same calculation also supplies a sharp obstruction to using
\(M^2\in HM_{B/2}\) as a general shape-changing invariant.  We first
record the endpoint-order lemma.  If \(k>0\),

\[
h(w)=\int_{(w,W]}(\lambda-w)^{k-1}H(d\lambda),\qquad H\ge0,
\]

and \(h(w)\sim C(W-w)^\gamma\) with \(C>0\) and \(\gamma>-1\), then

\[
\boxed{\gamma\ge k-1.}
\tag{5.265}
\]

For \(k\ge1\), finiteness of \(H\) near \(W\) and
\[
h(w)\le(W-w)^{k-1}H((w,W])
\]
prove the claim.  For \(0<k<1\), Tonelli and the beta integral give

\[
\boxed{
\int_x^W(w-x)^{-k}h(w)\,dw
={\rm B}(1-k,k)H((x,W]).
}
\tag{5.266}
\]

The right side stays bounded as \(x\uparrow W\), whereas
\(\gamma<k-1\) makes the left side asymptotic to a positive constant
times \((W-x)^{\gamma+1-k}\to\infty\).  If \(\gamma\le-1\), the left
side is already infinite for fixed \(x<W\), which is also impossible.

Apply this to

\[
M=l+(r-l)U,\qquad U\sim{\rm Beta}(a,c),\qquad
B=a+c,\qquad k=B/2.
\]

For a hyperbolic center \(q\in(l^2,lr)\), the terminal support point
meets only the lower endpoint and
\[
f_{M^2}(qv)f_{M^2}(q/v)
\asymp(W_q-w)^{a-1}.
\]
Thus (5.265) requires \(a\ge k\).  A center
\(q\in(lr,r^2)\) similarly requires \(c\ge k\).  Since \(a+c=2k\),

\[
\boxed{
a\ne c\quad\Longrightarrow\quad M^2\notin HM_{B/2}.
}
\tag{5.267}
\]

Even if \(a=c=k\), the center \(q=lr\) hits both endpoints and gives
exponent \(2k-2\).  For \(1/2<k<1\) this is smaller than \(k-1\);
for \(0<k\le1/2\) it is at most \(-1\).  Hence

\[
\boxed{
0<B<2,\quad l<r
\quad\Longrightarrow\quad M^2\notin HM_{B/2}.
}
\tag{5.268}
\]

Equations (5.267)--(5.268) disprove only the direct shape-matched
\(HM_{B/2}\) shortcut, not GGC membership of \(X^2\).  The complete
total-shape-one theorem WIP-5.11 is already a positive illustration of
that distinction.  At this stage the next continuous-shape case not
excluded by the endpoint lemma was the symmetric family
\(a=c=k>1\) with noninteger \(k\).  WIP-5.27 below supplies the required
fractional \(HM_k\) inversion and closes that family.  Every uncited
assertion in this subsection is a new project derivation.

<a id="wip-5-27"></a>
### WIP-5.27 — fractional \(HM_k\) inversion for the symmetric affine beta mean

**Status: [PROVED \(M^2\in HM_k\) FOR EVERY REAL \(k\ge1\);
PROVED THE CONVERSE FOR UNEQUAL ENDPOINTS; PROVED THE SYMMETRIC
TWO-RATE SQUARE THEOREM FOR EVERY REAL \(k\ge1\)].**

WIP-5.24 proved the assertion for integer \(k\) by ordinary
distributional differentiation.  The missing noninteger case can be
handled by a positive fractional Abel inversion.

Fix \(0<l<r\), let

\[
U\sim{\rm Beta}(k,k),\qquad M=l+(r-l)U,\qquad V=M^2,
\]

and first suppose that \(k>1\) is not an integer.  Put

\[
\alpha=k-1=m+\delta,\qquad
m=\lfloor\alpha\rfloor,\qquad 0<\delta<1,\qquad n=m+2.
\]

For a hyperbolic center \(q\in(l^2,lr]\), define

\[
W_q=\frac q{l^2}+\frac{l^2}q,\qquad
T_0=\frac{\sqrt q}{l}+\frac l{\sqrt q},\qquad
s=\frac{W_q-w}{T_0^2},\qquad y=\sqrt{1-s}.
\]

On the nonzero support of
\(f_V(qv)f_V(q/v)\), where \(w=v+v^{-1}\), the multiplication in
(5.261)--(5.262) reduces, up to a positive constant and a positive
rescaling of \(W_q-w\), to

\[
\boxed{
g(s)=F(s)^\alpha,\qquad
F(s)=(1-\sqrt{1-s})(1-\lambda\sqrt{1-s}),
}
\tag{5.293}
\]

where

\[
\lambda=\frac{r(q+l^2)}{l(r^2+q)}\in(0,1]
\quad\hbox{and}\quad
1-\lambda=
\frac{(r-l)(lr-q)}{l(r^2+q)}.
\]

Thus \(\lambda<1\) for \(q<lr\), while \(\lambda=1\) at the central
center \(q=lr\).  It is enough to produce a positive measure
\(\mu_q\) such that

\[
g(s)=\int_{[0,s)}(s-t)^\alpha\,\mu_q(dt).
\tag{5.294}
\]

Indeed, the affine change
\(\Lambda=W_q-T_0^2t\) then gives exactly the \(HM_k\) representation
in the \(w\)-variable.

We first establish the derivative inequalities needed for the Abel
inverse.  For \(0\le a\le1\), set

\[
A_a(s)=1-a\sqrt{1-s}.
\]

For \(j\ge1\),

\[
A_a^{(j)}(s)=
\frac{a(2j-3)!!}{2^j}(1-s)^{1/2-j}\ge0.
\]

Consequently \(F=A_1A_\lambda\) is absolutely monotone on \(0<s<1\).
Moreover

\[
\mathcal D(s):=sF'(s)-F(s)\ge0,
\]

because \(\mathcal D(0)=0\) and
\(\mathcal D'(s)=sF''(s)\ge0\).  If
\(E_a=sA_a'/A_a\) and \(E=sF'/F=E_1+E_\lambda\), direct
differentiation gives

\[
E_a'(s)=
\frac{a(1+y^2-2ay)}
     {4y^3(1-ay)^2}\ge0,
\qquad y=\sqrt{1-s},
\]

since \(1+y^2-2ay=(1-y)^2+2(1-a)y\).  Hence

\[
\boxed{
sF F''-F'(sF'-F)=F^2E'\ge0.
}
\tag{5.295}
\]

Let

\[
G=g^{(m+1)}=g^{(n-1)},\qquad
H=(1-\delta)G+sG'.
\]

Faà di Bruno's formula in partial Bell polynomials is

\[
D^j(F^\alpha)=
\sum_{h=1}^j
\alpha^{\underline h}F^{\alpha-h}
B_{j,h}(F',\ldots,F^{(j-h+1)}).
\tag{5.296}
\]

Here
\(\alpha^{\underline h}=\prod_{i=0}^{h-1}(\alpha-i)\), and the
exponential partial Bell polynomial convention is

\[
B_{j,h}(x_1,\ldots,x_{j-h+1})
=
\sum_{\substack{r_1+\cdots+r_{j-h+1}=h\\
                 r_1+2r_2+\cdots+(j-h+1)r_{j-h+1}=j}}
\frac{j!}{\prod_i r_i!}
\prod_i\left(\frac{x_i}{i!}\right)^{r_i}.
\]

Every term in \(G\) is strictly positive.  In \(g^{(n)}\), all falling
factorials are positive except the last one,

\[
\alpha^{\underline n}
=-(1-\delta)\alpha^{\underline{n-1}}.
\]

All Bell terms in \(H\) are therefore nonnegative except possibly the
combination involving indices \(n-1\) and \(n\).  Using

\[
B_{n-1,n-1}=(F')^{n-1},\qquad
B_{n,n-1}=\binom n2(F')^{n-2}F'',\qquad
B_{n,n}=(F')^n,
\]

the three terms which must be combined are

\[
\begin{aligned}
&(1-\delta)\alpha^{\underline{n-1}}
 F^{\alpha-n+1}(F')^{n-1}\\
&\quad+s\alpha^{\underline{n-1}}
 F^{\alpha-n+1}\binom n2(F')^{n-2}F''\\
&\quad-s(1-\delta)\alpha^{\underline{n-1}}
 F^{\alpha-n}(F')^n.
\end{aligned}
\]

Factoring the positive quantity
\(\alpha^{\underline{n-1}}F^{\alpha-n}(F')^{n-2}\) leaves

\[
\begin{aligned}
&\binom n2sFF''-(1-\delta)F'(sF'-F)\\
&\quad=
\left\{\binom n2-(1-\delta)\right\}F'\mathcal D
+\binom n2F^2E'\ge0,
\end{aligned}
\]

where (5.295) was used in the second line.  We have proved

\[
\boxed{G(s)>0,\qquad H(s)\ge0\qquad(0<s<1).}
\tag{5.297}
\]

Now define the unnormalized Abel inverse

\[
J(s)=\int_0^s(s-t)^{-\delta}G(t)\,dt.
\]

The endpoint singularities require a small justification before
differentiating.  If \(\lambda<1\), then

\[
F(s)=\frac{1-\lambda}{2}s+O(s^2),\qquad
g(s)=c_0s^\alpha+O(s^{\alpha+1}),\qquad
c_0=\left(\frac{1-\lambda}{2}\right)^\alpha,
\]

and hence

\[
G(t)=Ct^{\delta-1}+R(t),\qquad
C=c_0\frac{\Gamma(\alpha+1)}{\Gamma(\delta)},\qquad
R(t)=O(t^\delta),\quad R'(t)=O(t^{\delta-1}).
\]

The Abel integral of \(Ct^{\delta-1}\) is the constant
\(C{\rm B}(\delta,1-\delta)\), so this homogeneous term contributes
zero to \(J'\).  After it is removed, the differentiated integrand is
dominated by a constant times
\(u^\delta(1-u)^{-\delta}\).  If \(\lambda=1\), then

\[
F(s)=\frac14s^2+O(s^3),\qquad
G(s)=s^\rho A_0(s),\qquad
\rho=m+2\delta-1>-1,
\]

where \(A_0\) is \(C^1\) near zero and \(A_0(0)>0\).  In this case the
change of variables \(t=su\) is dominated by
\(u^\rho(1-u)^{-\delta}\).  These two estimates prove local absolute
continuity and rigorously give

\[
\boxed{
J'(s)=s^{-\delta}\int_0^1(1-u)^{-\delta}
\bigl\{(1-\delta)G(su)+suG'(su)\bigr\}\,du\ge0.
}
\tag{5.298}
\]

Thus \(J\) is nondecreasing.  Let \(\nu\) be its causal
Lebesgue--Stieltjes derivative, including the atom \(J(0+)\delta_0\).
The preceding expansions give

\[
J(0+)=c_0\Gamma(\alpha+1)\Gamma(1-\delta)
\quad(\lambda<1),\qquad
J(0+)=0\quad(\lambda=1).
\]

For completeness, use the causal Riemann--Liouville operator

\[
I^\rho h(s)=\frac1{\Gamma(\rho)}
\int_0^s(s-t)^{\rho-1}h(t)\,dt.
\]

After extending \(J\) by zero to \(s<0\), one has
\(J=\Gamma(1-\delta)I^{1-\delta}G\) and
\(\nu=DJ\) in the sense of causal distributions.  The semigroup rule
and commutation with the causal derivative give

\[
I^\delta\nu
=\Gamma(1-\delta)D I^1G
=\Gamma(1-\delta)G.
\]

This identity includes the jump \(J(0+)\delta_0\), rather than discarding
it at the endpoint.  In unnormalized kernel notation it is exactly

\[
\boxed{
\int_{[0,s)}(s-t)^{\delta-1}\nu(dt)
=\Gamma(\delta)\Gamma(1-\delta)G(s).
}
\tag{5.299}
\]

Set

\[
\mu_q=\frac{\nu}
{\Gamma(\alpha+1)\Gamma(1-\delta)}.
\]

This is a positive measure.  The function
\(\widetilde g(s)=\int_{[0,s)}(s-t)^\alpha\mu_q(dt)\) satisfies

\[
\widetilde g^{(m+1)}(s)
=\frac{\Gamma(\alpha+1)}{\Gamma(\delta)}
\int_{[0,s)}(s-t)^{\delta-1}\mu_q(dt)
=G(s)=g^{(m+1)}(s).
\]

Both \(g\) and \(\widetilde g\), together with their first \(m\)
derivatives, vanish at zero.  Explicitly, for \(0\le j\le m\),
\[
\widetilde g^{(j)}(s)
=\alpha^{\underline j}
\int_{[0,s)}(s-t)^{\alpha-j}\mu_q(dt).
\]
When \(\lambda<1\), \(\mu_q([0,s])=O(1)\), so this is
\(O(s^{\alpha-j})\); when \(\lambda=1\),
\(\mu_q([0,s])=O(s^\alpha)\), so it is
\(O(s^{2\alpha-j})\).  The expansions above give the same vanishing
orders for \(g^{(j)}\).  Hence the difference is a polynomial of degree
at most \(m\) with zero initial jet, and (5.294) follows.
Notice that for \(\lambda<1\),
\(\mu_q(\{0\})=c_0\); when \(\lambda=1\), there is no atom at zero.

Pushing \(\mu_q\) through
\(\Lambda=W_q-T_0^2t\), and restoring the omitted positive constants,
gives

\[
f_V(qv)f_V(q/v)
=\int_{(w,W_q]}(\Lambda-w)^{k-1}H_q(d\Lambda),
\qquad H_q\ge0.
\]

For \(q>lr\) the same normalization is explicit: take
\[
W_q=\frac q{r^2}+\frac{r^2}q,\qquad
T_0=\frac{\sqrt q}{r}+\frac r{\sqrt q}.
\]
Then
\[
P_r(T)=r\sqrt q\,T_0(1-y),\qquad
P_l(T)=(q+l^2)(1-\lambda y),\qquad
\lambda=\frac{l(q+r^2)}{r(q+l^2)}<1,
\]
because
\[
r(q+l^2)-l(q+r^2)=(r-l)(q-lr)>0.
\]
Thus it is literally the same function (5.293), with the endpoint roles
exchanged.  Centers outside \([l^2,r^2]\) give the zero function, and
endpoint centers follow directly or by a limit.  Combining the
fractional argument with the integer proof (5.261)--(5.263) yields

\[
\boxed{
M^2\in HM_k\quad\Longleftrightarrow\quad k\ge1
\qquad(0<l<r,\ U\sim{\rm Beta}(k,k)).
}
\tag{5.300}
\]

The reverse implication for \(0<k<1\) is exactly the endpoint-order
obstruction (5.268), with \(B=2k\).  Thus (5.300) is sharp.

Finally, let \(G_k^{(1)},G_k^{(2)}\) be independent unit-rate gamma
variables.  Gamma--Beta independence and duplication give

\[
\frac{G_k^{(1)}}{b_1}+\frac{G_k^{(2)}}{b_2}
\overset d=G_{2k}M,\qquad
G_{2k}^2\overset d=4G_kG_{k+1/2},
\]

with all factors on the right chosen independently.  By Sjödin's 2021
Theorem 3.1, (5.300) implies \(G_kM^2\in GGC\).  Bondesson's 2015
Theorem 1, followed by scale closure, therefore gives

\[
\boxed{
\left(\frac{G_k^{(1)}}{b_1}
+\frac{G_k^{(2)}}{b_2}\right)^2\in GGC
\qquad(k\ge1,\ b_1,b_2>0).
}
\tag{5.301}
\]

For equal rates the conclusion also follows immediately from the HCM
power closure for a scaled \(G_{2k}\).  The \(HM_k\) construction above
is a new project derivation; its use of Sjödin's gamma--\(HM_k\)
criterion and Bondesson's product theorem is the only external step.
The Bell-polynomial pairing and both endpoint regimes of the Abel
inversion were independently checked inside the project.

<a id="wip-5-28"></a>
### WIP-5.28 — arbitrary two-rate shapes at total shape two

**Status: [PROVED EVERY TWO-RATE GAMMA CONVOLUTION OF TOTAL SHAPE TWO
HAS A GGC SQUARE; COMPUTED ITS THORIN PHASE INCLUDING ENDPOINT ATOMS].**

The exact \(B=2\) phase can be evaluated without symmetry.  Let

\[
0<a<2,\qquad
X=\frac{G_a^{(1)}}{b_1}+\frac{G_{2-a}^{(2)}}{b_2}.
\]

The equal-rate case is a scaled \(G_2\) square and follows from HCM
power closure.  Otherwise exchange the two summands if necessary and
write \(r>l>0\) for their scales, with \(a\) denoting the shape attached
to \(r\).  Gamma--Beta independence gives

\[
\boxed{
X\overset d=G_2M,\qquad
M=l+(r-l)U,\qquad U\sim{\rm Beta}(a,2-a),\qquad U\perp G_2.
}
\tag{5.302}
\]

Put \(\nu=a-1\in(-1,1)\) and
\(H(z)=\mathbb E(z+M)^{-1}\).  The order-two beta integral gives

\[
-H'(z)=\mathbb E(z+M)^{-2}
=(z+r)^{-a}(z+l)^{a-2}.
\]

With \(y(z)=(z+l)/(z+r)\), integration from infinity, on the branch
continued from the positive axis in
\(\mathbb C\setminus[-r,-l]\), yields

\[
\boxed{
H(z)=
\frac{1-y(z)^\nu}{(r-l)\nu}\quad(\nu\ne0),
\qquad
H(z)=-\frac1{r-l}\log y(z)\quad(\nu=0).
}
\tag{5.303}
\]

Let \(G_1\) be independent of \(M\) and set \(Z=G_1M^2\).  Its Laplace
transform

\[
\phi(s)=\mathbb E e^{-sZ}
=\mathbb E(1+sM^2)^{-1}
=\mathbb E\frac{M^{-2}}{s+M^{-2}}
\]

is a normalized nonzero Stieltjes function with spectral support
\([r^{-2},l^{-2}]\).  If \(q=s^{-1/2}\) is the principal branch,
partial fractions give

\[
\boxed{
\phi(s)=\frac q{2i}\{H(-iq)-H(iq)\}.
}
\tag{5.304}
\]

For \(x\in(r^{-2},l^{-2})\), put \(t=x^{-1/2}\in(l,r)\).  As
\(s\to-x+i0\), (5.304) becomes

\[
\phi(-x+i0)=\frac t2\{H(t)-H(-t-i0)\}.
\]

Define

\[
d(t)=\frac{t-l}{r-t},\qquad
D(t)=\frac{(t+l)(r-t)}{(t+r)(t-l)},\qquad Q=D^\nu.
\]

Since \(y(-t-i0)=-d(t)-i0\), (5.303) gives the exact boundary values

\[
\boxed{
\phi(-x+i0)=
\frac{t}{2(r-l)\nu}
\left(\frac{t-l}{r-t}\right)^\nu
\{e^{-i\pi\nu}-Q\}\quad(\nu\ne0),
}
\tag{5.305}
\]

and

\[
\boxed{
\phi(-x+i0)=
\frac{t}{2(r-l)}\{-\log D(t)-i\pi\}\quad(\nu=0).
}
\tag{5.306}
\]

These expressions never vanish in the interior of the cut.

Because \(\phi\) is Stieltjes, \(1/\phi\) is a complete Bernstein
function.  Let

\[
\eta(x)=\frac1\pi\arg\frac1{\phi(-x+i0)}
=-\frac1\pi\Arg\phi(-x+i0)
\]

be its canonical phase lift.  It is zero to the left of
\(r^{-2}\) and one to the right of \(l^{-2}\); throughout we take its
right-continuous representative.  As \(x\) traverses the
cut, \(D\) increases from \(0\) to \(\infty\).  If \(0<\nu<1\),
\(\eta\) jumps from \(0\) to \(\nu\) at \(r^{-2}\), then increases
continuously from \(\nu\) to \(1\).  If \(-1<\nu<0\), it increases
continuously from \(0\) to \(1+\nu\), then jumps by \(-\nu\) at
\(l^{-2}\).  For \(\nu=0\), it increases continuously from \(0\) to
\(1\).  In the derivative formulas below, \(D\) and \(Q\) are regarded
as functions of \(x\) through \(t=t(x)=x^{-1/2}\).

In fact, on the cut,

\[
\boxed{
\eta'(x)=
\frac{\sin(\pi\nu)Q'(x)}
{\pi\{Q^2-2Q\cos(\pi\nu)+1\}}
=\frac{\nu\sin(\pi\nu)}{\pi}
\frac{Q\,(\log D)'(x)}
{Q^2-2Q\cos(\pi\nu)+1}>0
}
\tag{5.307}
\]

when \(\nu\ne0\), while

\[
\boxed{
\eta'(x)=
\frac{\dfrac d{dx}\log D(t(x))}
{\{\log D(t(x))\}^2+\pi^2}>0
}
\tag{5.308}
\]

when \(\nu=0\).  Here

\[
\frac d{dt}\log D(t)
=-\frac{2l}{t^2-l^2}-\frac{2r}{r^2-t^2}<0,
\qquad
\frac{dt}{dx}=-\frac12x^{-3/2}<0,
\]

so \((\log D)'(x)>0\); also
\(\nu\sin(\pi\nu)>0\) for \(-1<\nu<1,\ \nu\ne0\).

The canonical CBF representation and \(\phi(0)=1\) now give

\[
\log\frac1{\phi(s)}
=\int_0^\infty\frac{s}{x(s+x)}\eta(x)\,dx.
\]

Equivalently, if \(g=1/\phi\), differentiation and Stieltjes
integration by parts give

\[
\frac{g'(s)}{g(s)}
=\int_0^\infty\frac{\eta(x)}{(s+x)^2}\,dx
=\int_{(0,\infty)}\frac{d\eta(x)}{s+x}.
\]

The endpoint terms vanish because the right-continuous representative
has \(\eta(0+)=0\) and
\(\eta(x)/(s+x)\to0\) at infinity.  Integrating back at \(s=0\) yields

\[
\boxed{
\log\frac1{\phi(s)}
=\int_{(0,\infty)}\log(1+s/x)\,d\eta(x).
}
\tag{5.309}
\]

Equivalently, the boundary term in the logarithmic integration by parts
is zero because \(\eta=0\) on \((0,r^{-2})\),
\(\eta=1\) on \((l^{-2},\infty)\), and
\(\log(1+s/x)\to0\) as \(x\to\infty\).  The
Lebesgue--Stieltjes measure \(d\eta\) automatically retains both possible
endpoint jumps.

Thus \(Z\in GGC\), with Thorin measure \(d\eta\).  Its interior density
is (5.307) or (5.308); if \(\nu>0\) there is in addition the atom
\(\nu\delta_{r^{-2}}\), while if \(\nu<0\) there is the atom
\((-\nu)\delta_{l^{-2}}\).  The total Thorin mass is one.

The duplication identity

\[
G_2^2\overset d=4G_1G_{3/2}
\]

may be realized with the two gamma factors independent of \(M\).
Equations (5.302) and (5.309), Bondesson's product closure for
independent GGC variables, and scale closure prove

\[
\boxed{
\left(\frac{G_a^{(1)}}{b_1}
+\frac{G_{2-a}^{(2)}}{b_2}\right)^2\in GGC
\qquad(0<a<2,\ b_1,b_2>0).
}
\tag{5.310}
\]

This proof genuinely uses beta averaging.  Pointwise positivity of the
kernel in (5.257) already fails at \(B=2\).  Indeed, writing

\[
F_1(z)=A(z)+iD_0(z),\qquad
A(z)=\frac{\sqrt\pi}{2}e^{-z^2},
\]

the recurrence \(F_2(z)=\tfrac12+izF_1(z)\) gives
\(C_2(0)=1/2\) and \(S_2'(y)=A(y)(1-2y^2)\).  Hence

\[
\boxed{
\mathcal K_2(0,y)
=\frac y4A(y)(1-2y^2)
=\frac{y\sqrt\pi}{8}e^{-y^2}(1-2y^2)<0
\quad\left(y>\frac1{\sqrt2}\right).
}
\tag{5.311}
\]

By continuity the kernel remains negative for sufficiently small
positive first argument.  Therefore the theorem is an averaged phase
result, not a universal pointwise-kernel theorem.  All beta-integral,
branch, endpoint-jump, and duplication calculations in this subsection
are new project derivations and were independently checked; the external
inputs are the standard Stieltjes/CBF phase representation and
Bondesson's product theorem already listed in the [source map](references.md).

<a id="wip-5-30"></a>
### WIP-5.30 — an explicit hypergeometric Thorin measure and the complete two-rate square theorem

**Status: [PROVED EVERY TWO-RATE GAMMA CONVOLUTION HAS A GGC SQUARE, FOR
ARBITRARY POSITIVE SHAPES AND RATES; CONSTRUCTED THE THORIN MEASURE OF THE
GAMMA--BETA FACTOR].**

Let \(a,c>0\), \(B=a+c\), and

\[
k=\frac B2,\qquad A=\frac a2,\qquad C=\frac c2,\qquad
D=k+\frac12.
\]

After ordering the two scales, take \(0<l<r\), let
\(U\sim{\rm Beta}(a,c)\), and put \(M=l+(r-l)U\).  The shape \(a\)
is attached to the scale \(r\), and \(c\) to \(l\).  Beta--gamma
independence gives

\[
\boxed{
rG_a^{(1)}+lG_c^{(2)}
\overset d=G_BM,\qquad G_B\perp M.
}
\tag{5.314}
\]

Take \(G_k\perp M\), set \(Z=G_kM^2\), and write

\[
L(s)=\mathbb E e^{-sZ}=\mathbb E(1+sM^2)^{-k}.
\]

The first step is an exact transform identity.  The beta odds
\(x=U/(1-U)\), followed by
\(x=\sqrt{(1+l^2s)/(1+r^2s)}\,v\), gives

\[
L(s)=
\frac{(1+r^2s)^{-A}(1+l^2s)^{-C}}{\mathrm B(a,c)}
J(\eta),
\quad
J(\eta)=\int_0^\infty
\frac{v^{a-1}\,dv}{(1+2\eta v+v^2)^k},
\tag{5.315}
\]

where

\[
\eta=\frac{1+lrs}{\sqrt{(1+l^2s)(1+r^2s)}},
\qquad
1-\eta^2=
\frac{(r-l)^2s}{(1+r^2s)(1+l^2s)}.
\]

For \(s\ge0\), \(0<\eta\le1\).  Since

\[
0\le
\frac{2(1-\eta)v}{(1+v)^2}
\le\frac{1-\eta}{2}<1,
\]

the binomial series has nonnegative terms and Tonelli's theorem applies:

\[
\begin{aligned}
\frac{J(\eta)}{\mathrm B(a,c)}
&=\sum_{n\ge0}\frac{(k)_n}{n!}
   \{2(1-\eta)\}^n
   \frac{\mathrm B(a+n,c+n)}{\mathrm B(a,c)}\\
&=\sum_{n\ge0}
  \frac{(a)_n(c)_n}{(D)_n\,n!}
  \left(\frac{1-\eta}{2}\right)^n\\
&={}_2F_1\left(a,c;D;\frac{1-\eta}{2}\right).
\end{aligned}
\tag{5.316}
\]

Here the duplication identity
\((2k)_{2n}=2^{2n}(k)_n(k+\tfrac12)_n\) was used in the second line.
NIST DLMF 15.8.18, with \(x=(1-\eta)/2<1/2\), transforms the last
function in (5.316).  Thus, with

\[
z(s)=\frac{(r-l)^2s}{(1+r^2s)(1+l^2s)}\in[0,1),
\]

one obtains

\[
\boxed{
L(s)=(1+r^2s)^{-A}(1+l^2s)^{-C}
F(z(s)),\qquad
F(z)={}_2F_1(A,C;D;z).
}
\tag{5.317}
\]

It remains to identify the logarithm of \(F\).  Put
\(m=\min(A,C)\), \(h=\max(A,C)\), and use the symmetry
\(F(A,C;D;z)=F(h,m;D;z)\).  Dyachenko--Karp, Theorem 2.1,
Theorem 2.12, and Section 4, Example 2, apply because

\[
0<m\le h<D,\qquad D-h-m=\frac12>0.
\]

Their \(R_{0,1,0}\) formula gives a probability measure \(\mu\) on
\((0,1)\) such that

\[
R(z):=
\frac{{}_2F_1(h,m+1;D;z)}
     {{}_2F_1(h,m;D;z)}
=\int_0^1\frac{\mu(dt)}{1-tz}.
\tag{5.318}
\]

There is no constant term at infinity because their smaller numerator
parameter is \(m\le h\); normalization follows also from \(R(0)=1\).
The contiguous identity

\[
zF'(z)
=m\bigl\{{}_2F_1(h,m+1;D;z)-F(z)\bigr\}
\]

therefore yields, with \(\rho=m\mu\),

\[
\boxed{
\frac{F'(z)}{F(z)}
=\int_0^1\frac{t}{1-tz}\,\rho(dt),
\qquad
\rho((0,1))=m.
}
\tag{5.319}
\]

The measure is not merely existential.  In the notation above,

\[
\boxed{
\rho(dt)=
\frac{\Gamma(D)^2}
     {\Gamma(m)\Gamma(h)\Gamma(D-m)\Gamma(D-h)}
\frac{t^{k-1}(1-t)^{-1/2}}
     {|{}_2F_1(m,h;D;t^{-1}+i0)|^2}\,dt .
}
\tag{5.320}
\]

For \(t^{-1}>1\), the modulus in (5.320) means the product of the two
conjugate boundary values on the Gauss cut.  Formula (5.318), rather than
an unproved choice of branch, supplies its positivity and normalization.
Integrating (5.319) from \(0\), using \(F(0)=1\), gives

\[
\boxed{
\log F(z)=-\int_0^1\log(1-tz)\,\rho(dt),
\qquad 0\le z<1.
}
\tag{5.321}
\]

For \(t\in[0,1]\), define

\[
\begin{gathered}
S_t=r^2+l^2-t(r-l)^2,\qquad
\lambda_\pm(t)=
\frac{S_t\pm\sqrt{S_t^2-4r^2l^2}}2.
\end{gathered}
\]

Since
\(S_t=(1-t)(r^2+l^2)+2tlr\ge2lr\), both roots are positive.  They
satisfy

\[
\lambda_+\lambda_-=r^2l^2,\qquad
1-tz(s)=
\frac{(1+\lambda_+(t)s)(1+\lambda_-(t)s)}
     {(1+r^2s)(1+l^2s)}.
\tag{5.322}
\]

Substitution of (5.321)--(5.322) into (5.317), together with
\(\rho((0,1))=m\), gives the finite Thorin representation

\[
\boxed{
\begin{aligned}
-\log L(s)
={}&(A-m)\log(1+r^2s)+(C-m)\log(1+l^2s)\\
&+\int_0^1
\{\log(1+\lambda_+(t)s)+\log(1+\lambda_-(t)s)\}\,\rho(dt).
\end{aligned}
}
\tag{5.323}
\]

In the scale convention of this ledger, its Thorin measure is

\[
\boxed{
\tau=(A-m)\delta_{r^2}+(C-m)\delta_{l^2}
     +(\lambda_+)_\#\rho+(\lambda_-)_\#\rho,
\qquad \tau((0,\infty))=A+C=k.
}
\tag{5.324}
\]

Indeed
\(l^2\le\lambda_-\le lr\le\lambda_+\le r^2\), so
\(\operatorname{supp}\tau\subset[l^2,r^2]\).  The two pushforwards in
(5.324) can also be combined into one ordinary density.  For
\(l^2<x<r^2\), set

\[
t(x)=\frac{(r^2-x)(x-l^2)}{(r-l)^2x}.
\]

Then the continuous part of \(\tau\) has density

\[
\boxed{
q_\tau(x)=
\frac{\Gamma(D)^2}
     {\Gamma(m)\Gamma(h)\Gamma(D-m)\Gamma(D-h)}
\frac{t(x)^{k-1}(x+lr)}
     {(r-l)x^{3/2}
      |{}_2F_1(m,h;D;t(x)^{-1}+i0)|^2}.
}
\tag{5.324a}
\]

Indeed
\[
1-t(x)=\frac{(x-lr)^2}{(r-l)^2x},\qquad
\left|\frac{dt}{dx}\right|
=\frac{|x-lr|(x+lr)}{(r-l)^2x^2},
\]
so the square-root factor and Jacobian cancel.  The two inverse branches
occupy \((l^2,lr)\) and \((lr,r^2)\), respectively; there is no missing
factor two.  At their common endpoint the density has the finite limit
\[
q_\tau(lr)=
\frac{2\Gamma(A+\tfrac12)\Gamma(C+\tfrac12)}
     {\pi(r-l)\sqrt{lr}\,\Gamma(A)\Gamma(C)}.
\]
The standard rate-form Thorin measure is the reciprocal pushforward of
\(\tau\).  Consequently \(Z=G_kM^2\in GGC\).

There is a stronger Route-1 interpretation.  If
\(F_*=\tau/k\) and \(M_k(F_*)\) denotes the order-\(k\) Dirichlet mean
directed by \(F_*\), then the generalized Stieltjes identity and (5.323)
give

\[
\mathbb E(1+sM^2)^{-k}
=\mathbb E(1+sM_k(F_*))^{-k}.
\]

Both variables are supported on \([l^2,r^2]\).  Expanding at the origin
identifies every moment, and the compact Hausdorff moment problem is
determinate.  Hence

\[
\boxed{M^2\overset d=M_k(F_*).}
\tag{5.325}
\]

The directing probability \(F_*\) is unique at this order.  Indeed, equality
of two order-\(k\) Markov--Krein transforms gives equality of
\(\int\log(1+sx)\,F(dx)\); differentiation gives equality of their
Stieltjes transforms, hence of the directing measures.

Finally, Legendre duplication gives, with all right-hand factors mutually
independent and independent of \(M\),

\[
G_B^2\overset d=4G_kG_{k+1/2},
\qquad
(G_BM)^2\overset d=4Z\,G_{k+1/2}.
\]

Bondesson's independent-product theorem and scale closure now prove

\[
\boxed{
\left(\frac{G_a^{(1)}}{b_1}
     +\frac{G_c^{(2)}}{b_2}\right)^2\in GGC
\qquad(a,c,b_1,b_2>0).
}
\tag{5.326}
\]

The equal-rate case is also immediate from HCM power closure.  For
\(B=2\), (5.324) has the endpoint scale atom
\((a-1)\delta_{r^2}\) if \(a>1\), and
\((1-a)\delta_{l^2}\) if \(a<1\); after reciprocal pushforward these
are exactly the rate-form atoms in WIP-5.28.  This is an independent
normalization check.  Formula (5.324) is an explicit Thorin measure for
the factor \(Z\), not for the final independent product in (5.326);
Bondesson's theorem supplies membership of that product without an
explicit product Thorin measure.

All beta-integral, contiguous, factorization, and Dirichlet-mean
deductions above are new project derivations.  The external inputs are
DLMF 15.8.18, the precisely cited Dyachenko--Karp Markov representation,
the standard gamma--Dirichlet identity, and Bondesson's product theorem.
Three independent project audits checked the transform, parameter range,
measure mass, endpoint atoms, and independence in the final product.

<a id="wip-5-31"></a>
### WIP-5.31 — the averaged theorem cannot be replaced by pointwise kernel positivity

**Status: [PROVED A POINTWISE OBSTRUCTION FOR EVERY \(0<B\le2\); THIS IS
NOT A COUNTEREXAMPLE TO GGC MEMBERSHIP].**

Let \(\mathcal K_B\) be the pointwise phase kernel from (5.257).  At its
first endpoint, the definitions \(S_B(0)=0\),
\(C_B(0)=\Gamma(B/2)/2\), and \(F_B'=2iF_{B+1}\) give

\[
\boxed{
\mathcal K_B(0,y)
=\frac{y\Gamma(B/2)}4S_B'(y)
=\frac{y\Gamma(B/2)}2C_{B+1}(y).
}
\tag{5.327}
\]

For \(0<B<2\),

\[
C_{B+1}(y)
=\frac12\Gamma\left(\frac{B+1}{2}\right)
{}_1F_1\left(\frac{B+1}{2};\frac12;-y^2\right).
\]

The algebraic term in NIST DLMF 13.7.2, followed by reflection and
duplication of the gamma function, gives

\[
C_{B+1}(y)\sim
-\frac{\Gamma(B+1)\sin(\pi B/2)}{2^{B+1}}\,y^{-B-1}.
\]

Thus

\[
\boxed{
\mathcal K_B(0,y)\sim
-\frac{\Gamma(B/2)\Gamma(B+1)\sin(\pi B/2)}
       {2^{B+2}}\,y^{-B}<0
\qquad(y\to\infty).
}
\tag{5.328}
\]

Continuity makes the kernel negative for all sufficiently small positive
first arguments and sufficiently large fixed second argument.  At \(B=2\),
the exact negative interval is already (5.311).  Therefore pointwise
kernel positivity fails throughout \(0<B\le2\), even though WIP-5.30
proves that the required beta average is nonnegative for every two-rate
shape pair.  The hypergeometric logarithmic averaging is essential.
