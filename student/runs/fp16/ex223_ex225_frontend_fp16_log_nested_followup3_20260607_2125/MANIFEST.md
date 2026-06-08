# ex223_ex225_frontend_fp16_log_nested_followup3_20260607_2125

Run ID: `ex223_ex225_frontend_fp16_log_nested_followup3_20260607_2125`

Purpose: test whether extending the nested low table to output bit10 improves the log-family candidates.

Inputs:
- Truth files: `benchmarks/ex223.truth`, `benchmarks/ex224.truth`, `benchmarks/ex225.truth`
- Generator: `student/generators/fp16_log_nested_semantic.py`

Artifacts:
- Work directory: `student/work/ex223_ex225_frontend_fp16_log_nested_followup3_20260607_2125/`
- Candidates CSV: `student/runs/fp16/ex223_ex225_frontend_fp16_log_nested_followup3_20260607_2125/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex223_ex225_frontend_fp16_log_nested_followup3_20260607_2125/results/best.csv`

Methods tried:
- Specs: low11/hi5, low11/hi6.
- Flow: `abc_g_aig`.

Best result:
- ex223: `10753/19/204307`.
- ex224: `6020/17/102340`.
- ex225: `11575/19/219925`.

Notes:
- ex223 best from this run is kept in the curated current seed bundle.
