# ex286_ex288_frontend_bucket_count_decompose_20260609_1236

Run ID: `ex286_ex288_frontend_bucket_count_decompose_20260609_1236`

Purpose: Follow up the exact bucket-count key decomposition by testing whether invalid-key don't-cares or per-output-bit table decomposition make the source competitive.

Inputs:
- Truth files: `benchmarks/ex286.truth`, `benchmarks/ex287.truth`, `benchmarks/ex288.truth`
- Generator: `student/generators/unknown_bucket_count_classifier.py`
- Synthflow: `student/scripts/yosys_synthflow_variants.py`

Artifacts:
- Verilog work directory: `student/work/ex286_ex288_frontend_bucket_count_decompose_20260609_1236/`
- `case_defaultx` synthflow work: `student/work/ex286_ex288_frontend_bucket_count_decompose_case_defaultx_synthflow_20260609_1236/`
- `perbit_defaultx` synthflow work: `student/work/ex286_ex288_frontend_bucket_count_decompose_perbit_defaultx_synthflow_20260609_1236/`
- Diagnostics CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_count_decompose_20260609_1236/results/bucket_count_decompose_diagnostics.csv`
- Candidates CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_count_decompose_20260609_1236/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_count_decompose_20260609_1236/results/best.csv`
- Summary CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_count_decompose_20260609_1236/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_count_decompose_20260609_1236/results/evaluate_check.csv`

Methods Tried:
- `case_defaultx`: exact key-to-output word case table with `default: x` for invalid count keys.
- `perbit_defaultx`: one exact key table per output bit with invalid keys as don't-care.
- Limited frontend synthflow only: `case_defaultx` used `default_recheck`, `abc_g_aig`, `synth_preset`, and `extra_opt_share`; `perbit_defaultx` used `abc_g_aig`.

Best Result:
- `ex286`: best `case_defaultx` `13222/21/277662`; `perbit_defaultx` `21576/20/431520`.
- `ex287`: best `case_defaultx` `20106/24/482544`; `perbit_defaultx` `35587/22/782914`.
- `ex288`: best `case_defaultx` `23978/24/575472`; `perbit_defaultx` `23850/24/572400`.

Notes:
- All tested rows were exact, but both emitter styles are much worse than current bests.
- Invalid-key don't-cares did not produce useful optimization in Yosys/ABC.
- Per-bit tables duplicated logic and were worse or equivalent to the word table.
- The exact bucket-count key remains a semantic clue, but future work must find a non-table decomposition of the key-to-output function.
