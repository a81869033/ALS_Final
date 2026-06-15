# ex297 Frontend Attempts

## Current Best

- Current best frontend: `ex297_low_split_default_abc_g_aig`, area `32422`, delay `18`, ADP `583596`.
- Reference: ADP `225900`.
- Gap: `2.58x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `high_split_default`, `low_split_default`, `rotate_high_split_default`, `decision_tree_greedy`; tracked candidate count is `6`.
- Top results: `low_split_default:683613`; `rotate_high_split_default:684789`; `high_split_default:694029`; `value_case:813816`; `decision_tree_greedy:889479`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex297`, but they are not the current tracked best.
- 2026-06-08 rot2 canonical-min RTL: exact and official `evaluate.py` OK, but `10352/112/1159424`, worse than current due excessive comparator/table delay.
- 2026-06-08 diagnostic-selected natural shared-BDD order: exact and official `evaluate.py` OK, but `32175/24/772200`, worse than current.
- 2026-06-08 rotation representative-bit BDD: exact and official `evaluate.py` OK, but `35431/22/779482`, worse than current due duplicated representative logic.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `32422/18/583596`.
- 2026-06-08 pair-ring local-rule diagnostic: no AIG emitted. Treating the word as 7 two-bit cells, output cell 0 depends on all cells; radius 0/1/2 local rules failed, and radius 3 is exact only because it covers the full ring.
- 2026-06-09 rotation representative-bit BDD interleave/center replay: official `evaluate.py` OK; best was `40859/24/980616`, worse than current.

## Do Not Repeat Blindly

- Low split, rotate-high split, and high split are very close; just changing split direction is exhausted.
- Need a stronger decomposition than table split.
- Even-rotation equivariance is exact, but dynamic canonical-min is not the right source form; try fixed-phase/orbit sharing or pair-ring local logic instead.
- Natural shared-BDD did not improve ADP; if revisiting BDD, change source structure or order substantially.
- Do not repeat natural-order representative-bit BDD reconstruction; future rotation work needs pair-ring/local predicates.
- Do not repeat interleave/center representative-bit BDD reconstruction; exact but worse than current by a wide margin.
- Do not pursue a simple small-radius 2-bit pair-ring local rule; support spans the full ring.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

## 2026-06-12 Round9 state-r9 Plan

- Dossier: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex297/notes/high_level_dossier.md`.
- Observed decomposition: 14-bit word as 7 cyclic 2-bit cells; exact even-rotation equivariance; no constant outputs; small-radius pair-ring local rules rejected.
- Planned hypotheses: `ring_state_transition_bank` and `rotated_anf_monomial_bank`.
- Method signatures planned:
  - `ex297|cyclic_2bit_symbol_full_ring_descriptor|ring_state_transition_bank|shared_cumulative_cell_state_and_grouped_roots|yosys_abc_g_aig|exact_truth_descriptor_probe|all_outputs_grouped`
  - `ex297|cyclic_2bit_symbol_full_ring_descriptor|rotated_anf_monomial_bank|shared_rotation_grouped_gf2_terms|yosys_abc_g_aig|exact_truth_residual_probe|all_outputs_grouped`
- Official result: pending; no candidate Verilog generated before this note.
- Next action: generate and officially evaluate the two shard-local candidates, then record equivalent/no-improvement or blocker rows in shard CSVs.

## 2026-06-12 Round9 state-r9 Result

- `ex297|cyclic_2bit_symbol_full_ring_descriptor|ring_state_transition_bank|shared_cumulative_cell_state_and_grouped_roots|yosys_abc_g_aig|exact_truth_descriptor_probe|all_outputs_grouped`: official `evaluate.py` OK, `40252/23/925796`, equivalent but worse than current frontend `583596`.
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex297/verilog/ex297_ring_state_transition_bank_mtbdd_cellorder.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex297/aigs/ex297_ring_state_transition_bank_mtbdd_cellorder.aig`
  - Log: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex297/logs/ex297_ring_state_transition_bank_mtbdd_cellorder.evaluate.log`
- `ex297|cyclic_2bit_symbol_full_ring_descriptor|rotated_anf_monomial_bank|shared_rotation_grouped_gf2_terms|yosys_abc_g_aig|exact_truth_residual_probe|all_outputs_grouped`: Verilog emitted, but Yosys timed out after 10s before producing an AIG; no official evaluation possible.
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex297/verilog/ex297_rotated_anf_monomial_bank.v`
  - Log: `student/work/ex200_ex299_frontend_refgap_round9_20260612_1851/state-r9/ex297/logs/ex297_rotated_anf_monomial_bank.yosys.log`
