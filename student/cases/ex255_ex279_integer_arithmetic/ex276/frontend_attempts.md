# ex276 Frontend Attempts

Semantics: integer square root, `isqrt(x)`.

Initial semantic seeds:
- `ex276_isqrt_direct`: 102/28/2856
- `ex276_isqrt_threshold_chain`: 144/28/4032

Current verified frontend best:
- `ex276_isqrt_prefix4_ge_bitwise_synth_preset`: 101/10/1010, ref ADP 632, ratio 1.598101.

Notes:
- Exact unsigned floor isqrt over 1024 inputs.
- Earlier prefix4 bitwise replaced the old baseline row and reduced ADP by
  60.9%; the new shared-ge rewrite reduced area by one more node while keeping
  delay 10.
- The most useful direction is prefix4 shared boundary classification:
  generate local threshold/ge wires once per bucket, then derive all output
  bits from those thermometer flags.
- Tested but losing follow-ups: mixed prefix4/prefix5 bit hybrids, prefix6
  tree/bitwise classifiers, deeper cofactor BDDs, prefix4 low-bucket
  refinement, ANF or support formulas for high bits plus prefix4 low bits,
  selected low-bit cofactor BDD plus ANF high bits, and limited gateflow replay
  on the new best.
- Cofactor reverse BDD improved earlier rows to 114/10/1140 but lost to
  prefix4 shared-ge.
- Exact but losing directions: direct/trial loop, threshold chain/XOR,
  bit-interval OR, restoring/radix variants, support-reduced formulas, one-hot
  prefix decode, BDD order presets, high-bit formula plus low BDD, QM/SOP,
  thermometer popcount, gate/synthflow sweeps, and prefix delta.
- Still outside 1.5x reference; likely needs a shallower shared classifier that
  reduces either delay to 9 at similar area or area below about 94 at delay 10.

## 2026-06-09 High-Gap Follow-Up

Additional run/result location:

- `student/runs/integer/ex266_ex267_ex276_frontend_highgap_struct_20260609_1732/results/`

New exact but rejected directions:

- Hand-derived high-bit formulas for `out[4]` and `out[3]` combined with
  prefix3/prefix4 shared-ge lower bits.
- Balanced square-threshold word tree.

Result:

- No new best.  The best hand-high-bit rows were `108/11/1188`, worse than the
  current `101/10/1010`.
- This confirms that q4/q3 alone are not the current bottleneck; the missing
  structure likely has to share the lower-bit threshold/classifier logic more
  efficiently, not merely replace the obvious high bits.

## 2026-06-09 Threshold-Toggle Follow-Up

Additional run/result location:

- `student/runs/integer/ex266_ex276_frontend_highgap_struct2_20260609_1750/results/`

Tested:

- Direct output-bit toggle formulas from square thresholds: each output bit is
  an XOR of `in >= q*q` toggle points.
- Shared-threshold version that materializes all `ge(q*q)` wires once.

Result:

- No new best.  Best row was `isqrt_threshold_toggle_shared` at `130/11/1430`,
  far worse than current `101/10/1010`.
- This rules out the simple shallow-threshold expression family.  The useful
  structure is still the prefix4 shared-ge bucket classifier, unless a more
  compact lower-bit sharing method is found.
