# ex221 FP16 Frontend Attempts

Function hypothesis: `fp16_exp2`.

Current known best:
- Run: `ex220_ex239_semantic_20260604`
- Variant: `exp_mant_pair_case`
- QoR: `6974/22/153428`
- Reference ADP: `105655`
- Ratio: `1.452160`
- Classification: `structural_exact`

Next maintenance items:
- Verify true DAZ + 2^x + FP16 RNE + FTZ + canonical NaN semantics.
- Inspect exponent split for integer/fraction decomposition.
- Try local mantissa LUTs grouped by exponent range.
- Record failed formula, LUT split, and selected-bit attempts here.

## 2026-06-06 Targeted Run

Run: `ex220_ex224_frontend_fp16_semantic_20260606_2050`

Truth/semantic facts:
- Function hypothesis remains FP16 `exp2`.
- Zero and denormal inputs map to `1.0`; positive high ranges saturate to
  `+inf`; negative high ranges flush to zero; NaN maps to canonical NaN.

Verified candidates tried:
- `exp_mant_pair_case`: `6974/22/153428`, best.
- `positive_default_exp_mant_case`: `6977/22/153494`.
- `sign_exp_mant_case`: `7032/22/154704`.
- `semantic_exp_delta_fields`: `7324/22/161138`.

Conclusion:
- The current best is still the exponent/mantissa pair source.  Semantic
  exp-delta did not reduce area or delay enough to help ADP.
