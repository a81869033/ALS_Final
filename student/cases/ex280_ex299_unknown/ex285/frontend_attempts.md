# ex285 Frontend Attempts

## Current Best

- Current best frontend: `ex285_decision_tree_greedy_synth_preset`, area `775`, delay `17`, ADP `13175`.
- Reference: ADP `5499`.
- Gap: `2.40x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `rotate_low_split_default`, `decision_tree_greedy`.
- Top results: `decision_tree_greedy:13906`; `rotate_high_split_default:17576`; `rotate_low_split_default:17576`; `low_split_default:34530`; `high_split_default:56644`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex285`, but they are not the current tracked best.
- 2026-06-08 diagnostic shared-BDD run: official `evaluate.py` OK for 2 rows; best BDD was `794/18/14292`, worse than current decision tree.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `synth_preset` improved to `775/17/13175`.
- 2026-06-08 symmetry-canonical BDD run: exact `swap_in_4_5` canonical key was verified with official `evaluate.py`; best was `1038/17/17646`, worse than current best.
- 2026-06-08 symmetry-BDD synthflow run: official `evaluate.py` OK; best was `1037/17/17629`, still worse than current decision-tree synthflow.
- 2026-06-09 symmetry cofactor class-onehot run: transferred the ex280-ex284 cofactor/class-onehot idea to the exact `swap_in_4_5` canonical key. Official `evaluate.py` OK; best `interleave_f10_k4` was `1042/15/15630`, exact but worse than current `775/17/13175`.

## Do Not Repeat Blindly

- Decision tree is currently clearly better than split/table variants.
- Do not repeat `split_rot8` or interleave BDD orders without a source rewrite.
- Do not repeat the tested `swap_in_4_5` symmetry-canonical BDD interleave/sym_first/natural orders without a deeper source rewrite; interleave was exact but worse, and the other orders were much larger.
- Limited synthflow on the symmetry-BDD source did not close the gap for this case.
- Do not repeat the tested top-3/4/5 interleave symmetry cofactor class-onehot rows; they reduced delay but duplicated too much area.
- Next work should refine tree factoring or infer the underlying class/rotation structure.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

## 2026-06-12 Round10 unknown-top-r10

- Dossier: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-top-r10/ex285/notes/high_level_dossier.md`.
- High-level description: 12-bit Hamming-weight-preserving lossy routing/normalizer; no constant outputs; exact input swap symmetry `(4,5)`; current frontend remains decision-tree synthflow.
- Families tried:
  - `lane_component_shared_bdd`: exact shared BDD with mod-4 lane/component input order and one global node pool.
  - `mod8_output_linear_anf_residual_bdd`: exact GF(2) mod-8 output-linear parity coordinates with shared monomial bank plus residual BDD roots.
- Method signatures:
  - `ex285|hamming_weight_preserving_lossy_routing_normalizer|lane_component_shared_bdd|mod4_lane_order_single_node_pool|yosys_abc_g_aig|abc_xf_official_evaluate|lane_grouped_output_roots`
  - `ex285|hamming_weight_preserving_lossy_routing_normalizer|mod8_output_linear_anf_residual_bdd|shared_monomial_bank_plus_residual_roots|yosys_abc_g_aig|exact_output_linear_coordinates|mod8_lane_reconstruction`
- Official results: both `evaluate.py` OK. Lane BDD `1621/20/32420`; mod8 ANF residual `3509/184/645656`.
- Paths: candidates `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round10_20260612_1911/agent_shards/unknown-top-r10/candidates.csv`; logs under `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-top-r10/ex285/logs/`.
- Outcome: no improvement over current frontend `13175`. Do not repeat these exact lane-BDD or mod8 ANF-residual wrappers.
- Next action: focus on refining the existing decision-tree/source factoring or a genuinely new routing descriptor; exact output-coordinate repair alone is too delay-heavy.

## 2026-06-12 Round9 state-r9 Plan

- Dossier: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex285/notes/high_level_dossier.md`.
- Observed decomposition: 12-bit Hamming-weight-preserving lossy routing/normalizer; no constant outputs; simple sort/canonical and direct decision-tree replay are rejected.
- Planned hypotheses: `compact_routing_descriptor` and `shared_anf_monomial_bank`.
- Method signatures planned:
  - `ex285|hamming_weight_preserving_lossy_routing_normalizer|compact_routing_descriptor|shared_count_selector_descriptor_and_grouped_roots|yosys_abc_g_aig|exact_truth_descriptor_probe|all_outputs_grouped`
  - `ex285|hamming_weight_preserving_lossy_routing_normalizer|shared_anf_monomial_bank|shared_routing_descriptor_gf2_terms|yosys_abc_g_aig|exact_truth_residual_probe|all_outputs_grouped`
