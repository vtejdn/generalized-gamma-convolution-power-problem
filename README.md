# \(\alpha\)-Cauchy self-decomposability research dossier

Literature cutoff: **2026-08-27**.  The attached ECP page proof has also been checked against Min Wang's current arXiv version (v3, 2026-04-15).

## New result obtained in this dossier

The published-literature status found in the search is still “open,” but the calculation in `notes/07-Jensen-obstruction-and-non-SD.md` gives a new analytic argument that

\[
C_\alpha\notin SD\quad(1<\alpha<2),
\qquad
C_2\in SD.
\]

Equivalently, within \(1<\alpha\le2\), the proposed conclusion is \(C_\alpha\in SD\iff\alpha=2\).  This is explicitly recorded as a new, not-yet-peer-reviewed deduction rather than attributed to Wang or Yano--Yano--Yor.

## Main status

Put \(\gamma=1/\alpha\in(1/2,1)\).  For \(1<\alpha<2\), the reliable current record is:

| Random variable | ID | SD | GGC / HCM |
|---|---:|---:|---:|
| \(C_\alpha\) | yes (Wang, 2026) | literature: open; **new dossier proof: no** | not applicable as a positive-law class |
| \(|C_\alpha|\) | yes (Bondesson, 1987) | **open** | **not GGC; not HCM** |
| \(|C_\alpha|^{-p},\ p\geq\alpha\) | yes | yes | HCM and GGC |
| \(|C_\alpha|^{-p},\ 0<p<\alpha\) | **open on the reliable current record** | **open** | **not GGC; not HCM** |

The endpoint \(\alpha=2\) is exceptional: \(C_2\) is stable and SD, and \(|C_2|\) is SD (Diédhiou, 1998), although the half-Cauchy law is not GGC.

The structural reduction is

\[
|C_\alpha|=(B'_{\gamma,1-\gamma})^\gamma,
\qquad
|C_\alpha|^{-p}=(B'_{1-\gamma,\gamma})^{p/\alpha},
\]

where \(B'_{a,b}=\Gamma_a/\Gamma_b\) is beta-prime.  Thus the unresolved part is a **subunit power of a beta-prime law**, outside both HCM and GGC.

## Repository structure

### Manuscript

- [Tex/alpha-cauchy-non-self-decomposability.tex](Tex/alpha-cauchy-non-self-decomposability.tex): paper-style proof draft.
- [Tex/references.bib](Tex/references.bib): BibTeX database used by the manuscript.

The `Tex/` directory may also contain local compilation products. The repository
`.gitignore` keeps `.tex` and `.bib` sources while ignoring generated PDF,
SyncTeX, latexmk, BibTeX, index, glossary, and auxiliary files.

### Primary literature

The [literature/](literature/) directory contains the literature audit and local source PDFs:

- [literature-audit-and-source-notes.md](literature/literature-audit-and-source-notes.md): literature map, version audit, source verification, and search record.

- Min Wang, *Infinite divisibility of alpha-Cauchy distributions*
  (`ECP2604-002R1A0.pdf`).
- Yano--Yano--Yor, *On the laws of first hitting times of points for
  one-dimensional symmetric stable Levy processes*.
- Jurek--Vervaat, *An integral representation for selfdecomposable Banach-space
  valued random variables*.

These PDFs are research sources, not TeX build products, and are therefore not
covered by the TeX-output ignore rules.

### Research notes

- [notes/01-status-and-version-audit.md](notes/01-status-and-version-audit.md): precise current status and Wang v1/v2/v3 audit.
- [notes/02-classes-and-power-closure.md](notes/02-classes-and-power-closure.md): HCM/GGC/SD/ID implications and power closure.
- [notes/03-beta-prime-reduction.md](notes/03-beta-prime-reduction.md): exact beta-prime/GB2 reduction and new GGC classification.
- [notes/04-proof-program.md](notes/04-proof-program.md): prioritized analytic proof routes.
- [notes/05-lemmas-and-conjectures.md](notes/05-lemmas-and-conjectures.md): known results, new deductions, and conjectures kept separate.
- [notes/06-C-alpha-SD-reduction.md](notes/06-C-alpha-SD-reduction.md): exact background-driving/positive-definiteness reduction for the symmetric problem.
- [notes/07-Jensen-obstruction-and-non-SD.md](notes/07-Jensen-obstruction-and-non-SD.md): new Jensen/Fourier proof that the symmetric law is not SD for \(1<\alpha<2\), beginning with \(\alpha=3/2\).

No numerical experiment is used as evidence in these notes.
