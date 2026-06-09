# ex266_ex267_ex269_frontend_udiv_radix_narrow_20260609_1125

Run ID: `ex266_ex267_ex269_frontend_udiv_radix_narrow_20260609_1125`

Purpose: frontend-only unsigned division seeds for `ex265-ex269`.

Inputs:
- Truth files: `benchmarks/ex265.truth` through `benchmarks/ex269.truth`
- Existing baseline: `student/runs/integer/ex255_ex279_current/results/candidates.csv`
- Generator/script: `student/generators/integer_ex265_ex269_udiv_frontend.py`

Artifacts:
- Work directory: `student/work/ex266_ex267_ex269_frontend_udiv_radix_narrow_20260609_1125`
- Candidates CSV: `student/runs/integer/ex266_ex267_ex269_frontend_udiv_radix_narrow_20260609_1125/results/candidates.csv`
- Best CSV: `student/runs/integer/ex266_ex267_ex269_frontend_udiv_radix_narrow_20260609_1125/results/best.csv`
- Summary CSV: `student/runs/integer/ex266_ex267_ex269_frontend_udiv_radix_narrow_20260609_1125/results/summary.csv`

Methods tried:
- Direct guarded division, safe-divisor source rewrite, greater-than-zero guard, narrow restoring divider, constant-denominator manual paths, dividend-range classifiers, quotient threshold classifiers, and small-divisor fast paths.
- Limited Yosys frontend synth scripts from the existing integer flow.

Notes:
- Every retained AIG row is checked against the official truth table convention through `evaluate_aig`.
- No backend optimization portfolio was run.
- No `student/seeds` bundle is updated in this partial batch.

Run totals:
- candidates: 27
- equivalent: 27
- best cases: 3
