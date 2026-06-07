# ex226_ex229_frontend_fp16_shells_fix_20260607_1128

Run ID: `ex226_ex229_frontend_fp16_shells_fix_20260607_1128`

Purpose: Diagnosis-driven semantic shell pass for FP16 `ex226`-`ex229`,
using lessons from `ex223`/`ex224`: no broad variant spray, only structures
supported by sign/exponent diagnostics.

Inputs:
- Truth files: `benchmarks/ex226.truth` through `benchmarks/ex229.truth`
- Generator/script: `student/generators/fp16_ex225_ex229_shells.py`
- Diagnostics:
  `student/runs/fp16/ex225_ex229_frontend_fp16_semantic_20260607_1106/results/diagnosis.csv`

Artifacts:
- Candidates CSV:
  `student/runs/fp16/ex226_ex229_frontend_fp16_shells_fix_20260607_1128/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex226_ex229_frontend_fp16_shells_fix_20260607_1128/results/best.csv`
- Summary CSV:
  `student/runs/fp16/ex226_ex229_frontend_fp16_shells_fix_20260607_1128/results/summary.csv`
- Official check:
  `student/runs/fp16/ex226_ex229_frontend_fp16_shells_fix_20260607_1128/results/evaluate_official_best.csv`

Methods tried:
- `ex226`: NaN-aware odd positive-domain table for `sin`.
- `ex227`: NaN-aware odd positive-domain table for `tan`.
- `ex228`: odd positive-domain table with `exp >= 19` direct `sinh`
  saturation to signed infinity.
- `ex229`: odd positive-domain table with `exp >= 18` direct `tanh`
  saturation to signed one.

Best result:
- `ex229`: `ex229_fp16_tanh_odd_tanh_saturation_shell`
  `4015/20/80300`, equivalent under official `evaluate.py`.

Notes:
- `ex229` improved from `3988/21/83748` to `4015/20/80300` by reducing delay.
- `ex228` synthesized to the same ADP as the existing best
  `6653/21/139713`; keep as a clearer semantic equivalent but not a new best.
- `ex226` and `ex227` were exact but worse than the existing best because the
  shell increased delay; do not repeat this exact positive-table shell without
  a new critical-bit or field-level rewrite.
