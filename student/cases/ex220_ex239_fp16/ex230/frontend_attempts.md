# ex230 FP16 Frontend Attempts

Function hypothesis: `fp16_sigmoid`.

Current known best:
- Run: `ex220_ex239_semantic_20260604`
- Variant: `sign_exp_mant_case`
- QoR: `7038/21/147798`
- Reference ADP: `108320`
- Ratio: `1.364457`
- Classification: `structural_exact`

Next maintenance items:
- Verify true DAZ + sigmoid(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Try constant defaults for saturated ranges, especially 0.0 and 1.0 outputs.
- Isolate the small transition exponent bands before mantissa LUT generation.
- Record whether field reassembly beats packed word tables.
