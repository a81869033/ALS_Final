# ex240_ex244_current

Best and curated alternate FP8 seed bundle for ex240-ex244.

Files:
- `results/best.csv`: one current best row per case.
- `results/candidates.csv`: curated backend-start candidates, including low-area or low-delay alternates.
- `results/summary.csv`: same best rows for quick score review.
- `results/evaluate_check.csv`: copied verified candidate rows.

| Case | Candidate | Area | Delay | ADP | Ref ADP | Ratio |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| ex240 | `ex240_semantic_add_scaled_abc_g_aig` | 1404 | 56 | 78624 | 13299 | 5.912023 |
| ex241 | `ex241_semantic_mul_field_table_synth_preset_aig` | 1033 | 25 | 25825 | 7224 | 3.574889 |
| ex242 | `ex242_semantic_div_formula_exception_synth_preset_aig` | 1028 | 25 | 25700 | 11900 | 2.159664 |
| ex243 | `ex243_semantic_fmod_default_exception_abc_g_aig` | 5746 | 25 | 143650 | 53227 | 2.698818 |
| ex244 | `ex244_semantic_hypot_gap_delta_synth_preset_aig` | 1532 | 33 | 50556 | 4272 | 11.834270 |

Curated alternates:

- ex240: `ex240_semantic_add_norm_synth_preset_aig` `922/87/80214` (semantic_add_norm_synth_preset_aig)
- ex241: `ex241_semantic_mul_product_table_synth_preset_aig` `752/35/26320` (semantic_mul_product_table_synth_preset_aig)
- ex242: `ex242_semantic_div_field_table_synth_preset_aig` `1290/20/25800` (semantic_div_field_table_synth_preset_aig)
- ex244: `ex244_semantic_hypot_max_delta_synth_preset_aig` `1536/34/52224` (semantic_hypot_max_delta_synth_preset_aig)
- ex244: `ex244_semantic_hypot_mag_table_synth_preset_aig` `2420/22/53240` (semantic_hypot_mag_table_synth_preset_aig)
