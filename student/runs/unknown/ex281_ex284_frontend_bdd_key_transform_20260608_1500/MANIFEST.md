# ex281-ex284 BDD Key-Transform Run

Run ID: `ex281_ex284_frontend_bdd_key_transform_20260608_1500`

Scope: `ex281-ex284` only.

Hypothesis: low ANF degree and the `ungray` ANF term reduction suggested that BDD size might improve if the BDD is built over a transformed key rather than raw input bits.

Seed policy: no files were created or updated under `student/seeds`; unknown seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Generator: `student/generators/unknown_bdd_transform_search.py`
- Work dir: `student/work/ex281_ex284_frontend_bdd_key_transform_20260608_1500/`
- Results dir: `student/runs/unknown/ex281_ex284_frontend_bdd_key_transform_20260608_1500/results/`
- Best AIG replay dir: `student/runs/unknown/ex281_ex284_frontend_bdd_key_transform_20260608_1500/best_aigs/`

## Verification

All 24 transformed-key BDD candidates were equivalent and replayed by `evaluate.py`.

| Case | Best variant | Area | Delay | ADP | Current best ADP |
| --- | --- | ---: | ---: | ---: | ---: |
| ex281 | `bit_reverse_interleave` | 1351 | 23 | 31073 | 25476 |
| ex282 | `bit_reverse_interleave` | 1592 | 25 | 39800 | 31512 |
| ex283 | `bit_reverse_interleave` | 1847 | 27 | 49869 | 38844 |
| ex284 | `bit_reverse_interleave` | 2103 | 29 | 60987 | 50083 |

## Outcome

No new current best. `bit_reverse_interleave` was the best transformed key for every case, but stayed worse than the existing shared-BDD synthflow bests. `gray` and `ungray` key transforms were much worse due area and/or delay.
