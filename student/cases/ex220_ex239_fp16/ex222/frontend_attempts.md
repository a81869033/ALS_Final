# ex222 FP16 Frontend Attempts

Function hypothesis: `fp16_exp10`.

Current known best:
- Run: `ex220_ex239_semantic_20260604`
- Variant: `positive_default_exp_mant_case`
- QoR: `10615/22/233530`
- Reference ADP: `173621`
- Ratio: `1.345056`
- Classification: `structural_exact`

Next maintenance items:
- Verify true DAZ + 10^x + FP16 RNE + FTZ + canonical NaN semantics.
- Identify zero/default, overflow, and positive active exponent ranges.
- Try field reassembly and local mantissa LUTs instead of full output cases.
- Record whether sign/exponent defaults beat positive-domain structural tables.

## 2026-06-06 Targeted Run

Run: `ex220_ex224_frontend_fp16_semantic_20260606_2050`

Truth/semantic facts:
- Function hypothesis remains FP16 `exp10`.
- Positive inputs hit `+inf` earlier than exp/exp2; negative high ranges flush
  to zero; NaN maps to canonical NaN.

Verified candidates tried:
- `positive_default_exp_mant_case`: `10615/22/233530`, best.
- `exp_mant_pair_case`: `10645/22/234190`.
- `sign_exp_mant_case`: `11181/22/245985`.
- `semantic_exp_delta_fields`: `11662/22/256560`.

Conclusion:
- Positive-domain default structure remains best for exp10 because negative
  ranges collapse strongly to zero/constant behavior.
