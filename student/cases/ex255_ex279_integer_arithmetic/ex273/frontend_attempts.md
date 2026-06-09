# ex273 Frontend Attempts

Semantics: square, `x * x`.

Initial current semantic best:
- `ex273_square_direct`: 1308/61/79788

Notes:
- High delay is the main issue; try shallow decomposition and selected high-bit
  formulas.

2026-06-09 update:
- Verified exact unsigned 14-bit square.
- New frontend best after deeper follow-up: `797/33/26301`, ratio 1.744329
  to reference.
- Best source: Wallace/carry-select arithmetic lower network plus reverse-order
  BDD for the top 4 output bits.
- Still outside 1.5x, but delay improved from 37 to 33.  Full BDD, per-bit BDD,
  high-cofactor, block4 decomposition, alternate compressor order, and 4:2
  counters did not beat the top4 hybrid.

2026-06-09 second follow-up:
- Current best remains `797/33/26301`.
- New exact but rejected structures: threshold/range top-bit classifiers,
  radix-4 Booth squarer, block column carry-select, factored full-adder
  compressors, truncated+hCLA, MSB split formula, mixed BDD+comparator high
  bits, alternate selected-BDD variable orders, and limited delay-target
  synthflow.
- Best close misses: `hybrid_bddtop2_trunc_order_outside` `734/36/26424`,
  `hybrid_cmptop4_trunc` `802/33/26466`, and `hybrid_bddtop2_cmp2_trunc`
  `804/33/26532`.  None beat the top4 BDD hybrid.

2026-06-09 third targeted follow-up:
- Current best remains `797/33/26301`.
- Tested top5/top6 selected-BDD hybrids, Yosys `booth` pass on `$mul` sources,
  lower ABC delay targets, full hybrid BDD plus prefix/hCLA arithmetic lower
  network, and `synth -flatten` with `abc -g AND`.
- Best new close rows: top5 BDD `876/32/28032`, lower-D replay
  `798/33/26334`, full hybrid+prefix `738/39/28782`, and AND synthflow
  `971/33/32043`.
- Takeaway: replacing more high bits can lower delay by one level, but the BDD
  area cost is too high.  The remaining improvement likely has to come from a
  shallower square-column compressor or final-carry source.
