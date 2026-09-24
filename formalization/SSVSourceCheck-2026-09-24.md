# SSV source preparation and construction self-check

Date: 2026-09-24. Task: S1-SOURCE, Blueprint Section 16.

**Independent acceptance update:** S1-SOURCE is closed after the designer’s
fresh page/errata review; see [ConstructionReport Section 34](ConstructionReport.md#e2-design-acceptance-2026-09-24).
The following preserves the constructor’s original evidence submission.

**Construction self-check completed; independent verification and acceptance
were pending at submission.** The specified local first-edition pages were read as rendered
page images, and the full statements were compared with
`GGC.External.SSV.phase_representation`. No unsupported hypothesis omission,
sign reversal, branch change, or stronger uniqueness conclusion was found in
that interface. This is the constructor's evidence submission, not an update to
the auditor-owned `SemanticAudit-2026-09-24.md` or a design acceptance decision.
E-S1 remains a registered external assumption.

## 1. Source identity and reproducible page mapping

- Repository entry: [literature/pdf/SSV.pdf](../literature/pdf/SSV.pdf).
- `literature/pdf` is a directory junction to
  `E:\AI\GitHub\literature\ggcpp`; the resolved file is
  `E:\AI\GitHub\literature\ggcpp\SSV.pdf`.
- Size: **1,865,683 bytes**; PDF length: **328 pages**.
- SHA256:
  `8A06BBC186F355C3A4475DAB588F65FE41E5E5552794D2C896A41BCA1CD36702`.
- The title page names Rene L. Schilling, Renming Song and Zoran Vondracek,
  *Bernstein Functions: Theory and Applications*, De Gruyter. The copyright
  page gives **2010** and **ISBN 978-3-11-021530-4**. These identify the first
  edition when compared with the edition and ISBN in the authors' official
  first-edition errata. This check uses the printed pages, not the PDF's later
  modification timestamp.

All PDF page numbers below are **one-based physical PDF page positions**.
The corresponding zero-based index for a PDF library is one less.

| Printed location | PDF page | Material inspected visually |
|---|---:|---|
| Unnumbered title page | 4 | Title, authors and publisher |
| Unnumbered copyright page | 5 | Copyright year 2010 and ISBN |
| 11 | 24 | Definition 2.1 and Stieltjes-transform integrability |
| 58 | 71 | Complete statement of Theorem 6.10, equation (6.10) |
| 59 | 72 | Converse, measurable phase, uniqueness statement, complete proof and principal logarithm |
| 60 | 73 | Remark 6.11, zero-anchor condition, and adjacent Comments 6.12 |
| 63 | 76 | Complete statement and proof of Theorem 7.3, including the nonzero qualification |

Thus the previously recorded mapping, printed pp.58-60 and 63 to PDF pp.71-73
and 76, is correct for this exact local copy. The page headers and complete
theorem passages are legible in the renders; the review did not rely on the
imperfect formula text extraction.

The official [first-edition errata](https://www.motapa.de/bernstein_functions/misprints-ssv.pdf)
were retrieved on 2026-09-24. The document is dated **December 1, 2022**, has
three pages, and identifies the same 2010 edition and ISBN on its first page.
Its second page was also rendered and inspected visually. Retrieved file:
163,098 bytes, SHA256
`8B1A84D42F825BA4F6DC4EADF6C1EDEC9703D386E1F53ECA912A003328EB4A7C`.

## 2. Hypotheses and the source-derived specialization

Write

\[
M(s)=\int_{(0,\infty)}\frac{1}{s+b}\,P(db),\qquad s>0,
\]

where `P : ProbabilityMeasure {b : ℝ // 0 < b}` is exactly the input of
E-S1. In Definition 2.1, use the measure induced by `P` on positive rates,
with both the constant term and the coefficient of `1/s` equal to zero.
The definition's required integral of `(1+b)⁻¹` is finite because `P` has
mass one and the integrand lies in `(0,1)`. For every `s>0`,
`0 < M(s) ≤ 1/s`. Consequently `M` is a nonzero Stieltjes function.

Theorem 7.3 explicitly concerns nonzero functions and gives the reciprocal
correspondence with nonzero complete Bernstein functions. It therefore applies
to `f=1/M`. Theorem 6.10 gives a real constant `γ` and a measurable phase
`η:(0,∞)→[0,1]` such that

\[
\log f(s)=\gamma+\int_0^\infty
  \eta(t)\left(\frac{t}{1+t^2}-\frac1{s+t}\right)dt.
\]

The application is strictly positive, so no assertion about representing the
identically zero function by an exponential is needed. The converse in
Theorem 6.10 is also available, but is not used to manufacture additional
project conclusions.

Negating this identity and subtracting the value at `s=1` gives exactly
`RealPhase.anchor_one`:

\[
\log M(s)-\log M(1)=\int_0^\infty
  \eta(t)\left(\frac1{s+t}-\frac1{1+t}\right)dt.
\]

The regularizing term and `γ` cancel. This is a specialization and elementary
adaptation of the source representation, not a claim that the source prints
the Lean statement verbatim.

## 3. Absolute integrability and the complex branch

For fixed `s>0`, the anchored real kernel equals
`(1-s)/((s+t)(1+t))`. It is bounded as `t` decreases to zero and has absolute
value `O(t⁻²)` as `t` tends to infinity. Multiplication by a phase in `[0,1]`
preserves integrability. This justifies `RealPhase.integrable` as genuine
absolute integrability, rather than relying on the default value of a
nonintegrable Lean integral.

For `z=x+iy` with `y>0`, the Stieltjes integral is absolutely convergent,
since `|1/(z+b)|≤1/y`. Its imaginary part is

\[
\operatorname{Im} M(z)=-\int\frac{y}{(x+b)^2+y^2}\,P(db)<0.
\]

Hence it never vanishes and has principal argument in `(-π,0)`. Its
reciprocal has principal argument in `(0,π)`, so
`Log(1/M(z))=-Log M(z)` with no additive multiple of `2πi`. The proof on
printed p.59 explicitly selects the principal logarithm and gives the
upper-half-plane representation for `log f`. Negation and subtraction at
the positive real point one yield `Phase.complex_anchor_one`, with the
real number `log M(1)` cast into `ℂ`.

The complex anchored kernel is
`(1-z)/((z+t)(1+t))`. On each bounded positive interval its denominator is
bounded away from zero using `y>0`; for sufficiently large `t`, its absolute
value is at most a constant times `t⁻²`. This gives
`Phase.complex_integrable` for every allowed `z`. Neither argument needs
`∫ b⁻¹ P(db)<∞`, a value at zero, or a finite zero-anchor logarithm.

## 4. Measurable representatives and the uniqueness quantifier

The source phase is a measurable density taking values in `[0,1]` on the
positive half-line. For Lean's function on all of `ℝ`, take a Borel measurable
version of that density, alter it on a null set if necessary so that the bounds
hold everywhere, and put it equal to zero on `(-∞,0]`. Densities admit such
Borel versions for Lebesgue measure. These choices leave every displayed
integral unchanged and supply the global `Measurable η` and pointwise `bounds`
fields. Values outside `(0,∞)` do not enter any integral or uniqueness claim.

The correspondence on printed p.59 is interpreted at the level of the
representing density modulo Lebesgue-null sets; integral representations
cannot distinguish pointwise representatives. The axiom correctly asserts
only `ζ =ᵐ[volume.restrict (Ioi 0)] η`.

In particular, its uniqueness quantifier assumes only `RealPhase P ζ`, not a
complex formula for `ζ`. This is sufficient: set

\[
\gamma_\zeta=\log f(1)-\int_0^\infty\zeta(t)
 \left(\frac{t}{1+t^2}-\frac1{1+t}\right)dt.
\]

This integral converges by the same endpoint estimates. The real anchored
identity for `ζ` then gives the original unanchored representation of the
same `f` with pair `(γ_ζ,ζ)`. The source representation's uniqueness gives
the required almost-everywhere equality. Thus the real-only premise does
not silently strengthen the source uniqueness statement.

## 5. Errata comparison

The [official errata, page 2](https://www.motapa.de/bernstein_functions/misprints-ssv.pdf)
make three corrections relevant to the inspected pages:

| Source location | Correction | Effect on this specialization |
|---|---|---|
| p.59, intermediate measure in the proof of Theorem 6.10 | The intermediate Herglotz measure is a finite measure on `[0,∞)`, not merely a measure on `(0,∞)` finite on `[1,∞)`. | Use the corrected measure statement. E-S1 does not expose the intermediate measure; its final bounded density is integrated on `(0,∞)`. |
| p.60, displayed class relation of Remark 6.11 | The first equality becomes an inclusion. | Neither that reverse inclusion nor the remark's condition `f(0+)>0` is used. Anchoring at one avoids that extra condition. |
| p.60, Comments 6.12 | The classification of `k` changes from completely monotone to Bernstein. | This historical comment is not a premise or conclusion used by E-S1. |

The corrections do not change the bounded-phase formula or the reciprocal
theorem used here. No pointwise boundary recovery, canonical representative,
joint parameter measurability, or varying-law continuity has been read into
these source statements; those remain local project results.

## 6. Evidence files, reproduction and acceptance boundary

Temporary text extracts, rendered images and the retrieved errata are in
`tmp/pdfs/ssv-source-check-2026-09-24/`. They are review working files; no
book-page images or book copy are introduced as new project source files by
this report. The title, copyright, theorem and supporting definition pages
can be reproduced from the recorded book hash using Poppler, for example:

```powershell
pdftoppm -f 4 -l 5 -r 130 -png literature/pdf/SSV.pdf tmp/pdfs/ssv-front
pdftoppm -f 71 -l 73 -r 120 -png literature/pdf/SSV.pdf tmp/pdfs/ssv-theorem
pdftoppm -f 76 -l 76 -r 120 -png literature/pdf/SSV.pdf tmp/pdfs/ssv-reciprocal
```

The reviewed declaration consists of `RealPhase`, `Phase`, and
`phase_representation` in [External/SSV.lean](External/SSV.lean). This source
check neither edits those declarations nor proves the imported representation
inside Lean. It addresses source identity, full hypotheses and conclusions,
the stated adaptations, and the official corrections. It does not certify
the entire book's proof of each supporting representation theorem.

No mathematical defect was found in the current E-S1 contract by this
construction self-check. The designer or independent auditor must still
verify this evidence and decide whether to close S1-SOURCE. The independently
maintained historical semantic-audit report is left unchanged.
