# ex248_frontend_fp8_e5m2_fmod_periodic_20260608_1646

Run ID: `ex248_frontend_fp8_e5m2_fmod_periodic_20260608_1646`

Purpose: E5M2FN semantic frontend experiments for ex245-ex249; no seed curation.

Artifacts:
- Work directory: `student/work/ex248_frontend_fp8_e5m2_fmod_periodic_20260608_1646`
- Candidates CSV: `student/runs/float_fp8/ex248_frontend_fp8_e5m2_fmod_periodic_20260608_1646/results/candidates.csv`
- Best CSV: `student/runs/float_fp8/ex248_frontend_fp8_e5m2_fmod_periodic_20260608_1646/results/best.csv`

Semantic identification:
- ex245: E5M2FN add, high byte plus low byte, RNE, canonical 0x7f NaN.
- ex246: E5M2FN multiply, RNE, sign xor, canonical 0x7f NaN.
- ex247: E5M2FN divide low byte by high byte, RNE, divide-by-zero saturation/NaN behavior.
- ex248: E5M2FN fmod low byte by high byte, output sign from low byte.
- ex249: E5M2FN hypot of operand magnitudes, positive sign.

Best result: see `results/best.csv`.
