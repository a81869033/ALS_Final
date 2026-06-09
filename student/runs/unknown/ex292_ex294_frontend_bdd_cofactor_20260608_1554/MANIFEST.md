# ex292-ex294 BDD Cofactor Run

Run ID: `ex292_ex294_frontend_bdd_cofactor_20260608_1554`

Scope: `ex292`, `ex294`.

Hypothesis: current shared-BDD synthflow seeds for `ex292` and `ex294` are just
outside the `1.5x` reference band. A one-bit Shannon/cofactor BDD source form
could trade some area for lower delay and improve ADP.

Seed policy: no files were created or updated under `student/seeds`; unknown
seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Generator: `student/generators/unknown_bdd_cofactor_search.py`
- Work dir: `student/work/ex292_ex294_frontend_bdd_cofactor_20260608_1554/`
- Results dir: `student/runs/unknown/ex292_ex294_frontend_bdd_cofactor_20260608_1554/results/`
- Official replay AIG dir: `student/runs/unknown/ex292_ex294_frontend_bdd_cofactor_20260608_1554/official_replay/`

## Verification

All 6 candidates synthesized and passed ABC equivalence. The per-case best
AIGs were replayed with `evaluate.py --case`:

| Case | Best variant | Status | Area | Delay | ADP | Current best ADP |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| ex292 | `low1` | OK | 6826 | 23 | 156998 | 142170 |
| ex294 | `low1` | OK | 10898 | 23 | 250654 | 246698 |

## Outcome

- No new current best.
- `ex292` cofactor-BDD increased delay from 21 to 23 and lost ADP.
- `ex294` `low1` matched current delay 23 but increased area enough to lose.
- Do not repeat simple one-bit cofactor-BDD for `ex292` or `ex294` without a
  different source rewrite.