- Official result: pending; no candidate Verilog generated before this note.
- Next action: generate and officially evaluate the two shard-local candidates if the compact descriptor is not blocked by near-full key cardinality; otherwise write blocker rows.

## 2026-06-12 Round9 state-r9 Result

- `ex285|hamming_weight_preserving_lossy_routing_normalizer|compact_routing_descriptor|shared_count_selector_descriptor_and_grouped_roots|yosys_abc_g_aig|exact_truth_descriptor_probe|all_outputs_grouped`: official `evaluate.py` OK, `2945/17/50065`, equivalent but worse than current frontend `13175`.
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex285/verilog/ex285_compact_routing_descriptor_mtbdd_natural.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex285/aigs/ex285_compact_routing_descriptor_mtbdd_natural.aig`
  - Log: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex285/logs/ex285_compact_routing_descriptor_mtbdd_natural.evaluate.log`
- `ex285|hamming_weight_preserving_lossy_routing_normalizer|shared_anf_monomial_bank|shared_routing_descriptor_gf2_terms|yosys_abc_g_aig|exact_truth_residual_probe|all_outputs_grouped`: official `evaluate.py` OK, `16814/76/1277864`, equivalent but much worse than current frontend.
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex285/verilog/ex285_shared_anf_monomial_bank.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex285/aigs/ex285_shared_anf_monomial_bank.aig`
  - Log: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex285/logs/ex285_shared_anf_monomial_bank.evaluate.log`
- Outcome: evaluated no improvement; both exact shared forms are far above the decision-tree synthflow baseline.
- Next action: do not repeat natural MTBDD or direct ANF bank unchanged; a future ex285 attempt needs a genuinely compact routing state smaller than the reduced mux graph.

## 2026-06-12 Round19 unknown-existing-r19 Checkpoint

- Source: copied current best decision-tree Verilog from `student/work/reverse_unknown_20260603_1812/ex285/verilog/ex285_unknown_12x12_decision_tree_greedy.v`.
- Candidate: `ex285_decision_tree_greedy_round19_abc_g_and`.
- Material change: renamed the top module for a distinct candidate and synthesized with repo `student/frontends/yosys_synth.py` default `abc -g AND` + `aigmap` flow instead of the prior `synth_preset` best.
- Official `evaluate.py --case ex285` result: OK, `818/17/13906`.
- Paths:
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/unknown-existing-r19/ex285/verilog/ex285_decision_tree_greedy_round19_abc_g_and.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/unknown-existing-r19/ex285/aigs/ex285_decision_tree_greedy_round19_abc_g_and.aig`
  - Log: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/unknown-existing-r19/ex285/logs/ex285_decision_tree_greedy_round19_abc_g_and.evaluate.py.log`
- Outcome: exact but nonwinning versus current frontend `775/17/13175`; this confirms the simple `abc -g AND` synthesis representation is not enough to close the reference gap.

## 2026-06-13 02:50:51 +0800 Round22 unknown-a-r22

