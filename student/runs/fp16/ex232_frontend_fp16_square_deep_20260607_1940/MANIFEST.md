# ex232_frontend_fp16_square_deep_20260607_1940

Run ID: `ex232_frontend_fp16_square_deep_20260607_1940`

Purpose: Deep square-specific frontend search for FP16 `ex232`, targeting a
new semantic RTL structure instead of more broad table variants.

Inputs:
- Truth table: `benchmarks/ex232.truth`
- Generator: `student/generators/fp16_ex232_square_deep.py`
- Previous current best:
  `student/seeds/fp16/ex230_ex234_frontend_fp16_current_20260607_1853/`
  with `1343/16/21488`.

Artifacts:
- Work directory:
  `student/work/ex232_frontend_fp16_square_deep_20260607_1940/`
- Candidates CSV:
  `student/runs/fp16/ex232_frontend_fp16_square_deep_20260607_1940/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex232_frontend_fp16_square_deep_20260607_1940/results/best.csv`
- Summary CSV:
  `student/runs/fp16/ex232_frontend_fp16_square_deep_20260607_1940/results/summary.csv`

Methods tried:
- Derived sign-free FP16 square semantics.
- Active normal exponent range is `8..22`.
- Special ranges: exponent `0..7` maps to zero, `23..30` maps to +inf,
  and `31` maps to +inf or canonical NaN.
- Active normal exponent formula:
  `out_exp = 2*exp - 15 + (mant >= 424)`.
- Mantissa output is a function of mantissa only.
- Tested flat 10-bit mantissa LUT, mantissa bits9/8 run trees, BDD low-bit
  covers, product arithmetic, low-LUT carry split, nested low LUTs, and
  extracted bit7/bit6 variants.

Best result:
- `ex232_exp_formula_hi9_8_low8_nested_hi6_abc_g_aig`
- Area/delay/ADP: `1240/13/16120`
- Reference ADP: `13392`
- Ratio: `1.203704`
- Equivalent: yes

Notes:
- The winning source uses exponent formula, mantissa bits9/8 run trees, and a
  nested `mant[9:4]` / `mant[3:0]` exact LUT for mantissa low8.
- This source was copied into
  `student/seeds/fp16/ex232_frontend_fp16_square_deep_current_20260607_1940/`
  and rechecked with official `evaluate.py --case ex232`.
