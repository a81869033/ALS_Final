# ex249 Frontend Attempts

Function hypothesis: E5M2FN packed FP8 hypot(abs(high), abs(low)).

Reference row: area/delay/ADP/score = `189/11/2079/3118.5`.

Current known best: `ex249_semantic_hypot_threshold_rawexp_synth_preset_aig`,
`168/26/4368`, ratio `2.101010`.

## Attempt Log

- 2026-06-08: exact semantic match for E5M2FN hypot of operand magnitudes,
  positive output sign, and canonical `8'h7f` NaN.
- Tried and excluded:
  - max+delta table: exact but large.
  - delta BDD: area near reference but delay too high.
  - formula threshold with broad OR predicates: exact but delay 36.
  - limited `abc -D` delay-target synthflow: no improvement.
- Best structure: raw-exponent gap0/gap1 threshold case.  Nonzero delta only
  occurs for effective exponent gap 0 or 1; saturation can be expressed by
  `maxc==7'h7e` or `maxc==7'h7d && delta==2`.
