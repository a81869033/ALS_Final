# ex255-ex279 Current Progress

This is the quick status page for the integer arithmetic group.

`ex255-ex279` already have an older verified integer frontend seed pool in
`student/runs/integer/ex255_ex279_current/`.  Some later `current_best` rows are
still baseline/backend AIGs because the existing semantic seed is worse than
the baseline for those cases.  Future work should start from the semantic
candidate pool, then produce better frontend Verilog/AIG seeds and update this
file after each run.

## Directory Map

- Class notes: `student/cases/ex255_ex279_integer_arithmetic/README.md`
- Group notes:
  - `student/cases/ex255_ex279_integer_arithmetic/ex255-259/frontend_attempts.md`
  - `student/cases/ex255_ex279_integer_arithmetic/ex260-264/frontend_attempts.md`
  - `student/cases/ex255_ex279_integer_arithmetic/ex265-269/frontend_attempts.md`
  - `student/cases/ex255_ex279_integer_arithmetic/ex270-274/frontend_attempts.md`
  - `student/cases/ex255_ex279_integer_arithmetic/ex275-279/frontend_attempts.md`
- Per-case notes: `student/cases/ex255_ex279_integer_arithmetic/exNNN/frontend_attempts.md`

## Current Known Best By Case

Source: `student/results/current_best_by_case.csv` after the latest refresh.

| Case | Semantics | Current best source | Area | Delay | ADP | Ref ADP | Ratio |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
| ex255 | unsigned 4x4 multiply | bit-column Wallace frontend seed | 87 | 13 | 1131 | 836 | 1.352871 |
| ex256 | unsigned 5x5 multiply | CSA AND-row + full CLA frontend seed | 159 | 18 | 2862 | 1911 | 1.497645 |
| ex257 | unsigned 6x6 multiply | CSA AND-row + hybrid CLA-from-bit3 frontend seed | 263 | 20 | 5260 | 3952 | 1.330972 |
| ex258 | unsigned 7x7 multiply | bit-column Wallace frontend seed | 351 | 25 | 8775 | 6289 | 1.395293 |
| ex259 | unsigned 8x8 multiply | bit-column Wallace + CLA frontend seed | 480 | 28 | 13440 | 10000 | 1.344000 |
| ex260 | signed 4x4 multiply | Baugh-Wooley Wallace reverse order + hCLA4 frontend seed | 88 | 13 | 1144 | 657 | 1.741248 |
| ex261 | signed 5x5 multiply | Baugh-Wooley Wallace + hybrid CLA frontend seed | 164 | 18 | 2952 | 2041 | 1.446350 |
| ex262 | signed 6x6 multiply | Baugh-Wooley Wallace + hybrid CLA frontend seed | 252 | 22 | 5544 | 4900 | 1.131429 |
| ex263 | signed 7x7 multiply | Baugh-Wooley Wallace outside order + hCLA1 frontend seed | 362 | 24 | 8688 | 6840 | 1.270175 |
| ex264 | signed 8x8 multiply | Baugh-Wooley Wallace reverse order + hCLA6 frontend seed | 486 | 27 | 13122 | 9724 | 1.349445 |
| ex265 | unsigned 4x4 division, dbz=max | cofactor bit-BDD word-mux frontend seed | 63 | 8 | 504 | 322 | 1.565217 |
| ex266 | unsigned 5x5 division, dbz=max | `{b[4:3],a[4]}` cofactor bit-BDD word-mux classifier frontend seed | 148 | 10 | 1480 | 848 | 1.745283 |
| ex267 | unsigned 6x6 division, dbz=max | hybrid top2 deeper cofactor bit-BDD word-mux frontend seed | 340 | 12 | 4080 | 2651 | 1.539042 |
| ex268 | unsigned 7x7 division, dbz=max | divisor-leading-range narrow quotient frontend seed | 199 | 53 | 10547 | 7446 | 1.416465 |
| ex269 | unsigned 8x8 division, dbz=max | radix-4 quotient digit divider frontend seed | 380 | 41 | 15580 | 11760 | 1.324830 |
| ex270 | square | square Wallace outside + carry-select-5 frontend seed | 191 | 17 | 3247 | 2076 | 1.564066 |
| ex271 | square | square Wallace outside + carry-select-4 frontend seed | 331 | 25 | 8275 | 5542 | 1.493143 |
| ex272 | square | square Wallace outside + carry-select-5 frontend seed | 507 | 32 | 16224 | 10880 | 1.491176 |
| ex273 | square | Wallace/csel lower + top4 BDD hybrid frontend seed | 797 | 33 | 26301 | 15078 | 1.744329 |
| ex274 | square | truncated Wallace/csel lower + top2 BDD hybrid frontend seed | 985 | 42 | 41370 | 21630 | 1.912621 |
| ex275 | integer sqrt | prefix5 shared-ge word-mux tree frontend seed | 43 | 7 | 301 | 204 | 1.475490 |
| ex276 | integer sqrt | prefix4 shared-ge range-classifier frontend seed | 101 | 10 | 1010 | 632 | 1.598101 |
| ex277 | integer sqrt | cofactor-4 reverse BDD word-mux frontend seed | 237 | 12 | 2844 | 1980 | 1.436364 |
| ex278 | integer sqrt | prefix5 range-classifier frontend seed | 502 | 14 | 7028 | 5198 | 1.352058 |
| ex279 | integer sqrt | radix-4 digit-sqrt frontend seed | 334 | 42 | 14028 | 10952 | 1.280862 |

