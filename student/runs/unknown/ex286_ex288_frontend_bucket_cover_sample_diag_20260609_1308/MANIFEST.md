# ex286_ex288_frontend_bucket_cover_sample_diag_20260609_1308

Run ID: `ex286_ex288_frontend_bucket_cover_sample_diag_20260609_1308`

Purpose: Sample whether invalid-key don't-cares in the exact bucket-count key domain can form large implicant cubes for output-bit SOP covers.

Inputs:
- Truth files: `benchmarks/ex286.truth`, `benchmarks/ex287.truth`, `benchmarks/ex288.truth`
- Script: `student/scripts/unknown_bucket_cover_sample_diag.py`

Artifacts:
- Work directory: `student/work/ex286_ex288_frontend_bucket_cover_sample_diag_20260609_1308/`
- Diagnostics CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_cover_sample_diag_20260609_1308/results/bucket_cover_sample_diagnostics.csv`
- Summary CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_cover_sample_diag_20260609_1308/results/summary.csv`
- Candidates CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_cover_sample_diag_20260609_1308/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_cover_sample_diag_20260609_1308/results/best.csv`
- Evaluate check CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_cover_sample_diag_20260609_1308/results/evaluate_check.csv`

Methods Tried:
- For each output bit, sampled up to `256` reachable on-keys in the compact bucket-count key domain.
- Greedily expanded each seed cube while avoiding reachable off-keys; invalid keys were treated as don't-care.
- Reported maximum sampled on-key coverage, literal count, and a lower bound on cube count.

Best Result:
- `ex286`: sampled cubes cover up to `144` on-keys with `5` literals; lower-bound cube counts `16..17`.
- `ex287`: sampled cubes cover up to `192` on-keys with `5` literals; lower-bound cube counts `18..48`.
- `ex288`: sampled cubes cover up to `576` on-keys with `4` literals; lower-bound cube counts `12..64`.

Notes:
- This is not a complete exact cover and emitted no Verilog/AIG seed.
- It is a follow-up signal that optimized exact cube cover over the compact key domain might be worth a better bitset implementation, especially for `ex288`.
- A naive full greedy cover implementation was too slow and should not be treated as a formal result.
