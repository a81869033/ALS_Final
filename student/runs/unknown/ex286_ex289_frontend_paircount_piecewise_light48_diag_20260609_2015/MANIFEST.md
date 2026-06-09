# ex286_ex289_frontend_paircount_piecewise_light48_diag_20260609_2015

Diagnostic-only piecewise/min-max search for output adjacent-pair counts.

Purpose: test whether pair-count fields can be compact comparator/min/max/clamp logic over input bucket counts and selector features.

Inputs:
- Cases: `ex286,ex287,ex288,ex289`
- Tree depth: `4`
- Script: `student/generators/unknown_paircount_piecewise_diag.py`

Artifacts:
- `results/paircount_piecewise_diagnostics.csv`
- Empty frontend CSVs: `results/summary.csv`, `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Notes:
- No exact compact piecewise pair-count formula found; no Verilog/AIG candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
