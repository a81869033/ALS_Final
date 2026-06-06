# ex202 BF16 Frontend Attempts

Hypothesis: `bf16_exp10`

Current best snapshot:
- variant: `semantic_sign_exp_field_defaults`
- class: `semantic_hybrid`
- ADP/reference ratio: `1.366556`

Semantic direction:
- Keep the existing semantic-hybrid field defaults as the baseline.
- Try to replace remaining exception/table regions with explicit exponent-range and mantissa-LUT rules.
- Preserve BF16 special-case behavior: canonical NaN, inf, zero, DAZ/FTZ if observed.

Attempt log:
- 2026-06-05: Created tracking note.  This case is a medium priority because best is already hybrid and within 1.5x.
- 2026-06-05: Run `ex201_ex204_frontend_bf16_semantic_20260605_0924` proved the truth table exactly matches `DAZ + 10^x + BF16 RNE + FTZ + canonical NaN`.
- 2026-06-05: Best candidate in this run is `semantic_sign_exp_field_defaults`: `3702/16/59232`; official `evaluate.py` recheck passed.
- 2026-06-05: Other exact candidates:
  - `semantic_exp_pair_casez_full`: `3659/17/62203`; lower area but worse ADP than field defaults.
  - `structural_exp_mant_pair_case`: `3661/17/62237`.
  - `semantic_exp_sign_exp_casez_full`: `3720/17/63240`.
  - `semantic_sign_exp_word_mode_defaults`: `3705/17/62985`.
  - `semantic_exp_pair_casez_runs`: `4147/23/95381`.
- 2026-06-05: Aggressive run `ex201_ex204_frontend_aggressive_semantic_20260605_1139` targeted 50% ADP reduction (`<=29616`) but did not improve current best.
  - `parallel_full_case_hint`: exact, unchanged `3702/16/59232`.
  - `synth_no_yosys_abc`: exact but worse `6293/20/125860`.
  - Official `evaluate.py` recheck passed for both aggressive candidates.

Failed or Avoided Directions:
- Do not regress to structural full sign/exp/mant tables unless used only for comparison.
- Direct word-mode defaults lose the 16-level delay advantage of field-level reassembly.
- Mantissa run compression is exact but materially worse after Yosys synthesis.
- Source-level case hints do not affect the current `semantic_sign_exp_field_defaults` result.

## 2026-06-05 Bitlogic Follow-Up

Run: `ex201_ex204_frontend_bitlogic_20260605_1412`

Consolidated result:
- `candidates.csv` contains all exact/synthesized current-run candidates.
- Best current-run candidate: `ex202_bf16_exp10_exp_pair_runs_only_116_117_118_119`, `3634/17/61778`.
- This is lower area than the previous best, but the extra delay level makes it worse than `3702/16/59232`.

Tried and excluded:
- Shared BDD Verilog, two variable orders: exact but worse (`70794` and `74560` ADP).
- Exp/mant hi-lo XOR factoring: exact but worse `4454/20/89080`.
- Field-default bit-run compression: exact but worse `4697/16/75152`.
- Grouped constants, special NaN ternary, and selected run-compressed exponent groups: exact, but all stayed at delay `17` or worse.
- Separate sign/exp/mant field defaults and 15-bit tail defaults: exact, but worse (`63393` and `63053` ADP).
- Positive-default and split sign/exp/mant structural variants: exact, but worse.

Current interpretation:
- The field-default seed remains best because it is the only current structure
  preserving the 16-level path.
- Future work should improve that field-default structure directly, not regress
  to pair-table variants that save area but cost one delay level.

## 2026-06-05 Semantic Deep Follow-Up

Run: `ex201_ex204_frontend_semantic_deep_20260605_1525`

Consolidated result:
- Best remains `ex202_bf16_exp10_best_shape_sign_full_assign`, exact official recheck `3702/16/59232`.
- This reproduces the previous best; no frontend-only candidate in this run improved it.

Additional exact directions tried and excluded:
- Current-best field-default single-bit and multi-bit overrides: best was `3660/17/62220`, worse ADP.
- Pair-runs-base bit overrides: best was `3640/17/61880`, worse than both pair-runs base and field-default best.
- Semantic range gating over `exp<=115`, active `116..132`, saturation `133..254`, and `exp==255`: best was `3656/17/62152`.
- Active-only field/tail/word tables: all lost the 16-level field-default advantage.
- Exact semantic arithmetic `10^x = 2^(x*log2(10))` with fractional LUT plus correction exceptions: area dropped as low as `2797`, but delay rose to `71`.
- Removing the apparently constant `out_sign` made QoR worse (`3786/17/64362`); preserving full sign assignments reproduces the best `3702/16/59232`.
- Default-choice sweep over high-variation groups `0x07d..0x084` and `0x17d..0x184`: most choices tied `3702/16/59232`; edge saturation groups worsened to delay `17`.
- Grouped constant field cases were exact but worse (`3682/17/62594` best).

Current interpretation:
- The best ex202 frontend seed is locally stable around the shared `sign_exp`
  field-default decoder.
- Semantic arithmetic explains the function and can greatly reduce raw area,
  but without backend retiming/optimization its multiplier and conversion path
  are too deep for ADP.
- Further frontend-only improvement likely requires a new shallow way to compute
  the `x*log2(10)` exponent/fraction split, not more table-default reshaping.

## 2026-06-05 Semantic Continue Follow-Up

Run: `ex201_ex204_frontend_semantic_continue_20260605_1732`

New best:
- `ex202_bf16_exp10_hilo3_field_mode_bits_14_15_bh4`
- Official `evaluate.py` recheck: `3493/16/55888`
- Previous best: `3702/16/59232`

Effective direction:
- Replaced the broad sign-exp field-default table with a mantissa hi/lo field
  split.  `hi=3` preserved the 16-level path while lowering area.
- Output bit 15 is globally constant; overriding it lets Yosys drop the base
  sign-bit cone.  The retained best ties the single-bit override while also
  overriding bit 14.

Tried and excluded:
- hi=1, hi=5, hi=6 and XOR/add delta splits were exact but worsened delay or ADP.
- Mixed per-exponent hi policies did not beat uniform `hi=3`.
- Most bit overrides and bit combinations either tied or increased area/delay.

### Additional continuation pass

New best:
- `ex202_bf16_exp10_sep_fields_e3_m3_s0_bits_14_bh4`
- Official `evaluate.py` recheck: `3478/16/55648`

Effective direction:
- Splitting `out_sign`, `out_exp`, and `out_mant` into independent field
  tables saved a few more nodes than the packed field seed.
- Keeping bit14 as a separate `bh4` predicate retained the 16-level path and
  reduced area from 3493 to 3478.

Tried and excluded:
- Critical-bit BDD, casez-run, and comparator-threshold predicates were exact
  but raised delay or failed to beat the hi/lo predicate.
- Full exponent-field and mantissa-field bitplane splits increased area.

### Formula/PLA continuation pass

- Hand-derived bit14 formula was exact:
  positive `exp > 125` plus `exp == 125 && mant >= 26`, and negative
  `exp == 255 && mant != 0`.
- Formula variants were close but did not beat the current best:
  `hilo3_field_mode_formula_bits_14` reached `3488/16/55808`;
  `sep_fields_e3_m3_s0_formula_bits_14` raised delay to 17.
- Per-sign-exp PLA was also exact but worse:
  best close result `hilo3_field_mode_bits_14_pla`, `3499/16/55984`.
- Current best remains `sep_fields_e3_m3_s0_bits_14_15_bh4`, official
  `evaluate.py` `3478/16/55648`.
