# ex223_ex225_frontend_fp16_log_nested_followup2_20260607_2118

Run ID: `ex223_ex225_frontend_fp16_log_nested_followup2_20260607_2118`

Purpose: test whether extending the nested low table to output bit9 improves the log-family candidates.

Inputs:
- Truth files: `benchmarks/ex223.truth`, `benchmarks/ex224.truth`, `benchmarks/ex225.truth`
- Generator: `student/generators/fp16_log_nested_semantic.py`

Artifacts:
- Work directory: `student/work/ex223_ex225_frontend_fp16_log_nested_followup2_20260607_2118/`
- Candidates CSV: `student/runs/fp16/ex223_ex225_frontend_fp16_log_nested_followup2_20260607_2118/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex223_ex225_frontend_fp16_log_nested_followup2_20260607_2118/results/best.csv`

Methods tried:
- Specs: low10/hi4, low10/hi5, low10/hi6, low9/hi4.
- Flow: `abc_g_aig`.

Best result:
- ex223: `10800/19/205200`.
- ex224: `6041/17/102697`.
- ex225: `11583/19/220077`.

Notes:
- Superseded by later follow-up runs and the curated current seed bundle.
