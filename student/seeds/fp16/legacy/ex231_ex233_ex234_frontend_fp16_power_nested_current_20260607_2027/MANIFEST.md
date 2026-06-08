# ex231_ex233_ex234_frontend_fp16_power_nested_current_20260607_2027

Run ID: `ex231_ex233_ex234_frontend_fp16_power_nested_current_20260607_2027`

Purpose: Curated current-best seeds for the ex232-style nested mantissa
follow-up on already-run FP16 cases before ex235.

Inputs:
- Source run:
  `student/runs/fp16/ex231_ex233_ex234_frontend_fp16_power_nested_20260607_2027/`
- Generator:
  `student/generators/fp16_pre235_power_nested.py`

Best results:
- `ex231`: `ex231_nested_bits9_hi6_abc_g_aig`, `1163/14/16282`,
  ratio `1.157543`.
- `ex233`: `ex233_nested_bits9_8_hi6_abc_g_aig`, `1530/15/22950`,
  ratio `1.137603`.
- `ex234`: `ex234_nested_bits9_8_hi5_abc_g_aig`, `1351/17/22967`,
  ratio `1.475933`.

Artifacts:
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_official_best.csv`
- per-case `verilog/` and `aigs/` directories.

Notes:
- All three AIGs were rechecked with official `evaluate.py --case`.
- `ex231` and `ex233` gained large improvements from the ex232 lesson.
- `ex234` gained only a small improvement, but the seed is semantic and still
  better than the previous current best.
