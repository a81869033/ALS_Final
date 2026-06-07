# ex223_ex224_frontend_yosys_synthflow_aigfollow_20260607_0930

Run ID: `ex223_ex224_frontend_yosys_synthflow_aigfollow_20260607_0930`

Purpose: Targeted follow-up around the useful `abc -g aig` Yosys synthesis
knob found in `ex223_ex224_frontend_yosys_synthflow_20260607_0910`.

Inputs:
- Truth files: `benchmarks/ex223.truth`, `benchmarks/ex224.truth`
- Seed Verilog:
  - `student/work/ex223_ex224_frontend_fp16_bitlogic3_20260606_2344/ex223/verilog/ex223_fp16_log_casez_sign.v`
  - `student/work/ex223_ex224_frontend_fp16_bitlogic4_20260606_2354/ex224/verilog/ex224_fp16_log2_casez_sign_bits11_12_t8.v`
- Script: `student/scripts/yosys_synthflow_variants.py`

Artifacts:
- Work directory: `student/work/ex223_ex224_frontend_yosys_synthflow_aigfollow_20260607_0930/`
- Per-case manifests:
  - `student/work/ex223_ex224_frontend_yosys_synthflow_aigfollow_20260607_0930/ex223/manifest.json`
  - `student/work/ex223_ex224_frontend_yosys_synthflow_aigfollow_20260607_0930/ex224/manifest.json`
- Candidates CSV: `student/runs/fp16/ex223_ex224_frontend_yosys_synthflow_aigfollow_20260607_0930/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex223_ex224_frontend_yosys_synthflow_aigfollow_20260607_0930/results/best.csv`
- Summary CSV: `student/runs/fp16/ex223_ex224_frontend_yosys_synthflow_aigfollow_20260607_0930/results/summary.csv`

Methods tried:
- `abc -g aig -D 18/19/20/21`.
- Nearby gate aliases: `gates`, `cmos2`.

Best result:
- `ex223`: `abc_g_aig_d18`, `11148/21/234108`, equivalent; same QoR as the
  official `evaluate.py` OK `abc_g_aig` AIG from the parent synthflow run.
- `ex224`: `abc_g_aig_d18`, `6219/20/124380`, equivalent; same QoR as the
  official `evaluate.py` OK `abc_g_aig` AIG from the parent synthflow run.

Notes:
- Seed Verilog is copied into this run's `exNNN/verilog/` directories for
  traceability; this follow-up changes only Yosys synthesis-flow settings and
  emits AIG/log artifacts.
- Delay targets on `abc -g aig` reproduce the same result as plain
  `abc -g aig`; they do not further improve ADP.
- `gates` and `cmos2` are worse for both cases.
