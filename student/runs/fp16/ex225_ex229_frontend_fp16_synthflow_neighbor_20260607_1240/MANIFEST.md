# ex225_ex229_frontend_fp16_synthflow_neighbor_20260607_1240

Stage: frontend Yosys synthflow neighbor check.

Scope:
- `ex225`
- `ex226`
- `ex227`
- `ex228`
- `ex229`

Purpose:
- Check whether neighbors of the useful `abc -g aig` synthflow can beat the
  curated current seeds.
- Variants tested: `abc_g_aig_d18`, `abc_g_aig_d19`, `abc_g_aig_d20`,
  `abc_g_aig_d21`, `abc_g_gates`, `abc_g_cmos2`.
- This is not an ABC/ABC9/MockTurtle/CULS/E-Syn backend portfolio.

Inputs:
- Seed CSV:
  `student/seeds/fp16/ex225_ex229_frontend_fp16_bitrun_shells_current/results/best.csv`
- Work directory:
  `student/work/ex225_ex229_frontend_fp16_synthflow_neighbor_20260607_1240/`

Results:
- Candidates CSV:
  `student/runs/fp16/ex225_ex229_frontend_fp16_synthflow_neighbor_20260607_1240/results/candidates.csv`
- Best CSV:
  `student/runs/fp16/ex225_ex229_frontend_fp16_synthflow_neighbor_20260607_1240/results/best.csv`

Outcome:
- No variant improved over the curated `abc_g_aig` seed bundle.
- `abc_g_aig_d18` through `abc_g_aig_d21` reproduced the same QoR as
  `abc_g_aig` for all five cases.
- `abc_g_gates` and `abc_g_cmos2` were tied only for `ex226` `gates`; otherwise
  they were worse.

Best reproduced values:
- `ex225`: `11499/22/252978`.
- `ex226`: `33356/22/733832`.
- `ex227`: `40629/22/893838`.
- `ex228`: `6627/20/132540`.
- `ex229`: `3971/19/75449`.

Tooling note:
- This run required `student/scripts/yosys_synthflow_from_best_csv.py` to parse
  the top module name from each Verilog source, because seed-bundle candidate
  IDs can name AIG candidates rather than Verilog modules.
