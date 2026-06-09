# ex273_ex274_square_large_csel_20260609_1138

Run ID: `ex273_ex274_square_large_csel_20260609_1138`

Purpose: frontend-only square-specific structures for `ex270-ex274`.

Inputs:
- Truth files: `benchmarks/ex270.truth` through `benchmarks/ex274.truth`
- Previous notes: `student/cases/ex255_ex279_integer_arithmetic/README.md`
- Generator/script: `student/generators/integer_ex270_ex274_square_frontend.py`

Artifacts:
- Work directory: `student/work/ex273_ex274_square_large_csel_20260609_1138`
- Candidates CSV: `student/runs/integer/ex273_ex274_square_large_csel_20260609_1138/results/candidates.csv`
- Best CSV: `student/runs/integer/ex273_ex274_square_large_csel_20260609_1138/results/best.csv`
- Summary CSV: `student/runs/integer/ex273_ex274_square_large_csel_20260609_1138/results/summary.csv`

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
- candidates: 48
- equivalent: 48
- best cases: 2
