# ex286_frontend_raw_bdd_abcorder_20260609_1007

Run ID: `ex286_frontend_raw_bdd_abcorder_20260609_1007`

Purpose: Test whether the raw shared-BDD source becomes competitive when using
the variable order observed from a narrow ABC DSD/sifting probe.

Inputs:
- Truth file: `benchmarks/ex286.truth`
- Generator: `student/generators/unknown_bdd_search.py`
- Order: `8:0:9:1:10:11:12:7:2:4:5:6:3`

Artifacts:
- Work directory: `student/work/ex286_frontend_raw_bdd_abcorder_20260609_1007/`
- Results: `student/runs/unknown/ex286_frontend_raw_bdd_abcorder_20260609_1007/results/`

Best result:
- `ex286_unknown_shared_bdd_13x13_order_8_0_9_1_10_11_12_7_2_4_5_6_3`
- Exact equivalent: yes
- Area/delay/ADP: `1938/21/40698`

Notes:
- This is much worse than current ex286 `1447/15/21705`.
- `student/seeds` and `output/` are intentionally untouched.
