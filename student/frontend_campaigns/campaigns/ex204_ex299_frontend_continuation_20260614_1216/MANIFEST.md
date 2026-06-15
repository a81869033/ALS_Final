# ex204_ex299_frontend_continuation_20260614_1216

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`

Purpose: continue frontend-only search on the current worst frontend/reference gaps. The round emphasizes new high-level descriptions, decision/split graph RTL, shared field/predicate logic, and structurally diverse Verilog representations.

Inputs:
- Truth files: `benchmarks/exNNN.truth`
- Current frontend registry: `student/frontend_campaigns/frontend_best_registry.csv`
- Reference baseline: `reference_result.csv`
- Method constraints: `student/frontend_campaigns/GOAL.md`, `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- Senior notes: `introduction.md`, `ref/新錄音 20.txt`, `ref/IWLS26_presentation.pdf`

Artifacts:
- Work directory: `student/work/ex204_ex299_frontend_continuation_20260614_1216/`
- Campaign directory: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/`
- Results: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/results/`
- Agent shards: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/`
- Agent summaries: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_summaries/`

Frontend-only boundary:
- Allowed: Verilog/RTL generation, source-level restructuring, Yosys frontend synthesis, iverilog debug simulation, official `evaluate.py`.
- Disallowed: backend portfolio/remap/postpareto, optimizing an existing AIG as input, or promoting backend-derived AIGs into frontend best.

Methods planned:
- Unknown hard: new decision/source descriptors and cofactor factorizations for `ex286`, `ex287`.
- Unknown large: descriptor, rotation, pair/cell-local, and output grouping structures for `ex285`, `ex288`, `ex292`, `ex294`, `ex297`, `ex299`.
- FP8 transfer: transfer the recent `ex247` tail/direct low-predicate idea to nearby FP8 cases.
- FP8 semantic: alternative field/special-case shells and compact residual predicates for high-gap FP8 conversion/add cases.
- Arithmetic/unary: structural RTL variants for integer/BF16/FP16 cases still above about 1.5x reference.

Acceptance:
- A successful candidate must be equivalent by official `evaluate.py`, with area, delay, ADP, Verilog path, AIG path, and log path recorded.
- The coordinator will merge shard CSVs, deduplicate method signatures, check path existence, update frontend registry only for verified improvements, and rebuild the frontend campaign index.

