# ex286_frontend_topk_layer_light_20260609_1036

Diagnostic-only top-k score and layer/block probe for ex286-ex289.

Artifacts:
- `results/topk_layer_diagnostics.csv`

No Verilog/AIG candidates generated. `student/seeds` and `output/` are intentionally untouched.

Result:
- Best tested top-k score family matched only `84/8192` full-table rows, so
  simple top-k scoring is rejected for ex286 as a large-drop structure.
