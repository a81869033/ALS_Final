# ex260_ex264_frontend_smul_baugh_signbit_20260609_0314

Run ID: `ex260_ex264_frontend_smul_baugh_signbit_20260609_0314`

Purpose: deep frontend-only signed multiplier seeds for `ex260-ex264`.

Inputs:
- Truth files: `benchmarks/ex260.truth` through `benchmarks/ex264.truth`
- Existing baseline: `student/runs/integer/ex255_ex279_current/results/candidates.csv`
- Generator/script: `student/generators/integer_ex260_ex264_signed_mul_frontend.py`

Artifacts:
- Work directory: `student/work/ex260_ex264_frontend_smul_baugh_signbit_20260609_0314`
- Candidates CSV: `student/runs/integer/ex260_ex264_frontend_smul_baugh_signbit_20260609_0314/results/candidates.csv`
- Best CSV: `student/runs/integer/ex260_ex264_frontend_smul_baugh_signbit_20260609_0314/results/best.csv`
- Summary CSV: `student/runs/integer/ex260_ex264_frontend_smul_baugh_signbit_20260609_0314/results/summary.csv`

Methods tried:
- Direct signed multiply, sign/magnitude multiply, signed unsigned-product correction, Wallace/CSA unsigned core plus sign correction, radix-4 Booth, and split-half signed decomposition where applicable.
- Limited Yosys frontend synth scripts including `abc -g aig`, `wreduce`, arithmetic sharing, and target-delay synth presets.

Best result:
- See `results/best.csv` for one row per case.

Notes:
- Every retained AIG row is checked with ABC CEC against `read_truth -xf` through `evaluate_aig`.
- No backend optimization portfolio was run.

Run totals:
- candidates: 60
- equivalent: 60
- best cases: 3
