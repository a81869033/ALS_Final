# ex268_ex269_frontend_udiv_lz_lowbdd_20260609_0935

Run ID: `ex268_ex269_frontend_udiv_lz_lowbdd_20260609_0935`

Purpose: frontend-only unsigned division seeds for `ex265-ex269`.

Inputs:
- Truth files: `benchmarks/ex265.truth` through `benchmarks/ex269.truth`
- Existing baseline: `student/runs/integer/ex255_ex279_current/results/candidates.csv`
- Generator/script: `student/generators/integer_ex265_ex269_udiv_frontend.py`

Artifacts:
- Work directory: `student/work/ex268_ex269_frontend_udiv_lz_lowbdd_20260609_0935`
- Candidates CSV: `student/runs/integer/ex268_ex269_frontend_udiv_lz_lowbdd_20260609_0935/results/candidates.csv`
- Best CSV: `student/runs/integer/ex268_ex269_frontend_udiv_lz_lowbdd_20260609_0935/results/best.csv`
- Summary CSV: `student/runs/integer/ex268_ex269_frontend_udiv_lz_lowbdd_20260609_0935/results/summary.csv`

Methods tried:
- Direct guarded division, safe-divisor source rewrite, greater-than-zero guard, narrow restoring divider, constant-denominator manual paths, dividend-range classifiers, quotient threshold classifiers, and small-divisor fast paths.
- Limited Yosys frontend synth scripts from the existing integer flow.

Notes:
- Every retained AIG row is checked against the official truth table convention through `evaluate_aig`.
- No backend optimization portfolio was run.
- No `student/seeds` bundle is updated in this partial batch.

Run totals:
- candidates: 10
- equivalent: 10
- best cases: 2