- Outcome: evaluated no improvement; the shared mux graph is exact but too large/delay-heavy, and the ANF bank is too slow to synthesize in this convergence pass.
- Next action: do not repeat these exact MTBDD/ANF emissions; a future attempt needs a smaller semantic state basis before RTL emission.

## 2026-06-12 Round10 unknown-state-r10

- method_signature: `ex297|state/cell interleaved selector exact split|symbol_plane_default_exception|shared selector decoders|abc_g_aig|official_truth_exact_partition|all_outputs_grouped`
- official result: `evaluate.py OK`, area `31644`, delay `18`, ADP `569592`.
- paths:
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-state-r10/ex297/verilog/ex297_r10_symbol_plane_split_abc_g_aig.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-state-r10/ex297/aigs/ex297_r10_symbol_plane_split_abc_g_aig.aig`
  - official log: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-state-r10/ex297/logs/ex297_r10_symbol_plane_split_abc_g_aig.evaluate.log`
- outcome: New frontend best over prior `583596`, but still above reference `225900`.
- next action: Continue with a lower-delay state/cell descriptor or recurrence; do not replay the same symbol-plane split unchanged.

- method_signature: `ex297|state/cell descriptor shared BDD|cell_outside_in_mux_tree|single shared BDD node pool|abc_g_aig|official_truth_exact_bdd|all_outputs_grouped`
- official result: `evaluate.py OK`, area `32325`, delay `23`, ADP `743475`.
- outcome: Equivalent but worse; exact BDD order/source form should not be repeated unchanged.

## 2026-06-12 Round12 state-r12

