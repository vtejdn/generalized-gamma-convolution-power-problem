# Conditional identification of the logarithmic Thorin evolution

Entry: WIP-6.20. This module identifies an assumed positive weak
evolution with the actual deterministic power transformation of its
initial law. **It does not provide an existence theorem.** In particular,
the construction in [WIP-6.19](21-log-thorin-euler-evolution.md) is a
separate input, not a conclusion of the argument below.

[Master index](../WIP.md) |
[Logarithmic generator](20-finite-thorin-positive-steps.md) |
[Weak evolution](21-log-thorin-euler-evolution.md)

**Audit state:** the complete conditional proof below passed independent
full-chain review on 2026-09-05. No full-conjecture theorem is asserted
in this file; its assembly is recorded separately in WIP-6.21.
The estimates and identification are project deductions, without a
claim of literature priority.

## Interfaces used

- [WIP-6.11--6.13](19-finite-thorin-compensated-power-tangent.md)
  supply the gamma--Dirichlet representation, the actual power tangent
  of each current GGC law, and the absolutely convergent resolvent
  identity for its compensated rate-coordinate operator.
- [WIP-6.16--6.17](20-finite-thorin-positive-steps.md) supply the
  logarithmic generator, its linear drift bound and its universal finite
  second jump moment. Its averaged resolvent identity is (6.97).
- A positive weak solution with the hypotheses stated below is the
  interface supplied by WIP-6.19. The present proof remains conditional
  on this interface irrespective of the audit status of its construction.

The external GGC and gamma--Dirichlet inputs, including their primary
references, are exactly those already specified in WIP-6.11. Gamma
integrals, tail estimates, polynomial approximation and the transport
uniqueness argument needed for identification are proved here. No
general uniqueness theorem for nonlinear evolutions or transport
equations is invoked.

<a id="wip-6-20"></a>
## WIP-6.20 — every admissible weak evolution is the actual power flow

**Status: [CONDITIONAL IDENTIFICATION; EXISTENCE IS A SEPARATE INPUT].**

Fix a finite time interval \([0,T]\) and \(B_0>0\). Suppose
\(F_\tau\) is a narrowly continuous curve of probability measures
on logarithmic rates \(\mathbb R\), with

\[
\boxed{
B_\tau=B_0e^{-\tau},\qquad
U_\tau=B_\tau\exp_*F_\tau,\qquad
K_T:=\sup_{0\le\tau\le T}\int y^2F_\tau(dy)<\infty.
}
\tag{6.130}
\]

Here \(\exp_*F\) is a probability on positive rates, not on
positive random-variable values. Assume that for every
\(\varphi\in C_c^2(\mathbb R)\),

\[
\boxed{
F_\tau(\varphi)-F_0(\varphi)
=\int_0^\tau F_u(\mathcal G_{B_u,F_u}\varphi)\,du.
}
\tag{6.131}
\]

The generator is precisely (6.111), including its full linear
compensation in the jump variable. It is not an arbitrary operator
having the same positivity property. In particular its coefficients
satisfy, uniformly for \(0\le\tau\le T\),
\(0\le k_{B_\tau,F_\tau}\le1\),
\(|a_{B_\tau,F_\tau}(y)-y|\le C_T\), and
\(\int v^2\nu(dv)=m_2=2\pi^2/3\), as proved in WIP-6.17.

Let \(\nu_\tau\) be the zero-drift GGC law associated with
\(U_\tau\). Its existence, continuity and all integrability required
below follow from the stated hypotheses and the estimates in this
proof. If \(X_0\sim\nu_0\), then
\(\nu_\tau=\mathcal L(X_0^{e^\tau})\) for every
\(0\le\tau\le T\).

### 1. Thorin admissibility and control of its transform

For \(s>0\), put

\[
\begin{aligned}
\ell_s(y)&=\log(1+se^{-y}),&
\Psi_\tau(s)&=B_\tau F_\tau(\ell_s),\\
L_\tau(s)&=e^{-\Psi_\tau(s)},&
g_\tau(s)&=B_\tau\int\frac{F_\tau(dy)}{s+e^y}.
\end{aligned}
\tag{6.132}
\]

