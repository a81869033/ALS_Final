# ex223_ex225_frontend_fp16_log_nested_followup4_20260607_2129

Run ID: `ex223_ex225_frontend_fp16_log_nested_followup4_20260607_2129`

Purpose: find the endpoint of the nested low-table expansion for ex223/ex224/ex225.

Inputs:
- Truth files: `benchmarks/ex223.truth`, `benchmarks/ex224.truth`, `benchmarks/ex225.truth`
- Generator: `student/generators/fp16_log_nested_semantic.py`

Artifacts:
- Work directory: `student/work/ex223_ex225_frontend_fp16_log_nested_followup4_20260607_2129/`
- Candidates CSV: `student/runs/fp16/ex223_ex225_frontend_fp16_log_nested_followup4_20260607_2129/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex223_ex225_frontend_fp16_log_nested_followup4_20260607_2129/results/best.csv`

Methods tried:
- Specs: low12/hi5, low12/hi6, low13/hi5, low13/hi6.
- Flow: `abc_g_aig`.

Best result:
- ex223: `10754/19/204326`, slightly worse than followup3.
- ex224: `6014/16/96224`.
- ex225: `11533/19/219127`.

Notes:
- ex224 and ex225 bests from this run are kept in the curated current seed bundle.
