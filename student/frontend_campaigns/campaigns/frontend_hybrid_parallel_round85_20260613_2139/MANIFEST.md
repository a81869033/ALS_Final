# frontend_hybrid_parallel_round85_20260613_2139

Run ID: `frontend_hybrid_parallel_round85_20260613_2139`

Purpose: frontend-only hybrid structural search after round84 found no wins.
This round avoids whole-word descriptor/table/cofactor rewrites and instead
targets high-cost output groups and residual regions: start from the current
best semantic/high-level description, identify which output bits or condition
classes are expensive, then generate materially different Verilog that shares
roots across only those groups.

Inputs:
- `AGENTS.md`
- `student/docs/experiment_run_workflow.md`
- `student/frontend_campaigns/GOAL.md`
- `student/frontend_campaigns/FRONTEND_PROGRESS.md`
- `student/frontend_campaigns/search_state.csv`
- `student/frontend_campaigns/frontend_best_registry.csv`
- `student/frontend_campaigns/current_frontend_gap.csv`
- `student/frontend_campaigns/method_judgments.csv`
- `student/frontend_campaigns/manual_judgments.csv`
- `student/frontend_campaigns/hypothesis_bank.csv`
- assigned `student/frontend_campaigns/case_index/exNNN.md`
- linked case notes and round84 summaries
- `introduction.md`
- `ref/新錄音 20.txt`

Rules:
- Frontend/source only. Do not run backend portfolio, backend remap, or
  post-AIG optimization.
- Official equivalence/QoR is repo `evaluate.py`.
- Do not use old ex280-specific search scripts.
- Do not edit seed bundles.
- Do not record a best improvement unless official `evaluate.py` is equivalent
  and ADP beats the previous frontend best.
- Shards must write isolated outputs under `<run_id>/<agent_id>/<case>/`.

Target cases:
- `float_fp8`: `ex247`, `ex246`, `ex244`, `ex249`, `ex241`, `ex240`, `ex245`
- `unknown`: `ex285`, `ex288`, `ex297`, `ex299`
- `fp16`: `ex223`, `ex225`
- `integer`: `ex260`, `ex266`

Representation focus:
- output-cluster structural stitching from exact frontend sources
- residual-only replacement for expensive output bits or active regions
- shared predicate roots for special/rounding/saturation/cancellation
- source-level hybridization of independently exact Verilog expressions
- compact arithmetic/compressor forms only when method_signature is materially
  different from r80-r84

Merged result:
- 18 official `evaluate.py` equivalent candidates.
- 0 frontend-best improvements.
- 28 failed/blocker hypotheses recorded.
- 0 missing artifact paths and 0 duplicate method signatures.
- Bookkeeping appended 26 manual-judgment rows and 18 hypothesis-bank rows.

Best result:
- No frontend best changed in this round.

Notable closest nonwinning candidates:
- `ex249_r85_minimized_delta_predicates`: `202/34/6868`, exact but worse than
  frontend `4342`.
- `ex247_r85_lowpat_boolean`: `368/25/9200`, exact but worse than frontend
  `7291`.
- `ex246_r85_mant_residual_sop`: `397/24/9528`, exact but worse than frontend
  `6888`.
- `ex285_r85_tree_loww2_center_4_7`: `804/17/13668`, exact but worse than
  frontend `11033`.
- `ex297_r85_pairsel_pairxor_hiadj_10_11`: `26606/16/425696`, exact but worse
  than frontend `425024`.

Notes:
- Output-cluster grafting and residual-only patches did not produce a new
  frontend best in this pass.
- Whole-word descriptor/table families remain blocked from round84; source
  grafts from round85 are also recorded as nonwinning unless materially changed.
