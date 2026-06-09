# ex278 Frontend Attempts

Semantics: integer square root, `isqrt(x)`.

Initial semantic seeds:
- `ex278_isqrt_direct`: 511/86/43946
- `ex278_isqrt_threshold_chain`: 663/119/78897

Current verified frontend best:
- `ex278_isqrt_prefix5_range_synth_preset`: 502/14/7028, ref ADP 5198, ratio 1.352058.

Notes:
- Exact unsigned floor isqrt over 16384 inputs.
- Prefix5 range classification is the current best and is within 1.5x
  reference.
- Cofactor BDD, one-hot prefix, support-reduced formulas, radix/restoring
  variants, and extra synthflow checks were exact but did not beat prefix5
  range.
