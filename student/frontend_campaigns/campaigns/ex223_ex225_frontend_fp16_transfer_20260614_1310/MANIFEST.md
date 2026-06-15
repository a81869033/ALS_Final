# ex223_ex225_frontend_fp16_transfer_20260614_1310

Run ID: `ex223_ex225_frontend_fp16_transfer_20260614_1310`

Purpose: transfer the successful FP16 frontend structures from `fp16-extra-r2` to the remaining high-gap FP16 log-family cases. This round tests active sign/exp shells, nested low mantissa LUTs, and mantissa-high word-mode defaults on `ex223`, `ex224`, and `ex225`.

Frontend-only boundary:
- Allowed: truth-derived Verilog/RTL generation, Yosys frontend synthesis from Verilog to AIG, official `evaluate.py`.
- Disallowed: backend portfolio/remap/postpareto, optimizing an existing AIG as input, and promoting backend-derived AIGs.

Inputs:
- `benchmarks/ex223.truth`
- `benchmarks/ex224.truth`
- `benchmarks/ex225.truth`
- `student/frontend_campaigns/frontend_best_registry.csv`
- Prior transfer source: `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp16-extra-r2/ex221/scripts/run_fp16_extra_r2.py`

Artifacts:
- Work: `student/work/ex223_ex225_frontend_fp16_transfer_20260614_1310/fp16-transfer-r1/`
- Runs: `student/runs/fp16/ex223_ex225_frontend_fp16_transfer_20260614_1310/fp16-transfer-r1/`
- Shard CSVs: `student/frontend_campaigns/campaigns/ex223_ex225_frontend_fp16_transfer_20260614_1310/agent_shards/fp16-transfer-r1/`

