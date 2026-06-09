# ex286_ex289_frontend_layer_rank_transform_diag_20260609_1546

Run ID: `ex286_ex289_frontend_layer_rank_transform_diag_20260609_1546`

Purpose: Test whether the Hamming-weight-preserving ex286-ex289 maps are compact layer-wise combination-rank transforms or low-distortion Johnson-graph maps.

Inputs:
- Truth files: `benchmarks/ex286.truth` through `benchmarks/ex289.truth`
- Script: `student/generators/unknown_layer_rank_transform_diag.py`

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex289_frontend_layer_rank_transform_diag_20260609_1546/results/`
- Rank diagnostics: `results/layer_rank_transform_diagnostics.csv`
- Johnson-neighborhood diagnostics: `results/johnson_neighborhood_diagnostics.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Methods tried:
- Combination-rank transforms per Hamming-weight layer using natural/reverse/center/outside/onehot-slot orders.
- Lex/revlex/colex/revcolex layer ranks.
- Identity, reverse, Gray, ungray, bit-reverse, reverse-bit-reverse, and small affine modulo transforms.
- Johnson-neighborhood output-distance statistics for adjacent same-weight input subsets.

Best result:
- Diagnostic only; no Verilog/AIG candidates emitted.
- Best rank match ratios stayed around 0.7% to 1.6% on their best layers, with zero exact layers.

Notes:
- This excludes simple layer-rank/unrank and local Johnson-isometry explanations as reference-scale structures.
