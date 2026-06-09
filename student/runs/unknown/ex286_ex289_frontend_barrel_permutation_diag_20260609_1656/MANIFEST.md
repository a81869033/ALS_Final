# ex286_ex289_frontend_barrel_permutation_diag_20260609_1656

Run ID: `ex286_ex289_frontend_barrel_permutation_diag_20260609_1656`

Purpose: Test whether ex286-ex289 are low-area conservative barrel permutations, such as fixed rotations, bit-reversal plus rotation, rotate-by-popcount, or rotate-by-small-control fields.

Inputs:
- Truth files: `benchmarks/ex286.truth` through `benchmarks/ex289.truth`
- Inline full-truth diagnostic.

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex289_frontend_barrel_permutation_diag_20260609_1656/results/`
- Summary CSV: `results/summary.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Methods tried:
- Fixed left/right rotations.
- Bit-reversal plus rotation.
- Left/right rotation by scaled popcount.
- Left/right rotation by low/high small control fields.

Best result:
- Diagnostic only; no Verilog/AIG candidates emitted.
- Best row matches were only `82/8192`, `107/16384`, `138/32768`, and `162/65536`.

Notes:
- These cases are not direct barrel-shifter/permutation-by-small-control functions as tested.
