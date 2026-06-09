# ex260_frontend_smul_alt_replay_20260609_1812

Run ID: `ex260_frontend_smul_alt_replay_20260609_1812`

Purpose: deep frontend-only signed multiplier seeds for `ex260-ex264`.

Inputs:
- Truth files: `benchmarks/ex260.truth` through `benchmarks/ex264.truth`
- Existing baseline: `student/runs/integer/ex255_ex279_current/results/candidates.csv`
- Generator/script: `student/generators/integer_ex260_ex264_signed_mul_frontend.py`

Artifacts:
- Work directory: `student/work/ex260_frontend_smul_alt_replay_20260609_1812`
- Candidates CSV: `student/runs/integer/ex260_frontend_smul_alt_replay_20260609_1812/results/candidates.csv`
- Best CSV: `student/runs/integer/ex260_frontend_smul_alt_replay_20260609_1812/results/best.csv`
- Summary CSV: `student/runs/integer/ex260_frontend_smul_alt_replay_20260609_1812/results/summary.csv`

Methods tried:
- Direct signed multiply, sign/magnitude multiply, signed unsigned-product correction, Wallace/CSA unsigned core plus sign correction, radix-4 Booth, and split-half signed decomposition where applicable.
- Limited Yosys frontend synth scripts including `abc -g aig`, `wreduce`, arithmetic sharing, and target-delay synth presets.

Best result:
- See `results/best.csv` for one row per case.

Notes:
- Every retained AIG row is checked with ABC CEC against `read_truth -xf` through `evaluate_aig`.
- No backend optimization portfolio was run.

Run totals:
- candidates: 30
- equivalent: 29
- best cases: 1
