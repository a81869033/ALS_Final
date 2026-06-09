# ex286_ex288_frontend_crosswidth_ex289_embedding_diag_20260609_1643

Run ID: `ex286_ex288_frontend_crosswidth_ex289_embedding_diag_20260609_1643`

Purpose: Test whether ex286-ex288 can be recovered as order-preserving restrictions/projections of ex289, which would allow transferring the strong ex289 split2-duality source.

Inputs:
- Truth files: `benchmarks/ex286.truth`, `benchmarks/ex287.truth`, `benchmarks/ex288.truth`, `benchmarks/ex289.truth`
- Script: `student/generators/unknown_crosswidth_embedding_diag.py`

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex288_frontend_crosswidth_ex289_embedding_diag_20260609_1643/results/`
- Diagnostic CSV: `results/crosswidth_embedding_diagnostics.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Methods tried:
- Order-preserving input embedding into ex289 with all constants on deleted input bits.
- Order-preserving output projection.
- Output permutation inferred from one-hot rows, still with order-preserving input embedding.
- Zero, one-hot, and two-hot rows were used for pruning before any full-table check.

Best result:
- Diagnostic only; no Verilog/AIG candidates emitted.
- No embedding/projection survived the zero/one-hot/two-hot sample for ex286, ex287, or ex288.

Notes:
- Directly transferring the ex289 split2-duality source through a simple restriction/projection is not viable as tested. A transfer would need a non-order-preserving input embedding or a different semantic relation.
