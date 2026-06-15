# ex249 Frontend Attempts

Function hypothesis: E5M2FN packed FP8 hypot(abs(high), abs(low)).

Reference row: area/delay/ADP/score = `189/11/2079/3118.5`.

Current known best: `ex249_semantic_hypot_threshold_rawexp_synth_preset_aig`,
`168/26/4368`, ratio `2.101010`.

## Attempt Log

- 2026-06-08: exact semantic match for E5M2FN hypot of operand magnitudes,
  positive output sign, and canonical `8'h7f` NaN.
- Tried and excluded:
  - max+delta table: exact but large.
  - delta BDD: area near reference but delay too high.
  - formula threshold with broad OR predicates: exact but delay 36.
  - limited `abc -D` delay-target synthflow: no improvement.
- Best structure: raw-exponent gap0/gap1 threshold case.  Nonzero delta only
  occurs for effective exponent gap 0 or 1; saturation can be expressed by
  `maxc==7'h7e` or `maxc==7'h7d && delta==2`.

## 2026-06-13 00:06 +0800 Round19 Continuation

- Agent/run: `fp8-existing-r19` /
  `ex200_ex299_frontend_refgap_round19_20260612_2346`.
- Source basis: copied current frontend-best Verilog
  `student/work/ex249_frontend_fp8_e5m2_hypot_rawexp_20260608_1712/ex249/verilog/ex249_semantic_hypot_threshold_rawexp.v`.
- Method signature:
  `ex249|E5M2FN packed hypot|raw-exp threshold active-gap noabc rewrite|shared abs max/min decode plus kept active-gap gate|yosys_no_abc_aigmap|exact_e5m2fn_hypot_abs_high_low|threshold_delta_table_outputs`.
- Material change: introduced a kept `active_gap` wire for `gap0 || gap1` and
  used `yosys_synth.py --no-abc`, so this is a synth-flow/source-boundary
  change rather than an exact replay of the raw-exp threshold source.
- Official result: `evaluate.py` OK, `307/40/12280`.
- Paths: Verilog
  `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fp8-existing-r19/ex249/verilog/ex249_round19_activegap_noabc.v`;
  AIG
  `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fp8-existing-r19/ex249/aigs/ex249.aig`;
  evaluate log
  `student/work/ex200_ex299_frontend_refgap_round19_20260612_2346/fp8-existing-r19/ex249/logs/ex249_round19_activegap_noabc.official_evaluate.log`.
- Outcome: equivalent but nonwinning versus current frontend `168/26/4368`
  and reference `189/11/2079`; do not repeat this no-ABC active-gap flow.

## 2026-06-12 Round16 coordinator-flow-r16

- method_signature: `ex249|E5M2FN packed hypot abs(high,low)|round15 grouped raw-exponent delta-bit formulas|raw exponent gap0/gap1 predicates with grouped output delta bits instead of delta table|yosys_synth_default_abc_g_AND_official_evaluate|exact_e5m2fn_hypot_abs|output_grouped_delta_bits`
- official result: `OK 184/28/5152`; improved frontend `0`; beats reference `0`.
- paths: Verilog `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/coordinator-flow-r16/ex249/verilog/ex249_semantic_hypot_rawexp_grouped_delta_bits_r16_and.v`; AIG `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/coordinator-flow-r16/ex249/aigs/ex249_semantic_hypot_rawexp_grouped_delta_bits_r16_abc_and.aig`; log `student/work/ex200_ex299_frontend_refgap_round16_20260612_2233/coordinator-flow-r16/ex249/logs/ex249_semantic_hypot_rawexp_grouped_delta_bits_r16_abc_and.evaluate.py.log`.
- outcome: standard `yosys_synth.py` AND flow worsened the round15 grouped-delta source; future attempts need changed raw-exp grouping or source-level predicate factoring.

