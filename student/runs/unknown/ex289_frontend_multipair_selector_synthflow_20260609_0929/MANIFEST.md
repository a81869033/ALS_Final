# ex289_frontend_multipair_selector_synthflow_20260609_0929

Run ID: `ex289_frontend_multipair_selector_synthflow_20260609_0929`

Purpose: Limited Yosys synthflow check for the low-area ex289 multi-pair
explicit-selector source from `ex289_frontend_multipair_selector_20260609_0927`.

Inputs:
- Seed CSV: `student/runs/unknown/ex289_frontend_multipair_selector_20260609_0927/results/best.csv`
- Seed Verilog: `student/work/ex289_frontend_multipair_selector_20260609_0927/ex289/verilog/ex289_unknown_symcof_interleave_f00_bits_0_1_12_13_case_group.v`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex289_frontend_multipair_selector_synthflow_20260609_0929/`
- Results: `student/runs/unknown/ex289_frontend_multipair_selector_synthflow_20260609_0929/results/`

Methods tried:
- `abc_g_aig`
- `abc_g_aig_d18`
- `abc_g_aig_d19`
- `abc_g_aig_d20`
- `synth_preset`

Best result:
- `synth_preset`: exact, `1325/19/25175`

Notes:
- New ex289 current best, improving prior `27132` by `1957` ADP.
- Still above the 1.5x reference target `20430`.
- `student/seeds` intentionally untouched.

