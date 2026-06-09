# ex287_frontend_multipair_symcof_anfbits_20260609_0633

- Run ID: `ex287_frontend_multipair_symcof_anfbits_20260609_0633`
- Scope: `ex287`
- Work dir: `student/work/ex287_frontend_multipair_symcof_anfbits_20260609_0633/`
- Results dir: `student/runs/unknown/ex287_frontend_multipair_symcof_anfbits_20260609_0633/results/`
- Purpose: Low-support output bits emitted as ANF on top of ex287 multi-pair cofactor source. Exact but delay exploded; rejected.

## Results

See `results/candidates.csv`, `results/best.csv`, `results/summary.csv`, and `results/evaluate_check.csv`.

```csv
case,candidate_id,hypothesis,variant,verilog_path,aig_path,area,delay,adp,items,notes
ex287,ex287_unknown_symcof_interleave_f10_k6,unknown_symmetry_cofactor_classonehot,interleave_f10_k6,student/work/ex287_frontend_multipair_symcof_anfbits_20260609_0633/ex287/verilog/ex287_unknown_symcof_interleave_f10_k6.v,student/work/ex287_frontend_multipair_symcof_anfbits_20260609_0633/ex287/aigs/ex287_unknown_symcof_interleave_f10_k6.aig,3373,166,559918,"pairs=4:5,6:7,8:9; order=interleave; policy=f10; outer_bits=0:13:1:12:2:11; inner_bits=3:4:5:6:7:8:9:10; classes=64; group_nodes=104:85:90:69:88:59:89:56:65:85:66:86:64:87:89:119:67:91:69:91:77:91:78:92:93:57:100:57:78:63:129:116:91:91:82:91:129:92:78:75:49:57:44:57:78:47:77:46:88:70:79:69:113:89:89:71:72:85:67:100:64:47:63:46; total_group_nodes=5046; anf_bits=bit6:support=0:1:2:3:4:5:6:7:10:11:12:terms=287; bit7:support=0:1:2:3:4:5:6:7:10:11:12:terms=281; hash=1949fcd14360",unknown symmetry cofactor class-onehot Verilog seed
```

