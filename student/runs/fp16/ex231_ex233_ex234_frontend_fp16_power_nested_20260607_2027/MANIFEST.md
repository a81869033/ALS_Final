# ex231_ex233_ex234_frontend_fp16_power_nested_20260607_2027

Run ID: `ex231_ex233_ex234_frontend_fp16_power_nested_20260607_2027`

Purpose: Test whether the ex232 square lesson applies to already-run FP16
cases before ex235.

Inputs:
- Truth tables: `benchmarks/ex231.truth`, `benchmarks/ex233.truth`,
  `benchmarks/ex234.truth`
- Generator: `student/generators/fp16_pre235_power_nested.py`

Artifacts:
- Work directory:
  `student/work/ex231_ex233_ex234_frontend_fp16_power_nested_20260607_2027/`
- Candidates CSV:
  `student/runs/fp16/ex231_ex233_ex234_frontend_fp16_power_nested_20260607_2027/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex231_ex233_ex234_frontend_fp16_power_nested_20260607_2027/results/best.csv`
- Summary CSV:
  `student/runs/fp16/ex231_ex233_ex234_frontend_fp16_power_nested_20260607_2027/results/summary.csv`

Best results:
- `ex231`: `1163/14/16282`.
- `ex233`: `1530/15/22950`.
- `ex234`: `1351/17/22967`.

Notes:
- `ex231` reciprocal uses exponent formula `30-exp-(mant!=0)`, mant bit9
  run tree, and low9 nested hi6 LUT.
- `ex233` sqrt uses exponent parity classes, mant bits9/8 run trees, and low8
  nested hi6 LUT.  The first attempt missed signed zero for negative
  subnormal/zero; fixed source preserves `0x8000`.
- `ex234` reciprocal-square uses exponent formula
  `45-2*exp-(mant!=0)-(mant>=425)`, mant bits9/8 run trees, and low8 nested
  hi5 LUT.
- Curated current seeds are in
  `student/seeds/fp16/ex231_ex233_ex234_frontend_fp16_power_nested_current_20260607_2027/`.
