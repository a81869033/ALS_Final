# ex286_ex288_frontend_collision_formula_top80_diag_20260609_1623

Run ID: `ex286_ex288_frontend_collision_formula_top80_diag_20260609_1623`

Purpose: Test whether ex286-ex288 output bits are directly expressible by small collision/carry formulas over the exact bucket-count state and subtype selectors.

Inputs:
- Truth files: `benchmarks/ex286.truth`, `benchmarks/ex287.truth`, `benchmarks/ex288.truth`
- Script: `student/generators/unknown_collision_formula_diag.py`

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex288_frontend_collision_formula_top80_diag_20260609_1623/results/`
- Diagnostic CSV: `results/collision_formula_diagnostics.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Methods tried:
- Primitive predicates from bucket-count equality/thresholds.
- Prefix, suffix, and short-window count thresholds over bucket order.
- Selector bits and bucket-count plus selector carry-style thresholds.
- Per-output exact matching using single primitives and XOR/AND/OR of the top 80 single-match primitives.

Best result:
- Diagnostic only; no Verilog/AIG candidates emitted.
- No output bit in ex286, ex287, or ex288 was exactly represented by the tested one- or two-primitive collision/carry formulas.
- Best per-case bit matches were only `5397/8192`, `11040/16384`, and `21248/32768`.

Notes:
- This rejects direct shallow formulas over the exact bucket/collision state. A future collision recurrence must include richer state or multi-step interaction, not just local count thresholds.
