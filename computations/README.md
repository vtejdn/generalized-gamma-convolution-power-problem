# Exact verification scripts

These Python 3 scripts support explicitly cited steps in the
[project progress ledger](../ledger/README.md), whose stable identifiers are
collected in [WIP.md](../WIP.md). They use only the Python standard library
and favor integer or rational arithmetic. Their outputs are certificates or
consistency checks for stated formulas; a numerical run is never substituted
for the analytic proof recorded in the ledger.

The filename prefix identifies the corresponding route in
[CurrentGoal.md](../CurrentGoal.md):

- `route1_*`: Dirichlet-mean, Abel, and \(q=3/2\) Hankel checks;
- `route2_*`: Thorin/Stieltjes splice and high-window certificates;
- `route3_*`: cumulant recurrences and Hankel determinants for squares;
- `route5_*`: beta/Faddeeva and finite-rate transport certificates.

Run an individual check from the repository root with

```text
python computations/<script-name>.py
```

Python bytecode and `__pycache__` directories are intentionally ignored.
