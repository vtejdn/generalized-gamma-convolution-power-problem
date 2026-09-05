# Route 5D: multicut capacity and adjacent-cut transport

Zero-temperature capacities, adjacent-cut transport, lower and upper buffers, and peak-gap-free multicut criteria.

Entries: WIP-5.18, WIP-5.19, WIP-5.20, WIP-5.21, WIP-5.22, WIP-5.23.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

Original WIP identifiers and equation numbers are preserved. Positional words such as "above" and "below" refer to the original numbered proof sequence.

## Progress entries


<a id="wip-5-18"></a>
### WIP-5.18 — zero-temperature mass ratios and a complete three-rate
certificate

**Status: [PROVED THREE-RATE SUFFICIENT THEOREM, WITH EXACT AND ROOT-FREE
TESTS].**

Retain the three-rate, total-shape-one setting and write

\[
A=b_1<B=b_2<C=b_3,\qquad
(\alpha,\beta,\gamma)=(\beta_1,\beta_2,\beta_3),\qquad
\alpha+\beta+\gamma=1.
\]

Retain \(q,\lambda,K\) from (5.167).

Let \(P(t),B_1(t),B_2(t)\) be as in (5.128) and (5.139), and put

\[
P^{(0)}=P(0),\qquad B_j^{(0)}=B_j(0),\qquad
\omega_{1,0}=\frac{B_1^{(0)}}{B_1^{(0)}+B_2^{(0)}}.
\]

All these zero-temperature integrals are finite.  Since the rate-side
Dirichlet mean is a probability law, \(Q(0)=1\), and (5.129) gives the useful
normalization

\[
\boxed{
B_1^{(0)}+B_2^{(0)}=\pi,qquad
\omega_{1,0}=\frac{B_1^{(0)}}\pi.
}
\tag{5.171}
\]

Two ordered-support ratios improve with \(t\).  Indeed,
\(\mu_P<a^2<\mu_1<\mu_2\), so

\[
\boxed{
\left(\frac{P}{B_1}\right)'
=\frac{P}{B_1}(\mu_1-\mu_P)>0,qquad
\omega_1'=\omega_1\omega_2(\mu_2-\mu_1)>0.
}
\tag{5.172}
\]

Suppose first that a rising root exists on cut \(I_j\), so
\(0<\eta_j<g_{j,*}\), and let \(N_{j,-}\) denote the negative mass before
that root.  Directly from (5.161),

\[
0<N_{1,-}<g_{1,*}B_1,qquad
0<N_{2,-}<g_{2,*}B_2.
\tag{5.173}
\]

Consider the two zero-temperature conditions

\[
\boxed{
g_{1,*}\le\frac{P^{(0)}}{B_1^{(0)}},qquad
g_{2,*}\le
\frac{\omega_{1,0}}{1+\omega_{1,0}}\Delta,qquad
\Delta=d_1-d_2.
}
\tag{5.174}
\]

The first inequality and (5.172)--(5.173) give
\(N_{1,-}<P(t)\), so the first rising minimum is positive for every
\(t>0\).  For the second inequality, strict increase of \(\omega_1\) gives

\[
g_{2,*}<\frac{\omega_1}{1+\omega_1}\Delta
\quad\Longleftrightarrow\quad
g_{2,*}<\omega_1(\Delta-g_{2,*}).
\]

Since
\(\ell_1-\ell_2=\Delta+\overline g_1-\overline g_2
>\Delta-g_{2,*}\), one obtains the strict chain

\[
\boxed{
N_{2,-}<g_{2,*}B_2
<\omega_1B_2(\Delta-g_{2,*})
<\frac{B_1B_2}{B}(\ell_1-\ell_2)
<C_t(b_2).
}
\tag{5.175}
\]

Thus even the phase/interface term alone dominates the second initial
negative lobe; the positive \(P,U\) buffers in (5.157) are not needed for
this estimate.  Conditions (5.174) also make \(C_t(b_2)>0\).  Together with
the fixed positive endpoints and the finite-prefix equivalence (5.162),
this proves

\[
\boxed{
\text{(5.174)}\quad\Longrightarrow\quad
C_t(x)\ge0\ (x>0,t>0),\quad \Xi'(t)>0,\quad
\left(\frac{G_\alpha^{(1)}}a+
      \frac{G_\beta^{(2)}}b+
      \frac{G_\gamma^{(3)}}c\right)^2\in GGC.
}
\tag{5.176}
\]

Cases without a rising root require no extra condition: a cut is then
one-signed, and its two endpoint cumulatives are already among those
controlled above.  Hence (5.176) is a complete sufficient theorem for its
parameter cone, not merely a second-prefix reduction.

The endpoint envelopes from (5.150) remove both maximizations.  The
root-free conditions

\[
\boxed{
\frac{U_1}{s_1}\le\frac{P^{(0)}}{B_1^{(0)}},qquad
\frac{U_2}{s_2}\le
\frac{\omega_{1,0}}{1+\omega_{1,0}}\Delta
}
\tag{5.177}
\]

imply (5.174).  Using

\[
\Delta=
\frac{\sin(\pi\beta)}
{\sin(\pi\alpha)\sin(\pi(\alpha+\beta))},qquad
s_2=\sin(\pi(\alpha+\beta)),
\]

the second inequality in (5.177) is equivalently implied by

\[
\boxed{
U_2\le
\frac{\omega_{1,0}}{1+\omega_{1,0}}
\frac{\sin(\pi\beta)}{\sin(\pi\alpha)}.
}
\tag{5.178}
\]

The remaining zero-temperature cut masses have exact Gauss-hypergeometric
forms.  With

\[
u=\frac{b-a}{c-a},\qquad v=\frac{c-b}{c-a}=1-u,
\]

Euler's beta integral gives

\[
\boxed{
\begin{aligned}
D_1(0)&=u^\gamma\mathrm B(1-\alpha,1-\beta)
{}_2F_1(\gamma,1-\alpha;1+\gamma;u),\\
D_2(0)&=v^\alpha\mathrm B(1-\gamma,1-\beta)
{}_2F_1(\alpha,1-\gamma;1+\alpha;v),\\
B_1^{(0)}&=\sin(\pi\alpha)D_1(0),qquad
B_2^{(0)}=\sin(\pi\gamma)D_2(0).
\end{aligned}
}
\tag{5.179}
\]

There is also a completely explicit version requiring neither root finding
nor hypergeometric evaluation.  Define

\[
\begin{aligned}
p_-={}&a\left[
a^{-\alpha}b^{-\beta}c^{-\gamma}
+(2a)^{-\alpha}(a+b)^{-\beta}(a+c)^{-\gamma}
\right],\\
b_{1,+}={}&s_1
\left(\frac{b-a}{c-b}\right)^\gamma
\mathrm B(1-\alpha,1-\beta),\\
b_{1,-}={}&s_1
\left(\frac{b-a}{c-a}\right)^\gamma
\mathrm B(1-\alpha,1-\beta),\\
b_{2,+}={}&s_2
\left(\frac{c-b}{b-a}\right)^\alpha
\mathrm B(1-\beta,1-\gamma).
\end{aligned}
\tag{5.180}
\]

Monotonicity of the omitted factor on each integration interval yields

\[
P^{(0)}>p_-,\qquad
B_1^{(0)}<b_{1,+},\qquad
B_1^{(0)}>b_{1,-},\qquad
B_2^{(0)}<b_{2,+}.
\tag{5.181}
\]

In view of (5.171), set

\[
\underline\omega=
\frac{\max\{b_{1,-},\,\pi-b_{2,+}\}}\pi
<\omega_{1,0}.
\]

It follows that the entirely explicit inequalities

\[
\boxed{
\frac{U_1}{s_1}\le\frac{p_-}{b_{1,+}},qquad
\frac{U_2}{s_2}\le
\frac{\underline\omega}{1+\underline\omega}\Delta
}
\tag{5.182}
\]

imply the GGC conclusion (5.176).  This last cone uses only beta functions,
trigonometric functions, rational operations, and real powers of the rates.
It is deliberately conservative: (5.174) and (5.177) are the sharper exact
mass-ratio criteria.

<a id="wip-5-19"></a>
### WIP-5.19 — regularized upper-tail cancellation and an adjacent-cut
transport

