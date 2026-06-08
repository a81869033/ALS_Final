# ex240-ex254 Float Conversion / FP8 Add Notes

Purpose: track case-by-case attempts to reconstruct real semantic RTL from
truth tables for the `ex240`-`ex254` class.

This folder is for notes only. Generated Verilog, AIGs, logs, manifests, and
CSV results must use the run layout from
`student/docs/experiment_run_workflow.md`.

For the latest all-case status, read `CURRENT_PROGRESS.md` first.

## Class Scope

`introduction.md` identifies `ex240`-`ex254` as float conversion and fp8 add.
Earlier metadata probes indicate this group is likely `16 -> 8`, but every run
must verify width, input order, and truth convention from the actual truth
tables before making semantic assumptions.

## Required Baselines

- Use `student/frontends/truth.py` / ABC `read_truth -xf` indexing.
- Verify every Verilog/AIG candidate with the official `evaluate.py` flow.
- Do not place generated artifacts in `output/`.
- Do not run backend optimization portfolios unless explicitly requested.
- Keep curated, future backend seeds in `student/seeds/`; keep bulky generated
  work under `student/work/` or `student/archive/`.

## Initial Semantic Directions

Treat these as hypotheses, not templates:

- Float conversion from a 16-bit source format to an 8-bit output format.
- Packed fp8 add where the 16-bit input may contain two 8-bit operands.
- FP8 encodings may be E4M3, E5M2, BF8-like, or benchmark-specific; infer sign,
  exponent width, mantissa width, bias, special values, and rounding from truth.
- Conversion cases should inspect zero, subnormal, normal, inf, NaN,
  saturation, underflow, overflow, signed zero, and rounding ties.
- Add cases should inspect operand packing order, sign relation, alignment,
  cancellation, normalization, rounding, saturation, NaN/inf behavior, and
  commutativity under byte swap.

## Lessons To Reuse Without Overfitting

- Prior BF16/FP16 wins came from semantic structure plus exact local tables, not
  broad variant generation.
- A useful flow is: truth diagnosis, semantic hypothesis ranking, small exact
  experiments, then source-level rewrites guided by area/delay/ADP.
- Source entry count is not a QoR proxy; Yosys AIG area/delay/ADP decides.
- Shared predecode, nested local LUTs, shallow exception/default guards, and
  selected-bit formulas can help only when diagnostics show real shared
  boundaries or critical bits.
- Do not blindly repeat broad casez tables, large PLAs, full packed tables, or
  parameter sweeps without a structural reason.
- If a low-area candidate has high delay, try a shallower source rewrite. If a
  low-delay candidate has high area, look for shared decode or local factoring.

## Maintenance Rule

After finishing any case:

- Record case-specific attempts, failed hypotheses, exact candidates, and QoR
  in that case's `frontend_attempts.md`.
- Promote reusable class-level lessons into this README.
- Update `CURRENT_PROGRESS.md`, the batch note, run registry, and current-best
  CSVs when a new verified result is produced.

After finishing the whole class:

- Curate backend-start seeds into `student/seeds/float_fp8/`.
- Keep `ex240_ex254_current/` as the best-only bundle.
- Keep `ex240_ex254_backend_candidates_*/` as the non-best alternative bundle;
  target four alternatives per case so each case has five total frontend seeds
  for later backend optimization.

## 2026-06-08 ex240-ex244 Lessons

- The first batch is packed FP8 arithmetic, not 16-bit-to-8-bit conversion:
  `ex240=add`, `ex241=multiply`, `ex242=low/high division`,
  `ex243=fmod low % abs(high)`, and `ex244=hypot(abs(high),abs(low))`.
- The inferred format is E4M3FN-like: sign bit 7, exponent bits 6:3,
  mantissa bits 2:0, `exp=15,mant=7` as NaN, canonical output NaN `8'h7f`,
  no infinities, max finite `7'h7e`, RNE tie-to-even, and signed zero where the
  operation semantics require it.
