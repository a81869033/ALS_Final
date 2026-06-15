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
- 2026-06-12 Round12 `fp8-resid-r12`: tested
  `ex253_round12_count_threshold_groups_abc_g_aig` with method signature
  `ex253|unsigned 2-bit lane reduction to E4M3FN|count-pair threshold grouped quantizer|shared low/high bit popcounts and direct count-threshold predicates|yosys_abc_g_aig_official_evaluate|exact_u2_sum8_times2_to_e4m3fn|grouped_threshold_output_codes`.
  This kept the low/high popcount sharing but replaced the final reachable
  lane-sum case with direct count-pair threshold predicates and grouped E4M3
  output ranges.  Official `evaluate.py` result was OK, `193/21/4053`.
  Outcome: exact but worse than current frontend `126/18/2268`; do not repeat
  this direct threshold grouping without a different sharing basis.  Paths:
  Verilog `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/fp8-resid-r12/ex253/verilog/ex253_round12_count_threshold_groups.v`;
  AIG `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/fp8-resid-r12/ex253/aigs/ex253.aig`;
  log `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/fp8-resid-r12/ex253/logs/ex253_round12_count_threshold_groups.official_evaluate.log`.
