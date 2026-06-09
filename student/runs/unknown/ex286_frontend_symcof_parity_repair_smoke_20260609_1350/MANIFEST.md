# ex286_frontend_symcof_parity_repair_smoke_20260609_1350

Run ID: `ex286_frontend_symcof_parity_repair_smoke_20260609_1350`

Purpose: smoke-test a conservation-parity source rewrite for ex286. The
candidate omits one BDD output bit and reconstructs it as
`(^in) ^ (^known_out_bits)` using exact Hamming-weight preservation.

Inputs:
- Truth file: `benchmarks/ex286.truth`
- Generator: `student/generators/unknown_symmetry_cofactor_search.py`
- Added option: `--parity-repair-bits 0`

Artifacts:
- `results/candidates.csv`
- `results/best.csv`
- `results/summary.csv`
- `results/evaluate_check.csv`

Result:
- Exact and equivalent, but rejected for QoR: `area=1422`, `delay=24`,
  `ADP=34128`, worse than the current ex286 best `ADP=21705`.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
