# ex286_ex289_frontend_semantic_bigjump_diag_20260609_1412

Run ID: `ex286_ex289_frontend_semantic_bigjump_diag_20260609_1412`

Purpose: diagnostic-only high-level semantic probes for ex286-ex289 after the
current BDD/cofactor seeds remained far above reference on ex286-ex288.

Inputs:
- Truth files: `benchmarks/ex286.truth` through `benchmarks/ex289.truth`

Artifacts:
- `results/semantic_bigjump_diagnostics.csv`
- Empty `candidates.csv`, `best.csv`, `summary.csv`, and `evaluate_check.csv`
  because no Verilog/AIG candidates were emitted.

Findings:
- Hamming-weight preservation was reconfirmed for all four cases.
- Slot arithmetic/rotate, iterative normalizer, prefix-count BDD, ex289 4-var
  NPN input transform, and direct ABC `read_truth -xf` sanity checks did not
  reveal a reference-scale frontend structure.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
