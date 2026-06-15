# ex299 Frontend Attempts

## Current Best

- Current best frontend: `ex299_high_split_default_abc_g_aig`, area `118397`, delay `22`, ADP `2604734`.
- Reference: ADP `1013807`.
- Gap: `2.57x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `decision_tree_greedy`; tracked candidate count is `5`.
- Top results: `high_split_default:2851392`; `low_split_default:2975575`; `value_case:3529387`; `decision_tree_greedy:4185860`; `expr_default_exception:4213475`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex299`, but they are not the current tracked best.
- 2026-06-08 rot2 canonical-min RTL: exact and official `evaluate.py` OK, but `33880/128/4336640`, worse than current due excessive comparator/table delay.
- 2026-06-08 diagnostic-selected natural shared-BDD order: exact and official `evaluate.py` OK, but `118187/27/3191049`, worse than current.
- 2026-06-08 rotation representative-bit BDD: exact and official `evaluate.py` OK, but `123601/27/3337227`, worse than current due duplicated representative logic.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `118397/22/2604734`.
- 2026-06-08 pair-ring local-rule diagnostic: no AIG emitted. Treating the word as 8 two-bit cells, output cell 0 depends on all cells; radius 0/1/2/3 local rules failed, and radius 4 is exact only because it covers the full ring.
- 2026-06-09 rotation representative-bit BDD interleave/center replay: official `evaluate.py` OK; best was `144261/28/4039308`, worse than current.

## Do Not Repeat Blindly

- Plain high/low split and full value/default forms are exhausted.
- This case needs a substantially different representation; backend-only optimization on such a large seed is unlikely to close the gap.
- Even-rotation equivariance is exact, but dynamic canonical-min is too deep. Future attempts should preserve fixed phase or derive pair-ring logic instead of comparing all rotations.
- Natural shared-BDD slightly lowers area but increases delay enough to lose; do not repeat without a different order/source rewrite.
- Do not repeat natural-order representative-bit BDD reconstruction; future rotation work needs pair-ring/local predicates.
- Do not repeat interleave/center representative-bit BDD reconstruction; exact but significantly worse than current.
- Do not pursue a simple small-radius 2-bit pair-ring local rule; support spans the full ring.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

## 2026-06-12 Round9 state-r9 Plan