## 2026-06-13 Round25 fp8-r25

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round25_20260613_0506/agent_shards/fp8-r25/`.
- Tested method family: `ex249|E5M2FN packed hypot abs(high,low)|gap-split delta functions|shared max/min decode plus separate gap0 gap1 delta functions|yosys_multi_official_evaluate|exact_e5m2fn_hypot_abs_high_low|max_plus_delta_gap_split`.
- Official `evaluate.py` rows: `0/2` OK.
- Outcome: no equivalent candidate; see shard `evaluation_results.csv` and logs.
- Next action: `debug official non-equivalence before any QoR claim`.

## 2026-06-13 Round25 fp8-wide-r25

- Campaign: `student/frontend_campaigns/campaigns/ex240_ex299_frontend_gt2_round25_20260613_0531/agent_shards/fp8-wide-r25/`.
- Tested method families: `6` candidates across `2` materially different representations.
- Official `evaluate.py` rows: `6/6` OK.
- Best observed: `ex249_r25w_maxeff_delta_synth_preset_aig`, `266/37/9842`, improved frontend `0`, beats reference `0`.
- Paths: Verilog `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-wide-r25/ex249/verilog/ex249_r25w_maxeff_delta_synth_preset_aig.v`; AIG `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-wide-r25/ex249/aigs/ex249_r25w_maxeff_delta_synth_preset_aig.aig`; log `student/work/ex240_ex299_frontend_gt2_round25_20260613_0531/fp8-wide-r25/ex249/logs/ex249_r25w_maxeff_delta_synth_preset_aig.evaluate.py.log`.
- Next action: `try source-level arithmetic factoring only if it changes semantic coordinates or sharing materially`.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `` `//`.
- Current frontend baseline used by this worker: `4368`; reference ADP `2079`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: ``.
- Next action: Debug non-equivalence or choose a different representation family.


## 2026-06-13 Round26 fp8-r26

- Campaign: `student/frontend_campaigns/campaigns/ex200_ex299_frontend_refgap_round26_20260613_0539/agent_shards/fp8-r26/`.
- Best official candidate in this shard: `ex249_r26_threshold_case_synth_preset_aig` `164/29/4756`.
- Current frontend baseline used by this worker: `4368`; reference ADP `2079`.
- Outcome: improved frontend `0`; beats reference `0`.
- Evidence: `student/work/ex200_ex299_frontend_refgap_round26_20260613_0539/fp8-r26/ex249/logs/ex249_r26_threshold_case_synth_preset_aig.evaluate.py.log`.
- Next action: Try a new high-level representation; do not repeat this r26 source as-is.

## 2026-06-13 Round62 sub-fp8-addhyp-r62

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/`.
- Source-only families tried: raw-exp output-bit grouping and shared hypot delta/saturation predicates, avoiding round54 delta-inc/limited-carry replay.
- Official `evaluate.py` rows: equivalent rows included in `results/evaluation_results.csv`.
- Best observed: `ex249_ex249_r62_outbit_grouped_rawexp_abc_g_aig_raw`, `172/28/4816`.
- Current frontend best remains `167/26/4342`; reference `2079`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round62_20260613_0907/agent_shards/sub-fp8-addhyp-r62/evaluation_results.csv`.
- Outcome: no frontend-best improvement. Do not repeat raw-exp output-bit grouping unchanged; next attempt needs a shallow hypot predicate basis rather than another delta-inc or limited-carry source.

## 2026-06-13 10:17:05 +0800 Round64 sub-fp8-add-alt-r64

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/`.
- Dossier: `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-add-alt-r64/ex249/notes/high_level_dossier.md`.
- Source-only families tried:
  - ratio-of-min-to-max predicates sharing the active-gap and saturation shell;
  - squared-ratio delta case keyed by `smin^2` and `smax`;
  - selected residual threshold-case control without output-bit grouping.
- Best official candidate: `ex249_ex249_r64_threshold_case_control_synth_preset_raw`, `176/30/5280`.
- method_signature: `ex249|fp8_source_restructure|ex249_r64_threshold_case_control|selected_residual_case_control_without_output_bit_grouping|synth_preset|raw|official_evaluate|full_word`.
- Paths: Verilog `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-add-alt-r64/ex249/ex249_r64_threshold_case_control/verilog/ex249_r64_threshold_case_control.v`; AIG `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-add-alt-r64/ex249/ex249_r64_threshold_case_control/aigs/ex249_ex249_r64_threshold_case_control_synth_preset_raw.aig`; log `student/work/frontend_source_parallel_round64_20260613_1004/sub-fp8-add-alt-r64/ex249/ex249_r64_threshold_case_control/logs/ex249_ex249_r64_threshold_case_control_synth_preset_raw.evaluate.py.log`.
- Official result: `evaluate.py` OK, but no frontend improvement versus `4342` and no reference win versus `2079`. The ratio-formula family was non-equivalent; the squared-ratio case was equivalent but worse, best `181/32/5792`.
- Shard CSVs: `student/frontend_campaigns/campaigns/frontend_source_parallel_round64_20260613_1004/agent_shards/sub-fp8-add-alt-r64/`.
- Next action: do not replay ratio formula or squared-ratio case unchanged; seek a new shallow predicate basis or a different active-gap/max-min implementation.

## 2026-06-13 Round74 sub-fp8-addhyp-r74

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/`.
- Dossier: `student/work/frontend_source_parallel_round74_20260613_1439/sub-fp8-addhyp-r74/ex249/notes/high_level_dossier.md`.
- Source-only families tried: split inc1/inc2 delta predicates, increment mux tail, direct limited-carry incrementer, effective-exponent gap rewrite, OR predicate form, and case attributes around the raw-exp threshold source.
- Official `evaluate.py` rows: `9/9` equivalent.
- Best observed: `ex249_ex249_effgap_inc_mux_repo_yosys`, `180/30/5400`.
- Current frontend target used by this shard: `4342`; reference `2079`; improved frontend `0`; beats reference `0`.
- Evidence: `student/frontend_campaigns/campaigns/frontend_source_parallel_round74_20260613_1439/agent_shards/sub-fp8-addhyp-r74/evaluation_results.csv`.
- Next action: the active-gap predicate rewrites still trade delay poorly; look for a new shallow basis for delta/saturation rather than another split-increment tail.

