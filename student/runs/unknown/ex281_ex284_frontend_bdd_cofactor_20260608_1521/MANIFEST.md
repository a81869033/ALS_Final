# ex281-ex284 Frontend BDD Cofactor Run

Run ID: `ex281_ex284_frontend_bdd_cofactor_20260608_1521`

Scope: `ex281`, `ex282`, `ex283`, `ex284`.

Hypothesis: direct shared-BDD sources have low area but high delay. A
Shannon/cofactor source form with one outer input bit and a shared BDD per
cofactor might reduce the mapped critical path enough to beat the existing
shared-BDD synthflow results.

Seed policy: no files were created or updated under `student/seeds`; unknown
seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Generator: `student/generators/unknown_bdd_cofactor_search.py`
- Work dir: `student/work/ex281_ex284_frontend_bdd_cofactor_20260608_1521/`
- Results dir: `student/runs/unknown/ex281_ex284_frontend_bdd_cofactor_20260608_1521/results/`
- Official replay AIG dir: `student/runs/unknown/ex281_ex284_frontend_bdd_cofactor_20260608_1521/official_replay/`

## Methods

- Tested exact cofactor-BDD RTL variants `low1`, `high1`, and `center1`.
- Each variant fixes one outer input bit, builds one exact shared BDD for each
  cofactor over the remaining input bits, and muxes the cofactor outputs.
- Initial node diagnostics showed outer1 variants were the only plausible
  delay/area tradeoff; wider cofactor partitions inflated total BDD nodes too
  much.
- A first verifier implementation recomputed cofactor tables per input and was
  stopped. The finalized run uses direct BDD evaluation for truth verification.

## Verification

All 12 candidates synthesized and passed ABC equivalence against their
`benchmarks/exNNN.truth` files. The per-run best for each case was replayed
with `evaluate.py` using the run-local `official_replay/` directory.

| Case | Best variant | Status | Area | Delay | ADP | Current best ADP |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| ex281 | `high1` | OK | 1153 | 23 | 26519 | 25476 |
| ex282 | `low1` | OK | 1397 | 24 | 33528 | 31512 |
| ex283 | `high1` | OK | 1624 | 27 | 43848 | 38844 |
| ex284 | `low1` | OK | 1832 | 29 | 53128 | 50083 |

## Outcome

- No new current best.
- `ex281` got slightly lower area than the current shared-BDD synthflow result
  but delay rose from 22 to 23, so ADP lost.
- `ex282-ex284` were exact but worse in ADP; duplicated cofactor BDDs increased
  area without enough delay reduction.
- Do not repeat simple one-bit low/high/center cofactor-BDD for `ex281-ex284`
  unless paired with a materially different source rewrite such as output-root
  grouping or selected-bit replacement.
