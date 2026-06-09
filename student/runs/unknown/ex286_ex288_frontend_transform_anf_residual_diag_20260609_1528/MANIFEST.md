# ex286-ex288 Transform ANF Residual Diagnostic

- Run id: `ex286_ex288_frontend_transform_anf_residual_diag_20260609_1528`
- Scope: `ex286`, `ex287`, `ex288`
- Work dir: `student/work/ex286_ex288_frontend_transform_anf_residual_diag_20260609_1528/`
- Results dir: `student/runs/unknown/ex286_ex288_frontend_transform_anf_residual_diag_20260609_1528/results/`
- Hypothesis: the functions may have a low-degree algebraic form after a coordinate transform, with only a small residual BDD needed.
- Classification: `semantic/structural diagnostic`

## Method

Tested transforms:

- `raw`
- `pair_key` using exact symmetry-pair canonical OR/AND encoding
- `prefix_natural`
- `suffix_natural`
- `prefix_reverse`
- `prefix_onehot_slot`
- `suffix_onehot_slot`

For each transform, removed ANF terms of degree `1`, `2`, and `3`, then measured the residual BDD node sum across output bits.

## Results

- `ex286`: best residual/raw node ratio was `1.000000`; no low-degree exact bits.
- `ex287`: best residual/raw node ratio was `0.999890`; no low-degree exact bits.
- `ex288`: best residual/raw node ratio was `0.999242`; no low-degree exact bits.

Higher-degree extraction usually increased residual BDD size substantially.

## Conclusion

The tested coordinate transforms do not expose a low-degree ANF plus small residual structure.
No RTL seed was emitted.
