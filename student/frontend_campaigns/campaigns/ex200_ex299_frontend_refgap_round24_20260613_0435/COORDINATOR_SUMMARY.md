# Round24 Coordinator Summary

Run ID: `ex200_ex299_frontend_refgap_round24_20260613_0435`

## Merged Results

- Candidates: `108`
- Evaluation rows: `108`
- Best improvements: `4`
- Failed/blocker rows: `110`
- Case outcomes: `26`

## Frontend Improvements

| case | old frontend ADP | new frontend ADP | area | delay | reference ADP | candidate |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| `ex204` | 25670 | 24576 | 1536 | 16 | 15180 | `ex204_r24_bf16_log2_log2_arithbase_delta_hilo3_bits_11_14_bh2_abc_g_aig` |
| `ex292` | 142170 | 141939 | 6759 | 21 | 84854 | `ex292_r24_output_grouped_bdd_pools_abc_g_aig` |
| `ex297` | 569592 | 568674 | 31593 | 18 | 225900 | `ex297_r24_cell_grouped_symbol_plane_majority_default_abc_g_aig` |
| `ex299` | 2487261 | 2486379 | 118399 | 21 | 1013807 | `ex299_r24_cell_grouped_symbol_plane_majority_default_abc_g_aig` |

All four rows are official repo `evaluate.py` OK and have complete Verilog,
AIG, and evaluate-log paths in `results/best_improvements.csv`.

## Shard Outcomes

- `unknown-routing-r24`: 11 official equivalent rows, 0 improvements.
- `fp8-r24`: 12 official equivalent rows, 0 improvements, plus blocker rows for replay-only cases.
- `mixed-r24`: 37 official equivalent rows, 1 improvement (`ex204`).
- `unknown-large-r24`: 33 official equivalent rows reconstructed from worker evaluate logs, 3 improvements (`ex292`, `ex297`, `ex299`).

## Next Actions

- `ex204`: start from the `bh2` bitgroup candidate and reduce area without losing the 16-level path.
- `ex292`: investigate why even/odd output grouping helps and seek area reduction at delay 21.
- `ex297`/`ex299`: improvements are tiny; avoid plain symbol-plane synth-flow replay and search for a genuinely new nonlocal state basis.
- `ex286`/`ex287`: current symcof family is delay/structure limited; continue only with new hidden-state or cross-class sharing ideas.
