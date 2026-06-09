# ex274 Frontend Attempts

Semantics: square, `x * x`.

Initial current semantic best:
- `ex274_square_direct`: 1846/72/132912

Notes:
- Largest square case in this group.  Decompose into smaller products or
  explicit compressor-style accumulation before considering backend passes.

2026-06-09 update:
- Verified exact unsigned 16-bit square.
- New frontend best after deeper follow-up: `985/42/41370`, ratio 1.912621
  to reference.
- Best source: hand-truncated lower Wallace/carry-select square for bits 0..29
  plus reverse-order BDD for the top 2 output bits.
- Still outside 1.5x.  Top2/top3 full arithmetic hybrid came close but did not
  beat the truncated version.  Non-contiguous high-bit BDD subsets, top-bit
  flow replays, full BDD, high-cofactor, block4 decomposition, alternate
  compressor order, and 4:2 counters were exact or diagnostic but worse.

2026-06-09 second follow-up:
- Current best remains `985/42/41370`.
- New exact but rejected structures: threshold/range top-bit classifiers,
  radix-4 Booth squarer, block column carry-select, factored full-adder
  compressors, truncated+hCLA, fine csel groups, MSB split formula, mixed
  BDD+comparator high bits, alternate selected-BDD variable orders, and limited
  delay-target synthflow.
- Closest misses: `hybrid_bddtop3_trunc` `1011/41/41451`,
  `hybrid_rangetop2_trunc` `990/42/41580`, and
  `hybrid_bddtop2_cmp1_trunc` `1015/41/41615`.  They lower delay or approach
  area, but none beat the top2 truncated BDD hybrid by ADP.

2026-06-09 third targeted follow-up:
- Current best remains `985/42/41370`.
- Tested top5/top6 selected-BDD hybrids, Yosys `booth` pass on `$mul` sources,
  lower ABC delay targets, full hybrid BDD plus prefix/hCLA arithmetic lower
  network, and `synth -flatten` with `abc -g AND`.
- Best new rows: top5 BDD `1150/40/46000`, lower-D replay tied current
  `985/42/41370`, full hybrid+prefix `992/44/43648`, and AND synthflow
  `1297/41/53177`.
- Takeaway: extra high-bit replacement can lower delay, but the area penalty
  dominates.  The top2 truncated BDD hybrid is still the best frontend seed
  found so far.
