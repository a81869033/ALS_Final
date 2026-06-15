# new_seeds Final Report

Created: `2026-06-14 20:11:01 +0800`; refreshed ex286/ex287 current/candidates at `2026-06-14 23:20:22 +0800`.

## Scope

Refreshed `student/new_seeds/` from currently available verified frontend candidates.
The legacy `student/seeds/` tree was not modified.

## Bundle Counts

| domain | cases | current AIGs | backend candidate AIGs | insufficient cases |
| --- | ---: | ---: | ---: | ---: |
| bf16 | 20 | 20 | 109 | 4 |
| fp16 | 20 | 20 | 114 | 2 |
| float_fp8 | 15 | 15 | 98 | 0 |
| integer | 25 | 25 | 150 | 0 |
| unknown | 20 | 20 | 136 | 0 |
| total | 100 | 100 | 607 | 6 |

## Candidate Shortfalls

| case | selected / target | current ADP | reference ADP | ratio |
| --- | ---: | ---: | ---: | ---: |
| ex201 | 4 / 6 | 23058 | 16300 | 1.414601 |
| ex202 | 4 / 6 | 55648 | 43344 | 1.283869 |
| ex203 | 4 / 6 | 77248 | 56948 | 1.356466 |
| ex213 | 5 / 6 | 3806 | 2900 | 1.312414 |
| ex220 | 5 / 6 | 236588 | 180404 | 1.311434 |
| ex222 | 5 / 6 | 233530 | 173621 | 1.345056 |

## Backend Priority Cases

| rank | domain | case | ratio | gap | candidates |
| ---: | --- | --- | ---: | ---: | ---: |
| 1 | unknown | ex299 | 1.713379 | 723229 | 8 / 8 |
| 2 | unknown | ex297 | 1.854838 | 193108 | 8 / 8 |
| 3 | unknown | ex298 | 1.375631 | 166140 | 6 / 6 |
| 4 | fp16 | ex227 | 1.238622 | 172199 | 6 / 6 |
| 5 | fp16 | ex225 | 1.849258 | 99088 | 6 / 6 |
| 6 | fp16 | ex226 | 1.248459 | 146042 | 6 / 6 |
| 7 | unknown | ex286 | 8.446970 | 17694 | 8 / 8 |
| 8 | unknown | ex294 | 1.652885 | 87072 | 8 / 8 |
| 9 | fp16 | ex223 | 1.665016 | 80167 | 6 / 6 |
| 10 | fp16 | ex222 | 1.345056 | 59909 | 5 / 6 |

Validation details are in `validation_report.md`. The full current-bundle official `evaluate.py` check is recorded in `current_all_evaluate.log`, with parsed QoR rows in `current_all_evaluate_report.csv`.
