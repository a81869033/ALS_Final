# ex296_ex298_frontend_split_refine_20260608_1210

Run ID: `ex296_ex298_frontend_split_refine_20260608_1210`

Purpose: Test diagnostic-selected arbitrary-width split/default RTL for
`ex296` and `ex298`, because both cases had strong non-half split signals and
constant/low-support output bits.

Inputs:
- Truth files: `benchmarks/ex296.truth`, `benchmarks/ex298.truth`
- Diagnostic run: `student/runs/unknown/ex280_ex299_frontend_diagnostics_20260608_1105/`
- Generator/script: `student/generators/unknown_split_refine_search.py`

Artifacts:
- Work directory: `student/work/ex296_ex298_frontend_split_refine_20260608_1210/`
- Candidates CSV: `student/runs/unknown/ex296_ex298_frontend_split_refine_20260608_1210/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex296_ex298_frontend_split_refine_20260608_1210/results/best.csv`
- Summary CSV: `student/runs/unknown/ex296_ex298_frontend_split_refine_20260608_1210/results/summary.csv`
- Official evaluate.py recheck: `student/runs/unknown/ex296_ex298_frontend_split_refine_20260608_1210/results/evaluate_check.csv`

Methods tried:
- `ex296`: `rotate11_low12`, `rotate12_high12`, `rotate0_low12`
- `ex298`: `rotate13_low14`, `rotate14_high14`, `rotate11_low14`

Best result:
- `ex296`: `rotate11_low12`, `15543/18/279774`; exact but worse than current
  `high_split_default` at `9032/17/153544`.
- `ex298`: `rotate13_low14`, `58114/21/1220394`; exact but worse than current
  `rotate_high_split_default` at `34185/20/683700`.

Notes:
- Official `evaluate.py` replay passed for all 6 rows.
- These arbitrary-width split/default structures are `structural_exact`, but
  they do not improve ADP. Do not repeat the same split parameters without a
  new source rewrite, shared substructure, or selected-bit override.
