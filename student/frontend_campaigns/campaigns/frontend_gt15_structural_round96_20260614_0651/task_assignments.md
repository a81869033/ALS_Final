# Task Assignments

Run: `frontend_gt15_structural_round96_20260614_0651`

| agent_id | cases | focus | status |
| --- | --- | --- | --- |
| `sub-bf16-smallgap-flow-r96` (`019ec333-7f22-7ed2-9bda-e5ed5167d826`) | ex205, ex214 | source-level RTL and frontend synthesis-flow recuts for tiny gaps | completed; ex214 improved |
| `sub-bf16-field2-r96` (`019ec333-7fa0-7351-8135-596c7317d882`) | ex204, ex216, ex218, ex219 | new BF16 field descriptors, selected predicates, and shared shells | completed; no frontend improvement |
| `sub-unknown286-state-r96` (`019ec333-811c-7d12-b9f4-867f327f7633`) | ex286 | whole-word state/routing descriptors and compact decision graph search | completed; blocker evidence |
| `sub-unknown287-state-r96` (`019ec333-8266-7961-b4e2-41049e319955`) | ex287 | whole-word state/routing descriptors and compact decision graph search | completed; blocker evidence |

Merge expectations:
- Shard CSVs live directly in `agent_shards/<agent_id>/`.
- Only official `evaluate.py` OK rows go in `candidates.csv` and
  `evaluation_results.csv`.
- Non-equivalent, table-sized, blocked, or replay-risk methods go in
  `failed_hypotheses.csv`.
- Real paths must exist for every non-placeholder Verilog/AIG/log/evidence
  field.
