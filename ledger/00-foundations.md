# Foundations and universal reductions

Finite-gamma reduction, Dirichlet representations, and the universal exponent semigroup.

Entries: WIP-0.1, WIP-0.2, WIP-0.3.

[Ledger map](README.md) | [Master index](../WIP.md) | [Source map](references.md)

Original WIP identifiers and equation numbers are preserved. Positional words such as "above" and "below" refer to the original numbered proof sequence.


## Stage 0: common infrastructure

<a id="wip-0-1"></a>
### WIP-0.1 — finite-gamma reduction

**Status: [PROVED], using established GGC weak density and weak closure.**

Fix \(q\ge1\). Assume that \(S^q\in GGC\) for every finite gamma convolution
\(S\). For any \(X\in GGC\), choose finite gamma convolutions \(S_n\) with

\[
S_n\Rightarrow X.
\]

The continuous mapping theorem gives

\[
S_n^q\Rightarrow X^q.
\]

Each \(S_n^q\) is GGC by the hypothesis, and GGC is weakly closed. Hence
\(X^q\in GGC\).

The approximation must include any deterministic drift. A positive constant
is itself a weak limit of gamma variables concentrated at their means, so
this does not enlarge the target class.

<a id="wip-0-2"></a>
### WIP-0.2 — the two Dirichlet representations

**Status: [PROVED].**

Let

\[
X=\sum_{i=1}^n\frac{G_{\beta_i}^{(i)}}{b_i},
\qquad
B=\sum_{i=1}^n\beta_i,
\tag{0.1}
\]

where the gamma variables have unit rate.

Put

\[
T=\sum_iG_{\beta_i}^{(i)},\qquad
P_i=\frac{G_{\beta_i}^{(i)}}{T}.
\]

The change of variables from the gamma coordinates to
\((T,P_1,\ldots,P_{n-1})\) has Jacobian \(T^{n-1}\). Its joint density
factors into a \(\Gamma(B,1)\) density and a
\(\operatorname{Dir}(\beta_1,\ldots,\beta_n)\) density. Consequently,

\[
X\overset d=G_BM,\qquad
M=\sum_{i=1}^n\frac{P_i}{b_i},\qquad G_B\perp M.
\tag{0.2}
\]

A separate simplex substitution \(x_i=xq_i\) in the convolution density has
Jacobian \(x^{n-1}\) and gives

\[
f_X(x)=
\frac{\prod_i b_i^{\beta_i}}{\Gamma(B)}
x^{B-1}\mathbb E[e^{-Rx}],
\qquad
R=\sum_i b_iQ_i,
\tag{0.3}
\]

where \(Q\sim\operatorname{Dir}(\beta_1,\ldots,\beta_n)\).

Although \(P\) and \(Q\) have the same Dirichlet law, (0.2) and (0.3) are
different distributional representations and will not be identified as one
coupling.

<a id="wip-0-3"></a>
### WIP-0.3 — the universal exponent semigroup

**Status: [PROVED].**

Define

\[
\mathcal Q=
\left\{
q\ge1:\ X\in GGC\Longrightarrow X^q\in GGC
\text{ for every }X
\right\}.
\tag{0.4}
\]

If \(p,q\in\mathcal Q\), then

\[
X\in GGC
\Longrightarrow X^p\in GGC
\Longrightarrow (X^p)^q=X^{pq}\in GGC,
\]

so \(pq\in\mathcal Q\).

If \(q_j\in\mathcal Q\) and \(q_j\to q\ge1\), then for fixed \(X\in GGC\),

\[
X^{q_j}\longrightarrow X^q
\quad\text{almost surely}.
\]

Weak closure of GGC gives \(q\in\mathcal Q\). Thus \(\mathcal Q\) is
multiplicatively and sequentially closed.

It follows that either of the following would prove (C1).

1. Prove \((1,2]\subset\mathcal Q\). For arbitrary \(Q>1\), choose \(m\)
   such that \(r=Q^{1/m}\in(1,2]\), and iterate \(m\) times.
2. Prove that some universal sequence \(r_j\downarrow1\) is contained in
   \(\mathcal Q\). For fixed \(Q>1\), take
   \[
   m_j=\left\lfloor\frac{\log Q}{\log r_j}\right\rfloor.
   \]
   Then \(r_j^{m_j}\in\mathcal Q\) and \(r_j^{m_j}\to Q\).

This justifies concentrating several routes on \(1<q\le2\) or on a sequence
approaching \(1\).
