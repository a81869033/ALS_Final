# ex238 FP16 Frontend Attempts

Function hypothesis: `fp16_reciprocal_cube`.

Current known best:
- Run: `ex220_ex239_semantic_20260604`
- Variant: `exp_mant_pair_case`
- QoR: `1580/17/26860`
- Reference ADP: `16549`
- Ratio: `1.623059`
- Classification: `structural_exact`

Next maintenance items:
- High priority: current ADP is above 1.5x reference.
- Verify true DAZ + 1/(x*x*x) + FP16 RNE + FTZ + canonical NaN semantics.
- Try exponent arithmetic plus mantissa delta and sign symmetry.
- Record zero/inf/NaN corner cases before optimizing normal-domain tables.
