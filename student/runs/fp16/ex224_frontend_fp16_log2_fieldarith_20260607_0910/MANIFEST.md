# ex224_frontend_fp16_log2_fieldarith_20260607_0910

Run ID: `ex224_frontend_fp16_log2_fieldarith_20260607_0910`

Purpose: Test a shallow-looking semantic normalizer that rewrites
`base +/- correction` as 10/11-bit `{out_exp,out_mant}` carry/borrow logic.

Inputs:
- Truth file: `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log2_cluster_semantic.py`

Artifacts:
- Work directory: `student/work/ex224_frontend_fp16_log2_fieldarith_20260607_0910/`
- Candidates CSV: `student/runs/fp16/ex224_frontend_fp16_log2_fieldarith_20260607_0910/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex224_frontend_fp16_log2_fieldarith_20260607_0910/results/best.csv`
- Summary CSV: `student/runs/fp16/ex224_frontend_fp16_log2_fieldarith_20260607_0910/results/summary.csv`

Best result:
- `semantic_clustered_fieldarith`: `5009/38/190342`, equivalent.

Notes:
- The field-arithmetic rewrite is exact but synthesizes to a deeper critical
  path than the previous clustered semantic forms.

