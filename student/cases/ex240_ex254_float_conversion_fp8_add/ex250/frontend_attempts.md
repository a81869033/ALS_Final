# ex250 Frontend Attempts

Function hypothesis: packed two-lane FP4 E2M1 dot product to E4M3FN.

Reference row: area/delay/ADP/score = `1357/15/20355/30532.5`.

Current known best: `ex250_semantic_fp4_dot2_magarith_qcase_synth_preset_aig`,
`413/41/16933`, ratio `0.831884`, beats reference.

## Attempt Log

- 2026-06-08: Truth rows show two FP4 nibbles per byte.  FP4 E2M1 finite-only
  magnitude values are `0,1,2,3,4,6,8,12` with nibble bit 3 as sign.
- Exact semantic model:
  `out = E4M3FN_quant(a_hi*b_hi + a_lo*b_lo)`, with signed-zero rule that zero
  output is negative only when both lane products are negative zero.
- Product LUT + exact E4 quant case was best.  Arithmetic products were exact
  but larger; qrange/qnorm were exact but much deeper.  Full-output BDD lowered
  delay to 23 but area exceeded 5k, so ADP was much worse.
- 2026-06-08 deeper follow-up: factoring the FP4 product as 3-bit magnitude
  decode/table plus sign xor was the a-ha structure.  It reduced the product
  front-end from the older full signed product table result `598/43/25714` to
  `413/41/16933`, beating reference ADP.  A reachable-only abs-sum qcase was
  worse because the unreachable rows were not exploited as global don't-cares.
  qrange/unrolled quantizers and magnitude arithmetic tied or lost to the
  retained qcase result.
