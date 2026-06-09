# ex280 ANF/Davio Run

Run ID: `ex280_frontend_anf_davio_20260608_1438`

Scope: `ex280` only.

Hypothesis: because `ex280` has low ANF degree, this run checked exact ANF/Davio and support-LUT algebraic RTL forms against the current frontend BDD seed.

Seed policy: no files were created or updated under `student/seeds`; unknown seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Work dir: `student/work/ex280_frontend_anf_davio_20260608_1438/`
- Results dir: `student/runs/unknown/ex280_frontend_anf_davio_20260608_1438/results/`
- Best AIG replay dir: `student/runs/unknown/ex280_frontend_anf_davio_20260608_1438/best_aigs/`

## Verification

All three candidates were exact and replayed by `evaluate.py`. Best row:

| Case | Candidate | Area | Delay | ADP |
| --- | --- | ---: | ---: | ---: |
| ex280 | `ex280_unknown_algebraic_12x12_anf_davio_interleave` | 1143 | 25 | 28575 |

## Outcome

Exact but worse than the existing `ex280` frontend BDD best (`958/21/20118`) and the archived backend current best (`820/21/17220`). Do not repeat plain ANF/Davio/support-LUT algebraic RTL for `ex280` without a different source decomposition.
