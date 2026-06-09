# ex255-ex279 Integer Arithmetic Notes

Purpose: track case-by-case attempts to reconstruct and improve semantic RTL
for the integer arithmetic class.

This folder is for notes only.  Generated Verilog, AIGs, logs, manifests, and
CSV results must follow `student/docs/experiment_run_workflow.md`.

For current status, read `CURRENT_PROGRESS.md` first.

## Class Scope

`introduction.md` identifies this group as integer arithmetic:

- unsigned multiplication
- signed multiplication
- unsigned division
- square
- integer square root

The existing seed set lives in:

- `student/runs/integer/ex255_ex279_current/`
- `student/work/reverse_integer/`
- `student/work/reverse_integer_variants/`

## Required Baselines

- Use `student/frontends/truth.py` / ABC `read_truth -xf` indexing.
- Verify every Verilog/AIG candidate with the official `evaluate.py` flow.
- Do not place generated artifacts in `output/`.
- Do not run backend optimization portfolios unless explicitly requested.
- Keep generated work in `student/work/<run_id>/` and result CSVs in
  `student/runs/integer/<run_id>/results/`.
- Do not curate `student/seeds/integer/` until the whole class has a reviewed
  seed bundle, or the user explicitly asks for seed curation.

## Initial Semantic Map

Treat this as the starting hypothesis from existing verified integer seeds,
not as a reason to skip truth/equivalence checks.

- `ex255-ex259`: unsigned multiply, split input into low/high N-bit operands.
- `ex260-ex264`: signed multiply, split input into low/high N-bit signed
  operands.
- `ex265-ex269`: unsigned division `a / b`, with divide-by-zero saturation to
  max output.
- `ex270-ex274`: square `x * x`.
- `ex275-ex279`: integer square root `isqrt(x)`.

## Optimization Directions To Track

- Multiplication: direct `*`, partial products, Wallace/CSA-style trees,
  Booth/sign handling, operand-width-specific factoring, and output-bit
  sharing.
- Signed multiplication: sign/magnitude decomposition, two's-complement direct
  multiply, Baugh-Wooley-like source structure, and absolute-value sharing.
- Division: denominator-specialized quotient tables, restoring/non-restoring
  divider, reciprocal/threshold classifier, quotient-bit predicates, and
  divide-by-zero saturation guard placement.
- Square: exploit symmetry, cross-term sharing, triangular partial products,
  low/high product decomposition, and shallow carry-save accumulation.
- Integer square root: restoring sqrt, threshold-chain classifier, digit-by-
  digit predicates, grouped threshold ranges, and selected-bit formulas.

## Lessons From ex255-ex259

- For unsigned multiply, direct `*` is a correct semantic seed but not always
  the best frontend source.  The old direct source also zero-extended operands
  to the full output width before multiplying, which hurt larger widths.
- Vector CSA is a useful first rewrite, especially with explicit AND/concat
  partial-product rows.
- Bit-column Wallace compression was the best new structure for this batch:
  it only creates compressors for real partial-product columns and avoids
  full-width zero-heavy CSA rows.
- Prefix final adders are case-dependent.  They helped ex257/ex259 in the
  bit-column Wallace form, but not generic CSA.
- Booth, Dadda, operand-constant case, shared-BDD, no-internal-ABC, high-bit
  correction, split-half, Karatsuba, sorted operands, and column-carry were
  exact or diagnostic but did not beat the Wallace/CSA bests for ex255-ex259.
- ex256 remains the hard unsigned multiply outlier: current best `150/21/3150`
  is close in area to reference `147/13/1911`, but delay remains high.

## Lessons From ex260-ex264

- Direct signed multiply and sign/magnitude `abs_sign` are good semantic
  baselines, but they leave too much sign-extension and final-negation delay.
- Radix-4 Booth helped once fixed, and parallel Booth rows improved larger
  widths, but the recoder mux/control path still lost to Baugh-Wooley.
- Baugh-Wooley signed partial products were the key source rewrite: replace
  negative sign-row/sign-column weights with complemented partial products and
  constants, then compress the resulting unsigned column set.
- Baugh-Wooley Wallace compression plus hybrid final CLA was the first best
  family.  A later refinement showed the compressor item order and hCLA start
  should be tuned per width: reverse+hCLA4 for ex260, hCLA4 for ex261/ex262,
  outside+hCLA1 for ex263, and reverse+hCLA6 for ex264.
- Dadda scheduling, sign-bit override, exact ANF formulas, full case tables,
  split-half 2+2, serial column carry-state, minimized carry SOP, full QMC
  per-bit SOP, selected high-bit QMC override, and direct truth AIG were exact
  or diagnostic but did not beat the best Baugh-Wooley order/hCLA sources.
