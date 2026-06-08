# ex240-ex254 Current Progress

This is the quick status page for the float conversion / fp8 add group.

`ex240`-`ex254` now have verified semantic frontend seeds.  Start future
work by checking `student/results/current_best_by_case.csv`,
and the run entries listed below.  The class is now complete enough for
backend-start seed curation; current best and alternative seed bundles have
been copied under `student/seeds/float_fp8/`.

## Directory Map

- Class notes: `student/cases/ex240_ex254_float_conversion_fp8_add/README.md`
- Group notes:
  - `student/cases/ex240_ex254_float_conversion_fp8_add/ex240-244/frontend_attempts.md`
  - `student/cases/ex240_ex254_float_conversion_fp8_add/ex245-249/frontend_attempts.md`
  - `student/cases/ex240_ex254_float_conversion_fp8_add/ex250-254/frontend_attempts.md`
- Per-case notes: `student/cases/ex240_ex254_float_conversion_fp8_add/exNNN/frontend_attempts.md`
- Current best seed bundle:
  `student/seeds/float_fp8/ex240_ex254_current/`
- Non-best backend-start alternatives:
  `student/seeds/float_fp8/ex240_ex254_backend_candidates_20260608_2327/`

## Reference Rows

Source: `reference_result.csv`.

| Case | Reference area | Reference delay | Reference ADP | Reference score | Current status |
| --- | ---: | ---: | ---: | ---: | --- |
| ex240 | 403 | 33 | 13299 | 19948.5 | verified semantic seed, above reference |
| ex241 | 344 | 21 | 7224 | 10836.0 | verified semantic seed, above reference |
| ex242 | 850 | 14 | 11900 | 17850.0 | verified semantic seed, above reference |
| ex243 | 3131 | 17 | 53227 | 79840.5 | verified semantic seed, above reference |
| ex244 | 356 | 12 | 4272 | 6408.0 | verified semantic seed, area now below reference but delay high |
| ex245 | 325 | 34 | 11050 | 16575.0 | verified E5M2FN semantic seed, above reference |
| ex246 | 187 | 15 | 2805 | 4207.5 | verified E5M2FN semantic seed, above reference; product-DC completion current best |
| ex247 | 175 | 17 | 2975 | 4462.5 | verified E5M2FN semantic seed, above reference |
| ex248 | 209 | 20 | 4180 | 6270.0 | verified E5M2FN semantic seed, above reference |
| ex249 | 189 | 11 | 2079 | 3118.5 | verified E5M2FN semantic seed, above reference |
| ex250 | 1357 | 15 | 20355 | 30532.5 | verified FP4 E2M1 dot seed, within 1.5x reference |
| ex251 | 2805 | 14 | 39270 | 58905.0 | verified signed-int3 dot seed, beats reference |
| ex252 | 137 | 19 | 2603 | 3904.5 | verified u2 dot seed, within 1.5x reference |
| ex253 | 123 | 15 | 1845 | 2767.5 | verified u2 reduction seed, within 1.5x reference |
| ex254 | 1911 | 20 | 38220 | 57330.0 | verified E4 accumulator plus FP4 product seed, beats reference |

## Initial Priorities

- For `ex240`-`ex244`, first infer whether each case is conversion or packed
  fp8 add; do not assume from case number alone.
- Identify FP8 format parameters directly from truth behavior.
- Preserve a small curated seed set per case once verified.
- Update this file after every run that changes the current best or eliminates
  a major hypothesis family.

## Current Known Best By Case

Source: `student/results/current_best_by_case.csv`; candidate details live in
the run result CSVs listed below.

