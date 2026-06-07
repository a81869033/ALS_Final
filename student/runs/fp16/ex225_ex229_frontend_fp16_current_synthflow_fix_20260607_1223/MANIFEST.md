# ex225_ex229_frontend_fp16_current_synthflow_fix_20260607_1223

Stage: frontend Yosys synthflow follow-up.

Scope:
- `ex225`
- `ex229`

Purpose:
- Recheck the current curated ex225/ex229 Verilog seeds with a fixed
  synthflow helper and a single `abc -g aig` Yosys emission path.
- This is not an ABC/ABC9/MockTurtle/CULS/E-Syn backend portfolio.

Inputs:
- Seed CSV:
  `student/seeds/fp16/ex225_ex229_frontend_fp16_bitrun_shells_current/results/best.csv`
- Work directory:
  `student/work/ex225_ex229_frontend_fp16_current_synthflow_fix_20260607_1223/`

Results:
- Candidates CSV:
  `student/runs/fp16/ex225_ex229_frontend_fp16_current_synthflow_fix_20260607_1223/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_ex229_frontend_fp16_current_synthflow_fix_20260607_1223/results/best.csv`

Best:
- `ex225`: `ex225_bitrun_bits12_9_t32_abc_g_aig`, `11499/22/252978`.
- `ex229`: `ex229_semantic_positive_field_defaults_abc_g_aig`,
  `3971/19/75449`.

Notes:
- The earlier synthflow helper failed to create parent AIG directories before
  `write_aiger`; this run used the fixed helper.
- Both best AIGs were exact equivalent in the run and later rechecked with
  official `evaluate.py` after being copied to the current seed bundle.
