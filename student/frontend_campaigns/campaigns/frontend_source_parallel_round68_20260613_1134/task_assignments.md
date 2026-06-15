# frontend_source_parallel_round68_20260613_1134 Task Assignments

All shard work is frontend/source-only. Do not run backend portfolios or standalone AIG optimization. Official equivalence/QoR claims require repo `evaluate.py`.

## sub-fp8-worst-r68

Agent: `019ebf12-5034-7591-b429-65744b7d4974` (`Kepler`)

Cases: `ex244`, `ex246`, `ex247`, `ex249`

Focus:
- These are still the highest FP8 ratios.
- Do not repeat r64-r66 currentfact/classifier/codearith signatures as-is.
- Try materially different source structures: shared early special-case decode with minimized late predicates, arithmetic microcode with common quotient/product class tables, reduced output-bit predicate networks, and explicit carry/round/saturation predicate sharing.

## sub-fp8-mid-r68

Agent: `019ebf12-5198-7550-bb13-4f67e16c5a0d` (`Carver`)

Cases: `ex240`, `ex241`, `ex242`, `ex245`

Focus:
- Do not repeat round67 descriptor-table/output-clustered descriptor splits as-is.
- Try alternatives to descriptor tables: direct field arithmetic with shared guard/sticky/round predicates, BDD/cofactor only for selected low bits, and factored current-best source variants that preserve known good decode.

## sub-unk-stillhigh-r68

Agent: `019ebf12-5253-7be2-9a00-ac985ab52608` (`Jason`)

Cases: `ex285`, `ex288`, `ex297`, `ex299`

Focus:
- Do not repeat table-sized local descriptors, round65 exact screens, round66/r67 cube default signatures as-is.
- For `ex297/ex299`, extend source-only cube/default wins with smaller cube covers, compact symbol-state descriptors, or grouped selected outputs.
- For `ex285/ex288`, move beyond nonwinning local-rule/treefact/symcof variants toward compact routing/state descriptors or selected-output cofactor reuse.

## sub-fp16-int-r68

Agent: `019ebf12-536f-7953-821c-5c395b233465` (`Poincare`)

Cases: `ex223`, `ex225`, `ex260`, `ex266`

Focus:
- For `ex223/ex225`, do not repeat round67 low13/hi5 nested or sparse log LUT signatures as-is; try current-best source factoring, exponent-band shared decode, and selected mantissa residuals.
- For `ex260/ex266`, do not repeat round67 carry-select Baugh-Wooley or cofactor-wordmux divider signatures as-is; try different source-level sharing such as compressor row factoring, output-bit carry reuse, small exact quotient predicates, or source factoring of current best.

## Shard Deliverables

Each shard must write:
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round68_20260613_1134/agent_shards/<agent_id>/candidates.csv`
- `best_improvements.csv`
- `failed_hypotheses.csv`
- `simulation_results.csv`
- `evaluation_results.csv`
- `shared_structure_report.csv`
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round68_20260613_1134/agent_summaries/<agent_id>.md`

Each per-case output must be scoped under:
- `student/work/frontend_source_parallel_round68_20260613_1134/<agent_id>/<case>/`
- `student/runs/<domain>/frontend_source_parallel_round68_20260613_1134/<agent_id>/<case>/`

Subagents must not edit `prompt_log.md`, global registry/state/manual/hypothesis CSVs, or seed bundles. Put proposed global updates in shard CSVs/summaries.