| Case | Semantics | Candidate | ADP | Ref ADP | Ratio |
| --- | --- | --- | ---: | ---: | ---: |
| ex240 | E4M3FN add, high byte + low byte | `ex240_semantic_add_same_grs_diff_param8_synth_preset_aig` | 30090 | 13299 | 2.262576 |
| ex241 | E4M3FN multiply | `ex241_semantic_mul_product_nested_exp_synth_preset_aig` | 15544 | 7224 | 2.151717 |
| ex242 | E4M3FN division, low byte / high byte | `ex242_semantic_div_field_sparse_clean_synth_preset_aig` | 25320 | 11900 | 2.127731 |
| ex243 | E4M3FN fmod, low byte % abs(high byte) | `ex243_semantic_fmod_modsig_nested_delta_abc_g_aig` | 48330 | 53227 | 0.907998 |
| ex244 | E4M3FN hypot(abs(high), abs(low)) | `ex244_semantic_hypot_delta_maxeff_bdd_expfirst_synth_preset_aig` | 10234 | 4272 | 2.395599 |
| ex245 | E5M2FN add, high byte + low byte | `ex245_semantic_add_gap_class_synth_preset_aig` | 23834 | 11050 | 2.156923 |
| ex246 | E5M2FN multiply | `ex246_semantic_mul_product_dc_seed12_set11to10_synth_preset_aig` | 7502 | 2805 | 2.674510 |
| ex247 | E5M2FN division, low byte / high byte | `ex247_semantic_div_bound_smallpat_nested_den_synth_preset_aig` | 9125 | 2975 | 3.067227 |
| ex248 | E5M2FN fmod, low byte % high byte | `ex248_semantic_fmod_periodic_rem_abc_g_aig` | 8550 | 4180 | 2.045455 |
| ex249 | E5M2FN hypot(abs(high), abs(low)) | `ex249_semantic_hypot_threshold_rawexp_synth_preset_aig` | 4368 | 2079 | 2.101010 |
| ex250 | packed two-lane FP4 E2M1 dot to E4M3FN | `ex250_semantic_fp4_dot2_magarith_qcase_synth_preset_aig` | 16933 | 20355 | 0.831884 |
| ex251 | packed two-lane signed 3-bit magnitude dot to E4M3FN | `ex251_semantic_int3_dot2_arith_qcase_abc_g_aig` | 18810 | 39270 | 0.478992 |
| ex252 | packed four-lane unsigned 2-bit dot to E4M3FN | `ex252_semantic_u2_dot4_balanced_qcase_default` | 3045 | 2603 | 1.169804 |
| ex253 | unsigned 2-bit lane reduction `2*sum(lanes)` to E4M3FN | `ex253_semantic_u2_sum8_popcount_laneqcase_default` | 2268 | 1845 | 1.229268 |
| ex254 | E4M3FN accumulator plus FP4 E2M1 product | `ex254_semantic_e4add_fp4product_grs_magfactored_abc_g_aig` | 36410 | 38220 | 0.952643 |

## Run Entries

- `student/runs/float_fp8/ex240_ex244_frontend_fp8_semantic_20260608_1130/`:
  first exact E4M3FN semantic pass.
- `student/runs/float_fp8/ex241_ex242_frontend_fp8_field_tables_20260608_1130/`:
  field-table improvements for multiply/division.
- `student/runs/float_fp8/ex242_frontend_fp8_formula_exception_20260608_1130/`:
  division exponent-delta formula plus boundary exceptions.
- `student/runs/float_fp8/ex240_ex243_frontend_fp8_corrections_20260608_1130/`:
  add pair correction and fmod default/exception follow-up.
- `student/runs/float_fp8/ex244_frontend_fp8_gap_delta_fix_20260608_1130/`:
  hypot max+delta improvement.
- `student/runs/float_fp8/ex244_frontend_fp8_hypot_sig_threshold_fix_20260608_1216/`:
  exact sig/gap threshold correction for hypot; improved ex244 to
  `320/37/11840`.
- `student/runs/float_fp8/ex244_frontend_fp8_hypot_sig_orbits_20260608_1216/`:
  repeated the threshold candidate and tested parallel OR-of-condition delta
  bits; threshold remained best at `320/37/11840`, OR best was `338/36/12168`.
- `student/runs/float_fp8/ex244_frontend_fp8_hypot_sig_threshold_synthflow_20260608_1216/`:
  limited Yosys synthflow check on the new ex244 threshold seed; no improvement
  beyond `320/37/11840`.
- `student/runs/float_fp8/ex240_ex243_frontend_fp8_current_best_synthflow_20260608_1216/`:
  limited Yosys synthflow check for current ex240-ex243 seeds; no new bests.
- `student/runs/float_fp8/ex240_ex243_frontend_fp8_deep_struct2_20260608_1253/`:
  tested ex244-style sig/gap transfer to ex240, product/field alternatives for
  ex241, and arithmetic modulus for ex243; exact but no new bests.
