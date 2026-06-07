# ex224_frontend_fp16_log2_cluster_hybrid_20260607_0032

Run ID: `ex224_frontend_fp16_log2_cluster_hybrid_20260607_0032`

Purpose: test whether the clustered semantic correction can be used only for
low output bits while preserving the current high-bit table/bitrun structure.

Inputs:
- Truth file: `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log2_cluster_semantic.py`
- Prior best: `ex224_fp16_log2_casez_sign_bits11_12_t8`

Artifacts:
- Work directory: `student/work/ex224_frontend_fp16_log2_cluster_hybrid_20260607_0032/`
- Candidates CSV: `student/runs/fp16/ex224_frontend_fp16_log2_cluster_hybrid_20260607_0032/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex224_frontend_fp16_log2_cluster_hybrid_20260607_0032/results/best.csv`
- Summary CSV: `student/runs/fp16/ex224_frontend_fp16_log2_cluster_hybrid_20260607_0032/results/summary.csv`

Methods tried:
- Current `casez_sign + bit11/bit12` high-bit structure.
- Low bits 0:3, 0:5, 0:7, and 0:9 selected from semantic clustered output.

Best result:
- `cluster_hybrid_low4`: `5412/25/135300`, equivalent.

Notes:
- Even low-bit-only use of the semantic correction path increased delay enough
  to lose to the current best.