- method_signature: `ex297|cyclic 2-bit-symbol local context residual|phase_shared_r1_local_majority_xor_residual_bdd|phase local descriptor tables plus shared residual BDD|abc_g_aig|official_truth_exact_local_context_residual|all_outputs_grouped`
- representation: radius-1 local 2-bit-cell context predicts a phase-shared base bit; one shared BDD bank emits the XOR residual roots. This is not the round10 symbol-plane default/exception split and not an even-plane base residual replay.
- diagnostic: residual BDD nodes `20397`, residual density `0.366974`, table groups `phase0,phase1`.
- official result: `evaluate.py OK`, area `31840`, delay `24`, ADP `764160`.
- paths:
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/state-r12/ex297/verilog/ex297_r12_localctx_r1_residual_bdd_abc_g_aig.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/state-r12/ex297/aigs/ex297_r12_localctx_r1_residual_bdd_abc_g_aig.aig`
  - official log: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/state-r12/ex297/logs/ex297_r12_localctx_r1_residual_bdd_abc_g_aig.evaluate.log`
  - diagnostic: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/state-r12/ex297/notes/ex297_r12_localctx_r1_residual_bdd_abc_g_aig.diagnostic.json`
- outcome: Equivalent but worse than current frontend `569592`; record as low-value for this exact radius-1 local-context residual BDD form.

## 2026-06-12 Round16 unknown-state-r16

- `ex297|cyclic 2-bit-symbol cell descriptor|descriptor_key_default_exception|shared_descriptor_key_selector|abc_g_aig|official_truth_exact_invertible_cell_delta_key|all_outputs_grouped`: official `evaluate.py OK`, area `35306`, delay `21`, ADP `741426`.
- `ex297|cyclic 2-bit-symbol output-grouped BDD|grouped_bdd_node_pools|per_group_shared_cofactors|abc_g_aig|official_truth_exact_grouped_bdd|cell_pairs`: official `evaluate.py OK`, area `32325`, delay `23`, ADP `743475`.
- Paths: shard CSVs under `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round16_20260612_2233/agent_shards/unknown-state-r16/`; Verilog/AIG/logs under `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/unknown-state-r16/ex297/`.
- Outcome: both exact but worse than current frontend `569592`; do not repeat these descriptor-key split or cell-pair grouped-BDD forms unchanged.

## 2026-06-12 Round17 unknown-state-r17

- method_signature: `ex297|cyclic_2bit_symbol_transition_recurrence|phase_shared_local_anf_and_predicate_smoke|shared_symbol_plane_local_predicates|no_synth|abc_xf_truth_diagnostic|cell_outputs`
- outcome: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG emitted and no official candidate claimed.
- diagnostic evidence: `student/work/ex200_ex299_frontend_refgap_round17_20260612_2300/unknown-state-r17/ex297/notes/ex297_r17_blocker_diagnostic.md`
- findings: even 2-bit-cell rotation equivariance remains exact, but phase-shared radius-2 local context still has `1002` to `1012` conflicting contexts; per-position radius-2 local context still has at least `4799` best mismatches; local ANF through degree 3 and radius-2 plus plane-parity predicate families both have feature conflicts.
- rationale: radius 3 is exact only because it covers the full 7-cell ring, so emitting from it would replay rejected full descriptor/table/BDD forms rather than provide a new lower-delay recurrence.
- next action: continue only with a genuinely new nonlocal state basis; do not repeat round10 symbol-plane split, round16 descriptor-key split, cell-pair grouped BDD, or anchored adjacent-cell BDD.

## 2026-06-13 unknown-large-r24 symbol-plane majority refinement

- campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round24_20260613_0435/`
- agent/shard: `unknown-large-r24` (coordinator reconstructed shard CSVs from official worker logs because the worker hard-stopped after producing logs but before writing candidate rows).
- candidate: `ex297_r24_cell_grouped_symbol_plane_majority_default_abc_g_aig`.
- method signature: `ex297|unknown_large_r24|cell_grouped_symbol_plane_majority_default|ex297_r24_cell_grouped_symbol_plane_majority_default_abc_g_aig|official_evaluate_py`.
- official `evaluate.py` result: `31593/18/568674`, improving frontend best from `569592`; reference remains `225900`.
- paths:
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/unknown-large-r24/ex297/verilog/ex297_r24_cell_grouped_symbol_plane_majority_default.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/unknown-large-r24/ex297/aigs/ex297_r24_cell_grouped_symbol_plane_majority_default_abc_g_aig.aig`
  - Evaluate log: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/unknown-large-r24/ex297/logs/ex297_r24_cell_grouped_symbol_plane_majority_default_abc_g_aig.evaluate.py.log`
  - Round24 merged results: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round24_20260613_0435/results/best_improvements.csv`
- Outcome: small but valid frontend improvement inside the symbol-plane family. This still does not change the core blocker: reference-scale progress likely needs a genuinely new nonlocal state basis, not more synth-flow replay around symbol-plane split.

## 2026-06-13 unknown-large-r26 cell-prefix descriptor/residual probes

- campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/`
- agent/shard: `unknown-large-r26`.
- methods:
  - `cell_prefix_bridge` grouped by cell pairs.
  - `cell_prefix_bridge + rotl2 residual` grouped by cell pairs.
  - `cell_prefix_bridge` grouped by output bit modulo 4.
- official `evaluate.py` rows: 3/3 equivalent.
- best r26 result: `ex297_r26_cellprefix_mod4_descriptor_mod4_output_planes_abc_g_aig`, `38841/27/1048707`.
- current frontend remains `568674`; reference remains `225900`.
- outcome: no frontend improvement. The cell-prefix bridge key and rot2 residual forms increase delay substantially, so do not repeat these exact descriptor/residual emissions without a new lower-depth source.

## 2026-06-13 unknown-symbol-r25 transformed-coordinate/grouped-BDD probe

- campaign: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/`
- agent/shard: `unknown-symbol-r25`
- high-level description: cyclic 2-bit-symbol rot2/cell descriptor with full-ring dependence.
- hypothesis families tried:
  - transformed movement/output coordinates: delta coordinate and output Gray coordinate BDDs.
  - output grouping: cell-pair grouped roots and mod4 output-plane grouped roots.
- official `evaluate.py` candidates: 3 equivalent candidates, 0 frontend improvements.
- best r25 row: `ex297_r25_raw_coord_cell_grouped_d20_abc_g_aig_d20`, area `32325`, delay `23`, ADP `743475`; current frontend remains `568674`, reference `225900`.
- paths:
  - shard CSVs: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/unknown-symbol-r25/`
  - dossier: `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/unknown-symbol-r25/ex297/notes/high_level_dossier.md`
  - best evaluate log: `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/unknown-symbol-r25/ex297/logs/ex297_r25_raw_coord_cell_grouped_d20_abc_g_aig_d20.evaluate.py.log`
