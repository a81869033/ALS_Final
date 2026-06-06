# ex201_ex204_frontend_aggressive_semantic_20260605_1139

Run ID: `ex201_ex204_frontend_aggressive_semantic_20260605_1139`

Purpose: aggressive frontend-only attempts to improve `ex201-ex204` toward a
50% ADP reduction from the current best seeds.

Inputs:
- Truth files: `benchmarks/ex201.truth` through `benchmarks/ex204.truth`
- Prior best Verilog seeds from `ex201_ex204_frontend_bf16_semantic_20260605_0924`
- Manual semantic RTL formulas for `ex201`, `ex203`, and `ex204`

Artifacts:
- Work directory: `student/work/ex201_ex204_frontend_aggressive_semantic_20260605_1139/`
- Candidates CSV: `student/runs/bf16/ex201_ex204_frontend_aggressive_semantic_20260605_1139/results/candidates.csv`
- Best CSV: `student/runs/bf16/ex201_ex204_frontend_aggressive_semantic_20260605_1139/results/best.csv`
- Summary CSV: `student/runs/bf16/ex201_ex204_frontend_aggressive_semantic_20260605_1139/results/summary.csv`
- Official recheck CSV: `student/runs/bf16/ex201_ex204_frontend_aggressive_semantic_20260605_1139/results/evaluate_check.csv`

Methods tried:
- Re-synthesized current best Verilog without Yosys `abc -g AND`.
- Added `parallel_case/full_case` hints to current best Verilog sources.
- `ex201`: manual semantic `2^x` split into integer part and fractional LUTs.
- `ex203`: manual semantic Q22 fixed-point `ln(x)=log2(x)*ln2`.
- `ex204`: manual field-level `log2` formulas with p-specific correction LUTs and shared Q13 correction LUT.
- `ex204`: direct grouped XOR-delta by identical exponent delta patterns.

Best result:
- No candidate improved over the prior current best.
- The best rows in this run tie the prior best through `parallel_case/full_case` variants:
  - `ex201`: `1599/15/23985`
  - `ex202`: `3702/16/59232`
  - `ex203`: `4546/18/81828`
  - `ex204`: `1679/18/30222`

Verification:
- `evaluate.py` official recheck passed for all 13 equivalent candidates.
- Backend optimization portfolios were not run.

Notes:
- The requested 50% ADP reduction was not achieved by frontend-only RTL changes in this run.
- No-ABC synthesis was uniformly worse.
- Parallel/full-case hints did not change synthesized QoR.
- Full semantic fixed-point conversion gives low area in some cases but very high delay.
