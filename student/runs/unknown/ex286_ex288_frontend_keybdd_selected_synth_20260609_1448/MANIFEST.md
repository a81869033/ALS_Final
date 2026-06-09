# ex286-ex288 Frontend Key-BDD Selected-Bit Synth

- Run id: `ex286_ex288_frontend_keybdd_selected_synth_20260609_1448`
- Scope: `ex286`, `ex287`, `ex288`
- Work dir: `student/work/ex286_ex288_frontend_keybdd_selected_synth_20260609_1448/`
- Synthflow work dir: `student/work/ex286_ex288_frontend_keybdd_selected_synthflow_20260609_1450/`
- Results dir: `student/runs/unknown/ex286_ex288_frontend_keybdd_selected_synth_20260609_1448/results/`
- Hypothesis: low-support output bits can bypass the class-onehot cofactor mux through a shared BDD over the canonical symmetry key.
- Classification: `semantic/structural unknown-hybrid`

## Method

Added a narrow `--key-bdd-bits` option to `student/generators/unknown_symmetry_cofactor_search.py`.
The selected bits are removed from the per-class cofactor BDD groups and emitted from one shared BDD over the canonicalized key.

Tested:
- `ex286`: current `interleave_f00_k4`, selected bits `5,6,7`.
- `ex287`: current `interleave_f00_k5`, selected bits `6,7`.
- `ex288`: current low-delay `interleave_f10_k6`, selected bit `7`.

All generated Verilog/AIG rows were exact-equivalent under the project ABC truth check.
Limited synthflow replay used only `abc_g_aig` and `abc_g_aig_d14`.

## Results

- `ex286`: best replay `1453/15/21795`; current remains `1447/15/21705`.
- `ex287`: best replay `1856/15/27840`; current remains `1832/15/27480`.
- `ex288`: new verified best `2257/14/31598`, improving prior `2281/14/31934` by `336` ADP.

## Conclusion

The key-BDD selected-bit source is exact and slightly useful for `ex288`, but it is not the missing large-drop structure.
It reduces BDD source nodes on selected bits, yet synthesis largely preserves the same delay/area tradeoff.
Do not expand this as a broad selected-bit sweep unless a stronger low-support bit cluster or a different mux/source sharing form is found.
