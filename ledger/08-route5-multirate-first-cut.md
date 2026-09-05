# Route 5C: multirate first-cut geometry

First-cut pairing, algebraic lobe cones, weighted phase centering, critical polynomials, and the three-rate prefix interface.

Entries: WIP-5.12, WIP-5.13, WIP-5.14, WIP-5.15, WIP-5.16, WIP-5.17.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

Original WIP identifiers and equation numbers are preserved. Positional words such as "above" and "below" refer to the original numbered proof sequence.

## Progress entries


<a id="wip-5-12"></a>
### WIP-5.12 — multirate first-cut pairing and exact extension
obstructions

**Status: [PROVED CONDITIONAL EXTENSION AND PROVED STRUCTURAL
OBSTRUCTIONS; NOT A COUNTEREXAMPLE].**

The true-lobe comparison in WIP-5.11 has a precise multirate analogue on
the first spectral cut, but the support nesting which closed the two-rate
proof is no longer automatic.  Normalize the smallest rate to one and let

\[
1=b_1<b_2<\cdots<b_n,
\qquad
\beta_i>0,
\qquad
\sum_{i=1}^n\beta_i=1.
\tag{5.93}
\]

Put \(\alpha=\beta_1\) and \(p=1-\alpha\).  The two reflected densities
and the direct density on the first cut are

\[
\begin{aligned}
h_0(r)&=\prod_{i=1}^n(b_i-r)^{-\beta_i},&&0<r<1,\\
h_1(r)&=\prod_{i=1}^n(b_i+r)^{-\beta_i},&&r>0,\\
b(r)&=(r-1)^{-\beta_1}
       \prod_{i=2}^n(b_i-r)^{-\beta_i},&&1<r<b_2.
\end{aligned}
\tag{5.94}
\]

Their first-cut likelihood ratio is

\[
G_1(r):=\frac{h_1(r)}{b(r)}
=
\left(\frac{r-1}{r+1}\right)^{\beta_1}
\prod_{i=2}^n
\left(\frac{b_i-r}{b_i+r}\right)^{\beta_i}.
\tag{5.95}
\]

Direct differentiation gives

\[
(\log G_1)''(r)
=-4r\left{
\frac{\beta_1}{(r^2-1)^2}
+\sum_{i=2}^n\frac{\beta_i b_i}{(b_i^2-r^2)^2}
\right}<0.
\tag{5.96}
\]

Since \(G_1\) tends to zero at both ends of \((1,b_2)\), it has a unique
maximizer.  Choose \(a\) on its rising branch and put
\(\chi=G_1(a)\).  Define the unweighted first positive and negative lobes

\[
\widehat P_0=\int_0^1(h_0+h_1)(r)\,dr,
\qquad
\widehat N_1=\int_1^a\bigl(\chi b-h_1\bigr)(s)\,ds.
\tag{5.97}
\]

The second integrand is strictly positive on \((1,a)\), because
\(h_1=bG_1\) and strict increase of \(G_1\) there gives
\(G_1(s)<G_1(a)=\chi\).

For \(i\ge3\), set

\[
\lambda_i=\frac{b_i-b_2}{b_i-1}\in(0,1),
\qquad
C=(b_2-1)^{p-\beta_2}
  \prod_{i=3}^n(b_i-1)^{-\beta_i}>0.
\tag{5.98}
\]

The three substitutions

\[
x=\frac{1-r}{b_2-r},
\qquad
z=\frac{r+1}{b_2+r},
\qquad
v=\frac{s-1}{b_2-s}
\]

respectively transform the \(h_0\), \(h_1\), and \(b\) integrals.  The
first two transformed intervals meet at \(1/b_2\), and hence concatenate.
Writing

\[
z_a=\frac{a+1}{b_2+a},
\qquad
v_a=\frac{a-1}{b_2-a},
\]

gives the exact identity

\[
\begin{aligned}
\widehat P_0-\widehat N_1
=C\Bigg[&
\int_0^{z_a}\frac{z^{p-1}}{1-z}
 \prod_{i=3}^n(1-\lambda_i z)^{-\beta_i}\,dz\\
&-\chi\int_0^{v_a}\frac{v^{p-1}}{1+v}
 \prod_{i=3}^n(1+\lambda_i v)^{-\beta_i}\,dv
\Bigg].
\end{aligned}
\tag{5.99}
\]

All factors are positive; the lower-endpoint singularities
\(z^{p-1}\) and \(v^{p-1}\) are integrable because \(p>0\).  Let

\[
\Lambda=\chi^{1/p},
\qquad
w_a=\Lambda v_a.
\]

After \(z=\Lambda v\), the kernel in the second integral of (5.99) is

\[
\frac{z^{p-1}}{1+z/\Lambda}
\prod_{i=3}^n
\left(1+\frac{\lambda_i z}{\Lambda}\right)^{-\beta_i}.
\tag{5.100}
\]

On every positive point of the common support this is strictly smaller
than the first kernel in (5.99): each denominator factor of the first
kernel is smaller than its counterpart in (5.100), since
\(z<z_a<1\), \(\Lambda>0\), and \(0<\lambda_i<1\).  We have therefore
proved the conditional multirate lobe lemma

\[
\boxed{
w_a\le z_a
\quad\Longrightarrow\quad
\widehat P_0>\widehat N_1.
}
\tag{5.101}
\]

If the exponential weight is restored, define

\[
P_0(t)=\int_0^1e^{-tr^2}(h_0+h_1)(r)\,dr,
\qquad
N_1(t)=\int_1^ae^{-ts^2}(\chi b-h_1)(s)\,ds.
\]

Separation of the supports at one gives

\[
P_0(t)>e^{-t}\widehat P_0,
\qquad
N_1(t)<e^{-t}\widehat N_1.
\]

Thus the condition in (5.101) also implies \(P_0(t)>N_1(t)\) for every
\(t>0\).  The exact support ratio is

\[
\boxed{
\frac{w_a}{z_a}
=
\left(\frac{a-1}{a+1}\right)^{1/p}
\prod_{i=3}^n
\left[
\frac{(b_2+a)(b_i-a)}
     {(b_2-a)(b_i+a)}
\right]^{\beta_i/p}.
}
\tag{5.102}
\]

For \(n=2\), the product is empty, so (5.102) is strictly smaller than
one.  This recovers exactly the automatic support nesting behind
WIP-5.11.  For three rates it can fail even on the rising branch.  Take

\[
(b_1,b_2,b_3)=(1,4,100),
\qquad
(\beta_1,\beta_2,\beta_3)
=\left(\frac12,\frac1{100},\frac{49}{100}\right),
\qquad a=3.
\tag{5.103}
\]

Here

\[
(\log G_1)'(3)
=\frac18-\frac2{175}-\frac{98}{9991}
=\frac{1451369}{13987400}>0,
\]

