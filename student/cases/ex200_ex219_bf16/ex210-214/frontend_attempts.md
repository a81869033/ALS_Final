# ex210-ex214 BF16 Frontend Attempts

Run: `ex210_ex214_frontend_bf16_semantic_20260606_1315`

Results:
- CSV: `student/runs/bf16/ex210_ex214_frontend_bf16_semantic_20260606_1315/results/`
- Active work: `student/work/ex210_ex214_frontend_bf16_semantic_20260606_1315/`
- Archived low-value intermediates: `student/archive/cleanup_20260606/ex210_ex214_frontend_bf16_semantic_20260606_1315_low_value_intermediates/`
- Official best recheck: `results/evaluate_official_best.csv`

Truth convention:
- All candidates use `student.frontends.truth.TruthTable` with ABC `read_truth -xf` indexing.
- Best candidates were rechecked with `evaluate.py --case` using the run-local `official_eval_best/` directory.

## Semantic Identification

All five cases match BF16 unary functions under DAZ input, FTZ output, RNE rounding, and canonical NaN:

| Case | Semantics | Special behavior |
| --- | --- | --- |
| ex210 | `sigmoid(x)` | sign bit is always 0; large positive saturates to 1.0; large negative saturates to 0; NaN canonical |
| ex211 | `1/x` | sign preserved by sign/magnitude output; zero to signed inf; inf to signed zero; NaN canonical |
| ex212 | `x*x` | sign removed; small inputs underflow to zero; large inputs overflow to +inf; NaN canonical |
| ex213 | `sqrt(x)` | positive-domain sqrt; negative normal/inf to canonical NaN; negative zero preserves negative zero |
| ex214 | `1/(x*x)` | sign removed; zero to +inf; inf to +zero; underflow/overflow thresholds explicit; NaN canonical |

## Best Seeds

| Case | Best variant | Area | Delay | ADP | Old ADP | Improvement | Reference ratio |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: |
| ex210 | `const_default_3f80_h3` | 2232 | 15 | 33480 | 37872 | 11.60% | 1.237571 |
| ex211 | `hand_recip_formula_signmag_lut` | 273 | 11 | 3003 | 3025 | 0.73% | 1.405899 |
| ex212 | `delta_pair_mode_hilo4_bits_15_bh1` | 281 | 11 | 3091 | 3498 | 11.64% | 1.341580 |
| ex213 | `sep_fields_e2_m3_s3_bits_1_bh1` | 346 | 11 | 3806 | 4394 | 13.38% | 1.312414 |
| ex214 | `legacy_default_expr_exception_case_bits_13_cmp_fix` | 337 | 11 | 3707 | 3816 | 2.86% | 1.529290 |

## Case Notes

### ex210 sigmoid

Useful:
- Saturation-default Verilog was better than the older semantic field reassembly.
- `const_default_3f80_h3` uses 1.0 as the default output and local exception LUTs for the transition and zero/NaN regions. It lowered delay from 16 to 15 and ADP from `37872` to `33480`.
- `const_default_0000_h3` and `const_default_3f00_h3_first` are close alternatives but do not beat the 1.0 default.

Tried and excluded:
- Positive-symmetry fields are not a good fit for sigmoid because the exact rounded relation is not a cheap `1 - f(x)` source expression.
- h1/h2/h4/h5/h6 default splits either raised delay or area.
- Packed semantic field reassembly and legacy exp/mant tables lost to saturation-default exceptions.

Stopping reason:
- The best source form now uses the real sigmoid saturation behavior and a shallow transition LUT. Further tested split/default variants either keep delay 15 with higher area or raise delay to 16+.

### ex211 reciprocal

Useful:
- A hand-written semantic reciprocal seed improved the old best slightly: explicit special cases, one 128-entry mantissa LUT, and sign/magnitude output mux.
- `hand_recip_formula_signmag_lut` reached `273/11/3003`, beating the old `semantic_positive_symmetry_fields` at `275/11/3025`.

Tried and excluded:
- Direct arithmetic field RTL was exact but too deep (`300/15/4500`).
- Full-word positive-domain and split-sign tables had much larger area.
- Single-subtract exponent rewrite reduced area to 272 but raised delay to 12, losing ADP.
- Large default-exception table was exact but unusable (`36443/26/947518`).

Stopping reason:
- The current best is already a compact semantic reciprocal structure. Remaining tested rewrites either add subtractor delay or expand the positive-domain table.

### ex212 square

Useful:
- The best improvement came from the delta/base structure, not direct arithmetic.
- `delta_pair_mode_hilo4` found the right hi/lo sweet spot (`282/11/3102`), and overriding the constant output sign bit produced `281/11/3091`.

Tried and excluded:
- Direct square arithmetic and hand formula LUTs were exact but delay 12 (`300/12/3600`).
- Positive-domain sign-insensitive full-word/field tables were much larger.
- h1/h2/h3/h5 delta splits either raised delay or area; h4 was the useful split.
- Single-bit overrides on h3 and h4 generally worsened sharing; only bit15 on h4 mode saved one node.

Stopping reason:
- h4 mode delta-pair plus constant sign bit is the best area/delay balance found. Further bit overrides either tie the same AIG or increase delay/area.

### ex213 sqrt

Useful:
- Separate fields beat direct sqrt arithmetic by lowering delay from 13 to 12.
- The best seed overrides output bit1 from the separate-field base, dropping delay to 11: `346/11/3806`.
- Equivalent ties exist for `e2/e3/e4` exponent split; the active best keeps the curated `e2_m3_s3_bits_1_bh1` row.

Tried and excluded:
- Positive-domain sqrt full-word tables were exact but too large.
- Positive-domain field variants were closer but still worse than separated fields.
- Most selected-bit overrides increased area or delay; bit14 was a low-area near miss (`333/12/3996`), but bit1 had better ADP.
- Comparator predicate for bit1 was very poor (`457/34/15538`).

Stopping reason:
- Only bit1 changed the critical path favorably. Multi-bit bit1+bit14 and alternate predicate encodings lost the 11-level advantage or added too much area.

### ex214 reciprocal-square

Useful:
- The old default/exception structure remained the best base, but selected bit13 override lowered delay from 12 to 11.
- `legacy_default_expr_exception_case_bits_13_cmp_fix` reached `337/11/3707`, improving the old `318/12/3816`.

Tried and excluded:
- Direct reciprocal-square arithmetic and hand formula LUTs were exact but too deep.
- Positive-domain sign-insensitive full-word/field tables were much larger than the default/exception base.
- Delta-pair variants preserved delay 12 but had higher area.
- bit15 override tied the base, showing Yosys already constant-folded the output sign; bit14 and bit12 worsened ADP.

Stopping reason:
- bit13 was the only tested selected-bit predicate that reduced delay. `cmp` was slightly better than runs/bh encodings for this bit; multi-bit combinations lost the benefit.
