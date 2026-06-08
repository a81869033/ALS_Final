# ex235_ex237_ex239_frontend_fp16_direct_special_20260608_0924

Run ID: `ex235_ex237_ex239_frontend_fp16_direct_special_20260608_0924`

Purpose: first direct semantic-special source test for ex235/ex237/ex239.

Inputs:
- Truth files: `benchmarks/ex235.truth`, `benchmarks/ex237.truth`, `benchmarks/ex239.truth`
- Generator: `student/generators/fp16_ex235_ex237_ex239_direct_special.py`

Artifacts:
- Work directory: `student/work/ex235_ex237_ex239_frontend_fp16_direct_special_20260608_0924/`
- Results: `student/runs/fp16/ex235_ex237_ex239_frontend_fp16_direct_special_20260608_0924/results/`

Notes:
- Established that direct semantic zero/inf/NaN guards beat wrapper special
  guards for ex235/ex237/ex239.
