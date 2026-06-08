# ex240_ex243_frontend_truth_baseline_20260608_1253

Run ID: `ex240_ex243_frontend_truth_baseline_20260608_1253`

Purpose: direct ABC `read_truth -xf; strash` sanity baseline for ex240-ex243; diagnostic only, no Verilog candidate and no seed curation.

Artifacts:
- Work directory: `student/work/ex240_ex243_frontend_truth_baseline_20260608_1253`
- Direct AIGs: `student/work/ex240_ex243_frontend_truth_baseline_20260608_1253/exNNN/aigs/`

Methods tried:
- ABC direct truth loading with project truth convention.

Observed QoR:
- ex240: `27130/39`
- ex241: `12019/36`
- ex242: `13652/35`
- ex243: `20102/39`

Conclusion: direct truth strashing is exact by construction but far too large; use only as a rejected structural baseline.
