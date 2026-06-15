# frontend_source_parallel_round66_20260613_1050

Run ID: `frontend_source_parallel_round66_20260613_1050`

Purpose: Continue frontend/source-only optimization on cases still above 2.0 frontend/reference ratio. Round66 switches from new semantic encodings to source-level factoring of the current best Verilog structures.

Inputs:
- Current high-gap cases: `ex244`, `ex246`, `ex247`, `ex249`, `ex285`, `ex297`, `ex299`
- Current best Verilog paths from `student/frontend_campaigns/frontend_best_registry.csv`
- Required guidance: `AGENTS.md`, `student/docs/experiment_run_workflow.md`, `student/frontend_campaigns/GOAL.md`, `student/frontend_campaigns/FRONTEND_PROGRESS.md`, `search_state.csv`, `method_judgments.csv`, `manual_judgments.csv`, `hypothesis_bank.csv`, `introduction.md`, `ref/新錄音 20.txt`
- Round64/Round65 summaries for overlapping cases

Verification:
- Official `evaluate.py` only.
- `iverilog` debug-only.
- No backend portfolio.
- No standalone ABC/AIG remap/post-processing of any current-best AIG. Reading current-best Verilog is allowed; generated Verilog must be re-synthesized through the frontend/Yosys path and evaluated.

Status:
- Coordinator skeleton created; shard assignments are in `task_assignments.md`.
