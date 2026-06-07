# ex235 FP16 Frontend Attempts

Function hypothesis: `fp16_reciprocal_sqrt`.

Current known best:
- Run: `ex220_ex239_semantic_20260604`
- Variant: `semantic_sign_exp_field_defaults`
- QoR: `1781/18/32058`
- Reference ADP: `20800`
- Ratio: `1.541250`
- Classification: `semantic_hybrid`

Next maintenance items:
- High priority: current ADP is slightly above 1.5x reference.
- Verify true DAZ + 1/sqrt(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Try exponent parity grouping and local mantissa LUT.
- Record zero/negative/inf/NaN behavior and any field-default simplification.
