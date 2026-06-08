# ex243_frontend_fp8_bdd_order_refine_20260608_1253

Run ID: `ex243_frontend_fp8_bdd_order_refine_20260608_1253`

Purpose: refine ex243 fmod shared-BDD variable order around paired high-magnitude operand bits; no seed curation.

Artifacts:
- Work directory: `student/work/ex243_frontend_fp8_bdd_order_refine_20260608_1253`
- Candidates CSV: `student/runs/float_fp8/ex243_frontend_fp8_bdd_order_refine_20260608_1253/results/candidates.csv`
- Best CSV: `student/runs/float_fp8/ex243_frontend_fp8_bdd_order_refine_20260608_1253/results/best.csv`
- Evaluate copy: `student/runs/float_fp8/ex243_frontend_fp8_bdd_order_refine_20260608_1253/results/evaluate_check.csv`

Methods tried:
- Shared-BDD variable orders biased toward paired exponent/significand magnitude bits.
- Best source order: `6:14:5:13:4:12:3:11:2:10:1:9:0:8:7:15`.

Best result: `4047/24/97128`, superseded by synthflow follow-up at `3977/22/87494`.
