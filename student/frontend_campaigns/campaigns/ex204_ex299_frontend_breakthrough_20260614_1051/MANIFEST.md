# ex204_ex299_frontend_breakthrough_20260614_1051

Run ID: `ex204_ex299_frontend_breakthrough_20260614_1051`

Purpose: frontend-only breakthrough search for high frontend/reference gap
cases after the previous cleanup and registry repair. This run emphasizes new
high-level descriptions, decision graphs, structural RTL, shared residuals, and
case-specific semantic recuts rather than small parameter tweaks.

Inputs:
- `AGENTS.md`
- `student/docs/experiment_run_workflow.md`
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/search_state.csv`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/method_judgments.csv`
- `student/frontend_campaigns/manual_judgments.csv`
- `student/frontend_campaigns/hypothesis_bank.csv`
- Assigned `student/frontend_campaigns/case_index/exNNN.md` and case notes.
- `introduction.md`
- `ref/新錄音 20.txt`

Artifacts:
- Campaign directory: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_breakthrough_20260614_1051/`
- Work directory: `student/work/ex204_ex299_frontend_breakthrough_20260614_1051/<agent_id>/<case>/`
- Run registry: `student/runs/<domain>/ex204_ex299_frontend_breakthrough_20260614_1051/<agent_id>/<case>/`
- Shard CSVs: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_breakthrough_20260614_1051/agent_shards/<agent_id>/`

Rules:
- Frontend-only: generated/restructured Verilog, Yosys frontend synthesis to
  AIG, optional iverilog debug, official `evaluate.py`.
- No backend portfolio/remap/postpareto, no `read_aiger` optimization flow, no
  existing-AIG structural remap promotion.
- Official success requires `evaluate.py` OK/equivalent plus area, delay, ADP,
  Verilog path, AIG path, and log path.
- Do not modify `student/seeds` or `student/new_seeds`.
- Do not repeat `do_not_repeat_as_is` method signatures without material change.

Breakthrough target:
- Prefer a large ADP drop on at least one high-gap case.
- If no immediate win appears, return a defensible new structural family that
  can be expanded and record why prior families are exhausted.

Current merge summary:
- Root `results/evaluation_results.csv`: 428 rows.
- Root `results/candidates.csv`: 424 rows.
- Root `results/best_improvements.csv`: 44 rows.
- Latest validated improvements:
  - `ex205`: `71040 -> 71024`.
  - `ex216`: `5772 -> 5720`.
  - `ex219`: `9212 -> 8541`.
  - `ex242`: `17682 -> 16820`.
  - `ex244`: `10234 -> 9952`.
  - `ex247`: `8349 -> 6474`.
  - `ex248`: `7938 -> 7830`.
  - `ex265`: `504 -> 464`.
  - `ex270`: `3230 -> 3060`.
- Best breakthrough by absolute delta: `ex247_r5_lowpred_truth_case_abc_g_aig_frontend`,
  official `evaluate.py OK`, `249/26/6474`.
- Useful structures: FP8 tail-low residual case factoring, FP8 saturation bit
  regrouping, FP8 axis/numzero and split-payload shells, BF16 selected-bit/source
  recuts, integer divisor-high range LUTs, and integer square high-bit threshold
  recuts.
- Active follow-up shards: `unknown-hard-r7`, `unknown-mid-r7`,
  `unknown-large-r7`, `fp8-r9`, `integer-r7`, and `unary-r7`.
- Validation: `merge_shards.py` completed with `validation_errors 0`.
- Scope audit: promoted candidates are source-level frontend RTL/Yosys-to-AIG
  plus official `evaluate.py`; no backend portfolio/remap result was promoted.
