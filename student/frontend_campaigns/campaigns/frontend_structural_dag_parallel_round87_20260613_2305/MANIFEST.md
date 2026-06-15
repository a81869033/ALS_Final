# frontend_structural_dag_parallel_round87_20260613_2305

Run ID: `frontend_structural_dag_parallel_round87_20260613_2305`

Purpose: frontend-only structural RTL and decision-graph search for cases whose
current/reference ADP ratio remains above `1.5`, excluding `ex286` and `ex287`.
This round follows the user's request to try decision graph and structural RTL
methods, but avoids repeating round86 single-bit truth roots and full-output
MTBDD word DAGs unchanged.

Inputs every worker must read:
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
- assigned `student/frontend_campaigns/case_index/exNNN.md`
- linked case notes, especially `frontend_attempts.md`
- `introduction.md`
- `ref/新錄音 20.txt`
- round84, round85, and round86 summaries/results for assigned cases

Rules:
- Frontend/source only. Do not run backend portfolio, backend remap, or
  post-AIG optimization.
- Official equivalence/QoR is repo `evaluate.py`; iverilog is debug only.
- Do not use old ex280-specific search scripts.
- Do not edit seed bundles or global registries from workers.
- Do not claim a candidate as successful unless official `evaluate.py` is
  equivalent and complete Verilog/AIG/log paths are recorded.

Representation focus:
- guarded semantic datapaths with shared exponent/mantissa/sign decode
- shared rounding, saturation, cancellation, sticky, and normalization
  predicates
- small-support decision graphs feeding multiple output bits
- hierarchical structural RTL over semantic fields
- BDD/cofactor module reuse where each cofactor is small enough to synthesize
- GF(2)/ANF predicate roots plus exact nonlinear residuals
- route/state descriptors for unknown cases
- threshold/compare networks for integer quotient and product structure

Best result:
- Merged subagent shards: `19` official/attempted candidate rows, `21`
  evaluation rows, `42` failed/blocker rows, `35` shared-structure rows,
  `0` missing paths, and `0` duplicate method signatures.
- Frontend best improvements: none.

Round87 outcome:
- Decision graph and structural RTL variants were exercised across FP8,
  unknown, FP16, and integer high-gap cases.
- All equivalent candidates were nonwinning versus the current frontend best.
- `ex240` had one non-equivalent add/cancellation candidate.
- `ex297` and `ex299` did not emit RTL because non-repeated cell/tiled
  screens were still too large to be useful.
- No backend portfolio, backend remap, or post-AIG optimization was run.

Next useful direction:
- Avoid replaying round87 guarded datapath, popcount-route, multiroot-log, and
  denominator-threshold families unchanged.
- Future work needs a materially different high-level description, not another
  direct structural wrapper: e.g. derive exact arithmetic formulas with smaller
  residual support, discover lower-dimensional unknown state variables, or
  split dense cases into provably compact semantic cofactors before Verilog.