The elementary inequality
\(0\le\ell_s(y)\le\log(1+s)+y_-\), where
\(y_-:=\max\{-y,0\}\), proves that \(U_\tau\) satisfies
the Thorin condition (6.65). Thus it defines the stated GGC law, with
Laplace transform \(L_\tau\); differentiation at positive \(s\)
gives \(g_\tau=-\partial_s\log L_\tau\). No first moment of the
positive rate \(e^y\) is assumed or needed.

The moment bound gives both tightness and uniform integrability of
first log-rate moments:

\[
F_\tau(|y|>R)\le K_T/R^2,\qquad
\int_{|y|>R}|y|F_\tau(dy)\le K_T/R
\quad(R>0).
\tag{6.133}
\]

Consequently narrow continuity of \(F_\tau\), followed by truncation
using (6.133), makes \(\Psi_\tau(s)\) continuous in \(\tau\)
for each \(s>0\). This also proves continuity of \(L_\tau(s)\).
The transform is normalized at zero: \(\Psi_\tau(s)\downarrow0\)
as \(s\downarrow0\), by dominated convergence against
\(\ell_1\) for \(s\le1\).

### 2. A uniform logarithmic moment for the GGC laws

There is a finite constant depending only on \(B_0,T,K_T\) such that

\[
\boxed{
\sup_{0\le\tau\le T}\int_{(0,\infty)}|\log x|\,\nu_\tau(dx)
\le C_{\log,T}<\infty.
}
\tag{6.134}
\]

First consider the negative part. The gamma--Dirichlet representation
of WIP-6.11 gives \(X_\tau\overset d=G_{B_\tau}M_\tau\),
where \(M_\tau=\int e^{-y}Q_\tau(dy)\),
\(Q_\tau\sim DP(B_\tau F_\tau)\), and the gamma is independent.
The mean functional is finite almost surely by the Thorin logarithmic
condition, and is strictly positive. Also
\(\mathbb E\int|y|Q_\tau(dy)=F_\tau(|y|)<\infty\).
Jensen's inequality, applicable on this almost-sure integrability
event, yields
\(\log M_\tau\ge-\int yQ_\tau(dy)\). Explicitly, put
\(m=\int yQ_\tau(dy)\) and integrate
\(e^{-(y-m)}\ge1-(y-m)\); this gives \(e^mM_\tau\ge1\).
Therefore
\(\mathbb E(\log M_\tau)^-\le F_\tau(y_+)\le\sqrt{K_T}\).
For \(B\in[B_0e^{-T},B_0]\),
\[
\mathbb E(\log G_B)^-
\le\frac1{\Gamma(B)}\int_0^1(-\log x)x^{B-1}\,dx
=\frac1{\Gamma(B)B^2},
\]
which is uniformly bounded on this compact positive mass interval.
The inequality \((\log X_\tau)^-\le
(\log G_{B_\tau})^-+(\log M_\tau)^-\) controls the negative part.

For the positive part, the elementary identity
\(\log(1+x)=\int_0^\infty e^{-r}(1-e^{-rx})\,dr/r\)
follows by integrating \((1+x)^{-1}\) or by Tonelli. Since
\(1-e^{-z}\le z\) for \(z\ge0\), Tonelli and the Thorin
representation give

\[
\begin{aligned}
\mathbb E\log(1+X_\tau)
&=\int_0^\infty\frac{e^{-r}}r(1-L_\tau(r))\,dr
\le\int I(b)\,U_\tau(db),\\
I(b)&:=\int_0^\infty\frac{e^{-r}}r\log(1+r/b)\,dr
\le4\{1+(\log_+(1/b))^2\}.
\end{aligned}
\tag{6.135}
\]

