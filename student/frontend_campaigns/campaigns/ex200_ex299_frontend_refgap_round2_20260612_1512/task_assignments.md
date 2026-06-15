# Task Assignments

Run ID: `ex200_ex299_frontend_refgap_round2_20260612_1512`

| agent_id | domain | cases | focus |
|---|---|---|---|
| `unary-agent` | `bf16`, `fp16` | `ex200`, `ex204`, `ex205`, `ex223`, `ex224`, `ex225` | source-level unary residual compression and shallow normalizers |
| `float-fp8-agent` | `float_fp8` | `ex240`, `ex241`, `ex242`, `ex244`, `ex245`, `ex246`, `ex247`, `ex248`, `ex249`, `ex253` | FP8 decode/round/saturate factoring and boundary formulas |
| `integer-agent` | `integer` | `ex256`, `ex260`, `ex261`, `ex266`, `ex270`, `ex276`, `ex277` | shared compressor/classifier source structures |
| `unknown-gf2-agent` | `unknown` | `ex280`, `ex281`, `ex282`, `ex283`, `ex284`, `ex289` | compact GF(2)/Davio/cofactor and split-duality structures |
| `unknown-highgap-agent` | `unknown` | `ex285`, `ex286`, `ex287`, `ex288`, `ex297`, `ex299` | conservative routing, Hamming-weight normalizers, nonlocal ring descriptors |
| `unknown-state-agent` | `unknown` | `ex290`, `ex291`, `ex292`, `ex293`, `ex294`, `ex295`, `ex296`, `ex298` | state/cell descriptor factorization and sparse correction |

Shared constraints:
- Case lists are disjoint.
- Do not repeat round-1 low-value directions unchanged.
- Do not use old ex280-special scripts.
- Do not promote anything to `student/seeds`.
- Final validity is official `evaluate.py`, not simulation.

## Coordinator Closure

All six round2 agents completed. Shard CSVs were merged, candidate signatures deduplicated, equivalent rows path-validated, and seven frontend-best improvements accepted.
