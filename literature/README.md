# GGC literature map

Last source-ledger update: **2026-09-05**.

This directory contains the primary sources and general analytic references
used by the active GGC power project. A file's presence is not an endorsement
of every claim in it. The exact theorem, hypotheses, page or equation, and
version used must still be recorded at the point of use in
[ResearchStatus.md](../ResearchStatus.md), [WIP.md](../WIP.md), or a source
audit in [notes/](../notes/).

The \(\alpha\)-Cauchy/SD-specific papers and their version-search log have
been moved to the historical
[background case study](../background/alpha-cauchy-sd/literature/README.md).

## Core GGC sources

1. **Bondesson (1992).** Lennart Bondesson, *Generalized Gamma Convolutions
   and Related Classes of Distributions and Densities*, Lecture Notes in
   Statistics 76, Springer. Local copy: [Bondesson.pdf](Bondesson.pdf).
   This is the principal reference for HCM/GGC representations, closure
   results, Thorin measures, and weak approximation.

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
