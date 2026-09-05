# Route 3: cumulants, Hankel gates, and Stieltjes moments

Moment determinacy, cumulant recurrences, connected permutations, Jacobi matrices, and universal square gates.

Entries: WIP-3.1, WIP-3.2, WIP-3.3, WIP-3.4, WIP-3.5, WIP-3.6, WIP-3.7, WIP-3.8, WIP-3.9, WIP-3.10.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

Original WIP identifiers and equation numbers are preserved. Positional words such as "above" and "below" refer to the original numbered proof sequence.


## Route 3: cumulants and Stieltjes moment sequences

<a id="wip-3-1"></a>
### WIP-3.1 — a determinate cumulant criterion for GGC

**Status: [PROVED].**

Let \(Y\ge0\) have moments of every order and be Stieltjes-moment
determinate. Let \(\kappa_n(Y)\) be its cumulants and put

\[
a_n=\frac{\kappa_{n+1}(Y)}{n!},
\qquad n\ge0.
\tag{3.1}
\]

Assume \((a_n)\) is a Stieltjes moment sequence. Thus there is a finite
measure \(\sigma\) on \([0,\infty)\) such that

\[
a_n=\int_{[0,\infty)}c^n\,\sigma(dc).
\tag{3.2}
\]

Put

\[
d=\sigma(\{0\}),\qquad
\tau(dc)=c^{-1}\mathbf1_{(0,\infty)}(c)\,\sigma(dc).
\tag{3.3}
\]

For every \(s\ge0\),

\[
\int_{(0,\infty)}\log(1+sc)\,\tau(dc)
=
\int_{(0,\infty)}
\frac{\log(1+sc)}c\,\sigma(dc)
\le s\,\sigma((0,\infty))<\infty.
\tag{3.4}
\]

Hence

\[
L_Z(s)=
\exp\left\{
-ds-\int_{(0,\infty)}\log(1+sc)\,\tau(dc)
\right\}
\tag{3.5}
\]

is the Laplace transform of a GGC variable \(Z\).

Its first cumulant is

\[
d+\int c\,\tau(dc)
=\sigma([0,\infty))=a_0=\kappa_1(Y),
\]

and for \(n\ge2\),

\[
\kappa_n(Z)
=(n-1)!\int c^n\,\tau(dc)
=(n-1)!\int c^{n-1}\,\sigma(dc)
=(n-1)!a_{n-1}
=\kappa_n(Y).
\tag{3.6}
\]

All these moments are finite because \(\sigma\) has moments of every order.
The moment--cumulant formulas show that \(Y\) and \(Z\) have the same
moments. Moment determinacy of \(Y\) therefore gives \(Y\overset d=Z\).
Thus \(Y\in GGC\).

We have proved:

\[
\boxed{
Y\text{ moment determinate}
\quad\Longrightarrow\quad
\left[
Y\in GGC
\Longleftrightarrow
\left(\frac{\kappa_{n+1}(Y)}{n!}\right)_{n\ge0}
\text{ is a Stieltjes moment sequence}
\right].
}
\tag{3.7}
\]

The forward direction follows directly from the Thorin cumulant formula;
the reverse direction is the construction above.

<a id="wip-3-2"></a>
### WIP-3.2 — moment determinacy for \(1<q\le2\)

**Status: [PROVED].**

Let \(X\) be a finite gamma convolution and \(Y=X^q\), with \(1<q\le2\).
Write \(r=q/2\le1\). The moment generating function of \(X\) is finite in a
neighborhood of zero.

If \(r<1\), then for every \(\delta>0\) there is \(C_{\delta,r}<\infty\)
such that

\[
\varepsilon x^r\le\delta x+C_{\delta,r},
\qquad x\ge0.
\]

Choose \(\delta\) inside the moment-generating interval of \(X\). If \(r=1\),
choose \(\varepsilon\) directly inside that interval. In both cases,

\[
\mathbb E[e^{\varepsilon\sqrt Y}]
=
\mathbb E[e^{\varepsilon X^{q/2}}]
<\infty
\tag{3.8}
\]

for some \(\varepsilon>0\).

Expanding the exponential gives

\[
\mathbb E[Y^n]
\le
\mathbb E[e^{\varepsilon\sqrt Y}]
\frac{(2n)!}{\varepsilon^{2n}}.
\tag{3.9}
\]

Stirling's formula implies

\[
\sum_{n\ge1}
\mathbb E[Y^n]^{-1/(2n)}
=\infty.
\]

The Stieltjes Carleman criterion proves that \(Y\) is moment determinate.

Combining WIP-3.1 and WIP-3.2, for finite gamma \(X\) and \(1<q\le2\),
(C1) is equivalent to all Hankel and shifted-Hankel matrices of the sequence
\((a_n)\) in (3.1) being positive semidefinite.

<a id="wip-3-3"></a>
### WIP-3.3 — exact low-order Hankel results in the first benchmark

**Status: [COMPUTER-VERIFIED EXACT].**

Take

\[
X=uG_{1/2}+vG'_{1/2},
\qquad
Y=X^2,
\qquad u,v>0,
\tag{3.10}
\]

with independent unit-rate gamma variables. Put

\[
p=u+v,\qquad
z=\left(\frac{u-v}{u+v}\right)^2\in[0,1).
\tag{3.11}
\]

