# ex286_ex288_frontend_bucket_count_classifier_20260609_1232

Run ID: `ex286_ex288_frontend_bucket_count_classifier_20260609_1232`

Purpose: Test an exact bucket-count semantic decomposition for `ex286-ex288`: map one-hot rows to output buckets, count input tokens per bucket, add a few greedy selector bits, then emit an exact key-to-output case table.

Inputs:
- Truth files: `benchmarks/ex286.truth`, `benchmarks/ex287.truth`, `benchmarks/ex288.truth`
- Generator: `student/generators/unknown_bucket_count_classifier.py`
- Synthflow: `student/scripts/yosys_synthflow_variants.py`

Artifacts:
- Verilog work directory: `student/work/ex286_ex288_frontend_bucket_count_classifier_20260609_1232/`
- Synthflow work directory: `student/work/ex286_ex288_frontend_bucket_count_classifier_synthflow_20260609_1232/`
- Diagnostics CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_count_classifier_20260609_1232/results/bucket_count_diagnostics.csv`
- Candidates CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_count_classifier_20260609_1232/results/candidates.csv`
- Best CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_count_classifier_20260609_1232/results/best.csv`
- Summary CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_count_classifier_20260609_1232/results/summary.csv`
- Evaluate check CSV: `student/runs/unknown/ex286_ex288_frontend_bucket_count_classifier_20260609_1232/results/evaluate_check.csv`

Methods Tried:
- Derived one-hot output-slot buckets with `TruthTable(..., input_order="abc_xf")`.
- Greedily added raw/pair selector bits until the bucket-count key exactly determined the output word.
- Emitted a flat exact `case (key)` RTL source.
- Ran limited frontend synthflow variants: `default_recheck`, `abc_g_aig`, `synth_preset`, `extra_opt_share`.

Best Result:
- `ex286`: exact key `8` buckets + `raw3:raw10:xor6_7`, best `13081/21/274701`.
- `ex287`: exact key `7` buckets + `xor6_7:xor8_9:raw13:raw12`, best `20131/23/463013`.
- `ex288`: exact key `9` buckets + `raw13:raw10:xor6_7`, best `23250/25/581250`.

Notes:
- The decomposition is exact and semantically useful, but the flat key-table emitter is much worse than current bests.
- Do not repeat this emitter or broaden synthflow on it. A future attempt would need to decompose the count-key table itself, such as per-bit BDD/ANF over count fields, shared class factoring, or a smaller recurrence over the count vector.
