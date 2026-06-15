# Source Targets

Use `student/frontend_campaigns/frontend_best_registry.csv` as source of truth.
Do not use backend-best rows from `current_frontend_gap.csv` as frontend seeds.

| case | frontend A/D/ADP | reference | <1.5 target | current source |
| --- | --- | ---: | ---: | --- |
| ex204 | 1536/16/24576 | 15180 | 22769 | `ex204_r24_bf16_log2_log2_arithbase_delta_hilo3_bits_11_14_bh2_abc_g_aig` |
| ex205 | 4444/16/71104 | 47128 | 70691 | `ex205_sep_fields_e3_m3_s0_bits_15_bh1_abc_g_aig` |
| ex214 | 337/11/3707 | 2424 | 3635 | `ex214_bf16_reciprocal_square_legacy_default_expr_exception_case_bits_13_cmp_fix` |
| ex216 | 444/13/5772 | 3357 | 5035 | `ex216_bf16_cube_aggr_semantic_positive_symmetry_fields_cube_bit14_boundary_caseattrs_fix13` |
| ex218 | 457/13/5941 | 3222 | 4832 | `ex218_field_selector_abc_g_aig` |
| ex219 | 658/14/9212 | 5640 | 8459 | `ex219_r94_bf16_reciprocal_cbrt_delta_pair_mant64_hilo3_bits_6_cmp` |
| ex286 | 1346/15/20190 | 2376 | 3563 | `ex286_unknown_symcof_interleave_f00_bits_0_12_1_10_onehot_group_abc_g_aig` |
| ex287 | 1826/15/27390 | 5782 | 8672 | `ex287_r25_symcof_f00_bits_13_0_1_12_2_onehot_group_abc_g_aig` |

Round96 emphasis:
- `ex205`, `ex214`: tiny remaining gaps. Try source-structure/synthesis-flow
  frontend recuts that lower one level or a small area amount without changing
  semantics.
- `ex204`, `ex216`, `ex218`, `ex219`: field-level second pass. Test
  materially new descriptor bases around exponent classes, mantissa buckets,
  selected predicates, and shared special shells.
- `ex286`, `ex287`: move away from selected-output BDD and symcof/casemux
  replays. Search whole-word routing/state descriptors and exact compact
  decision graphs; emit blocker evidence when exactness requires table scale.