Beta--gamma algebra gives

\[
X\overset d=
G_1\,\frac p2(1+\sqrt z\,V),
\tag{3.12}
\]

where \(V\) has the arcsine law on \([-1,1]\) and

\[
\mathbb E[V^{2j}]=\frac{\binom{2j}{j}}{4^j},
\qquad
\mathbb E[V^{2j+1}]=0.
\tag{3.13}
\]

Therefore the raw moments used in the calculation are

\[
\mathbb E[Y^n]
=
\frac{(2n)!p^{2n}}{2^{2n}}
\sum_{j=0}^n
\binom{2n}{2j}
\frac{\binom{2j}{j}}{4^j}z^j.
\tag{3.14}
\]

The calculation uses Python's exact
\(\mathrm{fractions.Fraction}\) arithmetic and the standard
moment--cumulant recurrence. The reproducible script is
[computations/route3_halfshape_q2_hankel.py](../computations/route3_halfshape_q2_hankel.py).

For

\[
a_n=\frac{\kappa_{n+1}(Y)}{n!},
\]

the first unshifted \(2\times2\) determinant is

\[
\begin{aligned}
\det(a_{i+j})_{i,j=0}^1
=p^8\bigg(
&\frac34+\frac{39}4z+\frac{327}{64}z^2\\
&+\frac{63}{16}z^3+\frac9{64}z^4
\bigg)>0.
\end{aligned}
\tag{3.15}
\]

The first shifted determinant is

\[
\begin{aligned}
\det(a_{i+j+1})_{i,j=0}^1
=p^{12}\bigg(
&\frac{99}{16}+\frac{621}{4}z+\frac{124011}{256}z^2\\
&+\frac{56889}{64}z^3+\frac{32283}{128}z^4\\
&+\frac{2763}{64}z^5+\frac{207}{256}z^6
\bigg)>0.
\end{aligned}
\tag{3.16}
\]

The exact \(3\times3\) unshifted and shifted determinants are respectively
\(p^{18}P_9(z)\) and \(p^{24}Q_{12}(z)\), where every coefficient of
\(P_9\) and \(Q_{12}\) printed by the script is strictly positive.
Consequently all four tested determinants are positive throughout the
entire unequal-scale parameter range.

This is a rigorous finite-order result because the arithmetic and formulas
are exact. It is **not** evidence sufficient to conclude that the whole
sequence is Stieltjes. Its current value is:

1. the smallest benchmark is not refuted by the first four determinant
   tests;
2. the positivity in the coordinate \(z\) suggests searching for an
   all-order coefficient-positivity or total-positivity theorem;
3. any such theorem must still cover all Hankel sizes, not just the displayed
   cases.

> **[OPEN STEP R3-A]** Prove or disprove that every Hankel and shifted-Hankel
> determinant for (3.14), after its homogeneous power of \(p\) is removed,
> has nonnegative coefficients as a polynomial in \(z\).

<a id="wip-3-4"></a>
### WIP-3.4 — a formal PDE and an all-order cumulant recurrence

**Status: [PROVED].**

Continue with the reciprocal-rate half-shape model, now normalized as

\[
X_\theta=e^\theta G_{1/2}+e^{-\theta}G'_{1/2},
\qquad
a=\cosh\theta,\qquad x=\sinh^2\theta=a^2-1,
\qquad
Y=X_\theta^2.
\tag{3.17}
\]

If \(M_m=\mathbb E[X_\theta^m]\), the transform

\[
\mathbb E[e^{tX_\theta}]
=(1-2at+t^2)^{-1/2}
=\sum_{m\ge0}P_m(a)t^m
\]

defines the Legendre polynomials and gives

\[
M_m=m!P_m(a),\qquad
M_{m+1}=(2m+1)aM_m-m^2M_{m-1}.
\tag{3.18}
\]

Put

\[
r_n=M_{2n},\qquad q_n=M_{2n+1},
\]

and introduce the formal exponential series

\[
F(t,a)=\sum_{n\ge0}r_n\frac{t^n}{n!},
\qquad
H(t,a)=\sum_{n\ge0}q_n\frac{t^n}{n!}.
\tag{3.19}
\]

