# ex223_ex224_frontend_fp16_log_deep2_20260606_2224

Run ID: `ex223_ex224_frontend_fp16_log_deep2_20260606_2224`

Purpose: bucketed constant-output-exponent rewrite for the fixed-point log
semantic model.

Artifacts:
- Work directory: `student/work/ex223_ex224_frontend_fp16_log_deep2_20260606_2224/`
- Results: `student/runs/fp16/ex223_ex224_frontend_fp16_log_deep2_20260606_2224/results/`

Methods tried:
- Constant output exponent groups used fixed shifts.
- Variable output exponent groups fell back to local mantissa tables.

Best result:
- `ex223`: `bucket_q20_constexp_exc`, `466560` ADP.
- `ex224`: `bucket_q19_constexp_exc`, `261195` ADP.

Notes:
- Exact, but worse than both baseline and full fixed-point semantic candidate.
- Mixing q-LUT arithmetic with local tables duplicated logic rather than
  reducing it.
