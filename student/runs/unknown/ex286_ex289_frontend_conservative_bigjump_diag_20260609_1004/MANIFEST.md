# ex286_ex289_frontend_conservative_bigjump_diag_20260609_1004

Run ID: `ex286_ex289_frontend_conservative_bigjump_diag_20260609_1004`

Purpose: Diagnostic-only search for high-leverage conservative structures in
ex286-ex289.  The tests target structures that could plausibly beat BDD/cofactor
ADP by a large margin: insertion recurrences, small-slot matching/parking,
generalized symmetry, layer-rank transforms, independent block scatter, and
prefix-count transport.

Inputs:
- Truth files: benchmarks/ex286.truth, benchmarks/ex287.truth, benchmarks/ex288.truth, benchmarks/ex289.truth
- Script: `student/generators/unknown_conservative_bigjump_diag.py`

Artifacts:
- Results: `student/runs/unknown/ex286_ex289_frontend_conservative_bigjump_diag_20260609_1004/results/conservative_bigjump_diagnostics.csv`

Best result:
- Diagnostic-only run; no Verilog/AIG candidates generated.

Notes:
- Output-mask-only insertion recurrences had large conflicts in every case.
- Small-slot matching/parking remained far from exact even with cap8 candidate
  slots per input bit.
- Generalized input/output permutation symmetry found only the previously known
  invariant input swaps.
- Simple layer-rank maps, independent 4-bit block scatter, and simple
  prefix/suffix count transport did not expose reference-scale structure.
- A narrow ex286 ABC DSD strash probe produced `5283/24`, much worse than the
  current `1447/15/21705` seed.
- `student/seeds` and `output/` are intentionally untouched.
