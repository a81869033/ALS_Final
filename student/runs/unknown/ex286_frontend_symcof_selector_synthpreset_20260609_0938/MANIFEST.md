# ex286_frontend_symcof_selector_synthpreset_20260609_0938

Run ID: `ex286_frontend_symcof_selector_synthpreset_20260609_0938`

Purpose: Check whether `synth_preset` rescues the low-node ex286 selector
`(0,1,9,10)`, following the ex289 multi-pair selector improvement.

Inputs:
- Seed CSV: `student/runs/unknown/ex286_frontend_symcof_selector_20260609_0822/results/best.csv`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex286_frontend_symcof_selector_synthpreset_20260609_0938/`
- Results: `student/runs/unknown/ex286_frontend_symcof_selector_synthpreset_20260609_0938/results/`

Best result:
- exact `1425/16/22800`

Notes:
- Worse than current `21705`; selector+synth_preset does not transfer to ex286.

