# ex286_ex288_frontend_bucket_ltf_diag_20260609_1328

Run ID: `ex286_ex288_frontend_bucket_ltf_diag_20260609_1328`

Purpose: Test whether output bits are linear-threshold functions over the exact bucket-count semantic features.

Inputs:
- Truth files: `benchmarks/ex286.truth`, `benchmarks/ex287.truth`, `benchmarks/ex288.truth`
- Script: `student/scripts/unknown_bucket_ltf_diag.py`

Artifacts:
- Work directory: `student/work/ex286_ex288_frontend_bucket_ltf_diag_20260609_1328/`
- Diagnostics CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_ltf_diag_20260609_1328/results/bucket_ltf_diagnostics.csv`
- Summary CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_ltf_diag_20260609_1328/results/summary.csv`
- Candidates CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_ltf_diag_20260609_1328/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_ltf_diag_20260609_1328/results/best.csv`
- Evaluate check CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_ltf_diag_20260609_1328/results/evaluate_check.csv`

Methods Tried:
- Features: bias, exact one-hot-derived bucket counts, selected disambiguation bits from the exact count-key model, and pairwise count differences.
- Per-output-bit perceptron training for `40` epochs.

Best Result:
- `ex286`: no exact bits; best bit `8` matched `4805/8192`.
- `ex287`: no exact bits; best bit `5` matched `9045/16384`.
- `ex288`: no exact bits; best bit `7` matched `19487/32768`.

Notes:
- No Verilog/AIG seed was emitted.
- This rejects simple linear-threshold/comparator formulas over the exact bucket-count semantic features as tested.
