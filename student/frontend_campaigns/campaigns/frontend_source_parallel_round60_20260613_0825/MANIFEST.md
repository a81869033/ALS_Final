# frontend_source_parallel_round60_20260613_0825

Run ID: `frontend_source_parallel_round60_20260613_0825`

Purpose: parallel frontend-only source/RTL search after the frontend-only correction. No backend portfolio and no standalone AIG remap/post-processing are in scope.

Verification:
- Candidate success requires repo `evaluate.py` equivalence plus recorded area, delay, ADP, Verilog path, AIG path, and evaluate log.
- Iverilog may be used only for debug.
- Coordinator will rebuild the global frontend campaign index after shard outputs are merged.

Assigned workers:
- `sub-ex244-r60`: ex244 E4M3FN hypot source structures.
- `sub-ex246-ex247-r60`: ex246/ex247 E5M2 multiply/divide source structures.
- `sub-ex285-r60`: ex285 unknown source structures.
- `sub-ex297-ex299-r60`: ex297/ex299 unknown-large source structures or blocker evidence.

Coordinator notes:
- Latest confirmed source-only improvement before this campaign: ex240 round59 `582/46/26772`.
- Subagents must write only their assigned shard/work/run paths and must not edit global registry/search/manual judgment files.

Merged results:
- Coordinator merge completed after all four workers finished.
- `results/candidates.csv`: 38 rows.
- `results/evaluation_results.csv`: 40 rows, including 38 official equivalent rows and 2 blocked/no-candidate diagnostic rows.
- `results/best_improvements.csv`: header-only; this campaign produced no frontend-best improvement.
- Best official rows by case:
  - `ex244`: `ex244_r60_gapcofactor_satsplit_field_abc_g_aig` `304/34/10336`; current frontend best remains `9120`.
  - `ex246`: `ex246_r60_sigpair_round_predicates_default` `440/28/12320`; current frontend best remains `6888`.
  - `ex247`: `ex247_r60_quotient_region_split_synth_flatten` `367/32/11744`; current frontend best remains `7291`.
  - `ex285`: `ex285_r60_twopair_selector_direct_case_abc_g_aig` `3584/17/60928`; current frontend best remains `11033`.
  - `ex297`/`ex299`: no official candidate emitted; mixed source diagnostic blocked because residual tables/ANF did not shrink.
