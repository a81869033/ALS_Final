# Round25 Coordinator Summary

Run ID: `ex200_ex299_frontend_refgap_round25_20260613_0506`

Merged shards:
- `unknown-sym-r25`
- `unknown-large-r25`
- `fp8-r25`
- `mixed-r25`
- `coordinator-bf16-r25`

Merged result counts:
- candidates: `58`
- evaluation rows: `62`
- official equivalent candidates: `52`
- best improvements: `6`
- failed hypotheses / low-value rows: `60`
- simulation rows: `58`
- shared-structure rows: `43`
- case outcomes: `27`

Coordinator checks:
- Nonempty Verilog/AIG/evaluate-log paths in merged candidates/evaluations/best rows all exist.
- All equivalent/OK rows have official `evaluate.py` OK lines with matching area, delay, and ADP.
- Candidate keys were de-duplicated by case, agent, candidate id, and method signature.
- `python3 student/scripts/build_frontend_campaign_index.py` was run after merging.

Frontend improvements:

| case | candidate | old frontend ADP | new frontend ADP | area | delay | reference ADP | outcome |
|---|---|---:|---:|---:|---:|---:|---|
| `ex292` | `ex292_r25_bdd_mod4_output_planes_abc_g_aig` | `141939` | `135780` | `6789` | `20` | `84854` | new frontend best, gap remains |

Other ex292 rows also improved over the round24 frontend best but did not beat the mod4 output-plane winner:
- `ex292_r25_bdd_low_high_output_halves_abc_g_aig`: `141897`
- `ex292_r25_follow_bdd_adjacent_pairs_best_abc_g_aig`: `141645`
- `ex292_r25_follow_bdd_mod3_output_planes_best_abc_g_aig`: `141876`
- `ex292_r25_follow_bdd_mod7_pairs_best_abc_g_aig`: `141771`
- `ex292_r25_follow_bdd_mod4_output_planes_best_abc_g_aig_d18`: `135780`

No other assigned case beat its current frontend best in this round.

Next actions:
- For `ex292`, explain why modulo-4 output-plane grouping reduces delay to 20 and seek area reduction without losing that delay.
- For `ex286`/`ex287`, stop replaying routing descriptors and consider new backend-oriented frontend rescue paths, including `&ttopt` investigation in a separate backend/planning thread if requested.
- For FP8 high-gap cases, direct active arithmetic variants and low-attribute/gap-split probes did not beat current frontend; the next useful work needs a clearer semantic rounding/saturation decomposition.
- For mixed FP16/integer/BF16 cases, round25 probes were official but nonwinning; continue only with materially different structure, not exact replay.
