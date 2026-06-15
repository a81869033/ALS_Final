# Task Assignments

Run: `frontend_gt15_bf16_unknown_round95_20260614_0627`

| agent_id | cases | focus | status |
| --- | --- | --- | --- |
| `sub-bf16-log-tight-r95` (`019ec31b-21e7-7171-852e-60640d3ab5dc`) | ex204, ex205 | tiny-gap BF16 log2/log10; lower delay and area without replaying hilos/default-expression failures | running |
| `sub-bf16-power-tight-r95` (`019ec31b-4b9a-7be3-9b81-186eac9f54f8`) | ex214, ex216, ex218, ex219 | reciprocal-square/cube/root family; reach <1.5x using new field-level or selected low-delay structures | running |
| `sub-unknown286-r95` (`019ec31b-79de-7bc2-83fe-b6466565770b`) | ex286 | non-symcof/non-selected-output-BDD hidden routing/state hypothesis for reference-scale improvement | running |
| `sub-unknown287-r95` (`019ec31b-ad52-7790-9d4e-aa7fe7f89c39`) | ex287 | non-symcof/non-selected-output-BDD hidden routing/state hypothesis for reference-scale improvement | running |

Merge expectations:
- Shard CSVs live directly in `agent_shards/<agent_id>/`.
- Only official `evaluate.py` OK rows go in `candidates.csv` and
  `evaluation_results.csv`.
- Blocked/non-equivalent/table-sized/replay-risk methods go in
  `failed_hypotheses.csv`.
