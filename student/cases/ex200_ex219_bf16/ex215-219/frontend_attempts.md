# ex215-ex219 BF16 Frontend Attempts

Run: `ex215_ex219_frontend_bf16_semantic_20260606_1447`

Scope: frontend-only semantic/structural Verilog seeds for reciprocal-sqrt, cube, cbrt, reciprocal-cube, and reciprocal-cbrt.  Backend optimization portfolios were not run.

Truth convention: all generation and verification used `student.frontends.truth.TruthTable` with ABC `read_truth -xf` convention, then Yosys AIG synthesis plus ABC/evaluate.py equivalence checks.

## Semantics Identified

| Case | Function | Key behavior |
| --- | --- | --- |
| ex215 | `bf16_reciprocal_sqrt` | Positive normal domain, negative normals -> canonical NaN, zero -> signed/positive inf behavior from truth, inf -> zero, NaN -> `0x7fc0`. |
| ex216 | `bf16_cube` | Odd sign symmetry, DAZ/FTZ style zero handling, finite overflow/underflow guards, NaN canonicalization. |
| ex217 | `bf16_cbrt` | Odd sign symmetry, active across normal exponents, exponent class depends on division by 3 / `exp % 3`. |
| ex218 | `bf16_reciprocal_cube` | Odd sign symmetry, active normal exponent range is narrow, zero/inf reciprocal behavior, NaN canonicalization. |
| ex219 | `bf16_reciprocal_cbrt` | Odd sign symmetry, active across normal exponents, reciprocal cbrt exponent class depends on division by 3 / `exp % 3`. |

## Best Results

| Case | Best variant | Area | Delay | ADP | Old ADP | Improvement | Reference | Ratio |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| ex215 | `delta_pair_mode_hilo3_bits_9_bh1_fix2` | 390 | 12 | 4680 | 5005 | 6.49% | 3150 | 1.485714 |
| ex216 | `aggr_semantic_positive_symmetry_fields` | 437 | 14 | 6118 | 6118 | 0.00% | 3357 | 1.822461 |
| ex217 | `delta_pair_first_hilo3_bits_0_bh2_fix2` | 591 | 14 | 8274 | 10864 | 23.84% | 5785 | 1.430251 |
| ex218 | `legacy_value_case_bits_4_bh1_fix3` | 458 | 15 | 6870 | 6945 | 1.08% | 3222 | 2.132216 |
| ex219 | `delta_pair_first_hilo3_bits_6_bh3_fix2` | 630 | 15 | 9450 | 11271 | 16.16% | 5640 | 1.675532 |

All five best AIGs passed official `evaluate.py` recheck; see `student/runs/bf16/ex215_ex219_frontend_bf16_semantic_20260606_1447/results/evaluate_official_best.csv`.

## Attempts And Lessons

- Semantic arithmetic RTL was exact for all five cases and proved the real function identity, but source-level arithmetic paths were often deeper than structural/delta seeds after Yosys.
- Delta/base pair structures were useful for `ex215`, `ex217`, and `ex219`; selected-bit overrides on the stable delta base improved delay or area.
- `ex215` improved mainly by overriding output bit 9 with a shallow predicate; multi-bit combinations lost the benefit.
- `ex217` improved most from overriding bit 0 with `bh2`, reducing both area and delay relative to the first delta seed.
- `ex219` improved from overriding bit 6 with `bh3`; combinations with bit 14 regressed.
- `ex216` selected-bit overrides, extra hi-split sweeps, and delta hi/lo variants did not beat the existing semantic positive-symmetry field seed.
- `ex218` remains the hardest case in this group.  The value-case seed plus bit4 override only slightly improved area; semantic arithmetic and delta structures were too deep or too large.
- `legacy_default_expr_exception_case` should not be repeated broadly here: it was catastrophic on ex216/ex217 and also bad on ex218 (`19506/24/468144`).

## 2026-06-06 Deep Follow-Up For ex216/ex218/ex219

Run: `ex216_ex218_ex219_frontend_bf16_deep_20260606_1600`

