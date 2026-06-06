# ex201_ex204_frontend_bitlogic_20260605_1412

Run ID: `ex201_ex204_frontend_bitlogic_20260605_1412`

Purpose: frontend-only follow-up search for better initial Verilog/AIG seeds
for BF16 `ex201`-`ex204`, after true semantics were identified.

Inputs:
- Truth files: `benchmarks/ex201.truth` through `benchmarks/ex204.truth`
- Prior seeds: `ex201_ex204_frontend_bf16_semantic_20260605_0924` and
  `ex201_ex204_frontend_aggressive_semantic_20260605_1139`
- Generator/scripts: existing BF16 structural/semantic generators plus
  hand-generated Verilog for bitplane, BDD, run-compression, field-default,
  formula, and XOR-delta base-sweep variants

Artifacts:
- Work directory: `student/work/ex201_ex204_frontend_bitlogic_20260605_1412/`
- Candidates CSV: `student/runs/bf16/ex201_ex204_frontend_bitlogic_20260605_1412/results/candidates.csv`
- Best CSV: `student/runs/bf16/ex201_ex204_frontend_bitlogic_20260605_1412/results/best.csv`
- Summary CSV: `student/runs/bf16/ex201_ex204_frontend_bitlogic_20260605_1412/results/summary.csv`
- Official recheck CSV: `student/runs/bf16/ex201_ex204_frontend_bitlogic_20260605_1412/results/evaluate_check.csv`
- Best AIG copies: `student/work/best/ex201_ex204_frontend_bitlogic_20260605_1412/`

Methods Tried:
- Shared multi-output BDD Verilog with semantic variable orders
- Bitplane sign/exp mode factoring
- Exp/mant hi-lo XOR factoring
- Constant-grouped exp pair tables
- Special NaN/Inf ternary handling
- Separate sign/exp/mant field defaults and 15-bit tail defaults
- Hybrid and selected mantissa run compression
- Fixed comparator run encoding
- No-default full-coverage case tables
- Positive-domain/default-NaN log tables
- Exp/mant XOR-delta base mantissa sweep for `ex204`
- `ex201` sign-exp integer/fraction semantic formula
- Existing small structural families not previously emphasized

Best Result:
- See `results/best.csv`.
- No case improved the previous best.
- `ex201`, `ex203`, and `ex204` tied previous best.
- `ex202` best in this run was worse than the previous 16-level field-default
  seed.

Notes:
- All synthesized AIG candidates in the consolidated CSV were rechecked with
  the official truth/equivalence flow through `evaluate_aig`.
- Official `evaluate.py` recheck passed for all equivalent candidates:
  `110/110 OK`.
- Invalid comparator-run candidates from the first buggy if-run generator are
  retained in `candidates.csv` as non-equivalent rows; the fixed generator
  variants are also present and exact.
- This run did not use ABC/ABC9/MockTurtle/CULS/E-Syn backend optimization
  portfolios.
