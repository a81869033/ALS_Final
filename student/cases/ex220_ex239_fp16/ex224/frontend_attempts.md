# ex224 FP16 Frontend Attempts

Function hypothesis: `fp16_log2`.

Current known best:
- Run: `ex223_ex224_frontend_yosys_synthflow_20260607_0910`
- Verilog seed: `casez_sign_bits11_12_t8` from `ex223_ex224_frontend_fp16_bitlogic4_20260606_2354`
- Synthesis flow: Yosys internal `abc -g aig`
- QoR: `6219/20/124380`
- Reference ADP: `64708`
- Ratio: `1.922173`
- Classification: `synthflow_exact`

Next maintenance items:
- High priority: current ADP is far above reference.
- Verify true DAZ + log2(x) + FP16 RNE + FTZ + canonical NaN semantics.
- Try arithmetic exponent base plus mantissa correction, inspired by BF16 log2.
- Record whether delta-pair, hi/lo mantissa split, or selected-bit formulas improve delay.

## 2026-06-06 Targeted Run

Run: `ex220_ex224_frontend_fp16_semantic_20260606_2050`

Truth/semantic facts:
- Function hypothesis remains FP16 `log2`.
- Zero and denormal inputs map to `-inf`; negative nonzero inputs map to
  canonical NaN; positive `+inf` maps to `+inf`; NaN maps to canonical NaN.
- For positive normal inputs, `log2(x)` is semantically exponent-base plus
  mantissa correction, but the tested source-level decompositions did not yet
  beat direct table synthesis.

Verified candidates tried:
- `sign_exp_mant_case`: `6332/21/132972`, best.
- `split_sign_exp_mant_case`: `6952/20/139040`.
- `log_positive_field_split`: `6974/20/139480`.
- `exp_mant_pair_case`: `6973/21/146441`.
- `log_positive_base_delta`: `6988/21/146740`.
- `log_special_shell`: `6996/21/146924`.
- `log_mant0_fastpath`: `7078/21/148626`.
- `positive_default_exp_mant_case`: `7282/21/152928`.
- `semantic_exp_delta_fields`: `7729/21/162325`.
- `log_limited_run_range`: much worse, `865517` ADP.

Conclusion:
- `sign_exp_mant_case` remains the best frontend seed.  The closest new
  direction was positive field split, but it still lost ADP.  Future work
  should try a true arithmetic add/reassembly kernel for exponent-base plus
  `log2(1.mant)` correction rather than another source-form table rearrange.

## 2026-06-06 Deep Follow-Up

Runs:
- `ex223_ex224_frontend_fp16_log_deep_20260606_2209`
- `ex223_ex224_frontend_fp16_log_deep2_20260606_2224`
- `ex223_ex224_frontend_fp16_log_selected_20260606_2236`
- `ex223_ex224_frontend_fp16_log_ranges_20260606_2256`
- `ex223_ex224_frontend_fp16_log_signsplit_20260606_2305`
- `ex223_ex224_frontend_fp16_log_caseattrs_20260606_2312`
- `ex223_ex224_frontend_fp16_log_casez_20260606_2319`

Combined result:
- 57 exact equivalent candidates for `ex224` across these follow-up directions.
- Best remains `sign_exp_mant_case` / `sign_exp_mant_attr_*`, `6332/21/132972`.
- Closest new candidates: `split_sign_exp_mant_case`, `6320/22/139040`, and
  selected semantic sign bit, `6337/22/139414`.

Directions tried and excluded:
- Fixed-point semantic model: confirmed real structure `log2(x) = exp_base + log2(1.mant)`.  Q18 with 24 calibrated q entries and 6 exact patches gave low area `3617`, but delay `49`, ADP `177233`.
- Bucketed constant-output-exponent rewrite: exact but worse; best ADP `261195`.
- Selected-bit hybrid: exact; sign bit was close but not better, exponent and mantissa bits were much worse.
- Balanced range tree: exact; best meaningful range threshold ADP `160200`, worse than direct table.
- Sign-known abs rewrite: exact but still high delay.
- `parallel_case/full_case` attributes: no QoR change.
- `casez` interval cubes: compressed source entries from 30720 to about 17230 in full cube mode, but AIG QoR worsened; best ADP `156653`.

Current conclusion:
- The hidden semantic structure was found, but the current frontend-only
  arithmetic/cube forms do not beat Yosys synthesis of the direct
  sign-exp-mant table.
- Further improvement likely needs a custom shallow fixed-point normalizer or
  bit-level PLA cover generated per output bit, not another exponent/mantissa
  table rearrangement.

## 2026-06-06/07 Bit-Level Follow-Up

Runs:
- `ex223_ex224_frontend_fp16_bitlogic3_20260606_2344`
- `ex223_ex224_frontend_fp16_bitlogic4_20260606_2354`
- `ex224_frontend_fp16_bitlogic5_20260607_0001`
- `ex224_frontend_fp16_bitlogic6_20260607_0010`
- `ex224_frontend_fp16_bitlogic7_20260607_0018`

