# ex273_ex274_frontend_square_highgap_struct_20260609_1738

Run ID: `ex273_ex274_frontend_square_highgap_struct_20260609_1738`

Purpose: targeted frontend-only high-gap integer structure probes for `ex266`, `ex267`, `ex273`, `ex274`, and `ex276`.

Inputs:
- Truth files: `benchmarks/exNNN.truth`
- Case notes: `student/cases/ex255_ex279_integer_arithmetic/`
- Generator/script: `student/generators/integer_highgap_structures.py`

Artifacts:
- Work directory: `student/work/ex273_ex274_frontend_square_highgap_struct_20260609_1738`
- Candidates CSV: `student/runs/integer/ex273_ex274_frontend_square_highgap_struct_20260609_1738/results/candidates.csv`
- Best CSV: `student/runs/integer/ex273_ex274_frontend_square_highgap_struct_20260609_1738/results/best.csv`
- Summary CSV: `student/runs/integer/ex273_ex274_frontend_square_highgap_struct_20260609_1738/results/summary.csv`

Methods tried:
- UDIV: additional magnitude cofactor word-mux selectors beyond the previous best keys.
- Square: full-width balanced CSA rows, half-product decomposition, and pairwise adder trees.
- ISQRT: hand high-bit formulas combined with prefix-ge low bits, plus a balanced square-threshold word tree.

Notes:
- Every AIG row is exact-checked against the official truth table convention through `evaluate_aig`.
- This is frontend seed synthesis only; no backend optimization portfolio was run.
- No `student/seeds` bundle is updated by this partial follow-up.

Run totals:
- candidates: 36
- equivalent: 24
- best cases: 2