- method_signature: `ex285|hamming_weight_preserving_lossy_routing_normalizer|compact_pair_state_and_lane_count_descriptor_screen|shared_pair_descriptors_and_lane_count_state|no_synth|blocked_before_verilog|full_word`
- official result: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG was emitted, so no `evaluate.py` row is claimed.
- evidence: `student/work/ex200_ex299_frontend_refgap_round22_20260613_0218/unknown-a-r22/ex285/diagnostics/ex285_round22_screen.md`
- shard CSVs: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round22_20260613_0218/agent_shards/unknown-a-r22/`
- outcome: screened compact pair-state controlled routing and lane/count normalizer descriptors. Popcount preservation is exact, but pair-state exactness needs 2304 keys and compact lane/count majority reaches only 1079/4096 rows.
- next action: do not emit a key-table/cofactor repeat; ex285 needs a new nonlinear routing state before candidate generation.

## 2026-06-13 05:27:00 +0800 Round25 unknown-sym-r25

- Campaign shard: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/unknown-sym-r25/`.
- Dossier: `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/unknown-sym-r25/ex285/notes/high_level_dossier.md`.
- High-level description: 12-bit Hamming-weight-preserving lossy routing/normalizer with known input swap symmetry `(4,5)`.
- Families tried:
  - `fixed_popcount_layer_decision_forest`: shared popcount decoder plus per-weight exact decision forests.
  - `input_xor_delta_coordinate_shared_bdd`: shared BDD for `out ^ in`, reconstructing `out = in ^ delta`.
  - `output_gray_coordinate_shared_bdd`: shared BDD for output Gray coordinates, reconstructing with prefix XOR.
- Method signatures:
  - `ex285|hamming_weight_preserving_lossy_routing_normalizer|fixed_popcount_layer_decision_forest|shared_popcount_layer_decoder_and_layer_trees|yosys_abc_g_aig|official_evaluate|full_word_layer_forest`
  - `ex285|hamming_weight_preserving_lossy_routing_normalizer|input_xor_delta_coordinate_shared_bdd|single_delta_bdd_node_pool_pair_late_order|yosys_abc_g_aig|official_evaluate|delta_xor_reconstruction`
  - `ex285|hamming_weight_preserving_lossy_routing_normalizer|output_gray_coordinate_shared_bdd|single_gray_bdd_node_pool_pair_late_order|yosys_abc_g_aig|official_evaluate|gray_prefix_xor_reconstruction`
- Official `evaluate.py` results: 3/3 equivalent, no frontend improvement. Results were `4888/32/156416`, `1789/20/35780`, and `1709/41/70069`; best was `ex285_r25_delta_shared_bdd_pair_late`, still worse than current frontend `13175` and reference `5499`.
- Paths: Verilog/AIG/logs under `student/work/ex200_ex299_frontend_refgap_round25_20260613_0506/unknown-sym-r25/ex285/`; summary rows in the campaign shard CSVs.
- Outcome: fixed-popcount layer trees and transformed-coordinate BDDs are exact but area/delay dominated. Do not repeat these exact families unchanged; only revisit with a genuinely smaller nonlinear routing-state basis or a source that shares movement logic without BDD-scale cones.

## 2026-06-13 05:50:00 +0800 Round25 unknown-routing-r25

