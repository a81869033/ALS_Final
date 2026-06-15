# frontend_source_parallel_round74_20260613_1439

Run ID: `frontend_source_parallel_round74_20260613_1439`

Purpose: frontend-only source/RTL search for cases whose pure frontend best ADP/reference ratio remains above 1.5, excluding ex286 and ex287 per user instruction.

Inputs:
- Project workflow: `AGENTS.md`, `student/docs/experiment_run_workflow.md`, `student/frontend_campaigns/GOAL.md`
- Progress index: `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- Current data: `student/frontend_campaigns/frontend_best_registry.csv`, `student/frontend_campaigns/current_frontend_gap.csv`, `student/frontend_campaigns/search_state.csv`
- Prior method filters: `student/frontend_campaigns/method_judgments.csv`, `student/frontend_campaigns/manual_judgments.csv`, `student/frontend_campaigns/hypothesis_bank.csv`
- Method notes: `introduction.md`, `ref/新錄音 20.txt`

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/`
- Work directory: `student/work/frontend_source_parallel_round74_20260613_1439/`
- Run records: `student/runs/<domain>/frontend_source_parallel_round74_20260613_1439/`

Methods tried:
- FP8 mul/div/fmod semantic key tables, product/remainder split tables, and denominator-grouped source variants.
- FP8 add/hypot sorted field decode, gap/correction, selected magnitude, and shared predicate variants.
- Unknown rot2 selector/cell-template output-cluster hybrids.
- Unknown routing/state popcount overlays and grouped BDD output planes.
- Integer arithmetic algorithmic source variants for signed multiply, divider, square, and isqrt.
- FP16 field-structured low-table/boundary variants.

Best result:
- Round74 found no new global frontend best.
- `ex238_r74_core_boundary_low13_hi5_synth_preset` improved the stale local target `24848 -> 23520`, but it is superseded by an existing official round27 frontend row `22530`, which was restored into the campaign index inputs.

Verification:
- Only official `evaluate.py` equivalent rows with area, delay, ADP, Verilog/AIG/log paths count as valid candidates.
- No backend portfolio, standalone ABC remap, or post-AIG optimization is allowed in this frontend-only round.
