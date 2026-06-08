# ex248 Frontend Attempts

Function hypothesis: E5M2FN packed FP8 fmod, low byte % high byte.

Reference row: area/delay/ADP/score = `209/20/4180/6270.0`.

Current known best: `ex248_semantic_fmod_periodic_rem_abc_g_aig`,
`285/30/8550`, ratio `2.045455`.

## Attempt Log

- 2026-06-08: exact semantic match for E5M2FN fmod with output sign from the
  low byte and canonical `8'h7f` NaN.
- Tried and excluded:
  - nested modular-significand delta table: exact, best `476/32/15232`.
  - direct Verilog `%`: exact but synthesized to very deep AIGs.
  - formula normalizer replacing the small norm table: exact but worse delay.
- Best structure: hand-derived periodic remainder.  Since `sig_d` is only
  1..7, `2^delta mod sig_d` is periodic and can replace the large delta table.
