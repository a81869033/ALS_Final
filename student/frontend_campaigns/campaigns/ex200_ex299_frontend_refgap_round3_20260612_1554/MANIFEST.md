# ex200_ex299_frontend_refgap_round3_20260612_1554

Run ID: `ex200_ex299_frontend_refgap_round3_20260612_1554`

Purpose: continue frontend reference-gap convergence after round2; prioritize cases still far from `reference_result.csv` and avoid repeating low-value directions.

Inputs:
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/current_frontend_gap.csv` after round2 index rebuild
- `student/frontend_campaigns/frontend_best_registry.csv` after round2 accepted updates
- per-case `student/frontend_campaigns/case_index/exNNN.md` and notes

Artifacts:
- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round3_20260612_1554`
- Work: `student/work/ex200_ex299_frontend_refgap_round3_20260612_1554/<agent_id>/<case>/`
- Runs: `student/runs/<domain>/ex200_ex299_frontend_refgap_round3_20260612_1554/<agent_id>/<case>/`

Methods planned:
- focused continuation of overlap-root GF(2) sharing for ex280-ex284
- new routing/state/cell descriptor families for ex285-ex299
- fp8 conversion shared rounding/saturation and decode alternatives
- fp16/bf16 sparse residual compression alternatives
- integer shared partial product/comparator/trial-subtract alternatives

Status: started; coordinator will merge only official `evaluate.py` equivalent candidates with complete paths.
