# ex201_ex204_frontend_semantic_deep_20260605_1525

Run ID: `ex201_ex204_frontend_semantic_deep_20260605_1525`

Purpose: deep frontend-only semantic/bit-level search for BF16 `ex201`-`ex204`, continuing from the verified `2^x`, `10^x`, `ln(x)`, and `log2(x)` hypotheses.

Inputs:
- Truth files: `benchmarks/ex201.truth` through `benchmarks/ex204.truth`
- Seed evidence: prior BF16 semantic and bitlogic Verilog candidates under `student/work/ex201_ex204_frontend_bf16_semantic_20260605_0924/` and `student/work/ex201_ex204_frontend_bitlogic_20260605_1412/`
- Generator/script: one-off semantic/bit-level renderers run in this session, recorded by generated Verilog and result CSVs

Artifacts:
- Work directory: `student/work/ex201_ex204_frontend_semantic_deep_20260605_1525/`
- Candidates CSV: `student/runs/bf16/ex201_ex204_frontend_semantic_deep_20260605_1525/results/candidates.csv`
- Best CSV: `student/runs/bf16/ex201_ex204_frontend_semantic_deep_20260605_1525/results/best.csv`
- Summary CSV: `student/runs/bf16/ex201_ex204_frontend_semantic_deep_20260605_1525/results/summary.csv`
- Official evaluate recheck: `student/runs/bf16/ex201_ex204_frontend_semantic_deep_20260605_1525/results/evaluate_check.csv`

Methods tried:
- Pair-table plus selected output-bit recomputation.
- Current-best field-default output-bit overrides and multi-bit overrides.
- Sign/exp/mant bit overrides for `ln(x)`.
- Delta-pair bit overrides for `log2(x)`.
- `ex202` semantic range gating, sign-separated active tables, grouped constant field cases, default-choice sweeps, and exact `10^x = 2^(x*log2(10))` arithmetic/LUT/correction candidates.

Best result:
- See `results/best.csv`.
- `ex201`: `1595/15/23925`, improved from `23985`.
- `ex202`: `3702/16/59232`, tied previous best after many frontend-only attempts.
- `ex203`: `4496/18/80928`, improved from `81828`.
- `ex204`: `1657/18/29826`, improved from `30222`.

Notes:
- No backend optimization portfolio was run.
- All best candidates passed official `evaluate.py` recheck with the project truth convention.
- `ex202` area can be reduced with semantic arithmetic (`2797` nodes), but the multiplier/conversion path raises delay to `71`, so it is not a good ADP seed without later backend work.
