# frontend_source_parallel_round62_20260613_0907

Run ID: `frontend_source_parallel_round62_20260613_0907`

Purpose: continue frontend-only/source-only search on remaining frontend ratio > 2 cases after round60/61 nonwinning results.

Inputs:
- Required docs: `AGENTS.md`, `student/docs/experiment_run_workflow.md`, `student/frontend_campaigns/GOAL.md`, `student/frontend_campaigns/FRONTEND_PROGRESS.md`, `introduction.md`.
- New reference clue: `ref/新錄音 20.txt`.
- Case state: `student/frontend_campaigns/search_state.csv`, `student/frontend_campaigns/frontend_best_registry.csv`, `student/frontend_campaigns/current_frontend_gap.csv`, `student/frontend_campaigns/manual_judgments.csv`, `student/frontend_campaigns/hypothesis_bank.csv`, assigned `case_index/exNNN.md`, and relevant case notes.

Scope:
- Frontend/source-only. Yosys RTL synthesis is allowed; repo `evaluate.py` is the only official equivalence/QoR authority.
- No backend portfolio.
- No standalone AIG remap/post-processing on existing or generated AIGs.
- No old ex280-specific search script.
- Do not edit global registry/search/manual CSVs; write shard outputs only.

Recording-guided strategy:
- Treat high-level text descriptions as first-class hypotheses before RTL.
- Generate mixed source structures between low-depth LUT/source and low-area shared RTL/source.
- Convert post-opt ideas from the recording only into Verilog/source structure ideas, not backend execution.

Expected shard outputs:
- `agent_shards/<agent_id>/candidates.csv`
- `agent_shards/<agent_id>/best_improvements.csv`
- `agent_shards/<agent_id>/failed_hypotheses.csv`
- `agent_shards/<agent_id>/simulation_results.csv`
- `agent_shards/<agent_id>/evaluation_results.csv`
- `agent_shards/<agent_id>/shared_structure_report.csv`
- `agent_summaries/<agent_id>.md`

Coordinator will merge shard outputs, verify official-equivalent candidate paths, update global notes if needed, and rebuild `student/scripts/build_frontend_campaign_index.py`.

Merged results:
- `results/candidates.csv`: 59 rows.
- `results/evaluation_results.csv`: 62 rows, including 59 official equivalent rows and 3 blocked/synthesis-failed rows.
- `results/best_improvements.csv`: header-only; this campaign produced no frontend-best improvement.
- Best official rows:
  - `ex240`: `ex240_ex240_r62_branch_pack_function_split_norm_synth_preset_raw` `582/46/26772`, ties current frontend best.
  - `ex244`: `ex244_ex244_r62_delta_bit_sat_shared_synth_preset_raw` `311/32/9952`.
  - `ex249`: `ex249_ex249_r62_outbit_grouped_rawexp_abc_g_aig_raw` `172/28/4816`.
  - `ex246`: `ex246_r62_product_class_smallpat_semantic_synth_preset_aig` `371/24/8904`.
  - `ex247`: `ex247_r62_qclass_smallpat_nested_den_synth_preset_aig` `309/30/9270`.
  - `ex285`: `ex285_r62_output_value_cube_cover_abc_g_aig` `2953/18/53154`.
- `ex297`/`ex299`: no official equivalent candidate. `ex297` had useful source diagnostic shrink (`3808` residual exceptions vs `67305`) but the emitted source timed out in Yosys and produced no AIG; `ex299` shrank to `30640` vs `302600` but source size was too large to emit safely.
