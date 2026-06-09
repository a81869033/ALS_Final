# ex275_ex279_frontend_isqrt_structures_20260609_1551

Run ID: `ex275_ex279_frontend_isqrt_structures_20260609_1551`

Purpose: frontend-only integer square-root structures for `ex275-ex279`.

Inputs:
- Truth files: `benchmarks/ex275.truth` through `benchmarks/ex279.truth`
- Previous notes: `student/cases/ex255_ex279_integer_arithmetic/README.md`
- Generator/script: `student/generators/integer_ex275_ex279_isqrt_frontend.py`

Artifacts:
- Work directory: `student/work/ex275_ex279_frontend_isqrt_structures_20260609_1551`
- Candidates CSV: `student/runs/integer/ex275_ex279_frontend_isqrt_structures_20260609_1551/results/candidates.csv`
- Best CSV: `student/runs/integer/ex275_ex279_frontend_isqrt_structures_20260609_1551/results/best.csv`
- Summary CSV: `student/runs/integer/ex275_ex279_frontend_isqrt_structures_20260609_1551/results/summary.csv`

Methods tried:
- Exact unsigned floor integer square-root semantics verified from truth tables.
- Direct trial-square loop, restoring sqrt, threshold/range classifiers, prefix range splits, small full-case tables, and shared BDDs.
- Limited Yosys frontend synthflow only; no backend optimization portfolio.

Best result:
- See `results/best.csv`.

Run totals:
- candidates: 201
- equivalent: 201
- best cases: 5