- Dossier: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex299/notes/high_level_dossier.md`.
- Observed decomposition: 16-bit word as 8 cyclic 2-bit cells; exact even-rotation equivariance; no constant outputs; small-radius pair-ring local rules rejected.
- Planned hypotheses: `ring_state_transition_bank` and `rotated_anf_monomial_bank`.
- Method signatures planned:
  - `ex299|cyclic_2bit_symbol_full_ring_descriptor|ring_state_transition_bank|shared_cumulative_cell_state_and_grouped_roots|yosys_abc_g_aig|exact_truth_descriptor_probe|all_outputs_grouped`
  - `ex299|cyclic_2bit_symbol_full_ring_descriptor|rotated_anf_monomial_bank|shared_rotation_grouped_gf2_terms|yosys_abc_g_aig|exact_truth_residual_probe|all_outputs_grouped`
- Official result: pending; no candidate Verilog generated before this note.
- Next action: generate and officially evaluate the two shard-local candidates, then record equivalent/no-improvement or blocker rows in shard CSVs.

## 2026-06-12 Round9 state-r9 Result

- `ex299|cyclic_2bit_symbol_full_ring_descriptor|ring_state_transition_bank|shared_cumulative_cell_state_and_grouped_roots|yosys_abc_g_aig|exact_truth_descriptor_probe|all_outputs_grouped`: Verilog emitted, but Yosys timed out after 30s before producing an AIG; no official evaluation possible.
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex299/verilog/ex299_ring_state_transition_bank_mtbdd_cellorder.v`
  - Log: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex299/logs/ex299_ring_state_transition_bank_mtbdd_cellorder.yosys.log`
- `ex299|cyclic_2bit_symbol_full_ring_descriptor|rotated_anf_monomial_bank|shared_rotation_grouped_gf2_terms|yosys_abc_g_aig|exact_truth_residual_probe|all_outputs_grouped`: blocked before Verilog; exact ANF union had `63936` terms, above the convergence cap.
- Outcome: blocked/no official candidate; the exact shared mux graph and ANF bank are too large for this pass.
- Next action: find a smaller full-ring descriptor or recurrence before another RTL emission; do not repeat this large MTBDD or direct ANF bank unchanged.

## 2026-06-12 Round10 unknown-state-r10

- method_signature: `ex299|state/cell interleaved selector exact split|symbol_plane_default_exception|shared selector decoders|abc_g_aig|official_truth_exact_partition|all_outputs_grouped`
- official result: `evaluate.py OK`, area `118441`, delay `21`, ADP `2487261`.
- paths:
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-state-r10/ex299/verilog/ex299_r10_symbol_plane_split_abc_g_aig.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-state-r10/ex299/aigs/ex299_r10_symbol_plane_split_abc_g_aig.aig`
  - official log: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-state-r10/ex299/logs/ex299_r10_symbol_plane_split_abc_g_aig.evaluate.log`
- outcome: New frontend best over prior `2604734`, but still above reference `1013807`.
- next action: Continue with a lower-delay full-ring descriptor or recurrence; do not replay the same symbol-plane split unchanged.

- method_signature: `ex299|state/cell descriptor shared BDD|cell_outside_in_mux_tree|single shared BDD node pool|abc_g_aig|official_truth_exact_bdd|all_outputs_grouped`
- official result: `evaluate.py OK`, area `118631`, delay `27`, ADP `3203037`.
- outcome: Equivalent but worse; exact BDD order/source form should not be repeated unchanged.

## 2026-06-12 Round12 state-r12

- method_signature: `ex299|cyclic 2-bit-symbol local context residual|phase_shared_r1_local_majority_xor_residual_bdd|phase local descriptor tables plus shared residual BDD|abc_g_aig|official_truth_exact_local_context_residual|all_outputs_grouped`
- representation: radius-1 local 2-bit-cell context predicts a phase-shared base bit; one shared BDD bank emits the XOR residual roots. This is not the round10 symbol-plane default/exception split and not an even-plane base residual replay.
- diagnostic: residual BDD nodes `72106`, residual density `0.366913`, table groups `phase0,phase1`.
- official result: `evaluate.py OK`, area `117321`, delay `28`, ADP `3284988`.
- paths:
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/state-r12/ex299/verilog/ex299_r12_localctx_r1_residual_bdd_abc_g_aig.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/state-r12/ex299/aigs/ex299_r12_localctx_r1_residual_bdd_abc_g_aig.aig`
  - official log: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/state-r12/ex299/logs/ex299_r12_localctx_r1_residual_bdd_abc_g_aig.evaluate.log`
  - diagnostic: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/state-r12/ex299/notes/ex299_r12_localctx_r1_residual_bdd_abc_g_aig.diagnostic.json`
- outcome: Equivalent but worse than current frontend `2487261`; record as low-value for this exact radius-1 local-context residual BDD form.

## 2026-06-12 Round16 unknown-state-r16

- `ex299|cyclic 2-bit-symbol cell descriptor|descriptor_key_default_exception|shared_descriptor_key_selector|abc_g_aig|official_truth_exact_invertible_cell_delta_key|all_outputs_grouped`: official `evaluate.py OK`, area `132635`, delay `24`, ADP `3183240`.
- `ex299|cyclic 2-bit-symbol output-grouped BDD|grouped_bdd_node_pools|per_group_shared_cofactors|abc_g_aig|official_truth_exact_grouped_bdd|cell_pairs`: official `evaluate.py OK`, area `119123`, delay `26`, ADP `3097198`.
- Paths: shard CSVs under `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round16_20260612_2233/agent_shards/unknown-state-r16/`; Verilog/AIG/logs under `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/unknown-state-r16/ex299/`.
- Outcome: both exact but worse than current frontend `2487261`; do not repeat these descriptor-key split or cell-pair grouped-BDD forms unchanged.

## 2026-06-12 Round18 unknown-state-r18

