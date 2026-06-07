# ex237 FP16 Frontend Attempts

Function hypothesis: `fp16_cbrt`.

Current known best:
- Run: `ex220_ex239_semantic_20260604`
- Variant: `positive_default_exp_mant_case`
- QoR: `1987/18/35766`
- Reference ADP: `25440`
- Ratio: `1.405896`
- Classification: `structural_exact`

Next maintenance items:
- Verify true DAZ + cbrt(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Try sign symmetry and exponent modulo grouping.
- Measure whether modulo tables reduce source complexity or add decoder delay.
- Record local mantissa LUT and selected-bit attempts.
