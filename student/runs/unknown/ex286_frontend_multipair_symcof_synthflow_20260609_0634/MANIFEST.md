# ex286_frontend_multipair_symcof_synthflow_20260609_0634

- Run ID: `ex286_frontend_multipair_symcof_synthflow_20260609_0634`
- Scope: `ex286`
- Work dir: `student/work/ex286_frontend_multipair_symcof_synthflow_20260609_0634/`
- Results dir: `student/runs/unknown/ex286_frontend_multipair_symcof_synthflow_20260609_0634/results/`
- Purpose: Limited Yosys synthflow on ex286 multi-pair cofactor best. abc_g_aig improved current to 1447/15/21705.

## Results

See `results/candidates.csv`, `results/best.csv`, `results/summary.csv`, and `results/evaluate_check.csv`.

```csv
case,candidate_id,hypothesis/function_guess,variant,verilog_path,aig_path,verified_truth,equivalent,area,delay,adp,reference_adp,adp_ratio_to_reference,within_1p5_reference,beats_reference,classification,notes
ex286,ex286_interleave_f00_k4_abc_g_aig,unknown_symmetry_cofactor_classonehot,abc_g_aig,student/work/ex286_frontend_multipair_symcof_20260609_0623/ex286/verilog/ex286_unknown_symcof_interleave_f00_k4.v,student/work/ex286_frontend_multipair_symcof_synthflow_20260609_0634/ex286/aigs/ex286_interleave_f00_k4_abc_g_aig.aig,1,1,1447,15,21705,2376,9.135101,0,0,synthflow_exact,Yosys abc gate set aig
```

