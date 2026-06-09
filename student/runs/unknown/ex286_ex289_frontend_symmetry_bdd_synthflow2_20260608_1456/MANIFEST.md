# ex286-ex289 Symmetry-BDD Synthflow2 Run

Run ID: `ex286_ex289_frontend_symmetry_bdd_synthflow2_20260608_1456`

Scope: `ex286-ex289` only.

Hypothesis: after `synth_preset` improved the symmetry-BDD source for `ex287-ex289`, a small set of alternative Yosys delay and gate-set variants might reduce delay further, especially for the `ex286` near miss.

Seed policy: no files were created or updated under `student/seeds`; unknown seed curation is deferred until the full `ex280-ex299` class converges.

## Inputs And Outputs

- Source CSV: `student/runs/unknown/ex285_ex289_frontend_symmetry_bdd_20260608_1429/results/best.csv`
- Work dir: `student/work/ex286_ex289_frontend_symmetry_bdd_synthflow2_20260608_1456/`
- Results dir: `student/runs/unknown/ex286_ex289_frontend_symmetry_bdd_synthflow2_20260608_1456/results/`
- Best AIG replay dir: `student/runs/unknown/ex286_ex289_frontend_symmetry_bdd_synthflow2_20260608_1456/best_aigs/`

## Verification

All 28 variants were equivalent and replayed by `evaluate.py`.

## Outcome

- No new current best.
- `abc_d20`, `abc_d21`, and `abc_d22` reproduced the raw symmetry-BDD ADPs.
- `abc_fast`, `abc_g_simple`, `abc_g_and_mux`, and `synth_preset_noabc` were all worse.
- Do not repeat these secondary synthflow variants for the same symmetry-BDD sources.