- Campaign shard: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/unknown-routing-r25/`.
- Dossier: `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/unknown-routing-r25/ex285/notes/high_level_dossier.md`.
- High-level description: 12-bit Hamming-weight-preserving lossy routing/normalizer. This shard used exact input swap symmetries `(4,5)` and `(6,7)` as a two-pair canonical key.
- Families tried:
  - `multi_pair_symmetry_cofactor_classonehot`: shared two-pair canonical key plus cofactored BDD groups and onehot/tree class muxes.
  - `multi_pair_symmetry_shared_bdd`: shared two-pair canonical key plus one global BDD node pool.
  - `decision_tree_source_flow_probe`: current exact decision-tree source under focused Yosys flow variants.
  - `multi_pair_symmetry_cofactor_synthflow_probe`: best multi-pair cofactor sources under focused Yosys flow variants.
- Official `evaluate.py` results: 59/59 equivalent, no frontend improvement, no reference beat. Best row tied current frontend with `ex285_r25_decision_tree_current_synth_preset` at `775/17/13175`.
- Best new non-current-source row: `ex285_r25_multipair_f10_k4_onehot_abc_g_aig` at `1042/14/14588`; lower delay but too much area to beat current frontend `13175`.
- Method signature prefixes:
  - `ex285|hamming_weight_preserving_lossy_routing_normalizer|multi_pair_symmetry_cofactor_classonehot|shared_two_pair_canonical_key_and_cofactor_bdds|yosys_default_AND_official_evaluate|exact_4_5_6_7_symmetry|...`
  - `ex285|hamming_weight_preserving_lossy_routing_normalizer|multi_pair_symmetry_shared_bdd|shared_two_pair_canonical_key_single_bdd_node_pool|yosys_default_AND_official_evaluate|exact_4_5_6_7_symmetry|...`
  - `ex285|hamming_weight_preserving_lossy_routing_normalizer|decision_tree_source_flow_probe|current_best_decision_tree_source|...`
- Paths: Verilog/AIG/evaluate logs under `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/unknown-routing-r25/ex285/`; summary rows in `evaluation_results.csv`, `candidates.csv`, and `failed_hypotheses.csv` in the shard directory.
- Outcome: no global registry/search-state update is warranted. Do not repeat multi-pair canonical BDD/cofactor or decision-tree synth-flow probes unchanged; the next useful attempt needs a new compact nonlinear routing-state basis rather than another BDD order/class mux replay.


## 2026-06-13 05:39:00 +0800 Round26 unknown-sym-r26

- Campaign shard: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/unknown-sym-r26/`.
- Dossier: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/unknown-sym-r26/ex285/notes/high_level_dossier.md`.
- Families tried:
  - `component_pairfield_shared_bdd`: adjacent-pair count/orientation encoded output with one shared BDD node pool.
  - `component_pairfield_split_bdd`: same descriptor with separate count and orientation BDD node pools.
  - `hidden_order_local_rule_screen`: no-synth blocker unless local-rule conflicts disappear.
- Best official candidate: `ex285_r26_pairfield_split_bdd` at `1515/18/27270`; evaluate log `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/unknown-sym-r26/ex285/logs/ex285_r26_pairfield_split_bdd.evaluate.py.log`.
- Hidden-order screen: best full exact bits `0`, conflicts `14933`, evidence `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/unknown-sym-r26/ex285/diagnostics/ex285_hidden_order_local_screen.csv`.
- Outcome: no success is claimed unless `evaluate.py` candidate rows beat the frontend/reference columns in the shard CSVs.

## 2026-06-13 Round60 sub-ex285-r60

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round60_20260613_0825/`.
- Recording-guided frontend-only/source-only mixed descriptor tried: shared canonical input/two-pair selector descriptor plus selected residual delta table.
- Official `evaluate.py` rows: `6/6` equivalent.
- Best observed: `ex285_r60_twopair_selector_direct_case_abc_g_aig`, `3584/17/60928`.
- Current frontend best remains `649/17/11033`; reference `5499`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round60_20260613_0825/agent_shards/sub-ex285-r60/evaluation_results.csv`.
- Outcome: no frontend-best improvement. Do not repeat twopair selector/canoninput/countkey majority residual-table sources unchanged; next progress needs a nonlinear routing state that removes the selector-delta table.

## 2026-06-13 Round62 sub-unk285-r62

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/`.
- Source-only families tried:
  - output-value cube cover;
  - single-pair invariant orbit grouping;
  - nonlinear state mixed case;
  - popcount-layer canonical residual screen.
- Official `evaluate.py` rows: `3/3` equivalent for emitted candidates.
- Best observed: `ex285_r62_output_value_cube_cover_abc_g_aig`, `2953/18/53154`.
- Blocked family: popcount-layer canonical residual left `3923` residual rows, so no RTL was emitted for that family.
- Current frontend best remains `649/17/11033`; reference `5499`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/agent_shards/sub-unk285-r62/evaluation_results.csv`.
- Outcome: no frontend-best improvement. Do not repeat cube cover/singlepair orbit/nonlinear mixed residual unchanged; next progress needs a true nonlinear movement recurrence or shared predicate basis for central Hamming-weight layers.

## 2026-06-13 Round64 sub-mixed-diffroute-r64

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/agent_shards/sub-mixed-diffroute-r64`.
- Families tried: true nonlinear movement recurrence smoke and central-layer shared state descriptor smoke after descriptor table-size screening.
- method_signature prefixes: `ex285|hamming_weight_preserving_lossy_routing_normalizer|nonlinear_movement_recurrence_smoke|...`, `ex285|hamming_weight_preserving_lossy_routing_normalizer|central_layer_state_descriptor_smoke|...`.
- Official result: no equivalent candidate.
- Screen evidence: `student/work/frontend_source_parallel_round64_20260613_1004/sub-mixed-diffroute-r64/ex285/diagnostics/ex285_r64_descriptor_screen.md`.
- Evaluation evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/agent_shards/sub-mixed-diffroute-r64/evaluation_results.csv`.
- Next action: find a smaller exact nonlinear state; screened exact residual tables remain too large for defensible RTL.

## 2026-06-13 Round65 sub-unk285-localrule-r65

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round65_20260613_1029/`.
- Families screened: small swap-network descriptors, popcount-window movement, reversible/local-majority movement, monotone layer transition predicates, and compact central-layer state descriptors.
- Official result: no RTL/AIG emitted; no `evaluate.py` success claimed.
- Evidence: `student/work/frontend_source_parallel_round65_20260613_1029/sub-unk285-localrule-r65/ex285/diagnostics/ex285_r65_local_rule_screens.csv`; dossier `student/work/frontend_source_parallel_round65_20260613_1029/sub-unk285-localrule-r65/ex285/notes/high_level_dossier.md`.
- Outcome: Hamming weight is preserved on all rows and swaps `(4,5)` / `(6,7)` are exact, but popcount-window descriptors are exact only with 4096 unique keys and the best compact central-layer descriptor still has 36 conflict keys / 74 conflicted rows. Do not repeat these local-rule screens unchanged; next useful move is factoring the current decision-tree/source with shared swap symmetry and layer predicates.

