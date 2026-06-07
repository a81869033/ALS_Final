# ex223_ex224_frontend_yosys_synthflow_20260607_0910

Run ID: `ex223_ex224_frontend_yosys_synthflow_20260607_0910`

Purpose: Test a small controlled set of Yosys synthesis-flow knobs on the
current best `ex223` and `ex224` Verilog seeds.

Inputs:
- Truth files: `benchmarks/ex223.truth`, `benchmarks/ex224.truth`
- Seed Verilog:
  - `student/work/ex223_ex224_frontend_fp16_bitlogic3_20260606_2344/ex223/verilog/ex223_fp16_log_casez_sign.v`
  - `student/work/ex223_ex224_frontend_fp16_bitlogic4_20260606_2354/ex224/verilog/ex224_fp16_log2_casez_sign_bits11_12_t8.v`
- Script: `student/scripts/yosys_synthflow_variants.py`

Artifacts:
- Work directory: `student/work/ex223_ex224_frontend_yosys_synthflow_20260607_0910/`
- Per-case manifests:
  - `student/work/ex223_ex224_frontend_yosys_synthflow_20260607_0910/ex223/manifest.json`
  - `student/work/ex223_ex224_frontend_yosys_synthflow_20260607_0910/ex224/manifest.json`
- Candidates CSV: `student/runs/fp16/ex223_ex224_frontend_yosys_synthflow_20260607_0910/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex223_ex224_frontend_yosys_synthflow_20260607_0910/results/best.csv`
- Summary CSV: `student/runs/fp16/ex223_ex224_frontend_yosys_synthflow_20260607_0910/results/summary.csv`

Methods tried:
- Current project Yosys script recheck.
- Skip Yosys internal ABC.
- `abc -fast`.
- `abc -g AND -D 20/21/22/24`.
- Gate sets: `aig`, `simple`, `AND,MUX`.
- Extra Yosys opts: `opt_reduce`, `opt_muxtree`, `wreduce`, `share`.
- Late flatten.
- `synth -flatten` preset with and without ABC.

Best result:
- `ex223`: `abc_g_aig`, `11148/21/234108`, official `evaluate.py` OK.
- `ex224`: `abc_g_aig`, `6219/20/124380`, official `evaluate.py` OK.

Notes:
- Seed Verilog is copied into this run's `exNNN/verilog/` directories for
  traceability; the main experiment changes only the Yosys synthesis script and
  emits AIG/log artifacts.
- The useful knob is `abc -g aig` inside Yosys before `aigmap`.  It improves
  both cases versus the previous `abc -g AND` flow.
- Delay-target knobs did not change QoR for either case.
- Skipping internal ABC, `abc -fast`, late flatten, extra sharing, and no-ABC
  synth preset were worse.
