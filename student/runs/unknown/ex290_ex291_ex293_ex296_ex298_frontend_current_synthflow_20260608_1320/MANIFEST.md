# ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320

Run ID: `ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320`

Purpose: Run limited frontend Yosys synthflow variants on close-to-reference
current structural Verilog seeds for `ex290`, `ex291`, `ex293`, `ex296`, and
`ex298`.

Inputs:
- Seed CSV: `student/results/current_best_by_case.csv`
- Source Verilog: existing structural unknown candidates under `student/work/reverse_unknown_20260603_1812/`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320/`
- Candidates CSV: `student/runs/unknown/ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320/results/best.csv`
- Summary CSV: `student/runs/unknown/ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320/results/summary.csv`
- Official evaluate.py recheck: `student/runs/unknown/ex290_ex291_ex293_ex296_ex298_frontend_current_synthflow_20260608_1320/results/evaluate_check.csv`

Best result:
- `ex290`: `4428/14/61992`, best variant `abc_g_aig`, now `1.464562x` reference.
- `ex291`: `6503/15/97545`, best variant `synth_preset`, now `1.459162x` reference.
- `ex293`: `8054/18/144972`, best variant `synth_preset`, now `1.283324x` reference.
- `ex296`: `8987/16/143792`, best variant `abc_g_aig`, now `1.382283x` reference.
- `ex298`: `33981/19/645639`, best variant `synth_preset`, now `1.459744x` reference.

Notes:
- Official `evaluate.py` replay passed for all 100 rows.
- This is a frontend synthesis-flow check from verified Verilog seeds, not a
  backend optimization portfolio. Final unknown seed curation is deferred until
  the full `ex280-ex299` class converges.