- `student/runs/float_fp8/ex240_ex242_frontend_fp8_bdd_orders_20260608_1253/`:
  paired-bit shared-BDD structural pass; found a better ex240 source before
  synthflow.
- `student/runs/float_fp8/ex240_frontend_fp8_bdd_best_synthflow_20260608_1253/`:
  synthflow follow-up on ex240 BDD source; current best `2755/23/63365`.
- `student/runs/float_fp8/ex243_frontend_fp8_bdd_order_refine_20260608_1253/`:
  refined ex243 BDD order around paired high-to-low magnitude bits.
- `student/runs/float_fp8/ex243_frontend_fp8_bdd_best_synthflow_20260608_1253/`:
  synthflow follow-up on ex243 refined BDD source; current best
  `3977/22/87494`.
- `student/runs/float_fp8/ex241_ex242_frontend_fp8_bdd_best_synthflow_20260608_1253/`:
  BDD transfer check for ex241/ex242; exact but worse than current bests.
- `student/runs/float_fp8/ex242_frontend_fp8_div_formula_compact_20260608_1253/`:
  compact division formula/exception source; reproduced current best
  `1028/25/25700`.
- `student/runs/float_fp8/ex240_ex244_frontend_fp8_bdd_refine_20260608_1330/`:
  refined BDD orders for ex240/ex244; found a better ex240 source.
- `student/runs/float_fp8/ex240_frontend_fp8_bdd_refine_synthflow_20260608_1330/`:
  synthflow follow-up on refined ex240 BDD; current best `2493/23/57339`.
- `student/runs/float_fp8/ex241_ex242_ex243_frontend_fp8_nested_tables_fix_20260608_1330/`:
  nested semantic tables; current bests ex241 `536/29/15544` and ex243
  `1790/27/48330`.
- `student/runs/float_fp8/ex242_frontend_fp8_div_clean_sparse_20260608_1330/`:
  clean sparse division table with simplified special path; current best
  `1266/20/25320`.
- `student/runs/float_fp8/ex244_frontend_fp8_delta_bdd_20260608_1330/`:
  ex244 direct-result and delta-BDD checks; exact direct-result candidates were
  worse, delta-BDD was not retained.
- `student/runs/float_fp8/ex240_ex244_frontend_fp8_magbdd_deltaeff_20260608_1401/`:
  ex240 magnitude-BDD transfer and ex244 exact max-eff delta-BDD follow-up.
  New ex244 current best `301/34/10234`; ex240 semantic nested/magnitude-BDD
  candidates did not beat the later GRS add source.
- `student/runs/float_fp8/ex240_frontend_fp8_grs_fix_20260608_1401/` and
  `student/runs/float_fp8/ex240_frontend_fp8_diff_grs_20260608_1401/`:
  ex240 semantic add deepening.  Same-sign GRS/RNE plus compact diff
  normalizer is exact and now current best `590/51/30090`; fully formula-based
  diff-GRS variants were not equivalent and are follow-up only.
- `student/runs/float_fp8/ex244_frontend_fp8_delta_maxeff_synthflow_20260608_1401/`:
  single-seed synthflow check on the ex244 max-eff delta BDD; no improvement
  over `301/34/10234`.
- `student/runs/float_fp8/ex245_ex249_frontend_fp8_e5m2_curated_20260608_1715/`:
  curated aggregate for the E5M2FN batch.  Official `evaluate.py` replay OK for
  current best AIGs.  New bests: ex245 `701/34/23834`, ex246 `343/23/7889`,
  ex247 `420/22/9240`, ex248 `285/30/8550`, ex249 `168/26/4368`.
- `student/runs/float_fp8/ex246_frontend_fp8_e5m2_dc_random_20260608_1932/`
  and `student/runs/float_fp8/ex246_frontend_fp8_e5m2_dc_neighbor12_20260608_2000/`:
  product-code don't-care completion follow-up for ex246.  Seed12-family
  completions improved ex246 to `341/22/7502`; official `evaluate.py` replay
  OK.  Further random seeds, swaps, neighbors, and full synthflow did not beat
  this ADP.
- `student/runs/float_fp8/ex246_frontend_fp8_e5m2_dc_random2_20260608_2110/`:
  extended ex246 product-code don't-care random seeds 120-299.  All rows were
  exact, but no new best; best `343/22/7546`, low-area near miss
  `340/23/7820`.
