# ex270_ex274_frontend_square_structures_20260609_1138_smoke2

Run ID: `ex270_ex274_frontend_square_structures_20260609_1138_smoke2`

Purpose: frontend-only square-specific structures for `ex270-ex274`.

Inputs:
- Truth files: `benchmarks/ex270.truth` through `benchmarks/ex274.truth`
- Previous notes: `student/cases/ex255_ex279_integer_arithmetic/README.md`
- Generator/script: `student/generators/integer_ex270_ex274_square_frontend.py`

Artifacts:
- Work directory: `student/work/ex270_ex274_frontend_square_structures_20260609_1138_smoke2`
- Candidates CSV: `student/runs/integer/ex270_ex274_frontend_square_structures_20260609_1138_smoke2/results/candidates.csv`
- Best CSV: `student/runs/integer/ex270_ex274_frontend_square_structures_20260609_1138_smoke2/results/best.csv`
- Summary CSV: `student/runs/integer/ex270_ex274_frontend_square_structures_20260609_1138_smoke2/results/summary.csv`

Methods tried:
- Exact unsigned square semantics verified from truth tables.
- Direct square, triangular partial-product sums, square-only Wallace/Dadda compression, hybrid prefix final adders, and low/high decompositions.
- Limited Yosys frontend synthflow and `abc -g aig` delay settings only.

Best result:
- See `results/best.csv`.

Notes:
- Every retained AIG row is checked with ABC CEC against `read_truth -xf` through `evaluate_aig`.
- No backend optimization portfolio was run.
- No seed bundle was curated for this partial class batch.

Run totals:
- candidates: 6
- equivalent: 6
- best cases: 1
