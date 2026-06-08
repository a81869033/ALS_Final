# ex223_ex225_frontend_fp16_log_nested_current_20260607_2140

Run ID: `ex223_ex225_frontend_fp16_log_nested_current_20260607_2140`

Purpose: curated current best FP16 log-family frontend seeds for ex223, ex224, and ex225 after applying the nested mantissa table structure learned from ex232.

Inputs:
- Truth files: `benchmarks/ex223.truth`, `benchmarks/ex224.truth`, `benchmarks/ex225.truth`
- Generator: `student/generators/fp16_log_nested_semantic.py`
- Source runs:
  - `student/runs/fp16/ex223_ex225_frontend_fp16_log_nested_followup3_20260607_2125/`
  - `student/runs/fp16/ex223_ex225_frontend_fp16_log_nested_followup4_20260607_2129/`

Artifacts:
- Best CSV: `student/seeds/fp16/ex223_ex225_frontend_fp16_log_nested_current_20260607_2140/results/best.csv`
- Best Verilog/AIG files are stored under each `exNNN/` directory.

Methods tried:
- Positive-normal semantic shell using sign+exponent grouping.
- Special/non-positive sign-exp groups preserved as exact special table.
- Output high bits encoded as per-exp mantissa run trees.
- Noisy low bits encoded as nested mantissa hi/lo LUT.
- Follow-up low-width sweeps from low8 through low15 to find the useful boundary.

Best result:
- ex223: `ex223_log_nested_low11_hi5_abc_g_aig`, area 10753, delay 19, ADP 204307.
- ex224: `ex224_log_nested_low12_hi6_abc_g_aig`, area 6014, delay 16, ADP 96224.
- ex225: `ex225_log_nested_low12_hi5_abc_g_aig`, area 11533, delay 19, ADP 219127.

Verification:
- `python3 evaluate.py --output student/work/ex223_ex225_frontend_fp16_log_nested_eval_20260607_2140 --case ex223 --timeout 900`
- `python3 evaluate.py --output student/work/ex223_ex225_frontend_fp16_log_nested_eval_20260607_2140 --case ex224 --timeout 900`
- `python3 evaluate.py --output student/work/ex223_ex225_frontend_fp16_log_nested_eval_20260607_2140 --case ex225 --timeout 900`

Notes:
- ex224 is now within 1.5x reference ADP.
- ex223 and ex225 improved but still remain above 1.5x reference; further progress likely needs a shallower arithmetic normalizer or a more compact low-bit correction representation.
