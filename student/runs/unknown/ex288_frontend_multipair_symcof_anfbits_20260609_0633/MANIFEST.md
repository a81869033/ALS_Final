# ex288_frontend_multipair_symcof_anfbits_20260609_0633

- Run ID: `ex288_frontend_multipair_symcof_anfbits_20260609_0633`
- Scope: `ex288`
- Work dir: `student/work/ex288_frontend_multipair_symcof_anfbits_20260609_0633/`
- Results dir: `student/runs/unknown/ex288_frontend_multipair_symcof_anfbits_20260609_0633/results/`
- Purpose: Low-support output bit emitted as ANF on top of ex288 multi-pair cofactor source. Exact but delay exploded; rejected.

## Results

See `results/candidates.csv`, `results/best.csv`, `results/summary.csv`, and `results/evaluate_check.csv`.

```csv
case,candidate_id,hypothesis,variant,verilog_path,aig_path,area,delay,adp,items,notes
ex288,ex288_unknown_symcof_interleave_f00_k4,unknown_symmetry_cofactor_classonehot,interleave_f00_k4,student/work/ex288_frontend_multipair_symcof_anfbits_20260609_0633/ex288/verilog/ex288_unknown_symcof_interleave_f00_k4.v,student/work/ex288_frontend_multipair_symcof_anfbits_20260609_0633/ex288/aigs/ex288_unknown_symcof_interleave_f00_k4.aig,2636,125,329500,"pairs=4:5,6:7,8:9; order=interleave; policy=f00; outer_bits=0:14:1:13; inner_bits=2:3:4:5:6:7:8:9:10:11:12; classes=16; group_nodes=247:224:258:246:244:188:254:211:267:238:221:208:255:197:224:180; total_group_nodes=3662; anf_bits=bit7:support=0:1:2:3:4:5:6:7:11:12:13:terms=281; hash=3f92393107a6",unknown symmetry cofactor class-onehot Verilog seed
```

