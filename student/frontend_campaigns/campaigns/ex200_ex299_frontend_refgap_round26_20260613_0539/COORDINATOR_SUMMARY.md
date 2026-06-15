# Round26 Coordinator Summary

Run ID: `ex200_ex299_frontend_refgap_round26_20260613_0539`

## Merge Status

- Merged agents: `unknown-large-r26`, `unknown-sym-r26`, `fp8-r26`, `mixed-r26`, `coordinator-integer-r26`.
- Recovery shard `coordinator-unknown-large-r26-reconstruct` was superseded by the official `unknown-large-r26` shard and was not included in the merged result CSVs.
- Candidate rows: `81`
- Evaluation rows: `83` (`77` OK/equivalent, `4` NOT_EQUIV).
- Best improvements: `0`.
- Failed/nonwinning hypotheses: `90`.
- Path and official evaluate.py metric sanity: passed; checked 154 OK/equivalent log metric rows with 0 errors.

## Outcome By Case

| case | agent | status | best observed | current frontend | reference | next action |
|---|---|---|---:|---:|---:|---|
| `ex297` | `unknown-large-r26` | `EVALUATED_NO_FRONTEND_IMPROVEMENT` | ex297_r26_cellprefix_mod4_descriptor_mod4_output_planes_abc_g_aig (38841/27/1048707) | 568674 | 225900 | official evaluate.py OK; 38841/27/1048707 |
| `ex299` | `unknown-large-r26` | `EVALUATED_NO_FRONTEND_IMPROVEMENT` | ex299_r26_cellprefix_bridge_cell_pairs_abc_g_aig (146475/32/4687200) | 2486379 | 1013807 | official evaluate.py OK; 146475/32/4687200 |
| `ex294` | `unknown-large-r26` | `EVALUATED_NO_FRONTEND_IMPROVEMENT` | ex294_r26_stride2suffix_adjacent_adjacent_pairs_abc_g_aig (71073/30/2132190) | 246698 | 133365 | official evaluate.py OK; 71073/30/2132190 |
| `ex295` | `unknown-large-r26` | `EVALUATED_NO_FRONTEND_IMPROVEMENT` | ex295_r26_cellprefix_mod4_descriptor_mod4_output_planes_abc_g_aig (9977/23/229471) | 123270 | 68064 | official evaluate.py OK; 9977/23/229471 |
| `ex292` | `unknown-large-r26` | `EVALUATED_NO_FRONTEND_IMPROVEMENT` | ex292_r26_stride2prefix_mod4_output_planes_abc_g_aig (25046/25/626150) | 135780 | 84854 | official evaluate.py OK; 25046/25/626150 |
| `ex286` | `unknown-sym-r26` | `no_frontend_improvement` | ex286_r26_pairfield_shared_bdd (2308/21/48468) | 20190 | 2376 | No improvement; continue only with a different hidden-state or cheaper encoded-field sharing basis. |
| `ex287` | `unknown-sym-r26` | `no_frontend_improvement` | ex287_r26_pairfield_split_bdd (1591/21/33411) | 27390 | 5782 | No improvement; continue only with a different hidden-state or cheaper encoded-field sharing basis. |
| `ex285` | `unknown-sym-r26` | `no_frontend_improvement` | ex285_r26_pairfield_split_bdd (1515/18/27270) | 13175 | 5499 | No improvement; continue only with a different hidden-state or cheaper encoded-field sharing basis. |
| `ex288` | `unknown-sym-r26` | `no_frontend_improvement` | ex288_r26_pairfield_split_bdd (4080/23/93840) | 31598 | 16394 | No improvement; continue only with a different hidden-state or cheaper encoded-field sharing basis. |
| `ex247` | `fp8-r26` | `no_frontend_improvement` | ex247_r26_qclass_nested_synth_preset_aig (309/30/9270) | 8349 | 2975 | Try a new high-level representation; do not repeat this r26 source as-is. |
| `ex246` | `fp8-r26` | `no_frontend_improvement` | ex246_r26_qclass_seed12_synth_preset_aig (371/24/8904) | 7502 | 2805 | Try a new high-level representation; do not repeat this r26 source as-is. |
| `ex244` | `fp8-r26` | `no_frontend_improvement` | ex244_r26_threshold_packed_synth_preset_aig (286/39/11154) | 10234 | 4272 | Try a new high-level representation; do not repeat this r26 source as-is. |
| `ex240` | `fp8-r26` | `no_frontend_improvement` | ex240_r26_samedelta_diffdirect_synth_preset_aig (1078/49/52822) | 30090 | 13299 | Try a new high-level representation; do not repeat this r26 source as-is. |
| `ex245` | `fp8-r26` | `no_frontend_improvement` | ex245_r26_gap_class_synth_preset_aig (701/34/23834) | 23834 | 11050 | Try a new high-level representation; do not repeat this r26 source as-is. |
| `ex241` | `fp8-r26` | `no_frontend_improvement` | ex241_r26_product_dc_low_synth_preset_aig (680/33/22440) | 15544 | 7224 | Try a new high-level representation; do not repeat this r26 source as-is. |
| `ex242` | `fp8-r26` | `no_frontend_improvement` | ex242_r26_formula_bit_exception_synth_preset_aig (1328/25/33200) | 25320 | 11900 | Try a new high-level representation; do not repeat this r26 source as-is. |
| `ex249` | `fp8-r26` | `no_frontend_improvement` | ex249_r26_threshold_case_synth_preset_aig (164/29/4756) | 4368 | 2079 | Try a new high-level representation; do not repeat this r26 source as-is. |
| `ex248` | `fp8-r26` | `no_frontend_improvement` | ex248_r26_periodic_formula_norm_synth_preset_aig (277/33/9141) | 8550 | 4180 | Try a new high-level representation; do not repeat this r26 source as-is. |
| `ex225` | `mixed-r26` | `blocked_no_candidate` | none | 218728 | 116676 | round26 diagnostic confirms dense positive-normal residual; min reused segment shapes hi3..hi6=0; nested/sparse/full-bitrun replay remains banned |
| `ex223` | `mixed-r26` | `blocked_no_candidate` | none | 203756 | 120549 | round26 diagnostic confirms dense positive-normal residual; min reused segment shapes hi3..hi6=0; nested/sparse/full-bitrun replay remains banned |
| `ex274` | `mixed-r26` | `evaluated_no_improvement` | ex274_r26_square_frontend_hybrid_bddtop2_trunc_order_outside_synth_preset_d40 (987/43/42441) | 41370 | 21630 | best official shard row; frontend=41370 overall=25454 reference=21630 |
| `ex218` | `mixed-r26` | `evaluated_no_improvement` | ex218_r26_bf16_recip_cube_delta_pair_mode_hilo4_bits_8_15_bh2_abc_g_gates (598/15/8970) | 5941 | 3222 | best official shard row; frontend=5941 overall=4120 reference=3222 |
| `ex204` | `mixed-r26` | `evaluated_no_improvement` | ex204_r26_bf16_log2_log2_arithbase_delta_hilo3_bits_11_14_pla_abc_g_gates (1528/17/25976) | 24576 | 15180 | best official shard row; frontend=24576 overall=21150 reference=15180 |
| `ex266` | `mixed-r26` | `evaluated_no_improvement` | ex266_r26_int_highgap_udiv_ex266_hybrid_top1_a43_synth_preset_d10 (142/11/1562) | 1480 | 848 | best official shard row; frontend=1480 overall=1296 reference=848 |
| `ex273` | `mixed-r26` | `evaluated_no_improvement` | ex273_r26_square_frontend_wallace_square_outside_csel4_abc_g_gates (727/38/27626) | 26301 | 15078 | best official shard row; frontend=26301 overall=18860 reference=15078 |
| `ex260` | `mixed-r26` | `evaluated_no_improvement` | ex260_r26_signed_mul_baugh_wooley_wallace_rev_hcla4_abc_g_gates (90/13/1170) | 1144 | 657 | best official shard row; frontend=1144 overall=1066 reference=657 |
| `ex276` | `coordinator-integer-r26` | `tested_no_frontend_best` | ex276_r26_prefix4_casebits_global_hi43_synth_preset (112/10/1120) | 1010 | 632 | round26 coordinator per-output casebits probe |

## Coordinator Decision

- No global frontend best update was made because no round26 candidate beat the current frontend best.
- `search_state.csv` was updated for the 27 assigned cases to mark the round26 nonwinning or blocked result.
- `frontend_best_registry.csv`, `current_frontend_gap.csv`, and `student/seeds` were not changed.
