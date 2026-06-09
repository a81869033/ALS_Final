# ex286_ex289_frontend_matching_lowweight_diag_20260609_1853

Run ID: `ex286_ex289_frontend_matching_lowweight_diag_20260609_1853`

Purpose: Diagnose whether ex286-ex289 are compact conservative token-routing
functions expressible as global maximum-weight token-to-slot matching learned
from one-hot and low-weight behavior.

Inputs:
- Cases: `ex286,ex287,ex288,ex289`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_matching_diag.py`

Artifacts:
- Work directory: `student/work/ex286_ex289_frontend_matching_lowweight_diag_20260609_1853`
- Results directory: `student/runs/unknown/ex286_ex289_frontend_matching_lowweight_diag_20260609_1853/results`
- Results: `results/summary.csv`

Methods tried:
- Weight matrices from two-hot rows, low-weight rows, and home-slot distance.
- Token orders: natural, reverse, home, home_reverse, symmetry-pair order.
- Tie policies: low/high output mask; output transforms identity/reverse.
- Stratified sample target: `1024`.

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
