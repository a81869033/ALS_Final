# ex292 Frontend Attempts

## Current Best

- Current best frontend: `ex292_order_0_13_1_12_2_11_3_10_4_9_5_8_6_7_abc_g_aig`, area `6770`, delay `21`, ADP `142170`.
- Reference: ADP `84854`.
- Gap: `1.68x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:168300`; `rotate_low_split_default:168300`; `decision_tree_greedy:252651`; `low_split_default:287380`; `high_split_default:614240`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex292`, but they are not the current tracked best.
- 2026-06-08 diagnostic shared-BDD run: official `evaluate.py` OK; interleave BDD improved to `6827/21/143367`.
- 2026-06-08 BDD synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `6770/21/142170`.
- 2026-06-08 cofactor-BDD source rewrite: official `evaluate.py` OK; best `low1` was `6826/23/156998`, worse than current due delay.
- 2026-06-08 MTBDD diagnostic: direct vector-valued interleave MTBDD had `12257` nodes versus `3807` scalar shared-BDD nodes, so no seed was emitted.
- 2026-06-08 split/BDD selected-bit hybrid: official replay OK after limited synthflow; selected structural overrides on the shared-BDD source were exact, but best was `8734/20/174680`, worse than current.

## Do Not Repeat Blindly

- Rotated split is clearly better than plain split/tree.
- Shared-BDD plus synthflow is now best but still outside `1.5x` reference.
- Need a structural reason for the rotation, then compress the per-group exception logic.
- Do not repeat simple one-bit `low1`/`high1`/`center1` cofactor-BDD; exact but worse than current.
- Do not repeat direct vector-valued MTBDD without a different reduction/root-grouping idea; diagnostic node count was larger than scalar shared-BDD.
- Do not repeat selected structural overrides on the shared-BDD source; exact but split cone area dominated.
- Do not repeat the same split/BDD selected-bit hybrid; raw and limited synthflow rows were exact but area dominated.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

## 2026-06-12 Round19 unknown-existing-r19 Checkpoint

- Source: copied current best shared-BDD Verilog from `student/work/ex285_ex294_frontend_bdd_diagnostic_20260608_1225/ex292/verilog/ex292_unknown_shared_bdd_14x14_order_0_13_1_12_2_11_3_10_4_9_5_8_6_7.v`.
- Candidate: `ex292_shared_bdd_round19_no_abc`.
- Material change: renamed the top module for a distinct candidate and synthesized with repo `student/frontends/yosys_synth.py --no-abc` + `aigmap` flow instead of the current `abc_g_aig` best.
- Official `evaluate.py --case ex292` result: OK, `8236/26/214136`.
- Paths:
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/unknown-existing-r19/ex292/verilog/ex292_shared_bdd_round19_no_abc.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/unknown-existing-r19/ex292/aigs/ex292_shared_bdd_round19_no_abc.aig`
- Log: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/unknown-existing-r19/ex292/logs/ex292_shared_bdd_round19_no_abc.evaluate.py.log`
- Outcome: exact but nonwinning versus current frontend `6770/21/142170`; no-ABC worsens both area and ADP, so further work should be source-level BDD/root factoring rather than removing ABC.

## 2026-06-13 unknown-large-r24 output-grouped BDD pools

- campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round24_20260613_0435/`
- agent/shard: `unknown-large-r24` (coordinator reconstructed shard CSVs from official worker logs).
- candidate: `ex292_r24_output_grouped_bdd_pools_abc_g_aig`.
- method signature: `ex292|unknown_large_r24|output_grouped_bdd_pools_even_odd_planes|ex292_r24_output_grouped_bdd_pools_abc_g_aig|official_evaluate_py`.
- official `evaluate.py` result: `6769/21/141939`, improving frontend best from `142170`; reference remains `84854`.
- paths:
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/unknown-large-r24/ex292/verilog/ex292_r24_output_grouped_bdd_even_odd_output_planes.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/unknown-large-r24/ex292/aigs/ex292_r24_output_grouped_bdd_pools_abc_g_aig.aig`
  - Evaluate log: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/unknown-large-r24/ex292/logs/ex292_r24_output_grouped_bdd_pools_abc_g_aig.evaluate.py.log`
  - Round24 merged results: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round24_20260613_0435/results/best_improvements.csv`
- Outcome: tiny but valid frontend improvement by changing root grouping while keeping the same 21-level delay. Further work should seek a structural reason for the even/odd output grouping and reduce area without adding delay.

## 2026-06-13 unknown-large-r25 mod4 output-plane BDD grouping

- campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/`
- agent/shard: `unknown-large-r25`.
- best candidate: `ex292_r25_bdd_mod4_output_planes_abc_g_aig`.
- method signature: `ex292|global_state_transform_regrouped_bdd_roots|mod4_output_planes|four_scalar_BDD_pools_grouped_by_output_bit_modulo_4|abc_g_aig|official_truth_exact_bdd|mod4_output_planes`.
- official `evaluate.py` result: `6789/20/135780`, improving frontend best from `141939`; reference remains `84854`.
- additional official improvements in same family: low/high halves `141897`, adjacent pairs follow-up `141645`, mod3 planes `141876`, mod7 pairs `141771`, and mod4 d18 tie `135780`.
- paths:
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/unknown-large-r25/ex292/verilog/ex292_r25_bdd_mod4_output_planes.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/unknown-large-r25/ex292/eval/ex292_r25_bdd_mod4_output_planes_abc_g_aig/ex292.aig`
  - Evaluate log: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/unknown-large-r25/ex292/logs/ex292_r25_bdd_mod4_output_planes_abc_g_aig.evaluate.py.log`
  - Round25 merged results: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/results/best_improvements.csv`
- Outcome: valid frontend improvement by reducing delay from 21 to 20 via output-bit modulo-4 BDD root grouping. Further work should explain the mod4 output grouping structurally and reduce area while preserving 20-level delay.

## 2026-06-13 unknown-large-r26 stride-2 descriptor/residual probes

- campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/`
- agent/shard: `unknown-large-r26`.
- methods:
  - anchored `stride2_prefix_delta` key with mod4 output-plane BDD roots.
  - anchored `stride2_suffix_delta` key with adjacent-pair BDD roots.
  - `stride2_prefix_delta + xor_rotr2 residual` with mod4 output-plane BDD roots.
