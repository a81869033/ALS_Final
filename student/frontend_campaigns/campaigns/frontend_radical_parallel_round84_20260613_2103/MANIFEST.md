# frontend_radical_parallel_round84_20260613_2103

Run ID: `frontend_radical_parallel_round84_20260613_2103`

Purpose: frontend-only radical search for remaining non-ex286/ex287 cases with
current ADP ratio above 1.5. This round prioritizes large structural changes:
new high-level descriptions when needed, new shared intermediate structures,
and materially different Verilog representations rather than source-preserving
wire or case-order tweaks.

Inputs:
- `AGENTS.md`
- `student/docs/experiment_run_workflow.md`
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/search_state.csv`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/current_frontend_gap.csv`
- assigned `student/frontend_campaigns/case_index/exNNN.md`
- relevant case notes linked from each case index
- `introduction.md`
- `ref/新錄音 20.txt`

Rules:
- Frontend/source only. Do not run backend portfolio, backend remap, or
  post-AIG optimization.
- Official equivalence/QoR is repo `evaluate.py`; simulation is debug only.
- Do not use old ex280-specific search scripts.
- Do not update seed bundles.
- Do not repeat `do_not_repeat_as_is` or low-value method signatures unless the
  high-level description, representation, sharing strategy, or output grouping
  is materially different.
- Shards must write isolated outputs under `<run_id>/<agent_id>/<case>/`.

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/frontend_radical_parallel_round84_20260613_2103/`
- Work directory: `student/work/frontend_radical_parallel_round84_20260613_2103/`
- Run directories:
  - `student/runs/float_fp8/frontend_radical_parallel_round84_20260613_2103/`
  - `student/runs/unknown/frontend_radical_parallel_round84_20260613_2103/`
  - `student/runs/fp16/frontend_radical_parallel_round84_20260613_2103/`
  - `student/runs/integer/frontend_radical_parallel_round84_20260613_2103/`

Target cases:
- `float_fp8`: `ex247`, `ex246`, `ex244`, `ex249`, `ex241`, `ex240`, `ex245`
- `unknown`: `ex297`, `ex299`, `ex285`, `ex288`
- `fp16`: `ex225`, `ex223`
- `integer`: `ex260`, `ex266`

Merged result:
- 19 official `evaluate.py` equivalent candidates.
- 0 frontend-best improvements.
- 33 failed/blocker hypotheses recorded.
- 0 missing artifact paths and 0 duplicate method signatures.
- Bookkeeping appended 48 manual-judgment rows and 19 hypothesis-bank rows.

Best result:
- No frontend best changed in this round. The descriptor/table/cofactor families
  tried here are exact but too large or blocked before compact RTL.

Notes:
- `sub-fp8-structural-r84`: descriptor/cofactor word and nibble forms were
  exact for `ex244`, `ex246`, and `ex247`, but far worse than current frontend.
- `sub-fp8-wide-r84`: semantic and truth-BDD field forms were exact for
  `ex240`, `ex241`, `ex245`, and `ex249`, but nonwinning.
- `sub-unknown-descriptor-r84`: cyclic/state descriptors for `ex297` and
  `ex299` only became exact at full-ring table size.
- `sub-unknown-route-r84`: sorted-position descriptor for `ex285` was exact but
  nonwinning; `ex288` route descriptors stayed conflict-heavy.
- `sub-arith-fp16-r84`: integer word-cover and FP16 high-word grouping forms
  were exact but nonwinning.
