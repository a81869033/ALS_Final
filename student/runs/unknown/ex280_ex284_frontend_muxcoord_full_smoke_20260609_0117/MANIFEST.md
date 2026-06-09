# ex280_ex284_frontend_muxcoord_full_smoke_20260609_0117

Run ID: `ex280_ex284_frontend_muxcoord_full_smoke_20260609_0117`

Purpose: Smoke-test full-width extensions of the nonlinear mux-coordinate basis on `ex280` and `ex284`.

Inputs:
- Truth files: `benchmarks/ex280.truth`, `benchmarks/ex284.truth`
- Generator: `student/generators/unknown_muxcoord_anf_search.py`
- Coordinate modes: `full_mod`, `full_clamp`, `full_wrap_low_zero_high`

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_muxcoord_full_smoke_20260609_0117/`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_full_smoke_20260609_0117/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_full_smoke_20260609_0117/results/best.csv`
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_full_smoke_20260609_0117/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_muxcoord_full_smoke_20260609_0117/results/evaluate_check.csv`

Methods tried:
- Extended the original `mc[i] = key[i] ? (key[n-2-i] ^ key[n-1-i]) : key[i+1]` coordinate recurrence to all `n` positions.
- Solved all output bits using degree-2 ANF over the extended coordinates and boundary key bits.

Best result:
- `ex280`: `373/25/9325` with `full_mod`.
- `ex284`: `580/35/20300` with `full_wrap_low_zero_high`.

Notes:
- Smoke confirmed the residual Davio bits can be removed by full-width coordinate extension.
- Formal full replay is in `ex280_ex284_frontend_muxcoord_full_20260609_0117`.
