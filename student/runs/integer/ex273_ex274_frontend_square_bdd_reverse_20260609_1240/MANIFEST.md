# ex273_ex274_frontend_square_bdd_reverse_20260609_1240

Run ID: `ex273_ex274_frontend_square_bdd_reverse_20260609_1240`

Purpose: synthesize full-output reverse-order BDDs for ex273/ex274 as a delay/area diagnostic.

Inputs:
- Truth files: `benchmarks/ex273.truth`, `benchmarks/ex274.truth`
- Generator/script: `student/generators/unknown_bdd_search.py`

Artifacts:
- Work directory: `student/work/ex273_ex274_frontend_square_bdd_reverse_20260609_1240/`
- Candidates CSV: `student/runs/integer/ex273_ex274_frontend_square_bdd_reverse_20260609_1240/results/candidates.csv`
- Best CSV: `student/runs/integer/ex273_ex274_frontend_square_bdd_reverse_20260609_1240/results/best.csv`

Methods tried:
- Full-output shared BDD with reverse input order.

Best result:
- ex273: `10671/25/266775`
- ex274: `31130/28/871640`

Notes:
- Exact and lower delay than arithmetic seeds, but area was unusably high. This ruled out full BDD and led to selected high-bit BDD hybrids.
