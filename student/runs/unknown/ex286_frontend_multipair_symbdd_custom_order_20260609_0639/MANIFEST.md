# ex286_frontend_multipair_symbdd_custom_order_20260609_0639

- Run ID: `ex286_frontend_multipair_symbdd_custom_order_20260609_0639`
- Scope: `ex286`
- Work dir: `student/work/ex286_frontend_multipair_symbdd_custom_order_20260609_0639/`
- Results dir: `student/runs/unknown/ex286_frontend_multipair_symbdd_custom_order_20260609_0639/results/`
- Purpose: Hand-structured custom raw BDD orders for ex286. Exact but no order beat interleave/cofactor; pair-first orders were much worse.

## Results

See `results/candidates.csv`, `results/best.csv`, `results/summary.csv`, and `results/evaluate_check.csv`.

```csv
case,candidate_id,hypothesis,variant,verilog_path,aig_path,area,delay,adp,items,notes
ex286,ex286_unknown_symbdd_bits_0_12_1_11_2_10_3_9_8_4_5_6_7_f10,unknown_symmetry_canonical_bdd,bits_0_12_1_11_2_10_3_9_8_4_5_6_7_f10,student/work/ex286_frontend_multipair_symbdd_custom_order_20260609_0639/ex286/verilog/ex286_unknown_symbdd_bits_0_12_1_11_2_10_3_9_8_4_5_6_7_f10.v,student/work/ex286_frontend_multipair_symbdd_custom_order_20260609_0639/ex286/aigs/ex286_unknown_symbdd_bits_0_12_1_11_2_10_3_9_8_4_5_6_7_f10.aig,1431,18,25758,"pairs=4:5,6:7; order=bits_0_12_1_11_2_10_3_9_8_4_5_6_7; invalid_policy=f10; bdd_nodes=793; hash=e388796c5f72",unknown symmetry-canonical shared-BDD seed
```