- method_signature: `ex299|cyclic_2bit_symbol_transition_recurrence|low_depth_symbol_plane_and_transition_predicate_smoke|shared_next_state_predicates|no_synth|abc_xf_truth_diagnostic|cell_outputs`
- outcome: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG emitted and no official candidate claimed.
- diagnostic evidence: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/unknown-state-r18/ex299/notes/ex299_r18_recurrence_blocker.md`
- machine evidence: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/unknown-state-r18/ex299/notes/ex299_r18_recurrence_blocker.json`
- findings: full-truth context and predicate tests kept conflicting buckets for low-depth local symbol-plane, adjacent transition-delta, and global plane-parity/shared next-state feature families.
- next action: continue only with a genuinely new nonlocal state basis or a compact source-level recurrence; do not replay round10 symbol-plane split, round16 descriptor-key/cell-pair BDD, or larger BDD pools.

## 2026-06-13 unknown-large-r24 symbol-plane majority refinement

- campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round24_20260613_0435/`
- agent/shard: `unknown-large-r24` (coordinator reconstructed shard CSVs from official worker logs because the worker hard-stopped after producing logs but before writing candidate rows).
- candidate: `ex299_r24_cell_grouped_symbol_plane_majority_default_abc_g_aig`.
- method signature: `ex299|unknown_large_r24|cell_grouped_symbol_plane_majority_default|ex299_r24_cell_grouped_symbol_plane_majority_default_abc_g_aig|official_evaluate_py`.
- official `evaluate.py` result: `118399/21/2486379`, improving frontend best from `2487261`; reference remains `1013807`.
- paths:
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/unknown-large-r24/ex299/verilog/ex299_r24_cell_grouped_symbol_plane_majority_default.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/unknown-large-r24/ex299/aigs/ex299_r24_cell_grouped_symbol_plane_majority_default_abc_g_aig.aig`
  - Evaluate log: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/unknown-large-r24/ex299/logs/ex299_r24_cell_grouped_symbol_plane_majority_default_abc_g_aig.evaluate.py.log`
  - Round24 merged results: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round24_20260613_0435/results/best_improvements.csv`
- Outcome: small but valid frontend improvement inside the symbol-plane family. Further progress should avoid plain symbol-plane synth-flow variants and instead seek a lower-delay nonlocal state basis or compact recurrence.

## 2026-06-13 unknown-large-r26 cell-prefix descriptor/residual probes

- campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/`
- agent/shard: `unknown-large-r26`.
- methods:
  - `cell_prefix_bridge` grouped by cell pairs.
  - `cell_prefix_bridge + rotl2 residual` grouped by cell pairs.
- official `evaluate.py` rows: 2/2 equivalent.
- best r26 result: `ex299_r26_cellprefix_bridge_cell_pairs_abc_g_aig`, `146475/32/4687200`.
- current frontend remains `2486379`; reference remains `1013807`.
- outcome: no frontend improvement. This key transform is much deeper than the current symbol-plane best; do not repeat the exact cell-prefix bridge or rot2-residual BDD source.

## 2026-06-13 unknown-symbol-r25 transformed-coordinate/grouped-BDD probe

- campaign: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/`
- agent/shard: `unknown-symbol-r25`
- high-level description: cyclic 2-bit-symbol rot2/cell descriptor with full-ring dependence.
- hypothesis families tried:
  - transformed movement/output coordinates: delta coordinate and output Gray coordinate BDDs.
  - output grouping: cell-pair grouped roots and mod4 output-plane grouped roots.
- official `evaluate.py` candidates: 3 equivalent candidates, 0 frontend improvements.
- best r25 row: `ex299_r25_raw_coord_cell_grouped_d20_abc_g_aig_d20`, area `119123`, delay `26`, ADP `3097198`; current frontend remains `2486379`, reference `1013807`.
- paths:
  - shard CSVs: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/unknown-symbol-r25/`
  - dossier: `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/unknown-symbol-r25/ex299/notes/high_level_dossier.md`
  - best evaluate log: `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/unknown-symbol-r25/ex299/logs/ex299_r25_raw_coord_cell_grouped_d20_abc_g_aig_d20.evaluate.py.log`
- outcome: equivalent but worse; do not repeat transformed-coordinate grouped BDDs or cell-pair grouped raw BDDs unchanged. Future progress likely needs a new compact recurrence or nonlocal state basis, not more exact grouped-BDD emission.

## 2026-06-13 Round60 sub-ex297-ex299-r60

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round60_20260613_0825/`.
- Recording-guided source diagnostic tried: shared ring/prefix/delta predicates plus selected-output low-depth ANF/LUT, with residual tables emitted only if they shrink.
- Result: no official candidate emitted. Residual did not shrink: best split stayed `symbol_planes`, `302600` exceptions vs raw `302600`; best ANF stayed raw at `479360` terms; exact degree<=4 selected bits `0`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round60_20260613_0825/agent_shards/sub-ex297-ex299-r60/evaluation_results.csv`.
- Outcome: blocked/no-candidate only; no Verilog/AIG/evaluate.py success claimed. Do not repeat this ring-prefix selected ANF/LUT diagnostic unchanged; next progress needs a compact recurrence or genuinely new nonlocal state basis.

## 2026-06-13 Round62 sub-unklarge-r62

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/`.
- Source-only diagnostic families screened:
  - nonlinear full-ring cell descriptor with adjacent/distance-2 histogram anchors;
  - compact bidirectional recurrence state;
  - invariant output grouping.
