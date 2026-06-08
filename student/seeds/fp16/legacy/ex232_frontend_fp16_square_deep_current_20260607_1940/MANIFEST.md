# ex232_frontend_fp16_square_deep_current_20260607_1940

Run ID: `ex232_frontend_fp16_square_deep_current_20260607_1940`

Purpose: Curated current-best FP16 ex232 square seed from the deep
square-structure follow-up.

Inputs:
- Truth table: `benchmarks/ex232.truth`
- Generator: `student/generators/fp16_ex232_square_deep.py`
- Source run:
  `student/runs/fp16/ex232_frontend_fp16_square_deep_20260607_1940/`

Artifacts:
- Verilog:
  `student/seeds/fp16/ex232_frontend_fp16_square_deep_current_20260607_1940/ex232/verilog/ex232_fp16_square_exp_formula_hi9_8_low8_nested_hi6.v`
- AIG:
  `student/seeds/fp16/ex232_frontend_fp16_square_deep_current_20260607_1940/ex232/aigs/ex232_exp_formula_hi9_8_low8_nested_hi6_abc_g_aig.aig`
- Best CSV:
  `student/seeds/fp16/ex232_frontend_fp16_square_deep_current_20260607_1940/results/best.csv`
- Official recheck CSV:
  `student/seeds/fp16/ex232_frontend_fp16_square_deep_current_20260607_1940/results/evaluate_official_best.csv`
- Summary CSV:
  `student/seeds/fp16/ex232_frontend_fp16_square_deep_current_20260607_1940/results/summary.csv`

Best result:
- `ex232_exp_formula_hi9_8_low8_nested_hi6_abc_g_aig`
- Area/delay/ADP: `1240/13/16120`
- Reference ADP: `13392`
- Ratio: `1.203704`
- Official `evaluate.py --case ex232`: OK

Structure:
- `ex232` exact-matches FP16 square under DAZ input, FTZ output, RNE rounding,
  and canonical NaN assumptions.
- Output sign is constant zero; input sign is ignored except that NaN handling
  remains canonical.
- For active normal input exponents `8..22`,
  `out_exp = 2*exp - 15 + (mant >= 424)`.
- Output mantissa is a function of input mantissa only.
- Mantissa bits 9 and 8 are emitted as shallow run trees.
- Mantissa low 8 bits are emitted as a nested `mant[9:4]` / `mant[3:0]`
  exact LUT, which synthesized much better than the flat low8 LUT.

Excluded follow-ups:
- Direct 10-bit mantissa LUT was exact but worse: best `1363/16/21808`.
- Flat low8 LUT with bits9/8 run trees was exact but worse: `1327/16/21232`.
- Exponent case table was worse than arithmetic exponent formula.
- BDD low-bit variants were exact but did not beat the nested LUT.
- Product arithmetic had low area but delay 49, so ADP was worse.
- `abc_g_aig_d18`, `extra_opt_share`, `gates`, `cmos2`, and
  `parallel_case/full_case` source attributes did not improve the curated
  best.
