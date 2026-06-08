# ex245 Frontend Attempts

Function hypothesis: E5M2FN packed FP8 add, high byte + low byte.

Reference row: area/delay/ADP/score = `325/34/11050/16575.0`.

Current known best: `ex245_semantic_add_gap_class_synth_preset_aig`,
`701/34/23834`, ratio `2.156923`.

## Attempt Log

- 2026-06-08: exact semantic match for E5M2FN add with RNE and canonical
  `8'h7f` NaN.
- Tried and excluded:
  - direct pair-delta tables: exact but area around 4k.
  - decoded 35-bit magnitude add + normalizer: exact but delay around 120.
  - full-output and sorted-key BDDs: lower delay but still high area/ADP.
  - small-gap local normalizer: low area (`602`) but delay around 70.
- Best structure: small-gap class formula.  Same-sign gap >3 and diff-sign gap
  >4 passthrough `maxc`; active small gaps use `(gap,max_sig,min_sig)` class
  formula with `min_eff` boundary guards.