## Existing Verified Seed Pool

- `student/runs/integer/ex255_ex279_current/results/candidates.csv`
- `student/runs/integer/ex255_ex279_current/results/best.csv`
- `student/work/reverse_integer_variants/exNNN/verilog/`
- `student/work/reverse_integer_variants/exNNN/aigs/`

The first optimization run should compare current best rows against this
semantic pool and then generate new exact frontend seeds case by case.

## Latest ex255-ex259 Notes

- ex256 has been deeply rechecked beyond the CSA/CLA seed.  Shared carry
  predicate experiments, weighted threshold predicates, minimized SOP
  predicates, and carry-state prefix networks were all verified where retained,
  but none beat `159/18/2862`.
- The current ex256 gap is not explained by independent column carry
  minimization.  A future large improvement likely needs a true shared
  multi-output compressor network over carry/save intermediates, not a
  final-output table or per-column predicate family.

## Latest ex260-ex264 Notes

- The signed multiply semantics were rechecked as two's-complement
  `signed(lowN) * signed(highN)`.
- The main source-level improvement was Baugh-Wooley signed partial products:
  complement the negative sign row/column, add correction constants, then
  compress with a Wallace-style tree.
- A hybrid final CLA starting at bit 4 was the second key improvement.  It
  kept most of the Baugh-Wooley delay reduction while avoiding the full-prefix
  area cost.
- Follow-up compressor item-order/final-merge refinement improved ex260,
  ex263, and ex264 without touching ex262: reverse+hCLA4 for ex260,
  outside+hCLA1 for ex263, and reverse+hCLA6 for ex264.
- ex261-ex264 are now within 1.5x reference.  ex260 remains outside 1.5x even
  after small-width hCLA/order sweeps, split-half, ANF, case-table,
  truth-direct, serial carry-state, QMC, and selected-bit override diagnostics.
- Additional ex260/ex263 deep follow-up found no new best.  Exact but losing
  directions included correction/sign-aware item ordering, pfx starts,
  constant-aware FA simplification, exact 4-input counters, unsigned-core
  high-correction, branch-by-sign signcase correction, shared multi-output BDD,
  modulo-only carry-drop, direct/wide signed `*` retry, and hand-written ex260
  sparse final merge.  Current bests remain ex260 `88/13/1144` and ex263
  `362/24/8688`.
- A later ex260 alternative semantic replay checked sign/magnitude, signed
  small-case, case-by-operand constant multiply, and shared BDD variants.
  These were exact but non-winning; best replay row was `190/9/1710`, lower
  delay but too much area.

## Latest ex265-ex269 Notes

- Semantics were rechecked as unsigned division: `a=in[N-1:0]`,
  `b=in[2N-1:N]`, output `max` when `b==0`, otherwise `a/b`.
