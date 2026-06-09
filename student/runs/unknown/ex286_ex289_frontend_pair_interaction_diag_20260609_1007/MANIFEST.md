# ex286_ex289_frontend_pair_interaction_diag_20260609_1007

Run ID: `ex286_ex289_frontend_pair_interaction_diag_20260609_1007`

Purpose: Diagnostic-only pair-interaction analysis for ex286-ex289.  This tests
whether the Hamming-weight-preserving maps expose a compact two-hot interaction
structure, low-rank output matrices, or degree-2 behavior implied by one/two-hot
rows.

Inputs:
- Truth files: benchmarks/ex286.truth, benchmarks/ex287.truth, benchmarks/ex288.truth, benchmarks/ex289.truth
- Script: `student/generators/unknown_pair_interaction_diag.py`

Artifacts:
- Results: `student/runs/unknown/ex286_ex289_frontend_pair_interaction_diag_20260609_1007/results/pair_interaction_diagnostics.csv`

Best result:
- Diagnostic-only run; no Verilog/AIG candidates generated.

Notes:
- Two-hot output matrices have some low-rank bits, but two-hot behavior does not
  depend only on the one-hot output-slot pair; conflicts remain high.
- The exact degree-2 polynomial implied by zero/one/two-hot rows matches only
  about half of each full truth table for representative output bits.
- Degree-2 residual BDDs are larger than raw bit BDDs on the checked edge bits,
  so a degree2-plus-residual selected-bit source is not seed-worthy.
- `student/seeds` and `output/` are intentionally untouched.
