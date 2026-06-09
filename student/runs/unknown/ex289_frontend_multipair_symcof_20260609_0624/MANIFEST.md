# ex289_frontend_multipair_symcof_20260609_0624

- Run ID: `ex289_frontend_multipair_symcof_20260609_0624`
- Scope: `ex289`
- Work dir: `student/work/ex289_frontend_multipair_symcof_20260609_0624/`
- Results dir: `student/runs/unknown/ex289_frontend_multipair_symcof_20260609_0624/results/`
- Purpose: Multi-pair symmetry cofactor class-onehot for ex289; pairs 4:5,6:7,8:9,10:11. Exact but did not beat single-pair current.

## Results

See `results/candidates.csv`, `results/best.csv`, `results/summary.csv`, and `results/evaluate_check.csv`.

```csv
case,candidate_id,hypothesis,variant,verilog_path,aig_path,area,delay,adp,items,notes
ex289,ex289_unknown_symcof_interleave_f00_k3,unknown_symmetry_cofactor_classonehot,interleave_f00_k3,student/work/ex289_frontend_multipair_symcof_20260609_0624/ex289/verilog/ex289_unknown_symcof_interleave_f00_k3.v,student/work/ex289_frontend_multipair_symcof_20260609_0624/ex289/aigs/ex289_unknown_symcof_interleave_f00_k3.aig,1705,20,34100,"pairs=4:5,6:7,8:9,10:11; order=interleave; policy=f00; outer_bits=0:15:1; inner_bits=2:3:4:5:6:7:8:9:10:11:12:13:14; classes=8; group_nodes=376:376:326:360:376:312:360:339; total_group_nodes=2825; hash=9d47c84fbda0",unknown symmetry cofactor class-onehot Verilog seed
```

