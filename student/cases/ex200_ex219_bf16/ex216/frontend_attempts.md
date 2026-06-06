# ex216 BF16 Frontend Attempts

Hypothesis: `bf16_cube`

Current best snapshot:
- variant: `semantic_positive_symmetry_fields`
- class: `semantic_hybrid`
- ADP/reference ratio: `1.822461`

Semantic direction:
- Odd function: use sign symmetry.
- Normal-domain exponent formula should be `out_exp = 3*exp - 254 + delta`.
- Use a 128-entry mantissa LUT for cube mantissa and identify any rounding carry exceptions.
- Explicitly guard underflow/overflow ranges.

Attempt log:
- 2026-06-05: Created tracking note.  High priority; compare against the FP16 `cube` exception strategy if a shared mantissa key conflict appears.
- 2026-06-06: Run `ex215_ex219_frontend_bf16_semantic_20260606_1447` confirmed exact `bf16_cube` semantics.  Best remains `aggr_semantic_positive_symmetry_fields`, `437/14/6118`; no frontend-only improvement over the previous semantic positive-symmetry seed.
- 2026-06-06: Deep run `ex216_ex218_ex219_frontend_bf16_deep_20260606_1600` improved best to `aggr_semantic_positive_symmetry_fields_bits_14_cmp_fix5_manual_sign_non_nan_fix10`, `420/14/5880`.  The useful rewrite is output bit14 as a shallow comparator predicate plus semantic sign `sign && !is_nan`.
- 2026-06-06: Deep2 run `ex215_ex219_frontend_bf16_deep2_20260606_1726` improved best to `aggr_semantic_positive_symmetry_fields_cube_bit14_boundary_caseattrs_fix13`, `444/13/5772`.  The useful rewrite is hand-derived bit14 boundary `exp >= 128 || (exp == 127 && mant >= 34)`.

Failed or Avoided Directions:
- Avoid broad positive-symmetry variants unless they are converted into exponent arithmetic.
- Selected-bit overrides on the best seed, extra odd positive-domain hi splits, split-sign h2/h5/h6, and delta h2/h5 variants all lost.  `legacy_default_expr_exception_case` was catastrophic and should not be repeated.
- Hand guarded cube RTL was exact but synthesized to `437/17/7429`, worse than the table-derived positive symmetry seed.  Low-bit comparator predicates created very deep paths.
- Applying the bit14 boundary to lower-area semantic/delta bases did not beat the positive-symmetry base; they kept too much delay or added area.
