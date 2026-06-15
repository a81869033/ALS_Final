# ex200_ex299_frontend_refgap_round16_20260612_2233

Run ID: `ex200_ex299_frontend_refgap_round16_20260612_2233`

Purpose: continue the frontend reference-gap campaign after round15 produced only nonwinning official candidates. This round splits the highest remaining frontend/reference gaps across disjoint agents and prioritizes materially different high-level representations with shared structure.

Inputs:
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/search_state.csv`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/current_frontend_gap.csv`
- assigned `student/frontend_campaigns/case_index/exNNN.md`
- linked case notes for assigned cases

Artifacts:
- Work directory: `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/`
- Campaign directory: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round16_20260612_2233/`
- Shards: `agent_shards/<agent_id>/`
- Summaries: `agent_summaries/<agent_id>.md`
- Merged CSVs: `results/`

Methods targeted:
- FP8 conversion: shared exponent/mantissa decode, rounding/saturation predicate sharing, output grouped predicates.
- Unknown routing/state: routing descriptors, state/cell descriptors, BDD/cofactor and ANF/GF(2) shared subfunctions.
- FP16/BF16: semantic field decode with residual minimization, not blind nested LUT replay.
- Integer: shared arithmetic/comparator structure and prefix/descriptor families.

Acceptance rule: only official `evaluate.py` equivalent rows with complete area, delay, ADP, Verilog, AIG, and log paths are candidates. Non-equivalent or blocked attempts must be recorded as failed hypotheses.