- Scaled integer semantic RTL is useful for exactness checks, but large
  threshold quantizers synthesize with high delay.
- For multiply/division, decompose to effective exponent and 4-bit
  significand before building any table.  This was a major improvement over
  7-bit magnitude-pair tables.
- For division, exponent-delta formula plus boundary exceptions can reduce
  area, but the exception path can increase delay; keep both formula and
  field-table seeds as backend starting points.
- For hypot, use `max(abs(a),abs(b)) + delta`; exponent-gap bypass is exact
  when the gap is at least 3.  A stronger exact structure is
  `(exp_gap,max_sig,min_sig)` delta plus saturation cap; this reduced ex244
  from `50556` ADP to `11840`, with area below reference but delay still high.
  Future hypot work should focus on shallower delta-bit logic rather than
  larger max/min code tables.
- For fmod, default/pass-through and zero regions exist, but the remaining
  modulo core still needs quotient/range structure; broad exception tables only
  give small frontend improvement.
- For add/fmod, shared-BDD sources with paired high-to-low operand bit ordering
  can beat hand-written semantic table/default sources when cancellation or
  modulo normalization remains too deep.  This improved ex240 to
  `2755/23/63365` and ex243 to `3977/22/87494`; classify these as exact
  structural seeds, not fully recovered semantic RTL.
- For add, the BDD fallback was superseded by semantic source decomposition:
  clamp exponent-gap bypasses, use a fixed same-sign GRS/RNE path, and keep
  diff-sign cancellation in the smallest exact local normalizer.  This reduced
  ex240 further to `590/51/30090`; future add work should target the diff
  normalizer, not broad pair tables.
- The ex244 sig/gap threshold trick is not automatically transferable.
  ex240's diff-sign cancellation requires additional normalization state, and
  ex241/ex242 multiply/division did not benefit from broad BDD or bit-table
  variants.
- For ex244-style hypot, the compact `(gap,max_sig,min_sig)` delta key can miss
  saturation context.  Adding `max_eff` to the delta BDD key preserved the
  `maxc + delta` structure and improved ex244 to `301/34/10234`; threshold
  packs with max exponent were exact but worse.
- Nested arithmetic-key tables are now a core direction for this class.  For
  ex241, outer `exp_sum` then product table improved ADP to `15544`.  For
  ex243, outer exponent delta then modular significand residue table improved
  ADP to `48330`, beating reference.  Prefer this kind of semantic nesting
  before broad flat tables.

## 2026-06-08 ex245-ex249 Lessons

- The second batch is the E5M2FN counterpart of the packed FP8 arithmetic
  cases: `ex245=add`, `ex246=multiply`, `ex247=low/high division`,
  `ex248=fmod low % high`, and `ex249=hypot(abs(high),abs(low))`.
- E5M2FN format inferred from truth: sign bit 7, exponent bits 6:2, mantissa
  bits 1:0, subnormal effective exponent 1, `mag=7'h7f` as canonical NaN,
  max finite `7'h7e`, and RNE tie-to-even.
- For E5M2 add, full pair tables and full-width decoded integer adders are the
  wrong starting point.  The useful semantic structure is small-gap only:
  same-sign gaps above 3 and diff-sign gaps above 4 are passthrough; active
  regions use `(gap,max_sig,min_sig)` class formulas with exponent boundary
  guards.  This improved ex245 to `701/34/23834`.
- For E5M2 multiply, a product-class exponent-offset formula beats nested
  `exp_sum/product` tables.  The 3-bit product selects a dominant mantissa
  class plus exact underflow/saturation exceptions.  Unreachable product codes
  are useful don't-cares for synthesis; seed12-family product completion
  improved ex246 to `341/22/7502`.  A larger random completion sweep
  confirmed this is near a local limit for the current source form: it found
  `340/23` low-area seeds but no `340/22` or lower-ADP candidate.
  Direct sigpair SOP, nested sig mux, and grouped-case rewrites were all exact
  but worse, so do not repeat those before finding a new arithmetic encoding.
