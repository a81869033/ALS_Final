# ex286_ex289_frontend_lane_parity_feature_diag_20260609_1900

Run ID: `ex286_ex289_frontend_lane_parity_feature_diag_20260609_1900`

Purpose: Diagnose whether the mod-4 output lane parity coordinates found by
output-linear ANF can be expressed using cheaper semantic feature sets.

Inputs:
- Cases: `ex286,ex287,ex288,ex289`
- Truth files: `benchmarks/<case>.truth`
- Script: `student/generators/unknown_lane_parity_feature_diag.py`

Artifacts:
- Work directory: `student/work/ex286_ex289_frontend_lane_parity_feature_diag_20260609_1900`
- Results directory: `student/runs/unknown/ex286_ex289_frontend_lane_parity_feature_diag_20260609_1900/results`
- Results: `results/summary.csv`

Methods tried:
- Feature sets: `input_lane_parity,home_lane_parity,home_lane_count_bits,raw_pair_signals,bucket_count_bits,bucket_count_bits_selectors`
- Monomial degrees: `1,2`

Notes:
- Diagnostic only; no Verilog/AIG candidates emitted.
- `student/seeds` and `output/` are intentionally untouched.
