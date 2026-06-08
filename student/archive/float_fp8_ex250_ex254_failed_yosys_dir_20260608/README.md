# Archived Failed ex250-ex254 Run

Archived on 2026-06-08.

Contents:
- `work_ex250_ex254_frontend_fp4_dot_fma_semantic_20260608_2105/`
- `run_ex250_ex254_frontend_fp4_dot_fma_semantic_20260608_2105/`

Reason: first ex250-ex254 generator run failed because the generator did not
create per-case `aigs/` directories before invoking Yosys.  No candidate in
this run synthesized successfully.  The issue was fixed in
`ex250_ex254_frontend_fp4_dot_fma_semantic_fix_20260608_2110`, which contains
the retained exact semantic pass.
