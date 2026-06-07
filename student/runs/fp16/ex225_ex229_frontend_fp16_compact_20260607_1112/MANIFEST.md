# ex225_ex229_frontend_fp16_compact_20260607_1112

Run ID: `ex225_ex229_frontend_fp16_compact_20260607_1112`

Purpose: Limited compact baseline pass for FP16 `ex225`-`ex229`, using a small
set of existing structural renderers before diagnosis-driven shell rewrites.

Inputs:
- Truth files: `benchmarks/ex225.truth` through `benchmarks/ex229.truth`
- Generator/script: `student/generators/fp16_semantic_search.py`

Artifacts:
- Candidates CSV:
  `student/runs/fp16/ex225_ex229_frontend_fp16_compact_20260607_1112/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_ex229_frontend_fp16_compact_20260607_1112/results/best.csv`
- Metadata CSV:
  `student/runs/fp16/ex225_ex229_frontend_fp16_compact_20260607_1112/results/metadata.csv`

Methods tried:
- `exp_mant_pair_case`
- `sign_exp_mant_case`
- `positive_default_exp_mant_case`
- `sign_exp_default_expr_case`
- `default_expr_exception_case`

Best result:
- No improvement over the existing current best rows.

Notes:
- This run is retained as a compact baseline and exclusion record.  The useful
  improvement came later from the targeted `ex229` saturation shell.