- The best small/mid-width source family is an exact shared BDD quotient
  classifier.  `b_msb` order wins ex265, interleave MSB wins ex266, and a
  greedy adjacent-swap order wins ex267.
- For larger widths, full BDDs reduce delay but are too area-heavy.  ex268 is
  best with a divisor-leading-range source: high divisor bits select a narrow
  quotient-width division and low divisor uses direct division.  This brought
  ex268 within 1.5x reference.
- ex269 improved most from a shift-subtract source with `wreduce_abc_g_aig`,
  but remains outside 1.5x reference.  Denominator range split reduced delay in
  some variants but did not beat shift-subtract by ADP.
- Exact but rejected directions: broad threshold quotient classifiers,
  denominator-split threshold trees, constant-divisor smallcase tables,
  low-branch BDDs, low-branch restoring, selected low-bit BDD diagnostics,
  per-bit QMC/SOP, and delay-target synthflow replays.
- Follow-up on ex266/ex267/ex269 found the key missing arithmetic structure:
  higher-radix quotient digit selection.  Radix-4 shift/subtract improved
  ex267 to `196/25/4900` and ex269 to `380/41/15580`, putting ex269 within
  1.5x reference.  Mixed-radix tied ex267 but did not improve ex269.
- Additional ex266-centered follow-up found two small frontend improvements:
  ex266 per-output BDD interleave reached `150/12/1800`, and ex267 per-output
  searched-order BDD reached `321/15/4815`.  The ex267 radix-4 seed
  `196/25/4900` remains a useful low-area alternative.
- Further exact but rejected directions included binary-search quotient/product
  tests, high-bit hand formulas plus low-bit BDDs, denominator interval
  classifiers, compact radix digit flags, complemented-edge BDDs, high-bit
  residual shift/parallel classifiers, fully parallel quotient-threshold
  networks, small BDD QoR-order probes, and compact/complement transfer to
  ex269.  ex266 still needs a different shallow multi-output quotient
  classifier to approach reference delay `8`.
- A later ex266 shallow-classifier pass found that different structure:
  split by `{b[4:3],a[4]}`, build local per-bit BDD classifiers, then select a
  5-bit cofactor word with one shared mux.  This improved ex266 to
  `148/10/1480`.  It is still outside 1.5x reference, but it is materially
  closer and confirms the shared quotient-classifier direction.
- Transferring the cofactor word-mux idea improved ex265 to `63/8/504` and
  ex267 to `326/14/4564`.  The best tested transfer selector was
  `bhi3+ahi1`.  The same approach was exact but area-heavy for ex268/ex269, so
  those wider cases remain on divisor-range/radix arithmetic sources.
- A later high-gap selector follow-up improved ex267 again to `340/12/4080`.
  The useful source keeps low quotient bits on a cheaper magnitude cofactor
  selector and uses a deeper selector only for the top two quotient bits.
  Fully deep selectors reached delay 11 but lost by area; ex266 did not
  improve under the same deeper-selector family.
- Another ex266 selected-bit hybrid pass found no new best.  The closest row
  lowered area to 142 but raised delay to 11, losing ADP to `148/10/1480`.

## Latest ex270-ex274 Notes

- Semantics were rechecked as unsigned square `x*x`, with widths 8/10/12/14/16
  and full 2N-bit outputs.  `out[1]` is constant zero for all five cases.
- Direct `x*x` and earlier semantic square sources were replaced by a
  square-specific triangular partial-product network: diagonal `x[i]` terms
  plus one shared cross term `x[i]&x[j]` for `i<j`, shifted to column `i+j+1`.
- Wallace-style square-column compression with outside item ordering was the
  best compressor source family.
- Explicit carry-select final adders were the key follow-up improvement over
  hCLA/prefix final adders.  Winning group sizes are csel5 for ex270/ex272,
  csel4 for ex271, csel8 for ex273, and csel6 for ex274.
- ex271 and ex272 are now within 1.5x reference.  ex270 is close at 1.56x.
  ex273/ex274 remain delay-dominated outliers.
