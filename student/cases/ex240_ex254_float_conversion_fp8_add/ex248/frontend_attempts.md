# ex248 Frontend Attempts

Function hypothesis: E5M2FN packed FP8 fmod, low byte % high byte.

Reference row: area/delay/ADP/score = `209/20/4180/6270.0`.

Current known best: `ex248_semantic_fmod_periodic_rem_abc_g_aig`,
`285/30/8550`, ratio `2.045455`.

## Attempt Log

- 2026-06-08: exact semantic match for E5M2FN fmod with output sign from the
  low byte and canonical `8'h7f` NaN.
- Tried and excluded:
  - nested modular-significand delta table: exact, best `476/32/15232`.
  - direct Verilog `%`: exact but synthesized to very deep AIGs.
  - formula normalizer replacing the small norm table: exact but worse delay.
- Best structure: hand-derived periodic remainder.  Since `sig_d` is only
  1..7, `2^delta mod sig_d` is periodic and can replace the large delta table.

## 2026-06-13 00:08 +0800 Round19 Continuation

- Agent/run: `fp8-existing-r19` /
  `ex200_ex299_frontend_refgap_round19_20260612_2346`.
- Source basis: copied current frontend-best Verilog
  `student/work/ex248_frontend_fp8_e5m2_fmod_periodic_20260608_1646/ex248/verilog/ex248_semantic_fmod_periodic_rem.v`.
- Method signature:
  `ex248|E5M2FN packed fmod|periodic remainder delta-negative noabc rewrite|shared divisor-period remainder tables plus kept signed-delta bypass|yosys_no_abc_aigmap|exact_e5m2fn_fmod_low_mod_high|periodic_rem_norm_table_outputs`.
- Material change: replaced the signed `delta < 0` bypass check with a kept
  `delta_negative = delta[6]` boundary and used `yosys_synth.py --no-abc`,
  so this is not an exact replay of the periodic-rem ABC source.
- Official result: `evaluate.py` OK, `410/44/18040`.
- Paths: Verilog
  `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fp8-existing-r19/ex248/verilog/ex248_round19_delta_neg_noabc.v`;
  AIG
  `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fp8-existing-r19/ex248/aigs/ex248.aig`;
  evaluate log
  `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fp8-existing-r19/ex248/logs/ex248_round19_delta_neg_noabc.official_evaluate.log`.
- Outcome: equivalent but nonwinning versus current frontend `285/30/8550`
  and reference `209/20/4180`; do not repeat this no-ABC periodic-rem flow.

## 2026-06-13 Round25 fp8-r25

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/fp8-r25/`.
- Tested method family: `ex248|E5M2FN packed fmod low mod high|shared modulo-12 residue table|shared divisor significand exponent delta modulo12 and normalization table|yosys_multi_official_evaluate|exact_e5m2fn_fmod_low_mod_high|mod12_remainder_norm_output`.
- Official `evaluate.py` rows: `0/2` OK.
- Outcome: no equivalent candidate; see shard `evaluation_results.csv` and logs.
- Next action: `debug official non-equivalence before any QoR claim`.

## 2026-06-13 Round25 fp8-wide-r25

- Campaign: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/fp8-wide-r25/`.
- Tested method families: `6` candidates across `2` materially different representations.
- Official `evaluate.py` rows: `6/6` OK.
- Best observed: `ex248_r25w_delta_residue_abc_g_and`, `315/31/9765`, improved frontend `0`, beats reference `0`.
- Paths: Verilog `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-wide-r25/ex248/verilog/ex248_r25w_delta_residue_abc_g_and.v`; AIG `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-wide-r25/ex248/aigs/ex248_r25w_delta_residue_abc_g_and.aig`; log `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-wide-r25/ex248/logs/ex248_r25w_delta_residue_abc_g_and.evaluate.py.log`.
- Next action: `try source-level arithmetic factoring only if it changes semantic coordinates or sharing materially`.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `` `//`.
- Current frontend baseline used by this worker: `8550`; reference ADP `4180`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: ``.
- Next action: Debug non-equivalence or choose a different representation family.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `ex248_r26_periodic_formula_norm_synth_preset_aig` `277/33/9141`.
- Current frontend baseline used by this worker: `8550`; reference ADP `4180`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/fp8-r26/ex248/logs/ex248_r26_periodic_formula_norm_synth_preset_aig.evaluate.py.log`.
- Next action: Try a new high-level representation; do not repeat this r26 source as-is.

## 2026-06-13 14:51 +0800 Round74 sub-fp8-muldiv-r74

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/`.
- Tested two source-only exact table families for the E5M2FN fmod low-mod-high hypothesis:
  - `ex248|E5M2FN packed fmod low mod high|direct magnitude-pair remainder table|shared NaN/divisor-zero shell with exact numerator-denominator magnitude key|repo_yosys_frontend_default|official_evaluate|full_word`.
  - `ex248|E5M2FN packed fmod low mod high|denominator-grouped numerator remainder tables|shared divisor magnitude group and numerator local table|repo_yosys_frontend_default|official_evaluate|den_grouped_full_word`.