- Deeper ex260/ex263 follow-up also rejected correction/sign-aware item
  ordering, segment-prefix pfx starts, exact 4-input counters, unsigned-core
  high-correction, branch-by-sign correction, shared multi-output BDD,
  modulo-only final carry-drop, and hand-written sparse ex260 final merge.
  The tied ex263 modulo-carry source is cleaner but not lower ADP.
- A later ex260 replay of sign/magnitude, signed small-case, case-by-operand
  constant multiply, and shared BDD variants found no new best.  Constant-case
  can lower delay to 9 but area is far too high, so the missing structure is
  still a compact shared signed 4x4 compressor.

## Lessons From ex265-ex269

- Direct `/` plus divide-by-zero saturation is the semantic baseline, matching
  `introduction.md`, but it leaves high delay for wider unsigned division.
- For ex265-ex267, a shared BDD/decision-DAG quotient classifier is the useful
  frontend rewrite.  The variable order matters: divisor MSB first is best for
  ex265, interleaved MSB order for ex266, and a greedy adjacent-swap refinement
  for ex267.
- For ex268/ex269, full BDDs and broad threshold classifiers reduce delay but
  are too area-heavy.  Larger widths need algorithmic source rewrites instead.
- Divisor-leading-range decomposition is useful when it actually narrows the
  quotient width.  It produced the ex268 best by splitting high-divisor paths
  into narrow quotient divisions while keeping the low-divisor path direct.
- ex269 remains the hard divider outlier.  Shift-subtract slightly beats the
  direct/safe divider, while split-direct, low-branch BDD, low-branch
  restoring, constant-divisor smallcase, QMC/SOP, and delay-target synthflow
  checks were exact but worse.
- Deeper ex266/ex267/ex269 follow-up found the missing divider structure:
  radix-4 quotient digit selection.  It reduced the serial quotient decision
  stages and improved ex267 to `196/25/4900` and ex269 to `380/41/15580`.
  Radix-8 had lower delay but too much area; mixed-radix and narrow-remainder
  variants did not beat plain radix-4.
- Fixed-point reciprocal tables with exact one-step correction, MTBDD
  word-level classifiers, custom BDD orders, high-bit BDD/direct hybrids, and
  leading-range threshold classifiers were all exact or diagnostic but did not
  beat the current winners.
- A later ex266-focused pass showed per-output BDDs can be slightly better than
  a shared BDD when cross-bit sharing hurts synthesis.  ex266 improved to
  `150/12/1800`; ex267 improved to `321/15/4815`, trading area for lower delay
  and slightly beating radix-4 ADP.
- Complemented-edge BDDs, high-bit hand formulas plus low-bit BDDs, residual
  high-bit dividers, compact radix digit flags, fully parallel quotient
  thresholds, and small BDD QoR-order probes were exact but did not expose the
  missing shallow ex266 structure.  ex266 remains the hard division outlier.
- The next ex266 pass did expose a better shallow classifier: cofactor by
  `{b[4:3],a[4]}`, build local per-bit BDDs, reassemble each cofactor into a
  quotient word, and use one shared word mux.  This reached `148/10/1480`.
  The lesson is to search for magnitude selector keys and shared word-level
  muxing before trying more BDD orders.
- The same cofactor word-mux family transferred to ex265 and ex267.  Generic
  `bhi3+ahi1` selectors improved ex265 to `63/8/504` and ex267 to
  `326/14/4564`.  It did not transfer to ex268/ex269 because the local BDD
  area grew too quickly, despite much lower delay.
- A later ex267 pass found a useful top-bit hybrid of the same idea:
  lower quotient bits use the cheaper cofactor selector, while the top two
  quotient bits use a deeper magnitude selector.  This reached `340/12/4080`.
  Full deeper selectors reached delay 11 but lost by area, so future work
  should look for a more compact way to share that top-bit classifier rather
  than simply adding selector variables.
- The same selected-bit hybrid idea did not help ex266: the closest row lowered
  area but increased delay to 11, losing to the current `148/10/1480`.

## Lessons From ex270-ex274

- All five cases are exact unsigned square `x*x`; the input widths are
  8/10/12/14/16 and outputs are full 2N-bit products.
- Generic `x*x` is correct but a poor frontend seed.  A square-specific
  triangular partial-product source is much better: use diagonal bits directly
  and generate each cross term once, shifted by one extra column.
- Wallace compression over actual square columns is the winning compressor
  family so far.  Outside item ordering is consistently best or tied.
- The important second-stage improvement was replacing the final prefix/hCLA
  adder with a carry-select final adder.  Group size is width-dependent and
  should be tuned locally.
- Low-bit cofactor decomposition, full-word case tables, column-count
  carry-state logic, exact 4-input column counters, direct square synthflow
  replays, LUT-to-AIG mapping, and Dadda+csel were exact or diagnostic but did
  not beat the Wallace/carry-select family.
