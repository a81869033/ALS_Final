# ex223-ex224 FP16 Yosys Synthflow Seed Bundle

Purpose: git-tracked copies of the current best FP16 `ex223` and `ex224`
frontend synthesis-flow seeds.

Source registry:

- `student/runs/fp16/ex223_ex224_frontend_yosys_synthflow_20260607_0910/`

Contents:

- One Verilog seed per case under `exNNN/verilog/`.
- One synthesized AIG per case under `exNNN/aigs/`.
- Total seed files: 4.

Best seeds:

- `ex223`: `casez_sign` Verilog synthesized with Yosys internal `abc -g aig`,
  `11148/21/234108`, official `evaluate.py` OK.
- `ex224`: `casez_sign_bits11_12_t8` Verilog synthesized with Yosys internal
  `abc -g aig`, `6219/20/124380`, official `evaluate.py` OK.

Verification:

- These files are copies of already verified current-best rows.
- `results/best.csv` in this bundle points to the git-tracked seed files.
- Every best row has `verified_truth=1` and `equivalent=1`.

Notes:

- Do not add entire `student/work/` run trees here.
- This is a controlled Yosys synthesis-flow seed improvement, not an ABC
  backend optimization portfolio.

