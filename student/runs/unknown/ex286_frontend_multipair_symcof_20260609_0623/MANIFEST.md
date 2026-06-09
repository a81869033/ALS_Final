# ex286_frontend_multipair_symcof_20260609_0623

- Run ID: `ex286_frontend_multipair_symcof_20260609_0623`
- Scope: `ex286`
- Work dir: `student/work/ex286_frontend_multipair_symcof_20260609_0623/`
- Results dir: `student/runs/unknown/ex286_frontend_multipair_symcof_20260609_0623/results/`
- Purpose: Multi-pair symmetry cofactor class-onehot for ex286; pairs 4:5,6:7. New best before synthflow 1449/16/23184.

## Results

See `results/candidates.csv`, `results/best.csv`, `results/summary.csv`, and `results/evaluate_check.csv`.

```csv
case,candidate_id,hypothesis,variant,verilog_path,aig_path,area,delay,adp,items,notes
ex286,ex286_unknown_symcof_interleave_f00_k4,unknown_symmetry_cofactor_classonehot,interleave_f00_k4,student/work/ex286_frontend_multipair_symcof_20260609_0623/ex286/verilog/ex286_unknown_symcof_interleave_f00_k4.v,student/work/ex286_frontend_multipair_symcof_20260609_0623/ex286/aigs/ex286_unknown_symcof_interleave_f00_k4.aig,1449,16,23184,"pairs=4:5,6:7; order=interleave; policy=f00; outer_bits=0:12:1:11; inner_bits=2:3:4:5:6:7:8:9:10; classes=16; group_nodes=134:147:145:152:150:133:157:153:148:141:123:139:150:143:143:133; total_group_nodes=2291; hash=9fd478cb0a63",unknown symmetry cofactor class-onehot Verilog seed
```