- Best diagnostic: `cell_descriptor_residual/adjhist_distance2_local`, residual exceptions `30640` vs symbol-plane baseline `302600`.
- No RTL was emitted for ex299 because the estimated source remained too large (`117344` shared default entries plus `17892` row overrides); no AIG or `evaluate.py` success row exists.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/agent_shards/sub-unklarge-r62/evaluation_results.csv`.
- Outcome: promising blocked/no-candidate diagnostic only. Do not count as success. Next attempt should compress the descriptor/default representation or find a recurrence that reduces residuals below source-worthy size.

## 2026-06-13 Round64 sub-unklarge-alt-r64

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/`.
- method_signature: `ex299|cyclic_2bit_symbol_non_table_screen|compact_recurrence_state|shared_cell_or_cofactor_descriptor|no_synth|abc_xf_truth_diagnostic|cell_outputs`.
- Source-only families screened before RTL: radius-2 local transition recurrence, adjacent/distance-2 ring cell descriptor, sparse histogram exception-free descriptor, compact recurrence-state descriptors, and low/high/even/odd cofactor screens.
- Best blocker: `compact_recurrence_state/recurrence_state8_cell`, residual exceptions `9689` vs symbol-plane baseline `302600`, but estimated default-key source size `507136` remained table-sized.
- Official result: no Verilog/AIG emitted and no `evaluate.py` success claimed; blocked/no-candidate by source-size gate.
- Evidence:
  - Dossier: `student/work/frontend_source_parallel_round64_20260613_1004/sub-unklarge-alt-r64/ex299/notes/high_level_dossier.md`
  - Diagnostics: `student/work/frontend_source_parallel_round64_20260613_1004/sub-unklarge-alt-r64/ex299/diagnostics/ex299_r64_source_screens.csv`
  - Shard evaluation rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/agent_shards/sub-unklarge-alt-r64/evaluation_results.csv`
- Next action: seek a recurrence that makes the descriptor itself computable as shared logic, not another default/override table over recurrence-state keys.

## 2026-06-13 Round65 sub-unklarge-rule-r65

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round65_20260613_1029/`.
- Families screened: radius-1/radius-2 cellular update, transition-delta rules, ring conservation descriptors, cyclic prefix state, and sparse exception-free formulas.
- Official result: no Verilog/AIG emitted; no `evaluate.py` success claimed.
- Best blocker: `cyclic_prefix_state/xor_prefix_cell` had zero residual rows but 524288 keys / estimated entries, so it is still table-sized.
- Evidence: `student/work/frontend_source_parallel_round65_20260613_1029/sub-unklarge-rule-r65/ex299/diagnostics/ex299_r65_rule_screens.csv`; dossier `student/work/frontend_source_parallel_round65_20260613_1029/sub-unklarge-rule-r65/ex299/notes/high_level_dossier.md`.
- Next action: do not repeat local/conservation/prefix formula screens unchanged. Future work needs either a symbolic recurrence that computes the descriptor directly or source-level factoring of the current best symbol-plane/decision source.

