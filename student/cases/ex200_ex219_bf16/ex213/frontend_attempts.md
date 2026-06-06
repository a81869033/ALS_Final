# ex213 BF16 Frontend Attempts

Hypothesis: `bf16_sqrt`

Current best snapshot:
- variant: `semantic_arith_fields`
- class: `semantic_exact`
- ADP/reference ratio: `1.515172`

Semantic direction:
- Normal-domain exponent formula should be `out_exp = (exp + 127) >> 1 + delta`.
- Mantissa LUT depends on exponent parity plus mantissa.
- Negative normal inputs should map to canonical NaN.
- Current semantic exact RTL is the baseline; next work is QoR simplification, not re-discovery.

Attempt log:
- 2026-06-05: Created tracking note.  Already semantic exact but still slightly above 1.5x.
- 2026-06-06: Run `ex210_ex214_frontend_bf16_semantic_20260606_1315` confirmed exact sqrt semantics.  Best seed is `sep_fields_e2_m3_s3_bits_1_bh1` at `346/11/3806`, improving old `4394` by 13.38%.  Separate-field factoring lowered delay, then selected output bit1 lowered delay to 11.

Failed or Avoided Directions:
- Do not replace semantic arithmetic with structural tables unless comparing QoR only.
- Positive-domain sqrt full-word tables were exact but too large.  Most bit overrides worsened sharing; bit14 was a low-area near miss, but bit1 was the only tested override that improved ADP.
