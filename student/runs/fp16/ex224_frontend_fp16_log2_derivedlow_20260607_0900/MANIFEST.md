# ex224_frontend_fp16_log2_derivedlow_20260607_0900

Run ID: `ex224_frontend_fp16_log2_derivedlow_20260607_0900`

Purpose: Test whether the low-area derived-patch semantic normalizer helps
when used only for low output bits in the current `ex224` hybrid.

Inputs:
- Truth file: `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log2_cluster_semantic.py`

Artifacts:
- Work directory: `student/work/ex224_frontend_fp16_log2_derivedlow_20260607_0900/`
- Candidates CSV: `student/runs/fp16/ex224_frontend_fp16_log2_derivedlow_20260607_0900/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex224_frontend_fp16_log2_derivedlow_20260607_0900/results/best.csv`
- Summary CSV: `student/runs/fp16/ex224_frontend_fp16_log2_derivedlow_20260607_0900/results/summary.csv`

Best result:
- `derived_cluster_hybrid_low6`: `4514/31/139934`, equivalent.

Notes:
- Area drops, but delay remains too high for ADP improvement.

