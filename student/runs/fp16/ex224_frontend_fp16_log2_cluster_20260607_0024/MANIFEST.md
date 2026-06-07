# ex224_frontend_fp16_log2_cluster_20260607_0024

Run ID: `ex224_frontend_fp16_log2_cluster_20260607_0024`

Purpose: test a semantic `log2` clustered-correction RTL for `ex224`, using
shared mantissa correction LUTs instead of a full sign-exp-mant table.

Inputs:
- Truth file: `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log2_cluster_semantic.py`
- Prior best: `ex224_fp16_log2_casez_sign_bits11_12_t8`

Artifacts:
- Work directory: `student/work/ex224_frontend_fp16_log2_cluster_20260607_0024/`
- Candidates CSV: `student/runs/fp16/ex224_frontend_fp16_log2_cluster_20260607_0024/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex224_frontend_fp16_log2_cluster_20260607_0024/results/best.csv`
- Summary CSV: `student/runs/fp16/ex224_frontend_fp16_log2_cluster_20260607_0024/results/summary.csv`

Methods tried:
- Exact semantic bands for positive normal inputs:
  128/256/512/1024-scale `log2(1.mant)` correction LUTs plus exp14/15
  near-one LUTs.

Best result:
- `semantic_clustered_corr`: `5173/32/165536`, equivalent.

Notes:
- Area dropped substantially, but the correction LUT plus add/sub path raised
  delay too much to improve ADP.
