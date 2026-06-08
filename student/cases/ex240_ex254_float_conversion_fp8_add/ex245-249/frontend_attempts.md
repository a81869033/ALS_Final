# ex245-ex249 Batch Frontend Attempts

Scope: second batch of the float conversion / fp8 add class.

Initial status: folders and notes created for future runs. Do not copy
`ex240`-`ex244` conclusions blindly; use them only as hypotheses after exact
truth diagnosis.

## Batch Attempt Log

- 2026-06-08 `ex245_ex249_frontend_fp8_e5m2_curated_20260608_1715`:
  identified this batch as E5M2FN packed FP8 arithmetic, not conversion.
  Format: sign bit 7, exponent bits 6:2, mantissa bits 1:0, effective
  subnormal exponent 1, `mag=7'h7f` as canonical NaN, max finite `7'h7e`,
  RNE tie-to-even.
- Semantics verified over all 65536 inputs:
  - `ex245`: add high byte + low byte.
  - `ex246`: multiply high byte * low byte.
  - `ex247`: divide low byte / high byte.
  - `ex248`: fmod low byte % high byte, sign from low byte.
  - `ex249`: hypot of operand magnitudes, positive sign.
- Current verified bests:

| Case | Best candidate | Area | Delay | ADP | Ref ADP | Ratio |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| ex245 | `ex245_semantic_add_gap_class_synth_preset_aig` | 701 | 34 | 23834 | 11050 | 2.156923 |
| ex246 | `ex246_semantic_mul_product_dc_seed12_set11to10_synth_preset_aig` | 341 | 22 | 7502 | 2805 | 2.674510 |
| ex247 | `ex247_semantic_div_bound_smallpat_nested_den_synth_preset_aig` | 365 | 25 | 9125 | 2975 | 3.067227 |
| ex248 | `ex248_semantic_fmod_periodic_rem_abc_g_aig` | 285 | 30 | 8550 | 4180 | 2.045455 |
| ex249 | `ex249_semantic_hypot_threshold_rawexp_synth_preset_aig` | 168 | 26 | 4368 | 2079 | 2.101010 |

- Official `evaluate.py` replay: all five best AIGs OK.
- Useful structures found:
  - E5M2 add: large table and full-width arithmetic were poor.  Best is a
    small-gap class formula: gap passthrough for inactive regions, and
    `(gap,max_sig,min_sig)` class formula for the exact local normalizer.
  - E5M2 multiply: nested `exp_sum/product` table improved the baseline; a
    product-class exponent-offset formula improved further.  A deeper
    don't-care completion pass on unreachable product codes lowered ex246 to
    `341/22/7502`.
  - E5M2 division: nested delta table improved baseline; a ratio
    `{sig_num,sig_den}` class formula improved further.
  - E5M2 fmod: raw `%` synthesized terribly; hand-derived periodic
    `2^delta mod sig_d` remainder was the useful structure.
  - E5M2 hypot: max+delta BDD was exact but high delay; raw-exponent gap0/gap1
    threshold case with explicit saturation guard is the current best.
- Excluded or deprioritized:
  - Broad full-output BDDs are exact but too large except as diagnostics.
  - Direct 35-bit add normalizer has very high delay.
  - Verilog `%` for fmod creates very deep AIGs.
  - `abc -D` delay-target checks on the ex249 threshold source did not improve
    over the normal limited synthflow rows.
- 2026-06-08 ex246/ex247 deep follow-up:
  - ex246 product-code don't-care completion is worth reusing for small FP
    arithmetic when a semantic intermediate has unreachable values.
  - ex246 random completion extension seeds 120-299 did not beat the current
    seed12-family best; best was `343/22/7546`, with a low-area but slower
    `340/23/7820` seed.
  - ex247 did not improve from possible-row factoring, denominator-zero
    don't-care completion, ordered row completions, synthflow replay,
    selected-bit BDD overrides, shared/split attribute RTL, a
    quotient-threshold comparator normalizer, reciprocal-product qclass, or
    generic logcode/normsplit.
  - Additional high-impact ex246/ex247 rewrites also failed to beat current:
    direct SOP classifier, two-level nested mux, grouped identical case blocks,
    and ex247 invalid-row random don't-care completion.
  - A new ex247 bound-smallpat denominator-nested structure improved division
    to `365/25/9125`: it stores quotient boundary attributes plus a 2-bit
    underflow pattern instead of the full small-delta table.  This is now the
    best ex247 frontend seed; the main remaining issue is delay 25.
- 2026-06-08 ex250 product-factoring transfer check:
  - ex246 sig-product-code table plus seed12 product-code completion was exact
    and reduced delay to 21, but best ADP was `364/21/7644`, worse than
    `341/22/7502`.  Low-area seed228 and case-attribute versions were also
    worse.
  - ex247 bound-smallpat class-id factoring compressed 49 sigpair rows to 29
    unique attributes, but the extra indirection was too deep; best
    `421/31/13051`, worse than `365/25/9125`.
  - Lesson: ex250-style magnitude/product factoring is useful only when it
    removes a genuinely expensive product table/core.  For ex246 it is a
    delay-only near miss; for ex247 direct denominator-nested attributes are
    better than a separate internal class-id table.
