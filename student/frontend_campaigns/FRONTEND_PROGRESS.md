# Frontend Campaign Progress

This is the compact entry point for new frontend-search sessions.
Read this file first, then read only the relevant `case_index/exNNN.md` files.

## Files

- `current_frontend_gap.csv`: current best vs reference for all cases.
- `frontend_best_registry.csv`: one-row-per-case registry of the best known frontend seed.
- `attempted_methods.csv`: machine-readable index of existing run/work/archive attempts.
- `method_judgments.csv`: grouped method outcomes and reuse policies.
- `manual_judgments.csv`: human/agent overrides for method judgments.
- `search_state.csv`: persistent per-case search state and assignments.
- `hypothesis_bank.csv`: proposed/running/tested hypotheses for future exploration.
- `case_index/exNNN.md`: compact case-specific notes and links.
- `campaigns/<run_id>/`: new campaign result directories.

## Rules For Future Sessions

- Start from `student/cases` and the case index before generating new Verilog.
- Do not repeat an already bad hypothesis unless the new attempt changes the high-level description, sharing strategy, synthesis flow, or decomposition.
- The senior PPT category is a strong prior, not a hard boundary.
- Use `iverilog` simulation to debug candidates quickly, but use official `evaluate.py` for final validity.
- Actively search for shared intermediate structures across output bits.
- Keep large logs, Verilog, and AIGs in `student/work/<run_id>` and `student/runs/<domain>/<run_id>`; keep this folder as an index.

## Token Budget Rules

- Read this file first.
- Then read only the assigned `case_index/exNNN.md` files.
- Do not open all of `attempted_methods.csv`; filter one case or one `method_signature` at a time.
- Open `case_notes_paths` only when a case index says the method history matters.
- Never paste large Verilog, logs, or CSV bodies into the conversation; report summaries and paths.
- Use shell/CSV filters to inspect evidence paths instead of loading full run directories.

## Subagent Workflow

1. Pick active/queued cases from `search_state.csv`.
2. Read the relevant `case_index/exNNN.md` and case notes.
3. Pick a `proposed` hypothesis from `hypothesis_bank.csv` or add a new one.
4. Check `method_judgments.csv` and `manual_judgments.csv` for matching/nearby `method_signature` values.
5. Run iverilog simulation for quick debug when practical, then official `evaluate.py` for final validity.
6. Write campaign result CSVs and update hypothesis/search/manual judgment rows.
7. Re-run `python3 student/scripts/build_frontend_campaign_index.py` to refresh this index.

## Class Summary

| domain | cases | frontend-high | frontend-medium | backend-first/close | already beat/low |
|---|---:|---:|---:|---:|---:|
| `bf16` | 20 | 3 | 3 | 5 | 9 |
| `fp16` | 20 | 3 | 0 | 9 | 8 |
| `float_fp8` | 15 | 7 | 0 | 0 | 8 |
| `integer` | 25 | 5 | 11 | 2 | 7 |
| `unknown` | 20 | 19 | 0 | 0 | 1 |

## Frontend Attack Queue

Cases are sorted by priority and then by ratio to reference.

