# ex280_ex284_frontend_muxcoord_full_20260609_0117

Run ID: `ex280_ex284_frontend_muxcoord_full_20260609_0117`

Purpose: Full ex280-ex284 replay of full-width mux-coordinate degree-2 ANF sources.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_muxcoord_anf_search.py`
- Coordinate modes: `full_mod`, `full_clamp`, `full_wrap_low_zero_high`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_muxcoord_full_20260609_0117/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_full_20260609_0117/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_full_20260609_0117/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_full_20260609_0117/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_full_20260609_0117/results/evaluate_check.csv`

Methods tried:
- Degree-2 ANF over full-width nonlinear mux-coordinate extensions.
- No residual Davio logic; all bits solved directly by the coordinate basis.

Best result:
- Raw bests: `ex280 373/25/9325`, `ex281 405/33/13365`, `ex282 408/31/12648`, `ex283 467/37/17279`, `ex284 580/35/20300`.

Notes:
- Official evaluate/equivalence replay was `15/15` exact.
- This superseded the residual-Davio hybrid for `ex280` and `ex282` before synthflow, but grouped factorization later superseded this run.