- outcome: equivalent but worse; do not repeat transformed-coordinate grouped BDDs or cell-pair grouped raw BDDs unchanged. Future progress likely needs a new compact nonlocal state basis rather than another exact BDD regrouping.

## 2026-06-13 Round60 sub-ex297-ex299-r60

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round60_20260613_0825/`.
- Recording-guided source diagnostic tried: shared ring/prefix/delta predicates plus selected-output low-depth ANF/LUT, with residual tables emitted only if they shrink.
- Result: no official candidate emitted. Residual did not shrink: best split stayed `symbol_planes`, `67305` exceptions vs raw `67305`; best ANF stayed raw at `103236` terms; exact degree<=4 selected bits `0`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round60_20260613_0825/agent_shards/sub-ex297-ex299-r60/evaluation_results.csv`.
- Outcome: blocked/no-candidate only; no Verilog/AIG/evaluate.py success claimed. Do not repeat this ring-prefix selected ANF/LUT diagnostic unchanged; next progress needs a genuinely new nonlocal state basis.

## 2026-06-13 Round62 sub-unklarge-r62

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/`.
- Source-only diagnostic families screened:
  - nonlinear full-ring cell descriptor with adjacent/distance-2 histogram anchors;
  - compact bidirectional recurrence state;
  - invariant output grouping.
- Best diagnostic: `cell_descriptor_residual/adjhist_distance2_local`, residual exceptions `3808` vs symbol-plane baseline `67305`.
- Candidate attempted: `ex297_r62_adjhist_distance2_shared_default_residual` emitted as source RTL, but Yosys timed out and produced no AIG; no `evaluate.py` success row exists.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/agent_shards/sub-unklarge-r62/evaluation_results.csv`.
- Outcome: promising blocked/synthesis-failed diagnostic only. Do not count as success. Next attempt should compress the adjhist distance2 descriptor source or derive a smaller nonlinear state basis before RTL emission.

## 2026-06-13 Round64 sub-unklarge-alt-r64

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/`.
- method_signature: `ex297|cyclic_2bit_symbol_non_table_screen|compact_recurrence_state|shared_cell_or_cofactor_descriptor|no_synth|abc_xf_truth_diagnostic|cell_outputs`.
- Source-only families screened before RTL: radius-2 local transition recurrence, adjacent/distance-2 ring cell descriptor, sparse histogram exception-free descriptor, compact recurrence-state descriptors, and low/high/even/odd cofactor screens.
- Best blocker: `compact_recurrence_state/recurrence_state10_cell`, residual exceptions `1195` vs symbol-plane baseline `67305`, but estimated default-key source size `112460` remained table-sized.
- Official result: no Verilog/AIG emitted and no `evaluate.py` success claimed; blocked/no-candidate by source-size gate.
- Evidence:
  - Dossier: `student/work/frontend_source_parallel_round64_20260613_1004/sub-unklarge-alt-r64/ex297/notes/high_level_dossier.md`
  - Diagnostics: `student/work/frontend_source_parallel_round64_20260613_1004/sub-unklarge-alt-r64/ex297/diagnostics/ex297_r64_source_screens.csv`
  - Shard evaluation rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/agent_shards/sub-unklarge-alt-r64/evaluation_results.csv`
- Next action: only continue if a recurrence collapses the default-key count by orders of magnitude or removes row overrides entirely; do not emit recurrence-state tables as RTL.

