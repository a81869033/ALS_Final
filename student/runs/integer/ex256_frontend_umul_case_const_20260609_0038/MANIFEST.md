# ex256_frontend_umul_case_const_20260609_0038

Run ID: `ex256_frontend_umul_case_const_20260609_0038`

Purpose: deep frontend-only unsigned multiplier seeds for `ex255-ex259`.

Inputs:
- Truth files: `benchmarks/ex255.truth` through `benchmarks/ex259.truth`
- Existing baseline: `student/runs/integer/ex255_ex279_current/results/candidates.csv`
- Generator/script: `student/generators/integer_ex255_ex259_mul_frontend.py`

Artifacts:
- Work directory: `student/work/ex256_frontend_umul_case_const_20260609_0038`
- Candidates CSV: `student/runs/integer/ex256_frontend_umul_case_const_20260609_0038/results/candidates.csv`
- Best CSV: `student/runs/integer/ex256_frontend_umul_case_const_20260609_0038/results/best.csv`
- Summary CSV: `student/runs/integer/ex256_frontend_umul_case_const_20260609_0038/results/summary.csv`

Methods tried:
- Narrow/context multiply source, wide zero-extend recheck, balanced row addition, vector CSA, column-carry, operand-case constant multiply, split-half, Karatsuba when applicable, and sorted operands.
- Limited Yosys frontend synth scripts: default, explicit `wreduce`, `abc -g aig`, arithmetic/wreduce/share, and `synth` preset.

Best result:
- See `results/best.csv` for one row per case.

Notes:
- Every retained AIG row is checked with ABC CEC against `read_truth -xf` through `evaluate_aig`.
- No backend optimization portfolio was run.

Run totals:
- candidates: 5
- equivalent: 5
- best cases: 1
