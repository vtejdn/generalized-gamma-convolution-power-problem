# GGC literature map

Last source-ledger update: **2026-09-06** (migration only; prior source-audit
dates and verification limits are unchanged).

This directory contains the primary sources and general analytic references
used by the active GGC power project. A file's presence is not an endorsement
of every claim in it. The exact theorem, hypotheses, page or equation, and
version used must still be recorded at the point of use in
[ResearchStatus.md](../ResearchStatus.md), the
[project progress ledger](../ledger/README.md), or a source audit in
[notes/](../notes/). Stable entry identifiers are collected in
[WIP.md](../WIP.md).

## Local PDF audit status

The following files already had theorem-level notes or exact citations in
the project ledger before the 2026-09-05 directory scan, so they were not
read a second time in that pass:

- `Bondesson2015.pdf`;
- `James-Roynette-Yor-2008-GGC-Dirichlet-means.pdf`;
- `Sjodin-2021-HMk-gamma-mixtures-GGC.pdf`;
- `the-power-problem-for-generalized-gamma-convolutions-ggc-and-related-questions.pdf`;
- `SSV.pdf`;
- `Steutel.pdf`;
- `Martin-Kearney-2010-self-convolutive-recurrence.pdf`;
- `Dyachenko-Karp-2021-arXiv2103.13312v1.pdf`.

The four previously unaudited local books were screened or audited on
2026-09-05:

- `Bondesson.pdf`: high direct value; theorem-level audit completed;
- `Sato2.pdf`: high direct value for the Volterra/size-bias formulation;
- `Zolotarev.pdf`: high value for stable Mellin and product factorizations;
- `Bertoin.pdf`: relevant Poisson-process infrastructure, but no direct
  Poisson--Kingman, Dirichlet-mean, or size-biased-residual theorem was found.

Two shared sources have been copied, byte-for-byte, into this directory:

- [Yano--Yano--Yor (2009)](Yano-Yano-Yor-2009-stable-hitting-times.pdf),
  for the beta-prime identity in the power-boundary note;
- [Rocha-Arteaga--Sato (2019)](Rocha-Arteaga-Sato-2019-ID-SD-Levy-processes.pdf),
  for the general ID/SD and stochastic-integral source audit.

Their exact bibliographic records and checksums are listed below.
SD-specific literature and the old version-search log are preserved in the
[fixed-commit archive](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/527a78a3616fbd7c40dab83f549a94e95dd81a54/background/alpha-cauchy-sd/literature/README.md).
The [migration record](../ledger/checkpoints/2026-09-06-background-migration.md)
explains why the other SD sources are not inputs to the active GGC proof.

## Core GGC sources

1. **Bondesson (1992).** Lennart Bondesson, *Generalized Gamma Convolutions
   and Related Classes of Distributions and Densities*, Lecture Notes in
   Statistics 76, Springer. Local copy: [Bondesson.pdf](Bondesson.pdf).
   This is the principal reference for HCM/GGC representations, closure
   results, Thorin measures, and weak approximation. See the
   [theorem-level monograph audit](../notes/bondesson-1992-ggc-hcm-foundational-infrastructure.md).

