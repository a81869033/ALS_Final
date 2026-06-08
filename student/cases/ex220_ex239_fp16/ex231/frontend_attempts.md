# ex231 FP16 Frontend Attempts

Function hypothesis: `fp16_reciprocal`.

Current known best:
- Run: `ex231_ex233_ex234_frontend_fp16_power_nested_current_20260607_2027`
- Variant: `ex231_nested_bits9_hi6_abc_g_aig`
- QoR: `1163/14/16282`
- Reference ADP: `14066`
- Ratio: `1.157543`
- Classification: `synthflow_exact semantic_exact`

2026-06-07 focused pass:
- Official `evaluate.py --case ex231` recheck: OK.
- Python DAZ/FTZ/RNE/canonical-NaN reciprocal model exact-matched the truth
  table.
- Best ADP came from the semantic sign/exp field-default source plus Yosys
  `abc -g aig`; the area increased from 1226 to 1286, but delay dropped from
  17 to 16.

Next maintenance items:
- Keep explicit zero/inf/NaN behavior and sign symmetry visible in future
  source rewrites.
- Preserve sign symmetry and zero/inf behavior.
- Record whether semantic arithmetic beats positive-default structural tables.

2026-06-07 ex232-style nested follow-up:
- Run: `student/runs/fp16/ex231_ex233_ex234_frontend_fp16_power_nested_20260607_2027/`
- Curated seed:
  `student/seeds/fp16/ex231_ex233_ex234_frontend_fp16_power_nested_current_20260607_2027/`
- Official `evaluate.py --case ex231` recheck: OK at `1163/14/16282`.
- Structure:
  - active normal exponent range `1..28`;
  - `out_exp = 30 - exp - (mant != 0)`;
  - output mantissa is mantissa-only;
  - mantissa bit9 is a run tree;
  - mantissa low9 is nested hi6/lo4 LUT;
  - output sign follows input sign except canonical NaN.
- Improvement: `1286/16/20576` -> `1163/14/16282`.
