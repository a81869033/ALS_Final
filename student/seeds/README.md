# Seed Bundles

This directory contains small, git-tracked seed bundles that are worth keeping
available from a fresh clone.

Large generated work directories remain under `student/work/` and may be
ignored by git.  A seed bundle should contain only curated Verilog/AIG files
that are useful as stable starting points or references.

For run history and full candidate CSVs, start from `student/runs/index.md`.

Primary bundles:

- `bf16/ex200_ex219_current/`: current best BF16 frontend seeds for
  `ex200`-`ex219`.
- `bf16/ex200_ex219_backend_candidates_20260608_1008/`: non-best BF16
  alternatives for `ex200`-`ex219`; use this as the secondary backend
  starting-point pool after the best-only bundle.
- `fp16/ex220_ex239_current/`: best-only FP16 bundle for `ex220`-`ex239`;
  exactly one current best verified Verilog/AIG seed per case.
- `fp16/ex220_ex239_backend_candidates_20260608_1008/`: non-best FP16
  alternatives for `ex220`-`ex239`; use this as the secondary backend
  starting-point pool after the best-only bundle.
- `integer/ex255_ex279_current/`: best-only integer arithmetic bundle for
  `ex255`-`ex279`; exactly one current best verified Verilog/AIG seed per case.
- `integer/ex255_ex279_backend_candidates_20260609_1809/`: non-best integer
  alternatives for `ex255`-`ex279`; exactly four verified alternatives per
  case for backend-start diversity after the best-only bundle.
- `unknown/ex280_ex299_current/`: best-only unknown bundle for `ex280`-`ex299`;
  exactly one current best verified Verilog/AIG seed per case.
- `unknown/ex280_ex299_backend_candidates_20260609_2047/`: non-best unknown
  alternatives for `ex280`-`ex299`; exactly four verified alternatives per
  case, selected by low ADP first while avoiding duplicate source structures
  where possible.

Legacy FP16 bundles:

- `fp16/legacy/`: previous per-batch FP16 seed bundles retained for
  traceability. Prefer the two primary FP16 bundles above for new backend runs.
- `fp16/legacy/ex220_ex239_backend_start_20260608_1008/`: backend-start FP16 bundle
  for `ex220`-`ex239`; mixed source bundle retained for traceability. Prefer
  `fp16/ex220_ex239_current/` and
  `fp16/ex220_ex239_backend_candidates_20260608_1008/` for new backend runs.
