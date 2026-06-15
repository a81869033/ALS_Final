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

## 2026-06-12 mixed-r12 official row

Run ID: `ex200_ex299_frontend_refgap_round12_20260612_2015`, agent `mixed-r12`.

- Method signature: `ex274|unsigned_square_karatsuba8_shared|karatsuba_8x8_square_split|shared_lo_hi_squares_and_sum_square_cross_term|yosys_abc_g_aig|unsigned_16_square|word_output`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/mixed-r12/ex274/verilog/ex274_square_karatsuba8_shared.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/mixed-r12/ex274/synthflow/ex274/aigs/ex274_karatsuba8_shared_abc_g_aig.aig`.
- Official `evaluate.py`: equivalent, `1304/72/93888`; log `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/mixed-r12/ex274/logs/ex274_karatsuba8_shared_abc_g_aig.evaluate.py.log`.
- Outcome: nonwinning. The large-grain Karatsuba split is much deeper than the top2 truncated BDD hybrid, so the remaining gap still points to compressor/final-carry sharing rather than product decomposition.

## 2026-06-12 integer-struct-r16 official rows

Run ID: `ex200_ex299_frontend_refgap_round16_20260612_2233`, agent `integer-struct-r16`.

- First-priority checkpoint outcome recorded in shard CSVs under `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round16_20260612_2233/agent_shards/integer-struct-r16/`.
- Method signature: `ex274|top-bit_cofactor_plus_factored_lower_square_compressor_can_reduce_final_carry_cost|top2_BDD_replacement_with_factored_truncated_square_lower_network|shared_top-bit_BDD_cofactors_plus_lower_square_propagate/generate_factoring|yosys_abc_g_aig|unsigned_16_square|top2_cofactor_lower30_word`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex274/verilog/ex274_r16_hybrid_bddtop2_trunc_factored.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex274/aigs/ex274_r16_hybrid_bddtop2_trunc_factored_abc_g_aig.aig`.
- Official `evaluate.py`: equivalent, `910/64/58240`; log `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex274/logs/ex274_r16_hybrid_bddtop2_trunc_factored_abc_g_aig.evaluate.py.log`.
- Outcome: nonwinning. Factoring the lower truncated square lowered area versus the current `985/42/41370` frontend but added too much delay. The companion factored full-square/csel8 rows were also exact but worse (`882/71/62622` best), so this round reinforces that ex274 needs a lower-delay final-carry/compressor representation, not more lower-area factored compressors.

## 2026-06-12 integer-near-r17 hard-checkpoint row

Run ID: `ex200_ex299_frontend_refgap_round17_20260612_2300`, agent `integer-near-r17`.

- Method signature: `ex274|algebraic_even_odd_square_identity_can_share_cross_terms|bit_lane_even_odd_square_cross_from_sum_square|shared_sparse_even_odd_lanes_and_cross_term_via_sum_square|yosys_abc_g_aig|unsigned_16_square|full_square_word`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round17_20260612_2300/integer-near-r17/ex274/verilog/ex274_r17_evenodd_square_shared_cross.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round17_20260612_2300/integer-near-r17/ex274/aigs/ex274_r17_evenodd_square_shared_cross_abc_g_aig.aig`.
- Official `evaluate.py`: equivalent, `2199/79/173721`; log `student/work/ex200_ex299_frontend_refgap_round17_20260612_2300/integer-near-r17/ex274/logs/ex274_r17_evenodd_square_shared_cross_abc_g_aig.evaluate.py.log`.
- Outcome: diagnostic nonwinner. The sparse even/odd lane identity is materially different from the banned round16 top-BDD/factored lower-square replay, but it maps to three large square/multiply cones and is much worse than the current frontend `985/42/41370`. Do not repeat this identity unchanged; a viable ex274 arithmetic path still needs lower-delay square-column/final-carry sharing.

## 2026-06-13 mixed-r25 official rows

Run ID: `ex200_ex299_frontend_refgap_round25_20260613_0506`, agent `mixed-r25`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/mixed-r25/ex274/notes/dossier.md`.
- Official rows:
  - `ex274_r25_int_highgap_square_hybrid_bdd_top2_mid2_synth_preset_d40`: `2097/42/88074`.
  - `ex274_r25_int_highgap_square_fullrow_csa_csel8_abc_g_aig`: `1344/48/64512`.
- Failed source-emission row: `ex274_r25_int_highgap_square_halfprod_lowheavy_abc_g_aig` failed Yosys parsing due a zero-width integer constant in the generated Verilog; log `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/mixed-r25/ex274/logs/ex274_r25_int_highgap_square_halfprod_lowheavy_abc_g_aig.yosys.log`.
- Outcome: official rows are equivalent but nonwinning versus frontend `985/42/41370`. Top+mid BDD adds area without delay gain; full-row CSA is too deep. Next action should preserve the top2 truncated BDD shape and seek a smaller lower-square carry path.

## 2026-06-13 mixed-r26 official rows

Run ID: `ex200_ex299_frontend_refgap_round26_20260613_0539`, agent `mixed-r26`.

- Dossier: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/mixed-r26/ex274/notes/dossier.md`.
- Official rows:
  - `ex274_r26_square_frontend_hybrid_bddtop2_trunc_csel3_synth_preset_d40`: `984/44/43296`.
  - `ex274_r26_square_frontend_wallace_square_outside_csel4_abc_g_gates`: `973/46/44758`.
  - `ex274_r26_square_frontend_hybrid_bddtop2_trunc_order_outside_synth_preset_d40`: `987/43/42441`.
- Shard rows: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/mixed-r26/candidates.csv` and `evaluation_results.csv`.
- Outcome: all rows are official equivalent but nonwinning versus frontend `985/42/41370`. The outside-order top2 row is closest but adds one delay level; next action still needs a lower-delay final-carry/lower-square structure, not broader top/mid BDD replacement.

## 2026-06-13 sub-integer-r74 official rows

Run ID: `frontend_source_parallel_round74_20260613_1439`, agent `sub-integer-r74`.

- `ex274_r74_square_split8_cross`: low8/high8 square plus one cross product; official `evaluate.py` equivalent, `1157/66/76362`.
- `ex274_r74_square_low4_case`: low4 square case plus high arithmetic square/cross; official `evaluate.py` equivalent, `1267/54/68418`.
- Shard rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-integer-r74/candidates.csv`.
- Logs: `student/work/frontend_source_parallel_round74_20260613_1439/sub-integer-r74/ex274/logs/`.
- Outcome: both are nonwinning versus current frontend `985/42/41370`. The block/case arithmetic paths are much deeper than the truncated top2-BDD hybrid, so ex274 still needs lower-delay lower-square final-carry sharing.

## 2026-06-14 arith-unary-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `arith-unary-r2`.

- Families tested: factored Wallace square with carry-select merge; hybrid top-bit BDD plus truncated lower-square carry-select variants.
- Official best from this shard: `ex274_square_hybrid_bddtop4_trunc_csel10_synth_preset_d24` at `1055/41/43255`.
- Outcome: all rows were official equivalent but nonwinning versus frontend `985/42/41370`; the best row improves delay by one but area growth raises ADP.
