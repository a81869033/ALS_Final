# ex286_ex289_frontend_affine_duality_base_diag_20260609_1936

Diagnostic-only complement/permutation duality CSP search.

Purpose: search for exact `f(P(~x)) = Q(~f(x))` relations with affine/index and known-pair-composed P/Q candidates. An exact hit would be a high-leverage half-domain frontend source analogous to the ex289 duality wrapper.

Inputs:
- Cases: `ex286,ex287,ex288,ex289`
- Sample gate: Hamming weight <= `2` and complements
- Script: `student/generators/unknown_affine_duality_csp_diag.py`

Artifacts:
- Results: `results/affine_duality_csp_diagnostics.csv`, `results/summary.csv`, `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Notes:
- Sanity passed: ex289 rediscovered the known exact `id|reverse`
  complement-duality relation.
- No ex286-ex288 exact relation was found. Best full-row matches were
  `140/8192`, `4252/16384`, and `4864/32768`, so this does not justify RTL
  seed generation for the target cases.
- `student/seeds` and `output/` are intentionally untouched.
