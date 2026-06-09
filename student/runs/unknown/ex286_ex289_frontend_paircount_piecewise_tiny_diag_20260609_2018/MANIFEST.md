# ex286_ex289_frontend_paircount_piecewise_tiny_diag_20260609_2018

Diagnostic-only tiny piecewise/min-max search for output adjacent-pair counts.

Purpose: bounded gate for cheap comparator/min/max/clamp pair-count formulas before any RTL generation.

Inputs:
- Cases: `ex286,ex287,ex288,ex289`
- Script: `student/generators/unknown_paircount_piecewise_tiny_diag.py`

Artifacts:
- `results/paircount_piecewise_tiny_diagnostics.csv`
- Empty frontend CSVs: `results/summary.csv`, `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Notes:
- No exact tiny piecewise pair-count formula found; no Verilog/AIG candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