Here is an explicit check of both ends in this bound. If \(b\ge1\),
use \(\log(1+r/b)\le r/b\) to get \(I(b)\le1/b\).
If \(0<b<1\), write \(a=\log(1/b)\). The part \(0<r<b\)
is at most one. On \(b<r<1\), use
\(\log(1+r/b)\le\log2+\log(r/b)\) to get
\(a\log2+a^2/2\). On \(r>1\), use
\(\log(1+r/b)\le\log(1+r)+a\),
\(\log(1+r)\le r\), and \(1/r\le1\); this part is at most
\(e^{-1}(1+a)\). Their sum is bounded by \(4(1+a^2)\).
It follows that the positive part is at most
\(4B_0(1+K_T)\), proving (6.134).

This estimate does **not** assert \(\mathbb E|X_\tau\log X_\tau|
<\infty\). That larger moment can be infinite and is never used
without positive exponential tilting.

The laws \(\nu_\tau\) are narrowly continuous. Indeed, (6.134)
makes them uniformly tight away from both zero and infinity: outside
\([e^{-R},e^R]\) their masses are at most \(C_{\log,T}/R\).
For a sequence of times tending to \(\tau\), every weak subsequential
limit therefore has total mass one on \((0,\infty)\), and its
Laplace transform is \(L_\tau\), by the already proved transform
continuity. These transforms determine the probability uniquely:
under \(u=e^{-x}\), their values at positive integers are all the
moments on \([0,1]\), and polynomial approximation determines a
measure there. The elementary polynomial approximation argument is
given explicitly in Section 7 below. Thus every subsequential limit
is \(\nu_\tau\). The required subsequence selection uses only
tightness on the real line and diagonal selection of distribution
functions, as in WIP-6.19.

### 3. Extending the weak equation beyond compact tests