## 2026-06-13 Round65 sub-unklarge-rule-r65

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round65_20260613_1029/`.
- Families screened: radius-1/radius-2 cellular update, transition-delta rules, ring conservation descriptors, cyclic prefix state, and sparse exception-free formulas.
- Official result: no Verilog/AIG emitted; no `evaluate.py` success claimed.
- Best blocker: `transition_delta_rule/radius2_stride2_cell` had zero residual rows but 114688 keys / estimated entries, so it is still table-sized.
- Evidence: `student/work/frontend_source_parallel_round65_20260613_1029/sub-unklarge-rule-r65/ex297/diagnostics/ex297_r65_rule_screens.csv`; dossier `student/work/frontend_source_parallel_round65_20260613_1029/sub-unklarge-rule-r65/ex297/notes/high_level_dossier.md`.
- Next action: do not repeat local/conservation/prefix formula screens unchanged. Future work needs either a symbolic recurrence that computes the descriptor directly or source-level factoring of the current best symbol-plane/decision source.

## 2026-06-13 Round74 sub-unknown-rot2-r74

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/`.
- Scope: frontend-only, source RTL plus Yosys `abc -g aig` and official `evaluate.py`.
- `ex297_r74_adjacent_sel23_cluster_mix`: status `OK`, equivalent `1`, QoR `26639/16/426224`; method_signature `ex297|cyclic_2bit_adjacent_selector_cluster_overlay|sel23_selected_po_clusters_on_pairsel_source|pairsel_template_plus_sel2_cluster_roots|yosys_internal_abc_g_aig|official_evaluate|adjacent_cell_clusters`; log `student/work/frontend_source_parallel_round74_20260613_1439/sub-unknown-rot2-r74/ex297/logs/ex297_r74_adjacent_sel23_cluster_mix.evaluate.py.log`.
- `ex297_r74_pairxor_celllocal_mix`: status `OK`, equivalent `1`, QoR `26609/16/425744`; method_signature `ex297|cyclic_2bit_pairxor_celllocal_hybrid|selector_pair_xor_po_cell_mix|pairsel_template_and_celllocal_roots|yosys_internal_abc_g_aig|official_evaluate|cell_pair_outputs`; log `student/work/frontend_source_parallel_round74_20260613_1439/sub-unknown-rot2-r74/ex297/logs/ex297_r74_pairxor_celllocal_mix.evaluate.py.log`.
- Outcome: no current frontend/reference improvement; do not repeat these exact r74 wrappers unchanged.

## 2026-06-13 Round75 sub-unknown-r75

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/`.
- Scope: frontend/source-only, Yosys internal `abc -g aig`, official `evaluate.py`; no backend or post-AIG optimization.
- `ex297_r75_pairsel_uncond_sel2_midcluster`: status `OK`, equivalent `1`, QoR `26617/16/425872`; method_signature `ex297|cyclic_2bit_cross_initial_po_cluster|unconditional_sel2_midcluster_on_pairsel|pairsel_template_plus_sel2_cluster_roots_no_branch_mux|yosys_internal_abc_g_aig|official_evaluate|mid_cell_cluster`; log `student/work/frontend_source_parallel_round75_20260613_1507/sub-unknown-r75/ex297/logs/ex297_r75_pairsel_uncond_sel2_midcluster.evaluate.py.log`.
- `ex297_r75_pairsel_uncond_sel2_dualcluster`: status `OK`, equivalent `1`, QoR `26645/16/426320`; method_signature `ex297|cyclic_2bit_cross_initial_po_cluster|unconditional_sel2_dual_midcluster_on_pairsel|pairsel_template_plus_sel2_cluster_roots_no_branch_mux|yosys_internal_abc_g_aig|official_evaluate|dual_mid_cell_clusters`; log `student/work/frontend_source_parallel_round75_20260613_1507/sub-unknown-r75/ex297/logs/ex297_r75_pairsel_uncond_sel2_dualcluster.evaluate.py.log`.
- Outcome: no current frontend/reference improvement versus current frontend ADP `425024` and reference `225900`. The best round75 candidate was close but still `848` ADP worse than the current best `ex297_r73_pairsel_cell_bit_template`.
- Next action: avoid further unconditional selector-cluster substitution on this pairsel template unless the source transform changes the shared cell descriptor itself.

## 2026-06-13 Round76 sub-unknown-r76

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/`.
- Scope: frontend/source-only, assigned cases `ex297`, `ex299`, `ex285`, `ex288`; no backend portfolio or post-AIG remap.
- Families tried:
  - fixed one-cell rotation wrapper around the current pairsel template, using exact even-cell rotation equivariance;
  - non-r75 pairxor/cell-local control source.
