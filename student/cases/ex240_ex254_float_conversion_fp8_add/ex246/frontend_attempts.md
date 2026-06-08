# ex246 Frontend Attempts

Function hypothesis: E5M2FN packed FP8 multiply, high byte * low byte.

Reference row: area/delay/ADP/score = `187/15/2805/4207.5`.

Current known best:
`ex246_semantic_mul_product_dc_seed12_set11to10_synth_preset_aig`,
`341/22/7502`, ratio `2.674510`.

## Attempt Log

- 2026-06-08: exact semantic match for E5M2FN multiply with RNE, sign xor,
  and canonical `8'h7f` NaN.
- Tried and excluded:
  - nested `exp_sum/product` table: exact, best `408/23/9384`.
  - hand-written product leading-bit normalizer: exact but delay around 38-41.
  - semantic-key BDD and full-output BDD: exact but larger.
  - sig-pair class without multiplier: exact but did not beat product class.
- Best structure: product-class exponent-offset formula.  The 3-bit product
  selects a dominant exponent offset/mantissa class plus exact underflow and
  saturation boundary exceptions.
- 2026-06-08 deeper pass: unreachable 3-bit product codes are exact
  don't-cares.  Random and neighbor product-code completions showed that this
  is a real synthesis lever, not just a table variant.  Seed12-family
  completions lowered both area and delay; official `evaluate.py` replay on
  the selected AIG is `OK 341/22/7502`.
- Tried and excluded in the deeper pass:
  - fixed low/high/nearest completions: exact, best `341/23/7843`.
  - random completions seeds 0-119: found seed12-family `341/22/7502`; later
    seeds found lower area `340` only with delay `23`, so ADP was worse.
  - single swaps from seed12 to seed72: exact but collapsed to `340/23/7820`.
  - single-neighbor changes around seed12: many tied `341/22/7502`; none
    improved ADP.
  - full synthflow on the seed12 source: `synth_preset_aig` stayed best.
- Follow-up random seeds 120-299 all exact but did not beat seed12-family.
  Best in that range was seed132 at `343/22/7546`; low-area seed228 reached
  `340/23/7820`.  This suggests product-code completion alone has mostly
  saturated; a future improvement needs either a source rewrite that lowers
  delay on a `340/23`-style seed or a different multiply-core representation.
- 2026-06-08 high-impact structure pass:
  - direct sigpair classifier SOP plus small-mag SOP was exact but worse:
    `426/25/10650`.
  - two-level nested sig mux was exact but much worse: best `628/28/17584`.
  - grouped identical case blocks preserved exactness but hurt QoR:
    `351/24/8424`.
- 2026-06-08 small-pattern/logcode follow-up:
  - product qclass + 2-bit underflow pattern reduced area to `309` but delay
    rose to `33`, so ADP was worse (`309/33/10197`).
  - case-inside small-pattern and bound-smallpat rewrites were exact but did
    not preserve the current best delay; bests were `371/24/8904` and
    `338/30/10140`.
  - log-code normal/subnormal semantic RTL was exact and reached delay `21`,
    but area was too high (`455/21/9555`).
  - normal/subnormal split attribute RTL was rechecked and remained worse:
    `514/24/12336`.
  These results suggest current Yosys/ABC sharing depends on the flat product
  case shape; the next large jump likely needs a genuinely different arithmetic
  encoding, not another sigpair/product mux rewrite.
- 2026-06-08 ex250 product-factoring transfer check:
  - Replaced `sig3(am) * sig3(bm)` with a 3-bit significand product-code table,
    then reused the seed12 product-class don't-care completion.  This was exact
    and lowered delay to 21, but area rose; best `364/21/7644`, so it did not
    beat the current `341/22/7502`.
  - Case attributes did not change the result.  Repeating the same source with
    low-area seed228 completion was also exact but worse: best `369/22/8118`.
  - Conclusion: the ex250 magnitude/sign factoring idea partially transfers to
    ex246 as a delay-reduction near miss, but the extra 3-bit product-code table
    costs more area than the saved multiplier logic.  Do not rerun this exact
    product-code variant unless a new way to share or compress the table is
    found.
