# SD-era material migration into the GGC project

Date: **2026-09-06**.
Status: **migration and user-authorized directory removal complete**.

This is a maintenance record, not a new mathematical or primary-source
audit. It maps the old material to its active home without adding inputs
to the log-rate theorem or to the Lean axiom whitelist.
Return to [CurrentGoal](../../CurrentGoal.md) or the [ledger map](../README.md).

## 1. Retention map

| Material from the earlier dossier | Active destination | What is retained |
|---|---|---|
| Gamma-ratio identity; legacy K1 | [BP-1](../../notes/beta-prime-power-boundary.md#bp-1) | parameter conventions, independence, exact source equations |
| Reciprocal and conjugate-index duality; legacy N1 | [BP-1](../../notes/beta-prime-power-boundary.md#bp-1) | identities and density-change verification |
| Positive/negative power densities | [beta-prime boundary, Section 2](../../notes/beta-prime-power-boundary.md#2-densities-of-the-powers) | normalizing constants and parameter range |
| HCM input and exact GGC threshold; legacy K2--K3 / N2 | [BP-2](../../notes/beta-prime-power-boundary.md#bp-2) | proof on the alpha-Cauchy parameter line, precise Bondesson inputs, mass identification and curvature obstruction |
| Failure of root closure; legacy N3 | [BP-3](../../notes/beta-prime-power-boundary.md#bp-3) | consequence and its separation from the q >= 1 theorem |
| General class/power safeguards | [class-and-power note](../../notes/classes-and-power-closure.md) | one-way implications, distinction of operations, historical versus project status |
| Positive-law Volterra / SD tools; legacy N4 | [Sato Volterra note](../../notes/sato-id-volterra-size-bias-ggc.md) and [AS19 positive-law criterion](../../notes/rocha-arteaga-sato-2019-id-sd-levy-processes.md#as19-positive-sd) | existing precise Volterra account plus retained Bernstein/BDLP criterion; no second literal copy of the old compressed N4 |
| General Rocha-Arteaga--Sato audit | [AS19 note](../../notes/rocha-arteaga-sato-2019-id-sd-levy-processes.md) | ID/SD and Urbanik classes, OU/BDLP, selfsimilarity, subordination, theorem cards, proof templates, errata and integrability qualifications |
| Thorin stochastic-integral context | AS19 Section 4.7 and Section 12 | literature map and explicit limits as deterministic-power machinery |
| Yano--Yano--Yor primary PDF | [literature copy](../../literature/Yano-Yano-Yor-2009-stable-hitting-times.pdf) | byte-identical primary source for BP-1 |
| Rocha-Arteaga--Sato primary PDF | [literature copy](../../literature/Rocha-Arteaga-Sato-2019-ID-SD-Levy-processes.pdf) | byte-identical source for the migrated audit |
| General GGC references in the old literature README | [reference map](../references.md), entries 6--11 | already present: DLMF, Martin--Kearney, Sjodin 2021, Leonov--Shiryaev, Cifarelli--Regazzini/Lijoi--Prunster, Dyachenko--Karp; no duplicate source ledger added |
| Bibliographic references behind class/beta-prime examples | class-and-power and BP source maps | Bosch, Bosch--Simon, Diedhiou and the Ferreira--Simon spectral-representation lead, without importing a new theorem |
| Author information and SD writing-style precedent | existing [GGC manuscript](../../manuscript/ggc-power-closure.tex) | already self-contained; no further manuscript edit needed |
| General Lean engineering safeguards | existing [GGC blueprint](../../formalization/README.md) and [axiom boundary](../../formalization/axiom-boundary.md) | the current policy remains authoritative; the old SD plan's different external-axiom policy is not imported |

The BP note retains the old mathematical claims, adding the exact
Theorems 4.1.1 / 4.1.4 locators and making their existing mass/curvature
argument explicit. This is neither a new classification claim nor an
independent re-audit of the old result.

The AS19 note retains the general source audit and its original
2026-09-04 audit date. Its old SD-specific Section 8 is replaced by the
general positive-law part (former Section 8.4); the SD-only conclusion is
replaced by the GGC relevance boundary. General theorem statements and
the detailed audit qualifications remain intact.

## 2. Records that belong only to the historical SD investigation

The two SD manuscripts and their bibliographies, the Jensen--Fourier proof,
SD-specific reductions and local expansions (legacy N5--N10), hitting-time
corollary, SD open questions and SD Lean blueprint are not prerequisites
for the current GGC proof. They are not rewritten as GGC lemmas.

The Wang ECP proof and Jurek--Vervaat PDF remain SD-specific source assets.
They are not needed as local inputs to the active GGC manuscript; the
general source map for OU/BDLP is retained in the AS19 audit.

Immediately before deletion, all 18 tracked files of the old directory were
checked against
`snapshot-2026-09-06-pre-cleanup` at commit
`527a78a3616fbd7c40dab83f549a94e95dd81a54`, with no difference.
They remain recoverable from that history after working-tree removal.
No Git history or archive tag was erased.

[Complete SD archive](https://github.com/vtejdn/generalized-gamma-convolution-power-problem/blob/527a78a3616fbd7c40dab83f549a94e95dd81a54/background/alpha-cauchy-sd/README.md).

## 3. References updated now

The active README, notes index, literature index and Bondesson 2015 note
no longer require local files in the SD directory. Six former local links
are replaced with the corresponding migrated content or a fixed-commit
historical reference. The three remaining obsolete checkpoint links were
subsequently deleted at the user's explicit request, as recorded below.

The Bondesson note retains its Section 12 equation numbers, source
provenance and the distinction between paper results and project examples.
Its historical `[OPEN-2015]` labels and external-proof audit are not
rewritten to imply that Bondesson (2015) proved a later project result.
The class table now distinguishes the 2015 conjecture from the current
project assessment instead of retaining an unqualified “open in general.”

## 4. Final user decision and executed removal

On 2026-09-06 the user explicitly instructed removal of the three obsolete
links and deletion of the entire `background/` directory. This supersedes
the earlier suggestion to retarget the links or preserve generated PDFs.

### A. Historical checkpoint: remove three source-list entries

In [2026-09-06-status-before-cleanup.md](2026-09-06-status-before-cleanup.md),
the three former source-list entries at lines 804--806 were removed:

- the beta-prime reduction in the old SD notes;
- the old SD lemma/conjecture ledger;
- the completed SD case-study README.

Their needed GGC content is already covered by the retention map above.
The checkpoint preface now records the user-authorized omission.
Historical path descriptions and theorem/route-history statements are
unchanged: they describe the old tree, not live local dependencies.
The complete original source list remains in the named commit/tag.

### B. Entire local directory, including ignored generated files

Removed exactly
`G:\AI\GitHub\generalized-gamma-convolution-power-problem\background`:

- **18 tracked files**, unchanged from the pre-cleanup tag before deletion;
- **16 ignored build products**, including both generated SD PDFs;
- no additional untracked files were present.

The removed files occupied 4,665,910 bytes in total.
The ignored products were not separately copied and are not recoverable
from Git. Their TeX/BibTeX sources remain in the archive; rebuilding does
not guarantee identical PDF bytes.

The SD-specific `.gitignore` rules were removed only after the directory
was deleted. Shared PDF copies and migrated notes remain in the main
project. The deletion is a local working-tree change, not a history rewrite.

## 5. Verification and handoff boundary

Before deletion, the exact resolved target was checked to be the named
repository subdirectory. It and its contents contained no reparse points.
The 34-file inventory, absence of extra untracked files, archive-tag target
and tracked-source equality were checked again immediately before removal.

Both migrated PDFs were SHA-256 checked against their originals; full hashes
are recorded in [literature/README.md](../../literature/README.md).
The earlier migration pass checked 191 local links and retained the AS19
note's 91 displayed formulas and detailed Section 11 audit unchanged.

Post-removal checks cover local links/anchors, protected-file hashes,
the precise deletion set and `git diff --check`.
All 742 local Markdown links across 54 remaining Markdown files passed
target/anchor checks (excluding mathematical notation and fenced code).
No local link points into the removed directory. The 18 tracked deletions
are all within that directory; all 84 other inventoried files outside the
seven authorized documentation/configuration edits are unchanged.
The mathematical body of the historical checkpoint is unchanged apart
from the three removed source-list entries; the header discloses the edit.

No GGC proof module, manuscript, WIP result index, computation script or
Lean blueprint is edited by this removal. No compilation, certificate
execution, commit or push is included.