## 2026-06-13 Round75 sub-fp8-mid-r75

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/`.
- Dossier: `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp8-mid-r75/ex249/notes/high_level_dossier.md`.
- Source-only families tried: PO-clustered NaN/saturation/output tail over the raw-exp threshold source, and an effective-gap active shell that retained the original delta table.
- Method signatures:
  - `ex249|E5M2FN hypot abs(high,low)|PO-clustered nan/saturation/output tail over raw-exp threshold source|shared raw exponent gap0/gap1 threshold delta table|repo_yosys_frontend_default|official_evaluate|full_word`
  - `ex249|E5M2FN hypot abs(high,low)|effective-gap active shell retaining original delta table|shared max/min decode with a single active-gap predicate|repo_yosys_frontend_default|official_evaluate|full_word`
- Official `evaluate.py` rows: `2/2` equivalent. Best observed: `ex249_r75_clustered_po_tail`, `189/29/5481`.
- Current frontend/current-target/reference used by this shard: `4342` / `3339` / `2079`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round75_20260613_1507/agent_shards/sub-fp8-mid-r75/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round75_20260613_1507/sub-fp8-mid-r75/ex249/logs/ex249_r75_clustered_po_tail.evaluate.py.log`.
- Next action: these source-tail rewrites preserve exactness but worsen delay; do not repeat them unchanged.

## 2026-06-13 Round76 sub-fp8-mid-r76

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/`.
- Frontend/source-only families tried:
  - `rawexp_threshold_semantic`: shared raw-exponent max/min decode, ordered_abs, gap0/gap1 threshold delta, saturation guard.
  - `threshold_case_semantic`: threshold-case delta classification keyed by max/min significand and active gap.
- Official `evaluate.py` rows: `2/2` equivalent.
- Best observed: `ex249_r76_threshold_case_semantic`, `185/30/5550`.
- Current frontend/current-target/reference used by this shard: `4342` / `3339` / `2079`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round76_20260613_1706/agent_shards/sub-fp8-mid-r76/evaluation_results.csv`; best log `student/work/frontend_source_parallel_round76_20260613_1706/sub-fp8-mid-r76/ex249/logs/ex249_r76_threshold_case_semantic.evaluate.py.log`.
- Next action: both bounded non-r75 semantic forms remain delay-heavy; a useful next step needs a shallower delta/saturation predicate basis, not another raw-exp threshold wrapper.


## 2026-06-13 17:44:49 +0800 Round77 sub-fp8-mid-source-r77

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/`.
- Dossier: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex249/notes/high_level_dossier.md`.
- Frontend/source-only families tried: keep-boundary semantic predicates, grouped sign/magnitude output vector wrapper, per-bit output decomposition, and flattened/staged source form around the current exact high-level source.
- Method signatures: see shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-fp8-mid-source-r77/evaluation_results.csv`.
- Official `evaluate.py` rows: `3/4` equivalent.
- Best observed: `ex249_r77_grouped_vector` `191/29/5539`.
- Current frontend/current-target/reference used by this shard: `4342` / `3339` / `2079`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex249/logs/ex249_r77_grouped_vector.evaluate.py.log`.
- Next action: do not repeat these r77 source-boundary/output-grouping variants unchanged; pursue a genuinely smaller semantic residual or predicate basis.


