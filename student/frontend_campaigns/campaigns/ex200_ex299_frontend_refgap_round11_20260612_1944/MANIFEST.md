# ex200_ex299_frontend_refgap_round11_20260612_1944

Run ID: `ex200_ex299_frontend_refgap_round11_20260612_1944`

Purpose: Continue after round10 improved `ex295`, `ex297`, and `ex299` but
left large reference gaps. This round is narrowed to the worst remaining gaps
and near-miss structures.

Inputs:
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/current_frontend_gap.csv`
- `student/frontend_campaigns/frontend_best_registry.csv`
- case index and notes for assigned cases

Artifacts:
- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round11_20260612_1944/`
- Work: `student/work/ex200_ex299_frontend_refgap_round11_20260612_1944/`
- Domain run dirs under `student/runs/<domain>/ex200_ex299_frontend_refgap_round11_20260612_1944/`

Methods planned:
- `ex286/ex287`: only genuinely new nonlinear state/pair-count basis or
  constructive shared pair-count generator. No more symcof/lane/ANF wrappers.
- `ex295/ex297/ex299`: exploit symbol-plane split by lowering delay/area or
  deriving a recurrence; no unchanged replay.
- `ex244/ex246/ex247`: boundary-region muxes with lower-delay grouping;
  `ex247` needs to beat `8349`, not just approach it.
- mixed shard: only near-miss or materially different residuals for
  `ex225`, `ex223`, `ex204`, `ex260`.

Notes:
- Official success requires repo `evaluate.py`.
- Do not promote partial outputs to `student/seeds`.
