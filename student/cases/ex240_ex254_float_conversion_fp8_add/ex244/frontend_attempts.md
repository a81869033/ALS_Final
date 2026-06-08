# ex244 Frontend Attempts

Function hypothesis: E4M3FN FP8 hypot, `sqrt(abs(high)^2 + abs(low)^2)`.

Reference row: area/delay/ADP/score = `356/12/4272/6408.0`.

Current known best:
- Source: `student/results/current_best_by_case.csv` and the run result CSVs.
- Variant: `ex244_semantic_hypot_delta_maxeff_bdd_expfirst_synth_preset_aig`
- QoR: `301/34/10234`
- Reference ADP: `4272`
- Ratio: `2.395599`
- Classification: `semantic_exact`

## Diagnostics To Run

- Verify width, support, constant bits, bit entropy, and special input classes.
- Infer whether this is conversion or packed fp8 add.
- The small reference ADP suggests a compact conversion/remap or very shallow
  arithmetic structure; try semantic remapping before structural tables.

## Attempt Log

- Confirmed hypot semantics.  Input signs are ignored; NaN canonicalizes to
  `8'h7f`; output sign bit is always zero.
- `semantic_hypot_mag_table`: exact full 7-bit magnitude pair table; best
  `2420/22/53240`.
- `semantic_hypot_max_delta`: output is `max(abs(a),abs(b)) + delta`; reduced
  area to `1536` but delay rose to `34`, ADP `52224`.
- `semantic_hypot_gap_delta`: bypasses correction when exponent gap is at
  least 3; new best `1532/33/50556`.
- `semantic_hypot_run_delta`: per-max min-threshold runs reduced source size
  but delay stayed high; best `1630/35/57050`, not retained as best.
- 2026-06-08 deep structure: proved exact correction can be reduced from
  `{max_code,min_code}` to `(exp_gap,max_sig,min_sig)` plus saturation cap.
  `semantic_hypot_sig_gap_delta` reached `344/36/12384`; threshold-run source
  improved to `320/37/11840`, a 76.6% ADP reduction versus the previous
  `50556` best.
- Parallel OR-of-condition delta bits were exact but did not beat threshold
  runs (`338/36/12168` best).  Limited Yosys synthflow on the threshold source
  also did not beat `320/37/11840`.
- 2026-06-08 follow-up:
  - Full shared-BDD sources reached `695/22/15290`; lower delay but worse ADP.
  - BDD synthflow improved delay to `21` but still worse ADP (`712/21/14952`).
  - Direct result table for small exponent gaps was exact but much larger
    (`1142/33/37686` best).
  - Delta-only BDD was not equivalent as written because `gap/max_sig/min_sig`
    alone is insufficient for all saturated cases without adding max exponent,
    which collapses back toward the direct-result table.
- 2026-06-08 deeper follow-up:
  - Exact delta BDD with key `{max_eff,gap[1:0],max_sig,min_sig}` fixes the
    saturation-context issue while keeping the output as `maxc + delta`.
  - The exp-first order reached `301/34/10234`, improving the previous
    `320/37/11840` threshold seed by about 13.6% ADP.
  - A max-eff threshold-pack source was exact but worse (`351/40/14040` best);
    keeping max exponent in the packed threshold table raised area without
    enough delay improvement.
  - Single-seed broader Yosys synthflow on the max-eff BDD did not beat the
    generator result; best synthflow row was `307/34/10438`.

## Next Maintenance Items

- Area is now below reference area (`301` vs `356`), but delay remains high
  (`34` vs `12`).  Future work should target a shallower boolean form for the
  three delta bits or reduce the max/min comparator plus delta-decode critical
  path.
