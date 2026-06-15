# frontend_source_parallel_round67_20260613_1104 Task Assignments

All shard work is frontend/source-only. Do not run backend portfolios or standalone AIG optimization. Official equivalence/QoR claims require repo `evaluate.py`.

## Active Round66 Exclusions

Do not duplicate these cases in round67: `ex244`, `ex246`, `ex247`, `ex249`, `ex285`, `ex297`, `ex299`. They are already covered by round66.

## sub-fp8-mid-r67

Agent: `019ebef2-5841-78b1-85a8-193767eb2b41` (`Boyle`)

Cases: `ex240`, `ex241`, `ex242`, `ex245`, `ex248`

Required focus:
- Re-read all relevant notes before generation, especially prior FP8 conversion attempts and current best records.
- Avoid repeating exact threshold/classifier, add/hypot/muldiv, and signmag/current-best factoring signatures unless materially different.
- Try at least two families per case when possible: shared field decode and rounding/saturation predicate factoring; output-clustered decision networks; residual-table-on-compact-descriptor variants.

## sub-fp16-mid-r67

Agent: `019ebef2-5951-7702-963e-9062df580427` (`Archimedes`)

Cases: `ex223`, `ex225`, `ex238`

Required focus:
- Re-read FP16 notes and prior sparse residual/BDD/source factoring attempts.
- Try semantic FP16 special-case/exponent/mantissa sharing and output-grouped comparator/rounding structures.
- For wide cases, compare decode-first shared trees against clustered low-bit residuals.

## sub-int-mid-r67

Agent: `019ebef2-5a11-7531-8193-9488c2378b09` (`Pasteur`)

Cases: `ex260`, `ex265`, `ex266`, `ex267`, `ex270`, `ex273`, `ex274`, `ex276`

Required focus:
- Re-read integer notes and current best registry before generation.
- Try source-level arithmetic structures only: signed multiplier partial-product sharing, divider quotient/subtract sharing, squarer diagonal sharing, and sqrt trial-subtract/prefix reuse.
- Do not use backend flows; Yosys RTL synthesis plus `evaluate.py` only.

## sub-unk-mid-r67

Agent: `019ebef2-5b0e-7e73-97e5-e19c0242f0cc` (`Wegener`)

Cases: `ex288`, `ex292`, `ex294`, `ex295`

Required focus:
- Re-read unknown notes, especially local rule, rotation/cell descriptor, BDD/cofactor, and recurrence-screen failures.
- Avoid repeating table-sized descriptor screens as-is.
- Try compact symbol/state descriptors, GF(2)/ANF shared monomials, cofactored BDD subfunctions, and routing/permutation/state-transition source RTL variants.

## Shard Deliverables

Each shard must write:
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round67_20260613_1104/agent_shards/<agent_id>/candidates.csv`
- `best_improvements.csv`
- `failed_hypotheses.csv`
- `simulation_results.csv`
- `evaluation_results.csv`
- `shared_structure_report.csv`
- `student/frontend_campaigns/campaigns/frontend_source_parallel_round67_20260613_1104/agent_summaries/<agent_id>.md`

Each per-case output must be scoped under:
- `student/work/frontend_source_parallel_round67_20260613_1104/<agent_id>/<case>/`
- `student/runs/<domain>/frontend_source_parallel_round67_20260613_1104/<agent_id>/<case>/`

Subagents must not edit `prompt_log.md`, global registry/state/manual/hypothesis CSVs, or seed bundles. Put proposed global updates in shard CSVs/summaries.
