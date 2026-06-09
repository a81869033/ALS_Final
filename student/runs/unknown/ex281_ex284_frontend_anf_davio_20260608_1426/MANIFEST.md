# ex281-ex284 ANF/Davio Run

Run ID: `ex281_ex284_frontend_anf_davio_20260608_1426`

Scope: `ex281-ex284` only.

Hypothesis: diagnostics showed low ANF degree for `ex281-ex284`, so this run checked exact ANF/Davio interleave RTL as a source-level alternative to shared BDDs.

Seed policy: no files were created or updated under `student/seeds`; unknown seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Work dir: `student/work/ex281_ex284_frontend_anf_davio_20260608_1426/`
- Results dir: `student/runs/unknown/ex281_ex284_frontend_anf_davio_20260608_1426/results/`
- Official replay AIG dir: `student/runs/unknown/ex281_ex284_frontend_anf_davio_20260608_1426/official_replay/`

## Verification

The per-case best AIGs were replayed with `evaluate.py --case`:

| Case | Status | Area | Delay | ADP |
| --- | --- | ---: | ---: | ---: |
| ex281 | OK | 1478 | 27 | 39906 |
| ex282 | OK | 1634 | 31 | 50654 |
| ex283 | OK | 1992 | 34 | 67728 |
| ex284 | OK | 2198 | 38 | 83524 |

## Outcome

All candidates were exact, but delay was too high and none beat the existing shared-BDD synthflow bests. Do not repeat plain ANF/Davio interleave for `ex281-ex284` without a different source decomposition.
