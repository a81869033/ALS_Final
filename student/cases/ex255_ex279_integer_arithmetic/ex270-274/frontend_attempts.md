# ex270-ex274 Frontend Attempts

Batch scope: integer square.

Initial verified semantics from existing integer seeds:

- `ex270`: x * x
- `ex271`: x * x
- `ex272`: x * x
- `ex273`: x * x
- `ex274`: x * x

Existing variants include direct square, shift-add, and symmetric terms.
`ex270` currently has a baseline row better than the semantic square seed, so
future frontend work should focus on square-specific sharing instead of generic
multiply.  Try triangular partial products, cross-term doubling, carry-save
trees, and selected high/low bit formulas.

## 2026-06-09 square-specific frontend pass

Truth semantics were rechecked with `student.frontends.truth.TruthTable`
(`abc_xf` order): all five cases are exact unsigned `x*x`.

| Case | Width | Previous best | New best | Ref ADP | Ratio | Best source |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| ex270 | 8 -> 16 | 495/11/5445 | 191/17/3247 | 2076 | 1.564066 | square Wallace outside + carry-select-5 |
| ex271 | 10 -> 20 | 664/40/26560 | 331/25/8275 | 5542 | 1.493143 | square Wallace outside + carry-select-4 |
| ex272 | 12 -> 24 | 923/46/42458 | 507/32/16224 | 10880 | 1.491176 | square Wallace outside + carry-select-5 |
| ex273 | 14 -> 28 | 1308/61/79788 | 797/33/26301 | 15078 | 1.744329 | Wallace/csel lower + top4 BDD hybrid |
| ex274 | 16 -> 32 | 1846/72/132912 | 985/42/41370 | 21630 | 1.912621 | truncated Wallace/csel lower + top2 BDD hybrid |

Main useful structure:
- Generate only triangular square partial products.
- Diagonal terms use `x[i]` directly.
- Cross terms `x[i]&x[j]` for `i<j` are generated once and shifted to
  column `i+j+1`, representing the factor-of-two cross term.
- Compress square columns with Wallace-style 3:2 compressors.
- Use an explicit carry-select final adder.  Carry-select group size is
  case-dependent: 5 for ex270/ex272, 4 for ex271, 8 for ex273, 6 for ex274.

Rejected or non-winning directions:
- Direct `x*x` with multiple Yosys flows remained much worse.
- Low-bit cofactor / constant-multiply decomposition was exact but slower and
  larger for the wide cases.
- Full-word case table helped neither ex270 nor ex271.
- Column-count carry-state case logic was exact but serialized the critical
  path too much.
- Exact 4-input column counters were tried as a shallower compressor variant,
  but did not beat the 3:2 Wallace outside + carry-select winners.
- LUT-to-AIG mapping increased both area and delay.
- Default/no-internal-ABC Yosys flows did not improve over `abc_g_aig` /
  `synth_preset` on the winning source.

Current main run:
- `student/runs/integer/ex270_ex274_square_carryselect2_20260609_1138/results/best.csv`
- Work files under `student/work/ex270_ex274_square_carryselect2_20260609_1138/`

## 2026-06-09 ex273/ex274 deeper follow-up

New useful direction:
- Shared/per-bit BDD for only selected high output bits, combined with the
  square Wallace/carry-select arithmetic source for the remaining lower bits.
- ex273 improved to `797/33/26301` by replacing the top 4 output bits with a
  reverse-order BDD while retaining arithmetic lower bits.
- ex274 improved to `985/42/41370` by replacing only the top 2 output bits
  with reverse-order BDDs and using a hand-truncated lower square so the
  arithmetic network only generates the remaining lower 30 bits.

Additional rejected or non-winning directions:
- Compressor item ordering other than outside, including natural, reverse,
  center, and even/odd with carry-select.
- Explicit hand-written 4:2 column counters.  They reduced ex274 delay in some
  rows but area grew too much.
- High-bit cofactor with low-square submodule.  Exact, but case/mux and
  constant shift-add delay were much worse.
- Full shared-BDD reverse order gave low delay but unusably high area:
  ex273 `10671/25/266775`, ex274 `31130/28/871640`.
- Non-contiguous high-bit BDD subsets for ex274 did not beat contiguous top2.
- Per-bit BDD tied ex273 top4 but did not improve ex274.
- Block4/nibble decomposition into small products was exact but much slower.

## 2026-06-09 ex273/ex274 second deeper follow-up

No new best was found.  Current bests remain:

| Case | Current best | Ref ADP | Ratio | Best source |
| --- | ---: | ---: | ---: | --- |
| ex273 | 797/33/26301 | 15078 | 1.744329 | reverse-order top4 BDD + Wallace/csel lower |
| ex274 | 985/42/41370 | 21630 | 1.912621 | truncated Wallace/csel lower + reverse-order top2 BDD |

New exact but rejected directions:
- Threshold/range top-bit classifiers.  Direct monotonic threshold bits and
  binary range trees were exact but slightly worse than selected BDDs.  Best
  rows: ex273 `hybrid_cmptop4_trunc` `802/33/26466`, ex274
  `hybrid_rangetop2_trunc` `990/42/41580`.
