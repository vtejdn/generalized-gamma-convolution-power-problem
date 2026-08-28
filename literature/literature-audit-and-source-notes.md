# Literature map and verification log

Cutoff date: **2026-08-27**.

**Literature/new-work distinction.**  The search record below found the symmetric SD question open.  After that audit, this dossier obtained a new Jensen/Fourier disproof for \(1<\alpha<2\), recorded in `notes/07-Jensen-obstruction-and-non-SD.md`.  It is not attributed to any source in this literature map and has not been externally peer reviewed.

## Primary chain

1. **Yano–Yano–Yor (2009), Remark 2.9 and Proposition 2.11.**  Defines
   \[
   C_\alpha\overset d=\varepsilon
   \left(\frac{\Gamma_{1/\alpha}}{\widehat\Gamma_{1-1/\alpha}}\right)^{1/\alpha},
   \]
   records \(|C_\alpha|\in ID\) for \(1<\alpha\le2\), asks the three ID/SD questions, and proves the Fourier duality between the \(\alpha\)-Cauchy and \(\alpha\)-Linnik laws.  Published reference: LNM 1979, pp. 187–227, DOI [10.1007/978-3-642-01763-6_8](https://doi.org/10.1007/978-3-642-01763-6_8); [arXiv:0811.2046](https://arxiv.org/abs/0811.2046).

2. **Bondesson (1987).**  Proves infinite divisibility of the half-Cauchy and, by the result cited as Theorem 2.7 in Yano–Yano–Yor, \(|C_\alpha|\in ID\) for \(1<\alpha\le2\).  DOI [10.1080/03461238.1987.10413830](https://doi.org/10.1080/03461238.1987.10413830).

3. **Diédhiou (1998).**  Proves the half-Cauchy law \(|C_2|\) is SD.  DOI [10.1006/jmaa.1997.5790](https://doi.org/10.1006/jmaa.1997.5790).

4. **Bosch–Simon (2015).**  For the GB2 variable
   \[
   (B_{a,b}^{-1}-1)^s\overset d=(\Gamma_b/\Gamma_a)^s,
   \]
   the density is HCM iff \(s\ge1\); the paper explicitly leaves general ID for \(s<1\) open, except for the sufficient strip \(a\le1/2\le s\le b=1-a\).  Bernoulli 21(4), 2552–2568, DOI [10.3150/14-BEJ654](https://doi.org/10.3150/14-BEJ654); [arXiv:1405.4176](https://arxiv.org/abs/1405.4176).

5. **Ferreira–Simon (2023).**  Reviews the beta-prime law as an HCM/GGC/SD law and gives its spectral/Thorin representation through Tricomi's \(\Psi\)-function.  Transactions AMS 376, 855–890, DOI [10.1090/tran/8748](https://doi.org/10.1090/tran/8748); [arXiv:2108.09244](https://arxiv.org/abs/2108.09244).

6. **Wang (current arXiv v3, 2026).**  Proves
   \[
   C_\alpha\in ID\quad\Longleftrightarrow\quad1<\alpha\le2.
   \]
   The current paper expressly leaves the other questions for future work.  [arXiv:2512.23164v3](https://arxiv.org/abs/2512.23164).

7. **Sjödin (2026).**  Proves the 2026 power theorem \(X\in GGC,\ q>1\Rightarrow X^q\in GGC\).  This is a theorem about powers larger than one, not about roots.  DOI [10.64030/3065-8802.04.02.02](https://doi.org/10.64030/3065-8802.04.02.02); [arXiv:2601.04038](https://arxiv.org/abs/2601.04038).

8. **Baricz–Prabhu–Singh–Vijesh (2026).**  Gives a recent special-function proof for infinite divisibility of gamma ratios, but does not settle subunit powers or the present SD questions.  Pacific J. Math. 343, 261–, DOI [10.2140/pjm.2026.343.261](https://doi.org/10.2140/pjm.2026.343.261); [arXiv:2406.17721](https://arxiv.org/abs/2406.17721).

## Wang version audit

The arXiv history is material, not cosmetic.

| Version | Date | Title/scope | Power claim |
|---|---|---|---|
| v1 | 2025-12-29 | *Infinite divisibility of \(\alpha\)-Cauchy and related variables* | contains sufficient ID ranges for \(|C_\alpha|^{\pm p}\) |
| v2 | 2026-01-04 | same broad scope; upgrades \(C_\alpha\in ID\) to all \(1<\alpha\le2\) | retains the power theorem |
| v3 | 2026-04-15 | *Infinite divisibility of \(\alpha\)-Cauchy distributions* | **power theorem and its machinery removed**; other questions left to future work |

The deleted v1/v2 assertion was:

\[
|C_\alpha|^{\varepsilon p}\in ID
\quad\text{if}\quad
p\ge
\begin{cases}
(\alpha+1)/3,&\varepsilon=+1,\ 1<\alpha\le2,\\
\alpha/2,&\varepsilon=+1,\ \alpha>2,\\
\alpha/2,&\varepsilon=-1,\ 1<\alpha\le2,\\
(2\alpha-1)/3,&\varepsilon=-1,\ \alpha>2.
\end{cases}
\]

Because this theorem is absent from v3 and the ECP proof, and v3 says that the remaining questions are left for future work, this dossier records it only as a **version-dependent, removed claim**, not as a reliable current theorem.  This is not a claim about why the author removed it.

## Attached ECP proof

The supplied nine-page file is an author/page proof for *Electronic Communications in Probability*.  Its front matter still contains placeholders for article number, DOI, year, and final acceptance date.  Its theorem, proof structure, and the sentence leaving the other questions to future work agree with arXiv v3.  It should therefore be treated as strong evidence of the accepted/current mathematical scope, but not yet as a complete bibliographic record.

## Search protocol

The check used:

- exact-title and exact-phrase searches for “alpha-Cauchy”, “half alpha-Cauchy”, “beta prime fractional power”, “GB2 self-decomposable”, and “gamma ratio self-decomposable”;
- arXiv version/source inspection for Wang, Yano–Yano–Yor, Bosch, Bosch–Simon, Ferreira–Simon, Sjödin, and Baricz et al.;
- Crossref metadata/DOI checks and OpenAlex discovery searches;
- forward/backward citation inspection around Yano–Yano–Yor Remark 2.9 and the GB2 paragraph of Bosch–Simon.

No post-2009 source located by this protocol proves SD of \(C_\alpha\) or \(|C_\alpha|\) for \(1<\alpha<2\), or SD of \(|C_\alpha|^{-p}\) in the non-HCM range \(0<p<\alpha\).  “Open” here means **not resolved in the primary sources and searches above as of the cutoff**, not a logical proof that no unpublished argument exists.
