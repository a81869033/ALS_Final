# ex234 FP16 Frontend Attempts

Function hypothesis: `fp16_reciprocal_square`.

Current known best:
- Run: `ex220_ex239_semantic_20260604`
- Variant: `sign_pair_case`
- QoR: `1362/17/23154`
- Reference ADP: `15561`
- Ratio: `1.487951`
- Classification: `structural_exact`

Next maintenance items:
- Verify true DAZ + 1/(x*x) + FP16 RNE + FTZ + canonical NaN semantics.
- Try sign-insensitive positive-domain structure with explicit special cases.
- Compare exponent arithmetic, default/exception tables, and delta-pair seeds.
- Record any selected-bit predicates that lower delay.
