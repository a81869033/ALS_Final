# ex224_frontend_fp16_log2_fieldsplit_20260607_0840

Run ID: `ex224_frontend_fp16_log2_fieldsplit_20260607_0840`

Purpose: Test whether separating all output exponent bits from the mantissa
table improves `ex224` current hybrid QoR.

Inputs:
- Truth file: `benchmarks/ex224.truth`
- Generator: `student/generators/fp16_log2_cluster_semantic.py`

Artifacts:
- Work directory: `student/work/ex224_frontend_fp16_log2_fieldsplit_20260607_0840/`
- Candidates CSV: `student/runs/fp16/ex224_frontend_fp16_log2_fieldsplit_20260607_0840/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex224_frontend_fp16_log2_fieldsplit_20260607_0840/results/best.csv`
- Summary CSV: `student/runs/fp16/ex224_frontend_fp16_log2_fieldsplit_20260607_0840/results/summary.csv`

Best result:
- `field_exp_lut_mant_table`: `6340/21/133140`, equivalent.

Notes:
- Output exponent field split was exact but worse than the current bit11/bit12
  selected-bit hybrid.

