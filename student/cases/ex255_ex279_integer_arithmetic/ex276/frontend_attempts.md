# ex276 Frontend Attempts

Semantics: integer square root, `isqrt(x)`.

Initial semantic seeds:
- `ex276_isqrt_direct`: 102/28/2856
- `ex276_isqrt_threshold_chain`: 144/28/4032

Current verified frontend best:
- `ex276_isqrt_prefix4_ge_bitwise_synth_preset`: 101/10/1010, ref ADP 632, ratio 1.598101.

Notes:
- Exact unsigned floor isqrt over 1024 inputs.
- Earlier prefix4 bitwise replaced the old baseline row and reduced ADP by
  60.9%; the new shared-ge rewrite reduced area by one more node while keeping
  delay 10.
- The most useful direction is prefix4 shared boundary classification:
  generate local threshold/ge wires once per bucket, then derive all output
  bits from those thermometer flags.
- Tested but losing follow-ups: mixed prefix4/prefix5 bit hybrids, prefix6
  tree/bitwise classifiers, deeper cofactor BDDs, prefix4 low-bucket
  refinement, ANF or support formulas for high bits plus prefix4 low bits,
  selected low-bit cofactor BDD plus ANF high bits, and limited gateflow replay
  on the new best.
- Cofactor reverse BDD improved earlier rows to 114/10/1140 but lost to
  prefix4 shared-ge.
- Exact but losing directions: direct/trial loop, threshold chain/XOR,
  bit-interval OR, restoring/radix variants, support-reduced formulas, one-hot
  prefix decode, BDD order presets, high-bit formula plus low BDD, QM/SOP,
  thermometer popcount, gate/synthflow sweeps, and prefix delta.
- Still outside 1.5x reference; likely needs a shallower shared classifier that
  reduces either delay to 9 at similar area or area below about 94 at delay 10.

## 2026-06-09 High-Gap Follow-Up

Additional run/result location:

- `student/runs/integer/ex266_ex267_ex276_frontend_highgap_struct_20260609_1732/results/`

New exact but rejected directions:

- Hand-derived high-bit formulas for `out[4]` and `out[3]` combined with
  prefix3/prefix4 shared-ge lower bits.
- Balanced square-threshold word tree.

Result:

- No new best.  The best hand-high-bit rows were `108/11/1188`, worse than the
  current `101/10/1010`.
- This confirms that q4/q3 alone are not the current bottleneck; the missing
  structure likely has to share the lower-bit threshold/classifier logic more
  efficiently, not merely replace the obvious high bits.

## 2026-06-09 Threshold-Toggle Follow-Up

Additional run/result location:

- `student/runs/integer/ex266_ex276_frontend_highgap_struct2_20260609_1750/results/`

Tested:

- Direct output-bit toggle formulas from square thresholds: each output bit is
  an XOR of `in >= q*q` toggle points.
- Shared-threshold version that materializes all `ge(q*q)` wires once.

Result:

- No new best.  Best row was `isqrt_threshold_toggle_shared` at `130/11/1430`,
  far worse than current `101/10/1010`.
- This rules out the simple shallow-threshold expression family.  The useful
  structure is still the prefix4 shared-ge bucket classifier, unless a more
  compact lower-bit sharing method is found.

## 2026-06-12 mixed-r12 official row

Run ID: `ex200_ex299_frontend_refgap_round12_20260612_2015`, agent `mixed-r12`.

- Method signature: `ex276|unsigned_isqrt_candidate_square_chain|dynamic_candidate_square_refinement|shared_candidate_squares_and_ge_decisions|yosys_abc_g_aig|floor_isqrt_10_to_5|word_output`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/mixed-r12/ex276/verilog/ex276_isqrt_candidate_square_chain.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/mixed-r12/ex276/synthflow/ex276/aigs/ex276_candidate_square_chain_abc_g_aig.aig`.
- Official `evaluate.py`: equivalent, `86/24/2064`; log `student/work/ex200_ex299_frontend_refgap_round12_20260612_2015/mixed-r12/ex276/logs/ex276_candidate_square_chain_abc_g_aig.evaluate.py.log`.
- Outcome: nonwinning. This is a useful blocker because area drops below the current frontend, but the candidate-square refinement path is too deep; future work needs a shallower shared classifier at delay 9-10.

## 2026-06-12 round15 coordinator source-form probe

Run ID: `ex200_ex299_frontend_refgap_round15_20260612_2211`, agent `coordinator-integer-r15`.

- Method signature: `ex276|unsigned_isqrt_prefix5_case_lsb|prefix5_hi_case_word_mux|shared_lo_thresholds_per_hi_bucket|yosys_abc_and|floor_isqrt_10_to_5|case_word_output`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round15_20260612_2211/coordinator-integer-r15/ex276/verilog/ex276_r15_prefix5_case_lsb.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round15_20260612_2211/coordinator-integer-r15/ex276/aigs/ex276_r15_prefix5_case_lsb_abc_and.aig`.
- Official `evaluate.py`: equivalent, `136/11/1496`; log `student/work/ex200_ex299_frontend_refgap_round15_20260612_2211/coordinator-integer-r15/ex276/logs/ex276_r15_prefix5_case_lsb_abc_and.evaluate.py.log`.
- Outcome: nonwinning. Changing the prefix5 final nested hi-bucket mux to an explicit case-word mux did not recover the missing sharing; it worsened both area and delay versus the current prefix4 shared-ge frontend best `101/10/1010`.