- `ex297_r76_fixed_phase_rotate_pairsel`: status `OK`, equivalent `1`, QoR `26588/19/505172`; method_signature `ex297|cyclic_2bit_fixed_phase_equivariance|fixed_one_cell_rotate_wrapper_on_pairsel_template|uses proven even-cell rotation equivariance instead of unconditional selector-cluster substitution|yosys_internal_abc_g_aig|official_evaluate|cell_pair_outputs`; Verilog `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex297/verilog/ex297_r76_fixed_phase_rotate_pairsel.v`; AIG `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex297/aigs/ex297_r76_fixed_phase_rotate_pairsel.aig`; log `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex297/logs/ex297_r76_fixed_phase_rotate_pairsel.evaluate.py.log`.
- `ex297_r76_r74_pairxor_control`: status `OK`, equivalent `1`, QoR `26614/18/479052`; method_signature `ex297|cyclic_2bit_pairxor_celllocal_control|pairxor_celllocal_mix_control_source|pair-xor and cell-local root sharing from a non-r75 source|yosys_internal_abc_g_aig|official_evaluate|cell_pair_outputs`; Verilog `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex297/verilog/ex297_r76_r74_pairxor_control.v`; AIG `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex297/aigs/ex297_r76_r74_pairxor_control.aig`; log `student/work/frontend_source_parallel_round76_20260613_1706/sub-unknown-r76/ex297/logs/ex297_r76_r74_pairxor_control.evaluate.py.log`.
- Outcome: no improvement versus current/frontend `425024` or reference `225900`. The fixed-phase wrapper worsened delay; the pairxor/cell-local control was equivalent but still `54028` ADP above current.
- Next action: simple fixed-phase rotation reuse is not the missing structure. Continue only with a source-level reduction in the shared cell descriptor, not more wrappers or output-cluster swaps.

## 2026-06-13 Round77 sub-unknown-source-r77

- Campaign: `frontend_source_parallel_round77_20260613_1733`.
- Scope: frontend/source-only; current best source boundary variants; official `evaluate.py`; no backend portfolio or post-AIG optimization.
- Avoided r76 fixed phase rotate/highsplit/routing wrappers and r75 static bitcone grafts as-is.
- `ex297_r77_pairsel_grouped_keep_helper`: status `OK`, equivalent `1`, QoR `26603/17/452251`; method_signature `ex297|cyclic_2bit_selector_source_boundary|grouped_pair_output_assigns_with_keep_helper|cell/bit source modules shared once; high-fanout selector predicates kept in a helper boundary|yosys_internal_abc_g_aig|official_evaluate|cell_pair_grouped_outputs`; Verilog `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex297/verilog/ex297_r77_pairsel_grouped_keep_helper.v`; AIG `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex297/aigs/ex297_r77_pairsel_grouped_keep_helper.aig`; log `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex297/logs/ex297_r77_pairsel_grouped_keep_helper.evaluate.py.log`.
- `ex297_r77_pairsel_vector_case_mix`: status `OK`, equivalent `1`, QoR `26642/18/479556`; method_signature `ex297|cyclic_2bit_selector_source_boundary|vector_case_block_for_pair_output_clusters|same cell/bit sources as current best; selector predicates grouped into one vector case|yosys_internal_abc_g_aig|official_evaluate|cell_pair_vector_case_outputs`; Verilog `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex297/verilog/ex297_r77_pairsel_vector_case_mix.v`; AIG `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex297/aigs/ex297_r77_pairsel_vector_case_mix.aig`; log `student/work/frontend_source_parallel_round77_20260613_1733/sub-unknown-source-r77/ex297/logs/ex297_r77_pairsel_vector_case_mix.evaluate.py.log`.
- Outcome: best r77 shard row `ex297_r77_pairsel_grouped_keep_helper` ADP `452251` vs current `425024`, frontend `425024`, reference `225900`. No target/reference improvement.
- Next action: continue only if a smaller nonlinear descriptor replaces the current residual body; more wrappers alone are unlikely to bridge the reference gap.

## 2026-06-14 unknown-large-r4 campaign ex204_ex299_frontend_continuation_20260614_1216

- Scope: frontend-only, Yosys Verilog-to-AIG plus official `evaluate.py`; no backend, seed, or registry edits.
- Families tried:
  - `ex297_r4_pairsel_d15`: current pairsel cell-bit low-delay replay, official OK `26635/16/426160`; no improvement versus campaign frontend target `425024`.
  - `ex297_r4_lowpair_midpair_mask_mix`: low-pair/mid-pair grouped output-mask donor mix with cross-output descriptor sharing, official OK `26629/16/426064`; no improvement.
- Outcome: no official improvement. Avoid repeating lowpair/midpair PO mask swaps on the same pairsel body; gains need a smaller shared cell descriptor.
