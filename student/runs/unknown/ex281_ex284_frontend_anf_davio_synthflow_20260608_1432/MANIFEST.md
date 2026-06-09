# ex281-ex284 ANF/Davio Synthflow Run

Run ID: `ex281_ex284_frontend_anf_davio_synthflow_20260608_1432`

Scope: `ex281-ex284` only.

Hypothesis: re-synthesize the exact ANF/Davio interleave sources through limited Yosys `abc -g aig` style synthflow to see whether the low-degree source can recover enough area/delay to beat shared BDDs.

Seed policy: no files were created or updated under `student/seeds`; unknown seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Source run: `student/runs/unknown/ex281_ex284_frontend_anf_davio_20260608_1426/`
- Work dir: `student/work/ex281_ex284_frontend_anf_davio_synthflow_20260608_1432/`
- Results dir: `student/runs/unknown/ex281_ex284_frontend_anf_davio_synthflow_20260608_1432/results/`
- Official replay AIG dir: `student/runs/unknown/ex281_ex284_frontend_anf_davio_synthflow_20260608_1432/official_replay/`

## Verification

The per-case best AIGs were replayed with `evaluate.py --case`:

| Case | Status | Area | Delay | ADP |
| --- | --- | ---: | ---: | ---: |
| ex281 | OK | 1171 | 27 | 31617 |
| ex282 | OK | 1323 | 31 | 41013 |
| ex283 | OK | 1584 | 34 | 53856 |
| ex284 | OK | 1749 | 38 | 66462 |

## Outcome

Limited synthflow reduced area, but delay stayed worse than the shared-BDD synthflow path. None of these rows beat the current `ex281-ex284` bests. Do not repeat basic ANF/Davio synthflow for this group without a new source rewrite.