## 2026-06-13 Round74 sub-unknown-rot2-r74

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/`.
- Scope: frontend-only, source RTL plus Yosys `abc -g aig` and official `evaluate.py`.
- `ex299_r74_adjacent_sel23_cluster_mix`: status `OK`, equivalent `1`, QoR `98831/18/1778958`; method_signature `ex299|cyclic_2bit_adjacent_selector_cluster_overlay|sel23_selected_po_clusters_on_sel2_source|sel2_cluster_bdd_plus_celllocal_roots|yosys_internal_abc_g_aig|official_evaluate|adjacent_cell_clusters`; log `student/work/frontend_source_parallel_round74_20260613_1439/sub-unknown-rot2-r74/ex299/logs/ex299_r74_adjacent_sel23_cluster_mix.evaluate.py.log`.
- `ex299_r74_pairxor_pairsel_mix`: status `OK`, equivalent `1`, QoR `98790/18/1778220`; method_signature `ex299|cyclic_2bit_pairxor_pairsel_hybrid|selector_pair_xor_po_cell_mix|sel2_cluster_bdd_and_pairsel_template_roots|yosys_internal_abc_g_aig|official_evaluate|cell_pair_outputs`; log `student/work/frontend_source_parallel_round74_20260613_1439/sub-unknown-rot2-r74/ex299/logs/ex299_r74_pairxor_pairsel_mix.evaluate.py.log`.
- Outcome: no current frontend/reference improvement; do not repeat these exact r74 wrappers unchanged.

## 2026-06-13 Round75 sub-unknown-r75

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/`.
- Scope: frontend/source-only, Yosys internal `abc -g aig`, official `evaluate.py`; no backend or post-AIG optimization.
- `ex299_r75_sel2_uncond_pairsel_tailcluster`: status `OK`, equivalent `1`, QoR `98857/18/1779426`; method_signature `ex299|cyclic_2bit_cross_initial_po_cluster|unconditional_pairsel_tailcluster_on_sel2|sel2_cluster_source_plus_pairsel_tail_roots|yosys_internal_abc_g_aig|official_evaluate|tail_cell_cluster`; log `student/work/frontend_source_parallel_round75_20260613_1507/sub-unknown-r75/ex299/logs/ex299_r75_sel2_uncond_pairsel_tailcluster.evaluate.py.log`.
- `ex299_r75_sel2_uncond_pairsel_lowtail`: status `OK`, equivalent `1`, QoR `98777/18/1777986`; method_signature `ex299|cyclic_2bit_cross_initial_po_cluster|unconditional_pairsel_edgeclusters_on_sel2|sel2_cluster_source_plus_pairsel_edge_roots|yosys_internal_abc_g_aig|official_evaluate|edge_cell_clusters`; log `student/work/frontend_source_parallel_round75_20260613_1507/sub-unknown-r75/ex299/logs/ex299_r75_sel2_uncond_pairsel_lowtail.evaluate.py.log`.
- Outcome: no current frontend/reference improvement versus current frontend ADP `1777806` and reference `1013807`. The lowtail variant was very close but still `180` ADP worse than current best `ex299_r73_sel2_cluster_bdd`.
- Next action: pairsel edge/tail root substitution is not enough by itself; future work needs a source-level reduction in the sel2 cluster body, not only PO ownership swaps.

