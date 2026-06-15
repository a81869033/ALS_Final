# ex234 FP16 Frontend Attempts

Function hypothesis: `fp16_reciprocal_square`.

Current known best:
- Run: `ex231_ex233_ex234_frontend_fp16_power_nested_current_20260607_2027`
- Variant: `ex234_nested_bits9_8_hi5_abc_g_aig`
- QoR: `1351/17/22967`
- Reference ADP: `15561`
- Ratio: `1.475933`
- Classification: `semantic_exact`

2026-06-07 focused pass:
- Official `evaluate.py --case ex234` recheck: OK.
- Python DAZ/FTZ/RNE/canonical-NaN reciprocal-square model exact-matched the
  truth table.
- Best ADP came from re-emitting the existing sign-pair source through Yosys
  `abc -g aig`; area dropped slightly while delay stayed 17.

Next maintenance items:
- Preserve the sign-insensitive positive-domain structure with explicit
  special cases.
- Compare exponent arithmetic, default/exception tables, and delta-pair seeds.
- Record any selected-bit predicates that lower delay.

2026-06-07 ex232-style nested follow-up:
- Run: `student/runs/fp16/ex231_ex233_ex234_frontend_fp16_power_nested_20260607_2027/`
- Curated seed:
  `student/seeds/fp16/ex231_ex233_ex234_frontend_fp16_power_nested_current_20260607_2027/`
- Official `evaluate.py --case ex234` recheck: OK at `1351/17/22967`.
- Structure:
  - sign-insensitive reciprocal-square;
  - active normal exponent range `8..21`;
  - `out_exp = 45 - 2*exp - (mant != 0) - (mant >= 425)`;
  - output mantissa is mantissa-only;
  - mantissa bits9/8 are run trees;
 - mantissa low8 is nested hi5 LUT.
- Improvement is small but real: `1355/17/23035` -> `1351/17/22967`.

## 2026-06-14 fp16-extra-r2 campaign shard

- Campaign: `ex204_ex299_frontend_continuation_20260614_1216`, agent `fp16-extra-r2`.
- Method signatures:
  - `ex234|fp16_reciprocal_square_boundary_split|core_formula_boundary_wordmode_mh5|shared core exponent formula plus boundary mantissa-high word-mode defaults|yosys_abc_g_aig|abc_xf_official_evaluate|core_formula_boundary_wordmode_mh5`
  - `ex234|fp16_reciprocal_square_boundary_split|core_formula_boundary_wordmode_mh4|shared core exponent formula plus coarser boundary word-mode defaults|yosys_abc_g_aig|abc_xf_official_evaluate|core_formula_boundary_wordmode_mh4`
  - `ex234|fp16_reciprocal_square_boundary_split|core_formula_boundary_wordmode_mh6|shared core exponent formula plus finer boundary word-mode defaults|yosys_abc_g_aig|abc_xf_official_evaluate|core_formula_boundary_wordmode_mh6`
- Official `evaluate.py` OK candidates:
  - `ex234_boundary_wordmode_mh5_abc_g_aig`: `1278/14/17892`, best in this shard.
  - `ex234_boundary_wordmode_mh6_abc_g_aig`: `1321/14/18494`, exact but higher area.
  - `ex234_boundary_wordmode_mh4_abc_g_aig`: `1289/16/20624`, exact but delay regresses.
- Artifacts:
  - `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp16-extra-r2/ex234/`
  - `student/runs/fp16/ex204_ex299_frontend_continuation_20260614_1216/fp16-extra-r2/ex234/official_eval/`
- Outcome: large frontend reduction `22967 -> 17892` by keeping the reciprocal-square core formula and replacing the exp7/exp22 full boundary tables with mantissa-high word-mode residuals.  Boundary `mh5` is the useful split; coarser `mh4` raises delay and finer `mh6` raises area.