so \(a\) is strictly on the rising branch, whereas

\[
\frac{w_a}{z_a}
=\frac14\left(\frac{679}{103}\right)^{49/50}>1.
\tag{5.104}
\]

Indeed, \(679/103>6\) and
\(6^{49}/4^{50}=(3/2)^{49}/4>(3/2)^4/4=81/64\).
This is an exact obstruction to automatic support inclusion, not an
inequality in the opposite direction for the two lobe masses.

There is a second obstruction to the common-scalar proof.  Let
\(R=\sum_i b_iQ_i\), with
\(Q\sim\operatorname{Dir}(\beta_1,\ldots,\beta_n)\).  Since the total
shape is one, the Markov--Krein identity, with principal powers and
\(\operatorname{Im}\zeta>0\), reads

\[
\mathbb E\frac1{\zeta R-y}
=\prod_{i=1}^n(\zeta b_i-y)^{-\beta_i}.
\tag{5.105}
\]

Put \(A_j=\sum_{i=1}^j\beta_i\), fix \(u>0\), and let
\(\zeta\to u+i0\).  For \(y\) on the cut
\(I_j(u)=(ub_j,ub_{j+1})\), the first \(j\) factors approach the negative
axis with argument \(+\pi\).  The product in (5.105) therefore has phase
\(-\pi A_j\).  After the leading factor \(i\) in the Faddeeva
representation, a boundary modulus \(m_j\) contributes

\[
Q:\ \sin(\pi A_j)m_j,
\qquad
N:\ \cos(\pi A_j)m_j.
\tag{5.106}
\]

Thus its local likelihood-ratio baseline is \(\cot(\pi A_j)\).  For
\(n\ge3\), the numbers \(A_1<\cdots<A_{n-1}\) lie strictly between zero
and one, and \(\cot\) is strictly decreasing on \((0,\pi)\).  Consequently
there is no single scalar \(c\) for which

\[
\cos(\pi A_j)-c\sin(\pi A_j)=0
\]

on every cut.  A common scalar affine centering of \(N/Q\) can eliminate
at most one direct-cut term.  This does not rule out a cut-dependent,
vector, or matrix centering.

Each individual reflected ratio still has the one-peak property.  Namely,

\[
G_j(r)=
\prod_{i\le j}
\left(\frac{r-b_i}{r+b_i}\right)^{\beta_i}
\prod_{i>j}
\left(\frac{b_i-r}{b_i+r}\right)^{\beta_i},
\]

and throughout \(b_j<r<b_{j+1}\),

\[
(\log G_j)''(r)
=-4r\sum_{i=1}^n
\frac{\beta_i b_i}{(r^2-b_i^2)^2}<0.
\tag{5.107}
\]

The differing baselines in (5.106), however, prevent these local
single-crossing statements from automatically assembling, under the
preceding common-scalar argument, into the uniform four-block sign pattern
of WIP-5.9.  Other weighted or vector-valued constructions remain open.

Finally, Dirichlet aggregation does not by itself bypass the multicut
problem.  It gives

\[
R=Ub_n+(1-U)S,
\tag{5.108}
\]

where \(U\sim\operatorname{Beta}(\beta_n,1-\beta_n)\), \(U\perp S\),
and, conditionally on \(S=s\), the right side is a two-rate Beta mean.
For finite measures \(\lambda,\sigma\) define

\[
\mathcal I_u(\lambda,\sigma)
=\iint\mathcal K(ur,us)\,\lambda(dr)\sigma(ds),
\qquad
\mathcal I_u(\lambda)=\mathcal I_u(\lambda,\lambda).
\]

Let \(\nu=\operatorname{Law}(S)\) and
\(\mu_s=\operatorname{Law}(Ub_n+(1-U)s)\), so that
\(\mu=\int\mu_s\,\nu(ds)\).  The Route-2 quadratic functional expands as