## 2026-06-13 Round76 sub-unknown-r76

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/`.
- Scope: frontend/source-only, assigned cases `ex297`, `ex299`, `ex285`, `ex288`; no backend portfolio or post-AIG remap.
- Target note: latest best is `ex299_r75_sel2_pairsel_cluster_static`, ADP `1777230`; round76 compared against `1777230`, not the older `1777806`.
- Families tried:
  - fixed one-cell rotation wrapper around the latest sel2/static source, using exact even-cell rotation equivariance and adding no new static bit grafts;
  - non-r75 pairxor/pairsel control source.
- `ex299_r76_fixed_phase_rotate_sel2_static`: status `OK`, equivalent `1`, QoR `98849/20/1976980`; method_signature `ex299|cyclic_2bit_fixed_phase_equivariance|fixed_one_cell_rotate_wrapper_on_sel2_static_source|uses proven even-cell rotation equivariance around latest source; no extra static bit grafts added|yosys_internal_abc_g_aig|official_evaluate|cell_pair_outputs`; Verilog `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex299/verilog/ex299_r76_fixed_phase_rotate_sel2_static.v`; AIG `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex299/aigs/ex299_r76_fixed_phase_rotate_sel2_static.aig`; log `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex299/logs/ex299_r76_fixed_phase_rotate_sel2_static.evaluate.py.log`.
- `ex299_r76_r74_pairxor_control`: status `OK`, equivalent `1`, QoR `98923/20/1978460`; method_signature `ex299|cyclic_2bit_pairxor_pairsel_control|pairxor_pairsel_mix_control_source|pair-xor and pairsel root sharing from a non-r75 source|yosys_internal_abc_g_aig|official_evaluate|cell_pair_outputs`; Verilog `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex299/verilog/ex299_r76_r74_pairxor_control.v`; AIG `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex299/aigs/ex299_r76_r74_pairxor_control.aig`; log `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex299/logs/ex299_r76_r74_pairxor_control.evaluate.py.log`.
- Outcome: no improvement versus latest current/frontend `1777230` or reference `1013807`. Fixed-phase wrapping and non-r75 pairxor control both increased delay to `20`, leaving ADP around `1.98M`.
- Next action: do not repeat fixed-phase wrappers or r74 pairxor controls. Progress likely requires computing a smaller sel2/cell descriptor body rather than wrapping or substituting output clusters.

## 2026-06-13 Round77 sub-unknown-source-r77

- Campaign: `frontend_source_parallel_round77_20260613_1733`.
- Scope: frontend/source-only; current best source boundary variants; official `evaluate.py`; no backend portfolio or post-AIG optimization.
- Avoided r76 fixed phase rotate/highsplit/routing wrappers and r75 static bitcone grafts as-is.
- `ex299_r77_sel2_pairsel_grouped_static_helper`: status `OK`, equivalent `1`, QoR `98862/20/1977240`; method_signature `ex299|cyclic_2bit_selector_source_boundary|grouped_static_cluster_assigns_with_keep_helper|sel2 cluster source shared once; selected pairsel low-tail bits isolated as kept cluster wire|yosys_internal_abc_g_aig|official_evaluate|static_clustered_outputs`; Verilog `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex299/verilog/ex299_r77_sel2_pairsel_grouped_static_helper.v`; AIG `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex299/aigs/ex299_r77_sel2_pairsel_grouped_static_helper.aig`; log `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex299/logs/ex299_r77_sel2_pairsel_grouped_static_helper.evaluate.py.log`.
- `ex299_r77_sel2_lowtail_pairsel_helper`: status `OK`, equivalent `1`, QoR `98809/20/1976180`; method_signature `ex299|cyclic_2bit_selector_source_boundary|low_tail_factored_tiny_helper_module|sel2 cluster remains top-level; pairsel contribution is isolated behind a two-bit low-tail helper|yosys_internal_abc_g_aig|official_evaluate|low_tail_helper_outputs`; Verilog `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex299/verilog/ex299_r77_sel2_lowtail_pairsel_helper.v`; AIG `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex299/aigs/ex299_r77_sel2_lowtail_pairsel_helper.aig`; log `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex299/logs/ex299_r77_sel2_lowtail_pairsel_helper.evaluate.py.log`.
- Outcome: best r77 shard row `ex299_r77_sel2_lowtail_pairsel_helper` ADP `1976180` vs current `1777230`, frontend `1777230`, reference `1013807`. No target/reference improvement.
- Next action: continue only if a smaller nonlinear descriptor replaces the current residual body; more wrappers alone are unlikely to bridge the reference gap.

## 2026-06-14 unknown-large-r4 campaign ex204_ex299_frontend_continuation_20260614_1216

- Scope: frontend-only, Yosys Verilog-to-AIG plus official `evaluate.py`; no backend, seed, or registry edits.
- Families tried:
  - `ex299_r4_celllocal_d17`: current celllocal low-delay source replay, official OK `98776/18/1777968`; no improvement versus campaign frontend target `1774260`.
  - `ex299_r4_pairsel_lowmid_mask_mix`: pairsel low/mid grouped output-mask donor mix with cross-output descriptor sharing; Yosys synthesis timed out after 540s before official evaluation.
- Outcome: no official improvement. Avoid the pairsel low/mid multi-source mix in this form; it is too large for frontend synthesis and likely needs a smaller descriptor body before retrying.
