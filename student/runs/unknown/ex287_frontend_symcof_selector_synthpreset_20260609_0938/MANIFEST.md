# ex287_frontend_symcof_selector_synthpreset_20260609_0938

Run ID: `ex287_frontend_symcof_selector_synthpreset_20260609_0938`

Purpose: Check whether `synth_preset` rescues the low-node ex287 selector
`(0,1,10,11)`, following the ex289 multi-pair selector improvement.

Inputs:
- Seed CSV: `student/runs/unknown/ex287_frontend_symcof_selector_20260609_0828/results/best.csv`
- Script: `student/scripts/yosys_synthflow_from_best_csv.py`

Artifacts:
- Work directory: `student/work/ex287_frontend_symcof_selector_synthpreset_20260609_0938/`
- Results: `student/runs/unknown/ex287_frontend_symcof_selector_synthpreset_20260609_0938/results/`

Best result:
- exact `1699/18/30582`

Notes:
- Worse than current `27480`; selector+synth_preset does not transfer to ex287.

