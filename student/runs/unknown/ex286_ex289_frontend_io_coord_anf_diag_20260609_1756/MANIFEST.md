# ex286_ex289_frontend_io_coord_anf_diag_20260609_1756

Run ID: `ex286_ex289_frontend_io_coord_anf_diag_20260609_1756`

Purpose: Diagnostic-only input/output coordinate ANF search for ex286-ex289.
This checks whether applying linear prefix/suffix/Gray-like transforms to both
input and output exposes low-degree exact output-coordinate bits, similar to the
kind of coordinate collapse that enabled ex280-ex284 compressor sources.

Inputs:
- Truth files: benchmarks/ex286.truth, benchmarks/ex287.truth, benchmarks/ex288.truth, benchmarks/ex289.truth
- Script: `student/generators/unknown_io_coord_anf_diag.py`
- Input coords: `raw,reverse_bits,prefix_natural,suffix_natural,prefix_reverse,suffix_reverse,prefix_onehot,suffix_onehot,gray_natural,gray_reverse`
- Output coords: `raw,reverse_bits,prefix_natural,suffix_natural,prefix_reverse,suffix_reverse,prefix_onehot,suffix_onehot,gray_natural,gray_reverse`
- Degrees: `1,2,3,4`

Artifacts:
- Results directory: `student/runs/unknown/ex286_ex289_frontend_io_coord_anf_diag_20260609_1756/results/`
- Summary CSV: `results/summary.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Best result:
- Diagnostic only; no Verilog/AIG candidates generated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
