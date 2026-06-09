# ex285-ex289 Symmetry-BDD Run

Run ID: `ex285_ex289_frontend_symmetry_bdd_20260608_1429`

Scope: `ex285-ex289` only.

Hypothesis: diagnostics showed exact `swap_in_4_5` symmetry for these cases. This run canonicalizes `(in[4], in[5])` into `(in[4] | in[5], in[4] & in[5])`, then builds shared BDD RTL over the canonical key. Invalid key assignments were varied because `(OR,AND) = 2'b01` is unreachable from real inputs.

Seed policy: no files were created or updated under `student/seeds`; unknown seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Generator: `student/generators/unknown_symmetry_bdd.py`
- Work dir: `student/work/ex285_ex289_frontend_symmetry_bdd_20260608_1429/`
- Results dir: `student/runs/unknown/ex285_ex289_frontend_symmetry_bdd_20260608_1429/results/`
- Official replay AIG dir: `student/runs/unknown/ex285_ex289_frontend_symmetry_bdd_20260608_1429/official_replay/`

## Generated Files

- `results/candidates.csv`: all 45 exact/equivalent candidates.
- `results/best.csv`: best candidate per case in this run.
- `results/summary.csv`: comparison against previous unknown current bests.
- `results/evaluate_check.csv`: `evaluate.py --case` replay status for the per-case best AIGs.
- `student/work/ex285_ex289_frontend_symmetry_bdd_20260608_1429/*/verilog/*.v`: generated RTL.
- `student/work/ex285_ex289_frontend_symmetry_bdd_20260608_1429/*/aigs/*.aig`: generated AIGs.

## Verification

Every candidate passed Python truth-model verification before synthesis. The best AIG for each case was replayed with `evaluate.py --case` from `official_replay/`:

| Case | Status | Area | Delay | ADP |
| --- | --- | ---: | ---: | ---: |
| ex285 | OK | 1038 | 17 | 17646 |
| ex286 | OK | 1436 | 18 | 25848 |
| ex287 | OK | 1768 | 19 | 33592 |
| ex288 | OK | 1944 | 20 | 38880 |
| ex289 | OK | 1818 | 21 | 38178 |

## Outcome

- New current best: `ex289_unknown_symbdd_interleave_f00`, `1818/21/38178`, improving the previous `ex289` current ADP `39951` by `1773`.
- Near misses: `ex286` area improved versus current best, but delay rose to 18 and ADP stayed worse (`25848` vs `24180`). `ex287` and `ex288` were close but still worse. `ex285` was worse.
- Exclusion: `sym_first` and `natural` orders were consistently much larger. Do not repeat this pair-canonical BDD family with those orders/policies unless the BDD source is structurally rewritten.