- `student/runs/float_fp8/ex247_frontend_fp8_e5m2_special_rows_fix2_20260608_1902/`,
  `student/runs/float_fp8/ex247_frontend_fp8_e5m2_denzero_dc_20260608_1910/`,
  `student/runs/float_fp8/ex247_frontend_fp8_e5m2_ordered_dc_20260608_1918/`,
  `student/runs/float_fp8/ex247_frontend_fp8_e5m2_bitbdd_override_20260608_2024/`,
  and `student/runs/float_fp8/ex247_frontend_fp8_e5m2_attr_priority_fix_20260608_2048/`:
  division deep follow-up.  All retained candidates were exact, but none beat
  the then-current ex247 best `420/22/9240`.
- `student/runs/float_fp8/ex247_frontend_fp8_e5m2_threshold_compare_20260608_2110/`:
  semantic quotient-shift and mantissa-threshold comparator normalizer for
  ex247.  Exact, but best `447/32/14304`; comparator depth makes this source
  worse than the compact sigpair class table.
- `student/runs/float_fp8/ex246_ex247_frontend_fp8_e5m2_minlogic_20260608_1855/`:
  direct SOP classifier and small-mag SOP for ex246/ex247.  Exact, but no new
  best; ex246 `426/25/10650`, ex247 `419/26/10894`.
- `student/runs/float_fp8/ex246_ex247_frontend_fp8_e5m2_nested_mux_20260608_1905/`:
  two-level sig mux structures.  Exact but much worse; ex246 `628/28/17584`,
  ex247 `607/25/15175`.
- `student/runs/float_fp8/ex246_ex247_frontend_fp8_e5m2_grouped_case_20260608_1915/`:
  grouped identical case blocks.  Exact but no new best; ex246 `351/24/8424`,
  ex247 `437/22/9614`.
- `student/runs/float_fp8/ex247_frontend_fp8_e5m2_invalid_dc_random_20260608_1925/`:
  ex247 random completion of invalid sigpair don't-care rows, seeds 0-119.
  Exact but worse than current; best seed49 `440/24/10560`.
- `student/runs/float_fp8/ex246_ex247_frontend_fp8_e5m2_qclass_recip_fix_20260608_2025/`,
  `student/runs/float_fp8/ex246_ex247_frontend_fp8_e5m2_smallpat_case_20260608_2035/`,
  `student/runs/float_fp8/ex246_ex247_frontend_fp8_e5m2_bound_smallpat_20260608_2055/`,
  `student/runs/float_fp8/ex247_frontend_fp8_e5m2_smallpat_cleanup_20260608_2105/`,
  and `student/runs/float_fp8/ex247_frontend_fp8_e5m2_bound_smallpat_order_20260608_2115/`:
  qclass/reciprocal/small-pattern follow-up.  Ex247 denominator-nested
  bound-smallpat became the new current best `365/25/9125`; reciprocal-product
  qclass and generic qclass were exact but delay dominated.
- `student/runs/float_fp8/ex246_ex247_frontend_fp8_e5m2_log_norm_recheck_fix2_20260608_2140/`:
  logcode and normal/subnormal split recheck after fixing the generator
  `render_div_logcode` return path.  Exact, but no new best.
- `student/runs/float_fp8/ex246_ex247_frontend_magfactored_classid_20260608_2302/`
  and `student/runs/float_fp8/ex246_ex247_frontend_magfactored_followup_20260608_2312/`:
  transfer check from the ex250 product-factoring lesson.  ex246
  sig-product-code factoring was exact and lowered delay to 21, but area rose;
  best `364/21/7644`, no new best over `341/22/7502`.  ex246 seed228 and case
  attribute follow-ups were also worse.  ex247 bound-smallpat class-id factoring
  reduced 49 sigpair rows to 29 shared attribute classes but added too much
  indirection; best `421/31/13051`, no new best over `365/25/9125`.
- `student/runs/float_fp8/ex250_ex254_frontend_fp4_dot_fma_semantic_fix_20260608_2110/`:
  first exact semantic pass for ex250-ex254.  Identified packed FP4/INT2 dot
  and FMA-like operators, not plain FP8 add/conversion.  New bests included
  ex250 `598/43/25714`, ex251 `495/38/18810`, ex252 `149/25/3725`,
  ex253 `124/27/3348`, and ex254 `1615/61/98515`.
