# ex223_ex225_frontend_fp16_log_nested_followup_20260607_2110

Run ID: `ex223_ex225_frontend_fp16_log_nested_followup_20260607_2110`

Purpose: local boundary sweep after low8 nested candidates improved all three log-family cases.

Inputs:
- Truth files: `benchmarks/ex223.truth`, `benchmarks/ex224.truth`, `benchmarks/ex225.truth`
- Generator: `student/generators/fp16_log_nested_semantic.py`

Artifacts:
- Work directory: `student/work/ex223_ex225_frontend_fp16_log_nested_followup_20260607_2110/`
- Candidates CSV: `student/runs/fp16/ex223_ex225_frontend_fp16_log_nested_followup_20260607_2110/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex223_ex225_frontend_fp16_log_nested_followup_20260607_2110/results/best.csv`

Methods tried:
- Specs: low9/hi5, low9/hi6, low9/hi7, low8/hi4, low8/hi7.
- Flow: `abc_g_aig`.

Best result:
- ex223: `10846/19/206074`.
- ex224: `6021/17/102357`.
- ex225: `11682/19/221958`.

Notes:
- Superseded by later follow-up runs and the curated current seed bundle.