**Status: [PROVED SECOND-PREFIX TRANSPORT CONE AND EXACT THREE-RATE GGC
CERTIFICATE; PROVED OBSTRUCTION TO A FIXED-ROOT SHORTCUT].**

Continue with

\[
A=b_1<B=b_2<C=b_3,\qquad
(\alpha,\beta,\gamma)=(\beta_1,\beta_2,\beta_3),\qquad
\alpha+\beta+\gamma=1.
\]

Let \(a_2\in(B,C)\) be a rising root on the second cut and set

\[
\theta=G_2(a_2)=s_2(\Xi-d_2).
\]

The zero-total-mass identity gives an upper-tail version of the dangerous
prefix:

\[
\boxed{
C_t(a_2)
=U(t)+\int_{a_2}^{C}e^{-tr^2}
\bigl(\theta m_2(r)-a(r)\bigr)\,dr .
}
\tag{5.183}
\]

Thus \(C_t(a_2)\ge0\) in (5.183) is equivalent to inequality (5.164).  The
same prefix also admits a representation that keeps
the cancellation in WIP-5.17 inside one absolutely convergent integral.
Put

\[
D_0=C-B,\qquad
r_+(x)=B+\frac{D_0}{1-x},\qquad
\mathcal R_+(x)=\frac{a(r_+(x))}{m_3(r_+(x))}.
\]

Then

\[
\boxed{
U(t)=K\int_0^1 e^{-t r_+(x)^2}
\frac{x^{q-1}(1-\lambda x)^{-\alpha}}{1-x}
\bigl(1-\mathcal R_+(x)\bigr)\,dx .
}
\tag{5.184}
\]

Writing \(M=\alpha A+\beta B+\gamma C\), expansion at infinity gives

\[
\lim_{x\uparrow1}
\frac{1-\mathcal R_+(x)}{1-x}
=\frac{2M}{C-B}.
\tag{5.185}
\]

Thus the apparent singularity in (5.184) is removable.  This is the
pointwise regularization of the coupled cutoff in (5.169).  The exact map
between its two original cutoff coordinates is

\[
z=T(x)=\frac{2C-(B+C)x}{B+C-2Bx},
\qquad
T'(x)=-\frac{(C-B)^2}{(B+C-2Bx)^2}.
\]

For completeness, put

\[
r_-(v)=B+\frac{C-B}{1+v}.
\]

Combining the two finite terms in (5.183) yields

\[
\begin{aligned}
K^{-1}C_t(a_2)
={}&\int_0^1 e^{-t r_+(x)^2}
\frac{x^{q-1}(1-\lambda x)^{-\alpha}}{1-x}
\bigl(1-\mathcal R_+(x)\bigr)\,dx\\
&+\int_0^{v_{a_2}}e^{-t r_-(v)^2}
\frac{v^{q-1}(1+\lambda v)^{-\alpha}}{1+v}
\bigl(\theta-G_2(r_-(v))\bigr)\,dv .
\end{aligned}
\tag{5.186}
\]

This formula is finite term by term.  It does not, however, support a
fixed-root all-\(t\) proof.  If \(a\in(B,r_2^*)\) is held fixed,
\(\theta=G_2(a)\), and the right side of (5.183) is evaluated with that
fixed pair, then

\[
f(r)=\theta m_2(r)-a(r)
\]

satisfies \(f(a)=0\) and
\(f'(a)=-m_2(a)G_2'(a)<0\).  Endpoint Laplace asymptotics therefore gives