| priority | case | domain | current best | reference | ratio | gap | recommendation |
|---|---|---|---:|---:|---:|---:|---|
| `frontend_high` | [ex286](case_index/ex286.md) | `unknown` | 15210 | 2376 | 6.401515 | 12834 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex287](case_index/ex287.md) | `unknown` | 13455 | 5782 | 2.327049 | 7673 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex297](case_index/ex297.md) | `unknown` | 419008 | 225900 | 1.854838 | 193108 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex299](case_index/ex299.md) | `unknown` | 1737036 | 1013807 | 1.713379 | 723229 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex225](case_index/ex225.md) | `fp16` | 196560 | 116676 | 1.684665 | 79884 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex285](case_index/ex285.md) | `unknown` | 9132 | 5499 | 1.660666 | 3633 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex288](case_index/ex288.md) | `unknown` | 26224 | 16394 | 1.599610 | 9830 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex223](case_index/ex223.md) | `fp16` | 180738 | 120549 | 1.499291 | 60189 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex295](case_index/ex295.md) | `unknown` | 95043 | 68064 | 1.396377 | 26979 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex256](case_index/ex256.md) | `integer` | 2660 | 1911 | 1.391941 | 749 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex283](case_index/ex283.md) | `unknown` | 4384 | 3168 | 1.383838 | 1216 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex282](case_index/ex282.md) | `unknown` | 3696 | 2704 | 1.366864 | 992 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex205](case_index/ex205.md) | `bf16` | 63440 | 47128 | 1.346121 | 16312 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex246](case_index/ex246.md) | `float_fp8` | 3750 | 2805 | 1.336898 | 945 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex289](case_index/ex289.md) | `unknown` | 18164 | 13620 | 1.333627 | 4544 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex281](case_index/ex281.md) | `unknown` | 3094 | 2336 | 1.324486 | 758 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex224](case_index/ex224.md) | `fp16` | 85680 | 64708 | 1.324102 | 20972 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex204](case_index/ex204.md) | `bf16` | 19586 | 15180 | 1.290250 | 4406 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex270](case_index/ex270.md) | `integer` | 2670 | 2076 | 1.286127 | 594 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex298](case_index/ex298.md) | `unknown` | 554857 | 442296 | 1.254492 | 112561 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex296](case_index/ex296.md) | `unknown` | 130425 | 104025 | 1.253785 | 26400 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex294](case_index/ex294.md) | `unknown` | 165570 | 133365 | 1.241480 | 32205 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex261](case_index/ex261.md) | `integer` | 2520 | 2041 | 1.234689 | 479 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex292](case_index/ex292.md) | `unknown` | 102158 | 84854 | 1.203927 | 17304 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex260](case_index/ex260.md) | `integer` | 790 | 657 | 1.202435 | 133 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex290](case_index/ex290.md) | `unknown` | 50604 | 42328 | 1.195521 | 8276 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex200](case_index/ex200.md) | `bf16` | 47698 | 40052 | 1.190902 | 7646 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex244](case_index/ex244.md) | `float_fp8` | 4968 | 4272 | 1.162921 | 696 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex280](case_index/ex280.md) | `unknown` | 2756 | 2415 | 1.141201 | 341 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex284](case_index/ex284.md) | `unknown` | 4830 | 4240 | 1.139151 | 590 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex253](case_index/ex253.md) | `float_fp8` | 2023 | 1845 | 1.096477 | 178 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex266](case_index/ex266.md) | `integer` | 927 | 848 | 1.093160 | 79 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex247](case_index/ex247.md) | `float_fp8` | 3222 | 2975 | 1.083025 | 247 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex240](case_index/ex240.md) | `float_fp8` | 14300 | 13299 | 1.075269 | 1001 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex291](case_index/ex291.md) | `unknown` | 71721 | 66850 | 1.072865 | 4871 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex248](case_index/ex248.md) | `float_fp8` | 4256 | 4180 | 1.018182 | 76 | rethink high-level description and shared-structure RTL |
| `frontend_high` | [ex241](case_index/ex241.md) | `float_fp8` | 7258 | 7224 | 1.004707 | 34 | rethink high-level description and shared-structure RTL |
| `frontend_medium` | [ex273](case_index/ex273.md) | `integer` | 18744 | 15078 | 1.243136 | 3666 | add diverse frontend seeds before deeper backend |
| `frontend_medium` | [ex255](case_index/ex255.md) | `integer` | 1023 | 836 | 1.223684 | 187 | add diverse frontend seeds before deeper backend |
| `frontend_medium` | [ex258](case_index/ex258.md) | `integer` | 7636 | 6289 | 1.214183 | 1347 | add diverse frontend seeds before deeper backend |
| `frontend_medium` | [ex201](case_index/ex201.md) | `bf16` | 19513 | 16300 | 1.197117 | 3213 | add diverse frontend seeds before deeper backend |
| `frontend_medium` | [ex263](case_index/ex263.md) | `integer` | 7992 | 6840 | 1.168421 | 1152 | add diverse frontend seeds before deeper backend |
| `frontend_medium` | [ex203](case_index/ex203.md) | `bf16` | 64800 | 56948 | 1.137880 | 7852 | add diverse frontend seeds before deeper backend |
| `frontend_medium` | [ex218](case_index/ex218.md) | `bf16` | 3660 | 3222 | 1.135940 | 438 | add diverse frontend seeds before deeper backend |
| `frontend_medium` | [ex257](case_index/ex257.md) | `integer` | 4454 | 3952 | 1.127024 | 502 | add diverse frontend seeds before deeper backend |
| `frontend_medium` | [ex264](case_index/ex264.md) | `integer` | 10890 | 9724 | 1.119910 | 1166 | add diverse frontend seeds before deeper backend |
| `frontend_medium` | [ex259](case_index/ex259.md) | `integer` | 11178 | 10000 | 1.117800 | 1178 | add diverse frontend seeds before deeper backend |
| `frontend_medium` | [ex267](case_index/ex267.md) | `integer` | 2959 | 2651 | 1.116183 | 308 | add diverse frontend seeds before deeper backend |
| `frontend_medium` | [ex274](case_index/ex274.md) | `integer` | 23966 | 21630 | 1.107998 | 2336 | add diverse frontend seeds before deeper backend |
| `frontend_medium` | [ex278](case_index/ex278.md) | `integer` | 5664 | 5198 | 1.089650 | 466 | add diverse frontend seeds before deeper backend |
| `frontend_medium` | [ex268](case_index/ex268.md) | `integer` | 7752 | 7446 | 1.041096 | 306 | add diverse frontend seeds before deeper backend |

