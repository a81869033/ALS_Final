# ex236_ex238_frontend_fp16_core_clamp_allflows_20260608_0953

Run ID: `ex236_ex238_frontend_fp16_core_clamp_allflows_20260608_0953`

Purpose: test whether cube/reciprocal-cube boundary exponent tables can be
replaced by exact shallow clamp predicates around the middle exponent formula.

Inputs:
- Truth files: `benchmarks/ex236.truth`, `benchmarks/ex238.truth`
- Generator: `student/generators/fp16_ex236_ex238_core_clamp.py`

Artifacts:
- Work directory: `student/work/ex236_ex238_frontend_fp16_core_clamp_allflows_20260608_0953/`
- Candidates CSV: `student/runs/fp16/ex236_ex238_frontend_fp16_core_clamp_allflows_20260608_0953/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex236_ex238_frontend_fp16_core_clamp_allflows_20260608_0953/results/best.csv`

Methods tried:
- `ex236`: exact cube core formula for exp11..19, with exp10 underflow clamp,
  one min-normal exception at mantissa `0x10a`, and exp20 overflow clamp.
- `ex238`: exact reciprocal-cube core formula with exp9 overflow and exp19
  underflow clamps.
- Checked focused `nested_hi` values and limited Yosys frontend flows.

Best result:
- `ex236`: `ex236_core_clamp_hi6_abc_g_aig`, `1432/15/21480`
- `ex238`: `ex238_core_clamp_hi5_abc_g_aig`, `1461/17/24837`

Notes:
- Core clamp is a new best for `ex236`.
- For `ex238`, clamp predicates reduced area but increased delay; the previous
  core-boundary table seed remains better at `1502/15/22530`.
