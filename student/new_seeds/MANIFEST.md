# New Frontend Seed Bundles

Created: `2026-06-14 20:11:01 +0800`

Selection policy:
- Only official/equivalent frontend Verilog and AIG artifacts are copied.
- Backend-derived runs are rejected unless they are existing frontend candidate bundles named `backend_candidates`.
- AIG-only rows are recorded in `rejected_candidates.csv`; no fake Verilog is generated.
- Current bundles contain exactly one AIG per case.
- Candidate bundles exclude the current best hash and preserve structural diversity where possible.

| domain | current bundle | backend candidate bundle |
| --- | --- | --- |
| `bf16` | `ex200_ex219_current` | `ex200_ex219_backend_candidates_20260614_2011` |
| `fp16` | `ex220_ex239_current` | `ex220_ex239_backend_candidates_20260614_2011` |
| `float_fp8` | `ex240_ex254_current` | `ex240_ex254_backend_candidates_20260614_2011` |
| `integer` | `ex255_ex279_current` | `ex255_ex279_backend_candidates_20260614_2011` |
| `unknown` | `ex280_ex299_current` | `ex280_ex299_backend_candidates_20260614_2011` |
