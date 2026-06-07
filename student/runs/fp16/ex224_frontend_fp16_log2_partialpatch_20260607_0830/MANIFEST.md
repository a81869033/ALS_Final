# ex224_frontend_fp16_log2_partialpatch_20260607_0830

Run ID: `ex224_frontend_fp16_log2_partialpatch_20260607_0830`

Purpose: Test partial exact derivation of `corr128`, `corr256`, and `corr512`
from `corr1024` for `ex224` FP16 `log2`.

Inputs:
- Truth file: `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log2_cluster_semantic.py`

Artifacts:
- Work directory: `student/work/ex224_frontend_fp16_log2_partialpatch_20260607_0830/`
- Candidates CSV: `student/runs/fp16/ex224_frontend_fp16_log2_partialpatch_20260607_0830/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex224_frontend_fp16_log2_partialpatch_20260607_0830/results/best.csv`
- Summary CSV: `student/runs/fp16/ex224_frontend_fp16_log2_partialpatch_20260607_0830/results/summary.csv`

Best result:
- `semantic_partial_derive128`: `4981/33/164373`, equivalent.

Notes:
- All six partial-derive candidates were exact, but delay stayed at `33` or
  worse, so none improved the current best `6250/21/131250`.

