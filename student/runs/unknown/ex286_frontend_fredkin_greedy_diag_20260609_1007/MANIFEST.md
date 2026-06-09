# ex286_frontend_fredkin_greedy_diag_20260609_1007

Run ID: `ex286_frontend_fredkin_greedy_diag_20260609_1007`

Purpose: Diagnostic-only greedy Fredkin/controlled-swap probe after exact input
pair canonicalization.  This checks whether a small number of conservative
controlled swaps can rapidly approach the target truth table.

Inputs:
- Truth files: benchmarks/ex286.truth
- Script: `student/generators/unknown_fredkin_greedy_diag.py`
- Pair canonicalization: `4:5,6:7`
- Max depth: `20`

Artifacts:
- Results: `student/runs/unknown/ex286_frontend_fredkin_greedy_diag_20260609_1007/results/fredkin_greedy_diagnostics.csv`

Best result:
- Diagnostic-only run; no Verilog/AIG candidates generated.

Notes:
- Initial pair-canonical key score was `47770` with `8100/8192` row mismatches.
- Best greedy sequence stopped after 18 improving gates at score `36788`, but
  row mismatches were still `8014/8192`.
- This rejects a short/simple greedy Fredkin or controlled-swap chain as the
  missing large-drop frontend structure.
- `student/seeds` and `output/` are intentionally untouched.
