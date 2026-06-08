# ex223_ex225_frontend_fp16_log_nested_fixed_20260607_2059

Run ID: `ex223_ex225_frontend_fp16_log_nested_fixed_20260607_2059`

Purpose: first valid FP16 log-family nested mantissa run after fixing AIG output directory creation.

Inputs:
- Truth files: `benchmarks/ex223.truth`, `benchmarks/ex224.truth`, `benchmarks/ex225.truth`
- Generator: `student/generators/fp16_log_nested_semantic.py`

Artifacts:
- Work directory: `student/work/ex223_ex225_frontend_fp16_log_nested_fixed_20260607_2059/`
- Candidates CSV: `student/runs/fp16/ex223_ex225_frontend_fp16_log_nested_fixed_20260607_2059/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex223_ex225_frontend_fp16_log_nested_fixed_20260607_2059/results/best.csv`

Methods tried:
- Positive-normal sign-exp grouping.
- High output bits as mantissa run trees.
- Low bits as nested mantissa hi/lo LUTs.
- Specs: low8/hi5, low8/hi6, low7/hi6, low6/hi6, with `abc_g_aig` and default flows.

Best result:
- ex223: `10940/19/207860`.
- ex224: `6080/17/103360`.
- ex225: `11756/19/223364`.

Notes:
- Superseded by later follow-up runs and the curated current seed bundle.
