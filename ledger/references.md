# Source map for the progress ledger

[Ledger map](README.md) | [Master index](../WIP.md)

This file preserves the source ledger formerly appended to `WIP.md`. Exact theorem-level provenance remains part of each progress entry.

## Source map for this ledger

The formulas labelled **[PROVED]** or **[PROVED REDUCTION]** above are new
derivations in this project unless an external input is named explicitly.
The following map fixes the exact editions, conventions, and locations used.

1. **Bondesson (2015).**
   [Local PDF](../literature/Bondesson2015.pdf).  Proposition 2, p. 1066:
   HCM density implies GGC; Proposition 3, pp. 1066--1067: normalized HCM
   Laplace transforms are precisely GGC Laplace transforms; Proposition
   4(a), p. 1066: HCM densities are preserved by powers
   \(\lvert q\rvert\ge1\); Theorem 1, pp. 1068--1071: independent-product
   closure of GGC.  Conjecture 1 is the target of this ledger.

2. **James--Roynette--Yor (2008).**
   [Local PDF](../literature/James-Roynette-Yor-2008-GGC-Dirichlet-means.pdf),
   *Probability Surveys* **5** (2008), 346--415,
   DOI 10.1214/07-PS118.  Equations (20)--(25), p. 354 use the standard
   **rate** Thorin variable \(G\); equations (33)--(38), pp. 356--357 give
   \(\Gamma_m(G)=\gamma_mD_m(G)\), where the Dirichlet-mean amplitudes have
   base law \(1/G\), together with gamma cancellation.  Equation (30),
   p. 355 identifies finite Thorin mass from the density at zero.
   Proposition 1.5, p. 360 is the Bondesson-class sufficient criterion for
   membership in \(D^{(m)}\).

   Accordingly, whenever this ledger says “scale-form Thorin measure
   \(mF\)”, the corresponding JRY rate-form Thorin measure is
   \(m(x\mapsto1/x)_\#F\).  This convention prevents an otherwise easy
   reciprocal error.

3. **Schilling--Song--Vondraček (2010).**
   [Local PDF](../literature/SSV.pdf), *Bernstein Functions: Theory and
   Applications*, de Gruyter Studies in Mathematics 37. Corollary 1.6,
   pp. 5--6 gives the product and limit closure of completely monotone
   functions; Theorem 2.2(i), p. 12 characterizes Stieltjes functions as
   Laplace transforms of measures with completely monotone densities;
   Theorem 3.6, p. 19 gives the CM--Bernstein composition theorem; and
   Definition 9.4 and Theorem 9.5, pp. 81--82 give the
   exponential-mixture formulation used in WIP-1.15. Theorem 6.10,
   equation (6.10), pp. 58--60 is the canonical CBF phase representation;
   its proof and Remark 6.8(ii), equation (6.9), recover the boundary
   phase, while Remark 6.11 gives the \(f(0+)>0\) normalized rewrite.
   Theorem 7.3,
   p. 63 is the nonzero Stieltjes/CBF reciprocal theorem; Theorem 8.2,
   pp. 73--75 characterizes Thorin--Bernstein functions by a Stieltjes
   derivative and by a nondecreasing cumulative Thorin function.
   Proposition 1.2, p. 3 gives uniqueness of a finite measure from its
   Laplace transform, and Theorem 1.4, pp. 4--5 is Bernstein's theorem.
   These are the external analytic inputs to WIP-2.3, WIP-2.7, WIP-3.6,
   WIP-4.3, WIP-5.24, and WIP-5.28.

4. **Steutel--van Harn (2004).**
   [Local PDF](../literature/Steutel.pdf), *Infinite Divisibility of
   Probability Distributions on the Real Line*, Marcel Dekker.  Chapter
   III, Theorem 10.7 is the Goldie--Steutel implication “completely
   monotone density \(\Longrightarrow\) infinitely divisible”, used in
   WIP-2.1.  Chapter IV, Corollary 9.9, p. 200 is the light-tail
   characterization used in WIP-1.14: among nondegenerate infinitely
   divisible laws, divergence of
   \(-\log\mathbb P(|X|>x)/(x\log x)\) along a subsequence forces the law
   to be normal.  The original papers are C. M. Goldie, “A class of infinitely
   divisible random variables,” *Proc. Cambridge Philos. Soc.* **63**
   (1967), 1141--1143, DOI 10.1017/S0305004100042225; F. W. Steutel,
   “Note on the infinite divisibility of exponential mixtures,”
   *Ann. Math. Statist.* **38** (1967), 1303--1305,
   DOI 10.1214/aoms/1177698806; and Steutel, “Note on Completely Monotone
   Densities,” *Ann. Math. Statist.* **40** (1969), 1130--1131,
   DOI 10.1214/aoms/1177697626.

5. **Lin (2017).** G. D. Lin, “Recent developments on the moment problem,”
   *Journal of Statistical Distributions and Applications* **4**, Article
   5, DOI 10.1186/s40488-017-0059-2, Theorem 2.  This records the Stieltjes
   Carleman/Hardy determinacy implications used in WIP-3.2.  The actual
   growth estimate needed here is proved in (3.8)--(3.9).

6. **NIST Digital Library of Mathematical Functions.**  Equation
   [7.7.2](https://dlmf.nist.gov/7.7.E2) is the upper-half-plane Faddeeva
   integral used in WIP-5.8.  Equation
   [14.12.7](https://dlmf.nist.gov/14.12.E7), specialized to order zero
   and with the cosine variable reflected, is the Legendre integral used
   in (1.75), (1.92), and (1.154).  Equation
   [14.2.1](https://dlmf.nist.gov/14.2.E1) is Legendre's differential
   equation used in (1.154).  Sections 10.25.1
   (modified Bessel equation), 10.25.2 (the \(I_\nu\) series), 10.29.1
   (derivative/recurrence identities), and 10.32.1 (the \(I_0\) integral
   representation) are the special-function inputs used in WIP-2.1 and
   WIP-2.6.  Equation
   [10.9.4](https://dlmf.nist.gov/10.9.E4) is the Poisson integral used in
   (4.5); equation
   [10.32.9](https://dlmf.nist.gov/10.32.E9) is the \(K_\nu\) integral
   representation used in (4.16); and equations
   [10.43.30--10.43.32](https://dlmf.nist.gov/10.43#v) fix the
   Kontorovich--Lebedev normalization and sufficient inversion conditions
   used in WIP-4.6.  Equation
   [15.8.18](https://dlmf.nist.gov/15.8.E18) is the quadratic Gauss
   transformation used in (5.316)--(5.317); equation
   [15.8.14](https://dlmf.nist.gov/15.8.E14) is the quadratic
   transformation used to check the Appell two-rate degeneration in
   (5.350).  Equations
   [13.2.40](https://dlmf.nist.gov/13.2.E40) and
   [13.2.42](https://dlmf.nist.gov/13.2.E42) are the Kummer parameter
   transformation and connection formula used in (1.127) and
   (1.140)--(1.143); equation
   [13.4.4](https://dlmf.nist.gov/13.4.E4) is the positive real integral
   for \(U\) used in (1.127) and (1.140); and equations
   [13.7.3](https://dlmf.nist.gov/13.7.E3),
   [13.7.4](https://dlmf.nist.gov/13.7.E4), and
   [13.7.5](https://dlmf.nist.gov/13.7.E5) give the large-argument
   \(U\) expansion and differentiable remainder used in (1.128) and
   (1.149).
   Equation
   [13.7.2](https://dlmf.nist.gov/13.7.E2) is the large-argument Kummer
   expansion used in (5.328).

7. **Martin--Kearney (2010).**
   [Local PDF](../literature/Martin-Kearney-2010-self-convolutive-recurrence.pdf),
   R. J. Martin and M. J. Kearney, “An Exactly Solvable
   Self-Convolutive Recurrence,” *Aequationes Mathematicae* **80**
   (2010), 291--318, DOI 10.1007/s00010-010-0051-0.  Equation (1) and
   the displayed \(S(2,-3,1)\) formula in the Introduction are the
   external input to WIP-3.8; the latter formula is on p. 293.

8. **Sjödin (2021).**
   [Local PDF](../literature/Sjodin-2021-HMk-gamma-mixtures-GGC.pdf),
   T. Sjödin, “On Mixtures of Gamma Distributions, Distributions with
   Hyperbolically Monotone Densities and Generalized Gamma Convolutions
   (GGC),” *Probability and Mathematical Statistics* **41**(1) (2021),
   1--7, DOI 10.37190/0208-4147.41.1.1.  Equation (2.1) and
   Definition 2.1, p. 2 define \(HM_k\) for arbitrary real \(k>0\);
   Theorem 3.1, p. 4 is the
   \(\Gamma(k)\times HM_l\) and \(\Gamma(k)/HM_l\) GGC theorem for
   \(0<k\le l\).  In the arXiv manuscript these are numbered (1),
   Definition 1, and Theorem 1.  WIP-3.9 and WIP-5.27 use only this exact
   sufficient condition; WIP-1.18 uses the definition and proves that the
   \(l=k=2/3\) hypothesis fails for its exact residual.

9. **Leonov--Shiryaev (1959).**
   V. P. Leonov and A. N. Shiryaev, “On a Method of Calculation of
   Semi-Invariants,” *Theory of Probability and its Applications*
   **4**(3) (1959), 319--329, DOI 10.1137/1104031.  Their product-cumulant
   identity, equation (IV.d), is the partition formula used in WIP-3.5.

10. **Cifarelli--Regazzini inversion.** D. M. Cifarelli and E. Regazzini,
    “Distribution Functions of Means of a Dirichlet Process,” *Annals of
    Statistics* **18**(1) (1990), 429--442,
    [DOI 10.1214/aos/1176347509](https://doi.org/10.1214/aos/1176347509),
    with the correction in *Annals of Statistics* **22**(3) (1994),
    1633--1634,
    [DOI 10.1214/aos/1176325647](https://doi.org/10.1214/aos/1176325647).
    A. Lijoi and I. Prünster, “Distributional Properties of Means of Random
    Probability Measures,” *Statistics Surveys* **3** (2009), 47--95,
    [DOI 10.1214/09-SS041](https://doi.org/10.1214/09-SS041), Theorem 2.1
    and Appendix B.1, records the generalized Stieltjes identity and its
    inversion framework.  Equations (1.56)--(1.58) specialize that framework
    to order \(1/2\), but their boundary and Abel derivations are included in
    WIP-1.11 rather than imported as an unproved formula.

11. **Dyachenko--Karp hypergeometric-ratio representation.**
    A. Dyachenko and D. Karp,
    “Ratios of the Gauss Hypergeometric Functions with Parameters Shifted
    by Integers: Part I,” arXiv:2103.13312v1 (24 March 2021),
    [local preprint](../literature/Dyachenko-Karp-2021-arXiv2103.13312v1.pdf).
    Theorem 2.1 gives the zero-free parameter regimes, Theorem 2.12 gives
    the Cauchy/Markov integral, and Section 4, Example 2, gives the explicit
    \(R_{0,1,0}\) density used in (5.318)--(5.320).  The final article is
    “Integral Representations of Ratios of the Gauss Hypergeometric
    Functions with Parameters Shifted by Integers,” *Mathematics*
    **10**(20) (2022), Article 3903,
    [DOI 10.3390/math10203903](https://doi.org/10.3390/math10203903).
    Its Example 2 also records that the Hausdorff-moment result follows
    from R. Küstner, “Mapping Properties of Hypergeometric Functions and
    Convolutions of Starlike or Convex Functions of Order Alpha,”
    *Computational Methods and Function Theory* **2**(2) (2002), 597--610,
    [DOI 10.1007/BF03321867](https://doi.org/10.1007/BF03321867),
    Theorem 1.5.  WIP-5.30 uses the explicit Dyachenko--Karp density,
    including its cut-boundary modulus, rather than importing an unnamed
    continued-fraction measure.

The downloaded James--Roynette--Yor PDF was checked against the displayed
journal pagination, and has SHA-256
CF3D18C4E8F37837A7872B8BF5A27236E5A606F1A1A4DEC5054DDBD991C05DF1.
The Martin--Kearney and Sjödin PDFs have SHA-256 values, respectively,
636BC6CAB2CA3E65A11AD25CE84DB635ADF2F9D4863FB4A31F4D009CAFA5D116
and
33C57E0BEF800BA632105A5241F221ADF48F3FB4119F88C8BF6C52E62B744880.
The Dyachenko--Karp arXiv v1 PDF has SHA-256
849F8FA0A74CAA94C535C7128175B587C7F26A609B156E42C93AD7CFD4F26F18.

## Additional source audit: 2026-09-05

12. **James (2006), stable scaling and gamma tilting.** L. F. James,
    *Gamma Tilting Calculus for GGC and Dirichlet means with applications
    to Linnik processes and Occupation Time Laws for Randomly Skewed
    Bessel Processes and Bridges*,
    [arXiv:math/0610218v3](https://arxiv.org/pdf/math/0610218v3),
    7 November 2006. Theorem 4.1(i),(iv), PDF p. 13; Proposition 5.7(i),
    PDF pp. 21--22; Proposition 5.14, PDF p. 24.
    [Audit and project-notation crosswalk](../notes/james-dirichlet-means-stable-scaling.md).
    In particular, the gamma-power factorization and tilted stable
    composition are known literature results independently rederived here.

13. **James--Lijoi--Prünster (2008), PD-to-Dirichlet mean conversion.**
    L. F. James, A. Lijoi and I. Prünster, “Distributions of linear
    functionals of two parameter Poisson--Dirichlet random measures,”
    *Annals of Applied Probability* **18** (2008), 521--551,
    [DOI 10.1214/07-AAP462](https://doi.org/10.1214/07-AAP462).
    Checked [arXiv:math/0609488v4](https://arxiv.org/pdf/math/0609488v4),
    31 March 2008, Theorem 2.1 and equations (13)--(14), reprint/PDF p. 8.
    The positive linear mean requires the stated fractional-moment
    integrability and a strictly positive matching order.

14. **James (2010), matched beta scaling and exponential tilting.**
    L. F. James, “Dirichlet mean identities and laws of a class of
    subordinators,” *Bernoulli* **16** (2010), 361--388,
    [DOI 10.3150/09-BEJ224](https://doi.org/10.3150/09-BEJ224).
    Checked [arXiv:1010.1639v1](https://arxiv.org/pdf/1010.1639v1),
    8 October 2010. Theorem 2.1, PDF p. 8; Theorem 3.1, PDF pp. 12--13;
    Remark 3.1, PDF p. 15, warns against unmatched gamma shapes.

15. **Sokal--Widder Stieltjes/Hausdorff criterion.** A. D. Sokal,
    “Real-variables characterization of generalized Stieltjes functions,”
    *Expositiones Mathematicae* **28** (2010), 179--185,
    [DOI 10.1016/j.exmath.2009.06.004](https://doi.org/10.1016/j.exmath.2009.06.004).
    Checked [arXiv:0902.0065v2](https://arxiv.org/pdf/0902.0065v2),
    6 May 2009. Theorem 1, pp. 2--3, records Widder's characterization;
    equations (13)--(16), pp. 5--6, give the Hausdorff formulation.
    [Project derivation for exponentially tilted cumulants](../notes/sokal-stieltjes-hausdorff-criterion.md)
    distinguishes this all-order criterion from finite numerical tests.

## Primary interfaces checked in the closure/tangent pass

16. **Bondesson (1992), widened multiplication and exponential peeling.**
    *Generalized Gamma Convolutions and Related Classes of Distributions
    and Densities*, Lecture Notes in Statistics 76, Springer,
    DOI 10.1007/978-1-4612-2948-3; [local book](../literature/Bondesson.pdf).
    Section 3.5, printed p. 46 (PDF p. 55), includes widened GGC cdf
    densities. Theorem 5.4.1, printed pp. 81--82 (PDF pp. 90--91),
    identifies decreasing HCM transforms. Theorem 6.2.4, printed
    pp. 94--95 (PDF pp. 103--104), explicitly includes widened measures;
    Theorem 6.2.7, printed pp. 96--97 (PDF pp. 105--106), uses that
    extension in the exponential induction. Theorem 6.2.6, printed p. 96,
    covers powers of shifted gamma variables. These are the sourced
    inputs to WIP-7.1--7.4, not newly discovered closure theorems.
    [Detailed audit](../notes/bondesson-1992-ggc-hcm-foundational-infrastructure.md).

17. **NIST DLMF, Gauss connection for the positive complement.**
    [Equation 15.8.2](https://dlmf.nist.gov/15.8.E2), with the
    normalized hypergeometric function from
    [15.2.2](https://dlmf.nist.gov/15.2.E2) and Euler integral
    [15.6.1](https://dlmf.nist.gov/15.6.E1), checked 2026-09-05.
    WIP-5.44 gives the parameter substitution, ordinary-function gamma
    coefficients and nonresonance/branch conditions. Its independent
    beta integration-by-parts/ODE proof does not assume the connection.

18. **NIST DLMF, Bessel inputs to the HCM-density obstruction.**
    [10.32.2](https://dlmf.nist.gov/10.32.E2) is the beta integral for
    the modified Bessel function; [10.27.6](https://dlmf.nist.gov/10.27.E6)
    relates it to the ordinary Bessel function; [Section 10.21(i)](https://dlmf.nist.gov/10.21.i)
    supplies positive real zeros. Checked 2026-09-05. WIP-7.6 combines
    these with the zero-free canonical HCM representation in Bondesson
    (1992), Theorems 5.3.1--5.3.4, printed pp. 79--81, already audited
    in the foundational note. This excludes an HCM-density invariant,
    not GGC membership.

WIP-6.6--6.10 are direct project deductions from the gamma--Dirichlet
identity, elementary rational partial fractions and the finite-Thorin-mass
representation above. No unverified stochastic-generator or cone-invariance
theorem is invoked to turn their positive tangent into a finite-time flow.

## Finite-Thorin and log-rate evolution interfaces

19. **Dunkl et al. (2015), the four-half-gamma Dirichlet mean density.**
    C. F. Dunkl, P. Gawron, L. Pawela, Z. Puchala and K. Zyczkowski,
    *Real numerical shadow and generalized B-splines*, Linear Algebra
    and its Applications **479** (2015), 12--51,
    DOI 10.1016/j.laa.2015.03.029. Checked
    [arXiv:1409.4941v1](https://arxiv.org/pdf/1409.4941v1),
    preprint p. 22, Section 5.3, equations (79)--(82).
    This is the known plateau/quartic-integral density input to
    [WIP-5.47](18-four-rate-balanced-phase.md#wip-5-47),
    not a new density formula claimed by the project.

20. **James (2005), gamma--Dirichlet and posterior identities.**
    L. F. James, *Functionals of Dirichlet processes, the
    Cifarelli--Regazzini identity and Beta-Gamma processes*, Annals of
    Statistics **33** (2005), 647--660,
    [DOI 10.1214/009053604000001237](https://doi.org/10.1214/009053604000001237).
    Checked [arXiv:math/0505606v1](https://arxiv.org/pdf/math/0505606v1),
    Section 1, reprint p. 2, equations (1)--(3), and Section 2,
    reprint pp. 4--5, posterior paragraph and equation (8).
    [WIP-6.11--6.15](19-finite-thorin-compensated-power-tangent.md)
    and [WIP-6.16](20-finite-thorin-positive-steps.md#wip-6-16)
    give the exact versions used, including non-atomic or mixed base
    measures and the one-observation posterior; finite-partition
    posterior calculations are also written explicitly.

21. **Schilling--Song--Vondracek (2010), unique bounded phases.**
    *Bernstein Functions: Theory and Applications*, de Gruyter,
    **2010 edition**, [local primary text](../literature/SSV.pdf).
    Theorem 6.10, printed pp. 58--59 / PDF pp. 71--72, gives the
    exponential representation and its uniqueness; Theorem 7.3,
    printed p. 63 / PDF p. 76, gives Stieltjes/CBF reciprocal duality.
    Remark 6.11, printed p. 60 / PDF p. 73, imposes an extra condition
    for anchoring at zero, which is not used in the anchor-one proof.
    These primary pages were read again in the full evolution audit
    on 2026-09-05. The phase selection and weak-star convergence
    arguments are provided in WIP-6.11 and WIP-6.18.

22. **Sethuraman (1994), constructive Dirichlet probabilities.**
    J. Sethuraman, *A Constructive Definition of Dirichlet Priors*,
    Statistica Sinica **4** (1994), 639--650.
    Section 2, pp. 642--643, equation (2.1), and Theorem 3.4, p. 645.
    [Publisher's original](https://www3.stat.sinica.edu.tw/statistica/oldpdf/A4n216.pdf);
    [primary-text university mirror](https://www.cs.princeton.edu/courses/archive/fall07/cos597C/readings/Sethuraman1994.pdf).
    Relevant primary-text indexed excerpts were checked; the
    publisher's image-only PDF was not successfully rendered here.
    WIP-6.18 also proves the finite-partition property directly and
    supplies the particular almost-sure coupling used in the
    generator-continuity argument. No nonatomicity assumption is used.

23. **NIST DLMF, constants in the universal log-rate bound.**
    [5.4.12](https://dlmf.nist.gov/5.4.E12),
    psi(1) = minus Euler's constant, and
    [25.6.1](https://dlmf.nist.gov/25.6.E1), zeta(2) = pi squared / 6.
    WIP-6.17 supplies the beta logarithmic moment, correction-kernel
    integrals and Levy second-moment calculation; these two classical
    values only express their constants in familiar notation.

The positive Euler construction in WIP-6.19 is a project proof with
explicit transition probabilities, moment recursion, compactness and
consistency estimates. It does not appeal to an unsourced nonlinear
semigroup-generation theorem or infer finite-time positivity from the
positive minimum property alone.
