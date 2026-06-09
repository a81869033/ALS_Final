# ex288_frontend_topk_layer_tiny_20260609_1040

Diagnostic-only top-k score and layer/block probe for ex286-ex289.

Artifacts:
- `results/topk_layer_diagnostics.csv`

No Verilog/AIG candidates generated. `student/seeds` and `output/` are intentionally untouched.

Result:
- Best tested tiny top-k score family matched only `169/32768` full-table rows,
  so simple top-k scoring is rejected for ex288 as a large-drop structure.
