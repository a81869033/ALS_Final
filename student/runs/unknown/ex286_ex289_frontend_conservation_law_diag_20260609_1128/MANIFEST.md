# ex286_ex289_frontend_conservation_law_diag_20260609_1128

- Scope: diagnostic-only linear conservation-law check for ex286-ex289.
- Work dir: diagnostic-only; no work seed directory.
- Results dir: `student/runs/unknown/ex286_ex289_frontend_conservation_law_diag_20260609_1128/results/`
- Seeds policy: no updates under `student/seeds`.
- Output policy: no writes under `output/`.
- Hypothesis: if the conservative maps decompose into independent lanes/blocks, there should be additional linear count invariants beyond global Hamming weight.
- Result: over mod 2/3/5/7, nullity is 1 for every case; the only linear invariant is global popcount.
- Artifacts: `conservation_law_diagnostics.csv`, empty `candidates.csv`, empty `best.csv`, empty `summary.csv`, empty `evaluate_check.csv`.
