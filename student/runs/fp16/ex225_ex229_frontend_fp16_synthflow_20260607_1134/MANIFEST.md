# ex225_ex229_frontend_fp16_synthflow_20260607_1134

Run ID: `ex225_ex229_frontend_fp16_synthflow_20260607_1134`

Purpose: Limited Yosys synthflow check on the current best `ex225`-`ex229`
Verilog seeds.

Inputs:
- Seed CSV: `student/results/current_best_by_case.csv`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`
- Cases: `ex225`, `ex226`, `ex227`, `ex228`, `ex229`

Artifacts:
- Candidates CSV:
  `student/runs/fp16/ex225_ex229_frontend_fp16_synthflow_20260607_1134/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_ex229_frontend_fp16_synthflow_20260607_1134/results/best.csv`

Methods tried:
- `no_internal_abc`
- `abc_g_aig`
- `abc_g_simple`
- `extra_opt_share`
- `synth_preset`

Best result:
- No equivalent AIG variants were produced by this limited synthflow pass.

Notes:
- Do not count this as backend optimization. It was a frontend Yosys mapping
  sanity check.
- These variants should not be repeated for this seed set unless the source
  Verilog changes or the Yosys script is debugged for equivalence preservation.
