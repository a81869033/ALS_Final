# ex289_frontend_topk_layer_tiny_sample_20260609_1044

Diagnostic-only top-k score and layer/block probe for ex286-ex289.

Artifacts:
- `results/topk_layer_diagnostics.csv`

No Verilog/AIG candidates generated. `student/seeds` and `output/` are intentionally untouched.

Result:
- Full-table ex289 top-k was not expanded after ex286-ex288 were weak. The
  sample-only ex289 check matched only `54/604` sampled rows in the best tested
  tiny family, so this direction is not seed-worthy.
