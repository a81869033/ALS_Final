# ex253 Frontend Attempts

Function hypothesis: unsigned 2-bit lane reduction, `2 * sum(lanes)`, to
E4M3FN.

Reference row: area/delay/ADP/score = `123/15/1845/2767.5`.

Current known best: `ex253_semantic_u2_sum8_popcount_laneqcase_default`,
`126/18/2268`, ratio `1.229268`.

## Attempt Log

- 2026-06-08: Truth rows match eight unsigned 2-bit lanes across the 16-bit
  input.  Output is `E4M3FN_quant(2 * sum(lanes))`.
- Initial serial sum plus qcase reached `124/27/3348`; using only reachable
  lane-sum values gave `123/27/3321`.
- Balanced lane-sum tree improved delay and ADP to `126/20/2520`.  Byte-sum
  tables lowered delay only slightly and area dominated.  BDD was exact but far
  too large.  Parallel-case and `abc -D` did not improve the balanced result.
- 2026-06-08 deeper follow-up: rewriting the lane sum as separate low-bit and
  high-bit popcounts, then combining them as `lo_count + 2*hi_count`, improved
  the current best to `126/18/2268`.  This indicates the final source structure
  should expose weighted bit counts rather than just summing 2-bit lane words.
  A direct 2D `{hi_count,lo_count}` quant table lowered delay to 17 but area
  rose to 193, so ADP was worse.  Minimized output-bit formulas and threshold
  field formulas were exact but also worse than the reachable lane-sum qcase.
