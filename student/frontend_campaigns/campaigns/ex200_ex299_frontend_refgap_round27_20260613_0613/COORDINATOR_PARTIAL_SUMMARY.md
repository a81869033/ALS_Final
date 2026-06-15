# Round27 Coordinator Partial Summary

Run ID: `ex200_ex299_frontend_refgap_round27_20260613_0613`

Status: partial merge while workers may still be running.

## Counts

- Candidate rows: `72`
- Evaluation rows: `74`
- OK/equivalent rows: `55`
- Best improvements: `0`
- Failed/blocker rows: `79`
- Path and official evaluate.py metric sanity: passed; 110 OK/equivalent log metric rows checked with 0 errors.

## Outcome Snapshot

| case | agent | status | best observed | current frontend | reference | next action |
|---|---|---|---:|---:|---:|---|
| `ex285` | `unknown-worst-r27` | `tested_no_frontend_best` | ex285_r27_directed_move_split_bdd (1978/16/31648) | 13175 | 5499 | Extend only if a smaller nonlinear state replaces class decoding; direct image-class decode is table-scale. |
| `ex286` | `unknown-worst-r27` | `tested_no_frontend_best` | ex286_r27_directed_move_shared_bdd (3256/19/61864) | 20190 | 2376 | Extend only if a smaller nonlinear state replaces class decoding; direct image-class decode is table-scale. |
| `ex287` | `unknown-worst-r27` | `tested_no_frontend_best` | ex287_r27_directed_move_shared_bdd (4578/20/91560) | 27390 | 5782 | Extend only if a smaller nonlinear state replaces class decoding; direct image-class decode is table-scale. |
| `ex288` | `unknown-worst-r27` | `tested_no_frontend_best` | ex288_r27_directed_move_split_bdd (6660/21/139860) | 31598 | 16394 | Extend only if a smaller nonlinear state replaces class decoding; direct image-class decode is table-scale. |
| `ex247` | `fp8-a-r27` | `` | ex247_r27_delta_pair_flatmag_synth_preset_aig (672/20/13440) | 8349 | 2975 | avoid direct delta magnitude table if nonwinning; try a compact predicate/residual boundary structure |
| `ex246` | `fp8-a-r27` | `` | ex246_r27_product_exp_nested_mag_synth_preset_aig (454/24/10896) | 7502 | 2805 | avoid direct delta magnitude table if nonwinning; try a compact predicate/residual boundary structure |
| `ex244` | `fp8-a-r27` | `` | ex244_r27_maxeff_gap_sig_direct_delta_synth_preset_aig (485/37/17945) | 10234 | 4272 | avoid direct delta magnitude table if nonwinning; try a compact predicate/residual boundary structure |
| `ex240` | `fp8-a-r27` | `` | ex240_r27_field_override_gap_outer_synth_preset_aig (2913/41/119433) | 30090 | 13299 | avoid direct delta magnitude table if nonwinning; try a compact predicate/residual boundary structure |
| `ex249` | `fp8-b-r27` | `completed_no_frontend_improvement` | ex249_r27b_hypot_split_bits_delta_synth_preset_aig (171/30/5130) | 4368 | 2079 | need new semantic coordinates or lower-delay source factoring; this shard avoided r26 replay signatures |
| `ex248` | `fp8-b-r27` | `completed_no_frontend_improvement` | ex248_r27b_fmod_norm_by_eff_synth_preset_aig (301/30/9030) | 7938 | 4180 | need new semantic coordinates or lower-delay source factoring; this shard avoided r26 replay signatures |
| `ex241` | `fp8-b-r27` | `completed_no_frontend_improvement` | none | 15544 | 7224 | need new semantic coordinates or lower-delay source factoring; this shard avoided r26 replay signatures |
| `ex242` | `fp8-b-r27` | `completed_no_frontend_improvement` | none | 25320 | 11900 | need new semantic coordinates or lower-delay source factoring; this shard avoided r26 replay signatures |
| `ex245` | `fp8-b-r27` | `completed_no_frontend_improvement` | ex245_r27b_add_active_gap_bitplanes_abc_g_aig (2980/36/107280) | 23834 | 11050 | need new semantic coordinates or lower-delay source factoring; this shard avoided r26 replay signatures |
| `ex265` | `mixed-uncovered-r27` | `evaluated_no_frontend_improvement` | ex265_udiv_cof_bhi3_ahi1_bitbdd_wordmux_synth_preset (63/8/504) | 504 | 322 | try only materially different selector sharing; current cofactor word-mux ties frontend but remains above reference |
| `ex270` | `mixed-uncovered-r27` | `evaluated_no_frontend_improvement` | ex270_square_wallace_square_outside_csel3_synth_preset (188/19/3572) | 3230 | 2076 | do not repeat block/column/booth/csel3 as-is; current csel5 remains better |
| `ex267` | `mixed-uncovered-r27` | `evaluated_no_frontend_improvement` | ex267_udiv_cof_bhi2_ahi2_bitbdd_wordmux_synth_preset (333/14/4662) | 4080 | 2651 | do not repeat ahi2/comp/tree/reciprocal correction as-is; current hybrid top2 remains better |
| `ex297` | `coordinator-unknown-large-r27-blocker` | `blocked_no_worker_output` | none | 568674 | 225900 | restart with a narrower non-fork worker per case or coordinator-local small probe |
| `ex299` | `coordinator-unknown-large-r27-blocker` | `blocked_no_worker_output` | none | 2486379 | 1013807 | restart with a narrower non-fork worker per case or coordinator-local small probe |
| `ex294` | `coordinator-unknown-large-r27-blocker` | `blocked_no_worker_output` | none | 246698 | 133365 | restart with a narrower non-fork worker per case or coordinator-local small probe |
| `ex295` | `coordinator-unknown-large-r27-blocker` | `blocked_no_worker_output` | none | 123270 | 68064 | restart with a narrower non-fork worker per case or coordinator-local small probe |
| `ex292` | `coordinator-unknown-large-r27-blocker` | `blocked_no_worker_output` | none | 135780 | 84854 | restart with a narrower non-fork worker per case or coordinator-local small probe |

## Decision

- No frontend best registry update was made from this partial merge because `best_improvements.csv` is empty.
- Large unknown round27 is recorded as worker-start blocker; restart those cases with narrower per-case workers.
- Existing active workers may still add rows; rerun merge before treating round27 as final.
