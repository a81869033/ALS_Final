# ex223_ex224_frontend_fp16_log_caseattrs_20260606_2312

Run ID: `ex223_ex224_frontend_fp16_log_caseattrs_20260606_2312`

Purpose: test whether Verilog `parallel_case/full_case` attributes change Yosys
synthesis for current best table sources.

Artifacts:
- Work directory: `student/work/ex223_ex224_frontend_fp16_log_caseattrs_20260606_2312/`
- Results: `student/runs/fp16/ex223_ex224_frontend_fp16_log_caseattrs_20260606_2312/results/`

Best result:
- Same as baseline: `ex223` `256772` ADP, `ex224` `132972` ADP.

Notes:
- Attributes did not change area, delay, or ADP. Yosys already treats these
  complete case covers effectively.
