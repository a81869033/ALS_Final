# ex256_frontend_bdd_diag_20260609_0044

Run ID: `ex256_frontend_bdd_diag_20260609_0044`

Purpose: small shared-BDD diagnostic for `ex256` unsigned 5x5 multiply after
CSA/Wallace seeds stalled around ADP 3150.

Inputs:
- Truth file: `benchmarks/ex256.truth`
- Generator/script: `student/generators/unknown_bdd_search.py`
- Orders: natural, reverse, operand-interleaved, high-to-low interleaved,
  and high operand then low operand.

Artifacts:
- Work directory: `student/work/ex256_frontend_bdd_diag_20260609_0044/`
- Candidates CSV: `student/runs/integer/ex256_frontend_bdd_diag_20260609_0044/results/candidates.csv`
- Best CSV: `student/runs/integer/ex256_frontend_bdd_diag_20260609_0044/results/best.csv`

Methods Tried:
- Shared BDD Verilog over all 10 output bits with five variable orders.

Best Result:
- `ex256_unknown_shared_bdd_10x10_order_9_8_7_6_5_4_3_2_1_0`
- QoR: `817/16/13072`
- Equivalent: yes

Notes:
- BDD delay was lower than arithmetic seeds, but area was far too high.
- This run is diagnostic only; it does not replace the current arithmetic
  frontend best.