## Backend Or Low-Priority Cases

These are not the first frontend targets unless new information appears.

- `bf16`: ex202(backend_close), ex206(already_beat_or_low_priority), ex207(already_beat_or_low_priority), ex208(already_beat_or_low_priority), ex209(already_beat_or_low_priority), ex210(already_beat_or_low_priority), ex211(backend_close), ex212(already_beat_or_low_priority), ex213(backend_close), ex214(backend_close), ex215(backend_close), ex216(already_beat_or_low_priority), ex217(already_beat_or_low_priority), ex219(already_beat_or_low_priority)
- `fp16`: ex220(backend_close), ex221(backend_close), ex222(backend_close), ex226(backend_close), ex227(backend_close), ex228(backend_close), ex229(already_beat_or_low_priority), ex230(backend_more_first), ex231(already_beat_or_low_priority), ex232(backend_close), ex233(already_beat_or_low_priority), ex234(already_beat_or_low_priority), ex235(already_beat_or_low_priority), ex236(already_beat_or_low_priority), ex237(already_beat_or_low_priority), ex238(backend_more_first), ex239(already_beat_or_low_priority)
- `float_fp8`: ex242(already_beat_or_low_priority), ex243(already_beat_or_low_priority), ex245(already_beat_or_low_priority), ex249(already_beat_or_low_priority), ex250(already_beat_or_low_priority), ex251(already_beat_or_low_priority), ex252(already_beat_or_low_priority), ex254(already_beat_or_low_priority)
- `integer`: ex262(already_beat_or_low_priority), ex265(already_beat_or_low_priority), ex269(already_beat_or_low_priority), ex271(backend_close), ex272(backend_close), ex275(already_beat_or_low_priority), ex276(already_beat_or_low_priority), ex277(already_beat_or_low_priority), ex279(already_beat_or_low_priority)
- `unknown`: ex293(already_beat_or_low_priority)

## New Campaign Output Contract

Each new frontend campaign should write:

```text
student/frontend_campaigns/campaigns/<run_id>/
  MANIFEST.md
  task_assignments.md
  results/
    candidates.csv
    best_improvements.csv
    failed_hypotheses.csv
    simulation_results.csv
    evaluation_results.csv
    shared_structure_report.csv
```

Large generated artifacts should stay in `student/work/<run_id>` and official summaries in `student/runs/<domain>/<run_id>`.

Every tested idea must end in one of:

- `candidates.csv` if it produced an evaluated equivalent candidate.
- `failed_hypotheses.csv` if it failed simulation/equivalence/synthesis or was low-value.
- `manual_judgments.csv` if the automatic reuse policy needs correction.
- `hypothesis_bank.csv` with status changed to `tested_promising`, `tested_bad`, or `rejected`.

