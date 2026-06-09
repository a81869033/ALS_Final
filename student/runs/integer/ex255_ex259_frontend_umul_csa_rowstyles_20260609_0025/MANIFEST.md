# ex255_ex259_frontend_umul_csa_rowstyles_20260609_0025

Run ID: `ex255_ex259_frontend_umul_csa_rowstyles_20260609_0025`

Purpose: deep frontend-only unsigned multiplier seeds for `ex255-ex259`.

Inputs:
- Truth files: `benchmarks/ex255.truth` through `benchmarks/ex259.truth`
- Existing baseline: `student/runs/integer/ex255_ex279_current/results/candidates.csv`
- Generator/script: `student/generators/integer_ex255_ex259_mul_frontend.py`

Artifacts:
- Work directory: `student/work/ex255_ex259_frontend_umul_csa_rowstyles_20260609_0025`
- Candidates CSV: `student/runs/integer/ex255_ex259_frontend_umul_csa_rowstyles_20260609_0025/results/candidates.csv`
- Best CSV: `student/runs/integer/ex255_ex259_frontend_umul_csa_rowstyles_20260609_0025/results/best.csv`
- Summary CSV: `student/runs/integer/ex255_ex259_frontend_umul_csa_rowstyles_20260609_0025/results/summary.csv`

Methods tried:
- Narrow/context multiply source, wide zero-extend recheck, balanced row addition, vector CSA, column-carry, operand-case constant multiply, split-half, Karatsuba when applicable, and sorted operands.
- Limited Yosys frontend synth scripts: default, explicit `wreduce`, `abc -g aig`, arithmetic/wreduce/share, and `synth` preset.

Best result:
- See `results/best.csv` for one row per case.

Notes:
- Every retained AIG row is checked with ABC CEC against `read_truth -xf` through `evaluate_aig`.
- No backend optimization portfolio was run.

Run totals:
- candidates: 90
- equivalent: 90
- best cases: 5
