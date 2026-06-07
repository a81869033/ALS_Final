# ex236 FP16 Frontend Attempts

Function hypothesis: `fp16_cube`.

Current known best:
- Run: `ex220_ex239_semantic_20260604`
- Variant: `positive_default_exp_mant_delta`
- QoR: `1576/17/26792`
- Reference ADP: `17290`
- Ratio: `1.549566`
- Classification: `structural_exact`

Next maintenance items:
- High priority: current ADP is above 1.5x reference.
- Preserve the known lesson that a targeted semantic exception may beat another broad template family.
- Verify true DAZ + x*x*x + FP16 RNE + FTZ + canonical NaN semantics.
- Record any hand-derived exponent/mantissa boundary formulas.
