# ex287_ex288_frontend_multipair_symcof_20260609_0624

- Run ID: `ex287_ex288_frontend_multipair_symcof_20260609_0624`
- Scope: `ex287, ex288`
- Work dir: `student/work/ex287_ex288_frontend_multipair_symcof_20260609_0624/`
- Results dir: `student/runs/unknown/ex287_ex288_frontend_multipair_symcof_20260609_0624/results/`
- Purpose: Multi-pair symmetry cofactor class-onehot for ex287/ex288; pairs 4:5,6:7,8:9. New ex287 raw best 1845/15/27675; ex288 did not improve current.

## Results

See `results/candidates.csv`, `results/best.csv`, `results/summary.csv`, and `results/evaluate_check.csv`.

```csv
case,candidate_id,hypothesis,variant,verilog_path,aig_path,area,delay,adp,items,notes
ex287,ex287_unknown_symcof_interleave_f00_k5,unknown_symmetry_cofactor_classonehot,interleave_f00_k5,student/work/ex287_ex288_frontend_multipair_symcof_20260609_0624/ex287/verilog/ex287_unknown_symcof_interleave_f00_k5.v,student/work/ex287_ex288_frontend_multipair_symcof_20260609_0624/ex287/aigs/ex287_unknown_symcof_interleave_f00_k5.aig,1845,15,27675,"pairs=4:5,6:7,8:9; order=interleave; policy=f00; outer_bits=0:13:1:12:2; inner_bits=3:4:5:6:7:8:9:10:11; classes=32; group_nodes=138:138:129:124:162:117:124:96:104:111:104:114:119:106:133:125:133:119:125:113:135:119:119:109:129:114:134:127:110:92:133:117; total_group_nodes=3872; hash=c7f8d1ec4444",unknown symmetry cofactor class-onehot Verilog seed
ex288,ex288_unknown_symcof_interleave_f00_k4,unknown_symmetry_cofactor_classonehot,interleave_f00_k4,student/work/ex287_ex288_frontend_multipair_symcof_20260609_0624/ex288/verilog/ex288_unknown_symcof_interleave_f00_k4.v,student/work/ex287_ex288_frontend_multipair_symcof_20260609_0624/ex288/aigs/ex288_unknown_symcof_interleave_f00_k4.aig,1937,18,34866,"pairs=4:5,6:7,8:9; order=interleave; policy=f00; outer_bits=0:14:1:13; inner_bits=2:3:4:5:6:7:8:9:10:11:12; classes=16; group_nodes=255:230:266:252:253:194:263:217:276:247:231:217:266:204:235:187; total_group_nodes=3793; hash=d49d9016c1c3",unknown symmetry cofactor class-onehot Verilog seed
```

