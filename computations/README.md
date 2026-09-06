# Verification scripts

These standalone Python scripts support specified finite calculations in
the [project ledger](../ledger/README.md).
They use only the Python standard library, primarily integers and
`fractions.Fraction`. They are not a numerical proof of GGC power closure.

Filename prefixes `route1_*`, `route2_*`, `route3_*` and `route5_*`
refer to the **historical** routes. They do not identify current priorities
or the P1--P7 programs; see the
[archived correspondence](../ledger/checkpoints/2026-09-06-route-blueprint.md).

## Script-to-claim map

| Script | Ledger claim | Scope |
|---|---|---|
| [route1_abel_elasticity_obstruction.py](route1_abel_elasticity_obstruction.py) | [WIP-1.12](../ledger/01-route1-stable-dirichlet-and-quadratic.md#wip-1-12) | rational bounds certifying the stated Abel-elasticity obstruction |
| [route1_q32_hankel_gates.py](route1_q32_hankel_gates.py) | [WIP-1.15](../ledger/02-route1-q-three-halves-wright-bessel.md#wip-1-15) | finite exact polynomial Hankel checks |
| [route1_q32_hankel3.py](route1_q32_hankel3.py) | [WIP-1.16](../ledger/02-route1-q-three-halves-wright-bessel.md#wip-1-16) | exact \(3\times3\) formulas and endpoint certificates; also includes a numerical scan |
| [route2_halfshape_splice.py](route2_halfshape_splice.py) | [WIP-2.12](../ledger/03-route2-thorin-volterra.md#wip-2-12) | finite rational low/high-frequency splice certificate |
| [route2_pair_kernel_high_window.py](route2_pair_kernel_high_window.py) | [WIP-2.13](../ledger/03-route2-thorin-volterra.md#wip-2-13) | finite rational high-window bounds |
| [route2_halfshape_splice_kappa4.py](route2_halfshape_splice_kappa4.py) | [WIP-2.14](../ledger/03-route2-thorin-volterra.md#wip-2-14) | finite arithmetic for the \(\kappa\le4\) splice |
| [route3_halfshape_q2_hankel.py](route3_halfshape_q2_hankel.py) | [WIP-3.3](../ledger/04-route3-cumulant-stieltjes.md#wip-3-3) | finite benchmark Hankel minors |
| [route3_halfshape_q2_recurrence.py](route3_halfshape_q2_recurrence.py) | [WIP-3.4](../ledger/04-route3-cumulant-stieltjes.md#wip-3-4) | two recurrence constructions checked only through the configured order |
| [route3_general_square_hankel.py](route3_general_square_hankel.py) | [WIP-3.10](../ledger/04-route3-cumulant-stieltjes.md#wip-3-10) | four cumulant formulas and the first two Hankel gates |
| [route5_beta_faddeeva_kappa10_bernstein.py](route5_beta_faddeeva_kappa10_bernstein.py) | [WIP-5.10](../ledger/07-route5-two-rate-total-shape-one.md#wip-5-10) | rational polynomial identity and finite Bernstein-basis positivity certificate |
| [route5_three_rate_transport_certificate.py](route5_three_rate_transport_certificate.py) | [WIP-5.19](../ledger/09-route5-multirate-capacity.md#wip-5-19) | finite rational comparisons for the three-rate certificate |
| [route5_phase_capacity_transport_hierarchy.py](route5_phase_capacity_transport_hierarchy.py) | [WIP-5.20--5.23](../ledger/09-route5-multirate-capacity.md#wip-5-20) | finite identities and inequalities for transport and obstruction examples |

## Running and interpreting checks

From the repository root:

```text
python computations/<script-name>.py
```

Use Python 3.10 or newer for the type-annotation syntax used by the
scripts. Do not use `python -O`: assertions are part of the checks.
No third-party package installation is required.

Passing a script certifies only the displayed finite calculation, subject
to the ledger's analytic reduction. It does not prove all-order positivity,
a limit interchange, or the complete power theorem.
In `route1_q32_hankel3.py`, the Gauss--Chebyshev scan is explicitly
reconnaissance; its floating-point output is not an exact certificate.

Scripts retain their historical names and local arithmetic helpers so that
existing proof references and calculation conventions remain reproducible.
Before extracting shared code, capture regression baselines and check
representation and normalization compatibility.
No certificate algorithm was changed or rerun in the documentation cleanup.
Python bytecode and `__pycache__/` remain ignored.