## 2026-06-12 integer-struct-r16 official rows

Run ID: `ex200_ex299_frontend_refgap_round16_20260612_2233`, agent `integer-struct-r16`.

- Method signature: `ex276|digit-by-digit_radix4_sqrt_may_avoid_the_prefix_threshold_ladder_shape|radix4_wire-level_integer_sqrt_refinement|shared_candidate/remainder_decision_wires_across_sqrt_bits|yosys_synth_preset_d8|floor_isqrt_10_to_5|whole_sqrt_word`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex276/verilog/ex276_r16_radix4_wires.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex276/aigs/ex276_r16_radix4_wires_synth_preset_d8.aig`.
- Official `evaluate.py`: equivalent, `93/17/1581`; log `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/integer-struct-r16/ex276/logs/ex276_r16_radix4_wires_synth_preset_d8.evaluate.py.log`.
- Outcome: nonwinning. This was materially different from the round15 segmented threshold/prefix case-mux probes, but the digit-by-digit refinement path is too deep compared with the current prefix4 shared-ge frontend `101/10/1010`.

## 2026-06-12 integer-existing-r19 checkpoint row

Run ID: `ex200_ex299_frontend_refgap_round19_20260612_2346`, agent `integer-existing-r19`.

- Method signature: `ex276|prefix4_output_mux_tree_source_flow_probe|prefix4_shared_ge_buckets_with_balanced_hi_word_mux|balanced_binary_hi_mux_and_no_internal_abc_flow|yosys_noabc_aigmap|floor_isqrt_10_to_5|sqrt_word`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/integer-existing-r19/ex276/verilog/ex276_isqrt_prefix4_ge_tree_mux_noabc.v`.
- AIG: `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/integer-existing-r19/ex276/official_eval/ex276_isqrt_prefix4_ge_tree_mux_noabc/ex276.aig`.
- Official `evaluate.py`: equivalent, `190/19/3610`; log `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/integer-existing-r19/ex276/logs/ex276_isqrt_prefix4_ge_tree_mux_noabc.evaluate.py.log`.
- Outcome: nonwinning. Copying the current prefix4 shared-ge source, changing only the high-bucket selector into a balanced mux tree, and skipping Yosys internal ABC is far worse than `101/10/1010`. Do not repeat this balanced-mux/no-ABC probe unchanged.

## 2026-06-13 coordinator-integer-r26 per-output casebits probe

Run ID: `ex200_ex299_frontend_refgap_round26_20260613_0539`, agent `coordinator-integer-r26`.

- Method family: `ex276|unsigned_isqrt_prefix4_per_output_interval_case|...|shared_hi_decode_low_interval_predicates|...|floor_isqrt_10_to_5|per_output_bits`.
- Verilog: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/coordinator-integer-r26/ex276/verilog/ex276_r26_prefix4_casebits_all.v` and `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/coordinator-integer-r26/ex276/verilog/ex276_r26_prefix4_casebits_global_hi43.v`.
- Best official `evaluate.py`: `ex276_r26_prefix4_casebits_global_hi43_synth_preset`, equivalent, `112/10/1120`; log `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/coordinator-integer-r26/ex276/logs/ex276_r26_prefix4_casebits_global_hi43_synth_preset.evaluate.py.log`.
- Outcome: nonwinning. Per-output prefix4 interval casebits and explicit q[4:3] extraction are materially different from the old word-mux source but still worse than the current frontend best `101/10/1010`. Do not repeat this family as-is; the remaining gap likely needs a genuinely smaller shared low-bit classifier or a delay-9 network.

## 2026-06-13 sub-integer-r74 official rows

Run ID: `frontend_source_parallel_round74_20260613_1439`, agent `sub-integer-r74`.

- `ex276_r74_isqrt_priority_threshold`: whole-word descending square-threshold priority ladder; official `evaluate.py` equivalent, `142/30/4260`.
- `ex276_r74_isqrt_restoring_loop`: unrolled combinational restoring square-root loop; official `evaluate.py` equivalent, `95/25/2375`.
- Shard rows: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-integer-r74/candidates.csv`.
- Logs: `student/work/frontend_source_parallel_round74_20260613_1439/sub-integer-r74/ex276/logs/`.
- Outcome: both are nonwinning versus current frontend `101/10/1010`. The restoring loop lowers area but is much too deep; the threshold priority row is both larger and deeper. This supports the current conclusion that ex276 needs a smaller shared low-bit classifier at delay 10 or a true delay-9 network.

## 2026-06-14 arith-unary-r2 continuation

Run ID: `ex204_ex299_frontend_continuation_20260614_1216`, agent `arith-unary-r2`.

- Families tested: prefix ge-tree, reverse cofactor BDD, and radix-4 isqrt wire variants.
- Official best from this shard: `ex276_isqrt_cofbdd4_reverse_abc_g_aig` at `114/10/1140`.
- Outcome: all rows were official equivalent but nonwinning versus frontend `101/10/1010`; cofactor BDD preserves delay 10 but remains too large.
