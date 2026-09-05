# Literature map and verification log

> **Repository role.** This is the background literature and version-audit
> record for the completed alpha-Cauchy SD case study. The active project is
> the GGC power problem; its current claims and proof audit are recorded in
> [ResearchStatus.md](../../../ResearchStatus.md). This file does not define a
> parallel research objective.

Initial alpha-Cauchy search cutoff: **2026-08-27**.
GGC status correction: **2026-09-05**.

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

7. **Sjödin (2026), claimed proof under audit.**  The article claims the
   power theorem \(X\in GGC,\ q>1\Rightarrow X^q\in GGC\), but this project
   does **not** currently accept that claim as established.  Its Lemma 2 is
   false as stated: a bounded-support specialization would force a
   nondegenerate bounded law to be GGC/ID.  The \(\Delta<0\) substitution
   and the subsequent parameter-dependent induction therefore leave a
   proof gap.  See [ResearchStatus.md](../../../ResearchStatus.md) for the exact analytic
   audit.  DOI [10.64030/3065-8802.04.02.02](https://doi.org/10.64030/3065-8802.04.02.02);
   [arXiv:2601.04038](https://arxiv.org/abs/2601.04038).

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

## Additional primary sources used by the GGC WIP

The following sources were added and checked on **2026-09-05** for the
active proof ledger [WIP.md](../../../WIP.md).

1. **Martin--Kearney (2010).** R. J. Martin and M. J. Kearney,
   “An Exactly Solvable Self-Convolutive Recurrence,” *Aequationes
   Mathematicae* **80** (2010), 291--318,
   DOI [10.1007/s00010-010-0051-0](https://doi.org/10.1007/s00010-010-0051-0);
   [arXiv:1103.4936](https://arxiv.org/abs/1103.4936);
   [local PDF](../../../literature/Martin-Kearney-2010-self-convolutive-recurrence.pdf).
   Equation (1) defines \(S(\alpha_1,\alpha_2,\alpha_3)\), and the
   Introduction gives the positive Mellin density for \(S(2,-3,1)\).
   The denominator in that displayed density is
   \(G_1(x/2)^2+\pi\), not \(G_1(x/2)^2+\pi^2\).
   SHA-256:
   636BC6CAB2CA3E65A11AD25CE84DB635ADF2F9D4863FB4A31F4D009CAFA5D116.

2. **Sjödin (2021).** T. Sjödin, “On Mixtures of Gamma Distributions,
   Distributions with Hyperbolically Monotone Densities and Generalized
   Gamma Convolutions (GGC),” *Probability and Mathematical Statistics*
   **41**(1) (2021), 1--7,
   DOI [10.37190/0208-4147.41.1.1](https://doi.org/10.37190/0208-4147.41.1.1);
   [arXiv:1806.03926](https://arxiv.org/abs/1806.03926);
   [local PDF](../../../literature/Sjodin-2021-HMk-gamma-mixtures-GGC.pdf).
   In the arXiv version, equation (1) and Definition 1 give the \(HM_k\)
   representation for real \(k>0\), and Theorem 1 gives the gamma-product
   and gamma-quotient GGC criterion for \(0<k\le l\) and an \(HM_l\)
   factor.  These are numbered (2.1), Definition 2.1, and Theorem 3.1 in
   the published version.
   SHA-256:
   33C57E0BEF800BA632105A5241F221ADF48F3FB4119F88C8BF6C52E62B744880.

3. **Leonov--Shiryaev (1959).** V. P. Leonov and A. N. Shiryaev,
   “On a Method of Calculation of Semi-Invariants,” *Theory of
   Probability and its Applications* **4**(3) (1959), 319--329,
   DOI [10.1137/1104031](https://doi.org/10.1137/1104031).
   Equation (IV.d) is the product-cumulant formula used for the
   connected-permutation expansion in WIP-3.5.

4. **Cifarelli--Regazzini (1990, corrected 1994).** D. M. Cifarelli and
   E. Regazzini, “Distribution Functions of Means of a Dirichlet Process,”
   *Annals of Statistics* **18**(1) (1990), 429--442,
   DOI [10.1214/aos/1176347509](https://doi.org/10.1214/aos/1176347509).
   The correction is *Annals of Statistics* **22**(3) (1994), 1633--1634,
   DOI [10.1214/aos/1176325647](https://doi.org/10.1214/aos/1176325647).
   This is the historical source for the Dirichlet-mean generalized
   Stieltjes identity and inversion specialized in WIP-1.11.

5. **Lijoi--Prünster (2009).** A. Lijoi and I. Prünster,
   “Distributional Properties of Means of Random Probability Measures,”
   *Statistics Surveys* **3** (2009), 47--95,
   DOI [10.1214/09-SS041](https://doi.org/10.1214/09-SS041).
   Theorem 2.1 records the Cifarelli--Regazzini generalized Stieltjes
   identity, and Appendix B.1 records the generalized Stieltjes inversion
   framework.  WIP-1.11 rederives the particular boundary and Abel formulas
   it uses, rather than appealing to them without checking normalizations.

6. **NIST DLMF, Faddeeva, Legendre, Bessel, and
   Kontorovich--Lebedev formulas.**
   Equation [7.7.2](https://dlmf.nist.gov/7.7.E2) supplies the
   upper-half-plane Faddeeva integral used in WIP-5.8.  Equation
   [14.12.7](https://dlmf.nist.gov/14.12.E7), at order zero and after
   reflecting the cosine variable, supplies the Legendre integral used in
   WIP-1.13.  Equation
   [10.9.4](https://dlmf.nist.gov/10.9.E4) supplies the Poisson
   representation of (J_1); equation
   [10.32.9](https://dlmf.nist.gov/10.32.E9) supplies the integral
   representation of (K_{i\xi}); and equations
   [10.43.30--10.43.32](https://dlmf.nist.gov/10.43#v) fix the transform,
   inverse, and sufficient hypotheses used in WIP-4.2 and WIP-4.6.
   Equation [15.8.18](https://dlmf.nist.gov/15.8.E18) is the quadratic
   Gauss transformation used in WIP-5.30, and equation
   [13.7.2](https://dlmf.nist.gov/13.7.E2) supplies the independent
   Kummer-asymptotic check in WIP-5.31.

7. **Dyachenko--Karp (2021/2022).** A. Dyachenko and D. Karp,
   “Ratios of the Gauss Hypergeometric Functions with Parameters Shifted
   by Integers: Part I,” arXiv:2103.13312v1 (24 March 2021);
   [local preprint](../../../literature/Dyachenko-Karp-2021-arXiv2103.13312v1.pdf).
   Theorem 2.1 gives the zero-free regimes, Theorem 2.12 and Remark 2.15
   give the Markov integral, and Section 4, Example 2, specializes it to
   \(R_{0,1,0}\) with the explicit positive density used in
   WIP-5.30.  On \(t\in(0,1)\), the notation
   \(\lvert{}_2F_1(a,b;c;t^{-1})\rvert^2\) means the product of the
   conjugate boundary values on the Gauss cut.  The final article is
   “Integral Representations of Ratios of the Gauss Hypergeometric
   Functions with Parameters Shifted by Integers,” *Mathematics*
   **10**(20) (2022), Article 3903,
   DOI [10.3390/math10203903](https://doi.org/10.3390/math10203903).
   The Hausdorff-moment theorem cited there is R. Küstner,
   “Mapping Properties of Hypergeometric Functions and Convolutions of
   Starlike or Convex Functions of Order Alpha,” *Computational Methods
   and Function Theory* **2**(2) (2002), 597--610, Theorem 1.5,
   DOI [10.1007/BF03321867](https://doi.org/10.1007/BF03321867).
   The volume itself and Dyachenko--Karp use 2002; some current Springer
   metadata displays 2004, so the DOI and volume/issue/page data are
   retained to make the identification unambiguous.
   SHA-256 of the local arXiv v1 PDF:
   849F8FA0A74CAA94C535C7128175B587C7F26A609B156E42C93AD7CFD4F26F18.
