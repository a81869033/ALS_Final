# ex295_ex297_ex299_frontend_rot2_canonical_20260608_1150

Run ID: `ex295_ex297_ex299_frontend_rot2_canonical_20260608_1150`

Purpose: Test whether exact even-rotation equivariance in `ex295`, `ex297`,
and `ex299` can be exploited by canonicalizing the input under rotation by two
bits, table-looking up the canonical output, and rotating the result back.

Inputs:
- Truth files: `benchmarks/ex295.truth`, `benchmarks/ex297.truth`, `benchmarks/ex299.truth`
- Diagnostic evidence: `student/runs/unknown/ex280_ex299_frontend_diagnostics_20260608_1105/results/pattern_stats.csv`
- Generator/script: `student/generators/unknown_rotation_equiv_search.py`

Artifacts:
- Work directory: `student/work/ex295_ex297_ex299_frontend_rot2_canonical_20260608_1150/`
- Candidates CSV: `student/runs/unknown/ex295_ex297_ex299_frontend_rot2_canonical_20260608_1150/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex295_ex297_ex299_frontend_rot2_canonical_20260608_1150/results/best.csv`
- Summary CSV: `student/runs/unknown/ex295_ex297_ex299_frontend_rot2_canonical_20260608_1150/results/summary.csv`
- Official evaluate.py recheck: `student/runs/unknown/ex295_ex297_ex299_frontend_rot2_canonical_20260608_1150/results/evaluate_check.csv`

Methods tried:
- `rot2_canonical_case`: choose the lexicographically minimum even rotation, look up canonical output, rotate back.

Best result:
- `ex295`: `3517/85/298945`, exact but worse than current `8692/18/156456`.
- `ex297`: `10352/112/1159424`, exact but worse than current `32553/21/683613`.
- `ex299`: `33880/128/4336640`, exact but worse than current `118808/24/2851392`.

Notes:
- Official `evaluate.py` replay passed for all 3 rows.
- The source-level canonical-min comparator creates excessive delay. Do not repeat this exact form.
- Future rotation-equivariant work should avoid dynamic canonical-min selection; try local orbit sharing, fixed phase decomposition, or hand-derived pair-ring logic instead.
