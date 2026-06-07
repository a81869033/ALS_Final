# ex233 FP16 Frontend Attempts

Function hypothesis: `fp16_sqrt`.

Current known best:
- Run: `ex220_ex239_semantic_20260604`
- Variant: `positive_default_exp_mant_case`
- QoR: `1714/18/30852`
- Reference ADP: `20174`
- Ratio: `1.529295`
- Classification: `structural_exact`

Next maintenance items:
- High priority: current ADP is slightly above 1.5x reference.
- Verify true DAZ + sqrt(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Try exponent half arithmetic plus local mantissa LUT grouped by exponent parity.
- Record negative input canonical NaN behavior and selected-bit candidates.
