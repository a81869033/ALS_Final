# ex201_ex204_frontend_semantic_continue_20260605_1732

Run ID: `ex201_ex204_frontend_semantic_continue_20260605_1732`

Purpose: continue frontend-only BF16 semantic factoring for ex201-ex204.

Inputs:
- Truth files: `benchmarks/ex201.truth` through `benchmarks/ex204.truth` as selected by `--cases`.
- Generator/script: `student/generators/bf16_ex201_ex204_continue.py`.

Artifacts:
- Work directory: `student/work/ex201_ex204_frontend_semantic_continue_20260605_1732/`
- Results directory: `student/runs/bf16/ex201_ex204_frontend_semantic_continue_20260605_1732/results/`

Methods tried:
- Mantissa hi/lo split field and word tables.
- Mantissa hi/lo base plus XOR/add delta tables.
- Hand-derived selected-bit formula overrides for boundary exponent/mantissa cases.
- Full-input casez run overrides for selected output bits.
- Per-sign-exp mantissa PLA/cube covers for selected output bits.
- Yosys synthesis to AIG plus ABC CEC/ADP measurement only.

Best result:
- See `results/best.csv`.

Notes:
- Backend portfolios were not run.
- Current consolidated candidate count: 17.
- Full 443-candidate history and non-curated Verilog/AIG/log files were moved
  to `student/archive/cleanup_20260605/ex201_ex204_curated_cleanup_20260605_2315/`.
- The active `candidates.csv` intentionally keeps only a small set of good
  initial frontend seeds for future backend experiments.
- Official `evaluate.py --case` recheck is recorded in `results/evaluate_check.csv`.
- Latest improvement: ex204 `log2_arithbase_delta_hilo3_formula_bits_11_14` reached `1545/17/26265`.