These are formal series: \(F\) has radius zero because its coefficients
grow on the \((2n)!\) scale.  Explicitly,
\(X_\theta\ge e^{-\theta}(G_{1/2}+G'_{1/2})\), so

\[
\frac{r_n}{n!}\ge
e^{-2n\theta}\frac{(2n)!}{n!},
\]

whose \(n\)-th root diverges.  For \(s>0\), the actual Laplace transform
\(\mathbb E[e^{-sY}]\) has \(F(-s,a)\) only as its moment asymptotic
expansion.  Every manipulation in this subsection takes place in the
formal power-series ring; no analyticity at \(t=0\) is being assumed.

Splitting (3.18) into even and odd indices gives

\[
\begin{aligned}
q_n&=(4n+1)ar_n-4n^2q_{n-1},\\
r_{n+1}&=(4n+3)aq_n-(2n+1)^2r_n.
\end{aligned}
\tag{3.20}
\]

After summation,

\[
\begin{aligned}
H&=a(4tF_t+F)-4t^2H_t-4tH,\\
F_t&=a(4tH_t+3H)-4t^2F_{tt}-8tF_t-F.
\end{aligned}
\tag{3.21}
\]

Differentiating the generating function in \(a\), or equivalently using
the corresponding Legendre identity, also gives

\[
H=a(2tF_t+F)+(a^2-1)F_a.
\tag{3.22}
\]

Eliminating \(H\), changing from \(a\) to \(x=a^2-1\), and using
\(\partial_a=2a\partial_x\) yields the exact PDE

\[
\boxed{
\begin{aligned}
&4t^2(1+2x)F_{tt}
+8tx(1+x)F_{xt}
+6x(1+x)F_x\\
&\qquad+
\bigl((10+18x)t-1\bigr)F_t
+(2+3x)F=0.
\end{aligned}
}
\tag{3.23}
\]

Set

\[
A=\frac{F_t}{F}=\sum_{n\ge0}a_n(x)t^n,
\qquad
a_n(x)=\frac{\kappa_{n+1}(Y)}{n!},
\qquad
B=(\log F)_x.
\]

The indexing is exact because \(A=\partial_t\log F\) as a formal cumulant
series.  Since \(F(0,x)=1\),

\[
B=\sum_{n\ge1}\frac{a'_{n-1}(x)}n\,t^n.
\]

Dividing (3.23) by \(F\), extracting coefficients, and taking empty sums
to be zero proves

\[
\boxed{
\begin{aligned}
a_0(x)={}&2+3x,\\
a_n(x)={}&
\bigl((4n+6)+(8n+10)x\bigr)a_{n-1}(x)\\
&+4(1+2x)
\sum_{i+j=n-2}a_i(x)a_j(x)\\
&+x(1+x)\left(8+\frac6n\right)a'_{n-1}(x)\\
&+8x(1+x)
\sum_{i+k=n-2}
\frac{a_i(x)a'_k(x)}{k+1},
\qquad n\ge1.
\end{aligned}
}
\tag{3.24}
\]

All multipliers and all operations on the right preserve
coefficientwise nonnegativity.  Induction therefore proves

\[
\boxed{a_n(x)\in\mathbb Q_{\ge0}[x]\quad(n\ge0).}
\tag{3.25}
\]

The first terms are

\[
\begin{aligned}
a_0={}&2+3x,\\
a_1={}&20+108x+96x^2,\\
a_2={}&296+3348x+7704x^2+4752x^3,\\
a_3={}&5648+108000x+455376x^2
       +664704x^3+313344x^4.
\end{aligned}
\tag{3.26}
\]

As an independent finite check,
[computations/route3_halfshape_q2_recurrence.py](../computations/route3_halfshape_q2_recurrence.py)
uses exact rational polynomial arithmetic to compare (3.24), through
\(a_8\), with raw moments from (3.20) followed by the ordinary
moment--cumulant recurrence.  The all-order proof remains the formal
derivation and induction above, not this finite check.

For comparison with the \(p,z\) coordinates in WIP-3.3, write
\(u=g e^\theta\), \(v=g e^{-\theta}\).  Then

\[
z=\tanh^2\theta=\frac{x}{1+x},
\qquad
p=2g\sqrt{1+x}.
\]

If \(\bar X=X/p\) and
\(\bar a_n(z)=\kappa_{n+1}(\bar X^2)/n!\), homogeneity gives

\[
\boxed{
a_n(x)
=4^{n+1}(1+x)^{n+1}
\bar a_n\left(\frac{x}{1+x}\right),
\qquad
\frac{\kappa_{n+1}(X^2)}{n!}=g^{2n+2}a_n(x).
}
\tag{3.27}
\]

This reproduces the low-order polynomials used in the exact script for
WIP-3.3.  Result (3.25) is genuinely all-order, but it is only entrywise
coefficient positivity.  It does not imply positivity of all Hankel
minors.

<a id="wip-3-5"></a>
### WIP-3.5 — a connected-permutation expansion

**Status: [PROVED].**

There is an independent combinatorial explanation of (3.25).  Let
\(Z=(Z_1,Z_2)^T\) be standard Gaussian and
\(C=\operatorname{diag}(e^\theta,e^{-\theta})\).  Then

\[
Q=Z^TCZ,\qquad X_\theta\overset d=\frac Q2,
\qquad Y\overset d=\frac{Q^2}{4}.
\tag{3.28}
\]

The log-determinant of the Gaussian quadratic-form transform gives

\[
\kappa_k(Q,\ldots,Q)
=2^{k-1}(k-1)!\operatorname{tr}(C^k).
\tag{3.29}
\]

For \(m\ge1\), let

\[
\rho_m=
\{\{1,2\},\{3,4\},\ldots,\{2m-1,2m\}\}.
\]

Möbius inversion on set partitions, in the product-cumulant form, sums
only over partitions \(\pi\) whose join with \(\rho_m\) is the one-block
partition.  Giving every block of \(\pi\) a cyclic order converts the
factor \((|B|-1)!\) in (3.29) into a permutation cycle.  Accounting for the
factor \(4^{-m}\) in (3.28) yields

\[
\boxed{
a_{m-1}(x)
=
\frac1{(m-1)!}
\sum_{\substack{\sigma\in S_{2m}\\
{\rm cyc}(\sigma)\vee\rho_m=\widehat1}}
\ \prod_{\gamma\in{\rm cyc}(\sigma)}
\cosh(|\gamma|\theta).
}
\tag{3.30}
\]

For \(m=1\), the identity permutation and the transposition contribute
\(\cosh^2\theta+\cosh(2\theta)=2+3x\), checking the normalization.

Every even-length factor \(\cosh(k\theta)\) is a polynomial in
\(x=\sinh^2\theta\) with nonnegative coefficients.  For odd \(k\), it is
\(\sqrt{1+x}\) times such a polynomial.  A permutation of \(2m\) has an
even number of odd cycles, so the square-root factors pair.  Formula
(3.30) therefore proves coefficientwise nonnegativity at every order
directly.

The partition identity used here is the Leonov--Shiryaev product-cumulant
formula: V. P. Leonov and A. N. Shiryaev, “On a Method of Calculation of
Semi-Invariants,” *Theory of Probability and its Applications* **4**(3)
(1959), 319--329, DOI 10.1137/1104031, equation (IV.d).

Formula (3.30) identifies a plausible state space for a future transfer
operator: grow the fixed matching \(\rho_m\) one pair at a time while
tracking open cycles and their two Gaussian colors.  The connectedness
condition is global, however, and no positive self-adjoint transfer
operator follows merely from the positive enumeration.

<a id="wip-3-6"></a>
### WIP-3.6 — the divided cumulants are Stieltjes at every contrast

**Status: [PROVED], with the canonical CBF representation cited in the
source map.**

Beta--gamma algebra and the duplication formula give independent variables
\(E\sim\Gamma(1,1)\), \(G^\star_{1/2}\sim\Gamma(1/2,1)\), and an arcsine
variable \(D\) on \([e^{-\theta},e^\theta]\) such that

\[
X_\theta\overset d=G_1D,
\qquad
Y=X_\theta^2\overset d=E Z,
\qquad
Z:=4G^\star_{1/2}D^2.
\tag{3.31}
\]

Consequently the actual Laplace transform of \(Y\) is the Stieltjes
transform

\[
\phi(s)=\mathbb E[e^{-sY}]
=\mathbb E[(1+sZ)^{-1}],
\qquad s>0.
\tag{3.32}
\]

The associated series
\(\sum_{n\ge0}\mathbb E[Z^n]t^n\) is still only formal at \(t=0\);
equation (3.32), not that divergent series, is the analytic object used
below.

Since \(1/\phi\) is a complete Bernstein function, its canonical phase,
defined almost everywhere, is

\[
\eta(t)=-\frac1\pi\arg\phi(-t+i0)\in[0,1],
\]

and the normalized canonical representation is

\[
-\log\phi(s)
=
\int_0^\infty\frac{s}{t(s+t)}\eta(t)\,dt.
\tag{3.33}
\]

Put

\[
\xi(c)=\eta(1/c).
\tag{3.34}
\]

Differentiating (3.33) and changing variables \(c=1/t\) gives

\[
-\frac{\phi'(s)}{\phi(s)}
=
\int_0^\infty\frac{\xi(c)}{(1+sc)^2}\,dc.
\tag{3.35}
\]

The left side has
\((-1)^nh^{(n+1)}(0+)=\kappa_{n+1}(Y)=n!a_n\), where
\(h=-\log\phi\).  For \(s>0\), differentiating (3.35) gives

\[
(-1)^nh^{(n+1)}(s)
=(n+1)!\int_0^\infty
\frac{c^n\xi(c)}{(1+sc)^{n+2}}\,dc.
\]

Letting \(s\downarrow0\) by monotone convergence, using the finite
right derivatives at zero rather than a convergent Taylor series, gives
the exact identity

\[
\boxed{
a_n=(n+1)\int_0^\infty c^n\xi(c)\,dc.
}
\tag{3.36}
\]

Thus

\[
\boxed{
b_n:=\frac{a_n}{n+1}
=\frac{\kappa_{n+1}(Y)}{(n+1)!}
\quad\text{is a Stieltjes moment sequence for every }\theta\ge0.
}
\tag{3.37}
\]

This is an all-order theorem, not a finite computation.  For
\(N=m+1\), the Gram--Andreief formulas make its two Stieltjes Hankel
families explicit:

\[
\begin{aligned}
\det[b_{i+j}]_{i,j=0}^{m}
&=
\frac1{N!}\int_{(0,\infty)^N}
\prod_{p<q}(c_p-c_q)^2
\prod_{p=1}^N\xi(c_p)\,dc_p,\\
\det[b_{i+j+1}]_{i,j=0}^{m}
&=
\frac1{N!}\int_{(0,\infty)^N}
\prod_{p=1}^Nc_p
\prod_{p<q}(c_p-c_q)^2
\prod_{p=1}^N\xi(c_p)\,dc_p.
\end{aligned}
\tag{3.38}
\]

The density of \(Z\) is strictly positive, so \(0<\xi(c)<1\) for
\(c>0\); both displayed determinants are therefore strictly positive.

The factor \(n+1\) in (3.36) is exactly the unresolved issue.  In fact,
the desired undivided sequence \((a_n)\) is Stieltjes if and only if
\(\xi\) has a nonincreasing representative.  If \(\xi\) is nonincreasing,
then moment finiteness removes the boundary terms in Stieltjes integration
by parts and

\[
\sigma(dc)=-c\,d\xi(c)
\tag{3.39}
\]

is a positive measure satisfying
\(\int c^n\sigma(dc)=a_n\).

Conversely, suppose \(a_n=\int r^n\sigma(dr)\) for a positive measure.
Then \(b_n\) is represented by

\[
\sigma(\{0\})\delta_0(dc)
+
\xi_\sigma(c)\,dc,
\qquad
\xi_\sigma(c)=
\int_{[c,\infty)}\frac{\sigma(dr)}r,
\tag{3.40}
\]

and \(\xi_\sigma\) is nonincreasing.  This representing measure is unique.
Indeed, (3.25) and the moment--cumulant formula imply
\(0\le\kappa_m(Y)\le\mathbb E[Y^m]\).  If
\(\mathbb E[e^{\lambda X_\theta}]<\infty\), then

\[
a_n\le
\frac{\mathbb E[e^{\lambda X_\theta}](2n+2)!}
{n!\lambda^{2n+2}},
\]

so the Carleman sum for \((b_n)\) dominates a constant multiple of
\(\sum n^{-1/2}\).  Hence (3.40) must coincide with the canonical measure
\(\xi(c)dc\) in (3.36).  In particular \(\sigma(\{0\})=0\) and \(\xi\)
has the claimed nonincreasing representative.

Since \(c\mapsto1/c\) reverses order,

\[
\xi\text{ nonincreasing}
\quad\Longleftrightarrow\quad
\eta\text{ nondecreasing}.
\tag{3.41}
\]

Thus Route 3 has reached exactly the same remaining condition as the
Route-2 phase criterion; division by \(n+1\) does not bypass it.

For a completely real boundary formula, the density of \(Z\) in (3.31)
is

\[
q_\theta(c)
=
\frac1{2\sqrt{\pi c}}\,
\mathbb E\!\left[
D^{-1}e^{-c/(4D^2)}
\right]
=
\frac1{2\sqrt{\pi c}}\,
\mathbb E\!\left[e^{-cD^2/4}\right].
\tag{3.42}
\]

Here the second form follows from the reciprocal arcsine identity in
WIP-2.10.  If

\[
\mathscr H_\theta(c)
=
\operatorname{PV}\int_0^\infty
\frac{q_\theta(z)}{c-z}\,dz,
\]

then the Hilbert-transform boundary value exists for almost every \(c>0\)
and the reciprocal-variable calculation gives

\[
\boxed{
\xi(c)
=
\frac1\pi
\operatorname{Arg}
\left(
\mathscr H_\theta(c)+i\pi q_\theta(c)
\right),
\qquad \operatorname{Arg}\in(0,\pi).
}
\tag{3.43}
\]

The missing assertion is precisely \(\xi'(c)\le0\).

<a id="wip-3-7"></a>
### WIP-3.7 — finite Jacobi matrices prove exactly the divided theorem

**Status: [PROVED; OPERATOR ROUTE OBSTRUCTION].**

Let \(\mu\) be the law of \(Z\) in (3.31), and let \(J_N\) be the
\(N\times N\) leading truncation of its Jacobi multiplication matrix.
Let \(J_N^{(1)}\) be the trailing principal submatrix.  Since \(\mu\) has
infinite support in \((0,\infty)\), these are positive definite,
irreducible tridiagonal matrices.  Their eigenvalues strictly interlace:

\[
0<\lambda_1<\mu_1<\lambda_2<
\cdots<\mu_{N-1}<\lambda_N.
\tag{3.44}
\]

The finite resolvent and its logarithmic derivative are

\[
\begin{aligned}
M_N(t)
&=
\langle e_0,(I-tJ_N)^{-1}e_0\rangle
=
\frac{\det(I-tJ_N^{(1)})}{\det(I-tJ_N)},\\
\frac{M_N'(t)}{M_N(t)}
&=
\sum_{i=1}^N\frac{\lambda_i}{1-t\lambda_i}
-
\sum_{j=1}^{N-1}\frac{\mu_j}{1-t\mu_j}
=:\sum_{n\ge0}a_n^{(N)}t^n.
\end{aligned}
\tag{3.45}
\]

Therefore

\[
a_n^{(N)}
=
\sum_i\lambda_i^{n+1}
-
\sum_j\mu_j^{n+1}.
\tag{3.46}
\]

Define the alternating-interval density

\[
\xi_N(c)
=
\mathbf1_{(0,\lambda_1)}(c)
+
\sum_{j=1}^{N-1}
\mathbf1_{(\mu_j,\lambda_{j+1})}(c).
\tag{3.47}
\]

Integrating monomials interval by interval gives

\[
\boxed{
\frac{a_n^{(N)}}{n+1}
=
\int_0^\infty c^n\xi_N(c)\,dc.
}
\tag{3.48}
\]

The path expansion of powers of the tridiagonal Jacobi matrix shows that
\(\langle e_0,J_N^ke_0\rangle\) agrees with the \(k\)-th moment of
\(\mu\) for \(k<2N\): a path from level zero that reaches the omitted
level \(N\) needs at least \(2N\) steps to return.  Hence

\[
a_n^{(N)}=a_n,\qquad 0\le n\le2N-2.
\tag{3.49}
\]

Taking \(N\) large enough for any prescribed finite quadratic form gives
an independent finite-matrix proof of (3.37).

The same construction also shows why ordinary interlacing cannot prove
that \((a_n)\) is Stieltjes.  Already at \(N=2\),

\[
a_n^{(2)}
=
\lambda_1^{n+1}-\mu_1^{n+1}+\lambda_2^{n+1},
\]

and the \(3\times3\) Hankel determinant is

\[
\boxed{
\det[a_{i+j}^{(2)}]_{i,j=0}^{2}
=
-\lambda_1\mu_1\lambda_2
(\mu_1-\lambda_1)^2
(\lambda_2-\lambda_1)^2
(\lambda_2-\mu_1)^2<0.
}
\tag{3.50}
\]

This does not contradict (3.49), because that determinant uses
coefficients beyond the matching range.  It proves that finite
Jacobi/interlacing approximants inevitably encode a signed measure for the
undivided sequence.

There is also an immediate no-go for a scalar production matrix with
polynomial Stieltjes--Rogers weights.  In the convention

\[
\frac{A(t)}{a_0}
=
\cfrac1{1-\cfrac{\alpha_1t}
{1-\cfrac{\alpha_2t}{1-\cdots}}},
\]

the first coefficient is

\[
\alpha_1=\frac{a_1}{a_0}
=
\frac{20+108x+96x^2}{2+3x},
\tag{3.51}
\]

which is genuinely nonpolynomial because its numerator does not vanish at
\(x=-2/3\).  A successful production construction must therefore use
rational or block-valued weights, or directly encode monotonicity of the
limiting phase/spectral-shift function.

<a id="wip-3-8"></a>
### WIP-3.8 — an explicit representing measure at equal rates

**Status: [ESTABLISHED INPUT plus PROVED DEDUCTION].**

At \(x=0\), recurrence (3.24) reduces to

\[
a_0=2,\qquad
a_n=(4n+6)a_{n-1}
+4\sum_{i+j=n-2}a_i a_j.
\tag{3.52}
\]

Let \(d_m=S(2,-3,1)_m\) be the self-convolutive sequence

\[
d_1=1,\qquad
d_m=(2m-3)d_{m-1}
+\sum_{j=1}^{m-1}d_jd_{m-j}.
\tag{3.53}
\]

A direct induction comparing (3.52) and (3.53) gives

\[
a_n(0)=2^nd_{n+2}.
\tag{3.54}
\]

Martin and Kearney give the exact positive Mellin representation

\[
d_m=
\sqrt{\frac2\pi}
\int_0^\infty
\frac{
r^{m-3/2}e^{r/2}
}{
\mathcal G_1(r/2)^2+\pi
}\,dr,
\qquad
\mathcal G_1(y)=
\sum_{k=0}^\infty
\frac{y^{k+1/2}}{(k+1/2)k!}.
\tag{3.55}
\]

Notice that the denominator contains \(+\pi\), not \(+\pi^2\), and
\(\mathcal G_1(y)=\sqrt\pi\,\operatorname{erfi}(\sqrt y)\).
Multiplying the representing measure in (3.55) by \(r\) and pushing it
forward under \(c=2r\) yields

\[
\boxed{
a_n(0)=\int_0^\infty c^n\sigma_0(c)\,dc,
\qquad
\sigma_0(c)=
\frac{
\sqrt c\,e^{c/4}
}{
2\sqrt\pi\,[\mathcal G_1(c/4)^2+\pi]
}.
}
\tag{3.56}
\]

Thus the raw cumulant sequence is explicitly Stieltjes at the equal-rate
point, consistently with the GGC conclusion in WIP-2.5.

The external input is R. J. Martin and M. J. Kearney, “An Exactly Solvable
Self-Convolutive Recurrence,” *Aequationes Mathematicae* **80** (2010),
291--318, DOI 10.1007/s00010-010-0051-0, equation (1) and the displayed
\(S(2,-3,1)\) formula in the Introduction, p. 293.

<a id="wip-3-9"></a>
### WIP-3.9 — the direct \(HM_{1/2}\) factor shortcut fails

**Status: [PROVED; REFUTED ROUTE].**

Let \(D\) be arcsine on
\([l,r]=[e^{-\theta},e^\theta]\), let \(V=D^2\), and suppose
\(\theta>0\).  Its density is

\[
f_V(y)=
\frac1{
2\pi\sqrt y
\sqrt{(\sqrt y-l)(r-\sqrt y)}
},
\qquad l^2<y<r^2.
\tag{3.57}
\]

To test \(HM_{1/2}\), it is enough to find one failed central value.
Choose the hyperbolic center equal to one, write \(v=t^2\) with
\(1<t<r\), and put

\[
w=v+v^{-1},\qquad
W=r^2+r^{-2}=4a^2-2.
\]

The identities

\[
(t-l)(r-t)=t(2a-t-t^{-1}),
\]

and its reciprocal counterpart give

\[
\boxed{
f_V(v)f_V(v^{-1})
=
\frac1{4\pi^2(2a-\sqrt{w+2})},
\qquad
2<w<W.
}
\tag{3.58}
\]

In particular,

\[
f_V(v)f_V(v^{-1})
\sim
\frac{a}{\pi^2(W-w)}
\qquad(w\uparrow W).
\tag{3.59}
\]

If \(V\) were \(HM_{1/2}\), the defining representation would supply a
positive measure \(H\) such that

\[
h(w):=f_V(v)f_V(v^{-1})
=
\int_{(w,\infty)}
(\lambda-w)^{-1/2}\,H(d\lambda).
\tag{3.60}
\]

Since \(h(w)=0\) for \(w>W\), positivity forces
\(H((W,\infty))=0\).  For every \(x<W\), Tonelli and the beta integral
would then give

\[
\int_x^W\frac{h(w)}{\sqrt{w-x}}\,dw
=
\pi H((x,W])<\infty.
\tag{3.61}
\]

The mass on the right is finite already from (3.60) at \(w=x\).
But (3.59) makes the left side of (3.61) diverge logarithmically.  This
contradiction proves

\[
\boxed{\theta>0\quad\Longrightarrow\quad D^2\notin HM_{1/2}.}
\tag{3.62}
\]

Sjödin's theorem would have made
\(G_{1/2}D^2\) a GGC if \(D^2\) were \(HM_{1/2}\), after which independent
product closure could handle the remaining gamma factor in (3.31).
Equation (3.62) therefore kills that direct sufficient-condition route,
but it does not say that \(Y\) itself fails to be GGC.

The exact external definitions and theorem are in T. Sjödin,
“On Mixtures of Gamma Distributions, Distributions with Hyperbolically
Monotone Densities and Generalized Gamma Convolutions (GGC),”
*Probability and Mathematical Statistics* **41**(1) (2021), 1--7,
DOI 10.37190/0208-4147.41.1.1: equation (2.1) and Definition 2.1 on p. 2,
and Theorem 3.1 on p. 4.  These are numbered equation (1), Definition 1,
and Theorem 1 in the arXiv manuscript.

<a id="wip-3-10"></a>
### WIP-3.10 — every finite gamma convolution square passes the first two Hankel gates

**Status: [PROVED BY EXACT POLYNOMIAL IDENTITIES; NECESSARY CONDITIONS
ONLY, NOT A PROOF OF GGC MEMBERSHIP].**

Let

\[
X=\sum_{\ell=1}^N r_\ell G_{\beta_\ell}^{(\ell)},
\qquad r_\ell,\beta_\ell>0,
\]

with independent unit-rate gamma variables, and define the finite positive
measure and its moments

\[
\nu=\sum_{\ell=1}^N\beta_\ell\delta_{r_\ell},
\qquad
p_j=\int x^j\,\nu(dx)=\sum_{\ell=1}^N\beta_\ell r_\ell^j.
\tag{3.63}
\]

Then

\[
\kappa_j(X)=(j-1)!p_j.
\tag{3.64}
\]

Put \(Y=X^2\) and, as in WIP-3.1,

\[
a_n=\frac{\kappa_{n+1}(Y)}{n!}.
\]

The conclusion of this subsection is

\[
\boxed{
a_0a_2-a_1^2>0,\qquad
a_1a_3-a_2^2>0.
}
\tag{3.65}
\]

Thus no finite gamma convolution square can fail either of the first two
nontrivial \(2\times2\) Stieltjes Hankel tests.

The low-order cumulants follow from

\[
M_n:=\mathbb E[X^n]
=\sum_{j=1}^n\binom{n-1}{j-1}\kappa_j(X)M_{n-j}
\]

and the ordinary moment--cumulant recurrence for \(Y\).  Exact expansion
gives

\[
\kappa_1(Y)=p_1^2+p_2,
\tag{3.66}
\]

\[
\kappa_2(Y)
=4p_1^2p_2+8p_1p_3+2p_2^2+6p_4,
\tag{3.67}
\]

\[
\begin{aligned}
\kappa_3(Y)={}&
16p_1^3p_3+24p_1^2p_2^2+72p_1^2p_4
+96p_1p_2p_3+8p_2^3\\
&+144p_1p_5+72p_2p_4+40p_3^2+120p_6,
\end{aligned}
\tag{3.68}
\]

and

\[
\begin{aligned}
\kappa_4(Y)={}&
96p_1^4p_4+384p_1^3p_2p_3+192p_1^2p_2^3\\
&+768p_1^3p_5+1728p_1^2p_2p_4
 +768p_1^2p_3^2+1152p_1p_2^2p_3+48p_2^4\\
&+2880p_1^2p_6+3456p_1p_2p_5
 +3072p_1p_3p_4+864p_2^2p_4+960p_2p_3^2\\
&+5760p_1p_7+2880p_2p_6+2688p_3p_5
 +1152p_4^2+5040p_8.
\end{aligned}
\tag{3.69}
\]

Here

\[
a_0=\kappa_1(Y),\qquad
a_1=\kappa_2(Y),\qquad
a_2=\frac{\kappa_3(Y)}2,\qquad
a_3=\frac{\kappa_4(Y)}6.
\tag{3.70}
\]

The positivity certificates use only one general spread inequality.  If

\[
u+v=s+t,\qquad u\le s\le t\le v,
\]

write

\[
\Delta(u,v;s,t)=p_up_v-p_sp_t.
\]

Then

\[
\boxed{\Delta(u,v;s,t)\ge0.}
\tag{3.71}
\]

Indeed, every such spread is a sum of adjacent spreads, and for
\(0\le j<S-j-1\),

\[
\boxed{
\begin{aligned}
&p_jp_{S-j}-p_{j+1}p_{S-j-1}\\
&\quad=
\frac12\iint
x^jy^j(x-y)^2
\left(
\sum_{h=0}^{S-2j-2}x^{S-2j-2-h}y^h
\right)\nu(dx)\nu(dy)\ge0.
\end{aligned}
}
\tag{3.72}
\]

Consequently every \(\Delta\)-term below has an explicit
expectation-of-squares certificate.

For the first determinant, direct collection gives

\[
\boxed{
\begin{aligned}
a_0a_2-a_1^2={}&
4p_1^4\Delta(1,3;2,2)+4p_1^5p_3\\
&+8p_1^3\Delta(1,4;2,3)+28p_1^4p_4\\
&+44p_1^2\Delta(1,5;3,3)
 +28p_1^3p_5+24p_1^2p_2p_4+16p_1p_2^2p_3\\
&+72p_1\Delta(2,5;3,4)
 +24p_1\Delta(1,6;3,4)\\
&+36p_1^2p_6+12p_2^2p_4+20p_2p_3^2\\
&+36\Delta(2,6;4,4)+24p_2p_6.
\end{aligned}
}
\tag{3.73}
\]

Every summand is nonnegative and \(24p_2p_6>0\), proving the first
inequality in (3.65).

The shifted determinant admits the following homogeneous positive
decomposition:

\[
\boxed{
a_1a_3-a_2^2=\sum_{j=2}^8Q_j,
}
\tag{3.74}
\]

where

\[
\begin{aligned}
Q_8={}&
64p_1^6\Delta(2,4;3,3)
+64p_1^4p_2^2\Delta(1,3;2,2)
+48p_1^4p_2^4,
\end{aligned}
\tag{3.75}
\]

\[
\begin{aligned}
Q_7={}&
448p_1^5\Delta(2,5;3,4)
+64p_1^5p_2p_5+320p_1^4p_2^2p_4\\
&+64p_1^3p_2p_3\Delta(1,3;2,2)
+192p_1^4p_2p_3^2,
\end{aligned}
\tag{3.76}
\]

\[
\begin{aligned}
Q_6={}&
128p_1^4\Delta(2,6;3,5)
+1200p_1^4\Delta(2,6;4,4)
+592p_1^4p_2p_6\\
&+832p_1^3p_2^2p_5+704p_1^3p_2p_3p_4\\
&+352p_1^2p_3^2\Delta(1,3;2,2)
+352p_1^3p_3^3\\
&+192p_1^2p_2^3p_4+64p_1p_2^4p_3,
\end{aligned}
\tag{3.77}
\]

\[
\begin{aligned}
Q_5={}&
2880p_1^3\Delta(3,6;4,5)
+1536p_1^3\Delta(2,7;4,5)
+2304p_1^3p_2p_7\\
&+512p_1^2p_2\Delta(2,6;3,5)
+96p_1^2p_2\Delta(2,6;4,4)
+832p_1^2p_2^2p_6\\
&+128p_1p_3p_4\Delta(1,3;2,2)
+640p_1p_3^2\Delta(1,4;2,3)\\
&+2656p_1^2p_3^2p_4
+576p_1p_2^3p_5+48p_2^4p_4+160p_2^3p_3^2,
\end{aligned}
\tag{3.78}
\]

\[
\begin{aligned}
Q_4={}&
1440p_1^2\Delta(3,7;4,6)
+5184p_1^2\Delta(3,7;5,5)
+1056p_1^2p_3p_7\\
&+1920p_1p_2\Delta(2,7;3,6)
+1728p_1p_2\Delta(1,8;4,5)
+1632p_1^2p_2p_8\\
&+48p_2^2\Delta(2,6;4,4)+432p_2^3p_6\\
&+480p_2p_3\Delta(2,5;3,4)+416p_2^2p_3p_5\\
&+400p_3^2\Delta(1,5;3,3)+304p_1p_3^2p_5
+4608p_1p_3p_4^2,
\end{aligned}
\tag{3.79}
\]

\[
\begin{aligned}
Q_3={}&
2400p_3\Delta(1,8;3,6)
+4320p_1\Delta(3,8;5,6)
+4320p_1\Delta(4,7;5,6)\\
&+1440p_1p_4p_7
+1440p_2\Delta(2,8;4,6)+240p_2^2p_8\\
&+2688p_3p_4p_5+1152p_4^3,
\end{aligned}
\tag{3.80}
\]

and

\[
Q_2=3600\Delta(4,8;6,6)+1440p_4p_8.
\tag{3.81}
\]

Every \(Q_j\) is nonnegative by (3.71), and \(Q_2>0\).  This proves the
second inequality in (3.65).  The exact expansion and collection into
(3.73)--(3.81) are checked independently by
[route3_general_square_hankel.py](../computations/route3_general_square_hankel.py).

This lemma is uniform in the number of atoms, shapes, and scales and
strictly extends the former two-half-gamma low-order check.  It removes
both \(2\times2\) determinants from the counterexample search.  It does
not prove that all higher Hankel matrices are positive semidefinite, so it
does not prove that \(X^2\) is GGC.