2. **Bondesson (2015).** Lennart Bondesson, “A Class of Probability
   Distributions that is Closed with Respect to Addition as Well as
   Multiplication of Independent Random Variables,” *Journal of Theoretical
   Probability* **28** (2015), 1063--1081,
   DOI [10.1007/s10959-013-0523-y](https://doi.org/10.1007/s10959-013-0523-y).
   Local copy: [Bondesson2015.pdf](Bondesson2015.pdf). Conjecture 1 on p. 1075
   is the project target. See the
   [article audit](../notes/bondesson-2015-product-closure-audit.md).

3. **James--Roynette--Yor (2008).** L. F. James, B. Roynette, and M. Yor,
   “Generalized Gamma Convolutions, Dirichlet Means, Thorin Measures, with
   Explicit Examples,” *Probability Surveys* **5** (2008), 346--415,
   DOI [10.1214/07-PS118](https://doi.org/10.1214/07-PS118).
   Local copy:
   [James-Roynette-Yor-2008-GGC-Dirichlet-means.pdf](James-Roynette-Yor-2008-GGC-Dirichlet-means.pdf).
   It supplies the Dirichlet-mean/Thorin framework used in Routes 1 and 5.

4. **Sjödin (2021).** Tord Sjödin, “On Mixtures of Gamma Distributions,
   Distributions with Hyperbolically Monotone Densities and Generalized
   Gamma Convolutions (GGC),” *Probability and Mathematical Statistics*
   **41**(1) (2021), 1--7,
   DOI [10.37190/0208-4147.41.1.1](https://doi.org/10.37190/0208-4147.41.1.1).
   Local copy:
   [Sjodin-2021-HMk-gamma-mixtures-GGC.pdf](Sjodin-2021-HMk-gamma-mixtures-GGC.pdf).
   The gamma--\(HM_k\) product/quotient criterion is used only with its
   stated shape and hyperbolic-monotonicity hypotheses.

5. **Sjödin (2026), claim under audit.** Tord Sjödin, “The Power Problem for
   Generalized Gamma Convolutions (GGC) and Related Questions,” *Journal of
   Theoretical Physics & Mathematics Research* **4**(2) (2026), 1--7,
   DOI [10.64030/3065-8802.04.02.02](https://doi.org/10.64030/3065-8802.04.02.02),
   arXiv:2601.04038. Local copy:
   [the-power-problem-for-generalized-gamma-convolutions-ggc-and-related-questions.pdf](the-power-problem-for-generalized-gamma-convolutions-ggc-and-related-questions.pdf).
   Theorem 1 claims the full \(q>1\) result, but this project does **not**
   accept it as established: Lemma 2 is false as stated. The exact audit is
   in [ResearchStatus.md](../ResearchStatus.md#audit-certificate-for-the-2026-claimed-proof).

## Analytic and probabilistic tools

6. **Schilling--Song--Vondraček (2010).** R. L. Schilling, R. Song, and
   Z. Vondraček, *Bernstein Functions: Theory and Applications*, de Gruyter
   Studies in Mathematics 37. Local copy: [SSV.pdf](SSV.pdf). Used for
   Bernstein, Stieltjes, and complete Bernstein function criteria.

7. **Steutel--van Harn (2004).** F. W. Steutel and K. van Harn,
   *Infinite Divisibility of Probability Distributions on the Real Line*,
   Marcel Dekker. Local copy: [Steutel.pdf](Steutel.pdf). Used for ID
   criteria and the light-tail obstruction, with theorem-level citations in
   the WIP.

8. **Martin--Kearney (2010).** R. J. Martin and M. J. Kearney, “An Exactly
   Solvable Self-Convolutive Recurrence,” *Aequationes Mathematicae* **80**
   (2010), 291--318,
   DOI [10.1007/s00010-010-0051-0](https://doi.org/10.1007/s00010-010-0051-0).
   Local copy:
   [Martin-Kearney-2010-self-convolutive-recurrence.pdf](Martin-Kearney-2010-self-convolutive-recurrence.pdf).

9. **Dyachenko--Karp (2021/2022).** A. Dyachenko and D. Karp, “Ratios of the
   Gauss Hypergeometric Functions with Parameters Shifted by Integers:
   Part I,” arXiv:2103.13312v1; final article “Integral Representations of
   Ratios of the Gauss Hypergeometric Functions with Parameters Shifted by
   Integers,” *Mathematics* **10**(20) (2022), Article 3903,
   DOI [10.3390/math10203903](https://doi.org/10.3390/math10203903).
   Local checked preprint:
   [Dyachenko-Karp-2021-arXiv2103.13312v1.pdf](Dyachenko-Karp-2021-arXiv2103.13312v1.pdf).

10. **General Lévy/stable references.** The local copies
    [Bertoin.pdf](Bertoin.pdf), [Sato2.pdf](Sato2.pdf), and
    [Zolotarev.pdf](Zolotarev.pdf) support general Lévy-process, infinite
    divisibility, and stable-law steps that can arise in the active routes.
    They remain in the main literature directory because their role is not
    confined to the historical \(\alpha\)-Cauchy problem.

### Audit notes for the three general references

- **Sato.** [Sato2.pdf](Sato2.pdf), *Levy Processes and Infinitely
  Divisible Distributions*, corrected printing with supplement. Theorem
  51.1 supplies the measure-level Volterra identity; see the
  [ID/Volterra/size-bias audit](../notes/sato-id-volterra-size-bias-ggc.md).
- **Zolotarev.** [Zolotarev.pdf](Zolotarev.pdf), *One-dimensional Stable
  Distributions*, AMS, 1986. Its Mellin, stable-composition, and
  reciprocal-index gamma-product results are recorded in the
  [stable tilt infrastructure note](../notes/stable-mellin-poisson-tilt-infrastructure.md).
- **Bertoin.** [Bertoin.pdf](Bertoin.pdf), *Levy Processes*, Cambridge
  University Press, 1996. Sections O.5 and III.1 provide Poisson-random-
  measure, compensation, and subordinator normalization tools. The same
  [stable tilt infrastructure note](../notes/stable-mellin-poisson-tilt-infrastructure.md)
  records both the useful material and the negative screening result.

## Additional online sources checked on 2026-09-05

The following versioned primary sources were read online. Their theorem
statements, hypotheses and project connections are saved in notes; no local
PDF download is claimed.

11. **James (2006).** L. F. James, *Gamma Tilting Calculus for GGC and
    Dirichlet means with applications to Linnik processes and Occupation
    Time Laws for Randomly Skewed Bessel Processes and Bridges*,
    [arXiv:math/0610218v3](https://arxiv.org/pdf/math/0610218v3),
    7 November 2006. Theorem 4.1(i),(iv), PDF p. 13; Proposition 5.7(i),
    pp. 21--22; Proposition 5.14, p. 24.
    [Notation and gap audit](../notes/james-dirichlet-means-stable-scaling.md).

12. **James--Lijoi--Prünster (2008).** L. F. James, A. Lijoi and
    I. Prünster, “Distributions of linear functionals of two parameter
    Poisson--Dirichlet random measures,” *Annals of Applied Probability*
    **18** (2008), 521--551,
    [DOI 10.1214/07-AAP462](https://doi.org/10.1214/07-AAP462).
    Checked [arXiv:math/0609488v4](https://arxiv.org/pdf/math/0609488v4),
    31 March 2008, Theorem 2.1 and equations (13)--(14), reprint/PDF p. 8.
    The matched positive-linear-PD-mean conversion is recorded in the
    [James note](../notes/james-dirichlet-means-stable-scaling.md).

13. **James (2010).** L. F. James, “Dirichlet mean identities and laws of
    a class of subordinators,” *Bernoulli* **16** (2010), 361--388,
    [DOI 10.3150/09-BEJ224](https://doi.org/10.3150/09-BEJ224).
    Checked [arXiv:1010.1639v1](https://arxiv.org/pdf/1010.1639v1),
    8 October 2010. Theorem 2.1, PDF p. 8; Theorem 3.1, pp. 12--13;
    Remark 3.1, p. 15. Used for matched beta scaling and posterior tilting,
    not arbitrary replacement of gamma shapes.

14. **Sokal (2010).** A. D. Sokal, “Real-variables characterization of
    generalized Stieltjes functions,” *Expositiones Mathematicae* **28**
    (2010), 179--185,
    [DOI 10.1016/j.exmath.2009.06.004](https://doi.org/10.1016/j.exmath.2009.06.004).
    Checked [arXiv:0902.0065v2](https://arxiv.org/pdf/0902.0065v2),
    6 May 2009. Theorem 1, pp. 2--3; Hausdorff proof, equations
    (13)--(16), pp. 5--6.
    [Source audit and tilted-cumulant application](../notes/sokal-stieltjes-hausdorff-criterion.md).

## Citation discipline

- Bondesson's independent-product closure theorem cannot be applied to a
  deterministic square by replacing two independent factors with the same
  random variable.
- A normalized HCM Laplace transform and an HCM density are different
  hypotheses.
- The 2026 article is cited as a **claim under audit**, never as an
  established solution.
- Numerical or symbolic agreement is evidence for a formula only; all
  project theorems require an analytic or exact certificate.

## Shared sources retained during the SD separation

### Yano--Yano--Yor (2009)

K. Yano, Y. Yano and M. Yor, “On the laws of first hitting times of points
for one-dimensional symmetric stable Lévy processes,” *Séminaire de
Probabilités XLII*, Lecture Notes in Mathematics **1979**, 187--227,
DOI 10.1007/978-3-642-01763-6_8; arXiv:0811.2046.
The gamma-ratio identity is in Section 2.2, equations (2.20)--(2.21).
Local copy: [Yano-Yano-Yor-2009-stable-hitting-times.pdf](Yano-Yano-Yor-2009-stable-hitting-times.pdf).
Use: [BP-1](../notes/beta-prime-power-boundary.md#bp-1), not the main log-rate theorem.

SHA-256: `464E3DB2809C1E2AFF4A2F0B9544C9D99ADFB7DCCB2CFE26B163B9832E31D876`.

### Rocha-Arteaga--Sato (2019)

Alfonso Rocha-Arteaga and Ken-iti Sato, *Topics in Infinitely Divisible
Distributions and Lévy Processes*, Revised Edition, SpringerBriefs in
Probability and Mathematical Statistics, Springer, Cham, 2019, viii+135 pp.,
DOI 10.1007/978-3-030-22700-5.
Local copy: [Rocha-Arteaga-Sato-2019-ID-SD-Levy-processes.pdf](Rocha-Arteaga-Sato-2019-ID-SD-Levy-processes.pdf).
Use: the [general source audit](../notes/rocha-arteaga-sato-2019-id-sd-levy-processes.md),
especially Theorem 1.34, Theorem 2.17, the Chapter 2 Thorin-class notes,
and the qualified subordination interfaces.
Its source-audit date remains 2026-09-04; this is not a fresh PDF audit.

SHA-256: `42100E1032F61547FB623F9771867E89AF582D2A48BF663E7D3BB9303C5FE7AA`.
