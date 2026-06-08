# ex220-ex224 FP16 Frontend Attempts

Setup note: this file is the group-level log for FP16 exp/log-family cases.
Detailed case work should still be recorded in each `exNNN/frontend_attempts.md`.

Current known run:
- `student/runs/fp16/ex220_ex239_semantic_20260604/`
- Latest targeted run:
  `student/runs/fp16/ex220_ex224_frontend_fp16_semantic_20260606_2050/`

Cases:
- `ex220`: `fp16_exp`, current best `exp_mant_pair_case`, ratio `1.311434`.
- `ex221`: `fp16_exp2`, current best `exp_mant_pair_case`, ratio `1.452160`.
- `ex222`: `fp16_exp10`, current best `positive_default_exp_mant_case`, ratio `1.345056`.
- `ex223`: `fp16_log`, current best `sign_exp_mant_case`, ratio `2.130022`.
- `ex224`: `fp16_log2`, current best `sign_exp_mant_case`, ratio `2.054955`.

Group strategy:
- Preserve DAZ/FTZ/RNE/canonical-NaN assumptions unless truth evidence says otherwise.
- For exp-family cases, split exponent ranges into zero, passthrough, normal
  active mantissa LUTs, saturation, inf, and NaN.
- For log-family cases, derive exponent-base plus mantissa-correction structure
  before falling back to sign/exp/mant structural cases.
- Avoid broad full-table sweeps unless a targeted semantic rewrite fails and
  the failure is recorded here.

## 2026-06-06 Targeted ex220-ex224 Run

Run: `ex220_ex224_frontend_fp16_semantic_20260606_2050`

Verification:
- Generated 32 curated candidates.
- All 32 passed exact Python truth-model verification, ABC CEC, and official
  `evaluate.py` recheck.

Best rows:
- `ex220`: `exp_mant_pair_case`, `10754/22/236588`, ratio `1.311434`.
- `ex221`: `exp_mant_pair_case`, `6974/22/153428`, ratio `1.452160`.
- `ex222`: `positive_default_exp_mant_case`, `10615/22/233530`, ratio `1.345056`.
- `ex223`: `sign_exp_mant_case`, `11164/23/256772`, ratio `2.130022`.
- `ex224`: `sign_exp_mant_case`, `6332/21/132972`, ratio `2.054955`.

Methods tried:
- Exp-family: structural exp/mant pair, positive-domain default, sign-exp-mant,
  and semantic exponent-delta field decomposition.
- Log-family: sign-exp-mant baseline, split sign/exp table, exp/mant pair,
  positive default, semantic exponent-delta fields, hand-written negative and
  special-value shell, positive-only field split, base/delta kernel, mantissa
  zero fastpath, and limited run-range compression.

Outcome:
- `ex220`-`ex222` stayed within `1.5x` reference; no new frontend source form
  beat the existing best.
- `ex223`/`ex224` remain high-priority.  The hand-written log/log2 semantic
  shell variants were exact but worse after Yosys synthesis; the baseline
  sign-exp-mant source still gives the best ADP.
- Limited run-range compression should not be expanded here because it created
  long comparator chains and very poor ADP.

## 2026-06-06 ex223-ex224 Deep Follow-Up

Combined result file:
- `student/runs/fp16/ex223_ex224_frontend_fp16_log_deep_20260606_2209/results/combined_summary_ex223_ex224.csv`

Summary:
- `ex223`: 57 exact equivalent follow-up candidates.  Best remains
  `sign_exp_mant_case`, `11164/23/256772`.
- `ex224`: 57 exact equivalent follow-up candidates.  Best remains
  `sign_exp_mant_case`, `6332/21/132972`.

Reusable lessons:
- The semantic model is real:
  - `log2(x) = (input_exp - 15) + log2(1.mant)`.
  - `log(x) = (input_exp - 15) * ln(2) + ln(1.mant)`.
- Calibrated fixed-point mantissa correction LUTs can exactly reproduce the
  truth table with very few or no patches, but current source-level normalizers
  have too much delay.
- Direct table synthesis still wins because it preserves bit-level sharing.
- Avoid repeating: linear run-range chains, balanced range trees, casez cube
  covers, simple case attributes, and selected-bit semantic replacement.

## 2026-06-07 ex223-ex224 Nested Mantissa Breakthrough

Generator:
- `student/generators/fp16_log_nested_semantic.py`

Curated seed:
- `student/seeds/fp16/ex223_ex225_frontend_fp16_log_nested_current_20260607_2140/`

Official `evaluate.py` results:
- `ex223`: `ex223_log_nested_low11_hi5_abc_g_aig`, `10753/19/204307`,
  reference ratio `1.694805`.
- `ex224`: `ex224_log_nested_low12_hi6_abc_g_aig`, `6014/16/96224`,
  reference ratio `1.487050`, now within `1.5x`.

Structure:
- Keep non-positive/special sign-exp groups as exact special/default table.
- For positive normal inputs, split by sign+exponent.
- Emit high output bits as per-exp mantissa run trees.
- Emit noisy low bits as a nested mantissa hi/lo LUT.
- Sweep the low-bit boundary only after the source structure is exact.

Lessons:
- This is the first log/log2 source shape that beats the previous selected-bit
  and direct sign-exp-mant table seeds.
- For `ex224`, expanding the nested low table through output bit 11
  (`low12_hi6`) drops delay to 16 and gets within `1.5x` reference.
- For `ex223`, the useful boundary is `low11_hi5`; expanding to low12/low13
  no longer improves ADP.
- Do not repeat broad casez/bitrun sweeps for these two cases before trying a
  more arithmetic shallow normalizer; the nested source now supersedes those
  old baselines.
