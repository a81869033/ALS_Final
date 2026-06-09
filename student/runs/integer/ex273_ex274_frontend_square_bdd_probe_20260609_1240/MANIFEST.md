# ex273_ex274_frontend_square_bdd_probe_20260609_1240

Run ID: `ex273_ex274_frontend_square_bdd_probe_20260609_1240`

Purpose: emit-only shared-BDD node-count diagnostic for ex273/ex274 square high-delay outliers.

Inputs:
- Truth files: `benchmarks/ex273.truth`, `benchmarks/ex274.truth`
- Generator/script: `student/generators/unknown_bdd_search.py`

Artifacts:
- Work directory: `student/work/ex273_ex274_frontend_square_bdd_probe_20260609_1240/`
- Candidates CSV: `student/runs/integer/ex273_ex274_frontend_square_bdd_probe_20260609_1240/results/candidates.csv`
- Best CSV: `student/runs/integer/ex273_ex274_frontend_square_bdd_probe_20260609_1240/results/best.csv`

Methods tried:
- Shared BDDs for full square outputs with natural, reverse, and outside-style variable orders.
- Emit-only; no AIG synthesis in this diagnostic run.

Best result:
- No synthesized best row. Reverse order had the smallest tested node counts: ex273 5591 nodes, ex274 16426 nodes.

Notes:
- This run motivated limited reverse-BDD synthesis and later selected high-bit BDD hybrids.
