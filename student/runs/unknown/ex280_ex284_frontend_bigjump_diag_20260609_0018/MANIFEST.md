# ex280_ex284_frontend_bigjump_diag_20260609_0018

Run ID: `ex280_ex284_frontend_bigjump_diag_20260609_0018`

Purpose: Test only high-leverage semantic/structural hypotheses for ex280-ex284 after grouped prefix-Davio, avoiding small ADP-tuning directions.

Inputs:
- Truth files: `benchmarks/ex280.truth` through `benchmarks/ex284.truth`
- Current best CSV: `student/results/current_best_by_case.csv`
- Diagnostics: prefix-key ANF, word-level shift basis solve, fixed-polarity RM term counts, residual-state counts, ABC DSD probe

Artifacts:
- Work directory: `student/work/ex280_ex284_frontend_bigjump_diag_20260609_0018/`
- Semantic checks CSV: `student/runs/unknown/ex280_ex284_frontend_bigjump_diag_20260609_0018/results/semantic_checks.csv`
- Candidates CSV: `student/runs/unknown/ex280_ex284_frontend_bigjump_diag_20260609_0018/results/candidates.csv` (empty; diagnostic-only)
- Best CSV: `student/runs/unknown/ex280_ex284_frontend_bigjump_diag_20260609_0018/results/best.csv` (empty; no emitted seed)
- Summary CSV: `student/runs/unknown/ex280_ex284_frontend_bigjump_diag_20260609_0018/results/summary.csv` (empty; no emitted seed)
- Evaluate check CSV: `student/runs/unknown/ex280_ex284_frontend_bigjump_diag_20260609_0018/results/evaluate_check.csv` (empty; no emitted seed)

Methods tried:
- Anchored elementary-symmetric prefix/suffix scan exact solve.
- Edge-fixed local range feature scan coverage diagnostic.
- Word-level shifted-key AND/XOR exact span check.
- Fixed-polarity Reed-Muller polarity flips and a small random-polarity sample over prefix key.
- Output id/reverse alignment for masked word-pattern counts.
- Small prefix-key scan-state residual diagnostic.
- ABC DSD probe from direct truth AIG.
- Reverse-output `5*x` style arithmetic comparison.

Best result:
- No candidate emitted. Every checked family failed to show the kind of exact compact signal needed for a reference-scale frontend structure.

Notes:
- This run intentionally does not update `student/seeds` and does not write `output/`.
- The strongest active seed family remains grouped/full prefix-Davio with limited `abc_g_aig`; this diagnostic narrows the next big-structure search toward a nontrivial recurrence/basis rather than simple word ops or global polarity.
