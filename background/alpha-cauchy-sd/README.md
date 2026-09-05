# Background case study: alpha-Cauchy self-decomposability

Status: **symmetric-law problem solved in this repository**. Last checked:
**2026-09-04**.

This directory preserves the completed \(\alpha\)-Cauchy investigation as
historical background and as the source of the beta-prime motivation for the
active [GGC power project](../../README.md). It is not a parallel active
research track. Statements proved here but not externally published retain
their **[DERIVED]** status.

## Problem and conclusion

For \(\alpha>1\), let \(C_\alpha\) have density

\[
f_\alpha(x)=
\frac{\alpha\sin(\pi/\alpha)}{2\pi}
\frac{1}{1+|x|^\alpha},\qquad x\in\mathbb R.
\]

The final classification is

\[
\boxed{C_\alpha\in SD\iff\alpha=2,\qquad \alpha>1.}
\]

Its three parameter regimes have different sources.

- **[DERIVED]** If \(1<\alpha<2\), the Jensen--Fourier argument developed in
  this repository proves \(C_\alpha\notin SD\).
- **[LITERATURE]** At \(\alpha=2\), \(C_2\) is the standard Cauchy law, hence
  strictly \(1\)-stable and self-decomposable.
- **[LITERATURE + DERIVED]** If \(\alpha>2\), Wang's non-ID theorem and
  \(SD\subset ID\) give \(C_\alpha\notin SD\).

The first item is a completed repository proof, not a result attributed to
Wang or Yano--Yano--Yor and not yet represented here as a peer-reviewed
publication.

## Literature inputs versus the new result

| Statement | Provenance and status |
|---|---|
| The ID/SD questions for \(C_\alpha\), \(\lvert C_\alpha\rvert\), and related inverse powers | **[LITERATURE]** Yano--Yano--Yor (2009), Remark 2.9 |
| Fourier duality used in the proof | **[LITERATURE]** Yano--Yano--Yor (2009), Proposition 2.11 |
| \(C_\alpha\in ID\iff1<\alpha\le2\) | **[LITERATURE]** Wang (2026), Theorem 1.1 |
| Positive Laplace-mixture formula for \(\varphi_\alpha\) | **[LITERATURE]** Wang, Lemma 2.7, tracing back to Yano--Yano--Yor |
| Background-driving criterion for SD laws | **[LITERATURE]** Wolfe; Jurek--Vervaat; Sato (1999), Theorem 17.5 |
| \(C_\alpha\notin SD\) for \(1<\alpha<2\) | **[DERIVED]** current repository manuscript |
| Nonzero first-hitting-time consequence below | **[DERIVED]** from the new theorem and the published subordination result |

## Proof architecture for \(1<\alpha<2\)

Let \(\varphi_\alpha(t)=\mathbb E e^{itC_\alpha}>0\) and
\(\Psi_\alpha=-\log\varphi_\alpha\). If \(C_\alpha\) were SD, its
background-driving exponent

