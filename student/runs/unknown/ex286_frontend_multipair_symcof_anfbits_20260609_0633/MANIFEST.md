# ex286_frontend_multipair_symcof_anfbits_20260609_0633

- Run ID: `ex286_frontend_multipair_symcof_anfbits_20260609_0633`
- Scope: `ex286`
- Work dir: `student/work/ex286_frontend_multipair_symcof_anfbits_20260609_0633/`
- Results dir: `student/runs/unknown/ex286_frontend_multipair_symcof_anfbits_20260609_0633/results/`
- Purpose: Low-support output bits emitted as ANF on top of ex286 multi-pair cofactor source. Exact but delay exploded; rejected.

## Results

See `results/candidates.csv`, `results/best.csv`, `results/summary.csv`, and `results/evaluate_check.csv`.

```csv
case,candidate_id,hypothesis,variant,verilog_path,aig_path,area,delay,adp,items,notes
ex286,ex286_unknown_symcof_interleave_f10_k5,unknown_symmetry_cofactor_classonehot,interleave_f10_k5,student/work/ex286_frontend_multipair_symcof_anfbits_20260609_0633/ex286/verilog/ex286_unknown_symcof_interleave_f10_k5.v,student/work/ex286_frontend_multipair_symcof_anfbits_20260609_0633/ex286/aigs/ex286_unknown_symcof_interleave_f10_k5.aig,3608,205,739640,"pairs=4:5,6:7; order=interleave; policy=f10; outer_bits=0:12:1:11:2; inner_bits=3:4:5:6:7:8:9:10; classes=32; group_nodes=92:86:100:85:89:73:89:86:72:70:45:69:85:87:73:75:65:90:84:90:91:95:98:113:95:80:83:87:77:81:87:73; total_group_nodes=2665; anf_bits=bit5:support=0:1:2:3:4:5:6:7:9:10:11:terms=337; bit6:support=0:1:2:3:4:5:6:7:9:10:11:terms=287; bit7:support=0:1:2:3:4:5:6:7:9:10:11:terms=281; hash=1e2b2f40f4ac",unknown symmetry cofactor class-onehot Verilog seed
```

