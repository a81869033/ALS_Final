# ex286_ex288_frontend_bucket_formula_greedy_diag_20260609_1300

Run ID: `ex286_ex288_frontend_bucket_formula_greedy_diag_20260609_1300`

Purpose: Check whether the exact bucket-count key can be decomposed into compact primitive formulas instead of table/BDD logic.

Inputs:
- Truth files: `benchmarks/ex286.truth`, `benchmarks/ex287.truth`, `benchmarks/ex288.truth`
- Script: `student/scripts/unknown_bucket_formula_diag.py`

Artifacts:
- Work directory: `student/work/ex286_ex288_frontend_bucket_formula_greedy_diag_20260609_1300/`
- Diagnostics CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_formula_greedy_diag_20260609_1300/results/bucket_formula_diagnostics.csv`
- Summary CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_formula_greedy_diag_20260609_1300/results/summary.csv`
- Candidates CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_formula_greedy_diag_20260609_1300/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_formula_greedy_diag_20260609_1300/results/best.csv`
- Evaluate check CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_formula_greedy_diag_20260609_1300/results/evaluate_check.csv`

Methods Tried:
- Primitive predicates over bucket counts, selected disambiguation bits, and pairwise count comparisons.
- Best single primitive predicate per output bit.
- Depth-4 greedy primitive decision tree per output bit.
- Full key-domain ANF statistics with invalid keys defaulting to zero.

Best Result:
- `ex286`: no exact primitive/tree bits; key-domain ANF term range `3112..12042`, max degree `15`.
- `ex287`: no exact primitive/tree bits; key-domain ANF term range `17088..29876`, max degree `16`.
- `ex288`: no exact primitive/tree bits; key-domain ANF term range `5420..24272`, max degree `16`.

Notes:
- No Verilog/AIG seed was emitted.
- This rejects shallow count/selector formula decompositions and direct key-domain ANF as large-drop structures.
