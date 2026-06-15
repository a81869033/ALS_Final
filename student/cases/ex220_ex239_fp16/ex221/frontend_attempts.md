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

## 2026-06-14 fp16-extra-r2 campaign shard

- Campaign: `ex204_ex299_frontend_continuation_20260614_1216`, agent `fp16-extra-r2`.
- Method signatures:
  - `ex221|fp16_exp2_field_shell|active_signexp_nested_low10_hi5|shared sign-exp decode plus high output run trees and low10 nested LUT|yosys_abc_g_aig|abc_xf_official_evaluate|active_signexp_low10_hi5`
  - `ex221|fp16_exp2_field_shell|active_signexp_wordmode_mh5|shared sign-exp decode plus per mant_hi mode default residuals|yosys_abc_g_aig|abc_xf_official_evaluate|wordmode_mant_hi5`
  - `ex221|fp16_exp2_field_shell|active_signexp_nested_low9_hi6|shared sign-exp decode plus high output run trees and low9 nested LUT|yosys_abc_g_aig|abc_xf_official_evaluate|active_signexp_low9_hi6`
- Official `evaluate.py` OK candidates:
  - `ex221_varying_signexp_nested_low10_hi5_abc_g_aig`: `6811/18/122598`, best in this shard.
  - `ex221_varying_signexp_wordmode_mh5_abc_g_aig`: `7042/18/126756`, exact but worse than low10/hi5.
  - `ex221_varying_signexp_nested_low9_hi6_abc_g_aig`: `7565/18/136170`, exact but worse; splitting output bit9 increases area.
- Artifacts:
  - `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp16-extra-r2/ex221/`
  - `student/runs/fp16/ex204_ex299_frontend_continuation_20260614_1216/fp16-extra-r2/ex221/official_eval/`
- Outcome: material frontend reduction versus the campaign target snapshot `153428 -> 122598`.  Best next action is a shallower version of the active sign-exp low10/hi5 shell, not more mantissa-high word-mode residuals.
