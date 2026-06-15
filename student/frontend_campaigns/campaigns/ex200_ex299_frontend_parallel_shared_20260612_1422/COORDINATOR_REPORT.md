# Coordinator Report

Run ID: `ex200_ex299_frontend_parallel_shared_20260612_1422`

## Summary

- Assigned cases: `43`
- Deduplicated official-equivalent candidate rows: `141`
- Accepted frontend-best improvements: `8`
- Cases beating reference after this campaign: `0`
- Full machine-readable outcome table: `results/case_outcomes.csv`

## Accepted Frontend Improvements

| case | new frontend ADP | old frontend ADP | reference | candidate |
|---|---:|---:|---:|---|
| `ex200` | 59232 | 63189 | 40052 | `ex200_semantic_exp_default_one_parallel_casez_saturation_abc_g_aig` |
| `ex204` | 25670 | 26265 | 15180 | `ex204_log2_arithbase_delta_hilo3_bits_11_14_bh3_abc_g_gates` |
| `ex205` | 71104 | 75871 | 47128 | `ex205_sep_fields_e3_m3_s0_bits_15_bh1_abc_g_aig` |
| `ex223` | 204193 | 234108 | 120549 | `ex223_log_nested_low14_hi5_abc_g_aig` |
| `ex224` | 96224 | 124380 | 64708 | `ex224_log_nested_low12_hi6_abc_g_aig` |
| `ex225` | 219070 | 264891 | 116676 | `ex225_log_nested_low14_hi5_abc_g_aig` |
| `ex256` | 2844 | 2862 | 1911 | `ex256_current_frontend_replay_post_dch` |
| `ex270` | 3230 | 3247 | 2076 | `ex270_current_frontend_replay_post_dch` |

## Per-Case Outcomes

### `bf16`

| case | frontend best ADP | reference | beat ref | result | next |
|---|---:|---:|---:|---|---|
| `ex200` | 59232 | 40052 | 0 | frontend_best_improved | derive lower-area exp mantissa mapping or backend-like balancing from frontend AIG |
| `ex204` | 25670 | 15180 | 0 | frontend_best_improved | reduce log2 arithbase/delta table area while preserving 17 levels |
| `ex205` | 71104 | 47128 | 0 | frontend_best_improved | reduce log10 field table area enough to cross 1.5x reference without adding delay |

### `fp16`

| case | frontend best ADP | reference | beat ref | result | next |
|---|---:|---:|---:|---|---|
| `ex223` | 204193 | 120549 | 0 | frontend_best_improved | shallow arithmetic exponent-base plus mantissa-correction normalizer |
| `ex224` | 96224 | 64708 | 0 | frontend_best_improved | only revisit with shallow normalizer; nested frontier confirmed within 1.5x reference |
| `ex225` | 219070 | 116676 | 0 | frontend_best_improved | shallow arithmetic exponent-base plus mantissa-correction normalizer |

### `float_fp8`

| case | frontend best ADP | reference | beat ref | result | next |
|---|---:|---:|---:|---|---|
| `ex240` | 30090 | 13299 | 0 | no_frontend_best_improvement | try new source-level arithmetic factoring; synth-flow probes and known alternative families did not beat frontend best |
| `ex241` | 15544 | 7224 | 0 | no_frontend_best_improvement | try new source-level arithmetic factoring; synth-flow probes and known alternative families did not beat frontend best |
| `ex242` | 25320 | 11900 | 0 | no_frontend_best_improvement | try new source-level arithmetic factoring; synth-flow probes and known alternative families did not beat frontend best |
| `ex244` | 10234 | 4272 | 0 | no_frontend_best_improvement | try new source-level arithmetic factoring; synth-flow probes and known alternative families did not beat frontend best |
| `ex245` | 23834 | 11050 | 0 | no_frontend_best_improvement | try new source-level arithmetic factoring; synth-flow probes and known alternative families did not beat frontend best |
| `ex246` | 7502 | 2805 | 0 | no_frontend_best_improvement | try new source-level arithmetic factoring; synth-flow probes and known alternative families did not beat frontend best |
| `ex247` | 9125 | 2975 | 0 | no_frontend_best_improvement | try new source-level arithmetic factoring; synth-flow probes and known alternative families did not beat frontend best |
| `ex248` | 8550 | 4180 | 0 | no_frontend_best_improvement | try new source-level arithmetic factoring; synth-flow probes and known alternative families did not beat frontend best |
| `ex249` | 4368 | 2079 | 0 | no_frontend_best_improvement | try new source-level arithmetic factoring; synth-flow probes and known alternative families did not beat frontend best |
| `ex253` | 2268 | 1845 | 0 | no_frontend_best_improvement | try new source-level arithmetic factoring; synth-flow probes and known alternative families did not beat frontend best |

### `integer`

