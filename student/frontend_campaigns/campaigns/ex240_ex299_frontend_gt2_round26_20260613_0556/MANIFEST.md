# ex240_ex299_frontend_gt2_round26_20260613_0556

Run ID: `ex240_ex299_frontend_gt2_round26_20260613_0556`

Purpose: second follow-up frontend round for cases whose current
`frontend_best_adp / reference_adp` ratio remains greater than 2, excluding
`ex286` and `ex287`. This round avoids replaying round25 generic shared-BDD,
current-source remap, plain symbol-plane, and old symcof families.

Inputs:
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/current_frontend_gap.csv`
- `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/results/`
- assigned `student/frontend_campaigns/case_index/exNNN.md`

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round26_20260613_0556/`
- Work directory: `student/work/ex240_ex299_frontend_gt2_round26_20260613_0556/`
- Run directories:
  - `student/runs/float_fp8/ex240_ex299_frontend_gt2_round26_20260613_0556/`
  - `student/runs/unknown/ex240_ex299_frontend_gt2_round26_20260613_0556/`

Verification:
- Only official repo `evaluate.py` results count as equivalent candidates.
- `iverilog` may be used only for debug simulation.

Notes:
- No `student/seeds` curation is performed in this campaign.
