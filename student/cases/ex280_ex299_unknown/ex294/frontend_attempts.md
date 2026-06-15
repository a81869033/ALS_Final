# ex294 Frontend Attempts

## Current Best

- Current best frontend: `ex294_order_0_15_1_14_2_13_3_12_4_11_5_10_6_9_7_8_synth_preset`, area `10726`, delay `23`, ADP `246698`.
- Reference: ADP `133365`.
- Gap: `1.85x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `rotate_high_split_default:349258`; `rotate_low_split_default:349258`; `decision_tree_greedy:427768`; `low_split_default:657272`; `high_split_default:2577725`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex294`, but they are not the current tracked best.
- 2026-06-08 diagnostic shared-BDD run: official `evaluate.py` OK; interleave BDD improved to `10945/24/262680`.
- 2026-06-08 BDD synthflow run: official `evaluate.py` OK for all variants; `synth_preset` improved to `10726/23/246698`.
- 2026-06-08 cofactor-BDD source rewrite: official `evaluate.py` OK; best `low1` was `10898/23/250654`, close but worse than current.
- 2026-06-08 MTBDD diagnostic: direct vector-valued interleave MTBDD had `42953` nodes versus `6020` scalar shared-BDD nodes, so no seed was emitted.
- 2026-06-08 split/BDD selected-bit hybrid: official replay OK after limited synthflow; selected structural overrides on the shared-BDD source were exact, but best was `14060/21/295260`, worse than current.

## Do Not Repeat Blindly

- Rotated split ties both directions and beats tree/split variants.
- Shared-BDD plus synthflow is now best but still outside `1.5x` reference.
- Need a new factoring method for large 16-bit case size; repeating exception-table generation is not enough.
- Do not repeat simple one-bit `low1`/`high1`/`center1` cofactor-BDD; exact but area increased without ADP improvement.
- Do not repeat direct vector-valued MTBDD without a different reduction/root-grouping idea; diagnostic node count was larger than scalar shared-BDD.
- Do not repeat selected structural overrides on the shared-BDD source; exact but split cone area dominated.
- Do not repeat the same split/BDD selected-bit hybrid; raw and limited synthflow rows were exact but area dominated.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

## 2026-06-13 unknown-large-r26 stride-2 descriptor/residual probes

- campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/`
- agent/shard: `unknown-large-r26`.
- methods:
  - anchored `stride2_prefix_delta` key with mod4 output-plane BDD roots.
  - anchored `stride2_suffix_delta` key with adjacent-pair BDD roots.
  - `stride2_prefix_delta + xor_rotr2 residual` with mod4 output-plane BDD roots.
- official `evaluate.py` rows: 3/3 equivalent.
- best r26 result: `ex294_r26_stride2suffix_adjacent_adjacent_pairs_abc_g_aig`, `71073/30/2132190`.
- current frontend remains `246698`; reference remains `133365`.
- outcome: no frontend improvement. The stride-2 transformed key expands BDD/root logic dramatically; do not repeat these exact prefix/suffix/residual descriptor sources.

## 2026-06-13 Round74 sub-unknown-route-state-r74

- Campaign shard: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-unknown-route-state-r74`.
- Dossier: `student/work/frontend_source_parallel_round74_20260613_1439/sub-unknown-route-state-r74/ex294/notes/high_level_dossier.md`.
- Families tried: `ex294_r74_mod4_planes_grouped_bdd`, `ex294_r74_mirror_pairs_center_order_grouped_bdd`.
- Best official `evaluate.py` row: `ex294_r74_mod4_planes_grouped_bdd`, `10853/23/249619`.
- Evaluate log: `student/work/frontend_source_parallel_round74_20260613_1439/sub-unknown-route-state-r74/ex294/logs/ex294_r74_mod4_planes_grouped_bdd.evaluate.py.log`.
- Outcome: no target-current/reference improvement; record as nonwinning exact frontend evidence.
- Next action: avoid repeating these exact round74 signatures unless the source transform or sharing basis changes materially.

## 2026-06-13 Round80 sub-unknown-route-r80