- Exact but rejected directions: direct square with Yosys flow replays,
  low/high split, low-bit cofactor constant-multiply, full-word case tables for
  ex270/ex271, column-count carry-state classifiers, Dadda+csel, larger
  carry-select groups, exact 4-input column counters, LUT-to-AIG mapping, and
  default/no-internal-ABC flow replays.
- Deeper ex273/ex274 follow-up found a useful high-bit hybrid: replace only
  selected high output bits with reverse-order BDDs.  ex273 improved to
  `797/33/26301` with top4 BDD; ex274 improved to `985/42/41370` with a
  truncated lower square plus top2 BDD.
- Further exact but rejected directions for the outliers: full shared BDD
  despite low delay, per-bit BDD beyond ties, non-contiguous high-bit subsets,
  high-bit cofactor plus low-square submodule, block4/nibble decomposition,
  alternate compressor ordering, and explicit 4:2 column counters.
- A second ex273/ex274 follow-up did not improve current bests.  Additional
  exact but rejected directions were threshold/range high-bit classifiers,
  radix-4 Booth squarer, block column carry-select, factored full-adder
  compressors, truncated+hCLA final adders, ex274 fine csel groups, MSB split
  formula, mixed BDD+comparator high bits, alternate selected-BDD variable
  orders, and limited delay-target synthflow.  Bests remain ex273
  `797/33/26301` and ex274 `985/42/41370`.
- A third targeted ex273/ex274 follow-up checked the remaining obvious
  low-delay gaps: top5/top6 BDD replacement, Yosys `booth` pass on `$mul`
  sources, lower ABC delay targets, full hybrid BDD plus prefix/hCLA lower
  arithmetic, and `abc -g AND` synth-preset.  All were exact but non-winning.
- A later high-gap compressor follow-up tested full-width balanced CSA rows,
  half-product decomposition, and pairwise adder trees.  These were exact but
  much worse than current triangular column Wallace/carry-select hybrids; the
  square outliers still need a new carry-sharing/final-carry representation.
- A selected mid/high-bit BDD follow-up on ex270/ex273/ex274 also found no new
  best.  Mid-bit BDDs reduced delay in some rows but area grew too much, so the
  square gap still points to the arithmetic compressor/final-carry source.

## Latest ex275-ex279 Notes

- Semantics were rechecked as unsigned floor integer square root `isqrt(x)`.
  Widths are 8->4, 10->5, 12->6, 14->7, and 16->8.
- The first useful source family for small/mid widths is a grouped range
  classifier.  Later shared-boundary and shared-word-selector rewrites improved
  ex275 to `43/7/301` and ex276 to `101/10/1010`.
- Cofactored local BDDs are useful at ex277: a 4-bit prefix split with reverse
  local BDDs and a shared word mux reached `237/12/2844`, within 1.5x
  reference.
- ex278 is best with `prefix5_range` at `502/14/7028`.  ex279 is best with a
  low-area radix-4 digit sqrt at `334/42/14028`; the high delay is offset by a
  much smaller area than prefix/table alternatives.
- Exact but rejected directions included direct trial-square, restoring radix-2,
  threshold chain/XOR/popcount, bit-interval OR, full small case tables,
  full-output BDDs, BDD order presets, radix8/radix16, support-reduced per-bit
  formulas, one-hot prefix decode, high-bit formulas plus low BDD, QM/SOP
  covers, prefix base+delta, and limited Yosys gate/synthflow checks.
- ex275 and ex277-ex279 are now within 1.5x reference.  ex276 remains outside;
  the likely missing piece is a shallower shared multi-output classifier rather
  than more independent comparator/range variants.
- A later ex276 follow-up tested hand-derived high-bit formulas plus prefix
  shared-ge low bits and a square-threshold word tree.  Both were exact but
  worse than `101/10/1010`, indicating that q4/q3 alone are not the bottleneck.
- A second ex276 threshold-toggle pass using direct `ge(q*q)` XOR formulas was
  also exact but worse (`130/11/1430` best), ruling out the simple
  threshold-XOR representation.
  Bests remain ex273 `797/33/26301` and ex274 `985/42/41370`; the likely
  missing piece is a genuinely shallower square-column compressor/final-carry
  source, not more high-bit table/classifier expansion.