| case | frontend best ADP | reference | beat ref | result | next |
|---|---:|---:|---:|---|---|
| `ex256` | 2844 | 1911 | 0 | frontend_best_improved | coordinator should merge proposed frontend-best update |
| `ex260` | 1144 | 657 | 0 | no_frontend_best_improvement | try hand-minimized shared 4x4 signed compressor predicates; final merge variants remain above reference |
| `ex261` | 2952 | 2041 | 0 | no_frontend_best_improvement | search signed 5x5 compressor row factoring rather than final merge templates |
| `ex266` | 1480 | 848 | 0 | no_frontend_best_improvement | derive smaller predicates inside the {b[4:3],a[4]} cofactor word-mux structure |
| `ex270` | 3230 | 2076 | 0 | frontend_best_improved | coordinator should merge proposed frontend-best update |
| `ex276` | 1010 | 632 | 0 | no_frontend_best_improvement | derive lower-bit shared classifier below prefix4_ge_bitwise; cofactor and word-tree variants are nonwinning |
| `ex277` | 2844 | 1980 | 0 | no_frontend_best_improvement | keep cofbdd4 as frontend seed; further frontend work is lower priority than backend refinement |

### `unknown`

| case | frontend best ADP | reference | beat ref | result | next |
|---|---:|---:|---:|---|---|
| `ex280` | 4712 | 2415 | 0 | no_frontend_best_improvement | continue with materially different nonlinear sharing; current shard found no ADP improvement |
| `ex281` | 5474 | 2336 | 0 | no_frontend_best_improvement | continue with materially different nonlinear sharing; current shard found no ADP improvement |
| `ex282` | 6336 | 2704 | 0 | no_frontend_best_improvement | continue with materially different nonlinear sharing; current shard found no ADP improvement |
| `ex283` | 6516 | 3168 | 0 | no_frontend_best_improvement | continue with materially different nonlinear sharing; current shard found no ADP improvement |
| `ex284` | 7800 | 4240 | 0 | no_frontend_best_improvement | continue with materially different nonlinear sharing; current shard found no ADP improvement |
| `ex285` | 13175 | 5499 | 0 | no_frontend_best_improvement | continue with materially different nonlinear sharing; current shard found no ADP improvement |
| `ex286` | 21705 | 2376 | 0 | no_frontend_best_improvement | continue with materially different nonlinear sharing; current shard found no ADP improvement |
| `ex287` | 27480 | 5782 | 0 | no_frontend_best_improvement | continue with materially different nonlinear sharing; current shard found no ADP improvement |
| `ex288` | 31598 | 16394 | 0 | no_frontend_best_improvement | continue with materially different nonlinear sharing; current shard found no ADP improvement |
| `ex289` | 19893 | 13620 | 0 | no_frontend_best_improvement | continue with materially different nonlinear sharing; current shard found no ADP improvement |
| `ex290` | 61992 | 42328 | 0 | no_frontend_best_improvement | No improvement; continue with deeper descriptor factorization beyond ex290_state_ir2_descriptor_state_delta_outside_in_a |
| `ex291` | 97545 | 66850 | 0 | no_frontend_best_improvement | No improvement; continue with deeper descriptor factorization beyond ex291_state_ir2_descriptor_state_delta_outside_in_a |
| `ex292` | 142170 | 84854 | 0 | no_frontend_best_improvement | No improvement; continue with deeper descriptor factorization beyond ex292_state_ir2_descriptor_state_delta_outside_in_a |
| `ex293` | 144972 | 112966 | 0 | no_frontend_best_improvement | No improvement; continue with deeper descriptor factorization beyond ex293_state_ir2_descriptor_state_delta_outside_in_a |
| `ex294` | 246698 | 133365 | 0 | no_frontend_best_improvement | No improvement; continue with deeper descriptor factorization beyond ex294_state_ir2_descriptor_state_delta_outside_in_a |
| `ex295` | 138448 | 68064 | 0 | no_frontend_best_improvement | No improvement; continue with deeper descriptor factorization beyond ex295_cell_rot2_descriptor_cell_delta_order_abc_g_a |
| `ex296` | 143792 | 104025 | 0 | no_frontend_best_improvement | No improvement; continue with deeper descriptor factorization beyond ex296_open_state_ir2_descriptor_state_delta_outside |
| `ex297` | 583596 | 225900 | 0 | no_frontend_best_improvement | No improvement; continue with deeper descriptor factorization beyond ex297_cell_rot2_descriptor_cell_delta_order_abc_g_a |
| `ex298` | 645639 | 442296 | 0 | no_frontend_best_improvement | No improvement; continue with deeper descriptor factorization beyond ex298_open_state_ir2_descriptor_state_delta_outside |
| `ex299` | 2604734 | 1013807 | 0 | no_frontend_best_improvement | No improvement; continue with deeper descriptor factorization beyond ex299_cell_rot2_descriptor_cell_delta_order_abc_g_a |

