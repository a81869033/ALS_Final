# ex249_frontend_fp8_e5m2_hypot_threshold_case_20260608_1709

Run ID: `ex249_frontend_fp8_e5m2_hypot_threshold_case_20260608_1709`

Purpose: E5M2FN semantic frontend experiments for ex245-ex249; no seed curation.

Artifacts:
- Work directory: `student/work/ex249_frontend_fp8_e5m2_hypot_threshold_case_20260608_1709`
- Candidates CSV: `student/runs/float_fp8/ex249_frontend_fp8_e5m2_hypot_threshold_case_20260608_1709/results/candidates.csv`
- Best CSV: `student/runs/float_fp8/ex249_frontend_fp8_e5m2_hypot_threshold_case_20260608_1709/results/best.csv`

Semantic identification:
- ex245: E5M2FN add, high byte plus low byte, RNE, canonical 0x7f NaN.
- ex246: E5M2FN multiply, RNE, sign xor, canonical 0x7f NaN.
- ex247: E5M2FN divide low byte by high byte, RNE, divide-by-zero saturation/NaN behavior.
- ex248: E5M2FN fmod low byte by high byte, output sign from low byte.
- ex249: E5M2FN hypot of operand magnitudes, positive sign.

Best result: see `results/best.csv`.
