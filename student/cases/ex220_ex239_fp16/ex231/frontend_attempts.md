# ex231 FP16 Frontend Attempts

Function hypothesis: `fp16_reciprocal`.

Current known best:
- Run: `ex220_ex239_semantic_20260604`
- Variant: `positive_default_exp_mant_case`
- QoR: `1226/17/20842`
- Reference ADP: `14066`
- Ratio: `1.481729`
- Classification: `structural_exact`

Next maintenance items:
- Verify true DAZ + 1/x + FP16 RNE + FTZ + canonical NaN semantics.
- Try explicit special cases plus exponent arithmetic and local mantissa LUT.
- Preserve sign symmetry and zero/inf behavior.
- Record whether semantic arithmetic beats positive-default structural tables.