\[
q_\alpha(t)=t\Psi_\alpha'(t)
=-t\frac{\varphi_\alpha'(t)}{\varphi_\alpha(t)}
\]

would be continuous negative definite. The large-frequency asymptotic gives
\(q_\alpha(t)\to p:=\alpha+1\), so bounded negative definiteness would force a
compound-Poisson representation of intensity \(p\). The proof first obtains
finiteness of the Lévy measure by the Cesàro--Fatou argument and only then
identifies its mass by dominated convergence. Consequently

\[
J_\alpha(t)=1-\frac{q_\alpha(t)}p
\]

would have to be the characteristic function of one jump.

The positive Laplace representation, after gamma scaling, gives

\[
F_\alpha(t)=
\frac{t^p\varphi_\alpha(t)}{A_\alpha}
=\mathbb E\!\left[H_\alpha(Z/t)\right],
\quad
Z\sim\Gamma_p,
\]

where

\[
H_\alpha(y)=
\frac{1}{1+2\cos(\pi\alpha/2)y^\alpha+y^{2\alpha}}.
\]

One has

\[
J_\alpha(t)=\frac{t}{p}(\log F_\alpha(t))',
\qquad
\int_0^\infty J_\alpha(t)\,dt
=-\frac1p\int_0^\infty\log F_\alpha(t)\,dt.
\]

Strict Jensen, with strictness supplied by nondegeneracy of \(Z\) and
nonconstancy of \(H_\alpha\), yields

\[
\log\mathbb E[H_\alpha(Z/t)]
>\mathbb E[\log H_\alpha(Z/t)].
\]

Absolute Fubini is justified, and the complex beta integral gives the exact
cancellation

\[
\int_0^\infty\frac{\log H_\alpha(y)}{y^2}\,dy=0.
\]

Hence

\[
\int_0^\infty J_\alpha(t)\,dt<0.
\]

But \(J_\alpha\in L^1(\mathbb R)\). If it were a characteristic function,
Fourier inversion would give a continuous nonnegative density \(r\) with

\[
r(0)=\frac{1}{2\pi}\int_{\mathbb R}J_\alpha(t)\,dt
=\frac1\pi\int_0^\infty J_\alpha(t)\,dt<0,
\]

a contradiction. The initial \(\alpha=3/2\) computation is a specialization
of this same argument. No numerical sign computation is used.

The necessary technical checks are part of the proof: positivity of
\(\varphi_\alpha\), both endpoint asymptotics, \(J_\alpha\in L^1\), vanishing
boundary terms, strictness of Jensen, absolute Fubini, and a consistent
principal branch for the complex logarithm.

## First-hitting-time corollary

Let \(X_\alpha\) and \(\widehat X_\alpha\) be independent symmetric strictly
\(\alpha\)-stable processes in the Yano--Yano--Yor setting. For
\(1<\alpha<2\) and \(a\ne0\), their equation (5.12) gives

\[
\widehat X_\alpha\!\left(T_{\{a\}}(X_\alpha)\right)
\overset d=|a|C_\alpha.
\]

Rocha-Arteaga--Sato (2019), Theorem 5.1, says that an SD subordinator clock
preserves SD under this strictly stable subordination. Applying its
contrapositive to the new theorem gives

\[
T_{\{a\}}(X_\alpha)\notin SD,
\qquad 1<\alpha<2,\quad a\ne0.
\]

This is a one-way implication plus its contrapositive, not an unproved
converse.

## Positive associated laws remain separate

Put \(\gamma=1/\alpha\in(1/2,1)\). The exact beta-prime identities are

\[
\lvert C_\alpha\rvert=(B'_{\gamma,1-\gamma})^\gamma,
\qquad
\lvert C_\alpha\rvert^{-p}=(B'_{1-\gamma,\gamma})^{p/\alpha}.
\]

For \(1<\alpha<2\), the reliable status retained from the original dossier is:

| Random variable | ID | SD | GGC / HCM density |
|---|---:|---:|---:|
| \(\lvert C_\alpha\rvert\) | yes | open | not GGC; not HCM |
| \(\lvert C_\alpha\rvert^{-p}\), \(p\ge\alpha\) | yes | yes | HCM and GGC |
| \(\lvert C_\alpha\rvert^{-p}\), \(0<p<\alpha\) | open on the audited record | open | not GGC; not HCM |

Here the non-GGC assertions are separate project deductions; they do not
prove non-SD. The symmetric conclusion for \(C_\alpha\) does not settle any
open entry in this table. These subunit beta-prime powers also do not
constitute Bondesson's \(q\ge1\) GGC power conjecture; see the current
[GGC status record](../../ResearchStatus.md).

At \(\alpha=2\), \(|C_2|\) is SD by Diédhiou's separate theorem. This does not
follow merely by taking the absolute value of the SD law \(C_2\).

## Proof and audit files

### Manuscripts

- [manuscripts/jensen-fourier/alpha-cauchy-non-self-decomposability.tex](manuscripts/jensen-fourier/alpha-cauchy-non-self-decomposability.tex): self-contained paper-style Jensen/Fourier proof.
- [manuscripts/jensen-fourier/references.bib](manuscripts/jensen-fourier/references.bib): its bibliography.
- [manuscripts/wang-oriented/SD.tex](manuscripts/wang-oriented/SD.tex): Wang-oriented working manuscript.
- [manuscripts/wang-oriented/ID.bib](manuscripts/wang-oriented/ID.bib): its bibliography.

### Research notes and formalization

- [notes/01-status-and-version-audit.md](notes/01-status-and-version-audit.md): source/version audit and the pre-proof status record.
- [notes/03-beta-prime-reduction.md](notes/03-beta-prime-reduction.md): beta-prime fractional-power reduction and its relation to GGC closure.
- [notes/04-proof-program.md](notes/04-proof-program.md): retained route audit.
- [notes/05-lemmas-and-conjectures.md](notes/05-lemmas-and-conjectures.md): theorem and conjecture ledger.
- [notes/06-C-alpha-SD-reduction.md](notes/06-C-alpha-SD-reduction.md): background-driving and positive-definiteness reduction.
- [notes/07-Jensen-obstruction-and-non-SD.md](notes/07-Jensen-obstruction-and-non-SD.md): the decisive analytic argument.
- [notes/09-rocha-arteaga-sato-2019-id-sd-levy-processes.md](notes/09-rocha-arteaga-sato-2019-id-sd-levy-processes.md): ID/SD and Lévy-process infrastructure.
- [formalization/README.md](formalization/README.md): Lean API audit and formalization blueprint.
- [literature/README.md](literature/README.md): background literature map and version audit.

### Primary sources

- [Wang, *Infinite divisibility of alpha-Cauchy distributions*](literature/ECP2604-002R1A0.pdf).
- [Yano--Yano--Yor, *On the laws of first hitting times of points for one-dimensional symmetric stable Levy processes*](<literature/On the laws of first hitting times of points for one-dimensional symmetric stable Levy processes.pdf>).
- [Jurek--Vervaat, *An integral representation for selfdecomposable Banach-space valued random variables*](<literature/An integral representation for selfdecomposable banach space valued random variables.pdf>).
- [Rocha-Arteaga--Sato monograph](literature/ArteagaSato2019.pdf).
