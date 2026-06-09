# ex288_frontend_symcof_selector01_synthpreset_20260609_0938

Run ID: `ex288_frontend_symcof_selector01_synthpreset_20260609_0938`

Purpose: Check whether `synth_preset` rescues the ex288 selector `(0,1,2,11)`,
following the ex289 multi-pair selector improvement.

Inputs:
- Seed CSV: `student/runs/unknown/ex288_frontend_symcof_selector01_20260609_0847/results/best.csv`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex288_frontend_symcof_selector01_synthpreset_20260609_0938/`
- Results: `student/runs/unknown/ex288_frontend_symcof_selector01_synthpreset_20260609_0938/results/`

Best result:
- exact `1872/18/33696`

Notes:
- Worse than current `32147`; selector+synth_preset does not transfer to ex288.