- Campaign shard: `student/frontend_campaigns/campaigns/frontend_source_parallel_round80_20260613_1915/agent_shards/sub-unknown-route-r80`.
- Method signature: `ex294|global_state_sparse_mirror_cofactor|shared_bdd_mod4_source_mux|shared_mirror_pair_descriptor_selects_mod4_plane|yosys_internal_abc_g_aig|official_evaluate|mod4_plane_0_4_8_12`.
- High-level description: sparse mirror-pair descriptor can cofactor mod4 global-state roots.
- Representation/sharing: shared BDD mod4 source mux with sparse mirror pair descriptor over global-state endpoints.
- Official `evaluate.py` result: `ex294_r80_mod4_shared_mirror_cofactor`, `10675/23/245525`.
- Verilog: `student/work/frontend_source_parallel_round80_20260613_1915/sub-unknown-route-r80/ex294/verilog/ex294_r80_mod4_shared_mirror_cofactor.v`.
- AIG: `student/work/frontend_source_parallel_round80_20260613_1915/sub-unknown-route-r80/ex294/aigs/ex294_r80_mod4_shared_mirror_cofactor.aig`.
- Evaluate log: `student/work/frontend_source_parallel_round80_20260613_1915/sub-unknown-route-r80/ex294/logs/ex294_r80_mod4_shared_mirror_cofactor.evaluate.py.log`.
- Outcome: frontend best improved from `246698` to `245525` by `1173` ADP, but overall current/backend remains `165570`.
- Next action: do not repeat this exact mod4 mirror-pair plane as-is; try a new descriptor sharing basis or cofactor roots beyond mod4 mirror-pair planes.

## 2026-06-13 Round81 sub-unknown-descriptor-r81

- Campaign shard: `student/frontend_campaigns/campaigns/frontend_radical_parallel_round81_20260613_1958/agent_shards/sub-unknown-descriptor-r81`.
- Method signature: `ex294|global_state_octant_descriptor_cofactor|octant_plane_source_mux|shared_endpoint_midpoint_descriptor_selects_even_plane|yosys_internal_abc_g_aig|official_evaluate|even_plane_0_2_4_6_8_10_12_14`.
- High-level description: octant endpoint/midpoint descriptor can cofactor even output planes over the global-state shared BDD source.
- Representation/sharing: source mux between prior shared-BDD base and grouped BDD alt using shared endpoint/midpoint descriptor signals.
- Official `evaluate.py` result: `ex294_r81_octant_plane_descriptor_cofactor`, `10664/22/234608`.
- Verilog: `student/work/frontend_radical_parallel_round81_20260613_1958/sub-unknown-descriptor-r81/ex294/verilog/ex294_r81_octant_plane_descriptor_cofactor.v`.
- AIG: `student/work/frontend_radical_parallel_round81_20260613_1958/sub-unknown-descriptor-r81/ex294/aigs/ex294_r81_octant_plane_descriptor_cofactor.aig`.
- Evaluate log: `student/work/frontend_radical_parallel_round81_20260613_1958/sub-unknown-descriptor-r81/ex294/logs/ex294_r81_octant_plane_descriptor_cofactor.evaluate.py.log`.
- Outcome: frontend best improved from `245525` to `234608` by `10917` ADP; combined round80+round81 frontend improvement is `12090` ADP from the pre-round80 `246698`.
- Next action: do not repeat the exact octant-plane/even-plane source mux as-is. A larger gain likely needs a descriptor that reduces the base shared-BDD area or replaces more output planes without increasing mux/select cost.

## 2026-06-14 unknown-large-r4 campaign ex204_ex299_frontend_continuation_20260614_1216

- Scope: frontend-only, Yosys Verilog-to-AIG plus official `evaluate.py`; no backend, seed, or registry edits.
- Families tried:
  - `ex294_r4_octant_d21`: current octant descriptor low-delay replay, official OK `10675/22/234850`; no improvement versus campaign frontend target `234608`.
  - `ex294_r4_r80_mirror_odd_mask_mix`: r80 mirror descriptor plus odd-plane grouped output-mask donor mix, official OK `45484/25/1137100`; large regression.
- Outcome: no official improvement. Avoid odd-plane donor mixing on the r80/r81 mirror-octant base; the mux/select cost dominates badly.
