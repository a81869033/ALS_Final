# ex286_ex289_frontend_affine_duality_paircompose_exactsample_20260609_1942

Diagnostic-only complement/permutation duality CSP search.

Purpose: search for exact `f(P(~x)) = Q(~f(x))` relations with affine/index and known-pair-composed P/Q candidates. An exact hit would be a high-leverage half-domain frontend source analogous to the ex289 duality wrapper.

Inputs:
- Cases: `ex286,ex287,ex288,ex289`
- Sample gate: Hamming weight <= `2` and complements
- Script: `student/generators/unknown_affine_duality_csp_diag.py`

Artifacts:
- Results: `results/affine_duality_csp_diagnostics.csv`, `results/summary.csv`, `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Notes:
- Sanity passed: ex289 rediscovered the known exact `id|reverse` relation and
  known-pair-swap-equivalent variants.
- No ex286-ex288 candidate matched the low-weight sample exactly, so this
  rejects the tested pair-composed affine complement-duality family before RTL
  generation.
- `student/seeds` and `output/` are intentionally untouched.
