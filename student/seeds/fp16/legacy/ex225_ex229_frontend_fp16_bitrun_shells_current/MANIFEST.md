# ex225_ex229_frontend_fp16_bitrun_shells_current

Run ID: `ex225_ex229_frontend_fp16_bitrun_shells_current`

Purpose: Curated current-best FP16 seeds from the ex225-ex229 focused pass.

Inputs:
- `ex225`: manual sign/bit14/bit13 plus shared threshold-predecode bit12/9
  log10 source from
  `student/runs/fp16/ex225_frontend_fp16_predecode_correction_20260607_1548/`.
- `ex226`: FP16 sin positive/default exp-mant source from
  `student/runs/fp16/ex220_ex239_semantic_20260604/`.
- `ex227`: FP16 tan positive/default exp-mant source from
  `student/runs/fp16/ex220_ex239_semantic_20260604/`.
- `ex228`: FP16 sinh semantic sign/exp field-default source from
  `student/runs/fp16/ex220_ex239_semantic_20260604/`.
- `ex229`: FP16 tanh semantic positive-field defaults source from
  `student/runs/fp16/ex226_ex229_frontend_fp16_shells_fix_20260607_1128/`.
- Current AIGs: single Yosys synthflow `abc -g aig` re-emission from
  `student/runs/fp16/ex225_ex229_frontend_fp16_current_synthflow_fix_20260607_1223/`
  `student/runs/fp16/ex226_ex228_frontend_fp16_current_synthflow_fix_20260607_1228/`,
  and
  `student/runs/fp16/ex225_frontend_fp16_predecode_all_abcg_20260607_1550/`.

Artifacts:
- Best CSV:
  `student/seeds/fp16/ex225_ex229_frontend_fp16_bitrun_shells_current/results/best.csv`
- Official recheck CSV:
  `student/seeds/fp16/ex225_ex229_frontend_fp16_bitrun_shells_current/results/evaluate_official_best.csv`
- Improvement summary CSV:
  `student/seeds/fp16/ex225_ex229_frontend_fp16_bitrun_shells_current/results/summary.csv`
- Per-case Verilog/AIG directories:
  `student/seeds/fp16/ex225_ex229_frontend_fp16_bitrun_shells_current/ex225/`
  through
  `student/seeds/fp16/ex225_ex229_frontend_fp16_bitrun_shells_current/ex229/`

Best results:
- `ex225`: `ex225_manual15_14_13_predecode12_9_abc_g_aig`,
  `11488/21/241248`, reference ratio `2.067675`.
- `ex226`: `ex226_positive_default_exp_mant_case_abc_g_aig`,
  `33356/22/733832`, reference ratio `1.248459`.
- `ex227`: `ex227_positive_default_exp_mant_case_abc_g_aig`,
  `40629/22/893838`, reference ratio `1.238622`.
- `ex228`: `ex228_semantic_sign_exp_field_defaults_abc_g_aig`,
  `6627/20/132540`, reference ratio `1.309619`.
- `ex229`: `ex229_semantic_positive_field_defaults_abc_g_aig`,
  `3971/19/75449`, reference ratio `1.301563`.

Notes:
- All five current-best AIGs were rechecked with `evaluate.py --case exNNN`
  and are exact equivalent.
- This bundle intentionally records the improvement as `synthflow_exact`: the
  Verilog semantics/source structure did not change for ex226-ex229 in this
  final pass; the improvement came from emitting a shallower initial AIG with
  Yosys `abc -g aig`, not from a backend optimization portfolio.
- `ex225` now keeps a shallow exact correction structure: manual sign, bit14,
  and bit13 predicates plus a shared threshold-predecode network for bits 12
  and 9.  Broader casez/range compression, packed table rewrites, BDD/MTBDD,
  mixed predecode, manual bit12 formulas, threshold fallback, and Yosys
  delay-target neighbors were tested and were worse.