## 2026-06-13 Round74 sub-unknown-route-state-r74

- Campaign shard: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-unknown-route-state-r74`.
- Dossier: `student/work/frontend_source_parallel_round74_20260613_1439/sub-unknown-route-state-r74/ex285/notes/high_level_dossier.md`.
- Families tried: `ex285_r74_popcount3_direct_overlay`, `ex285_r74_quad_selected_outerkey_bdd`.
- Best official `evaluate.py` row: `ex285_r74_popcount3_direct_overlay`, `835/17/14195`.
- Evaluate log: `student/work/frontend_source_parallel_round74_20260613_1439/sub-unknown-route-state-r74/ex285/logs/ex285_r74_popcount3_direct_overlay.evaluate.py.log`.
- Outcome: no target-current/reference improvement; record as nonwinning exact frontend evidence.
- Next action: avoid repeating these exact round74 signatures unless the source transform or sharing basis changes materially.

## 2026-06-13 Round75 sub-unknown-r75

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/`.
- Scope: frontend/source-only, Yosys internal `abc -g aig`, official `evaluate.py`; no backend or post-AIG optimization.
- `ex285_r75_tree_symcof_edge_routebits`: status `OK`, equivalent `1`, QoR `1001/16/16016`; method_signature `ex285|hamming_weight_route_descriptor_bitmix|symcof_edge_routebits_on_tree|tree_base_plus_swap_symmetry_edge_roots|yosys_internal_abc_g_aig|official_evaluate|edge_route_bits`; log `student/work/frontend_source_parallel_round75_20260613_1507/sub-unknown-r75/ex285/logs/ex285_r75_tree_symcof_edge_routebits.evaluate.py.log`.
- `ex285_r75_tree_delta_lane_bits`: status `OK`, equivalent `1`, QoR `1361/19/25859`; method_signature `ex285|hamming_weight_route_descriptor_bitmix|delta_lane_roots_on_tree|tree_base_plus_delta_coordinate_lane_roots|yosys_internal_abc_g_aig|official_evaluate|lane_route_bits`; log `student/work/frontend_source_parallel_round75_20260613_1507/sub-unknown-r75/ex285/logs/ex285_r75_tree_delta_lane_bits.evaluate.py.log`.
- Outcome: no frontend/current/reference improvement versus frontend ADP `11033`, current ADP `9132`, and reference `5499`. The symcof edge route-bit family was the better of the two but still too large.
- Next action: route descriptors need to replace more of the decision-tree body, not just selected output roots.

