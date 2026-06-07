# ex220 FP16 Frontend Attempts

Function hypothesis: `fp16_exp`.

Current known best:
- Run: `ex220_ex239_semantic_20260604`
- Variant: `exp_mant_pair_case`
- QoR: `10754/22/236588`
- Reference ADP: `180404`
- Ratio: `1.311434`
- Classification: `structural_exact`

Next maintenance items:
- Verify true DAZ + exp + FP16 RNE + FTZ + canonical NaN semantics.
- Record special-value behavior for zero, denormal, inf, and NaN.
- Try exponent-range guards plus local mantissa LUTs before broad structural tables.
- After each verified candidate, record exact command/result and update class notes if reusable.

## 2026-06-06 Targeted Run

Run: `ex220_ex224_frontend_fp16_semantic_20260606_2050`

Truth/semantic facts:
- Function hypothesis remains FP16 `exp`.
- Zero and denormal inputs map to `1.0`; positive overflow exponent ranges
  saturate to `+inf`; negative large ranges underflow/flush to zero; NaN maps
  to canonical NaN.

Verified candidates tried:
- `exp_mant_pair_case`: `10754/22/236588`, best.
- `positive_default_exp_mant_case`: `10794/22/237468`.
- `sign_exp_mant_case`: `10798/22/237556`.
- `semantic_exp_delta_fields`: `11395/22/250700`.

Conclusion:
- The existing exponent/mantissa pair structural source remains the best
  frontend seed.  The semantic exp-delta rewrite was exact but larger after
  Yosys synthesis.
