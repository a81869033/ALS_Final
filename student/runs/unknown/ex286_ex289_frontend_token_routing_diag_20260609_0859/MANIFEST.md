# ex286_ex289_frontend_token_routing_diag_20260609_0859

Run ID: `ex286_ex289_frontend_token_routing_diag_20260609_0859`

Purpose: Bounded token-routing diagnostics for ex286-ex289 after wide affine
token-rank search proved too expensive.

Inputs:
- Truth files: benchmarks/ex286.truth through benchmarks/ex289.truth
- Generator/script: student/generators/unknown_token_routing_diag.py

Artifacts:
- Results: student/runs/unknown/ex286_ex289_frontend_token_routing_diag_20260609_0859/results/token_routing_diagnostics.csv

Methods tried:
- Hamming-weight preservation and distance distribution
- Rotation/reflection match rates
- Local line/ring rules with optional popcount key
- Prefix-balance transducer tests with bounded lookahead
- Token rank/context collision tests

Best result:
- Diagnostic-only run; no Verilog/AIG candidates generated.

Notes:
- This run intentionally avoids output/ and student/seeds.
- Follow-up should generate RTL only for exact or low-conflict structures.
