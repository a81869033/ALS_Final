# frontend_radical_parallel_round82_20260613_2022

Run ID: `frontend_radical_parallel_round82_20260613_2022`

Purpose: continue frontend-only radical search after round81. Focus only on
current-ratio `>1.5` cases and avoid round81 families that were exact but far
larger.

Rules:
- Frontend/source only. No backend portfolio, standalone ABC/remap, or post-AIG
  optimization.
- Official equivalence/QoR is repo `evaluate.py`.
- Do not update seed bundles.
- Every shard must write isolated outputs under `run_id/agent_id/case`.

Best result:
- No frontend-best improvement. Three official `evaluate.py` equivalent rows
  were recorded and all were nonwinning:
  `ex247_r82_frontend_best_anchor` = `317/23/7291`,
  `ex260_r82_signed_digit_accum_abc_g_aig` = `106/17/1802`,
  `ex225_log_nested_low12_hi4_abc_g_aig` = `11278/20/225560`.

Merged results:
- `candidates.csv`: 3 rows
- `best_improvements.csv`: 0 rows
- `failed_hypotheses.csv`: 10 rows
- `simulation_results.csv`: 7 rows
- `evaluation_results.csv`: 3 rows
- `shared_structure_report.csv`: 7 rows
- merge sanity: 0 missing paths, 0 duplicate method signatures
