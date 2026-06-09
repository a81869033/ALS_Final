# ex288_frontend_bucket_cover_exact_limited_20260609_1314

Run ID: `ex288_frontend_bucket_cover_exact_limited_20260609_1314`

Purpose: Follow up the sampled bucket-key cube-cover signal for `ex288` with a bitset exact greedy cover using bounded representative candidate cubes.

Inputs:
- Truth file: `benchmarks/ex288.truth`
- Script: `student/scripts/unknown_bucket_cover_exact.py`

Artifacts:
- Work directory: `student/work/ex288_frontend_bucket_cover_exact_limited_20260609_1314/`
- Diagnostics CSV: `student/runs/unknown/ex288_frontend_bucket_cover_exact_limited_20260609_1314/results/bucket_cover_exact_limited.csv`
- Summary CSV: `student/runs/unknown/ex288_frontend_bucket_cover_exact_limited_20260609_1314/results/summary.csv`
- Candidates CSV: `student/runs/unknown/ex288_frontend_bucket_cover_exact_limited_20260609_1314/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex288_frontend_bucket_cover_exact_limited_20260609_1314/results/best.csv`
- Evaluate check CSV: `student/runs/unknown/ex288_frontend_bucket_cover_exact_limited_20260609_1314/results/evaluate_check.csv`

Methods Tried:
- Compact bucket-count key domain for `ex288`.
- Invalid keys treated as don't-care by only excluding reachable off-keys.
- Exact greedy cover with at most `512` representative expanded candidate cubes per output bit, using singleton fallback for uncovered on-keys.

Best Result:
- Complete cover was produced diagnostically for all `15` bits, but cover size was too large: `637..2524` cubes and `9030..37758` literals per bit.
- No Verilog/AIG seed emitted.

Notes:
- This rejects a straightforward SOP seed from the sampled cube-cover direction for `ex288`.
- The script is useful only with candidate limits; do not rerun unbounded cover in Python.
