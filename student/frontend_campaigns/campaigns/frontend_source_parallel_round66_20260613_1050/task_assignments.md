# Round66 Task Assignments

Global constraints:
- Frontend/source-only only.
- Read current best Verilog, not current best AIG, as the source of structural hints.
- Do not run backend portfolios.
- Do not run standalone ABC/AIG remap/post-processing. ABC may appear only inside Yosys RTL synthesis and official `evaluate.py`.
- Do not update `prompt_log.md` or coordinator-owned registry/state/manual/hypothesis CSVs.
- Use disjoint outputs under `student/work/frontend_source_parallel_round66_20260613_1050/<agent_id>/<case>/`, `student/runs/<domain>/frontend_source_parallel_round66_20260613_1050/<agent_id>/<case>/`, and `student/frontend_campaigns/campaigns/frontend_source_parallel_round66_20260613_1050/agent_shards/<agent_id>/`.

Required reads:
- `AGENTS.md`
- `student/docs/experiment_run_workflow.md`
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/search_state.csv`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/current_frontend_gap.csv`
- `student/frontend_campaigns/method_judgments.csv`
- `student/frontend_campaigns/manual_judgments.csv`
- `student/frontend_campaigns/hypothesis_bank.csv`
- `introduction.md`
- `ref/新錄音 20.txt`
- Assigned case indexes and notes
- Round64/Round65 summaries for assigned cases

## sub-fp8-hypot-currentfact-r66

Agent: `019ebee4-49a9-74c3-b0ee-eabda68aaa8b` (`Bernoulli`)

Cases: `ex244`, `ex249`

Direction:
- Start from current best Verilog:
  - `ex244`: `student/work/ex240_ex244_frontend_fp8_magbdd_deltaeff_20260608_1401/ex244/verilog/ex244_semantic_hypot_delta_maxeff_bdd_expfirst.v`
  - `ex249`: `student/work/ex249_frontend_fp8_e5m2_hypot_rawexp_20260608_1712/ex249/verilog/ex249_semantic_hypot_threshold_rawexp.v`
- Factor exact source predicates, not new table/classifier families.
- Try variants such as explicit common subexpression wires, branch ordering changes, selected-output splitting, and reduced mux priority around current-best rawexp/maxeff paths.
- Avoid r65 cube/classifier and r64 ratio/sqmin/siggap families unchanged.

## sub-fp8-muldiv-currentfact-r66

Agent: `019ebee4-8af7-7612-ba7d-9456d662dbe6` (`Gauss`)

Cases: `ex246`, `ex247`

Direction:
- Start from current best Verilog:
  - `ex246`: `student/work/ex246_frontend_fp8_e5m2_dc_neighbor12_20260608_2000/ex246/verilog/ex246_semantic_mul_product_dc_seed12_set11to10.v`
  - `ex247`: `student/work/ex200_ex299_frontend_refgap_round8_20260612_1826/fp8-r8/ex247/verilog/ex247_round5_bound_region_mux.v`
- Factor current product/quotient source around common decode, local tables, and selected boundary predicates.
- Avoid r65 codearith/microcode, r64 zone lattice, r62 smallpat, and seed replay unchanged. A material change must be a source-level structure/factoring change.

## sub-unk285-treefact-r66

Agent: `019ebee4-d177-74e0-a0e4-bc9e0fa73d03` (`Dewey`)

Cases: `ex285`

Direction:
- Start from current best decision-tree Verilog: `student/work/reverse_unknown_20260603_1812/ex285/verilog/ex285_unknown_12x12_decision_tree_greedy.v`.
- Factor the tree source using exact swap symmetry `(4,5)` and `(6,7)`, layer predicates, and repeated output-value subtrees.
- Avoid new table/local-rule/BDD screens unless they directly factor the current tree source.

## sub-unklarge-currentfact-r66

Agent: `019ebee5-1c05-7011-b7e0-18f53512560c` (`Schrodinger`)

Cases: `ex297`, `ex299`

Direction:
- Start from current best symbol-plane majority Verilog:
  - `ex297`: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/unknown-large-r24/ex297/verilog/ex297_r24_cell_grouped_symbol_plane_majority_default.v`
  - `ex299`: `student/work/ex200_ex299_frontend_refgap_round24_20260613_0435/unknown-large-r24/ex299/verilog/ex299_r24_cell_grouped_symbol_plane_majority_default.v`
- Factor the source around cell-group common logic, symbol-plane majority defaults, output grouping, and repeated cell predicates.
- Avoid r65 descriptor/prefix/local-rule tables and r64 recurrence-state table screens unchanged.
