# ex280_ex284_frontend_muxcoord_keychain_simplified_20260609_0142

Run ID: `ex280_ex284_frontend_muxcoord_keychain_simplified_20260609_0142`

Purpose: Full ex280-ex284 replay of incremental keychain plus simplified full-clamp grouped coordinates.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_muxcoord_anf_search.py`
- Transform: `prefix_parity`
- Coordinate mode: `full_clamp_simplified`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_muxcoord_keychain_simplified_20260609_0142/`
- Results: `student/runs/unknown/ex280_ex284_frontend_muxcoord_keychain_simplified_20260609_0142/results/`

Best result:
- Raw bests are in `results/best.csv`.

Notes:
- Official replay was `5/5` exact.
- This source reduces selected key-prefix sharing differently from `prefix_parity_reduce`.
