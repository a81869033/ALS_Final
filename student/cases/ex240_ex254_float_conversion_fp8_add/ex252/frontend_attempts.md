# ex252 Frontend Attempts

Function hypothesis: packed four-lane unsigned 2-bit dot product to E4M3FN.

Reference row: area/delay/ADP/score = `137/19/2603/3904.5`.

Current known best: `ex252_semantic_u2_dot4_balanced_qcase_default`,
`145/21/3045`, ratio `1.169804`.

## Attempt Log

- 2026-06-08: Truth rows match four unsigned 2-bit lanes in each byte:
  `sum_i a_i*b_i`, quantized to E4M3FN.
- Initial serial expression `p0 + p1 + p2 + p3` was exact but synthesized to
  `149/25/3725`.
- Balanced product/sum tree improved to `145/21/3045`.  Pair tables, qrange,
  qnorm, and delay-target synthflow were exact but worse.  Parallel-case hints
  did not change the measured AIG.
- 2026-06-08 deeper follow-up: hand-written 2x2 product logic tied the same
  best `145/21/3045`; weighted partial-product popcount and minimized
  output-bit formulas were exact but worse.  Treat the handmul seed as an
  equivalent alternate, not a real ADP improvement.
