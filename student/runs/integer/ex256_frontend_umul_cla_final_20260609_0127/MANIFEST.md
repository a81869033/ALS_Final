# ex256_frontend_umul_cla_final_20260609_0127

Run ID: `ex256_frontend_umul_cla_final_20260609_0127`

Purpose: focused frontend-only unsigned multiplier structures for `ex255-ex259`, with priority on ex256 delay.

Inputs:
- Truth files: `benchmarks/ex255.truth` through `benchmarks/ex259.truth`
- Previous notes: `student/cases/ex255_ex279_integer_arithmetic/ex255-259/frontend_attempts.md`
- Generator/script: `student/generators/integer_ex255_ex259_mul_focused_structures.py`

Artifacts:
- Work directory: `student/work/ex256_frontend_umul_cla_final_20260609_0127`
- Candidates CSV: `student/runs/integer/ex256_frontend_umul_cla_final_20260609_0127/results/candidates.csv`
- Best CSV: `student/runs/integer/ex256_frontend_umul_cla_final_20260609_0127/results/best.csv`
- Summary CSV: `student/runs/integer/ex256_frontend_umul_cla_final_20260609_0127/results/summary.csv`

Methods tried:
- Column carry-state case logic, split block products, small block case multipliers, odd Karatsuba, sorted-operand constant multiply, and low/direct high correction.
- Limited Yosys frontend synth scripts including strict delay targets around ex256 reference delay.

Best result:
- See `results/best.csv`.

Notes:
- Every AIG row is checked with ABC CEC against `read_truth -xf` through `evaluate_aig`.
- No backend optimization portfolio was run.

Run totals:
- candidates: 20
- equivalent: 20
- best cases: 1
