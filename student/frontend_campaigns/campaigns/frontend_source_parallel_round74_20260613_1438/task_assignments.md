# frontend_source_parallel_round74_20260613_1438 Task Assignments

All shard work is frontend/source-only. Do not run backend portfolios or standalone AIG optimization. Official equivalence/QoR claims require repo `evaluate.py`.

## sub-fp8-worst-hybrid-r74

Tool agent: `019ebfb5-d6ab-7860-88e0-035d4bb9c7bc` (`Ptolemy`)

Cases: `ex244`, `ex246`, `ex247`, `ex249`

Focus:
- Mine equivalent source candidates from case notes, frontend attempts, campaign CSVs, and run summaries.
- Build at most two hybrid source candidates per case by selecting output bits or fields from two structurally different equivalent sources, or by using one source for shared decode and another for selected output equations.
- Do not combine from AIGs or run backend remaps; use Verilog/source only.

## sub-fp8-mid-hybrid-r74

Tool agent: `019ebfb5-d79a-7d13-8e74-4ed6442160cf` (`Mill`)

Cases: `ex240`, `ex241`, `ex245`

Focus:
- `ex242` excluded at launch.
- Build source hybrids across known semantic/class/action/current-best-like sources: sign bit from one representation, magnitude high bits from another, selected low bits from a third only if source size remains bounded.
- Avoid prior caseattrs/outputsplit and numeric compare micro rewrites unless materially mixed with a different source family.

## sub-unknown-hybrid-r74

Tool agent: `019ebfb5-d8a1-7dc0-b4c9-20ff2afa13c3` (`Hubble`)

Cases: `ex285`, `ex288`, `ex297`, `ex299`

Focus:
- For `ex297`/`ex299`, mine r66/r71/r73 style equivalent sources and try cell/template hybrids that keep area close to the newest best. Respect latest registry targets: ex297 `425024`; ex299 `1777806`.
- For `ex285`/`ex288`, only emit hybrids if case notes show at least two compact equivalent sources; otherwise record blocked hypotheses rather than expanding residual covers.

## sub-fp16-int-hybrid-r74

Tool agent: `019ebfb5-da06-7383-bbc7-3c35e4d75e44` (`Pauli`)

Cases: `ex223`, `ex225`, `ex260`, `ex266`

Focus:
- For FP16, mix only small selected output fields from compact semantic sources; avoid full-word patch hybrids.
- For integer, try source-level hybrids of compact signed multiply/divide representations only if each source is equivalent and the combined Verilog remains simple.
- If a case has only worse bulky alternatives, record a blocked hypothesis instead of emitting a large hybrid.

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
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1438/agent_shards/<agent_id>/candidates.csv`
- `best_improvements.csv`
- `failed_hypotheses.csv`
- `simulation_results.csv`
- `evaluation_results.csv`
- `shared_structure_report.csv`
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1438/agent_summaries/<agent_id>.md`

Each per-case output must be scoped under:
- `student/work/frontend_source_parallel_round74_20260613_1438/<agent_id>/<case>/`
- `student/runs/<domain>/frontend_source_parallel_round74_20260613_1438/<agent_id>/<case>/`

Subagents must not edit `prompt_log.md`, global registry/state/manual/hypothesis CSVs, `student/results`, or seed bundles. Put proposed global updates in shard CSVs/summaries.
