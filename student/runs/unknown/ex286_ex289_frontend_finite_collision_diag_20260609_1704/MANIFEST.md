# ex286_ex289_frontend_finite_collision_diag_20260609_1704

Run ID: `ex286_ex289_frontend_finite_collision_diag_20260609_1704`

Purpose: Diagnostic-only finite collision/algebra search for ex286-ex289.  This
tests whether low-weight conservative behavior can be explained by compact
hidden labels, a small pair-collision table, or simple modular affine pair
operations.  These are large-drop candidates only if the two-hot layer and the
full-table correction superposition are both close to exact.

Inputs:
- Truth files: benchmarks/ex286.truth, benchmarks/ex287.truth, benchmarks/ex288.truth, benchmarks/ex289.truth
- Script: `student/generators/unknown_finite_collision_diag.py`

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex289_frontend_finite_collision_diag_20260609_1704/results/`
- Main diagnostics: `results/finite_collision_summary.csv`
- Modular pair diagnostics: `results/finite_affine_pair_summary.csv`
- Run summary: `results/summary.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Methods tried:
- Hidden labels from one-hot home slot, exact input symmetries, home occurrence,
  raw modular labels, and home-plus-modular labels.
- Majority pair-collision table for each label scheme.
- Full-table XOR correction superposition derived from singleton homes and pair
  collision tables.
- Symmetric modular affine two-hot pair rules.

Best result:
- Diagnostic only; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
