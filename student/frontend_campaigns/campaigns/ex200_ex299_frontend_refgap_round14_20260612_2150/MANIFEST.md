# ex200_ex299_frontend_refgap_round14_20260612_2150

Run ID: `ex200_ex299_frontend_refgap_round14_20260612_2150`

Purpose: continue frontend search after round13 produced diagnostic blockers and no improvements. Round14 prioritizes cases where a materially new RTL candidate is still plausible, especially BF16 small-mantissa functions, FP8 predicate-lattice variants, unknown state descriptors, and integer isqrt/square delay reductions.

Inputs:
- `student/frontend_campaigns/GOAL.md`
- `student/docs/experiment_run_workflow.md`
- `introduction.md`
- `student/frontend_campaigns/current_frontend_gap.csv`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/method_judgments.csv`
- `student/frontend_campaigns/manual_judgments.csv`
- `student/frontend_campaigns/hypothesis_bank.csv`
- Round13 results and blockers under `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round13_20260612_2045/`

Artifacts:
- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round14_20260612_2150/`
- Work: `student/work/ex200_ex299_frontend_refgap_round14_20260612_2150/`
- Runs: `student/runs/<domain>/ex200_ex299_frontend_refgap_round14_20260612_2150/`

Acceptance:
- Official `evaluate.py` equivalent only.
- Area, delay, ADP, Verilog path, AIG path, and official log path must be present for candidate rows.
- Coordinator-only global registry/search-state updates after merge validation.
