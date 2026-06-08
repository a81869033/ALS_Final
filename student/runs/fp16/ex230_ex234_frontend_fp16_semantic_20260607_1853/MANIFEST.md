# ex230_ex234_frontend_fp16_semantic_20260607_1853

Purpose: Metadata and semantic diagnosis for FP16 ex230-ex234 before source
rewrites.

Work directory:
- `student/work/ex230_ex234_frontend_fp16_semantic_20260607_1853/`

Results:
- `student/runs/fp16/ex230_ex234_frontend_fp16_semantic_20260607_1853/results/diagnosis.csv`
- `student/runs/fp16/ex230_ex234_frontend_fp16_semantic_20260607_1853/results/semantic_check.csv`

Summary:
- `ex231`, `ex232`, `ex233`, and `ex234` exact-match the Python semantic
  models for reciprocal, square, sqrt, and reciprocal-square under
  DAZ/FTZ/RNE/canonical-NaN assumptions.
- `ex230` is sigmoid-family, but direct Python sigmoid rounding did not
  exact-match the truth table; first mismatch recorded at input `0x1a00`.
- This run produced diagnosis only; curated seeds are kept in
  `student/seeds/fp16/ex230_ex234_frontend_fp16_current_20260607_1853/`.