New best:
- `casez_sign_bits11_12_t8`: `6250/21/131250`, official `evaluate.py`
  recheck OK.
- Improvement over old `sign_exp_mant_case`: `132972 -> 131250`, `1722`
  ADP lower, about `1.30%`.

What changed:
- Per-output-bit run statistics showed high output bits have small
  sign/exponent group covers: bit15 is sign/exponent-only; bit12 and bit11
  have only a few non-constant mantissa ranges.
- `casez_sign` alone improved to `6316/21/132636`.
- Single bit11, bit12, bit9, and bit10 run-cover overrides all improved over
  the old table, but the best local combination was `casez_sign + bit11/bit12`.

Directions tried and excluded:
- Comparator/boolean sign formulas verified exact but synthesized worse than
  `casez_sign`.
- Adding bit9 to the current best increased ADP; bit12+bit9 without sign was
  close at `6275/21/131775` but still lost.
- Adding bit10, bit13, bit14, bit8, or bit7 to the best structure increased
  area or disrupted sharing.
- Hand-written threshold-expression formulas for bit11/bit12 were exact but
  much worse (`138710`/`139194` ADP), so the generic run-tree form is currently
  better for these two bits.

Current conclusion:
- `ex224` benefits from a small bit-level hybrid, not a broad structural
  rewrite: keep the sign-exp-mant table for most bits, override output sign
  with `casez`, and override only bits12 and 11 with shallow mantissa run
  covers.

## 2026-06-07 Deeper Semantic/Structural Follow-Up

Runs:
- `ex224_frontend_fp16_log2_cluster_20260607_0024`
- `ex224_frontend_fp16_log2_cluster_hybrid_20260607_0032`
- `ex224_frontend_fp16_log2_directlow_20260607_0039`
- `ex223_ex224_frontend_fp16_bitvec_20260607_0050`
- `ex224_frontend_fp16_log2_lowseq2_20260607_0800`
- `ex223_ex224_frontend_fp16_masked_run_20260607_0813`
- `ex224_frontend_fp16_log2_fieldnear_20260607_0821`
- `ex224_frontend_fp16_log2_derivedpatch2_20260607_0840`

Hypotheses:
- `log2(x)` has exact clustered structure:
  `log2(x) = exponent_base + log2(1.mant)`.
- Positive-normal exponent groups share exact mantissa correction LUTs:
  exp1-6 with exp23-30 share 128-scale correction, exp7-10 with exp19-22
  share 256-scale correction, exp11-12 with exp17-18 share 512-scale
  correction, and exp13 with exp16 shares 1024-scale correction.  Exp14/15
  remain near-one full mantissa LUTs.
- Current selected high-bit modules may duplicate decode/range trees, so joint
  vector-bit covers might reduce area.

Verified candidates:
- `semantic_clustered_corr`: `5173/32/165536`.
- `semantic_clustered_fieldnear`: `5115/32/163680`.
- `semantic_clustered_derived_patch`: `4444/37/164428`.
- `cluster_hybrid_low4`: `5412/25/135300`.
- `cluster_hybrid_low6`: `5133/27/138591`.
- `cluster_hybrid_low8`: `5110/29/148190`.
- `cluster_hybrid_low10`: `5112/31/158472`.
- `direct_low4`: `5390/25/134750`.
- `direct_low6`: `5205/27/140535`.
- `direct_low8`: `5136/29/148944`.
- `lowseq4`: `6304/22/138688`.
- `lowseq5`: `6296/22/138512`.
- `lowseq6`: `6335/23/145705`.
- `lowseq7`: `6348/23/146004`.
- `lowseq8`: `6281/22/138182`.
- `masked_table_casez_sign_bits11_12`: `6316/21/132636`.
- `masked_run_casez_sign_bits11_12`: `13074/28/366072`.
- `bitvec_bits11_12_t32`: `6307/21/132447`.
- `bitvec_sign_bits11_12_t32`: `6321/22/139062`.
- `bitvec_sign_bit14_t16`: `6364/22/140008`.

Conclusion:
- The clustered correction structure is semantically real and exact, and it
  reduces area as low as `5110`-`5173`, but it introduces a two-level
  correction-LUT plus add/sub path with delay `29`-`32`.
- Splitting exp14/15 near-one groups into output-exponent ranges plus 10-bit
  mantissa LUTs is exact and trims area slightly (`5115/32/163680`), but does
  not change the high-delay correction path.
- A stronger exact normalizer was found: derive `corr512`, `corr256`, and
  `corr128` from `corr1024` with shift/round plus exact +/-1 patch flags.
  This reduced area to `4444`, the smallest semantic `ex224` seed found so far,
  but patch logic plus derived correction increased delay to `37`.
