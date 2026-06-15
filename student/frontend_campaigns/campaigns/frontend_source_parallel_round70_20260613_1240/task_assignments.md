# frontend_source_parallel_round70_20260613_1240 Task Assignments

All shard work is frontend/source-only. Do not run backend portfolios or standalone AIG optimization. Official equivalence/QoR claims require repo `evaluate.py`.

## sub-fp8-worst-predicate-r70

Tool agent: `019ebf4a-e4ab-7690-a304-1b4196d149d6` (`Noether`)

Cases: `ex244`, `ex246`, `ex247`, `ex249`

Focus:
- Do not repeat r64-r69 classifier, codearith, formula, microcode, descriptor, direct cancellation, interval, copy-preserve, or explicit-sat/product-zero/lowpat/raw-exp signatures as-is.
- Try truth-mined shared predicates across output bits: common compare/gap/product/quotient classes, selected-output exact residuals, shared small BDD/cofactor nodes only where they reduce area, and hand-factored reusable boolean subfunctions.

## sub-fp8-mid-predicate-r70

Tool agent: `019ebf4a-e52d-7483-ad04-ea482a70b3a2` (`Plato`)

Cases: `ex240`, `ex241`, `ex242`, `ex245`

Focus:
- Do not repeat r67-r69 descriptor, output-cluster, formula, selected low-bit overlay, copy-preserve, or low4/mid4 residual cofactor rows as-is.
- Try truth-mined selected-output residuals over known field decode, shared guard/sticky/round predicates, and small common subfunction extraction across output bits.

## sub-unknown-predicate-r70

Tool agent: `019ebf4a-e610-7ed2-9aae-f1ea7fdf90b1` (`Faraday`)

Cases: `ex285`, `ex288`, `ex297`, `ex299`

Focus:
- Do not repeat local-rule/treefact/symcof/key-BDD replay, r66 cube-default as-is, r68 phase/selected-cell, or r69 copy/output-plane hybrid signatures as-is.
- Try compact selected-output residuals, partial state/routing descriptors, mixed symbolic/cube subfunctions, and small cofactor subfunctions shared across outputs.

## sub-fp16-int-predicate-r70

Tool agent: `019ebf4a-e700-7af2-9506-eb165cc23146` (`Godel`)

Cases: `ex223`, `ex225`, `ex260`, `ex266`

Focus:
- Do not repeat low13/low14/low11 nested/sparse/compact-special FP16 rows, Baugh-Wooley carry-select, signed weighted rows, cofactor-wordmux, one-hot quotient interval, case-constant, or const-divisor signatures as-is.
- Try selected mantissa/exponent residuals over current FP16 source, shared special-case predicates, exact small partial-product subfunctions, and quotient predicates that share compare/subtract terms.

## Required Inputs Before Code

Every worker must read:
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
- assigned `student/frontend_campaigns/case_index/exNNN.md`
- relevant case notes under `student/cases/`

## Shard Deliverables

Each shard must write:
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round70_20260613_1240/agent_shards/<agent_id>/candidates.csv`
- `best_improvements.csv`
- `failed_hypotheses.csv`
- `simulation_results.csv`
- `evaluation_results.csv`
- `shared_structure_report.csv`
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round70_20260613_1240/agent_summaries/<agent_id>.md`

Each per-case output must be scoped under:
- `student/work/frontend_source_parallel_round70_20260613_1240/<agent_id>/<case>/`
- `student/runs/<domain>/frontend_source_parallel_round70_20260613_1240/<agent_id>/<case>/`

Subagents must not edit `prompt_log.md`, global registry/state/manual/hypothesis CSVs, or seed bundles. Put proposed global updates in shard CSVs/summaries.
