# ex210 BF16 Frontend Attempts

Hypothesis: `bf16_sigmoid`

Current best snapshot:
- variant: `semantic_field_reassembly`
- class: `semantic_hybrid`
- ADP/reference ratio: `1.399919`

Semantic direction:
- Sigmoid is not odd; negative and positive ranges should be related by `sigmoid(-x) = 1 - sigmoid(x)` if rounding behavior permits.
- Expect saturation to 0 or 1 in large-magnitude ranges.
- Use exponent guards and a 128-entry mantissa LUT only around the transition region.

Attempt log:
- 2026-06-05: Created tracking note.  Next improvement should test whether complement symmetry can remove exception cases.
- 2026-06-06: Run `ex210_ex214_frontend_bf16_semantic_20260606_1315` confirmed exact `sigmoid(x)` under DAZ/FTZ/RNE/canonical NaN.  Best seed is `const_default_3f80_h3` at `2232/15/33480`, improving old `37872` by 11.60%.  Saturation-default `1.0` with local exception LUTs beat semantic field reassembly and 0/0.5 defaults.

Failed or Avoided Directions:
- Avoid full input table factoring; use it only to confirm transition boundaries.
- Positive-symmetry fields and alternate default split widths lost area/delay versus `const_default_3f80_h3`.
