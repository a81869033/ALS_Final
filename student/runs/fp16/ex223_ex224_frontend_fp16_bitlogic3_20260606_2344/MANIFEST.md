# ex223_ex224_frontend_fp16_bitlogic3_20260606_2344

Run ID: `ex223_ex224_frontend_fp16_bitlogic3_20260606_2344`

Purpose: targeted per-output-bit run-cover hybrids for FP16 `log`/`log2`,
after earlier semantic fixed-point and broad structural attempts failed to
improve ADP.

Inputs:
- Truth files: `benchmarks/ex223.truth`, `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log_bitrun_hybrid.py`
- Baseline evidence: `sign_exp_mant_case` from
  `student/runs/fp16/ex220_ex224_frontend_fp16_semantic_20260606_2050/`

Artifacts:
- Work directory: `student/work/ex223_ex224_frontend_fp16_bitlogic3_20260606_2344/`
- Candidates CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_bitlogic3_20260606_2344/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_bitlogic3_20260606_2344/results/best.csv`
- Summary CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_bitlogic3_20260606_2344/results/summary.csv`
- Evaluate check CSV: `student/runs/fp16/ex223_ex224_frontend_fp16_bitlogic3_20260606_2344/results/evaluate_check.csv`

Methods tried:
- Hand `casez` sign-bit cover.
- Boolean/comparator sign-bit formulas.
- Single output-bit run-cover replacements for bits14 through 8.
- Multi-bit high-bit replacement groups.

Best result:
- `ex223`: `casez_sign`, `11189/22/246158`, equivalent; official
  `evaluate.py` recheck OK.
- `ex224`: best within this run was `bitrun_bit11_t8`, `6289/21/132069`;
  later superseded by `casez_sign_bits11_12_t8`.

Notes:
- `ex223` improved from `256772` to `246158` ADP by replacing only output sign.
- Single-bit replacements below bit14 mostly lost; broad high-bit replacement
  groups lost because they increased mux/range-tree cost.
