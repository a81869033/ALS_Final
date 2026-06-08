# ex241 Frontend Attempts

Function hypothesis: E4M3FN FP8 multiply.

Reference row: area/delay/ADP/score = `344/21/7224/10836.0`.

Current known best:
- Source: `student/results/current_best_by_case.csv` and the run result CSVs.
- Variant: `semantic_mul_product_nested_exp_synth_preset_aig`
- QoR: `536/29/15544`
- Reference ADP: `7224`
- Ratio: `2.151717`
- Classification: `semantic_exact`

## Diagnostics To Run

- Verify width, support, constant bits, bit entropy, and special input classes.
- Infer whether this is conversion or packed fp8 add.
- Check for shallow sign/exponent/mantissa remapping, saturation guards, and
  selected-bit boundary predicates before using tables.

## Attempt Log

- Confirmed exact E4M3FN multiply semantics, including canonical NaN and signed
  underflow zero from sign xor.
- `semantic_mul_scaled`: exact but too deep/large (`3343/52/173836` best).
- `semantic_mul_field_table`: effective exponent sum + sorted 4-bit
  significands.  Major improvement; best `1033/25/25825`.
- `semantic_mul_product_table`: uses 4x4 product plus exponent sum.  Lower area
  (`752`) but delay `35`; ADP lost.
- 2026-06-08 deep structure: exact product-normalize formula plus only 13
  rounding exceptions was verified, but synthesized as `562/69/38778`.
  This confirms the semantic formula is compact in area but too serial for the
  current Yosys AIG critical path.
- Limited synthflow on the current field-table best did not improve it; the
  best recheck was `1058/25/26450`, worse than the retained `1033/25/25825`.
- 2026-06-08 follow-up: unsorted/sparse field tables and output-bit table
  variants were exact but did not improve ADP.  Best unsorted field table was
  `1423/20/28460`; sparse sorted/unsorted stayed near `40500`/`29040`; bit
  tables were much worse.
- Shared-BDD paired-bit sources transferred poorly to multiply: best after
  synthflow was `1399/21/29379`, not better than field-table current best.
- Product-table synthflow lowered area to `778` but delay stayed `34`, ADP
  `26452`; useful as a low-area alternative but not current best.
- 2026-06-08 arithmetic-structure pass: product-param default plus exact
  exceptions improved to `534/40/21360`; per-bit exception overlay was worse.
- Nested exponent-sum then product table was the best source shape:
  `536/29/15544`, current best.  It keeps the semantic product key but gives
  Yosys a shallower decoder than the compact exception formula.

## Next Maintenance Items

- Future work should replace the field table with normalized product formula
  plus small boundary exceptions only if the formula can be rewritten with a
  shallower leading/round path.  The nested product table is currently the
  strongest frontend seed; repeating broad BDD or bit-table variants is low
  priority.
