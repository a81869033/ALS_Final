# ex288_ex289_frontend_symcof_casemux_20260609_0643

- Run ID: `ex288_ex289_frontend_symcof_casemux_20260609_0643`
- Scope: `ex288, ex289`
- Work dir: `student/work/ex288_ex289_frontend_symcof_casemux_20260609_0643/`
- Results dir: `student/runs/unknown/ex288_ex289_frontend_symcof_casemux_20260609_0643/results/`
- Purpose: Case-mux source style for ex288/ex289 single-pair cofactor. Exact; ex289 reduced area but ADP did not improve current.

## Results

```csv
case,candidate_id,hypothesis,variant,verilog_path,aig_path,area,delay,adp,items,notes
ex288,ex288_unknown_symcof_interleave_f10_k4_case,unknown_symmetry_cofactor_classonehot,interleave_f10_k4_case,student/work/ex288_ex289_frontend_symcof_casemux_20260609_0643/ex288/verilog/ex288_unknown_symcof_interleave_f10_k4_case.v,student/work/ex288_ex289_frontend_symcof_casemux_20260609_0643/ex288/aigs/ex288_unknown_symcof_interleave_f10_k4_case.aig,1905,18,34290,pairs=4:5; order=interleave; policy=f10; mux_style=case; outer_bits=0:14:1:13; inner_bits=2:3:4:5:6:7:8:9:10:11:12; classes=16; group_nodes=290:260:304:291:291:229:313:265:317:290:270:259:302:236:280:225; total_group_nodes=4422; anf_bits=; hash=50824715c9f2,unknown symmetry cofactor class-onehot Verilog seed
ex289,ex289_unknown_symcof_interleave_f00_k4_case,unknown_symmetry_cofactor_classonehot,interleave_f00_k4_case,student/work/ex288_ex289_frontend_symcof_casemux_20260609_0643/ex289/verilog/ex289_unknown_symcof_interleave_f00_k4_case.v,student/work/ex288_ex289_frontend_symcof_casemux_20260609_0643/ex289/aigs/ex289_unknown_symcof_interleave_f00_k4_case.aig,1726,19,32794,pairs=4:5; order=interleave; policy=f00; mux_style=case; outer_bits=0:15:1:14; inner_bits=2:3:4:5:6:7:8:9:10:11:12:13; classes=16; group_nodes=312:311:246:247:311:265:247:232:246:247:277:305:247:232:305:293; total_group_nodes=4323; anf_bits=; hash=95170ce28b24,unknown symmetry cofactor class-onehot Verilog seed
```
