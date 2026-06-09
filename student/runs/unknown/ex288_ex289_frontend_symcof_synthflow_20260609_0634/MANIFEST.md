# ex288_ex289_frontend_symcof_synthflow_20260609_0634

- Run ID: `ex288_ex289_frontend_symcof_synthflow_20260609_0634`
- Scope: `ex288, ex289`
- Work dir: `student/work/ex288_ex289_frontend_symcof_synthflow_20260609_0634/`
- Results dir: `student/runs/unknown/ex288_ex289_frontend_symcof_synthflow_20260609_0634/results/`
- Purpose: Limited Yosys synthflow on ex288/ex289 symmetry cofactor bests. abc_g_aig improved ex288 to 1910/17/32470 and ex289 to 1745/18/31410.

## Results

See `results/candidates.csv`, `results/best.csv`, `results/summary.csv`, and `results/evaluate_check.csv`.

```csv
case,candidate_id,hypothesis/function_guess,variant,verilog_path,aig_path,verified_truth,equivalent,area,delay,adp,reference_adp,adp_ratio_to_reference,within_1p5_reference,beats_reference,classification,notes
ex288,ex288_interleave_f10_k4_abc_g_aig,unknown_symmetry_cofactor_classonehot,abc_g_aig,student/work/ex285_ex289_frontend_symmetry_cofactor_classonehot_20260609_0548/ex288/verilog/ex288_unknown_symcof_interleave_f10_k4.v,student/work/ex288_ex289_frontend_symcof_synthflow_20260609_0634/ex288/aigs/ex288_interleave_f10_k4_abc_g_aig.aig,1,1,1910,17,32470,16394,1.980603,0,0,synthflow_exact,Yosys abc gate set aig
ex289,ex289_interleave_f00_k4_abc_g_aig,unknown_symmetry_cofactor_classonehot,abc_g_aig,student/work/ex285_ex289_frontend_symmetry_cofactor_classonehot_20260609_0548/ex289/verilog/ex289_unknown_symcof_interleave_f00_k4.v,student/work/ex288_ex289_frontend_symcof_synthflow_20260609_0634/ex289/aigs/ex289_interleave_f00_k4_abc_g_aig.aig,1,1,1745,18,31410,13620,2.306167,0,0,synthflow_exact,Yosys abc gate set aig
```

