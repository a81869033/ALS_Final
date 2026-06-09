# ex256_ex257_frontend_umul_csa_order_cla_20260609_0137

Run ID: `ex256_ex257_frontend_umul_csa_order_cla_20260609_0137`

Purpose: focused frontend-only unsigned multiplier structures for `ex255-ex259`, with priority on ex256 delay.

Inputs:
- Truth files: `benchmarks/ex255.truth` through `benchmarks/ex259.truth`
- Previous notes: `student/cases/ex255_ex279_integer_arithmetic/ex255-259/frontend_attempts.md`
- Generator/script: `student/generators/integer_ex255_ex259_mul_focused_structures.py`

Artifacts:
- Work directory: `student/work/ex256_ex257_frontend_umul_csa_order_cla_20260609_0137`
- Candidates CSV: `student/runs/integer/ex256_ex257_frontend_umul_csa_order_cla_20260609_0137/results/candidates.csv`
- Best CSV: `student/runs/integer/ex256_ex257_frontend_umul_csa_order_cla_20260609_0137/results/best.csv`
- Summary CSV: `student/runs/integer/ex256_ex257_frontend_umul_csa_order_cla_20260609_0137/results/summary.csv`

Methods tried:
- Column carry-state case logic, split block products, small block case multipliers, odd Karatsuba, sorted-operand constant multiply, and low/direct high correction.
- Limited Yosys frontend synth scripts including strict delay targets around ex256 reference delay.

Best result:
- See `results/best.csv`.

Notes:
- Every AIG row is checked with ABC CEC against `read_truth -xf` through `evaluate_aig`.
- No backend optimization portfolio was run.

Run totals:
- candidates: 48
- equivalent: 48
- best cases: 2