- `student/runs/float_fp8/ex254_frontend_fp4_product_e4add_20260608_2210/`:
  rewrote ex254 as `E4M3 accumulator + E4M3(FP4 product)` using the ex240
  compact GRS add source.  This improved ex254 to `664/56/37184`, beating
  reference ADP.
- `student/runs/float_fp8/ex252_ex253_frontend_u2_balanced_tree_20260608_2220/`:
  balanced source-level adder trees for the unsigned 2-bit dot/reduction
  cases.  Improved ex252 to `145/21/3045` and ex253 to `126/20/2520`.
- `student/runs/float_fp8/ex252_ex253_frontend_u2_parallel_case_20260608_2230/`:
  parallel-case hints on the balanced u2 sources.  Exact, but no improvement
  beyond the balanced tree run.
- `student/runs/float_fp8/ex250_ex252_ex253_frontend_field_threshold_20260608_2218/`:
  focused threshold/field quantizer checks.  Exact, but no new best; ex250
  unrolled normalizer and ex252/ex253 hand threshold-field quantizers were
  ADP-worse than existing qcase structures.
- `student/runs/float_fp8/ex252_ex253_frontend_weighted_popcount_20260608_2224/`:
  weighted bit-count rewrite.  ex253 low/high-bit popcount plus reachable
  lane-sum qcase improved ex253 to `126/18/2268`; ex252 partial-product
  popcount was exact but worse.
- `student/runs/float_fp8/ex252_ex253_frontend_handmul_popthreshold_20260608_2229/`:
  ex252 hand-written 2x2 product tied `145/21/3045`; ex253 popcount plus
  threshold-field quantizer was exact but worse than popcount lane-qcase.
- `student/runs/float_fp8/ex253_frontend_popcount_2dcase_20260608_2234/`:
  direct `{hi_count,lo_count}` 2D quant table removed the final lane-sum adder
  and lowered ex253 delay to 17, but area rose to 193 and ADP was worse.
- `student/runs/float_fp8/ex252_ex253_frontend_bitformula_20260608_2240/`:
  minimized output-bit formulas for ex252/ex253 sums.  Exact, but both were
  ADP-worse than the retained qcase structures.
- `student/runs/float_fp8/ex250_frontend_reachable_qcase_20260608_2247/`:
  reachable-only abs-sum qcase for ex250.  Exact but worse; the unreachable
  abs-sum rows did not become useful global don't-cares in this source form.
- `student/runs/float_fp8/ex250_frontend_magprod_20260608_2254/`,
  `student/runs/float_fp8/ex250_frontend_magprod_quant_followup_20260608_2258/`,
  and `student/runs/float_fp8/ex250_frontend_magarith_20260608_2303/`:
  FP4 product factoring for ex250.  Magnitude product/decode plus sign xor
  improved ex250 to `413/41/16933`, beating reference.  qcase stayed better
  than qrange/unrolled quantizers; magnitude arithmetic tied the magnitude
  product table best.
- `student/runs/float_fp8/ex254_frontend_product_magfactored_20260608_2310/`:
  factored ex254 low-byte FP4 product-to-E4 conversion as magnitude table plus
  sign/negative-zero logic before the compact ex240 E4 add GRS core.  Improved
  ex254 to `662/55/36410`; official `evaluate.py` replay OK.  The same replay
  also confirmed the updated ex250 `413/41/16933` and ex253 `126/18/2268`
  AIGs from `student/work/ex250_ex253_ex254_evaluate_replay_20260608_2314/`.

## Seed Bundles

- `student/seeds/float_fp8/ex240_ex254_current/`: best-only seed bundle, one
  verified Verilog/AIG pair per case.  `results/best.csv` and
  `results/candidates.csv` both contain 15 rows.
- `student/seeds/float_fp8/ex240_ex254_backend_candidates_20260608_2327/`:
  non-best backend-start alternatives, four verified candidates per case
  (60 rows total).  Selection prioritized low ADP and distinct source Verilog;
  for candidate-sparse cases such as `ex251`, same-source verified synthflow
  alternatives were used only to reach the requested five total seeds per case.