- Official `evaluate.py` rows: `2/2` equivalent. Best observed: `ex248_r74_den_group_remainder_table` `3520/18/63360`.
- Current frontend/reference used by this shard: `7938` / `4180`.
- Outcome: no frontend-best improvement; beats reference `no`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-fp8-muldiv-r74/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round74_20260613_1439/sub-fp8-muldiv-r74/ex248/logs/ex248_r74_den_group_remainder_table.evaluate.py.log`.
- Next action: grouped exact remainder tables confirm the periodic remainder normalizer is the better source family; avoid full magnitude-pair tables except as diagnostics.

## 2026-06-14 12:34:04 +0800 fp8-semantic-r2

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-semantic-r2/`.
- Dossier: `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-semantic-r2/ex248/notes/high_level_dossier.md`.
- Families tried: direct shifted-significand modulo, periodic formula normalizer, and denominator-grouped remainder decision graph; each compared with `default_and` and `abc_g_aig` frontend Yosys flows.
- Official `evaluate.py` rows: `6/6` equivalent. Best observed and low-area: `ex248_r2_formula_norm_lowarea_abc_g_aig` `286/35/10010`; decision-graph best was `5475/47/257325`; direct modulo best was `1159/305/353495`.
- Current frontend/reference used by this shard: `7938` / `4180`; improved frontend `0`; beats reference `0`.
- Evidence: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-semantic-r2/evaluation_results.csv`.
- Next action: do not repeat direct `%`, formula norm, or denominator-grouped exact tables for ex248; the current rem-first normalizer remains better and the open problem is reducing its delay without expanding the remainder table.

## 2026-06-14 13:00:55 +0800 fp8-output-plane-r3

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-output-plane-r3/`.
- Dossier: `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex248/notes/high_level_dossier.md`.
- Frontend-only families tried:
  - Special/range shell output-plane split around the current rem-first core.
  - Direct numerator sign-plane split with magnitude-only core selection.
- Official `evaluate.py` rows: `2/2` equivalent. Best observed: `ex248_r3_shell_output_planes` `290/27/7830`, improving the filtered target snapshot `291/27/7857` by `27` ADP. The sign-direct follow-up was `292/28/8176`.
- Current frontend/reference used by this shard: `7857` / `4180`; improved frontend `1`; beats reference `0`.
- Evidence: Verilog `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex248/verilog/ex248_r3_shell_output_planes.v`; AIG `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex248/aigs/ex248_r3_shell_output_planes.aig`; log `student/runs/float_fp8/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex248/logs/ex248_r3_shell_output_planes.evaluate.py.log`.
- Next action: keep `shell_output_planes` as the shard improvement; do not repeat the sign-direct variant unchanged because it worsens both area and delay.
