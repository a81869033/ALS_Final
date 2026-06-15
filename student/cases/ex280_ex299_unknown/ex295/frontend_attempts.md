# ex295 Frontend Attempts

## Current Best

- Current best frontend: `ex295_low_split_default_abc_g_aig`, area `8653`, delay `16`, ADP `138448`.
- Reference: ADP `68064`.
- Gap: `2.03x` reference ADP.

## Already Tried

- Tried generic unknown variants: `value_case`, `expr_default_exception`, `high_split_default`, `low_split_default`, `decision_tree_greedy`; rotation variants were not in top tracked candidates for this case.
- Top results: `low_split_default:156456`; `high_split_default:156474`; `decision_tree_greedy:186922`; `value_case:192654`; `expr_default_exception:224595`.
- Algebraic/ANF/Davio/support-LUT candidates exist under `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/ex295`, but they are not the current tracked best.
- 2026-06-08 rot2 canonical-min RTL: exact and official `evaluate.py` OK, but `3517/85/298945`, worse than current due excessive comparator/table delay.
- 2026-06-08 diagnostic-selected shared-BDD order `5:6:4:7:3:8:2:9:1:10:0:11`: exact and official `evaluate.py` OK, but `9186/21/192906`, worse than current.
- 2026-06-08 rotation representative-bit BDD: exact and official `evaluate.py` OK, but `9792/20/195840`, worse than current due duplicated representative logic.
- 2026-06-08 current structural synthflow run: official `evaluate.py` OK for all variants; `abc_g_aig` improved to `8653/16/138448`.
- 2026-06-08 pair-ring local-rule diagnostic: no AIG emitted. Treating the word as 6 two-bit cells, output cell 0 depends on all cells; radius 0/1/2 local rules failed, and radius 3 is exact only because it covers the full ring.
- 2026-06-09 rotation representative-bit BDD interleave/center replay: official `evaluate.py` OK; best was `11112/19/211128`, still worse than current.

## Do Not Repeat Blindly

- High/low split are nearly tied; choosing the other split direction alone is not a meaningful new attempt.
- Need semantic grouping or a better class predicate for the split.
- Do not repeat dynamic canonical-min under even rotations; if using rotation equivariance, avoid a long min-comparator path.
- Do not repeat the center shared-BDD order unless paired with a source rewrite or new synthflow reason.
- Do not repeat natural-order representative-bit BDD reconstruction; future rotation work needs pair-ring/local predicates.
- Do not repeat interleave/center representative-bit BDD reconstruction; exact but still duplicates too much logic.
- Do not pursue a simple small-radius 2-bit pair-ring local rule; support spans the full ring.

## 2026-06-12 Round10 unknown-state-r10

- method_signature: `ex295|state/cell interleaved selector exact split|symbol_plane_default_exception|shared selector decoders|abc_g_aig|official_truth_exact_partition|all_outputs_grouped`
- official result: `evaluate.py OK`, area `8257`, delay `15`, ADP `123855`.
- paths:
  - Verilog: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-state-r10/ex295/verilog/ex295_r10_symbol_plane_split_abc_g_aig.v`
  - AIG: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-state-r10/ex295/aigs/ex295_r10_symbol_plane_split_abc_g_aig.aig`
  - official log: `student/work/ex200_ex299_frontend_refgap_round10_20260612_1911/unknown-state-r10/ex295/logs/ex295_r10_symbol_plane_split_abc_g_aig.evaluate.log`
- outcome: New frontend best. It improves the previous frontend `138448` and current overall/backend `125685`, but remains above reference `68064`.
- next action: Continue from the symbol-plane split only with a lower-delay/lower-area recurrence or descriptor; do not replay the same split wrapper unchanged.

- method_signature: `ex295|state/cell descriptor shared BDD|cell_outside_in_mux_tree|single shared BDD node pool|abc_g_aig|official_truth_exact_bdd|all_outputs_grouped`
- official result: `evaluate.py OK`, area `8914`, delay `19`, ADP `169366`.
- outcome: Equivalent but worse than the new frontend best; record as low-value for this exact BDD order/source form.

## Sources

- `student/results/unknown_candidates_current_summary.csv`
- `student/results/unknown_candidates_current_best.csv`

## 2026-06-12 Round18 unknown-state-r18

- method_signature: `ex295|cyclic_2bit_symbol_transition_recurrence|low_depth_symbol_plane_and_transition_predicate_smoke|shared_next_state_predicates|no_synth|abc_xf_truth_diagnostic|cell_outputs`
- outcome: `BLOCKED_NO_CANDIDATE`; no Verilog/AIG emitted and no official candidate claimed.
- diagnostic evidence: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/unknown-state-r18/ex295/notes/ex295_r18_recurrence_blocker.md`
- machine evidence: `student/work/ex200_ex299_frontend_refgap_round18_20260612_2321/unknown-state-r18/ex295/notes/ex295_r18_recurrence_blocker.json`
- findings: full-truth low-depth local symbol-plane tests kept conflicting buckets; zero-conflict radius-2 predicate keys required 4096 contexts, equal to the full truth-row count, so this is a full descriptor/table-equivalent form rather than a compact recurrence.
- next action: continue only with a genuinely new nonlocal state basis or a compact source-level recurrence; do not replay round10 symbol-plane split, round16 descriptor-key/cell-pair BDD, or larger BDD pools.

## 2026-06-13 unknown-large-r26 cell-prefix descriptor/residual probes

- campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/`
- agent/shard: `unknown-large-r26`.
- methods:
  - `cell_prefix_bridge` grouped by cell pairs.
  - `cell_prefix_bridge + rotl2 residual` grouped by cell pairs.
  - `cell_prefix_bridge` grouped by output bit modulo 4.
- official `evaluate.py` rows: 3/3 equivalent.
- best r26 result: `ex295_r26_cellprefix_mod4_descriptor_mod4_output_planes_abc_g_aig`, `9977/23/229471`.
- current frontend remains `123270`; reference remains `68064`.
- outcome: no frontend improvement. The transformed cell-prefix key loses the low-delay advantage of the current symbol-plane split.
