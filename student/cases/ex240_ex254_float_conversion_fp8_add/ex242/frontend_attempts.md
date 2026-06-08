# ex242 Frontend Attempts

Function hypothesis: E4M3FN FP8 division, low byte / high byte.

Reference row: area/delay/ADP/score = `850/14/11900/17850.0`.

Current known best:
- Source: `student/results/current_best_by_case.csv` and the run result CSVs.
- Variant: `semantic_div_field_sparse_clean_synth_preset_aig`
- QoR: `1266/20/25320`
- Reference ADP: `11900`
- Ratio: `2.127731`
- Classification: `semantic_exact`

## Diagnostics To Run

- Verify width, support, constant bits, bit entropy, and special input classes.
- Infer whether this is conversion or packed fp8 add.
- Because the reference delay is low, prioritize shallow decode, shared
  predecode, and local exception/default structures.

## Attempt Log

- Confirmed exact directional division: output is `low / high`, not
  commutative.  `0/0` and NaN cases canonicalize to `8'h7f`; nonzero divide by
  zero saturates to max finite with sign xor.
- `semantic_div_mag_table`: exact 7-bit magnitude pair table; best
  `4790/24/114960`.
- `semantic_div_field_table`: exponent delta + numerator/denominator
  significands; best `1290/20/25800`.
- `semantic_div_formula_exception`: exponent-delta formula plus 1050 boundary
  exceptions; lower area and slightly better ADP at `1028/25/25700`.
- 2026-06-08 compact follow-up: compact default parameter table reproduced the
  same best `1028/25/25700`; it is cleaner source but not a QoR improvement.
- Sparse field-table and field-table synthflow runs were exact and close but
  did not win: best sparse `1290/20/25800`, best field-table synthflow
  `1294/20/25880`.
- Bit-table split was exact but much worse (`2880/21/60480`).  Shared-BDD
  paired-bit source also did not transfer well; best synthflow was
  `1516/21/31836`.
- 2026-06-08 deeper division checks:
  - Per-bit exception overlay around the compact formula was exact but worse
    (`1328/25/33200` best).
  - Nested delta/significand table lowered delay to `20` but area was too high
    (`1702/20/34040`).
  - Clean sparse field table removed the sentinel `out_mag==7f` special-path
    comparator and improved the current best to `1266/20/25320`.
  - Broader synthflow on the clean sparse source did not beat the source-run
    best.

## Next Maintenance Items

- Future work should reduce boundary exceptions with an exact subnormal and
  saturation formula, then recover the lower delay of the field-table seed.
  The best opportunity is still a quotient/rounding boundary formula with
  field-table-like delay and compact-formula-like area.