- official `evaluate.py` rows: 3/3 equivalent.
- best r26 result: `ex292_r26_stride2prefix_mod4_output_planes_abc_g_aig`, `25046/25/626150`.
- current frontend remains `135780`; reference remains `84854`.
- outcome: no frontend improvement. This structurally explains that the anchored stride-2 descriptor is not the reason mod4 output grouping works; it increases area and delay heavily versus the round25 mod4 root grouping.

## 2026-06-13 Round74 sub-unknown-route-state-r74

- Campaign shard: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-unknown-route-state-r74`.
- Dossier: `student/work/frontend_source_parallel_round74_20260613_1439/sub-unknown-route-state-r74/ex292/notes/high_level_dossier.md`.
- Families tried: `ex292_r74_mod5_center_order_grouped_bdd`, `ex292_r74_mirror_pairs_mixed_order_grouped_bdd`.
- Best official `evaluate.py` row: `ex292_r74_mirror_pairs_mixed_order_grouped_bdd`, `19813/22/435886`.
- Evaluate log: `student/work/frontend_source_parallel_round74_20260613_1439/sub-unknown-route-state-r74/ex292/logs/ex292_r74_mirror_pairs_mixed_order_grouped_bdd.evaluate.py.log`.
- Outcome: no target-current/reference improvement; record as nonwinning exact frontend evidence.
- Next action: avoid repeating these exact round74 signatures unless the source transform or sharing basis changes materially.

## 2026-06-14 unknown-large-r4 campaign ex204_ex299_frontend_continuation_20260614_1216

- Scope: frontend-only, Yosys Verilog-to-AIG plus official `evaluate.py`; no backend, seed, or registry edits.
- Families tried:
  - `ex292_r4_mod4_planes_d19`: current mod4 output-plane low-delay replay, official OK `6803/20/136060`; no improvement versus campaign frontend target `135780`.
  - `ex292_r4_adjacent_mod7_mask_mix`: adjacent-pair/mod7 grouped output-mask donor mix over the mod4 base, official OK `6760/20/135200`; improves target ADP by `580`.
- Outcome: official frontend improvement found. Keep `ex292_r4_adjacent_mod7_mask_mix` for coordinator merge; future work should preserve the `20` delay while testing smaller area masks around the adjacent/mod7 edge-plane grouping.