## 2026-06-13 Round76 sub-unknown-r76

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/`.
- Scope: frontend/source-only, assigned cases `ex297`, `ex299`, `ex285`, `ex288`; no backend portfolio or post-AIG remap.
- Families tried:
  - exact swap-invariant wrapper around the current decision-tree source;
  - high-split/default control source as a materially different split descriptor.
- `ex285_r76_swap45_tree_current`: status `OK`, equivalent `1`, QoR `805/17/13685`; method_signature `ex285|hamming_weight_route_input_swap_invariant|swap45_wrapper_current_decision_tree|reuse exact input-swap invariant before the current tree body|yosys_internal_abc_g_aig|official_evaluate|full_word`; Verilog `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex285/verilog/ex285_r76_swap45_tree_current.v`; AIG `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex285/aigs/ex285_r76_swap45_tree_current.aig`; log `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex285/logs/ex285_r76_swap45_tree_current.evaluate.py.log`.
- `ex285_r76_highsplit_baseline_control`: status `OK`, equivalent `1`, QoR `3348/16/53568`; method_signature `ex285|hamming_weight_route_split_descriptor_control|high_split_default_control_source|shared high-bit split default source, no selected-bit grafts|yosys_internal_abc_g_aig|official_evaluate|full_word`; Verilog `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex285/verilog/ex285_r76_highsplit_baseline_control.v`; AIG `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex285/aigs/ex285_r76_highsplit_baseline_control.aig`; log `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex285/logs/ex285_r76_highsplit_baseline_control.evaluate.py.log`.
- Outcome: no improvement versus current `9132`, frontend `11033`, or reference `5499`. Swap pre-normalization preserved equivalence but increased ADP versus the current frontend tree; split/default remains much larger.
- Next action: do not repeat input-swap wrapping or split/default controls. Progress likely requires a nonlinear routing state that replaces the tree body, not a wrapper around it.

## 2026-06-13 Round77 sub-unknown-source-r77

- Campaign: `frontend_source_parallel_round77_20260613_1733`.
- Scope: frontend/source-only; current best source boundary variants; official `evaluate.py`; no backend portfolio or post-AIG optimization.
- Avoided r76 fixed phase rotate/highsplit/routing wrappers and r75 static bitcone grafts as-is.
- `ex285_r77_tree_route_decode_helper_boundary`: status `OK`, equivalent `1`, QoR `788/17/13396`; method_signature `ex285|hamming_weight_route_source_boundary|route_class_decode_helper_plus_tree_residual|only high-fanout pair OR/AND and parity route keys are kept; residual remains current exact tree|yosys_internal_abc_g_aig|official_evaluate|full_word_helper_boundary`; Verilog `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex285/verilog/ex285_r77_tree_route_decode_helper_boundary.v`; AIG `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex285/aigs/ex285_r77_tree_route_decode_helper_boundary.aig`; log `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex285/logs/ex285_r77_tree_route_decode_helper_boundary.evaluate.py.log`.
- `ex285_r77_flat_current_tree_alias`: status `OK`, equivalent `1`, QoR `818/17/13906`; method_signature `ex285|hamming_weight_route_source_boundary|flattened_current_tree_alias|no added kept route wires; direct flattened current exact tree source for flow comparison|yosys_internal_abc_g_aig|official_evaluate|full_word_flattened_tree`; Verilog `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex285/verilog/ex285_r77_flat_current_tree_alias.v`; AIG `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex285/aigs/ex285_r77_flat_current_tree_alias.aig`; log `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex285/logs/ex285_r77_flat_current_tree_alias.evaluate.py.log`.
- Outcome: best r77 shard row `ex285_r77_tree_route_decode_helper_boundary` ADP `13396` vs current `9132`, frontend `11033`, reference `5499`. No target/reference improvement.
- Next action: continue only if a smaller nonlinear descriptor replaces the current residual body; more wrappers alone are unlikely to bridge the reference gap.

## 2026-06-14 unknown-large-r4 campaign ex204_ex299_frontend_continuation_20260614_1216

- Scope: frontend-only, Yosys Verilog-to-AIG plus official `evaluate.py`; no backend, seed, or registry edits.
- Families tried:
  - `ex285_r4_current_boundary_d15`: current-boundary low-delay source replay, official OK `777/17/13209`; no improvement versus campaign frontend target `12800`.
  - `ex285_r4_paircount_sorted_mask_mix`: grouped output-mask donor mix using paircount/sorted descriptors; synthesis failed before evaluation because generated donor sources redefined `ex285_unknown_12x12_decision_tree_greedy`.
- Outcome: no official improvement. Avoid repeating plain current-boundary replay and repair the duplicate-module source generation before trying another multi-donor grouped-mask variant.
