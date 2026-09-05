# Current mathematical status

Throughout this note \(1<\alpha<2\) unless an endpoint is stated, and
\(\gamma=1/\alpha\in(1/2,1)\).

## 1. \(C_\alpha\)

**Known literature.** Wang's current theorem is

\[
C_\alpha\in ID\iff1<\alpha\le2.
\]

Thus the ID part of Yano–Yano–Yor Remark 2.9(i) is closed.  The SD part is not addressed.  For \(\alpha=2\), \(C_2\) is the standard Cauchy stable law and hence SD.  For \(1<\alpha<2\), no SD proof or disproof was located; the question remains open on the current record.  For \(\alpha>2\), Wang's non-ID theorem automatically rules out SD.

**New result in this dossier.**  The Jensen/Fourier argument in `07-Jensen-obstruction-and-non-SD.md` gives

\[
C_\alpha\notin SD\quad(1<\alpha<2).
\]

Its key step proves that the integrable candidate compound-Poisson jump characteristic function has a negative inverse Fourier transform at zero.  Thus the proposed complete classification on \(1<\alpha\le2\) is

\[
C_\alpha\in SD\iff\alpha=2.
\]

This is a new analytic deduction and is not presented here as an already published result; it should receive independent expert checking before external use.

**Logical caution.** The fact that the \(\alpha\)-Linnik law is SD and Fourier-dual to the \(\alpha\)-Cauchy density does not transfer SD across Fourier density/characteristic-function duality.

## 2. \(|C_\alpha|\)

**Known literature.** Bondesson's result gives \(|C_\alpha|\in ID\) for \(1<\alpha\le2\).  Diédhiou gives \(|C_2|\in SD\).  For \(1<\alpha<2\), SD remains open.

**New deduction from standard GGC structure.** For every \(\alpha>1\), \(|C_\alpha|\notin GGC\), hence it is not HCM.  The proof is in `03-beta-prime-reduction.md`.  Therefore a successful proof of SD for \(1<\alpha<2\) must genuinely land in \(SD\setminus GGC\), just as the half-Cauchy endpoint does.

## 3. \(|C_\alpha|^{-p}\)

**Known literature plus exact HCM criterion.** If \(p\ge\alpha\), then

\[
|C_\alpha|^{-p}
=\left(\frac{\Gamma_{1-\gamma}}{\Gamma_\gamma}\right)^{p/\alpha}
\]

is a GB2 law with power parameter \(p/\alpha\ge1\).  Bosch–Simon therefore gives an HCM density, and

\[
HCM\Longrightarrow GGC\Longrightarrow SD\Longrightarrow ID.
\]

If \(0<p<\alpha\), its density is not HCM.  The Thorin-mass argument in `03-beta-prime-reduction.md` strengthens this to **not GGC**.  No reliable current theorem found in the search settles even ID throughout this range, and SD remains open.

## 4. Endpoint table

| Regime | \(C_\alpha\) | \(|C_\alpha|\) | \(|C_\alpha|^{-p}\) |
|---|---|---|---|
| \(1<\alpha<2\) | ID; literature SD-open; new proof: not SD | ID, not GGC; SD open | SD for \(p\ge\alpha\); ID/SD open for \(0<p<\alpha\) |
| \(\alpha=2\) | stable, SD | SD but not GGC | \(p\ge2\): HCM/GGC/SD; \(p=1\): same law as \(|C_2|\), hence SD |
| \(\alpha>2\) | not ID, hence not SD | general ID/SD not settled by Wang's theorem | not the main regime of this dossier |

## 5. Why the v1/v2 theorem is not counted

Wang v1/v2 contained an ID theorem for powers, including \(|C_\alpha|^{-p}\in ID\) for \(p\ge\alpha/2\) when \(1<\alpha\le2\).  The entire theorem and its gamma-type proof machinery disappear in v3, while v3 and the ECP proof explicitly leave the other questions to future work.  Until the removed result is restored with a corrected/public proof or independently verified, it is recorded as a research lead rather than a theorem.
