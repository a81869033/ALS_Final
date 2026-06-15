# ex240_ex299_frontend_gt2_round28_20260613_0650

Run ID: `ex240_ex299_frontend_gt2_round28_20260613_0650`

Purpose: local frontend synth-flow micro search for remaining FP8 cases whose
frontend/reference ratio is still greater than 2, prioritizing cases close to
the threshold.

Scope:
- `local-synthflow-r28`: `ex249`, `ex241`, `ex242`, `ex244`, `ex240`

Verification:
- Every candidate must be rechecked by repo `evaluate.py`.

Notes:
- No `student/seeds` curation is performed.
- This round treats ABC/Yosys command changes as frontend synthesis-flow
  variants of the current frontend AIG/Verilog source, not as accepted
  backend portfolio results.
