# frontend_source_parallel_round71_20260613_1312 Task Assignments

All shard work is frontend/source-only. Do not run backend portfolios or standalone AIG optimization. Official equivalence/QoR claims require repo `evaluate.py`.

## sub-fp8-worst-local-r71

Tool agent: `019ebf69-83ca-7e40-b599-a7a2b59ea36f` (`Averroes`)

Cases: `ex244`, `ex246`, `ex247`, `ex249`

Focus:
- Avoid r64-r70 classifier, codearith, formula, microcode, descriptor, direct cancellation, interval, copy-preserve, explicit-sat/product-zero/lowpat/raw-exp, and r70 keycase/bit-predicate residual signatures as-is.
- Use the current best source as a baseline, then replace only a small selected cone or output group when the replacement is structurally simpler.
- Try hand-mined low-delay predicates for saturation/normalization, shared one-hot field decodes, small exact mux decompositions, and arithmetic identities that reduce fanout without adding full residual tables.

## sub-fp8-mid-local-r71

Tool agent: `019ebf69-8675-7c83-b8eb-9d6f0225d320` (`Nietzsche`)

Cases: `ex240`, `ex241`, `ex242`, `ex245`

Focus:
- Avoid r67-r70 descriptor, output-cluster, formula, selected low-bit overlay, copy-preserve, low4/mid4 cofactor, selected residual sorted fields, product-class split, denominator-major residual, and gap-round split signatures as-is.
- Use current best source plus small exact source-level replacements: local selected cone extraction, shared guard/sticky/round predicate factoring, sign/exponent decode fanout reduction, and output grouping that keeps area close to current.

## sub-unknown-local-r71

Tool agent: `019ebf69-875e-79e0-aa46-b4ef820a5e6d` (`Mencius`)

Cases: `ex285`, `ex288`, `ex297`, `ex299`

Focus:
- Avoid local-rule/treefact/symcof/key-BDD replay, r66 cube-default as-is, r68 phase/selected-cell, r69 copy/output-plane hybrid, r70 pair/tripair/parity/mod3/cube-residual, bitmix, and shared-cmp refactor signatures as-is.
- Use current best source plus small exact replacements: lane/cell local source factoring, selector factoring that reduces duplicated comparisons, tiny cofactor caches only where source size remains bounded, and output grouping that exploits repeated cells without large residual cube covers.

## sub-fp16-int-local-r71

Tool agent: `019ebf69-88ed-76a0-9aa9-fe3dbbbb7286` (`Bacon`)

Cases: `ex223`, `ex225`, `ex260`, `ex266`

Focus:
- Avoid low13/low14/low11 nested/sparse/compact-special FP16 rows, Baugh-Wooley carry-select, signed weighted rows, cofactor-wordmux, one-hot quotient interval, case-constant, const-divisor, r70 wordpatch/highpred, Booth, abs-quadrant, subtract-prefix, and binary-threshold signatures as-is.
- Use current best source plus exact local replacement: selected mantissa/exponent cone rewrites, shared special-case predicates with no full-word patch, low-depth carry/share variants for ex260, and quotient compare/subtract sharing for ex266 with bounded source.

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
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round71_20260613_1312/agent_shards/<agent_id>/candidates.csv`
- `best_improvements.csv`
- `failed_hypotheses.csv`
- `simulation_results.csv`
- `evaluation_results.csv`
- `shared_structure_report.csv`
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round71_20260613_1312/agent_summaries/<agent_id>.md`

Each per-case output must be scoped under:
- `student/work/frontend_source_parallel_round71_20260613_1312/<agent_id>/<case>/`
- `student/runs/<domain>/frontend_source_parallel_round71_20260613_1312/<agent_id>/<case>/`

Subagents must not edit `prompt_log.md`, global registry/state/manual/hypothesis CSVs, `student/results`, or seed bundles. Put proposed global updates in shard CSVs/summaries.