- The first useful outlier follow-up was a selected high-bit BDD hybrid.  For
  ex273, top4 reverse-order BDD bits plus arithmetic lower bits reduced delay
  from 37 to 33.  For ex274, the winning version also hand-truncates the lower
  arithmetic square and uses BDD only for the top 2 bits, improving from
  `964/44/42416` to `985/42/41370`.
- Full-output BDDs had attractive delay but unusable area.  High-bit BDDs must
  be selected sparingly and combined with a pruned arithmetic lower network.
- A second ex273/ex274 pass rejected several plausible low-delay rewrites:
  threshold/range high-bit classifiers, radix-4 Booth squaring, block
  column-count carry-select, factored full-adder compressors, truncated+hCLA,
  MSB split, mixed BDD+comparator bits, alternate selected-BDD variable orders,
  and limited delay-target synthflow.  The main remaining frontend gap is a
  genuinely shallower square compressor/final-carry structure, not more broad
  table or case decomposition.
- A later high-gap compressor follow-up tested full-width balanced CSA rows,
  half-product decomposition, and pairwise adder trees.  They were exact but
  much worse than current triangular column Wallace/carry-select hybrids, so
  the remaining square gap is still specifically a square-column/final-carry
  sharing problem.
- Selected mid/high-bit BDD overrides for ex270/ex273/ex274 also lost by area.
  They can lower delay, but only the sparse top-bit replacement discovered
  earlier is close to competitive.

## Lessons From ex275-ex279

- All five cases are exact unsigned floor integer square root `isqrt(x)`.
  The input/output widths are 8->4, 10->5, 12->6, 14->7, and 16->8.
- Direct trial-square and textbook restoring sqrt are good semantic baselines
  but synthesize too deep for the smaller cases.
- Grouped range classification is the useful small-width structure.  Splitting
  by high input bits and assigning each output bit separately (`prefix4_bitwise`)
  improved ex275 and ex276 substantially.
- A later shared-boundary rewrite improved the small cases again.  For ex275,
  `prefix5_ge_tree_lsb` builds local threshold/ge wires and selects the whole
  output word through an LSB-first mux tree, reaching `43/7/301` and putting
  the case within 1.5x reference.  For ex276, `prefix4_ge_bitwise` shares local
  ge predicates across output bits and reaches `101/10/1010`.
- Cofactor BDDs are useful only at the right granularity.  ex277 improved with
  a 4-bit high-prefix split, local reverse-order BDDs, and a shared word mux.
  Full BDDs or arbitrary BDD order sweeps did not beat the best source rows.
- Larger widths need algorithmic source structure again: ex278 is best with
  prefix5 range classification, while ex279 is best with a radix-4 digit sqrt
  source that trades high delay for very low area.
- Exact but rejected directions: threshold chain/XOR/popcount, bit interval
  OR, full case tables, restoring radix-2, radix8/radix16 variants,
  support-reduced per-bit formulas, one-hot prefix decode, high-bit hand
  formula plus low BDD, QM/SOP covers, prefix `base + delta`, and limited
  Yosys gate/synthflow checks.
- Additional ex276 checks rejected mixed prefix4/prefix5 selected-bit hybrids,
  prefix6 tree/bitwise classifiers, deeper cofactor BDDs, low-bucket
  refinement, high-bit ANF/support plus prefix4 low bits, selected low-bit
  cofactor BDD plus ANF high bits, and gateflow replay on the new best.
- ex276 remains just outside 1.5x reference.  The evidence points toward a
  missing shared multi-output classifier; repeating independent comparator,
  prefix, BDD-order, ANF, or SOP variants is unlikely to produce a large drop.
- A later hand-high-bit follow-up confirmed q4/q3 replacement and balanced
  square-threshold word trees are not enough; the lower shared classifier is
  still the likely bottleneck.
- Direct `ge(q*q)` threshold-toggle formulas for ex276 were exact but far
  larger than the prefix4 shared-ge classifier, so simple threshold-XOR logic
  is not the missing representation.
- A third targeted pass confirmed the same conclusion.  Top5/top6 BDD
  replacement lowers delay slightly but the area penalty dominates; Yosys
  `booth`, lower `abc -D` targets, full hybrid BDD plus prefix/hCLA lower
  arithmetic, and `abc -g AND` synth-preset all missed.  Do not keep widening
  high-bit classifiers for ex273/ex274 unless there is a new sharing idea for
  the lower square compressor.

## Maintenance Rule

After finishing any case:

- Record case-specific attempts, failed hypotheses, exact candidates, and QoR
  in that case's `frontend_attempts.md`.
- Promote reusable class-level lessons into this README.
- Update `CURRENT_PROGRESS.md`, the batch note, run registry, and current-best
  CSVs when a new verified result is produced.
