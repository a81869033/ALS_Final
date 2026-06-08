# ex254 Frontend Attempts

Function hypothesis: E4M3FN accumulator plus one low-byte FP4 E2M1 product.

Reference row: area/delay/ADP/score = `1911/20/38220/57330.0`.

Current known best: `ex254_semantic_e4add_fp4product_grs_magfactored_abc_g_aig`,
`662/55/36410`, ratio `0.952643`, beats reference.

## Attempt Log

- 2026-06-08: Initial samples such as `3c00 -> 3c`, `003c -> c4`, and
  `3c3c -> bc` show `acc + fp4_hi*fp4_lo`, not subtraction or conversion.
- Exact model: high byte is an E4M3FN accumulator; low byte contains two FP4
  E2M1 nibbles whose product is scaled into E4M3FN units and added to the
  accumulator.  `acc=-0` plus negative-zero product yields `8'h80`.
- Generic `acc_k + product_k -> E4 quant` qcase/qrange/qnorm variants were
  exact but ADP-worse.  Nested product-key accumulator remap and full BDD
  lowered delay but area dominated.
- Best structure converts the FP4 product to an E4M3FN operand and reuses the
  ex240 compact E4 add GRS/diff-normalizer.  This produced `664/56/37184` and
  beats reference ADP.
- 2026-06-08 deeper follow-up: factoring the low-byte FP4 product-to-E4
  conversion as magnitude table plus sign/negative-zero logic improved the
  same E4 add GRS source to `662/55/36410`.  The improvement is smaller than
  ex250 because the E4 add core remains the dominant path, but this is the new
  retained frontend seed.
