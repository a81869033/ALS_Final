# ex286_frontend_lane_parity_repair_smoke_20260609_1858

Run ID: `ex286_frontend_lane_parity_repair_smoke_20260609_1858`

Purpose: Test whether the newly discovered mod-4 output lane parity coordinates
can reduce ADP by skipping one current-source output bit per lane and repairing
it from a degree<=4 lane parity ANF.

Inputs:
- Cases: `ex286`
- Current source CSV: `/home/b10507053/ALS_Final_Project/student/results/current_best_by_case.csv`
- Script: `student/generators/unknown_lane_parity_repair.py`

Artifacts:
- Work directory: `student/work/ex286_frontend_lane_parity_repair_smoke_20260609_1858`
- Results directory: `student/runs/unknown/ex286_frontend_lane_parity_repair_smoke_20260609_1858/results`

Methods tried:
- Skip styles: `low,high,middle`
- Base sources are read from current best rows; no seed directories are updated.

Notes:
- `student/seeds` and `output/` are intentionally untouched.
