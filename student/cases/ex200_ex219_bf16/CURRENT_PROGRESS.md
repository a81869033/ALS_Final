# BF16 ex200-ex219 Current Progress

This file is the quick status page for the BF16 unary-function group.  The
machine-readable current merge is:

- `student/runs/bf16/ex200_ex219_current/results/best.csv`
- `student/runs/bf16/ex200_ex219_current/results/candidates.csv`
- `student/runs/bf16/ex200_ex219_current/results/summary.csv`

## Directory Map

- Class notes: `student/cases/ex200_ex219_bf16/README.md`
- Per-case notes: `student/cases/ex200_ex219_bf16/exNNN/frontend_attempts.md`
- Current merged BF16 registry: `student/runs/bf16/ex200_ex219_current/`
- Git-tracked current best seeds:
  `student/seeds/bf16/ex200_ex219_current/`
- Current work roots:
  - `student/work/ex200_frontend_bf16_semantic_20260605_0748/`
  - `student/work/ex201_ex204_frontend_semantic_continue_20260605_1732/`
  - `student/work/ex205_ex209_frontend_bf16_semantic_20260606_0946/`
  - `student/work/ex210_ex214_frontend_bf16_semantic_20260606_1315/`
  - `student/work/ex215_ex219_frontend_bf16_deep2_20260606_1726/`
- Archived low-value or superseded intermediates: `student/archive/`

## Status Summary

- All `ex200`-`ex219` have verified equivalent Verilog seeds.
- All cases have real BF16 semantic hypotheses identified.
- All current best rows are frontend-only seeds measured after Yosys AIG
  synthesis and exact equivalence verification.
- The current best Verilog/AIG files are tracked under
  `student/seeds/bf16/ex200_ex219_current/`; broader non-best candidate
  artifacts remain in local ignored work/archive directories.
- `ex207` currently beats the reference ADP.
- Within `1.5x` reference: `ex201`, `ex202`, `ex203`, `ex206`, `ex207`,
  `ex208`, `ex209`, `ex210`, `ex211`, `ex212`, `ex213`, `ex215`, `ex217`.
- Above `1.5x` reference and still high-priority: `ex200`, `ex204`, `ex205`,
  `ex214`, `ex216`, `ex218`, `ex219`.

## Current Best By Case

| Case | Function | ADP | Ref ADP | Ratio | Status | Source run |
| --- | --- | ---: | ---: | ---: | --- | --- |
| ex200 | exp | 63189 | 40052 | 1.577674 | above_1p5_reference | `ex200_frontend_bf16_semantic_20260605_0748` |
| ex201 | exp2 | 23058 | 16300 | 1.414601 | within_1p5_reference | `ex201_ex204_frontend_semantic_continue_20260605_1732` |
| ex202 | exp10 | 55648 | 43344 | 1.283869 | within_1p5_reference | `ex201_ex204_frontend_semantic_continue_20260605_1732` |
| ex203 | log | 77248 | 56948 | 1.356466 | within_1p5_reference | `ex201_ex204_frontend_semantic_continue_20260605_1732` |
| ex204 | log2 | 26265 | 15180 | 1.730237 | above_1p5_reference | `ex201_ex204_frontend_semantic_continue_20260605_1732` |
| ex205 | log10 | 75871 | 47128 | 1.609892 | above_1p5_reference | `ex205_ex209_frontend_bf16_semantic_20260606_0946` |
| ex206 | sin | 564312 | 539049 | 1.046866 | within_1p5_reference | `ex205_ex209_frontend_bf16_semantic_20260606_0946` |
| ex207 | tan | 627333 | 627817 | 0.999229 | beats_reference | `ex205_ex209_frontend_bf16_semantic_20260606_0946` |
| ex208 | sinh | 32505 | 24505 | 1.326464 | within_1p5_reference | `ex205_ex209_frontend_bf16_semantic_20260606_0946` |
| ex209 | tanh | 9828 | 7320 | 1.342623 | within_1p5_reference | `ex205_ex209_frontend_bf16_semantic_20260606_0946` |
| ex210 | sigmoid | 33480 | 27053 | 1.237571 | within_1p5_reference | `ex210_ex214_frontend_bf16_semantic_20260606_1315` |
| ex211 | reciprocal | 3003 | 2136 | 1.405899 | within_1p5_reference | `ex210_ex214_frontend_bf16_semantic_20260606_1315` |
| ex212 | square | 3091 | 2304 | 1.341580 | within_1p5_reference | `ex210_ex214_frontend_bf16_semantic_20260606_1315` |
| ex213 | sqrt | 3806 | 2900 | 1.312414 | within_1p5_reference | `ex210_ex214_frontend_bf16_semantic_20260606_1315` |
| ex214 | reciprocal_square | 3707 | 2424 | 1.529290 | above_1p5_reference | `ex210_ex214_frontend_bf16_semantic_20260606_1315` |
| ex215 | reciprocal_sqrt | 4680 | 3150 | 1.485714 | within_1p5_reference | `ex215_ex219_frontend_bf16_deep2_20260606_1726` |
| ex216 | cube | 5772 | 3357 | 1.719392 | above_1p5_reference | `ex215_ex219_frontend_bf16_deep2_20260606_1726` |
| ex217 | cbrt | 8099 | 5785 | 1.400000 | within_1p5_reference | `ex215_ex219_frontend_bf16_deep2_20260606_1726` |
| ex218 | reciprocal_cube | 6071 | 3222 | 1.884233 | above_1p5_reference | `ex215_ex219_frontend_bf16_deep2_20260606_1726` |
| ex219 | reciprocal_cbrt | 9345 | 5640 | 1.656915 | above_1p5_reference | `ex215_ex219_frontend_bf16_deep2_20260606_1726` |

## Follow-Up Priorities

- `ex218` remains the largest gap after semantic identification.  The current
  best is still a value-case plus selected-bit comparator hybrid, so a better
  field-level reciprocal-cube structure is the main open direction.
- `ex216` has a useful hand-derived cube bit14 boundary, but the remaining
  area gap suggests the positive-symmetry table structure needs a deeper
  redesign rather than more selected-bit stacking.
- `ex204`, `ex205`, and `ex219` are semantic/structural hybrids where further
  gains likely need new field-level decompositions rather than broad table
  compression.
- `ex200` is exact semantic exp RTL, but its active mantissa mapping resisted
  run-compression and bit-level rewrites; future work should focus on a new
  exponent/mantissa decomposition, not another flat casez sweep.
