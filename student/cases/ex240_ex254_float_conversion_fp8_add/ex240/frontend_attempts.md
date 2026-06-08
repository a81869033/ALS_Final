# ex240 Frontend Attempts

Function hypothesis: E4M3FN FP8 add, high byte + low byte.

Reference row: area/delay/ADP/score = `403/33/13299/19948.5`.

Current known best:
- Source: `student/results/current_best_by_case.csv` and the run result CSVs.
- Variant: `ex240_semantic_add_same_grs_diff_param8_synth_preset_aig`
- QoR: `590/51/30090`
- Reference ADP: `13299`
- Ratio: `2.262576`
- Classification: `semantic_exact`

## Diagnostics To Run

- Verify width, support, constant bits, bit entropy, and special input classes.
- Infer whether this is conversion or packed fp8 add.
- If conversion, infer source/target formats, rounding, saturation, and special
  value behavior.
- If add, infer operand packing, commutativity, alignment, cancellation,
  normalization, rounding, and special value behavior.

## Attempt Log

- Confirmed exact E4M3FN add semantics.  NaNs canonicalize to `8'h7f`; `-0 +
  -0` returns `8'h80`; normal zero cancellations return positive zero.
- `semantic_add_scaled`: decode both operands to scaled integer magnitude,
  signed add/subtract, then threshold quantize.  Exact; best `1404/56/78624`
  with `abc_g_aig`.
- `semantic_add_norm`: leading-bit/RNE normalizer reduced area to about `922`
  but delay rose to `87`; ADP lost.
- `semantic_add_pair_delta`: sorted-magnitude same-sign/diff-sign correction
  lowered delay to `37` but area rose above `5.7k`; ADP lost.
- 2026-06-08 ex244 transfer check: exact same-sign sig/gap delta plus
  diff-sign arithmetic normalizer reached `1056/89/93984`; lower area but
  delay too high.  Full field-delta version reached `2713/40/108520`.  The
  ex244 `(gap,max_sig,min_sig)` threshold idea does not directly cover
  ex240 because diff-sign cancellation needs normalization depth.
- Shared-BDD variable orders using paired high-to-low operand bits produced a
  better shallow structural seed.  Best raw BDD was `2786/26/72436`; limited
  synthflow improved it to `2755/23/63365`, now current best.
- 2026-06-08 deeper BDD order refinement put exponent/magnitude bits first,
  then sign bits, then low mantissa bits.  Raw best was `2514/23/57822`;
  limited synthflow improved it to `2493/23/57339`, current best.
- Aligned 4-bit significand add/sub with local normalizer was exact but
  high-delay (`935/80/74800` best); it is a semantic check, not current best.
- 2026-06-08 deeper semantic add follow-up:
  - Gap clamping proved the semantic normalizer only needs a 9-bit local
    significand for meaningful correction; `norm9_clamped` improved to
    `767/67/51389`.
  - Replacing the priority/rounding normalizer with a local
    `sigval -> {exp_offset,rounded_sig}` table improved to `736/53/39008`.
  - Splitting same-sign and diff-sign paths showed gap-5 diff correction is
    exactly `maxc-1` only when `max_sig==8 && min_sig>=9`; the hybrid
    same-delta/diff-param source reached `778/50/38900`.
  - The best current source uses a hand-written same-sign GRS/RNE formula and
    the compact diff normalizer, reaching `590/51/30090` with official
    `evaluate.py` OK.  This is now the best ex240 frontend seed.
  - Direct `{min_eff,diff_sig}` diff table reduced little delay and raised
    area (`1078/49/52822`), so it is excluded.
  - `parallel_case` source hints did not change QoR under Yosys.
  - A fully formula-based diff-GRS normalizer matched the Python semantic
    model but the current Verilog candidate is not equivalent; keep it as a
    follow-up/debug direction, not a seed.
  - An accidental broad synthflow over all rows in `candidates.csv` repeated
    many old variants and found no better result; future synthflow checks
    should use a best-only seed CSV.

## Next Maintenance Items

- Future work should focus on a verified formula-based diff-sign
  cancellation/renormalization path.  The same-sign path is now compact; the
  remaining delay is in diff normalization and sign/magnitude selection.
