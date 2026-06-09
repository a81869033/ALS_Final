# ex281-ex284 Split-Refine Partial Run

Run ID: `ex281_ex284_frontend_split_refine_20260608_1516`

Scope: planned `ex281-ex284`; completed `ex281`, `ex282`, and two `ex283`
variants before the generator process exited with code 143.

Hypothesis: diagnostics showed strong width-minus-one split/default signals for
`ex281-ex284`. A non-half split/default source might reduce depth compared with
shared-BDD RTL, despite higher area.

Seed policy: no files were created or updated under `student/seeds`; unknown
seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Generator: `student/generators/unknown_split_refine_search.py`
- Diagnostic source: `student/runs/unknown/ex280_ex299_frontend_diagnostics_20260608_1105/results/split_stats.csv`
- Work dir: `student/work/ex281_ex284_frontend_split_refine_20260608_1516/`
- Results dir: `student/runs/unknown/ex281_ex284_frontend_split_refine_20260608_1516/results/`
- Official replay AIG dir: `student/runs/unknown/ex281_ex284_frontend_split_refine_20260608_1516/official_replay/`

## Verification

Completed rows passed ABC equivalence; per-case best AIGs were replayed with
`evaluate.py --case`:

| Case | Status | Best variant | Area | Delay | ADP | Current best ADP |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| ex281 | OK | `rotate1_low12` | 15456 | 19 | 293664 | 25476 |
| ex282 | OK | `rotate1_low13` | 31058 | 20 | 621160 | 31512 |
| ex283 | OK | `rotate0_low14` | 58241 | 22 | 1281302 | 38844 |
| ex284 | NOT_RUN |  |  |  |  | 50083 |

## Outcome

- No new current best.
- The split/default source exploded in area and synthesis cost:
  - ex281 best was `15456/19/293664`, `11.5x` worse than current ADP.
  - ex282 best was `31058/20/621160`, `19.7x` worse than current ADP.
  - ex283 completed rows tied at `58241/22/1281302`, `33.0x` worse than current ADP.
- The run was terminated before ex284 started. Given ex284 has still more
  exceptions (`23544+`) and all completed narrower cases were orders of
  magnitude worse, ex284 split/default was not pursued further in this run.
- Do not repeat width-minus-one split/default source generation for
  `ex281-ex284` without a materially different source rewrite or shared
  substructure.
