# frontend_radical_parallel_round83_20260613_2038

Run ID: `frontend_radical_parallel_round83_20260613_2038`

Purpose: narrow frontend-only radical search after r81/r82. This round only
targets current-ratio `>1.5` cases with the largest absolute payoff and avoids
families that were exact but nonwinning in r80-r82.

Rules:
- Frontend/source only. No backend portfolio, standalone ABC/remap, or post-AIG
  optimization.
- Official equivalence/QoR is repo `evaluate.py`.
- Do not update seed bundles.
- Shards must write isolated outputs under `run_id/agent_id/case`.

Merged result:
- 3 official `evaluate.py` equivalent candidates.
- 0 frontend-best improvements.
- 5 failed/blocker hypotheses recorded.
- 0 missing artifact paths and 0 duplicate method signatures.

Best result:
- No frontend best changed in this round. Current `>1.5` target list remains
  unchanged after index rebuild.
