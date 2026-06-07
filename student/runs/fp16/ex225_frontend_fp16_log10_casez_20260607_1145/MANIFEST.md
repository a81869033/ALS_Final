# ex225_frontend_fp16_log10_casez_20260607_1145

Run ID: `ex225_frontend_fp16_log10_casez_20260607_1145`

Purpose: Limited casez run-compression check for `ex225` FP16 `log10`.

Inputs:
- Truth file: `benchmarks/ex225.truth`
- Generator/script: `student/generators/fp16_log_casez_runs.py`

Artifacts:
- Candidates CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_casez_20260607_1145/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_casez_20260607_1145/results/best.csv`
- Metadata CSV:
  `student/runs/fp16/ex225_frontend_fp16_log10_casez_20260607_1145/results/metadata.csv`

Methods tried:
- `casez_runs_t400`
- `casez_runs_t600`
- `casez_runs_t800`
- `casez_runs_t1024`

Best result:
- `casez_runs_t400`: `13234/25/330850`, exact but worse than the current best
  `11616/23/267168`.

Notes:
- Exclude broad casez run-compression for `ex225` unless a future structure
  first isolates a much smaller critical bit or field.
