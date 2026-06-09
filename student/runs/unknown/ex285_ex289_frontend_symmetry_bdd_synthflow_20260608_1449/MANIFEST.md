# ex285-ex289 Symmetry-BDD Synthflow Run

Run ID: `ex285_ex289_frontend_symmetry_bdd_synthflow_20260608_1449`

Scope: `ex285-ex289` only.

Hypothesis: the exact `swap_in_4_5` symmetry-canonical BDD run produced close candidates. This run applies limited Yosys synthflow variants to the best symmetry-BDD source per case, without running a backend optimization portfolio.

Seed policy: no files were created or updated under `student/seeds`; unknown seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Source run: `student/runs/unknown/ex285_ex289_frontend_symmetry_bdd_20260608_1429/`
- Work dir: `student/work/ex285_ex289_frontend_symmetry_bdd_synthflow_20260608_1449/`
- Results dir: `student/runs/unknown/ex285_ex289_frontend_symmetry_bdd_synthflow_20260608_1449/results/`
- Official replay AIG dir: `student/runs/unknown/ex285_ex289_frontend_symmetry_bdd_synthflow_20260608_1449/official_replay/`

## Verification

The per-case best AIGs were replayed with `evaluate.py --case`:

| Case | Status | Area | Delay | ADP |
| --- | --- | ---: | ---: | ---: |
| ex285 | OK | 1037 | 17 | 17629 |
| ex286 | OK | 1435 | 17 | 24395 |
| ex287 | OK | 1723 | 18 | 31014 |
| ex288 | OK | 1877 | 19 | 35663 |
| ex289 | OK | 1733 | 21 | 36393 |

## Outcome

- New current bests: `ex287` improved to `1723/18/31014`, `ex288` improved to `1877/19/35663`, and `ex289` improved to `1733/21/36393`.
- Near miss: `ex286` reached `1435/17/24395`, only `215` ADP worse than the current structural synthflow best `1860/13/24180`, trading much lower area for higher delay.
- Negative: `ex285` stayed worse than the current decision-tree synthflow best.
