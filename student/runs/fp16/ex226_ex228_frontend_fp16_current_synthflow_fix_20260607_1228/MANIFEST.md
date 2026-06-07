# ex226_ex228_frontend_fp16_current_synthflow_fix_20260607_1228

Stage: frontend Yosys synthflow follow-up.

Scope:
- `ex226`
- `ex227`
- `ex228`

Purpose:
- Recheck current ex226-ex228 FP16 semantic/structural Verilog seeds with a
  single `abc -g aig` Yosys emission path.
- This is not an ABC/ABC9/MockTurtle/CULS/E-Syn backend portfolio.

Inputs:
- Seed CSV:
  `student/results/current_best_by_case.csv`
- Work directory:
  `student/work/ex226_ex228_frontend_fp16_current_synthflow_fix_20260607_1228/`

Results:
- Candidates CSV:
  `student/runs/fp16/ex226_ex228_frontend_fp16_current_synthflow_fix_20260607_1228/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex226_ex228_frontend_fp16_current_synthflow_fix_20260607_1228/results/best.csv`

Best:
- `ex226`: `ex226_positive_default_exp_mant_case_abc_g_aig`,
  `33356/22/733832`.
- `ex227`: `ex227_positive_default_exp_mant_case_abc_g_aig`,
  `40629/22/893838`.
- `ex228`: `ex228_semantic_sign_exp_field_defaults_abc_g_aig`,
  `6627/20/132540`.

Notes:
- All three current-best AIGs were exact equivalent in the run and later
  rechecked with official `evaluate.py` after being copied to the current seed
  bundle.
- The useful knob was the initial AIG gate set (`abc -g aig`); no broader
  backend command portfolio was run.
