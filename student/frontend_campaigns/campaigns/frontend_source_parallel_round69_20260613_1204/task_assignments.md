# frontend_source_parallel_round69_20260613_1204 Task Assignments

All shard work is frontend/source-only. Do not run backend portfolios or standalone AIG optimization. Official equivalence/QoR claims require repo `evaluate.py`.

## sub-fp8-worst-source-r69

Agent: `019ebf2c-83f7-7733-964f-3a3f54d14653` (`Poincare`)

Note: previous spawned id `019ebf27-2416-7173-bf17-15824d7169ec` was reported `not_found` and produced no shard files.

Cases: `ex244`, `ex246`, `ex247`, `ex249`

Focus:
- Mine the current frontend best source/Verilog/AIG provenance from `frontend_best_registry.csv` and case notes.
- Try exact source-level factoring around known-good decode: shared output selector predicates, reduced selected-output residuals, and small explicit subfunctions.
- Do not repeat r64-r68 classifier, codearith, formula, microcode, descriptor, or direct cancellation signatures as-is.

## sub-fp8-mid-source-r69

Agent: `019ebf2c-84da-79c1-a12c-80a784cccd7b` (`Kierkegaard`)

Note: previous spawned id `019ebf27-24b3-7163-bf44-498440a02c22` was reported `not_found` and produced no shard files.

Cases: `ex240`, `ex241`, `ex242`, `ex245`

Focus:
- Mine current best source and produce materially different factoring from r67/r68 descriptor/formula/bit-predicate families.
- Try preserving known-good top-level branch/decode while changing only selected low-output residuals, or use shared BDD/cofactor subfunctions for the few highest-impact outputs.

## sub-unknown-source-r69

Agent: `019ebf2c-8591-7ca1-a8fc-fd9d80a54594` (`Goodall`)

Note: previous spawned id `019ebf27-258a-7833-a563-be4c70ad83bd` was reported `not_found` and produced no shard files.

Cases: `ex285`, `ex288`, `ex297`, `ex299`

Focus:
- For `ex297/ex299`, compress r66 cube-default source without repeating cube-default or r68 phase/selected-cell signatures as-is.
- For `ex285/ex288`, avoid local-rule/treefact/symcof/key-BDD replay; try routing-state selected-output residuals, partial permutation descriptors, or small cofactor subfunctions.

## sub-fp16-int-source-r69

Agent: `019ebf2c-86a2-7420-83c6-4a5836c4153d` (`Maxwell`)

Note: previous spawned id `019ebf27-261c-7c82-a8af-8e0400a371ab` was reported `not_found` and produced no shard files.

Cases: `ex223`, `ex225`, `ex260`, `ex266`

Focus:
- For `ex223/ex225`, mine current best source and try exact source factoring or selected mantissa/exponent residuals distinct from low13/low14 nested/sparse LUTs.
- For `ex260/ex266`, mine current best source and try exact partial-product/quotient predicate sharing distinct from Baugh-Wooley carry-select, cofactor-wordmux, case-constant, and const-divisor signatures.

## Shard Deliverables

Each shard must write:
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round69_20260613_1204/agent_shards/<agent_id>/candidates.csv`
- `best_improvements.csv`
- `failed_hypotheses.csv`
- `simulation_results.csv`
- `evaluation_results.csv`
- `shared_structure_report.csv`
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round69_20260613_1204/agent_summaries/<agent_id>.md`

Each per-case output must be scoped under:
- `student/work/frontend_source_parallel_round69_20260613_1204/<agent_id>/<case>/`
- `student/runs/<domain>/frontend_source_parallel_round69_20260613_1204/<agent_id>/<case>/`

Subagents must not edit `prompt_log.md`, global registry/state/manual/hypothesis CSVs, or seed bundles. Put proposed global updates in shard CSVs/summaries.
