# ex201-ex204 Curated Cleanup

Cleanup time: `2026-06-05 23:15 +0800`

Purpose:
- Keep the active ex201-ex204 BF16 semantic run small.
- Retain only a few good verified frontend seeds per case.
- Preserve complete generated history in archive instead of deleting it.

Active curated run:
- Work: `student/work/ex201_ex204_frontend_semantic_continue_20260605_1732/`
- Results: `student/runs/bf16/ex201_ex204_frontend_semantic_continue_20260605_1732/results/`
- Active candidate count: 17

Archive contents:
- `full_results_before_curation/candidates.csv`: original active candidates CSV before curation.
- `full_results_before_curation/candidates_full_with_archive_paths.csv`: full candidate list with non-curated paths updated to this archive.
- `noncurated_current_run/`: non-curated Verilog, AIG, logs, and stale official eval output from the current run.
- `superseded_work_dirs/`: earlier ex201-ex204 work directories moved out of active `student/work/`.

Curated selection rule:
- Keep current best for each case.
- Keep one or more close alternatives with different frontend structure.
- Keep selected low-area near misses when they may be useful as backend seeds.
- Drop broad sweep variants, duplicate ties, logs, and one-off failed forms from active directories.

Current best after cleanup:
- ex201: `ex201_bf16_exp2_hilo3_field_mode_bits_3_bh1`, `1647/14/23058`
- ex202: `ex202_bf16_exp10_sep_fields_e3_m3_s0_bits_14_15_bh4`, `3478/16/55648`
- ex203: `ex203_bf16_log_sep_fields_e3_m3_s2_bits_14_bh2`, `4544/17/77248`
- ex204: `ex204_bf16_log2_log2_arithbase_delta_hilo3_formula_bits_11_14`, `1545/17/26265`