- For E5M2 division, the first useful source was a ratio class by
  `{sig_num,sig_den}` with exponent-delta offset/mantissa and boundary
  exceptions (`420/22/9240`).  A deeper follow-up found a better
  denominator-nested bound-smallpat form: the classifier emits
  `zero_hi/sat_lo/offset/mant/smallpat`, and low underflow is reconstructed
  from four 2-bit patterns instead of a full small-delta table.  Current ex247
  best is `365/25/9125`.
  Deeper row-completion, denominator-zero don't-care, selected-bit BDD, and
  split-attribute RTL attempts did not improve it.  A quotient-threshold
  comparator normalizer was exact but too deep (`447/32/14304`), and a true
  reciprocal-product qclass was also too deep (`437/41/17917`).  Future work
  should reduce bound-smallpat delay without falling back to a full low table,
  instead of repeating flat special-path variants.
  Direct SOP classifier, nested mux, grouped case, and random invalid-row
  don't-care completion were also exact but worse.
- For E5M2 fmod, do not use Verilog `%` on a shifted wide value.  Since
  `sig_d` is only 1..7, derive the periodic `2^delta mod sig_d` remainder and
  keep the small normalizer/table.  This improved ex248 to `285/30/8550`.
- For E5M2 hypot, nonzero delta exists only for effective exponent gap 0 or 1.
  A raw-exponent gap0/gap1 threshold case plus explicit saturation guard
  improved ex249 to `168/26/4368`.  Area is already below reference; future
  work should focus on reducing delay without turning the source into a long
  BDD chain.
- Limited `abc -D` delay-target synthflow on the ex249 threshold source did not
  change the measured AIG.  Treat synthflow checks as confirmation, not as the
  main optimization path.

## 2026-06-08 ex250-ex254 Lessons

- The final batch is not a simple FP8 conversion/add set.  Truth behavior
  shows packed FP4/INT2 arithmetic feeding E4M3FN-style output:
  `ex250=two-lane FP4 E2M1 dot`, `ex251=two-lane signed 3-bit magnitude dot`,
  `ex252=four-lane unsigned 2-bit dot`, `ex253=2*sum(unsigned 2-bit lanes)`,
  and `ex254=E4M3 accumulator plus a low-byte FP4 E2M1 product`.
- FP4 E2M1 nibbles use bit 3 as sign and bits 2:0 as finite-only E2M1
  magnitude with values `0,1,2,3,4,6,8,12`.  Signed zero matters: for ex250
  and ex251, zero dot results are negative only when both lane products are
  negative zero; for ex254, `-0 + -0` stays `-0`.
- For ex250/ex251, exact E4 quant case is better than a generic normalizer or
  range comparator.  For FP4 specifically, the product core should be factored
  into 3-bit magnitude decode/product plus sign xor instead of a full signed
  product table.  This improved ex250 from `598/43/25714` to `413/41/16933`,
  beating reference.  ex251 remains `495/38/18810`, also beating reference.
- For ex252/ex253, source-level arithmetic shape matters.  Rewriting serial
  `+ + +` expressions into balanced product/sum trees improved ex252 to
  `145/21/3045`; hand-written 2x2 product logic tied this but did not improve
  ADP.  For ex253, separate low-bit/high-bit popcounts are better than summing
  2-bit lanes directly, improving to `126/18/2268`.  Parallel-case hints,
  2D quant tables, and minimized output-bit formulas did not beat the retained
  structures.
- For ex254, the a-ha structure is not `product + accumulator -> wide
  quantizer`.  Convert the FP4 product to an E4M3 operand and reuse the compact
  E4 add GRS/diff-normalizer source from ex240.  Factoring the product-to-E4
  conversion into magnitude table plus sign/negative-zero logic improved ex254
  to `662/55/36410`, beating reference.  Full BDD and nested accumulator remap
  reduced delay but used too much area; generic qcase/qrange/qnorm quantizers
  were ADP-worse.
