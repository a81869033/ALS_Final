# Task Assignments

Run: `frontend_gt15_deepstruct_round97_20260614_0724`

| agent_id | cases | focus | status |
| --- | --- | --- | --- |
| `sub-bf16-logmodel-r97` (`019ec351-1d3a-73f2-a0be-fbb9d98abc6e`) | ex204, ex205 | log2/log10 high-level model repair and shared correction RTL | completed; ex205 improved |
| `sub-bf16-rootpower-r97` (`019ec351-1e24-7652-a19c-af49e01700b0`) | ex216, ex218, ex219 | cube/reciprocal-cube/cbrt field formulas and selected predicates | completed; no frontend improvement |
| `sub-unknown286-dg-r97` (`019ec351-1f88-7d12-ba41-ffe736220bb8`) | ex286 | compact decision-graph/state descriptor search | completed; blocker evidence |
| `sub-unknown287-dg-r97` (`019ec351-21e8-7671-9c2e-91c3d261fe7a`) | ex287 | compact decision-graph/state descriptor search | completed; blocker evidence |

Merge expectations:
- Shard CSVs live directly in `agent_shards/<agent_id>/`.
- Only official `evaluate.py` OK rows go in `candidates.csv` and
  `evaluation_results.csv`.
- Non-equivalent, table-sized, blocked, or replay-risk methods go in
  `failed_hypotheses.csv`.
- Each shard must write a high-level dossier/evidence file in its work tree.
- Real paths must exist for every non-placeholder Verilog/AIG/log/evidence
  field.
