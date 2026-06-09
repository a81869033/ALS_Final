# ex280_ex284_frontend_muxcoord_simplified_20260609_0142

Run ID: `ex280_ex284_frontend_muxcoord_simplified_20260609_0142`

Purpose: Full ex280-ex284 replay of `prefix_parity_reduce` plus simplified full-clamp grouped coordinates.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_muxcoord_anf_search.py`
- Coordinate mode: `full_clamp_simplified`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_muxcoord_simplified_20260609_0142/`
- Results: `student/runs/unknown/ex280_ex284_frontend_muxcoord_simplified_20260609_0142/results/`

Best result:
- Raw bests are in `results/best.csv`.

Notes:
- Official replay was `5/5` exact.
- Simplifies `key[j] ^ key[j+1]` branches to raw input bits in the emitted Verilog.