\[
\mathcal I_u(\mu)
=\iint\mathcal I_u(\mu_s,\mu_{s'})\,\nu(ds)\nu(ds').
\tag{5.109}
\]

The two-rate theorem controls only the diagonal terms.  The off-diagonal
terms cannot be supplied by a generic positive-definite-kernel argument:
the continuous extension of (5.11) satisfies

\[
\mathcal K(0,0)=0,
\qquad
\mathcal K(1,0)<0,
\]

so its two-point Gram determinant is

\[
\det
\begin{pmatrix}
\mathcal K(0,0)&\mathcal K(0,1)\\
\mathcal K(1,0)&\mathcal K(1,1)
\end{pmatrix}
=-\mathcal K(1,0)^2<0.
\tag{5.110}
\]

Continuity gives the same conclusion with the zero point replaced by a
sufficiently small positive point.  Hence a PSD/Cauchy--Schwarz mixture
shortcut is impossible, although a Dirichlet-specific off-diagonal
estimate remains viable.  The next multirate proof must therefore replace
at least one of the two-rate mechanisms: automatic lobe-support nesting or
a single globally centered scalar likelihood ratio.  None of these
obstructions is a counterexample to GGC membership.  WIP-5.14 below shows
that a dynamically weighted phase center does remove the second obstruction
at derivative level and turns it into a favorable term.

<a id="wip-5-13"></a>
### WIP-5.13 — an algebraic first-cut lobe cone strictly beyond support
nesting

**Status: [PROVED SUFFICIENT CONDITION AND EXACT THREE-RATE
CERTIFICATE].**

Assume \(n\ge3\) throughout this entry; the case \(n=2\) is already
settled by WIP-5.11.

The failure of \(w_a\le z_a\) in (5.104) does not make the first negative
lobe larger than the first positive lobe.  In fact, the comparison in
WIP-5.12 admits a strictly wider sufficient condition.  Remove the common
constant \(C\) from (5.99) and write

\[
\begin{aligned}
L&=\int_0^{z_a}\frac{z^{p-1}}{1-z}
 \prod_{i=3}^n(1-\lambda_i z)^{-\beta_i}\,dz,\\
R&=\chi\int_0^{v_a}\frac{v^{p-1}}{1+v}
 \prod_{i=3}^n(1+\lambda_i v)^{-\beta_i}\,dv.
\end{aligned}
\tag{5.111}
\]

All omitted positive-kernel factors exceed one, whereas all omitted
negative-kernel factors are at most one.  Hence

\[
L>\frac{z_a^p}{p},
\qquad
R\le\chi J_p(v_a),
\qquad
J_p(v):=\int_0^v\frac{x^{p-1}}{1+x}\,dx.
\tag{5.112}
\]

The first inequality is strict because \((1-z)^{-1}>1\) on a set of
positive measure.  Thus the integral condition

\[
\boxed{
\frac{z_a^p}{p}\ge\chi J_p(v_a)
\quad\Longrightarrow\quad
\widehat P_0>\widehat N_1
}
\tag{5.113}
\]

already extends (5.101).  It also has a purely algebraic sufficient form.
The function \(x\mapsto(1+x)^{-1}\) is strictly convex, so on \([0,v]\)
it lies below its endpoint chord:

\[
\frac1{1+x}\le1-\frac{x}{1+v}.
\]

Multiplication by \(x^{p-1}\) and integration give

\[
J_p(v)
\le
\frac{v^p}{p}-\frac{v^{p+1}}{(p+1)(1+v)}
=\frac{v^p}{p}
  \frac{p+1+v}{(p+1)(1+v)}.
\tag{5.114}
\]

Since \(\chi v_a^p=w_a^p\), equations (5.112)--(5.114) prove

\[
\boxed{
\left(\frac{w_a}{z_a}\right)^p
\le
\frac{(p+1)(1+v_a)}{p+1+v_a}
\quad\Longrightarrow\quad
\widehat P_0>\widehat N_1.
}
\tag{5.115}
\]

The right side of (5.115) is strictly larger than one, because its
numerator minus its denominator is \(pv_a>0\).  Thus (5.115) genuinely
contains cases in which the support nesting \(w_a\le z_a\) fails.

For the exact three-rate parameters in (5.103), one has

\[
p=\frac12,
\qquad
v_a=2,
\qquad
\left(\frac{w_a}{z_a}\right)^p
=\frac12\left(\frac{679}{103}\right)^{49/100}.
\]

Since \(679/103>1\), \(49/100<1/2\), and

\[
\frac{679}{103}<\frac{324}{49}
\quad\Longleftrightarrow\quad
33271<33372,
\]

we obtain the exact chain

\[
\left(\frac{w_a}{z_a}\right)^p
<\frac12\sqrt{\frac{679}{103}}
<\frac97
=\frac{(p+1)(1+v_a)}{p+1+v_a}.
\tag{5.116}
\]

Therefore (5.115) proves
\(\widehat P_0>\widehat N_1\) for the same example in which (5.104)
proves \(w_a/z_a>1\).  The exact lesson is narrower than a multirate GGC
theorem: support inclusion is not necessary for the first-cut mass
comparison.

The true negative kernel gives a still stronger secant criterion.  Set

\[
f(v)=\frac1{1+v}
\prod_{i=3}^n(1+\lambda_i v)^{-\beta_i},
\qquad
\Theta_a:=\chi\left(\frac{v_a}{z_a}\right)^p
=\left(\frac{w_a}{z_a}\right)^p.
\tag{5.117}
\]

Represent the first factor of \(f\) by
\((c_0,\gamma_0)=(1,1)\) and the remaining factors by
\((c_i,\gamma_i)=(\lambda_i,\beta_i)\).  Logarithmic differentiation
gives

\[
\frac{f''(v)}{f(v)}
=
\left(\sum_j\frac{\gamma_jc_j}{1+c_jv}\right)^2
+\sum_j\frac{\gamma_jc_j^2}{(1+c_jv)^2}>0.
\tag{5.118}
\]

Thus \(f\) is strictly convex and lies strictly below its endpoint chord
on \((0,v_a)\).  Since \(f(0)=1\),

\[
R
<\chi\frac{v_a^p}{p}
  \frac{1+pf(v_a)}{p+1}.
\]

Together with \(L>z_a^p/p\), this proves the strengthened condition

\[
\boxed{
\Theta_a\le\frac{p+1}{1+pf(v_a)}
\quad\Longrightarrow\quad
\widehat P_0>\widehat N_1.
}
\tag{5.119}
\]

When at least one additional rate is present,
\(f(v_a)<(1+v_a)^{-1}\), so (5.119) strictly enlarges (5.115).

The rising-branch hypothesis alone does not imply even this strengthened
secant condition.  An exact example is

\[
(b_1,b_2,b_3)=(1,2,100),
\qquad
(\beta_1,\beta_2,\beta_3)
=\left(\frac1{20},\frac1{10000},\frac{9499}{10000}\right),
\qquad
a=\frac{19}{10}.
\tag{5.120}
\]

Here \(p=19/20\) and direct rational arithmetic gives

\[
(\log G_1)'(a)
=\frac{2\beta_1}{a^2-1}
-\frac{2\beta_2b_2}{b_2^2-a^2}
-\frac{2\beta_3b_3}{b_3^2-a^2}
=\frac{172261423}{9421597575}>0.
\tag{5.121}
\]

Thus \(a\) is on the rising branch.  On the other hand,

\[
v_a=9,
\qquad
z_a=\frac{29}{39},
\qquad
\Theta_a
=\frac9{29}
 \left(\frac{38259}{1019}\right)^{9499/10000}.
\]

Since \(38259/1019>16\) and \(9499/10000>3/4\),

\[
\Theta_a>\frac9{29}16^{3/4}
=\frac{72}{29}>\frac{39}{20}=p+1
>\frac{p+1}{1+pf(v_a)}.
\tag{5.122}
\]

This is a no-go result only for deriving a secant certificate from the
rising-branch condition.  It does not reverse the true lobe-mass
inequality.

There is a complementary certificate adapted to this large-\(v_a\)
regime.  Put

\[
\delta=\sum_{i=3}^n\beta_i=p-\beta_2,
\qquad
K_\lambda=\prod_{i=3}^n\lambda_i^{-\beta_i}.
\]

Because \(1+\lambda_i v>\lambda_i(1+v)\),

\[
f(v)<K_\lambda(1+v)^{-(1+\delta)},
\qquad
R<\chi K_\lambda\mathrm B(p,1-\beta_2).
\tag{5.123}
\]

For the left kernel, the absolutely convergent positive series on
\(0\le z\le z_a<1\) is

\[
\frac1{1-z}\prod_{i=3}^n(1-\lambda_i z)^{-\beta_i}
=\sum_{m=0}^\infty A_mz^m,
\]

where

\[
A_m=
\sum_{k_0+\sum_{i=3}^nk_i=m}
\prod_{i=3}^n
\frac{(\beta_i)_{k_i}}{k_i!}\lambda_i^{k_i}>0.
\tag{5.124}
\]

Consequently, for every integer \(M\ge0\),

\[
L>
\sum_{m=0}^M A_m\frac{z_a^{p+m}}{p+m}.
\]

Combining this with (5.123) gives the finite-truncation sufficient
condition

\[
\boxed{
\sum_{m=0}^M A_m\frac{z_a^{p+m}}{p+m}
\ge
\chi K_\lambda\mathrm B(p,1-\beta_2)
\quad\Longrightarrow\quad
\widehat P_0>\widehat N_1.
}
\tag{5.125}
\]

Unlike the secant estimates, (5.125) does not carry a factor
\(v_a^p\); it can therefore exploit simultaneous growth of the left
kernel and decay of the full right tail as \(a\uparrow b_2\).  It remains
an analytic condition rather than an automatically rational certificate:
for concrete nonintegral parameters the beta term must itself be evaluated
exactly or bounded rigorously.  It remains open whether (5.113), (5.119),
(5.125) with some finite \(M\), or the route-specific mass inequality
itself holds on every rising branch.  The separate global question of
combining first-cut control with all other cuts is later closed, without
these inequalities, by WIP-5.26.

<a id="wip-5-14"></a>
### WIP-5.14 — weighted multicut phase centering and the residual
covariance

**Status: [PROVED MULTICUT DECOMPOSITION AND GLOBAL SUFFICIENT CONE;
OPEN CENTRAL REGION].**

Retain the ordering and total-shape assumptions of (5.93), but drop its
normalization:

\[
0<b_1<\cdots<b_n,\qquad
\beta_i>0,\qquad
\sum_{i=1}^n\beta_i=1,\qquad n\ge2.
\]

For \(1\le j<n\), put

\[
A_j=\sum_{i=1}^j\beta_i,\qquad
s_j=\sin(\pi A_j),\qquad
c_j=\cos(\pi A_j),\qquad
d_j=\cot(\pi A_j),
\]

and, on \(I_j=(b_j,b_{j+1})\), define

\[
m_j(r)=
\prod_{i\le j}(r-b_i)^{-\beta_i}
\prod_{i>j}(b_i-r)^{-\beta_i}.
\tag{5.126}
\]

Also set

\[
\begin{aligned}
a(r)&=\prod_{i=1}^n(b_i+r)^{-\beta_i},\\
m_0(r)&=\prod_{i=1}^n(b_i-r)^{-\beta_i},
&&0<r<b_1,\\
m_n(r)&=\prod_{i=1}^n(r-b_i)^{-\beta_i},
&&r>b_n,
\end{aligned}
\]

and introduce the folded exterior/reflected density

\[
h_{\mathrm{ext}}(r)=
\begin{cases}
a(r)+m_0(r),&0<r<b_1,\\
a(r),&b_1<r<b_n,\\
a(r)-m_n(r),&r>b_n.
\end{cases}
\tag{5.127}
\]

It is strictly positive below \(b_n\) and strictly negative above \(b_n\):
for \(r>b_n\), every factor \(r-b_i\) is smaller than \(r+b_i\), and
hence \(m_n(r)>a(r)\).

Let \(t=u^2>0\), and define

\[
\begin{aligned}
D_j(t)&=\int_{I_j}e^{-tr^2}m_j(r)\,dr,
&B_j(t)&=s_jD_j(t),\\
B(t)&=\sum_{j=1}^{n-1}B_j(t),
&E(t)&=\int_0^\infty e^{-tr^2}h_{\mathrm{ext}}(r)\,dr.
\end{aligned}
\tag{5.128}
\]

The boundary calculation in (5.105)--(5.106), now performed on every
cut, gives

\[
\boxed{
\pi Q(u)=B(t),\qquad
\pi N(u)=E(t)+\sum_{j=1}^{n-1}d_jB_j(t).
}
\tag{5.129}
\]

Indeed, the Jacobian in \(y=ur\) cancels the factor
\(u^{-\sum_i\beta_i}=u^{-1}\).  Thus no scale factor has been suppressed.
Write

\[
\Xi(t)=\frac{N(\sqrt t)}{Q(\sqrt t)},\qquad
\omega_j(t)=\frac{B_j(t)}{B(t)},\qquad
\overline d(t)=\sum_j\omega_j(t)d_j,\qquad
\rho(t)=\frac{E(t)}{B(t)}.
\]

Then

\[
\boxed{\Xi=\rho+\overline d.}
\tag{5.130}
\]

The phase-mixture term has a fixed favorable sign.  Define

\[
\mu_j(t)=
\frac{\int_{I_j}r^2e^{-tr^2}m_j(r)\,dr}
     {\int_{I_j}e^{-tr^2}m_j(r)\,dr}
=-\frac{B_j'(t)}{B_j(t)},
\qquad
\mu_B=\sum_j\omega_j\mu_j.
\tag{5.131}
\]

The disjoint ordered cuts imply
\(\mu_1<\cdots<\mu_{n-1}\), while strict decrease of the cotangent gives
\(d_1>\cdots>d_{n-1}\).  More explicitly, for \(i<j\),

\[
d_i-d_j
=\frac{\sin\!\left(\pi(A_j-A_i)\right)}
       {\sin(\pi A_i)\sin(\pi A_j)}>0.
\]

Since \(\omega_j'=\omega_j(\mu_B-\mu_j)\), pairwise symmetrization yields

\[
\boxed{
\overline d'
=-\operatorname{Cov}_{\omega}(d_j,\mu_j)
=\sum_{i<j}\omega_i\omega_j
 (d_i-d_j)(\mu_j-\mu_i)>0
}
\tag{5.132}
\]

whenever \(n\ge3\).  In matrix notation this is
\(-d^{\mathsf T}(\operatorname{diag}\omega-\omega\omega^{\mathsf T})\mu\).
Thus the differing cut phases, after their correct \(t\)-dependent
weighting, help rather than hinder phase monotonicity.

The same fact has an exact signed-density form.  Put

\[
q(r)=\sum_{j=1}^{n-1}
s_jm_j(r)\mathbf 1_{I_j}(r),
\]

and

\[
\begin{aligned}
k_{\mathrm{res}}(r)&=h_{\mathrm{ext}}(r)-\rho q(r),\\
k_{\mathrm{phase}}(r)&=
\sum_{j=1}^{n-1}s_j(d_j-\overline d)
m_j(r)\mathbf 1_{I_j}(r).
\end{aligned}
\tag{5.133}
\]

Both have zero \(e^{-tr^2}\)-weighted mass.  Moreover,
\(d_j-\overline d\) changes sign at most once as \(j\) increases, so
\(k_{\mathrm{phase}}\) is positive on the lower cuts and negative on the
higher cuts, with

\[
\int_0^\infty r^2e^{-tr^2}k_{\mathrm{phase}}(r)\,dr
=B\,\operatorname{Cov}_{\omega}(d_j,\mu_j)<0.
\tag{5.134}
\]

The full zero-mass signed density is
\(k_{\Xi,t}=k_{\mathrm{res}}+k_{\mathrm{phase}}\), and

\[
\boxed{
\Xi'(t)
=-\frac1B\int_0^\infty r^2e^{-tr^2}k_{\Xi,t}(r)\,dr
=\rho'(t)+\overline d'(t).
}
\tag{5.135}
\]

For three rates, (5.132) reduces to

\[
\overline d'
=\frac{B_1B_2}{B^2}
 (d_1-d_2)(\mu_2-\mu_1)>0;
\]

the phase density is strictly positive on \(I_1\) and strictly negative
on \(I_2\).

The residual term now compares every cut with one common threshold.  On
\(I_j\), define

\[
G_j(r)=
\prod_{i\le j}
\left(\frac{r-b_i}{r+b_i}\right)^{\beta_i}
\prod_{i>j}
\left(\frac{b_i-r}{b_i+r}\right)^{\beta_i},
\qquad
g_j(r)=\frac{G_j(r)}{s_j}.
\tag{5.136}
\]

Then

\[
k_{\mathrm{res}}(r)
=s_jm_j(r)\bigl(g_j(r)-\rho\bigr),
\qquad r\in I_j.
\]

Each \(g_j\) is strictly one-peaked by (5.107).  Put

\[
g_*=\max_{1\le j<n}\sup_{r\in I_j}g_j(r).
\]

The exterior signs in (5.127), the cut formula above, and the zero-mass
property give two strict one-crossing regimes:

\[
\boxed{
\rho(t)\le0\quad\Longrightarrow\quad\rho'(t)>0,
\qquad
\rho(t)\ge g_*\quad\Longrightarrow\quad\rho'(t)>0.
}
\tag{5.137}
\]

This gives a genuine multirate parameter cone.  Since \(N/Q>0\), if
\(\beta_1>1/2\) then
\(d_j\le d_1=\cot(\pi\beta_1)<0\), and hence

\[
\rho=\Xi-\overline d>-\overline d\ge-d_1.
\]

Consequently,

\[
\boxed{
\begin{gathered}
\sum_{i=1}^n\beta_i=1,\qquad
\beta_1>\frac12,\qquad
g_*\le-\cot(\pi\beta_1)
\\[1mm]
\Longrightarrow\quad
\left(\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i}\right)^2\in GGC.
\end{gathered}
}
\tag{5.138}
\]

For \(n\ge3\), both inequalities leading to
\(\rho>g_*\) and both derivative contributions are strict.  Formula
(5.13a) and the endpoint phase conditions then prove (5.138).  This cone
is an analytic theorem for arbitrary finite \(n\), not merely a first-cut
statement.  It is nonempty: after scaling \(b_1=1\), if
\(b_n\le1+\varepsilon\), every ratio in (5.136) is at most
\(\varepsilon/2\), whence
\[
g_*\le\frac{\varepsilon}
 {2\min_{1\le j<n}\sin(\pi A_j)}.
\]
For fixed weights with \(\beta_1>1/2\), sufficiently small
\(\varepsilon>0\) therefore satisfies (5.138).

For the remaining region, the exact undetermined quantity is one
covariance.  Let \(\nu_t\) be the probability measure on the union of the
cuts with density \(B^{-1}e^{-tr^2}q(r)\), and put
\(g(r)=g_j(r)\) on \(I_j\).  Define

\[
\begin{aligned}
P&=\int_0^{b_1}e^{-tr^2}h_{\mathrm{ext}}(r)\,dr,&
\mu_P&=\frac1P\int_0^{b_1}r^2e^{-tr^2}h_{\mathrm{ext}}(r)\,dr,\\
U&=\int_{b_n}^\infty e^{-tr^2}(-h_{\mathrm{ext}}(r))\,dr,&
\mu_U&=\frac1U\int_{b_n}^\infty
r^2e^{-tr^2}(-h_{\mathrm{ext}}(r))\,dr.
\end{aligned}
\tag{5.139}
\]

Then
\(\mu_P<b_1^2<\mu_B<b_n^2<\mu_U\), and direct expansion of
\(\rho'= (E'B-EB')/B^2\) gives

\[
\boxed{
\rho'
=\frac PB(\mu_B-\mu_P)
 +\frac UB(\mu_U-\mu_B)
 -\operatorname{Cov}_{\nu_t}\!\bigl(g(R),R^2\bigr).
}
\tag{5.140}
\]

Combining (5.132) and (5.140) isolates the exact remaining inequality:

\[
\boxed{
\begin{aligned}
\Xi'={}&
\frac PB(\mu_B-\mu_P)
+\frac UB(\mu_U-\mu_B)\\
&-\operatorname{Cov}_{\nu_t}\!\bigl(g(R),R^2\bigr)
+\sum_{i<j}\omega_i\omega_j
(d_i-d_j)(\mu_j-\mu_i).
\end{aligned}
}
\tag{5.141}
\]

The two exterior buffers are strictly positive, and the phase-mixing
buffer is nonnegative and is strict when \(n\ge3\).  The sole term without
a fixed sign is the covariance of the piecewise one-peaked cut likelihood
\(g\) with \(R^2\).

Equivalently, define the cumulative signed mass

\[
C_t(x)=\int_0^x e^{-tr^2}k_{\Xi,t}(r)\,dr.
\]

For a fixed \(t>0\), if \(C_t(x)\ge0\) for every \(x>0\), integration by
parts gives

\[
\int_0^\infty r^2e^{-tr^2}k_{\Xi,t}(r)\,dr
=-\int_0^\infty2rC_t(r)\,dr\le0.
\tag{5.142}
\]

The boundary term vanishes: the Gaussian factor and
\(h_{\mathrm{ext}}(r)=O(r^{-2})\) give \(r^2C_t(r)\to0\).
Thus (5.142) is a concrete sufficient certificate for \(\Xi'(t)\ge0\);
if it holds for every \(t>0\), (5.13a) gives the GGC conclusion.
In the central range \(0<\rho<g_*\), each cut can contribute a
\(-,+,-\) pattern, so three rates can have up to six successive cut lobes.
Within this WIP-5.14 certificate, WIP-5.13 controls one prefix in explicit
cones and the remaining obligation is to control the later prefixes or to
dominate them by the three positive
buffers in (5.141).

Finally, local cut centers do not supply independent free parameters.  If
\(\chi_j=s_j(\Xi-d_j)\), then

\[
\frac{\chi_j}{s_j}+d_j=\Xi,\qquad
\frac{\chi_j}{s_j}-\frac{\chi_i}{s_i}=d_i-d_j,\qquad
\chi_j'=s_j\Xi'.
\tag{5.143}
\]

Thus the legal center vector lies on a one-dimensional affine line.  The
weighted projection (5.130)--(5.133) removes the baseline obstruction
without inventing \(n-1\) independent centers.

As an independent normalization check, (5.12) becomes

\[
\boxed{
\mathbb E[\mathcal K(uR_1,uR_2)]
=\frac{2t}{\pi^{3/2}}
\left[
BE'-EB'
+\sum_{i<j}B_iB_j(d_i-d_j)(\mu_j-\mu_i)
\right].
}
\tag{5.144}
\]

<a id="wip-5-15"></a>
### WIP-5.15 — the cut critical polynomial and directly checkable
multirate cones

**Status: [PROVED EXPLICITIZATION OF (5.138) AND EXACT THREE-RATE
CERTIFICATE].**

The implicit maximum \(g_*\) in (5.138) can be computed from one
interlacing polynomial.  On every cut \(I_j\), differentiation of (5.136)
gives the same rational function:

\[
\boxed{
\frac12(\log G_j)'(r)
=F(r):=\sum_{i=1}^n\frac{\beta_i b_i}{r^2-b_i^2}.
}
\tag{5.145}
\]

On \(I_j\),

\[
F'(r)=-2r\sum_{i=1}^n
\frac{\beta_i b_i}{(r^2-b_i^2)^2}<0,
\qquad
F(b_j+)=+\infty,\quad F(b_{j+1}-)=-\infty.
\]

Thus \(G_j\) has a unique maximizer \(r_j\).  With \(x_j=r_j^2\), it is
the unique root in \((b_j^2,b_{j+1}^2)\) of

\[
\boxed{
\mathcal P(x)=
\sum_{i=1}^n\beta_i b_i
\prod_{k\ne i}(x-b_k^2).
}
\tag{5.146}
\]

All \(n-1\) roots of \(\mathcal P\) are therefore simple and strictly
interlace \(b_1^2,\ldots,b_n^2\), and

\[
\boxed{
g_*=
\max_{1\le j<n}
\frac{G_j(\sqrt{x_j})}{\sin(\pi A_j)}.
}
\tag{5.147}
\]

For \(n=3\), define

\[
\begin{aligned}
\Lambda_0&=\sum_{i=1}^3\beta_i b_i,\\
\Lambda_1&=\sum_{i=1}^3\beta_i b_i
 \sum_{k\ne i}b_k^2,\\
\Lambda_2&=\sum_{i=1}^3\beta_i b_i
 \prod_{k\ne i}b_k^2.
\end{aligned}
\]

Then

\[
\mathcal P(x)=\Lambda_0x^2-\Lambda_1x+\Lambda_2,
\qquad
x_\pm=
\frac{\Lambda_1\pm
\sqrt{\Lambda_1^2-4\Lambda_0\Lambda_2}}
{2\Lambda_0},
\tag{5.148}
\]

with \(x_-\in(b_1^2,b_2^2)\) and
\(x_+\in(b_2^2,b_3^2)\).  If
\(\alpha=\beta_1>1/2\), condition (5.138) is exactly

\[
\boxed{
G_1(\sqrt{x_-})\le-\cos(\pi\alpha),
\qquad
G_2(\sqrt{x_+})
\le-\cot(\pi\alpha)\sin(\pi\beta_3).
}
\tag{5.149}
\]

There is also a root-free endpoint envelope.  Put

\[
U_j=
\prod_{i\le j}
\left(\frac{b_{j+1}-b_i}{b_{j+1}+b_i}\right)^{\beta_i}
\prod_{i>j}
\left(\frac{b_i-b_j}{b_i+b_j}\right)^{\beta_i}.
\tag{5.150}
\]

For \(i\le j\), the corresponding factor of \(G_j\) increases with \(r\);
for \(i>j\), it decreases.  Taking the appropriate endpoint supremum
factor by factor proves

\[
\sup_{I_j}G_j\le U_j.
\]

Consequently the directly checkable conditions

\[
\boxed{
\beta_1>\frac12,\qquad
U_j\le-\cot(\pi\beta_1)\sin(\pi A_j)
\quad(1\le j<n)
}
\tag{5.151}
\]

imply (5.138), and hence the GGC property.  In the three-rate case, with

\[
\delta_{ij}=\frac{b_j-b_i}{b_j+b_i},
\]

the two envelopes are

\[
U_1=\delta_{12}^{\,1-\beta_3}\delta_{13}^{\,\beta_3},
\qquad
U_2=\delta_{13}^{\,\beta_1}\delta_{23}^{\,1-\beta_1}.
\]

Thus (5.151) becomes

\[
\boxed{
\begin{aligned}
\beta_1&>\frac12,\\
\delta_{12}^{\,1-\beta_3}\delta_{13}^{\,\beta_3}
&\le-\cos(\pi\beta_1),\\
\delta_{13}^{\,\beta_1}\delta_{23}^{\,1-\beta_1}
&\le-\cot(\pi\beta_1)\sin(\pi\beta_3).
\end{aligned}
}
\tag{5.152}
\]

A coarser condition uses only the total rate contrast.  Let

\[
\delta=\frac{b_n-b_1}{b_n+b_1},
\qquad
s_{\min}=\min_{1\le j<n}\sin(\pi A_j),
\qquad
K=-\cot(\pi\beta_1)s_{\min}.
\]

Every factor in \(G_j\) is at most \(\delta\); since the shape weights sum
to one,

\[
g_*\le\frac{\delta}{s_{\min}}.
\]

Moreover \(0<K<1\): one has
\(s_{\min}\le\sin(\pi\beta_n)\le\sin(\pi(1-\beta_1))\), and hence
\(K\le\cos(\pi(1-\beta_1))<1\).  (The middle inequality is an
equality when \(n=2\).)  Therefore

\[
\boxed{
\beta_1>\frac12,\qquad
\frac{b_n}{b_1}\le\frac{1+K}{1-K}
\quad\Longrightarrow\quad
\left(\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i}\right)^2\in GGC.
}
\tag{5.153}
\]

For three rates, (5.152) also has a trigonometry-free rational
relaxation.  Concavity of sine, \(\tan x>x\), \(\pi>3\), and weighted
AM--GM give

\[
\begin{aligned}
-\cos(\pi\beta_1)&\ge2\beta_1-1,\\
-\cot(\pi\beta_1)\sin(\pi\beta_3)
&>3\beta_3(2\beta_1-1),\\
U_1&\le(1-\beta_3)\delta_{12}+\beta_3\delta_{13},\\
U_2&\le\beta_1\delta_{13}+(1-\beta_1)\delta_{23}.
\end{aligned}
\]

It follows that the following trigonometry-free inequalities (involving
only rational operations and the ordered rate contrasts)

\[
\boxed{
\begin{aligned}
(1-\beta_3)\delta_{12}+\beta_3\delta_{13}
&\le2\beta_1-1,\\
\beta_1\delta_{13}+(1-\beta_1)\delta_{23}
&\le3\beta_3(2\beta_1-1)
\end{aligned}
}
\tag{5.154}
\]

are sufficient.

As an exact illustration beyond the golden-ratio support cone, take

\[
(\beta_1,\beta_2,\beta_3)
=\left(\frac23,\frac1{12},\frac14\right),
\qquad
(b_1,b_2,b_3)=(1,2,3).
\]

Then
\(\delta_{12}=1/3\), \(\delta_{13}=1/2\), and
\(\delta_{23}=1/5\).  The first envelope satisfies

\[
U_1^4=\frac1{54}<\frac1{16}
=\left(-\cos\frac{2\pi}{3}\right)^4,
\]

while

\[
U_2^3=\frac1{20}
<\frac1{6\sqrt6}
=\left(
-\cot\frac{2\pi}{3}\sin\frac\pi4
\right)^3;
\]

the middle inequality follows from \(6\sqrt6<20\), equivalently
\(216<400\).  Hence

\[
\boxed{
\left(
G_{2/3}+\frac{G_{1/12}}2+\frac{G_{1/4}}3
\right)^2\in GGC.
}
\tag{5.155}
\]

Its rate ratio is \(3>(1+\sqrt5)/2\), so the example lies beyond the
uniform support cone (5.16).  It also satisfies the separate mean cone
(5.34e), so it illustrates the new multicut certificate rather than
claiming a previously uncovered distribution.

<a id="wip-5-16"></a>
### WIP-5.16 — the three-rate interface and a finite-prefix reduction

**Status: [PROVED REDUCTIONS AND CONDITIONAL CONES; SECOND RISING PREFIX
LATER CLOSED FOR ALL PARAMETERS BY WIP-5.26].**

Specialize WIP-5.14 to three rates.  Let \(\nu_{j,t}\) be the probability
measure on \(I_j\) with density
\(B_j^{-1}e^{-tr^2}s_jm_j(r)\), and define

\[
\overline g_j=\mathbb E_{\nu_{j,t}}[g_j(R)],\qquad
\mu_j=\mathbb E_{\nu_{j,t}}[R^2],\qquad
\sigma_j=\operatorname{Cov}_{\nu_{j,t}}(g_j(R),R^2),
\]

\[
\ell_j=\overline g_j+d_j,\qquad
\Delta=d_1-d_2>0,\qquad
\omega_j=\frac{B_j}{B_1+B_2}.
\tag{5.156}
\]

The cumulative signed mass at the cut interface has the exact form

\[
\boxed{
C_t(b_2)
=\omega_2P+\omega_1U
+\frac{B_1B_2}{B_1+B_2}(\ell_1-\ell_2).
}
\tag{5.157}
\]

Indeed,
\(C_t(b_2)=P+B_1(\ell_1-\Xi)\), while zero total mass gives

\[
\Xi=\frac{P-U+B_1\ell_1+B_2\ell_2}{B_1+B_2};
\]

substitution proves (5.157).  The covariance in (5.141) also separates
into its two within-cut terms and one between-cut term.  Combining the
latter with the phase buffer gives

\[
\boxed{
\begin{aligned}
\Xi'={}&
\frac PB(\mu_B-\mu_P)
+\frac UB(\mu_U-\mu_B)
-\omega_1\sigma_1-\omega_2\sigma_2\\
&+\omega_1\omega_2(\ell_1-\ell_2)(\mu_2-\mu_1).
\end{aligned}
}
\tag{5.158}
\]

Thus the same scalar \(\ell_1-\ell_2\) controls both the interface prefix
and the cross-cut covariance.  If

\[
\boxed{g_{2,*}\le\Delta,}
\tag{5.159}
\]

then

\[
\ell_1-\ell_2
=\Delta+\overline g_1-\overline g_2
>\Delta-g_{2,*}\ge0.
\]

Consequently \(C_t(b_2)>0\), and the final term in (5.158) is strictly
positive.  A shape-only condition implies (5.159) for arbitrary rates:

\[
\boxed{\beta_1\le\beta_2\quad\Longrightarrow\quad\ell_1>\ell_2.}
\tag{5.160}
\]

To prove it, use \(0<G_j<1\) and
\(A_2=\beta_1+\beta_2\):

\[
\ell_1>d_1=\cot(\pi\beta_1),
\qquad
\ell_2<d_2+\csc(\pi A_2)
=\cot\!\left(\frac{\pi A_2}{2}\right).
\]

When \(\beta_1\le\beta_2\), one has
\(\beta_1\le A_2/2\), so monotonicity of cotangent proves (5.160).
The strict bound also shows directly that
\(g_{2,*}<\Delta\).  This removes the cut-to-cut covariance, but not the
two within-cut covariances in (5.158).

There is an exact finite-prefix formulation of what remains.  On \(I_j\),
write

\[
\eta_j(t)=\Xi(t)-d_j,
\qquad
k_{\Xi,t}(r)=s_jm_j(r)\bigl(g_j(r)-\eta_j\bigr).
\tag{5.161}
\]

Whenever \(0<\eta_j<g_{j,*}\), let \(r_j^-\) denote the rising-branch
root of \(g_j(r)=\eta_j\).  The one-peak property shows that
\(C_t(x)\ge0\) for every \(x>0\) is equivalent to checking the possible
local minima

\[
\boxed{
C_t(b_2),\qquad C_t(r_1^-),\qquad C_t(r_2^-),
}
\tag{5.162}
\]

with nonexistent roots omitted.  The fixed endpoints are already positive:

\[
C_t(b_1)=P>0,\qquad C_t(b_3)=U>0.
\]

After scaling \(b_1=1\), the first-root value is exactly

\[
C_t(r_1^-)
=P-\int_{b_1}^{r_1^-}e^{-tr^2}m_1(r)
\bigl(\chi_1-G_1(r)\bigr)\,dr,
\qquad
\chi_1=s_1\eta_1=G_1(r_1^-).
\tag{5.163}
\]

Therefore each certificate in WIP-5.13 applies without modification.
The only genuinely new prefix is

\[
C_t(r_2^-)=C_t(b_2)-N_{2,-}(t),
\]

where

\[
N_{2,-}(t)=
\int_{b_2}^{r_2^-}e^{-tr^2}s_2m_2(r)
\bigl(\eta_2-g_2(r)\bigr)\,dr.
\]

Together with (5.157), the precise sufficient condition is

\[
\boxed{
N_{2,-}(t)\le
\omega_2P+\omega_1U
+\frac{B_1B_2}{B}(\ell_1-\ell_2).
}
\tag{5.164}
\]

In particular, under \(\beta_1\le\beta_2\), every term on the right is
strictly positive.  At this stage it was open whether (5.164) always
holds; WIP-5.26 later proves it for every three-rate total-shape-one
parameter vector as part of the all-cut weighted-prefix theorem.

There are two useful phase-aware cones.  First, pointwise at a fixed
\(t>0\),

\[
\boxed{
d_2+g_{2,*}\le\Xi(t)\le d_1
\quad\Longrightarrow\quad
C_t(x)\ge0\ \text{for all }x,\quad \Xi'(t)>0.
}
\tag{5.165}
\]

Indeed, \(\eta_1\le0\) makes the first cut positive, while
\(\eta_2\ge g_{2,*}\) makes the second cut negative; the exterior pieces
have the same order, so there is one crossing.  The interval in (5.165)
is nonempty whenever (5.159) holds, in particular whenever
\(\beta_1\le\beta_2\).  This is a pointwise-\(t\) certificate, not by
itself an all-\(t\) GGC theorem.

Second, suppose

\[
\boxed{
g_{2,*}\le-d_2
\quad\Longleftrightarrow\quad
\beta_3<\frac12,\qquad
\sup_{I_2}G_2\le\cos(\pi\beta_3).
}
\tag{5.166}
\]

Since \(\Xi(t)>0\), this gives
\(\eta_2=\Xi-d_2>-d_2\ge g_{2,*}\) for every \(t\).  The second cut and
the upper exterior are then strictly negative, and

\[
C_t(b_2)
=-\int_{b_2}^{\infty}e^{-tr^2}k_{\Xi,t}(r)\,dr>0.
\]

The three-rate problem has consequently reduced to the first cut.  If
\(\eta_1\le0\), that cut is positive; if
\(\eta_1\ge g_{1,*}\), it is negative between two positive endpoint
cumulatives; and in the sole remaining case
\(0<\eta_1<g_{1,*}\), WIP-5.13 controls its rising-root minimum.
Hence (5.166), together with any WIP-5.13 certificate valid for every
first rising root that occurs, implies \(\Xi'(t)>0\) for all \(t>0\) and
therefore the GGC property.  This is a conditional dimension-reduction
theorem, not a proof for all three-rate parameters.

<a id="wip-5-17"></a>
### WIP-5.17 — why the first-cut Möbius reflection does not copy to the
upper prefix

**Status: [PROVED OBSTRUCTION TO A SPECIFIC PROOF MECHANISM; NOT A
COUNTEREXAMPLE].**

Write

\[
a=b_1<b=b_2<c=b_3,\qquad
(\alpha,\beta,\gamma)=(\beta_1,\beta_2,\beta_3),
\]

and put

\[
q=1-\gamma=\alpha+\beta,\qquad
\lambda=\frac{B-A}{C-A},\qquad
K=\left(\frac{C-B}{C-A}\right)^\alpha.
\tag{5.167}
\]

The natural upper-tail substitutions

\[
x=\frac{r-C}{r-B},\qquad
v=\frac{C-r}{r-B},\qquad
z=\frac{r+C}{r+B}
\]

give the following positive-density Jacobians (the integration limits below
restore the orientation of the decreasing \(v\)- and \(z\)-coordinates):

\[
\begin{aligned}
m_3(r)\,dr
&=K\frac{x^{q-1}(1-\lambda x)^{-\alpha}}{1-x}\,dx,
&&0<x<1,\\
m_2(r)\,|dr|
&=K\frac{v^{q-1}(1+\lambda v)^{-\alpha}}{1+v}\,|dv|,\\
a(r)\,|dr|
&=K\frac{z^{q-1}(1-\lambda z)^{-\alpha}}{z-1}\,|dz|,
&&z>1.
\end{aligned}
\tag{5.168}
\]

If \(a_2\in(B,C)\) is a second-cut rising root and
\(\theta=G_2(a_2)\), the corresponding unweighted upper-prefix
comparison is

\[
C_0(a_2)=
\lim_{R\to\infty}
\left[
\int_C^R m_3(r)\,dr-\int_{a_2}^R a(r)\,dr
\right]
+\theta\int_{a_2}^C m_2(r)\,dr.
\]

In the coordinates (5.168), this becomes

\[
\begin{aligned}
K^{-1}C_0(a_2)
=\lim_{R\to\infty}\Bigg[
&\int_0^{x_R}
\frac{x^{q-1}(1-\lambda x)^{-\alpha}}{1-x}\,dx\\
&-\int_{z_R}^{z_{a_2}}
\frac{z^{q-1}(1-\lambda z)^{-\alpha}}{z-1}\,dz\\
&+\theta\int_0^{v_{a_2}}
\frac{v^{q-1}(1+\lambda v)^{-\alpha}}{1+v}\,dv
\Bigg],
\end{aligned}
\tag{5.169}
\]

where

\[
x_R=\frac{R-C}{R-B}\uparrow1,\quad
z_R=\frac{R+C}{R+B}\downarrow1,\quad
z_{a_2}=\frac{a_2+C}{a_2+B},\quad
v_{a_2}=\frac{C-a_2}{a_2-B}.
\]

The two finite-\(R\) cutoffs are not exact reflections of one another:

\[
1-x_R=\frac{C-B}{R-B},\qquad
z_R-1=\frac{C-B}{R+B},\qquad
\log\frac{1-x_R}{z_R-1}
=\log\frac{R+B}{R-B}\longrightarrow0.
\]

Thus their logarithmic cutoff mismatch contributes zero to the coupled
limit.  The equal-distance reflection used next is only the local
asymptotic test of its kernel, not an identity between the finite cutoffs.

The first two integrals do not concatenate at an ordinary interior point:
they diverge logarithmically at \(1^-\) and \(1^+\), and only their
coupled cutoff has a finite limit.  Equivalently, direct expansion gives

\[
m_3(r)-a(r)=
\frac{2\sum_i\beta_i b_i}{r^2}+O(r^{-3}),
\qquad r\to\infty,
\]

so the difference of the two logarithmically divergent tails is integrable.
Let

\[
\phi(y)=y^{q-1}(1-\lambda y)^{-\alpha}.
\]

Under the canonical reflection \(x=1-s\), \(z=1+s\),

\[
\frac{\phi(1-s)-\phi(1+s)}s\longrightarrow-2\phi'(1),
\qquad
\frac{\phi'(1)}{\phi(1)}
=-\gamma+\alpha\frac{B-A}{C-B}.
\tag{5.170}
\]

This sign is not fixed.  For
\(\alpha=\beta=\gamma=1/3\), rates \((1,3,4)\) make it positive, while
rates \((1,2,4)\) make it negative.  Thus the linear reflection and
pointwise kernel domination from WIP-5.13 cannot be copied verbatim to the
second prefix.  A successful argument must retain the coupled
\(m_3-a\) cancellation, use a nonlinear transport, or invoke the positive
interface/phase buffers in (5.157)--(5.158).  This is not evidence that
\(C_t(r_2^-)<0\), \(\Xi'(t)<0\), or the GGC conjecture fails.
Nor would the unweighted inequality \(C_0(a_2)\ge0\), by itself, imply its
Gaussian-weighted analogue for \(t>0\): the factor \(e^{-tr^2}\) changes the
relative weights of the cut and exterior lobes.  Formula (5.169) is therefore
a proof-mechanism audit, not a hidden all-\(t\) reduction.
