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

## 2026-06-13 mixed-r25 official rows

Run ID: `ex200_ex299_frontend_refgap_round25_20260613_0506`, agent `mixed-r25`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/mixed-r25/ex273/notes/dossier.md`.
- Official rows:
  - `ex273_r25_int_highgap_square_hybrid_bdd_mid4_synth_preset_d32`: `1788/34/60792`.
  - `ex273_r25_int_highgap_square_fullrow_csa_csel8_abc_g_aig`: `1003/49/49147`.
- Failed source-emission row: `ex273_r25_int_highgap_square_halfprod_lowheavy_abc_g_aig` failed Yosys parsing due a zero-width integer constant in the generated Verilog; log `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/mixed-r25/ex273/logs/ex273_r25_int_highgap_square_halfprod_lowheavy_abc_g_aig.yosys.log`.
- Outcome: official rows are equivalent but nonwinning versus frontend `797/33/26301`; mid-bit BDD recut and full-row CSA do not close the final-carry gap. Next action should target the current top4-BDD lower-square final adder directly rather than broad mid-bit or full-row rewrites.

## 2026-06-13 mixed-r26 official rows

Run ID: `ex200_ex299_frontend_refgap_round26_20260613_0539`, agent `mixed-r26`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/mixed-r26/ex273/notes/dossier.md`.
- Official rows:
  - `ex273_r26_square_frontend_hybrid_bddtop4_trunc_csel3_synth_preset_d32`: `787/36/28332`.
  - `ex273_r26_square_frontend_wallace_square_outside_csel4_abc_g_gates`: `727/38/27626`.
  - `ex273_r26_square_frontend_hybrid_bddtop4_order_outside_synth_preset_d32`: `864/34/29376`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/mixed-r26/candidates.csv` and `evaluation_results.csv`.
- Outcome: all rows are official equivalent but nonwinning versus frontend `797/33/26301`. The Wallace outside row saves area but delay is too high; csel/order recuts do not beat the current top4-BDD lower-square balance.

## 2026-06-13 sub-integer-r74 official rows

Run ID: `frontend_source_parallel_round74_20260613_1439`, agent `sub-integer-r74`.

- `ex273_r74_square_split7_cross`: low7/high7 square plus one cross product; official `evaluate.py` equivalent, `893/62/55366`.
- `ex273_r74_square_low4_case`: low4 square case plus high arithmetic square/cross; official `evaluate.py` equivalent, `957/48/45936`.
- Shard rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-integer-r74/candidates.csv`.
- Logs: `student/work/frontend_source_parallel_round74_20260613_1439/sub-integer-r74/ex273/logs/`.
- Outcome: both are nonwinning versus current frontend `797/33/26301`. Coarse block split and low-bit constant case reduce neither the lower-square carry pressure nor the selected high-bit delay enough; do not repeat unchanged.

## 2026-06-14 arith-unary-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `arith-unary-r2`.

- Families tested: factored Wallace square with carry-select merge; hybrid top-bit BDD plus truncated lower-square carry-select variants.
- Official best from this shard: `ex273_square_hybrid_bddtop2_trunc_csel10_synth_preset_d24` at `726/39/28314`.
- Outcome: all rows were official equivalent but nonwinning versus frontend `797/33/26301`; lower area did not compensate for the added delay.