Equation (6.131) extends to every \(\varphi\in C^2(\mathbb R)\)
such that \(|\varphi(y)|\le C(1+|y|)\) and
\(\varphi',\varphi''\) are bounded. In particular it applies to
both the bounded log-rate resolvent
\(\varphi_s(y)=(s+e^y)^{-1}\) and the logarithmic test
\(\ell_s(y)=\log(1+se^{-y})\).

To see this, take a smooth cutoff \(\chi\) equal to one on
\([-1,1]\) and zero outside \([-2,2]\), and put
\(\varphi_R(y)=\chi(y/R)\varphi(y)\), \(R\ge1\).
The first two derivatives of \(\varphi_R\) are bounded uniformly
in \(R\). The full-compensation Taylor estimate and the drift bound
give

\[
\begin{aligned}
|\mathcal G_{B_\tau,F_\tau}\varphi_R(y)|
&\le(|y|+C_T)|\varphi_R'(y)|
       +\frac{m_2}{2}\|\varphi_R''\|_\infty
\le C_{T,\varphi}(1+|y|),\\
\mathcal G_{B_\tau,F_\tau}\varphi_R(y)
&\longrightarrow\mathcal G_{B_\tau,F_\tau}\varphi(y).
\end{aligned}
\tag{6.136}
\]

For the pointwise convergence, the jump remainder is dominated on
the **entire** jump line by a constant times \(v^2\); hence neither
the small-jump singularity nor either exponential tail is omitted.
Dominated convergence first in \(F_\tau\) and then in time,
using the uniform first-moment bound from (6.130), proves the extended
weak equation. Its left side converges by the same linear-growth
bound. Truncation with (6.133) also proves continuity of
\(F_\tau(\varphi)\), so the extended equation is an ordinary
absolutely continuous scalar identity.

For fixed \(s>0\), \(\ell_s'\) and \(\ell_s''\) are bounded
by one and \(1/4\), respectively; the resolvent and its first two
log-rate derivatives are bounded as well. Thus these two named
tests genuinely lie in the extended domain. The logarithmic test
directly defines \(\Psi_\tau\) in (6.132); no arbitrary integration
constant has been inserted in its definition.

### 4. The exact resolvent evolution at the current law

For each time, use expectation \(\mathbb E_\tau\) under
\(\nu_\tau\), and use \(\mathbb E_{\tau,s}\) for its normalized
tilt by \(e^{-sX}\). Define

\[
\begin{aligned}
A_\tau(s)&=\mathbb E_{\tau,s}[X\log X],\\
h_\tau(s)&=
\left.\partial_r\left[-\partial_s
\log\mathbb E_\tau e^{-sX^r}\right]\right|_{r=1}
=\frac d{ds}\{sA_\tau(s)\}.
\end{aligned}
\tag{6.137}
\]

These are the power tangents of the **current** law, not an assumption
about its relation to the initial power. The equality is exactly the
tangent of WIP-6.11. It can also be checked by differentiating the
expectation: all needed functions are bounded after multiplication by
\(e^{-sX^r}\) on compact positive \(s,r\) intervals.

Apply the extended weak equation to \(\varphi_s\). The averaged
generator identity (6.97) and \(\dot B_\tau=-B_\tau\) give

\[
\begin{aligned}
F_\tau(\mathcal G_{B_\tau,F_\tau}\varphi_s)
&=\frac{h_\tau(s)+g_\tau(s)}{B_\tau},\\
\boxed{
g_\tau(s)-g_0(s)=\int_0^\tau h_u(s)\,du.
}
\end{aligned}
\tag{6.138}
\]

The subtraction of \(g_\tau\) comes from the shrinking mass
\(B_\tau\). Omitting it would identify the wrong evolution.

### 5. Absolute integrability down to zero Laplace argument

We now justify integration of (6.138) from zero rather than presuming
a normalization constant vanishes. Ordinary differentiation of a
normalized exponential tilt gives

\[
\boxed{
h_\tau(s)=A_\tau(s)
-s\mathbb E_{\tau,s}[X^2\log X]
+s\mathbb E_{\tau,s}[X]A_\tau(s).
}
\tag{6.139}
\]

Fix \(s_0>0\). The bound on \(\ell_{s_0}\) gives the strictly
positive uniform lower bound
\[
D:=\exp\{-B_0[\log(1+s_0)+\sqrt{K_T}]\}
\le L_\tau(s_0)\le L_\tau(s)
\quad(0<s\le s_0).
\]
For each fixed value \(x>0\),
\[
\int_0^{s_0}xe^{-sx}\,ds\le1,\qquad
\int_0^{s_0}sx^2e^{-sx}\,ds\le1,\qquad
sx e^{-sx}\le1/e.
\]
Taking absolute values before using Tonelli therefore yields

\[
\begin{aligned}
\int_0^{s_0}|A_\tau(s)|\,ds
&\le D^{-1}\mathbb E_\tau|\log X|,\\
\int_0^{s_0}s\mathbb E_{\tau,s}[X^2|\log X|]\,ds
&\le D^{-1}\mathbb E_\tau|\log X|,\\
s\mathbb E_{\tau,s}X&\le(eD)^{-1},\\
\boxed{
\int_0^T\!\int_0^{s_0}|h_\tau(s)|\,ds\,d\tau
\le T\left(\frac2D+\frac1{eD^2}\right)C_{\log,T}<\infty.
}
\end{aligned}
\tag{6.140}
\]

This explicitly treats the covariance term, including its product of
tilted expectations. No independence between those factors is used.

For each time, the zero-endpoint term vanishes:

\[
\boxed{
\lim_{s\downarrow0}sA_\tau(s)=0,
\qquad
|sA_\tau(s)|\le\frac{\mathbb E_\tau|\log X|}{eD}
\quad(0<s\le s_0).
}
\tag{6.141}
\]

Indeed \(sx e^{-sx}\log x\to0\) for every \(x>0\), and its
absolute value is bounded by \(|\log x|/e\). Apply dominated
convergence under \(\nu_\tau\), then use \(L_\tau(s)\ge D\).
Equation (6.134) makes the bound in (6.141) also integrable in time.
Thus a further time integral commutes with this limit. A uniform-in-time
limit is not being assumed merely from a bounded logarithmic moment.

The fundamental theorem of calculus in (6.137), first on
\([\epsilon,s]\) and then with \(\epsilon\downarrow0\), now
gives \(\int_0^s h_\tau(r)\,dr=sA_\tau(s)\). The absolute
bound (6.140) justifies the associated space-time Fubini exchange.

### 6. The Laplace weak equation, with its normalization fixed

Positivity and the Thorin representation give, by Tonelli,
\(\int_0^s g_\tau(r)\,dr=\Psi_\tau(s)\). Integrating
(6.138) and using (6.140)--(6.141) proves

\[
\boxed{
\Psi_\tau(s)-\Psi_0(s)
=\int_0^\tau sA_u(s)\,du,\qquad s>0.
}
\tag{6.142}
\]

This is also the scalar weak equation for the logarithmic test
\(\ell_s\), whose admissibility was independently checked in
Section 3. There is no unidentified constant at \(s=0\): the
specific exponent in (6.132) is zero there, and (6.141) has removed
the only possible boundary term in its tangent calculation.

Apply the absolutely continuous chain rule to
\(L_\tau(s)=e^{-\Psi_\tau(s)}\). Since
\(L_\tau(s)A_\tau(s)=\mathbb E_\tau[X\log X e^{-sX}]\),

\[
\boxed{
L_\tau(s)-L_0(s)
=-\int_0^\tau s\int_{(0,\infty)}
x\log x\,e^{-sx}\,\nu_u(dx)\,du.
}
\tag{6.143}
\]

For fixed \(s>0\), \(x\log x\,e^{-sx}\) is bounded and
continuous on \((0,\infty)\), tending to zero at zero and
infinity. Thus (6.143) is a genuine weak evolution equation. Its
right side has no unknown tilt normalization. In view of narrow
continuity of \(\nu_u\), it also has a continuous time integrand.

### 7. From exponentials to compactly supported differentiable tests

Let \(H\in C_c^1((0,\infty))\), and put
\(J(u)=H(-\log u)\) for \(0<u<1\). Extend \(J\) by zero
near both endpoints of \([0,1]\). This is a \(C^1\) function
there because \(H\) vanishes near zero and infinity.

There are polynomials \(p_n\) such that

\[
\boxed{
\|p_n-J\|_{\infty,[0,1]}
+\|p_n'-J'\|_{\infty,[0,1]}\longrightarrow0.
}
\tag{6.144}
\]

For a self-contained construction, approximate the continuous
function \(J'\) by its Bernstein polynomials
\(q_n(u)=\sum_{j=0}^nJ'(j/n){n\choose j}u^j(1-u)^{n-j}\).
If \(K\) is binomial with parameters \((n,u)\), the error is
\(|\mathbb E[J'(K/n)-J'(u)]|\). On
\(|K/n-u|\le\delta\) it is bounded by the modulus of continuity
of \(J'\). On the complement it is at most
\(2\|J'\|_\infty\mathbb P(|K/n-u|>\delta)\), and the
variance bound gives this probability at most \(1/(4n\delta^2)\).
First choose small \(\delta\), then large \(n\), to obtain
uniform convergence. Define
\(p_n(u)=J(0)+\int_0^u q_n(v)\,dv\). This proves (6.144).
The same Bernstein argument without derivatives proves the uniform
polynomial approximation used for moment uniqueness in Section 2.

Set \(H_n(x)=p_n(e^{-x})\) and
\(\mathscr B H(x)=x\log x\,H'(x)\). Then

\[
\begin{aligned}
\|H_n-H\|_\infty&\le\|p_n-J\|_\infty,\\
\|\mathscr B H_n-\mathscr B H\|_\infty
&\le\left(\sup_{x>0}|x\log x|e^{-x}\right)
       \|p_n'-J'\|_\infty\longrightarrow0.
\end{aligned}
\tag{6.145}
\]

The supremum is finite: the expression tends to zero at both ends
and is continuous between them. Each \(H_n\) is a finite linear
combination of a constant and the functions \(e^{-jx}\),
\(j=1,2,\ldots\). Equation (6.143) supplies its weak equation;
the constant has zero derivative because each \(\nu_u\) is a
probability. The two uniform bounds in (6.145) permit passage through
both the probability integrals and the finite time integral. Hence

\[
\boxed{
\nu_\tau(H)-\nu_0(H)
=\int_0^\tau\nu_u(x\log x\,H'(x))\,du,
\qquad H\in C_c^1((0,\infty)).
}
\tag{6.146}
\]

This step controls the derivative in the generator norm, not merely
the function in a transform-determining class. Static uniqueness of
Laplace transforms alone would not justify (6.146).

### 8. Explicit transport uniqueness in logarithmic value coordinates

All \(\nu_\tau\) are concentrated on \((0,\infty)\), by their
gamma--Dirichlet representation. Write
\(\lambda_\tau=(\log)_*\nu_\tau\); this is a probability on
logarithmic **values**, distinct from the log-rate law \(F_\tau\).
Equation (6.134) gives a uniform first moment for \(\lambda_\tau\).
It is narrowly continuous: (6.146), or the already proved continuity
of \(\nu_\tau\), gives continuity on compactly supported tests,
and the uniform first-moment tail bound extends this to bounded
continuous tests.

For \(\zeta\in C_c^1(\mathbb R)\), substitute
\(H(x)=\zeta(\log x)\) in (6.146). Its support is a compact
subset of \((0,\infty)\), and
\(x\log x\,H'(x)=\log x\,\zeta'(\log x)\). Thus

\[
\boxed{
\lambda_\tau(\zeta)-\lambda_0(\zeta)
=\int_0^\tau\lambda_u(z\zeta'(z))\,du.
}
\tag{6.147}
\]

This is a linear transport equation with velocity \(z\). Its
uniqueness can be proved directly. Fix a terminal time \(t\le T\)
and \(\zeta\in C_c^\infty(\mathbb R)\), and define

\[
\zeta_u(z)=\zeta(e^{t-u}z),\quad0\le u\le t,
\qquad
\partial_u\zeta_u(z)+z\partial_z\zeta_u(z)=0.
\tag{6.148}
\]

The supports of these tests lie in a single compact interval. Their
time derivatives and first spatial derivatives are jointly continuous
with the same compact-support control. Therefore (6.147) applies to
this time-dependent test: partition the time interval, use (6.147)
with the frozen test on each subinterval, and telescope. The changes
of the test itself converge to the integral of
\(\lambda_u(\partial_u\zeta_u)\). The generator terms converge
to the integral of \(\lambda_u(z\partial_z\zeta_u)\).
Both passages are ordinary Riemann-sum limits, justified by narrow
continuity of \(\lambda_u\) and uniform continuity on the common
compact set. Hence
\(\lambda_t(\zeta)-\lambda_0(\zeta(e^t\,\cdot))=0\).

Compactly supported smooth tests determine measures on the real line
(one may approximate interval indicators from inside and outside by
smooth cutoff functions). This proves

\[
\boxed{
\lambda_\tau=(z\mapsto e^\tau z)_*\lambda_0,
\qquad
\nu_\tau=(x\mapsto x^{e^\tau})_*\nu_0
=\mathcal L(X_0^{e^\tau}),
\quad0\le\tau\le T.
}
\tag{6.149}
\]

No boundary mass is being discarded in this transport argument: both
sides are probabilities, and \(\nu_\tau\) has no atom at zero.
The uniform logarithmic-moment estimate also prevents mass loss at
either end when passing to logarithmic coordinates. This completes
the conditional identification. \(\square\)

## What has and has not been identified

The proof starts from a positive probability-valued solution of the
specific logarithmic Thorin weak equation, with its finite-time second
log-rate moment bound. Under those hypotheses it identifies the
associated GGC laws with the actual power flow on the whole stated
time interval. It does not merely match their first derivative at
time zero.

The existence of such a solution, consistency of a positive
approximation, and passage through the nonlinear generator are the
separate obligations of WIP-6.18--6.19. Neither the positive minimum
property nor a formal resolvent differential equation replaces those
obligations. Conversely, once that exact weak-solution interface is
available, no additional conjectural transport uniqueness or missing
Laplace normalization is needed for the identification proved here.
