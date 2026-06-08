# ex247 Frontend Attempts

Function hypothesis: E5M2FN packed FP8 division, low byte / high byte.

Reference row: area/delay/ADP/score = `175/17/2975/4462.5`.

Current known best:
`ex247_semantic_div_bound_smallpat_nested_den_synth_preset_aig`,
`365/25/9125`, ratio `3.067227`.

## Attempt Log

- 2026-06-08: exact semantic match for E5M2FN low/high division with RNE,
  sign xor, divide-by-zero saturation, and canonical NaN.
- Tried and excluded:
  - nested exponent-delta/significand table: exact, best `630/22/13860`.
  - semantic-key BDD/full-output BDD: exact but larger.
- Best structure: ratio class formula by `{sig_num,sig_den}`.  The class
  drives an exponent-delta offset/mantissa formula plus exact low/high boundary
  exceptions.
- 2026-06-08 deeper pass: no new best over `420/22/9240`.  Official
  `evaluate.py` replay on the current best AIG is still `OK 420/22/9240`.
- Additional structures tried and excluded:
  - possible-row and special-row factoring: exact after renderer fix; best
    `411/23/9453` lowered area but delay increase lost ADP.
  - denominator-zero don't-care completions: exact, best `426/22/9372`.
  - ordered row-major completions: exact; zero/saturation versions reproduced
    `420/22/9240`, copy variants were worse.
  - limited synthflow on the current source: no improvement over the existing
    `synth_preset_aig` row.
  - selected output-bit BDD override: exact but worse; best `463/22/10186`,
    bit0 reached delay `21` only by increasing area to `538`.
  - shared attribute and split-attribute hand-written structures: exact after
    fixing divide-by-zero/zero/saturation priority, but much worse
    (`450/27/12150` and `457/27/12339`).
  - quotient threshold/comparator normalizer: exact and more semantic, but
    Yosys built a deep comparator chain; best `447/32/14304`.
  - direct sigpair classifier SOP plus small-mag SOP: exact, but area-only
    improvement was cancelled by delay; best `419/26/10894`.
  - two-level nested denominator/numerator mux: exact but much worse; best
    `607/25/15175`.
  - grouped identical case blocks: exact, kept delay `22` but area rose to
    `437`, ADP `9614`.
  - random invalid sigpair don't-care completion seeds 0-119: exact but not
    useful; best seed49 `440/24/10560`.
- 2026-06-08 qclass/small-pattern pass:
  - reciprocal-multiply structure was implemented as denominator reciprocal
    `floor(128/sig_d)` times numerator significand, followed by a compact
    quotient classifier.  It was exact but much worse: best `437/41/17917`.
  - qclass + formulaic 2-bit underflow pattern was exact and informative:
    nested-den best `309/30/9270`, a low-area high-delay near miss.
  - direct case-inside small-pattern replacement was exact but worse:
    `455/27/12285`.
  - bound-smallpat classifier, nested by denominator, became the new best:
    `365/25/9125`.  It stores `zero_hi/sat_lo/offset/mant/smallpat` instead
    of a full low-delta table, then reconstructs low underflow with four
    2-bit patterns.
  - numerator-first nesting and case attributes were exact but did not beat
    denominator-first: best `376/25/9400`.
  - log-code and normal/subnormal split were rechecked after fixing the
    generator `render_div_logcode` return path; exact but worse (`427/25/10675`
    and `555/25/13875`).
- Follow-up should focus on reducing the new bound-smallpat nested-den delay
  from 25 without reintroducing the full low-delta table.  Repeating broad row
  completion, flat BDD override, reciprocal-product classification, or generic
  normal/subnormal split is unlikely to produce a large jump.
- 2026-06-08 ex250 product-factoring transfer check:
  - Factored the 49 denominator/numerator bound-smallpat rows into a
    sigpair-to-class-id table plus a shared attribute table.  The 49 rows only
    have 29 unique attribute tuples, so this was a plausible internal-classifier
    rewrite.
  - Exact results were much worse: nested class-id best `421/31/13051`, flat
    class-id best `424/32/13568`; case attributes did not improve it.
  - Conclusion: for ex247, the current denominator-first bound-smallpat table is
    better kept as one direct attribute lookup.  The extra class-id indirection
    lengthens the critical path and should not be repeated as-is.
