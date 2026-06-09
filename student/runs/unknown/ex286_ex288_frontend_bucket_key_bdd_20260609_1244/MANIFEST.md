# ex286_ex288_frontend_bucket_key_bdd_20260609_1244

Run ID: `ex286_ex288_frontend_bucket_key_bdd_20260609_1244`

Purpose: Decompose the exact bucket-count key-to-output function with shared BDDs over the compact key domain, instead of emitting a flat key table.

Inputs:
- Truth files: `benchmarks/ex286.truth`, `benchmarks/ex287.truth`, `benchmarks/ex288.truth`
- Generator: `student/generators/unknown_bucket_key_bdd.py`
- Synthflow: `student/scripts/yosys_synthflow_variants.py`

Artifacts:
- Work directory: `student/work/ex286_ex288_frontend_bucket_key_bdd_20260609_1244/`
- Synthflow work directory: `student/work/ex286_ex288_frontend_bucket_key_bdd_synthflow_20260609_1244/`
- Diagnostics CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_key_bdd_20260609_1244/results/bucket_key_bdd_diagnostics.csv`
- Candidates CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_key_bdd_20260609_1244/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_key_bdd_20260609_1244/results/best.csv`
- Summary CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_key_bdd_20260609_1244/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_key_bdd_20260609_1244/results/evaluate_check.csv`

Methods Tried:
- Built shared BDDs over the exact bucket-count key domain with invalid keys defaulting to zero.
- Tested key-bit orders: natural, reverse, selectors-first, selectors-last, fields-lsb, and fields-msb.
- Emitted the best BDD order per case and ran limited `abc_g_aig` synthflow.

Best Result:
- `ex286`: selectors-first key BDD, `3616` nodes, exact `4244/23/97612`.
- `ex287`: selectors-first key BDD, `6322` nodes, exact `7852/27/212004`.
- `ex288`: selectors-first key BDD, `9273` nodes, exact `12839/25/320975`.

Notes:
- BDD decomposition substantially improves over flat bucket-key tables, but it remains far worse than current bests.
- This rejects straightforward shared BDD over the count-key domain as an active seed.
- If the bucket-count clue is revisited, it needs a stronger semantic factorization than BDD/table over the full key.
