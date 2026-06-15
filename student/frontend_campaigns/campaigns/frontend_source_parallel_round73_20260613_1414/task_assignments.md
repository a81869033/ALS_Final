# frontend_source_parallel_round73_20260613_1414 Task Assignments

All shard work is frontend/source-only. Do not run backend portfolios or standalone AIG optimization. Official equivalence/QoR claims require repo `evaluate.py`.

## sub-fp8-worst-classes-r73

Tool agent: `019ebfa0-9005-7932-b70c-d05d022f8843` (`Pascal`)

Cases: `ex244`, `ex246`, `ex247`, `ex249`

Focus:
- Do not repeat r64-r72 low-value directions.
- Try a materially different FP8 high-level representation: compact class/action split, one shared action encoder plus tiny output decode, or table-free arithmetic class predicates.
- Keep source bounded: no full residual/keycase tables, no broad bit-predicate expansions. Prefer a small number of shared class wires reused by every output bit.

## sub-fp8-mid-classes-r73

Tool agent: `019ebfa0-91de-7192-a3e2-4a0cbc5e68be` (`Descartes`)

Cases: `ex240`, `ex241`, `ex245`

Focus:
- `ex242` excluded at launch.
- Try compact class/action source for add/multiply variants: shared operand classification, sign/magnitude action id, and small action-to-output decode.
- Avoid caseattrs/outputsplit/numeric compare micro rewrites as-is.

## sub-unknown-state-r73

Tool agent: `019ebfa0-9387-77f0-9bbe-9af6c907ab26` (`Kant`)

Cases: `ex285`, `ex288`, `ex297`, `ex299`

Focus:
- For `ex285`/`ex288`, try alternate high-level routing/state descriptors that are not onehot-boundary/cube residual/keyBDD replay: compact state code plus small output decoder, or shared popcount/position predicates if notes support them.
- For `ex297`/`ex299`, try selector-state variants materially different from r71/r72: paired selector classes, multi-output cell templates, or cell-local default inversion, bounded source-only.

## sub-fp16-int-semantic-r73

Tool agent: `019ebfa0-9493-7b11-a828-e8e2eef4de22` (`Curie`)

Cases: `ex223`, `ex225`, `ex260`, `ex266`

Focus:
- For `ex223`/`ex225`, try a semantic FP16 source variant that changes high-level output decomposition: special class shell plus compact selected mantissa/exponent action decode, not wordpatch/nested low replay.
- For `ex260`, try small signed multiply source variants that are not Baugh-Wooley, Booth, weighted rows, or low-column formula replay.
- For `ex266`, try bounded quotient action/decode variants, not wordmux/onehot interval/top compare/binary threshold as-is.

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
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round73_20260613_1414/agent_shards/<agent_id>/candidates.csv`
- `best_improvements.csv`
- `failed_hypotheses.csv`
- `simulation_results.csv`
- `evaluation_results.csv`
- `shared_structure_report.csv`
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round73_20260613_1414/agent_summaries/<agent_id>.md`

Each per-case output must be scoped under:
- `student/work/frontend_source_parallel_round73_20260613_1414/<agent_id>/<case>/`
- `student/runs/<domain>/frontend_source_parallel_round73_20260613_1414/<agent_id>/<case>/`

Subagents must not edit `prompt_log.md`, global registry/state/manual/hypothesis CSVs, `student/results`, or seed bundles. Put proposed global updates in shard CSVs/summaries.
