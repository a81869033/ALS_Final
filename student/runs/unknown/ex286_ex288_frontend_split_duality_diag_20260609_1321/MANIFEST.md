# ex286_ex288_frontend_split_duality_diag_20260609_1321

Run ID: `ex286_ex288_frontend_split_duality_diag_20260609_1321`

Purpose: Test whether `ex286-ex288` have an ex289-like split-domain duality or self-reduction that can halve the source domain.

Inputs:
- Truth files: `benchmarks/ex286.truth`, `benchmarks/ex287.truth`, `benchmarks/ex288.truth`
- Sanity truth file: `benchmarks/ex289.truth`
- Script: `student/scripts/unknown_split_duality_diag.py`

Artifacts:
- Work directory: `student/work/ex286_ex288_frontend_split_duality_diag_20260609_1321/`
- Diagnostics CSV: `student/runs/unknown/ex286_ex288_frontend_split_duality_diag_20260609_1321/results/split_duality_diagnostics.csv`
- ex289 sanity CSV: `student/runs/unknown/ex286_ex288_frontend_split_duality_diag_20260609_1321/results/split_duality_ex289_sanity.csv`
- Summary CSV: `student/runs/unknown/ex286_ex288_frontend_split_duality_diag_20260609_1321/results/summary.csv`
- Candidates CSV: `student/runs/unknown/ex286_ex288_frontend_split_duality_diag_20260609_1321/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex286_ex288_frontend_split_duality_diag_20260609_1321/results/best.csv`
- Evaluate check CSV: `student/runs/unknown/ex286_ex288_frontend_split_duality_diag_20260609_1321/results/evaluate_check.csv`

Methods Tried:
- Split every input bit and compare the split-zero half to the split-one half under input transforms: complement all bits, complement all except split bit, reverse, reverse plus complement, and reverse plus complement except split bit.
- Output transforms: identity, complement, reverse, complement-reverse, known pair swap, and complement pair swap.
- ex289 sanity check used the same transform family.

Best Result:
- `ex286`: best `32/2048` matches, no exact relation.
- `ex287`: best `228/8192` matches, no exact relation.
- `ex288`: best `66/8192` matches, no exact relation.
- `ex289` sanity: exact `32768/32768` for `comp_all -> comp_reverse`, confirming the diagnostic catches known duality.

Notes:
- No Verilog/AIG seed was emitted.
- This rejects the tested ex289-style split-domain duality/self-reduction for `ex286-ex288`.