## 2026-06-13 17:48:08 +0800 Round77 keep-annotation correction sub-fp8-mid-source-r77

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/`.
- Dossier: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex249/notes/high_level_dossier.md`.
- Frontend/source-only families tried: keep-boundary semantic predicates, grouped sign/magnitude output vector wrapper, per-bit output decomposition, and flattened/staged source form around the current exact high-level source.
- Method signatures: see shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round77_20260613_1733/agent_shards/sub-fp8-mid-source-r77/evaluation_results.csv`.
- Official `evaluate.py` rows: `4/4` equivalent.
- Best observed: `ex249_r77_keep_boundary` `173/28/4844`.
- Current frontend/current-target/reference used by this shard: `4342` / `3339` / `2079`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: `student/work/frontend_source_parallel_round77_20260613_1733/sub-fp8-mid-source-r77/ex249/logs/ex249_r77_keep_boundary.evaluate.py.log`.
- Next action: do not repeat these r77 source-boundary/output-grouping variants unchanged; pursue a genuinely smaller semantic residual or predicate basis.


## 2026-06-13 18:04:58 +0800 Round78 sub-fp8-mid-enum-r78

- Campaign: `student/frontend_campaigns/campaigns/frontend_source_parallel_round78_20260613_1744/`.
- Dossier: `student/work/frontend_source_parallel_round78_20260613_1744/sub-fp8-mid-enum-r78/ex249/notes/high_level_dossier.md`.
- Frontend/source-only families tried: sparse semantic-wire keep, grouped helper 4+4 output split, grouped helper field output split, flattened staged core, and ex249-only tiny residual predicates keyed by existing semantic wires.
- Method signatures: see shard CSV `student/frontend_campaigns/campaigns/frontend_source_parallel_round78_20260613_1744/agent_shards/sub-fp8-mid-enum-r78/evaluation_results.csv`.
- Official `evaluate.py` rows: `4/5` equivalent.
- Best observed: `ex249_r78_sparse_semantic_keep` `177/30/5310`.
- Current frontend/current-target/reference used by this shard: `4342` / `3339` / `2079`; improved frontend `0`; beats current target `0`; beats reference `0`.
- Evidence: `student/work/frontend_source_parallel_round78_20260613_1744/sub-fp8-mid-enum-r78/ex249/logs/ex249_r78_sparse_semantic_keep.evaluate.py.log`.
- Next action: source-boundary/output splitting did not close the target gap unless noted above; continue only with a materially smaller semantic residual or predicate basis.

## 2026-06-14 12:29:00 +0800 fp8-tail-transfer-r2

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-tail-transfer-r2/`.
- Frontend-only families tried: raw-exp active-gap direct delta predicates, selected delta carry overlay, and current rawexp high bits mixed with direct-tail low bits.
- Official `evaluate.py` rows: `3/3` equivalent. Best observed: `ex249_r2_current_tail_conemix_abc_g_aig_frontend` `169/28/4732`.
- Current frontend/reference used by this shard: `4368` / `2079`; improved frontend `0`; beats reference `0`.
- Evidence: `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex249/verilog/ex249_r2_current_tail_conemix_abc_g_aig_frontend.v`, `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex249/aigs/ex249_r2_current_tail_conemix_abc_g_aig_frontend.aig`, `student/runs/float_fp8/ex204_ex299_frontend_continuation_20260614_1216/fp8-tail-transfer-r2/ex249/logs/ex249_r2_current_tail_conemix_abc_g_aig_frontend.evaluate.py.log`.
- Next action: do not repeat active-gap direct delta, carry-overlay, or current/tail cone mix unchanged; ex249 needs a new shallow delta/saturation predicate basis.

## 2026-06-14 13:00:55 +0800 fp8-output-plane-r3

- Campaign: `student/frontend_campaigns/campaigns/ex204_ex299_frontend_continuation_20260614_1216/agent_shards/fp8-output-plane-r3/`.
- Dossier: `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex249/notes/high_level_dossier.md`.
- Frontend-only family tried: split the current raw-exponent delta table into separate gap0 and gap1 decision planes while sharing ordered magnitude decode and saturation guard.
- Official `evaluate.py`: `ex249_r3_gap_split_delta_planes` OK `170/28/4760`.
- Current frontend/reference used by this shard: `4368` / `2079`; improved frontend `0`; beats reference `0`.
- Evidence: Verilog `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex249/verilog/ex249_r3_gap_split_delta_planes.v`; AIG `student/work/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex249/aigs/ex249_r3_gap_split_delta_planes.aig`; log `student/runs/float_fp8/ex204_ex299_frontend_continuation_20260614_1216/fp8-output-plane-r3/ex249/logs/ex249_r3_gap_split_delta_planes.evaluate.py.log`.
- Next action: do not repeat this gap0/gap1 table split unchanged; it is exact but loses the current rawexp threshold source's area/delay balance.
