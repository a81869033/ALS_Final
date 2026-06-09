# ex286-ex288 Delta Insertion Diagnostic

- Run id: `ex286_ex288_frontend_delta_insertion_diag_20260609_1510`
- Scope: `ex286`, `ex287`, `ex288`
- Work dir: `student/work/ex286_ex288_frontend_delta_insertion_diag_20260609_1510/`
- Results dir: `student/runs/unknown/ex286_ex288_frontend_delta_insertion_diag_20260609_1510/results/`
- Hypothesis: because these functions exactly preserve Hamming weight, adding one input token might be expressible as a compact token insertion/update recurrence from the previous output state.
- Classification: `semantic diagnostic`

## Method

For every case and every inserted input bit `i`, the diagnostic compared:

- `delta = F(x | (1 << i)) ^ F(x)` for all `x` with bit `i` clear.
- Delta popcount and unique delta-mask counts.
- Whether `delta` is determined by the previous output `F(x)`.
- Whether adding popcount layer or exact bucket-count state removes conflicts.
- Shared BDD node count for the delta function over the remaining `n-1` input bits.

## Results

- `ex286`: best unique-delta insert bit `6` had only `22` delta masks, but the best output-only recurrence still had `266` conflicting output keys. Best delta-BDD node count was `821`.
- `ex287`: best unique-delta insert bit `6` had `26` delta masks, but best output-only recurrence still had `388` conflicts. Best delta-BDD node count was `1103`.
- `ex288`: best unique-delta insert bit `6` had `28` delta masks, but best output-only recurrence still had `1073` conflicts. Best delta-BDD node count was `1351`.
- Exact bucket-count state removes conflicts, but that is the already-known exact bucket-key decomposition and does not by itself provide a compact recurrence.

## Conclusion

The low unique-delta counts on known symmetry-pair bits are real, but output-only or layer-augmented token insertion is not exact and not close enough to emit RTL.
The delta functions are still BDD-heavy, so this does not expose the missing large-drop recurrence for `ex286`-`ex288`.
