# ex240-ex244 Batch Frontend Attempts

Scope: first batch of the float conversion / fp8 add class.

Initial semantic pass completed on 2026-06-08.  All five cases were identified
as packed E4M3FN FP8 operations rather than 16-bit-to-8-bit conversions.

## Shared Questions

- Is each case a 16-bit float-to-fp8 conversion, packed fp8 add, or another
  related conversion/arithmetic operator?
- If conversion, what are the input and output formats, biases, rounding mode,
  saturation/overflow behavior, and NaN/inf policy?
- If packed add, what is operand byte order, whether byte swap is commutative,
  and which FP8 format is used?
- Which output bits are constant, shallow predicates, shared boundaries, or
  require local tables?
- Which reference rows are tiny enough to require a true word-level structure
  rather than structural table factoring?

## Batch Attempt Log

- Truth diagnosis showed `16 -> 8` packed-byte behavior.  `ex240`, `ex241`,
  and `ex244` are byte-swap symmetric; `ex242` and `ex243` are directional.
- Exact semantic hypotheses:
  - `ex240`: E4M3FN add, high byte + low byte.
  - `ex241`: E4M3FN multiply.
  - `ex242`: E4M3FN division, low byte / high byte.
  - `ex243`: E4M3FN fmod/remainder, low byte % abs(high byte).
  - `ex244`: E4M3FN hypot(abs(high byte), abs(low byte)).
- E4M3FN behavior inferred from truth:
  - sign bit is bit7, exponent is bits6:3, mantissa is bits2:0.
  - `exp=15,mant=7` is NaN; output canonical NaN is `8'h7f`.
  - No infinities; overflow/divide-by-zero nonzero saturates to `7'h7e`
    with the correct sign where applicable.
  - RNE tie-to-even behavior and signed zero behavior are needed for exactness.
- Created generator `student/generators/fp8_ex240_ex244_frontend.py`.
- Current best tracking stays in `student/results/current_best_by_case.csv`
  plus the run result CSVs.  Do not curate `student/seeds/float_fp8` until the
  full `ex240`-`ex254` class is complete.
- 2026-06-08 deep-structure follow-up:
  - Added `student/generators/fp8_ex240_ex244_deep_struct.py`.
  - `ex244` improved from `1532/33/50556` to `320/37/11840` by replacing the
    14-bit max/min correction table with exact `(exp_gap,max_sig,min_sig)`
    threshold correction plus saturation cap.
  - `ex241` product-normalize + 13 exceptions was exact but high-delay
    (`562/69/38778`), so the field-table seed remains best.
  - Current-best synthflow sweep for `ex240`-`ex243` did not find improvements;
    do not repeat broad Yosys flow scans for these sources without a new
    source structure.
- 2026-06-08 BDD-structure follow-up:
  - Tested whether ex244's sig/gap threshold idea transfers to `ex240`; it
    does not directly cover diff-sign cancellation, and exact variants lost on
    delay or area.
  - Shared-BDD paired-bit variable orders gave new structural bests for
    `ex240` and `ex243`: ex240 `2755/23/63365`, ex243 `3977/22/87494`.
  - The same BDD/bit-table direction did not improve `ex241` or `ex242`; their
    best seeds remain the semantic field/product and division formula
    structures.
  - Direct ABC truth strashing was exact but far too large for all four
    checked cases.
- 2026-06-08 arithmetic/nested follow-up:
  - `ex240`: refined BDD order improved to `2493/23/57339`; aligned
    significand semantic adder was exact but too deep.
  - `ex241`: nested exponent-sum then product table improved to
    `536/29/15544`.
  - `ex242`: clean sparse division field table improved slightly to
    `1266/20/25320`.
  - `ex243`: semantic modular-significand fmod structure improved to
    `1790/27/48330`, beating reference ADP.
  - `ex244`: BDD/direct-result/delta-BDD alternatives did not beat
    `320/37/11840`; current bottleneck remains threshold decode delay.
- 2026-06-08 deeper ex240/ex244 follow-up:
  - `ex240`: replacing the broad BDD seed with a semantic FP8 adder structure
    was the major win.  The useful decomposition is same-sign fixed GRS/RNE
    rounding plus a compact diff-sign local normalizer, with gap-clamped
    bypasses.  Current best improved from `2493/23/57339` to
    `590/51/30090`.
  - `ex240`: gap-5 diff correction has a small exact rule,
    `max_sig==8 && min_sig>=9 -> maxc-1`; direct `{min_eff,diff_sig}` tables
    and broad all-row synthflow were worse.
  - `ex244`: adding `max_eff` to the delta BDD key fixed the saturation
    context while preserving `maxc + delta`; current best improved from
    `320/37/11840` to `301/34/10234`.
  - `ex244`: max-eff threshold packs and broader single-seed synthflow did not
    beat the exp-first max-eff delta BDD.

## Reusable Lessons

- Start with byte-level semantic probes before assuming conversion.  This batch
  is packed FP8 arithmetic despite the class label including float conversion.
- Scaled integer semantic RTL is useful for proving the function but can create
  deep quantizer paths.
- Field-table decomposition by effective exponent and 4-bit significand is a
  large improvement over full 7-bit magnitude-pair tables for multiply/divide.
- For hypot, `max(abs(a),abs(b)) + delta` is the right semantic direction;
  exponent-gap guards and sig/gap threshold rewrites reduce area dramatically,
  but delay remains the main bottleneck under the current Yosys flow.
- Broad pair-correction tables can lower delay but often explode area; use them
  only as diagnostics for where a shallow formula should exist.
- Paired high-to-low shared-BDD ordering can be a useful fallback when the true
  arithmetic semantics are known but the source-level formula still has a deep
  normalization/modulo path.  Treat it as a structural seed, not a replacement
  for semantic RTL.
- For multiply and fmod, nested semantic tables can be much better than both
  compact exception formulas and flat case tables.  Use the outer arithmetic
  driver first (`exp_sum` or exponent `delta`), then the small product/residue
  key inside the group.
- For FP8 add, do not stop at shared BDD when the semantic path is deep.  Clamp
  exponent gaps first, separate same-sign and diff-sign paths, use fixed GRS
  rounding where possible, and keep only the cancellation normalizer as a
  small local table or formula.
- For hypot-style max-plus-delta structures, check whether the compact key is
  missing saturation context.  Adding only the necessary high-level context
  such as `max_eff` can beat both threshold packs and full result tables.
