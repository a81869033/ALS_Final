# ex286_ex288_frontend_crosswidth_ex289_arbitrary_injection_smoke_20260609_1650

Run ID: `ex286_ex288_frontend_crosswidth_ex289_arbitrary_injection_smoke_20260609_1650`

Purpose: Smoke-test whether ex286-ex288 might be non-order-preserving input/output injections of ex289, beyond the earlier order-preserving embedding diagnostic.

Inputs:
- Truth files: `benchmarks/ex286.truth`, `benchmarks/ex287.truth`, `benchmarks/ex288.truth`, `benchmarks/ex289.truth`
- Inline diagnostic based on one-hot output slot groups and two-hot consistency.

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex288_frontend_crosswidth_ex289_arbitrary_injection_smoke_20260609_1650/results/`
- Summary CSV: `results/summary.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Methods tried:
- Grouped small input bits by their one-hot output slot.
- Mapped those groups into ex289 one-hot output slot groups with sufficient capacity.
- Enumerated slot-consistent input injections and tested all two-hot rows under the induced output projection.

Best result:
- Diagnostic smoke only; no Verilog/AIG candidates emitted.
- ex286 and ex287 had no survivor in the first 200001 slot-consistent candidates checked.
- ex288 had zero checked candidates because it has 9 distinct one-hot output slots while ex289 has only 8, so this injection/projection form cannot cover all one-hot output slots.

Notes:
- This is not a complete arbitrary permutation proof for ex286/ex287. It does rule out the simplest slot-consistent transfer candidates and makes direct ex289 transfer less likely.
