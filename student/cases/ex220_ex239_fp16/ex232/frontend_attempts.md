# ex232 FP16 Frontend Attempts

Function hypothesis: `fp16_square`.

Current known best:
- Run: `ex220_ex239_semantic_20260604`
- Variant: `positive_default_exp_mant_delta`
- QoR: `1365/17/23205`
- Reference ADP: `13392`
- Ratio: `1.732751`
- Classification: `structural_exact`

Next maintenance items:
- High priority: current ADP is above 1.5x reference.
- Verify true DAZ + x*x + FP16 RNE + FTZ + canonical NaN semantics.
- Try exponent arithmetic plus mantissa hi/lo delta and selected-bit formulas.
- Record whether direct arithmetic is too deep before reverting to structural seeds.
