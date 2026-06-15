# ex200_ex299_frontend_refgap_round13_20260612_2045

Run ID: `ex200_ex299_frontend_refgap_round13_20260612_2045`

Purpose: continue frontend seed search after round12 produced no accepted improvements. This round targets the highest frontend/reference ratios and uses materially different sharing or representation families from round12 blockers.

Inputs:
- Goal/spec: `student/frontend_campaigns/GOAL.md`
- Workflow: `student/docs/experiment_run_workflow.md`
- Progress/index files: `student/frontend_campaigns/FRONTEND_PROGRESS.md`, `search_state.csv`, `frontend_best_registry.csv`, `current_frontend_gap.csv`
- Prior judgments: `method_judgments.csv`, `manual_judgments.csv`, `hypothesis_bank.csv`
- Round12 diagnostics: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round12_20260612_2015/results/`

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round13_20260612_2045/`
- Work directory: `student/work/ex200_ex299_frontend_refgap_round13_20260612_2045/`
- Run registries: `student/runs/<domain>/ex200_ex299_frontend_refgap_round13_20260612_2045/`
- Merge script: `merge_round13_results.py`

Shard plan:
- `fp8-tight-r13`: `ex247`, `ex246`, `ex244`, `ex240`, `ex241`, `ex249`
- `fp-bf-r13`: `ex225`, `ex223`, `ex224`, `ex200`, `ex204`, `ex205`
- `integer-delay-r13`: `ex260`, `ex266`, `ex276`, `ex256`, `ex261`, `ex270`, `ex277`
- `unknown-routing-r13`: `ex286`, `ex287`, `ex285`, `ex288`, `ex289`
- `unknown-state-r13`: `ex297`, `ex299`, `ex295`, `ex296`, `ex298`, `ex290`, `ex292`, `ex294`

Acceptance:
- A success candidate must be official `evaluate.py` equivalent.
- `area`, `delay`, `ADP`, Verilog path, AIG path, and official log path must be complete.
- Global registry/search state updates are only allowed through coordinator merge after path and method-signature checks.