\[
\boxed{
C_t^{\mathrm{upper}}(a)
=-\frac{m_2(a)G_2'(a)}{4a^2t^2}
e^{-ta^2}\bigl(1+o(1)\bigr),
\qquad t\to\infty.
}
\tag{5.187}
\]

The leading coefficient is negative, so this quantity is negative for all
sufficiently large \(t\).  After the endpoint expansion, the remaining
terms begin on supports strictly above \(a\), hence are exponentially
smaller.  This proves only that a proof which freezes the rising root and
ignores the phase equation cannot work.  In the actual problem
\(a_2=a_2(t)\), and the root can move or disappear; (5.187) is not a
counterexample to (5.164).

There is nevertheless a successful transport when the adjacent lower cut
and the phase relation are retained.  The identity

\[
s_1(d_1-d_2)=\frac{\sin(\pi\beta)}{s_2}
\]

rewrites the full signed densities as

\[
k_{\Xi,t}(r)=a(r)+c_\theta m_1(r)
\quad(A<r<B),\qquad
k_{\Xi,t}(r)=a(r)-\theta m_2(r)
\quad(B<r<a_2),
\]

where

\[
\boxed{
c_\theta=\frac{\sin(\pi\beta)-s_1\theta}{s_2}.
}
\tag{5.188}
\]

Consequently,

\[
\begin{aligned}
C_t(a_2)
={}&\int_0^A e^{-tr^2}(a+m_0)(r)\,dr\\
&+\int_A^B e^{-tr^2}(a+c_\theta m_1)(r)\,dr\\
&+\int_B^{a_2}e^{-tr^2}(a-\theta m_2)(r)\,dr .
\end{aligned}
\tag{5.189}
\]

Let

\[
L=B-A,\qquad R=C-B,\qquad d=a_2-B,
\]

and pair \(r=B-Lx\) with \(s=B+dx\), \(0<x<1\).  Including the two
Jacobians, their exact density ratio is

\[
\boxed{
H_d(x)=
\frac{d\,m_2(B+dx)}{L\,m_1(B-Lx)}
=
\left(\frac{d(1-x)}{L+dx}\right)^\alpha
\left(\frac{d(R+Lx)}{L(R-dx)}\right)^\gamma .
}
\tag{5.190}
\]

If

\[
\boxed{
c_\theta\ge\theta\sup_{0\le x\le1}H_d(x),
}
\tag{5.191}
\]

then \(B-Lx<B+dx\), so the Gaussian weight only strengthens the lower-cut
side of the comparison.  Equations (5.189)--(5.191) give

\[
\begin{aligned}
c_\theta\int_A^B e^{-tr^2}m_1(r)\,dr
&\ge\theta\int_B^{a_2}e^{-tr^2}m_2(r)\,dr,\\
C_t(a_2)
&\ge
\int_0^{a_2}e^{-tr^2}a(r)\,dr
+\int_0^Ae^{-tr^2}m_0(r)\,dr>0.
\end{aligned}
\tag{5.192}
\]

Thus (5.191) is a direct analytic certificate for (5.164), without
discarding the \(t\)-dependent phase relation.  An optimization-free
pointwise envelope for its Jacobian is

\[
\boxed{
\sup_xH_d(x)\le\overline H(d):=
\left(\frac dL\right)^\alpha
\left(\frac{d(R+L)}{L(R-d)}\right)^\gamma .
}
\tag{5.193}
\]

Both factors on the right increase with \(d\).  If \(r_2^*\) is the unique
maximizer of \(G_2\), define

\[
D=r_2^*-B,\qquad M_2=G_2(r_2^*).
\]

Every rising root satisfies \(d<D\) and \(\theta<M_2\).  Hence the
rate-and-shape condition

\[
\boxed{
M_2\bigl(s_1+s_2\overline H(D)\bigr)
\le\sin(\pi\beta)
}
\tag{5.194}
\]

makes every possible second rising prefix strictly positive.  This is a
uniform second-prefix theorem; a complete GGC conclusion additionally
requires the first rising prefix and the interface to be controlled.

The following exact example shows that this transport cone has content
beyond the four earlier elementary cones checked below.  Take

\[
(\alpha,\beta,\gamma)
=\left(\frac14,\frac14,\frac12\right),
\qquad
(A,B,C)=(1,2,4).
\]

The critical polynomial (5.146), multiplied by \(4\), is

\[
\mathcal P_4(x)=11x^2-94x+128.
\tag{5.195}
\]

On the first cut,

\[
\mathcal P_4(1)=45>0,\qquad
\mathcal P_4(9/4)=-\frac{445}{16}<0,
\]

so \(r_1^*<3/2\).  For every first rising root \(a<r_1^*\), the support
ratio (5.102) satisfies

\[
\left(\frac{w_a}{z_a}\right)^{3/2}
=
\left(\frac{a-1}{a+1}\right)^2
\frac{(a+2)(4-a)}{(2-a)(a+4)}
<
\frac7{55}<1.
\tag{5.196}
\]

Indeed, both displayed factors are increasing on \(1<a<3/2\); for the
second one,

\[
\frac d{da}\log\frac{(a+2)(4-a)}{(2-a)(a+4)}
=\frac4{4-a^2}-\frac8{16-a^2}>0.
\]

Thus WIP-5.12 controls every first rising prefix.

On the second cut,

\[
\mathcal P_4(25/4)=-\frac{477}{16}<0,\qquad
\mathcal P_4(64/9)=\frac{1280}{81}>0,
\]

and hence

\[
\frac52<r_2^*<\frac83,\qquad D<\frac23.
\]

At this maximizer, monotonicity of the three elementary factors in \(G_2\)
gives

\[
\boxed{
M_2^4<
\frac5{11}\frac17\left(\frac3{13}\right)^2
=\frac{45}{13013}<\frac1{256},
\qquad M_2<\frac14.
}
\tag{5.197}
\]

Here \(L=1\), \(R=2\), and therefore

\[
\overline H(D)
=D^{1/4}\left(\frac{3D}{2-D}\right)^{1/2}
<\sqrt{\frac32}.
\]

Since \(s_1=1/\sqrt2\), \(s_2=1\), and
\(\sin(\pi\beta)=1/\sqrt2\), equations (5.193) and (5.197) yield

\[
M_2\bigl(s_1+s_2\overline H(D)\bigr)
<
\frac{1+\sqrt3}{4\sqrt2}
<\frac1{\sqrt2}.
\tag{5.198}
\]

Thus (5.194) controls every second rising prefix.  Moreover
\(\alpha=\beta\), so (5.160) and (5.157) give \(C_t(b_2)>0\).
The two exterior endpoints are positive, and cases without a rising root
introduce no other local minimum.  The finite-prefix criterion (5.162)
therefore proves \(C_t(x)\ge0\) for every \(x,t>0\), with strict positivity
on a set of positive measure.  It follows that \(\Xi'(t)>0\) and

\[
\boxed{
\left(
G_{1/4}^{(1)}
+\frac{G_{1/4}^{(2)}}2
+\frac{G_{1/2}^{(3)}}4
\right)^2\in GGC.
}
\tag{5.199}
\]

The finite rational checks in (5.195)--(5.199) are reproduced by
[computations/route5_three_rate_transport_certificate.py](../computations/route5_three_rate_transport_certificate.py)
using Python's exact `fractions.Fraction`.  The script verifies the
displayed polynomial values, \(7/55\), \(45/13013<1/256\), the radical
comparisons after squaring, and the weighted mean.  The transport theorem
itself is the analytic proof above and is not inferred from the script.

This example is not covered by the earlier simple cones:

\[
\frac{b_3}{b_1}=4>\frac{1+\sqrt5}{2},\qquad
\sum_i\beta_i b_i=\frac{11}{4}>2b_1,\qquad
\beta_1=\frac14<\frac12.
\]

It also has \(\beta_3=1/2\), so the strict last-cut-suppression condition
(5.166) fails.  This is a new parameter certificate, not a resolution of
the general three-rate problem.

<a id="wip-5-20"></a>
### WIP-5.20 — multicut zero-temperature phase capacity

**Status: [PROVED ARBITRARY FINITE-RATE SUFFICIENT THEOREM; PROVED A
STRICTLY IMPROVED THREE-RATE THRESHOLD].**

Return to the arbitrary finite, total-shape-one setting of WIP-5.14 and
write \(m=n-1\) for the number of cuts.  For \(2\le j\le m\), define

\[
\eta_j(t)=\Xi(t)-d_j,\qquad
g_{j,*}=\sup_{r\in I_j}g_j(r),\qquad
\delta_j=d_{j-1}-d_j
=\frac{\sin(\pi\beta_j)}{s_{j-1}s_j}>0.
\tag{5.200}
\]

The correct capacity for an internal cut is normalized by the cuts up to
and including that cut, not by all cuts.  Put

\[
T_j(t)=\sum_{i\le j}B_i(t),\qquad
H_j(t)=\sum_{i<j}B_i(t)(d_i-d_j),\qquad
\widehat{\mathcal R}_j(t)=\frac{H_j(t)}{T_j(t)}.
\tag{5.201}
\]

For fixed \(j\), let

\[
h_i^{(j)}=(d_i-d_j)\mathbf 1_{\{i<j\}},
\qquad
\widehat\omega_i^{(j)}(t)=\frac{B_i(t)}{T_j(t)},
\qquad 1\le i\le j.
\]

The sequence \(h_i^{(j)}\) strictly decreases, whereas the ordered cut
supports give \(\mu_1<\cdots<\mu_j\).  Reverse-order covariance therefore
gives

\[
\boxed{
\widehat{\mathcal R}_j'(t)
=-\operatorname{Cov}_{\widehat\omega^{(j)}(t)}
  (h_i^{(j)},\mu_i)
=\sum_{i<k\le j}\widehat\omega_i^{(j)}\widehat\omega_k^{(j)}
 (h_i^{(j)}-h_k^{(j)})(\mu_k-\mu_i)>0.
}
\tag{5.202}
\]

This leads to the following multicut theorem.

\[
\boxed{
\begin{gathered}
g_{1,*}\le\frac{P(0)}{B_1(0)},\\
g_{j,*}\le
\min\{\delta_j,\widehat{\mathcal R}_j(0)\},
\qquad 2\le j\le m
\end{gathered}
\quad\Longrightarrow\quad
C_t(x)\ge0\quad(t>0,x>0).
}
\tag{5.203}
\]

Consequently \(\Xi'(t)>0\) and

\[
\boxed{
\left(\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i}\right)^2\in GGC,
\qquad
\beta_i>0,\qquad\sum_i\beta_i=1.
}
\tag{5.204}
\]

Here and below the gamma variables are independent.  The proof is a global
sign classification.  On cut \(j\), the density is positive if
\(\eta_j\le0\), has the pattern \(-,+,-\) if
\(0<\eta_j<g_{j,*}\), and is nonpositive if
\(\eta_j\ge g_{j,*}\).  Moreover,

\[
\eta_j-\eta_{j-1}=\delta_j.
\tag{5.205}
\]

If cut \(j\) is active, then
\(0<\eta_j<g_{j,*}\le\delta_j\), so
\(\eta_{j-1}<0\) and every lower cut is positive.  If a higher cut \(k\)
were also active, then its own gap inequality would give
\(\eta_{k-1}<0\), contradicting
\(\eta_{k-1}>\eta_j>0\).  Thus at most one cut is active, and every cut
above it is nonpositive.

Suppose the unique active cut is \(j\ge2\), and let \(r_j^-\) be its
rising root.  With \(\overline g_i\) as in (5.156), direct integration up
to \(b_j\) gives

\[
C_t(b_j)=P(t)+\sum_{i<j}B_i(t)
 [\overline g_i(t)+d_i-d_j-\eta_j(t)].
\]

The initial negative lobe obeys
\(0<N_{j,-}(t)<\eta_j(t)B_j(t)\).  Hence

\[
\boxed{
C_t(r_j^-)
>H_j(t)-\eta_j(t)T_j(t)
=T_j(t)[\widehat{\mathcal R}_j(t)-\eta_j(t)]>0,
}
\tag{5.206}
\]

where (5.202)--(5.203) and \(\eta_j<g_{j,*}\) give the last inequality.
If the first cut is active, (5.172) and
\(N_{1,-}<\eta_1B_1<g_{1,*}B_1\) instead give
\(C_t(r_1^-)>0\).  After the unique rising minimum the cumulative mass
first increases and then decreases to \(C_t(\infty)=0\), so it never
becomes negative.  If no cut is active, the strict increase of \(\eta_j\)
forces one positive block followed by one nonpositive block; zero total
mass gives the same conclusion.  This also covers the tangent cases
\(\eta_j=0\) and \(\eta_j=g_{j,*}\).

There is a simpler, more conservative form.  Define

\[
\widehat\lambda_{j,0}
=\frac{\sum_{i<j}B_i(0)}{\sum_{i\le j}B_i(0)}.
\tag{5.207}
\]

Since \(d_i-d_j\ge\delta_j\) for every \(i<j\),
\(\widehat{\mathcal R}_j(0)\ge
\widehat\lambda_{j,0}\delta_j\).  Therefore

\[
\boxed{
g_{1,*}\le\frac{P(0)}{B_1(0)},qquad
g_{j,*}\le\widehat\lambda_{j,0}\delta_j
\quad(2\le j\le m)
}
\tag{5.208}
\]

already implies (5.203); the second inequality automatically implies the
strict peak-gap bound because \(0<\widehat\lambda_{j,0}<1\).

For the last cut, \(T_m(0)=\sum_{i=1}^mB_i(0)=\pi\).  In particular, in
the three-rate case (5.208) becomes

\[
\boxed{
g_{2,*}\le\omega_{1,0}\Delta
\quad\Longleftrightarrow\quad
M_2\le
\omega_{1,0}\frac{\sin(\pi\beta)}{s_1}.
}
\tag{5.209}
\]

This strictly improves the second condition in (5.174), which contains
the smaller factor \(\omega_{1,0}/(1+\omega_{1,0})\).  The improvement
comes from retaining the actual moving height \(\eta_j\) both in the
phase loss and in the lobe estimate, rather than bounding it twice by
\(g_{j,*}\).

The exact checks are triangular.  At \(t=0\),

\[
\boxed{
H_2=B_1\delta_2,qquad
H_{j+1}=H_j+\delta_{j+1}T_j,qquad
T_{j+1}=T_j+B_{j+1},
}
\tag{5.210}
\]

where all quantities in (5.210) are evaluated at zero.  Equivalently,
\(H_j=\sum_{q=2}^j\delta_qT_{q-1}\), and the exact capacity test is
\(g_{j,*}\le H_j/T_j\).

The endpoint envelope (5.150) removes the critical-point optimizations.
Writing \(u_j=U_j/s_j\), a root-free version is

\[
\boxed{
u_1\le\frac{P(0)}{B_1(0)},qquad
u_j\le\min\{\delta_j,H_j(0)/T_j(0)\},
\quad 2\le j\le m.
}
\tag{5.211}
\]

One can also remove the remaining cut integrals.  If
\(L_i=b_{i+1}-b_i\), then endpoint comparison followed by the beta integral
gives

\[
\begin{aligned}
\underline B_i:={}&s_iL_i^{1-\beta_i-\beta_{i+1}}
 \mathrm B(1-\beta_i,1-\beta_{i+1})\\
&\times
 \prod_{k<i}(b_{i+1}-b_k)^{-\beta_k}
 \prod_{k>i+1}(b_k-b_i)^{-\beta_k}
\le B_i(0),
\end{aligned}
\tag{5.212}
\]

with equality only when \(n=2\).  Also

\[
\begin{aligned}
\underline P&=b_1\left[
 \prod_kb_k^{-\beta_k}+\prod_k(b_k+b_1)^{-\beta_k}
 \right]<P(0),\\
\overline B_1&=s_1L_1^{1-\beta_1-\beta_2}
 \mathrm B(1-\beta_1,1-\beta_2)
 \prod_{k=3}^n(b_k-b_2)^{-\beta_k}\ge B_1(0).
\end{aligned}
\tag{5.213}
\]

The last inequality is strict for \(n\ge3\) and an equality for \(n=2\).
It follows that the entirely parameter-level conditions

\[
\boxed{
u_1\le\frac{\underline P}{\overline B_1},qquad
u_j\le\min\left\{
\delta_j,\frac1\pi\sum_{i<j}\underline B_i(d_i-d_j)
\right\},\quad 2\le j\le m,
}
\tag{5.214}
\]

imply (5.203).  The denominator \(\pi\) in (5.214) deliberately gives up
the stronger prefix normalization in order to avoid upper-bounding every
partial mass \(T_j(0)\).

This cone reaches arbitrarily close to equal rates, but it does not contain
a full neighborhood of the equal-rate diagonal.  More precisely, for a
fixed nondegenerate gap profile \(c_1<\cdots<c_n\) and
\(b_i=b+\varepsilon c_i\), substitution
\(r=b+\varepsilon x\) shows that every \(B_i(0)\) is a fixed positive
constant, whereas

\[
U_j(\varepsilon)=\frac{\varepsilon}{2b}
\left[
\prod_{i\le j}(c_{j+1}-c_i)^{\beta_i}
\prod_{i>j}(c_i-c_j)^{\beta_i}
\right](1+O(\varepsilon)).
\tag{5.215}
\]

Thus every fixed gap-profile ray eventually satisfies (5.211), and the
certificate has open parameter regions arbitrarily close to the diagonal.
Uniformity fails when gap ratios degenerate.  Indeed, for
\(\beta_1=\beta_2=\beta_3=1/3\) and

\[
(b_1,b_2,b_3)=(1,1+\varepsilon^p,1+\varepsilon),\qquad p>4,
\]

the exact hypergeometric asymptotic in (5.179) gives

\[
\widehat{\mathcal R}_2(0)
=\frac{\mathrm B(2/3,2/3)}\pi
 \varepsilon^{(p-1)/3}(1+o(1)),
\qquad
g_{2,*}\ge\frac{\varepsilon}{2\sqrt3}(1+o(1)).
\]

Hence the capacity condition fails for small \(\varepsilon\), although
these laws remain inside the earlier golden-ratio support cone.  This is a
limitation of the new certificate, not a GGC counterexample.  All results
in this subsection are project derivations, not claims imported from the
literature.

<a id="wip-5-21"></a>
### WIP-5.21 — exact and averaged adjacent-cut transport

**Status: [PROVED EXACT QUADRATIC MAXIMUM AND A STRICT CERTIFICATE
HIERARCHY; PROVED TWO NEW THREE-RATE GGC EXAMPLES].**

Return to the three-rate notation of WIP-5.19.  The coarse envelope
\(\overline H(d)\) in (5.193) can first be replaced by the exact maximum of
the transport ratio.  Put \(s=\alpha+\gamma=1-\beta\).  Direct
differentiation of (5.190) gives

\[
(\log H_d)'(x)
=(L+d)\left[
-\frac{\alpha}{(1-x)(L+dx)}
+\frac{\gamma R}{(R+Lx)(R-dx)}
\right].
\tag{5.216}
\]

Its sign is the sign of \(Q_d(x)=A_0+A_1x+A_2x^2\), where

\[
\begin{aligned}
A_0&=R(\gamma L-\alpha R),&
A_1&=R(\alpha+\gamma)(d-L),\\
A_2&=d(\alpha L-\gamma R),&
Q_d(1)&=-\alpha(R+L)(R-d)<0,\\
\operatorname{disc}(Q_d)
&=R^2(\alpha+\gamma)^2(d+L)^2
-4\alpha\gamma dR(L+R)^2.
\end{aligned}
\tag{5.217}
\]

A quadratic has at most one crossing from positive to negative.  If
\(A_2\ne0\), the unique possible interior peak is

\[
x_*=\frac{-A_1-\sqrt{\operatorname{disc}(Q_d)}}{2A_2},
\qquad Q_d'(x_*)=-\sqrt{\operatorname{disc}(Q_d)}<0,
\]

provided the discriminant is positive and \(x_*\in(0,1)\).  If \(A_2=0\),
retain instead \(x_*=-A_0/A_1\) only when \(A_1<0\) and this point lies in
\((0,1)\).  With a nonexistent candidate omitted,

\[
\boxed{
\mathcal H(d):=\sup_{0\le x\le1}H_d(x)
=\max\left\{\left(\frac dL\right)^{\alpha+\gamma},H_d(x_*)\right\}.
}
\tag{5.218}
\]

No optimization of degree higher than two is hidden here.  Also

\[
\partial_d\log H_d(x)
=\frac{\alpha L}{d(L+dx)}
+\frac{\gamma R}{d(R-dx)}>0,
\]

so \(\mathcal H(d)\) strictly increases with \(d\).  The exact criterion
for \(H_d\) to decrease is \(Q_d\le0\) on \([0,1]\); for example it follows
from \(\gamma L\le\alpha R\) together with either \(d\le L\) or
\(\alpha L\ge\gamma R\).

There is also a radical-free envelope strictly below (5.193).  Let

\[
\lambda=\frac dL,qquad \mu=\frac dR,qquad
V=\frac{\lambda+\mu}{1-\mu},qquad
\vartheta=\frac\alpha{\alpha+\gamma},qquad
\varpi=\frac\gamma{\alpha+\gamma},
\]

and define

\[
\widehat H(d)=
\begin{cases}
\lambda^{\alpha+\gamma},&\varpi V\le\lambda,\\[1mm]
\displaystyle
\left\{\varpi V
\left[\frac{\vartheta\lambda}{\varpi(V-\lambda)}\right]^{\vartheta}
\right\}^{\alpha+\gamma},&\varpi V>\lambda.
\end{cases}
\tag{5.219}
\]

Indeed, write
\(H_d^{1/(\alpha+\gamma)}=u^{\vartheta}v^{\varpi}\), where

\[
u=\frac{\lambda(1-x)}{1+\lambda x},qquad
v=\frac{\lambda+\mu x}{1-\mu x}.
\]

For every \(\tau>0\), scaled weighted AM--GM bounds this by
\(\vartheta\tau u+\varpi\tau^{-\vartheta/\varpi}v\).  Both \(u\) and
\(v\) are convex, so the maximum of the right side is at an endpoint;
optimizing \(\tau\) gives (5.219).  The result is the strict hierarchy

\[
\boxed{
\mathcal H(d)\le\widehat H(d)<\overline H(d).
}
\tag{5.220}
\]

In the first branch of (5.219), equality
\(\mathcal H(d)=\lambda^{\alpha+\gamma}\) holds; the branch condition is
equivalent to \(d\le(\alpha R-\gamma L)/(\alpha+\gamma)\).  Thus the exact
pointwise-transport replacement for (5.194) is

\[
\boxed{
M_2[s_1+s_2\mathcal H(D)]\le\sin(\pi\beta),
}
\tag{5.221}
\]

and \(\widehat H(D)\) gives a fully explicit condition strictly stronger
than the old \(\overline H(D)\) test.

An integrated comparison is stronger still.  Define

\[
J_1(t)=\int_A^B e^{-tr^2}m_1(r)\,dr,qquad
J_{2,d}(t)=\int_B^{B+d}e^{-tr^2}m_2(r)\,dr,qquad
\mathcal A(d)=\frac{J_{2,d}(0)}{J_1(0)}.
\tag{5.222}
\]

The transport identity (5.190) shows that

\[
\mathcal A(d)=\int_0^1H_d(x)\,\pi_0(dx),qquad
\pi_0(dx)=\frac{L m_1(B-Lx)}{J_1(0)}\,dx.
\]

Since \(H_d\) is nonconstant and \(\pi_0\) has positive density on
\((0,1)\), \(\mathcal A(d)<\mathcal H(d)\).  More importantly, the two
integrals in (5.222) have strictly ordered supports.  If their respective
\(r^2\)-means are \(\mu_1\) and \(\mu_{2,d}\), then

\[
\left(\frac{J_{2,d}}{J_1}\right)'
=\frac{J_{2,d}}{J_1}(\mu_1-\mu_{2,d})<0.
\]

Since \(\mathcal A(d)\) increases with \(d\), this proves the exact
two-parameter extremum

\[
\boxed{
\sup_{t\ge0,\ 0<d\le D}\frac{J_{2,d}(t)}{J_1(t)}
=\mathcal A(D)<\mathcal H(D).
}
\tag{5.223}
\]

Consequently the exact uniform condition for this adjacent mass comparison
is

\[
\boxed{
M_2[s_1+s_2\mathcal A(D)]\le\sin(\pi\beta).
}
\tag{5.224}
\]

It strictly weakens the exact-sup condition (5.221), without any monotonicity
assumption on \(H_D\).  If desired, its two zero-temperature integrals are

\[
\begin{aligned}
J_1(0)&=u^\gamma\mathrm B(1-\alpha,1-\beta)
 {}_2F_1(\gamma,1-\alpha;1+\gamma;u),\\
J_{2,d}(0)&=\frac{d^{\alpha+\gamma}}
 {(\alpha+\gamma)L^\alpha R^\gamma}
 F_1\left(\alpha+\gamma;\alpha,\gamma;
 1+\alpha+\gamma;-\frac dL,\frac dR\right),
\qquad u=\frac{L}{L+R},
\end{aligned}
\tag{5.225}
\]

by the change of variables \(r=B+dy\).  Here the Appell notation is fixed
directly by

\[
F_1(s;\alpha,\gamma;s+1;x,y)
:=s\int_0^1z^{s-1}(1-xz)^{-\alpha}(1-yz)^{-\gamma}\,dz,
\]

so no separate special-function identity is being imported.

The strict improvement over the coarse pointwise cone has an exact GGC
witness.  Take

\[
(\alpha,\beta,\gamma)=\left(\frac15,\frac15,\frac35\right),
\qquad (A,B,C)=(1,2,7).
\]

Then

\[
\mathcal P(x)=\frac65(4x-7)(x-9),qquad
r_2^*=3,qquad D=1,qquad M_2^5=\frac4{625}.
\tag{5.226}
\]

Here \(L=1,R=5\), and

\[
(\log H_D)'(x)
=-\frac{4(5+7x^2)}{5(1-x^2)(25-x^2)}<0,
\qquad \mathcal H(D)=1.
\]

Put \(\phi=(1+\sqrt5)/2=s_2/s_1\).  Since
\(\phi^{10}=34+55\phi<144\),

\[
(M_2\phi^2)^5
=\frac4{625}\phi^{10}<\frac{576}{625}<1,
\]

so (5.221) holds.  On the other hand,
\(\overline H(D)=(3/2)^{3/5}\), and the exact bounds

\[
M_2>\frac9{25},\qquad
\phi>\frac85,qquad
\overline H(D)>\frac54
\]

give

\[
M_2[1+\phi\overline H(D)]>\frac{27}{25}>1.
\tag{5.227}
\]

Thus the old condition (5.194) fails strictly.  For the first cut,
\(r_1^*=\sqrt7/2<4/3\), and the support ratio (5.102) satisfies

\[
R(a)^4<7^{-5}\left(\frac{17}{5}\right)^3<1
\qquad(1<a<r_1^*).
\]

Hence WIP-5.12 controls the first prefix; \(\alpha=\beta\) controls the
interface by (5.160), and (5.221) controls every second rising prefix.
Therefore

\[
\boxed{
\left(
G_{1/5}^{(1)}+\frac{G_{1/5}^{(2)}}2+
\frac{G_{3/5}^{(3)}}7
\right)^2\in GGC.
}
\tag{5.228}
\]

The average cone is genuinely larger than even the exact-sup cone.  An
exact witness is

\[
(\alpha,\beta,\gamma)=\left(\frac18,\frac18,\frac34\right),
\qquad (A,B,C)=(5,7,23).
\]

Here

\[
\mathcal P(x)=\frac{15}{4}(5x-161)(x-81),qquad
r_2^*=9,\qquad D=L=2,\qquad M_2^8=\frac{7^5}{2^{26}},
\tag{5.229}
\]

and \(H_D\) decreases with \(\mathcal H(D)=1\).  Write
\(c=s_2/s_1=\sqrt{2+\sqrt2}\).  Exact integer comparisons give

\[
M_2>\frac{23}{65},qquad c>\frac{11}{6},qquad
M_2(1+c)>\frac{391}{390}>1,
\]

so (5.221) fails.  Nevertheless, with

\[
w(x)=x^{-1/8}(1-x)^{-1/8}(8+x)^{-3/4},
\]

one has

\[
(\log H_D)'(x)+\frac1{16}
=\frac{x^2(x^2-253)}{16(1-x^2)(64-x^2)}\le0.
\]

Thus \(H_D(x)\le e^{-x/16}\le1-x/17\).  Comparing the weight \(w\)
with the symmetric \(\operatorname{Beta}(7/8,7/8)\) density gives

\[
\mathbb E_{\pi_0}X
\ge\frac12\left(\frac89\right)^{3/4}>\frac49,
\qquad
\mathcal A(D)<\frac{149}{153}.
\]

The complementary exact bounds \(M_2<11/31\) and \(c<37/20\) now yield

\[
M_2[1+c\mathcal A(D)]
<\frac{11}{31}\left(1+\frac{37}{20}\frac{149}{153}\right)
=\frac{94303}{94860}<1.
\tag{5.230}
\]

For auditability, the two large-integer comparisons used for the bounds on
\(M_2\) are

\[
7^5 65^8-2^{26}23^8=100102109324103591>0,
\]

\[
2^{26}11^8-7^5 31^8=50841325950297>0.
\]

Finally, \(r_1^*=\sqrt{161/5}<23/4\), and monotonicity of the two factors
in (5.102) gives

\[
R(a)^7<\left(\frac1{14}\right)^8 7^6<1
\qquad(5<a<r_1^*).
\]

The first prefix, interface, and second prefix are therefore all controlled,
and

\[
\boxed{
\left(
\frac{G_{1/8}^{(1)}}5+
\frac{G_{1/8}^{(2)}}7+
\frac{G_{3/4}^{(3)}}{23}
\right)^2\in GGC.
}
\tag{5.231}
\]

There is a sharp limitation on this transport method.  Fix the shapes and
rates \(B=1<C=c\), and let \(A=1-\varepsilon\).  As
\(\varepsilon\downarrow0\), the second-cut maximizer and maximum converge
to nondegenerate limits \(D_0,M_0>0\), while

\[
\mathcal H(D_\varepsilon)
\ge\left(\frac{D_\varepsilon}{\varepsilon}\right)^{\alpha+\gamma}
\longrightarrow\infty,
\qquad
\mathcal A(D_\varepsilon)\longrightarrow\infty.
\tag{5.232}
\]

For the second assertion, \(J_1(0)=O(\varepsilon^\gamma)\), whereas the
truncated second-cut mass has a positive lower bound.  Thus neither the
pointwise nor the averaged adjacent-cut certificate can yield a
shape-only theorem uniform over all rates.  This is a method-specific
no-go, not a failure of (5.164) or a GGC counterexample.  All statements in
this subsection are new project derivations.

<a id="wip-5-22"></a>
### WIP-5.22 — full lower-buffer and regularized upper-tail criteria

**Status: [PROVED ENDPOINT, MASS, AND EXPLICIT UPPER-TAIL CONES;
REFUTED A ONE-CURVATURE JENSEN SHORTCUT].**

The averaged comparison in WIP-5.21 uses the adjacent lower cut but still
discards the positive exterior and direct terms.  Retaining every positive
term below \(B\) yields a still more flexible endpoint criterion.  Put

\[
\begin{aligned}
D_1&=\int_A^B m_1(r)\,dr,&
D_2(x)&=\int_B^x m_2(r)\,dr,&
A_2(x)&=\int_B^x a(r)\,dr,\\
B_-&=\int_0^A(a+m_0)(r)\,dr+
     \int_A^B a(r)\,dr.
\end{aligned}
\tag{5.233}
\]

Let \(r_*=r_2^*\), \(M=G_2(r_*)\), and for a rising point
\(x\in(B,r_*)\) set

\[
\theta=G_2(x),qquad
c_\theta=\frac{\sin(\pi\beta)-s_1\theta}{s_2},qquad
c_M=\frac{\sin(\pi\beta)-s_1M}{s_2}.
\]

Assume first that \(c_M\ge0\).  Then every density contribution below
\(B\) is positive, while the initial second-cut lobe has density
\((\theta-G_2)m_2\).  Its unweighted balance against the full lower buffer
is

\[
F_{\mathrm{full}}(x)
=B_-+c_\theta D_1-[\theta D_2(x)-A_2(x)].
\]

The phase equation produces an exact cancellation of the moving endpoint:
because \(a(x)=G_2(x)m_2(x)=\theta m_2(x)\),

\[
\boxed{
F_{\mathrm{full}}'(x)
=-G_2'(x)\left(\frac{s_1}{s_2}D_1+D_2(x)\right)<0,
\qquad B<x<r_*.
}
\tag{5.234}
\]

It follows that the entire rising branch is controlled by one endpoint:

\[
\boxed{
c_M\ge0,qquad
B_-+c_MD_1\ge MD_2(r_*)-A_2(r_*)
\quad\Longrightarrow\quad
C_t(x)>0
}
\tag{5.235}
\]

for every \(t>0\) and every second-cut rising root \(x\) that occurs.
Indeed, all positive mass in this comparison lies strictly to the left of
all negative mass, so multiplication by \(e^{-tr^2}\) only strengthens a
nonnegative unweighted balance.  Even equality in (5.235) gives strict
positivity at each genuine rising point \(x<r_*\) by (5.234).  This is a
second-prefix theorem; a complete GGC conclusion still requires the first
prefix and interface.

The incomplete integrals can be removed.  From

\[
s_1D_1+s_2D_2(C)=\pi,qquad
MD_2(r_*)-A_2(r_*)<MD_2(C),
\]

one obtains

\[
\boxed{
c_M\ge0,qquad
M\pi\le s_2B_-+\sin(\pi\beta)D_1
\quad\Longrightarrow\quad\text{(5.235)}.
}
\tag{5.236}
\]

Replacing \(M\) by any explicit upper bound \(\widehat M\ge M\), such as
\(U_2\) from (5.150), makes (5.236) genuinely root-free.  In terms of
\(M\), the old second condition in (5.174) is

\[
M(\pi+s_1D_1)\le\sin(\pi\beta)D_1.
\tag{5.237}
\]

It implies both inequalities in (5.236).  The converse is false, as the
exact example below proves; hence the retained lower buffer gives a strict
enlargement of that older mass cone.

There is a complementary upper-tail form.  Define the endpoint center

\[
\Xi_M=d_2+\frac M{s_2},qquad c_M=s_1(d_1-\Xi_M).
\]

At \(t=0\), the original definition of \(N\) gives \(N(0)=0\), while
\(Q(0)=1\).  Thus the signed density centered at \(\Xi_M\) has total mass
\(-\pi\Xi_M\).  Its density is nonpositive after \(r_*\), and therefore

\[
\boxed{
F_{\mathrm{full}}(r_*)
=U(0)+\int_{r_*}^{C}(M-G_2(r))m_2(r)\,dr-\pi\Xi_M.
}
\tag{5.238}
\]

In particular, \(c_M\ge0\) together with either \(\Xi_M\le0\) or
\(U(0)\ge\pi\Xi_M\) implies (5.235).  Equality suffices because the
second-cut tail in (5.238) is strictly positive.

The regularized upper tail has a useful completely explicit lower bound.
For \(r>C\), put

\[
q_i(r)=\frac{r-b_i}{r+b_i},qquad
R(r)=\frac{a(r)}{m_3(r)}=\prod_iq_i(r)^{\beta_i},qquad
S(r)=\sum_i\frac{\beta_i b_i}{r+b_i}.
\]

Weighted AM--GM and \(\sum_i\beta_i=1\) give
\(R<\sum_i\beta_iq_i=1-2S\).  Since
\((ra(r))'=a(r)S(r)\) and \(ra(r)\to1\),

\[
\boxed{
U(0)=\int_C^\infty(m_3-a)(r)\,dr
>2\int_C^\infty a(r)S(r)\,dr
=2[1-Ca(C)].
}
\tag{5.239}
\]

Consequently

\[
\boxed{
c_M\ge0,qquad
\pi\Xi_M\le2[1-Ca(C)]
}
\tag{5.240}
\]

is a fully explicit regularized-upper-tail certificate.  Again,
\(\widehat M\ge M\) can eliminate the critical root.

These new cones separate strictly from (5.237) on the exact example of
WIP-5.19,

\[
(\alpha,\beta,\gamma)=\left(\frac14,\frac14,\frac12\right),
\qquad (A,B,C)=(1,2,4).
\]

There \(M<1/4\), \(s_2=1\), \(\Xi_M=M\), and \(c_M>0\).  Monotonicity of
\(a\) and \(m_0\) gives

\[
B_->\frac2{432^{1/4}}+\frac1{2\,2^{1/4}}
>\frac25+\frac5{12}=\frac{49}{60}
>\frac{11}{14}>\frac\pi4>M\pi.
\tag{5.241}
\]

Here \(\pi<22/7\) follows, for example, by integrating the positive
function \(x^4(1-x)^4/(1+x^2)\) over \((0,1)\); the integral equals
\(22/7-\pi\).  Thus (5.236) holds.  Independently,

\[
Ca(C)=\left(\frac2{15}\right)^{1/4}<\frac{17}{28},
\]

because \(15\cdot17^4=1252815>1229312=2\cdot28^4\); hence (5.240) also
holds.

The older condition (5.237) fails.  At \(r=5/2\),

\[
G_2(5/2)^4=\frac3{1183}>\left(\frac29\right)^4,
\]

so \(M>2/9\).  On the other hand,

\[
B_1(0)<\frac12\mathrm B\left(\frac34,\frac34\right)<\frac67.
\]

For the last inequality, symmetry reduces the beta integral to
\([0,1/2]\), and the secant bound for the convex function
\((1-x)^{-1/4}\) gives

\[
\mathrm B\left(\frac34,\frac34\right)
<\frac{16\,2^{1/4}+12\sqrt2}{21}<\frac{12}{7};
\]

the final comparison reduces by two squarings to \(9801>9800\).  Since
\(\pi>3\), it follows that
\(\pi M/(1-M)>6/7>B_1(0)\), precisely the strict negation of (5.237).
This is an independent certificate for the already established law
(5.199), not a new distributional example.

Finally, integration by parts identifies both a possible route and a
rigorous obstruction to its simplest implementation.  Let

\[
J_*:=\int_B^{r_*}(M-G_2(r))m_2(r)\,dr.
\]

If \(r_\uparrow\) is the rising inverse of \(G_2\), then

\[
\boxed{
J_*=\int_B^{r_*}D_2(r)G_2'(r)\,dr
=\int_0^M D_2(r_\uparrow(y))\,dy.
}
\tag{5.242}
\]

For \(H(y)=D_2(r_\uparrow(y))\) and
\(L(r)=(\log G_2)'(r)>0\), direct differentiation gives

\[
\operatorname{sgn}H''(y)=\operatorname{sgn}V(r),qquad
V(r)=2(\log m_2)'(r)-(\log a)'(r)-\frac{L'(r)}{L(r)}.
\tag{5.243}
\]

This profile has no fixed curvature.  For

\[
(\alpha,\beta,\gamma)=\left(\frac5{11},\frac5{11},\frac1{11}\right),
\qquad(A,B,C)=(1,2,5),qquad r=\frac73,
\]

exact rational substitution yields

\[
L(7/3)=\frac{17829}{12584}>0,qquad
V(7/3)=-\frac{1023657}{17806360}<0.
\]

Thus \(H''<0\) at a rising point.  Yet, if
\(\kappa=-G_2''(r_*)>0\), then as \(y\uparrow M\),

\[
H(y)=D_2(r_*)-m_2(r_*)
\sqrt{\frac{2(M-y)}\kappa}+O(M-y),
\]

so \(H''(y)>0\) near the peak.  This rules out a global convex-Jensen or
concave-chord proof of (5.242), but it is not a counterexample to (5.235),
(5.164), or the GGC conjecture.  At this stage it left open whether
\(c_M\ge0\) alone forces \(F_{\mathrm{full}}(r_*)\ge0\); WIP-5.25 below
resolves that question affirmatively.  Every assertion in this subsection
is a new project derivation.

The finite polynomial factorizations, large-integer comparisons, rational
bounds, and curvature values used in WIP-5.20--WIP-5.23 are reproduced by
[computations/route5_phase_capacity_transport_hierarchy.py](../computations/route5_phase_capacity_transport_hierarchy.py)
using only Python integers and `fractions.Fraction`.  The analytic
covariance, transport, endpoint, and support-order arguments are the proofs;
they are not inferred from the script.

<a id="wip-5-23"></a>
### WIP-5.23 — peak-gap-free lower-triangular phase capacity

**Status: [PROVED ARBITRARY FINITE-RATE SUFFICIENT THEOREM WITHOUT A
PEAK-GAP HYPOTHESIS; PROVED STRICTNESS AND ACTUAL SIMULTANEOUS
ACTIVITY].**

WIP-5.20 discarded the positive exterior mass \(P(t)\) when protecting an
internal rising prefix and imposed \(g_{j,*}\le\delta_j\) in order to leave
at most one active cut.  Neither loss is necessary.  Retain
\(T_j,H_j\) from (5.201), set \(H_1=0\), and define the full
lower-triangular capacity

\[
\boxed{
\mathfrak C_j(t)=\frac{P(t)+H_j(t)}{T_j(t)},\qquad
T_j=\sum_{i\le j}B_i,\qquad
H_j=\sum_{i<j}B_i(d_i-d_j).
}
\tag{5.244}
\]

These capacities possess a particularly simple recursion.  If

\[
\lambda_j(t)=\frac{T_j(t)}{T_{j+1}(t)},\qquad
\mu_{\le j}(t)=\frac{\sum_{i\le j}B_i(t)\mu_i(t)}{T_j(t)},
\]

then \(H_{j+1}=H_j+\delta_{j+1}T_j\), and hence

\[
\boxed{
\begin{aligned}
\mathfrak C_1&=\frac{P}{B_1},&
\mathfrak C_{j+1}
 &=\lambda_j\bigl(\mathfrak C_j+\delta_{j+1}\bigr),\\
\mathfrak C_1'
 &=\mathfrak C_1(\mu_1-\mu_P)>0,&
\lambda_j'
 &=\lambda_j(1-\lambda_j)(\mu_{j+1}-\mu_{\le j})>0.
\end{aligned}
}
\tag{5.245}
\]

Here \(\mu_P<b_1^2<\mu_1\), and the disjoint ordered supports give
\(\mu_{\le j}<\mu_{j+1}\).  Starting from \(\mathfrak C_1'>0\), the
recursion proves inductively that every \(\mathfrak C_j\) is strictly
increasing on \(t\ge0\).

The resulting finite-cut theorem is

\[
\boxed{
g_{j,*}\le\mathfrak C_j(0)\quad(1\le j\le m=n-1)
\quad\Longrightarrow\quad
C_t(x)\ge0\quad(t>0,\ x>0).
}
\tag{5.246}
\]

Consequently \(\Xi'(t)>0\), and

\[
\left(\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i}\right)^2\in GGC,
\qquad
\beta_i>0,\qquad \sum_i\beta_i=1.
\]

The point is that (5.246) permits any number of cuts to be active
simultaneously.  To prove it, suppose cut \(j\) is active, so
\(0<\eta_j<g_{j,*}\), and let \(r_j^-\) be its rising root.  If
\(\overline g_i\) is the \(B_i\)-normalized average from (5.156) and
\(N_{j,-}\) is the negative mass between \(b_j\) and \(r_j^-\), direct
integration gives

\[
C_t(r_j^-)
=P+\sum_{i<j}B_i
  \bigl(\overline g_i+d_i-d_j-\eta_j\bigr)-N_{j,-},
\qquad
0<N_{j,-}<\eta_jB_j.
\tag{5.247}
\]

Therefore, including also \(j=1\) with an empty sum,

\[
\boxed{
C_t(r_j^-)
>P+\sum_{i<j}B_i\overline g_i+H_j-\eta_jT_j
\ge T_j\bigl(\mathfrak C_j(t)-\eta_j\bigr)>0.
}
\tag{5.248}
\]

The last inequality follows from
\(\mathfrak C_j(t)>\mathfrak C_j(0)\ge g_{j,*}>\eta_j\); no information
about any other cut is used.  The middle comparison is strict for
\(j\ge2\), because the lower-cut averages are positive, and is an equality
for \(j=1\).

For completeness, these are all possible interior local minima of
\(C_t\).  On each cut the signed density is either positive everywhere,
has the pattern \(-,+,-\), or is negative everywhere, so its only
interior negative-to-positive crossing is the rising root of an active
cut.  An interface \(b_j\) cannot be a local minimum: negativity on its
left forces \(\eta_{j-1}>0\), whence
\(\eta_j=\eta_{j-1}+\delta_j>0\) and the right side is also negative;
positivity on its right forces \(\eta_j\le0\), whence
\(\eta_{j-1}<0\) and the left side is also positive.  The lower exterior
is positive, the upper exterior is negative, and
\(C_t(0)=C_t(\infty)=0\); moreover the upper-exterior tail gives
\(C_t(b_n)>0\).  Thus (5.248) controls every finite local minimum.
The tangent cases \(\eta_j=0\) and \(\eta_j=g_{j,*}\) follow from the
same sign classification, or by a limit.

The endpoint envelopes and static integral bounds in
(5.150), (5.212), and (5.213) give a completely parameter-level
corollary.  With \(u_j=U_j/s_j\),

\[
\boxed{
u_1\le\frac{\underline P}{\overline B_1},\qquad
u_j\le
\frac{\underline P+
      \sum_{i<j}\underline B_i(d_i-d_j)}{\pi},
\quad 2\le j\le m,
}
\tag{5.249}
\]

implies (5.246).  Indeed \(P(0)\ge\underline P\),
\(B_1(0)\le\overline B_1\),
\(B_i(0)\ge\underline B_i\), and \(T_j(0)\le\pi\).
Unlike (5.214), the numerator retains \(P\), and there is no
\(\min\{\delta_j,\cdot\}\).  Thus the exact test (5.246) strictly enlarges
the exact WIP-5.20 cone (5.203), while the root-free test (5.249) strictly
enlarges its root-free parameter version (5.214).

Here is an exact four-rate witness to that strict enlargement:

\[
\boxed{
\boldsymbol\beta=
\left(\frac14,\frac14,\frac1{100},\frac{49}{100}\right),\qquad
\boldsymbol b=
\left(1,\frac{11}{10},\frac65,\frac{13}{10}\right).
}
\tag{5.250}
\]

Put \(\theta=\pi/100\).  Then

\[
(s_1,s_2,s_3)=\left(\frac1{\sqrt2},1,\cos\theta\right),\qquad
(d_1,d_2,d_3)=(1,0,-\tan\theta),\qquad
\delta_3=\tan\theta,
\]

and the endpoint envelopes are exactly

\[
\begin{aligned}
U_1&=21^{-1/2}11^{-1/100}(3/23)^{49/100},\\
U_2&=11^{-1/4}23^{-13/50}12^{-49/100},\\
U_3&=\frac1{5\,92^{1/4}}.
\end{aligned}
\]

All three inequalities in (5.249) can be verified without decimals.
First, \((3/23)^{49/100}<1/2\), since
\((23/12)^{49}>(23/12)^3>4\).  Thus

\[
u_1<\frac1{\sqrt{42}},\qquad
\underline P>\frac{10}{13},\qquad
\overline B_1
=\frac1{\sqrt{20}}\mathrm B(3/4,3/4)
  10^{1/100}5^{49/100}<3,
\]

The substitution \(x=(1+t)/2\), followed by symmetry, gives the two
elementary bounds used here and below:

\[
\mathrm B(3/4,3/4)
=\sqrt2\int_0^1(1-t^2)^{-1/4}\,dt,
\qquad
\sqrt2\le\mathrm B(3/4,3/4)<\frac{4\sqrt2}{3}<2.
\]

The lower bound uses \((1-t^2)^{-1/4}\ge1\); the upper bound uses
\((1-t^2)^{-1/4}<(1-t)^{-1/4}\).  Also
\(10^{1/100}<2\) and \(5^{49/100}<3\).  Hence
\(\underline P/\overline B_1>10/39>1/\sqrt{42}\).
For the remaining cuts,

\[
\underline B_1
=\frac1{\sqrt{20}}\mathrm B(3/4,3/4)
  5^{1/100}(10/3)^{49/100}
>\frac3{2\sqrt{10}},
\qquad
\frac{\underline B_1}{\pi}>\frac18.
\tag{5.251}
\]

Indeed \(\mathrm B(3/4,3/4)\ge\sqrt2\),
\((10/3)^{49/100}>(10/3)^{2/5}>3/2\), the last comparison reducing to
\(3200>2187\), and
\(\pi\sqrt{10}<11<12\).  Also

\[
u_2=U_2<
\frac35\cdot\frac12\cdot\frac13=\frac1{10},
\qquad
u_3=\frac1{5\,92^{1/4}\cos\theta}<\frac1{10}.
\]

Here \(11^{-1/4}<3/5\), \(23^{-13/50}<1/2\), and
\(12^{-49/100}<1/3\); these reduce respectively to
\(625<891\), \(23^{13}>2^{50}\), and
\(12^{49}>3^{100}\).  Finally \(92^{1/4}>3\) and
\(\cos\theta\ge1-\theta^2/2>2/3\).  Since

\[
\frac{\underline P+\underline B_1(d_1-d_2)}{\pi}
>\frac{\underline B_1}{\pi}>\frac18>u_2,
\]

and

\[
\frac{\underline P+\underline B_1(d_1-d_3)
      +\underline B_2(d_2-d_3)}{\pi}
>\frac{\underline B_1}{\pi}>\frac18>u_3,
\]

(5.249) proves that the square in (5.250) is GGC.

The old peak-gap hypothesis fails strictly.  At \(r=5/4\in I_3\),

\[
G_3(5/4)
=9^{-1/4}(3/47)^{1/4}49^{-1/100}51^{-49/100}
>\frac{19}{490}>\frac{11}{350}>\sin\theta.
\tag{5.252}
\]

The four factor bounds are

\[
9^{-1/4}>\frac47,\qquad
(3/47)^{1/4}>\frac12,\qquad
49^{-1/100}>\frac{19}{20},\qquad
51^{-49/100}>\frac17.
\]

The first two reduce to \(2401>2304\) and \(48>47\).
For the third,

\[
\left(\frac{20}{19}\right)^{100}>
\sum_{k=0}^4\binom{100}{k}19^{-k}
=\frac{9596696}{130321}>49.
\]

For the fourth, \(51/49<25/24\) and

\[
\left(\frac{25}{24}\right)^{49}
<3^2\frac{25}{24}=\frac{75}{8}<49.
\]

The elementary binomial estimate
\(\binom{24}{k}/24^k\le1/k!\), together with
\(\sum_{k\ge2}1/k!<1\), proves \((25/24)^{24}<3\).
Also \(\sin\theta<\theta=\pi/100<11/350\).
Since \(g_3=G_3/\cos\theta\), (5.252) gives

\[
g_{3,*}>\tan\theta=\delta_3,
\]

which is the strict negation of the corresponding condition in
(5.203).

This example genuinely uses the new multiactive proof rather than merely
lying outside an old parameter display.  In the expectation notation
underlying (5.129),

\[
Q(u)=\int e^{-u^2x^2}\,\mu(dx),\qquad
N(u)=\int e^{-u^2x^2}\operatorname{erfi}(ux)\,\mu(dx).
\]

For \(u>0\), \(N(u)>0\), while \(Q(u)\to1\) and \(N(u)\to0\) as
\(u\downarrow0\).  Dominated convergence is legitimate because, for
\(z\ge0\),

\[
e^{-z^2}\operatorname{erfi}(z)
=\frac2{\sqrt\pi}\int_0^z e^{-(z-s)(z+s)}\,ds
\le\frac2{\sqrt\pi}\min\{z,1/z\}
\]

with the second entry used for \(z\ge1\).  Hence
\(\Xi(t)=N(\sqrt t)/Q(\sqrt t)\to0\) as \(t\downarrow0\).
Because \(d_2=0\), \(d_3=-\delta_3\),
\(g_{2,*}>0\), and (5.252) gives
\(g_{3,*}-\delta_3>0\), all sufficiently small \(t>0\) satisfy

\[
\boxed{
0<\Xi(t)<\min\{g_{2,*},g_{3,*}-\delta_3\},\qquad
\eta_2=\Xi\in(0,g_{2,*}),\quad
\eta_3=\Xi+\delta_3\in(0,g_{3,*}).
}
\tag{5.253}
\]

Thus cuts \(2\) and \(3\) are simultaneously active on the actual phase
trajectory.  WIP-5.20's one-active-cut classification cannot treat this
case, whereas (5.246) does.  Every assertion in this subsection is a new
project derivation.
