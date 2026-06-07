# ex239 FP16 Frontend Attempts

Function hypothesis: `fp16_reciprocal_cbrt`.

Current known best:
- Run: `ex220_ex239_semantic_20260604`
- Variant: `semantic_arith_fields`
- QoR: `2028/19/38532`
- Reference ADP: `25965`
- Ratio: `1.483998`
- Classification: `semantic_exact`

Next maintenance items:
- Verify true DAZ + 1/cbrt(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Preserve semantic arithmetic as a baseline, but try source rewrites to reduce delay.
- Inspect exponent modulo grouping and local mantissa LUT cost.
- Record whether structural fallback beats semantic exactness on ADP.