Official `evaluate.py` recheck passed for all three best AIGs.

| Case | New best variant | Area | Delay | ADP | Previous curated ADP | Improvement |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| ex216 | `aggr_semantic_positive_symmetry_fields_bits_14_cmp_fix5_manual_sign_non_nan_fix10` | 420 | 14 | 5880 | 6118 | 3.89% |
| ex218 | `legacy_value_case_bits_15_cmp_caseattrs_fix9` | 467 | 13 | 6071 | 6870 | 11.63% |
| ex219 | `delta_pair_first_hilo3_bits_6_cmp_caseattrs_fix9` | 623 | 15 | 9345 | 9450 | 1.11% |

Additional lessons:

- Hand guarded semantic RTL for `cube`, `reciprocal_cube`, and `reciprocal_cbrt` was exact but too deep after Yosys.  It should be kept as semantic evidence, not current best seed.
- Comparator predicates are dangerous for low mantissa bits because they can create long chains, but they helped high/critical bits: ex216 bit14, ex218 bit15, and ex219 bit6.
- ex216 needed sequential composition: first extract bit14 with a comparator predicate, then replace sign with `sign && !is_nan`.
- ex218's useful bit15 override acts like a sign-path extraction and dropped delay from 15 to 13.  Manual sign expression was exact but did not synthesize as well as the comparator-encoded bit15 predicate.
- ex219's improvement is smaller; cross-base bit6 tests and mixed overrides did not beat `delta_pair_first_hilo3_bits_6_cmp`.

## 2026-06-06 Deep2 Follow-Up

Run: `ex215_ex219_frontend_bf16_deep2_20260606_1726`

Official `evaluate.py` recheck passed for all five best AIGs.

| Case | Best variant after deep2 | Area | Delay | ADP | Change vs previous curated |
| --- | --- | ---: | ---: | ---: | ---: |
| ex215 | `delta_pair_mode_hilo3_bits_9_bh1_fix2_caseattrs_fix12` | 390 | 12 | 4680 | tie |
| ex216 | `aggr_semantic_positive_symmetry_fields_cube_bit14_boundary_caseattrs_fix13` | 444 | 13 | 5772 | 5880 -> 5772 |
| ex217 | `delta_pair_first_hilo3_bits_0_bh3_fix2_manual_sign_non_nan_caseattrs_fix15` | 623 | 13 | 8099 | 8274 -> 8099 |
| ex218 | `legacy_value_case_bits_15_cmp_caseattrs_fix9` | 467 | 13 | 6071 | tie |
| ex219 | `delta_pair_first_hilo3_bits_6_cmp_caseattrs_fix9` | 623 | 15 | 9345 | tie |

Deep2 lessons:

- `ex216` bit14 has a compact semantic boundary: `exp >= 128 || (exp == 127 && mant >= 34)`.  This improved ADP by reducing delay from 14 to 13, even though area increased.
- `ex217` bit0 remains best as selected-bit extraction, but `bh3` plus semantic sign extraction is better than previous `bh2`.
- `exp % 3` selected-bit tables for `ex217` bit0 and `ex219` bit6 were exact but synthesized worse than the previous selected-bit encodings.
- `ex218` manual sign casez was exact after ordering the `9'h1ff` case before the wildcard negative case, but it still lost to comparator-coded bit15.
- `ex215` bit9 cmp/runs/PLA variants and case attributes did not improve over bit9 `bh1`.

## Curated Artifacts

- Active candidates: `student/runs/bf16/ex215_ex219_frontend_bf16_semantic_20260606_1447/results/candidates.csv`
- Best candidates: `student/runs/bf16/ex215_ex219_frontend_bf16_semantic_20260606_1447/results/best.csv`
- Work directory: `student/work/ex215_ex219_frontend_bf16_semantic_20260606_1447/`
- Archived full history: `student/archive/cleanup_20260606/ex215_ex219_frontend_bf16_semantic_20260606_1447_low_value_intermediates/`