- Radix-4 Booth-style squarer.  Balanced signed Booth rows were exact but much
  slower (`ex273 1388/63`, `ex274 1797/73`); CSA Booth rows exposed signed
  modulo issues and were not pursued because the exact balanced source was
  already far from competitive.
- Column-count carry-select over blocks.  Exact, but block mux/state logic was
  much larger and deeper (`ex273 1998/66`, `ex274 2933/73`).
- Factored full-adder compressors sharing propagate between sum/carry.  Exact
  and lower-area, but high-delay: ex273 `681/51`, ex274 `913/61`.
- Truncated lower square plus hCLA/prefix final adder.  Exact but worse than
  carry-select; ex273 best hCLA row `795/36`, ex274 `1021/43`.
- Fine csel group replay for ex274 top2/top3/top4 truncated hybrids.  The
  closest row `1013/42/42546` did not beat top2 default `985/42/41370`.
- MSB split formula `x^2 = r^2 + (r << n) + 2^(2n-2)` for `x[n-1]=1`.  Exact
  and low-area but too slow: ex273 `709/49`, ex274 `967/58`.
- Mixed BDD/comparator high-bit correction.  Exact but did not beat pure BDD:
  ex273 `804/33`, ex274 `1015/41`.
- Alternate BDD variable orders for selected high bits.  Outside order improved
  some non-winning top2 rows but did not beat MSB-first top4/top2 winners.
- Limited `abc -g aig -D*` / `synth_preset_d*` replay on close sources tied or
  missed current best; no backend portfolio was run.

## 2026-06-09 ex273/ex274 third targeted follow-up

No new best was found.  Current bests remain:

| Case | Current best | Ref ADP | Ratio | Best source |
| --- | ---: | ---: | ---: | --- |
| ex273 | 797/33/26301 | 15078 | 1.744329 | reverse-order top4 BDD + Wallace/csel lower |
| ex274 | 985/42/41370 | 21630 | 1.912621 | truncated Wallace/csel lower + reverse-order top2 BDD |

New exact but rejected directions:
- Top5/top6 selected-BDD probe.  It confirmed the high-bit break can reduce
  delay, but area grows too quickly: ex273 top5 `876/32/28032`, ex274 top5
  `1150/40/46000`.
- Yosys `booth` frontend pass on `$mul`-preserving sources.  Exact but much
  worse than square-specific partial products: best rows were ex273
  `1147/46/52762` and ex274 `1531/52/79612`.
- Lower ABC delay targets `D12/D14` on close current-best sources.  These tied
  or missed: ex273 `798/33/26334`, ex274 `985/42/41370` tie.
- Full hybrid BDD + prefix/hCLA arithmetic lower network.  Exact but delay did
  not improve over carry-select: ex273 `738/39/28782`, ex274 `992/44/43648`.
- `synth -flatten` with `abc -g AND` instead of `abc -g aig`.  Exact but area
  increased without useful delay gain: ex273 `971/33/32043`, ex274
  `1297/41/53177`.

Conclusion for this pass:
- The remaining gap is not from using too few high-bit BDDs or from an
  untested Yosys arithmetic pass.  Better ADP likely needs a genuinely
  shallower square-column compressor/final-carry source, not broader
  threshold, BDD, Booth, case-table, or delay-target variants.

## 2026-06-09 High-Gap Compressor Follow-Up

Additional run/result location:

- `student/runs/integer/ex273_ex274_frontend_square_highgap_struct_20260609_1738/results/`

Tested new source families:

- Full-width balanced CSA rows over all diagonal/cross square terms, with
  carry-select final adders.
- Half-product decomposition: `lo^2 + 2*lo*hi + hi^2`.
- Pairwise balanced adder tree over shifted square terms.

Result:

- No new best.  Best rows from this run were much worse than current bests:
  ex273 `750/46/34500` and ex274 `973/58/56434`.
- The full-row CSA variants created zero-heavy wide vector logic.  They were
  exact, but delay stayed far above the triangular column Wallace/carry-select
  seeds.

Updated interpretation:

- ex273/ex274 still need a genuinely shallower square-column compressor or
  final-carry representation.  Broad full-row CSA, half-product, and adder-tree
  source rewrites should not be repeated unless paired with a new carry-sharing
  mechanism.

## 2026-06-09 Selected Mid-Bit BDD Follow-Up

Additional run/result locations:

- `student/runs/integer/ex270_frontend_square_selected_bdd_20260609_1808/results/`
- `student/runs/integer/ex273_ex274_frontend_square_midbdd_20260609_1758/results/`

Tested:

- Selected middle/high output-bit BDD overrides combined with arithmetic lower
  square logic.  This checked whether the critical path was in mid/high carry
  propagation rather than only the top output bits.

Result:

- No new best.  ex270 could lower delay to 15, but area rose to 353, making
  ADP worse than `191/17/3247`.
- ex273/ex274 selected mid-bit BDDs were much larger than the current high-bit
  hybrids.  Best rows were ex273 `1621/31/50251` and ex274 `2117/40/84680`.

Conclusion:

- Selected output-bit BDDs can reduce delay but are too expensive outside the
  already discovered sparse top-bit replacement.  The remaining square gap is
  still in the arithmetic compressor/final-carry representation.
