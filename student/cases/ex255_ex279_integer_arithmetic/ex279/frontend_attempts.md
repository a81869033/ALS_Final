# ex279 Frontend Attempts

Semantics: integer square root, `isqrt(x)`.

Initial semantic seeds:
- `ex279_isqrt_direct`: 731/125/91375
- `ex279_isqrt_threshold_chain`: 1371/231/316701

Current verified frontend best:
- `ex279_isqrt_radix4_wires_synth_preset`: 334/42/14028, ref ADP 10952, ratio 1.280862.

Notes:
- Exact unsigned floor isqrt over 65536 inputs.
- Radix-4 digit sqrt is the current best: area is very low, and despite high
  delay it beats the prefix/BDD/table families by ADP.
- Prefix5 range is a lower-delay but larger alternative.  Cofactor BDDs reduced
  delay but were too area-heavy; radix8/radix16 variants and one-hot/support
  rewrites did not improve.  Current best is within 1.5x reference.
