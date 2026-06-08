# ex236_ex238_frontend_fp16_core_boundary_allflows_20260608_0942

Run ID: `ex236_ex238_frontend_fp16_core_boundary_allflows_20260608_0942`

Purpose: verify the new cube/reciprocal-cube core-boundary source structure and
check limited Yosys frontend synthesis flows.

Inputs:
- Truth files: `benchmarks/ex236.truth`, `benchmarks/ex238.truth`
- Generator: `student/generators/fp16_ex236_ex238_core_boundary.py`

Artifacts:
- Work directory: `student/work/ex236_ex238_frontend_fp16_core_boundary_allflows_20260608_0942/`
- Candidates CSV: `student/runs/fp16/ex236_ex238_frontend_fp16_core_boundary_allflows_20260608_0942/results/candidates.csv`
- Best CSV: `student/runs/fp16/ex236_ex238_frontend_fp16_core_boundary_allflows_20260608_0942/results/best.csv`

Methods tried:
- Split middle exponent groups into exact exponent-delta plus mantissa formula.
- Encode only the two boundary exponent groups with local mantissa tables.
- Emit zero/inf/NaN regions as direct semantic constants.
- Check `abc_g_aig`, `synth_preset`, and nearby Yosys mapping variants.

Best result:
- `ex236`: `ex236_core_boundary_low14_hi6_abc_g_aig`, `1480/15/22200`
- `ex238`: `ex238_core_boundary_low12_hi6_synth_preset`, `1502/15/22530`

Notes:
- This run found the main new structure for ex236/ex238 after selected-bit
  wrappers and b10/b9 overlay stopped improving.
- Generic non-AIG/default flow variants either reproduced worse delay or lower
  area with worse ADP.
