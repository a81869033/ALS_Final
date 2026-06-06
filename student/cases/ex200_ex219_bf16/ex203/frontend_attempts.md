# ex203 BF16 Frontend Attempts

Hypothesis: `bf16_log`

Current best snapshot:
- variant: `sign_exp_mant_case`
- class: `structural_exact`
- ADP/reference ratio: `1.436890`

Semantic direction:
- Negative normal inputs should be canonical NaN; confirm exact zero/inf/NaN samples.
- Positive normal domain should use exponent decomposition around BF16 value 1.0.
- Try `log(1.mant) + exponent_offset` structure with a 128-entry mantissa LUT and small exponent arithmetic.

Attempt log:
- 2026-06-05: Created tracking note.  Current QoR is close, but semantic RTL is still needed.
- 2026-06-05: Run `ex201_ex204_frontend_bf16_semantic_20260605_0924` proved the truth table exactly matches `DAZ + ln(x) + BF16 RNE + FTZ + canonical NaN`.
- 2026-06-05: Observed special cases: DAZ zero maps to `-inf`; positive `inf` maps to `+inf`; negative normal/inf and NaN map to canonical NaN.
- 2026-06-05: Exact candidates generated and officially rechecked:
  - `structural_sign_exp_mant_case`: `4546/18/81828`, still best.
  - `structural_split_sign_exp_mant_case`: `4428/19/84132`.
  - `semantic_sign_exp_word_mode_defaults`: `4558/19/86602`.
  - `semantic_log_positive_full`: `4564/19/86716`.
  - `semantic_log_pair_runs`: `5238/22/115236`.
  - `semantic_log_positive_runs`: `5185/23/119255`.
- 2026-06-05: Aggressive run `ex201_ex204_frontend_aggressive_semantic_20260605_1139` targeted 50% ADP reduction (`<=40914`) but did not improve current best.
  - `parallel_full_case_hint`: exact, unchanged `4546/18/81828`.
  - `synth_no_yosys_abc`: exact but worse `6803/23/156469`.
  - `manual_q22_fixed_semantic`: exact `ln(x)=log2(x)*ln2`, but multiplier and BF16 conversion made it `3846/115/442290`.
  - Official `evaluate.py` recheck passed for all 3 aggressive candidates.

Failed or Avoided Directions:
- Avoid full `sign_exp_mant_case` regeneration unless it identifies exact NaN/inf boundaries.
- Positive-domain-only semantic tables remove the negative NaN region from source, but synthesize with worse delay than the full sign-exp table.
- Run-compressed mantissa cases are much worse for this log table.
- Generic fixed-point multiply plus BF16 conversion is exact but unusably deep for frontend seed QoR.

## 2026-06-05 Bitlogic Follow-Up

Run: `ex201_ex204_frontend_bitlogic_20260605_1412`

Consolidated result:
- `candidates.csv` contains all exact/synthesized current-run candidates.
- Best current-run candidate: `ex203_bf16_log_sign_exp_mant_no_defaults`, `4546/18/81828`.
- This ties the previous best but does not improve it.

Tried and excluded:
- Shared BDD Verilog, two variable orders: exact but worse (`106128` and `117288` ADP).
- Exp/mant delta pair: exact, lower area `4437`, but delay rose to `21`.
- Separate field defaults: exact `4541/19/86279`; lower area than the best but one extra level.
- Default-NaN positive-domain table: exact but same QoR as earlier semantic positive full, `4564/19/86716`.
- Exp-delta field semantic form: exact but too deep, `4406/27/118962`.

Current interpretation:
- Area can be reduced below the best, but all current reductions add at least
  one delay level.
- A useful semantic `ln(x)` RTL needs to avoid the long `log2 * ln2` multiply
  path and also avoid adding a field/default decoder in front of the table.

## 2026-06-05 Semantic Deep Follow-Up

Run: `ex201_ex204_frontend_semantic_deep_20260605_1525`

Improved result:
- `ex203_bf16_log_sign_exp_mant_bits_1_11_14_15_override`: exact, official recheck `4496/18/80928`.
- Previous best was `4546/18/81828`, so this saves 50 nodes at the same 18-level delay.

Tried and excluded:
- Single-bit overrides found useful bits, especially bit 15 (`4526/18/81468`).
- Multi-bit and greedy expansion improved through bits `{1,14,15}` and then `{1,11,14,15}`.
- Adding more high bits after that worsened or only tied; no delay reduction found.

Current interpretation:
- For `ln(x)`, selected output-bit overrides can reduce the old sign/exp/mant
  table without adding a delay level.
- The improvement is structural around a verified semantic function, not a new
  arithmetic `ln` implementation.

## 2026-06-05 Semantic Continue Follow-Up

Run: `ex201_ex204_frontend_semantic_continue_20260605_1732`

New best:
- `ex203_bf16_log_hilo3_word_mode_bits_14_bh3`
- Official `evaluate.py` recheck: `4617/17/78489`
- Previous best: `4496/18/80928`

Effective direction:
- For `ln(x)`, word-mode hi/lo mantissa splitting synthesized to a shorter
  17-level path even though it had more nodes than the previous seed.
- Overriding output bit 14 shaved a few nodes while keeping delay 17.

Tried and excluded:
- Field-mode hi/lo variants kept delay 18 and did not improve ADP.
- hi=1/2 word variants lowered raw area but returned to 18 delay.
- Mixed word/field policies and multi-bit overrides lost the 17-level advantage.

### Additional continuation pass

New best:
- `ex203_bf16_log_sep_fields_e3_m3_s3_bits_14_bh2`
- Official `evaluate.py` recheck: `4544/17/77248`

Effective direction:
- Separate field factoring recovered lower area than the word-mode seed while
  preserving the 17-level path when bit14 used a `bh2` predicate.

Tried and excluded:
- split-sign positive-domain field factoring lowered some raw area but raised
  delay to 19.
- Critical-bit BDD, casez-run predicates, full exponent bitplanes, and full
  mantissa bitplanes did not beat the separated-field bit14 seed.

### Formula/PLA continuation pass

- Hand-derived bit14 formula was exact:
  negative inputs and most positive exponent ranges are constant; only
  positive `exp==124` and `exp==129` need mantissa thresholds.
- Formula and full-run forms did not beat the current best:
  `sep_fields_e3_m3_s2_formula_bits_14` was `4611/18/82998`;
  `sep_fields_e2_m3_s2_formula_bits_14` preserved delay 17 but area rose to
  `4666`.
- Per-sign-exp PLA was exact and close but worse:
  `sep_fields_e3_m3_s2_bits_14_pla`, `4571/17/77707`.
- Current best remains `sep_fields_e3_m3_s2_bits_14_bh2`, official
  `evaluate.py` `4544/17/77248`.
