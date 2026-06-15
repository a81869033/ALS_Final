# ex270 Frontend Attempts

Semantics: square, `x * x`.

Initial semantic seeds:
- `ex270_square_direct`: 312/36/11232
- `ex270_square_symmetric_terms`: 297/61/18117

Current best row is baseline `495/11/5445`, better than the semantic seeds.

Notes:
- Frontend work must reduce square delay substantially, not only area.
- Try shallow small-width square truth decomposition and triangular products.

2026-06-09 update:
- Verified exact unsigned 8-bit square.
- New frontend best: `191/17/3247`, ratio 1.564066 to reference.
- Best source: triangular square partial products, Wallace outside ordering,
  carry-select final adder group size 5.
- Full-word 256-entry case and low-cofactor structures were exact but did not
  beat the carry-select Wallace source.

## 2026-06-09 Selected-BDD Follow-Up

Additional run/result location:

- `student/runs/integer/ex270_frontend_square_selected_bdd_20260609_1808/results/`

Tested:

- Selected middle/high output-bit BDD overrides combined with arithmetic lower
  square logic, mirroring the ex273/ex274 high-bit hybrid idea.

Result:

- No new best.  Best row was `353/15/5295`, which lowered delay from current
  `17` to `15` but area rose too much compared with `191/17/3247`.
- For ex270, selected output-bit BDD is not a good frontend tradeoff; the
  remaining gap likely needs a lighter final-carry improvement on the existing
  triangular Wallace/carry-select source.

## 2026-06-12 integer-struct-r16 official row

Run ID: `ex200_ex299_frontend_refgap_round16_20260612_2233`, agent `integer-struct-r16`.

- Method signature: `ex270|Dadda_square_scheduling_may_reduce_small-square_final_carry_pressure|triangular_square_Dadda_schedule_with_csel4_final_merge|shared_square_cross_terms_and_Dadda_column_reductions|yosys_abc_g_aig|unsigned_8_square|full_square_word`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex270/verilog/ex270_r16_dadda_square_csel4.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex270/aigs/ex270_r16_dadda_square_csel4_abc_g_aig.aig`.
- Official `evaluate.py`: equivalent, `198/22/4356`; log `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex270/logs/ex270_r16_dadda_square_csel4_abc_g_aig.evaluate.py.log`.
- Outcome: nonwinning. Dadda scheduling remains deeper than the existing triangular Wallace/csel5 frontend (`3230` current frontend ADP), so ex270 should stay focused on lighter final-carry changes rather than alternate column schedules.

## 2026-06-13 sub-integer-r74 official rows

Run ID: `frontend_source_parallel_round74_20260613_1439`, agent `sub-integer-r74`.

- `ex270_r74_square_split4_cross`: low4/high4 square plus one cross product; official `evaluate.py` equivalent, `188/30/5640`.
- `ex270_r74_square_low3_case`: low3 square case plus high arithmetic square/cross; official `evaluate.py` equivalent, `216/27/5832`.
- Shard rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-integer-r74/candidates.csv`.
- Logs: `student/work/frontend_source_parallel_round74_20260613_1439/sub-integer-r74/ex270/logs/`.
- Outcome: both are nonwinning versus current frontend `191/17/3230`. Block/case decompositions preserve arithmetic semantics but add too much carry delay; the next useful direction remains a lighter triangular square final-carry representation.

## 2026-06-14 integer-extra-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `integer-extra-r2`.

- Official `evaluate.py` OK rows: 24/24.
- Best row: `ex270_square_hybrid_cmptop1_trunc_synth_preset_d12`, `192/17/3264`; nonwinning versus current frontend `190/17/3230`.
- Failed directions: non-current carry-select sizes, factored/counter4x/Dadda square scheduling, wider csel10/12/14, and truncated high-output hybrids were exact but did not reduce area below the current csel5 source at delay 17.
