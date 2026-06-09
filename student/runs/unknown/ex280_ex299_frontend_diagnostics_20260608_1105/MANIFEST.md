# ex280_ex299_frontend_diagnostics_20260608_1105

Run ID: `ex280_ex299_frontend_diagnostics_20260608_1105`

Purpose: metadata/truth diagnostics for ex280-ex299 unknown frontend reverse engineering.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex299.truth`
- Reference ADP: `reference_result.csv`
- Current project best: `student/results/current_best_by_case.csv`
- Current unknown frontend best: `student/results/unknown_candidates_current_best.csv`
- Script: `student/scripts/diagnose_unknown_truth.py`

Artifacts:
- Work directory: `student/work/ex280_ex299_frontend_diagnostics_20260608_1105`
- Results directory: `student/runs/unknown/ex280_ex299_frontend_diagnostics_20260608_1105/results`
- Summary CSV: `student/runs/unknown/ex280_ex299_frontend_diagnostics_20260608_1105/results/summary.csv`
- Bit stats CSV: `student/runs/unknown/ex280_ex299_frontend_diagnostics_20260608_1105/results/bit_stats.csv`
- Cofactor CSV: `student/runs/unknown/ex280_ex299_frontend_diagnostics_20260608_1105/results/cofactor_stats.csv`
- Pattern CSV: `student/runs/unknown/ex280_ex299_frontend_diagnostics_20260608_1105/results/pattern_stats.csv`
- Split CSV: `student/runs/unknown/ex280_ex299_frontend_diagnostics_20260608_1105/results/split_stats.csv`
- Hypotheses CSV: `student/runs/unknown/ex280_ex299_frontend_diagnostics_20260608_1105/results/hypotheses.csv`

Methods tried:
- Width, support, constant-bit, entropy, run-count, ANF-degree diagnostics.
- Input cofactor sensitivity and selected symmetry/equivariance checks.
- Arbitrary contiguous split/default statistics across rotations.
- Limited shared BDD node counts for diagnostic ordering only.

Best result:
- No new Verilog/AIG seeds in this diagnostic-only run.

Notes:
- `candidates.csv`, `best.csv`, and `evaluate_check.csv` are intentionally header-only placeholders.
- Runtime: 381.2s over 20 cases.
- No files were written to `output/`.
