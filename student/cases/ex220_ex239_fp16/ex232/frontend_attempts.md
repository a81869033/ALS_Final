# ex232 FP16 Frontend Attempts

Function hypothesis: `fp16_square`.

Current known best:
- Run: `ex232_frontend_fp16_square_deep_current_20260607_1940`
- Variant: `ex232_exp_formula_hi9_8_low8_nested_hi6_abc_g_aig`
- QoR: `1240/13/16120`
- Reference ADP: `13392`
- Ratio: `1.203704`
- Classification: `semantic_exact`

2026-06-07 focused pass:
- Official `evaluate.py --case ex232` recheck: OK.
- Python DAZ/FTZ/RNE/canonical-NaN square model exact-matched the truth table.
- Best seed uses selected-bit vector cover for output bits 12 and 9, then
  Yosys `abc -g aig`; delay dropped from 17 to 16 and area dropped from 1365
  to 1343.
- Neighbor bitvec sets such as adding bit14 or bit10 were exact but worse.
- Direct arithmetic/field-default variants and broad old-row reuse improved
  some baselines but did not beat this bitvec seed.

Next maintenance items:
- Now within 1.5x reference.  Future work should only continue if it can beat
  the nested hi6/lo4 mantissa structure or find a lower-delay exact low-bit
  arithmetic representation.
- Avoid broad bit-combination sweeps; the useful structure is square-specific,
  not a generic selected-bit cover.

2026-06-07 deep square follow-up:
- Run: `student/runs/fp16/ex232_frontend_fp16_square_deep_20260607_1940/`
- Curated seed:
  `student/seeds/fp16/ex232_frontend_fp16_square_deep_current_20260607_1940/`
- Official `evaluate.py --case ex232` recheck: OK at `1240/13/16120`.
- Derived exact structure:
  - sign-free square; output sign is constant zero.
  - normal active input exponent range is `8..22`.
  - exponent `0..7` maps to zero; exponent `23..30` maps to +inf; exponent
    `31` maps to +inf or canonical NaN.
  - for active normals,
    `out_exp = 2*exp - 15 + (mant >= 424)`.
  - normalized output mantissa is a function of input mantissa only.
  - output mantissa bits 9 and 8 are shallow run trees.
  - output mantissa low8 is a nested `mant[9:4]` / `mant[3:0]` exact LUT.
- Improvement:
  - previous best `1343/16/21488`
  - new best `1240/13/16120`
  - ADP improvement `5368`; delay improved `16 -> 13`.
- Tried and excluded:
  - flat 10-bit mantissa LUT: `1363/16/21808`.
  - bits9/8 run tree plus flat low8 LUT: `1327/16/21232`.
  - exponent case table: worse than arithmetic exponent formula.
  - BDD low-bit variants: exact but worse than nested LUT.
  - product arithmetic: low area `768`, but delay `49`.
  - extracting bit7/bit6 from the nested LUT: exact but worse.
  - synthflow neighbors and `parallel_case/full_case` attributes: no
    improvement over `1240/13/16120`.
