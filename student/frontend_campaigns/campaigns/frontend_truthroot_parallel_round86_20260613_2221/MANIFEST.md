# frontend_truthroot_parallel_round86_20260613_2221

Run ID: `frontend_truthroot_parallel_round86_20260613_2221`

Purpose: frontend-only truth-root mining after rounds 84 and 85 produced many
exact but nonwinning candidates. This round stops replaying whole-word
descriptor tables, source wrappers, and output-graft hybrids. Each shard should
mine the assigned truth functions for compact shared roots across expensive
output bits, then emit a materially new Verilog representation only if the root
structure is plausibly smaller.

Inputs:
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
- linked case notes and round84/round85 summaries
- `introduction.md`
- `ref/新錄音 20.txt`

Rules:
- Frontend/source only. Do not run backend portfolio, backend remap, or
  post-AIG optimization.
- Official equivalence/QoR is repo `evaluate.py`.
- Do not use old ex280-specific search scripts.
- Do not edit seed bundles or global registries from a worker.
- Do not record best improvement unless official `evaluate.py` is equivalent
  and ADP beats prior frontend best.

Representation focus:
- shared small-support roots mined from truth partitions
- ANF/GF(2) root banks plus low-cost nonlinear residuals
- per-output BDD/cofactor roots only for selected expensive bits
- arithmetic predicate roots with exact residual bits
- generated Verilog that exposes the shared roots explicitly

Best result:
- Merged subagent shards: `27` official candidates, `37` failed/blocker rows,
  `34` shared-structure rows, `0` missing paths, and `0` duplicate method
  signatures.
- Frontend best improvement: `ex223_r86_truthroot_bit11_abc_g_aig`
  (`10705/19/203395`) improved the ex223 frontend best from `203490` to
  `203395`.
- Current overall ex223 best remains lower at `189468`, so the current-best
  reference ratio did not change.

Decision graph / structural RTL outcome:
- Structural/decision-DAG attempts were run for FP8 add/mul, unknown, FP16,
  and integer assigned cases.
- They produced exact candidates, but no large ADP breakthrough; the only
  merged frontend-best improvement was the small ex223 truth-root boundary
  candidate above.
- Future rounds should avoid repeating whole-output MTBDD decision DAGs,
  single-bit truth roots, and direct structural source wrappers unchanged.
  More promising next attempts need a different high-level description or a
  multi-output structure that shares dense predicates without materializing a
  large residual table.
