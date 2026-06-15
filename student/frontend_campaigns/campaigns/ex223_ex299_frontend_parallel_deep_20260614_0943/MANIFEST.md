# ex223_ex299_frontend_parallel_deep_20260614_0943

Run ID: `ex223_ex299_frontend_parallel_deep_20260614_0943`

Purpose: Parallel frontend-only search for high-gap cases, with priority on
`ex286` and `ex287`.  This campaign focuses on new high-level descriptions and
structural RTL representations, not backend AIG remapping.

Inputs:
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/search_state.csv`
- `student/frontend_campaigns/case_index/exNNN.md`
- `student/new_seeds/frontend_solution_catalog.csv`
- `introduction.md`
- `ref/新錄音 20.txt`

Output directories:
- Campaign: `student/frontend_campaigns/campaigns/ex223_ex299_frontend_parallel_deep_20260614_0943/`
- Agent shards: `student/frontend_campaigns/campaigns/ex223_ex299_frontend_parallel_deep_20260614_0943/agent_shards/<agent_id>/`
- Work: `student/work/ex223_ex299_frontend_parallel_deep_20260614_0943/<agent_id>/<case>/`
- Runs: `student/runs/<domain>/ex223_ex299_frontend_parallel_deep_20260614_0943/<agent_id>/<case>/`

Coordinator rules:
- Official success requires `evaluate.py` equivalent with area, delay, ADP,
  Verilog path, AIG path, and log path recorded.
- `iverilog` is debug-only.
- Do not use backend-remap AIGs as frontend current seeds.
- Do not overwrite other agents' outputs.
- Do not promote to `student/seeds` or `student/new_seeds`.
- Agents write shard CSVs only; coordinator merges root `results/*.csv`.

Final merge:
- Completed agents: 10.
- Root `results/evaluation_results.csv`: 160 rows, 157 official OK/equivalent rows.
- Root `results/candidates.csv`: 157 rows.
- Root `results/best_improvements.csv`: 19 improvement rows across 5 cases.
- Root `results/case_best_summary.csv`: per-case best summary for 31 attempted cases.
- Clean frontend best improvements:
  - `ex224`: 96224 -> 93072
  - `ex260`: 1131 -> 1104
  - `ex285`: 13175 -> 12800
  - `ex287`: 27390 -> 26880
  - `ex299`: 1777032 -> 1774260
- Scope audit: promoted candidates are source-level frontend RTL/Yosys-to-AIG plus
  official `evaluate.py`; no backend portfolio/remap result was promoted.
- Index rebuild: `python3 student/scripts/build_frontend_campaign_index.py`
  completed after adding backend-derived frontend-campaign filters.
