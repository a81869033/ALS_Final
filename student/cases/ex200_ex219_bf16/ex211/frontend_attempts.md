# ex211 BF16 Frontend Attempts

Hypothesis: `bf16_reciprocal`

Current best snapshot:
- variant: `semantic_positive_symmetry_fields`
- class: `semantic_hybrid`
- ADP/reference ratio: `1.416199`

Semantic direction:
- Use sign symmetry.
- Normal-domain exponent formula should be `out_exp = 254 - exp + delta`.
- Use a 128-entry mantissa LUT for reciprocal mantissa and small delta/carry.
- Keep zero, inf, NaN, and subnormal behavior explicit.

Attempt log:
- 2026-06-05: Created tracking note.  Existing semantic-hybrid candidate is close; next step is reducing special/default logic.
- 2026-06-06: Run `ex210_ex214_frontend_bf16_semantic_20260606_1315` confirmed exact reciprocal semantics.  Best seed is hand-written `hand_recip_formula_signmag_lut` at `273/11/3003`, improving old `3025` by 0.73%.  The useful rewrite is explicit zero/inf/NaN handling plus one 128-entry mantissa LUT and sign/magnitude output mux.

Failed or Avoided Directions:
- Do not replace exponent arithmetic with pair-case tables.
- Direct arithmetic field RTL, full-word positive-domain tables, and large default-exception tables were exact but worse.  A single-subtract rewrite lowered area to 272 but raised delay to 12, losing ADP.
