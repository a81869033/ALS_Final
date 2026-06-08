# ex251 Frontend Attempts

Function hypothesis: packed two-lane signed 3-bit magnitude dot product to
E4M3FN.

Reference row: area/delay/ADP/score = `2805/14/39270/58905.0`.

Current known best: `ex251_semantic_int3_dot2_arith_qcase_abc_g_aig`,
`495/38/18810`, ratio `0.478992`, beats reference.

## Attempt Log

- 2026-06-08: This is the linear signed-magnitude counterpart of ex250.
  Nibble bit 3 is sign and bits 2:0 are magnitude `0..7`.
- Exact semantic model:
  `out = E4M3FN_quant(a_hi*b_hi + a_lo*b_lo)`, with the same two-negative-zero
  lane rule as ex250.
- Direct small arithmetic plus exact quant case beat reference.  Product LUT
  was also exact but slightly worse; qrange/qnorm variants were exact but
  delay/ADP-worse.
