# Primary-interface audit for the log-rate power proof

Primary pages checked: **2026-09-05**; official errata and source
interface audit updated **2026-09-06**. This note records source evidence, not the
project's new evolution proof. Read it with
[the full proof assembly](../ledger/23-power-theorem-assembly-audit.md)
and [the source map](../ledger/references.md).

## James (2005): gamma--Dirichlet and posterior identities

L. F. James, *Functionals of Dirichlet processes, the
Cifarelli--Regazzini identity and Beta-Gamma processes*, Annals of
Statistics **33** (2005), 647--660,
[DOI 10.1214/009053604000001237](https://doi.org/10.1214/009053604000001237).
The version actually reread was
[arXiv:math/0505606v1](https://arxiv.org/pdf/math/0505606v1),
PDF/reprint pp. 1--5.

**[SOURCE CHECK PASSED]** Page 2 gives normalization of the gamma
process, independence of total mass and normalized Dirichlet process,
the logarithmic integrability condition (1), and the Markov--Krein
identity (2)--(3). Page 4 gives the posterior with base measure
augmented by the observed point masses. The nonatomic restriction on
page 5 belongs to a particular partition factorization, not to this
posterior identity; the page also treats discrete bases, and (8) is
stated without that restriction. Thus the one-observation formula used
in WIP-6.16 applies to atomic, nonatomic and mixed finite bases.

**[LOCAL SCOPE]** The posterior is \(DP(U+\delta_b)\), whereas the
digamma constant in the original power tangent remains \(\psi(B+1)\)
for \(B=|U|\). The posterior formula does not authorize changing
that original parameter. WIP-6.16 includes its finite-partition proof.

## Schilling--Song--Vondracek (2010): unique bounded phases

R. L. Schilling, R. Song and Z. Vondracek, *Bernstein Functions:
Theory and Applications*, de Gruyter, **2010 edition**.
The actual local primary file reread was
[SSV.pdf](../literature/SSV.pdf), PDF pp. 71--73 and 76,
corresponding to printed pp. 58--60 and 63.

**[SOURCE CHECK PASSED]** Theorem 6.10 gives the exponential
representation with a measurable phase in \([0,1]\), together with
uniqueness, understood modulo Lebesgue-null sets. Theorem 7.3 gives
the reciprocal relation between nonzero Stieltjes and nonzero complete
Bernstein functions. The resolvent mean in WIP-6.11 is strictly
positive and satisfies the nonzero requirement. Remark 6.11 adds an
endpoint condition for a zero-anchored formula; the present proof
anchors at one and does not import that additional conclusion.

**[LOCAL SCOPE]** WIP-6.18 uses weak-star convergence of phases
against integrable kernels. It does not assert convergence at every
boundary point. The normalization constant is fixed by the value at
one before using phase uniqueness.

### First-edition official corrections, rechecked 2026-09-06

The authors' [official first-edition corrections](https://www.motapa.de/bernstein_functions/misprints-ssv.pdf),
dated **1 December 2022**, were read directly on 2026-09-06, including
the relevant entries on PDF p. 2. The edition is explicitly the
2010 first edition, ISBN 978-3-11-021530-4, not the 2012 second edition.

- **Printed p. 59, proof of Theorem 6.10:** the intermediate
  Herglotz measure \(\rho'\) is on \([0,\infty)\) with
  \(\rho'([0,\infty))<\infty\). The uncorrected text instead
  printed \((0,\infty)\) and only a finite-tail condition.
  This correction concerns the intermediate measure in the proof.
  It does not change the theorem's exponential representation with
  a bounded phase density, or its uniqueness modulo null sets.
- **Printed p. 60, Remark 6.11:** the displayed equality
  \(\mathrm{CBF}\cap\{f:f(0+)>0\}=e^{\mathbb R+\mathrm{CBF}}\)
  must be a containment \(\subset\). Its right-hand equality
  \(e^{\mathbb R+\mathrm{CBF}}=(0,\infty)\times e^{\mathrm{CBF}}\)
  is unchanged. We do not use the incorrect reverse inclusion.

The current argument applies Theorem 7.3 to the nonzero Stieltjes
function \(M_P\), then subtracts Theorem 6.10 at \(s\) and at \(1\).
This anchor-one difference has an absolutely integrable kernel,
without an assumption on \(M_P(0+)\). It neither invokes the
zero-anchored extension of Remark 6.11 nor uses its uncorrected
equality. The two corrections above therefore do not alter the
current bounded-phase interface. This source record explicitly identifies
the first edition and links these official corrections.

## Bondesson (1992): the final weak approximation

L. Bondesson, *Generalized Gamma Convolutions and Related Classes of
Distributions and Densities*, Lecture Notes in Statistics 76, Springer,
[DOI 10.1007/978-1-4612-2948-3](https://doi.org/10.1007/978-1-4612-2948-3).
The actual local primary file reread was
[Bondesson.pdf](../literature/Bondesson.pdf), PDF pp. 38, 43--44,
corresponding to printed pp. 29, 34--35.

**[SOURCE CHECK PASSED]** The definition is on printed p. 29.
Theorem 3.1.5 on p. 34 requires the weak limit to be a non-defective
probability law. The final paragraph on p. 35 explicitly permits
approximation of every GGC by zero-drift laws with finite atomic
Thorin measures. This includes target drift and infinite Thorin mass;
it supplies precisely the finite-gamma density used in WIP-0.1.

**[LOCAL SCOPE]** In the power-proof assembly the weak limit is the
actual law of \(X^q\), so it is a probability, not a defective
transform. Using the theorem in the converse canonical-measure
direction would require its additional no-mass-at-zero condition;
that converse is not silently being invoked here.

## Audit conclusion

The three source interfaces used in the full project proof have
passed direct primary-text reinspection. The positive logarithmic
Euler evolution and its dynamic identification are separate project
proofs; none of these sources already asserts that construction.
Source verification alone does not replace auditing those derivations
or the final assembly. Publication, external peer review and formal
verification are not claimed.