- Using clustered correction only for low bits still puts correction LUTs on
  the critical path; direct low-bit formulas improved source clarity but not
  delay.
- Exact low-bit sequence clustering avoids arithmetic but does not save enough
  table area; best was `lowseq8`, `6281/22/138182`.
- Explicit masked tables confirmed Yosys already prunes unused output bits
  reasonably well.  Balanced run-tree encoding of the remaining table bits was
  much worse.
- Joint vector-bit covers lose because the combined boundary set is more
  complex than separate bit11/bit12 run trees.
- The current best remains `casez_sign_bits11_12_t8`, `6250/21/131250`.
  Reaching `1.5x` reference (`97062` ADP) appears to require either a much
  shallower exact correction normalizer or backend optimization beyond the
  frontend-only scope.

## 2026-06-07 Shallow-Normalizer Follow-Up

Runs:
- `ex224_frontend_fp16_log2_partialpatch_20260607_0830`
- `ex224_frontend_fp16_log2_fieldsplit_20260607_0840`
- `ex224_frontend_fp16_manualbit_20260607_0855`
- `ex224_frontend_fp16_log2_derivedlow_20260607_0900`
- `ex224_frontend_fp16_log2_fieldarith_20260607_0910`
- `ex223_ex224_frontend_fp16_hybrid_attrs_20260607_0915`
- `ex223_ex224_frontend_fp16_specialshell_current_20260607_0925`

Hypotheses:
- Partial correction derivation might keep the `corr1024` sharing benefit while
  avoiding the full derived-patch critical path.
- The semantic normalizer might be shallower if `base +/- correction` is
  rewritten as `{out_exp,out_mant}` field arithmetic with only 10/11-bit
  carry/borrow.
- Output exponent bits might be cheaper as a separate field because most
  exponent groups are constant or short mantissa ranges.
- Current best might improve by adding source attributes, hand bit14 logic, or
  a special-case shell around the positive-normal table.

Verified candidates:
- `semantic_partial_derive128`: `4981/33/164373`.
- `semantic_partial_derive256`: `4954/35/173390`.
- `semantic_partial_derive512`: `4846/40/193840`.
- `semantic_partial_derive128_256`: `4784/36/172224`.
- `semantic_partial_derive128_512`: `4657/38/176966`.
- `semantic_partial_derive256_512`: `4661/39/181779`.
- `field_exp_lut_mant_table`: `6340/21/133140`.
- `field_exp_run_mant_table`: `6307/22/138754`.
- `manual_ex224_sign_bits11_12_bit14`: `6286/22/138292`.
- `derived_cluster_hybrid_low2`: `5812/27/156924`.
- `derived_cluster_hybrid_low4`: `4896/30/146880`.
- `derived_cluster_hybrid_low6`: `4514/31/139934`.
- `semantic_clustered_fieldarith`: `5009/38/190342`.
- `attr_casez_sign_bits11_12`: `6250/21/131250`.
- `special_casez_sign_bits11_12`: `6309/22/138798`.

Conclusion:
- Partial derivation does not fix the core problem: every derived correction
  variant stayed exact but kept delay at `33` or worse.
- Rewriting the semantic normalizer as 10/11-bit field arithmetic was exact but
  synthesized worse (`5009/38/190342`), so the current Yosys flow does not
  benefit from this source-level carry/borrow split.
- Separating all output exponent bits from the mantissa table was exact, but
  the best field split was `6340/21/133140`; the current full table plus only
  bit11/12 overrides preserves better sharing.
- Hand bit14 logic is semantically very small, but adding it to the current
  bit11/12 hybrid raised delay to `22`; keep bit14 inside the table.
- `parallel_case/full_case` attributes leave the current best unchanged.
- Special-shell positive-normal tables are exact but worse, confirming that the
  current full sign-exp table benefits from cross-case sharing after Yosys.

## 2026-06-07 Yosys Synthflow Follow-Up

Run:
- `ex223_ex224_frontend_yosys_synthflow_20260607_0910`

Hypothesis:
- The current `casez_sign_bits11_12_t8` Verilog seed may benefit from a better
  Yosys-internal ABC gate set before final AIG mapping.

Verified candidates:
- Previous flow recheck (`abc -g AND`): `6250/21/131250`.
- `abc_g_aig`: `6219/20/124380`, official `evaluate.py` OK.
- `synth_preset`: `6231/21/130851`.
- `no_internal_abc`: `8816/26/229216`.
- `abc_fast`: `8596/25/214900`.

Conclusion:
- New current synthflow best is `abc_g_aig`, `6219/20/124380`.
- Improvement over previous best: `131250 -> 124380`, `6870` ADP lower.
- Delay-target `-D` values did not change QoR; `abc -g aig` is the only tested
  Yosys knob that improved both area and delay.
- Follow-up `abc -g aig -D 18/19/20/21` reproduced the same `6219/20/124380`
  result; `gates` and `cmos2` aliases were worse.
