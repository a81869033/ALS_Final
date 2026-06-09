# ex286_frontend_bucket_pla_abc_probe_20260609_1604

Run ID: `ex286_frontend_bucket_pla_abc_probe_20260609_1604`

Purpose: Check whether the exact ex286 bucket-count key table becomes compact when invalid key values are exposed as multi-output PLA don't-cares and minimized directly in ABC.

Inputs:
- Truth file: `benchmarks/ex286.truth`
- Script: `student/generators/unknown_bucket_pla_abc_probe.py`
- ABC: `student/abc`

Artifacts:
- Work directory: `student/work/ex286_frontend_bucket_pla_abc_probe_20260609_1604/`
- Results directory: `student/runs/unknown/ex286_frontend_bucket_pla_abc_probe_20260609_1604/results/`
- Probe CSV: `results/bucket_pla_abc_probe.csv`
- Empty frontend CSVs: `results/candidates.csv`, `results/best.csv`, `results/evaluate_check.csv`

Methods tried:
- Generated compact key-to-output PLA from the exact bucket key (`15` key bits, `4608` valid keys).
- Compared invalid-key don't-care and invalid-zero PLA encodings.
- Ran limited ABC PLA flows: `espresso; strash; dc2`, `espresso; bdd; sop; fx; strash; dc2`, and failed `collapse/fx` variants.

Best result:
- Key-to-output only, not a full ex286 implementation: `4374/15/65610` after `espresso; bdd; sop; fx; strash; dc2`.

Notes:
- Since the key-to-output subnetwork alone is much larger than current ex286 and reference, direct PLA/DC minimization of the compact bucket key is not a large-drop path.
