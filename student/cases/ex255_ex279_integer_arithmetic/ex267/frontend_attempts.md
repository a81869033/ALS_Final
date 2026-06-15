# ex267 Frontend Attempts

Semantics: unsigned 6x6 division, `low6 / high6`, divide-by-zero -> max.

Initial current best:
- `ex267_udiv_direct`: 159/40/6360

Notes:
- Direct division slightly beats restoring by ADP.
- Try hybrid quotient predicates for high bits and compact low-bit tables.

## 2026-06-09 Update

Best verified frontend seed:

- `ex267_udiv_radix4_top3_shift_wreduce_abc_g_aig`: 196/25/4900, ratio
  1.848359 to reference ADP 2651.

What changed:

- Reconfirmed exact unsigned `low6/high6` division with divide-by-zero
  saturation to `6'h3f`.
- MSB-interleaved BDD first improved the old direct seed (`159/40/6360`) to
  `333/16/5328`.
- Greedy adjacent-swap BDD order found a small additional improvement to
  `329/16/5264`.
- Guarded direct division (`140/40/5600`) was useful but still behind the BDD
  classifier.  Threshold trees were exact after 2N-bit compare repair but far
  too area-heavy.

## 2026-06-09 Deep Follow-Up

What improved:

- Radix-4 quotient digit selection cut the long one-bit-at-a-time divider path
  and improved ADP from BDD `5264` to `4900`.
- Mixed-radix `radix4_top3_shift` tied the full radix-4 result and is the
  current selected row after the global current-best refresh.
- A later per-output BDD replay with the searched order produced a new current
  best `321/15/4815`.  This is a higher-area but lower-delay seed than
  radix-4, so both structures should remain useful for later backend work.

Rejected follow-up directions:

- MTBDD and custom BDD order reduced some source structure but did not beat
  radix-4 after synthesis in the first replay.  The later per-output form did
  improve ADP slightly.
- Reciprocal-table correction, high-bit BDD hybrids, residual division,
  leading-range threshold, narrow-remainder radix, radix-8, and low-delay
  flow checks were exact or diagnostic but worse by ADP.
- Complemented-edge BDD variants did not improve over the per-output searched
  BDD.

## 2026-06-09 Cofactor Word-Mux Transfer

New best verified frontend seed:

- `ex267_udiv_cof_bhi3_ahi1_bitbdd_wordmux_synth_preset`: 326/14/4564, ratio
  1.721614 to reference ADP 2651.

What changed:

- The ex266 shallow classifier transfers to n=6 when the selector is
  magnitude-oriented.  The best tested source splits by the top three divisor
  bits and dividend MSB, builds local per-output BDDs, reassembles local
  quotient words, and uses one shared word mux.
- This improves over the prior per-output BDD `321/15/4815` by dropping one
  delay level, despite a small area increase.

Rejected transfer variants:

- `bhi1+ahi1`, `bhi2+ahi1`, and `bhi2+ahi2` were exact but did not beat
  `bhi3+ahi1`.

## 2026-06-09 High-Gap Selector Hybrid Follow-Up

New best verified frontend seed:

- `ex267_udiv_hybrid_top2_deep_abc_g_aig`: 340/12/4080, ratio 1.539042 to
  reference ADP 2651.

What changed:

- The useful direction was not a new divider algorithm; it was a more refined
  magnitude cofactor classifier.
- Adding more selector information to the local quotient BDDs lowered delay:
  `bhi3+a_hi2` reached 345/12/4140, then `bhi4+a_hi2`/`bhi3+bmid1+a_hi2`
  reached 342/12/4104.
- A still deeper selector `bhi4+a_hi3` reached delay 11, but area rose to 376,
  so ADP worsened to 4136.
- The best compromise uses the shallower selector for low quotient bits and
  the deeper selector only for the top two output bits.  This preserved delay
  12 while cutting area to 340.

Rejected refinements:

- Delay-target flow replay on the winning source tied `340/12/4080` and did
  not improve ADP.
- Full deeper selector and top3 hybrid were exact but area-heavy.
- Top1 hybrid lowered area to 336 but increased delay to 13, so ADP was worse.

## 2026-06-13 sub-integer-r74 official rows

Run ID: `frontend_source_parallel_round74_20260613_1439`, agent `sub-integer-r74`.

- `ex267_r74_qthreshold_ladder`: descending shared `q*b` threshold ladder; official `evaluate.py` equivalent, `1983/76/150708`.
- `ex267_r74_divisor_case_const`: divisor-keyed constant quotient arms; official `evaluate.py` equivalent, `541/17/9197`.
- Shard rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-integer-r74/candidates.csv`.
- Logs: `student/work/frontend_source_parallel_round74_20260613_1439/sub-integer-r74/ex267/logs/`.
- Outcome: both are nonwinning versus current frontend `340/12/4080`. The wider divider again rejects generic threshold and divisor-action source forms; future work should stay near compact magnitude cofactor classifiers or a genuinely new quotient sharing scheme.

## 2026-06-14 integer-extra-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `integer-extra-r2`.

- Official `evaluate.py` OK rows: 18/18.
- Best row: `ex267_udiv_cof_bhi3_ahi1_bitbdd_wordmux_synth_preset_d12`, `326/14/4564`; nonwinning versus current frontend `340/12/4080`.
- Failed directions: alternate `bhi/ahi` word-mux selectors, complemented per-bit BDDs, denominator-LZ range BDDs, radix-4 compact digit logic, and MTBDD variable orders reduced some area but missed the current hybrid-top2 delay-12 balance.
