# ex200_ex299_frontend_parallel_shared_20260612_1422

Run ID: `ex200_ex299_frontend_parallel_shared_20260612_1422`

Purpose: Parallel frontend seed search for high-gap cases in `student/frontend_campaigns/GOAL.md`, targeting lower ADP than the current frontend registry and, where possible, `reference_result.csv`.

Inputs:
- Truth files: `benchmarks/exNNN.truth`
- Campaign spec: `student/frontend_campaigns/GOAL.md`
- Progress index: `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- Current best registry: `student/frontend_campaigns/frontend_best_registry.csv`
- Gap table: `student/frontend_campaigns/current_frontend_gap.csv`
- Search state: `student/frontend_campaigns/search_state.csv`
- Case indexes: `student/frontend_campaigns/case_index/exNNN.md`

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_parallel_shared_20260612_1422/`
- Work directory: `student/work/ex200_ex299_frontend_parallel_shared_20260612_1422/<agent_id>/<case>/`
- Run registry: `student/runs/<domain>/ex200_ex299_frontend_parallel_shared_20260612_1422/<agent_id>/<case>/`
- Merged candidates CSV: `results/candidates.csv`
- Evaluation CSV: `results/evaluation_results.csv`
- Failed hypotheses CSV: `results/failed_hypotheses.csv`

Methods tried:
- BF16 current-seed synth-flow and source-level semantic/structural variants.
- FP16 log/log2/log10 nested mantissa split and high-bit run-tree variants.
- FP16/BF16-to-FP8 source-form synth-flow probes and known semantic variants.
- Integer replay/post-synthesis variants over existing shared arithmetic structures.
- Unknown GF(2)/ANF, mux-coordinate, bucket, symmetry/cofactor, descriptor, and cell-family variants.

Best result:
- Accepted frontend-best improvements are listed in `results/best_improvements.csv`.
- Improved cases: `ex200`, `ex204`, `ex205`, `ex223`, `ex224`, `ex225`, `ex256`, `ex270`.
- No accepted frontend seed beat `reference_result.csv`.

Notes:
- Coordinator owns merged campaign files and shared registry updates.
- Subagents own only `agent_shards/<agent_id>/`, `agent_summaries/<agent_id>.md`, and their scoped `student/work` / `student/runs` paths.
- Official success requires `evaluate.py` equivalence, area, delay, ADP, existing Verilog/AIG paths, and log evidence.
- Merged candidate rows were deduplicated by case and `method_signature`; removed rows are recorded in `results/deduped_candidate_rows.csv`.
- Per-case coordinator outcome report: `COORDINATOR_REPORT.md` and `results/case_outcomes.csv`.
